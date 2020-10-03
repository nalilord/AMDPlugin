unit adl_defines;

interface

//
//  Copyright (c) 2008 - 2013 Advanced Micro Devices, Inc.

//  THIS CODE AND INFORMATION IS PROVIDED "AS IS" WITHOUT WARRANTY OF ANY KIND,
//  EITHER EXPRESSED OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE IMPLIED
//  WARRANTIES OF MERCHANTABILITY AND/OR FITNESS FOR A PARTICULAR PURPOSE.

/// \file adl_defines.h
/// \brief Contains all definitions exposed by ADL for \ALL platforms.\n <b>Included in ADL SDK</b>
///
/// This file contains all definitions used by ADL.
/// The ADL definitions include the following:
/// \li ADL error codes
/// \li Enumerations for the ADLDisplayInfo structure
/// \li Maximum limits
///

/// \defgroup DEFINES Constants and Definitions
// @{

/// \defgroup define_misc Miscellaneous Constant Definitions
// @{

/// \name General Definitions
// @{

/// Defines ADL_TRUE
const ADL_TRUE = 1;
{$EXTERNALSYM ADL_TRUE}
/// Defines ADL_FALSE
const ADL_FALSE = 0;
{$EXTERNALSYM ADL_FALSE}

/// Defines the maximum string length
const ADL_MAX_CHAR = 4096;
{$EXTERNALSYM ADL_MAX_CHAR}
/// Defines the maximum string length
const ADL_MAX_PATH = 256;
{$EXTERNALSYM ADL_MAX_PATH}
/// Defines the maximum number of supported adapters
const ADL_MAX_ADAPTERS = 250;
{$EXTERNALSYM ADL_MAX_ADAPTERS}
/// Defines the maxumum number of supported displays
const ADL_MAX_DISPLAYS = 150;
{$EXTERNALSYM ADL_MAX_DISPLAYS}
/// Defines the maxumum string length for device name
const ADL_MAX_DEVICENAME = 32;
{$EXTERNALSYM ADL_MAX_DEVICENAME}
/// Defines for all adapters
const ADL_ADAPTER_INDEX_ALL = -1;
{$EXTERNALSYM ADL_ADAPTER_INDEX_ALL}
///	Defines APIs with iOption none
const ADL_MAIN_API_OPTION_NONE = 0;
{$EXTERNALSYM ADL_MAIN_API_OPTION_NONE}
// @}

/// \name Definitions for iOption parameter used by
/// ADL_Display_DDCBlockAccess_Get()
// @{

/// Switch to DDC line 2 before sending the command to the display.
const ADL_DDC_OPTION_SWITCHDDC2 = $00000001;
{$EXTERNALSYM ADL_DDC_OPTION_SWITCHDDC2}
/// Save command in the registry under a unique key, corresponding to parameter \b iCommandIndex
const ADL_DDC_OPTION_RESTORECOMMAND = $00000002;
{$EXTERNALSYM ADL_DDC_OPTION_RESTORECOMMAND}
/// Combine write-read DDC block access command. 
const ADL_DDC_OPTION_COMBOWRITEREAD = $00000010;
{$EXTERNALSYM ADL_DDC_OPTION_COMBOWRITEREAD}
/// Direct DDC access to the immediate device connected to graphics card. 
/// MST with this option set: DDC command is sent to first branch.
/// MST with this option not set: DDC command is sent to the end node sink device.
const ADL_DDC_OPTION_SENDTOIMMEDIATEDEVICE = $00000020;
{$EXTERNALSYM ADL_DDC_OPTION_SENDTOIMMEDIATEDEVICE}
// @}

/// \name Values for
/// ADLI2C.iAction used with ADL_Display_WriteAndReadI2C()
// @{

const ADL_DL_I2C_ACTIONREAD = $00000001;
{$EXTERNALSYM ADL_DL_I2C_ACTIONREAD}
const ADL_DL_I2C_ACTIONWRITE = $00000002;
{$EXTERNALSYM ADL_DL_I2C_ACTIONWRITE}
const ADL_DL_I2C_ACTIONREAD_REPEATEDSTART = $00000003;
{$EXTERNALSYM ADL_DL_I2C_ACTIONREAD_REPEATEDSTART}
// @}


// @}		//Misc

/// \defgroup define_adl_results Result Codes
/// This group of definitions are the various results returned by all ADL functions \n
// @{
/// All OK, but need to wait
const ADL_OK_WAIT = 4;
{$EXTERNALSYM ADL_OK_WAIT}
/// All OK, but need restart
const ADL_OK_RESTART = 3;
{$EXTERNALSYM ADL_OK_RESTART}
/// All OK but need mode change
const ADL_OK_MODE_CHANGE = 2;
{$EXTERNALSYM ADL_OK_MODE_CHANGE}
/// All OK, but with warning
const ADL_OK_WARNING = 1;
{$EXTERNALSYM ADL_OK_WARNING}
/// ADL function completed successfully 
const ADL_OK = 0;
{$EXTERNALSYM ADL_OK}
/// Generic Error. Most likely one or more of the Escape calls to the driver failed!
const ADL_ERR = -1;
{$EXTERNALSYM ADL_ERR}
/// ADL not initialized
const ADL_ERR_NOT_INIT = -2;
{$EXTERNALSYM ADL_ERR_NOT_INIT}
/// One of the parameter passed is invalid
const ADL_ERR_INVALID_PARAM = -3;
{$EXTERNALSYM ADL_ERR_INVALID_PARAM}
/// One of the parameter size is invalid
const ADL_ERR_INVALID_PARAM_SIZE = -4;
{$EXTERNALSYM ADL_ERR_INVALID_PARAM_SIZE}
/// Invalid ADL index passed
const ADL_ERR_INVALID_ADL_IDX = -5;
{$EXTERNALSYM ADL_ERR_INVALID_ADL_IDX}
/// Invalid controller index passed
const ADL_ERR_INVALID_CONTROLLER_IDX = -6;
{$EXTERNALSYM ADL_ERR_INVALID_CONTROLLER_IDX}
/// Invalid display index passed
const ADL_ERR_INVALID_DIPLAY_IDX = -7;
{$EXTERNALSYM ADL_ERR_INVALID_DIPLAY_IDX}
/// Function  not supported by the driver
const ADL_ERR_NOT_SUPPORTED = -8;
{$EXTERNALSYM ADL_ERR_NOT_SUPPORTED}
/// Null Pointer error
const ADL_ERR_NULL_POINTER = -9;
{$EXTERNALSYM ADL_ERR_NULL_POINTER}
/// Call can't be made due to disabled adapter
const ADL_ERR_DISABLED_ADAPTER = -10;
{$EXTERNALSYM ADL_ERR_DISABLED_ADAPTER}
/// Invalid Callback
const ADL_ERR_INVALID_CALLBACK = -11;
{$EXTERNALSYM ADL_ERR_INVALID_CALLBACK}
/// Display Resource conflict
const ADL_ERR_RESOURCE_CONFLICT = -12;
{$EXTERNALSYM ADL_ERR_RESOURCE_CONFLICT}
//Failed to update some of the values. Can be returned by set request that include multiple values if not all values were successfully committed.
const ADL_ERR_SET_INCOMPLETE = -20;
{$EXTERNALSYM ADL_ERR_SET_INCOMPLETE}
/// There's no Linux XDisplay in Linux Console environment
const ADL_ERR_NO_XDISPLAY = -21;
{$EXTERNALSYM ADL_ERR_NO_XDISPLAY}

// @}
/// </A>

/// \defgroup define_display_type Display Type
/// Define Monitor/CRT display type
// @{
/// Define Monitor display type
const ADL_DT_MONITOR = 0;
{$EXTERNALSYM ADL_DT_MONITOR}
/// Define TV display type
const ADL_DT_TELEVISION = 1;
{$EXTERNALSYM ADL_DT_TELEVISION}
/// Define LCD display type
const ADL_DT_LCD_PANEL = 2;
{$EXTERNALSYM ADL_DT_LCD_PANEL}
/// Define DFP display type
const ADL_DT_DIGITAL_FLAT_PANEL = 3;
{$EXTERNALSYM ADL_DT_DIGITAL_FLAT_PANEL}
/// Define Componment Video display type
const ADL_DT_COMPONENT_VIDEO = 4;
{$EXTERNALSYM ADL_DT_COMPONENT_VIDEO}
/// Define Projector display type
const ADL_DT_PROJECTOR = 5;
{$EXTERNALSYM ADL_DT_PROJECTOR}
// @}

/// \defgroup define_display_connection_type Display Connection Type
// @{
/// Define unknown display output type
const ADL_DOT_UNKNOWN = 0;
{$EXTERNALSYM ADL_DOT_UNKNOWN}
/// Define composite display output type
const ADL_DOT_COMPOSITE = 1;
{$EXTERNALSYM ADL_DOT_COMPOSITE}
/// Define SVideo display output type
const ADL_DOT_SVIDEO = 2;
{$EXTERNALSYM ADL_DOT_SVIDEO}
/// Define analog display output type
const ADL_DOT_ANALOG = 3;
{$EXTERNALSYM ADL_DOT_ANALOG}
/// Define digital display output type
const ADL_DOT_DIGITAL = 4;
{$EXTERNALSYM ADL_DOT_DIGITAL}
// @}

/// \defgroup define_color_type Display Color Type and Source
/// Define  Display Color Type and Source
// @{
const ADL_DISPLAY_COLOR_BRIGHTNESS = (1 shl 0);
{$EXTERNALSYM ADL_DISPLAY_COLOR_BRIGHTNESS}
const ADL_DISPLAY_COLOR_CONTRAST = (1 shl 1);
{$EXTERNALSYM ADL_DISPLAY_COLOR_CONTRAST}
const ADL_DISPLAY_COLOR_SATURATION = (1 shl 2);
{$EXTERNALSYM ADL_DISPLAY_COLOR_SATURATION}
const ADL_DISPLAY_COLOR_HUE = (1 shl 3);
{$EXTERNALSYM ADL_DISPLAY_COLOR_HUE}
const ADL_DISPLAY_COLOR_TEMPERATURE = (1 shl 4);
{$EXTERNALSYM ADL_DISPLAY_COLOR_TEMPERATURE}

/// Color Temperature Source is EDID
const ADL_DISPLAY_COLOR_TEMPERATURE_SOURCE_EDID = (1 shl 5);
{$EXTERNALSYM ADL_DISPLAY_COLOR_TEMPERATURE_SOURCE_EDID}
/// Color Temperature Source is User
const ADL_DISPLAY_COLOR_TEMPERATURE_SOURCE_USER = (1 shl 6);
{$EXTERNALSYM ADL_DISPLAY_COLOR_TEMPERATURE_SOURCE_USER}
// @}

/// \defgroup define_adjustment_capabilities Display Adjustment Capabilities
/// Display adjustment capabilities values.  Returned by ADL_Display_AdjustCaps_Get
// @{
const ADL_DISPLAY_ADJUST_OVERSCAN = (1 shl 0);
{$EXTERNALSYM ADL_DISPLAY_ADJUST_OVERSCAN}
const ADL_DISPLAY_ADJUST_VERT_POS = (1 shl 1);
{$EXTERNALSYM ADL_DISPLAY_ADJUST_VERT_POS}
const ADL_DISPLAY_ADJUST_HOR_POS = (1 shl 2);
{$EXTERNALSYM ADL_DISPLAY_ADJUST_HOR_POS}
const ADL_DISPLAY_ADJUST_VERT_SIZE = (1 shl 3);
{$EXTERNALSYM ADL_DISPLAY_ADJUST_VERT_SIZE}
const ADL_DISPLAY_ADJUST_HOR_SIZE = (1 shl 4);
{$EXTERNALSYM ADL_DISPLAY_ADJUST_HOR_SIZE}
const ADL_DISPLAY_ADJUST_SIZEPOS = (ADL_DISPLAY_ADJUST_VERT_POS or ADL_DISPLAY_ADJUST_HOR_POS or ADL_DISPLAY_ADJUST_VERT_SIZE or ADL_DISPLAY_ADJUST_HOR_SIZE);
{$EXTERNALSYM ADL_DISPLAY_ADJUST_SIZEPOS}
const ADL_DISPLAY_CUSTOMMODES = (1 shl 5);
{$EXTERNALSYM ADL_DISPLAY_CUSTOMMODES}
const ADL_DISPLAY_ADJUST_UNDERSCAN = (1 shl 6);
{$EXTERNALSYM ADL_DISPLAY_ADJUST_UNDERSCAN}
// @}


/// \defgroup define_desktop_config Desktop Configuration Flags
/// These flags are used by ADL_DesktopConfig_xxx
/// \deprecated This API has been deprecated because it was only used for RandR 1.1 (Red Hat 5.x) distributions which is now not supported.
// @{
const ADL_DESKTOPCONFIG_UNKNOWN = 0;	(* UNKNOWN desktop config   *)
{$EXTERNALSYM ADL_DESKTOPCONFIG_UNKNOWN}
const ADL_DESKTOPCONFIG_SINGLE = (1 shl  0);	(* Single                   *)
{$EXTERNALSYM ADL_DESKTOPCONFIG_SINGLE}
const ADL_DESKTOPCONFIG_CLONE = (1 shl  2);	(* Clone                    *)
{$EXTERNALSYM ADL_DESKTOPCONFIG_CLONE}
const ADL_DESKTOPCONFIG_BIGDESK_H = (1 shl  4);	(* Big Desktop Horizontal   *)
{$EXTERNALSYM ADL_DESKTOPCONFIG_BIGDESK_H}
const ADL_DESKTOPCONFIG_BIGDESK_V = (1 shl  5);	(* Big Desktop Vertical     *)
{$EXTERNALSYM ADL_DESKTOPCONFIG_BIGDESK_V}
const ADL_DESKTOPCONFIG_BIGDESK_HR = (1 shl  6);	(* Big Desktop Reverse Horz *)
{$EXTERNALSYM ADL_DESKTOPCONFIG_BIGDESK_HR}
const ADL_DESKTOPCONFIG_BIGDESK_VR = (1 shl  7);	(* Big Desktop Reverse Vert *)
{$EXTERNALSYM ADL_DESKTOPCONFIG_BIGDESK_VR}
const ADL_DESKTOPCONFIG_RANDR12 = (1 shl  8);	(* RandR 1.2 Multi-display *)
{$EXTERNALSYM ADL_DESKTOPCONFIG_RANDR12}
// @}

/// needed for ADLDDCInfo structure
const ADL_MAX_DISPLAY_NAME = 256;
{$EXTERNALSYM ADL_MAX_DISPLAY_NAME}

/// \defgroup define_edid_flags Values for ulDDCInfoFlag
/// defines for ulDDCInfoFlag EDID flag
// @{
const ADL_DISPLAYDDCINFOEX_FLAG_PROJECTORDEVICE = (1 shl 0);
{$EXTERNALSYM ADL_DISPLAYDDCINFOEX_FLAG_PROJECTORDEVICE}
const ADL_DISPLAYDDCINFOEX_FLAG_EDIDEXTENSION = (1 shl 1);
{$EXTERNALSYM ADL_DISPLAYDDCINFOEX_FLAG_EDIDEXTENSION}
const ADL_DISPLAYDDCINFOEX_FLAG_DIGITALDEVICE = (1 shl 2);
{$EXTERNALSYM ADL_DISPLAYDDCINFOEX_FLAG_DIGITALDEVICE}
const ADL_DISPLAYDDCINFOEX_FLAG_HDMIAUDIODEVICE = (1 shl 3);
{$EXTERNALSYM ADL_DISPLAYDDCINFOEX_FLAG_HDMIAUDIODEVICE}
const ADL_DISPLAYDDCINFOEX_FLAG_SUPPORTS_AI = (1 shl 4);
{$EXTERNALSYM ADL_DISPLAYDDCINFOEX_FLAG_SUPPORTS_AI}
const ADL_DISPLAYDDCINFOEX_FLAG_SUPPORT_xvYCC601 = (1 shl 5);
{$EXTERNALSYM ADL_DISPLAYDDCINFOEX_FLAG_SUPPORT_xvYCC601}
const ADL_DISPLAYDDCINFOEX_FLAG_SUPPORT_xvYCC709 = (1 shl 6);
{$EXTERNALSYM ADL_DISPLAYDDCINFOEX_FLAG_SUPPORT_xvYCC709}
// @}

/// \defgroup define_displayinfo_connector Display Connector Type
/// defines for ADLDisplayInfo.iDisplayConnector
// @{
const ADL_DISPLAY_CONTYPE_UNKNOWN = 0;
{$EXTERNALSYM ADL_DISPLAY_CONTYPE_UNKNOWN}
const ADL_DISPLAY_CONTYPE_VGA = 1;
{$EXTERNALSYM ADL_DISPLAY_CONTYPE_VGA}
const ADL_DISPLAY_CONTYPE_DVI_D = 2;
{$EXTERNALSYM ADL_DISPLAY_CONTYPE_DVI_D}
const ADL_DISPLAY_CONTYPE_DVI_I = 3;
{$EXTERNALSYM ADL_DISPLAY_CONTYPE_DVI_I}
const ADL_DISPLAY_CONTYPE_ATICVDONGLE_NTSC = 4;
{$EXTERNALSYM ADL_DISPLAY_CONTYPE_ATICVDONGLE_NTSC}
const ADL_DISPLAY_CONTYPE_ATICVDONGLE_JPN = 5;
{$EXTERNALSYM ADL_DISPLAY_CONTYPE_ATICVDONGLE_JPN}
const ADL_DISPLAY_CONTYPE_ATICVDONGLE_NONI2C_JPN = 6;
{$EXTERNALSYM ADL_DISPLAY_CONTYPE_ATICVDONGLE_NONI2C_JPN}
const ADL_DISPLAY_CONTYPE_ATICVDONGLE_NONI2C_NTSC = 7;
{$EXTERNALSYM ADL_DISPLAY_CONTYPE_ATICVDONGLE_NONI2C_NTSC}
const ADL_DISPLAY_CONTYPE_PROPRIETARY = 8;
{$EXTERNALSYM ADL_DISPLAY_CONTYPE_PROPRIETARY}
const ADL_DISPLAY_CONTYPE_HDMI_TYPE_A = 10;
{$EXTERNALSYM ADL_DISPLAY_CONTYPE_HDMI_TYPE_A}
const ADL_DISPLAY_CONTYPE_HDMI_TYPE_B = 11;
{$EXTERNALSYM ADL_DISPLAY_CONTYPE_HDMI_TYPE_B}
const ADL_DISPLAY_CONTYPE_SVIDEO = 12;
{$EXTERNALSYM ADL_DISPLAY_CONTYPE_SVIDEO}
const ADL_DISPLAY_CONTYPE_COMPOSITE = 13;
{$EXTERNALSYM ADL_DISPLAY_CONTYPE_COMPOSITE}
const ADL_DISPLAY_CONTYPE_RCA_3COMPONENT = 14;
{$EXTERNALSYM ADL_DISPLAY_CONTYPE_RCA_3COMPONENT}
const ADL_DISPLAY_CONTYPE_DISPLAYPORT = 15;
{$EXTERNALSYM ADL_DISPLAY_CONTYPE_DISPLAYPORT}
const ADL_DISPLAY_CONTYPE_EDP = 16;
{$EXTERNALSYM ADL_DISPLAY_CONTYPE_EDP}
const ADL_DISPLAY_CONTYPE_WIRELESSDISPLAY = 17;
{$EXTERNALSYM ADL_DISPLAY_CONTYPE_WIRELESSDISPLAY}
// @}

