Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90512F8E49D
	for <qemu-arm@archiver.kernel.org>; Fri, 17 Apr 2026 07:08:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wDdJq-0005X1-Of; Fri, 17 Apr 2026 03:08:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wDdJp-0005Wh-CL
 for qemu-arm@nongnu.org; Fri, 17 Apr 2026 03:08:49 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wDdJn-0006aL-KV
 for qemu-arm@nongnu.org; Fri, 17 Apr 2026 03:08:49 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-488971db0fdso3657495e9.0
 for <qemu-arm@nongnu.org>; Fri, 17 Apr 2026 00:08:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1776409725; x=1777014525; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=PA1+9GsvYtm6Dcf0gcoLvAxSKheiEQ2EDTAci0trYTw=;
 b=SWIcIBM6DEUnufUPaQVm1USYhQrB/hwavnkkSboIiZtLv8ceNdzD45QPEGXLVl02Io
 IN+IoKDxpMkihSg0r3FUM79AHwDaDLRzfQTTePQOxZWjGC2UYHg9l7K/9yOA/gD5qpTF
 piKufcGTBK/b7IBBdrI3uGsRJN+0x0i24RWaV7PGVtcZcv26HPVrPg+J1OIJK53ZbgYa
 cTBRQZLgtj1/FgwECtM8qe1oIedV3sT9BQDHS9zp/qieJ1TEjZd1CT9/6zWX1onSfo7p
 4DdH+xzUnfy3kjeohkQinp42YnBlBkx301kTC6obs/ylza0tcwhNWkucDN+HN/FgGEb6
 7r+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776409725; x=1777014525;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PA1+9GsvYtm6Dcf0gcoLvAxSKheiEQ2EDTAci0trYTw=;
 b=Yr98DFeW2lipuxXy3cVrgqMZ1tsyeKX7JX1GUn1w+yidlo/TAQERHVRZdiPnaItnbe
 BqH9Cc+6XfRK0V89B5ah50L8p3sbRz+X7obLdMD+urga6xlXN1ATBUhDZXBdfltUjMFd
 yJFkSQ5AKU8BuQdJHLMDfNlfveMYqzD9AiVcfWw1c24wLOZSdi9+p4oBGPuOIgdAee0M
 eBMTNT+QlgdohS1wqZwF4Wtsa8YA4gB/gJF+xhyI2Revd14ZrkEDaRfNmggeu5zbx41i
 ueWHC0xQ+viNjOUPEMHlYPaiMTKFTAu9HwNYvk6gDSJ9Isal/Eqo+1mHnAy5bZsalPqf
 ZTAg==
X-Forwarded-Encrypted: i=1;
 AFNElJ/+zglm0xmUD5+LZbk2Csdw7c4d995IMw8SMTnwkDM/0/QBKg5Qu16/3ihsQ5dWMNI/yXN0RlA6Pg==@nongnu.org
X-Gm-Message-State: AOJu0YxqhMV8SbT0l6EHzHdfizPBUforOb2JDf5KvOxfcsWEg7PGPi/7
 /DOIwC0uMyaXtJh3gkM5Abu0lVY3ppXe6nRwuqEmJNqs9CNBcja1diX5i2aQYfo74e8=
X-Gm-Gg: AeBDievFn3ZCOn0LlzbzaKWyRT5T8WxlrGyMUQAGSfp0sIw19J9y3NHgKdXW/tpVbyt
 KeqsWC8HCXghPVZnN5IVxWHxA2enevED8XwN0xtWSvpKd1Hys7lYuhSUy3gnibL1wWZ1Iw4byVO
 L9UQXpXYUTxilS+iDjBIYv+87mJrqIkjmAJhjJQHI6X6h/Fl+C/qHSbdp0xNwLXABoPc1cBP/dq
 X/prz8AI0lNv0eHXJ1WLYh5IQJp+EHtj561GBPEZjyOfONTNFpPPJQaWjPvOmMbqz4LA7kA21TH
 6jg2Bij2Lfc2NOKD87HjbWb+l+3Qdb1c6/tuGhJ/zv0hw6plBDNYVIZsGm2bV4qDktdfjTNfDFS
 7BFc1L2rzUIbbs8UZav1TTpi/1cfHEiwiXkWh7ExtdYy0G1TzKIeqRz1IXU1EZEo2aAKXiTgvNe
 gtkuPNfXrHSZy6tG7s7Wgbx7nVMXEExxDztgd5OpWTckJQF03d9JmypJPw6RBSCDB9lQrrmDaky
 fEL
