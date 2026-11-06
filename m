Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E2DD606A336
	for <qemu-arm@archiver.kernel.org>; Fri,  6 Nov 2026 10:19:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=nK5JYvw1
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xPH2e-0004xv-Aj; Fri, 06 Nov 2026 05:19:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xPH2c-0004xa-Hd
 for qemu-arm@nongnu.org; Fri, 06 Nov 2026 05:19:26 -0500
Received: from mail-yw1-x1130.google.com ([2607:f8b0:4864:20::1130])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xPH2X-0002bK-CN
 for qemu-arm@nongnu.org; Fri, 06 Nov 2026 05:19:26 -0500
Received: by mail-yw1-x1130.google.com with SMTP id
 00721157ae682-8b305e10ac7so3218667b3.0
 for <qemu-arm@nongnu.org>; Fri, 06 Nov 2026 02:19:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793960359; cv=none;
 d=google.com; s=arc-20260327;
 b=DumlKntbzsE07pDfL3nIIX41NiwivtrgXiiyiUgJcC8XcH21AaGSC+DpPS7dpOQKZh
 EjFCdbOjgMHV1QpTdJZ3fs2ETinuwT/T4F4CSVehw15Fzb4rLt8NRANwbZQvwTlGeUG2
 OmLD8/wayKiCQrhKog6ms9H2mc2f5dJMMHM8abT4PzgCp9GT1aRzIR5IyRBwLPOBgBqu
 FtI02xk4c1Pp1gCbyZJd2ax8Dbp0TpqqRwZnE5DUAUZGukJuxKSUFzqGFw/gL4c1N4/N
 4+vIeGw4BDfDQGGmZo3Pu4yYb8B1xhtmuTTPD6QMKGPwp5xYp6mKGcddkEmYMtZ491MH
 lzxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=nlu2dWdwzrxdba2QJHZKr8Paeql3bqrS8ARrcb0p8vA=;
 fh=9G0noipgXdbbmicazjeYRLBNo9NYzCAYIA0eFAGgylA=;
 b=Fc2N1wCqmGbfmOCOISsLYV6pE/r/ipzrxWMVoTxyvnpdXkQZBVpPz88knDQ1I4XG96
 9izWQoTSpF5CKG5tY+QU0nJYy1f2iXbJkIqOj7LvBrDJ35MIop1is1e5Qzrkuut7wcRv
 fXORjo2VVhOYQvywUP+uFVPwxqjbz6LuNEu1hynCN/T7fZPPegSU+3CNfqJ1pArI8t0C
 zXwz2+2kBBUV+gYaj8aFiLF8vQGer6jIMGyNVIAoymeKnWB6+GKeNb8T6Gh1ZbSK5h0C
 caxMJb/hP7aEdOvW7jmfvchGuVPzzHezpRBIHyWmLw/Rimm9dTywgnZO8+KeVCEsnCE5
 mUCw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1793960359; x=1794565159; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=nlu2dWdwzrxdba2QJHZKr8Paeql3bqrS8ARrcb0p8vA=;
 b=nK5JYvw1FMlfPydWKiNiod3Fp+pHa9EU/Z7DV2WOIMl+3KroUOfrp4nZ19f+OTIDZe
 iweIX41Ej+GvbftQNrcxoiyecBW0GMTysVx2Nu/qPJhb4EOYo4nhBD81PYiWGDhR67cy
 i3ZONdpPVvP9nj7Jg1WA59GamKp94SAD9gg7UpYfuyXFP197a5nMeRUTWEup3pAzupY3
 Z8LVexPoE//87SLCLaB/wbUakkQtjroQLA8d2Wyr5Wp1TfpWFNTQ9K8fbVw7IrwvL0LR
 J+Pzi3hsZj9BqjyZaUZKyjVOqqlEbRAZTNtz4vyzlGnfPCWRVTL3TZ/iTjJ2Z/9bnTfq
 C6aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793960359; x=1794565159;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=nlu2dWdwzrxdba2QJHZKr8Paeql3bqrS8ARrcb0p8vA=;
 b=EE3KrICKUeEiA9yOp3ANdMHtffIRfh94u9W8tserXUBW683WCYEkGd2YELDWmhk38b
 fneODweNrNB86kI0okn4oDsBbcVXJQxzYwrnVZSRLzcRUsGgpp5cc9ytv6vhZwIQ/717
 nupq6nW5f4KSqflGWRWrC8BDof+rEaVxIir6hy8oDke9dhpXMk8fWNvKNZoopkRFIWaU
 /0TL4FUnyXILprnEwwatSDKDSa5+7fq1+iOL9DKiY77ESwMLH0pOGKjquKz3K3xklvpG
 B25x1Yy2QdUkaeg8/56qgZCChhd4r3hE8IK06TGWjIuNOxMisALhRR7WBddncr7WkTfx
 l/Ew==
X-Forwarded-Encrypted: i=1;
 AL+hErGXK/5Pum9onN5U8RN6oTk5/2ZvzXDan1HilqpsgzdUnPGMOdObb6RNRIVOOkGj82+MVqUeIIqN7Q==@nongnu.org
X-Gm-Message-State: APuU4Z8kbo4K4ox2o5BgPVAVI5EkNoMtb9qjzPxuKDyTkm8qvm2SMBel
 OJU4mbLFW7iR3kKvtNl0H0c/O15lNiL2ebXd8qLyggo910zGbmKqB251+ed+m9KxOl5iVEnKa+T
 eHk4FedBwCsoF+ub8pZaHTuC17c8x1Kj9V12pHip9hg==
