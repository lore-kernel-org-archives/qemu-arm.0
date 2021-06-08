Received: by 2002:a19:4310:0:0:0:0:0 with SMTP id q16csp4305670lfa;
        Tue, 8 Jun 2021 03:58:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxAnXThHF84OFW6KEBc0Ws2woy97eG86DJi+i665EREfqZ+ASRLo/br48JyiAg1C2mYP8Kd
X-Received: by 2002:a05:6638:138e:: with SMTP id w14mr20729909jad.33.1623149911614;
        Tue, 08 Jun 2021 03:58:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623149911; cv=none;
        d=google.com; s=arc-20160816;
        b=EztnBkMZ1mdN1OpeXYCUnAuq5Fyp5QyZoD+c2jIXlOGG6alWqNC2bwpp63xlTlOZcc
         3JitNUS1ACEuD+hSS8zl6W2iUXTJlR3YlmxxXH1sWodevWEdwtI1nDZEq/PyH/L7Xv38
         nYG3QLnLjnO0a+izC3To/c14AhWG1fREMPSfJHyU1SOsgHGouUJbKJ7iCMUUrIXcfg98
         B6hAzQiA+qiZGCd3YJY/bAz9Y38EYhZZF7W5eQbBEYAb5+t0DLbZKjkDlFUbSO/RqvPa
         Cu4HzFJ3QV2eehwEm/7yeozSzFLGWKsHl5zwMuyAhJywK89TFV8MZgv9kafPfTI2KfiV
         Lk3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wFtMIOteWNe1S1235gXpZtYI6u36aCxMswOl0OX0NPQ=;
        b=Ey5o+77fSwNW30Jyj9OHQRu9tR5zdAThqfkGuup0Hnf5Gu+FI/NE+m7lNEtv263TV1
         QYKI2vxGIXX1ZmAllXcmnTsACkWBv6AbmGJIAw26yo6+c0zT1wmB3cjbma44LDnlqcsq
         unvebxCooaaF8Lis/6EV9O33BJzUagAzoxtuZ53R+5X6wqmcMreC9/NKkZy/mF+LAUtI
         GwffkiER5L7Fiom3xulP5xvf0xE0zSxMjiSmrb0VnsdeAyaHD9IZGh3FpL7Je5kTy5N/
         EC3mled1XeAe8stJQEkgYGdZOMxAGKZ7bdET+e+MJhG2urlwxhLL8ff0DZpN3G+uLpU+
         KbZw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=I0w7EkbE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a6si12147465ilv.124.2021.06.08.03.58.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 08 Jun 2021 03:58:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=I0w7EkbE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lqZRG-0004x4-Sv
	for alex.bennee@linaro.org; Tue, 08 Jun 2021 06:58:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lqZR8-0004w3-55
 for qemu-arm@nongnu.org; Tue, 08 Jun 2021 06:58:22 -0400
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c]:35728)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lqZR5-0000he-Se
 for qemu-arm@nongnu.org; Tue, 08 Jun 2021 06:58:21 -0400
