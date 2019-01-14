Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp2893262wrt;
        Mon, 14 Jan 2019 02:43:06 -0800 (PST)
X-Google-Smtp-Source: ALg8bN6tt6pCv3h2JKSWU952EnBFi1arodQ9UDPYi+m6aDkjUZoDB950VuNxPpn7c6L1KzV98ZA4
X-Received: by 2002:adf:ebd0:: with SMTP id v16mr24926940wrn.109.1547462586605;
        Mon, 14 Jan 2019 02:43:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1547462586; cv=none;
        d=google.com; s=arc-20160816;
        b=P/qAO83sllmGTZxzLpJ0XMkgEF/+sEO9mIE2LKOTtPegSNwoKoTMJ4PE+ARKcIf+W2
         oqHOQcghBBcyjaRBpJMPaNirp9zQHFLsBx8ZBgN3as5vAtx50HHWukPk35e2ll2ZBm6A
         0l0gNB1a9eDvccsYcw5nJ5nDdHuby4HcpdP48A1bfhdYofuNM6H7uZpyOsHgm4MTDxEQ
         Ch3SOYzMuoqaQmitNEgl9dgATEIDDorkrtH2Y/y2K+M6ozyGh5Bejpvh//SZia8AR1O1
         gHi4eQCk5OHgi5DXKalgJWbBbWFT+wMltBaZxVwclwjqS/WSs6fUbAp+P6LaGBmNdPWv
         HW/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to;
        bh=yD/L6PoMr5D0PqoS8xAH5F3k8mohBIECjOPoNY/xZA0=;
        b=r0UwxZ9Vutq98SzychNQafeIKvr1vJGz8kMA5e1JreObZ+XmazkbCcz3jMxGta5hHa
         3q0oGTsJMSa4EUARrFWezahSbE0AU55W2vtVgOkRDTlIsVRuUzFgfoucWJGxId5OvFcH
         5Fyu39m4HrizOHYSdngZ3jHirjcOLfi+xVnNUWNRRFlfqjbvxSculD6w7r8Li6URPesC
         OHhluKaYUEA13KSc2kHcpfzc0rfFSA3BdVamhAeJZWGsNkUdsxWwDBYcjDdGLRZIqfOy
         9PCjotU3frq3nuOP0bC0BU3tt7zibT2K2zkxsCMjOqu8RFL1kBRJe+bUKz1HeUVRI4mO
         /gaw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r6si8545840wrg.298.2019.01.14.02.43.06
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 14 Jan 2019 02:43:06 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:41384 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gizhx-0005TZ-Kc
	for alex.bennee@linaro.org; Mon, 14 Jan 2019 05:43:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49871)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gizRi-0008Vh-6K
	for qemu-arm@nongnu.org; Mon, 14 Jan 2019 05:26:20 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gizRh-0000dy-6C
	for qemu-arm@nongnu.org; Mon, 14 Jan 2019 05:26:18 -0500
Received: from mail-wr1-f67.google.com ([209.85.221.67]:41775)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1gizRg-0000cf-VT
	for qemu-arm@nongnu.org; Mon, 14 Jan 2019 05:26:17 -0500
Received: by mail-wr1-f67.google.com with SMTP id x10so22128486wrs.8
	for <qemu-arm@nongnu.org>; Mon, 14 Jan 2019 02:26:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=yD/L6PoMr5D0PqoS8xAH5F3k8mohBIECjOPoNY/xZA0=;
	b=ZuOsTxzcJ361fOPL3tQWAoLdLqwDGRJd5yy/eQhrcQP0hoVCIJHtqG51vfBvIKYraK
	ChxxHJvKlrtYZ3F/4yRB6hSjJYbkzMn+oj2grpal+WVMT/OcoX+XoFM0H+bIuTYSugPW
	OQrU6DkZmgjiy0RZYFQZ8dKX8SfOryma46/Kzra4z/w43Fmu6PkfgRoyDFBMzYGukCbb
	mJ5FRj1JdU/g5VkTN6j+pCpdiIiV7Us3CqY2mSK0Qnrvd1y5xGaC9U78HI4eUT4jqw1M
	8TY33UGYWKu7nQzsJDfFXnWWw87utYAgmGiWvzpJwaHbM/lDTyNJ2GJwMUjjQy7y/CIk
	aD4g==
