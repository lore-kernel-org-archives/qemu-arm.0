Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33073CD4F25
	for <qemu-arm@archiver.kernel.org>; Fri, 15 May 2026 14:27:39 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wNtVh-0001d6-Ab; Fri, 15 May 2026 10:27:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wNtVU-0001HF-O3
 for qemu-arm@nongnu.org; Fri, 15 May 2026 10:27:17 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wNtVS-0001jL-FD
 for qemu-arm@nongnu.org; Fri, 15 May 2026 10:27:16 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-48fde648a71so7887335e9.0
 for <qemu-arm@nongnu.org>; Fri, 15 May 2026 07:27:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1778855232; x=1779460032; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=LFlWrHtrooj3T+FPBTdpwgY0NsCd17aVmwDZTMr2Vdo=;
 b=zgxyI0vc6Gm8WzdhlA2/4Yw0POTqoxlHYIXlN82YoJSC9yAf+3nY9FPJ01zyXbXaYH
 6n79zW5H0P/BsdIP32cG8wzfpDmtpuD9Igvgw8USykr0hBD9YtDu6H27+/TBh63NBv2Q
 zwnlYbMYdqugNM+A4adsURMd5bqVPr16xtD2fA4fIDgPkt3CkhIeio/wXq9imbtzqdaP
 gTkSFW9SF6KstLXI2TCENQmYtbAdf31b4oexoPjBjno2aQd3mEe0S/v+JJ2nKbOuEVux
 kBWNVs7MrGnJxfSfy8llZgCU50vc8s63C3qiD3a4FjERuR8n3fLYCumZGxgHOcBYMMUa
 ViNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778855232; x=1779460032;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LFlWrHtrooj3T+FPBTdpwgY0NsCd17aVmwDZTMr2Vdo=;
 b=XUrQ2i8vGznYmgcZ112BHyKKZvNgQZAGY5wCJs8sTH/PxJfkeZ8UoLFO1NGbKJcufp
 OHWDoJHct16RzsYvyJXEH+/z6ZBpC4cwAlplZ7ErIffyiGwges888Gf6Eok34ftgkY/g
 Oi1pdy8tkCGkFsdBsKV8V9cRPnOHgK5BYajXqHmFle6TNBuIxYGDTNbbisC0/pZq/xZG
 wLLz/VuEqvgZ/YVFZyReW5QB3p92AyzBVgc0Q0OHOnrVkwWWkHua9zBd5Cq0W015fZM9
 LzQ8N6LH658fJulVBIXconS8UF8t231U5FNA+lm2sKcE2JYuC1UeexIAV4dBWlvS81Pi
 jbgg==
X-Forwarded-Encrypted: i=1;
 AFNElJ8b/tFekGDS08ulqpg4pO8GVg/ffd61cdafFZbhv7EiTqg853P9HB+/QG2R3c7G74Jbsb05rBKUXw==@nongnu.org
X-Gm-Message-State: AOJu0Yy/Myoz1QTrDfzRQCRJDVn9XpoTfEVsJP1p0JauBWjieXJWrg8N
 n5tPwFLU5hXhqBXHuIrJFAOBNBJNpX9+hr9cM+MmdRx4tmCmkaHB6cVQwOzEpdSo798=
X-Gm-Gg: Acq92OHdbsq9XBw5iK/U0Xp/OSdOnCc1g6Z93ItQn8fTFFXuNOVpX4zfea495TUquNC
 /ONZUTYSMWcY7gutsJj4xGS10qNVUy7f3fgx7uynO9MRAVzbvx7AzQYGgnHjT0Wv2d/Bnatb78G
 E22JNhsBJF4z5FXTC3v9RA3KKwhbMYIDZmL3g7XG+hz9wuDgQwU8fa3Yut1Rhbs0uINUOQnhx/o
 f/JKHaZPf4KEqWp8STdRujiRz9413YfqIEIrJZ3lIvLzhJMP1oHd7cEoCmDJizHsLdu2lr0/33U
 rZB/BaEfxRxwGfUWerE+xkjViT/gArqQjvskAmlKBILO+1b+YlkZeTnigf5FWzk+xqjjCB0NZoQ
 3Y3wFgLxBh1AJS15GKq2SMF4c9VjoTmpco5h9jeLSVh3YVI3c3UYYItlDJdwSglm1QxquSEiCHQ
 IF5cKnpyuBj2mVw1HETKdgP4W9UP9pPGgtClUgGoFXDSOIbl/YzYFSITHd4XpSau243A==
