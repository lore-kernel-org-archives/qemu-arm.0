Received: by 2002:a19:7b1b:0:0:0:0:0 with SMTP id w27csp1082083lfc;
        Fri, 16 Jul 2021 01:33:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwDlykj6cGWNRKFAfDl5hmK1gd1+j+MjidRseYzT0+SqX1WhN3WydYk9MNpFoKJEKetFirC
X-Received: by 2002:ac8:58cb:: with SMTP id u11mr7980677qta.342.1626424393021;
        Fri, 16 Jul 2021 01:33:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1626424393; cv=none;
        d=google.com; s=arc-20160816;
        b=sgmTQBpxijZeaeEUaKR05++F9fxs6KY16JAWFU7wul47i1mJTgbAk01aIjcmsa4aA2
         a9KvPyW8iVDV72yv3nCGXDffc/2aqJuyW4MVLjfypStKnlm4x6qakvXeDKQYP4L+TzHG
         aAPN48ip+UjPhYhL+HgPbhwrXb9vZiYUOQNLGJ/UXXHRdYE7WGQ+1mGwQDm6cbEmKaK+
         Qq1Xi7wmeyL9ZMG8er7LLD3nKOA0UbASAx7btU1Wai+DKnSLMB0KMLmFspR3uIXdjdhw
         G/OKXORBALUU4xMEWQy4U67LgjFWKOA9cQ9rdLkkmvaI34Vf7H+5R28vF/RlHYEPKYTm
         lRcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=BaN6Pg4jjCRiD6xfsS8Dp/x6pwe7CI/AwxlmE99e77Q=;
        b=cyhZb4bE8+zBSgCS+Xm2YD6SMgOlP3Eq2LapLUOmyScvhrGJMjC0MVhxxy0aTiGi4C
         LaNB9WxnOdpf0TaMjjo41G4zGvQLbgNYKeaLUJLmZGC08rSI4EbctaAwwbHQ4rB7kl0u
         Y0E+YiyuwPjOan/xpbOPcK1eFTvNJ7IbJQg5lsLOBnUweD96893P3in/O/X/1fh1HYmK
         fvnHEtp3D4lMijZ0d9X7SYPXYdXrQsf7INzuReGca50Jjpf9bxWatvgV3XPbK2m6rOWo
         9pL1qeeM6pjWRC9y50PREix6gmXkbuAoVvgp5LPFXzLh+iCzP5sOzuF/o0Sqr3l68Db3
         +P+A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Pf8zSlwH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b1si7500621qke.293.2021.07.16.01.33.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 16 Jul 2021 01:33:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Pf8zSlwH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1m4JHU-000824-7u
	for alex.bennee@linaro.org; Fri, 16 Jul 2021 04:33:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m4JHH-00081w-Ro
 for qemu-arm@nongnu.org; Fri, 16 Jul 2021 04:32:59 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536]:41877)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m4JHF-0007vZ-RR
 for qemu-arm@nongnu.org; Fri, 16 Jul 2021 04:32:59 -0400
Received: by mail-ed1-x536.google.com with SMTP id w14so11876753edc.8
 for <qemu-arm@nongnu.org>; Fri, 16 Jul 2021 01:32:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=BaN6Pg4jjCRiD6xfsS8Dp/x6pwe7CI/AwxlmE99e77Q=;
 b=Pf8zSlwHL1hWY2cy5rA8H0Gv/ZiDhfRRmM/wsCCythm2yVfvs0Zpi95X6yNWIyuaP0
 LCMtknpKsJZmPYhAIWHsmVYVM+O6s8dfdxvF09STw2ERfWSjRntd2cB45YR8jY6UB/gy
 236BlZlwwYsdxicEtNAeRe5Dcd4Kp9og0996isJICvF5slkM4KNB4OyqGWZAzFGXROsH
 PXqu7bfo38bPDPQI/8ggATAdIfNAej9Ogya7kPf5xEpfOyu4NpxpyEGfX6gL/AplV64I
 G7JLbenCBEY6JuSQt260pNaFuz0Vg1rTWVnaUTT8hI5enTE1jtGxLP3xpHZXO/2VCC7Q
 o4gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=BaN6Pg4jjCRiD6xfsS8Dp/x6pwe7CI/AwxlmE99e77Q=;
 b=tCXp4pLA8sdQl3swfCQDPkvoWzAKSrOkHnCR8ymqJtMM5Uu0XVJWoKDqLN8upQYnIV
 vzMwNmb+H/oIe9vCNou+yA/JoVzn+hJvVvL/Ki6ySaVZNEcaFJz9VN5VekElDudCdz+U
 LQW6FxlinaVNvby3VoclxPtkVtVk+M72tY9Hjp0ZgFd8m0avJWY7r+IiO23Fs2LTSJOm
 WiyK7RrJcUHkjrTLr9rUSDmaBxU4YH/YPGqB3gGVaAFqfxztJLdFPelX2qbGFRAh8YXQ
 sBp8mJR7wToAuD7fUnq/dVZMq658HTYWmcheqXQx+ukhmxZPg4AHPlxFWVtUR+q20TCt
 YEsg==