/// TV Capabilities and Standards
/// \defgroup define_tv_caps TV Capabilities and Standards
/// \deprecated Dropping support for TV displays
// @{
const ADL_TV_STANDARDS = (1 shl 0);
{$EXTERNALSYM ADL_TV_STANDARDS}
const ADL_TV_SCART = (1 shl 1);
{$EXTERNALSYM ADL_TV_SCART}

/// TV Standards Definitions
const ADL_STANDARD_NTSC_M = (1 shl 0);
{$EXTERNALSYM ADL_STANDARD_NTSC_M}
const ADL_STANDARD_NTSC_JPN = (1 shl 1);
{$EXTERNALSYM ADL_STANDARD_NTSC_JPN}
const ADL_STANDARD_NTSC_N = (1 shl 2);
{$EXTERNALSYM ADL_STANDARD_NTSC_N}
const ADL_STANDARD_PAL_B = (1 shl 3);
{$EXTERNALSYM ADL_STANDARD_PAL_B}
const ADL_STANDARD_PAL_COMB_N = (1 shl 4);
{$EXTERNALSYM ADL_STANDARD_PAL_COMB_N}
const ADL_STANDARD_PAL_D = (1 shl 5);
{$EXTERNALSYM ADL_STANDARD_PAL_D}
const ADL_STANDARD_PAL_G = (1 shl 6);
{$EXTERNALSYM ADL_STANDARD_PAL_G}
const ADL_STANDARD_PAL_H = (1 shl 7);
{$EXTERNALSYM ADL_STANDARD_PAL_H}
const ADL_STANDARD_PAL_I = (1 shl 8);
{$EXTERNALSYM ADL_STANDARD_PAL_I}
const ADL_STANDARD_PAL_K = (1 shl 9);
{$EXTERNALSYM ADL_STANDARD_PAL_K}
const ADL_STANDARD_PAL_K1 = (1 shl 10);
{$EXTERNALSYM ADL_STANDARD_PAL_K1}
const ADL_STANDARD_PAL_L = (1 shl 11);
{$EXTERNALSYM ADL_STANDARD_PAL_L}
const ADL_STANDARD_PAL_M = (1 shl 12);
{$EXTERNALSYM ADL_STANDARD_PAL_M}
const ADL_STANDARD_PAL_N = (1 shl 13);
{$EXTERNALSYM ADL_STANDARD_PAL_N}
const ADL_STANDARD_PAL_SECAM_D = (1 shl 14);
{$EXTERNALSYM ADL_STANDARD_PAL_SECAM_D}
const ADL_STANDARD_PAL_SECAM_K = (1 shl 15);
{$EXTERNALSYM ADL_STANDARD_PAL_SECAM_K}
const ADL_STANDARD_PAL_SECAM_K1 = (1 shl 16);
{$EXTERNALSYM ADL_STANDARD_PAL_SECAM_K1}
const ADL_STANDARD_PAL_SECAM_L = (1 shl 17);
{$EXTERNALSYM ADL_STANDARD_PAL_SECAM_L}
// @}


/// \defgroup define_video_custom_mode Video Custom Mode flags
/// Component Video Custom Mode flags.  This is used by the iFlags parameter in ADLCustomMode
// @{
const ADL_CUSTOMIZEDMODEFLAG_MODESUPPORTED = (1 shl 0);
{$EXTERNALSYM ADL_CUSTOMIZEDMODEFLAG_MODESUPPORTED}
const ADL_CUSTOMIZEDMODEFLAG_NOTDELETETABLE = (1 shl 1);
{$EXTERNALSYM ADL_CUSTOMIZEDMODEFLAG_NOTDELETETABLE}
const ADL_CUSTOMIZEDMODEFLAG_INSERTBYDRIVER = (1 shl 2);
{$EXTERNALSYM ADL_CUSTOMIZEDMODEFLAG_INSERTBYDRIVER}
const ADL_CUSTOMIZEDMODEFLAG_INTERLACED = (1 shl 3);
{$EXTERNALSYM ADL_CUSTOMIZEDMODEFLAG_INTERLACED}
const ADL_CUSTOMIZEDMODEFLAG_BASEMODE = (1 shl 4);
{$EXTERNALSYM ADL_CUSTOMIZEDMODEFLAG_BASEMODE}
// @}

/// \defgroup define_cv_dongle Values used by ADL_CV_DongleSettings_xxx
/// The following is applicable to ADL_DISPLAY_CONTYPE_ATICVDONGLE_JP and ADL_DISPLAY_CONTYPE_ATICVDONGLE_NONI2C_D only
/// \deprecated Dropping support for Component Video displays
// @{
const ADL_DISPLAY_CV_DONGLE_D1 = (1 shl 0);
{$EXTERNALSYM ADL_DISPLAY_CV_DONGLE_D1}
const ADL_DISPLAY_CV_DONGLE_D2 = (1 shl 1);
{$EXTERNALSYM ADL_DISPLAY_CV_DONGLE_D2}
const ADL_DISPLAY_CV_DONGLE_D3 = (1 shl 2);
{$EXTERNALSYM ADL_DISPLAY_CV_DONGLE_D3}
const ADL_DISPLAY_CV_DONGLE_D4 = (1 shl 3);
{$EXTERNALSYM ADL_DISPLAY_CV_DONGLE_D4}
const ADL_DISPLAY_CV_DONGLE_D5 = (1 shl 4);
{$EXTERNALSYM ADL_DISPLAY_CV_DONGLE_D5}

/// The following is applicable to ADL_DISPLAY_CONTYPE_ATICVDONGLE_NA and ADL_DISPLAY_CONTYPE_ATICVDONGLE_NONI2C only

const ADL_DISPLAY_CV_DONGLE_480I = (1 shl 0);
{$EXTERNALSYM ADL_DISPLAY_CV_DONGLE_480I}
const ADL_DISPLAY_CV_DONGLE_480P = (1 shl 1);
{$EXTERNALSYM ADL_DISPLAY_CV_DONGLE_480P}
const ADL_DISPLAY_CV_DONGLE_540P = (1 shl 2);
{$EXTERNALSYM ADL_DISPLAY_CV_DONGLE_540P}
const ADL_DISPLAY_CV_DONGLE_720P = (1 shl 3);
{$EXTERNALSYM ADL_DISPLAY_CV_DONGLE_720P}
const ADL_DISPLAY_CV_DONGLE_1080I = (1 shl 4);
{$EXTERNALSYM ADL_DISPLAY_CV_DONGLE_1080I}
const ADL_DISPLAY_CV_DONGLE_1080P = (1 shl 5);
{$EXTERNALSYM ADL_DISPLAY_CV_DONGLE_1080P}
const ADL_DISPLAY_CV_DONGLE_16_9 = (1 shl 6);
{$EXTERNALSYM ADL_DISPLAY_CV_DONGLE_16_9}
const ADL_DISPLAY_CV_DONGLE_720P50 = (1 shl 7);
{$EXTERNALSYM ADL_DISPLAY_CV_DONGLE_720P50}
const ADL_DISPLAY_CV_DONGLE_1080I25 = (1 shl 8);
{$EXTERNALSYM ADL_DISPLAY_CV_DONGLE_1080I25}
const ADL_DISPLAY_CV_DONGLE_576I25 = (1 shl 9);
{$EXTERNALSYM ADL_DISPLAY_CV_DONGLE_576I25}
const ADL_DISPLAY_CV_DONGLE_576P50 = (1 shl 10);
{$EXTERNALSYM ADL_DISPLAY_CV_DONGLE_576P50}
const ADL_DISPLAY_CV_DONGLE_1080P24 = (1 shl 11);
{$EXTERNALSYM ADL_DISPLAY_CV_DONGLE_1080P24}
const ADL_DISPLAY_CV_DONGLE_1080P25 = (1 shl 12);
{$EXTERNALSYM ADL_DISPLAY_CV_DONGLE_1080P25}
const ADL_DISPLAY_CV_DONGLE_1080P30 = (1 shl 13);
{$EXTERNALSYM ADL_DISPLAY_CV_DONGLE_1080P30}
const ADL_DISPLAY_CV_DONGLE_1080P50 = (1 shl 14);
{$EXTERNALSYM ADL_DISPLAY_CV_DONGLE_1080P50}
// @}

/// \defgroup define_formats_ovr	Formats Override Settings
/// Display force modes flags
// @{
///
const ADL_DISPLAY_FORMAT_FORCE_720P = $00000001;
{$EXTERNALSYM ADL_DISPLAY_FORMAT_FORCE_720P}
const ADL_DISPLAY_FORMAT_FORCE_1080I = $00000002;
{$EXTERNALSYM ADL_DISPLAY_FORMAT_FORCE_1080I}
const ADL_DISPLAY_FORMAT_FORCE_1080P = $00000004;
{$EXTERNALSYM ADL_DISPLAY_FORMAT_FORCE_1080P}
const ADL_DISPLAY_FORMAT_FORCE_720P50 = $00000008;
{$EXTERNALSYM ADL_DISPLAY_FORMAT_FORCE_720P50}
const ADL_DISPLAY_FORMAT_FORCE_1080I25 = $00000010;
{$EXTERNALSYM ADL_DISPLAY_FORMAT_FORCE_1080I25}
const ADL_DISPLAY_FORMAT_FORCE_576I25 = $00000020;
{$EXTERNALSYM ADL_DISPLAY_FORMAT_FORCE_576I25}
const ADL_DISPLAY_FORMAT_FORCE_576P50 = $00000040;
{$EXTERNALSYM ADL_DISPLAY_FORMAT_FORCE_576P50}
const ADL_DISPLAY_FORMAT_FORCE_1080P24 = $00000080;
{$EXTERNALSYM ADL_DISPLAY_FORMAT_FORCE_1080P24}
const ADL_DISPLAY_FORMAT_FORCE_1080P25 = $00000100;
{$EXTERNALSYM ADL_DISPLAY_FORMAT_FORCE_1080P25}
const ADL_DISPLAY_FORMAT_FORCE_1080P30 = $00000200;
{$EXTERNALSYM ADL_DISPLAY_FORMAT_FORCE_1080P30}
const ADL_DISPLAY_FORMAT_FORCE_1080P50 = $00000400;
{$EXTERNALSYM ADL_DISPLAY_FORMAT_FORCE_1080P50}

///< Below are \b EXTENDED display mode flags

const ADL_DISPLAY_FORMAT_CVDONGLEOVERIDE = $00000001;
{$EXTERNALSYM ADL_DISPLAY_FORMAT_CVDONGLEOVERIDE}
const ADL_DISPLAY_FORMAT_CVMODEUNDERSCAN = $00000002;
{$EXTERNALSYM ADL_DISPLAY_FORMAT_CVMODEUNDERSCAN}
const ADL_DISPLAY_FORMAT_FORCECONNECT_SUPPORTED = $00000004;
{$EXTERNALSYM ADL_DISPLAY_FORMAT_FORCECONNECT_SUPPORTED}
const ADL_DISPLAY_FORMAT_RESTRICT_FORMAT_SELECTION = $00000008;
{$EXTERNALSYM ADL_DISPLAY_FORMAT_RESTRICT_FORMAT_SELECTION}
const ADL_DISPLAY_FORMAT_SETASPECRATIO = $00000010;
{$EXTERNALSYM ADL_DISPLAY_FORMAT_SETASPECRATIO}
const ADL_DISPLAY_FORMAT_FORCEMODES = $00000020;
{$EXTERNALSYM ADL_DISPLAY_FORMAT_FORCEMODES}
const ADL_DISPLAY_FORMAT_LCDRTCCOEFF = $00000040;
{$EXTERNALSYM ADL_DISPLAY_FORMAT_LCDRTCCOEFF}
// @}

/// Defines used by OD5
const ADL_PM_PARAM_DONT_CHANGE = 0;
{$EXTERNALSYM ADL_PM_PARAM_DONT_CHANGE}

/// The following defines Bus types
// @{
const ADL_BUSTYPE_PCI = 0;	(* PCI bus                          *)
{$EXTERNALSYM ADL_BUSTYPE_PCI}
const ADL_BUSTYPE_AGP = 1;	(* AGP bus                          *)
{$EXTERNALSYM ADL_BUSTYPE_AGP}
const ADL_BUSTYPE_PCIE = 2;	(* PCI Express bus                  *)
{$EXTERNALSYM ADL_BUSTYPE_PCIE}
const ADL_BUSTYPE_PCIE_GEN2 = 3;	(* PCI Express 2nd generation bus   *)
{$EXTERNALSYM ADL_BUSTYPE_PCIE_GEN2}
const ADL_BUSTYPE_PCIE_GEN3 = 4;	(* PCI Express 3rd generation bus   *)
{$EXTERNALSYM ADL_BUSTYPE_PCIE_GEN3}
// @}

/// \defgroup define_ws_caps	Workstation Capabilities
/// Workstation values
// @{

/// This value indicates that the workstation card supports active stereo though stereo output connector
const ADL_STEREO_SUPPORTED = (1 shl 2);
{$EXTERNALSYM ADL_STEREO_SUPPORTED}
/// This value indicates that the workstation card supports active stereo via "blue-line"
const ADL_STEREO_BLUE_LINE = (1 shl 3);
{$EXTERNALSYM ADL_STEREO_BLUE_LINE}
/// This value is used to turn off stereo mode.
const ADL_STEREO_OFF = 0;
{$EXTERNALSYM ADL_STEREO_OFF}
/// This value indicates that the workstation card supports active stereo.  This is also used to set the stereo mode to active though the stereo output connector
const ADL_STEREO_ACTIVE = (1 shl 1);
{$EXTERNALSYM ADL_STEREO_ACTIVE}
/// This value indicates that the workstation card supports auto-stereo monitors with horizontal interleave. This is also used to set the stereo mode to use the auto-stereo monitor with horizontal interleave
const ADL_STEREO_AUTO_HORIZONTAL = (1 shl 30);
{$EXTERNALSYM ADL_STEREO_AUTO_HORIZONTAL}
/// This value indicates that the workstation card supports auto-stereo monitors with vertical interleave. This is also used to set the stereo mode to use the auto-stereo monitor with vertical interleave
const ADL_STEREO_AUTO_VERTICAL = (1 shl 31);
{$EXTERNALSYM ADL_STEREO_AUTO_VERTICAL}
/// This value indicates that the workstation card supports passive stereo, ie. non stereo sync
const ADL_STEREO_PASSIVE = (1 shl 6);
{$EXTERNALSYM ADL_STEREO_PASSIVE}
/// This value indicates that the workstation card supports auto-stereo monitors with vertical interleave. This is also used to set the stereo mode to use the auto-stereo monitor with vertical interleave
const ADL_STEREO_PASSIVE_HORIZ = (1 shl 7);
{$EXTERNALSYM ADL_STEREO_PASSIVE_HORIZ}
/// This value indicates that the workstation card supports auto-stereo monitors with vertical interleave. This is also used to set the stereo mode to use the auto-stereo monitor with vertical interleave
const ADL_STEREO_PASSIVE_VERT = (1 shl 8);
{$EXTERNALSYM ADL_STEREO_PASSIVE_VERT}
/// This value indicates that the workstation card supports auto-stereo monitors with Samsung. 
const ADL_STEREO_AUTO_SAMSUNG = (1 shl 11);
{$EXTERNALSYM ADL_STEREO_AUTO_SAMSUNG}
/// This value indicates that the workstation card supports auto-stereo monitors with Tridility. 
const ADL_STEREO_AUTO_TSL = (1 shl 12);
{$EXTERNALSYM ADL_STEREO_AUTO_TSL}
/// This value indicates that the workstation card supports DeepBitDepth (10 bpp) 
const ADL_DEEPBITDEPTH_10BPP_SUPPORTED = (1 shl 5);
{$EXTERNALSYM ADL_DEEPBITDEPTH_10BPP_SUPPORTED}

/// This value indicates that the workstation supports 8-Bit Grayscale
const ADL_8BIT_GREYSCALE_SUPPORTED = (1 shl 9);
{$EXTERNALSYM ADL_8BIT_GREYSCALE_SUPPORTED}
/// This value indicates that the workstation supports CUSTOM TIMING
const ADL_CUSTOM_TIMING_SUPPORTED = (1 shl 10);
{$EXTERNALSYM ADL_CUSTOM_TIMING_SUPPORTED}

/// Load balancing is supported.
const ADL_WORKSTATION_LOADBALANCING_SUPPORTED = $00000001;
{$EXTERNALSYM ADL_WORKSTATION_LOADBALANCING_SUPPORTED}
/// Load balancing is available.
const ADL_WORKSTATION_LOADBALANCING_AVAILABLE = $00000002;
{$EXTERNALSYM ADL_WORKSTATION_LOADBALANCING_AVAILABLE}

/// Load balancing is disabled.
const ADL_WORKSTATION_LOADBALANCING_DISABLED = $00000000;
{$EXTERNALSYM ADL_WORKSTATION_LOADBALANCING_DISABLED}
/// Load balancing is Enabled.
const ADL_WORKSTATION_LOADBALANCING_ENABLED = $00000001;
{$EXTERNALSYM ADL_WORKSTATION_LOADBALANCING_ENABLED}



// @}

/// \defgroup define_adapterspeed speed setting from the adapter
// @{
const ADL_CONTEXT_SPEED_UNFORCED = 0;	(* default asic running speed *)
{$EXTERNALSYM ADL_CONTEXT_SPEED_UNFORCED}
const ADL_CONTEXT_SPEED_FORCEHIGH = 1;	(* asic running speed is forced to high *)
{$EXTERNALSYM ADL_CONTEXT_SPEED_FORCEHIGH}
const ADL_CONTEXT_SPEED_FORCELOW = 2;	(* asic running speed is forced to low *)
{$EXTERNALSYM ADL_CONTEXT_SPEED_FORCELOW}

