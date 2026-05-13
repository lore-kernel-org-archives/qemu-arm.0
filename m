Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A88F0CD4851
	for <qemu-arm@archiver.kernel.org>; Wed, 13 May 2026 05:43:20 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wN2Mz-0003dB-1H; Wed, 13 May 2026 01:42:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wN2Mx-0003cs-6H
 for qemu-arm@nongnu.org; Wed, 13 May 2026 01:42:55 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wN2Mu-0006oS-Lm
 for qemu-arm@nongnu.org; Wed, 13 May 2026 01:42:54 -0400
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-44dd5cb0f81so4658288f8f.0
 for <qemu-arm@nongnu.org>; Tue, 12 May 2026 22:42:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1778650971; x=1779255771; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=NB/jCwlfQ2uFQsakTEAKgPRfsZ7fv11fG8ThOhE3jsQ=;
 b=ca37PNLhMBlM61vNCbZbzoEjoj5U1FEy1tMr4xEKPZFYj4j/56qwkAcELIv8gc+PW1
 59yLefGFCxxALtNavjAenZnueML1vHwkCLILp5MklZG0Nkxt17f3DjplCGw7bNZ/TlYW
 etOtgDgz1RT6ri6YjqAtR0mTJwC/fFiruxazdLBYj0H3R8Ek2qvrJvbmDzZ1laOhHSf5
 FfpgoOG/YPVOONZCQUEK8QIvLlWOodxRskBhQ00rf4tDbej3M06s98Xjde6EBdqODQ6q
 IpTEjNWJjn3BLQ+vGFMe02wBvOo3/6PZaDhZb3943PzQyy8vziCK4UOvoKEs51kPRmUF
 svEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778650971; x=1779255771;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NB/jCwlfQ2uFQsakTEAKgPRfsZ7fv11fG8ThOhE3jsQ=;
 b=D++UlbytqNr8OClzsfWh+xpslAnsguR1ISL1NcEB13z5k+XcP8+FiJAP6KU8e/FpKY
 yeyAoKJMjzN9pPUHXjuZ4lqqZBWPaAGbeBpaZI7V5yXHsbzgp5BWRa+Z9GQBl8KYTo0x
 id1FdpRQikfrhf5GrPGF/M8DymCpBrBSJWunFF1SsU9HvkZxZ40nQFl30/RX+PGku8+i
 crkhbJ7PYg10ZRXhRx+VPAyaRrtW5FKTdlVq7HMOGb6GyQx4gmwLgRE4wCthwPlokvhP
 c0zXmyS2tE1W6XhjC1vzdSYGOjmMT0bJov8ei4StU4/ozCua4mKObU9drD/lHC21bRVF
 r/bQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ8hPZxpuvOM6Nxwr+jQXKXLKkyY37+GWgpS50HJ61Gngp2/mhMhfEZcpYBt44rlohmv3Sb1Mxe7ZA==@nongnu.org
X-Gm-Message-State: AOJu0YzXyGqHjXlNbR4cX2PBNanlJXZjPu+VUv2oC0vc16gqam4EWklb
 juR419i3G8VJp5555EPlpG+N0lcCaX+6Pb6lyCr562XKmTqf1uqZgLoariFYihmuhAs=
X-Gm-Gg: Acq92OFz3JbmkK4DbqT5TCMamC9pkBieExvK22yPrDC8L4R/frsn23sDj4BTHVlZGbp
 oh4DgHh6uhE9xVpkgenRCajXwd7gptr26a8xb8ywb0DgraN/x3GGPBTAVDGWRxLox+8hp75xSUt
 YNnMoq2ETtV6QbZEZRkMyK9tDx6NzYSCJCSDyzynUrUcu0yxtu5rcKubD20k9b4/LG+uFyp1Ily
 f+qBCmpQxtU93a/eKoN9YXxNX2VzitGqNVLlM7oPhaf540KkYvPhmu/mEjVpjbvfgQK/lF22F9m
 z90qotIl3GphzOkcByGyhSmiJMVQ2UZy7uVt2HKMrUVsKulUIGIydXDG6WU5RMJCDjtIKiCeCGw
 6tsE1ky0kgMJ4V3Jyw/yzGe6XTQjE5KFyd0fE/2imKhj7Bjb2q6X1oIz8mjOQHKMfwoFo8hk+xf
 IuyXPHwqg2WtuIB7BPYuXdKB8Ri4tpiuzxlftSDBqzYYfKMP4YAWDrL9BsItGk+w34Ag==
X-Received: by 2002:a05:6000:298e:20b0:441:2397:f40f with SMTP id
 ffacd0b85a97d-45ac0b2d93fmr7242105f8f.4.1778650969990; 
 Tue, 12 May 2026 22:42:49 -0700 (PDT)
Received: from [192.168.69.200] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-454913049ecsm36701094f8f.19.2026.05.12.22.42.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 May 2026 22:42:49 -0700 (PDT)
Message-ID: <4162b580-3e22-4aed-b5b7-d4bf2d073c33@linaro.org>
Date: Wed, 13 May 2026 07:42:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/12] hw/arm/omap: Remove omap_mpu_model remnants
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20260512203414.3633237-1-peter.maydell@linaro.org>
 <20260512203414.3633237-2-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Content-Language: en-US
In-Reply-To: <20260512203414.3633237-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42c.google.com
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

On 12/5/26 22:34, Peter Maydell wrote:
> The omap1.c code has handling for an mpu_model field which is
> an enum of which OMAP SoC model it is. We removed most of our
> OMAP support some time ago, and now the only OMAP SoC we
> implement is the OMAP310, which sets s->mpu_model = omap310
> in omap310_mpu_init().
> 
> That makes all the handling for other settings of mpu_model dead
> code; remove them.  This includes the omap GPIO device's mpu_model
> property which we set but which the device makes no use of, and the
> omap-id-e20 memory region (because the OMAP310 satisfies
> cpu_is_omap15xx(), so never executed the old if() block).
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   hw/arm/omap1.c        | 28 ++--------------------------
>   hw/gpio/omap_gpio.c   |  6 ------
>   hw/misc/omap_clk.c    |  9 +--------
>   include/hw/arm/omap.h | 18 ------------------
>   4 files changed, 3 insertions(+), 58 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

