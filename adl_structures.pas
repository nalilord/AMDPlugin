unit adl_structures;

interface

uses
	adl_defines;

///
///  Copyright (c) 2008 - 2013 Advanced Micro Devices, Inc.

///  THIS CODE AND INFORMATION IS PROVIDED "AS IS" WITHOUT WARRANTY OF ANY KIND,
///  EITHER EXPRESSED OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE IMPLIED
///  WARRANTIES OF MERCHANTABILITY AND/OR FITNESS FOR A PARTICULAR PURPOSE.

/// \file adl_structures.h
///\brief This file contains the structure declarations that are used by the public ADL interfaces for \ALL platforms.\n <b>Included in ADL SDK</b>
///
/// All data structures used in AMD Display Library (ADL) public interfaces should be defined in this header file.
///

/////////////////////////////////////////////////////////////////////////////////////////////
///\brief Structure containing information about the graphics adapter.
///
/// This structure is used to store various information about the graphics adapter.  This 
/// information can be returned to the user. Alternatively, it can be used to access various driver calls to set
/// or fetch various settings upon the user's request.
/// \nosubgrouping
////////////////////////////////////////////////////////////////////////////////////////////
type  	
	AdapterInfo = record
/// \ALL_STRUCT_MEM
/// Size of the structure.
		iSize: Integer;	
/// The ADL index handle. One GPU may be associated with one or two index handles
		iAdapterIndex: Integer;	
/// The unique device ID associated with this adapter.
		strUDID : array[0..ADL_MAX_PATH-1] of AnsiChar;
/// The BUS number associated with this adapter.
		iBusNumber: Integer;	
/// The driver number associated with this adapter.
		iDeviceNumber: Integer;	
/// The function number.
		iFunctionNumber: Integer;	
/// The vendor ID associated with this adapter.
		iVendorID: Integer;	
/// Adapter name.
		strAdapterName : array[0..ADL_MAX_PATH-1] of AnsiChar;
/// Display name. For example, "\\Display0" for Windows or ":0:0" for Linux.
		strDisplayName : array[0..ADL_MAX_PATH-1] of AnsiChar;
		/// Present or not; 1 if present and 0 if not present.It the logical adapter is present, the display name such as \\.\Display1 can be found from OS
		iPresent: Integer;
// @}
//{$if Defined(_WIN32)) and (_WIN32) defined or defined (_WIN64)}
/// \WIN_STRUCT_MEM
		/// Exist or not; 1 is exist and 0 is not present.
		iExist: Integer;
/// Driver registry path.
		strDriverPath : array[0..ADL_MAX_PATH-1] of AnsiChar;
/// Driver registry path Ext for.
		strDriverPathExt : array[0..ADL_MAX_PATH-1] of AnsiChar;
/// PNP string from Windows.
		strPNPString : array[0..ADL_MAX_PATH-1] of AnsiChar;
/// It is generated from EnumDisplayDevices.
		iOSDisplayIndex: Integer;
// @}
//{$endif}	(* (_WIN32) || (_WIN64) *)
//{$ifdef LINUX}
///// \LNX_STRUCT_MEM
///// Internal X screen number from GPUMapInfo (DEPRICATED use XScreenInfo)
//		iXScreenNum: Integer;
///// Internal driver index from GPUMapInfo
//		iDrvIndex: Integer;
///// \deprecated Internal x config file screen identifier name. Use XScreenInfo instead.
//		strXScreenConfigName : array[0..ADL_MAX_PATH-1] of AnsiChar;
//// @}
//{$endif}	(* (LINUX) *)
	end;
	TAdapterInfo = AdapterInfo;
	{$EXTERNALSYM TAdapterInfo}
	PAdapterInfo = ^TAdapterInfo;
	{$EXTERNALSYM PAdapterInfo}


/////////////////////////////////////////////////////////////////////////////////////////////
///\brief Structure containing information about the Linux X screen information.
///
/// This structure is used to store the current screen number and xorg.conf ID name assoicated with an adapter index.
/// This structure is updated during ADL_Main_Control_Refresh or ADL_ScreenInfo_Update.
/// Note:  This structure should be used in place of iXScreenNum and strXScreenConfigName in AdapterInfo as they will be
/// deprecated.
/// \nosubgrouping
////////////////////////////////////////////////////////////////////////////////////////////
//{$ifdef LINUX}
//type
//	XScreenInfo = record
///// Internal X screen number from GPUMapInfo.
//		iXScreenNum: Integer;
///// Internal x config file screen identifier name.
//		strXScreenConfigName : array[0..ADL_MAX_PATH-1] of AnsiChar;
//	end;
//	TXScreenInfo = XScreenInfo;
//	{$EXTERNALSYM TXScreenInfo}
//	LPXScreenInfo = ^XScreenInfo;
//	{$EXTERNALSYM LPXScreenInfo}
//
//{$endif}	(* (LINUX) *)


/////////////////////////////////////////////////////////////////////////////////////////////
///\brief Structure containing information about the ASIC memory.
///
/// This structure is used to store various information about the ASIC memory.  This 
/// information can be returned to the user.
/// \nosubgrouping
////////////////////////////////////////////////////////////////////////////////////////////
type  	
	ADLMemoryInfo = record 
/// Memory size in bytes.
		iMemorySize: Int64;		
/// Memory type in string.
		strMemoryType : array[0..ADL_MAX_PATH-1] of AnsiChar;
/// Memory bandwidth in Mbytes/s.
		iMemoryBandwidth: Int64;	
	end;
	TADLMemoryInfo = ADLMemoryInfo;
	{$EXTERNALSYM TADLMemoryInfo}
	LPADLMemoryInfo = ^ADLMemoryInfo;
	{$EXTERNALSYM LPADLMemoryInfo}


/////////////////////////////////////////////////////////////////////////////////////////////
///\brief Structure containing information about memory required by type
///
/// This structure is returned by ADL_Adapter_ConfigMemory_Get, which given a desktop and display configuration
/// will return the Memory used.
/// \nosubgrouping
////////////////////////////////////////////////////////////////////////////////////////////
type  	
	ADLMemoryRequired = record 
		iMemoryReq: Int64;			/// Memory in bytes required
		iType: Integer;						/// cType of Memory \ref define_adl_validmemoryrequiredfields
		iDisplayFeatureValue: Integer;	   /// Display features \ref define_adl_visiblememoryfeatures that are using this type of memory
	end;
	TADLMemoryRequired = ADLMemoryRequired;
	{$EXTERNALSYM TADLMemoryRequired}
	LPADLMemoryRequired = ^ADLMemoryRequired;
	{$EXTERNALSYM LPADLMemoryRequired}


/////////////////////////////////////////////////////////////////////////////////////////////
///\brief Structure containing information about the features associated with a display
///
/// This structure is a parameter to ADL_Adapter_ConfigMemory_Get, which given a desktop and display configuration
/// will return the Memory used.
/// \nosubgrouping
////////////////////////////////////////////////////////////////////////////////////////////
type  	
	ADLMemoryDisplayFeatures = record 
		iDisplayIndex: Integer;				/// ADL Display index
		iDisplayFeatureValue: Integer;		/// features that the display is using \ref define_adl_visiblememoryfeatures
	end;
	TADLMemoryDisplayFeatures = ADLMemoryDisplayFeatures;
	{$EXTERNALSYM TADLMemoryDisplayFeatures}
	LPADLMemoryDisplayFeatures = ^ADLMemoryDisplayFeatures;
	{$EXTERNALSYM LPADLMemoryDisplayFeatures}


/////////////////////////////////////////////////////////////////////////////////////////////
///\brief Structure containing DDC information.
///
/// This structure is used to store various DDC information that can be returned to the user.
/// Note that all fields of type int are actually defined as unsigned int types within the driver.
/// \nosubgrouping
////////////////////////////////////////////////////////////////////////////////////////////
type  	
	ADLDDCInfo = record 
/// Size of the structure
		ulSize: Integer;	
/// Indicates whether the attached display supports DDC. If this field is zero on return, no other DDC information fields will be used.
		ulSupportsDDC: Integer;	
/// Returns the manufacturer ID of the display device. Should be zeroed if this information is not available.
		ulManufacturerID: Integer;	
/// Returns the product ID of the display device. Should be zeroed if this information is not available.
		ulProductID: Integer;	
/// Returns the name of the display device. Should be zeroed if this information is not available.
		cDisplayName : array[0..ADL_MAX_DISPLAY_NAME-1] of AnsiChar;
/// Returns the maximum Horizontal supported resolution. Should be zeroed if this information is not available.
		ulMaxHResolution: Integer;	
/// Returns the maximum Vertical supported resolution. Should be zeroed if this information is not available.
		ulMaxVResolution: Integer;	
/// Returns the maximum supported refresh rate. Should be zeroed if this information is not available.
		ulMaxRefresh: Integer;	
/// Returns the display device preferred timing mode's horizontal resolution.
		ulPTMCx: Integer;	
/// Returns the display device preferred timing mode's vertical resolution.
		ulPTMCy: Integer;	
/// Returns the display device preferred timing mode's refresh rate.
		ulPTMRefreshRate: Integer;	
/// Return EDID flags.
		ulDDCInfoFlag: Integer;	
	end;
	TADLDDCInfo = ADLDDCInfo;
	{$EXTERNALSYM TADLDDCInfo}
	LPADLDDCInfo = ^ADLDDCInfo;
	{$EXTERNALSYM LPADLDDCInfo}


/////////////////////////////////////////////////////////////////////////////////////////////
///\brief Structure containing DDC information.
///
/// This structure is used to store various DDC information that can be returned to the user.
/// Note that all fields of type int are actually defined as unsigned int types within the driver.
/// \nosubgrouping
////////////////////////////////////////////////////////////////////////////////////////////
type  	
	ADLDDCInfo2 = record 
/// Size of the structure
		ulSize: Integer;	
/// Indicates whether the attached display supports DDC. If this field is zero on return, no other DDC 
/// information fields will be used.
		ulSupportsDDC: Integer;	
/// Returns the manufacturer ID of the display device. Should be zeroed if this information is not available.
		ulManufacturerID: Integer;	
/// Returns the product ID of the display device. Should be zeroed if this information is not available.
		ulProductID: Integer;	
/// Returns the name of the display device. Should be zeroed if this information is not available.
		cDisplayName : array[0..ADL_MAX_DISPLAY_NAME-1] of AnsiChar;
/// Returns the maximum Horizontal supported resolution. Should be zeroed if this information is not available.
		ulMaxHResolution: Integer;	
/// Returns the maximum Vertical supported resolution. Should be zeroed if this information is not available.
		ulMaxVResolution: Integer;	
/// Returns the maximum supported refresh rate. Should be zeroed if this information is not available.
		ulMaxRefresh: Integer;	
/// Returns the display device preferred timing mode's horizontal resolution.
		ulPTMCx: Integer;	
/// Returns the display device preferred timing mode's vertical resolution.
		ulPTMCy: Integer;	
/// Returns the display device preferred timing mode's refresh rate.
		ulPTMRefreshRate: Integer;	
/// Return EDID flags.
		ulDDCInfoFlag: Integer;	
// Returns 1 if the display supported packed pixel, 0 otherwise
		bPackedPixelSupported: Integer;	
// Returns the Pixel formats the display supports \ref define_ddcinfo_pixelformats
		iPanelPixelFormat: Integer;	
/// Return EDID serial ID.
		ulSerialID: Integer;	
// Reserved for future use
		iReserved : array[0..25] of Integer;
	end;
	TADLDDCInfo2 = ADLDDCInfo2;
	{$EXTERNALSYM TADLDDCInfo2}
	LPADLDDCInfo2 = ^ADLDDCInfo2;
	{$EXTERNALSYM LPADLDDCInfo2}


/////////////////////////////////////////////////////////////////////////////////////////////
///\brief Structure containing information controller Gamma settings.
///
/// This structure is used to store the red, green and blue color channel information for the.
/// controller gamma setting. This information is returned by ADL, and it can also be used to  
/// set the controller gamma setting.
/// \nosubgrouping
////////////////////////////////////////////////////////////////////////////////////////////
type  	
	ADLGamma = record 
/// Red color channel gamma value.
		fRed: Single;	
/// Green color channel gamma value.
		fGreen: Single;	
/// Blue color channel gamma value.
		fBlue: Single;	
	end;
	TADLGamma = ADLGamma;
	{$EXTERNALSYM TADLGamma}
	LPADLGamma = ^ADLGamma;
	{$EXTERNALSYM LPADLGamma}


/////////////////////////////////////////////////////////////////////////////////////////////
///\brief Structure containing information about component video custom modes.
///
/// This structure is used to store the component video custom mode.
/// \nosubgrouping
////////////////////////////////////////////////////////////////////////////////////////////
type  	
	ADLCustomMode = record 
