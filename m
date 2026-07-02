Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2FEEC43327
	for <qemu-arm@archiver.kernel.org>; Thu,  2 Jul 2026 09:29:07 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wfDim-0006tz-DP; Thu, 02 Jul 2026 05:28:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <heinrich.schuchardt@canonical.com>)
 id 1wfDie-0006t2-Ba
 for qemu-arm@nongnu.org; Thu, 02 Jul 2026 05:28:28 -0400
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <heinrich.schuchardt@canonical.com>)
 id 1wfDiN-0007Zy-A1
 for qemu-arm@nongnu.org; Thu, 02 Jul 2026 05:28:27 -0400
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 62DD63F978
 for <qemu-arm@nongnu.org>; Thu,  2 Jul 2026 09:28:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20251003; t=1782984489;
 bh=lh5wqeMNv2lnCwqQ8oHybPXgis+DIVe0/xNgwsW1SK4=;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
 In-Reply-To:Content-Type;
 b=DhzLJoub4qR9hd/tcmk2PurBXw9GmN5hUjttngN1BGaLCTl4J9Tq+3MkxGk8dJ1+u
 Nw6BJhwYhpqj7OrCgccyN0kXB5Paaluii/s5Uy31WB6KnQLKy2bOLr3bUDPtKIQ1WO
 Yf3lLMisVIXC7iA+tV6xJGUfnS4OxkSVqzqQEolq0zrpP4AA6rqEsvFDdg9/x62Ze8
 VdDZ/K2HzRYqql4q/imP26L7e6XZU+SmrVegPYeQql6xO5QehhYN9mrH6yLB/+UnaR
 I8yRd3qaz/rh2gcCZsUbmkFy34Blxv/XEQHYNGFWPjiIdbWMo9Vqd5G/43cSm/ojMG
 uRkw6wECZHVzUuLMd69OboMvR+dmJtY5Au2kHeYJDaAEtFFb8ARYVF/NlYAaseb3m+
 2DRce6dUq8sdPMBwDcZzeKIeYoj/1vO2UO714tPGLMoKkjoob6rcxArfXDl288lRfi
 PIUP/05yF+8pxlNAGG1a1kod3JQ3OOoQ2hqgT8PvQBcGIm9R3JGHOFSXvFtqHViuuJ
 JxAryYkEouet1qCwx2qh2us4GvSrc1CgXbZYsJgB1V9YJ6C1styL09R0+qmPSvb5TF
 Wb/+aaB7nxGpBEWstN1B4d0bXBWn6HufnNvWkah+8RJ6W96QFdiB15C8Ptwoy3R2ry
 hjuxDgsfcUZ5YkohAtYpBqLo=
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-473bc66c837so1228623f8f.0
 for <qemu-arm@nongnu.org>; Thu, 02 Jul 2026 02:28:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782984489; x=1783589289;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lh5wqeMNv2lnCwqQ8oHybPXgis+DIVe0/xNgwsW1SK4=;
 b=nV5vlbhXo+TK6vzTPffiBp7+khbuw/Qm9x1xreZOFI6F+ttAbribmpOrKiV7a/ruzA
 AHcopH/nYtfE/AEs2ek9Ed8Qxfds95ajcDpCMjikpuhT/qmkzXoetYvFjPE3O0HRtbFX
 DZeTuBTA2YgOTCuizM5UmvlrAjAeqUk0toSqrHc/Vtg9krATWE4sYz9nk8Sk8yWwB7T2
 WWIw2+6RUQMnKJ7bgNdXta32paDqUkHTRJfaCQWrYwHJIGTPtl3+Mep2z+6INsjehSpL
 +qxlqeK+16hRVuHl0I3+1AsoDevb2AxBBL+qC/hD6RztckKPtIiSv/MWyv+8btJZYt2+
 esLQ==
X-Gm-Message-State: AOJu0YyX7KQ2ICAiLPYBLKhlwNkqlIiW3bnDzXkpbHSSib2tlWGOOCB/
 TWzzo+OTwe0v6gFYWAMxTQjezkmpMvmPK18pGm0DAKQC6u3UH5YGKtcggx2vYZfl/6EL+qIIOij
 afBT5UAUFz76rixIO9TFilol4XJvbY7ST+pqZcY2Cs/owpaXdxpVJcZL6999bOMH2rsAdrw==
