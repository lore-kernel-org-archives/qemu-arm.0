Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA11DC88E5C
	for <qemu-arm@archiver.kernel.org>; Wed, 16 Sep 2026 10:53:22 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x6nG8-0004cl-Rs; Wed, 16 Sep 2026 06:53:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1x6nFP-00044A-Bv
 for qemu-arm@nongnu.org; Wed, 16 Sep 2026 06:52:22 -0400
Received: from mail-yx2-x11.google.com ([2607:f8b0:4864:41::11])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1x6nFM-0003oD-5n
 for qemu-arm@nongnu.org; Wed, 16 Sep 2026 06:52:14 -0400
Received: by mail-yx2-x11.google.com with SMTP id
 956f58d0204a3-66e4ab19127so747118d50.1
 for <qemu-arm@nongnu.org>; Wed, 16 Sep 2026 03:52:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789555929; cv=none;
 d=google.com; s=arc-20260327;
 b=TwPUsAk7BJ2C4+BuCoR41RX/5P5jSjeazFDJpLuL4RRB2G7YSXZsnqNdKjJIbmnCKV
 zvW6Ho1TaJUONVkmFx0EwOJe5L5IrBvwpfZ7IinU7ovwuynK+6AMadoo5nrjSmSV+fM5
 fT24yYepe2i+yZpFXAP1ykgnVQ5q2mROyaD/rzEDqI70aPHfx3In1WCRWEJ/h70E2w81
 5A39tNJw8GMO6uMWrof1PPR3uG/K6qvKP8pc8iYZbeu1WMuW9eae6MEXnJL3Ztlp2L0F
 SUvu9r7YRn6WgrjqTcoUHNz1rcXtqrYMlAL4piyYSv9HBIcXSc0JG4v9AjR2mN3geQNp
 oYhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=Ac5cJOlzb0yNjC/xOK/XtHtFbJ8zu2izgxBr5Yw3TZI=;
 fh=WpsZqvzwwpA+br5IKYkHFQjwlimBUiVk05kqQkIIiQA=;
 b=Bknben0NbKC8IT3GyxtVyW3eXJU/cLp+dPgfruEPZtNDtv3639GMIp85RdO+9V5x+R
 A92AEYNSmJjEYIdMTSmShyYJ4V3/8aB5OKJKclrVGGbMR/RYHvedOahK1oz7rNST7Nq/
 YKPH00j63fPJLMH61a6mYVrwm127AGDJ1QOy25LXF0pXnYcNSsQ/63xLq8gIvdqf0ZCQ
 4xbdPQZZ68oOgm3p8sLeJE1R77p1cFEwt8FGkI+HMlZhTbJBUYjc5umQew06i/6ji8ma
 hEePXBNryFhzsd1jQtTLnuFw/A+D0FmkWEcm2lE93hGHolIPe6sv9PDA4aVIbxB0GxmB
 nmqQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1789555929; x=1790160729; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=Ac5cJOlzb0yNjC/xOK/XtHtFbJ8zu2izgxBr5Yw3TZI=;
 b=xXSf2/l2jkGUEicNG257A7r1BiZDshlHlo7dXTuXqZf1rkfmFziUD0u3nJzuu2yOx5
 Ux7iOi7EyLshDUYenq3FzpmL3wJmIgGfQSdEzoNL6U49E0S9xWHYG10amBCS6xhcy8o8
 Y/OWRFkNqby2pHzRHr4YheFd/nMdGe4w/iHZNeM805Z5Mdr+C7revBWVvRqgjWyDfPje
 9c0LrMvusjC1kKkS8tupr2Nj/219hlm17c4wqu4/wjrseATfBUmdEDUpbXD6fwu5AZKe
 hVR1IYiQh1YiqOSlVgSjkEGPJqBHLvoXR+8Xqs5qrosFHGZhrrn6TEjaos/rI7KDNeIw
 sjQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789555929; x=1790160729;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=Ac5cJOlzb0yNjC/xOK/XtHtFbJ8zu2izgxBr5Yw3TZI=;
 b=PPzK6NJc3c+CgJd81Ay+d0XlcAxwfpjgMIuEuBcaVzjSO+GCYEf9diWqDdP/mhdc/v
 Y8OI0r0G574FFVNgmJVo5TaRDoFEpo27m+UP7wv4UB6Xv6owWQQrn2AOgCLxgjyCgxsh
 vVijNeHvhX0SdJsGH0nMJQUEQ9WmaOv99/yo9/zvTomw0DasMXB01xNlclm8MmAygrpc
 7jEWl9l7FxepUxr+HYH7x8+QG8sQ3PGoKwnyA0plmx6CfPE1radZC1Vuk+1XeNQaGUXX
 8dr5Bu/AazbTMMMp+mTVxU/jw+qRMO2AOtmvaiD6EWA0qO7VGp9S/fV/K94tcBD9pfBe
 h55g==