/// Custom mode flags.  They are returned by the ADL driver.
		iFlags: Integer;	
/// Custom mode width.
		iModeWidth: Integer;	
/// Custom mode height.
		iModeHeight: Integer;	
/// Custom mode base width.
		iBaseModeWidth: Integer;	
/// Custom mode base height.
		iBaseModeHeight: Integer;	
/// Custom mode refresh rate.
		iRefreshRate: Integer;	
	end;
	TADLCustomMode = ADLCustomMode;
	{$EXTERNALSYM TADLCustomMode}
	LPADLCustomMode = ^ADLCustomMode;
	{$EXTERNALSYM LPADLCustomMode}


/////////////////////////////////////////////////////////////////////////////////////////////
///\brief Structure containing Clock information for OD5 calls.
///
/// This structure is used to retrieve clock information for OD5 calls.
/// \nosubgrouping
////////////////////////////////////////////////////////////////////////////////////////////
type  	
	ADLGetClocksOUT = record 
		ulHighCoreClock: LongInt;	
		ulHighMemoryClock: LongInt;	
		ulHighVddc: LongInt;	
		ulCoreMin: LongInt;	
		ulCoreMax: LongInt;	
		ulMemoryMin: LongInt;
		ulMemoryMax: LongInt;	
		ulActivityPercent: LongInt;	
		ulCurrentCoreClock: LongInt;	
		ulCurrentMemoryClock: LongInt;	
		ulReserved: LongInt;	
	end;
	TADLGetClocksOUT = ADLGetClocksOUT;
	{$EXTERNALSYM TADLGetClocksOUT}


/////////////////////////////////////////////////////////////////////////////////////////////
///\brief Structure containing HDTV information for display calls.
///
/// This structure is used to retrieve HDTV information information for display calls.
/// \nosubgrouping
////////////////////////////////////////////////////////////////////////////////////////////
type  	
	ADLDisplayConfig = record 
/// Size of the structure
		ulSize: LongInt;	
/// HDTV connector type.
		ulConnectorType: LongInt;	
/// HDTV capabilities.
		ulDeviceData: LongInt;	
/// Overridden HDTV capabilities.
		ulOverridedDeviceData: LongInt;	
/// Reserved field
		ulReserved: LongInt;		
	end;
	TADLDisplayConfig = ADLDisplayConfig;
	{$EXTERNALSYM TADLDisplayConfig}



/////////////////////////////////////////////////////////////////////////////////////////////
///\brief Structure containing information about the display device.
///
/// This structure is used to store display device information
/// such as display index, type, name, connection status, mapped adapter and controller indexes, 
/// whether or not multiple VPUs are supported, local display connections or not (through Lasso), etc.
/// This information can be returned to the user. Alternatively, it can be used to access various driver calls to set
/// or fetch various display device related settings upon the user's request.
/// \nosubgrouping
////////////////////////////////////////////////////////////////////////////////////////////
type  	
	ADLDisplayID = record 
/// The logical display index belonging to this adapter.
		iDisplayLogicalIndex: Integer;	
///\brief The physical display index.
/// For example, display index 2 from adapter 2 can be used by current adapter 1.\n
/// So current adapter may enumerate this adapter as logical display 7 but the physical display 
/// index is still 2.
		iDisplayPhysicalIndex: Integer;	
/// The persistent logical adapter index for the display.
		iDisplayLogicalAdapterIndex: Integer;	
///\brief The persistent physical adapter index for the display.
/// It can be the current adapter or a non-local adapter. \n
/// If this adapter index is different than the current adapter, 
/// the Display Non Local flag is set inside DisplayInfoValue.
		iDisplayPhysicalAdapterIndex: Integer;	
	end;
	TADLDisplayID = ADLDisplayID;
	{$EXTERNALSYM TADLDisplayID}
	LPADLDisplayID = ^ADLDisplayID;
	{$EXTERNALSYM LPADLDisplayID}


/////////////////////////////////////////////////////////////////////////////////////////////
///\brief Structure containing information about the display device.
///
/// This structure is used to store various information about the display device.  This 
/// information can be returned to the user, or used to access various driver calls to set
/// or fetch various display-device-related settings upon the user's request
/// \nosubgrouping
////////////////////////////////////////////////////////////////////////////////////////////
type  	
	ADLDisplayInfo = record 
/// The DisplayID structure
		displayID: ADLDisplayID;	 
///\deprecated The controller index to which the display is mapped.\n Will not be used in the future\n
		iDisplayControllerIndex: Integer;		
/// The display's EDID name.
		strDisplayName : array[0..ADL_MAX_PATH-1] of AnsiChar;
/// The display's manufacturer name.
		strDisplayManufacturerName : array[0..ADL_MAX_PATH-1] of AnsiChar;
/// The Display type. For example: CRT, TV, CV, DFP.
		iDisplayType: Integer;	 
/// The display output type. For example: HDMI, SVIDEO, COMPONMNET VIDEO.
		iDisplayOutputType: Integer;	 
/// The connector type for the device.  
		iDisplayConnector: Integer;	 
///\brief The bit mask identifies the number of bits ADLDisplayInfo is currently using. \n
/// It will be the sum all the bit definitions in ADL_DISPLAY_DISPLAYINFO_xxx.	
		iDisplayInfoMask: Integer;	 
/// The bit mask identifies the display status. \ref define_displayinfomask
		iDisplayInfoValue: Integer;	 
	end;
	TADLDisplayInfo = ADLDisplayInfo;
	{$EXTERNALSYM TADLDisplayInfo}
	LPADLDisplayInfo = ^ADLDisplayInfo;
	{$EXTERNALSYM LPADLDisplayInfo}


/////////////////////////////////////////////////////////////////////////////////////////////
///\brief Structure containing information about the display port MST device.
///
/// This structure is used to store various MST information about the display port device.  This 
/// information can be returned to the user, or used to access various driver calls to 
/// fetch various display-device-related settings upon the user's request
/// \nosubgrouping
////////////////////////////////////////////////////////////////////////////////////////////
type  	
	ADLDisplayDPMSTInfo = record 
	/// The ADLDisplayID structure
		displayID: ADLDisplayID;	
	/// total bandwidth available on the DP connector
		iTotalAvailableBandwidthInMpbs: Integer;	
	/// bandwidth allocated to this display
		iAllocatedBandwidthInMbps: Integer;	
	// info from DAL DpMstSinkInfo
	/// string identifier for the display
		strGlobalUniqueIdentifier : array[0..ADL_MAX_PATH-1] of AnsiChar;
	/// The link count of relative address, rad[0] upto rad[linkCount] are valid
		radLinkCount: Integer;	
	/// The physical connector ID, used to identify the physical DP port
		iPhysicalConnectorID: Integer;	
	/// Relative address, address scheme starts from source side
		rad : array[0..ADL_MAX_RAD_LINK_COUNT-1] of AnsiChar;
	end;
	TADLDisplayDPMSTInfo = ADLDisplayDPMSTInfo;
	{$EXTERNALSYM TADLDisplayDPMSTInfo}
	LPADLDisplayDPMSTInfo = ^ADLDisplayDPMSTInfo;
	{$EXTERNALSYM LPADLDisplayDPMSTInfo}


/////////////////////////////////////////////////////////////////////////////////////////////
///\brief Structure containing the display mode definition used per controller.
///
/// This structure is used to store the display mode definition used per controller.
/// \nosubgrouping
////////////////////////////////////////////////////////////////////////////////////////////
type  	
	ADLDisplayMode = record 
/// Vertical resolution (in pixels).
		iPelsHeight: Integer;	
/// Horizontal resolution (in pixels).
		iPelsWidth: Integer;	
/// Color depth.
		iBitsPerPel: Integer;	
/// Refresh rate.
		iDisplayFrequency: Integer;	
	end;
	TADLDisplayMode = ADLDisplayMode;
	{$EXTERNALSYM TADLDisplayMode}


/////////////////////////////////////////////////////////////////////////////////////////////
///\brief Structure containing detailed timing parameters.
///
/// This structure is used to store the detailed timing parameters.
/// \nosubgrouping
////////////////////////////////////////////////////////////////////////////////////////////
type  	
	ADLDetailedTiming = record 
/// Size of the structure.
		iSize: Integer;	
/// Timing flags. \ref define_detailed_timing_flags
		sTimingFlags: SmallInt;	
/// Total width (columns).
		sHTotal: SmallInt;	
/// Displayed width.
		sHDisplay: SmallInt;
/// Horizontal sync signal offset.
		sHSyncStart: SmallInt;	
/// Horizontal sync signal width.
		sHSyncWidth: SmallInt;	
/// Total height (rows).
		sVTotal: SmallInt;	
/// Displayed height.
		sVDisplay: SmallInt;	
/// Vertical sync signal offset.
		sVSyncStart: SmallInt;	
/// Vertical sync signal width.
		sVSyncWidth: SmallInt;	
/// Pixel clock value.
		sPixelClock: SmallInt;	
/// Overscan right.
		sHOverscanRight: SmallInt;	
/// Overscan left.
		sHOverscanLeft: SmallInt;	
/// Overscan bottom.
		sVOverscanBottom: SmallInt;	
/// Overscan top.
		sVOverscanTop: SmallInt;	
		sOverscan8B: SmallInt;	
		sOverscanGR: SmallInt;	
	end;
	TADLDetailedTiming = ADLDetailedTiming;
	{$EXTERNALSYM TADLDetailedTiming}


/////////////////////////////////////////////////////////////////////////////////////////////
///\brief Structure containing display mode information.
///
/// This structure is used to store the display mode information.
/// \nosubgrouping
////////////////////////////////////////////////////////////////////////////////////////////
type  	
	ADLDisplayModeInfo = record 
/// Timing standard of the current mode. \ref define_modetiming_standard
		iTimingStandard: Integer;	
/// Applicable timing standards for the current mode.
		iPossibleStandard: Integer;	
/// Refresh rate factor.
		iRefreshRate: Integer;
/// Num of pixels in a row.
		iPelsWidth: Integer;	
/// Num of pixels in a column.
		iPelsHeight: Integer;	
/// Detailed timing parameters.
		sDetailedTiming: ADLDetailedTiming;	
	end;
	TADLDisplayModeInfo = ADLDisplayModeInfo;
	{$EXTERNALSYM TADLDisplayModeInfo}


/////////////////////////////////////////////////////////////////////////////////////////////
/// \brief Structure containing information about display property.
///
/// This structure is used to store the display property for the current adapter.
/// \nosubgrouping
////////////////////////////////////////////////////////////////////////////////////////////
type  	
	ADLDisplayProperty = record 
/// Must be set to sizeof the structure
		iSize: Integer;		
/// Must be set to \ref ADL_DL_DISPLAYPROPERTY_TYPE_EXPANSIONMODE or \ref ADL_DL_DISPLAYPROPERTY_TYPE_USEUNDERSCANSCALING
		iPropertyType: Integer;	
/// Get or Set \ref ADL_DL_DISPLAYPROPERTY_EXPANSIONMODE_CENTER or \ref ADL_DL_DISPLAYPROPERTY_EXPANSIONMODE_FULLSCREEN or \ref ADL_DL_DISPLAYPROPERTY_EXPANSIONMODE_ASPECTRATIO or \ref ADL_DL_DISPLAYPROPERTY_TYPE_ITCFLAGENABLE
		iExpansionMode: Integer;	
/// Display Property supported? 1: Supported, 0: Not supported
		iSupport: Integer;	
/// Display Property current value 
		iCurrent: Integer;	
/// Display Property Default value
		iDefault: Integer;				
	end;
	TADLDisplayProperty = ADLDisplayProperty;
	{$EXTERNALSYM TADLDisplayProperty}


/////////////////////////////////////////////////////////////////////////////////////////////
///\brief Structure containing information about Clock.
///
/// This structure is used to store the clock information for the current adapter 
/// such as core clock and memory clock info.
///\nosubgrouping
////////////////////////////////////////////////////////////////////////////////////////////
type  	
	ADLClockInfo = record 
/// Core clock in 10 KHz.
		iCoreClock: Integer;	
/// Memory clock in 10 KHz.
		iMemoryClock: Integer;				
	end;
	TADLClockInfo = ADLClockInfo;
	{$EXTERNALSYM TADLClockInfo}
	LPADLClockInfo = ^ADLClockInfo;
	{$EXTERNALSYM LPADLClockInfo}


