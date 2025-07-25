Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 689F8C87FCE
	for <qemu-arm@archiver.kernel.org>; Fri, 25 Jul 2025 17:03:49 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ufLp5-0004po-61; Fri, 25 Jul 2025 13:03:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexrichardson@google.com>)
 id 1ufLni-0002Eu-UC
 for qemu-arm@nongnu.org; Fri, 25 Jul 2025 13:01:44 -0400
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alexrichardson@google.com>)
 id 1ufLng-0002ur-NZ
 for qemu-arm@nongnu.org; Fri, 25 Jul 2025 13:01:42 -0400
Received: by mail-pg1-x52a.google.com with SMTP id
 41be03b00d2f7-b31f0ef5f7aso1420118a12.3
 for <qemu-arm@nongnu.org>; Fri, 25 Jul 2025 10:01:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1753462898; x=1754067698; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=czidO6Am4Z96jlZFx+HNmUy9fnaLQamiQGCCwR8yFWk=;
 b=heFtRuBij2pf1O5WvlXd4aR+Bzz4Lc1XsLf8uQS2d5/FMDtLypfX1uAMg30J+rkCIN
 Q4awKi3IjzAsytn2kMvsjuWiXP4HJm4+hlmF0R77RMPLuek2jPsUETnDw8kl0BvoFWm4
 LQpHpWRj7VlvYnsb0mZQQletSqunawL3ynn4mjcFWeUl4FV3LcB+XwRC6BfJsmHo22av
 henVafucu4quds7RarVQqX1JbCh/jteU0JmUO705N+FlLE/YPp7Nfo4i8Y0iOb9O45yX
 WdOsTTCIag4Q5lAH1HYyyDlYpox1MokUJWAZPE0edYnTxVbsKrp88KTIZuE04JcVFOuZ
 pVUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753462898; x=1754067698;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=czidO6Am4Z96jlZFx+HNmUy9fnaLQamiQGCCwR8yFWk=;
 b=Oc9f50xhunUilyR19ZDdYqA60Ld7Z43fLAbcLt4AJPX22KDT8dAo2dAQc5ciig/Fim
 0PjrXBID2MokLTCELs0QZ56bBEOqn9wyxCJ3ZkjV8N7NRbJqjsoRoVZB5NoLnIUdwVCk
 ZlYiT7tXL1+zGCQL5RoZ6ir+t0bxbIRq8eQ0U1eqDG264XWlLO/qSrN9n7VhIMw29qvr
 +VZ14yVw8aps8WHnLBLQA9hjCbeTGmqhX0/vh0/slXUUYuu0No5imdrmOu1j6TBNJtot
 m4/S3fLOFbYo7N6jtIGSyi/K8q6ib7YADqni8Ys+AmhOd42filFp/IOenunqSeCE5gvq
 kEIw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVkfVeg6GqgMG5qU6n1hHWufqSDzwZPdXpA1ApWFkqSY5HwCh3c73fB8/rgTzisJriDXoSi2fnivg==@nongnu.org
X-Gm-Message-State: AOJu0YxG7uMZIlq/10/h//1Qyi+ezNr+H1G6ds3+mS4DZwATJctkqPgg
 ASKNcK0mb2PLrcAWyUjaVuMe8iByBd0mVnxMAZ5/ESD1VpIlwHUX363x+Ktj2Huemct05TDhXgK
 0X95d2WG0632p/D2QUrgXzM7ynAlV50dwa4MX7NKM
X-Gm-Gg: ASbGnctfpD31Q+mj+wDlnWEkQEYMry0lbAE4/u88JA9dWVKBIR5vXwp/zNdxNGyOg6t
 DjdX4Js2AzH4mI08drFCShpL0UX9p2McCaYuMx5iH/Ys4GONuBfNeac4iDQBPCuOzTrMhFzkLnh
 5/3KVq3BtIfW386y8ni0qb7Ya6u2V+xwQqtGFnf1Fvg3bjztiJyCaTavku1piBTe1vT8sX1c/bJ
 gsPYXApmyIKnfIZfB8P7WMP+8wY4/1rIyhK8rQb8k+dQehzsw4=
X-Google-Smtp-Source: AGHT+IH39YOW32t7kZX2YfZzOYpQja4jIi3ovtMlAS4tYBI1urk3Q0yArskXoAS4WzWA1+CRQJacRbw10C2aETGIJPY=
X-Received: by 2002:a17:90b:53cb:b0:312:1ac5:c7c7 with SMTP id
 98e67ed59e1d1-31e77a0a59bmr3854367a91.2.1753462897579; Fri, 25 Jul 2025
 10:01:37 -0700 (PDT)