Received: by mail-ej1-x62c.google.com with SMTP id h24so31946590ejy.2
 for <qemu-arm@nongnu.org>; Tue, 08 Jun 2021 03:58:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wFtMIOteWNe1S1235gXpZtYI6u36aCxMswOl0OX0NPQ=;
 b=I0w7EkbEVLF0qERjbt85X4yLmzeBrwJB59U59GVkJrmB5DnHd4OV3WvyHIaICtSo9R
 Q31LTHUzxRCGmPla4Zc6Fep59RU8HrMOB1tgGWE2cJLLhKUcyrrP6HGLfxnaocLiDWnB
 7rzMgzh3ijHsEmv9MIVzICd16EJca1rEVBDJJi0k22GRnVxj3JpsJen0zZ827LB5zPOU
 uNmOI2EF0T/cbWp9OtNMiBBNM2YFrPUmSO/mRNBngGIilDp8mjzqiJKfRQQav9T/1zNx
 ZtRUW09Sr93P75afaPQsluMfincqB9zgmk4TMf42jgNo9uIWzPVqLELbmdEK1Wm/jp2a
 qLEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wFtMIOteWNe1S1235gXpZtYI6u36aCxMswOl0OX0NPQ=;
 b=szOx0uR1z/G29TciEJ3wa6CBtmb4l8Fa6t/U/eSmXaCseBXZbx5HqkqucUL87n1xTC
 RfFqdi1OBN53mTDzgZAHwmIKVNoDUxry91wQcRME6W8P8ICj9j/Xnexa3cgWs1jCi2AB
 rx6aWQx5U286rJtmfvFNrmFvhrSc4ILnVX2BeWj8APbmuBU38HSA64R4vPM8Ahsof2yV
 cyUsmNlWMfIkMSBRVJx8QHyQ1bXOjF4McEpWzNPr1703vOMRThCbKSneQo8SVK/TnGko
 t2lFkSrXMzoioc8GFxZerAWk1owROmz9QFhdEKqOds2ZhOFGgGmZanqRUgctrxBknawe
 oShw==
X-Gm-Message-State: AOAM5314y07enRCFqLKYfIMJTIfFQ9rChenD3Z0c2TQZTO+Ygn9OciYx
 ZMEDRPx+SH3Ikfux9KI2HwWBQz1ily4v4UjLwQr0uQ==
X-Received: by 2002:a17:906:a108:: with SMTP id
 t8mr3259235ejy.407.1623149897868; 
 Tue, 08 Jun 2021 03:58:17 -0700 (PDT)
MIME-Version: 1.0
References: <20210602180042.111347-1-shashi.mallela@linaro.org>
 <20210602180042.111347-6-shashi.mallela@linaro.org>
In-Reply-To: <20210602180042.111347-6-shashi.mallela@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 8 Jun 2021 11:57:44 +0100
Message-ID: <CAFEAcA-W86FSM3kKORDcpuMto6jm6bNnSajY9g5F7AiLE0QYJg@mail.gmail.com>
Subject: Re: [PATCH v4 5/8] hw/intc: GICv3 ITS Feature enablement
To: Shashi Mallela <shashi.mallela@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Leif Lindholm <leif@nuviainc.com>, QEMU Developers <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, Radoslaw Biernacki <rad@semihalf.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: uB5fSqiPrgIK

On Wed, 2 Jun 2021 at 19:00, Shashi Mallela <shashi.mallela@linaro.org> wrote:
>
> Added properties to enable ITS feature and define qemu system
> address space memory in gicv3 common,setup distributor and
> redistributor registers to indicate LPI support.
>
> Signed-off-by: Shashi Mallela <shashi.mallela@linaro.org>
> ---
>  hw/intc/arm_gicv3_common.c         | 12 ++++++++++++
>  hw/intc/arm_gicv3_dist.c           |  7 +++++--
>  hw/intc/arm_gicv3_its.c            |  9 ++++++++-
>  hw/intc/arm_gicv3_redist.c         | 14 +++++++++++---
>  hw/intc/gicv3_internal.h           | 17 +++++++++++++++++
>  include/hw/intc/arm_gicv3_common.h |  1 +
>  6 files changed, 54 insertions(+), 6 deletions(-)


> @@ -386,7 +388,8 @@ static MemTxResult gicd_readl(GICv3State *s, hwaddr offset,
>          bool sec_extn = !(s->gicd_ctlr & GICD_CTLR_DS);
>
>          *data = (1 << 25) | (1 << 24) | (sec_extn << 10) |
> -            (0xf << 19) | itlinesnumber;
> +            (s->lpi_enable << GICD_TYPER_LPIS_OFFSET) |
> +            (GICD_TYPER_IDBITS << GICD_TYPER_IDBITS_OFFSET) | itlinesnumber;
>          return MEMTX_OK;
>      }
>      case GICD_IIDR:

This change is doing two things at once:
(1) setting the LPI enable bit
(2) changing from (0xf << 19) to something using symbolic constants.

If you want to do (2) as a cleanup I don't object, but please put
it in its own patch as it is unrelated to this one.

> diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
> index 82bb5b84ef..0a978cf55b 100644
> --- a/hw/intc/arm_gicv3_its.c
> +++ b/hw/intc/arm_gicv3_its.c
> @@ -294,6 +294,7 @@ static MemTxResult process_mapti(GICv3ITSState *s, uint64_t value,
>      uint64_t itel = 0;
>      uint32_t iteh = 0;
>      uint32_t int_spurious = INTID_SPURIOUS;
> +    uint64_t idbits;
>
>      devid = (value >> DEVID_SHIFT) & DEVID_MASK;
>      offset += NUM_BYTES_IN_DW;
> @@ -330,7 +331,13 @@ static MemTxResult process_mapti(GICv3ITSState *s, uint64_t value,
>      max_eventid = (1UL << (((dte >> 1U) & SIZE_MASK) + 1));
>
>      if (!ignore_pInt) {
> -        max_Intid = (1UL << (FIELD_EX64(s->typer, GITS_TYPER, IDBITS) + 1));
> +        idbits = MIN(FIELD_EX64(s->gicv3->cpu->gicr_propbaser, GICR_PROPBASER,
> +                                IDBITS), GICD_TYPER_IDBITS);
> +
> +        if (idbits < GICR_PROPBASER_IDBITS_THRESHOLD) {
> +            return res;
> +        }
> +        max_Intid = (1ULL << (idbits + 1));
>      }
>

This change should be folded into the patch where you add
this process_mapti() code, so it is correct from the start.

>      if ((devid > s->dt.max_devids) || (icid > s->ct.max_collids) ||
> diff --git a/hw/intc/arm_gicv3_redist.c b/hw/intc/arm_gicv3_redist.c
> index 8645220d61..fb9a4ee3cc 100644
> --- a/hw/intc/arm_gicv3_redist.c
> +++ b/hw/intc/arm_gicv3_redist.c
> @@ -244,14 +244,21 @@ static MemTxResult gicr_readl(GICv3CPUState *cs, hwaddr offset,
>  static MemTxResult gicr_writel(GICv3CPUState *cs, hwaddr offset,
>                                 uint64_t value, MemTxAttrs attrs)
>  {
> +

Stray new blank line.

>      switch (offset) {
>      case GICR_CTLR:
>          /* For our implementation, GICR_TYPER.DPGS is 0 and so all
>           * the DPG bits are RAZ/WI. We don't do anything asynchronously,
> -         * so UWP and RWP are RAZ/WI. And GICR_TYPER.LPIS is 0 (we don't
> -         * implement LPIs) so Enable_LPIs is RES0. So there are no writable
> -         * bits for us.
> +         * so UWP and RWP are RAZ/WI. GICR_TYPER.LPIS is 1 (we
> +         * implement LPIs) so Enable_LPIs is programmable.
>           */
> +        if (cs->gicr_typer & GICR_TYPER_PLPIS) {
> +            if (value & GICR_CTLR_ENABLE_LPIS) {
> +                cs->gicr_ctlr |= GICR_CTLR_ENABLE_LPIS;
> +            } else {
> +                cs->gicr_ctlr &= ~GICR_CTLR_ENABLE_LPIS;
> +            }
> +        }
>          return MEMTX_OK;
>      case GICR_STATUSR:
>          /* RAZ/WI for our implementation */
> @@ -395,6 +402,7 @@ static MemTxResult gicr_readll(GICv3CPUState *cs, hwaddr offset,
>  static MemTxResult gicr_writell(GICv3CPUState *cs, hwaddr offset,
>                                  uint64_t value, MemTxAttrs attrs)
>  {
> +
>      switch (offset) {
>      case GICR_PROPBASER:
>          cs->gicr_propbaser = value;

Another stray new blank line.

thanks
-- PMM