/////////////////////////////////////////////////////////////////////////////////////////////
///\brief Structure containing information about I2C.
///
/// This structure is used to store the I2C information for the current adapter.
/// This structure is used by the ADL_Display_WriteAndReadI2C() function.
/// \nosubgrouping
////////////////////////////////////////////////////////////////////////////////////////////
type  	
	ADLI2C = record 
      /// Size of the structure
		iSize: Integer;	
/// Numerical value representing hardware I2C.
		iLine: Integer;	
/// The 7-bit I2C slave device address, shifted one bit to the left.
		iAddress: Integer;	
/// The offset of the data from the address.
		iOffset: Integer;	
/// Read from or write to slave device. \ref ADL_DL_I2C_ACTIONREAD or \ref ADL_DL_I2C_ACTIONWRITE or \ref ADL_DL_I2C_ACTIONREAD_REPEATEDSTART
		iAction: Integer;	
/// I2C clock speed in KHz.
		iSpeed: Integer;	
/// A numerical value representing the number of bytes to be sent or received on the I2C bus.
		iDataSize: Integer;	
/// Address of the characters which are to be sent or received on the I2C bus.
		pcData: PAnsiChar;
	end;
	TADLI2C = ADLI2C;
	{$EXTERNALSYM TADLI2C}


/////////////////////////////////////////////////////////////////////////////////////////////
///\brief Structure containing information about EDID data.
///
/// This structure is used to store the information about EDID data for the adapter.
/// This structure is used by the ADL_Display_EdidData_Get() and ADL_Display_EdidData_Set() functions.
/// \nosubgrouping
////////////////////////////////////////////////////////////////////////////////////////////
type  	
	ADLDisplayEDIDData = record 
/// Size of the structure
		iSize: Integer;	
/// Set to 0
		iFlag: Integer;	
  /// Size of cEDIDData. Set by ADL_Display_EdidData_Get() upon return
		iEDIDSize: Integer;	
/// 0, 1 or 2. If set to 3 or above an error ADL_ERR_INVALID_PARAM is generated
		iBlockIndex: Integer;	
/// EDID data
		cEDIDData : array[0..ADL_MAX_EDIDDATA_SIZE-1] of AnsiChar;
/// Reserved
		iReserved : array[0..3] of Integer;
	end;
	TADLDisplayEDIDData = ADLDisplayEDIDData;
	{$EXTERNALSYM TADLDisplayEDIDData}


/////////////////////////////////////////////////////////////////////////////////////////////
///\brief Structure containing information about input of controller overlay adjustment.
///
/// This structure is used to store the information about input of controller overlay adjustment for the adapter. 
/// This structure is used by the ADL_Display_ControllerOverlayAdjustmentCaps_Get, ADL_Display_ControllerOverlayAdjustmentData_Get, and
/// ADL_Display_ControllerOverlayAdjustmentData_Set() functions.
/// \nosubgrouping
////////////////////////////////////////////////////////////////////////////////////////////
type  	
	ADLControllerOverlayInput = record 
/// Should be set to the sizeof the structure
		iSize: Integer;	
///\ref ADL_DL_CONTROLLER_OVERLAY_ALPHA or \ref ADL_DL_CONTROLLER_OVERLAY_ALPHAPERPIX
		iOverlayAdjust: Integer;		
/// Data.
		iValue: Integer;	
/// Should be 0.
		iReserved: Integer;				
	end;
	TADLControllerOverlayInput = ADLControllerOverlayInput;
	{$EXTERNALSYM TADLControllerOverlayInput}


/////////////////////////////////////////////////////////////////////////////////////////////
///\brief Structure containing information about overlay adjustment.
///
/// This structure is used to store the information about overlay adjustment for the adapter. 
/// This structure is used by the ADLControllerOverlayInfo() function.
/// \nosubgrouping
////////////////////////////////////////////////////////////////////////////////////////////
type  	
	ADLAdjustmentinfo = record 
/// Default value
		iDefault: Integer;	
/// Minimum value
		iMin: Integer;	
/// Maximum Value
		iMax: Integer;	
/// Step value
		iStep: Integer;	
	end;
	TADLAdjustmentinfo = ADLAdjustmentinfo;
	{$EXTERNALSYM TADLAdjustmentinfo}


/////////////////////////////////////////////////////////////////////////////////////////////
///\brief Structure containing information about controller overlay information.
///
/// This structure is used to store information about controller overlay info for the adapter.
/// This structure is used by the ADL_Display_ControllerOverlayAdjustmentCaps_Get() function.
/// \nosubgrouping
////////////////////////////////////////////////////////////////////////////////////////////
type  	
	ADLControllerOverlayInfo = record 
/// Should be set to the sizeof the structure
		iSize: Integer;	
/// Data.
		sOverlayInfo: ADLAdjustmentinfo;	
/// Should be 0.
		iReserved : array[0..2] of Integer;
	end;
	TADLControllerOverlayInfo = ADLControllerOverlayInfo;
	{$EXTERNALSYM TADLControllerOverlayInfo}


/////////////////////////////////////////////////////////////////////////////////////////////
///\brief Structure containing GL-Sync module information.
///
/// This structure is used to retrieve GL-Sync module information for
/// Workstation Framelock/Genlock.
/// \nosubgrouping
////////////////////////////////////////////////////////////////////////////////////////////
type  	
	ADLGLSyncModuleID = record 
/// Unique GL-Sync module ID.
		iModuleID: Integer;	
/// GL-Sync GPU port index (to be passed into ADLGLSyncGenlockConfig.lSignalSource and ADLGlSyncPortControl.lSignalSource).
		iGlSyncGPUPort: Integer;	
/// GL-Sync module firmware version of Boot Sector.
		iFWBootSectorVersion: Integer;	
/// GL-Sync module firmware version of User Sector.
		iFWUserSectorVersion: Integer;	
	end;
	TADLGLSyncModuleID = ADLGLSyncModuleID;
	{$EXTERNALSYM TADLGLSyncModuleID}
	LPADLGLSyncModuleID = ^ADLGLSyncModuleID;
	{$EXTERNALSYM LPADLGLSyncModuleID}


/////////////////////////////////////////////////////////////////////////////////////////////
///\brief Structure containing GL-Sync ports capabilities.
///
/// This structure is used to retrieve hardware capabilities for the ports of the GL-Sync module
/// for Workstation Framelock/Genlock (such as port type and number of associated LEDs).
/// \nosubgrouping
////////////////////////////////////////////////////////////////////////////////////////////
type  	
	ADLGLSyncPortCaps = record 
/// Port type. Bitfield of ADL_GLSYNC_PORTTYPE_*  \ref define_glsync
		iPortType: Integer;	
/// Number of LEDs associated for this port.
		iNumOfLEDs: Integer;	
	end;
	TADLGLSyncPortCaps = ADLGLSyncPortCaps;
	{$EXTERNALSYM TADLGLSyncPortCaps}
	LPADLGLSyncPortCaps = ^ADLGLSyncPortCaps;
	{$EXTERNALSYM LPADLGLSyncPortCaps}


/////////////////////////////////////////////////////////////////////////////////////////////
///\brief Structure containing GL-Sync Genlock settings.
///
/// This structure is used to get and set genlock settings for the GPU ports of the GL-Sync module
/// for Workstation Framelock/Genlock.\n
/// \see define_glsync 
/// \nosubgrouping
////////////////////////////////////////////////////////////////////////////////////////////
type  	
	ADLGLSyncGenlockConfig = record 
/// Specifies what fields in this structure are valid \ref define_glsync
		iValidMask: Integer;	
/// Delay (ms) generating a sync signal.
		iSyncDelay: Integer;	
/// Vector of framelock control bits. Bitfield of ADL_GLSYNC_FRAMELOCKCNTL_* \ref define_glsync
		iFramelockCntlVector: Integer;	
/// Source of the sync signal. Either GL_Sync GPU Port index or ADL_GLSYNC_SIGNALSOURCE_* \ref define_glsync
		iSignalSource: Integer;		
/// Use sampled sync signal. A value of 0 specifies no sampling.
		iSampleRate: Integer;	
/// For interlaced sync signals, the value can be ADL_GLSYNC_SYNCFIELD_1 or *_BOTH \ref define_glsync
		iSyncField: Integer;	
/// The signal edge that should trigger synchronization. ADL_GLSYNC_TRIGGEREDGE_* \ref define_glsync
		iTriggerEdge: Integer;	
/// Scan rate multiplier applied to the sync signal. ADL_GLSYNC_SCANRATECOEFF_* \ref define_glsync
		iScanRateCoeff: Integer;	
	end;
	TADLGLSyncGenlockConfig = ADLGLSyncGenlockConfig;
	{$EXTERNALSYM TADLGLSyncGenlockConfig}
	LPADLGLSyncGenlockConfig = ^ADLGLSyncGenlockConfig;
	{$EXTERNALSYM LPADLGLSyncGenlockConfig}


/////////////////////////////////////////////////////////////////////////////////////////////
///\brief Structure containing GL-Sync port information.
///
/// This structure is used to get status of the GL-Sync ports (BNC or RJ45s)
/// for Workstation Framelock/Genlock.
/// \see define_glsync 
/// \nosubgrouping
////////////////////////////////////////////////////////////////////////////////////////////
type  	
	ADLGlSyncPortInfo = record 
/// Type of GL-Sync port (ADL_GLSYNC_PORT_*).
		iPortType: Integer;	
/// The number of LEDs for this port. It's also filled within ADLGLSyncPortCaps.
		iNumOfLEDs: Integer;	
/// Port state ADL_GLSYNC_PORTSTATE_*  \ref define_glsync
		iPortState: Integer;	
		/// Scanned frequency for this port (vertical refresh rate in milliHz; 60000 means 60 Hz).
		iFrequency: Integer;	
/// Used for ADL_GLSYNC_PORT_BNC. It is ADL_GLSYNC_SIGNALTYPE_*   \ref define_glsync
		iSignalType: Integer;	
/// Used for ADL_GLSYNC_PORT_RJ45PORT*. It is GL_Sync GPU Port index or ADL_GLSYNC_SIGNALSOURCE_*.  \ref define_glsync
		iSignalSource: Integer;		
	end;
	TADLGlSyncPortInfo = ADLGlSyncPortInfo;
	{$EXTERNALSYM TADLGlSyncPortInfo}
	LPADLGlSyncPortInfo = ^ADLGlSyncPortInfo;
	{$EXTERNALSYM LPADLGlSyncPortInfo}


/////////////////////////////////////////////////////////////////////////////////////////////
///\brief Structure containing GL-Sync port control settings.
///
/// This structure is used to configure the GL-Sync ports (RJ45s only)
/// for Workstation Framelock/Genlock.
/// \see define_glsync 
/// \nosubgrouping
////////////////////////////////////////////////////////////////////////////////////////////
type  	
	ADLGlSyncPortControl = record 
/// Port to control ADL_GLSYNC_PORT_RJ45PORT1 or ADL_GLSYNC_PORT_RJ45PORT2   \ref define_glsync
		iPortType: Integer;	
/// Port control data ADL_GLSYNC_PORTCNTL_*   \ref define_glsync
		iControlVector: Integer;		
/// Source of the sync signal. Either GL_Sync GPU Port index or ADL_GLSYNC_SIGNALSOURCE_*   \ref define_glsync
		iSignalSource: Integer;	
	end;
	TADLGlSyncPortControl = ADLGlSyncPortControl;
	{$EXTERNALSYM TADLGlSyncPortControl}


/////////////////////////////////////////////////////////////////////////////////////////////
///\brief Structure containing GL-Sync mode of a display.
///
/// This structure is used to get and set GL-Sync mode settings for a display connected to
/// an adapter attached to a GL-Sync module for Workstation Framelock/Genlock.
/// \see define_glsync 
/// \nosubgrouping
////////////////////////////////////////////////////////////////////////////////////////////
type  	
	ADLGlSyncMode = record 
/// Mode control vector. Bitfield of ADL_GLSYNC_MODECNTL_*   \ref define_glsync
		iControlVector: Integer;				
/// Mode status vector. Bitfield of ADL_GLSYNC_MODECNTL_STATUS_*   \ref define_glsync
		iStatusVector: Integer;	
/// Index of GL-Sync connector used to genlock the display/controller.
		iGLSyncConnectorIndex: Integer;	
	end;
	TADLGlSyncMode = ADLGlSyncMode;
	{$EXTERNALSYM TADLGlSyncMode}
	LPADLGlSyncMode = ^ADLGlSyncMode;
	{$EXTERNALSYM LPADLGlSyncMode}


/////////////////////////////////////////////////////////////////////////////////////////////
///\brief Structure containing GL-Sync mode of a display.
///
/// This structure is used to get and set GL-Sync mode settings for a display connected to
/// an adapter attached to a GL-Sync module for Workstation Framelock/Genlock.
/// \see define_glsync 
/// \nosubgrouping
////////////////////////////////////////////////////////////////////////////////////////////
type  	
	ADLGlSyncMode2 = record 
