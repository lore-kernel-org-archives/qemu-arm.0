Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1A17C87FCA
	for <qemu-arm@archiver.kernel.org>; Fri,  1 Aug 2025 19:45:00 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uhvgO-0001Ch-Ub; Fri, 01 Aug 2025 15:44:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uhu9S-0000pi-Nm
 for qemu-arm@nongnu.org; Fri, 01 Aug 2025 14:06:42 -0400
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uhu9Q-0002Lz-Gm
 for qemu-arm@nongnu.org; Fri, 01 Aug 2025 14:06:42 -0400
Received: by mail-yw1-x1133.google.com with SMTP id
 00721157ae682-71b737ec362so9466357b3.0
 for <qemu-arm@nongnu.org>; Fri, 01 Aug 2025 11:06:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754071599; x=1754676399; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=CvmaC4XQKpqGDFUWg+/EJ0SFGXbPB6hYDMLmdbA+MGw=;
 b=Fh7j3ljg44BivufscuWpIAps88o6rYUNzP7Iv7GZKTtsvBZ719Q+b7s4cEdJbPLcVC
 JUt9K1i3K65mPEvwsJkaHhjrMvfjvS2jtSoei8mydk6WiyiyYnsfUNkmHjKrIl8mDQ6Y
 yhJm9esQbVBkB2w6QgaWbhaKmE79WJogzuJK0iibT+0Pzwl4W5ahluowBQBcQAHMweFW
 7eT2qP/lJmRVNty6qwOLoNoe6pgqCB1uGPR2DF4UHNbRIRWRlTWbKkXjxgDEoTmt9/i7
 v1GdrK9LG0BYy7ym9ypu7Qc2URD9rkQPlRl9OR2L/f6tzWcUXhMxyS54dv6rLuYAJ+y8
 0efg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754071599; x=1754676399;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CvmaC4XQKpqGDFUWg+/EJ0SFGXbPB6hYDMLmdbA+MGw=;
 b=TbxNPoV8M9UoNNophgvkq6bxtTleKYgsqfXN4qaOg+FoSEoKkVy3lhhI9J9UKVdM77
 ijhLDAfnEMx8z5MrE715cfABUXAZuPYvODUZOh+s9CK7PSR8O3qdvP3n1HSYpPzM4jTn
 SMqId7gp7GrSYGG3LznPrpphja6XrKuODjW0t0wR6pgsI9RWsMNeyl6S4qz7nwyrH060
 yMV7knoeAGUdYya5wtKOrDLx8L8AFJWehg8R/iOSRd5yIPHUbDAOF3YFhzQmw9b/jQgI
 ANF49U9ZKpBiv6m2NicKywdBDndm6TIevQatavVlB4ek5vKZTFo+fDE4Etb3vy8QQhQm
 Cq+w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUS3km0dcCrL5NAevjmctEED5cRa51r5uZYX+tAAp3zrcKHAIg0+ItdSfZAVsy7gz7xXwzfJF8udQ==@nongnu.org
X-Gm-Message-State: AOJu0YyL/EfP8/kEx431EI5Bt1CjvK+1zSZo4bbe3M+OruFtib7VJ4Z7
 B5qHU2MijyFbVflnZQcvXSEShmPPeVYR74OjLh86DF3gPGZwHbbNyHhSA3OOvkfdfxURcmp/oqk
 Bfsr+KGE93xAT6srhBQaUFg1+ku1nkxyHrdusuQPjwg==
X-Gm-Gg: ASbGncvRazJdQr6/f+vLaiO70r9zcpN/kl4MxK+uD+z6SxpdJVBX9J2snge3NMpw+uM
 9luqBM83riwodF1eoEeTd911Xup+EkggWMdgv1KQg9A8gRvpk+Ez5X062bbk3KGT60D8EcmHuvM
 PAuA+f2LNaNkJ4xaCm7tsI5dpCL4m3J6dyKAgRDRLb3rHnEYnuLSZNUdHRCWGilbQ5jOqA+ZDil
 61VLD/4YQmexaF1K/Y=
