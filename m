Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp4747847wrg;
        Thu, 6 Jun 2019 10:46:46 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxjYBE6Q/v6p5kVQX3nMSQVmQOfD2gKrP3EuzdcAnqawmlXeXjj66N09UZj/btFX99U0nM4
X-Received: by 2002:a0c:ad02:: with SMTP id u2mr39726459qvc.90.1559843206367;
        Thu, 06 Jun 2019 10:46:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1559843206; cv=none;
        d=google.com; s=arc-20160816;
        b=XIaGeMKabMN826Y4mgMb/xJ7YYqBec2rhSMpEsqq04v35afaHsHJbxbNRy25zh9Ylj
         WJTMp6iBvPK6Mg4dNcuPHJCbZN2UycRjHThuTaE+n2i4/lGvh2bB0ZxC3WuPrCTJmNd/
         vqL+IqSYfeL5oSQ3VyZ2kP+JzJPyU5ni1HLRrj5rN3jUZuFEL06vzl+oAAaGV3Cp6xSO
         Gkv6P5d/IwdJoL71pEbzbaOxuFTQEpVTukLMncQGAy+0OF2Kr0CqwugU/ziQ2DkUi1Ii
         H0Iad8w9Qev3N3f3c2tt1qnb6gX3euUR7iCHWhEbWJHRRRaV3a+8bfyxaVYtURiBEA8M
         +1ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from
         :dkim-signature;
        bh=AtcFb5Jfvq0KHXYr/zJxoHmo7uGOqmsnuu/sJrhfBCI=;
        b=WuEUA6+/mcFRqD8840b2SXi0ylsy3Kf14zWLY5l988zeNwK13ndqrmJISngPV8v0b/
         UGwWkebVkrkEpCZWK4XEP+ZtS8rTVxYboHdQJLW7OJdoQXpe72tfS7TZzhOSANrrXMMK
         cxkY6IREUuR9pJWkYbF40Xyv8DjJ23lGtyoZskydXYaOIkzlEprlH/Mzh7+6hipbtEuL
         jCH++BwUBFPyMKUaqUl450+3sFi4fo1ZiWeh4pIU7b7T6h7qTSjAuVTakuolP3TlTJTG
         xQ1jP+1wsUNLpTt7LDWuFnaehQHzJjeY4fEZxtV8eLv2KC5dRygyr3A/8kXYk7Dhv600
         dWeA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=AahQcwOy;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x26si2214008qtq.233.2019.06.06.10.46.46
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 06 Jun 2019 10:46:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=AahQcwOy;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:35853 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hYwTN-0003cH-UN
	for alex.bennee@linaro.org; Thu, 06 Jun 2019 13:46:45 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44177)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hYwTA-0003aB-45
	for qemu-devel@nongnu.org; Thu, 06 Jun 2019 13:46:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hYwT5-0002yo-DG
	for qemu-devel@nongnu.org; Thu, 06 Jun 2019 13:46:29 -0400
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:37584)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1hYwSt-0002mc-Lq
	for qemu-devel@nongnu.org; Thu, 06 Jun 2019 13:46:21 -0400
Received: by mail-wm1-x343.google.com with SMTP id 22so828002wmg.2
	for <qemu-devel@nongnu.org>; Thu, 06 Jun 2019 10:46:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=AtcFb5Jfvq0KHXYr/zJxoHmo7uGOqmsnuu/sJrhfBCI=;
	b=AahQcwOySfjOqxy1RVEqSZhQcLG7EafVy2w6phYh8BUOKH1HsjLf4eR3UqfwF6MT0H
	JMiRJJH8wczocjZnPpFT5R2Q95kV5AAVYstBqYJxrj2jhvMC/8tStQBMH5SZDzeDBbCV
	7C7fcwS3fdgvo7NYf1yy2eQBvANz76/lPl0XY5tnefK2Bx8oerogyg+WJBmYHQ0B4cpY
	TfKUk0XYqqDNrW+vxLUTdLtF8Qf1jMiMvfTL3bUAxOsDdFwJMR9UsCUJVZKLxOMhqIOZ
	SQe5/0/L/bWsczYicZGe/YRM1WUyc5iOz+fan7dw3jsmNg5J/0ADupll4D64emi6A1Oj
	0ZYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=AtcFb5Jfvq0KHXYr/zJxoHmo7uGOqmsnuu/sJrhfBCI=;
	b=i4stnns09LChH2M1YdTObB727OIctp1c9AZe6QYU5RMXh/nPkWEHc8f3nGIHsHM/0m
	aScwH3ZTVicWK4OMWkauRg3HEkuu/4091a2jZDbuxLkD9LK0jHjOwepicndxbwP3dkbc
	TluQg59SmnpEDPNpmxdV6HAcyvpbwfTEEypVdGgTeTuAwlyi1DfI51i0rOtFg0y9fWsd
	g/dg1kObsizowyaKMq/N+LRmmZRODy6kuuX4nySC1hw7u7g6K/tDFYlZUCjoEw4iasOa
	9y3rBl834iNYH/a7muou8Tr5KV0l4o5tZahrEIDKtMAjDPMxx/I40t6IZ54VcsXSkos2
	VJXw==
X-Gm-Message-State: APjAAAU7nrIzme58+/m1zBAVrbroXnSYm83I5TeaXwjfkHPFO95HErj+
	Gf1F+jDy9DQlQM4DcZJDmEkwlQ==
X-Received: by 2002:a7b:c444:: with SMTP id l4mr808655wmi.15.1559843171416;
	Thu, 06 Jun 2019 10:46:11 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
	by smtp.gmail.com with ESMTPSA id
	z135sm2596784wmc.45.2019.06.06.10.46.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 06 Jun 2019 10:46:10 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Thu,  6 Jun 2019 18:45:27 +0100
Message-Id: <20190606174609.20487-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::343
Subject: [Qemu-devel] [PATCH 00/42] target/arm: Convert VFP decoder to
 decodetree
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: PkeSgkwl8TFz

This patchset converts the Arm VFP instructions to use decodetree
instead of the current hand-written decode.

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
 target/arm/translate-vfp.inc.c | 2660 ++++++++++++++++++++++++++++++++
 target/arm/translate.c         | 1503 +-----------------
 scripts/decodetree.py          |    2 +-
 target/arm/vfp-uncond.decode   |   63 +
 target/arm/vfp.decode          |  242 +++
 8 files changed, 3024 insertions(+), 1476 deletions(-)
 create mode 100644 target/arm/translate-vfp.inc.c
 create mode 100644 target/arm/vfp-uncond.decode
 create mode 100644 target/arm/vfp.decode

-- 
2.20.1

