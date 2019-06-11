Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp4198716wrg;
        Tue, 11 Jun 2019 03:54:45 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzuYNQvWIYbHUliDmxXOIjRdaq5WutqONdhXET8IDM32rUzJ3/y+Y2on1wR22topW4W6oDI
X-Received: by 2002:a37:a86:: with SMTP id 128mr39440762qkk.169.1560250485856;
        Tue, 11 Jun 2019 03:54:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560250485; cv=none;
        d=google.com; s=arc-20160816;
        b=sVfYW/shum+BvD0R0AoUBhG/RlD2BWkZ+Qxb3l8OAgwxJ6NO+x8Us874+mBba1Lr/s
         r1JUGPe0jza3bq5s0KxLtO5dIsXpmbAXvLw5CkC02fijjbr25WN4itgOlVpcqeIfm+Q7
         82XHtrQtyyUOJ0qgJdqXkwto1KzADgDuIWCcDMl99MaaaRCS9wXzXJggZ50CUGMWbvlC
         B2MOcBlglQTIAgRKtMwkeFSALJfltS5jycwtq/Z4NmRyH1WB8yIp/sagrB2cM6lkrdNc
         yDbsnrFFeFLoC6/V/U3sO/g6VuoMGp+p0P42o/qAj1856+0OXLHK2KpLZqgz1ul/JUww
         LgTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from
         :dkim-signature;
        bh=PioQAPu2dEtIJL/ymm8J+Jkq+mHbob2CLgKq2GbqE/E=;
        b=DI4ihK9GTpD3KOYAOxkOFxsj3eSD+ZHcQi/ZI2Tgg7ypIQcW5PIuK2+neRLBNyB4qr
         v3k29Z81qEzmymB8KpDhsjHnvil3pTcLshNZ97LAQ+T0LLPSGBbRpGit5vtpDWpJlBnX
         5Wl8auQeKKIsrnum73iYmLs723TZtuLqPXGE7e8SJFj8d/xJTmpB03GQbLyV/q7BC2w5
         sz4j3KCGNxI2mVQs9aoy4BBrhOD/vJjUxy/7AZEEM5gQfXpAwh1MakPE3d4Phnc6wEMZ
         Sz/bf9/IVmsYVmPw0Kkgd4CelH7cDgUocr/ed+dHXXI9wsXgAr9A6VRF9QCGMOl6sCG4
         JohA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=d8Pj1LLR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s50si419524qtb.173.2019.06.11.03.54.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 11 Jun 2019 03:54:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=d8Pj1LLR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56170 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1haeQP-000716-7F
	for alex.bennee@linaro.org; Tue, 11 Jun 2019 06:54:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38788)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1haePd-0006y1-03
 for qemu-arm@nongnu.org; Tue, 11 Jun 2019 06:53:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1haePb-00079M-Be
 for qemu-arm@nongnu.org; Tue, 11 Jun 2019 06:53:56 -0400
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344]:38707)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1haePb-00078S-1z
 for qemu-arm@nongnu.org; Tue, 11 Jun 2019 06:53:55 -0400
Received: by mail-wm1-x344.google.com with SMTP id s15so2384418wmj.3
 for <qemu-arm@nongnu.org>; Tue, 11 Jun 2019 03:53:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PioQAPu2dEtIJL/ymm8J+Jkq+mHbob2CLgKq2GbqE/E=;
 b=d8Pj1LLRQb1Z58H806WBFbmhQ1DXYQu4dYp3dNzPjJ6msUGNM89gh7381zUrp6kpV4
 PWGq/mGzX/4mKAFCI0sW95BRr6w21KoAPwlymAFS2vholBo8poyOMdx7E1f8Ft82eC23
 R7ClFkk7CDABdcVGQbiByUhT7yfD3vFR0B5dXEGLjHoT2TyX2lftcsjlVRf6/7PwL9KY
 LTzMjy0MVZlACf+mPCxs2qyLZMbzuXqSMsGoPR6k5XSbaAFy3Q2g5tB2EBf3opCAnLYV
 cBSKoKZcLIuSB7Z5MLMasxoIsRIQ0FNNfRqP3GD//d44AodniPipPXKk9FAHa/Kb0BGn
 zosw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PioQAPu2dEtIJL/ymm8J+Jkq+mHbob2CLgKq2GbqE/E=;
 b=sXyZDe/cVbwD1M6UTpI46uC5RHOBdJwqLc+COsE99DNoYtBpOV7DMf9w0bcpNkoNCv
 KZ6tmy4O5jKowy4R4MQ/EUrKYLHaP4UyElgq5eUvdqe3Yq5L2eU4BQSDepmeteBBFvsT
 yPUqx+vPnyfUAtf+TynrUdGwkDaalwh3U0Xv4Fbr4+a4FCBjqmADUTfjVJnrASbe41Lm
 1mJ0QlZbliaEdJT4rKjTYHl5o3kEuhPFgAOI8CKmylIcqSg9czFVYwCWCFK49aBdLnvk
 ipncKn3ydNij8G/yBhdZhzZm/cRL2BtNo1DPHE0Om/mLLt37ik+zdmKfNROjdYgs6MZ/
 HaRg==
