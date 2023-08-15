unit Test.Module1.Service.IMCCalculator;

interface
uses
  DUnitX.TestFramework, Module1.Service.IMCCalculator;

type

  [TestFixture]
  TTestIMCCAlculator = class(TObject)
  private
    FIMCCalculator: TIMCCalculator;
  public
    [Setup]
    procedure Setup;
    [TearDown]
    procedure TearDown;
    // Sample Methods
    // Simple single Test
    [Test]
    [TestCase('TestA','0;1,60;0',';')]
    [TestCase('TestB','80;1,60;31,25',';')]
    [TestCase('TestC','70;1,50;31,11',';')]
    procedure Test1(const AWeigth : Double;const AHeigth : Double;const AResultExpect: Double);
    // Test with TestCase Atribute to supply parameters.
  end;

implementation

procedure TTestIMCCAlculator.Setup;
begin
  FIMCCalculator := TIMCCalculator.Create;
end;

procedure TTestIMCCAlculator.TearDown;
begin
  if Assigned(FIMCCalculator) then
    FIMCCalculator.Free;
end;

procedure TTestIMCCAlculator.Test1(const AWeigth : Double;const AHeigth : Double;const AResultExpect: Double);
 var
   vExpectResult,
   vResult: Double;
begin
  FIMCCalculator.Weight := AWeigth;
  FIMCCalculator.Height := AHeigth;

  vResult := FIMCCalculator.CalculateIMC;
  Assert.IsTrue(vResult = AResultExpect);
end;

initialization
  TDUnitX.RegisterTestFixture(TTestIMCCAlculator);
end.
