Received: by 2002:adf:fb8f:0:0:0:0:0 with SMTP id a15csp1210550wrr;
        Mon, 11 Nov 2019 03:41:37 -0800 (PST)
X-Google-Smtp-Source: APXvYqy8T3PTa9fUFsx4GhrSB85mPNXtYHnFuwAr22yB5qwpomn8Z578531OqsZsNXPPbrFI+qZT
X-Received: by 2002:a05:6402:19ae:: with SMTP id o14mr26222118edz.241.1573472497112;
        Mon, 11 Nov 2019 03:41:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1573472497; cv=none;
        d=google.com; s=arc-20160816;
        b=M6OKbb9QK611WFaCXT+vLqyQl+Xka3WzMgnbdP1PbejYN7tNuVgBhqjneQRnVn4Y7P
         MT3GFQ2ZYZwKU6VL5F5phs0uPZEcPhwyF2uH7FK7ci20/8OkoiVLkx0Iua2sp2dSDjAn
         4Zi/J7BmdAbyd3Q41mEhuc9S3ijmH9COeUqkrX+YGPj+dahSnA+eoKqeft5eoenadxAy
         nd72c/wfN+I1k+2CnzakpmI5bSFdOUu1pB8iItlOnzBeYIXmCQbdM8nYqaXqGjVvjosd
         uO9pjfvuKuMRvGtvrGsVK5gRvs21t/uuDd+2kYeEvMVX3Bql1FVEWQ0J0s3i5fJih7X1
         iuUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=AtPSNj6z0S1pVpexbPs9ZLnCorH702J0Ex7uyj4ZEY8=;
        b=nn/cB6VycXtGut1dv0L/zqW0ltGyqx55AT6kfH0Sbzv7zX912vvS//VAkaW+dPUgkE
         LRNwgOAQ2VVZaHIYsEf8JDGIyaKQyeWmIHPiH46jI2MELT3hRoSYqzMts9Ed4lq/E15z
         3e+FkaCmbLYIhpwhl/V2VxuFJhiZ7cNg5v5wORuePC5W9W6BlLPTi9/2MtC2mrRlKkZT
         bawfZAtaC4Kl9E8ZIh3vaguFRyur73dAP529ytqk4OQFh3G83EfWVoPVVccHHwx6+urm
         SbYUekt+EA62GIXWl9FSCQyDWLMVzD8MyjIXqiv+/1lF3HYiuAyJggn/GSOJ1mwGq3ux
         UoDA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ex6f9vIb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b14si10344373edf.199.2019.11.11.03.41.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 11 Nov 2019 03:41:37 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ex6f9vIb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iU84e-00078F-4N
	for alex.bennee@linaro.org; Mon, 11 Nov 2019 06:41:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59605)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iU84X-000780-4j
 for qemu-arm@nongnu.org; Mon, 11 Nov 2019 06:41:30 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iU84V-0007t6-UD
 for qemu-arm@nongnu.org; Mon, 11 Nov 2019 06:41:28 -0500
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:41815)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iU84V-0007so-OS
 for qemu-arm@nongnu.org; Mon, 11 Nov 2019 06:41:27 -0500
Received: by mail-ot1-x343.google.com with SMTP id 94so10973317oty.8
 for <qemu-arm@nongnu.org>; Mon, 11 Nov 2019 03:41:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=AtPSNj6z0S1pVpexbPs9ZLnCorH702J0Ex7uyj4ZEY8=;
 b=ex6f9vIbsRDhKRZeqp2h9DrOxKpraMvCR5q+S7CizPIXJrCnVhbsJG0WuAs+5/ATfh
 SUqbMHkNbGNIIcYOMC7Dg/PUKkD0KTnMEDufMOiMsJsPQai+/CYhDbLfJs2wL+HYVqD4
 rofxtgc95mMRqPSLnXwBELY0PiFzwxdKb4gAwXh59EuloNqq7fR9w0+CoaDc8ubzNKqN
 6pbZ2qRPnQ0q5X7xrWUp9VX8eOj0a9wfhzYrg+QibJt5+jGFSqlI/xtEkLgq9n/FmSPL
 MZIt6Rj2/Oqt8/vIpJPcBeU3+fovLvyU8+rv6YEmVSNNk8fv9wYpZSl1pqA60L6np552
 ftTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AtPSNj6z0S1pVpexbPs9ZLnCorH702J0Ex7uyj4ZEY8=;
 b=jVTaL9e64FGfFcn6VsEkP/K3N/3nmb2GWI2Eiu0AaH0nICQUD/Culi5suDIqnZeygD
 RFy+0+gbbV90b2U2iiF5jqudNGE8xyOub9jpZUmgk9OgxORrsbfJ43Mg+/KPvcCjQwYA
 kwcw7rhgZN82NCPm2B8lVoStq7Fvas+rkOhN+DyFBuEtu41DEI6ftMawImEbxywPlFft
 oMXuhxbnpo1jtTglA04KjN7LWQmt+Eg/JMFjvGXwszLLWG3vPdSUccujtztwrG+swocb
 2DGwXPIhlxnMtcHqEn6Ii83qoEhLFOh9FlDi1mlbSd4ffJVQi9OjXRfgPwnK/WaaebTu
 M5HA==
