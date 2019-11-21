Received: by 2002:a19:6911:0:0:0:0:0 with SMTP id e17csp3484328lfc;
        Thu, 21 Nov 2019 05:23:23 -0800 (PST)
X-Google-Smtp-Source: APXvYqy/yZoZFnYbMcHE3FUBuZjqJNdTKZ3ZVSKV/B3Vtd5HkpR33/BZeGEuF09Pv1bPTbLHBJ+o
X-Received: by 2002:a37:404c:: with SMTP id n73mr7751240qka.292.1574342602948;
        Thu, 21 Nov 2019 05:23:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1574342602; cv=none;
        d=google.com; s=arc-20160816;
        b=l4lczuhRSSC1aO2JnsFiTRM2JDnkJZ+R9ZhcnIUM0moQB4W608XwMEXogNyMp3hk15
         lfb7XrD5Id5j+7scqanS3lN7lvNWpbdHEtmaYFNoesBCWRX7xCaNGlgEEKWagoIZYuRR
         kXd3CO/LOfi9YfdV8nkJJ0QIv5myxXoZfiKK0nl7LP2azaIrtgU2JPOZw+WcC0NKQkPV
         y0fQtHOcbCJqG7Z7Hy3krxYAhXAwIPIuIKp/2TuCsryEAhVM4JkGdsKD2SWoqtvcRGPN
         DiNHk2MbQq1Ws5SkiBirKA8oZ/hDYXPUBgTZVzwfCxsFg6/ELs9G6Gy9J7Sde1Pd94Zk
         60vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=LDp8lOU1GiwVuGa/fKc8Tmq1XqanSNL9f3i9e8NktrU=;
        b=ntW9oh8XyIxDW2krZPejVjz9jRT7aBpGvgknLX2rKC2Ujfp0fBnWpUQYqd0TmTfghy
         vx7cQARGo5y+tpAVaxftOHjxg1T6c6K2pUzwnNySMoRta+0B5UmvhTmyStSFTw3r1gdh
         qdhICrOABuPU5KBTH4VJKrr5NZy7sCJvwGNF4IQTbcBOsr4ElANKHdWERbKT3hhF21fv
         zJA/iMOPv6Gj9gNJbEEsTwBXIh9+NWYXRqoZBSKY07J4v+mnrcLTQy6yHXZd68x3KFbx
         UtlLqSqOvOgdwfMF047aKP7GQ0CWe/c2KlNYC5a7AABt6GpY5Fs2e/qVWd5HojcG3OJo
         L8Nw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="g7rds/aH";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t7si2272714qtr.368.2019.11.21.05.23.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 21 Nov 2019 05:23:22 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="g7rds/aH";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iXmQc-0000Tl-5n
	for alex.bennee@linaro.org; Thu, 21 Nov 2019 08:23:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57264)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iXmQP-0000R3-00
 for qemu-arm@nongnu.org; Thu, 21 Nov 2019 08:23:11 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iXmQN-0002g7-Nn
 for qemu-arm@nongnu.org; Thu, 21 Nov 2019 08:23:08 -0500
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243]:35914)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iXmQN-0002eZ-IJ
 for qemu-arm@nongnu.org; Thu, 21 Nov 2019 08:23:07 -0500
Received: by mail-oi1-x243.google.com with SMTP id j7so3163171oib.3
 for <qemu-arm@nongnu.org>; Thu, 21 Nov 2019 05:23:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=LDp8lOU1GiwVuGa/fKc8Tmq1XqanSNL9f3i9e8NktrU=;
 b=g7rds/aHpL3zmLEpMshpzqD8HpDgioA5HRjTIFwbSsx3osZLTSSGF1YgRxrBg1pu+C
 2RpL6o8ajAIXZXoOH181JEjVSGiaxJBYUpYhV8i2Q9TSBBmrEpcbbvxYeojDFsJEZ9h4
 PZszxz92nbnMKWCEPdYfPvYYye3UvCpy/qaqcMmt/CKQHsqJDsZUNRoazvGG3EtD85cZ
 boTcOhyCWX3o+5jE88ni1+XY3pdjeyb5Yx7qwjYrPGFK0oocuBzh5Vm4FaNBV89rUZju
 E6eOou+KennRzkzsmshvxQWqJqa5kC8hguaeOWJ4219Dt0uqflwo7SeqJ1uq8SuuVQ59
 ZdFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=LDp8lOU1GiwVuGa/fKc8Tmq1XqanSNL9f3i9e8NktrU=;
 b=d4NG8c89TvT3n/oNa1QzFCGy+OpFF1wcpWun/UshAW9Y8yAgPuA1uJu8DpH5HVF50G
 6S4gaKpCoLVx38/2ULDyp2voqvFt3RerewU8U84ys01+Wyh4kBDnM/LHfRkRvJXaaDmC
 u+MFUAzn942ozaHmX0zw9eA13ftgnLVYIi/JWaXDfUsKCMOK1gO0gC5/4g+a5Y77gPh0
 nJCEc13V8zmlzAeNARK2oTaa1+LprCZo2kMpBOC59fjMQbuFfCvIWS6q0+VkBPsQsuD/
 YaIbR0e6WAreA0rc7RAIxmVj5H9JroQefoyiZSp/gGMITFtHWPNcn3qX8JJPcjfupyRv
 UDvw==
