Received: by 2002:a17:504:5a03:b0:1be9:327d:8ee3 with SMTP id iw3csp181750njb;
        Thu, 30 Jan 2025 10:23:12 -0800 (PST)
X-Received: by 2002:a5d:47c9:0:b0:38b:da31:3e3c with SMTP id ffacd0b85a97d-38c5194c567mr6723764f8f.20.1738261392084;
        Thu, 30 Jan 2025 10:23:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738261392; cv=none;
        d=google.com; s=arc-20240605;
        b=lIrnkFnbhRdeyfte+5R/KiLx3FiWTlKBQiGR4WBHbwTY8toNMhXoh5Rakk+BCHeIj0
         sT8pdTZU5x5XfWhrJzm5cen3zW92Qu9lNLtN/lsJu0YPTtiWc/fQ0b8Ox7jULKRvJDOz
         NnRQSfBWU3Ex1YMn3Drk4/103G4r/5MSRBakZVZIZBKO6e5tyr/x1pgEByceozogjxG8
         DxiemURbWW8paRRm22rL31D1HWG415hwIYPe8tIlWbpkoXLC24shXcVtFWzkRCn/l5dP
         OamW8t4UnVjgC7DBfJCcGe0ElyzAwZPHJ+B/VxvTN3F1JzJdIrpNLLrei6Rhqqkw5ESE
         PMtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=LiTob6eVO3/nTRL2jXJ4ehBWxJYYOLR6mf/DNOwkNQk=;
        fh=RiJSNyFv98ecbYckNQx9NKP2dJchb+KjtIrNazRBKjc=;
        b=BDHNMRof/pjLmFhk9BeFJ89aDNiCnmHioyI8KsMnsn1gfYAet0Suj7wYYlR49uqIpd
         oiieHZxMJOmI+K2ScPgwgYiHQ0mKJdKovS4ORPVACYbHUpbCS7Gvb/HgZ9WwNtitmpg8
         +7VIqfGSLgL+ZgnToW1mQhhwZfP0kIb7Y55jxJyWhNtahClt5DYh5EZVfNeQco/scF2R
         7wG7REHwP9aF7w1O2FpuH/6S7KciNCvxoIA3xHz4ft4o/yixASN/25OmsMugF2ifmD6D
         IHiAi4CxzDCYeS7jdsWns1M3yACdDm9hYPKOcoYgFKBKxtsHDfiQC9IHxFqdqpFL2bkk
         Gk7w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CFRlb+RP;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-38c5c1e22d9sor812256f8f.8.2025.01.30.10.23.11
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 30 Jan 2025 10:23:12 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CFRlb+RP;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738261391; x=1738866191; darn=linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LiTob6eVO3/nTRL2jXJ4ehBWxJYYOLR6mf/DNOwkNQk=;
        b=CFRlb+RPUrwHhRrNIeqAPLaCz8OUI+W9AEZR+a98NmpUIR6mdr0HBwqGCc+uibvu0H
         k6vF6scKpN6MJR0SUT+vQQxm1qqbG56IAIVShXmdv9GWkya2KeCLRLjV5efHVE4TD7iK
         NIpjv4ceM+moyLJRzyPzY6pVb5KP9CLRzyORJxur2YilgXxv2zxg/56MHWw0jfNb/xBE
         aY18XoSZhxuRejYIpWHtZQwKa2Gxi8PT2bQu0F6SBXOU1yLsjBjvty64ZS7XxeKcqoME
         WIOEEpYApB/hQ/mK0iMo7F6O+4wFULO4nI2QL6P7xHBK/RNoqFjSUyyfb+gGXTrnB6H8
         T9NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738261391; x=1738866191;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LiTob6eVO3/nTRL2jXJ4ehBWxJYYOLR6mf/DNOwkNQk=;
        b=sj6KhcZB6txMLcthPwYSQqWtUmsALdJREJT5DbI4m7wFacnFET5ambIJY2bt0YFVSc
         6h3W1LTNg3q5l2sQ4dk6RJPi6kcP7Ip1CJqqsvUD+vSz8Y7fiVCHVKBcqmifTCqgVKcT
         /xb7d3iIfI1sMs5ROW2NvbXdnDW30RLjc6h/u3wP6+U0pwL9wkmaJtGsNOaaSz10Jrmw
         Pqxih/7KXlLCJ7lIMVZn3iuMiRRaoM/tHr6TpQuAcXsW272ipqmE0kg5BSlYB83y5glG
         GOyqk36akwmkkq44KP+dFKwrg3jhi1Y295D+XxS7wdTuVP2rMvLOlLlPaRewA2V+OE85
         X6bg==
