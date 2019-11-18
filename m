Received: by 2002:a05:6512:48d:0:0:0:0 with SMTP id v13csp2496922lfq;
        Sun, 17 Nov 2019 23:13:30 -0800 (PST)
X-Google-Smtp-Source: APXvYqzlQ3vmfl8nnukBnUE64NKAUcG+ZtO8RIxtFFDie8TibjHalZTLZTfbLp//vTjS2gxfiq5+
X-Received: by 2002:a37:d91:: with SMTP id 139mr21528811qkn.79.1574061210559;
        Sun, 17 Nov 2019 23:13:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1574061210; cv=none;
        d=google.com; s=arc-20160816;
        b=LlXwjk54DY7SNykGiqZm6Pcl/xzLFL2SYHYIq9m4aJSdk0V7WgeX0eVJ36bDIvzr85
         sZEvmlDpJrgHmnQGl65iKyZDfViY0x6oob5JHMHyZS8yfwS+LHAoO09cvD4sRlXu5Phk
         zJyYptRhVmKDHHQ48vAF3bO1Ipv8xczB1+aacTv/NRRMwS9GBDljULoBvyxveeSDKZa8
         ss9k51EbXPwe5LwdA+B2vxQsWvAnGS9r4t8OXAPrPTRIXeHzbS/bcXcSqP2M8ESOAISY
         PEhOOpWJ6B4bVLL+feWgU8Rs06cra/BkdTs5YVjPb1QXr79DOWTX2/Xugt1kHYosCm4E
         Gpqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=xMEnZ2lxrIHBBfDaC+zzSoaWk1OGVkB9H/9Lul5BReY=;
        b=D31tXVyDGz1B0MdL87k6RB18n61MnlY7QsDZl+ZWoR1qfDGL3yQdtjG56/0xltnDco
         GLlFCFf67u4ajDZdg5A/w1ARR/8CHmUO1i5EIkJrLtGLcAoqDuP+UxeMWYc6KAtFjfkx
         iK2+xNorucc5SviRdsuiahz+5a9opZDogAzFkoRAhZdeOa4Y33tYobObBkCPjX1fulHC
         F85bovp/5+kNSWDZ6kl5MVu5ieYelNElpXcPdaU/rmeDaIL9xQ/9TY/VmGtriOgNwwsh
         Nh/BoVB7vof+khRoGoGqu50u8VoKT1vAAEt/+nkVR/lBds1JQRRE9jHBYcICfIdWqYMs
         X0nw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@jms.id.au header.s=google header.b=F27B3uxl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 136si10600033qke.284.2019.11.17.23.13.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 17 Nov 2019 23:13:30 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@jms.id.au header.s=google header.b=F27B3uxl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:58650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iWbE1-0008BW-R9
	for alex.bennee@linaro.org; Mon, 18 Nov 2019 02:13:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42201)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <joel.stan@gmail.com>) id 1iWbDS-0008BO-Pq
 for qemu-arm@nongnu.org; Mon, 18 Nov 2019 02:12:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <joel.stan@gmail.com>) id 1iWbDR-00050O-Jf
 for qemu-arm@nongnu.org; Mon, 18 Nov 2019 02:12:54 -0500
Received: from mail-qt1-x842.google.com ([2607:f8b0:4864:20::842]:34783)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <joel.stan@gmail.com>)
 id 1iWbDQ-0004z5-Ub; Mon, 18 Nov 2019 02:12:53 -0500
Received: by mail-qt1-x842.google.com with SMTP id i17so19139693qtq.1;
 Sun, 17 Nov 2019 23:12:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=xMEnZ2lxrIHBBfDaC+zzSoaWk1OGVkB9H/9Lul5BReY=;
 b=F27B3uxlAtAL3Foez6c5m5oucPEXDS3UruQzvG9Kg+gLsQ7B82rPnZztt67JNzJSsa
 XSxBa3+U/m0MbU19rDX+gNFEdtRwRGrXyksvhg6aEbFQUJNJQLExmpEzwrE3aC9RgbLe
 5Ys5Q8X18JDi8X2aRyAx97o/BWaT9zba64YBk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=xMEnZ2lxrIHBBfDaC+zzSoaWk1OGVkB9H/9Lul5BReY=;
 b=RMovXrLE4J4Cp48F0io1SqsruUebd+fAcY4q6Z+p//+rU/Njj6fp36eE6QYOgtmSrn
 T7siyfZqZTpaYoR2PmkzztY4CHk+SoGcEm1R1NsSgHgtPmBoYF9yX6hwQP5UlJMnvJhA
 YHi4SIIi6C68EvAhexyNg4cXvIyVoyFEAbkHRHb812S/DSFsA7Hd7nz/F4LUqnw2GhU6
 qc8kt3qffX2sOtWz5rSqEcR3g0wxQqn+1T2qKGviYDlFcSnuOR9gBLM44OJ/PtXoWZH3
 1XG67EZMoG7iZIhvWQszSuJLQLqzF3T81RQWVux1S6nvKxoo0nU8LlcXUQTPmMeCM2ez
 Yb0Q==