X-Forwarded-Encrypted: i=1;
 AKwUvBzq2XDMsBBptJOJ/3FliQ99vr3cFfbP3IfN5ScwhqqyUKts3IbY72F6aZ07PYnWOTJ1x3JyA6XihA==@nongnu.org
X-Gm-Message-State: AFuF++mHlOvMMWE40Ps1DRnGa/unmwEIGSNDnSfFzC+LPX47Oh8VLEUi
 Rdbz/PlZ7Tk1MjD31pkxvCBbv6PMHvdITVfKpt0zryZxdMhPYvIlT2K2bKlwTghj5/Jl1vg4Ufk
 TtShJ0AP+m7DiVMP5/yfOV96+g9k+cWAY4DNZzfQwhw==
X-Gm-Gg: AYBFou01efXWs5h07IspxRfO4WS22ujJ+suk4qLfcaozFUv78QIpBjy4l5+j/qeCvL9
 FstGcLSbf+9JWFNdmRB1c+xi1YZY/k0YENiSWHVXbfOUhIKN4+CeOmtc79rfxtPu0oQivfH+ic4
 wJ0GmxShRom55DT2tu9v9UpYFyiiPbWD6F77zOP7P5IwCASgaMLXPTp8PpQNGjc0v6n+8yIwxI5
 WStB/w9b98jykpRmFYu3Bi4/Bmbms+A17AqGO0y6gShEvLRERaXbOrwIsiK6RNEwgw22e/6L0/G
 naxwSixiP7oEifqfNC8VCY7t3u/Tl2o2q7kiMzMV4g9Xp2vrWqKJlqh4vewTd9QGdsfdoEjAwvh
 0loOmcFwyQG//4vGfZza7k4eL6T99L/BzAl1xNJTJ
X-Received: by 2002:a05:690e:c4e:b0:66e:56e1:fcc0 with SMTP id
 956f58d0204a3-67163220807mr1118080d50.24.1789555929574; Wed, 16 Sep 2026
 03:52:09 -0700 (PDT)
MIME-Version: 1.0
References: <20260916100021.73825-1-mohamed@unpredictable.fr>
 <20260916100021.73825-10-mohamed@unpredictable.fr>
In-Reply-To: <20260916100021.73825-10-mohamed@unpredictable.fr>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 16 Sep 2026 11:51:58 +0100
X-Gm-Features: AcwNN1VM0oRyQF72K-rzuDp-rYS2wbAzNfeY8Ke6RRoEp4khHQXe6WQGR0qOVoY
Message-ID: <CAFEAcA9eKwvOr+jQ2NLSx1mnp4aZ9pbv3RKs74La17juHK_=LQ@mail.gmail.com>
Subject: Re: [RFC PATCH v8 09/10] vmapple, gicv2m: add macOS compat quirk
To: Mohamed Mediouni <mohamed@unpredictable.fr>
Cc: qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>, 
 Roman Bolshakov <rbolshakov@ddn.com>, Peter Xu <peterx@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 qemu-arm@nongnu.org, Phil Dennis-Jordan <phil@philjordan.eu>, 
 Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>, Alexander Graf <agraf@csgraf.de>,
 Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:41::11;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx2-x11.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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

On Wed, 16 Sept 2026 at 11:00, Mohamed Mediouni
<mohamed@unpredictable.fr> wrote:
>
> macOS expects bit 31 of MSI_TYPER to be set.
>
> Signed-off-by: Mohamed Mediouni <mohamed@unpredictable.fr>
> ---

This is a macos bug -- the Arm Base System Architecture
spec which defines what the GICv2M registers are is clear
that MSI_TYPER bits [31:26] are RES0. I'm not keen on working
around guest bugs here, especially of the "random proprietary
guest has mysterious undocumented requirement" kind: insisting
on bit 31 being set would presumably break on a real hardware
GICv2M as well.

If there's some documented "Apple GICv2m" variant of this
hardware, then we could potentially model it, but I'd
rather do that as a "here's the spec we're modelling,
implement it" than a one-off point hack.

-- PMM