X-Gm-Message-State: AOJu0Ywuaz3KLtN3zwwomrZy45sflWBwWI+Lfg1aHd9dqylO3Jn2aUs5
	occKudg8uMsfk4Pvhsc9xt8j5OFOmig+3zVcs9voG05cBI0LDlw58Hcbkct9fqdlvz6OU5MqExu
	gJQ4=
X-Gm-Gg: ASbGnctdWs9s9bDOywIyZH2bwcOH9Uto45men+KKrgoGIHoiYh+bJqSR8oyZ3jECXGN
	6x/IOXk3i6TQxyKwEuwlniVb6poON/nPk5hOiTeelrsmjUP6q0KHajea8vzMjhR0+KH3+JcAMPw
	aewXnnRXBj/ekPdIYUBRZlxbU8/9GGekdU6PDfIaTl3SRFLn5SqIfGQoZHIqGhwN7NasADFKkA4
	QJ2p5FvxLzSC61B0Bv3nN32DdaFPUQ7z1x5Q3SPsqVr2AilyAlEBxqfgb1808ZPNXHa0KqxEmSG
	AyB15kKjYZk8xJ1SoK4skA==
X-Google-Smtp-Source: AGHT+IGD9JikmYxLrxdEHhCKfC/JKg4qUSVgE4ZzgaMQIiGe+xzVUCFdOFH2xg//iRtdmAzcwRmylA==
X-Received: by 2002:a05:6000:1567:b0:38c:5bb2:b91a with SMTP id ffacd0b85a97d-38c5bb2bd03mr2815729f8f.17.1738261391471;
        Thu, 30 Jan 2025 10:23:11 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c101599sm2634426f8f.23.2025.01.30.10.23.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jan 2025 10:23:10 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH 00/14] target/arm: Clean up some corner cases of sysreg traps
Date: Thu, 30 Jan 2025 18:22:55 +0000
Message-Id: <20250130182309.717346-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: LB6WRVyQCvyv

While reviewing Alex's recent secure timer patchset, I noticed a
bug where it was using CP_ACCESS_TRAP when CP_ACCESS_TRAP_UNCATEGORIZED
was wanted, and that we were making the same mistake elsewhere in
our existing code. This series started out as an attempt to fix
that and also rearrange the API so that it's harder to introduce
other instances of this bug in future. In the process I noticed
a different bug, where we weren't handling traps to AArch32
Monitor mode correctly, so the series fixes those as well.

The first four patches are fixes for the places where we were
using CP_ACCESS_TRAP when we wanted CP_ACCESS_TRAP_UNCATEGORIZED.
These are all situations where an attempt to access a sysreg
should UNDEF and we were incorrectly reporting it with a
syndrome value for a system register access trap. I've cc'd
these to stable as they are technically bugs, but really the impact
s very limited because I can't see a reason why any code except
test code would deliberately attempt a sysreg access that they
knew would take an exception and then look at the syndrome
value for it.

Patches 5, 6 and 7 together fix bugs in our handling of sysreg
traps that should go to AArch32 Monitor mode:
 * we were incorrectly triggering an UNDEF exception for these
   rather than a Monitor Trap, so the exception would go to
   the wrong vector table and the wrong CPU mode
 * in most cases we weren't trapping accesses from EL3
   non-Monitor modes to Monitor mode
This affects only:
 * trapping of ERRIDR via SCR.TERR
 * trapping of the debug channel registers via SDCR.TDCC
 * trapping of GICv3 registers via SCR.IRQ and SCR.FIQ
