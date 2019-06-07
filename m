Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp177977wrg;
        Fri, 7 Jun 2019 06:10:56 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyRh73wsSbCGkuo2UOYAbtURWLEBZegInQOguAZ9cMQ/6G+vhsIQtSiZ8DsUn+uaf7btgq0
X-Received: by 2002:a0c:888a:: with SMTP id 10mr19843887qvn.0.1559913056156;
        Fri, 07 Jun 2019 06:10:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1559913056; cv=none;
        d=google.com; s=arc-20160816;
        b=IhEwMPKPVPkubF/uYMhH5YTJNLm5lQsxJTLt+Uv61pbKIdr2VVFa9onU1IpA1M9CvR
         B6Vmf0VFr4n27mdLVVr8F+z0sFwgq11qtmUkBw0Y+I+nUt8ZjntHQNUgTzSqv3QlnJHr
         +eHxoY6bJLMWM0UEVOzdc396RyH1P6afd+nh6mRKrDZgUcdim3SVa487zQ4+BkWg1NDK
         prh11egFXnyF6PpfxEipT7LD1knQebLm/IuPvTj7HrFy23ayKaHmrCLGteiivwDxi63d
         k2uFBGOoVGl8peZaJpvUd8FyUGo0X4LDomWXuQd2/qNIX1wsBKbzHZyWLZGPhvpmJZ6+
         WizQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2qhxN0j+xO3lc84ZYBjXCiQz9G1pupLf4Ynwz1mbak4=;
        b=FHhImrybEdazb5ctfJhbiO7qtn/08MmAO7beEqYvrxnkPtThVBEBDEOm//JGcCGMRs
         P4lWhhPltyo7BDvMGgWVgLK/Zd5Xzcz//XRsgb4RRRMWiDNWQrxzxiHj7wOAiiODGnq6
         XscUy8RIoh7uMdfjmziw3bNCxFGfjEt6bfGCHvqDgOCSIdSJVTUQEJgUMRgoFf9O+U4h
         mZKfp1QYLA/YziAh0UpKSxoAoDfAucMo8SugPQOWZS2YZHwz+4uxOA4fd1uyWxlr9/ta
         vElBxJGoNf7H/thhMrinSgmRGUT0LXhGFb5b1K6Y9NcfpVgcX1SbH5D2Xi/FosNAcerN
         vvCA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="UnJWy/4e";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.47 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.47])
        by mx.google.com with ESMTPS id k185si50389qkb.53.2019.06.07.06.10.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 07 Jun 2019 06:10:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.47 as permitted sender) client-ip=209.51.188.47;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="UnJWy/4e";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.47 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50962 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hZEdz-0004BJ-OS
	for alex.bennee@linaro.org; Fri, 07 Jun 2019 09:10:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59807)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1hZEbl-0001sy-TX
 for qemu-arm@nongnu.org; Fri, 07 Jun 2019 09:08:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1hZEbj-0005rh-VB
 for qemu-arm@nongnu.org; Fri, 07 Jun 2019 09:08:37 -0400
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:40935)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1hZEbj-0005mW-QP
 for qemu-arm@nongnu.org; Fri, 07 Jun 2019 09:08:35 -0400