/// Mode control vector. Bitfield of ADL_GLSYNC_MODECNTL_*   \ref define_glsync
		iControlVector: Integer;				
/// Mode status vector. Bitfield of ADL_GLSYNC_MODECNTL_STATUS_*   \ref define_glsync
		iStatusVector: Integer;	
/// Index of GL-Sync connector used to genlock the display/controller.
		iGLSyncConnectorIndex: Integer;	
/// Index of the display to which this GLSync applies to.
		iDisplayIndex: Integer;	
	end;
	TADLGlSyncMode2 = ADLGlSyncMode2;
	{$EXTERNALSYM TADLGlSyncMode2}
	LPADLGlSyncMode2 = ^ADLGlSyncMode2;
	{$EXTERNALSYM LPADLGlSyncMode2}



/////////////////////////////////////////////////////////////////////////////////////////////
///\brief Structure containing the packet info of a display.
///
/// This structure is used to get and set the packet information of a display. 
/// This structure is used by ADLDisplayDataPacket.
/// \nosubgrouping
////////////////////////////////////////////////////////////////////////////////////////////
type  	
	ADLInfoPacket = record 
		hb0: AnsiChar;
		hb1: AnsiChar;
		hb2: AnsiChar;
/// sb0~sb27
		sb : array[0..27] of AnsiChar;
	end;
	TADLInfoPacket = ADLInfoPacket;
	{$EXTERNALSYM TADLInfoPacket}


/////////////////////////////////////////////////////////////////////////////////////////////
///\brief Structure containing the AVI packet info of a display.
///
/// This structure is used to get and set AVI the packet info of a display.
/// This structure is used by ADLDisplayDataPacket.
/// \nosubgrouping
////////////////////////////////////////////////////////////////////////////////////////////
type  	
	ADLAVIInfoPacket = record //Valid user defined data/
/// byte 3, bit 7
   bPB3_ITC: AnsiChar;
/// byte 5, bit [7:4].
   bPB5: AnsiChar;
  end;
  TADLAVIInfoPacket = ADLAVIInfoPacket;  //Valid user defined data/;
	{$EXTERNALSYM ADLAVIInfoPacket}


// Overdrive clock setting structure definition.

/////////////////////////////////////////////////////////////////////////////////////////////
///\brief Structure containing the Overdrive clock setting.
///
/// This structure is used to get the Overdrive clock setting.
/// This structure is used by ADLAdapterODClockInfo.
/// \nosubgrouping
////////////////////////////////////////////////////////////////////////////////////////////
type  	
	ADLODClockSetting = record 
/// Deafult clock
		iDefaultClock: Integer;	
/// Current clock
		iCurrentClock: Integer;	
/// Maximum clcok
		iMaxClock: Integer;	
/// Minimum clock
		iMinClock: Integer;	
/// Requested clcock
		iRequestedClock: Integer;	
/// Step
		iStepClock: Integer;	
	end;
	TADLODClockSetting = ADLODClockSetting;
	{$EXTERNALSYM TADLODClockSetting}


/////////////////////////////////////////////////////////////////////////////////////////////
///\brief Structure containing the Overdrive clock information.
///
/// This structure is used to get the Overdrive clock information.
/// This structure is used by the ADL_Display_ODClockInfo_Get() function.
/// \nosubgrouping
////////////////////////////////////////////////////////////////////////////////////////////
type  	
	ADLAdapterODClockInfo = record 
/// Size of the structure
		iSize: Integer;	
/// Flag \ref define_clockinfo_flags
		iFlags: Integer;	
/// Memory Clock
		sMemoryClock: ADLODClockSetting;	
/// Engine Clock
		sEngineClock: ADLODClockSetting;	
	end;
	TADLAdapterODClockInfo = ADLAdapterODClockInfo;
	{$EXTERNALSYM TADLAdapterODClockInfo}


/////////////////////////////////////////////////////////////////////////////////////////////
///\brief Structure containing the Overdrive clock configuration.
///
/// This structure is used to set the Overdrive clock configuration.
/// This structure is used by the ADL_Display_ODClockConfig_Set() function.
/// \nosubgrouping
////////////////////////////////////////////////////////////////////////////////////////////
type  	
	ADLAdapterODClockConfig = record 
/// Size of the structure
		iSize: Integer;	
/// Flag \ref define_clockinfo_flags
		iFlags: Integer;	
/// Memory Clock
		iMemoryClock: Integer;	
/// Engine Clock
		iEngineClock: Integer;	
	end;
	TADLAdapterODClockConfig = ADLAdapterODClockConfig;
	{$EXTERNALSYM TADLAdapterODClockConfig}


/////////////////////////////////////////////////////////////////////////////////////////////
///\brief Structure containing information about current power management related activity.
///
/// This structure is used to store information about current power management related activity.
/// This structure (Overdrive 5 interfaces) is used by the ADL_PM_CurrentActivity_Get() function.
/// \nosubgrouping
////////////////////////////////////////////////////////////////////////////////////////////
type  	
	ADLPMActivity = record 
/// Must be set to the size of the structure
		iSize: Integer;
/// Current engine clock.
		iEngineClock: Integer;	
/// Current memory clock.
		iMemoryClock: Integer;	
/// Current core voltage.
		iVddc: Integer;	
/// GPU utilization.
		iActivityPercent: Integer;	
/// Performance level index.
		iCurrentPerformanceLevel: Integer;	
/// Current PCIE bus speed.
		iCurrentBusSpeed: Integer;	
/// Number of PCIE bus lanes.
		iCurrentBusLanes: Integer;	
/// Maximum number of PCIE bus lanes.
		iMaximumBusLanes: Integer;	
/// Reserved for future purposes.
		iReserved: Integer;									
	end;
	TADLPMActivity = ADLPMActivity;
	{$EXTERNALSYM TADLPMActivity}


/////////////////////////////////////////////////////////////////////////////////////////////
///\brief Structure containing information about thermal controller.
///
/// This structure is used to store information about thermal controller.
/// This structure is used by ADL_PM_ThermalDevices_Enum.
/// \nosubgrouping
////////////////////////////////////////////////////////////////////////////////////////////
type  	
	ADLThermalControllerInfo = record 
/// Must be set to the size of the structure
		iSize: Integer;		
/// Possible valies: \ref ADL_DL_THERMAL_DOMAIN_OTHER or \ref ADL_DL_THERMAL_DOMAIN_GPU.
		iThermalDomain: Integer;	
///	GPU 0, 1, etc.
		iDomainIndex: Integer;	
/// Possible valies: \ref ADL_DL_THERMAL_FLAG_INTERRUPT or \ref ADL_DL_THERMAL_FLAG_FANCONTROL
		iFlags: Integer;							
	end;
	TADLThermalControllerInfo = ADLThermalControllerInfo;
	{$EXTERNALSYM TADLThermalControllerInfo}


/////////////////////////////////////////////////////////////////////////////////////////////
///\brief Structure containing information about thermal controller temperature.
///
/// This structure is used to store information about thermal controller temperature. 
/// This structure is used by the ADL_PM_Temperature_Get() function.
/// \nosubgrouping
////////////////////////////////////////////////////////////////////////////////////////////
type  	
	ADLTemperature = record 
/// Must be set to the size of the structure
		iSize: Integer;		
/// Temperature in millidegrees Celsius.
		iTemperature: Integer;	  
	end;
	TADLTemperature = ADLTemperature;
	{$EXTERNALSYM TADLTemperature}


/////////////////////////////////////////////////////////////////////////////////////////////
///\brief Structure containing information about thermal controller fan speed.
///
/// This structure is used to store information about thermal controller fan speed.
/// This structure is used by the ADL_PM_FanSpeedInfo_Get() function.
/// \nosubgrouping
////////////////////////////////////////////////////////////////////////////////////////////
type  	
	ADLFanSpeedInfo = record 
/// Must be set to the size of the structure
		iSize: Integer;		
/// \ref define_fanctrl
		iFlags: Integer;	
/// Minimum possible fan speed value in percents.
		iMinPercent: Integer;	
/// Maximum possible fan speed value in percents.
		iMaxPercent: Integer;		
/// Minimum possible fan speed value in RPM.
		iMinRPM: Integer;	
/// Maximum possible fan speed value in RPM.
		iMaxRPM: Integer;	
	end;
	TADLFanSpeedInfo = ADLFanSpeedInfo;
	{$EXTERNALSYM TADLFanSpeedInfo}


/////////////////////////////////////////////////////////////////////////////////////////////
///\brief Structure containing information about fan speed reported by thermal controller.
///
/// This structure is used to store information about fan speed reported by thermal controller.
/// This structure is used by the ADL_Overdrive5_FanSpeed_Get() and ADL_Overdrive5_FanSpeed_Set() functions.
/// \nosubgrouping
////////////////////////////////////////////////////////////////////////////////////////////
type  	
	ADLFanSpeedValue = record 
/// Must be set to the size of the structure
		iSize: Integer;	
/// Possible valies: \ref ADL_DL_FANCTRL_SPEED_TYPE_PERCENT or \ref ADL_DL_FANCTRL_SPEED_TYPE_RPM
		iSpeedType: Integer;	
/// Fan speed value
		iFanSpeed: Integer;	
/// The only flag for now is: \ref ADL_DL_FANCTRL_FLAG_USER_DEFINED_SPEED
		iFlags: Integer;					
	end;
	TADLFanSpeedValue = ADLFanSpeedValue;
	{$EXTERNALSYM TADLFanSpeedValue}


////////////////////////////////////////////////////////////////////////////////////////////
///\brief Structure containing the range of Overdrive parameter.
///
/// This structure is used to store information about the range of Overdrive parameter.
/// This structure is used by ADLODParameters.
/// \nosubgrouping
////////////////////////////////////////////////////////////////////////////////////////////
type  	
	ADLODParameterRange = record 
/// Minimum parameter value.
		iMin: Integer;	
/// Maximum parameter value.
		iMax: Integer;		
/// Parameter step value.
		iStep: Integer;		
	end;
	TADLODParameterRange = ADLODParameterRange;
	{$EXTERNALSYM TADLODParameterRange}


/////////////////////////////////////////////////////////////////////////////////////////////
///\brief Structure containing information about Overdrive parameters.
///
/// This structure is used to store information about Overdrive parameters.
/// This structure is used by the ADL_Overdrive5_ODParameters_Get() function.
/// \nosubgrouping
////////////////////////////////////////////////////////////////////////////////////////////
type  	
	ADLODParameters = record 
/// Must be set to the size of the structure
		iSize: Integer;		
/// Number of standard performance states.
		iNumberOfPerformanceLevels: Integer;	
/// Indicates whether the GPU is capable to measure its activity.
		iActivityReportingSupported: Integer;	
/// Indicates whether the GPU supports discrete performance levels or performance range.
		iDiscretePerformanceLevels: Integer;	
/// Reserved for future use.
		iReserved: Integer;		
/// Engine clock range.
		sEngineClock: ADLODParameterRange;		
/// Memory clock range.
		sMemoryClock: ADLODParameterRange;	
/// Core voltage range.
		sVddc: ADLODParameterRange;		
	end;
	TADLODParameters = ADLODParameters;
	{$EXTERNALSYM TADLODParameters}


/////////////////////////////////////////////////////////////////////////////////////////////
///\brief Structure containing information about Overdrive level.
///
/// This structure is used to store information about Overdrive level.
/// This structure is used by ADLODPerformanceLevels.
/// \nosubgrouping
////////////////////////////////////////////////////////////////////////////////////////////
type  	
	ADLODPerformanceLevel = record 
/// Engine clock.
		iEngineClock: Integer;
/// Memory clock.
		iMemoryClock: Integer;	
/// Core voltage.
		iVddc: Integer;	
	end;
	TADLODPerformanceLevel = ADLODPerformanceLevel;
	{$EXTERNALSYM TADLODPerformanceLevel}


/////////////////////////////////////////////////////////////////////////////////////////////
///\brief Structure containing information about Overdrive performance levels.
///
/// This structure is used to store information about Overdrive performance levels.
/// This structure is used by the ADL_Overdrive5_ODPerformanceLevels_Get() and ADL_Overdrive5_ODPerformanceLevels_Set() functions.
/// \nosubgrouping
////////////////////////////////////////////////////////////////////////////////////////////
type  	
	ADLODPerformanceLevels = record 
/// Must be set to sizeof( \ref ADLODPerformanceLevels ) + sizeof( \ref ADLODPerformanceLevel ) * (ADLODParameters.iNumberOfPerformanceLevels - 1)
		iSize: Integer;	
		iReserved: Integer;	
