Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FAE4F513E1
	for <qemu-arm@archiver.kernel.org>; Thu,  5 Mar 2026 22:00:02 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vyGjM-0006Mo-8F; Thu, 05 Mar 2026 16:59:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vyGjL-0006MZ-CW
 for qemu-arm@nongnu.org; Thu, 05 Mar 2026 16:59:39 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vyGjJ-0008Uz-RD
 for qemu-arm@nongnu.org; Thu, 05 Mar 2026 16:59:39 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4836f4cbe0bso73507405e9.3
 for <qemu-arm@nongnu.org>; Thu, 05 Mar 2026 13:59:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1772747976; x=1773352776; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=AhvdEgbWbb60CUEgoGGrbB8sqJEe9ifPj9q7uHtYrHg=;
 b=xQtzt9zRqMFZVSXOaEGsxgqFfTWJXIUcmzxYrm9kWEs4ji32EjKmuLwxgoFSj4j8SH
 d7AwCh0E3Q+yyb/P0+dqspWjpDy2yK78KlPn0AdFMclRZCjVdpviFbrgUBpcXevCwBub
 RPYTyOCMeXXIp7TtlcLE3uQWB1IE1ohlf2MQMKE9szpRei2OKra5OTfiX487XDsvjV1T
 7GewqtsSwd3M656F4udS5jhibCzRvjQzqReNqJmFD90YMNki9Zfy5B015dPRfhk/+3+9
 jdN4P3uuRwPsz+gFOHq6viZ6CFCL3AQ1In/TXmy3W8Idgbh8Z3kqg0Cd6NzL7gkwktg8
 ieiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772747976; x=1773352776;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=AhvdEgbWbb60CUEgoGGrbB8sqJEe9ifPj9q7uHtYrHg=;
 b=vWgx4+fvsVL4biryeFMNh3aOfFWI8PapGg2hTn96gPqcec9FkizrbenM0z+1ckT9Ri
 3XSgARGI9ivQCAq0WWIfiedlvPhgdmaK+EIg3jFWMKtB7Z7pFdCvPK5uBij1K4ZTTdA8
 Mt96tGIDHxRUrwU8ppuKT7rHM0UCby9sJyEvzK6LR1edVjf0SiZiJrbEEpBrcAsT1f0B
 /9ZCE82IIGpEaAnaDUB/ZPwyULyYc+6GL7a5ZZLtyQJm1F9wUZvXFo5JFK30wUvtIDB6
 EvxRws4kbl/4NgAQPkvVfcGF4N3elCPBsm2r70A9w5oq1bXYOGe+tnj9163vFWgQwN+1
 P0KQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUKH0NnQnCnecFI469a4D4MW8GuRDTEyTwdXBbrRTwSxMbqcPYs4nMOMpIz1RzlH4Ufk5gizuBxLw==@nongnu.org
X-Gm-Message-State: AOJu0Yziej2fJSRYVqseRtrkhpNzZ4n/zU9B7qLHffKvTliEc7m0dVQ1
 cZJwlhLr1uDJD1Gnu6A0UmVYLj54z9nBZx1FtA5IYP+U7TFCU6FwigzfZVIGCmuKnzk=
X-Gm-Gg: ATEYQzwCJIXTsPxQHiatik0ayXbx4VFOsP/lefWOTRIVgQ5aTa6OIpC0r6a3zZHus/i
 Tl2VPCE2GQEP557x8iKNybF0Unhmz3F4Cx1D3GycQDWPXnI252DyrEhUX9ce8AkqrP23S3rUCSc
 ywZ+cvLOMfaBrzKGHZKvBVyF1Xuii2uoFAA6fTQDTyzFgLyUhBBf4HXcbo57DfcgTrrlY+S8rAP
 TMKLUWYNmsWfSj1XY703bv/315IY756Y86/Hoz4o5RtBCe9j+NxKEnc2dWAj4MzoY9chflwmBK6
 mYhYOgMuqDcjBhVA/ttllm/3vqAJSTY66i2Y+zyO5dgB1Dajcr3c1ei5rZJN30oDjn4xNjK8FDx
 wuE27i/8qi2ePPg8IgXehbLFNvPZbcYU64xhroIMdutxgUa1Pl62KCAD2kX7hVkFhbtrlCIfw0t
 NBvTMZ4BF1+bDMJ4hUvBHatx3TJ0DtK1gGoN42rS1VAVi9oUotyfdy84pQgFqaQz86LQ==
X-Received: by 2002:a05:600c:3510:b0:480:690e:f14a with SMTP id
 5b1f17b1804b1-485235b4e40mr15624265e9.14.1772747975765; 
 Thu, 05 Mar 2026 13:59:35 -0800 (PST)
Received: from [192.168.69.201] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4851faf089csm55861545e9.12.2026.03.05.13.59.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Mar 2026 13:59:35 -0800 (PST)
Message-ID: <ca77a80b-cd67-45f5-9a40-9e800ce8e4a7@linaro.org>
Date: Thu, 5 Mar 2026 22:59:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 03/12] accel, hw/arm, include/system/hvf:
 infrastructure changes for HVF vGIC
Content-Language: en-US
To: Mohamed Mediouni <mohamed@unpredictable.fr>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Phil Dennis-Jordan <phil@philjordan.eu>, Paolo Bonzini
 <pbonzini@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 Mads Ynddal <mads@ynddal.dk>, Cameron Esfahani <dirty@apple.com>,
 qemu-arm@nongnu.org, Roman Bolshakov <rbolshakov@ddn.com>
References: <20260228220837.35275-1-mohamed@unpredictable.fr>
 <20260228220837.35275-4-mohamed@unpredictable.fr>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20260228220837.35275-4-mohamed@unpredictable.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 28/2/26 23:08, Mohamed Mediouni wrote:
> Misc changes needed for HVF vGIC enablement.
> 
> Note: x86_64 macOS exposes interrupt controller virtualisation since macOS 12.
> Keeping an #ifdef here in case we end up supporting that...
> 
> However, given that x86_64 macOS is on its way out, it'll probably (?) not be supported in Qemu.
> 
> Signed-off-by: Mohamed Mediouni <mohamed@unpredictable.fr>
> ---
>   accel/hvf/hvf-all.c        | 50 ++++++++++++++++++++++++++++++++++++++
>   accel/stubs/hvf-stub.c     |  1 +
>   hw/arm/virt.c              | 23 +++++++++++++++---
>   hw/intc/arm_gicv3_common.c |  3 +++
>   include/system/hvf.h       |  3 +++
>   system/vl.c                |  2 ++
>   6 files changed, 78 insertions(+), 4 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

