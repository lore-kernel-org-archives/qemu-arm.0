Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B1D1FCA191
	for <qemu-arm@archiver.kernel.org>; Mon,  9 Mar 2026 22:21:28 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vziyd-0007n1-1T; Mon, 09 Mar 2026 18:21:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vziyb-0007ml-IT
 for qemu-arm@nongnu.org; Mon, 09 Mar 2026 18:21:25 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vziyZ-0007x0-Oo
 for qemu-arm@nongnu.org; Mon, 09 Mar 2026 18:21:25 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-4852fdb36a8so28251335e9.2
 for <qemu-arm@nongnu.org>; Mon, 09 Mar 2026 15:21:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1773094881; x=1773699681; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=3cd9xy6/nLkzQC9860/bKo4IztW7zrPtLypSBqELmFw=;
 b=dkgkBaUb8vySO9ME1PZRWkozm/qdeZWJj/SLTeBNGFssBU/rOWn8/0/UAXE7GVaxlm
 JUhtU1/Ic9VEAfHkXdq92peodVQ1daY/fdag84LGozIKCWc/UjkOOOfUTO5MUK6r+QNH
 5Z78xNNPcmxlVizF9C/JoXG+2WMhjeJlD9UXl3+jDNLEGkCnwlo4S8uyVWX9eILPE3Yj
 xXUsm8reEbXeg3CiKEq7iNLFSGbOMXtISROa1yDk4W/leAqL95CuK6QsAou9w+jo4wNS
 360TwvH6zJSSFr726HGwlXTbPezYpupMZdcViKQDzJkK2IZ0UwYIbAhSkZ8FM3S3kjn+
 UElg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1773094881; x=1773699681;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3cd9xy6/nLkzQC9860/bKo4IztW7zrPtLypSBqELmFw=;
 b=ix+rZlkwwZDefUPMoZEDuQ498GZnH/YPB/1Eia/M8cnZ5v4h2pSd3NaCC8raP5dMa+
 3Aq0y9aHqDklBM7GNSQnZcBh/sywP9YeRRg1ZVErkgiM2a0/gE2wksqcBnJ/+zfSWj2I
 mgwW70pL4PXfdwUOCJ3RifrJvGj9lxdO/VMSppvMi7r/N77ir17ZxRVsNIAyDEh5l518
 biR9HX1iYs/LSVMND66WSXtYxOX7BlWwvGt6mKweVzQeubRkGlg9fVqKgdF1umdbPIc7
 yIpTdnJGEnx55vtxfLMm/XWATO8U3qyoTRfe5PGCI+aG3KT6meHLhlnR/41IGDFTCfop
 eEpw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU6Xr3mLTdQmP7upB0iB/L36fUaYzW2lAVY9yaX7doTSrGOY+v55Ei/4JNLLsBzPLjvfOguMLVJtg==@nongnu.org
X-Gm-Message-State: AOJu0Yw4ortpSuMJEAohirSuoxuve2/uf+PyjNJF9o7SgookfJaBcb7o
 leAEw24bRDjagw39Kp7I1rJ5b2WJfyb3N0vN5KFcgO+pSE2tZjUsY4d1p7xpPMD0wik=
X-Gm-Gg: ATEYQzzPpF4YpjYTSG+bhgQGWkT3ZQkk4dTywDUN02yrfO1kW1VyBpUnwy7ciGJEIIE
 pg5Bijig9I7Iba6AQ92c41neblNPYltTMPZtcNljcZ/3cuB70ujqVy0/I6AKe3vK9r8tu7Z0+Sq
 vXPEopnpHJwcfXFQcW88uoIK6UbtVv/nZXkzpyviEEazTgJVT2XTFkep731iOdI5uyRX42qzlwb
 +R/mqWWMg1xy4TwyIWYapRTMxTSCy9VGxp3vd2uA075qjCWuxko5SRIjHioMUex7M8qXcUn1r0g
 Hq/pwDNhzZtT4s9a2lZigUXlFvYbPGFH/ErJ96lfLYYxDVVWz1spWtks3ltAxKBEhdnUoVJ0mT7
 gpl6uP/Cry7KVdKyIP2mubQu1k1V82T9SdTpLyHpQ6k3XMnlR0VCz9kKlxzQszqOERxoS4TFepS
 rrEz8jX8WWG54cIYKMQWWQTSHk7TpM3559ZXEfiUkORfbqwl1UgPmLUY/a17P6MyMTgw==
X-Received: by 2002:a05:600c:4e4f:b0:485:3a27:a960 with SMTP id
 5b1f17b1804b1-4853f4214fcmr53168945e9.0.1773094881531; 
 Mon, 09 Mar 2026 15:21:21 -0700 (PDT)
Received: from [192.168.69.201] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48541a9c293sm19648095e9.10.2026.03.09.15.21.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Mar 2026 15:21:20 -0700 (PDT)
Message-ID: <a24c76d0-4106-4d49-b032-35f7f6310e69@linaro.org>
Date: Mon, 9 Mar 2026 23:21:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/2] vmapple: apple-gfx: make it work on the latest
 macOS release
Content-Language: en-US
To: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>,
 Mohamed Mediouni <mohamed@unpredictable.fr>, qemu-devel@nongnu.org