X-Received: by 2002:a05:600c:83c7:b0:48f:e230:29f5 with SMTP id
 5b1f17b1804b1-48fe53a8eccmr60399335e9.16.1778855232409; 
 Fri, 15 May 2026 07:27:12 -0700 (PDT)
Received: from [192.168.69.200] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48fe5694fbfsm117392865e9.6.2026.05.15.07.27.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 May 2026 07:27:10 -0700 (PDT)
Message-ID: <1bc4c344-aead-4ad8-baa5-8b01d7d702cc@linaro.org>
Date: Fri, 15 May 2026 16:27:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 09/20] target/arm: Build cpu64.o as common object
Content-Language: en-US
To: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 Joel Stanley <joel@jms.id.au>, Kane Chen <kane_chen@aspeedtech.com>,
 Troy Lee <leetroy@gmail.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Jamin Lin <jamin_lin@aspeedtech.com>, Steven Lee
 <steven_lee@aspeedtech.com>, Andrew Jeffery <andrew@codeconstruct.com.au>
References: <20260515141032.3271-1-philmd@linaro.org>
 <20260515141032.3271-10-philmd@linaro.org>
 <CAAjaMXbmCR10cGb8DsYF+vHFxb2NNVpxGJsijh76o3fOEXH=CQ@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <CAAjaMXbmCR10cGb8DsYF+vHFxb2NNVpxGJsijh76o3fOEXH=CQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
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

On 15/5/26 16:21, Manos Pitsidianakis wrote:
> On Fri, May 15, 2026 at 5:11 PM Philippe Mathieu-Daudé
> <philmd@linaro.org> wrote:
>>
>> While gdbstub64.o is already built once, build it as
>> common object, reducing target-specific set in arm_ss[].
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> ---
> 
> The commit message was copied from the gdbstub patch, but this patch
> touches the decodetree a64 gen files

Indeed I should mention it in the commit description.

> 
> For the patch changes:
> 
> Reviewed-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
> 
> 
>>   target/arm/tcg/meson.build | 7 ++++---
>>   1 file changed, 4 insertions(+), 3 deletions(-)
>>
>> diff --git a/target/arm/tcg/meson.build b/target/arm/tcg/meson.build
>> index 9eeccb2adca..f821331fbee 100644
>> --- a/target/arm/tcg/meson.build
>> +++ b/target/arm/tcg/meson.build
>> @@ -27,15 +27,13 @@ translate32_d = [
>>     decodetree.process('t16.decode', extra_args: ['-w', '16', '--static-decode=disas_t16']),
>>   ]
>>
>> -arm_ss.add(when: 'TARGET_AARCH64', if_true: gen_a64)
>>   arm_stubs_ss.add(files('stubs32.c'))
>>
>>   arm_ss.add(files(
>>     'cpu32.c',
>>   ))
>>
>> -arm_ss.add(when: 'TARGET_AARCH64', if_true: files(
>> -  'cpu64.c',
>> +arm_ss.add(when: 'TARGET_AARCH64', if_true: gen_a64 + files(
>>     'gengvec64.c',
>>     'translate-a64.c',
>>     'translate-sve.c',
>> @@ -79,6 +77,9 @@ arm_common_user_system_ss.add(
>>     'vec_helper.c',
>>     'vfp_helper.c',
>>   ))
>> +arm_common_user_system_ss.add(when: 'TARGET_AARCH64', if_true: files(
>> +  'cpu64.c',
>> +))
>>
>>   arm_common_system_ss.add(files(
>>     'cpregs-at.c',
>> --
>> 2.53.0
>>