/// Array of performance state descriptors. Must have ADLODParameters.iNumberOfPerformanceLevels elements.
		aLevels : array[0..0] of ADLODPerformanceLevel;
	end;
	TADLODPerformanceLevels = ADLODPerformanceLevels;
	{$EXTERNALSYM TADLODPerformanceLevels}


/////////////////////////////////////////////////////////////////////////////////////////////
///\brief Structure containing information about the proper CrossfireX chains combinations.
///
/// This structure is used to store information about the CrossfireX chains combination for a particular adapter.
/// This structure is used by the ADL_Adapter_Crossfire_Caps(), ADL_Adapter_Crossfire_Get(), and ADL_Adapter_Crossfire_Set() functions.
/// \nosubgrouping
////////////////////////////////////////////////////////////////////////////////////////////
type  	
	ADLCrossfireComb = record 
/// Number of adapters in this combination.
		iNumLinkAdapter: Integer;	
/// A list of ADL indexes of the linked adapters in this combination.
		iAdaptLink : array[0..2] of Integer;
	end;
	TADLCrossfireComb = ADLCrossfireComb;
	{$EXTERNALSYM TADLCrossfireComb}


/////////////////////////////////////////////////////////////////////////////////////////////
///\brief Structure containing CrossfireX state and error information.
///
/// This structure is used to store state and error information about a particular adapter CrossfireX combination.
/// This structure is used by the ADL_Adapter_Crossfire_Get() function.
/// \nosubgrouping
////////////////////////////////////////////////////////////////////////////////////////////
type  	
	ADLCrossfireInfo = record 
/// Current error code of this CrossfireX combination.
		iErrorCode: Integer;	
/// Current \ref define_crossfirestate
		iState: Integer;	
/// If CrossfireX is supported by this combination. The value is either \ref ADL_TRUE or \ref ADL_FALSE.
		iSupported: Integer;	
	end;
	TADLCrossfireInfo = ADLCrossfireInfo;
	{$EXTERNALSYM TADLCrossfireInfo}


/////////////////////////////////////////////////////////////////////////////////////////////
/// \brief Structure containing information about the BIOS.
///
/// This structure is used to store various information about the Chipset.  This 
/// information can be returned to the user.
/// \nosubgrouping
////////////////////////////////////////////////////////////////////////////////////////////
type  	
	ADLBiosInfo = record 
		strPartNumber : array[0..ADL_MAX_PATH-1] of AnsiChar;	///< Part number.
		strVersion : array[0..ADL_MAX_PATH-1] of AnsiChar;		///< Version number.
		strDate : array[0..ADL_MAX_PATH-1] of AnsiChar;		///< BIOS date in yyyy/mm/dd hhmm format.
	end;
	TADLBiosInfo = ADLBiosInfo;
	{$EXTERNALSYM TADLBiosInfo}
	LPADLBiosInfo = ^ADLBiosInfo;
	{$EXTERNALSYM LPADLBiosInfo}



/////////////////////////////////////////////////////////////////////////////////////////////
/// \brief Structure containing information about adapter location.
///
/// This structure is used to store information about adapter location.
/// This structure is used by ADLMVPUStatus.
/// \nosubgrouping
////////////////////////////////////////////////////////////////////////////////////////////
type  	
	ADLAdapterLocation = record 
/// PCI Bus number : 8 bits 
		iBus: Integer;	
/// Device number : 5 bits
		iDevice: Integer;	
/// Function number : 3 bits
		iFunction: Integer;	
	end;
	TADLAdapterLocation = ADLAdapterLocation;
	{$EXTERNALSYM TADLAdapterLocation}
	ADLBdf = ADLAdapterLocation;
	{$EXTERNALSYM ADLBdf}



/////////////////////////////////////////////////////////////////////////////////////////////
/// \brief Structure containing information about MultiVPU capabilities.
///
/// This structure is used to store information about MultiVPU capabilities.
/// This structure is used by the ADL_Display_MVPUCaps_Get() function.
/// \nosubgrouping
////////////////////////////////////////////////////////////////////////////////////////////
type  	
	ADLMVPUCaps = record 
/// Must be set to sizeof( ADLMVPUCaps ).
		iSize: Integer;	
/// Number of adapters.
		iAdapterCount: Integer;	
/// Bits set for all possible MVPU masters. \ref MVPU_ADAPTER_0 .. \ref MVPU_ADAPTER_3
		iPossibleMVPUMasters: Integer;	
/// Bits set for all possible MVPU slaves. \ref MVPU_ADAPTER_0 .. \ref MVPU_ADAPTER_3
		iPossibleMVPUSlaves: Integer;	
/// Registry path for each adapter. 
		cAdapterPath: array[0..ADL_DL_MAX_MVPU_ADAPTERS-1] of array[0..ADL_DL_MAX_REGISTRY_PATH] of AnsiChar;
	end;
	TADLMVPUCaps = ADLMVPUCaps;
	{$EXTERNALSYM TADLMVPUCaps}


/////////////////////////////////////////////////////////////////////////////////////////////
/// \brief Structure containing information about MultiVPU status.
///
/// This structure is used to store information about MultiVPU status.
/// Ths structure is used by the ADL_Display_MVPUStatus_Get() function.
/// \nosubgrouping
////////////////////////////////////////////////////////////////////////////////////////////
type  	
	ADLMVPUStatus = record 
/// Must be set to sizeof( ADLMVPUStatus ).
		iSize: Integer;	
/// Number of active adapters.
		iActiveAdapterCount: Integer;	
/// MVPU status.
		iStatus: Integer;	
/// PCI Bus/Device/Function for each active adapter participating in MVPU.
		aAdapterLocation : array[0..ADL_DL_MAX_MVPU_ADAPTERS-1] of ADLAdapterLocation;
	end;
	TADLMVPUStatus = ADLMVPUStatus;
	{$EXTERNALSYM TADLMVPUStatus}


// Displays Manager structures

///////////////////////////////////////////////////////////////////////////
/// \brief Structure containing information about the activatable source.
///
/// This structure is used to store activatable source information
/// This information can be returned to the user. 
/// \nosubgrouping
////////////////////////////////////////////////////////////////////////////////////////////
type  	
	ADLActivatableSource = record 
	/// The Persistent logical Adapter Index. 
		iAdapterIndex: Integer;	 
	/// The number of Activatable Sources. 
		iNumActivatableSources: Integer;	 
	/// The bit mask identifies the number of bits ActivatableSourceValue is using. (Not currnetly used)
		iActivatableSourceMask: Integer;
	/// The bit mask identifies the status.  (Not currnetly used)
		iActivatableSourceValue: Integer;	
	end;
	TADLActivatableSource = ADLActivatableSource;
	{$EXTERNALSYM TADLActivatableSource}
	LPADLActivatableSource = ^ADLActivatableSource;
	{$EXTERNALSYM LPADLActivatableSource}
 

/////////////////////////////////////////////////////////////////////////////////////////////
/// \brief Structure containing information about display mode.
///
/// This structure is used to store the display mode for the current adapter 
/// such as X, Y positions, screen resolutions, orientation, 
/// color depth, refresh rate, progressive or interlace mode, etc.
/// \nosubgrouping
////////////////////////////////////////////////////////////////////////////////////////////

type  	
	ADLMode = record 
/// Adapter index.
		iAdapterIndex: Integer;	
/// Display IDs.
		displayID: ADLDisplayID;	
/// Screen position X coordinate.
		iXPos: Integer;	
/// Screen position Y coordinate.
		iYPos: Integer;	
/// Screen resolution Width.
		iXRes: Integer;	
/// Screen resolution Height.
		iYRes: Integer;	
/// Screen Color Depth. E.g., 16, 32.
		iColourDepth: Integer;	
/// Screen refresh rate. Could be fractional E.g. 59.97
		fRefreshRate: Single;	
/// Screen orientation. E.g., 0, 90, 180, 270.
		iOrientation: Integer;	
/// Vista mode flag indicating Progressive or Interlaced mode.
		iModeFlag: Integer;	
/// The bit mask identifying the number of bits this Mode is currently using. It is the sum of all the bit definitions defined in \ref define_displaymode
		iModeMask: Integer;				
/// The bit mask identifying the display status. The detailed definition is in  \ref define_displaymode
		iModeValue: Integer;	
	end;
	TADLMode = ADLMode;
	{$EXTERNALSYM TADLMode}
	LPADLMode = ^ADLMode;
	{$EXTERNALSYM LPADLMode}



/////////////////////////////////////////////////////////////////////////////////////////////
/// \brief Structure containing information about display target information.
///
/// This structure is used to store the display target information.
/// \nosubgrouping
////////////////////////////////////////////////////////////////////////////////////////////
type  	
	ADLDisplayTarget = record 
	/// The Display ID.
		displayID: ADLDisplayID;	 
	/// The display map index identify this manner and the desktop surface.
		iDisplayMapIndex: Integer;	 
	/// The bit mask identifies the number of bits DisplayTarget is currently using. It is the sum of all the bit definitions defined in \ref ADL_DISPLAY_DISPLAYTARGET_PREFERRED.
		iDisplayTargetMask: Integer;	 
	/// The bit mask identifies the display status. The detailed definition is in \ref ADL_DISPLAY_DISPLAYTARGET_PREFERRED.
		iDisplayTargetValue: Integer;	 
	end;
	TADLDisplayTarget = ADLDisplayTarget;
	{$EXTERNALSYM TADLDisplayTarget}
	LPADLDisplayTarget = ^ADLDisplayTarget;
	{$EXTERNALSYM LPADLDisplayTarget}



/////////////////////////////////////////////////////////////////////////////////////////////
///\brief Structure containing information about the display SLS bezel Mode information.
///
/// This structure is used to store the display SLS bezel Mode information.  
/// \nosubgrouping
////////////////////////////////////////////////////////////////////////////////////////////
type  	
	tagADLBezelTransientMode = record 
	/// Adapter Index
		iAdapterIndex: Integer;
	/// SLS Map Index
		iSLSMapIndex: Integer;	
	/// The mode index
		iSLSModeIndex: Integer;	 
	/// The mode
		displayMode: ADLMode;	
	/// The number of bezel offsets belongs to this map 
		iNumBezelOffset: Integer;	 
	/// The first bezel offset array index in the native mode array 
		iFirstBezelOffsetArrayIndex: Integer;	 
    /// The bit mask identifies the bits this structure is currently using. It will be the total OR of all the bit definitions.
		iSLSBezelTransientModeMask: Integer;	 
    /// The bit mask identifies the display status. The detail definition is defined below.
		iSLSBezelTransientModeValue: Integer;	 
	end;
	ADLBezelTransientMode = tagADLBezelTransientMode;
	{$EXTERNALSYM ADLBezelTransientMode}
	LPADLBezelTransientMode = ^tagADLBezelTransientMode;
	{$EXTERNALSYM LPADLBezelTransientMode}



/////////////////////////////////////////////////////////////////////////////////////////////
/// \brief Structure containing information about the adapter display manner.
///
/// This structure is used to store adapter display manner information
/// This information can be returned to the user. Alternatively, it can be used to access various driver calls to
/// fetch various display device related display manner settings upon the user's request.
/// \nosubgrouping
////////////////////////////////////////////////////////////////////////////////////////////
type  	
	ADLAdapterDisplayCap = record 
	/// The Persistent logical Adapter Index.
		iAdapterIndex: Integer;	 
	/// The bit mask identifies the number of bits AdapterDisplayCap is currently using. Sum all the bits defined in ADL_ADAPTER_DISPLAYCAP_XXX
		iAdapterDisplayCapMask: Integer;	
	/// The bit mask identifies the status. Refer to ADL_ADAPTER_DISPLAYCAP_XXX
		iAdapterDisplayCapValue: Integer;	 
	end;
	TADLAdapterDisplayCap = ADLAdapterDisplayCap;
	{$EXTERNALSYM TADLAdapterDisplayCap}
	LPADLAdapterDisplayCap = ^ADLAdapterDisplayCap;
	{$EXTERNALSYM LPADLAdapterDisplayCap}



/////////////////////////////////////////////////////////////////////////////////////////////
///\brief Structure containing information about display mapping.
///
/// This structure is used to store the display mapping data such as display manner.
/// For displays with horizontal or vertical stretch manner, 
/// this structure also stores the display order, display row, and column data.
/// \nosubgrouping
////////////////////////////////////////////////////////////////////////////////////////////
type  	
	ADLDisplayMap = record 
/// The current display map index. It is the OS desktop index. For example, if the OS index 1 is showing clone mode, the display map will be 1. 
		iDisplayMapIndex: Integer;	 