const ADL_ADAPTER_SPEEDCAPS_SUPPORTED = (1 shl 0);	(* change asic running speed setting is supported *)
{$EXTERNALSYM ADL_ADAPTER_SPEEDCAPS_SUPPORTED}
// @}

/// \defgroup define_glsync Genlock related values
/// GL-Sync port types (unique values)
// @{
/// Unknown port of GL-Sync module
const ADL_GLSYNC_PORT_UNKNOWN = 0;
{$EXTERNALSYM ADL_GLSYNC_PORT_UNKNOWN}
/// BNC port of of GL-Sync module
const ADL_GLSYNC_PORT_BNC = 1;
{$EXTERNALSYM ADL_GLSYNC_PORT_BNC}
/// RJ45(1) port of of GL-Sync module
const ADL_GLSYNC_PORT_RJ45PORT1 = 2;
{$EXTERNALSYM ADL_GLSYNC_PORT_RJ45PORT1}
/// RJ45(2) port of of GL-Sync module
const ADL_GLSYNC_PORT_RJ45PORT2 = 3;
{$EXTERNALSYM ADL_GLSYNC_PORT_RJ45PORT2}

// GL-Sync Genlock settings mask (bit-vector)

/// None of the ADLGLSyncGenlockConfig members are valid
const ADL_GLSYNC_CONFIGMASK_NONE = 0;
{$EXTERNALSYM ADL_GLSYNC_CONFIGMASK_NONE}
/// The ADLGLSyncGenlockConfig.lSignalSource member is valid
const ADL_GLSYNC_CONFIGMASK_SIGNALSOURCE = (1 shl 0);
{$EXTERNALSYM ADL_GLSYNC_CONFIGMASK_SIGNALSOURCE}
/// The ADLGLSyncGenlockConfig.iSyncField member is valid
const ADL_GLSYNC_CONFIGMASK_SYNCFIELD = (1 shl 1);
{$EXTERNALSYM ADL_GLSYNC_CONFIGMASK_SYNCFIELD}
/// The ADLGLSyncGenlockConfig.iSampleRate member is valid
const ADL_GLSYNC_CONFIGMASK_SAMPLERATE = (1 shl 2);
{$EXTERNALSYM ADL_GLSYNC_CONFIGMASK_SAMPLERATE}
/// The ADLGLSyncGenlockConfig.lSyncDelay member is valid
const ADL_GLSYNC_CONFIGMASK_SYNCDELAY = (1 shl 3);
{$EXTERNALSYM ADL_GLSYNC_CONFIGMASK_SYNCDELAY}
/// The ADLGLSyncGenlockConfig.iTriggerEdge member is valid
const ADL_GLSYNC_CONFIGMASK_TRIGGEREDGE = (1 shl 4);
{$EXTERNALSYM ADL_GLSYNC_CONFIGMASK_TRIGGEREDGE}
/// The ADLGLSyncGenlockConfig.iScanRateCoeff member is valid
const ADL_GLSYNC_CONFIGMASK_SCANRATECOEFF = (1 shl 5);
{$EXTERNALSYM ADL_GLSYNC_CONFIGMASK_SCANRATECOEFF}
/// The ADLGLSyncGenlockConfig.lFramelockCntlVector member is valid
const ADL_GLSYNC_CONFIGMASK_FRAMELOCKCNTL = (1 shl 6);
{$EXTERNALSYM ADL_GLSYNC_CONFIGMASK_FRAMELOCKCNTL}


// GL-Sync Framelock control mask (bit-vector)

/// Framelock is disabled
const ADL_GLSYNC_FRAMELOCKCNTL_NONE = 0;
{$EXTERNALSYM ADL_GLSYNC_FRAMELOCKCNTL_NONE}
/// Framelock is enabled
const ADL_GLSYNC_FRAMELOCKCNTL_ENABLE = ( 1 shl 0);
{$EXTERNALSYM ADL_GLSYNC_FRAMELOCKCNTL_ENABLE}

const ADL_GLSYNC_FRAMELOCKCNTL_DISABLE = ( 1 shl 1);
{$EXTERNALSYM ADL_GLSYNC_FRAMELOCKCNTL_DISABLE}
const ADL_GLSYNC_FRAMELOCKCNTL_SWAP_COUNTER_RESET = ( 1 shl 2);
{$EXTERNALSYM ADL_GLSYNC_FRAMELOCKCNTL_SWAP_COUNTER_RESET}
const ADL_GLSYNC_FRAMELOCKCNTL_SWAP_COUNTER_ACK = ( 1 shl 3);
{$EXTERNALSYM ADL_GLSYNC_FRAMELOCKCNTL_SWAP_COUNTER_ACK}
const ADL_GLSYNC_FRAMELOCKCNTL_VERSION_KMD = (1 shl 4);
{$EXTERNALSYM ADL_GLSYNC_FRAMELOCKCNTL_VERSION_KMD}

const ADL_GLSYNC_FRAMELOCKCNTL_STATE_ENABLE = ( 1 shl 0);
{$EXTERNALSYM ADL_GLSYNC_FRAMELOCKCNTL_STATE_ENABLE}
const ADL_GLSYNC_FRAMELOCKCNTL_STATE_KMD = (1 shl 4);
{$EXTERNALSYM ADL_GLSYNC_FRAMELOCKCNTL_STATE_KMD}

// GL-Sync Framelock counters mask (bit-vector)
const ADL_GLSYNC_COUNTER_SWAP = ( 1 shl 0 );
{$EXTERNALSYM ADL_GLSYNC_COUNTER_SWAP}

// GL-Sync Signal Sources (unique values)

/// GL-Sync signal source is undefined
const ADL_GLSYNC_SIGNALSOURCE_UNDEFINED = $00000100;
{$EXTERNALSYM ADL_GLSYNC_SIGNALSOURCE_UNDEFINED}
/// GL-Sync signal source is Free Run
const ADL_GLSYNC_SIGNALSOURCE_FREERUN = $00000101;
{$EXTERNALSYM ADL_GLSYNC_SIGNALSOURCE_FREERUN}
/// GL-Sync signal source is the BNC GL-Sync port
const ADL_GLSYNC_SIGNALSOURCE_BNCPORT = $00000102;
{$EXTERNALSYM ADL_GLSYNC_SIGNALSOURCE_BNCPORT}
/// GL-Sync signal source is the RJ45(1) GL-Sync port
const ADL_GLSYNC_SIGNALSOURCE_RJ45PORT1 = $00000103;
{$EXTERNALSYM ADL_GLSYNC_SIGNALSOURCE_RJ45PORT1}
/// GL-Sync signal source is the RJ45(2) GL-Sync port
const ADL_GLSYNC_SIGNALSOURCE_RJ45PORT2 = $00000104;
{$EXTERNALSYM ADL_GLSYNC_SIGNALSOURCE_RJ45PORT2}


// GL-Sync Signal Types (unique values)

/// GL-Sync signal type is unknown
const ADL_GLSYNC_SIGNALTYPE_UNDEFINED = 0;
{$EXTERNALSYM ADL_GLSYNC_SIGNALTYPE_UNDEFINED}
/// GL-Sync signal type is 480I
const ADL_GLSYNC_SIGNALTYPE_480I = 1;
{$EXTERNALSYM ADL_GLSYNC_SIGNALTYPE_480I}
/// GL-Sync signal type is 576I
const ADL_GLSYNC_SIGNALTYPE_576I = 2;
{$EXTERNALSYM ADL_GLSYNC_SIGNALTYPE_576I}
/// GL-Sync signal type is 480P
const ADL_GLSYNC_SIGNALTYPE_480P = 3;
{$EXTERNALSYM ADL_GLSYNC_SIGNALTYPE_480P}
/// GL-Sync signal type is 576P
const ADL_GLSYNC_SIGNALTYPE_576P = 4;
{$EXTERNALSYM ADL_GLSYNC_SIGNALTYPE_576P}
/// GL-Sync signal type is 720P
const ADL_GLSYNC_SIGNALTYPE_720P = 5;
{$EXTERNALSYM ADL_GLSYNC_SIGNALTYPE_720P}
/// GL-Sync signal type is 1080P
const ADL_GLSYNC_SIGNALTYPE_1080P = 6;
{$EXTERNALSYM ADL_GLSYNC_SIGNALTYPE_1080P}
/// GL-Sync signal type is 1080I
const ADL_GLSYNC_SIGNALTYPE_1080I = 7;
{$EXTERNALSYM ADL_GLSYNC_SIGNALTYPE_1080I}
/// GL-Sync signal type is SDI
const ADL_GLSYNC_SIGNALTYPE_SDI = 8;
{$EXTERNALSYM ADL_GLSYNC_SIGNALTYPE_SDI}
/// GL-Sync signal type is TTL
const ADL_GLSYNC_SIGNALTYPE_TTL = 9;
{$EXTERNALSYM ADL_GLSYNC_SIGNALTYPE_TTL}
/// GL_Sync signal type is Analog
const ADL_GLSYNC_SIGNALTYPE_ANALOG = 10;
{$EXTERNALSYM ADL_GLSYNC_SIGNALTYPE_ANALOG}

// GL-Sync Sync Field options (unique values)

///GL-Sync sync field option is undefined
const ADL_GLSYNC_SYNCFIELD_UNDEFINED = 0;
{$EXTERNALSYM ADL_GLSYNC_SYNCFIELD_UNDEFINED}
///GL-Sync sync field option is Sync to Field 1 (used for Interlaced signal types)
const ADL_GLSYNC_SYNCFIELD_BOTH = 1;
{$EXTERNALSYM ADL_GLSYNC_SYNCFIELD_BOTH}
///GL-Sync sync field option is Sync to Both fields (used for Interlaced signal types)
const ADL_GLSYNC_SYNCFIELD_1 = 2;
{$EXTERNALSYM ADL_GLSYNC_SYNCFIELD_1}


// GL-Sync trigger edge options (unique values)

/// GL-Sync trigger edge is undefined
const ADL_GLSYNC_TRIGGEREDGE_UNDEFINED = 0;
{$EXTERNALSYM ADL_GLSYNC_TRIGGEREDGE_UNDEFINED}
/// GL-Sync trigger edge is the rising edge
const ADL_GLSYNC_TRIGGEREDGE_RISING = 1;
{$EXTERNALSYM ADL_GLSYNC_TRIGGEREDGE_RISING}
/// GL-Sync trigger edge is the falling edge
const ADL_GLSYNC_TRIGGEREDGE_FALLING = 2;
{$EXTERNALSYM ADL_GLSYNC_TRIGGEREDGE_FALLING}
/// GL-Sync trigger edge is both the rising and the falling edge
const ADL_GLSYNC_TRIGGEREDGE_BOTH = 3;
{$EXTERNALSYM ADL_GLSYNC_TRIGGEREDGE_BOTH}


// GL-Sync scan rate coefficient/multiplier options (unique values)

/// GL-Sync scan rate coefficient/multiplier is undefined
const ADL_GLSYNC_SCANRATECOEFF_UNDEFINED = 0;
{$EXTERNALSYM ADL_GLSYNC_SCANRATECOEFF_UNDEFINED}
/// GL-Sync scan rate coefficient/multiplier is 5
const ADL_GLSYNC_SCANRATECOEFF_x5 = 1;
{$EXTERNALSYM ADL_GLSYNC_SCANRATECOEFF_x5}
/// GL-Sync scan rate coefficient/multiplier is 4
const ADL_GLSYNC_SCANRATECOEFF_x4 = 2;
{$EXTERNALSYM ADL_GLSYNC_SCANRATECOEFF_x4}
/// GL-Sync scan rate coefficient/multiplier is 3
const ADL_GLSYNC_SCANRATECOEFF_x3 = 3;
{$EXTERNALSYM ADL_GLSYNC_SCANRATECOEFF_x3}
/// GL-Sync scan rate coefficient/multiplier is 5:2 (SMPTE)
const ADL_GLSYNC_SCANRATECOEFF_x5_DIV_2 = 4;
{$EXTERNALSYM ADL_GLSYNC_SCANRATECOEFF_x5_DIV_2}
/// GL-Sync scan rate coefficient/multiplier is 2
const ADL_GLSYNC_SCANRATECOEFF_x2 = 5;
{$EXTERNALSYM ADL_GLSYNC_SCANRATECOEFF_x2}
/// GL-Sync scan rate coefficient/multiplier is 3 : 2
const ADL_GLSYNC_SCANRATECOEFF_x3_DIV_2 = 6;
{$EXTERNALSYM ADL_GLSYNC_SCANRATECOEFF_x3_DIV_2}
/// GL-Sync scan rate coefficient/multiplier is 5 : 4
const ADL_GLSYNC_SCANRATECOEFF_x5_DIV_4 = 7;
{$EXTERNALSYM ADL_GLSYNC_SCANRATECOEFF_x5_DIV_4}
/// GL-Sync scan rate coefficient/multiplier is 1 (default)
const ADL_GLSYNC_SCANRATECOEFF_x1 = 8;
{$EXTERNALSYM ADL_GLSYNC_SCANRATECOEFF_x1}
/// GL-Sync scan rate coefficient/multiplier is 4 : 5
const ADL_GLSYNC_SCANRATECOEFF_x4_DIV_5 = 9;
{$EXTERNALSYM ADL_GLSYNC_SCANRATECOEFF_x4_DIV_5}
/// GL-Sync scan rate coefficient/multiplier is 2 : 3
const ADL_GLSYNC_SCANRATECOEFF_x2_DIV_3 = 10;
{$EXTERNALSYM ADL_GLSYNC_SCANRATECOEFF_x2_DIV_3}
/// GL-Sync scan rate coefficient/multiplier is 1 : 2
const ADL_GLSYNC_SCANRATECOEFF_x1_DIV_2 = 11;
{$EXTERNALSYM ADL_GLSYNC_SCANRATECOEFF_x1_DIV_2}
/// GL-Sync scan rate coefficient/multiplier is 2 : 5 (SMPTE)
const ADL_GLSYNC_SCANRATECOEFF_x2_DIV_5 = 12;
{$EXTERNALSYM ADL_GLSYNC_SCANRATECOEFF_x2_DIV_5}
/// GL-Sync scan rate coefficient/multiplier is 1 : 3
const ADL_GLSYNC_SCANRATECOEFF_x1_DIV_3 = 13;
{$EXTERNALSYM ADL_GLSYNC_SCANRATECOEFF_x1_DIV_3}
/// GL-Sync scan rate coefficient/multiplier is 1 : 4
const ADL_GLSYNC_SCANRATECOEFF_x1_DIV_4 = 14;
{$EXTERNALSYM ADL_GLSYNC_SCANRATECOEFF_x1_DIV_4}
/// GL-Sync scan rate coefficient/multiplier is 1 : 5
const ADL_GLSYNC_SCANRATECOEFF_x1_DIV_5 = 15;
{$EXTERNALSYM ADL_GLSYNC_SCANRATECOEFF_x1_DIV_5}


// GL-Sync port (signal presence) states (unique values)

/// GL-Sync port state is undefined
const ADL_GLSYNC_PORTSTATE_UNDEFINED = 0;
{$EXTERNALSYM ADL_GLSYNC_PORTSTATE_UNDEFINED}
/// GL-Sync port is not connected
const ADL_GLSYNC_PORTSTATE_NOCABLE = 1;
{$EXTERNALSYM ADL_GLSYNC_PORTSTATE_NOCABLE}
/// GL-Sync port is Idle
const ADL_GLSYNC_PORTSTATE_IDLE = 2;
{$EXTERNALSYM ADL_GLSYNC_PORTSTATE_IDLE}
/// GL-Sync port has an Input signal
const ADL_GLSYNC_PORTSTATE_INPUT = 3;
{$EXTERNALSYM ADL_GLSYNC_PORTSTATE_INPUT}
/// GL-Sync port is Output
const ADL_GLSYNC_PORTSTATE_OUTPUT = 4;
{$EXTERNALSYM ADL_GLSYNC_PORTSTATE_OUTPUT}


// GL-Sync LED types (used index within ADL_Workstation_GLSyncPortState_Get returned ppGlSyncLEDs array) (unique values)

/// Index into the ADL_Workstation_GLSyncPortState_Get returned ppGlSyncLEDs array for the one LED of the BNC port
const ADL_GLSYNC_LEDTYPE_BNC = 0;
{$EXTERNALSYM ADL_GLSYNC_LEDTYPE_BNC}
/// Index into the ADL_Workstation_GLSyncPortState_Get returned ppGlSyncLEDs array for the Left LED of the RJ45(1) or RJ45(2) port
const ADL_GLSYNC_LEDTYPE_RJ45_LEFT = 0;
{$EXTERNALSYM ADL_GLSYNC_LEDTYPE_RJ45_LEFT}
/// Index into the ADL_Workstation_GLSyncPortState_Get returned ppGlSyncLEDs array for the Right LED of the RJ45(1) or RJ45(2) port
const ADL_GLSYNC_LEDTYPE_RJ45_RIGHT = 1;
{$EXTERNALSYM ADL_GLSYNC_LEDTYPE_RJ45_RIGHT}


// GL-Sync LED colors (unique values)

/// GL-Sync LED undefined color
const ADL_GLSYNC_LEDCOLOR_UNDEFINED = 0;
{$EXTERNALSYM ADL_GLSYNC_LEDCOLOR_UNDEFINED}
/// GL-Sync LED is unlit
const ADL_GLSYNC_LEDCOLOR_NOLIGHT = 1;
{$EXTERNALSYM ADL_GLSYNC_LEDCOLOR_NOLIGHT}
/// GL-Sync LED is yellow
const ADL_GLSYNC_LEDCOLOR_YELLOW = 2;
{$EXTERNALSYM ADL_GLSYNC_LEDCOLOR_YELLOW}
/// GL-Sync LED is red
const ADL_GLSYNC_LEDCOLOR_RED = 3;
{$EXTERNALSYM ADL_GLSYNC_LEDCOLOR_RED}
/// GL-Sync LED is green
const ADL_GLSYNC_LEDCOLOR_GREEN = 4;
{$EXTERNALSYM ADL_GLSYNC_LEDCOLOR_GREEN}
/// GL-Sync LED is flashing green
const ADL_GLSYNC_LEDCOLOR_FLASH_GREEN = 5;
{$EXTERNALSYM ADL_GLSYNC_LEDCOLOR_FLASH_GREEN}


// GL-Sync Port Control (refers one GL-Sync Port) (unique values)