X-Gm-Message-State: APjAAAU0pIsVmK5AVSMakRqkopQ7LWphDnt9QbJN5B3q/FhzCPQ7ri+P
 C+LVY9dwUCZxXSZgF1mRLtBrFyxhMUT9jOFk//wJWA==
X-Received: by 2002:a9d:12d2:: with SMTP id g76mr21584489otg.232.1573472486652; 
 Mon, 11 Nov 2019 03:41:26 -0800 (PST)
MIME-Version: 1.0
References: <20191104151137.81931-1-clement.deschamps@greensocs.com>
In-Reply-To: <20191104151137.81931-1-clement.deschamps@greensocs.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 11 Nov 2019 11:41:15 +0000
Message-ID: <CAFEAcA93tmw3GJWz-7hrLAc3YSzfDtTwNL-GY9OoeUBDcGHNqw@mail.gmail.com>
Subject: Re: [PATCH] hw/arm/boot: Set NSACR.{CP11,
 CP10} in dummy SMC setup routine
To: Clement Deschamps <clement.deschamps@greensocs.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::343
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: eq3gRSPN+ywB

On Mon, 4 Nov 2019 at 15:12, Clement Deschamps
<clement.deschamps@greensocs.com> wrote:
>
> Set the NSACR CP11 and CP10 bits, to allow FPU access in Non-Secure state
> when using dummy SMC setup routine. Otherwise an AArch32 kernel will UNDEF as
> soon as it tries to use the FPU.
>
> This fixes kernel panic when booting raspbian on raspi2.
>
> Successfully tested with:
>   2017-01-11-raspbian-jessie-lite.img
>   2018-11-13-raspbian-stretch-lite.img
>   2019-07-10-raspbian-buster-lite.img
>
> See also commit ece628fcf6 that fixes the issue when *not* using the
> dummy SMC setup routine.
>
> Fixes: fc1120a7f5
> Signed-off-by: Clement Deschamps <clement.deschamps@greensocs.com>
> ---
>  hw/arm/boot.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/hw/arm/boot.c b/hw/arm/boot.c
> index ef6724960c..8fb4a63606 100644
> --- a/hw/arm/boot.c
> +++ b/hw/arm/boot.c
> @@ -240,6 +240,9 @@ void arm_write_secure_board_setup_dummy_smc(ARMCPU *cpu,
>      };
>      uint32_t board_setup_blob[] = {
>          /* board setup addr */
> +        0xee110f51, /* mrc     p15, 0, r0, c1, c1, 2  ;read NSACR */
> +        0xe3800b03, /* orr     r0, #0xc00             ;set CP11, CP10 */
> +        0xee010f51, /* mcr     p15, 0, r0, c1, c1, 2  ;write NSACR */
>          0xe3a00e00 + (mvbar_addr >> 4), /* mov r0, #mvbar_addr */
>          0xee0c0f30, /* mcr     p15, 0, r0, c12, c0, 1 ;set MVBAR */
>          0xee110f11, /* mrc     p15, 0, r0, c1 , c1, 0 ;read SCR */
> --
> 2.23.0

Yep. The boot.c logic sets NSACR.{CP11,CP10} for booting a
Linux kernel unless (a) the board says we should boot the
kernel in Secure mode or (b) this is the primary CPU and
the board requires the board_setup code to run in Secure mode.
In that case the board_setup code must set NSACR in the same
way that it is responsible for dropping down to NS.

This affects highbank and raspi, which are the only boards
that set info->secure_board_setup; both of those use the
arm_write_secure_board_setup_dummy_smc(), so this fix is
all we should need.

I plan to fold in this comment update:

diff --git a/include/hw/arm/boot.h b/include/hw/arm/boot.h
index 7f4d0ca7cdf..ce2b48b88bc 100644
--- a/include/hw/arm/boot.h
+++ b/include/hw/arm/boot.h
@@ -107,9 +107,12 @@ struct arm_boot_info {
     void (*write_board_setup)(ARMCPU *cpu,
                               const struct arm_boot_info *info);

-    /* If set, the board specific loader/setup blob will be run from secure
+    /*
+     * If set, the board specific loader/setup blob will be run from secure
      * mode, regardless of secure_boot. The blob becomes responsible for
-     * changing to non-secure state if implementing a non-secure boot
+     * changing to non-secure state if implementing a non-secure boot,
+     * including setting up EL3/Secure registers such as the NSACR as
+     * required by the Linux booting ABI before the switch to non-secure.
      */
     bool secure_board_setup;

and tweak the commit message to mention highbank, when I
apply it to target-arm.next.

thanks
-- PMM