Cc: Phil Dennis-Jordan <phil@philjordan.eu>, Mads Ynddal <mads@ynddal.dk>,
 qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Roman Bolshakov <rbolshakov@ddn.com>, Alexander Graf <agraf@csgraf.de>,
 Peter Xu <peterx@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>, Alexander Graf <agraf@csgraf.de>
References: <20260306145246.10274-1-mohamed@unpredictable.fr>
 <20260306145246.10274-2-mohamed@unpredictable.fr>
 <8908689a-f5c1-490e-925d-7a664093963f@rsg.ci.i.u-tokyo.ac.jp>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <8908689a-f5c1-490e-925d-7a664093963f@rsg.ci.i.u-tokyo.ac.jp>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

+Peter/Paolo

On 7/3/26 04:08, Akihiko Odaki wrote:
> On 2026/03/06 23:52, Mohamed Mediouni wrote:
>> Follow changes in memory management introduced on macOS 15.4.
>>
>> The legacy memory management API has been removed for the IOSurface 
>> mapper on that macOS version.
>>
>> Also enable process isolation for a sandboxed GPU process when on a 
>> new OS.
>>
>> Signed-off-by: Mohamed Mediouni <mohamed@unpredictable.fr>
>> ---
>>   hw/display/apple-gfx-mmio.m | 62 ++++++++++++++++++++++++++++---------
>>   hw/display/apple-gfx.h      | 18 +++++++++++
>>   hw/display/apple-gfx.m      | 43 ++++++++++++++++++++++++-
>>   3 files changed, 107 insertions(+), 16 deletions(-)


>> diff --git a/hw/display/apple-gfx.m b/hw/display/apple-gfx.m
>> index e0a765fcb1..92404d20bf 100644
>> --- a/hw/display/apple-gfx.m
>> +++ b/hw/display/apple-gfx.m
>> @@ -21,6 +21,7 @@
>>   #include "system/address-spaces.h"
>>   #include "system/dma.h"
>>   #include "migration/blocker.h"
>> +#include "system/memory.h"
>>   #include "ui/console.h"
>>   #include "apple-gfx.h"
>>   #include "trace.h"
>> @@ -596,6 +597,37 @@ void apple_gfx_common_init(Object *obj, 
>> AppleGFXState *s, const char* obj_name)
>>       /* TODO: PVG framework supports serialising device state: 
>> integrate it! */
>>   }
>> +@interface PGDeviceDescriptor (IOSurfaceMapper)
>> +@property (readwrite, nonatomic, copy, nullable) 
>> PGMemoryMapDescriptor* memoryMapDescriptor;
>> +@end
>> +
>> +bool apple_gfx_register_memory_cb(Int128 start, Int128 len,
>> +                                  const MemoryRegion *mr_const,
>> +                                  hwaddr offset_in_region, void 
>> *opaque) {
>> +    MemoryRegion *mr = (MemoryRegion *)mr_const;
> 
> flatview_for_each_range() should be changed to pass non-const pointers 
> instead.

flatview_for_each_range() was added in commit fb5ef4eeecd ("memory: Add
FlatView foreach function") with memory fuzzing in mind, so const MR was
the correct choice then IMO.

FlatView is more of an internal memory API, I'm not sure it should be
used by hw/ layer.

$ git grep -w flatview_for_each_range
hw/core/loader.c:1656:    flatview_for_each_range(fv, find_rom_cb, &cbdata);
semihosting/arm-compat-semi.c:158:    flatview_for_each_range(fv, 
find_ram_cb, &info);
tests/qtest/fuzz/generic_fuzz.c:310: 
flatview_for_each_range(view, get_io_address_cb , &cb_info);

Semihosting is special, as it the ROM loader helper, and fuzzing code.


We provide MemoryRegionSection, MemoryListener and RamDiscardListener
APIs. Maybe one of them is more appropriate here? See:

  * A #RamDiscardManager coordinates which parts of specific RAM
  * #MemoryRegion regions are currently populated to be used/accessed
  * by the VM, notifying after parts were discarded (freeing up memory)
  * and before parts will be populated (consuming memory), to be used/
  * accessed by the VM.

Could this be what this code needs to do?

> Regards,
> Akihiko Odaki
> 
>> +    PGGuestPhysicalRange_t range;
>> +    PGMemoryMapDescriptor *memory_map_descriptor = opaque;
>> +    if (memory_access_is_direct(mr, true, MEMTXATTRS_UNSPECIFIED)) {
>> +        range.physicalAddress = start;
>> +        range.physicalLength = len;
>> +        range.hostAddress = memory_region_get_ram_ptr(mr);
>> +        [memory_map_descriptor addRange:range];
>> +        memory_region_ref(mr);
>> +    }
>> +    return false;
>> +}
>> +
>> +static void apple_gfx_register_memory(AppleGFXState *s,
>> +                                                     
>> PGDeviceDescriptor *desc)
>> +{
>> +    PGMemoryMapDescriptor* memoryMapDescriptor = 
>> [PGMemoryMapDescriptor new];
>> +
>> +    FlatView* fv = address_space_to_flatview(&address_space_memory);
>> +    flatview_for_each_range(fv, apple_gfx_register_memory_cb, 
>> memoryMapDescriptor);
>> +
>> +    desc.memoryMapDescriptor = memoryMapDescriptor;
>> +}