X-Gm-Message-State: APjAAAV3+IFuEo1FUuZDH/3FTE+Vy8+ExeUK2MKd5oJdyUECSHABvh6i
 3V7Gsk5Uo1HhjgU9Zm4HAWb8kqf20KZ97JTIBdQ=
X-Received: by 2002:ac8:e03:: with SMTP id a3mr25983215qti.169.1574061171991; 
 Sun, 17 Nov 2019 23:12:51 -0800 (PST)
MIME-Version: 1.0
References: <20191114094544.30114-1-clg@kaod.org>
 <20191114094544.30114-2-clg@kaod.org>
In-Reply-To: <20191114094544.30114-2-clg@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 18 Nov 2019 07:12:40 +0000
Message-ID: <CACPK8XeMFVaPrs7Je0AU_2024E8E1i=+tKmg7rGhDV+RyBFRRg@mail.gmail.com>
Subject: Re: [PATCH 1/5] aspeed/smc: Restore default AHB window mapping at
 reset
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::842
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: T2KR4VWriA1Y

On Thu, 14 Nov 2019 at 09:46, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> The current model only restores the Segment Register values but leaves
> the previous CS mapping behind. Introduce a helper setting the
> register value and mapping the region at the requested address. Use
> this helper when a Segment register is set and at reset.
>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

Reviewed-by: Joel Stanley <joel@jms.id.au>

> ---
>  hw/ssi/aspeed_smc.c | 32 +++++++++++++++++++++-----------
>  1 file changed, 21 insertions(+), 11 deletions(-)
>
> diff --git a/hw/ssi/aspeed_smc.c b/hw/ssi/aspeed_smc.c
> index f0c7bbbad302..955ec21852ac 100644
> --- a/hw/ssi/aspeed_smc.c
> +++ b/hw/ssi/aspeed_smc.c
> @@ -475,10 +475,26 @@ static bool aspeed_smc_flash_overlap(const AspeedSM=
CState *s,
>      return false;
>  }
>
> +static void aspeed_smc_flash_set_segment_region(AspeedSMCState *s, int c=
s,
> +                                                uint64_t regval)
> +{
> +    AspeedSMCFlash *fl =3D &s->flashes[cs];
> +    AspeedSegments seg;
> +
> +    s->ctrl->reg_to_segment(s, regval, &seg);
> +
> +    memory_region_transaction_begin();
> +    memory_region_set_size(&fl->mmio, seg.size);
> +    memory_region_set_address(&fl->mmio, seg.addr - s->ctrl->flash_windo=
w_base);
> +    memory_region_set_enabled(&fl->mmio, true);
> +    memory_region_transaction_commit();
> +
> +    s->regs[R_SEG_ADDR0 + cs] =3D regval;
> +}
> +
>  static void aspeed_smc_flash_set_segment(AspeedSMCState *s, int cs,
>                                           uint64_t new)
>  {
> -    AspeedSMCFlash *fl =3D &s->flashes[cs];
>      AspeedSegments seg;
>
>      s->ctrl->reg_to_segment(s, new, &seg);
> @@ -529,13 +545,7 @@ static void aspeed_smc_flash_set_segment(AspeedSMCSt=
ate *s, int cs,
>      aspeed_smc_flash_overlap(s, &seg, cs);
>
>      /* All should be fine now to move the region */
> -    memory_region_transaction_begin();
> -    memory_region_set_size(&fl->mmio, seg.size);
> -    memory_region_set_address(&fl->mmio, seg.addr - s->ctrl->flash_windo=
w_base);
> -    memory_region_set_enabled(&fl->mmio, true);
> -    memory_region_transaction_commit();
> -
> -    s->regs[R_SEG_ADDR0 + cs] =3D new;
> +    aspeed_smc_flash_set_segment_region(s, cs, new);
>  }
>
>  static uint64_t aspeed_smc_flash_default_read(void *opaque, hwaddr addr,
> @@ -897,10 +907,10 @@ static void aspeed_smc_reset(DeviceState *d)
>          qemu_set_irq(s->cs_lines[i], true);
>      }
>
> -    /* setup default segment register values for all */
> +    /* setup the default segment register values and regions for all */
>      for (i =3D 0; i < s->ctrl->max_slaves; ++i) {
> -        s->regs[R_SEG_ADDR0 + i] =3D
> -            s->ctrl->segment_to_reg(s, &s->ctrl->segments[i]);
> +        aspeed_smc_flash_set_segment_region(s, i,
> +                    s->ctrl->segment_to_reg(s, &s->ctrl->segments[i]));
>      }
>
>      /* HW strapping flash type for the AST2600 controllers  */
> --
> 2.21.0
>
