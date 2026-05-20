Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15F4CCD5BAA
	for <qemu-arm@archiver.kernel.org>; Wed, 20 May 2026 16:32:00 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wPjpn-0003g3-EW; Wed, 20 May 2026 12:31:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wPjpm-0003fa-Ey
 for qemu-arm@nongnu.org; Wed, 20 May 2026 12:31:50 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wPjpj-0003pG-VF
 for qemu-arm@nongnu.org; Wed, 20 May 2026 12:31:50 -0400
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-45e8a834cc2so1841459f8f.1
 for <qemu-arm@nongnu.org>; Wed, 20 May 2026 09:31:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1779294706; x=1779899506; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Z2EjhU/ZRFtFmSNVNXFcNl7oZ0SpygIFip8yD1TYI7w=;
 b=kXeabd9QMoMLy9mFL91sE2OFLYeDnuAsuQwR4FnIjgsX92CHDX7AGoXzT0jQxn6GRN
 fApmuuwxQnAnIIecy4TuPH0GHnbwS3N1RszsYIbtj1LlZtejUjMhZ+SvXrN2F+2+9QYW
 jXAWMCzrfUThWnT1VThxYNxXGH+aVV3GGo0gTKkACa9WdHB/Gd9rDqHUfGGjVeqyAdcK
 r9Kh8x5WR0c4/HOH+Vjm6D0Y36JXqNDkxElsIxNkzAcXRm8uQbgAZGCgoPHs+DE56c9v
 9DjetuLm/3Hapfdz9SwUuC67YDVzYd3rLSpF8HzkB7b6S29tjabp7DPpwcbxzliB/Kew
 52rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779294706; x=1779899506;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Z2EjhU/ZRFtFmSNVNXFcNl7oZ0SpygIFip8yD1TYI7w=;
 b=JEW6zkx0W+C6WNHE3dQ7ijbOAQnrZ6WZp0OFHiBFC5BU0iDJlOHPsn9rHTAFwuV2WY
 jnJx4h+B7y3uILNW+TZf2Rm/cSRj2d3RWLdc6tG4J44bkAZu8Fo2lfT+lx3cyQi/ZO12
 2TUZ4lkLh6hFHXsaCxLcpGzxJwN/gWYp3yxEUkAc+0IzdmNWxgCbSP291VPNMWH68riB
 G1wLJyvUfMylvvDSt+gSjKRWsUoQi5+rSw30bDN48PdaEy7D0nU8zMpY0aM1y64+U8km
 S90yqx7Urb00THJGk9dNAekkAyhdRy5uVZdr7z0jqtxiBam4shmO8NqyTSVZxxcP+Ni/
 mYxA==
X-Forwarded-Encrypted: i=1;
 AFNElJ9BG5dKIzbYcGDAd+t76YMdKNK09xQIOPsO06oZR7Ja/odKM2DVX5TiYWK4bXbiVwDIzTQ+3ExGeg==@nongnu.org
X-Gm-Message-State: AOJu0YwxzDXXTWR6Ztmow9ScGno43Zx2hbDR/VyKJXzrV2OI6Abc9cP5
 veKJH7GxtH90fl/xjpVWmlhkMtQ13vsu6reVbcMO6xjDR1CgNhU9Unchst5lYFfMLczAQXxpTeI
 PsZFaR7k=
X-Gm-Gg: Acq92OFfXg5ejrkMujFOtBrdCOFlkpY07/8z6Cqr7wwomdSaGFRpq0A1mYghCOAWghm
 LIeG/yLu8yeOa7QcgtNZ2ETn4cAYTwWU7hN6lC/VGQKT/h2F/uZYMm9oQPNelfcnW7Dz0lVKnZr
 +UlG+O/hzIh1MWtlBSeAfnGtqEXRgDgeqmtdntkiJJ54eln6a+5S9UHjO2kQmATAEgYA5otl2aQ
 CDVqKlDWmFjiSLagTRstJ99711oO0FBL41xGSguEVKuk2RVByqUrd51vAo2n3k4bTsh6nqzc/Fh
 ve5d9r0JyWQQEP8bujjeNUSDlmcuYDwDBYN/d4TGeKyCCdtqhpP5aniUYv5kbdf530DQ40B/93L
 YXUK5B9wfAKa2ZioEGSMjgeYC8CO2XbXrhWbsQzwCalyjYA8F0rUahxCqWL1C0zI1e13uDfxAcy
 faCUbAnzOtAiH3Ul9pCIMCZZmRY1rtClwS67CFXwnL0mmHighpwoaPS5q7UQZ3NaItHtBbRPk=
X-Received: by 2002:a05:600c:470e:b0:489:1c32:210d with SMTP id
 5b1f17b1804b1-48fe60f195amr366534495e9.15.1779294705995; 
 Wed, 20 May 2026 09:31:45 -0700 (PDT)
Received: from [192.168.69.200] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48febe585absm137476845e9.19.2026.05.20.09.31.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 May 2026 09:31:45 -0700 (PDT)
Message-ID: <2c9aa5d8-993f-4636-a07b-0a28dad1703b@linaro.org>
Date: Wed, 20 May 2026 18:31:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PULL 26/45] hw/misc: Add basic Aspeed PWM model
Content-Language: en-US
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Kane Chen <kane_chen@aspeedtech.com>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?=
 <clg@kaod.org>
References: <20260204103136.1795455-1-clg@redhat.com>
 <20260204103136.1795455-27-clg@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20260204103136.1795455-27-clg@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x431.google.com
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

Hi Kane,

On 4/2/26 11:31, Cédric Le Goater wrote:
> From: Kane Chen <kane_chen@aspeedtech.com>
> 
> Add an initial PWM model for Aspeed SoCs, including device state,
> register definitions, and basic initialization as a sysbus device.
> 
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> Signed-off-by: Kane-Chen-AS <kane_chen@aspeedtech.com>
> Link: https://lore.kernel.org/qemu-devel/20260204082113.3955407-4-kane_chen@aspeedtech.com
> Signed-off-by: Cédric Le Goater <clg@redhat.com>
> ---
>   include/hw/arm/aspeed_soc.h  |   3 +-
>   include/hw/misc/aspeed_pwm.h |  30 +++++++++
>   hw/misc/aspeed_pwm.c         | 120 +++++++++++++++++++++++++++++++++++
>   hw/misc/meson.build          |   1 +
>   hw/misc/trace-events         |   4 ++
>   5 files changed, 157 insertions(+), 1 deletion(-)
>   create mode 100644 include/hw/misc/aspeed_pwm.h
>   create mode 100644 hw/misc/aspeed_pwm.c


> diff --git a/hw/misc/aspeed_pwm.c b/hw/misc/aspeed_pwm.c


> +static void aspeed_pwm_class_init(ObjectClass *klass, const void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(klass);
> +
> +    dc->realize = aspeed_pwm_realize;
> +    device_class_set_legacy_reset(dc, aspeed_pwm_reset);

Also please do not use the legacy API. See for example this
commit to convert to the newer API:
https://gitlab.com/qemu-project/qemu/-/commit/ce788d3740f

> +    dc->desc = "Aspeed PWM Controller";
> +    dc->vmsd = &vmstate_aspeed_pwm;
> +}


