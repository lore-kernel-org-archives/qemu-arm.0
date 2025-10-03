Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E10ECCA470
	for <qemu-arm@archiver.kernel.org>; Fri,  3 Oct 2025 08:32:05 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v4bCW-0002ty-53; Fri, 03 Oct 2025 04:31:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v4bCO-0002sy-IS
 for qemu-arm@nongnu.org; Fri, 03 Oct 2025 04:31:34 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v4bBT-00054p-66
 for qemu-arm@nongnu.org; Fri, 03 Oct 2025 04:31:32 -0400
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-3ed20bdfdffso1816829f8f.2
 for <qemu-arm@nongnu.org>; Fri, 03 Oct 2025 01:30:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1759480221; x=1760085021; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=rwuRZW6FgmkQHyMckSYAn+D7EQWqvO+qAeyjKGEmOXo=;
 b=p0iri+QkfBF0GnOdO8wG84hx+qqDNzjGDFbTStbo0vxjAum6Kfu+I+p7QNi0sjxepF
 PidBJfnkiqzarVndhk2fOiiF8LPmZnQgfX3eRF32I/c0H6++UTDh2+3fKft/F2SsbG5G
 ZIoL7EZ/aG/aHAhb7XXYe/CGEjHnNr0z4QxT/iyTdyrUIN7vPQjv926PSuaP9PzsTbqS
 so9/U+roF/5q9kXWYO9+GB0SKlCuY3VRrm0sNV4FjvckjLrh3KkrcQ/JurytEapN6BrO
 8hEGaSlwSMsufXpA+zcvjjiCk4h4DfuK+dkSgWXeO6emPk/rP/VzBekzMw9bzmDBwAp+
 aonw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759480221; x=1760085021;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=rwuRZW6FgmkQHyMckSYAn+D7EQWqvO+qAeyjKGEmOXo=;
 b=iOIOX8OA16stb+N8pT9f4z7z77clvR7dnyrlEDXT04yn6gReJx/uQo1VOJi2diT3OK
 xCq1eAx2OYc+q41TO290NyiIQrlxOboQ15ggl2SrJSDhIfXaopEse55l1zc1+9akseCg
 gErwtzsYlCFPSp0lL1F4G0I/1LimowT2lV/1KXG0Kj/+AdPSIqpN4YSQc4enB4DSlyDr
 dcWJETZuOTt7+oz3dfd6ITWikEsXO5wAxK/CEKjpk3bkPnCoDr+MiPy43U/O2ucAechI
 xu6ws7dije3X5bpypcYaCvWNDNw53ASwJ7s+BnuIwFQL4WMDExGQV3BA322W7IPZ//L+
 DA2w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVxf2bnVxJsAbwSaS64Q2wQcST2M89omw6kLJRNLWkBK2O6kCS4hVwXuflq4gCFkxijd8eL4aE6Gg==@nongnu.org
X-Gm-Message-State: AOJu0YwnlKUYTTIsInWFynlg2V1Dz1Q+ZodMFHX23EObckImNHeY2wvx
 kDqcxL3Tjntungl0J+SyDXqiS29f/b1uTNTdIsxpCt2hInLq9DuWvihhXEFahiX1dvM=
X-Gm-Gg: ASbGncsPZ0BmMxWst0Bzr9wdVsSPSa4+9TS3SYz++8wbyisR+fAXSbkQbGPRtX1JSpr
 1vZwg/ONZh2YqhOe0Q5ho+paTDY7lKgD1/FV8Q24VK7XfCwpa8W5AS/CrAIch8rCLSLU8xQH5eq
 BFi9i3MNmAQLSv/vxCXF1GFMsbl/idfq7yC8oq3X2vNoO5fLwBuz6CTLlXOIRcyGrEfSDH1BPSH
 CRtKY7uqU9Ncz9F/54Wk1U9fOoXBwDw56giBUGyCkRB3mg0WnAX8U8f5f3V20igtKXd0NBPp4oW
 8WvjnL+hFuKPA/3t62XG4izEJG1hUrXPpOrNPcu+j5arVBMwSZ7Ca4axnSyP2Au6To/oKOxR5L7
 zn2wYhsqyaRcQowmBcZ0+nqv9LE8BwMw7F045dNwO8YrWKkyNkNfl6hrvFyLTQOTHkgSvVbLGr/
 dKDPoSiVHZOfBdp98r1CsufaMmWMWvY0JZoamLV4s=
X-Google-Smtp-Source: AGHT+IFl8GMja8YEeD3d95FM8/Zg6YC+4+nl3/eDvuPYBpheuixCNqmeoA2Qv91KuemVs0HcaCfqkQ==
X-Received: by 2002:a05:6000:2386:b0:3ee:1357:e191 with SMTP id
 ffacd0b85a97d-425671a92f2mr961271f8f.30.1759480221060; 
 Fri, 03 Oct 2025 01:30:21 -0700 (PDT)
Received: from [192.168.69.221] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4255d8f083asm6874915f8f.43.2025.10.03.01.30.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Oct 2025 01:30:20 -0700 (PDT)
Message-ID: <94e114ff-25d9-4feb-9c7b-9323ff29c195@linaro.org>
Date: Fri, 3 Oct 2025 10:30:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] aspeed: Set 'auto_create_sdcard' to false
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
 Jamin Lin <jamin_lin@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>
References: <20250930142448.1030476-1-clg@redhat.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250930142448.1030476-1-clg@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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

Hello,

On 30/9/25 16:24, Cédric Le Goater wrote:
> Don't create a default SD card device at init time.
> 
> Cc: Philippe Mathieu-Daudé <philmd@linaro.org>
> Fixes: cdc8d7cadaac ("hw/boards: Rename no_sdcard -> auto_create_sdcard")

The "Fixes:" tag doesn't seem appropriate here, since that commit does
not have any logical change.

I suspect Aspeed boards have a pre-existing copy/paste issue, and should
not set the auto_create_sdcard bit, using the default @false value.
Which is what you ended doing :) See commit the following commit,
5824fad4e92 ("hw/boards: Do not create unusable default if=sd drives").

I'd be OK for a v2 with an update description, just removing the lines
in the patch (no need to explicit "auto_create_sdcard = false" since
this is the field we want to eventually remove).

Regards,

Phil.

> Signed-off-by: Cédric Le Goater <clg@redhat.com>
> ---
>   hw/arm/aspeed.c | 44 ++++++++++++++++++++++----------------------
>   1 file changed, 22 insertions(+), 22 deletions(-)
> 
> diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
> index a3659ffea475..0d1f043ac214 100644
> --- a/hw/arm/aspeed.c
> +++ b/hw/arm/aspeed.c
> @@ -1450,7 +1450,7 @@ static void aspeed_machine_palmetto_class_init(ObjectClass *oc,
>       amc->spi_model = "mx25l25635f";
>       amc->num_cs    = 1;
>       amc->i2c_init  = palmetto_bmc_i2c_init;
> -    mc->auto_create_sdcard = true;
> +    mc->auto_create_sdcard = false;
>       mc->default_ram_size       = 256 * MiB;
>       aspeed_machine_class_init_cpus_defaults(mc);

