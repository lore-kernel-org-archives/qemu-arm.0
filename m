Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9952CCF2F4
	for <qemu-arm@archiver.kernel.org>; Mon, 19 Jan 2026 12:13:51 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vho8M-0000pD-MY; Mon, 19 Jan 2026 07:13:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vho8L-0000og-8a
 for qemu-arm@nongnu.org; Mon, 19 Jan 2026 07:13:25 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vho8J-00027h-K9
 for qemu-arm@nongnu.org; Mon, 19 Jan 2026 07:13:25 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-47ee76e8656so48700755e9.0
 for <qemu-arm@nongnu.org>; Mon, 19 Jan 2026 04:13:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1768824802; x=1769429602; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Xtc6cFMkMrTwWDzqDVH3d9bbU1X1HAVFUvGF5tfinQI=;
 b=JJ44Tkk21b/WC1QjaXvGnsiGVgZKX7OS/zLOgpCc/ghwCmgx+Xt/NebKX696tQpRTT
 Dt7v4cjd5By5nlW7ZYdk1ZDEFPdUhp0bq/0yn8ylS/Sh1407lfJFziEWn/z6ioE7D3o/
 pGvKc+K9mn9mYNZTNmgj8JolOpA2fSEeSQY1rkyIXoGYRmg0el3o7v1w3QJbXTCoKmEd
 r9q4rAE3YbbJvKLN2dPr4huAPLhSXREfG965wRauN3p6xFlcvpxU70H5dYFyYnRkAXt/
 M/jBjM2+f3SAz2oh4c+PyIyz+Te2rO5AaLWNqQoBfvRChlKHlkklr/Mm9OZF59CURn0g
 3n1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768824802; x=1769429602;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Xtc6cFMkMrTwWDzqDVH3d9bbU1X1HAVFUvGF5tfinQI=;
 b=sKi1QpuDftY3ZfA7N+jajhzFPkR47HrZM5zf3HKx35TWsdYrtrk/PCs7HMIPz/HMr0
 pt5i3cFAMB0PolMTnroveGDEtNhWqEpyrlj+n+YwhLnPOcJGMW2A39vyWaHnuanxwlr6
 FMa6bVPKHgj1eWVHQDEacftJBrOJiOgVr2MwNHo426Dl4upCpPygXWbdd9U/5GW8EvYf
 zZYnD0AGSOrs2wyNkNFxhFfaRwW78Egg7ybgVNs91nfl/l4njeuH1rnfTYnEWLlmHlH1
 zNxcGtK64lBiHLEYThwl9FkONM9GgrF5Im0LHNP8bMx8+Z1gHvSZApDs/ZbMbWA0PFiV
 wcDA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWyIVCWtnc8OJefIZe7KKX/fr5G4yMeuuUJ0TNgiblgIVmcQDO8aWSs9YCKCpeLXLiWBwn0evv63A==@nongnu.org
X-Gm-Message-State: AOJu0YzHJOEtESZxQeh4G1eH8P89fjItcGdfa5G5RTS7bTPS0tcxtGAU
 i17skgdbODFsoCz+8abRS5K6bbI2FkpyDQqeQrdnYbmHBalW7P6VCczJfrzlHjXgDcg=
X-Gm-Gg: AY/fxX5afm4Ir3BjJ+ZwKk/pkoT0KI5oyiaVakW1JT3/I1K3CWh9X2pqVoyFm749vn7
 JlDbwWpez6F4B3o1fro8RbDQBEGQwYXB0AMdewNTWl9M71OunTHaUXfmjoyJV5r6ufclF9nUis7
 Z7e/lwXzLIogMILGpdnrfiGtWyvncRv5UqX2oIJuRurWmWXOyHkykiD3WXfeNo2USHOKLov7z2U
 wCpgoI14skHyyBJl7BeccqIAX6iSK9LPj1qAaUZmBj6Qmi8kH+/LpdvraTKEuvGjJVbzTxALEhT
 uVrR+a+fC9pZMpzk+CB6G7oBDTh9/VV1ROxTn9+0PC6Hi/SFL1R2D0Ridjv/5afAjmasw6KvgPI
 HufNZYj9hV68dBy+NTFmFQDtD1xcLl5nn979SHoLsYGvHT92LHLbjkVff1dX7phqjtEEvHA6sgF
 FgO8ZAH9SRE6FeLzHJ1Ok4z4au9LgFX9pwwaq3+rvt2DGrmV/2XMiDyA==
