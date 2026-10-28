# frozen_string_literal: true

RSpec.describe MiniProgress do
  it "has a version number" do
    expect(MiniProgress::VERSION).to match(/\A\d+\.\d+\.\d+/)
  end

  describe ".load_translations" do
    around do |example|
      load_path = I18n.load_path.dup
      example.run
    ensure
      I18n.load_path = load_path
      I18n.reload!
    end

    it "makes the gem's translations available" do
      expect(I18n.t("mini_progress.eta")).to eq("ETA")
      expect(I18n.t("mini_progress.steps", count: 2, number: "2")).to eq("2 steps")
    end

    it "loads them into a backend that has already loaded its translations" do
      I18n.load_path -= described_class::LOCALE_FILES
      I18n.reload!
      I18n.backend.eager_load!
      expect(I18n.t("mini_progress.eta", default: nil)).to be_nil

      described_class.load_translations

      expect(I18n.t("mini_progress.eta")).to eq("ETA")
    end

    it "adds the locale files to the load path only once" do
      described_class.load_translations

      described_class::LOCALE_FILES.each { |file| expect(I18n.load_path.count(file)).to eq(1) }
    end
  end
end
