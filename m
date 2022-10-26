Received: by 2002:a17:906:43c7:b0:78d:9f02:16a1 with SMTP id j7csp228151ejn;
        Tue, 25 Oct 2022 21:29:58 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5UJm3V9mrgKylPN/+Px3StWLuYGfYkluwE6jIP0xp8UTc7S+ejtZ8ZYc0Z6Kg5ApxlL3/f
X-Received: by 2002:a0c:e512:0:b0:4bb:95ea:d6d with SMTP id l18-20020a0ce512000000b004bb95ea0d6dmr679166qvm.72.1666758598196;
        Tue, 25 Oct 2022 21:29:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1666758598; cv=none;
        d=google.com; s=arc-20160816;
        b=NSh/EWFrsSongsAvnwJWpcP8YlRyIPEK3VcJgcMlLrs7tANXjIt4ks+r1qvsjNaqlW
         Zzy+NykBCcoMpMl8pWfPZNhVDT44ZaOhejjCgxvBD7qoz4pa2jQN88zxJ5UePm0mGI5N
         a7a7bphAQQ4hFVqtTxEz9jhRkSo/D+D18qXqoRjv4oIN9HQkJL6fkEqEA2MAdxcs4I5h
         +hSkcse1VkFIHaeGc6JFpeC2JXUNr4Z5hNyad9TBC0MSrD4G0CZ5zL2hz28NmGNev/Oj
         WVTsMPy3tP4l8QE79ZnkYPDyuR1MTSFmkVd1eQ5wBQaX6/S7nsz0uS51dtlmaFRFYUCJ
         w1pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=errors-to:sender:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:organization:references:in-reply-to:message-id:subject
         :cc:to:from:date:dkim-signature;
        bh=2pgQP0a/gRY0cJ0SZtVUnE8S9Iqbc5aW4G6RT+YsAGs=;
        b=kBO7Ob6x1kCnlAxUs+HjpEyBgF4m/7PzEeJtV8uyz0rlcbL0Ipdim9qLAn+RcdLnbi
         6FDiW3/mM4fYGc1BXj+1j6L4rTX09RGsLmgJ88A9jsCSWEBFb1kOZGpiO1K9HD5o8rWn
         K7HncF0lyL4WRvehPzlT6bSmyjklVbrP21WCC8q7Hew0g+J6zMaRVS6yiyKLg1MtaAFe
         WuAkoiZ6lNcZArcVZxK+rqv8PqjweIcn9UPAnPJ7o98CFVBm6bze+GghLeoANl0cw1HC
         Bm/iNmEMpKu6C1GVBUIzn3AcWkrhC8qe0sPhC3aV8pmRDQ6m7PUCHcfkO1prphAmTPK7
         UogA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@igel-co-jp.20210112.gappssmtp.com header.s=20210112 header.b="AK7/pOGv";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 8-20020a0562140dc800b004af671e3b9asi3187051qvt.287.2022.10.25.21.29.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Oct 2022 21:29:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@igel-co-jp.20210112.gappssmtp.com header.s=20210112 header.b="AK7/pOGv";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onY0d-0004SV-Qr; Wed, 26 Oct 2022 00:27:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ake@igel.co.jp>) id 1onY0b-0004Rv-Hn
 for qemu-devel@nongnu.org; Wed, 26 Oct 2022 00:27:17 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ake@igel.co.jp>) id 1onY0Z-0003SF-8z
 for qemu-devel@nongnu.org; Wed, 26 Oct 2022 00:27:17 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 m14-20020a17090a3f8e00b00212dab39bcdso1351594pjc.0
 for <qemu-devel@nongnu.org>; Tue, 25 Oct 2022 21:27:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=igel-co-jp.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:organization:references
 :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=2pgQP0a/gRY0cJ0SZtVUnE8S9Iqbc5aW4G6RT+YsAGs=;
 b=AK7/pOGvXgndJhaCliwxnar743uKZktqKe8VP69egv7R6RSKMb2HcwjWKS2OAV9BBa
 mgUlwS9Z8xQCHQAP3Gi+vuA2bP9HVQ5J5XQkVS6DFNcJZtHkmXe5pd4LltlVNexIrcKo
 XpgAucbVsNh3HICyZG98wMD6XWjz+6OtkmwiJ/mRBkZ2Lgc9g8Qq7FHC4Ejf9fDf+++K
 zLQJM93T9WgDyj9KLGZQxj9MlGSrZ5w1m98n42uvXXqh0q+L/iYEAibmCpgA9VjKMDJC
 wY1njV3fPX1BH5zM/sPm7GKt3pjLmEvYGEx1lc/bENqiN/gLRghR6V3WOyB27inT9fKv
 Z8jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:organization:references
 :in-reply-to:message-id:subject:cc:to:from:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=2pgQP0a/gRY0cJ0SZtVUnE8S9Iqbc5aW4G6RT+YsAGs=;
 b=qq65WqwDxVn+sZOfYLBuGKL1B+gfmc7l9PbiVg1Ixk5nmnnE2Vv5yvYFL2CWctO8on
 fkZC5f62LqXIaI+9f/pN3a2xHjKbIXkuexwsedoRQoTn4O+c/JGzGrM7dd2pjtyEt2qz
 T8e2GMFlsrt2nSu0oJ1llBD7VX01Jtvc5yskmFSFwgLGsCtduzG40Tf0GCroVX0bMdTP
 2woqEK44KzW1HLdbmzYz2uP38XZ+FhetWBqzwRZNqB6sOXWJ79rYghkBXIn/p3J9CELD
 HOvfJP6gPc6a8Wy2Oy8HMwDQjxCdncnM3CraKlqJGwKWEr5f0HV74NjtFnfKqGOG7OJT
 2X9A==
