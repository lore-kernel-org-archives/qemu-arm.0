Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4AB9CDE000
	for <qemu-arm@archiver.kernel.org>; Thu, 25 Jun 2026 16:06:18 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wcmak-00021u-92; Thu, 25 Jun 2026 12:06:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wcmaf-00020Q-K2
 for qemu-arm@nongnu.org; Thu, 25 Jun 2026 12:06:09 -0400
Received: from mail-yx1-xb12e.google.com ([2607:f8b0:4864:20::b12e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wcmae-0007da-7g
 for qemu-arm@nongnu.org; Thu, 25 Jun 2026 12:06:09 -0400
Received: by mail-yx1-xb12e.google.com with SMTP id
 956f58d0204a3-66493875766so66601d50.0
 for <qemu-arm@nongnu.org>; Thu, 25 Jun 2026 09:06:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782403565; cv=none;
 d=google.com; s=arc-20260327;
 b=fWsmJH6Rq6x8gpNWhL6VO7Jlmn5Qz1z3fJ1qKzwzU34nqxxATKYequvLpQ/0mUB0FA
 be33BGF1Lmjfld5/Xr6jRXBjGh2SGm0Nzb+qTDiyL+pER7hjROPqgZd2qS0xocVUr4TC
 eeze69DXIylUPdmzAuEj9SRGCqN1hK8js40JCHKtYBDK1gs3FCUdlKCc/BaqcMM3985Q
 fODGU+L9CRCyc6AvC4fho884u80xX9dpOgwgo67IzuWJhkPrFNX1JSbeXTYrFvmDcOJd
 rqs9Ubx66iD/bAmUFqAjlmreETXUIEnnemL3MVDDqaXaMiNm1KqSSyIWS3gcyBwxoqu6
 5dHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=QeHjQaUesxtoFEA3EFIYiZ4f+OcFtUO1/5RgAXYKaI8=;
 fh=iGFyNee/wACoH3JhjV5422UlNL1aHsJnrbTyKX3DT0g=;
 b=ATt8wLlzcWTC7lTMRZXyFB82qGKBiNRVeKRxJwy4rq+CKlJRQ8WXzXHY0DgfFTtUws
 5zkQCBRDpR/sEyzyfV0xxJN12Q+KXq5kaOmEXcbS6RQeflLDKf9NhU3fh1Lep2zjm+RL
 BnakAForTPKFsPZnPdDL/eLCKS6Nfx45kt3NZ33jfUG6QyyuMqr6tz/QaSdgh8PWd0bX
 czklHqXcNu+cJ0ecebE+PshB0RlZ0JJs6ry3jKR8SWwgPhf2hrxLBwVWLCFLS0pdQ7sP
 yDsDBqyGtykWuPMCvpTtDIU4q2YPVynke1yodTqjlx0sw6gDSsiCpEbTyZ+izytyb3+T
 yt+g==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1782403565; x=1783008365; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=QeHjQaUesxtoFEA3EFIYiZ4f+OcFtUO1/5RgAXYKaI8=;
 b=GJtTqGglfSs5DjmdGZGLkWT8n4rZUc9cJ8ucAHHpRrhvG6Mbz1fCE51V6UpQ/eAgpC
 ct7wKYE4nwW9lR3wSBr2MS6uVsA9zr9ZSZCaqKHJLEWZdrOPt82jr7jnFdSIvGCYKKcp
 uOT1N1fIAvo2o0RUQpknVWP72CAix2mJv2ypJsELQTfSHop5XkQIx9AKc2eiCyI1aAMM
 1Xu3Zf8k5Q3G5wseO1Xj6ebd3MXvTSbYHVCGAQQLUDZjkUVo3qdEzphWiL/JYxiSHRt6
 WRzbInVOQcvVoSuK4rDH17XLl+rwwXYpXnk8UKUiW/LlAcKUGIc0bi8+fKtpl7bf8840
 MzYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782403565; x=1783008365;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QeHjQaUesxtoFEA3EFIYiZ4f+OcFtUO1/5RgAXYKaI8=;
 b=QF7WNphubTkjNAu0y30Pbi/RPjjh6EPdc4FME8naiZNZQNLkYg0u65FJ3cjmPaLrDu
 TbxF/jDj7vZxVOt1i49P50vRWqx4XRiyN0NDqCBikeA955rZa+/pVsYQoxG+g6DKIWxi
 WqGMJcCZqHYTvafgwtcjIwCtX72eZtlPRvDHyj4I94cOP7zNR0/1CyhxlSHaViXkjohx
 4nkHj1fXtRF8E49p/PDJZlnmLOmxfuRDlaeeMZ9/kbyvYADaCQV+gyWIQTR/IVnhPUE2
 npsR3Mh6CknXQWIULGHJGRZNGpYsTp4qOWOa9jSG3jVdnMYVeTi7UP1ZlB3kJEFybO5k
 Ar7Q==
X-Forwarded-Encrypted: i=1;
 AHgh+RrjTh72xExh68J/i+ksZPLXcIBIwIutnXZTSWY4JqVeLBD1zO+QXaYd3Q4AfHTOQI0azFdcgPjOwQ==@nongnu.org
X-Gm-Message-State: AOJu0Yx7coUUV6Relcq8GqfksT8DenPdao3F160DiSAdA7Nxh/zym5IP
 j/7f3rLeSYgAsT0AN2h+n3eMdu1XB+xUuBwfDwTOUV8rhHv0I8jDkO6zzWafdyFy7cnGhGPQw36
 oKPKC5WnF8DUztdLs8mPNeYSu8PlvYvmy11jJ8yIhy2RmLSagBx4g3JSKRkw/
X-Gm-Gg: AfdE7cke5V3Z1/G0auT04LYlZNoIJWFWgS59QSRgtPD8NO51NnsmZrAre746au2cioQ
 /Qt8pRMMLJpRtBh6E2YBCgBnv2K6IrZZcnc/m8Qj/DSkjDwu4y//cKwUyIPU1ILU1dMstnZqDHD
 3IeBk8Pg2l6rBGWK4WCK1Gld2IYfqrJ2zr5ZFHJM6hY3FsYsUtjbjzSsfJVE7rOvkYdkvQM/vGe
 dL/4KEb9qOjBpt59Qf35do3n6fq4H9VqNTOGEMZXUL1dSl8J0xktTMU+zCMwl4xOrVE+r4hWUEO
 /PrNM4xoBizJqU6cwPFe+wGoEXhbN1xeJGxlhhay26RbSH885WIE4Qdq
X-Received: by 2002:a05:690e:a4f:b0:663:1eda:55fd with SMTP id
 956f58d0204a3-6648814d08dmr2379257d50.22.1782403564667; Thu, 25 Jun 2026
 09:06:04 -0700 (PDT)
MIME-Version: 1.0
References: <20260625160144.94565-1-163wangjack@gmail.com>
 <20260625160144.94565-4-163wangjack@gmail.com>
In-Reply-To: <20260625160144.94565-4-163wangjack@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 25 Jun 2026 17:05:52 +0100
X-Gm-Features: AVVi8CduGVMrab7GZhwmcenA_Shg-LM-ebFezrTCoJon3JeZz5X8cS4boiut6nc
Message-ID: <CAFEAcA_TRnKpjNXuXTDOOSjpqOv43Hzfd8_MaAp8P36O14C5nw@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] hw/misc/imx31_ccm: Replace DPRINTF with trace
 events
To: jack wang <163wangjack@gmail.com>
Cc: qemu-devel@nongnu.org, Jean-Christophe Dubois <jcd@tribudubois.net>, 
 "open list:i.MX25 PDK" <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12e;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12e.google.com
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

On Thu, 25 Jun 2026 at 17:02, jack wang <163wangjack@gmail.com> wrote:
>
> Signed-off-by: jack wang <163wangjack@gmail.com>
> ---
>  hw/misc/imx25_ccm.c  |  2 +-
>  hw/misc/imx31_ccm.c  | 33 ++++++++++-----------------------
>  hw/misc/trace-events | 10 ++++++++++
>  3 files changed, 21 insertions(+), 24 deletions(-)
>
> diff --git a/hw/misc/imx25_ccm.c b/hw/misc/imx25_ccm.c
> index d051e8a2d1..4ca4cb6672 100644
> --- a/hw/misc/imx25_ccm.c
> +++ b/hw/misc/imx25_ccm.c
> @@ -102,7 +102,7 @@ static uint32_t imx25_ccm_get_mpll_clk(IMXCCMState *dev)
>      uint32_t freq;
>      IMX25CCMState *s = IMX25_CCM(dev);
>
> -    if (EXTRACT(s->reg[IMX25_CCM_CCTL_REG], MPLL_BYPASS)) {
> +    if (EXTRACT(s->reg[IMX25_CCM_CCTL_REG], MPLL_BYPASS))

This has lost the opening { -- does this even compile ?

>          freq = CKIH_FREQ;
>      } else {
>          freq = imx_ccm_calc_pll(s->reg[IMX25_CCM_MPCTL_REG], CKIH_FREQ);

-- PMM

