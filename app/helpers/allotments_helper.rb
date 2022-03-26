module AllotmentsHelper
  def get_deallotment_stats(allotment)
    if allotment.dealloted_at.nil?
      "** Currently alloted. **"
    else
      allotment.dealloted_at
    end
  end
end
