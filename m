Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 094D6C87FCC
	for <qemu-arm@archiver.kernel.org>; Thu, 31 Jul 2025 17:00:05 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uhWdA-0000Li-T3; Thu, 31 Jul 2025 12:59:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uhVbP-0006pB-1A
 for qemu-arm@nongnu.org; Thu, 31 Jul 2025 11:53:55 -0400
Received: from mail-yw1-x112c.google.com ([2607:f8b0:4864:20::112c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uhVbN-0000i8-5M
 for qemu-arm@nongnu.org; Thu, 31 Jul 2025 11:53:54 -0400
Received: by mail-yw1-x112c.google.com with SMTP id
 00721157ae682-71a3a341fe9so5387467b3.3
 for <qemu-arm@nongnu.org>; Thu, 31 Jul 2025 08:53:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1753977232; x=1754582032; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=MHpTrJTNzo7HG29mOEamfx85lbWpbI9V1O1CNxWJ9oA=;
 b=HQs83tA9XzFvTYGiIcZXnRDY4RS9TwWhW/joaToqDONKGw7fF8yG/LjaNlJyd6j6nL
 dQmO/GCD6gfuInpv7xYdGrjOQJVNpxj9fsQ/qWlY4xTOWvXScFeooZ0kmMJaUxvNypjD
 ic8FdFVE0+1Lb6vupEWlXiZH/pLGZGs4AShv2QCvVxM3tE0UyKEpV7t5XxIxVFkXhIt0
 JbMOEo+KL/fKSZ60UWK+dKfKUTlKxuEcwKNzhdB7rLn5KJtTm9EUrir+emf25O9UTXsi
 PaDYAWpDpCdj5xpAy01o84Yn49nuwLehPLd487KUceDCL/8+yiFHXvVM1kq6Ajlyj4u7
 c2MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753977232; x=1754582032;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MHpTrJTNzo7HG29mOEamfx85lbWpbI9V1O1CNxWJ9oA=;
 b=fxOMiMh56qhZHQ/MArM4eF6NVsuwB8bSTejtDhkcGYfrSqDzNKBV63KZfYBORLeBXE
 gaU+fptHMD6PqFg2NjENtJs+6+OIIIhZptCddiviToSoLmJvuCBQI7McEeMXJLOe27Ff
 eI1yjCE+WLJwNYDm21Jk13CsPOjmfZJw6XCoExV5GXo5RLNsHS3G0rsX0iLCoxjtQPZr
 NIdSntYMDmjXYc4T8/jOJEA8inDSXR+k2fXidNI7hapQLsVsVA7dm+MZhNUSCHikFTyD
 Ot1rleWeCkuxtm3GI64ZjGk1kBtMOc6MKKFfTNItRYadfluu6SbLBdrmJGXZnmiPP4jM
 Daqw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW7dHoxRjBPQVSyotPLTd2Lt8O/fOOZW24FrecYLssoG2SUClsp6PDwQi4E21LDL8xja0wQAxu/fA==@nongnu.org
X-Gm-Message-State: AOJu0Yz3bx854TIhrQJ5p/fLbFjzySn/VAn4taDfjv/XgQkKi/KbQN2C
 X0sNGOhGdDsihPbMW7g0jyMTSmQcBEuuCrmzl5r7l2Q4aC6rEdO9JtwPgXMp4Z3LQF4XAdDGPqW
 MAQ8px57sIHT3AivvxsstoDZzc+XN9irQpfddUG0aMg==
X-Gm-Gg: ASbGncuv5OeBHtBryk7/rzrVYXxBEjTMv0Z2RAd+zDpSHONVTud+ArEeYN3YJm1cXb6
 mWiU1bgsJV9JjBz0y1i4XIuY0R0m9jxdqRoktLPlyFf2UaNoBc9orX5X2iEqxMYVdlQpo91wVSY
 HgvluuqAHeJe2k+ajlP/DB3B7c5VzUl5fPVHALUAW6M1t+Kemc954SDjOoQuHczmJT/zGTjnxKw
 QAd6/tL
X-Google-Smtp-Source: AGHT+IHbvQip19oLivCPiMTxNYdC6/8OmalMeQJqe8CXzQcKedWm5R8J24ktQNlhiib+qQPxWc8hfSE/RY7aTOcphwU=
X-Received: by 2002:a05:690c:85:b0:71b:4739:9d67 with SMTP id
 00721157ae682-71b4739bbffmr72786167b3.4.1753977231709; Thu, 31 Jul 2025
 08:53:51 -0700 (PDT)
MIME-Version: 1.0
References: <20250725170136.145116-1-alexrichardson@google.com>
In-Reply-To: <20250725170136.145116-1-alexrichardson@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 31 Jul 2025 16:53:40 +0100
X-Gm-Features: Ac12FXyoD8-2Ybyvoewapl9ttyUs4lzuDiQWHdooaPnzkerMisfmeJ7acFIh7VA
Message-ID: <CAFEAcA9_LB6T_+bkJhBnCAD5-9BT1MPHJf6q_ZOYfV9oDRFj+Q@mail.gmail.com>
Subject: Re: [PATCH v3] target/arm: add support for 64-bit PMCCNTR in AArch32
 mode
To: Alex Richardson <alexrichardson@google.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112c;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Fri, 25 Jul 2025 at 18:02, Alex Richardson <alexrichardson@google.com> wrote:
>
> In the PMUv3, a new AArch32 64-bit (MCRR/MRRC) accessor for the
> PMCCNTR was added. In QEMU we forgot to implement this, so only
> provide the 32-bit accessor. Since we have a 64-bit PMCCNTR
> sysreg for AArch64, adding the 64-bit AArch32 version is easy.
>
> We add the PMCCNTR to the v8_cp_reginfo because PMUv3 was added
> in the ARMv8 architecture. This is consistent with how we
> handle the existing PMCCNTR support, where we always implement
> it for all v7 CPUs. This is arguably something we should
> clean up so it is gated on ARM_FEATURE_PMU and/or an ID
> register check for the relevant PMU version, but we should
> do that as its own tidyup rather than being inconsistent between
> this PMCCNTR accessor and the others.
>
> Since the register name is the same as the 32-bit PMCCNTR, we set
> ARM_CP_NO_GDB on the 32-bit one to avoid generating an invalid GDB XML.
>
> See https://developer.arm.com/documentation/ddi0601/2024-06/AArch32-Registers/PMCCNTR--Performance-Monitors-Cycle-Count-Register?lang=en
>
> Change v2->v3:
> - Moved ARM_CP_NO_GDB to the 32-bit register if Armv8 is supported
>
> Changes v1->v2:
> - Moved to new file
> - Updated commit message
> - Added ARM_CP_NO_GDB
>
> Signed-off-by: Alex Richardson <alexrichardson@google.com>

Thanks for this patch; I added the following comment tweaks
and have applied it to target-arm.next for 10.1 (and marked
for potential backports to stable branches):

--- a/target/arm/cpregs-pmu.c
+++ b/target/arm/cpregs-pmu.c
@@ -1206,7 +1206,11 @@ void define_pm_cpregs(ARMCPU *cpu)
         define_one_arm_cp_reg(cpu, &pmcr);
         define_one_arm_cp_reg(cpu, &pmcr64);
         define_arm_cp_regs(cpu, v7_pm_reginfo);
-        /* When Armv8 is supported, PMCCNTR aliases the new 64-bit version */
+        /*
+         * 32-bit AArch32 PMCCNTR. We don't expose this to GDB if the
+         * new-in-v8 PMUv3 64-bit AArch32 PMCCNTR register is implemented
+         * (as that will provide the GDB user's view of "PMCCNTR").
+         */
         ARMCPRegInfo pmccntr = {
             .name = "PMCCNTR",
             .cp = 15, .crn = 9, .crm = 13, .opc1 = 0, .opc2 = 0,
@@ -1284,6 +1288,7 @@ void define_pm_cpregs(ARMCPU *cpu)
               .access = PL0_R, .accessfn = pmreg_access, .type = ARM_CP_CONST,
               .fgt = FGT_PMCEIDN_EL0,
               .resetvalue = cpu->pmceid1 },
+            /* AArch32 64-bit PMCCNTR view: added in PMUv3 with Armv8 */
             { .name = "PMCCNTR", .state = ARM_CP_STATE_AA32,
               .cp = 15, .crm = 9, .opc1 = 0,
               .access = PL0_RW, .accessfn = pmreg_access_ccntr,
.resetvalue = 0,

thanks
-- PMM