X-Received: by 2002:a05:600c:4513:b0:477:6d96:b3e5 with SMTP id
 5b1f17b1804b1-4801e2f9105mr148420835e9.7.1768824801912; 
 Mon, 19 Jan 2026 04:13:21 -0800 (PST)
Received: from [192.168.69.210] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47f428acae8sm247410705e9.4.2026.01.19.04.13.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Jan 2026 04:13:21 -0800 (PST)
Message-ID: <6b934c5a-bfbc-4877-8e53-b7e89db1531b@linaro.org>
Date: Mon, 19 Jan 2026 13:13:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 51/59] hw/arm/virt: Warn when HVF doesn't report IPA
 bit length
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: Mads Ynddal <mads@ynddal.dk>, Cameron Esfahani <dirty@apple.com>,
 qemu-arm@nongnu.org, Roman Bolshakov <rbolshakov@ddn.com>,
 Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>,
 Phil Dennis-Jordan <phil@philjordan.eu>,
 Mohamed Mediouni <mohamed@unpredictable.fr>,
 Peter Collingbourne <pcc@google.com>,
 Peter Maydell <peter.maydell@linaro.org>, Alexander Graf <agraf@csgraf.de>,
 Joelle van Dyne <j@getutm.app>
References: <20251028054238.14949-1-philmd@linaro.org>
 <20251028054238.14949-52-philmd@linaro.org>
 <cd27bf13-a8ef-4b7a-bfea-0e4220091ec1@linaro.org>
 <8af2b03c-6fc3-48c6-a307-7d49d38532b4@linaro.org>
In-Reply-To: <8af2b03c-6fc3-48c6-a307-7d49d38532b4@linaro.org>
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

On 18/1/26 23:03, Philippe Mathieu-Daudé wrote:
> On 28/10/25 13:07, Richard Henderson wrote:
>> On 10/28/25 06:42, Philippe Mathieu-Daudé wrote:
>>> Emit a warning when HVF doesn't return the IPA bit length
>>> and return -1 as "this accelerator is not usable", allowing
>>> QEMU to try with the next one (when using '-accel hvf:tcg').
>>>
>>> Reported-by: Ivan Krasilnikov
>>> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/2981
>>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>>> ---
>>>   hw/arm/virt.c | 8 ++++++--
>>>   1 file changed, 6 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
>>> index 175023897a7..1d65fa471dc 100644
>>> --- a/hw/arm/virt.c
>>> +++ b/hw/arm/virt.c
>>> @@ -3225,8 +3225,12 @@ static int 
>>> virt_hvf_get_physical_address_range(MachineState *ms)
>>>   {
>>>       VirtMachineState *vms = VIRT_MACHINE(ms);
>>> -    int default_ipa_size = hvf_arm_get_default_ipa_bit_size();
>>> -    int max_ipa_size = hvf_arm_get_max_ipa_bit_size();
>>> +    uint32_t default_ipa_size = hvf_arm_get_default_ipa_bit_size();
>>> +    uint32_t max_ipa_size = hvf_arm_get_max_ipa_bit_size();
>>> +    if (!default_ipa_size || !max_ipa_size) {
>>> +        warn_report("HVF didn't report IPA bit length");
>>> +        return -1;
>>> +    }
>>
>> I suppose this goes back to the previous patch.
>> It might have been slightly less confusing to merge them, but the 
>> underlying questions about when and how this can fail remain.
> 
> Right. I'm dropping this patch.

BTW I was looking at the extra-commits in GetUTM and noticed one
related to this:

commit c387fd021064cfb7b895877d0a04660a795887ee
Author: Joelle van Dyne <j@getutm.app>
Date:   Mon Dec 23 00:15:08 2024 -0800

     hw/arm/virt: handle hvf with unknown max IPA size

     When it is not possible to determine the max IPA bit size, the helper
     function will return 0. We do not try to set up the memmap in this case
     and instead fall back to the default in machvirt_init().

     Signed-off-by: Joelle van Dyne <j@getutm.app>

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 5b1e375726d..251fc58b42c 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -3047,6 +3047,11 @@ static int 
virt_hvf_get_physical_address_range(MachineState *ms)
      int default_ipa_size = hvf_arm_get_default_ipa_bit_size();
      int max_ipa_size = hvf_arm_get_max_ipa_bit_size();

+    /* Unknown max ipa size, we'll let the caller figure it out */
+    if (max_ipa_size == 0) {
+        return 0;
+    }
+
      /* We freeze the memory map to compute the highest gpa */
      virt_set_memmap(vms, max_ipa_size);

(https://github.com/utmapp/qemu/commit/c387fd021064cfb7b895877d0a04660a795887ee)


