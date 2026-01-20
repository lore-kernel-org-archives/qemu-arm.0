Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D6EAD2ED0F
	for <qemu-arm@archiver.kernel.org>; Tue, 20 Jan 2026 11:14:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vi9fk-00026L-VV; Tue, 20 Jan 2026 06:13:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vi9fJ-0001vj-Mn
 for qemu-arm@nongnu.org; Tue, 20 Jan 2026 06:12:56 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vi9fG-0004Zk-DP
 for qemu-arm@nongnu.org; Tue, 20 Jan 2026 06:12:53 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4801c1ad878so40932165e9.1
 for <qemu-arm@nongnu.org>; Tue, 20 Jan 2026 03:12:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1768907568; x=1769512368; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Xq+7LtLjTmmyLgLFhCSTwgZ2FZqdBKw4qYSaPKbXI+0=;
 b=buMGc3a5LsUjqjSTRMo6gamPprxA1vC4EAcD0yxEKWfsKMeGJ9JgZQI58eR60o2Fit
 uuBmdDM+U7Xsy1+nbLlHg+4U2/QKA61kW9J3oqoZgKQQCRk60akqusDttY8PjXMPcBdD
 gzpjkeeRaXbMoWWA80zVktncOmaMzDpmbZAG55V2W3F5VmsS136P+VFPeobDF03bmYY3
 8pVUjI/ef2qGSEaJvLMNJwNSn+3wRjXikMF854WGFHfzp942U3bXEouIUjdAuFy/6LDh
 mP9ul2Y9OQaSmnViUAzhvrR22c1OHgGPb4efVaxFNkpdcwtkP9ZHs4zq9J+qa9QOX4jC
 Q/mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768907568; x=1769512368;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Xq+7LtLjTmmyLgLFhCSTwgZ2FZqdBKw4qYSaPKbXI+0=;
 b=IQkoI9CnmhRBDruAyZQzrAp1dlrxm24/4WHCTXwm/YdzkRBqh2PggZyT95S6LMa8Qf
 vUB3xIM9Pkz86oySgfhxzuQjRmdmNlPM2/oNNZi2U9E75ZiCwFVU4Bid2uRVfd/b34My
 qhL0dtcznx2vnB0vUG4dzrxQdWDwwrmtNSzWVLtlNawyeqB/R2Ba9KlzWFGoydYWt6qU
 Xg5IRdywNkr1UtoPNZ2vS66xsldnm5zrkLropp4JIgnAbYVYHE7QT7Q6+h2RGx+L9ueR
 5wVULm9EArANxqMD4GpAjH17k5dykr46l0Z3vuTUA/6toEGihRWYKOPefb2vuYF8UyPo
 E1XQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVTE9mP6xapIMHEjFLc8O8BkkVHx3TWLMcc5N7e4bfJp8Ai0B5fTCYydEAIyL8TJGTRaQySo8NZpQ==@nongnu.org
X-Gm-Message-State: AOJu0YyAfroA8wYlpMaLw56fM/4K9MboqoatYxK45FOFuz0mpS12sUQ6
 nfDezKZahPLRjhicU9zPrTUqOq/QKVLjCta4yIb9CfaZ2TJVrTBbdyHrWAb6j7bv6Pk=
X-Gm-Gg: AY/fxX6ykU9qWvVDm9UEH6Yrpz0OgFKGCqwFXRY5O9SA5pxZVcRn7RrY706YNUUwkJn
 E+YSbXmfqbTKNcjn08iXRNClDYm83hTxKLF/PHHn2+XBz+6ORMltFKrF/uUrIvfNIdMbDWHH+JA
 WOq0nRwcAYUUdlVioDuMtz26sEd0vgPaUUQLaqxjuINOlxSTbQdXFmeDWI8acUDG07cbvkF52iO
 tXzS/hOiqIU6wobGPuJx6lN/ohocv7HuwrZHthW/TgLsAiq0cNNSS6uLeTd5XwwdVHsHc6WM5xp
 J9dDR73xObnllr71b9RSuZahPhAKALNMnOHG6t4c7TwehoBXaFj6SIYWWmqecnARIiV3rKw24fc
 FdSJ6GOlk/5kLfj8q7M48CQjDkoUzMuhgXZ5eBfEfxFw81JZyT+QN7nI92QgsYX/xo9RoyqPNEf
 C72YMMAn4CGkiITeY5ONSamPgv+I4lkf81y9AbPGHq5F8JQPCP7Dx0dA==
