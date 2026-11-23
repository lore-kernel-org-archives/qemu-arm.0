Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 156B3606A31A
	for <qemu-arm@archiver.kernel.org>; Mon, 23 Nov 2026 11:56:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ul04TW2+
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xVSeg-0008V1-Ks; Mon, 23 Nov 2026 06:56:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xVSeW-0008UR-6y
 for qemu-arm@nongnu.org; Mon, 23 Nov 2026 06:56:08 -0500
Received: from mail-yx1-xb12a.google.com ([2607:f8b0:4864:20::b12a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xVSeU-0007SO-Hi
 for qemu-arm@nongnu.org; Mon, 23 Nov 2026 06:56:07 -0500
Received: by mail-yx1-xb12a.google.com with SMTP id
 956f58d0204a3-67db6d4054eso3471321d50.1
 for <qemu-arm@nongnu.org>; Mon, 23 Nov 2026 03:56:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795434965; cv=none;
 d=google.com; s=arc-20260327;
 b=dr+QTk2rL8BXMXl1lzzW2bUkcBfUmxGk9Q7b2Hd7TtlUjePbCBznjJv0s6PAZsptT3
 txm7ZanO9bwwGuR0tdjT9tpyxTkXsSayvnrHMn+H8ddAsvlfPDcEI63ptb0WUoJQ5Tvh
 DEWq81++62bKkPYbiW6dA7MyS//mPQUMRSfZ3DYd4pdlMKkzsr1Gyz074DrQiSsUiB5p
 sYsnJ2zt+3+Xg03ajQ/m5WSns5Pvdylkfnxida1csqo+YXIl0Rnf1BLecV8+cTerRhbf
 Njo95goWseSVcIfBjA1Ud1leVafVRAmG0n3ZdDoPbxBPdbTKxBJspDt/DLsCY+XWjEC4
 BxJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=6zfdO2OzUreW8lGzz4kPeHrkisuJNtMzB/9BzM9B9mM=;
 fh=y/ja5UMDl8OhCKt0AhFnt+a2JueinlVx8/LWeqYKWi8=;
 b=Hn75S9UbrJJoxOjzjmrV/BbNJrC7eUU44AfeH/7YzUe+5N7ipfwqkN6oMTpeJCfLeD
 cVOlW2LPLPw3x6dEVw2lyqDitYj6vQqYeVLTRYyEuRTrLDtSH4FOpp1UbT9mIQUkQGfD
 eSTPSdi7tQ19DbcAqtOkURvJbhENjkpreLuNXsVncoAfa881fFUAxlQdY5kVGRq0rBbu
 jeJTISX3Zzu0bPbw53ooUlcz+9A78cux012w/1ZPZbx/IcrlNvmZdZUp9qpYWBfKhlGO
 ezhouANMkfbpYS1PouBPkzK3pbGEZhXLkB6aZTyyikoXvXU52istZq1+kUBjtOnL29Eu
 8psQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1795434965; x=1796039765; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=6zfdO2OzUreW8lGzz4kPeHrkisuJNtMzB/9BzM9B9mM=;
 b=ul04TW2+fp/E8DUvvfk/uw/93u8LehVY/c5UjJtPHgDuj7MiK9FcWRHsjpL605hnLZ
 aR6Xn8GiauPi+JPSfW+ibb6UUWo01pDcqDsnmLGN31D/blCEjIzSlVFYsuqnBsQ7ZLNC
 +WoI6G3Fdd6fXcW287RKDtBflEaPXN2We7WAobq5JMtR+jk8BVcYfBZ+/Anr1uEyS3bf
 2rLSBMSAkilueElfmbpcS92eT+RPvtNfTHQ75zqEZQfX3bbcNm+CK3EGhgU5WLXf6nn2
 MaEHlMAJQXXpnI9rLyJOovEyUerZr5hOOULOq5Myy1o0F/4U9653siAwLSqz9wrubtcG
 68xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795434965; x=1796039765;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=6zfdO2OzUreW8lGzz4kPeHrkisuJNtMzB/9BzM9B9mM=;
 b=bB9D6N6wuiC8XRcSKRYwCka+eVv40NsTzN6KgL54Y5DVzD+4jf4FzuYQqMY/sh2kxL
 YNpPctNOP8WtAoTqpFfPYBqV+mveXppf+eRue+mURYHkUyrr9yVzUTLs5J3RkqQ2ISSb
 SkzJhPnA42+muRBBYaDUGZyEqsptJKQy0j4dvyaNVZVRZfxRIK3SeHxejsipOI++e+rP
 DtK8cUa8GUShD+7+KYO0s4wjNaFj9FUmYha1qKmAArNTnFqDISappTXFOea2Cht6lppH
 K/xiWfHLc05iCi77TC012GvumEPEn970UCtprMZFIkutnbChwj+w4aIHwi1UDvU838Xw
 QluA==
X-Forwarded-Encrypted: i=1;
 AL+hErEsP27jzF3JOAHoKLEhWqo5jFGjr2uISg4YzxJAKxt8DuYUDetyNIYx85D7lPPx2XY5uqsY/0hq4Q==@nongnu.org
X-Gm-Message-State: APuU4Z8nSkzWpGliXtia3bbxSeIFdOOIRsSJh9ivjOCixQo6vM8XD/IM
 v2Oyhqgo9BDG5Lki4y1r6PUKec9fNto2VC4EevOPcVlJIpFsCl1QIWHKdzzqijWWV+6nM8kjlgQ
 /kGYK8JgsRmF4LBM2eOtnlQ3HBnOieFCg6EZzZVzLUdeNyRmYgarc
X-Gm-Gg: AZFdTZeOD+pkoeW1+lKF/hVup/HzV/kj7SoiOFoK+PLHfRlIpNINkAuIhSgMUL8EYlJ
 zae/6YJwTO+t2rTU1zhQb9QFJyAWGnMdopOH6jxrP0CgYIM/nC2vFAf3/QEBqvw1rdj0Qtrsx43
 WoTjeeGsZ9rCbbu2o/NtuZe2Z7kwEwfS5zNTkjD8YariQNxONR9KSlTbm50+fLOurlZy7o/Bcvf
 i44AOAI4QuNKvO4IP1NECwmX6y2pkODUeaMg+vFQC3+E94ue3Sct7d0smETB6SPHMO/VZLXJiew
 5J4gUxR7pWUClwXUL2ap9HmD4ivgG+YmLFansg20ISSKtLTgKXBFcttYM1MvVQ0VCZYgt0UtlT6
 QreZPHkOX1z5XteGvLrSDUUBR2tk5ErshRIZWAvUQWPkV2NWmD/QwmNyoBGva6yLmrGqJp8IprD
 ABCKpULG/uNao1HhCplIYh
X-Received: by 2002:a05:690e:a45:b0:67d:e867:89a0 with SMTP id
 956f58d0204a3-67df43ce3b5mr4534725d50.30.1795434964881; Mon, 23 Nov 2026
 03:56:04 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261117193205.8236-1-agarwaljayesh03@gmail.com>
In-Reply-To: <20261117193205.8236-1-agarwaljayesh03@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 23 Nov 2026 11:55:53 +0000
X-Gm-Features: Aa3M54qcfvLnmuQmOVFjmTs3WfpvouOrJyliMPqg8vjFnUH7_Br0-aVmcX4MCzU
Message-ID: <CAFEAcA_4+PcP8f2DF+mtjkO5iO6eU6C6R6hjfBN7dg0o_TGPiw@mail.gmail.com>
Subject: Re: [PATCH] hw/arm/bcm2838: Route system timer interrupts to GIC
To: Jayesh Agarwal <agarwaljayesh03@gmail.com>
Cc: qemu-devel@nongnu.org, philmd@oss.qualcomm.com, qemu-arm@nongnu.org, 
 s23adhik@csclub.uwaterloo.ca
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12a;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12a.google.com
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
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, 17 Nov 2026 at 19:32, Jayesh Agarwal <agarwaljayesh03@gmail.com> wrote:
>
> The system timer interrupts are only routed to the legacy interrupt
> controller and not to the GIC, so a guest using the GIC (software that
> relies on the system timer interrupts through the GIC, such as bare
> metal programs or hobby kernels) never receives them.
>
> A qemu_irq connection follows one output, one input. So also wiring the
> timer to the GIC would replace its connection to the legacy controller.
>
> Add a splitter per system-timer interrupt line so that each interrupt
> reaches both the legacy controller (output 0 of the splitters) and the
> GIC (output 1 of the splitters). The timer channel n goes to GIC SPI
> 64+n, so channels 0-3 go to SPIs 64-67.
>
> Testing:
> The raspi4b machine started in the qtest mode:
>         qemu-system-aarch64 -M raspi4b -display none -accel qtest -qtest stdio
>
> Ran following commands:
>         irq_intercept_in /machine/soc/peripherals
>         readl 0xfe003004
>         writel 0xfe00300c 1000
>         writel 0xfe003010 2000
>         writel 0xfe003014 3000
>         writel 0xfe003018 4000
>         clock_step 5000000
>         readl 0xfe003000
>
> Before the fix:
>     clock_step 5000000
>     OK 5000000
>     readl 0xfe003000
>     OK 0x000000000000000f
> The alarm fires correctly (status flag outputs 0xf), but no IRQ raise
> 64-67 reaches the GIC.
>
> After the fix:
>     clock_step 5000000
>     IRQ raise 64
>     IRQ raise 65
>     IRQ raise 66
>     IRQ raise 67
>     OK 5000000
>     readl 0xfe003000
>     OK 0x000000000000000f
> The alarm fires, and all the four channels reached GIC lines 64-67.
>
> Reported-by: Sourojeet Adhikari <s23adhik@csclub.uwaterloo.ca>
> Suggested-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Jayesh Agarwal <agarwaljayesh03@gmail.com>
> ---
> This was picked up from Sourojeet's earlier patch, here is the link:
> https://lore.kernel.org/qemu-devel/3cca4eb3-09d1-4467-81fd-27a5bfe19a3e@csclub.uwaterloo.ca/

Thanks; applied to target-arm.next.

-- PMM

