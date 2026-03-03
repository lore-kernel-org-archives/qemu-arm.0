Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71A38EC1431
	for <qemu-arm@archiver.kernel.org>; Tue,  3 Mar 2026 11:24:33 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vxNrS-000514-A1; Tue, 03 Mar 2026 06:24:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vxNrR-00050o-IO
 for qemu-arm@nongnu.org; Tue, 03 Mar 2026 06:24:21 -0500
Received: from mail-yw1-x1130.google.com ([2607:f8b0:4864:20::1130])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vxNrQ-0005rX-3H
 for qemu-arm@nongnu.org; Tue, 03 Mar 2026 06:24:21 -0500
Received: by mail-yw1-x1130.google.com with SMTP id
 00721157ae682-7982c3b7da9so51870057b3.1
 for <qemu-arm@nongnu.org>; Tue, 03 Mar 2026 03:24:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772537058; cv=none;
 d=google.com; s=arc-20240605;
 b=FiSrSRgAqubfQ54JeFl4ZTxgau0J4BJaMNmiNmljrK1NoyfQ/SJqQoRiCb2mKHmf2r
 CWmX7lSj7MD9mS2owNfhQTp8i0YVz5eSbUH1PbhbQfyW/40WQ1H+ZqhUQsgiPQ2bao4z
 ScwpuEfEaBn6fQU9YTcwEs/5BcWyVg9NB6Ksxuhr34yHFRCipG9vVSaGcla8Wj3+SitZ
 KEM3KpmL3Si3YeUzWhDiAsc4ULByovGMIuOfDXq7nbz/bkV9DDlCH56aI8Xe4E44V0Jm
 peIjRbDqpZyTKFT3wdJqjxGZjOI77sId5MuGxYvEHeOJtA3tDUn60N60wQN5FrEwAE5J
 5vuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=tjeGAeWkW88zo9xVTQEDAZr38G4dxg7jKkDmMC6ghRU=;
 fh=D7Etgk7lgQ9UPllj/DZDMjxdsURdKW87LgaJYgTXfAU=;
 b=GxqVI+gsgO9NRZru9RvUTwx/eSeTITJhVhKUU0RVLjfke0zDpJizzbf8mgw2st+EMA
 A3gRxH0nZMwhc/PTnCndZYbwi2kLFOaA/FABCkCV2KBfhOXWpBAN5z3TieNB4frLqK8J
 WX2w2DYxy11jDzAswEOmF5Nw+zM4aMvGPNHdBAORkCtQ9koP6a52gq+rOcA4avVjzzAc
 prPJWXSEItayJwJXlbFoEn8mnYQBRuKtwkugwer/YnF859gxgqloCbKlkOKFsdLgTicy
 BHpXlGSD4x/qLZrIFpEZoIDN+ltG+Q/6vIcZk15XHVg4L8CstRkJhPCV+8x3uB5uCK2s
 TwZA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1772537058; x=1773141858; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=tjeGAeWkW88zo9xVTQEDAZr38G4dxg7jKkDmMC6ghRU=;
 b=Z0jNUmkHg/x6KwidXIc4TWKSd7XEdIyhcxrnIDgFatAl+A461TCNHekXBPqkpRc/tM
 CcS08CH6xyX2sYgzWK+99ice9n16NawmHWD4aTtTlKw8P0RUQXpqmRCzpTG3kJKYvYTw
 gYnbD/wA1So1O0TELONIWpcJ+Swb8teWf5ALQEDKUrwgi40wb4tF3KGZFxZS2dRhbidf
 YDZPG/C28JXzGBNx9W39cjPoG/MPHQy029oENc5NNG+8IjuSZ612KdmPM0dX0urd7AYb
 JhtdfWtWP0xG3q96tWUj+uTxPpzknuDBDn45oTnz3r4vISNM/kKRMAu+fZOlXqX2hTze
 bnvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772537058; x=1773141858;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tjeGAeWkW88zo9xVTQEDAZr38G4dxg7jKkDmMC6ghRU=;
 b=FfCz4j80WaFPl8RcLYg4K2PRMYpcBw2M5pw84RT7UCt238MHqi/Dp8q0JTVUNIr+nL
 io/k1diTSbm+KVFvBMD0LZO+W7oM/DB0rIUKfWY9G52f/9V5pABSkifNs8vOH3Ohs/ga
 x04sVXJTPbG/W66SSN78qag4IR07YePNuZKtBNO04PMsWDK2NWy9WOmR9MtHjFHTtmNY
 mN4VgfZeJuYph98mlY+aX5s10CTdy43S55ZR0XcCFYOpvJogfToxRfDkJksIyZN4zU9z
 tzrGyqwewQL+A256U3wo8j4JBPocdnqqL3j6qlCZo/Pzb58cHTFJ2ayO92pdCU9vs5dx
 xR6w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVQQZHU9ymjTjOGqqXqOrFEVo9Yq6vmqy1gVv1IzRJ0L801jhHXbt6pHoEvEXt9v+CvWE5AsKPUBw==@nongnu.org
