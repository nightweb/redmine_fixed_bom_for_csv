Redmine::Plugin.register :redmine_fixed_bom_for_csv do
  name 'Redmine Fixed Bom For Csv plugin'
  author 'Maksim Koritskiy'
  description 'This plugin fix UTF8 encodung for Redmine (add BOM) for MS Excel'
  version '0.0.1'
  url 'https://bitbucket.org/gorkapstroy/redmine_fixed_bom_for_csv'
  author_url 'http://koritskiy.ru/max'
end

Rails.configuration.to_prepare do
  require 'bom_fix_queries_helper_patch'
  QueriesHelper.send(:include, BOMFixQueriesHelperPatch)
end
