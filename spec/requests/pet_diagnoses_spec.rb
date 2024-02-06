require 'rails_helper'

RSpec.describe "PetDiagnoses", type: :request do
  before(:each) do
    @pet = Pet.create!(name: "Socks")
  end

  let(:valid_headers) do
    {}
  end

  describe "GET /index" do
    it "renders a successful response" do
      ["one", "two", "three"].each do |name|
        @pet.diagnoses.build(name: name)
      end
      @pet.save!

      get pet_diagnoses_path(pet_id: @pet.id), headers: valid_headers, as: :json
      expect(response).to be_successful

      response_json = JSON.parse(response.body)
      expect(response_json.length).to be(3)
      expect(response_json).to eq(@pet.diagnoses.as_json)
    end
  end

  describe "POST /create" do
    context "when pet exists" do
      it "adds diagnosis to pet" do
        diagnosis = Diagnosis.create!(name: "FIV")

        post pet_diagnoses_path(pet_id: @pet.id),
             params: { diagnosis_id: diagnosis.id },
             headers: valid_headers, as: :json
        expect(response).to be_successful

        @pet.reload
        expect(@pet.diagnoses.count).to eq(1)
        expect(@pet.diagnoses.first.id).to eq(diagnosis.id)
      end
    end

    context "when pet doesn't exist" do
      it "pet not found" do
        diagnosis = Diagnosis.create!(name: "FIV")
        post pet_diagnoses_path(pet_id: "xyz"), params: { diganosis_id: diagnosis.id },
             headers: valid_headers, as: :json
        expect(response).to be_not_found
      end
    end
  end

  describe "DELETE /destroy" do
    it "removes the diagnosis from the pet" do
      diagnosis = @pet.diagnoses.create!(name: "My Diagnosis")

      delete pet_diagnosis_path(pet_id: @pet.id, id: diagnosis.id),
             headers: valid_headers, as: :json

      @pet.reload
      expect(@pet.diagnoses.count).to eq(0)
    end
  end
end
