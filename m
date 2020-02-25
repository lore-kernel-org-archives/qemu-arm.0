Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp1727714lfg;
        Tue, 25 Feb 2020 06:06:51 -0800 (PST)
X-Google-Smtp-Source: APXvYqwkzWtXwqaM0ya9v6Jw01vWZye7ZDDa+1Ph9MQeWAA+52IFVAPb/5cAgdsCJB2hzyqfh4CI
X-Received: by 2002:a37:a2d6:: with SMTP id l205mr14999200qke.92.1582639611723;
        Tue, 25 Feb 2020 06:06:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582639611; cv=none;
        d=google.com; s=arc-20160816;
        b=TFmPd+oR1Q23yRr7PpP7zxLkr1Z1WKKfMhm0RLpNZpkOkZNTBGfxDAlWnyYydgK+5i
         JJlKof1qq36Z79rpkIbba1X3/rOHEUn0/K1p37++PDrYo4lyFH4HXAMhZJNeb2jMRY+U
         Vo7SxuOIVPZ0fCnQ96N6MFlF81agKXXsiKbMef6dLIaaJbKugODwJvpp+eKN1hcgkJoK
         rEaZv6sSmTOBheIIP76bIsmc0SeK3/suKlLXgUPWRal8avXKeDwIDO7NbElM76A2kx5m
         +jtLYO0ENvuihnGAq7XhozxZGeqaoNO+DXe4NUZD60xkHTlQ00J3B4b04p3X7t68D121
         WHKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=R0ZHLlWySBg8qPOi6/AiA6dMUpTtq4vQOt8BzQt+4L0=;
        b=SJM6sc4giFPekItHZtYmW6Hta4iF8tYqVFUMuM/ODrRo2aiI3SOMUUTNbk1GCYzGlu
         IyeEe4zbOPOmp5qjlGvvY+6+zyUmC0e6eFOS8AFW2QSB30sD6JhTfQC7rnfSi3b1J8L0
         ozB07UwKwch7qdqc6aCS0uHgjQ92Qe1P/xt25jZI0t+QyoWAoHTzp8gaxc0WVvkzv35H
         Tc+DnTDr/wO/1GPNtmB7h5ABbJrdPOtGK0I3hrLzXYkOZjKcczaOLA9fwSuleyFUaLzn
         RvXpNH1qJNTCXY/CsupCnptafFHWUpVNoenxMo5MP6Pk/c7tracwU5ulur/xf1WLyaGJ
         81Kg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=kmuukNCE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o24si1417475qki.330.2020.02.25.06.06.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Feb 2020 06:06:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=kmuukNCE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57102 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j6arL-0001hl-63
	for alex.bennee@linaro.org; Tue, 25 Feb 2020 09:06:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38112)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1j6a6f-0006Ta-JP
 for qemu-arm@nongnu.org; Tue, 25 Feb 2020 08:18:38 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1j6a6e-0003ah-Ch
 for qemu-arm@nongnu.org; Tue, 25 Feb 2020 08:18:37 -0500
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242]:41512)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1j6a6e-0003aI-6t
 for qemu-arm@nongnu.org; Tue, 25 Feb 2020 08:18:36 -0500
