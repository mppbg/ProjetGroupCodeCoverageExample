unit Module2.Service.AgeCalculator;

interface

type
  TAgeCalculator = class
  private
    FBirthDate: TDateTime;
  public
    constructor Create(BirthDate: TDateTime);
    function CalculateAge: Integer;
  end;

implementation

uses
  SysUtils,DateUtils;

{ TAgeCalculator }

constructor TAgeCalculator.Create(BirthDate: TDateTime);
begin
  FBirthDate := BirthDate;
end;

function TAgeCalculator.CalculateAge: Integer;
var
  Today: TDateTime;
  Years, Months, Days: Word;
begin
  Today := Now;
  DecodeDate(Today, Years, Months, Days);

  if (Months < MonthOf(FBirthDate)) or
     ((Months = MonthOf(FBirthDate)) and (Days < DayOf(FBirthDate))) then
    Result := Years - YearOf(FBirthDate) - 1
  else
    Result := Years - YearOf(FBirthDate);
end;

end.

