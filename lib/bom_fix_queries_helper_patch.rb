require_dependency 'queries_helper'

module BOMFixQueriesHelperPatch
  def self.included(base)
    base.send(:include, InstanceMethods)

    base.class_eval do
      alias_method_chain :query_to_csv, :fixed_bom
    end
  end

  module InstanceMethods

# adds bom symbols to utf-encoded csv file
    def query_to_csv_with_fixed_bom *args
      ret = query_to_csv_without_fixed_bom *args
      if l(:general_csv_encoding) == 'UTF-8'
      ret = "\xef\xbb\xbf"+ret
      end
      ret
    end

  end
end