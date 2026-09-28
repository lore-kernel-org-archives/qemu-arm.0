Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 608EBC9833E
	for <qemu-arm@archiver.kernel.org>; Mon, 28 Sep 2026 10:32:01 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xB8e8-0003D1-Hh; Mon, 28 Sep 2026 06:31:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xB8e5-0003CR-9p
 for qemu-arm@nongnu.org; Mon, 28 Sep 2026 06:31:41 -0400
Received: from mail-yx2-x10.google.com ([2607:f8b0:4864:41::10])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xB8e3-0003mI-Qo
 for qemu-arm@nongnu.org; Mon, 28 Sep 2026 06:31:41 -0400
Received: by mail-yx2-x10.google.com with SMTP id
 956f58d0204a3-66e4ab22370so2225023d50.3
 for <qemu-arm@nongnu.org>; Mon, 28 Sep 2026 03:31:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790591498; cv=none;
 d=google.com; s=arc-20260327;
 b=LisgljHX47ao6Fw7h0904lQvHiyTzGLCXTbpg/A88J6nBGmdNdM8HdqvPmjeceRCjl
 g4Z8ENmkLzsZ20sdsBbCGI/A0tPDzheWoHrDJnk9OgbqvZ9zFZz6HbiUW6WMZVmDlggN
 j1XL5u1DbOx/xAXcEy9Bl3qVCI1uXGKQHJdtuazwIrTMvBDJ8Gay+Nz5nV+PO7wg9Qsq
 bGG52h2O4Hv8zcrvXNRHNqH4YBmvL4fC+eVNMyIaXlc8tgAqKeSS2s2vcTG/9uTvVIdf
 YjG46KJVZLzvkFunJKV0kXCpAdY1fgQ7/TNuCnAh0gglQ9D5crG2y5JY7ovz94oFZWvE
 rHiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=gnuREIVueZm1km43ArMVBgd0Gydm3JAV+Uovq0UdlpE=;
 fh=L3X3yWHG8gTdxcRrENKcTvD9mGtYkW/Lm1W6+Ckj7jQ=;
 b=sqVyIWVec+S83FHBTzt6+YLZSERJK/Iyt6HjxLTPbcz0UjfLCI3aNRqwDRFMZHnS8m
 nQn+fwfcnLrRus00ZhVrUbaDwIUi2hAbuHG4p48AurxRY7bwKkPWBJ7uRFn+uVWLEjhm
 1eR8ncAaqAqyfUF3X+98X4S29oj8JmpAwKoAYPAslbvOFhavTgbqLY4GcnSahrK3X1/X
 AWLkj0YXzd9IiF/q+QwcqxN6dig9Ett6hotZpk61voKZ4kKcX2+sEOYQHtS2u6CNFetx
 bkyvBUB6MtFFIQ7moGoWl8DXW5h6gHpUUeuvOOGlD1d7sErOtppt9RAsa7DzhM0Vm5sP
 6dxw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1790591498; x=1791196298; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=gnuREIVueZm1km43ArMVBgd0Gydm3JAV+Uovq0UdlpE=;
 b=VrKbBKipVOnOOkDoEfvuQjBOcVqXUM+NauI2IukEO4uXk8CHNH7V81KMYyysryUXEk
 KBjW+yqjypuRYoe0Itdw71ubDzUMu+yRIKdhRlLgJht9lazC3XDf7UllybgzBIPdUEUa
 oCbAqJpQGv1tHpMIJKlAZumFEqOINyBQkgNK5SzQpnHyKa+0y5DH1OPQ90Cm/ZSn4IH7
 9S8JmAoz8bpGaUBtm+WXlEirCko6TgcrASNpVQ3EWmhQUhQflKtKt6fzd6mc7XvriJFY
 /2SWwLLhwhXk8SgXC2ZwNqnaookmuDlT2kBTRrWSqq2ejhMqbRqlJFtLZl1gKKge20PL
 im9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790591498; x=1791196298;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=gnuREIVueZm1km43ArMVBgd0Gydm3JAV+Uovq0UdlpE=;
 b=TLCW7YJAH/OkswZq0LyWsO0bD/7hKTf9yn2cInSmVokR+Yc4cqJF8bWrlopj+7bgF9
 cssJFCoXLCr2StrmOjHbmaGCrVmPPmp7O89v+xVn6pDtfNzg1NsM1sHcZI0+ZePjPPtR
 TRnJh7zwbOROfOkwGl3A6oA9zb1sa5dqFJqMO+g1oYA4jABxR+LepjAwPz0LCr0eE49P
 96HGEsgZ8odRUvylnVy8sZl1pXV0AhfPNKA2lbYzZO5rOrQiXfuzL//EjPe2psmuhaIG
 54TfqCq+V4aQoe9kSKHcOuFClk1dBmKmS39fVdLdNBhbK4pXkDqaHLju4+YQzqaL4TDQ
 JiXg==
