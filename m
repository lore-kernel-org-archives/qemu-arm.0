Received: by 2002:a17:504:7fd7:b0:1be9:327d:8ee3 with SMTP id hj23csp933179njc;
        Fri, 9 Aug 2024 09:05:34 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVz8F1YyGB1yOIPL6dARMH837hz1rm7KFiaup/SK5nNlsTKaC+QnhhpXpsysXJVnb+scDLD9s1RXqVX1Ii3I3QGSOBBJOvF
X-Google-Smtp-Source: AGHT+IGyeYX/GKFooKcEFN5aHu1Xo0bcTAqDPgUQz9iGKNYiBakvvBWY+wwcH1V96XsV5SrxwKSN
X-Received: by 2002:a05:6102:5487:b0:493:b1e1:9dd4 with SMTP id ada2fe7eead31-495c76f4478mr4087046137.4.1723219534528;
        Fri, 09 Aug 2024 09:05:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1723219534; cv=none;
        d=google.com; s=arc-20160816;
        b=JJ6QVAAyIFkxZW0zO6H50uNZRHgieqxLUl+0Wt8bdvQvGUk2Jm4/W83+9QMT+896fV
         DhiSai658cV3kbayFyEvQVoufMnoqzCdbspUOAgOp9iF03u7q2A4nZUhu+WE5dPSxNjE
         e+eX48oYW5nU+8NJQhm+E9pHLvyGyqtHh3p8Wk3RawzajYPoy4WlnakrCZQFUGAZmflQ
         fDOjFdBILAHJfbnfTgWIAWd4TkC4gKFDfjpIrFC0Ef8x8W5tLJojPXaKEaXdtVdtwcv6
         ffI3wV7Vk+tHZIZD9JCCoGJZvMB2IYQj6I7hF2uiLHlcQVIAlER8YS/Im84gnfZGl2aQ
         eUlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=6V3dVlNNQOB+bbjpB/NlZwsZDkGp55ceS7gvHvrMkjg=;
        fh=Ipx6keqCeQmB8+an3EloduDy52/7qT2w0SH6aDvHf5w=;
        b=EjvqRISfgtkrCy99R92X0Vc2qPRRnYjDPhTUTPOQYhbdLQEL9PtDRlMZCBKtLGq9wt
         6UNsmob7846bTo87gqMBs+5y4jskiVJdkfRMpCCOTh7ItE2+oOgdKy6j4zHze2i0GOS1
         1fpA6bVCqVdnyZACBNliGCnqZGG3dKiYllio8Bhuu9q3+/LYgmPIavFVbhCltOFaddks
         ICkUcDPVZxBERjo3Dznqy9/9yEwKZraMujvNlstiUlF47kyTr19dAJYdJFqUZN9ptWAf
         jvA4kqwD9G/S2yxodbHnXjDjxQq8E+zZYvpJYRDcQ9qXFhvlwOcdiEhoxdxuwrNWJNxJ
         Ylmg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rhOT1uXF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-496aad70078si152090137.734.2024.08.09.09.05.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 09 Aug 2024 09:05:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rhOT1uXF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1scS6y-0004MJ-8M; Fri, 09 Aug 2024 12:05:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1scS6i-0004I0-NC
 for qemu-arm@nongnu.org; Fri, 09 Aug 2024 12:04:52 -0400
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1scS6W-0005vY-MS
 for qemu-arm@nongnu.org; Fri, 09 Aug 2024 12:04:43 -0400
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-2ef2cb7d562so22079021fa.3
 for <qemu-arm@nongnu.org>; Fri, 09 Aug 2024 09:04:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1723219473; x=1723824273; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=6V3dVlNNQOB+bbjpB/NlZwsZDkGp55ceS7gvHvrMkjg=;
 b=rhOT1uXFFuNf0x0LP5z/ErJGHsGWJ1/L0wwHMEDr1lx/sMSv7+bCSWYsIMOZCQAlIb
 wVQqKWEfxoe2g3JTgpf21QCZZinKMwlI/s1uLgY4PdiEG818LgrGykYpJaBVF6QTCV4O
 3mphMjZCihVPROVxbLrg2SVDI2XWFVG8HDttmxK1LquIV4nlPWJ6QYW83YY+ywZFe80N
 SdTTOrg7ws3ERnpJThgnKbgBA5HOUR+YEomWROAVhyvE1o+Vp0YyWaPrGxGw31Rb2uig
 5eKX/ZH0+3U5m3NHLRI8sOI/loN2gCgoASsUggXih4eZ2JGkUR3SkT8TqaiLRa5i6T+d
 y5ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723219473; x=1723824273;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6V3dVlNNQOB+bbjpB/NlZwsZDkGp55ceS7gvHvrMkjg=;
 b=TT/qAA1woMJylAfYPClpDLbiraGI9lErlrekwDdH2FpV2TAx4KmHZs8HjJnAocbhzL
 QDBG0tYKK3xAYxkvt6cq7dzcWyXQIRNQVshYB+zL2R0yhNxuRuylGILfjDe/kixbXzXg
 CIjCWPM5TYFYVMXgw0rChJCHw4TypEOpGlHuhBZe3pSOp38V8cmv4BjVDfSO8XerWR/G
 Gx3hpVZ+rNiHvTuNCqVXSYh2/5M2FRnUNPZiBcw3FKUtTXiJr/HYswZZXi3145aeivju
 Uzy39f/kxIqfzBebXK7UUM4DTxKiFx8sby9QzMuUXm02MbhWD8w51hgTlFQZf9SRHDud
 cMOA==