because most "trap sysreg access to EL3" situations are either for
AArch64 only registers or for trap bits that are AArch64 only.

Patch 8 is a trivial one removing an unnecessary clause in
an if() condition in the GIC cpuif access functions.

Patches 9-13 are the API change that tries to make the bug harder to
write: we add CP_ACCESS_TRAP_EL1 for "trap a sysreg access direct to
EL1". After all the bugfixes in the first half of the series, the
remaining uses of CP_ACCESS_TRAP are all in contexts where we know the
current EL is 0, so we can directly replace them with
CP_ACCESS_TRAP_EL1, and remove CP_ACCESS_TRAP entirely. We also rename
CP_ACCESS_TRAP_UNCATEGORIZED to CP_ACCESS_UNDEFINED, to be a clearer
parallel with the pseudocode's use of "UNDEFINED" in this situation.
The resulting
API is that an accessfn can only return:
 CP_ACCESS_OK for a success
 CP_ACCESS_UNDEFINED for an UNDEF
 CP_ACCESS_TRAP_EL{1,2,3} for a sysreg trap direct to an EL
and everything else is invalid. UNCATEGORIZED traps never go to a
specified target EL, and sysreg-traps always go to a specified target
EL, matching the pseudocode which either uses "UNDEFINED" or some kind
of SystemAccessTrap(ELx, ...).

Patch 14 fixes some issues with the WFI/WFX trap code, some of
which are like the above sysreg access check bugs (not using
Monitor Trap, not honouring traps in EL3 not-Monitor-mode),
plus one which I noticed while working on the code (it doesn't
use arm_sctlr() so will look at the wrong SCTLR when in EL2&0).

I've cc'd the relevant patches to stable, but I don't think
it's very likely that anybody ever ran into these bugs, because
they're all cases of "we did the wrong thing if code at an EL
below EL3 tried to do something it shouldn't". I don't think that
EL3 code generally uses the trap bits for trap-and-emulate
of functionality, only to prevent the lower ELs messing with
state it should not, and everything here with the exception of
SCR.IRQ and SCR.FIQ is pretty obscure anyway.

(Tested somewhat lightly, because I don't have any test images
that test AArch32 EL3 really.)

thanks
-- PMM

Peter Maydell (14):
  target/arm: Report correct syndrome for UNDEFINED CNTPS_*_EL1 from EL2
    and NS EL1
  target/arm: Report correct syndrome for UNDEFINED AT ops with wrong
    NSE,NS
  target/arm: Report correct syndrome for UNDEFINED S1E2 AT ops at EL3
  target/arm: Report correct syndrome for UNDEFINED LOR sysregs when
    NS=0
  target/arm: Make CP_ACCESS_TRAPs to AArch32 EL3 be Monitor traps
  hw/intc/arm_gicv3_cpuif: Don't downgrade monitor traps for AArch32 EL3
  target/arm: Honour SDCR.TDCC and SCR.TERR in AArch32 EL3 non-Monitor
    modes
  hw/intc/arm_gicv3_cpuif(): Remove redundant tests of is_a64()
  target/arm: Support CP_ACCESS_TRAP_EL1 as a CPAccessResult
  target/arm: Use CP_ACCESS_TRAP_EL1 for traps that are always to EL1
  target/arm: Use TRAP_UNCATEGORIZED for XScale CPAR traps
  target/arm: Remove CP_ACCESS_TRAP handling
  target/arm: Rename CP_ACCESS_TRAP_UNCATEGORIZED to CP_ACCESS_UNDEFINED
  target/arm: Correct errors in WFI/WFE trapping

 target/arm/cpregs.h        | 15 +++++---
 target/arm/cpu.h           |  6 +++
 hw/intc/arm_gicv3_cpuif.c  | 15 ++------
 target/arm/debug_helper.c  |  5 ++-
 target/arm/helper.c        | 75 ++++++++++++++++++++++----------------
 target/arm/tcg/op_helper.c | 71 ++++++++++++++++++++++--------------
 6 files changed, 107 insertions(+), 80 deletions(-)

-- 
2.34.1