Received: by mail-ot1-x342.google.com with SMTP id x24so1758421otp.7
 for <qemu-arm@nongnu.org>; Fri, 07 Jun 2019 06:08:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2qhxN0j+xO3lc84ZYBjXCiQz9G1pupLf4Ynwz1mbak4=;
 b=UnJWy/4ejfPADeYBhmSV0XpxJNytKBuMhf/gg428v3/wIIq5ge1P3tlJZPue2xy6ky
 8+Iqp2/gitKB8jAjWTHr9ehU3dMb1xLLdxgYpJlaCIf0KjBvT4D+cYBQzQAJcIenZloj
 5GVaQUKRBWtF4gkei6haVcZbh+eSn4ztevGBylizfyrfjFlP/xw8xRGbIdHsQzpZj2FU
 y8LbIE0Lisclruvtl3VAjhENwTArKX87eCP3GYzJqP7dhYLmSwTbL432sJL5gkzPpJNd
 OnM2/7/LdaLxA25Fi0zNCDyqvhPnLZchUV0sCt53wCSYCIYm7UqBX3zxseUu/zkecBmI
 eEhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2qhxN0j+xO3lc84ZYBjXCiQz9G1pupLf4Ynwz1mbak4=;
 b=CYeSzu02ug31V+vWmx6DwW62hAdsl3v0sXlUcB5/IvawBVTyx+CGDHs4FKXn65yfYu
 tPQmuSdU1YDpXmJt/dFMt8m9vM9OzYXbDgL3zcoEiIYaAOE/YaycKhCi4q9o7dBbOOyJ
 e0cWJX7Xl9N9p8k8nT1Zy728tTrAc+Z+PvMSa0R1E3r9CUqTjWrebjCepsQOb89JOkFf
 KQCA+fHWvnvz2M4iIG1puHiO5sdKJYU+DK0FejvcMf+LcV5aauI4DihFcCakGfwBQNgc
 X8TXzu/21e/lP8K3ZacuFkNCOhX/9VvZSIK5y3S9hUmRL+mWutjDxvu/VW9HeAPH/KOx
 aImQ==
X-Gm-Message-State: APjAAAVbFbvctwH2wXmXi5V6LdzVnVs3LGDYs4zOxf4k21qN9jwPgAUh
 BafnMl3kMB7QVQdY2IquSpVGOHuk8YJfF5C5v1RyHuvnIKw=
X-Received: by 2002:a9d:7245:: with SMTP id a5mr19619591otk.232.1559912913469; 
 Fri, 07 Jun 2019 06:08:33 -0700 (PDT)
MIME-Version: 1.0
References: <20190524124248.28394-1-peter.maydell@linaro.org>
 <20190524124248.28394-3-peter.maydell@linaro.org>
In-Reply-To: <20190524124248.28394-3-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 7 Jun 2019 14:08:22 +0100
Message-ID: <CAFEAcA9bBNov=qUEtgkBdhAyj1E=sPALKpJcYyEkSmFO7VgHDg@mail.gmail.com>
To: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::342
Subject: Re: [Qemu-arm] [PATCH v2 2/2] hw/intc/arm_gicv3:
 GICD_TYPER.SecurityExtn is RAZ if GICD_CTLR.DS == 1
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
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: tIPTHG6w6CT1

Ping for code review, please?

thanks
-- PMM

On Fri, 24 May 2019 at 13:42, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> The GICv3 specification says that the GICD_TYPER.SecurityExtn bit
> is RAZ if GICD_CTLR.DS is 1. We were incorrectly making it RAZ
> if the security extension is unsupported. "Security extension
> unsupported" always implies GICD_CTLR.DS == 1, but the guest can
> also set DS on a GIC which does support the security extension.
> Fix the condition to correctly check the GICD_CTLR.DS bit.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/intc/arm_gicv3_dist.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/hw/intc/arm_gicv3_dist.c b/hw/intc/arm_gicv3_dist.c
> index e6fe4905fd3..b65f56f9035 100644
> --- a/hw/intc/arm_gicv3_dist.c
> +++ b/hw/intc/arm_gicv3_dist.c
> @@ -378,8 +378,14 @@ static MemTxResult gicd_readl(GICv3State *s, hwaddr offset,
>           * ITLinesNumber == (num external irqs / 32) - 1
>           */
>          int itlinesnumber = ((s->num_irq - GIC_INTERNAL) / 32) - 1;
> +        /*
> +         * SecurityExtn must be RAZ if GICD_CTLR.DS == 1, and
> +         * "security extensions not supported" always implies DS == 1,
> +         * so we only need to check the DS bit.
> +         */
> +        bool sec_extn = !(s->gicd_ctlr & GICD_CTLR_DS);
>
> -        *data = (1 << 25) | (1 << 24) | (s->security_extn << 10) |
> +        *data = (1 << 25) | (1 << 24) | (sec_extn << 10) |
>              (0xf << 19) | itlinesnumber;
>          return MEMTX_OK;
>      }
> --
> 2.20.1
>
