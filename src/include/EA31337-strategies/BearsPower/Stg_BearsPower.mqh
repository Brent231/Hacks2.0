//+------------------------------------------------------------------+
//|                  EA31337 - multi-strategy advanced trading robot |
//|                       Copyright 2016-2019, 31337 Investments Ltd |
//|                                       https://github.com/EA31337 |
//+------------------------------------------------------------------+

/**
 * @file
 * Implements BearsPower strategy.
 */

// Includes.
#include "../../EA31337-classes/Indicators/Indi_BearsPower.mqh"
#include "../../EA31337-classes/Strategy.mqh"

class Stg_BearsPower : public Strategy {

  public:

  void Stg_BearsPower(StgParams &_params, string _name) : Strategy(_params, _name) {}

  static Stg_BearsPower *Init_M1() {
    ChartParams cparams1(PERIOD_M1);
    IndicatorParams bearspower_iparams(10, INDI_BEARS);
    BearsPower_Params bearspower1_iparams(BearsPower_Period, BearsPower_Applied_Price);
    StgParams bearspower1_sparams(new Trade(PERIOD_M1, _Symbol), new Indi_BearsPower(bearspower1_iparams, bearspower_iparams, cparams1), NULL, NULL);
    bearspower1_sparams.SetSignals(BearsPower1_SignalMethod, BearsPower1_OpenCondition1, BearsPower1_OpenCondition2, BearsPower1_CloseCondition, NULL, BearsPower_SignalLevel, NULL);
    bearspower1_sparams.SetStops(BearsPower_TrailingProfitMethod, BearsPower_TrailingStopMethod);
    bearspower1_sparams.SetMaxSpread(BearsPower1_MaxSpread);
    bearspower1_sparams.SetId(BEARSPOWER1);
    return (new Stg_BearsPower(bearspower1_sparams, "BearsPower1"));
  }
  static Stg_BearsPower *Init_M5() {
    ChartParams cparams5(PERIOD_M5);
    IndicatorParams bearspower_iparams(10, INDI_BEARS);
    BearsPower_Params bearspower5_iparams(BearsPower_Period, BearsPower_Applied_Price);
    StgParams bearspower5_sparams(new Trade(PERIOD_M5, _Symbol), new Indi_BearsPower(bearspower5_iparams, bearspower_iparams, cparams5), NULL, NULL);
    bearspower5_sparams.SetSignals(BearsPower5_SignalMethod, BearsPower5_OpenCondition1, BearsPower5_OpenCondition2, BearsPower5_CloseCondition, NULL, BearsPower_SignalLevel, NULL);
    bearspower5_sparams.SetStops(BearsPower_TrailingProfitMethod, BearsPower_TrailingStopMethod);
    bearspower5_sparams.SetMaxSpread(BearsPower5_MaxSpread);
    bearspower5_sparams.SetId(BEARSPOWER5);
    return (new Stg_BearsPower(bearspower5_sparams, "BearsPower5"));
  }
  static Stg_BearsPower *Init_M15() {
    ChartParams cparams15(PERIOD_M15);
    IndicatorParams bearspower_iparams(10, INDI_BEARS);
    BearsPower_Params bearspower15_iparams(BearsPower_Period, BearsPower_Applied_Price);
    StgParams bearspower15_sparams(new Trade(PERIOD_M15, _Symbol), new Indi_BearsPower(bearspower15_iparams, bearspower_iparams, cparams15), NULL, NULL);
    bearspower15_sparams.SetSignals(BearsPower15_SignalMethod, BearsPower15_OpenCondition1, BearsPower15_OpenCondition2, BearsPower15_CloseCondition, NULL, BearsPower_SignalLevel, NULL);
    bearspower15_sparams.SetStops(BearsPower_TrailingProfitMethod, BearsPower_TrailingStopMethod);
    bearspower15_sparams.SetMaxSpread(BearsPower15_MaxSpread);
    bearspower15_sparams.SetId(BEARSPOWER15);
    return (new Stg_BearsPower(bearspower15_sparams, "BearsPower15"));
  }
  static Stg_BearsPower *Init_M30() {
    ChartParams cparams30(PERIOD_M30);
    IndicatorParams bearspower_iparams(10, INDI_BEARS);
    BearsPower_Params bearspower30_iparams(BearsPower_Period, BearsPower_Applied_Price);
    StgParams bearspower30_sparams(new Trade(PERIOD_M30, _Symbol), new Indi_BearsPower(bearspower30_iparams, bearspower_iparams, cparams30), NULL, NULL);
    bearspower30_sparams.SetSignals(BearsPower30_SignalMethod, BearsPower30_OpenCondition1, BearsPower30_OpenCondition2, BearsPower30_CloseCondition, NULL, BearsPower_SignalLevel, NULL);
    bearspower30_sparams.SetStops(BearsPower_TrailingProfitMethod, BearsPower_TrailingStopMethod);
    bearspower30_sparams.SetMaxSpread(BearsPower30_MaxSpread);
    bearspower30_sparams.SetId(BEARSPOWER30);
    return (new Stg_BearsPower(bearspower30_sparams, "BearsPower30"));
  }
  static Stg_BearsPower *Init(ENUM_TIMEFRAMES _tf) {
    switch (_tf) {
      case PERIOD_M1:  return Init_M1();
      case PERIOD_M5:  return Init_M5();
      case PERIOD_M15: return Init_M15();
      case PERIOD_M30: return Init_M30();
      default: return NULL;
    }
  }

  /**
   * Check if BearsPower indicator is on buy or sell.
   *
   * @param
   *   cmd (int) - type of trade order command
   *   period (int) - period to check for
   *   _signal_method (int) - signal method to use by using bitwise AND operation
   *   _signal_level1 (double) - signal level to consider the signal
   */
  bool SignalOpen(ENUM_ORDER_TYPE cmd, long _signal_method = EMPTY, double _signal_level1 = EMPTY, double _signal_level2 = EMPTY) {
    bool _result = false;
    double bears_0 = ((Indi_BearsPower *) this.Data()).GetValue(0);
    double bears_1 = ((Indi_BearsPower *) this.Data()).GetValue(1);
    double bears_2 = ((Indi_BearsPower *) this.Data()).GetValue(2);
    if (_signal_method == EMPTY) _signal_method = GetSignalBaseMethod();
    if (_signal_level1 == EMPTY) _signal_level1 = GetSignalLevel1();
    if (_signal_level2 == EMPTY) _signal_level2 = GetSignalLevel2();
    switch (cmd) {
      case ORDER_TYPE_BUY:
        // @todo
      break;
      case ORDER_TYPE_SELL:
        // @todo
      break;
    }
    _result &= _signal_method <= 0 || Convert::ValueToOp(curr_trend) == cmd;
    return _result;
  }

};
