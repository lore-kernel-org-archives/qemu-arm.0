Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp5084372wrp;
        Tue, 17 Sep 2019 03:57:17 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxcqlqKr56R9f7vh0NzD7P6rEbog6hs5ZNfABfXzz55Sgzj12LY/nIyY0Mk/95QNv8mpaR7
X-Received: by 2002:a17:906:7798:: with SMTP id s24mr4151274ejm.211.1568717837034;
        Tue, 17 Sep 2019 03:57:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1568717837; cv=none;
        d=google.com; s=arc-20160816;
        b=AhRU1+C6Rk4MS9ncbrVOKm66WCGOwxn3EEp5NFI31XYKdsIe1u+mFM02060Z3gqnqc
         h1zSdf2Aa7AIz6QlDp861eJABykp9rxGUFC2u6BCmmvYohFPSWSg0Vf7pX4kHJC4dCYB
         eNUDK6KPzo96t6ijQJAnvzdgH3fGkQV80cdMwXtWRBy3J5rTjtnL5HNkC0dUXDuosQDR
         +fyM0oH4cBafo3qpyWw9CZvWXiKR3p4hfF3LWbWt3IqRW2pFwnHb5YSKu21jbc5J9+jT
         ALLlq8DdFc6SgBcoB2Q7dqlM6GhSOJ+4MZLqpn1PTABpcTWHcFgjBRX/lx5w7+rhHTs2
         rVeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Lvaj2hnZt+ar6Y5yxpTurTxL2haiZLli/lN4YWHVGQE=;
        b=rr5nYw5mvqVYjZeCFvA11w6HS6BmRYmYeG9eVejc/WRii3267ZB9VpXXiutahohj4Q
         SOwF1Ix/lwlbUjErXQzoYriswj67qblBLw46bG5zkBW0c6kizO5MmW22wqS5T3v+AeE4
         Zik12YH0Aj0QeE3lexsl0JJpBN6CmrDBV9OeDHK8JXi5WouH5q1hBPH/qLjanIxuAmBI
         +kTFP51nBorHaNp7bxJqfean7IjOZqg0LfH2GVA98zS3W8AAVtQibdIA5HueCWjhgvhG
         8urbFqg5vC++JgQqLfCDrMZGc71zNdVSMGONhPEvdl6MwiEwOfIDGFIRhZzkLiC7VAEL
         GfsQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=cqkYbBtp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g17si881742ejd.123.2019.09.17.03.57.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 17 Sep 2019 03:57:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=cqkYbBtp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iABAZ-0006YN-UF
	for alex.bennee@linaro.org; Tue, 17 Sep 2019 06:57:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50817)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iAB9g-0005rb-1P
 for qemu-arm@nongnu.org; Tue, 17 Sep 2019 06:56:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iAB9d-0001OY-OQ
 for qemu-arm@nongnu.org; Tue, 17 Sep 2019 06:56:19 -0400
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:43517)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iAB9b-0001Ll-3r
 for qemu-arm@nongnu.org; Tue, 17 Sep 2019 06:56:16 -0400
Received: by mail-ot1-x343.google.com with SMTP id b2so2596302otq.10
 for <qemu-arm@nongnu.org>; Tue, 17 Sep 2019 03:56:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Lvaj2hnZt+ar6Y5yxpTurTxL2haiZLli/lN4YWHVGQE=;
 b=cqkYbBtpxsoJ4E5zpnjgG1KHc8zzDl0f92IDKgvY0vcjSU3zu/pKUa/IL85CqbbkPa
 7Aow9AKDZMGdolgMS7S4Ry2gKQ69WeKcS/iL20pm6k5TtUyiXdaMICPtjMgG5OrHG8vy
 yRL/sehr2RjfLeAlvRQ5UaLqOe17oSiOCOgnJUrQlPejAAKcRmPYm4TzeFwLXEpbiGhw
 CWx9F21uW3yZNod88vB+Q5floxWCpgD9CxosHsVgQXmPhmMGuhOPzhDxN6k6nNcp2R/e
 2a+l4DaPPPemEgp5/bWHduPXV1Jg0RsJjrsAez5DAzIXTzMvwRy6pbB49RVAMD6U0MaD
 5Oxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Lvaj2hnZt+ar6Y5yxpTurTxL2haiZLli/lN4YWHVGQE=;
 b=slDJciuZ8Xr+9cHJ5KlAX7sI4ILNnccO1qIDktgwD7PBFZicLxvCIbYHwly7i5xQfh
 2zI2eL8lkbjsHMhZJkPlvaCgxS4ZsaswqbvVn4yABOFSLkjonxSNL+H1j7YizLb2zlIi
 S68yi+rf79ZgRifOm5rcSIkXnxoorp/VWehmXftLsGd/c6hFxaEXVohaMgUPvB5lqbX3
 922IJiiU2G9bgBEG4AhaYbkBIM4jK8cFgBS1B7W7Pdof5yuc5/3JLPciwrm/nMywzo96
 beUbpoWz8ucfzbkV5DBASZ3rFIgWhWl+Fn1vLpSkujwEEio235YPuf6fbBrVbeBjGqlz
 FItA==