X-Gm-Message-State: AOAM532mP2pe8LqTHGm6Eci9bzgU80MvvHBRMdXt6thLVxJiP47K6Z5Q
 LxPgmJQxjWEG2+3PNvTSFhjcRI8/3TJ1Gutu+y6DDA==
X-Received: by 2002:aa7:d809:: with SMTP id v9mr13242739edq.146.1626424375856; 
 Fri, 16 Jul 2021 01:32:55 -0700 (PDT)
MIME-Version: 1.0
References: <SY4PR01MB6798FDE7B97E478254D6B955F6139@SY4PR01MB6798.ausprd01.prod.outlook.com>
In-Reply-To: <SY4PR01MB6798FDE7B97E478254D6B955F6139@SY4PR01MB6798.ausprd01.prod.outlook.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 16 Jul 2021 09:32:15 +0100
Message-ID: <CAFEAcA97bUkyHL+=LuToYgG-HWgppfbBc=BqO=BdboSWfF=Kcg@mail.gmail.com>
Subject: Re: [PATCH] hw/intc/arm_gicv3: Fix GICv3 redistributor security
 checking
To: Tianrui Wei <tianrui-wei@outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x536.google.com
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
Cc: Sergey Fedorov <sergey.fedorov@linaro.org>,
 QEMU Trivial <qemu-trivial@nongnu.org>,
 Shlomo Pongratz <shlomo.pongratz@huawei.com>,
 Jonathan Balkind <jbalkind@ucsb.edu>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 Shannon Zhao <shannon.zhao@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4kEd//lM2tuw

On Wed, 14 Jul 2021 at 20:46, Tianrui Wei <tianrui-wei@outlook.com> wrote:
>
> For redistributor to send sgi, we must test NSACR bits in secure mode.
> However, current implementation inverts the security check, wrongly
> skipping this it when the CPU is in secure state, and only carrying out
> the check when the CPU is not secure or security is not implemented.
> This patch corrects this problem by correcting the inversion of CPU
> secure state checking. It has been tested to work with Linux version 5.11
> in both aarch64 and arm version of qemu.
>
> According to =E2=80=9CArm Generic Interrupt Controller Architecture
> Specification GIC architecture version 3 and version 4,=E2=80=9D p. 930, =
2008.
> Chapter 12, page 530, when there is only one security state implemented,
> GICD.CTLR.DS is always 0, thus checking NSACR in non-secure state. When
> cpu is in secure state, ns =3D 0, thus the NSACR check is never performed=
.
>
> Signed-off-by: Tianrui Wei <tianrui-wei@outlook.com>
> Signed-off-by: Jonathan Balkind <jbalkind@ucsb.edu>
> Tested-by: Tianrui Wei <tianrui-wei@outlook.com>
> ---
>  hw/intc/arm_gicv3_redist.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/intc/arm_gicv3_redist.c b/hw/intc/arm_gicv3_redist.c
> index 53da703ed8..84cfcfd18f 100644
> --- a/hw/intc/arm_gicv3_redist.c
> +++ b/hw/intc/arm_gicv3_redist.c
> @@ -564,7 +564,7 @@ void gicv3_redist_send_sgi(GICv3CPUState *cs, int grp=
, int irq, bool ns)
>          return;
>      }
>
> -    if (ns && !(cs->gic->gicd_ctlr & GICD_CTLR_DS)) {
> +    if (!ns && !(cs->gic->gicd_ctlr & GICD_CTLR_DS)) {
>          /* If security is enabled we must test the NSACR bits */
>          int nsaccess =3D gicr_ns_access(cs, irq);

So, before this change:
 * if the access to ICC_SGI[01]R_EL1 attempting to kick off this SGI
   is done in Secure state, we allow it
 * if the GIC has security disabled (GICD_CTLR.DS is 1), we allow it
 * if the access is from NonSecure and the GIC does not have security
   disabled, we check the NSACR bits to see if we should allow it

With this change, we check the NSACR bits for accesses from Secure
state, and we don't check them for accesses from NonSecure.
This doesn't seem to me to match what the spec requires: in version
IHI0069G of the GICv3 spec, section 12.1.10, the tables show that
only accesses from NonSecure are subject to NSACR checks. (This makes
intuitive sense: the GICR_NSACR is the NonSecure Access Control
Register and it is controls NonSecure accesses, not Secure accesses.)

What bug are you trying to fix with this patch ?

thanks
-- PMM