/// The Display Mode for the current map
		displayMode: ADLMode;	 
/// The number of display targets belongs to this map\n
		iNumDisplayTarget: Integer;	 
/// The first target array index in the Target array\n
		iFirstDisplayTargetArrayIndex: Integer;	 
/// The bit mask identifies the number of bits DisplayMap is currently using. It is the sum of all the bit definitions defined in ADL_DISPLAY_DISPLAYMAP_MANNER_xxx.
		iDisplayMapMask: Integer;	 
///The bit mask identifies the display status. The detailed definition is in ADL_DISPLAY_DISPLAYMAP_MANNER_xxx.
		iDisplayMapValue: Integer;	 
	end;
	TADLDisplayMap = ADLDisplayMap;
	{$EXTERNALSYM TADLDisplayMap}
	LPADLDisplayMap = ^ADLDisplayMap;
	{$EXTERNALSYM LPADLDisplayMap}



/////////////////////////////////////////////////////////////////////////////////////////////
/// \brief Structure containing information about the display device possible map for one GPU
///
/// This structure is used to store the display device possible map
/// This information can be returned to the user. 
/// \nosubgrouping
////////////////////////////////////////////////////////////////////////////////////////////
type  	
	ADLPossibleMap = record 
	/// The current PossibleMap index. Each PossibleMap is assigned an index
		iIndex: Integer;	
	/// The adapter index identifying the GPU for which to validate these Maps & Targets
		iAdapterIndex: Integer;	
	/// Number of display Maps for this GPU to be validated
		iNumDisplayMap: Integer;	   
	/// The display Maps list to validate
		 displayMap: ^ADLDisplayMap;	  
	/// the number of display Targets for these display Maps
		iNumDisplayTarget: Integer;	   
	/// The display Targets list for these display Maps to be validated.
		 displayTarget: ^ADLDisplayTarget;	 
	end;
	TADLPossibleMap = ADLPossibleMap;
	{$EXTERNALSYM TADLPossibleMap}
	LPADLPossibleMap = ^ADLPossibleMap;
	{$EXTERNALSYM LPADLPossibleMap}



/////////////////////////////////////////////////////////////////////////////////////////////
/// \brief Structure containing information about display possible mapping.
///
/// This structure is used to store the display possible mapping's controller index for the current display.
/// \nosubgrouping
////////////////////////////////////////////////////////////////////////////////////////////
type  	
	ADLPossibleMapping = record 
		iDisplayIndex: Integer;					///< The display index. Each display is assigned an index.
		iDisplayControllerIndex: Integer;		///< The controller index to which display is mapped.
		iDisplayMannerSupported: Integer;		///< The supported display manner.
	end;
	TADLPossibleMapping = ADLPossibleMapping;
	{$EXTERNALSYM TADLPossibleMapping}
	LPADLPossibleMapping = ^ADLPossibleMapping;
	{$EXTERNALSYM LPADLPossibleMapping}


/////////////////////////////////////////////////////////////////////////////////////////////
/// \brief Structure containing information about the validated display device possible map result.
///
/// This structure is used to store the validated display device possible map result
/// This information can be returned to the user. 
/// \nosubgrouping
////////////////////////////////////////////////////////////////////////////////////////////
type  	
	ADLPossibleMapResult = record 
	/// The current display map index. It is the OS Desktop index. For example, OS Index 1 showing clone mode. The Display Map will be 1. 
		iIndex: Integer;	 
	// The bit mask identifies the number of bits   PossibleMapResult is currently using. It will be the sum all the bit definitions defined in ADL_DISPLAY_POSSIBLEMAPRESULT_VALID.
		iPossibleMapResultMask: Integer;	  
	/// The bit mask identifies the possible map result. The detail definition is defined in ADL_DISPLAY_POSSIBLEMAPRESULT_XXX.
		iPossibleMapResultValue: Integer;	   
	end;
	TADLPossibleMapResult = ADLPossibleMapResult;
	{$EXTERNALSYM TADLPossibleMapResult}
	LPADLPossibleMapResult = ^ADLPossibleMapResult;
	{$EXTERNALSYM LPADLPossibleMapResult}


/////////////////////////////////////////////////////////////////////////////////////////////
///\brief Structure containing information about the display SLS Grid information.
///
/// This structure is used to store the display SLS Grid information.  
/// \nosubgrouping
////////////////////////////////////////////////////////////////////////////////////////////
type  	
	ADLSLSGrid = record 
/// The Adapter index.
		iAdapterIndex: Integer;	 
/// The grid index.
		iSLSGridIndex: Integer;		
/// The grid row.
		iSLSGridRow: Integer;		       
/// The grid column.
		iSLSGridColumn: Integer;		
/// The grid bit mask identifies the number of bits DisplayMap is currently using. Sum of all bits defined in ADL_DISPLAY_SLSGRID_ORIENTATION_XXX
		iSLSGridMask: Integer;		
/// The grid bit value identifies the display status. Refer to ADL_DISPLAY_SLSGRID_ORIENTATION_XXX
		iSLSGridValue: Integer;		
	end;
	TADLSLSGrid = ADLSLSGrid;
	{$EXTERNALSYM TADLSLSGrid}
	LPADLSLSGrid = ^ADLSLSGrid;
	{$EXTERNALSYM LPADLSLSGrid}


/////////////////////////////////////////////////////////////////////////////////////////////
///\brief Structure containing information about the display SLS Map information.
///
/// This structure is used to store the display SLS Map information.  
/// \nosubgrouping
////////////////////////////////////////////////////////////////////////////////////////////
type  	
	ADLSLSMap = record 
	/// The Adapter Index
		iAdapterIndex: Integer;	 
	/// The current display map index. It is the OS Desktop index. For example, OS Index 1 showing clone mode. The Display Map will be 1. 
		iSLSMapIndex: Integer;	 
	/// Indicate the current grid
		grid: ADLSLSGrid;	  
	/// OS surface index
		iSurfaceMapIndex: Integer;	
	 ///  Screen orientation. E.g., 0, 90, 180, 270 
		iOrientation: Integer;	
	/// The number of display targets belongs to this map 
		iNumSLSTarget: Integer;	 
	/// The first target array index in the Target array 
		iFirstSLSTargetArrayIndex: Integer;	 
	/// The number of native modes belongs to this map
		iNumNativeMode: Integer;	 
	/// The first native mode array index in the native mode array 
		iFirstNativeModeArrayIndex: Integer;	 
	/// The number of bezel modes belongs to this map 
		iNumBezelMode: Integer;	 
	/// The first bezel mode array index in the native mode array 
		iFirstBezelModeArrayIndex: Integer;	 
	/// The number of bezel offsets belongs to this map 
		iNumBezelOffset: Integer;	 
	/// The first bezel offset array index in the  
		iFirstBezelOffsetArrayIndex: Integer;	 
	/// The bit mask identifies the number of bits DisplayMap is currently using. Sum all the bit definitions defined in ADL_DISPLAY_SLSMAP_XXX.
		iSLSMapMask: Integer;	 
	/// The bit mask identifies the display map status. Refer to ADL_DISPLAY_SLSMAP_XXX 
		iSLSMapValue: Integer;	
	end;
	TADLSLSMap = ADLSLSMap;
	{$EXTERNALSYM TADLSLSMap}
	LPADLSLSMap = ^ADLSLSMap;
	{$EXTERNALSYM LPADLSLSMap}


/////////////////////////////////////////////////////////////////////////////////////////////
///\brief Structure containing information about the display SLS Offset information.
///
/// This structure is used to store the display SLS Offset information.  
/// \nosubgrouping
////////////////////////////////////////////////////////////////////////////////////////////
type  	
	ADLSLSOffset = record 
	/// The Adapter Index
		iAdapterIndex: Integer;	 
	/// The current display map index. It is the OS Desktop index. For example, OS Index 1 showing clone mode. The Display Map will be 1. 
		iSLSMapIndex: Integer;	 
	/// The Display ID.
		displayID: ADLDisplayID;	 
	/// SLS Bezel Mode Index
		iBezelModeIndex: Integer;	
	/// SLS Bezel Offset X 
		iBezelOffsetX: Integer;	  
	/// SLS Bezel Offset Y
		iBezelOffsetY: Integer;	  
	/// SLS Display Width 
		iDisplayWidth: Integer;	  
	/// SLS Display Height
		iDisplayHeight: Integer;	  
	/// The bit mask identifies the number of bits Offset is currently using.
		iBezelOffsetMask: Integer;	 
	/// The bit mask identifies the display status. 
		iBezelffsetValue: Integer;	 
	end;
	TADLSLSOffset = ADLSLSOffset;
	{$EXTERNALSYM TADLSLSOffset}
	LPADLSLSOffset = ^ADLSLSOffset;
	{$EXTERNALSYM LPADLSLSOffset}


/////////////////////////////////////////////////////////////////////////////////////////////
///\brief Structure containing information about the display SLS Mode information.
///
/// This structure is used to store the display SLS Mode information.  
/// \nosubgrouping
////////////////////////////////////////////////////////////////////////////////////////////
type  	
	ADLSLSMode = record 
	/// The Adapter Index
		iAdapterIndex: Integer;	 
	/// The current display map index. It is the OS Desktop index. For example, OS Index 1 showing clone mode. The Display Map will be 1. 
		iSLSMapIndex: Integer;	 
	/// The mode index
		iSLSModeIndex: Integer;	 
	/// The mode for this map.
		displayMode: ADLMode;	 
	/// The bit mask identifies the number of bits Mode is currently using. 
		iSLSNativeModeMask: Integer;	 
	/// The bit mask identifies the display status. 
		iSLSNativeModeValue: Integer;	 
	end;
	TADLSLSMode = ADLSLSMode;
	{$EXTERNALSYM TADLSLSMode}
	LPADLSLSMode = ^ADLSLSMode;
	{$EXTERNALSYM LPADLSLSMode}





/////////////////////////////////////////////////////////////////////////////////////////////
///\brief Structure containing information about the display Possible SLS Map information.
///
/// This structure is used to store the display Possible SLS Map information.  
/// \nosubgrouping
////////////////////////////////////////////////////////////////////////////////////////////
type  	
	ADLPossibleSLSMap = record 
	/// The current display map index. It is the OS Desktop index. 
	/// For example, OS Index 1 showing clone mode. The Display Map will be 1. 
		iSLSMapIndex: Integer;	 
	/// Number of display map to be validated.
		iNumSLSMap: Integer;	  
	/// The display map list for validation
		 lpSLSMap: ^ADLSLSMap;	  
	/// the number of display map config to be validated.
		iNumSLSTarget: Integer;	  
	/// The display target list for validation.
		 lpDisplayTarget: ^ADLDisplayTarget;
	end;
	TADLPossibleSLSMap = ADLPossibleSLSMap;
	{$EXTERNALSYM TADLPossibleSLSMap}
	LPADLPossibleSLSMap = ^ADLPossibleSLSMap;
	{$EXTERNALSYM LPADLPossibleSLSMap}



/////////////////////////////////////////////////////////////////////////////////////////////
///\brief Structure containing information about the SLS targets.
///
/// This structure is used to store the SLS targets information.  
/// \nosubgrouping
////////////////////////////////////////////////////////////////////////////////////////////
type  	
	ADLSLSTarget = record 
	/// the logic adapter index
		iAdapterIndex: Integer;	 
	/// The SLS map index
		iSLSMapIndex: Integer;	 
	/// The target ID
		displayTarget: ADLDisplayTarget;	 
	/// Target postion X in SLS grid
		iSLSGridPositionX: Integer;	 
	/// Target postion Y in SLS grid
		iSLSGridPositionY: Integer;	 
	/// The view size width, height and rotation angle per SLS Target 
		viewSize: ADLMode;	 
	/// The bit mask identifies the bits in iSLSTargetValue are currently used
		iSLSTargetMask: Integer;	 
	/// The bit mask identifies status info. It is for function extension purpose
		iSLSTargetValue: Integer;	 
	end;
	TADLSLSTarget = ADLSLSTarget;
	{$EXTERNALSYM TADLSLSTarget}
	LPADLSLSTarget = ^ADLSLSTarget;
	{$EXTERNALSYM LPADLSLSTarget}