X-Gm-Message-State: AOJu0YyCH3XFDzkB5ddT4t++hRoahMtjTYF0/+3yvoWx929Io7g87dJu
 AX2Lmw3wHYXQr921HNkoS7jf33e36S0T3ME9RrHVb+3B6AS3cSKQ7jzS1qP0xktdVupdbsVRNBR
 wh1yAyPbPhFhVePdZrtdQcZNBSgBxweP0q/J/D+AyAw==
X-Gm-Gg: ATEYQzx32DyuJvzzMCOrfr2ly+UXqqDLVa9mHi8pROz/57HOLnpVD6ofj5uZ5q9q3B3
 b6zgEdrPVcPm6P1QjkaQTQfj+2Xw35YuMwAhF6HFobEiMgY5+CgOkfUZsvkjZr0Tqd2kfDunaou
 NyrcHHSuwp9+JiWCephg8dnyAp8IZhUiRVnhkCec8HYqUKYCwD+XTE3RYVj7B5oQ6Eyukop6MK3
 ezGMQGjVCNXpGBBr8Rw3T5pt59Noed3STtjrN0/fYoGS/GrO14owHFLC05B5sU389HkFjaCbiKp
 z52VZhtNvzzJ6Viv/gh7/su+s1KagwVaS4MZPDtgvF+5wBXTRBovH0bXiCgT+PVhVjU=
X-Received: by 2002:a53:c745:0:b0:64c:ac70:942c with SMTP id
 956f58d0204a3-64cc237d367mr8879449d50.75.1772537057765; Tue, 03 Mar 2026
 03:24:17 -0800 (PST)
MIME-Version: 1.0
References: <20260302220254.1166849-1-shentey@gmail.com>
 <20260302220254.1166849-2-shentey@gmail.com>
In-Reply-To: <20260302220254.1166849-2-shentey@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 3 Mar 2026 11:24:05 +0000
X-Gm-Features: AaiRm53BDZoRJhzcCv01hSKKTHllLdwJkPgjx2jeFdw342r-OIU71Dgfsvy-gVI
Message-ID: <CAFEAcA_OFakQ7akKOSLmkFPv9jOXgjE68iaWt8J11FKMPdTCxA@mail.gmail.com>
Subject: Re: [PATCH 01/12] hw/arm/Kconfig: Fix serial selection for NPCM8XX
To: Bernhard Beschow <shentey@gmail.com>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, 
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, qemu-arm@nongnu.org, 
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Helge Deller <deller@gmx.de>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Richard Henderson <richard.henderson@linaro.org>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Steven Lee <steven_lee@aspeedtech.com>,
 Mark Cave-Ayland <mark.caveayland@nutanix.com>, 
 Jamin Lin <jamin_lin@aspeedtech.com>, Joel Stanley <joel@jms.id.au>,
 Troy Lee <leetroy@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1130;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1130.google.com
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

On Mon, 2 Mar 2026 at 22:03, Bernhard Beschow <shentey@gmail.com> wrote:
>
> CONFIG_SERIAL selects the internal TYPE_SERIAL device which is akin to
> an "IP block" that needs to be integrated with glue logic. In case of
> NPCM8XX this glue logic is TYPE_SERIAL_MM which the code uses already.
> Fix Kconfig to select CONFIG_SERIAL_MM which matches TYPE_SERIAL_MM.
>
> Fixes: ae0c4d1a1290 ("hw/arm: Add NPCM8XX SoC")
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>  hw/arm/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
> index c66c452737..20e99e52b1 100644
> --- a/hw/arm/Kconfig
> +++ b/hw/arm/Kconfig
> @@ -493,7 +493,7 @@ config NPCM8XX
>      select SMBUS
>      select PL310  # cache controller
>      select NPCM7XX
> -    select SERIAL
> +    select SERIAL_MM
>      select SSI
>      select UNIMP

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