MIME-Version: 1.0
References: <20250725000901.1204536-1-alexrichardson@google.com>
 <CAFEAcA-T+fBvN=jZS7C3H7feD4N8uufy98_PhdS=eA9EHw8CRg@mail.gmail.com>
In-Reply-To: <CAFEAcA-T+fBvN=jZS7C3H7feD4N8uufy98_PhdS=eA9EHw8CRg@mail.gmail.com>
From: Alex Richardson <alexrichardson@google.com>
Date: Fri, 25 Jul 2025 10:01:26 -0700
X-Gm-Features: Ac12FXxiQCpxFZR-0O0F-XTWrBB0hGpOl8KI1UGt-fUH5VV8YudV0kWAxpaK91g
Message-ID: <CADXcZJtVOYVfiJxvSdUuu0zRU81Unvg2QE=d+deMfk5i58zq9w@mail.gmail.com>
Subject: Re: [PATCH v2] target/arm: add support for 64-bit PMCCNTR in AArch32
 mode
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=alexrichardson@google.com; helo=mail-pg1-x52a.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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

On Fri, 25 Jul 2025 at 02:19, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Fri, 25 Jul 2025 at 01:10, Alex Richardson <alexrichardson@google.com> wrote:
> >
> > In the PMUv3, a new AArch32 64-bit (MCRR/MRRC) accessor for the
> > PMCCNTR was added. In QEMU we forgot to implement this, so only
> > provide the 32-bit accessor. Since we have a 64-bit PMCCNTR
> > sysreg for AArch64, adding the 64-bit AArch32 version is easy.
> >
> > We add the PMCCNTR to the v8_cp_reginfo because PMUv3 was added
> > in the ARMv8 architecture. This is consistent with how we
> > handle the existing PMCCNTR support, where we always implement
> > it for all v7 CPUs. This is arguably something we should
> > clean up so it is gated on ARM_FEATURE_PMU and/or an ID
> > register check for the relevant PMU version, but we should
> > do that as its own tidyup rather than being inconsistent between
> > this PMCCNTR accessor and the others.
> >
> > Since the register name is the same as the 32-bit PMCCNTR, we set
> > ARM_CP_NO_GDB to avoid generating an invalid GDB XML.
>
> This is the wrong way around, I think. We should prefer to expose
> to GDB the 64-bit view of it, not the 32-bit view, because
> it's more comprehensive. Compare handling of the "PAR" definition
> in target/arm/helper.c.
>
Thanks for the reference to the existing code, will send out v3 shortly.

> >
> > See https://developer.arm.com/documentation/ddi0601/2024-06/AArch32-Registers/PMCCNTR--Performance-Monitors-Cycle-Count-Register?lang=en
> >
> > Signed-off-by: Alex Richardson <alexrichardson@google.com>
> > ---
>
> It would have been helpful to mention here what the changes
> from v1 were -- I had to go and look up the list archives to
> remind myself of why we had to drop v1.

Apologies, I usually contribute via code review systems that track
changes and am new to contributing to email-based workflows.

>
> >  target/arm/cpregs-pmu.c | 6 ++++++
> >  1 file changed, 6 insertions(+)
> >
> > diff --git a/target/arm/cpregs-pmu.c b/target/arm/cpregs-pmu.c
> > index 0f295b1376..ef176e4045 100644
> > --- a/target/arm/cpregs-pmu.c
> > +++ b/target/arm/cpregs-pmu.c
> > @@ -1276,6 +1276,12 @@ void define_pm_cpregs(ARMCPU *cpu)
> >                .access = PL0_R, .accessfn = pmreg_access, .type = ARM_CP_CONST,
> >                .fgt = FGT_PMCEIDN_EL0,
> >                .resetvalue = cpu->pmceid1 },
> > +            { .name = "PMCCNTR", .state = ARM_CP_STATE_AA32,
> > +              .cp = 15, .crm = 9, .opc1 = 0,
> > +              .access = PL0_RW, .accessfn = pmreg_access_ccntr, .resetvalue = 0,
> > +              .type = ARM_CP_ALIAS | ARM_CP_IO | ARM_CP_64BIT | ARM_CP_NO_GDB,
> > +              .fgt = FGT_PMCCNTR_EL0, .readfn = pmccntr_read,
> > +              .writefn = pmccntr_write,  },
> >          };
> >          define_arm_cp_regs(cpu, v8_pm_reginfo);
> >      }
> > --
> > 2.50.1.470.g6ba607880d-goog
>
> thanks
> -- PMM

