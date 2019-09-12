Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp2342111wrp;
        Thu, 12 Sep 2019 09:05:10 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyOG5ADZlIO6ufYWJiW3zEprOj45Jqy+s9RqXszshamHUi4josLRlJTAkaYfWX1MBN3drJ2
X-Received: by 2002:ac8:2a75:: with SMTP id l50mr42312999qtl.137.1568304309895;
        Thu, 12 Sep 2019 09:05:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1568304309; cv=none;
        d=google.com; s=arc-20160816;
        b=QUF2RUnEGIOqYxtK1nrY1oKXKcdzqN6IK91fcXIWQYyYgBcS2QnL0ZJbUfXaj3uKrJ
         1YzGQGoTcd65R1mtzrInY9ZavkxDoMbUY+KtfJV6hDOG0kyqSrnsUZJ2iCHQOo0c97Q8
         odOt41hY6zB8OYVOAR/eNv9Z0ILyE7lEZQQcL+uvSGf9jKsTQMhLWUhqLEd2FZt8Um3S
         KqKi9OLBb3Sq8vLjsvAegkR80uGJqDscXowAwx5PwekbTVypg7RVlQIXtVgGKgEP0YIT
         vNk0cXWji5PRjFqSURvli7SeiuPX8vugJNZ2SEFxm8aLa05o9jsAi5iHLR2wLnOE9CGD
         tq2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=s2Jjte3IicFNSnIdujoo5LTOVDQZOZvERHNYPfd4lRY=;
        b=y0XTytXc7Iuaog5zNJV5z8CtXnaHLpWR3fuqINe9NhZjR6izeg57rEpl1QMbhhWrwv
         liPK36m2kU8N6v/BAlRZ4Hjvpy3a7in1nkz/0EVEiobMR73CwMSjoxEJlPI1/VU+s7pO
         r8vLpxQgTh/q6cRi6uCHDa/9DfaVRb6lOcL3uUIaQsB0L4PTGhyhN8JgJOw4UzC0dIED
         Siji9C85wlczksCSzYELs7VPlaE6XiIPkSXWkjmyx/RM0jloBcyzdTMlLtXZ0WlhXSEj
         IrjFO5pV5Wi3+BwhvXOP9vQd2tqjihj+c66ml4R2vphgdPKDSWj/IPC+p/NpRw3kDyyK
         9QXg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=uIMbAWTr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v81si17304775qka.27.2019.09.12.09.05.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 12 Sep 2019 09:05:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=uIMbAWTr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36726 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i8Ram-0004Xh-SM
	for alex.bennee@linaro.org; Thu, 12 Sep 2019 12:05:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50682)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1i8RZp-0003hL-Ob
 for qemu-arm@nongnu.org; Thu, 12 Sep 2019 12:04:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1i8RZo-0006rv-Bp
 for qemu-arm@nongnu.org; Thu, 12 Sep 2019 12:04:09 -0400
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244]:36573)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1i8RZo-0006qh-7P
 for qemu-arm@nongnu.org; Thu, 12 Sep 2019 12:04:08 -0400
Received: by mail-oi1-x244.google.com with SMTP id k20so17563880oih.3
 for <qemu-arm@nongnu.org>; Thu, 12 Sep 2019 09:04:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=s2Jjte3IicFNSnIdujoo5LTOVDQZOZvERHNYPfd4lRY=;
 b=uIMbAWTrQTxuSnw2rOysr7njJRDPrVn1Z0zm28mGWX1BxNocTSNqwe0NBResti8bsz
 2HOStbJX9TvZbkH/++q82DruL4p+SR/w5hzPSbI9nDpl++OcCtLIEDzTnJgtkS7l7xX0
 9g2zJ7XCBudTQpgnS+Xq5bePy14Z0IIrsyCdKGHk17ZMzA5pN4eBn0TYTGGpQiku196z
 p83m6T/WpU73PRTA87KzY4G/IDHmVMES0q7zfiX6znPKnV51Or46PdpkDyVashfCvKFe
 ktk3JpuozFgME2Q3WeKU5aJW02qczA5dSNCkM365hzKhi7rjBB6sNbMnf6ZB+4bML4vK
 jatQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=s2Jjte3IicFNSnIdujoo5LTOVDQZOZvERHNYPfd4lRY=;
 b=SD6WR22bsQcbLsTLbvaa55AwMj0M6lQKrVnc0nyk9EVjKPAH8YjCXoGs0mY/mHpv61
 GJlnXrZk9eyGA04yuQu+BVaS+aW6NtOIA0G+hiegkELVoE1FReBQuo8Ic6SWgq2bJDjf
 SRSoh9/Lm1d+pDt09Q8tgbVSzW5SADrVKilxdAPZxh493klw/Ncq/9yuczlTw1vGXszr
 hYMfMkPek/t827B6LwR/c2mt/tAfRQDB3rm9TKpokZZ4ypab7Vrv2DiOfgTuPdAGIhyz
 1PKOfWi1HimJ1O0GJUmIMukapBziPEw765uKQAqzqXtEs+eB9pwxqt0OP0zjhYOtixDt
 2p6w==