X-Google-Smtp-Source: AGHT+IHO2d5uuv6wbLsNM5EVO8eSLzn4fKdRPJSCp7C8E1uwXW72C71a6X18kpe8arBI6AlQXi/JU+Ay9lrjaK+sGA8=
X-Received: by 2002:a05:690c:6802:b0:71a:23b3:13af with SMTP id
 00721157ae682-71b7ef57a09mr9667387b3.13.1754071599004; Fri, 01 Aug 2025
 11:06:39 -0700 (PDT)
MIME-Version: 1.0
References: <20250727080254.83840-1-richard.henderson@linaro.org>
 <20250727080254.83840-38-richard.henderson@linaro.org>
 <0128c452-8bde-4bdd-b73c-330a7bd619a1@linaro.org>
 <e275dc71-2d48-4b48-9b7f-dae2c8934d64@linaro.org>
In-Reply-To: <e275dc71-2d48-4b48-9b7f-dae2c8934d64@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 1 Aug 2025 19:06:24 +0100
X-Gm-Features: Ac12FXxdGMGjJsFFiZ2jTuvGmdPN0N7YJcXl_iIZArAv4vvdEi5xc566xiYQ8Ww
Message-ID: <CAFEAcA_b0dwepMFpSaY31fCUd749mpU5M2ZVymonPPBAEsTLpA@mail.gmail.com>
Subject: Re: [PATCH 37/82] target/arm: Convert regime_is_user from switch to
 table
To: Richard Henderson <richard.henderson@linaro.org>
Cc: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1133;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1133.google.com
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

On Fri, 1 Aug 2025 at 04:54, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 7/31/25 07:21, Pierrick Bouvier wrote:
> >>   #include "mmuidx-internal.h"
> >> -#define EL(X)  ((X << R_MMUIDXINFO_EL_SHIFT) | R_MMUIDXINFO_ELVALID_MASK)
> >> +#define EL(X)  ((X << R_MMUIDXINFO_EL_SHIFT) | R_MMUIDXINFO_ELVALID_MASK | \
> >> +                ((X == 0) << R_MMUIDXINFO_USER_SHIFT))
> >>   #define REL(X) ((X << R_MMUIDXINFO_REL_SHIFT) | R_MMUIDXINFO_RELVALID_MASK)
> >>   #define R2     R_MMUIDXINFO_2RANGES_MASK
> >>   #define PAN    R_MMUIDXINFO_PAN_MASK
> >> +#define USER   R_MMUIDXINFO_USER_MASK
> >>   const uint32_t arm_mmuidx_table[ARM_MMU_IDX_M + 8] = {
> >>       /*
> >> @@ -33,7 +35,7 @@ const uint32_t arm_mmuidx_table[ARM_MMU_IDX_M + 8] = {
> >>       [ARMMMUIdx_Stage2_S]        = REL(2),
> >>       [ARMMMUIdx_Stage2]          = REL(2),
> >> -    [ARMMMUIdx_Stage1_E0]       = REL(1) | R2,
> >> +    [ARMMMUIdx_Stage1_E0]       = REL(1) | R2 | USER,
> >>       [ARMMMUIdx_Stage1_E1]       = REL(1) | R2,
> >>       [ARMMMUIdx_Stage1_E1_PAN]   = REL(1) | R2 | PAN,
> >
> > Maybe I missed something, but what about other entries that were initially treated in the
> > switch?
> > - ARMMMUIdx_E.0_0
> > - ARMMMUIdx_M*User
>
> See the change to EL().
>
> I'm not sure why ARMMMUIdx_Stage1_* is excluded from arm_mmu_idx_to_el(), but I don't
> change that in this patch series.

It's always been that way through various refactorings
of the mmu index, back to commit c1e3781090b9d36 when
the function was added.

In practice we only use arm_mmu_idx_to_el() to get back to
the EL from the MMU index that we put into the TB flags.
So we know it's always one of the "complete translation"
index values, not a Stage1-only, Stage2-only or Phys index.

My guess is I originally put in the assert that enforced
that you don't call it with either a Stage2-only or a
Stage1-only mmuidx because I knew that couldn't happen and
it meant I could implement the idx-to-EL code for the
valid cases as "mmu_idx & 3" and didn't need to add
extra code to handle a Stage1-only index the function
would never see.

thanks
-- PMM

