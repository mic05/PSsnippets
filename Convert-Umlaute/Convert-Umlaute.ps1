function Convert-Umlaute
{
  param
  (
    [Parameter(Mandatory)]
    $String
  )
  $output = $String.Replace('ö','oe').Replace('ä','ae').Replace('ü','ue').Replace('ß','ss').Replace('Ö','Oe').Replace('Ü','Ue').Replace('Ä','Ae')
  $isCapitalLetter = $String -ceq $String.toUpper()
  if ($isCapitalLetter) 
  { 
    $output = $output.toUpper() 
  }
  return $output
}