X-Gm-Message-State: AOJu0YzIhDuyNu9BRzOaN2YwSpU/1OotVdUxAtp4aZbp9nKJbbRm4cay
 l2nXLEzYsEVBU1eEUIWjx63uLl9/FMveNOtmf0JWsusjGAMQcLuhSBwmBCjOY+aUuJc5ZsAkwJ5
 9
X-Received: by 2002:a2e:a549:0:b0:2ef:24a0:c176 with SMTP id
 38308e7fff4ca-2f1a6c6cc9bmr19680931fa.28.1723219472227; 
 Fri, 09 Aug 2024 09:04:32 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-429059714d5sm135171295e9.13.2024.08.09.09.04.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Aug 2024 09:04:31 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: qemu-stable@nongnu.org,
	Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH 0/2] target/arm: Fix EL3-is-AArch32 mmu indexes
Date: Fri,  9 Aug 2024 17:04:28 +0100
Message-Id: <20240809160430.1144805-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::22e;
 envelope-from=peter.maydell@linaro.org; helo=mail-lj1-x22e.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: qcgRyMoO+mHu

Our current usage of MMU indexes when EL3 is AArch32 is confused.
Architecturally, when EL3 is AArch32, all Secure code runs under the
Secure PL1&0 translation regime:
 * code at EL3, which might be Mon, or SVC, or any of the
   other privileged modes (PL1)
 * code at EL0 (Secure PL0)

This is different from when EL3 is AArch64, in which case EL3 is its
own translation regime, and EL1 and EL0 (whether AArch32 or AArch64)
have their own regime.

We claimed to be mapping Secure PL1 to our ARMMMUIdx_EL3, but didn't
do anything special about Secure PL0, which meant it used the same
ARMMMUIdx_EL10_0 that NonSecure PL0 does.  This resulted in a bug
where arm_sctlr() incorrectly picked the NonSecure SCTLR as the
controlling register when in Secure PL0, which meant we were
spuriously generating alignment faults because we were looking at the
wrong SCTLR control bits.

The use of ARMMMUIdx_EL3 for Secure PL1 also resulted in the bug that
we wouldn't honour the PAN bit for Secure PL1, because there's no
equivalent _PAN mmu index for it.

We could fix this in one of two ways:
 * The most straightforward is to add new MMU indexes EL30_0,
   EL30_3, EL30_3_PAN to correspond to "Secure PL1&0 at PL0",
   "Secure PL1&0 at PL1", and "Secure PL1&0 at PL1 with PAN".
   This matches how we use indexes for the AArch64 regimes, and
   preserves propirties like being able to determine the privilege
   level from an MMU index without any other information. However
   it would add two MMU indexes (we can share one with ARMMMUIdx_EL3),
   and we are already using 14 of the 16 the core TLB code permits.

 * The more complicated approach is the one we take here. We use
   the same MMU indexes (E10_0, E10_1, E10_1_PAN) for Secure PL1&0
   than we do for NonSecure PL1&0. This saves on MMU indexes, but
   means we need to check in some places whether we're in the
   Secure PL1&0 regime or not before we interpret an MMU index.

Patch 1 cleans up an out of date comment about MMU index
usage; patch 2 is the actual bug fix.

This fixes the bug with the repro case in the bug report, and it
also passes "make check", but I don't have a huge range of
Secure AArch32 test images to test with. I guess it ought to go
into 9.1 as a bugfix, but the nature of the patch means it's
not very easy to be confident it doesn't introduce any new bugs...

Bernhard: I suspect this is the same bug you reported a few months
back in this thread:
https://lore.kernel.org/qemu-devel/C875173E-4B5B-4F71-8CF4-4325F7AB7629@gmail.com/
 -- if you're able to test that this patchset fixes your test
case as well, that would be great.

thanks
-- PMM

Peter Maydell (2):
  target/arm: Update translation regime comment for new features
  target/arm: Fix usage of MMU indexes when EL3 is AArch32

 target/arm/cpu.h               | 50 ++++++++++++++++++++++------------
 target/arm/internals.h         | 27 +++++++++++++++---
 target/arm/tcg/translate.h     |  2 ++
 target/arm/helper.c            | 34 +++++++++++++++--------
 target/arm/ptw.c               |  6 +++-
 target/arm/tcg/hflags.c        |  4 +++
 target/arm/tcg/translate-a64.c |  2 +-
 target/arm/tcg/translate.c     |  9 +++---
 8 files changed, 95 insertions(+), 39 deletions(-)

-- 
2.34.1