/// Used to configure the RJ54(1) or RJ42(2) port of GL-Sync is as Idle
const ADL_GLSYNC_PORTCNTL_NONE = $00000000;
{$EXTERNALSYM ADL_GLSYNC_PORTCNTL_NONE}
/// Used to configure the RJ54(1) or RJ42(2) port of GL-Sync is as Output
const ADL_GLSYNC_PORTCNTL_OUTPUT = $00000001;
{$EXTERNALSYM ADL_GLSYNC_PORTCNTL_OUTPUT}


// GL-Sync Mode Control (refers one Display/Controller) (bitfields)

/// Used to configure the display to use internal timing (not genlocked)
const ADL_GLSYNC_MODECNTL_NONE = $00000000;
{$EXTERNALSYM ADL_GLSYNC_MODECNTL_NONE}
/// Bitfield used to configure the display as genlocked (either as Timing Client or as Timing Server)
const ADL_GLSYNC_MODECNTL_GENLOCK = $00000001;
{$EXTERNALSYM ADL_GLSYNC_MODECNTL_GENLOCK}
/// Bitfield used to configure the display as Timing Server
const ADL_GLSYNC_MODECNTL_TIMINGSERVER = $00000002;
{$EXTERNALSYM ADL_GLSYNC_MODECNTL_TIMINGSERVER}

// GL-Sync Mode Status
/// Display is currently not genlocked
const ADL_GLSYNC_MODECNTL_STATUS_NONE = $00000000;
{$EXTERNALSYM ADL_GLSYNC_MODECNTL_STATUS_NONE}
/// Display is currently genlocked
const ADL_GLSYNC_MODECNTL_STATUS_GENLOCK = $00000001;
{$EXTERNALSYM ADL_GLSYNC_MODECNTL_STATUS_GENLOCK}
/// Display requires a mode switch
const ADL_GLSYNC_MODECNTL_STATUS_SETMODE_REQUIRED = $00000002;
{$EXTERNALSYM ADL_GLSYNC_MODECNTL_STATUS_SETMODE_REQUIRED}
/// Display is capable of being genlocked
const ADL_GLSYNC_MODECNTL_STATUS_GENLOCK_ALLOWED = $00000004;
{$EXTERNALSYM ADL_GLSYNC_MODECNTL_STATUS_GENLOCK_ALLOWED}

const ADL_MAX_GLSYNC_PORTS = 8;
{$EXTERNALSYM ADL_MAX_GLSYNC_PORTS}
const ADL_MAX_GLSYNC_PORT_LEDS = 8;
{$EXTERNALSYM ADL_MAX_GLSYNC_PORT_LEDS}

// @}

/// \defgroup define_crossfirestate CrossfireX state of a particular adapter CrossfireX combination
// @{
const ADL_XFIREX_STATE_NOINTERCONNECT = ( 1 shl 0 );	(* Dongle / cable is missing *)
{$EXTERNALSYM ADL_XFIREX_STATE_NOINTERCONNECT}
const ADL_XFIREX_STATE_DOWNGRADEPIPES = ( 1 shl 1 );	(* CrossfireX can be enabled if pipes are downgraded *)
{$EXTERNALSYM ADL_XFIREX_STATE_DOWNGRADEPIPES}
const ADL_XFIREX_STATE_DOWNGRADEMEM = ( 1 shl 2 );	(* CrossfireX cannot be enabled unless mem downgraded *)
{$EXTERNALSYM ADL_XFIREX_STATE_DOWNGRADEMEM}
const ADL_XFIREX_STATE_REVERSERECOMMENDED = ( 1 shl 3 );	(* Card reversal recommended, CrossfireX cannot be enabled. *)
{$EXTERNALSYM ADL_XFIREX_STATE_REVERSERECOMMENDED}
const ADL_XFIREX_STATE_3DACTIVE = ( 1 shl 4 );	(* 3D client is active - CrossfireX cannot be safely enabled *)
{$EXTERNALSYM ADL_XFIREX_STATE_3DACTIVE}
const ADL_XFIREX_STATE_MASTERONSLAVE = ( 1 shl 5 );	(* Dongle is OK but master is on slave *)
{$EXTERNALSYM ADL_XFIREX_STATE_MASTERONSLAVE}
const ADL_XFIREX_STATE_NODISPLAYCONNECT = ( 1 shl 6 );	(* No (valid) display connected to master card. *)
{$EXTERNALSYM ADL_XFIREX_STATE_NODISPLAYCONNECT}
const ADL_XFIREX_STATE_NOPRIMARYVIEW = ( 1 shl 7 );	(* CrossfireX is enabled but master is not current primary device *)
{$EXTERNALSYM ADL_XFIREX_STATE_NOPRIMARYVIEW}
const ADL_XFIREX_STATE_DOWNGRADEVISMEM = ( 1 shl 8 );	(* CrossfireX cannot be enabled unless visible mem downgraded *)
{$EXTERNALSYM ADL_XFIREX_STATE_DOWNGRADEVISMEM}
const ADL_XFIREX_STATE_LESSTHAN8LANE_MASTER = ( 1 shl 9 );	(* CrossfireX can be enabled however performance not optimal due to <8 lanes *)
{$EXTERNALSYM ADL_XFIREX_STATE_LESSTHAN8LANE_MASTER}
const ADL_XFIREX_STATE_LESSTHAN8LANE_SLAVE = ( 1 shl 10 );	(* CrossfireX can be enabled however performance not optimal due to <8 lanes *)
{$EXTERNALSYM ADL_XFIREX_STATE_LESSTHAN8LANE_SLAVE}
const ADL_XFIREX_STATE_PEERTOPEERFAILED = ( 1 shl 11 );	(* CrossfireX cannot be enabled due to failed peer to peer test *)
{$EXTERNALSYM ADL_XFIREX_STATE_PEERTOPEERFAILED}
const ADL_XFIREX_STATE_MEMISDOWNGRADED = ( 1 shl 16 );	(* Notification that memory is currently downgraded *)
{$EXTERNALSYM ADL_XFIREX_STATE_MEMISDOWNGRADED}
const ADL_XFIREX_STATE_PIPESDOWNGRADED = ( 1 shl 17 );	(* Notification that pipes are currently downgraded *)
{$EXTERNALSYM ADL_XFIREX_STATE_PIPESDOWNGRADED}
const ADL_XFIREX_STATE_XFIREXACTIVE = ( 1 shl 18 );	(* CrossfireX is enabled on current device *)
{$EXTERNALSYM ADL_XFIREX_STATE_XFIREXACTIVE}
const ADL_XFIREX_STATE_VISMEMISDOWNGRADED = ( 1 shl 19 );	(* Notification that visible FB memory is currently downgraded *)
{$EXTERNALSYM ADL_XFIREX_STATE_VISMEMISDOWNGRADED}
const ADL_XFIREX_STATE_INVALIDINTERCONNECTION = ( 1 shl 20 );	(* Cannot support current inter-connection configuration *)
{$EXTERNALSYM ADL_XFIREX_STATE_INVALIDINTERCONNECTION}
const ADL_XFIREX_STATE_NONP2PMODE = ( 1 shl 21 );	(* CrossfireX will only work with clients supporting non P2P mode *)
{$EXTERNALSYM ADL_XFIREX_STATE_NONP2PMODE}
const ADL_XFIREX_STATE_DOWNGRADEMEMBANKS = ( 1 shl 22 );	(* CrossfireX cannot be enabled unless memory banks downgraded *)
{$EXTERNALSYM ADL_XFIREX_STATE_DOWNGRADEMEMBANKS}
const ADL_XFIREX_STATE_MEMBANKSDOWNGRADED = ( 1 shl 23 );	(* Notification that memory banks are currently downgraded *)
{$EXTERNALSYM ADL_XFIREX_STATE_MEMBANKSDOWNGRADED}
const ADL_XFIREX_STATE_DUALDISPLAYSALLOWED = ( 1 shl 24 );	(* Extended desktop or clone mode is allowed. *)
{$EXTERNALSYM ADL_XFIREX_STATE_DUALDISPLAYSALLOWED}
const ADL_XFIREX_STATE_P2P_APERTURE_MAPPING = ( 1 shl 25 );	(* P2P mapping was through peer aperture *)
{$EXTERNALSYM ADL_XFIREX_STATE_P2P_APERTURE_MAPPING}
const ADL_XFIREX_STATE_P2PFLUSH_REQUIRED = ADL_XFIREX_STATE_P2P_APERTURE_MAPPING;	(* For back compatible *)
{$EXTERNALSYM ADL_XFIREX_STATE_P2PFLUSH_REQUIRED}
const ADL_XFIREX_STATE_XSP_CONNECTED = ( 1 shl 26 );	(* There is CrossfireX side port connection between GPUs *)
{$EXTERNALSYM ADL_XFIREX_STATE_XSP_CONNECTED}
const ADL_XFIREX_STATE_ENABLE_CF_REBOOT_REQUIRED = ( 1 shl 27 );	(* System needs a reboot bofore enable CrossfireX *)
{$EXTERNALSYM ADL_XFIREX_STATE_ENABLE_CF_REBOOT_REQUIRED}
const ADL_XFIREX_STATE_DISABLE_CF_REBOOT_REQUIRED = ( 1 shl 28 );	(* System needs a reboot after disable CrossfireX *)
{$EXTERNALSYM ADL_XFIREX_STATE_DISABLE_CF_REBOOT_REQUIRED}
const ADL_XFIREX_STATE_DRV_HANDLE_DOWNGRADE_KEY = ( 1 shl 29 );	(* Indicate base driver handles the downgrade key updating *)
{$EXTERNALSYM ADL_XFIREX_STATE_DRV_HANDLE_DOWNGRADE_KEY}
const ADL_XFIREX_STATE_CF_RECONFIG_REQUIRED = ( 1 shl 30 );	(* CrossfireX need to be reconfigured by CCC because of a LDA chain broken *)
{$EXTERNALSYM ADL_XFIREX_STATE_CF_RECONFIG_REQUIRED}
const ADL_XFIREX_STATE_ERRORGETTINGSTATUS = ( 1 shl 31 );	(* Could not obtain current status *)
{$EXTERNALSYM ADL_XFIREX_STATE_ERRORGETTINGSTATUS}
// @}

///////////////////////////////////////////////////////////////////////////
// ADL_DISPLAY_ADJUSTMENT_PIXELFORMAT adjustment values
// (bit-vector)
///////////////////////////////////////////////////////////////////////////
/// \defgroup define_pixel_formats Pixel Formats values
/// This group defines the various Pixel Formats that a particular digital display can support. \n
/// Since a display can support multiple formats, these values can be bit-or'ed to indicate the various formats \n
// @{
const ADL_DISPLAY_PIXELFORMAT_UNKNOWN = 0;
{$EXTERNALSYM ADL_DISPLAY_PIXELFORMAT_UNKNOWN}
const ADL_DISPLAY_PIXELFORMAT_RGB = (1 shl 0);
{$EXTERNALSYM ADL_DISPLAY_PIXELFORMAT_RGB}
const ADL_DISPLAY_PIXELFORMAT_YCRCB444 = (1 shl 1);	//Limited range
{$EXTERNALSYM ADL_DISPLAY_PIXELFORMAT_YCRCB444}
const ADL_DISPLAY_PIXELFORMAT_YCRCB422 = (1 shl 2);	//Limited range
{$EXTERNALSYM ADL_DISPLAY_PIXELFORMAT_YCRCB422}
const ADL_DISPLAY_PIXELFORMAT_RGB_LIMITED_RANGE = (1 shl 3);
{$EXTERNALSYM ADL_DISPLAY_PIXELFORMAT_RGB_LIMITED_RANGE}
const ADL_DISPLAY_PIXELFORMAT_RGB_FULL_RANGE = ADL_DISPLAY_PIXELFORMAT_RGB;	//Full range
{$EXTERNALSYM ADL_DISPLAY_PIXELFORMAT_RGB_FULL_RANGE}
// @}

/// \defgroup define_contype Connector Type Values
/// ADLDisplayConfig.ulConnectorType defines
// @{
const ADL_DL_DISPLAYCONFIG_CONTYPE_UNKNOWN = 0;
{$EXTERNALSYM ADL_DL_DISPLAYCONFIG_CONTYPE_UNKNOWN}
const ADL_DL_DISPLAYCONFIG_CONTYPE_CV_NONI2C_JP = 1;
{$EXTERNALSYM ADL_DL_DISPLAYCONFIG_CONTYPE_CV_NONI2C_JP}
const ADL_DL_DISPLAYCONFIG_CONTYPE_CV_JPN = 2;
{$EXTERNALSYM ADL_DL_DISPLAYCONFIG_CONTYPE_CV_JPN}
const ADL_DL_DISPLAYCONFIG_CONTYPE_CV_NA = 3;
{$EXTERNALSYM ADL_DL_DISPLAYCONFIG_CONTYPE_CV_NA}
const ADL_DL_DISPLAYCONFIG_CONTYPE_CV_NONI2C_NA = 4;
{$EXTERNALSYM ADL_DL_DISPLAYCONFIG_CONTYPE_CV_NONI2C_NA}
const ADL_DL_DISPLAYCONFIG_CONTYPE_VGA = 5;
{$EXTERNALSYM ADL_DL_DISPLAYCONFIG_CONTYPE_VGA}
const ADL_DL_DISPLAYCONFIG_CONTYPE_DVI_D = 6;
{$EXTERNALSYM ADL_DL_DISPLAYCONFIG_CONTYPE_DVI_D}
const ADL_DL_DISPLAYCONFIG_CONTYPE_DVI_I = 7;
{$EXTERNALSYM ADL_DL_DISPLAYCONFIG_CONTYPE_DVI_I}
const ADL_DL_DISPLAYCONFIG_CONTYPE_HDMI_TYPE_A = 8;
{$EXTERNALSYM ADL_DL_DISPLAYCONFIG_CONTYPE_HDMI_TYPE_A}
const ADL_DL_DISPLAYCONFIG_CONTYPE_HDMI_TYPE_B = 9;
{$EXTERNALSYM ADL_DL_DISPLAYCONFIG_CONTYPE_HDMI_TYPE_B}
const ADL_DL_DISPLAYCONFIG_CONTYPE_DISPLAYPORT = 10;
{$EXTERNALSYM ADL_DL_DISPLAYCONFIG_CONTYPE_DISPLAYPORT}
// @}

///////////////////////////////////////////////////////////////////////////
// ADL_DISPLAY_DISPLAYINFO_ Definitions 
// for ADLDisplayInfo.iDisplayInfoMask and ADLDisplayInfo.iDisplayInfoValue
// (bit-vector)
///////////////////////////////////////////////////////////////////////////
/// \defgroup define_displayinfomask Display Info Mask Values
// @{
const ADL_DISPLAY_DISPLAYINFO_DISPLAYCONNECTED = $00000001;
{$EXTERNALSYM ADL_DISPLAY_DISPLAYINFO_DISPLAYCONNECTED}
const ADL_DISPLAY_DISPLAYINFO_DISPLAYMAPPED = $00000002;
{$EXTERNALSYM ADL_DISPLAY_DISPLAYINFO_DISPLAYMAPPED}
const ADL_DISPLAY_DISPLAYINFO_NONLOCAL = $00000004;
{$EXTERNALSYM ADL_DISPLAY_DISPLAYINFO_NONLOCAL}
const ADL_DISPLAY_DISPLAYINFO_FORCIBLESUPPORTED = $00000008;
{$EXTERNALSYM ADL_DISPLAY_DISPLAYINFO_FORCIBLESUPPORTED}
const ADL_DISPLAY_DISPLAYINFO_GENLOCKSUPPORTED = $00000010;
{$EXTERNALSYM ADL_DISPLAY_DISPLAYINFO_GENLOCKSUPPORTED}
const ADL_DISPLAY_DISPLAYINFO_MULTIVPU_SUPPORTED = $00000020;
{$EXTERNALSYM ADL_DISPLAY_DISPLAYINFO_MULTIVPU_SUPPORTED}
const ADL_DISPLAY_DISPLAYINFO_LDA_DISPLAY = $00000040;
{$EXTERNALSYM ADL_DISPLAY_DISPLAYINFO_LDA_DISPLAY}
const ADL_DISPLAY_DISPLAYINFO_MODETIMING_OVERRIDESSUPPORTED = $00000080;
{$EXTERNALSYM ADL_DISPLAY_DISPLAYINFO_MODETIMING_OVERRIDESSUPPORTED}

const ADL_DISPLAY_DISPLAYINFO_MANNER_SUPPORTED_SINGLE = $00000100;
{$EXTERNALSYM ADL_DISPLAY_DISPLAYINFO_MANNER_SUPPORTED_SINGLE}
const ADL_DISPLAY_DISPLAYINFO_MANNER_SUPPORTED_CLONE = $00000200;
{$EXTERNALSYM ADL_DISPLAY_DISPLAYINFO_MANNER_SUPPORTED_CLONE}

/// Legacy support for XP 
const ADL_DISPLAY_DISPLAYINFO_MANNER_SUPPORTED_2VSTRETCH = $00000400;
{$EXTERNALSYM ADL_DISPLAY_DISPLAYINFO_MANNER_SUPPORTED_2VSTRETCH}
const ADL_DISPLAY_DISPLAYINFO_MANNER_SUPPORTED_2HSTRETCH = $00000800;
{$EXTERNALSYM ADL_DISPLAY_DISPLAYINFO_MANNER_SUPPORTED_2HSTRETCH}
const ADL_DISPLAY_DISPLAYINFO_MANNER_SUPPORTED_EXTENDED = $00001000;
{$EXTERNALSYM ADL_DISPLAY_DISPLAYINFO_MANNER_SUPPORTED_EXTENDED}

/// More support manners  
const ADL_DISPLAY_DISPLAYINFO_MANNER_SUPPORTED_NSTRETCH1GPU = $00010000;
{$EXTERNALSYM ADL_DISPLAY_DISPLAYINFO_MANNER_SUPPORTED_NSTRETCH1GPU}
const ADL_DISPLAY_DISPLAYINFO_MANNER_SUPPORTED_NSTRETCHNGPU = $00020000;
{$EXTERNALSYM ADL_DISPLAY_DISPLAYINFO_MANNER_SUPPORTED_NSTRETCHNGPU}
const ADL_DISPLAY_DISPLAYINFO_MANNER_SUPPORTED_RESERVED2 = $00040000;
{$EXTERNALSYM ADL_DISPLAY_DISPLAYINFO_MANNER_SUPPORTED_RESERVED2}
const ADL_DISPLAY_DISPLAYINFO_MANNER_SUPPORTED_RESERVED3 = $00080000;
{$EXTERNALSYM ADL_DISPLAY_DISPLAYINFO_MANNER_SUPPORTED_RESERVED3}