Received: by mail-oi1-x242.google.com with SMTP id i1so12486449oie.8
 for <qemu-arm@nongnu.org>; Tue, 25 Feb 2020 05:18:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=R0ZHLlWySBg8qPOi6/AiA6dMUpTtq4vQOt8BzQt+4L0=;
 b=kmuukNCEPOnqN/h7Rgw5P1WHZf1l3vtbEDmZ4sdQhK45L0XDeXFA7wm4IL3TuDd05A
 u5baXUVZNaCE/4liiSHjpTJaPFKXGGnUSTf2ufCFkn/oMZTr0CoVd8nBPgODUJN954Ik
 8zLWERI9ufDLbbq8HYqJs8e26W448eSrXxZmu+iKrOrru3AKuTzPGRj1MmGsBL8zcUd/
 yf4EGT95CcS9+QE0Hro8r3gSj+rQrtIVsx0+utJOILLx/DAAoN9EXup27ETSthrS7BlD
 KTGlAh+UHp6Y/sFenSpn+LefmcnlZb/sb55IMoXViZcVxfQ4c9Wk71TH5Un2DQ5Q3jN8
 l5iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=R0ZHLlWySBg8qPOi6/AiA6dMUpTtq4vQOt8BzQt+4L0=;
 b=DQ7VrW13ZNtWTow+ggBqkEPYLSDHChldgjqP32YWlICg6aLVRpd5TiNRvuz65qaRhE
 n+tzhAqtd6Q/6A+xkcwBLl2EYD1uPACVHZoWgb0UEhx0Q7/K8GBB6DlAfWYaIAI0Bb9t
 Uw4sy+oivnbus+hBOF3sPZgCCohKfvndkAP9J5cL+5sMuvTMffRP8OpNpi0HopFWwlbr
 SWAGNdd/YiZnEkUcI+ju+qCiFofJASh/u+wFuJ2EEIuXDCRiOQD3Q3Y0qoCpzvgh2tIc
 qZNlno3sZr0Tic3bT62IylLy4yV+vXkvGhDtQFFw3HztQ/JcXgbepOsmmookNeIeH2SQ
 RiNQ==
X-Gm-Message-State: APjAAAWtbYzg1oNmGsC9J4i6GO+xH/dnyHrjfS2rGQWYGDoCm45luI4m
 OlxdSyaf3ZKk8TcCat32oBlpUoRw3zkT9FhRI9CrnQ==
X-Received: by 2002:aca:b2c5:: with SMTP id b188mr3451522oif.163.1582636715173; 
 Tue, 25 Feb 2020 05:18:35 -0800 (PST)
MIME-Version: 1.0
References: <20200224222232.13807-1-richard.henderson@linaro.org>
 <20200224222232.13807-2-richard.henderson@linaro.org>
In-Reply-To: <20200224222232.13807-2-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 25 Feb 2020 13:18:23 +0000
Message-ID: <CAFEAcA9xPy2=aT-=RQfWiQRQrMc0c_MS8zrQEfpMrH7W9YwgxQ@mail.gmail.com>
Subject: Re: [PATCH v2 01/17] target/arm: Add isar_feature_aa32_vfp_simd
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::242
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
X-TUID: iNzFdq0wQvmE

On Mon, 24 Feb 2020 at 22:22, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Use this in the places that were checking ARM_FEATURE_VFP, and
> are obviously testing for the existance of the register set
> as opposed to testing for some particular instruction extension.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/cpu.h        |  9 +++++++++
>  hw/intc/armv7m_nvic.c   | 20 ++++++++++----------
>  linux-user/arm/signal.c |  4 ++--
>  target/arm/arch_dump.c  | 11 ++++++-----
>  target/arm/cpu.c        |  4 ++--
>  target/arm/helper.c     |  4 ++--
>  target/arm/m_helper.c   | 11 ++++++-----
>  7 files changed, 37 insertions(+), 26 deletions(-)
>

> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index 79db169e04..8841cc7fde 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -894,7 +894,7 @@ static void cpacr_write(CPUARMState *env, const ARMCPRegInfo *ri,
>           * ASEDIS [31] and D32DIS [30] are both UNK/SBZP without VFP.
>           * TRCDIS [28] is RAZ/WI since we do not implement a trace macrocell.
>           */
> -        if (arm_feature(env, ARM_FEATURE_VFP)) {
> +        if (cpu_isar_feature(aa32_vfp_simd, env_archcpu(env))) {
>              /* VFP coprocessor: cp10 & cp11 [23:20] */
>              mask |= (1 << 31) | (1 << 30) | (0xf << 20);

This use in cpacr_write() is ok but it prompted me to have
a look at the whole function, which is used also for AArch64
CPACR_EL1. Currently we have an odd setup where for a pre-v8
core we carefully check and enforce the RAZ/WI bits, but
for v8 we allow any random bits to be set. Anyway, that's
I guess architecturally valid and not an issue related to
this patchset, so:

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