X-Gm-Message-State: AJcUukdXQW6JN20ndU8m8teMWlyycFZiRvUNAVQKkHy584Q4PR8dEztc
	mK+/dO9Akn6cohbgwh26DNH+Rg==
X-Received: by 2002:adf:8b83:: with SMTP id o3mr24525556wra.81.1547461576003; 
	Mon, 14 Jan 2019 02:26:16 -0800 (PST)
Received: from [192.168.1.33] (110.red-83-51-161.dynamicip.rima-tde.net.
	[83.51.161.110]) by smtp.gmail.com with ESMTPSA id
	o5sm49985896wmg.25.2019.01.14.02.26.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 14 Jan 2019 02:26:15 -0800 (PST)
To: Laszlo Ersek <lersek@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
References: <20190111140857.4211-1-philmd@redhat.com>
	<20190111140857.4211-6-philmd@redhat.com>
	<32678400-47af-a842-0563-0d1a72712b4a@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <7fb6c4f1-3a21-65ba-277f-8c2f53d2bb60@redhat.com>
Date: Mon, 14 Jan 2019 11:26:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.1
MIME-Version: 1.0
In-Reply-To: <32678400-47af-a842-0563-0d1a72712b4a@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.221.67
Subject: Re: [Qemu-arm] [PATCH 05/15] hw/nvram/fw_cfg: Remove various
 typedefs from "qemu/typedefs.h"
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
	qemu-block@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
	Ben Warren <ben@skyportsystems.com>, qemu-arm@nongnu.org,
	Gerd Hoffmann <kraxel@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ARLf2pYJXn5g

On 1/11/19 5:26 PM, Laszlo Ersek wrote:
> On 01/11/19 15:08, Philippe Mathieu-Daudé wrote:
>> There are only three files requiring these typedefs, let them
>> include "hw/nvram/fw_cfg.h" directly to simplify "qemu/typedefs.h".
>>
>> To clean "qemu/typedefs.h", move the forward declarations
>> to "hw/nvram/fw_cfg.h".
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> ---
>>  include/hw/acpi/vmgenid.h | 1 +
>>  include/hw/arm/virt.h     | 1 +
>>  include/hw/mem/nvdimm.h   | 1 +
>>  include/hw/nvram/fw_cfg.h | 8 +++++++-
>>  include/qemu/typedefs.h   | 4 ----
>>  5 files changed, 10 insertions(+), 5 deletions(-)
>>
>> diff --git a/include/hw/acpi/vmgenid.h b/include/hw/acpi/vmgenid.h
>> index 38586ecbdf..be53de38f1 100644
>> --- a/include/hw/acpi/vmgenid.h
>> +++ b/include/hw/acpi/vmgenid.h
>> @@ -3,6 +3,7 @@
>>  
>>  #include "hw/acpi/bios-linker-loader.h"
>>  #include "hw/qdev.h"
>> +#include "hw/nvram/fw_cfg.h"
>>  #include "qemu/uuid.h"
>>  
>>  #define VMGENID_DEVICE           "vmgenid"
>> diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
>> index 4cc57a7ef6..fef632dcf5 100644
>> --- a/include/hw/arm/virt.h
>> +++ b/include/hw/arm/virt.h
>> @@ -35,6 +35,7 @@
>>  #include "qemu/notify.h"
>>  #include "hw/boards.h"
>>  #include "hw/arm/arm.h"
>> +#include "hw/nvram/fw_cfg.h"
>>  #include "sysemu/kvm.h"
>>  #include "hw/intc/arm_gicv3_common.h"
>>  
>> diff --git a/include/hw/mem/nvdimm.h b/include/hw/mem/nvdimm.h
>> index c5c9b3c7f8..51d3a52c4b 100644
>> --- a/include/hw/mem/nvdimm.h
>> +++ b/include/hw/mem/nvdimm.h
>> @@ -24,6 +24,7 @@
>>  #define QEMU_NVDIMM_H
>>  
>>  #include "hw/mem/pc-dimm.h"
>> +#include "hw/nvram/fw_cfg.h"
>>  #include "hw/acpi/bios-linker-loader.h"
>>  
>>  #define NVDIMM_DEBUG 0
>> diff --git a/include/hw/nvram/fw_cfg.h b/include/hw/nvram/fw_cfg.h
>> index f5a6895a74..244ed78afa 100644
>> --- a/include/hw/nvram/fw_cfg.h
>> +++ b/include/hw/nvram/fw_cfg.h
>> @@ -14,7 +14,9 @@
>>  #define FW_CFG_IO(obj)  OBJECT_CHECK(FWCfgIoState,  (obj), TYPE_FW_CFG_IO)
>>  #define FW_CFG_MEM(obj) OBJECT_CHECK(FWCfgMemState, (obj), TYPE_FW_CFG_MEM)
>>  
>> -typedef struct fw_cfg_file FWCfgFile;
>> +typedef struct FWCfgState FWCfgState;
>> +typedef struct FWCfgIoState FWCfgIoState;
>> +typedef struct FWCfgMemState FWCfgMemState;
> 
> I think the resultant file would be easier to read if you moved the
> State typedefs before the spot where we make the first references to
> them, namely in the FW_CFG*() function-like macros.