X-Gm-Message-State: APjAAAUyJy3fs0RXpS+LNhqhsaIQ8HSWio5OyDdq43M9EFY8+zQfspxp
 mgd0MzDi6mjU7EY9sqklXdB4HVS4Yg8DRv2Ku5kUoFcGDjs=
X-Received: by 2002:a9d:6a8a:: with SMTP id l10mr1951585otq.97.1568717772553; 
 Tue, 17 Sep 2019 03:56:12 -0700 (PDT)
MIME-Version: 1.0
References: <20190912110103.1417887-1-luc.michel@greensocs.com>
 <CAFEAcA-WO=O5zwRDQoNz2zT4sx61j8Jy5px0uFPiWgF_JUpa+A@mail.gmail.com>
 <204007b1-1c1e-432b-399f-b3784f812710@greensocs.com>
 <c3a22836-0435-e09b-6fe0-eff85124c0ca@greensocs.com>
In-Reply-To: <c3a22836-0435-e09b-6fe0-eff85124c0ca@greensocs.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 17 Sep 2019 11:56:01 +0100
Message-ID: <CAFEAcA8b1XUpwq-NefVL+BD0bNfDu6Rhxygbb3mfyV1t17NZUQ@mail.gmail.com>
To: Luc Michel <luc.michel@greensocs.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::343
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
X-TUID: khAx5pFz4JHV

On Tue, 17 Sep 2019 at 09:43, Luc Michel <luc.michel@greensocs.com> wrote:
>
> On 9/13/19 9:26 AM, Luc Michel wrote:
> > Hi Peter,
> >
> > On 9/12/19 6:03 PM, Peter Maydell wrote:
> >> I think we need to check through the TRMs to confirm which CPUs use
> >> which format for the CBAR, and have a different feature bit for the
> >> newer format/sysreg encoding, so we can provide the right sysregs for
> >> the right cores.
> > I checked all the AArch64 Cortex's TRMs, for those having a PERIPHBASE
> > signal and CBAR register (namely Cortex-A53, 57, 72, 73), they all match
> > the mapping I put in this patch, so I think we don't need to split the
> > CBAR feature further. I believe more recent Cortex's address the GIC
> > using coprocessor registers, and CBAR does not exist in those ones.
>
> Hi Peter,
>
> Do you want me to re-roll this patch with some modifications?

No, that's OK. Thanks for checking the TRMs. I think what I'll
do is squash in this comment to the patch:

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 755aa18a2dc..bc1130d989d 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -6733,6 +6733,19 @@ void register_cp_regs_for_features(ARMCPU *cpu)
     }

     if (arm_feature(env, ARM_FEATURE_CBAR)) {
+        /*
+         * CBAR is IMPDEF, but common on Arm Cortex-A implementations.
+         * There are two flavours:
+         *  (1) older 32-bit only cores have a simple 32-bit CBAR
+         *  (2) 64-bit cores have a 64-bit CBAR visible to AArch64, plus a
+         *      32-bit register visible to AArch32 at a different encoding
+         *      to the "flavour 1" register and with the bits rearranged to
+         *      be able to squash a 64-bit address into the 32-bit view.
+         * We distinguish the two via the ARM_FEATURE_AARCH64 flag, but
+         * in future if we support AArch32-only configs of some of the
+         * AArch64 cores we might need to add a specific feature flag
+         * to indicate cores with "flavour 2" CBAR.
+         */
         if (arm_feature(env, ARM_FEATURE_AARCH64)) {
             /* 32 bit view is [31:18] 0...0 [43:32]. */
             uint32_t cbar32 = (extract64(cpu->reset_cbar, 18, 14) << 18)


and apply it to target-arm.next, if that's OK with you.

thanks
-- PMM
