class Wukong < ActiveRecord::Base
  attr_accessible :status, :region1, :region2, :region3, :region4, :region5, :region6, :region7, :region8, :region9, :region10,
    :region11, :region12, :region13, :region14, :region15, :region16
  self.table_name = 'wukong'
end
