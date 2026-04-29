Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42400CD13D2
	for <qemu-arm@archiver.kernel.org>; Wed, 29 Apr 2026 18:56:16 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wIA4m-0006QH-5Q; Wed, 29 Apr 2026 14:56:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wIA4f-0006MX-HY
 for qemu-arm@nongnu.org; Wed, 29 Apr 2026 14:55:54 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wIA4a-0005sE-Mt
 for qemu-arm@nongnu.org; Wed, 29 Apr 2026 14:55:50 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4838c15e3cbso618565e9.3
 for <qemu-arm@nongnu.org>; Wed, 29 Apr 2026 11:55:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1777488946; x=1778093746; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=BqPQKxxi/wwNTmXhStM1kPDyQtFRQ1mtzszwSk0pXzw=;
 b=euhp5P8znlI+liEYpbL1Cqx/2WP2TBCRitNO6Lm8mG/Hrvir+wwq3/g0o/yMzBvCzY
 L1zjqMc+LwdHIm4Ygdp7kYHbYrV4Iq1KsM81c2Zmj5JG9P/p7YntRzFBBElpRfNNKpKF
 0hz+8RaqNEOd1HkrzUXB7Mh9gSVqZ7eJDZE51wpEWSj8XZeu8MwpwDF9SiTD2w96JRCv
 dGBpoc07Rf3PT8TXH5iCK4qC2WNHdEpnfVA8uKAv2HRbXuYPY06mdUD6FZArHIUYX2+x
 OKAKNmZOa7QnyEyyfTrvKPyBcGksaE5cqmhP5d4lGl+6xXp4hx0fURVtaRALpbW1rWdi
 KlAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777488946; x=1778093746;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BqPQKxxi/wwNTmXhStM1kPDyQtFRQ1mtzszwSk0pXzw=;
 b=cCsc8f/XI72RB7VqiFJmNtN2FVB1tdpRQkjZLwGOhQVne5G5OgxAjOApYvxF8KWqGU
 mDEpO4n2UbvQyRZ5vIUwmZiwQSAp6cCrQFqbHka3GZlTe1W/jcB2D62r83OfgOCq7zkk
 53gjLk87QKOQdXbmlwfFlDqIodb6t0sjxkxjbjhUK/IUOxdCFlXzMp/eO7OS/UuoSEqG
 yAb0wyFR5KtHgSY53oCkfRCgnTB2INJKVoW2HCP2ZnYOpVhfUOS3DkjDxSg/6oduDtRG
 yTc/9/PKpW7D5YIli9WIGPi63Dbt/OCQrrWeqcBhmlLNY2JTsqmfc6s8m6U2aAyFpUsO
 gNXQ==
X-Gm-Message-State: AOJu0Ywls9CqBryFjsVZ/e4N4RJVJRibmhWdFNWrQb8BsJGt/srmMSAd
 Ndn4i3RsIfXNWXFRla41InRw6WfFEDrUHwyl5VgoDCOmYjtkW9FfmiaaPdb8KJHxdKZOWnWgU1+
 dyjsMJJM=
X-Gm-Gg: AeBDieucGr2hCLZ3jWaKk/jlU6Kse6XYKcz77KS7QtpV7NpxGWC5u6Lse482KtKbbR7
 e9jHJUlNccYRW1DmHjeo8yB3UK8IjTKpa9Ta52r6Uud4i0otyQziFxyuEvn9r0D0AJxcQO9ZR9H
 RpldF9m1FOSgIOVpLFravsPhldJOgmVrITTNEFs/qGtWEkhrEthamlJzZZWKxiSphhC+APudMGu
 BIC7lk5yZAelyAdhnClCHuPHtm1vFwQT+yDW9XHP1J+hbK+BFVNeEykO6ex10LxR7wRX4A4BUq2
 8oJQsmUoolaQlO8phiyS0B9BRjjnIrLlie89QLW1nvftv6tRjiuPvCjz5IFVGarAsglUB6npUYt
 ugqiS+CBI8nLze39E6SWLraNgjbEIH2EGesjFsFJkydFywr9wEnVs0iAEn54zVYPIN14QW6MMaX
 QQQwkIxEBVGz+/8CrVZjebsXAbqKKGVGQvCkVF2lq1LW0VjVxIWj3kJwiEk1c/eFrdkEZJ5LfDA
 C5D
X-Received: by 2002:a05:600c:34c9:b0:48a:53ea:1405 with SMTP id
 5b1f17b1804b1-48a7bfa1be7mr73608215e9.12.1777488946343; 
 Wed, 29 Apr 2026 11:55:46 -0700 (PDT)
Received: from [192.168.69.210] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48a820c865esm8980435e9.5.2026.04.29.11.55.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Apr 2026 11:55:45 -0700 (PDT)
Message-ID: <f17bb0b4-4287-41be-91e2-720dc6447f89@linaro.org>
Date: Wed, 29 Apr 2026 20:55:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 43/84] fpu: Return struct from
 float{32,64}_unpack_canonical
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org
References: <20260426134002.865628-1-richard.henderson@linaro.org>
 <20260426134002.865628-44-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20260426134002.865628-44-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x336.google.com
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

On 26/4/26 15:39, Richard Henderson wrote:
> We must change float32 and float64 at once because
> of the DEFINE_S390_DIVIDE_TO_INTEGER macro.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   fpu/softfloat.c | 300 +++++++++++++++++-------------------------------
>   1 file changed, 107 insertions(+), 193 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