/// Projector display type
const ADL_DISPLAY_DISPLAYINFO_SHOWTYPE_PROJECTOR = $00100000;
{$EXTERNALSYM ADL_DISPLAY_DISPLAYINFO_SHOWTYPE_PROJECTOR}

// @}


///////////////////////////////////////////////////////////////////////////
// ADL_ADAPTER_DISPLAY_MANNER_SUPPORTED_ Definitions 
// for ADLAdapterDisplayCap of ADL_Adapter_Display_Cap()
// (bit-vector)
///////////////////////////////////////////////////////////////////////////
/// \defgroup define_adaptermanner Adapter Manner Support Values
// @{
const ADL_ADAPTER_DISPLAYCAP_MANNER_SUPPORTED_NOTACTIVE = $00000001;
{$EXTERNALSYM ADL_ADAPTER_DISPLAYCAP_MANNER_SUPPORTED_NOTACTIVE}
const ADL_ADAPTER_DISPLAYCAP_MANNER_SUPPORTED_SINGLE = $00000002;
{$EXTERNALSYM ADL_ADAPTER_DISPLAYCAP_MANNER_SUPPORTED_SINGLE}
const ADL_ADAPTER_DISPLAYCAP_MANNER_SUPPORTED_CLONE = $00000004;
{$EXTERNALSYM ADL_ADAPTER_DISPLAYCAP_MANNER_SUPPORTED_CLONE}
const ADL_ADAPTER_DISPLAYCAP_MANNER_SUPPORTED_NSTRETCH1GPU = $00000008;
{$EXTERNALSYM ADL_ADAPTER_DISPLAYCAP_MANNER_SUPPORTED_NSTRETCH1GPU}
const ADL_ADAPTER_DISPLAYCAP_MANNER_SUPPORTED_NSTRETCHNGPU = $00000010;
{$EXTERNALSYM ADL_ADAPTER_DISPLAYCAP_MANNER_SUPPORTED_NSTRETCHNGPU}

/// Legacy support for XP 
const ADL_ADAPTER_DISPLAYCAP_MANNER_SUPPORTED_2VSTRETCH = $00000020;
{$EXTERNALSYM ADL_ADAPTER_DISPLAYCAP_MANNER_SUPPORTED_2VSTRETCH}
const ADL_ADAPTER_DISPLAYCAP_MANNER_SUPPORTED_2HSTRETCH = $00000040;
{$EXTERNALSYM ADL_ADAPTER_DISPLAYCAP_MANNER_SUPPORTED_2HSTRETCH}
const ADL_ADAPTER_DISPLAYCAP_MANNER_SUPPORTED_EXTENDED = $00000080;
{$EXTERNALSYM ADL_ADAPTER_DISPLAYCAP_MANNER_SUPPORTED_EXTENDED}

const ADL_ADAPTER_DISPLAYCAP_PREFERDISPLAY_SUPPORTED = $00000100;
{$EXTERNALSYM ADL_ADAPTER_DISPLAYCAP_PREFERDISPLAY_SUPPORTED}
const ADL_ADAPTER_DISPLAYCAP_BEZEL_SUPPORTED = $00000200;
{$EXTERNALSYM ADL_ADAPTER_DISPLAYCAP_BEZEL_SUPPORTED}


///////////////////////////////////////////////////////////////////////////
// ADL_DISPLAY_DISPLAYMAP_MANNER_ Definitions 
// for ADLDisplayMap.iDisplayMapMask and ADLDisplayMap.iDisplayMapValue
// (bit-vector)
///////////////////////////////////////////////////////////////////////////
const ADL_DISPLAY_DISPLAYMAP_MANNER_RESERVED = $00000001;
{$EXTERNALSYM ADL_DISPLAY_DISPLAYMAP_MANNER_RESERVED}
const ADL_DISPLAY_DISPLAYMAP_MANNER_NOTACTIVE = $00000002;
{$EXTERNALSYM ADL_DISPLAY_DISPLAYMAP_MANNER_NOTACTIVE}
const ADL_DISPLAY_DISPLAYMAP_MANNER_SINGLE = $00000004;
{$EXTERNALSYM ADL_DISPLAY_DISPLAYMAP_MANNER_SINGLE}
const ADL_DISPLAY_DISPLAYMAP_MANNER_CLONE = $00000008;
{$EXTERNALSYM ADL_DISPLAY_DISPLAYMAP_MANNER_CLONE}
const ADL_DISPLAY_DISPLAYMAP_MANNER_RESERVED1 = $00000010;	// Removed NSTRETCH
{$EXTERNALSYM ADL_DISPLAY_DISPLAYMAP_MANNER_RESERVED1}
const ADL_DISPLAY_DISPLAYMAP_MANNER_HSTRETCH = $00000020;
{$EXTERNALSYM ADL_DISPLAY_DISPLAYMAP_MANNER_HSTRETCH}
const ADL_DISPLAY_DISPLAYMAP_MANNER_VSTRETCH = $00000040;
{$EXTERNALSYM ADL_DISPLAY_DISPLAYMAP_MANNER_VSTRETCH}
const ADL_DISPLAY_DISPLAYMAP_MANNER_VLD = $00000080;
{$EXTERNALSYM ADL_DISPLAY_DISPLAYMAP_MANNER_VLD}

// @}

///////////////////////////////////////////////////////////////////////////
// ADL_DISPLAY_DISPLAYMAP_OPTION_ Definitions 
// for iOption in function ADL_Display_DisplayMapConfig_Get
// (bit-vector)
///////////////////////////////////////////////////////////////////////////
const ADL_DISPLAY_DISPLAYMAP_OPTION_GPUINFO = $00000001;
{$EXTERNALSYM ADL_DISPLAY_DISPLAYMAP_OPTION_GPUINFO}

///////////////////////////////////////////////////////////////////////////
// ADL_DISPLAY_DISPLAYTARGET_ Definitions 
// for ADLDisplayTarget.iDisplayTargetMask and ADLDisplayTarget.iDisplayTargetValue
// (bit-vector)
///////////////////////////////////////////////////////////////////////////
const ADL_DISPLAY_DISPLAYTARGET_PREFERRED = $00000001;
{$EXTERNALSYM ADL_DISPLAY_DISPLAYTARGET_PREFERRED}

///////////////////////////////////////////////////////////////////////////
// ADL_DISPLAY_POSSIBLEMAPRESULT_VALID Definitions 
// for ADLPossibleMapResult.iPossibleMapResultMask and ADLPossibleMapResult.iPossibleMapResultValue
// (bit-vector)
///////////////////////////////////////////////////////////////////////////
const ADL_DISPLAY_POSSIBLEMAPRESULT_VALID = $00000001;
{$EXTERNALSYM ADL_DISPLAY_POSSIBLEMAPRESULT_VALID}
const ADL_DISPLAY_POSSIBLEMAPRESULT_BEZELSUPPORTED = $00000002;
{$EXTERNALSYM ADL_DISPLAY_POSSIBLEMAPRESULT_BEZELSUPPORTED}
const ADL_DISPLAY_POSSIBLEMAPRESULT_OVERLAPSUPPORTED = $00000004;
{$EXTERNALSYM ADL_DISPLAY_POSSIBLEMAPRESULT_OVERLAPSUPPORTED}

///////////////////////////////////////////////////////////////////////////
// ADL_DISPLAY_MODE_ Definitions 
// for ADLMode.iModeMask, ADLMode.iModeValue, and ADLMode.iModeFlag
// (bit-vector)
///////////////////////////////////////////////////////////////////////////
/// \defgroup define_displaymode Display Mode Values
// @{
const ADL_DISPLAY_MODE_COLOURFORMAT_565 = $00000001;
{$EXTERNALSYM ADL_DISPLAY_MODE_COLOURFORMAT_565}
const ADL_DISPLAY_MODE_COLOURFORMAT_8888 = $00000002;
{$EXTERNALSYM ADL_DISPLAY_MODE_COLOURFORMAT_8888}
const ADL_DISPLAY_MODE_ORIENTATION_SUPPORTED_000 = $00000004;
{$EXTERNALSYM ADL_DISPLAY_MODE_ORIENTATION_SUPPORTED_000}
const ADL_DISPLAY_MODE_ORIENTATION_SUPPORTED_090 = $00000008;
{$EXTERNALSYM ADL_DISPLAY_MODE_ORIENTATION_SUPPORTED_090}
const ADL_DISPLAY_MODE_ORIENTATION_SUPPORTED_180 = $00000010;
{$EXTERNALSYM ADL_DISPLAY_MODE_ORIENTATION_SUPPORTED_180}
const ADL_DISPLAY_MODE_ORIENTATION_SUPPORTED_270 = $00000020;
{$EXTERNALSYM ADL_DISPLAY_MODE_ORIENTATION_SUPPORTED_270}
const ADL_DISPLAY_MODE_REFRESHRATE_ROUNDED = $00000040;
{$EXTERNALSYM ADL_DISPLAY_MODE_REFRESHRATE_ROUNDED}
const ADL_DISPLAY_MODE_REFRESHRATE_ONLY = $00000080;
{$EXTERNALSYM ADL_DISPLAY_MODE_REFRESHRATE_ONLY}

const ADL_DISPLAY_MODE_PROGRESSIVE_FLAG = 0;
{$EXTERNALSYM ADL_DISPLAY_MODE_PROGRESSIVE_FLAG}
const ADL_DISPLAY_MODE_INTERLACED_FLAG = 2;
{$EXTERNALSYM ADL_DISPLAY_MODE_INTERLACED_FLAG}
// @}

///////////////////////////////////////////////////////////////////////////
// ADL_OSMODEINFO Definitions 
///////////////////////////////////////////////////////////////////////////
/// \defgroup define_osmode OS Mode Values
// @{
const ADL_OSMODEINFOXPOS_DEFAULT = -640;
{$EXTERNALSYM ADL_OSMODEINFOXPOS_DEFAULT}
const ADL_OSMODEINFOYPOS_DEFAULT = 0;
{$EXTERNALSYM ADL_OSMODEINFOYPOS_DEFAULT}
const ADL_OSMODEINFOXRES_DEFAULT = 640;
{$EXTERNALSYM ADL_OSMODEINFOXRES_DEFAULT}
const ADL_OSMODEINFOYRES_DEFAULT = 480;
{$EXTERNALSYM ADL_OSMODEINFOYRES_DEFAULT}
const ADL_OSMODEINFOXRES_DEFAULT800 = 800;
{$EXTERNALSYM ADL_OSMODEINFOXRES_DEFAULT800}
const ADL_OSMODEINFOYRES_DEFAULT600 = 600;
{$EXTERNALSYM ADL_OSMODEINFOYRES_DEFAULT600}
const ADL_OSMODEINFOREFRESHRATE_DEFAULT = 60;
{$EXTERNALSYM ADL_OSMODEINFOREFRESHRATE_DEFAULT}
const ADL_OSMODEINFOCOLOURDEPTH_DEFAULT = 8;
{$EXTERNALSYM ADL_OSMODEINFOCOLOURDEPTH_DEFAULT}
const ADL_OSMODEINFOCOLOURDEPTH_DEFAULT16 = 16;
{$EXTERNALSYM ADL_OSMODEINFOCOLOURDEPTH_DEFAULT16}
const ADL_OSMODEINFOCOLOURDEPTH_DEFAULT24 = 24;
{$EXTERNALSYM ADL_OSMODEINFOCOLOURDEPTH_DEFAULT24}
const ADL_OSMODEINFOCOLOURDEPTH_DEFAULT32 = 32;
{$EXTERNALSYM ADL_OSMODEINFOCOLOURDEPTH_DEFAULT32}
const ADL_OSMODEINFOORIENTATION_DEFAULT = 0;
{$EXTERNALSYM ADL_OSMODEINFOORIENTATION_DEFAULT}
const ADL_OSMODEINFOORIENTATION_DEFAULT_WIN7 = $FFFFFFFF;
{$EXTERNALSYM ADL_OSMODEINFOORIENTATION_DEFAULT_WIN7}
const ADL_OSMODEFLAG_DEFAULT = 0;
{$EXTERNALSYM ADL_OSMODEFLAG_DEFAULT}
// @}


///////////////////////////////////////////////////////////////////////////
// ADLThreadingModel Enumeration
///////////////////////////////////////////////////////////////////////////
/// \defgroup thread_model 
/// Used with \ref ADL_Main_ControlX2_Create and \ref ADL2_Main_ControlX2_Create to specify how ADL handles API calls when executed by multiple threads concurrently. 
/// \brief Declares ADL threading behavior. 
// @{
const ADL_THREADING_UNLOCKED    = 0; //*!< Default behavior. ADL will not enforce serialization of ADL API executions by multiple threads.  Multiple threads will be allowed to enter to ADL at the same time. Note that ADL library is not guaranteed to be thread-safe. Client that calls ADL_Main_Control_Create have to provide its own mechanism for ADL calls serialization. *)
const ADL_THREADING_LOCKED	= 1;     //*!< ADL will enforce serialization of ADL API when called by multiple threads.  Only single thread will be allowed to enter ADL API at the time. This option makes ADL calls thread-safe. You shouldn't use this option if ADL calls will be executed on Linux on x-server rendering thread. It can cause the application to hung.  */

type
	ADLThreadingModel = ADL_THREADING_UNLOCKED..ADL_THREADING_LOCKED;
	{$EXTERNALSYM ADLThreadingModel}
	

// @}
///////////////////////////////////////////////////////////////////////////
// ADLPurposeCode Enumeration
///////////////////////////////////////////////////////////////////////////
const ADL_PURPOSECODE_NORMAL	= 0;
const ADL_PURPOSECODE_HIDE_MODE_SWITCH	= 0;
const ADL_PURPOSECODE_MODE_SWITCH	= 1;
const ADL_PURPOSECODE_ATTATCH_DEVICE	= 2;
const ADL_PURPOSECODE_DETACH_DEVICE	= 3;
const ADL_PURPOSECODE_SETPRIMARY_DEVICE	= 4;
const ADL_PURPOSECODE_GDI_ROTATION	= 5;
const ADL_PURPOSECODE_ATI_ROTATION	= 6;

type
	ADLPurposeCode = ADL_PURPOSECODE_NORMAL..ADL_PURPOSECODE_ATI_ROTATION;
	{$EXTERNALSYM ADLPurposeCode}
	
///////////////////////////////////////////////////////////////////////////
// ADLAngle Enumeration
///////////////////////////////////////////////////////////////////////////
const ADL_ANGLE_LANDSCAPE = 0;
const ADL_ANGLE_ROTATERIGHT = 90;
const ADL_ANGLE_ROTATE180 = 180;
const ADL_ANGLE_ROTATELEFT = 270;

type
	ADLAngle = ADL_ANGLE_LANDSCAPE..ADL_ANGLE_ROTATELEFT;
	{$EXTERNALSYM ADLAngle}
	

///////////////////////////////////////////////////////////////////////////
// ADLOrientationDataType Enumeration
///////////////////////////////////////////////////////////////////////////
const ADL_ORIENTATIONTYPE_OSDATATYPE	= 0;
const ADL_ORIENTATIONTYPE_NONOSDATATYPE	= 1;

type
	ADLOrientationDataType = ADL_ORIENTATIONTYPE_OSDATATYPE..ADL_ORIENTATIONTYPE_NONOSDATATYPE;
	{$EXTERNALSYM ADLOrientationDataType}
	

///////////////////////////////////////////////////////////////////////////
// ADLPanningMode Enumeration
///////////////////////////////////////////////////////////////////////////
const ADL_PANNINGMODE_NO_PANNING = 0;
const ADL_PANNINGMODE_AT_LEAST_ONE_NO_PANNING = 1;
const ADL_PANNINGMODE_ALLOW_PANNING = 2;

type
	ADLPanningMode = ADL_PANNINGMODE_NO_PANNING..ADL_PANNINGMODE_ALLOW_PANNING;
	{$EXTERNALSYM ADLPanningMode}
	

///////////////////////////////////////////////////////////////////////////
// ADLLARGEDESKTOPTYPE Enumeration
///////////////////////////////////////////////////////////////////////////
const ADL_LARGEDESKTOPTYPE_NORMALDESKTOP = 0;
const ADL_LARGEDESKTOPTYPE_PSEUDOLARGEDESKTOP = 1;
const ADL_LARGEDESKTOPTYPE_VERYLARGEDESKTOP = 2;

type
	ADLLARGEDESKTOPTYPE = ADL_LARGEDESKTOPTYPE_NORMALDESKTOP..ADL_LARGEDESKTOPTYPE_VERYLARGEDESKTOP;
	{$EXTERNALSYM ADLLARGEDESKTOPTYPE}
	

///////////////////////////////////////////////////////////////////////////
// ADLPlatform Enumeration
///////////////////////////////////////////////////////////////////////////
const GRAPHICS_PLATFORM_DESKTOP  = 0;
const GRAPHICS_PLATFORM_MOBILE   = 1;

type
	ADLPlatForm = GRAPHICS_PLATFORM_DESKTOP..GRAPHICS_PLATFORM_MOBILE;
	{$EXTERNALSYM ADLPlatForm}
	
// Other Definitions for internal use

// Values for ADL_Display_WriteAndReadI2CRev_Get()

const ADL_I2C_MAJOR_API_REV = $00000001;
{$EXTERNALSYM ADL_I2C_MAJOR_API_REV}
const ADL_I2C_MINOR_DEFAULT_API_REV = $00000000;
{$EXTERNALSYM ADL_I2C_MINOR_DEFAULT_API_REV}
const ADL_I2C_MINOR_OEM_API_REV = $00000001;
{$EXTERNALSYM ADL_I2C_MINOR_OEM_API_REV}

// Values for ADL_Display_WriteAndReadI2C()
const ADL_DL_I2C_LINE_OEM = $00000001;
{$EXTERNALSYM ADL_DL_I2C_LINE_OEM}
const ADL_DL_I2C_LINE_OD_CONTROL = $00000002;
{$EXTERNALSYM ADL_DL_I2C_LINE_OD_CONTROL}
const ADL_DL_I2C_LINE_OEM2 = $00000003;
{$EXTERNALSYM ADL_DL_I2C_LINE_OEM2}
const ADL_DL_I2C_LINE_OEM3 = $00000004;
{$EXTERNALSYM ADL_DL_I2C_LINE_OEM3}
const ADL_DL_I2C_LINE_OEM4 = $00000005;
{$EXTERNALSYM ADL_DL_I2C_LINE_OEM4}
const ADL_DL_I2C_LINE_OEM5 = $00000006;
{$EXTERNALSYM ADL_DL_I2C_LINE_OEM5}
const ADL_DL_I2C_LINE_OEM6 = $00000007;
{$EXTERNALSYM ADL_DL_I2C_LINE_OEM6}