X-Forwarded-Encrypted: i=1;
 AKwUvBxrxkRESPjcKd8DdbkirV2K1ByodtMsY2YrhDr9B0qtNQpb4bgDm3EgT/luVok75qWeslMdEZx7jQ==@nongnu.org
X-Gm-Message-State: AFq9FYJahDTLWHRAV2A2nN7DCVN78BXtQG6mRzwAa3l5qIJL8XjWMrhT
 pWAO3SdZUs/ZEopWHesaDFwYbNSWJI7liW8MpX6irkR1qUsN1LcdoyU/RVlOGlKcaOGbu7/kyBu
 U8g0UixErwD0IncVp06vQXhHF45SlB9Bi1GBvT2yAgjQdV7PfONQm
X-Gm-Gg: AYBFou3i0Vw/lWGi2zHESct9hzpKoeOnWOi61rlbSPKF8jtArWBn7Z10j8BKMVm2XA4
 FURydVXiQkvfxxpJ61/O/mAee92eynLL7bgKLQQz9D85eki/hh1WdoZ7CuOoHdf1/KCrHwXZmku
 UWmLahv2sGUjP7J0xHcM2hrZPKTo6MwP156nAEyGC3+onmXURUfdwKJvKPWdfmcT0b4v+6Tq0lA
 hxKmyj2ZpInOXUj68JOU+iMtb/knHP4PXOzKFjsRU5Vayw0cLBjYqfTeUsKWm3U3dzXmZlAG+oa
 +3E2s5CACqAMGckJjOVM2Ngf/vJppo3bEAcCIH/Dj49sfB+ZPGBy0rDn3Bc3q6qp42NVBrwL5gs
 z51R/exo6vZ3NbXTPw566L4BYwK1eWhTNCe43way9a9kpK/SUqw==
X-Received: by 2002:a05:690e:1442:b0:674:13ed:9c3c with SMTP id
 956f58d0204a3-67413ed9fb9mr2656554d50.95.1790591498069; Mon, 28 Sep 2026
 03:31:38 -0700 (PDT)
MIME-Version: 1.0
References: <20260828222639.1432046-1-richard.henderson@linaro.org>
 <20260828222639.1432046-12-richard.henderson@linaro.org>
 <CAFEAcA-9BWhLf2AagEcnacxMYKPYGKC=iKKoGRvPg4BW0PtbaA@mail.gmail.com>
 <ebd4f4af-b958-4d76-a671-6927fbea1d70@linaro.org>
In-Reply-To: <ebd4f4af-b958-4d76-a671-6927fbea1d70@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 28 Sep 2026 11:31:26 +0100
X-Gm-Features: AclHuK_QAFRqtR_5gjUQlzL8gNAoGs758FWsgf7ccPyY_A733fSDi9UFXpy3w3g
Message-ID: <CAFEAcA-D=7CzzF4RQgYgJwF04rrYTYHiLfcnORuMnUT6AQkVxg@mail.gmail.com>
Subject: Re: [PATCH 11/13] target/arm: Add PSTATE.UINJ to tbflags
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:41::10;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx2-x10.google.com
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

On Fri, 25 Sept 2026 at 17:34, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 9/8/26 04:08, Peter Maydell wrote:
> > On Fri, 28 Aug 2026 at 23:27, Richard Henderson
> > <richard.henderson@linaro.org> wrote:
> >>
> >> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> >
> >> diff --git a/target/arm/tcg/hflags.c b/target/arm/tcg/hflags.c
> >> index 296ec8101ab..174f4aa746f 100644
> >> --- a/target/arm/tcg/hflags.c
> >> +++ b/target/arm/tcg/hflags.c
> >> @@ -292,6 +292,9 @@ static CPUARMTBFlags rebuild_hflags_a32(CPUARMState *env, int fp_el,
> >>       if (env->uncached_cpsr & CPSR_IL) {
> >>           DP_TBFLAG_ANY(flags, PSTATE__IL, 1);
> >>       }
> >> +    if (env->pstate & PSTATE_UINJ) {
> >> +        DP_TBFLAG_ANY(flags, PSTATE__UINJ, 1);
> >> +    }
> >>
> >>       /*
> >>        * The SME exception we are testing for is raised via
> >> @@ -513,6 +516,9 @@ static CPUARMTBFlags rebuild_hflags_a64(CPUARMState *env, int el, int fp_el,
> >>       if (env->pstate & PSTATE_IL) {
> >>           DP_TBFLAG_ANY(flags, PSTATE__IL, 1);
> >>       }
> >> +    if (env->pstate & PSTATE_UINJ) {
> >> +        DP_TBFLAG_ANY(flags, PSTATE__UINJ, 1);
> >> +    }
> >>
> >>       if (arm_fgt_active(env, el)) {
> >>           DP_TBFLAG_ANY(flags, FGT_ACTIVE, 1);
> >
> > Could we do this just once in rebuild_hflags_common() rather than
> > duplicating it in _a32 and _a64 ?
> _common is also used with _m32.

env->pstate & PSTATE_UINJ should never be set on an M-profile CPU,
so it should also be OK to do the check in _common if we want, right?

-- PMM