I'm glad you suggested that, that is the style I like and how I went
through first, but then changed to follow this file style. I'll update
happily.

> 
> With that,
> 
> Reviewed-by: Laszlo Ersek <lersek@redhat.com>

Thanks!

> 
> Thanks
> Laszlo
> 
>>  
>>  #define FW_CFG_ORDER_OVERRIDE_VGA    70
>>  #define FW_CFG_ORDER_OVERRIDE_NIC    80
>> @@ -24,6 +26,8 @@ typedef struct fw_cfg_file FWCfgFile;
>>  void fw_cfg_set_order_override(FWCfgState *fw_cfg, int order);
>>  void fw_cfg_reset_order_override(FWCfgState *fw_cfg);
>>  
>> +typedef struct fw_cfg_file FWCfgFile;
>> +
>>  typedef struct FWCfgFiles {
>>      uint32_t  count;
>>      FWCfgFile f[];
>> @@ -34,6 +38,8 @@ typedef struct fw_cfg_dma_access FWCfgDmaAccess;
>>  typedef void (*FWCfgCallback)(void *opaque);
>>  typedef void (*FWCfgWriteCallback)(void *opaque, off_t start, size_t len);
>>  
>> +typedef struct FWCfgEntry FWCfgEntry;
>> +
>>  struct FWCfgState {
>>      /*< private >*/
>>      SysBusDevice parent_obj;
>> diff --git a/include/qemu/typedefs.h b/include/qemu/typedefs.h
>> index 3a5ca74bd3..1c294c296c 100644
>> --- a/include/qemu/typedefs.h
>> +++ b/include/qemu/typedefs.h
>> @@ -31,10 +31,6 @@ typedef struct DriveInfo DriveInfo;
>>  typedef struct Error Error;
>>  typedef struct EventNotifier EventNotifier;
>>  typedef struct FlatView FlatView;
>> -typedef struct FWCfgEntry FWCfgEntry;
>> -typedef struct FWCfgIoState FWCfgIoState;
>> -typedef struct FWCfgMemState FWCfgMemState;
>> -typedef struct FWCfgState FWCfgState;
>>  typedef struct HCIInfo HCIInfo;
>>  typedef struct HVFX86EmulatorState HVFX86EmulatorState;
>>  typedef struct I2CBus I2CBus;
>>
> 