X-Gm-Message-State: APjAAAV+tkA2hfRf2/qtoCj4g1taDXOMiTLV6JRYx9jgAmj2y5O6hN73
 Q29CMT4CslK8Nkgfj1JBPUTv7DNn9HPNGw==
X-Received: by 2002:a7b:ce01:: with SMTP id m1mr17044368wmc.1.1560250433350;
 Tue, 11 Jun 2019 03:53:53 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id e17sm10785945wrt.95.2019.06.11.03.53.52
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 11 Jun 2019 03:53:52 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue, 11 Jun 2019 11:53:09 +0100
Message-Id: <20190611105351.9871-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::344
Subject: [Qemu-arm] [PATCH v2 00/42] target/arm: Convert VFP decoder to
 decodetree
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: tM4svplLMbuW

This patchset converts the Arm VFP instructions to use decodetree
instead of the current hand-written decode.

v2 has only very minor changes since v1:
 * patch 33 (VFP comparisons): added missing TCG frees
 * patch 39 (VJCVT): add back missing jscvt feature check

Patch 39 is the only one still in need of review.



Rest of the cover letter from v1 below, for further context:

We gain:
 * a more maintainable decoder which doesn't live in one big function
 * correct prioritization of UNDEF exceptions against "VFP disabled"
   exceptions and "M-profile lazy FP stacking" activity
 * significant reduction in the use of the "cpu_F0[sd]" and "cpu_F1[sd]"
   TCG globals. These are a relic of a much older translator and
   eventually we should try to get rid of them entirely
 * more accurate decode, UNDEFing some things we were incorrectly lax on
 * a fixed bug for VFP short-vector mixed vector/scalar VMLA/VMLS/VNMLA/VNMLS
   insns: we were incorrectly corrupting the scalar input operand
   in the process of performing the multiply-accumulate, so every
   element after the first was miscalculated
 * a fixed bug in the calculation of the next register number to use
   when VFP short-vector operations wrapped around the vector bank
 * decode which checks ID registers for "do we have D16-D31" rather
   than using "is this VFPv3" -- this means that Cortex-M4, -M33 and -R5F
   all now correctly give the guest only 16 Dregs rather than 31.
   (Note that the old decoder hides this UNDEF handling inside the
   VFP_DREG macros...)
 * the fused multiply-add insns now correctly UNDEF for attempts to
   use them as short-vector operations
 * short-vector functionality is only implemented if the ID registers
   say it should be (which in practice means "only Cortex-A8 or earlier");
   we continue to provide it in -cpu max for compatibility
 * VRINTR, VRINTZ and VRINTX are only provided in v8A and above
 * VFP related translation code split out into its own source file
 * the "is this special register present and accessible" check is
   now consistent between read and write

There is definitely scope for further cleanup:
 * the translate-vfp.inc.c could be further isolated into its
   own standalone .c file rather than being #included into translate.c
 * cpu_F0* are still used in parts of the Neon decode (and the
   iwmmxt code, alas)
 * I noticed some places doing a load-and-shift or load-modify-store
   sequence to update byte or halfword parts of float registers;
   these could be rewritten to do direct byte or halfword loads/stores
 * we could remove the remaining uses of tcg_gen_ld/st_f32()
   (in the Neon decode)