X-Gm-Message-State: APjAAAXiPwKI+miNh/IjUJgK/dvCrYkkN2CcFBoI3EcEycgq+bTyC6yi
 71+dE9/QjhumfK3UVtjGqQGO93XBO57lgo4FHd48BSaQXvM=
X-Received: by 2002:aca:53d4:: with SMTP id h203mr788702oib.146.1568304246638; 
 Thu, 12 Sep 2019 09:04:06 -0700 (PDT)
MIME-Version: 1.0
References: <20190912110103.1417887-1-luc.michel@greensocs.com>
In-Reply-To: <20190912110103.1417887-1-luc.michel@greensocs.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 12 Sep 2019 17:03:55 +0100
Message-ID: <CAFEAcA-WO=O5zwRDQoNz2zT4sx61j8Jy5px0uFPiWgF_JUpa+A@mail.gmail.com>
To: Luc Michel <luc.michel@greensocs.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::244
Subject: Re: [Qemu-arm] [PATCH] target/arm: fix CBAR register for AArch64
 CPUs
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: wSPUE2T4qwbl

On Thu, 12 Sep 2019 at 12:01, Luc Michel <luc.michel@greensocs.com> wrote:
>
> For AArch64 CPUs with a CBAR register, we have two views for it:
>   - in AArch64 state, the CBAR_EL1 register (S3_1_C15_C3_0), returns the
>     full 64 bits CBAR value
>   - in AArch32 state, the CBAR register (cp15, opc1=1, CRn=15, CRm=3, opc2=0)
>     returns a 32 bits view such that:
>       CBAR = CBAR_EL1[31:18] 0..0 CBAR_EL1[43:32]
>
> This commit fixes the current implementation where:
>   - CBAR_EL1 was returning the 32 bits view instead of the full 64 bits
>     value,
>   - CBAR was returning a truncated 32 bits version of the full 64 bits
>     one, instead of the 32 bits view
>   - CBAR was declared as cp15, opc1=4, CRn=15, CRm=0, opc2=0, which is
>     the CBAR register found in the ARMv7 Cortex-Ax CPUs, but not in
>     ARMv8 CPUs.
>
> Signed-off-by: Luc Michel <luc.michel@greensocs.com>
> ---
>  target/arm/helper.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index 507026c915..755aa18a2d 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -6740,12 +6740,12 @@ void register_cp_regs_for_features(ARMCPU *cpu)
>              ARMCPRegInfo cbar_reginfo[] = {
>                  { .name = "CBAR",
>                    .type = ARM_CP_CONST,
> -                  .cp = 15, .crn = 15, .crm = 0, .opc1 = 4, .opc2 = 0,
> -                  .access = PL1_R, .resetvalue = cpu->reset_cbar },
> +                  .cp = 15, .crn = 15, .crm = 3, .opc1 = 1, .opc2 = 0,
> +                  .access = PL1_R, .resetvalue = cbar32 },

This will break the Cortex-A9 &c which use the 15/0/4/0 encoding
and the un-rearranged value for this register.

I think we need to check through the TRMs to confirm which CPUs use
which format for the CBAR, and have a different feature bit for the
newer format/sysreg encoding, so we can provide the right sysregs for
the right cores.

thanks
-- PMM