// Max size of I2C data buffer
const ADL_DL_I2C_MAXDATASIZE = $00000040;
{$EXTERNALSYM ADL_DL_I2C_MAXDATASIZE}
const ADL_DL_I2C_MAXWRITEDATASIZE = $0000000C;
{$EXTERNALSYM ADL_DL_I2C_MAXWRITEDATASIZE}
const ADL_DL_I2C_MAXADDRESSLENGTH = $00000006;
{$EXTERNALSYM ADL_DL_I2C_MAXADDRESSLENGTH}
const ADL_DL_I2C_MAXOFFSETLENGTH = $00000004;
{$EXTERNALSYM ADL_DL_I2C_MAXOFFSETLENGTH}


/// Values for ADLDisplayProperty.iPropertyType
const ADL_DL_DISPLAYPROPERTY_TYPE_UNKNOWN = 0;
{$EXTERNALSYM ADL_DL_DISPLAYPROPERTY_TYPE_UNKNOWN}
const ADL_DL_DISPLAYPROPERTY_TYPE_EXPANSIONMODE = 1;
{$EXTERNALSYM ADL_DL_DISPLAYPROPERTY_TYPE_EXPANSIONMODE}
const ADL_DL_DISPLAYPROPERTY_TYPE_USEUNDERSCANSCALING = 2;
{$EXTERNALSYM ADL_DL_DISPLAYPROPERTY_TYPE_USEUNDERSCANSCALING}
/// Enables ITC processing for HDMI panels that are capable of the feature
const ADL_DL_DISPLAYPROPERTY_TYPE_ITCFLAGENABLE = 9;
{$EXTERNALSYM ADL_DL_DISPLAYPROPERTY_TYPE_ITCFLAGENABLE}


/// Values for ADLDisplayContent.iContentType
/// Certain HDMI panels that support ITC have support for a feature such that, the display on the panel 
/// can be adjusted to optimize the view of the content being displayed, depending on the type of content.
const ADL_DL_DISPLAYCONTENT_TYPE_GRAPHICS = 1;
{$EXTERNALSYM ADL_DL_DISPLAYCONTENT_TYPE_GRAPHICS}
const ADL_DL_DISPLAYCONTENT_TYPE_PHOTO = 2;
{$EXTERNALSYM ADL_DL_DISPLAYCONTENT_TYPE_PHOTO}
const ADL_DL_DISPLAYCONTENT_TYPE_CINEMA = 4;
{$EXTERNALSYM ADL_DL_DISPLAYCONTENT_TYPE_CINEMA}
const ADL_DL_DISPLAYCONTENT_TYPE_GAME = 8;
{$EXTERNALSYM ADL_DL_DISPLAYCONTENT_TYPE_GAME}





//values for ADLDisplayProperty.iExpansionMode
const ADL_DL_DISPLAYPROPERTY_EXPANSIONMODE_CENTER = 0;
{$EXTERNALSYM ADL_DL_DISPLAYPROPERTY_EXPANSIONMODE_CENTER}
const ADL_DL_DISPLAYPROPERTY_EXPANSIONMODE_FULLSCREEN = 1;
{$EXTERNALSYM ADL_DL_DISPLAYPROPERTY_EXPANSIONMODE_FULLSCREEN}
const ADL_DL_DISPLAYPROPERTY_EXPANSIONMODE_ASPECTRATIO = 2;
{$EXTERNALSYM ADL_DL_DISPLAYPROPERTY_EXPANSIONMODE_ASPECTRATIO}

//values for ADL_Display_DitherState_Get
const ADL_DL_DISPLAY_DITHER_UNKNOWN = 0;
{$EXTERNALSYM ADL_DL_DISPLAY_DITHER_UNKNOWN}
const ADL_DL_DISPLAY_DITHER_DISABLED = 1;
{$EXTERNALSYM ADL_DL_DISPLAY_DITHER_DISABLED}
const ADL_DL_DISPLAY_DITHER_ENABLED = 2;
{$EXTERNALSYM ADL_DL_DISPLAY_DITHER_ENABLED}

/// Display Get Cached EDID flag
const ADL_MAX_EDIDDATA_SIZE = 256;	// number of UCHAR
{$EXTERNALSYM ADL_MAX_EDIDDATA_SIZE}
const ADL_MAX_OVERRIDEEDID_SIZE = 512;	// number of UCHAR
{$EXTERNALSYM ADL_MAX_OVERRIDEEDID_SIZE}
const ADL_MAX_EDID_EXTENSION_BLOCKS = 3;
{$EXTERNALSYM ADL_MAX_EDID_EXTENSION_BLOCKS}

const ADL_DL_CONTROLLER_OVERLAY_ALPHA = 0;
{$EXTERNALSYM ADL_DL_CONTROLLER_OVERLAY_ALPHA}
const ADL_DL_CONTROLLER_OVERLAY_ALPHAPERPIX = 1;
{$EXTERNALSYM ADL_DL_CONTROLLER_OVERLAY_ALPHAPERPIX}

const ADL_DL_DISPLAY_DATA_PACKET__INFO_PACKET_RESET = $00000000;
{$EXTERNALSYM ADL_DL_DISPLAY_DATA_PACKET__INFO_PACKET_RESET}
const ADL_DL_DISPLAY_DATA_PACKET__INFO_PACKET_SET = $00000001;
{$EXTERNALSYM ADL_DL_DISPLAY_DATA_PACKET__INFO_PACKET_SET}
const ADL_DL_DISPLAY_DATA_PACKET__INFO_PACKET_SCAN = $00000002;
{$EXTERNALSYM ADL_DL_DISPLAY_DATA_PACKET__INFO_PACKET_SCAN}

///\defgroup define_display_packet Display Data Packet Types
// @{
const ADL_DL_DISPLAY_DATA_PACKET__TYPE__AVI = $00000001;
{$EXTERNALSYM ADL_DL_DISPLAY_DATA_PACKET__TYPE__AVI}
const ADL_DL_DISPLAY_DATA_PACKET__TYPE__RESERVED = $00000002;
{$EXTERNALSYM ADL_DL_DISPLAY_DATA_PACKET__TYPE__RESERVED}
const ADL_DL_DISPLAY_DATA_PACKET__TYPE__VENDORINFO = $00000004;
{$EXTERNALSYM ADL_DL_DISPLAY_DATA_PACKET__TYPE__VENDORINFO}
// @}

// matrix types
const ADL_GAMUT_MATRIX_SD = 1;	// SD matrix i.e. BT601
{$EXTERNALSYM ADL_GAMUT_MATRIX_SD}
const ADL_GAMUT_MATRIX_HD = 2;	// HD matrix i.e. BT709
{$EXTERNALSYM ADL_GAMUT_MATRIX_HD}

///\defgroup define_clockinfo_flags Clock flags
/// Used by ADLAdapterODClockInfo.iFlag
// @{
const ADL_DL_CLOCKINFO_FLAG_FULLSCREEN3DONLY = $00000001;
{$EXTERNALSYM ADL_DL_CLOCKINFO_FLAG_FULLSCREEN3DONLY}
const ADL_DL_CLOCKINFO_FLAG_ALWAYSFULLSCREEN3D = $00000002;
{$EXTERNALSYM ADL_DL_CLOCKINFO_FLAG_ALWAYSFULLSCREEN3D}
const ADL_DL_CLOCKINFO_FLAG_VPURECOVERYREDUCED = $00000004;
{$EXTERNALSYM ADL_DL_CLOCKINFO_FLAG_VPURECOVERYREDUCED}
const ADL_DL_CLOCKINFO_FLAG_THERMALPROTECTION = $00000008;
{$EXTERNALSYM ADL_DL_CLOCKINFO_FLAG_THERMALPROTECTION}
// @}

// Supported GPUs
// ADL_Display_PowerXpressActiveGPU_Get()
const ADL_DL_POWERXPRESS_GPU_INTEGRATED = 1;
{$EXTERNALSYM ADL_DL_POWERXPRESS_GPU_INTEGRATED}
const ADL_DL_POWERXPRESS_GPU_DISCRETE = 2;
{$EXTERNALSYM ADL_DL_POWERXPRESS_GPU_DISCRETE}

// Possible values for lpOperationResult
// ADL_Display_PowerXpressActiveGPU_Get()
const ADL_DL_POWERXPRESS_SWITCH_RESULT_STARTED = 1;	// Switch procedure has been started - Windows platform only
{$EXTERNALSYM ADL_DL_POWERXPRESS_SWITCH_RESULT_STARTED}
const ADL_DL_POWERXPRESS_SWITCH_RESULT_DECLINED = 2;	// Switch procedure cannot be started - All platforms
{$EXTERNALSYM ADL_DL_POWERXPRESS_SWITCH_RESULT_DECLINED}
const ADL_DL_POWERXPRESS_SWITCH_RESULT_ALREADY = 3;	// System already has required status  - All platforms
{$EXTERNALSYM ADL_DL_POWERXPRESS_SWITCH_RESULT_ALREADY}
const ADL_DL_POWERXPRESS_SWITCH_RESULT_DEFERRED = 5;	// Switch was deferred and requires an X restart - Linux platform only
{$EXTERNALSYM ADL_DL_POWERXPRESS_SWITCH_RESULT_DEFERRED}

// PowerXpress support version
// ADL_Display_PowerXpressVersion_Get()
const ADL_DL_POWERXPRESS_VERSION_MAJOR = 2;	// Current PowerXpress support version 2.0
{$EXTERNALSYM ADL_DL_POWERXPRESS_VERSION_MAJOR}
const ADL_DL_POWERXPRESS_VERSION_MINOR = 0;
{$EXTERNALSYM ADL_DL_POWERXPRESS_VERSION_MINOR}

//ADL_DL_POWERXPRESS_VERSION	(((ADL_DL_POWERXPRESS_VERSION_MAJOR) << 16) | ADL_DL_POWERXPRESS_VERSION_MINOR)
const ADL_DL_POWERXPRESS_VERSION = (((ADL_DL_POWERXPRESS_VERSION_MAJOR shl 16) or ADL_DL_POWERXPRESS_VERSION_MINOR));
{$EXTERNALSYM ADL_DL_POWERXPRESS_VERSION}

//values for ADLThermalControllerInfo.iThermalControllerDomain
const ADL_DL_THERMAL_DOMAIN_OTHER = 0;
{$EXTERNALSYM ADL_DL_THERMAL_DOMAIN_OTHER}
const ADL_DL_THERMAL_DOMAIN_GPU = 1;
{$EXTERNALSYM ADL_DL_THERMAL_DOMAIN_GPU}

//values for ADLThermalControllerInfo.iFlags
const ADL_DL_THERMAL_FLAG_INTERRUPT = 1;
{$EXTERNALSYM ADL_DL_THERMAL_FLAG_INTERRUPT}
const ADL_DL_THERMAL_FLAG_FANCONTROL = 2;
{$EXTERNALSYM ADL_DL_THERMAL_FLAG_FANCONTROL}

///\defgroup define_fanctrl Fan speed cotrol
/// Values for ADLFanSpeedInfo.iFlags
// @{
const ADL_DL_FANCTRL_SUPPORTS_PERCENT_READ = 1;
{$EXTERNALSYM ADL_DL_FANCTRL_SUPPORTS_PERCENT_READ}
const ADL_DL_FANCTRL_SUPPORTS_PERCENT_WRITE = 2;
{$EXTERNALSYM ADL_DL_FANCTRL_SUPPORTS_PERCENT_WRITE}
const ADL_DL_FANCTRL_SUPPORTS_RPM_READ = 4;
{$EXTERNALSYM ADL_DL_FANCTRL_SUPPORTS_RPM_READ}
const ADL_DL_FANCTRL_SUPPORTS_RPM_WRITE = 8;
{$EXTERNALSYM ADL_DL_FANCTRL_SUPPORTS_RPM_WRITE}
// @}

//values for ADLFanSpeedValue.iSpeedType
const ADL_DL_FANCTRL_SPEED_TYPE_PERCENT = 1;
{$EXTERNALSYM ADL_DL_FANCTRL_SPEED_TYPE_PERCENT}
const ADL_DL_FANCTRL_SPEED_TYPE_RPM = 2;
{$EXTERNALSYM ADL_DL_FANCTRL_SPEED_TYPE_RPM}

//values for ADLFanSpeedValue.iFlags
const ADL_DL_FANCTRL_FLAG_USER_DEFINED_SPEED = 1;
{$EXTERNALSYM ADL_DL_FANCTRL_FLAG_USER_DEFINED_SPEED}

// MVPU interfaces
const ADL_DL_MAX_MVPU_ADAPTERS = 4;
{$EXTERNALSYM ADL_DL_MAX_MVPU_ADAPTERS}
const MVPU_ADAPTER_0 = $00000001;
{$EXTERNALSYM MVPU_ADAPTER_0}
const MVPU_ADAPTER_1 = $00000002;
{$EXTERNALSYM MVPU_ADAPTER_1}
const MVPU_ADAPTER_2 = $00000004;
{$EXTERNALSYM MVPU_ADAPTER_2}
const MVPU_ADAPTER_3 = $00000008;
{$EXTERNALSYM MVPU_ADAPTER_3}
const ADL_DL_MAX_REGISTRY_PATH = 256;
{$EXTERNALSYM ADL_DL_MAX_REGISTRY_PATH}

//values for ADLMVPUStatus.iStatus
const ADL_DL_MVPU_STATUS_OFF = 0;
{$EXTERNALSYM ADL_DL_MVPU_STATUS_OFF}
const ADL_DL_MVPU_STATUS_ON = 1;
{$EXTERNALSYM ADL_DL_MVPU_STATUS_ON}

// values for ASIC family
///\defgroup define_Asic_type Detailed asic types
/// Defines for Adapter ASIC family type
// @{
const ADL_ASIC_UNDEFINED = 0;
{$EXTERNALSYM ADL_ASIC_UNDEFINED}
const ADL_ASIC_DISCRETE = (1 shl 0);
{$EXTERNALSYM ADL_ASIC_DISCRETE}
const ADL_ASIC_INTEGRATED = (1 shl 1);
{$EXTERNALSYM ADL_ASIC_INTEGRATED}
const ADL_ASIC_FIREGL = (1 shl 2);
{$EXTERNALSYM ADL_ASIC_FIREGL}
const ADL_ASIC_FIREMV = (1 shl 3);
{$EXTERNALSYM ADL_ASIC_FIREMV}
const ADL_ASIC_XGP = (1 shl 4);
{$EXTERNALSYM ADL_ASIC_XGP}
const ADL_ASIC_FUSION = (1 shl 5);
{$EXTERNALSYM ADL_ASIC_FUSION}
const ADL_ASIC_FIRESTREAM = (1 shl 6);
{$EXTERNALSYM ADL_ASIC_FIRESTREAM}
// @}

///\defgroup define_detailed_timing_flags Detailed Timimg Flags
/// Defines for ADLDetailedTiming.sTimingFlags field
// @{
const ADL_DL_TIMINGFLAG_DOUBLE_SCAN = $0001;
{$EXTERNALSYM ADL_DL_TIMINGFLAG_DOUBLE_SCAN}
//sTimingFlags is set when the mode is INTERLACED, if not PROGRESSIVE
const ADL_DL_TIMINGFLAG_INTERLACED = $0002;
{$EXTERNALSYM ADL_DL_TIMINGFLAG_INTERLACED}
//sTimingFlags is set when the Horizontal Sync is POSITIVE, if not NEGATIVE
const ADL_DL_TIMINGFLAG_H_SYNC_POLARITY = $0004;
{$EXTERNALSYM ADL_DL_TIMINGFLAG_H_SYNC_POLARITY}
//sTimingFlags is set when the Vertical Sync is POSITIVE, if not NEGATIVE
const ADL_DL_TIMINGFLAG_V_SYNC_POLARITY = $0008;
{$EXTERNALSYM ADL_DL_TIMINGFLAG_V_SYNC_POLARITY}
// @}

///\defgroup define_modetiming_standard Timing Standards
/// Defines for ADLDisplayModeInfo.iTimingStandard field
// @{
const ADL_DL_MODETIMING_STANDARD_CVT = $00000001;	// CVT Standard
{$EXTERNALSYM ADL_DL_MODETIMING_STANDARD_CVT}
const ADL_DL_MODETIMING_STANDARD_GTF = $00000002;	// GFT Standard
{$EXTERNALSYM ADL_DL_MODETIMING_STANDARD_GTF}
const ADL_DL_MODETIMING_STANDARD_DMT = $00000004;	// DMT Standard
{$EXTERNALSYM ADL_DL_MODETIMING_STANDARD_DMT}
const ADL_DL_MODETIMING_STANDARD_CUSTOM = $00000008;	// User-defined standard
{$EXTERNALSYM ADL_DL_MODETIMING_STANDARD_CUSTOM}
const ADL_DL_MODETIMING_STANDARD_DRIVER_DEFAULT = $00000010;	// Remove Mode from overriden list
{$EXTERNALSYM ADL_DL_MODETIMING_STANDARD_DRIVER_DEFAULT}
const ADL_DL_MODETIMING_STANDARD_CVT_RB = $00000020;	// CVT-RB Standard
{$EXTERNALSYM ADL_DL_MODETIMING_STANDARD_CVT_RB}
// @}

// \defgroup define_xserverinfo driver x-server info
/// These flags are used by ADL_XServerInfo_Get()
// @

/// Xinerama is active in the x-server, Xinerama extension may report it to be active but it
/// may not be active in x-server
const ADL_XSERVERINFO_XINERAMAACTIVE = (1 shl 0);
{$EXTERNALSYM ADL_XSERVERINFO_XINERAMAACTIVE}

/// RandR 1.2 is supported by driver, RandR extension may report version 1.2 
/// but driver may not support it
const ADL_XSERVERINFO_RANDR12SUPPORTED = (1 shl 1);
{$EXTERNALSYM ADL_XSERVERINFO_RANDR12SUPPORTED}
// @


///\defgroup define_eyefinity_constants Eyefinity Definitions
// @{

const ADL_CONTROLLERVECTOR_0 = 1;	// ADL_CONTROLLERINDEX_0 = 0, (1 << ADL_CONTROLLERINDEX_0)
{$EXTERNALSYM ADL_CONTROLLERVECTOR_0}
const ADL_CONTROLLERVECTOR_1 = 2;	// ADL_CONTROLLERINDEX_1 = 1, (1 << ADL_CONTROLLERINDEX_1)
{$EXTERNALSYM ADL_CONTROLLERVECTOR_1}

