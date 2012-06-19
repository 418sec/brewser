require "spec_helper"

describe "Basic spec" do
  
  it "should be able to identifiy json as BrewSON" do
    Brewser.identify('{"test":"json"}').should == BrewSON
  end
  
  it "should be able to identifiy xml as BeerXML" do
    Brewser.identify(read_file('beerxmlv1/recipes.xml')).should == BeerXML
  end
  
  it "should be able to identifiy xml as BeerXML2" do
    Brewser.identify(read_file('beerxmlv2/belgian_white.xml')).should == BeerXML2
  end
  
  it "should be able to identify text as ProMash Txt" do
    Brewser.identify(read_file('promash/PumpkinAle.txt')).should == ProMashTxt
  end
  
  it "should identify as ProMash rec when unknown" do
    Brewser.identify("Some unknown content").should == ProMashRec
  end
  
  context "BeerXML v1" do
    
    it "should extract multiple recipes" do
      recipes = Brewser.parse(read_file('beerxmlv1/recipes.xml'))
      recipes.count.should == 4
      recipes.first.class.should == BeerXML::Recipe
    end
    
    it "should raise an error when encountered" do
      lambda { Brewser.parse(read_file('beerxmlv1/broken.xml')) }.should raise_error
    end
  
  end  
end

