Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EFC3FF885A
	for <qemu-arm@archiver.kernel.org>; Mon,  4 May 2026 12:42:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wJsci-000126-O6; Mon, 04 May 2026 08:42:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wJsch-00011m-6C
 for qemu-arm@nongnu.org; Mon, 04 May 2026 08:42:07 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wJscf-000204-E4
 for qemu-arm@nongnu.org; Mon, 04 May 2026 08:42:06 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-48984d29fe3so60226505e9.0
 for <qemu-arm@nongnu.org>; Mon, 04 May 2026 05:42:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1777898523; x=1778503323; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=fQEeVERdsSHzhSgxX6X29OJD/Y9lfRfmE0F3W71XcOg=;
 b=vmkiKV0MFAhRk5yJ+leyAF5E93rcvgDTHUveR8tPjhtZDvAFN4XyXtC/iW5rcJhs50
 S7G6zzclfz8D+5UbYDUtlOcYpDh5IOIcgiywjL9yT/Q7jDqpKh9XiHCFbBBOcB0gM+HY
 iO719wRXTKhd1uF1nUcoaXauTdw3uv5HH1oahfKHQ/4dVUx87xUG/SfqTOcQ+5Lx7EOX
 JH7CVMk8Ne8awygnKdIQ3XX4Kw5lABEbo16wZ4ivr4kO4y+CiYzBJPwEXEZ7GC5cJIRc
 D7/xEJnHZAeOgditO8yRCLf80Jsr0Io6YL9U3sUkMSE+6D/XEjfn+CtTrJ85ID94zgRV
 nBDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777898523; x=1778503323;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fQEeVERdsSHzhSgxX6X29OJD/Y9lfRfmE0F3W71XcOg=;
 b=TBBhslSBq9ooG5kei2F8RYs3HmLQk1YjmwseZd2t0Y0ndMrePL5ykj6wIspGbmR92R
 biCX8RrZULoHTlraGb/kOttCJt3kEkBGmpUsrOBivfAf9qdvr1bDyLwrJGESdszcp3tJ
 unSDN0PIBbcaGhLW4h5BuEMAti0Oc/GbBmOpZYgQ/kxEEuxnBPYa4abfgdLsXUnxQwfr
 Su9Ic+uwHH97uKmqimWiGULXVqUWn2f3oUXNEepTX/1G4zILsW8MR9DPDjphUyRiIooD
 0wB8eqnDF1JB/ciwbPUVb3BjIS8rShaMHMcNJpNDlTPNhkQsmwD0+hiuWEE3v4hfHHLn
 CSPw==
X-Forwarded-Encrypted: i=1;
 AFNElJ9OG9zVBRrkBWTwHImtIarD+T+hCB/jtZC+2Gelytdu+EVZW8yAJLUrBeGNr7sb+4ZS46npElLLQA==@nongnu.org
X-Gm-Message-State: AOJu0Yzr4HOVfWgH0jRoX4Sbql44ZfDpw9xp3BYDstBqY0hzhkYSMCmc
 LOThEcjwFuURvpaMtedSLDoXmGF/U6xahWDdxi862o57Ov3TCdDUwkAd+VEDCtXq9zk=
X-Gm-Gg: AeBDiet7AK1SVR5/6ELkJ3RNvpS1L1qINHylGf04nYTfQ5ExUxMFfvDUcnxIRSpKklS
 7XDqF9nlqnrJtwxzdlOR71tF79hYQpDlNpH2HgPEqaljaettE/RvB2lfS3YwRJwRPEaHvq4KDbN
 pqhpaNgJvEI38mWkxiaEfDDKNzOKRYtTxzEtODfpiRBxzyCQTvyXHSAOipHYGEwVdENcX2dBX1r
 8H/mV1zYKdd/oRJ1LO0jHkw7YWjKPE1uuzQ82pAFsPpfQ+io6KoTjqHHGVx+fAxMGCLHjOUwW6W
 5DURqNqtymlZhK55zx5/iCCLyh6arLQIT8O4x3TbQTtO0tCfjcM+9FGj7xhO9gcKBHChHHTVFYi
 TbLqb6hcZ5EaqzRqch38D1g1rgyu1DiiQBtRy1H9TrJ5j5A+Qf35umvH2MU3eKK104SOR+WOeq5
 XXvvYvqIunCEde+tunWewy5MLoBuaylr+5B/VfZ/N/MplDjuBQAacdAfAdKE6mxD1s/4iq0HiJz
 f6E
X-Received: by 2002:a05:600c:348b:b0:48a:592c:e632 with SMTP id
 5b1f17b1804b1-48a986589e9mr166716795e9.16.1777898523548; 
 Mon, 04 May 2026 05:42:03 -0700 (PDT)