X-Gm-Message-State: ACrzQf1G10WRktqfNeKwnbQDoQnsQoh3DoJ1bqKGv6fj6WZ9jMMNEity
 K0AInsnOHg/pm8AL2ZvMuxeCEA==
X-Received: by 2002:a17:902:f60a:b0:186:5d06:8da4 with SMTP id
 n10-20020a170902f60a00b001865d068da4mr35895637plg.106.1666758432810; 
 Tue, 25 Oct 2022 21:27:12 -0700 (PDT)
Received: from ake-x260 (napt.igel.co.jp. [219.106.231.132])
 by smtp.gmail.com with ESMTPSA id
 t2-20020a170902e84200b00176dc67df44sm1967402plg.132.2022.10.25.21.27.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Oct 2022 21:27:12 -0700 (PDT)
Date: Wed, 26 Oct 2022 13:27:06 +0900
From: ake <ake@igel.co.jp>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH] target/arm: honor HCR_E2H for AT S1E2R and AT S1E2W
 address translation
Message-ID: <20221026132706.6e1c0a67@ake-x260>
In-Reply-To: <CAFEAcA_E5P2+ybnhH05DNsb_LuKjROU9-NKke46x+_LO7zr-qw@mail.gmail.com>
References: <20221017093003.547009-1-ake@igel.co.jp>
 <CAFEAcA_E5P2+ybnhH05DNsb_LuKjROU9-NKke46x+_LO7zr-qw@mail.gmail.com>
Organization: igel
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=ake@igel.co.jp; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: x+7GXmFJTDEn

On Tue, 25 Oct 2022 13:25:22 +0100
Peter Maydell <peter.maydell@linaro.org> wrote:

> On Mon, 17 Oct 2022 at 10:30, Ake Koomsin <ake@igel.co.jp> wrote:
> >
> > When HCR_E2H is set, AT S1E2R and AT S1E2W should translate an
> > address based on both TTBR0_EL2 and TTBR1_EL2.
> >
> > Signed-off-by: Ake Koomsin <ake@igel.co.jp>
> > ---
> >  target/arm/helper.c | 7 ++++++-
> >  1 file changed, 6 insertions(+), 1 deletion(-)
> >
> > diff --git a/target/arm/helper.c b/target/arm/helper.c
> > index dde64a487a..147f96e752 100644
> > --- a/target/arm/helper.c
> > +++ b/target/arm/helper.c
> > @@ -3486,7 +3486,12 @@ static void ats_write64(CPUARMState *env,
> > const ARMCPRegInfo *ri, }
> >              break;
> >          case 4: /* AT S1E2R, AT S1E2W */
> > -            mmu_idx = ARMMMUIdx_E2;
> > +            if (arm_hcr_el2_eff(env) & HCR_E2H) {
> > +                mmu_idx = env->pstate & PSTATE_PAN ?
> > +                    ARMMMUIdx_E20_2_PAN : ARMMMUIdx_E20_2;
> > +            } else {
> > +                mmu_idx = ARMMMUIdx_E2;
> > +            }
> >              break;
> 
> I agree that the AT insns should be handling E2H, but I'm not sure
> this is the right fix, and with Richard's recent refactorings I've
> kind of lost track of what all our MMUIdxes do.
> 
> In the pseudocode, E2H is handled by changing the behaviour not
> just of the S1E2 ops, but also of the S1E1 ops. If E2H is set:
>  * the S1E2 ops use the EL2&0 regime, but continue to ignore
>    PSTATE.PAN
>  * the S1E1 ops also use the EL2&0 regime, with the S1E1RP and
>    S1E1WP ops looking at PSTATE.PAN and the others not
> 
> Richard -- do we want to just do the same thing, or do
> our MMUIdx uses differ from the architectural translation
> regimes in a way that means we need to do something else?
> 
> thanks
> -- PMM

I will re-read the AT instruction pseudocode and will come back with a
better fix. It might take a while as I am not familiar with the code
base. Thank you very much for comments.

---
Ake Koomsin