/////////////////////////////////////////////////////////////////////////////////////////////
///\brief Structure containing information about the Adapter offset stepping size.
///
/// This structure is used to store the Adapter offset stepping size information.
/// \nosubgrouping
////////////////////////////////////////////////////////////////////////////////////////////
type  	
	ADLBezelOffsetSteppingSize = record 
	/// the logic adapter index
		iAdapterIndex: Integer;	 
	/// The SLS map index
		iSLSMapIndex: Integer;	 
	/// Bezel X stepping size offset
		iBezelOffsetSteppingSizeX: Integer;	 
	/// Bezel Y stepping size offset
		iBezelOffsetSteppingSizeY: Integer;	 
	/// Identifies the bits this structure is currently using. It will be the total OR of all the bit definitions.
		iBezelOffsetSteppingSizeMask: Integer;	 
	/// Bit mask identifies the display status.
		iBezelOffsetSteppingSizeValue: Integer;	 
	end;
	TADLBezelOffsetSteppingSize = ADLBezelOffsetSteppingSize;
	{$EXTERNALSYM TADLBezelOffsetSteppingSize}
	LPADLBezelOffsetSteppingSize = ^ADLBezelOffsetSteppingSize;
	{$EXTERNALSYM LPADLBezelOffsetSteppingSize}


/////////////////////////////////////////////////////////////////////////////////////////////
///\brief Structure containing information about driver supported PowerExpress Config Caps
///
/// This structure is used to store the driver supported PowerExpress Config Caps
/// \nosubgrouping
////////////////////////////////////////////////////////////////////////////////////////////
type  	
	ADLPXConfigCaps = record 
    /// The Persistent logical Adapter Index.
		iAdapterIndex: Integer;	 
    /// The bit mask identifies the number of bits PowerExpress Config Caps is currently using. It is the sum of all the bit definitions defined in \ref ADL_PX_CONFIGCAPS_XXXX.
		iPXConfigCapMask: Integer;	 
    /// The bit mask identifies the PowerExpress Config Caps value. The detailed definition is in \ref ADL_PX_CONFIGCAPS_XXXX.
		iPXConfigCapValue: Integer;	 
	end;
	TADLPXConfigCaps = ADLPXConfigCaps;
	{$EXTERNALSYM TADLPXConfigCaps}
	LPADLPXConfigCaps = ^ADLPXConfigCaps;
	{$EXTERNALSYM LPADLPXConfigCaps}



/////////////////////////////////////////////////////////////////////////////////////////////
///\brief Structure containing information about an application
///
/// This structure is used to store basic information of an application
/// \nosubgrouping
////////////////////////////////////////////////////////////////////////////////////////////
type  	
	_ADLApplicationData = record 
	/// Path Name
		strPathName : array[0..ADL_MAX_PATH-1] of AnsiChar;
	/// File Name
		strFileName : array[0..ADL_APP_PROFILE_FILENAME_LENGTH-1] of AnsiChar;
	/// Creation timestamp
		strTimeStamp : array[0..ADL_APP_PROFILE_TIMESTAMP_LENGTH-1] of AnsiChar;
	/// Version
		strVersion : array[0..ADL_APP_PROFILE_VERSION_LENGTH-1] of AnsiChar;
	end;
	ADLApplicationData = _ADLApplicationData;
	{$EXTERNALSYM ADLApplicationData}


/////////////////////////////////////////////////////////////////////////////////////////////
///\brief Structure containing information about an application
///
/// This structure is used to store basic information of an application
/// \nosubgrouping
////////////////////////////////////////////////////////////////////////////////////////////
type  	
	_ADLApplicationDataX2 = record 
	/// Path Name
		strPathName : array[0..ADL_MAX_PATH-1] of WideChar;
	/// File Name
		strFileName : array[0..ADL_APP_PROFILE_FILENAME_LENGTH-1] of WideChar;
	/// Creation timestamp
		strTimeStamp : array[0..ADL_APP_PROFILE_TIMESTAMP_LENGTH-1] of WideChar;
	/// Version
		strVersion : array[0..ADL_APP_PROFILE_VERSION_LENGTH-1] of WideChar;
	end;
	ADLApplicationDataX2 = _ADLApplicationDataX2;
	{$EXTERNALSYM ADLApplicationDataX2}


/////////////////////////////////////////////////////////////////////////////////////////////
///\brief Structure containing information of a property of an application profile
///
/// This structure is used to store property information of an application profile
/// \nosubgrouping
////////////////////////////////////////////////////////////////////////////////////////////
type  	
	_PropertyRecord = record 
	/// Property Name
		strName : array[0..ADL_APP_PROFILE_PROPERTY_LENGTH-1] of AnsiChar;
	/// Property Type
		eType: ADLProfilePropertyType;	
	/// Data Size in bytes
		iDataSize: Integer;	
	/// Property Value, can be any data type
		uData : array[0..0] of Byte;
	end;
	PropertyRecord = _PropertyRecord;
	{$EXTERNALSYM PropertyRecord}


/////////////////////////////////////////////////////////////////////////////////////////////
///\brief Structure containing information about an application profile
///
/// This structure is used to store information of an application profile
/// \nosubgrouping
////////////////////////////////////////////////////////////////////////////////////////////
type  	
	_ADLApplicationProfile = record
	/// Number of properties
		iCount: Integer;
	/// Buffer to store all property records
		record_ : array[0..0] of PropertyRecord;
	end;
	ADLApplicationProfile = _ADLApplicationProfile;
	{$EXTERNALSYM ADLApplicationProfile}


// @}

/////////////////////////////////////////////////////////////////////////////////////////////
///\brief Structure containing information about an OD5 Power Control feature
///
/// This structure is used to store information of an Power Control feature
/// \nosubgrouping
////////////////////////////////////////////////////////////////////////////////////////////
type  	
	ADLPowerControlInfo = record 
/// Minimum value.
		iMinValue: Integer;	 
/// Maximum value.
		iMaxValue: Integer;	
/// The minimum change in between minValue and maxValue.
		iStepValue: Integer;	  
	end;
	TADLPowerControlInfo = ADLPowerControlInfo;
	{$EXTERNALSYM TADLPowerControlInfo}


/////////////////////////////////////////////////////////////////////////////////////////////
///\brief Structure containing information about an controller mode
///
/// This structure is used to store information of an controller mode
/// \nosubgrouping
////////////////////////////////////////////////////////////////////////////////////////////
type  	
	_ADLControllerMode = record 
    /// This falg indicates actions that will be applied by set viewport
    /// The value can be a combination of ADL_CONTROLLERMODE_CM_MODIFIER_VIEW_POSITION,
    /// ADL_CONTROLLERMODE_CM_MODIFIER_VIEW_PANLOCK and ADL_CONTROLLERMODE_CM_MODIFIER_VIEW_SIZE
		iModifiers: Integer;	            
    /// Horizontal view starting position
		iViewPositionCx: Integer;	       
    /// Vertical view starting position
		iViewPositionCy: Integer;	       
    /// Horizontal left panlock position
		iViewPanLockLeft: Integer;	      
    /// Horizontal right panlock position
		iViewPanLockRight: Integer;	     
    /// Vertical top panlock position
		iViewPanLockTop: Integer;	       
    /// Vertical bottom panlock position
		iViewPanLockBottom: Integer;	    
    /// View resolution in pixels (width)
		iViewResolutionCx: Integer;
    /// View resolution in pixels (hight)
		iViewResolutionCy: Integer;	     
	end;
	ADLControllerMode = _ADLControllerMode;
	{$EXTERNALSYM ADLControllerMode}


/////////////////////////////////////////////////////////////////////////////////////////////
///\brief Structure containing information about a display
///
/// This structure is used to store information about a display
/// \nosubgrouping
////////////////////////////////////////////////////////////////////////////////////////////
type  	
	ADLDisplayIdentifier = record 
    /// ADL display index
		ulDisplayIndex: LongInt;	
    /// manufacturer ID of the display
		ulManufacturerId: LongInt;	  
    /// product ID of the display
		ulProductId: LongInt;	 
    /// serial number of the display
		ulSerialNo: LongInt;	 
	end;
	TADLDisplayIdentifier = ADLDisplayIdentifier;
	{$EXTERNALSYM TADLDisplayIdentifier}


/////////////////////////////////////////////////////////////////////////////////////////////
///\brief Structure containing information about Overdrive 6 clock range
///
/// This structure is used to store information about Overdrive 6 clock range
/// \nosubgrouping
////////////////////////////////////////////////////////////////////////////////////////////
type  	
	_ADLOD6ParameterRange = record 
    /// The starting value of the clock range
		iMin: Integer;	
    /// The ending value of the clock range
		iMax: Integer;		
    /// The minimum increment between clock values
		iStep: Integer;		
	end;
	ADLOD6ParameterRange = _ADLOD6ParameterRange;
	{$EXTERNALSYM ADLOD6ParameterRange}


/////////////////////////////////////////////////////////////////////////////////////////////
///\brief Structure containing information about Overdrive 6 capabilities
///
/// This structure is used to store information about Overdrive 6 capabilities
/// \nosubgrouping
////////////////////////////////////////////////////////////////////////////////////////////
type  	
	_ADLOD6Capabilities = record 
		/// Contains a bitmap of the OD6 capability flags.  Possible values: \ref ADL_OD6_CAPABILITY_SCLK_CUSTOMIZATION,
    /// \ref ADL_OD6_CAPABILITY_MCLK_CUSTOMIZATION, \ref ADL_OD6_CAPABILITY_GPU_ACTIVITY_MONITOR
		iCapabilities: Integer;	
    /// Contains a bitmap indicating the power states
    /// supported by OD6.  Currently only the performance state
    /// is supported. Possible Values: \ref ADL_OD6_SUPPORTEDSTATE_PERFORMANCE
		iSupportedStates: Integer;	
    /// Number of levels. OD6 will always use 2 levels, which describe
    /// the minimum to maximum clock ranges.
    /// The 1st level indicates the minimum clocks, and the 2nd level 
    /// indicates the maximum clocks.
		iNumberOfPerformanceLevels: Integer;	
    /// Contains the hard limits of the sclk range.  Overdrive
    /// clocks cannot be set outside this range.
		sEngineClockRange: ADLOD6ParameterRange;	
    /// Contains the hard limits of the mclk range.  Overdrive
    /// clocks cannot be set outside this range.
		sMemoryClockRange: ADLOD6ParameterRange;	
    /// Value for future extension
		iExtValue: Integer;	
    /// Mask for future extension
		iExtMask: Integer;	
	end;
	ADLOD6Capabilities = _ADLOD6Capabilities;
	{$EXTERNALSYM ADLOD6Capabilities}


/////////////////////////////////////////////////////////////////////////////////////////////
///\brief Structure containing information about Overdrive 6 clock values.
///
/// This structure is used to store information about Overdrive 6 clock values.
/// \nosubgrouping
////////////////////////////////////////////////////////////////////////////////////////////
type  	
	_ADLOD6PerformanceLevel = record 
    /// Engine (core) clock.
		iEngineClock: Integer;	
    /// Memory clock.
		iMemoryClock: Integer;	
	end;
	ADLOD6PerformanceLevel = _ADLOD6PerformanceLevel;
	{$EXTERNALSYM ADLOD6PerformanceLevel}


/////////////////////////////////////////////////////////////////////////////////////////////
///\brief Structure containing information about Overdrive 6 clocks.
///
/// This structure is used to store information about Overdrive 6 clocks.  This is a
/// variable-sized structure.  iNumberOfPerformanceLevels indicate how many elements
/// are contained in the aLevels array.
/// \nosubgrouping
////////////////////////////////////////////////////////////////////////////////////////////
type  	
	_ADLOD6StateInfo = record 
    /// Number of levels.  OD6 uses clock ranges instead of discrete performance levels.
    /// iNumberOfPerformanceLevels is always 2.  The 1st level indicates the minimum clocks 
    /// in the range.  The 2nd level indicates the maximum clocks in the range.
		iNumberOfPerformanceLevels: Integer;	
    /// Value for future extension
		iExtValue: Integer;	
    /// Mask for future extension
		iExtMask: Integer;	
    /// Variable-sized array of levels. 
    /// The number of elements in the array is specified by iNumberofPerformanceLevels.
		aLevels : array[0..0] of ADLOD6PerformanceLevel;
	end;
	ADLOD6StateInfo = _ADLOD6StateInfo;
	{$EXTERNALSYM ADLOD6StateInfo}


/////////////////////////////////////////////////////////////////////////////////////////////
///\brief Structure containing information about current Overdrive 6 performance status.
///
/// This structure is used to store information about current Overdrive 6 performance status.
/// \nosubgrouping
////////////////////////////////////////////////////////////////////////////////////////////
type  	
	_ADLOD6CurrentStatus = record 
    /// Current engine clock
		iEngineClock: Integer;	
    /// Current memory clock
		iMemoryClock: Integer;	
    /// Current GPU activity in percent.  This
    /// indicates how "busy" the GPU is.
		iActivityPercent: Integer;	
    /// Not used.  Reserved for future use.
		iCurrentPerformanceLevel: Integer;	
    /// Current PCI-E bus speed
		iCurrentBusSpeed: Integer;	
    /// Current PCI-E bus # of lanes
		iCurrentBusLanes: Integer;	
    /// Maximum possible PCI-E bus # of lanes
		iMaximumBusLanes: Integer;	
    /// Value for future extension
		iExtValue: Integer;	
    /// Mask for future extension
		iExtMask: Integer;	
	end;
	ADLOD6CurrentStatus = _ADLOD6CurrentStatus;
	{$EXTERNALSYM ADLOD6CurrentStatus}