X-Gm-Message-State: APjAAAXee+0zWgGtDzjy4siNsfGONqjPV5Im8nZE1EnCxP0L92CJg8G0
 0IPvKRdN4RDZJKWAurx3GKVHxCFLhQPeSIq+xlwjcY5+poY=
X-Received: by 2002:aca:4945:: with SMTP id w66mr7845168oia.98.1574342585920; 
 Thu, 21 Nov 2019 05:23:05 -0800 (PST)
MIME-Version: 1.0
References: <20191121014353.2604-1-jean-hugues.deschenes@ossiaco.com>
In-Reply-To: <20191121014353.2604-1-jean-hugues.deschenes@ossiaco.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 21 Nov 2019 13:22:54 +0000
Message-ID: <CAFEAcA_G5JYcpJEXOdDs2dFqi8PiTdU0TFpXpBviX2Mw08EW_g@mail.gmail.com>
Subject: Re: [PATCH] target/arm: Fix handling of cortex-m FTYPE flag in EXCRET
To: =?UTF-8?Q?Jean=2DHugues_Desch=C3=AAnes?=
 <Jean-Hugues.Deschenes@ossiaco.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::243
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
Cc: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "richard.henderson@linaro.org" <richard.henderson@linaro.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ENGkxJfOYbTK

On Thu, 21 Nov 2019 at 01:44, Jean-Hugues Desch=C3=AAnes
<Jean-Hugues.Deschenes@ossiaco.com> wrote:
>
> According to the PushStack() pseudocode in the armv7m RM,
> bit 4 of the LR should be set to NOT(CONTROL.PFCA) when
> an FPU is present. Current implementation is doing it for
> armv8, but not for armv7. This patch makes the existing
> logic applicable to both code paths.
>
> Signed-off-by: Jean-Hugues Deschenes <jean-hugues.deschenes@ossiaco.com>
> ---
>  target/arm/m_helper.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
>
> diff --git a/target/arm/m_helper.c b/target/arm/m_helper.c
> index f2512e448e..595c49fe2a 100644
> --- a/target/arm/m_helper.c
> +++ b/target/arm/m_helper.c
> @@ -2173,19 +2173,18 @@ void arm_v7m_cpu_do_interrupt(CPUState *cs)
>          if (env->v7m.secure) {
>              lr |=3D R_V7M_EXCRET_S_MASK;
>          }
> -        if (!(env->v7m.control[M_REG_S] & R_V7M_CONTROL_FPCA_MASK)) {
> -            lr |=3D R_V7M_EXCRET_FTYPE_MASK;
> -        }
>      } else {
>          lr =3D R_V7M_EXCRET_RES1_MASK |
>              R_V7M_EXCRET_S_MASK |
>              R_V7M_EXCRET_DCRS_MASK |
> -            R_V7M_EXCRET_FTYPE_MASK |
>              R_V7M_EXCRET_ES_MASK;
>          if (env->v7m.control[M_REG_NS] & R_V7M_CONTROL_SPSEL_MASK) {
>              lr |=3D R_V7M_EXCRET_SPSEL_MASK;
>          }
>      }
> +    if (!(env->v7m.control[M_REG_S] & R_V7M_CONTROL_FPCA_MASK)) {
> +        lr |=3D R_V7M_EXCRET_FTYPE_MASK;
> +    }
>      if (!arm_v7m_is_handler_mode(env)) {
>          lr |=3D R_V7M_EXCRET_MODE_MASK;
>      }
> --
> 2.17.1

Thanks, applied to my target-arm.next branch for 4.2.

-- PMM
