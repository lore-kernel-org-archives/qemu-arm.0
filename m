Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F30DCC83F26
	for <qemu-arm@archiver.kernel.org>; Fri, 25 Jul 2025 09:19:18 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ufEa1-0007XV-Ty; Fri, 25 Jul 2025 05:19:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ufEa0-0007V8-9T
 for qemu-arm@nongnu.org; Fri, 25 Jul 2025 05:19:04 -0400
Received: from mail-yb1-xb31.google.com ([2607:f8b0:4864:20::b31])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ufEZy-0000Vl-7R
 for qemu-arm@nongnu.org; Fri, 25 Jul 2025 05:19:04 -0400
Received: by mail-yb1-xb31.google.com with SMTP id
 3f1490d57ef6-e8bd3fbd9f7so1568606276.3
 for <qemu-arm@nongnu.org>; Fri, 25 Jul 2025 02:19:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1753435140; x=1754039940; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=J9nFLBb7yNtVSXyuiWlQpZx4fdmgsTg2BI1WsQru/4k=;
 b=V5GkcfWZL6UCEkF3PwD8++jGVRuzIR1aU+0sgeoCBhpjdM+Iz/8xvoA1QhTK7kDkbE
 nnV07keR6Ucsn04gYAWD3TW2Nnw2aS3HU2j8VA3+z1YQh7+/6Oz2pOaXXzXn14Dso2VI
 QtXUgzBa6McbhNuIQ2rISAVnYwcK0Xv3do2Z0T6FUEMIyqKTBsR8fPxiH9ivCF26u30j
 vVirx9Dh7FLXv+pLL+pTVgT+xCG2DFDmqnzjn4XrhZ26AMNl8mWaqR0oMKBDJzGi9KwI
 AbnfbSuqWI/a+XUx/hzyGNoQf0xwDlSgI7joybG4+2NfKW0rWj97S/BT+Uz1Nq6SMZd8
 +KZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753435140; x=1754039940;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=J9nFLBb7yNtVSXyuiWlQpZx4fdmgsTg2BI1WsQru/4k=;
 b=QDPKoFKUlSWBnGfSFM7n0wUCLniKP4dRJ2ZRYzA4tS8T+xmEnCRqrQIVS/bc2gg198
 8Gw/nAasaOqoDCRSSY+KNP1gaPoqVAyK3UGRemdiuD8vTqJGGaC4wqjGW2HZl1B408Mz
 iFqx4ACYtmKj/6uIgLO6Wm4VqEcL5pJ0vqu1LnKdBjx4sYTCyxqcpI/2SuTabDF97jAH
 99QjImNRIjN/1JrKsqbrDUtkY5+RoXRvYrNl005CfsxfmrjDOHqg3MHssl29UQgtinyt
 MIR7nwKnvSfIDTKmEN3dQLh2Q91Gu/ZGWqLbXHn47tuqMoixtDdtp5uhQmvSRkmaPmxC
 C4Lg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW+Qqt397JaPkcqWCAB/uHJOD4P03Qa5jCx7w6lFtCr1vlFhQXXtVMtgC0alRoMv0ru4mw/FKWn5g==@nongnu.org
X-Gm-Message-State: AOJu0Yzha+Z357CJh9J1o24XzfqJX+wlYuBmEQcDaxeNXsDsK6gbEfN0
 LIPlmjowewarIC7jvXjgZ7FJoyp2hepCk2taY9U/kKtbScypLQXD/cKxGuze2j3y+4QLLDiPQWE
 o22i3WIM2FrkM8Sfc2ptSCPIRFTBfWkZsLkE/4Q8bnA==
X-Gm-Gg: ASbGnctsANGFu9tM1oUHb51kO1bvpUcWk6JoD/mfSEcuBpr45+oOKh14PZeidlbyagO
 eI2Uqq1NXhKoWNlRVqLXxVqpbMLcxj1Z7g/NEqy8oA46EEAZfqR0R8eStKM06YnaS6l7AHzDB91
 ER8EP3R2JUYT4jql0bPpfRVGVayFplwqE1ScKd/Vy13PihAUUoiCHfsyEjekabkpDimPTouskKk
 jq3wQ0a
X-Google-Smtp-Source: AGHT+IG0vTEzifkHK+90bRvTaTQr4aa2jfdS5nKO71C15Pgp+bVY7N+7jL39J6TOOnfYpH//T2EDmuwA3uuo0o7xkbw=
X-Received: by 2002:a05:690c:9a09:b0:719:e179:b508 with SMTP id
 00721157ae682-719e39a0ec9mr14025287b3.39.1753435140148; Fri, 25 Jul 2025
 02:19:00 -0700 (PDT)
MIME-Version: 1.0
References: <20250725000901.1204536-1-alexrichardson@google.com>
In-Reply-To: <20250725000901.1204536-1-alexrichardson@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 25 Jul 2025 10:18:48 +0100
X-Gm-Features: Ac12FXyylrH9mZJmkGth1DcptNKIDXxKPzb_XcRylv7XT0k5ZJXc3hacGL1Bahw
Message-ID: <CAFEAcA-T+fBvN=jZS7C3H7feD4N8uufy98_PhdS=eA9EHw8CRg@mail.gmail.com>
Subject: Re: [PATCH v2] target/arm: add support for 64-bit PMCCNTR in AArch32
 mode
To: Alex Richardson <alexrichardson@google.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b31;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb31.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Fri, 25 Jul 2025 at 01:10, Alex Richardson <alexrichardson@google.com> wrote:
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
> ARM_CP_NO_GDB to avoid generating an invalid GDB XML.

This is the wrong way around, I think. We should prefer to expose
to GDB the 64-bit view of it, not the 32-bit view, because
it's more comprehensive. Compare handling of the "PAR" definition
in target/arm/helper.c.

>
> See https://developer.arm.com/documentation/ddi0601/2024-06/AArch32-Registers/PMCCNTR--Performance-Monitors-Cycle-Count-Register?lang=en
>
> Signed-off-by: Alex Richardson <alexrichardson@google.com>
> ---

It would have been helpful to mention here what the changes
from v1 were -- I had to go and look up the list archives to
remind myself of why we had to drop v1.

>  target/arm/cpregs-pmu.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/target/arm/cpregs-pmu.c b/target/arm/cpregs-pmu.c
> index 0f295b1376..ef176e4045 100644
> --- a/target/arm/cpregs-pmu.c
> +++ b/target/arm/cpregs-pmu.c
> @@ -1276,6 +1276,12 @@ void define_pm_cpregs(ARMCPU *cpu)
>                .access = PL0_R, .accessfn = pmreg_access, .type = ARM_CP_CONST,
>                .fgt = FGT_PMCEIDN_EL0,
>                .resetvalue = cpu->pmceid1 },
> +            { .name = "PMCCNTR", .state = ARM_CP_STATE_AA32,
> +              .cp = 15, .crm = 9, .opc1 = 0,
> +              .access = PL0_RW, .accessfn = pmreg_access_ccntr, .resetvalue = 0,
> +              .type = ARM_CP_ALIAS | ARM_CP_IO | ARM_CP_64BIT | ARM_CP_NO_GDB,
> +              .fgt = FGT_PMCCNTR_EL0, .readfn = pmccntr_read,
> +              .writefn = pmccntr_write,  },
>          };
>          define_arm_cp_regs(cpu, v8_pm_reginfo);
>      }
> --
> 2.50.1.470.g6ba607880d-goog

thanks
-- PMM