X-Received: by 2002:a05:600c:458c:b0:488:bf0c:a372 with SMTP id
 5b1f17b1804b1-488fb79330emr18532575e9.31.1776409724768; 
 Fri, 17 Apr 2026 00:08:44 -0700 (PDT)
Received: from [192.168.69.228] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488fc143a0fsm22961465e9.14.2026.04.17.00.08.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Apr 2026 00:08:43 -0700 (PDT)
Message-ID: <20ee6c39-d0ff-4e07-95e6-5aeb86dc0916@linaro.org>
Date: Fri, 17 Apr 2026 09:08:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 13/17] hw/usb/hcd-ehci: Add descriptor address offset
 property
Content-Language: en-US
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Jamin Lin <jamin_lin@aspeedtech.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
 Kane Chen <kane_chen@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
Cc: Troy Lee <troy_lee@aspeedtech.com>, "flwu@google.com" <flwu@google.com>,
 "nabihestefan@google.com" <nabihestefan@google.com>
References: <20260416014928.1279360-1-jamin_lin@aspeedtech.com>
 <20260416014928.1279360-14-jamin_lin@aspeedtech.com>
 <04a8d8d9-f605-4bd3-8468-0e2840ae8311@kaod.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <04a8d8d9-f605-4bd3-8468-0e2840ae8311@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x329.google.com
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

On 17/4/26 08:45, Cédric Le Goater wrote:
> On 4/16/26 03:49, Jamin Lin wrote:
>> When 64-bit addressing is supported, the Linux EHCI driver programs the
>> segment register to zero. See ehci_run function:
>> https://github.com/torvalds/linux/blob/master/drivers/usb/host/ehci-hcd.c
>>
>> The driver comment also notes that descriptor structures allocated from
>> the DMA pool use segment zero semantics.
>>
>> Descriptor memory is allocated using the DMA API. The platform driver
>> configures a 64-bit DMA mask so memory can be allocated above 4GB.
>> See ehci_platform_probe function:
>> https://github.com/torvalds/linux/blob/master/drivers/usb/host/ehci- 
>> platform.c
>>
>> On AST2700 platforms, system DRAM is mapped above 4GB at 0x400000000.
>> As a result, descriptor addresses constructed directly from the guest
>> EHCI registers do not match the actual system address used by the
>> controller when fetching queue heads (QH) and queue element transfer
>> descriptors (qTD).
>>
>> Introduce a descriptor-addr-offset property so platforms can provide an
>> address offset applied when constructing descriptor addresses. This
>> allows systems where DRAM resides above 4GB to correctly access EHCI
>> descriptors while keeping the default behavior unchanged for existing
>> machines.
>>
>> Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
>> ---
>>   hw/usb/hcd-ehci.h        | 1 +
>>   hw/usb/hcd-ehci-pci.c    | 2 ++
>>   hw/usb/hcd-ehci-sysbus.c | 2 ++
>>   hw/usb/hcd-ehci.c        | 7 ++++++-
>>   4 files changed, 11 insertions(+), 1 deletion(-)


>> diff --git a/hw/usb/hcd-ehci.c b/hw/usb/hcd-ehci.c
>> index e1d5ecbad7..ea9d5846bc 100644
>> --- a/hw/usb/hcd-ehci.c
>> +++ b/hw/usb/hcd-ehci.c
>> @@ -162,7 +162,12 @@ static uint64_t ehci_get_buf_addr(EHCIState *s, 
>> uint32_t hi, uint32_t low,
>>   static uint64_t ehci_get_desc_addr(EHCIState *s, uint32_t low)
>>   {
>> -    return ehci_get_buf_addr(s, s->ctrldssegment, low, UINT32_MAX);
>> +    uint64_t addr;
>> +
>> +    addr = ehci_get_buf_addr(s, s->ctrldssegment, low, UINT32_MAX);
>> +    addr += s->descriptor_addr_offset;
> 
> 
> Instead, can we force a default value for ctrldssegment when
> caps_64bit_addr is set ?
> 
> I am still trying to digest :
> 
>    https://lore.kernel.org/qemu-devel/ 
> TYPPR06MB8206C7461E004C4FF07B8E92FC242@TYPPR06MB8206.apcprd06.prod.outlook.com/

Same here, but since it doesn't break and I don't have much more time
to dedicate to this I ended thinking "good enough for now, could be
improved later", so no objection on my side.

> 
> We have time let's take a moment to think about the workaround.

Then keep me in the loop!