X-Gm-Gg: AfdE7cniY+6hEHSPj6pgesS9vYZsB+bYKTeEnzLGVzIwU1PjG/iM3L+N59yuse8gmz+
 R8TddOhHu+QchoD+F/YzpaXbLGF2a2ABvzINb7FTXcyZEHrGIY/qLqtZ/5Y1WP8dMVr9sc5BlTz
 gD38MfbOGC2OH+GPXvW0sWB7umTIe7Gf1qfX8genu++Oi67u+PyVgD26MpD+3P+YeytrIkxBvb2
 uQ6TQiQaOwDWEv+XwijY4Y/FykDt0/aII5yJx3u/iTH+JZDXrJ5EeEmg30vpMTstXo1PjGz3h6t
 RvqSjRZxmxGI1LOYgn892v53KsISRElWbwd434kWKa77TFuyXTqpRTzzb7Zcl/OsqsOblfgRBAr
 Ybpq4nqPx2Yti/P2R1i4waw08wToEhVj8yB8Pqy9WRLm1v74IDf2/poCQxbAapOUW6ElrFBPXX4
 hfcFlrtst9Q/R3NV8BWlezec/k8LpQAoE=
X-Received: by 2002:a05:6000:468f:b0:472:8343:7f5e with SMTP id
 ffacd0b85a97d-47759d1acf4mr5922598f8f.5.1782984488810; 
 Thu, 02 Jul 2026 02:28:08 -0700 (PDT)
X-Received: by 2002:a05:6000:468f:b0:472:8343:7f5e with SMTP id
 ffacd0b85a97d-47759d1acf4mr5922573f8f.5.1782984488442; 
 Thu, 02 Jul 2026 02:28:08 -0700 (PDT)
Received: from ?IPV6:2a02:3035:601:211c:b85b:1021:c955:d2d?
 ([2a02:3035:601:211c:b85b:1021:c955:d2d])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-477de3dcf59sm7547307f8f.34.2026.07.02.02.28.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Jul 2026 02:28:07 -0700 (PDT)
Message-ID: <0111db84-e090-4ea5-8c15-0e9623c9c064@canonical.com>
Date: Thu, 2 Jul 2026 11:28:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] hw/arm/virt: define initial aarch64 TCG CPU
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
References: <20260701231224.106850-1-heinrich.schuchardt@canonical.com>
 <CAFEAcA9Y1Mfsdn=tQXA=QJqa14JbjhnexPhnem1oi9vyeDPVpQ@mail.gmail.com>
Content-Language: en-US
From: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
In-Reply-To: <CAFEAcA9Y1Mfsdn=tQXA=QJqa14JbjhnexPhnem1oi9vyeDPVpQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=185.125.188.123;
 envelope-from=heinrich.schuchardt@canonical.com;
 helo=smtp-relay-internal-1.canonical.com
X-Spam_score_int: -47
X-Spam_score: -4.8
X-Spam_bar: ----
X-Spam_report: (-4.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.445,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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

On 7/2/26 11:05, Peter Maydell wrote:
> On Thu, 2 Jul 2026 at 00:12, Heinrich Schuchardt
> <heinrich.schuchardt@canonical.com> wrote:
>>
>> Function virt_get_default_cpu_type() is meant to return the default CPU
>> type. But for aarch64 TCG it returns cortex-a15 which is a 32-bit CPU.
>> This results in failures to boot if no specific CPU is required by
>> the command line.
>>
>> Return neoverse-v1 as default aarch64 TCG CPU. This is the aarch64 CPU
>> with richest feature set.
> 
> The default CPU type for the "virt" board is the way it is
> for command line backwards compatibility: people may have
> existing command lines that this change would break.
> 
> I agree that for most people "cortex-a15" is not what they want;
> the underlying principle we were trying to follow at the time was
> "any command line that works with qemu-system-arm should work and
> do the same thing under qemu-system-aarch64". So the virt board
> has the same default CPU for both qemu-system-arm and qemu-system-aarch64.
> 
> If we were going to change the default, I would probably suggest
> using "max". Picking any particular fixed CPU model name is a bad
> idea, because (a) it won't work with KVM and (b) in five years
> time that particular CPU model will be an old and out of date one,
> and we'll find we still need to tell people "you should specify
> a CPU type because the default doesn't have XYZ features".
> 
> thanks
> -- PMM

Hello Peter,

Thank you for reviewing.

Using 'max' as default for aarch64 would be fine me. This would work 
both for TCG and KVM.

I last encountered the issue when running a VM via virt-managers. We 
cannot expect the default desktop user to know what CPU they have to 
choose to run an arm64.

If a user runs qemu-system-aarch64, that is typically not for running 
32bit software but 64bit one. A user wanting cortex-a15 here is not a 
very likely use case to me.

Changing the default does not have an impact on existing users of 64bit 
software as they are used to specifying a CPU which will override the 
changed default.

Please, indicate how to proceed.

Best regards

Heinrich