but at 42 patches this is already a pretty hefty patchset, so
I have deferred those to attack later once this has got in.

On the downside, there are more lines of code here, but some of
them we'll get back when we finish some of the cleanups noted
above, some are just copyright-and-license boilerplate, and I
think the rest are well invested in easier to modify code...

Patch 1 is Richard's recent decodetree script bugfix, which
is needed for the VFP decode to behave correctly.

Tested with RISU, a mixture of comparison against real Cortex-A7
and Cortex-A8 and against the old version of QEMU, plus some
smoke-testing of aarch32 system emulation.

thanks
-- PMM


Peter Maydell (41):
  target/arm: Add stubs for AArch32 VFP decodetree
  target/arm: Factor out VFP access checking code
  target/arm: Fix Cortex-R5F MVFR values
  target/arm: Explicitly enable VFP short-vectors for aarch32 -cpu max
  target/arm: Convert the VSEL instructions to decodetree
  target/arm: Convert VMINNM, VMAXNM to decodetree
  target/arm: Convert VRINTA/VRINTN/VRINTP/VRINTM to decodetree
  target/arm: Convert VCVTA/VCVTN/VCVTP/VCVTM to decodetree
  target/arm: Move the VFP trans_* functions to translate-vfp.inc.c
  target/arm: Add helpers for VFP register loads and stores
  target/arm: Convert "double-precision" register moves to decodetree
  target/arm: Convert "single-precision" register moves to decodetree
  target/arm: Convert VFP two-register transfer insns to decodetree
  target/arm: Convert VFP VLDR and VSTR to decodetree
  target/arm: Convert the VFP load/store multiple insns to decodetree
  target/arm: Remove VLDR/VSTR/VLDM/VSTM use of cpu_F0s and cpu_F0d
  target/arm: Convert VFP VMLA to decodetree
  target/arm: Convert VFP VMLS to decodetree
  target/arm: Convert VFP VNMLS to decodetree
  target/arm: Convert VFP VNMLA to decodetree
  target/arm: Convert VMUL to decodetree
  target/arm: Convert VNMUL to decodetree
  target/arm: Convert VADD to decodetree
  target/arm: Convert VSUB to decodetree
  target/arm: Convert VDIV to decodetree
  target/arm: Convert VFP fused multiply-add insns to decodetree
  target/arm: Convert VMOV (imm) to decodetree
  target/arm: Convert VABS to decodetree
  target/arm: Convert VNEG to decodetree
  target/arm: Convert VSQRT to decodetree
  target/arm: Convert VMOV (register) to decodetree
  target/arm: Convert VFP comparison insns to decodetree
  target/arm: Convert the VCVT-from-f16 insns to decodetree
  target/arm: Convert the VCVT-to-f16 insns to decodetree
  target/arm: Convert VFP round insns to decodetree
  target/arm: Convert double-single precision conversion insns to
    decodetree
  target/arm: Convert integer-to-float insns to decodetree
  target/arm: Convert VJCVT to decodetree
  target/arm: Convert VCVT fp/fixed-point conversion insns to decodetree
  target/arm: Convert float-to-integer VCVT insns to decodetree
  target/arm: Fix short-vector increment behaviour

Richard Henderson (1):
  decodetree: Fix comparison of Field

 target/arm/Makefile.objs       |   13 +
 target/arm/cpu.h               |   11 +
 target/arm/cpu.c               |    6 +
 target/arm/translate-vfp.inc.c | 2672 ++++++++++++++++++++++++++++++++
 target/arm/translate.c         | 1503 +-----------------
 scripts/decodetree.py          |    2 +-
 target/arm/vfp-uncond.decode   |   63 +
 target/arm/vfp.decode          |  242 +++
 8 files changed, 3036 insertions(+), 1476 deletions(-)
 create mode 100644 target/arm/translate-vfp.inc.c
 create mode 100644 target/arm/vfp-uncond.decode
 create mode 100644 target/arm/vfp.decode

-- 
2.20.1