/////////////////////////////////////////////////////////////////////////////////////////////
///\brief Structure containing information about Overdrive 6 thermal contoller capabilities
///
/// This structure is used to store information about Overdrive 6 thermal controller capabilities
/// \nosubgrouping
////////////////////////////////////////////////////////////////////////////////////////////
type  	
	_ADLOD6ThermalControllerCaps = record
		/// Contains a bitmap of thermal controller capability flags. Possible values: \ref ADL_OD6_TCCAPS_THERMAL_CONTROLLER, \ref ADL_OD6_TCCAPS_FANSPEED_CONTROL,
    /// \ref ADL_OD6_TCCAPS_FANSPEED_PERCENT_READ, \ref ADL_OD6_TCCAPS_FANSPEED_PERCENT_WRITE, \ref ADL_OD6_TCCAPS_FANSPEED_RPM_READ, \ref ADL_OD6_TCCAPS_FANSPEED_RPM_WRITE
		iCapabilities: Integer;
    /// Minimum fan speed expressed as a percentage
		iFanMinPercent: Integer;	
    /// Maximum fan speed expressed as a percentage
		iFanMaxPercent: Integer;
    /// Minimum fan speed expressed in revolutions-per-minute
		iFanMinRPM: Integer;	
    /// Maximum fan speed expressed in revolutions-per-minute
		iFanMaxRPM: Integer;	
    /// Value for future extension
		iExtValue: Integer;	
    /// Mask for future extension
		iExtMask: Integer;	
	end;
	ADLOD6ThermalControllerCaps = _ADLOD6ThermalControllerCaps;
	{$EXTERNALSYM ADLOD6ThermalControllerCaps}


/////////////////////////////////////////////////////////////////////////////////////////////
///\brief Structure containing information about Overdrive 6 fan speed information
///
/// This structure is used to store information about Overdrive 6 fan speed information
/// \nosubgrouping
////////////////////////////////////////////////////////////////////////////////////////////
type  	
	_ADLOD6FanSpeedInfo = record 
		/// Contains a bitmap of the valid fan speed type flags.  Possible values: \ref ADL_OD6_FANSPEED_TYPE_PERCENT, \ref ADL_OD6_FANSPEED_TYPE_RPM, \ref ADL_OD6_FANSPEED_USER_DEFINED
		iSpeedType: Integer;	
    /// Contains current fan speed in percent (if valid flag exists in iSpeedType)
		iFanSpeedPercent: Integer;	
    /// Contains current fan speed in RPM (if valid flag exists in iSpeedType)
		iFanSpeedRPM: Integer;	
    /// Value for future extension
		iExtValue: Integer;	
    /// Mask for future extension
		iExtMask: Integer;	
	end;
	ADLOD6FanSpeedInfo = _ADLOD6FanSpeedInfo;
	{$EXTERNALSYM ADLOD6FanSpeedInfo}


/////////////////////////////////////////////////////////////////////////////////////////////
///\brief Structure containing information about Overdrive 6 fan speed value
///
/// This structure is used to store information about Overdrive 6 fan speed value
/// \nosubgrouping
////////////////////////////////////////////////////////////////////////////////////////////
type
	_ADLOD6FanSpeedValue = record 
		/// Indicates the units of the fan speed.  Possible values: \ref ADL_OD6_FANSPEED_TYPE_PERCENT, \ref ADL_OD6_FANSPEED_TYPE_RPM
		iSpeedType: Integer;	
    /// Fan speed value (units as indicated above)
		iFanSpeed: Integer;	
    /// Value for future extension
		iExtValue: Integer;	
    /// Mask for future extension
		iExtMask: Integer;	
	end;
	ADLOD6FanSpeedValue = _ADLOD6FanSpeedValue;
	{$EXTERNALSYM ADLOD6FanSpeedValue}


/////////////////////////////////////////////////////////////////////////////////////////////
///\brief Structure containing information about Overdrive 6 PowerControl settings.
///
/// This structure is used to store information about Overdrive 6 PowerControl settings.
/// PowerControl is the feature which allows the performance characteristics of the GPU
/// to be adjusted by changing the PowerTune power limits.
/// \nosubgrouping
////////////////////////////////////////////////////////////////////////////////////////////
type  	
	_ADLOD6PowerControlInfo = record 
    /// The minimum PowerControl adjustment value
		iMinValue: Integer;	
    /// The maximum PowerControl adjustment value
		iMaxValue: Integer;	
    /// The minimum difference between PowerControl adjustment values
		iStepValue: Integer;	  
    /// Value for future extension
		iExtValue: Integer;	
    /// Mask for future extension
		iExtMask: Integer;	
	end;
	ADLOD6PowerControlInfo = _ADLOD6PowerControlInfo;
	{$EXTERNALSYM ADLOD6PowerControlInfo}


/////////////////////////////////////////////////////////////////////////////////////////////
///\brief Structure containing information about Overdrive 6 PowerControl settings.
///
/// This structure is used to store information about Overdrive 6 PowerControl settings.
/// PowerControl is the feature which allows the performance characteristics of the GPU
/// to be adjusted by changing the PowerTune power limits.
/// \nosubgrouping
////////////////////////////////////////////////////////////////////////////////////////////
type  	
	_ADLOD6VoltageControlInfo = record 
    /// The minimum VoltageControl adjustment value
		iMinValue: Integer;	
    /// The maximum VoltageControl adjustment value
		iMaxValue: Integer;	
    /// The minimum difference between VoltageControl adjustment values
		iStepValue: Integer;	
    /// Value for future extension
		iExtValue: Integer;	
    /// Mask for future extension
		iExtMask: Integer;	
	end;
	ADLOD6VoltageControlInfo = _ADLOD6VoltageControlInfo;
	{$EXTERNALSYM ADLOD6VoltageControlInfo}


////////////////////////////////////////////////////////////////////////////////////////////
///\brief Structure containing ECC statistics namely SEC counts and DED counts
/// Single error count - count of errors that can be corrected
/// Doubt Error Detect -  count of errors that cannot be corrected
/// \nosubgrouping
////////////////////////////////////////////////////////////////////////////////////////////
type  	
	_ADLECCData = record 
	// Single error count - count of errors that can be corrected 
		iSec: Integer;	 
	// Double error detect - count of errors that cannot be corrected
		iDed: Integer;	 
	end;
	ADLECCData = _ADLECCData;
	{$EXTERNALSYM ADLECCData}



/// \brief Handle to ADL client context.
///
///  ADL clients obtain context handle from initial call to \ref ADL2_Main_Control_Create. 
///  Clients have to pass the handle to each subsequent ADL call and finally destroy
///  the context with call to \ref ADL2_Main_Control_Destroy 
/// \nosubgrouping
type
	ADL_CONTEXT_HANDLE = Pointer;
	{$EXTERNALSYM ADL_CONTEXT_HANDLE}
	

/////////////////////////////////////////////////////////////////////////////////////////////
///\brief Structure containing the display mode definition used per controller.
///
/// This structure is used to store the display mode definition used per controller.
/// \nosubgrouping
////////////////////////////////////////////////////////////////////////////////////////////
type  	
	ADLDisplayModeX2 = record 
/// Horizontal resolution (in pixels).
		iWidth: Integer;	
/// Vertical resolution (in lines).
		iHeight: Integer;	
/// Interlaced/Progressive. The value will be set for Interlaced as ADL_DL_TIMINGFLAG_INTERLACED. If not set it is progressive. Refer define_detailed_timing_flags.
		iScanType: Integer;	
/// Refresh rate.
		iRefreshRate: Integer;	
/// Timing Standard. Refer define_modetiming_standard.
		iTimingStandard: Integer;	
	end;
	TADLDisplayModeX2 = ADLDisplayModeX2;
	{$EXTERNALSYM TADLDisplayModeX2}


/////////////////////////////////////////////////////////////////////////////////////////////
///\brief Structure containing information about Overdrive 6 extension capabilities
///
/// This structure is used to store information about Overdrive 6 extension capabilities
/// \nosubgrouping
////////////////////////////////////////////////////////////////////////////////////////////
type  	
	_ADLOD6CapabilitiesEx = record 
		/// Contains a bitmap of the OD6 extension capability flags.  Possible values: \ref ADL_OD6_CAPABILITY_SCLK_CUSTOMIZATION,
    /// \ref ADL_OD6_CAPABILITY_MCLK_CUSTOMIZATION, \ref ADL_OD6_CAPABILITY_GPU_ACTIVITY_MONITOR, 
    /// \ref ADL_OD6_CAPABILITY_POWER_CONTROL, \ref ADL_OD6_CAPABILITY_VOLTAGE_CONTROL, \ref ADL_OD6_CAPABILITY_PERCENT_ADJUSTMENT,
    //// \ref ADL_OD6_CAPABILITY_THERMAL_LIMIT_UNLOCK 
		iCapabilities: Integer;
    /// The Power states that support clock and power customization.  Only performance state is currently supported.  
    /// Possible Values: \ref ADL_OD6_SUPPORTEDSTATE_PERFORMANCE
		iSupportedStates: Integer;	
    /// Returns the hard limits of the SCLK overdrive adjustment range.  Overdrive clocks should not be adjusted outside of this range.  The values are specified as +/- percentages.
		sEngineClockPercent: ADLOD6ParameterRange;	
    /// Returns the hard limits of the MCLK overdrive adjustment range.  Overdrive clocks should not be adjusted outside of this range.  The values are specified as +/- percentages.    
		sMemoryClockPercent: ADLOD6ParameterRange;	
    /// Returns the hard limits of the Power Limit adjustment range.  Power limit should not be adjusted outside this range.  The values are specified as +/- percentages.
		sPowerControlPercent: ADLOD6ParameterRange;	
    /// Reserved for future expansion of the structure.
		iExtValue: Integer;	
    /// Reserved for future expansion of the structure.
		iExtMask: Integer;	
	end;
	ADLOD6CapabilitiesEx = _ADLOD6CapabilitiesEx;
	{$EXTERNALSYM ADLOD6CapabilitiesEx}


/////////////////////////////////////////////////////////////////////////////////////////////
///\brief Structure containing information about Overdrive 6 extension state information
///
/// This structure is used to store information about Overdrive 6 extension state information
/// \nosubgrouping
////////////////////////////////////////////////////////////////////////////////////////////
type  	
	_ADLOD6StateEx = record 
    /// The current engine clock adjustment value, specified as a +/- percent.
		iEngineClockPercent: Integer;	
    /// The current memory clock adjustment value, specified as a +/- percent.
		iMemoryClockPercent: Integer;	
    /// The current power control adjustment value, specified as a +/- percent.
		iPowerControlPercent: Integer;	
    /// Reserved for future expansion of the structure.
		iExtValue: Integer;	
    /// Reserved for future expansion of the structure.
		iExtMask: Integer;	
	end;
	ADLOD6StateEx = _ADLOD6StateEx;
	{$EXTERNALSYM ADLOD6StateEx}


/////////////////////////////////////////////////////////////////////////////////////////////
///\brief Structure containing information about Overdrive 6 extension recommended maximum clock adjustment values
///
/// This structure is used to store information about Overdrive 6 extension recommended maximum clock adjustment values
/// \nosubgrouping
////////////////////////////////////////////////////////////////////////////////////////////
type  	
	_ADLOD6MaxClockAdjust = record 
    /// The recommended maximum engine clock adjustment in percent, for the specified power limit value.
		iEngineClockMax: Integer;	
    /// The recommended maximum memory clock adjustment in percent, for the specified power limit value.
    /// Currently the memory is independent of the Power Limit setting, so iMemoryClockMax will always return the maximum
    /// possible adjustment value.  This field is here for future enhancement in case we add a dependency between Memory Clock
    /// adjustment and Power Limit setting.
		iMemoryClockMax: Integer;	
    /// Reserved for future expansion of the structure.
		iExtValue: Integer;	
    /// Reserved for future expansion of the structure.
		iExtMask: Integer;	
	end;
	ADLOD6MaxClockAdjust = _ADLOD6MaxClockAdjust;
	{$EXTERNALSYM ADLOD6MaxClockAdjust}

implementation

end.