X-Gm-Gg: AYBFou1RV+wbv+eVXprFRwFEqDzZOqTBoAHW96JIBXIUsBp0uIk9EyLQFzCq2kr0C6m
 tXAscoabMvUgkjWRjBz6xh6C7ZlOINVNTtmP1ien23or/IqmbeANPGzBNlCHVQYVvk0QQO88+/C
 CSj581J73WwuE80oIZLfM7/FEq1joPwzrSiLdA1stBTUL0rcUFovxmDTAdNHL4UcqmyR+CKHnJi
 sUctldBmOXuO5nwCWJEFxCTJuMGFzC9HqQvcDKQuoU/n2VQDirbSVoCh4vKx9PY0nQaR0Kr6fUb
 xhRRFBIbWlw6yt2wAAsZYicKcyFlEjYmu/VV/OwjiUEZf7QSt21acx3wSTlqFXOYyvuYvza4soL
 IAbY5fmCcjYaYBEf903uhhh2Gl0/yLXgdLqRmIUldyl7x9KhI49biltsoRBXjLICWMRZCPGFnsk
 C8xaDYypwufkU/jEP6e/0r
X-Received: by 2002:a05:690c:f90:b0:8b3:25ea:62b9 with SMTP id
 00721157ae682-8b341b38e4amr13104007b3.61.1793960359238; Fri, 06 Nov 2026
 02:19:19 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261105-armv6-xn-check-v1-1-fbeff926e692@linaro.org>
 <CAFEAcA_qmyR0E3+n8GByA6=kDwDQomCpk399DEc8pOPr=sqEaQ@mail.gmail.com>
 <to2jr0.1wqw0hsi7q7wn@linaro.org>
In-Reply-To: <to2jr0.1wqw0hsi7q7wn@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 6 Nov 2026 10:19:07 +0000
X-Gm-Features: AclHuK__yclTGdRd-7fCZS5tj0iTK2TB7fmT1yydcFu4KaSm7q2djVA5cFLHdFc
Message-ID: <CAFEAcA93X=dQJx786hfENjXcwXVieRxEsv+eMA5_P1N62rQ78g@mail.gmail.com>
Subject: Re: [PATCH] target/arm/ptw: check XN for ARMv6 in get_S1prot()
To: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-stable@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1130;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1130.google.com
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
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-20.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, 6 Nov 2026 at 07:06, Manos Pitsidianakis
<manos.pitsidianakis@linaro.org> wrote:
>
> On Thu, 05 Nov 2026 20:53, Peter Maydell <peter.maydell@linaro.org> wrote:
> >On Thu, 5 Nov 2026 at 09:44, Manos Pitsidianakis
> ><manos.pitsidianakis@linaro.org> wrote:
> >>
> >> For the ARM_FEATURE_V6 case, it seems like we retrieve AP and XN bits in
> >> get_phys_addr_v6() but we don't check the XN bit in get_S1prot().
> >>
> >> Change the `if (arm_feature(env, ARM_FEATURE_V7))` check in get_S1prot()
> >> to `if (arm_feature(env, ARM_FEATURE_V6))` since v7 implies v6.
> >>
> >> Resolves: https://gitlab.com/qemu-project/qemu/-/work_items/4367
> >> Signed-off-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
> >
> >I think this is worth backporting, so:
> >
> >Cc: qemu-stable@nongnu.org
> >Fixes: d8e052b3876356 ("target-arm: get_phys_addr_lpae: more xn control")
> >
> >> ---
> >>  target/arm/ptw.c | 2 +-
> >>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/target/arm/ptw.c b/target/arm/ptw.c
> >> index 2e67d02493bd463cfd2d31ecf1316272ac3f1d99..b8b22b014e0574340a85abe73f3d9611d2360219 100644
> >> --- a/target/arm/ptw.c
> >> +++ b/target/arm/ptw.c
> >> @@ -1595,7 +1595,7 @@ static int get_S1prot(CPUARMState *env, ARMMMUIdx mmu_idx, bool is_aa64,
> >>          if (regime_has_2_ranges(mmu_idx) && !is_user) {
> >>              xn = pxn || (user_rw & PAGE_WRITE);
> >>          }
> >> -    } else if (arm_feature(env, ARM_FEATURE_V7)) {
> >> +    } else if (arm_feature(env, ARM_FEATURE_V6)) {
> >>          switch (regime_el(mmu_idx)) {
> >>          case 1:
> >>          case 3:
> >
> >Digging into the various versions of the Arm ARM and looking
> >at QEMU's code, I think that "allow this for v6" is correct,
> >but  I think that ARM_FEATURE_V6 will always be true here
> >so we don't need to explicitly check it. The two callers of
> >get_S1prot() are get_phys_addr_v6() and get_phys_addr_lpae().
> >If the CPU isn't v6 then it doesn't get those page table formats.
> >(get_phys_addr_v5() is simpler and just figures out its prot
> >bits directly rather than calling this.)
> >
> >So I think we can make this a plain "else", and delete the
> >existing "else" clause that sets xn and wxn to 0.
> >
> >(Strictly speaking it is possible to get here without V6, because
> >we don't enforce that a guest on a v5 CPU can't write to the
> >SCTLR.XP bit which should be RAZ there, and we don't ignore it in
> >get_phys_addr_nogpc(). But if the guest does do that then they're
> >in UNPREDICTABLE territory and whether we give them v6 VMSA with
> >XP or v6 VMSA without XP doesn't matter.)
>
> It sounds like this is equivalent to this patch. Do you want me to send
> a v2?

Yes, please, have v2 use a simple "else {...}".

-- PMM