Received: from [192.168.69.210] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48a82307f7csm335351655e9.12.2026.05.04.05.42.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 May 2026 05:42:03 -0700 (PDT)
Message-ID: <d9c8bf73-70f3-4bb3-b1cc-0f64f1ee5bc2@linaro.org>
Date: Mon, 4 May 2026 14:42:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 08/11] hw/usb/hcd-ehci: Add ctrldssegment-default
 property
Content-Language: en-US
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>,
 Jamin Lin <jamin_lin@aspeedtech.com>, "peterx@redhat.com"
 <peterx@redhat.com>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
 Kane Chen <kane_chen@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>,
 Zhao Liu <zhao1.liu@intel.com>, "open list:ASPEED BMCs"
 <qemu-arm@nongnu.org>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>
Cc: Troy Lee <troy_lee@aspeedtech.com>, "farosas@suse.de" <farosas@suse.de>,
 "flwu@google.com" <flwu@google.com>,
 "nabihestefan@google.com" <nabihestefan@google.com>
References: <20260504025342.1452605-1-jamin_lin@aspeedtech.com>
 <20260504025342.1452605-9-jamin_lin@aspeedtech.com>
 <67a45038-e4bb-48f8-af08-af0d5c308ece@linaro.org>
 <e45a4765-0c3d-4fc0-8080-cdad5f877a92@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <e45a4765-0c3d-4fc0-8080-cdad5f877a92@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32b.google.com
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

On 4/5/26 14:17, Cédric Le Goater wrote:
> On 5/4/26 13:18, Philippe Mathieu-Daudé wrote:
>> On 4/5/26 04:53, Jamin Lin wrote:
>>> When 64-bit addressing is supported, the Linux EHCI driver programs the
>>> segment register to zero. See ehci_run function:
>>> https://github.com/torvalds/linux/blob/master/drivers/usb/host/ehci- 
>>> hcd.c
>>>
>>> The driver comment also notes that descriptor structures allocated from
>>> the DMA pool use segment zero semantics.
>>>
>>> Descriptor memory is allocated using the DMA API. The platform driver
>>> configures a 64-bit DMA mask so memory can be allocated above 4GB.
>>> See ehci_platform_probe function:
>>> https://github.com/torvalds/linux/blob/master/drivers/usb/host/ehci- 
>>> platform.c
>>>
>>> On AST2700 platforms, system DRAM is mapped above 4GB at 0x400000000.
>>> As a result, descriptor addresses constructed directly from the guest
>>> EHCI registers do not match the actual system address used by the
>>> controller when fetching queue heads (QH) and queue element transfer
>>> descriptors (qTD).
>>>
>>> Add a ctrldssegment-default property so platforms can provide a
>>> descriptor address offset when constructing descriptor addresses.
>>> This allows systems where DRAM resides above 4GB to access EHCI
>>> descriptors correctly.
>>>
>>> The default value is zero, so existing machines are not affected.
>>>
>>> Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
>>> Reviewed-by: Cédric Le Goater <clg@redhat.com>
>>> ---
>>>   hw/usb/hcd-ehci.h | 5 ++++-
>>>   hw/usb/hcd-ehci.c | 1 +
>>>   2 files changed, 5 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/hw/usb/hcd-ehci.h b/hw/usb/hcd-ehci.h
>>> index 8e6a8cdfb0..3d57e1de5f 100644
>>> --- a/hw/usb/hcd-ehci.h
>>> +++ b/hw/usb/hcd-ehci.h
>>> @@ -264,6 +264,7 @@ struct EHCIState {
>>>       uint32_t maxframes;
>>>       bool migrate_fetch_addr_64bit;
>>>       bool caps_64bit_addr;
>>> +    uint32_t ctrldssegment_default;
>>>       /*
>>>        *  EHCI spec version 1.0 Section 2.3
>>> @@ -322,7 +323,9 @@ struct EHCIState {
>>>       DEFINE_PROP_BOOL("x-migrate-fetch-addr-64bit", _state, \
>>>                        ehci.migrate_fetch_addr_64bit, true), \
>>>       DEFINE_PROP_BOOL("caps-64bit-addr", _state, \
>>> -                     ehci.caps_64bit_addr, false)
>>> +                     ehci.caps_64bit_addr, false), \
>>> +    DEFINE_PROP_UINT32("ctrldssegment-default", _state, \
>>> +                       ehci.ctrldssegment_default, 0)
>>
>> ctrl-ds-segment-default and ctrl_ds_segment_default?
>>
>> Otherwise,
>> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>>
> 
> yeah. I agree. That's the general pattern for property names.

I don't get the '-default' suffix. Alternatives:

dram-segment-base-addr or even x-dram-segment-base-addr since I still
believe this is a AST2700 issue, likely not mapping RAM appropriately.

> 
> Thanks,
> 
> C.
> 