const ADL_DISPLAY_SLSGRID_ORIENTATION_000 = $00000001;
{$EXTERNALSYM ADL_DISPLAY_SLSGRID_ORIENTATION_000}
const ADL_DISPLAY_SLSGRID_ORIENTATION_090 = $00000002;
{$EXTERNALSYM ADL_DISPLAY_SLSGRID_ORIENTATION_090}
const ADL_DISPLAY_SLSGRID_ORIENTATION_180 = $00000004;
{$EXTERNALSYM ADL_DISPLAY_SLSGRID_ORIENTATION_180}
const ADL_DISPLAY_SLSGRID_ORIENTATION_270 = $00000008;
{$EXTERNALSYM ADL_DISPLAY_SLSGRID_ORIENTATION_270}
const ADL_DISPLAY_SLSGRID_CAP_OPTION_RELATIVETO_LANDSCAPE = $00000001;
{$EXTERNALSYM ADL_DISPLAY_SLSGRID_CAP_OPTION_RELATIVETO_LANDSCAPE}
const ADL_DISPLAY_SLSGRID_CAP_OPTION_RELATIVETO_CURRENTANGLE = $00000002;
{$EXTERNALSYM ADL_DISPLAY_SLSGRID_CAP_OPTION_RELATIVETO_CURRENTANGLE}
const ADL_DISPLAY_SLSGRID_PORTAIT_MODE = $00000004;
{$EXTERNALSYM ADL_DISPLAY_SLSGRID_PORTAIT_MODE}


const ADL_DISPLAY_SLSMAPCONFIG_GET_OPTION_RELATIVETO_LANDSCAPE = $00000001;
{$EXTERNALSYM ADL_DISPLAY_SLSMAPCONFIG_GET_OPTION_RELATIVETO_LANDSCAPE}
const ADL_DISPLAY_SLSMAPCONFIG_GET_OPTION_RELATIVETO_CURRENTANGLE = $00000002;
{$EXTERNALSYM ADL_DISPLAY_SLSMAPCONFIG_GET_OPTION_RELATIVETO_CURRENTANGLE}

const ADL_DISPLAY_SLSMAPCONFIG_CREATE_OPTION_RELATIVETO_LANDSCAPE = $00000001;
{$EXTERNALSYM ADL_DISPLAY_SLSMAPCONFIG_CREATE_OPTION_RELATIVETO_LANDSCAPE}
const ADL_DISPLAY_SLSMAPCONFIG_CREATE_OPTION_RELATIVETO_CURRENTANGLE = $00000002;
{$EXTERNALSYM ADL_DISPLAY_SLSMAPCONFIG_CREATE_OPTION_RELATIVETO_CURRENTANGLE}

const ADL_DISPLAY_SLSMAPCONFIG_REARRANGE_OPTION_RELATIVETO_LANDSCAPE = $00000001;
{$EXTERNALSYM ADL_DISPLAY_SLSMAPCONFIG_REARRANGE_OPTION_RELATIVETO_LANDSCAPE}
const ADL_DISPLAY_SLSMAPCONFIG_REARRANGE_OPTION_RELATIVETO_CURRENTANGLE = $00000002;
{$EXTERNALSYM ADL_DISPLAY_SLSMAPCONFIG_REARRANGE_OPTION_RELATIVETO_CURRENTANGLE}


const ADL_DISPLAY_SLSGRID_RELATIVETO_LANDSCAPE = $00000010;
{$EXTERNALSYM ADL_DISPLAY_SLSGRID_RELATIVETO_LANDSCAPE}
const ADL_DISPLAY_SLSGRID_RELATIVETO_CURRENTANGLE = $00000020;
{$EXTERNALSYM ADL_DISPLAY_SLSGRID_RELATIVETO_CURRENTANGLE}


/// The bit mask identifies displays is currently in bezel mode.
const ADL_DISPLAY_SLSMAP_BEZELMODE = $00000010;
{$EXTERNALSYM ADL_DISPLAY_SLSMAP_BEZELMODE}
/// The bit mask identifies displays from this map is arranged.
const ADL_DISPLAY_SLSMAP_DISPLAYARRANGED = $00000002;
{$EXTERNALSYM ADL_DISPLAY_SLSMAP_DISPLAYARRANGED}
/// The bit mask identifies this map is currently in used for the current adapter.
const ADL_DISPLAY_SLSMAP_CURRENTCONFIG = $00000004;
{$EXTERNALSYM ADL_DISPLAY_SLSMAP_CURRENTCONFIG}

 ///For onlay active SLS  map info
const ADL_DISPLAY_SLSMAPINDEXLIST_OPTION_ACTIVE = $00000001;
{$EXTERNALSYM ADL_DISPLAY_SLSMAPINDEXLIST_OPTION_ACTIVE}

///For Bezel
const ADL_DISPLAY_BEZELOFFSET_STEPBYSTEPSET = $00000004;
{$EXTERNALSYM ADL_DISPLAY_BEZELOFFSET_STEPBYSTEPSET}
const ADL_DISPLAY_BEZELOFFSET_COMMIT = $00000008;
{$EXTERNALSYM ADL_DISPLAY_BEZELOFFSET_COMMIT}

// @}

///\defgroup define_powerxpress_constants PowerXpress Definitions
// @{

/// The bit mask identifies PX caps for ADLPXConfigCaps.iPXConfigCapMask and ADLPXConfigCaps.iPXConfigCapValue
const ADL_PX_CONFIGCAPS_SPLASHSCREEN_SUPPORT = $0001;
{$EXTERNALSYM ADL_PX_CONFIGCAPS_SPLASHSCREEN_SUPPORT}
const ADL_PX_CONFIGCAPS_CF_SUPPORT = $0002;
{$EXTERNALSYM ADL_PX_CONFIGCAPS_CF_SUPPORT}
const ADL_PX_CONFIGCAPS_MUXLESS = $0004;
{$EXTERNALSYM ADL_PX_CONFIGCAPS_MUXLESS}
const ADL_PX_CONFIGCAPS_PROFILE_COMPLIANT = $0008;
{$EXTERNALSYM ADL_PX_CONFIGCAPS_PROFILE_COMPLIANT}
const ADL_PX_CONFIGCAPS_NON_AMD_DRIVEN_DISPLAYS = $0010;
{$EXTERNALSYM ADL_PX_CONFIGCAPS_NON_AMD_DRIVEN_DISPLAYS}
const ADL_PX_CONFIGCAPS_FIXED_SUPPORT = $0020;
{$EXTERNALSYM ADL_PX_CONFIGCAPS_FIXED_SUPPORT}
const ADL_PX_CONFIGCAPS_DYNAMIC_SUPPORT = $0040;
{$EXTERNALSYM ADL_PX_CONFIGCAPS_DYNAMIC_SUPPORT}
const ADL_PX_CONFIGCAPS_HIDE_AUTO_SWITCH = $0080;
{$EXTERNALSYM ADL_PX_CONFIGCAPS_HIDE_AUTO_SWITCH}

/// The bit mask identifies PX schemes for ADLPXSchemeRange
const ADL_PX_SCHEMEMASK_FIXED = $0001;
{$EXTERNALSYM ADL_PX_SCHEMEMASK_FIXED}
const ADL_PX_SCHEMEMASK_DYNAMIC = $0002;
{$EXTERNALSYM ADL_PX_SCHEMEMASK_DYNAMIC}

/// PX Schemes
const ADL_PX_SCHEME_INVALID   = 0;
const ADL_PX_SCHEME_FIXED     = ADL_PX_SCHEMEMASK_FIXED;
const ADL_PX_SCHEME_DYNAMIC   = ADL_PX_SCHEMEMASK_DYNAMIC;

type
	ADLPXScheme = ADL_PX_SCHEME_INVALID..ADL_PX_SCHEME_DYNAMIC;
	{$EXTERNALSYM ADLPXScheme}
	

/// Just keep the old definitions for compatibility, need to be removed later
const PX_SCHEME_INVALID   = 0;
const PX_SCHEME_FIXED     = 1;
const PX_SCHEME_DYNAMIC   = 2;

type
	PXScheme = PX_SCHEME_INVALID..PX_SCHEME_DYNAMIC;
	{$EXTERNALSYM PXScheme}
	


// @}

///\defgroup define_appprofiles For Application Profiles
// @{

const ADL_APP_PROFILE_FILENAME_LENGTH = 64;
{$EXTERNALSYM ADL_APP_PROFILE_FILENAME_LENGTH}
const ADL_APP_PROFILE_TIMESTAMP_LENGTH = 32;
{$EXTERNALSYM ADL_APP_PROFILE_TIMESTAMP_LENGTH}
const ADL_APP_PROFILE_VERSION_LENGTH = 32;
{$EXTERNALSYM ADL_APP_PROFILE_VERSION_LENGTH}
const ADL_APP_PROFILE_PROPERTY_LENGTH = 64;
{$EXTERNALSYM ADL_APP_PROFILE_PROPERTY_LENGTH}

const ADL_PX40_MRU	= 0;
const ADL_PX40_MISSED	= 1;
const ADL_PX40_DISCRETE	= 2;
const ADL_PX40_INTEGRATED	= 3;
const ADL_PX40_TOTAL	= 4;

type
	ApplicationListType = ADL_PX40_MRU..ADL_PX40_TOTAL;
	{$EXTERNALSYM ApplicationListType}
	

const ADL_PROFILEPROPERTY_TYPE_BINARY		= 0;
const ADL_PROFILEPROPERTY_TYPE_BOOLEAN	= 1;
const ADL_PROFILEPROPERTY_TYPE_DWORD	= 2;
const ADL_PROFILEPROPERTY_TYPE_QWORD	= 3;
const ADL_PROFILEPROPERTY_TYPE_ENUMERATED	= 4;
const ADL_PROFILEPROPERTY_TYPE_STRING	= 5;

type
	ADLProfilePropertyType = ADL_PROFILEPROPERTY_TYPE_BINARY..ADL_PROFILEPROPERTY_TYPE_STRING;
	{$EXTERNALSYM ADLProfilePropertyType}
	


// @}

///\defgroup define_dp12 For Display Port 1.2
// @{

/// Maximum Relative Address Link
const ADL_MAX_RAD_LINK_COUNT = 15;
{$EXTERNALSYM ADL_MAX_RAD_LINK_COUNT}

// @}

///\defgroup defines_gamutspace Driver Supported Gamut Space
// @{

/// The flags desribes that gamut is related to source or to destination and to overlay or to graphics
const ADL_GAMUT_REFERENCE_SOURCE = (1 shl 0);
{$EXTERNALSYM ADL_GAMUT_REFERENCE_SOURCE}
const ADL_GAMUT_GAMUT_VIDEO_CONTENT = (1 shl 1);
{$EXTERNALSYM ADL_GAMUT_GAMUT_VIDEO_CONTENT}

/// The flags are used to describe the source of gamut and how read information from struct ADLGamutData
const ADL_CUSTOM_WHITE_POINT = (1 shl 0);
{$EXTERNALSYM ADL_CUSTOM_WHITE_POINT}
const ADL_CUSTOM_GAMUT = (1 shl 1);
{$EXTERNALSYM ADL_CUSTOM_GAMUT}

/// The define means the predefined gamut values  .
///Driver uses to find entry in the table and apply appropriate gamut space.
const ADL_GAMUT_SPACE_CCIR_709 = (1 shl 0);
{$EXTERNALSYM ADL_GAMUT_SPACE_CCIR_709}
const ADL_GAMUT_SPACE_CCIR_601 = (1 shl 1);
{$EXTERNALSYM ADL_GAMUT_SPACE_CCIR_601}
const ADL_GAMUT_SPACE_ADOBE_RGB = (1 shl 2);
{$EXTERNALSYM ADL_GAMUT_SPACE_ADOBE_RGB}
const ADL_GAMUT_SPACE_CIE_RGB = (1 shl 3);
{$EXTERNALSYM ADL_GAMUT_SPACE_CIE_RGB}
const ADL_GAMUT_SPACE_CUSTOM = (1 shl 4);
{$EXTERNALSYM ADL_GAMUT_SPACE_CUSTOM}

/// Predefine white point values are structed similar to gamut .
const ADL_WHITE_POINT_5000K = (1 shl 0);
{$EXTERNALSYM ADL_WHITE_POINT_5000K}
const ADL_WHITE_POINT_6500K = (1 shl 1);
{$EXTERNALSYM ADL_WHITE_POINT_6500K}
const ADL_WHITE_POINT_7500K = (1 shl 2);
{$EXTERNALSYM ADL_WHITE_POINT_7500K}
const ADL_WHITE_POINT_9300K = (1 shl 3);
{$EXTERNALSYM ADL_WHITE_POINT_9300K}
const ADL_WHITE_POINT_CUSTOM = (1 shl 4);
{$EXTERNALSYM ADL_WHITE_POINT_CUSTOM}

///gamut and white point coordinates are from 0.0 -1.0 and divider is used to find the real value .
/// X float = X int /divider
const ADL_GAMUT_WHITEPOINT_DIVIDER = 10000;
{$EXTERNALSYM ADL_GAMUT_WHITEPOINT_DIVIDER}

///gamma a0 coefficient uses the following divider:
const ADL_REGAMMA_COEFFICIENT_A0_DIVIDER = 10000000;
{$EXTERNALSYM ADL_REGAMMA_COEFFICIENT_A0_DIVIDER}
///gamma a1 ,a2,a3 coefficients use the following divider:
const ADL_REGAMMA_COEFFICIENT_A1A2A3_DIVIDER = 1000;
{$EXTERNALSYM ADL_REGAMMA_COEFFICIENT_A1A2A3_DIVIDER}

///describes whether the coefficients are from EDID or custom user values.
const ADL_EDID_REGAMMA_COEFFICIENTS = (1 shl 0);
{$EXTERNALSYM ADL_EDID_REGAMMA_COEFFICIENTS}
///Used for struct ADLRegamma. Feature if set use gamma ramp, if missing use regamma coefficents
const ADL_USE_GAMMA_RAMP = (1 shl 4);
{$EXTERNALSYM ADL_USE_GAMMA_RAMP}
///Used for struct ADLRegamma. If the gamma ramp flag is used then the driver could apply de gamma corretion to the supplied curve and this depends on this flag
const ADL_APPLY_DEGAMMA = (1 shl 5);
{$EXTERNALSYM ADL_APPLY_DEGAMMA}

// @}

/// \defgroup define_ddcinfo_pixelformats DDCInfo Pixel Formats
// @{
/// defines for iPanelPixelFormat  in struct ADLDDCInfo2
const ADL_DISPLAY_DDCINFO_PIXEL_FORMAT_RGB656 = LongInt($00000001);
{$EXTERNALSYM ADL_DISPLAY_DDCINFO_PIXEL_FORMAT_RGB656}
const ADL_DISPLAY_DDCINFO_PIXEL_FORMAT_RGB666 = LongInt($00000002);
{$EXTERNALSYM ADL_DISPLAY_DDCINFO_PIXEL_FORMAT_RGB666}
const ADL_DISPLAY_DDCINFO_PIXEL_FORMAT_RGB888 = LongInt($00000004);
{$EXTERNALSYM ADL_DISPLAY_DDCINFO_PIXEL_FORMAT_RGB888}
const ADL_DISPLAY_DDCINFO_PIXEL_FORMAT_RGB101010 = LongInt($00000008);
{$EXTERNALSYM ADL_DISPLAY_DDCINFO_PIXEL_FORMAT_RGB101010}
const ADL_DISPLAY_DDCINFO_PIXEL_FORMAT_RGB161616 = LongInt($00000010);
{$EXTERNALSYM ADL_DISPLAY_DDCINFO_PIXEL_FORMAT_RGB161616}
const ADL_DISPLAY_DDCINFO_PIXEL_FORMAT_RGB_RESERVED1 = LongInt($00000020);
{$EXTERNALSYM ADL_DISPLAY_DDCINFO_PIXEL_FORMAT_RGB_RESERVED1}
const ADL_DISPLAY_DDCINFO_PIXEL_FORMAT_RGB_RESERVED2 = LongInt($00000040);
{$EXTERNALSYM ADL_DISPLAY_DDCINFO_PIXEL_FORMAT_RGB_RESERVED2}
const ADL_DISPLAY_DDCINFO_PIXEL_FORMAT_RGB_RESERVED3 = LongInt($00000080);
{$EXTERNALSYM ADL_DISPLAY_DDCINFO_PIXEL_FORMAT_RGB_RESERVED3}
const ADL_DISPLAY_DDCINFO_PIXEL_FORMAT_XRGB_BIAS101010 = LongInt($00000100);
{$EXTERNALSYM ADL_DISPLAY_DDCINFO_PIXEL_FORMAT_XRGB_BIAS101010}
const ADL_DISPLAY_DDCINFO_PIXEL_FORMAT_YCBCR444_8BPCC = LongInt($00000200);
{$EXTERNALSYM ADL_DISPLAY_DDCINFO_PIXEL_FORMAT_YCBCR444_8BPCC}
const ADL_DISPLAY_DDCINFO_PIXEL_FORMAT_YCBCR444_10BPCC = LongInt($00000400);
{$EXTERNALSYM ADL_DISPLAY_DDCINFO_PIXEL_FORMAT_YCBCR444_10BPCC}
const ADL_DISPLAY_DDCINFO_PIXEL_FORMAT_YCBCR444_12BPCC = LongInt($00000800);
{$EXTERNALSYM ADL_DISPLAY_DDCINFO_PIXEL_FORMAT_YCBCR444_12BPCC}
const ADL_DISPLAY_DDCINFO_PIXEL_FORMAT_YCBCR422_8BPCC = LongInt($00001000);
{$EXTERNALSYM ADL_DISPLAY_DDCINFO_PIXEL_FORMAT_YCBCR422_8BPCC}
const ADL_DISPLAY_DDCINFO_PIXEL_FORMAT_YCBCR422_10BPCC = LongInt($00002000);
{$EXTERNALSYM ADL_DISPLAY_DDCINFO_PIXEL_FORMAT_YCBCR422_10BPCC}
const ADL_DISPLAY_DDCINFO_PIXEL_FORMAT_YCBCR422_12BPCC = LongInt($00004000);
{$EXTERNALSYM ADL_DISPLAY_DDCINFO_PIXEL_FORMAT_YCBCR422_12BPCC}
// @}



/// \defgroup define_dbd_state Deep Bit Depth
// @{