X-Received: by 2002:a05:600c:1d14:b0:47d:4fbe:e6cc with SMTP id
 5b1f17b1804b1-4803e7a39damr20440815e9.13.1768907568247; 
 Tue, 20 Jan 2026 03:12:48 -0800 (PST)
Received: from [192.168.69.210] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47f4b2672d6sm304061045e9.14.2026.01.20.03.12.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Jan 2026 03:12:47 -0800 (PST)
Message-ID: <8d532719-7bf7-4a35-9d64-85efe6440e41@linaro.org>
Date: Tue, 20 Jan 2026 12:12:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v16 24/26] whpx: arm64: check for physical address width
 after WHPX availability
Content-Language: en-US
To: Mohamed Mediouni <mohamed@unpredictable.fr>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Pedro Barbuda <pbarbuda@microsoft.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Phil Dennis-Jordan <phil@philjordan.eu>,
 Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
References: <20260116135235.38092-1-mohamed@unpredictable.fr>
 <20260116135235.38092-25-mohamed@unpredictable.fr>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20260116135235.38092-25-mohamed@unpredictable.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
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

On 16/1/26 14:52, Mohamed Mediouni wrote:
> In the case where WHPX isn't supported on the platform, makes the
> intended error appear instead of failing at getting the IPA width.
> 
> Signed-off-by: Mohamed Mediouni <mohamed@unpredictable.fr>
> Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> ---
>   target/arm/whpx/whpx-all.c | 19 +++++++++----------
>   1 file changed, 9 insertions(+), 10 deletions(-)
> 
> diff --git a/target/arm/whpx/whpx-all.c b/target/arm/whpx/whpx-all.c
> index 3329deeb57..79e9065d3a 100644
> --- a/target/arm/whpx/whpx-all.c
> +++ b/target/arm/whpx/whpx-all.c
> @@ -654,7 +654,7 @@ uint32_t whpx_arm_get_ipa_bit_size(void)
>           WHvCapabilityCodePhysicalAddressWidth, &whpx_cap,
>           sizeof(whpx_cap), &whpx_cap_size);
>       if (FAILED(hr)) {
> -        error_report("WHPX: failed to get supported"
> +        error_report("WHPX: failed to get supported "
>                "physical address width, hr=%08lx", hr);
>       }
>   
> @@ -874,15 +874,6 @@ int whpx_accel_init(AccelState *as, MachineState *ms)
>           goto error;
>       }
>   
> -    if (mc->get_physical_address_range) {
> -        pa_range = mc->get_physical_address_range(ms,
> -            whpx_arm_get_ipa_bit_size(), whpx_arm_get_ipa_bit_size());
> -        if (pa_range < 0) {
> -            ret = -EINVAL;
> -            goto error;
> -        }
> -    }
> -
>       whpx->mem_quota = ms->ram_size;
>   
>       hr = whp_dispatch.WHvGetCapability(
> @@ -910,6 +901,14 @@ int whpx_accel_init(AccelState *as, MachineState *ms)
>           goto error;
>       }
>   
> +    if (mc->get_physical_address_range) {
> +        pa_range = mc->get_physical_address_range(ms,
> +            whpx_arm_get_ipa_bit_size(), whpx_arm_get_ipa_bit_size());
> +        if (pa_range < 0) {
> +            return -EINVAL;
> +        }
> +    }
> +
>       hr = whp_dispatch.WHvCreatePartition(&whpx->partition);
>       if (FAILED(hr)) {
>           error_report("WHPX: Failed to create partition, hr=%08lx", hr);

Squash with patch 18/26 "whpx: arm64: clamp down IPA size"?

