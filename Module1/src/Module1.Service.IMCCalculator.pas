unit Module1.Service.IMCCalculator;

interface

uses Math;

type
  TIMCCalculator = class
  private
    FWeight: Double;
    FHeight: Double;
  public
    constructor Create();
    property Weight: Double read FWeight write FWeight;
    property Height: Double read FHeight write FHeight;
    function CalculateIMC: Double;
  end;

implementation

{ TIMCCalculator }

constructor TIMCCalculator.Create();
begin
end;

function TIMCCalculator.CalculateIMC: Double;
begin
  if (FHeight > 0) then
    Result := RoundTo(FWeight / (FHeight * FHeight),-2)
  else
    Result := 0;
end;

end.
