class Seeder
  attr_reader :athletes, :groups

  def initialize(athletes)
    @athletes = athletes
    @groups = Hash.new { |h, k| h[k] = [] }
    group_by_seed
    shuffle_groups_internally
    combine_groups
  end

  def shuffle_groups_internally
    groups.each do |k, v|
      v.shuffle!
    end
    groups
  end

  def combine_groups
    @athletes = groups
      .sort_by { |k, v| k }
      .inject([]) do |acum, (k, v)|
        acum + v
      end
    @athletes
  end

  def group_by_seed
    athletes.each do |athlete|
      groups[athlete[1]] << athlete
    end
    groups
  end

  def generate_seeds
    raise NotImplementedError
  end
end
