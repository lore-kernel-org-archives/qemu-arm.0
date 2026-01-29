Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 954F8D6100E
	for <qemu-arm@archiver.kernel.org>; Thu, 29 Jan 2026 11:56:13 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vlQVL-0003ol-3d; Thu, 29 Jan 2026 06:48:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vlQV9-0003lD-JU
 for qemu-arm@nongnu.org; Thu, 29 Jan 2026 06:47:57 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vlQV7-0002nQ-Ez
 for qemu-arm@nongnu.org; Thu, 29 Jan 2026 06:47:55 -0500
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-47edd6111b4so8974545e9.1
 for <qemu-arm@nongnu.org>; Thu, 29 Jan 2026 03:47:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1769687272; x=1770292072; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=pl+i2s0HO9f0YiD7dfYp+gRanisRF1fEkPjAWJfVLbU=;
 b=pXPa5Ly+EvvFibiAbuIig9aFC0KO8GQPAId5KYUM1xt+jCtwQVDI/g5EcT7Mwq/BcM
 MkKFPEnc0LwdjcHtfxtpGz1EwWf78P29BZq3ckeGCZVWXcuA1HL2OuVOqmhx2ySK4vpI
 nHoTqwhvKUWqIHVjskmhgtxD0AC45b9WPw+Or92khNF93l3EoFkzbeljsidPePOMx1OR
 S2NJ8G4cZsR079c0hM0ESy43QlFZ4X/QagMMnXS7HRQGIygQ+9/l8WV98czry/H3JHQl
 7l/qwPvP7czl6mtDvdJGhKU57+7Qxxa28oTwNJzSfGVgYiif7e6EyZd4wQPm3mymxK4c
 ww0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769687272; x=1770292072;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pl+i2s0HO9f0YiD7dfYp+gRanisRF1fEkPjAWJfVLbU=;
 b=QpCAYlPPIH8YC6TtPDOZC9RHGgqR7SdKS1HqrkuHl13Gis7z7sXLDiroctpmrGAqEG
 5gcJMpPET4ZfDt7u89NmV1AUijeGoGtahGagfiB9IMVgAuFm0l5LxKJsiISbsN094K/f
 k3oAadSyZ8EQSOM3v/eYMrxmVHQ28WeJlPUCwoLy5o1Sl9YGBL5ZeThR65RUjru+ocMU
 s1wNsf6hPn0Ekm415aCMcGjwKsHsSfUlCavR5OIn4/28tQI1fkh8parKc94zDs0JJ8KZ
 yC3WYarIToqbhoLWXzyAxK1GPoUeNrbIkJTw9Oj4/wGIxSVlT8xwVnX6HE7IJqZSsP4h
 kNfw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVOw7M3VaTUrv1A0f/3Tyuhfd8ZsRKPs8mDd8RLUmjPrZESB1vJFKBHEQ8opNNwj6Kac76eA2NWWw==@nongnu.org
X-Gm-Message-State: AOJu0YxD5eoLOTw9NhWyLJgVOvzyD1NGVgi4I2beAR526lZTHiQpcAI8
 PnbesTchxI3/mYW2+h9cdPW7gpvGjOfZH2okU3OC4cwOq5W96zq+5e5d+WUUdB6FZC1rlD/uIaU
 ED1ssK4c=
X-Gm-Gg: AZuq6aLH3PwlYoRudIZM7L6NvHHxpQ9/d5MOx1VpSB5lgh98HM0KSrcY1P16130TTPW
 Vok3gVawqDykfeANo/CBredyzJY8EeS+KqsDZst7eiugOBRQW+DnNcrFKPvH5A8aQlQqfUFWcEp
 DrUVRbCT0PKS1CWEj6poAYk8rHeii8dduw+5KB38kksYyxcNM2rRWyAAIgGJkohma6hQJeV4e9y
 9Ic3TzlkgYWPEADuzm8HOC6AycCl02C5229SuNoAeDzvYeGXOqb4xb8kl1YI8Zs4OQe+Um9T4SQ
 eHy9qj/wtlbLw6uJB1p8hFlM0ilUJhjAaPydfPlNitMiupeabtyZASOzQ3ui7BVjXxxrFVv7eRT
 VdN/uwLMVbjcCtvnb9wYXfkJFHg62AJT9+Bzl19Jk7nzAXod7GRCY1xSgOpcSEkbYe/iH8OQmhJ
 ZPVi/5OSjvqPT/gJG2mKHWo5uxM2BngA4I8ysdy2WgJIwuqfjUV8LzvQ==
X-Received: by 2002:a05:600c:3e16:b0:477:755b:5587 with SMTP id
 5b1f17b1804b1-48069c10f78mr95761315e9.8.1769687271752; 
 Thu, 29 Jan 2026 03:47:51 -0800 (PST)
Received: from [192.168.69.210] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-481a5d31651sm2188395e9.4.2026.01.29.03.47.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Jan 2026 03:47:51 -0800 (PST)
Message-ID: <a4d3bf53-e1f9-4287-b8b1-3c84555bad83@linaro.org>
Date: Thu, 29 Jan 2026 12:47:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/6] target/arm: Handle SME-without-SVE on change of EL
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
References: <20260129113455.1283266-1-peter.maydell@linaro.org>
 <20260129113455.1283266-5-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20260129113455.1283266-5-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x335.google.com
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

On 29/1/26 12:34, Peter Maydell wrote:
> aarch64_sve_change_el() currently assumes that SME implies
> SVE, and will return without doing anything if SVE is not
> implemented, skipping a possible requirement to change
> the vector register state because the SME vector length
> has changed. Update it to handle SME also.
> 
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   target/arm/helper.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index 732c3a9eba..655ce73ee1 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -10127,8 +10127,8 @@ void aarch64_sve_change_el(CPUARMState *env, int old_el,

Could we rename the method? Maybe aarch64_vq_change_el()?

>       int old_len, new_len;
>       bool old_a64, new_a64, sm;
>   
> -    /* Nothing to do if no SVE.  */
> -    if (!cpu_isar_feature(aa64_sve, cpu)) {
> +    /* Nothing to do if no SVE or SME.  */
> +    if (!cpu_isar_feature(aa64_sve, cpu) && !cpu_isar_feature(aa64_sme, cpu)) {
>           return;
>       }
>   