/// defines for ADL_Workstation_DeepBitDepth_Get and  ADL_Workstation_DeepBitDepth_Set functions
// This value indicates that the deep bit depth state is forced off
const ADL_DEEPBITDEPTH_FORCEOFF = 0;
{$EXTERNALSYM ADL_DEEPBITDEPTH_FORCEOFF}
/// This value indicates that the deep bit depth state  is set to auto, the driver will automatically enable the 
/// appropriate deep bit depth state depending on what connected display supports.
const ADL_DEEPBITDEPTH_10BPP_AUTO = 1;
{$EXTERNALSYM ADL_DEEPBITDEPTH_10BPP_AUTO}
/// This value indicates that the deep bit depth state  is forced on to 10 bits per pixel, this is regardless if the display 
/// supports 10 bpp.
const ADL_DEEPBITDEPTH_10BPP_FORCEON = 2;
{$EXTERNALSYM ADL_DEEPBITDEPTH_10BPP_FORCEON}

/// defines for ADLAdapterConfigMemory of ADL_Adapter_ConfigMemory_Get
/// If this bit is set, it indicates that the Deep Bit Depth pixel is set on the display
const ADL_ADAPTER_CONFIGMEMORY_DBD = (1 shl 0);
{$EXTERNALSYM ADL_ADAPTER_CONFIGMEMORY_DBD}
/// If this bit is set, it indicates that the display is rotated (90, 180 or 270)
const ADL_ADAPTER_CONFIGMEMORY_ROTATE = (1 shl 1);
{$EXTERNALSYM ADL_ADAPTER_CONFIGMEMORY_ROTATE}
/// If this bit is set, it indicates that passive stereo is set on the display
const ADL_ADAPTER_CONFIGMEMORY_STEREO_PASSIVE = (1 shl 2);
{$EXTERNALSYM ADL_ADAPTER_CONFIGMEMORY_STEREO_PASSIVE}
/// If this bit is set, it indicates that the active stereo is set on the display
const ADL_ADAPTER_CONFIGMEMORY_STEREO_ACTIVE = (1 shl 3);
{$EXTERNALSYM ADL_ADAPTER_CONFIGMEMORY_STEREO_ACTIVE}
/// If this bit is set, it indicates that the tear free vsync is set on the display
const ADL_ADAPTER_CONFIGMEMORY_ENHANCEDVSYNC = (1 shl 4);
{$EXTERNALSYM ADL_ADAPTER_CONFIGMEMORY_ENHANCEDVSYNC}
const ADL_ADAPTER_CONFIGMEMORY_TEARFREEVSYNC = (1 shl 4);
{$EXTERNALSYM ADL_ADAPTER_CONFIGMEMORY_TEARFREEVSYNC}
/// @}

/// \defgroup define_adl_validmemoryrequiredfields Memory Type
/// @{

///  This group defines memory types in ADLMemoryRequired struct \n
/// Indicates that this is the visible memory
const ADL_MEMORYREQTYPE_VISIBLE = (1 shl 0);
{$EXTERNALSYM ADL_MEMORYREQTYPE_VISIBLE}
/// Indicates that this is the invisible memory.
const ADL_MEMORYREQTYPE_INVISIBLE = (1 shl 1);
{$EXTERNALSYM ADL_MEMORYREQTYPE_INVISIBLE}
/// Indicates that this is amount of visible memory per GPU that should be reserved for all other allocations.
const ADL_MEMORYREQTYPE_GPURESERVEDVISIBLE = (1 shl 2);
{$EXTERNALSYM ADL_MEMORYREQTYPE_GPURESERVEDVISIBLE}
/// @}

/// \defgroup define_adapter_tear_free_status
/// Used in ADL_Adapter_TEAR_FREE_Set and ADL_Adapter_TFD_Get functions to indicate the tear free
/// desktop status.
/// @{
/// Tear free desktop is enabled.
const ADL_ADAPTER_TEAR_FREE_ON = 1;
{$EXTERNALSYM ADL_ADAPTER_TEAR_FREE_ON}
/// Tear free desktop can't be enabled due to a lack of graphic adapter memory.
const ADL_ADAPTER_TEAR_FREE_NOTENOUGHMEM = -1;
{$EXTERNALSYM ADL_ADAPTER_TEAR_FREE_NOTENOUGHMEM}
/// Tear free desktop can't be enabled due to quad buffer stereo being enabled.
const ADL_ADAPTER_TEAR_FREE_OFF_ERR_QUADBUFFERSTEREO = -2;
{$EXTERNALSYM ADL_ADAPTER_TEAR_FREE_OFF_ERR_QUADBUFFERSTEREO}
/// Tear free desktop can't be enabled due to MGPU-SLS being enabled.
const ADL_ADAPTER_TEAR_FREE_OFF_ERR_MGPUSLD = -3;
{$EXTERNALSYM ADL_ADAPTER_TEAR_FREE_OFF_ERR_MGPUSLD}
/// Tear free desktop is disabled.
const ADL_ADAPTER_TEAR_FREE_OFF = 0;
{$EXTERNALSYM ADL_ADAPTER_TEAR_FREE_OFF}
/// @}

/// \defgroup define_adapter_crossdisplay_platforminfo
/// Used in ADL_Adapter_CrossDisplayPlatformInfo_Get function to indicate the Crossdisplay platform info.
/// @{
/// CROSSDISPLAY platform.
const ADL_CROSSDISPLAY_PLATFORM = (1 shl 0);
{$EXTERNALSYM ADL_CROSSDISPLAY_PLATFORM}
/// CROSSDISPLAY platform for Lasso station.
const ADL_CROSSDISPLAY_PLATFORM_LASSO = (1 shl 1);
{$EXTERNALSYM ADL_CROSSDISPLAY_PLATFORM_LASSO}
/// CROSSDISPLAY platform for docking station.
const ADL_CROSSDISPLAY_PLATFORM_DOCKSTATION = (1 shl 2);
{$EXTERNALSYM ADL_CROSSDISPLAY_PLATFORM_DOCKSTATION}
/// @}

/// \defgroup define_adapter_crossdisplay_option
/// Used in ADL_Adapter_CrossdisplayInfoX2_Set function to indicate cross display options.
/// @{
/// Checking if 3D application is runnning. If yes, not to do switch, return ADL_OK_WAIT; otherwise do switch.
const ADL_CROSSDISPLAY_OPTION_NONE = 0;
{$EXTERNALSYM ADL_CROSSDISPLAY_OPTION_NONE}
/// Force switching without checking for running 3D applications
const ADL_CROSSDISPLAY_OPTION_FORCESWITCH = (1 shl 0);
{$EXTERNALSYM ADL_CROSSDISPLAY_OPTION_FORCESWITCH}
/// @}

/// \defgroup define_adapter_states Adapter Capabilities
/// These defines the capabilities supported by an adapter. It is used by \ref ADL_Adapter_ConfigureState_Get
/// @{
/// Indicates that the adapter is headless (i.e. no displays can be connected to it)
const ADL_ADAPTERCONFIGSTATE_HEADLESS = ( 1 shl 2 );
{$EXTERNALSYM ADL_ADAPTERCONFIGSTATE_HEADLESS}
/// Indicates that the adapter is configured to define the main rendering capabilities. For example, adapters
/// in Crossfire(TM) configuration, this bit would only be set on the adapter driving the display(s).
const ADL_ADAPTERCONFIGSTATE_REQUISITE_RENDER = ( 1 shl 0 );
{$EXTERNALSYM ADL_ADAPTERCONFIGSTATE_REQUISITE_RENDER}
/// Indicates that the adapter is configured to be used to unload some of the rendering work for a particular
/// requisite rendering adapter. For eample, for adapters in a Crossfire configuration, this bit would be set
/// on all adapters that are currently not driving the display(s)
const ADL_ADAPTERCONFIGSTATE_ANCILLARY_RENDER = ( 1 shl 1 );
{$EXTERNALSYM ADL_ADAPTERCONFIGSTATE_ANCILLARY_RENDER}
/// @}

/// \defgroup define_controllermode_ulModifiers 
/// These defines the detailed actions supported by set viewport. It is used by \ref ADL_Display_ViewPort_Set
/// @{
/// Indicate that the viewport set will change the view position
const ADL_CONTROLLERMODE_CM_MODIFIER_VIEW_POSITION = $00000001;
{$EXTERNALSYM ADL_CONTROLLERMODE_CM_MODIFIER_VIEW_POSITION}
/// Indicate that the viewport set will change the view PanLock
const ADL_CONTROLLERMODE_CM_MODIFIER_VIEW_PANLOCK = $00000002;
{$EXTERNALSYM ADL_CONTROLLERMODE_CM_MODIFIER_VIEW_PANLOCK}
/// Indicate that the viewport set will change the view size
const ADL_CONTROLLERMODE_CM_MODIFIER_VIEW_SIZE = $00000008;
{$EXTERNALSYM ADL_CONTROLLERMODE_CM_MODIFIER_VIEW_SIZE}
/// @}

/// \defgroup defines for Mirabilis
/// These defines are used for the Mirabilis feature
/// @{
///
/// Indicates the maximum number of audio sample rates
const ADL_MAX_AUDIO_SAMPLE_RATE_COUNT = 16;
{$EXTERNALSYM ADL_MAX_AUDIO_SAMPLE_RATE_COUNT}
/// @}

///////////////////////////////////////////////////////////////////////////
// ADLMultiChannelSplitStateFlag Enumeration
///////////////////////////////////////////////////////////////////////////
const ADLMultiChannelSplit_Unitialized = 0;
const ADLMultiChannelSplit_Disabled    = 1;
const ADLMultiChannelSplit_Enabled     = 2;
const ADLMultiChannelSplit_SaveProfile = 3;

type
	ADLMultiChannelSplitStateFlag = ADLMultiChannelSplit_Unitialized..ADLMultiChannelSplit_SaveProfile;
	{$EXTERNALSYM ADLMultiChannelSplitStateFlag}
	

///////////////////////////////////////////////////////////////////////////
// ADLSampleRate Enumeration
///////////////////////////////////////////////////////////////////////////
const ADLSampleRate_32KHz =0;
const ADLSampleRate_44P1KHz	= 0;
const ADLSampleRate_48KHz	= 1;
const ADLSampleRate_88P2KHz	= 2;
const ADLSampleRate_96KHz	= 3;
const ADLSampleRate_176P4KHz	= 4;
const ADLSampleRate_192KHz	= 5;
const ADLSampleRate_384KHz	= 6; //DP1.2
const ADLSampleRate_768KHz	= 7; //DP1.2
const ADLSampleRate_Undefined	= 8;

type
	ADLSampleRate = ADLSampleRate_32KHz..ADLSampleRate_Undefined;
	{$EXTERNALSYM ADLSampleRate}
	

/// \defgroup define_overdrive6_capabilities 
/// These defines the capabilities supported by Overdrive 6. It is used by \ref ADL_Overdrive6_Capabilities_Get
// @{
/// Indicate that core (engine) clock can be changed.
const ADL_OD6_CAPABILITY_SCLK_CUSTOMIZATION = $00000001;
{$EXTERNALSYM ADL_OD6_CAPABILITY_SCLK_CUSTOMIZATION}
/// Indicate that memory clock can be changed.
const ADL_OD6_CAPABILITY_MCLK_CUSTOMIZATION = $00000002;
{$EXTERNALSYM ADL_OD6_CAPABILITY_MCLK_CUSTOMIZATION}
/// Indicate that graphics activity reporting is supported.
const ADL_OD6_CAPABILITY_GPU_ACTIVITY_MONITOR = $00000004;
{$EXTERNALSYM ADL_OD6_CAPABILITY_GPU_ACTIVITY_MONITOR}
/// Indicate that power limit can be customized.
const ADL_OD6_CAPABILITY_POWER_CONTROL = $00000008;
{$EXTERNALSYM ADL_OD6_CAPABILITY_POWER_CONTROL}
/// Indicate that SVI2 Voltage Control is supported.
const ADL_OD6_CAPABILITY_VOLTAGE_CONTROL = $00000010;
{$EXTERNALSYM ADL_OD6_CAPABILITY_VOLTAGE_CONTROL}
/// Indicate that OD6+ percentage adjustment is supported.
const ADL_OD6_CAPABILITY_PERCENT_ADJUSTMENT = $00000020;
{$EXTERNALSYM ADL_OD6_CAPABILITY_PERCENT_ADJUSTMENT}
/// Indicate that Thermal Limit Unlock is supported.
const ADL_OD6_CAPABILITY_THERMAL_LIMIT_UNLOCK = $00000040;
{$EXTERNALSYM ADL_OD6_CAPABILITY_THERMAL_LIMIT_UNLOCK}
// @}

/// \defgroup define_overdrive6_supported_states 
/// These defines the power states supported by Overdrive 6. It is used by \ref ADL_Overdrive6_Capabilities_Get
// @{
/// Indicate that overdrive is supported in the performance state.  This is currently the only state supported.
const ADL_OD6_SUPPORTEDSTATE_PERFORMANCE = $00000001;
{$EXTERNALSYM ADL_OD6_SUPPORTEDSTATE_PERFORMANCE}
/// Do not use.  Reserved for future use.
const ADL_OD6_SUPPORTEDSTATE_POWER_SAVING = $00000002;
{$EXTERNALSYM ADL_OD6_SUPPORTEDSTATE_POWER_SAVING}
// @}

/// \defgroup define_overdrive6_getstateinfo 
/// These defines the power states to get information about. It is used by \ref ADL_Overdrive6_StateInfo_Get
// @{
/// Get default clocks for the performance state.
const ADL_OD6_GETSTATEINFO_DEFAULT_PERFORMANCE = $00000001;
{$EXTERNALSYM ADL_OD6_GETSTATEINFO_DEFAULT_PERFORMANCE}
/// Do not use.  Reserved for future use.
const ADL_OD6_GETSTATEINFO_DEFAULT_POWER_SAVING = $00000002;
{$EXTERNALSYM ADL_OD6_GETSTATEINFO_DEFAULT_POWER_SAVING}
/// Get clocks for current state.  Currently this is the same as \ref ADL_OD6_GETSTATEINFO_CUSTOM_PERFORMANCE
/// since only performance state is supported.
const ADL_OD6_GETSTATEINFO_CURRENT = $00000003;
{$EXTERNALSYM ADL_OD6_GETSTATEINFO_CURRENT}
/// Get the modified clocks (if any) for the performance state.  If clocks were not modified
/// through Overdrive 6, then this will return the same clocks as \ref ADL_OD6_GETSTATEINFO_DEFAULT_PERFORMANCE.
const ADL_OD6_GETSTATEINFO_CUSTOM_PERFORMANCE = $00000004;
{$EXTERNALSYM ADL_OD6_GETSTATEINFO_CUSTOM_PERFORMANCE}
/// Do not use.  Reserved for future use.
const ADL_OD6_GETSTATEINFO_CUSTOM_POWER_SAVING = $00000005;
{$EXTERNALSYM ADL_OD6_GETSTATEINFO_CUSTOM_POWER_SAVING}
// @}

/// \defgroup define_overdrive6_getstate and define_overdrive6_getmaxclockadjust
/// These defines the power states to get information about. It is used by \ref ADL_Overdrive6_StateEx_Get and \ref ADL_Overdrive6_MaxClockAdjust_Get
// @{
/// Get default clocks for the performance state.  Only performance state is currently supported.
const ADL_OD6_STATE_PERFORMANCE = $00000001;
{$EXTERNALSYM ADL_OD6_STATE_PERFORMANCE}
// @}

/// \defgroup define_overdrive6_setstate 
/// These define which power state to set customized clocks on. It is used by \ref ADL_Overdrive6_State_Set
// @{
/// Set customized clocks for the performance state.
const ADL_OD6_SETSTATE_PERFORMANCE = $00000001;
{$EXTERNALSYM ADL_OD6_SETSTATE_PERFORMANCE}
/// Do not use.  Reserved for future use.
const ADL_OD6_SETSTATE_POWER_SAVING = $00000002;
{$EXTERNALSYM ADL_OD6_SETSTATE_POWER_SAVING}
// @}

/// \defgroup define_overdrive6_thermalcontroller_caps 
/// These defines the capabilities of the GPU thermal controller. It is used by \ref ADL_Overdrive6_ThermalController_Caps
// @{
/// GPU thermal controller is supported.
const ADL_OD6_TCCAPS_THERMAL_CONTROLLER = $00000001;
{$EXTERNALSYM ADL_OD6_TCCAPS_THERMAL_CONTROLLER}
/// GPU fan speed control is supported.
const ADL_OD6_TCCAPS_FANSPEED_CONTROL = $00000002;
{$EXTERNALSYM ADL_OD6_TCCAPS_FANSPEED_CONTROL}
/// Fan speed percentage can be read.
const ADL_OD6_TCCAPS_FANSPEED_PERCENT_READ = $00000100;
{$EXTERNALSYM ADL_OD6_TCCAPS_FANSPEED_PERCENT_READ}
/// Fan speed can be set by specifying a percentage value.
const ADL_OD6_TCCAPS_FANSPEED_PERCENT_WRITE = $00000200;
{$EXTERNALSYM ADL_OD6_TCCAPS_FANSPEED_PERCENT_WRITE}
/// Fan speed RPM (revolutions-per-minute) can be read.
const ADL_OD6_TCCAPS_FANSPEED_RPM_READ = $00000400;
{$EXTERNALSYM ADL_OD6_TCCAPS_FANSPEED_RPM_READ}
/// Fan speed can be set by specifying an RPM value.
const ADL_OD6_TCCAPS_FANSPEED_RPM_WRITE = $00000800;
{$EXTERNALSYM ADL_OD6_TCCAPS_FANSPEED_RPM_WRITE}
// @}

/// \defgroup define_overdrive6_fanspeed_type 
/// These defines the fan speed type being reported. It is used by \ref ADL_Overdrive6_FanSpeed_Get
// @{
/// Fan speed reported in percentage.
const ADL_OD6_FANSPEED_TYPE_PERCENT = $00000001;
{$EXTERNALSYM ADL_OD6_FANSPEED_TYPE_PERCENT}
/// Fan speed reported in RPM.
const ADL_OD6_FANSPEED_TYPE_RPM = $00000002;
{$EXTERNALSYM ADL_OD6_FANSPEED_TYPE_RPM}
/// Fan speed has been customized by the user, and fan is not running in automatic mode.
const ADL_OD6_FANSPEED_USER_DEFINED = $00000100;
{$EXTERNALSYM ADL_OD6_FANSPEED_USER_DEFINED}
// @}

/// \defgroup define_ecc_mode_states 
/// These defines the ECC(Error Correction Code) state. It is used by \ref ADL_Workstation_ECC_Get,ADL_Workstation_ECC_Set
// @{
/// Error Correction is disabled.
const ECC_MODE_OFF = 0;
{$EXTERNALSYM ECC_MODE_OFF}
/// Error Correction is enabled.
const ECC_MODE_ON = 2;
{$EXTERNALSYM ECC_MODE_ON}
// @}

// End Bracket for Constants and Definitions. Add new groups ABOVE this line!

// @}

implementation

end.
