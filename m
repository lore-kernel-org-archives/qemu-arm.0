Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7FEDF8E4A7
	for <qemu-arm@archiver.kernel.org>; Fri, 17 Apr 2026 06:25:37 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wDcdv-0000rH-K2; Fri, 17 Apr 2026 02:25:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wDcdu-0000oO-Lz
 for qemu-arm@nongnu.org; Fri, 17 Apr 2026 02:25:30 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wDcdt-0006VX-4C
 for qemu-arm@nongnu.org; Fri, 17 Apr 2026 02:25:30 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-488b0046078so2628655e9.1
 for <qemu-arm@nongnu.org>; Thu, 16 Apr 2026 23:25:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1776407127; x=1777011927; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=o1/hejH9prSEAqV29hSvwmrGNQTJ/M93YPjB8sxTQ44=;
 b=GZ4Eo7Y6KgIJOwJAPbwgQQiBQLeEDIPGYgx90cU7QhnhVP12BjlEK7cuI9MfH7Y2jq
 Vld3B1VSJ57GwYdICtahTDQXSoPMKxGYID36MX3SN9hChKoLKy3lHAovoHCe0/rruf7K
 Hv0PUNp29dP9skjWlpVsI6JVOgtyYQvodhyqgf+21X946z80sUrnRJSIRaHT1TsPQzAX
 /QwSPJNC1bj9D/K4ZXZK6N2qGZlRJpV06W6jBCuStfRiZd+lGlolZfmBs8ikZ9CTQwAS
 +azDdAtVxED23h0NnViSK8MtrgCADqYbdSnvtSkOz0bp8JaA09SXhOjXFgs4fenqxBTD
 bOyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776407127; x=1777011927;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=o1/hejH9prSEAqV29hSvwmrGNQTJ/M93YPjB8sxTQ44=;
 b=p6xP2UY5A1PHzgbTwMJZeNQGIubSohucuJHE4CnjUM5RC7J2cE7xCSDsXiOZ37+14o
 jwmUDNh+frMFueP2lQj3cloLisPywOpwdJXxL7A2EaPHnYQr7plAXy/fdd+PhDqqAGeA
 Hk1c179AWoqWmgxJhSqtRoMZCz59rPw2HjlMbJSEpcXQOMdAsyvC9lGn+XK4Tm8kWD+2
 0IrZaUOPjScGGxT+r83FlT3oSuls360rEXn8VFR5TBkN/0lg59knTpLEQpxSnE1teUJS
 oVEa4JP0cNI++e8xHN7PxlVK0gKYGSTiu5dW3wCY3NkzpSG21ZqUHDCV9yzOupASUIB7
 BBXg==
X-Forwarded-Encrypted: i=1;
 AFNElJ8gxtpf7czaNCS5Ogl7LW0HcB/o3c4pU3bM+OsjkEoB2HAopCnu+ljrBf4b1StfQiAe07CPJ0j6gA==@nongnu.org
X-Gm-Message-State: AOJu0Yxp39XhOB6DggXGIoIczJWybyYbgfESItQplKIMjqJCSGDnM3c0
 VESNKloSrWQ++6NuQRyBjrwvMANu1fnTcle6AC8C6a7l+254sILNtCvZs91WNAau6j0=
X-Gm-Gg: AeBDiesPIv9p/3pXCH4XLObkZmmBxcHLC84PF2mCbxmWjPdIJKSKkJlXoE/czgV95Rz
 mQf0/kkvCr+Hc5Rfz2Y/UYs6siNPhJJ5dk94zGu6RpmQ4/tKm2pPf60EaoRNwCutghGcu+fVZ1C
 NNUqBrQg55HbQIx/LIQ9iX2wE5j9HGVn0rVfMgYcINYh9jAJeD3u6zhtIwnSCLj82cQYMkYBanO
 XFRDPoZq+BeryxfSXPB1MiCLzqnVdTOUh3N9mSzWItvBqSg9KtVv9zFnLrp8Ps2p4K7zjvo8OBl
 fAfwlICU0PMjtgHCLhh6VuZNieqMK3oycCYk17QRp+nMwZqOhARHbAWBp8J30vdntziBgvXtRmN
 zU5nyLvDeJ77npCh0q6eB0POw0ABVrsl8pt8gnX3aGSc4VBxPnArStHEUgsSs6ZOnIoLfaZvBwb
 LRlNWhZwfWSe3mw2GyMPjnOW9FxQMrmxUCuDNgf17x6Njgbwnjrwq9cTLrn74FQakjO+g3H+9nG
 CJYGPZ+y6bpfn8=
X-Received: by 2002:a05:600c:a00f:b0:486:fe83:8621 with SMTP id
 5b1f17b1804b1-488fb788924mr20000265e9.23.1776407126854; 
 Thu, 16 Apr 2026 23:25:26 -0700 (PDT)
Received: from [192.168.69.228] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488fb7c2167sm8949195e9.36.2026.04.16.23.25.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Apr 2026 23:25:26 -0700 (PDT)
Message-ID: <0503f085-784f-40fd-842d-07c6b66373b3@linaro.org>
Date: Fri, 17 Apr 2026 08:25:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 15/17] hw/arm/aspeed_ast27x0: Set EHCI descriptor
 address offset
Content-Language: en-US
To: Jamin Lin <jamin_lin@aspeedtech.com>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?=
 <clg@kaod.org>, Peter Maydell <peter.maydell@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
 Kane Chen <kane_chen@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
Cc: Troy Lee <troy_lee@aspeedtech.com>, "flwu@google.com" <flwu@google.com>,
 "nabihestefan@google.com" <nabihestefan@google.com>
References: <20260416014928.1279360-1-jamin_lin@aspeedtech.com>
 <20260416014928.1279360-16-jamin_lin@aspeedtech.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20260416014928.1279360-16-jamin_lin@aspeedtech.com>
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

On 16/4/26 03:50, Jamin Lin wrote:
> On AST2700 platforms, system DRAM is mapped above 4GB with the
> base address at 0x400000000.
> 
> The Linux EHCI driver programs the segment register to zero when
> 64-bit addressing is supported. As a result, descriptor addresses
> derived from the EHCI registers do not include the DRAM base
> address.
> 
> Descriptor memory is allocated through the DMA API with a 64-bit
> DMA mask, which allows descriptors to be placed in DRAM above 4GB.
> When running on AST2700, this means EHCI queue heads (QH) and queue
> element transfer descriptors (qTD) reside at addresses starting
> from 0x400000000.
> 
> Set the descriptor-addr-offset property to the DRAM base so the
> emulated EHCI controller can construct the correct descriptor
> addresses when accessing system memory.
> 
> Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
> ---
>   hw/arm/aspeed_ast27x0.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/hw/arm/aspeed_ast27x0.c b/hw/arm/aspeed_ast27x0.c
> index 4a1f7cad73..3cdbf78ac1 100644
> --- a/hw/arm/aspeed_ast27x0.c
> +++ b/hw/arm/aspeed_ast27x0.c
> @@ -858,6 +858,9 @@ static void aspeed_soc_ast2700_realize(DeviceState *dev, Error **errp)
>       for (i = 0; i < sc->ehcis_num; i++) {
>           object_property_set_bool(OBJECT(&s->ehci[i]), "caps-64bit-addr", true,
>                                    &error_abort);
> +        object_property_set_int(OBJECT(&s->ehci[i]), "descriptor-addr-offset",
> +                                sc->memmap[ASPEED_DEV_SDRAM],
> +                                &error_abort);

Squash with previous? Or invert 14 <-> 15 order?

