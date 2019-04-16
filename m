Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp3893088wrx;
        Tue, 16 Apr 2019 05:58:07 -0700 (PDT)
X-Google-Smtp-Source: APXvYqy77t+tc2Npn7Ro2X+S2xti4M/Y4rwYI75W18qcsPiTvD5hKY2FWFCkR/GFk+DcDG5QONgj
X-Received: by 2002:a1c:6c17:: with SMTP id h23mr17230328wmc.122.1555419487918;
        Tue, 16 Apr 2019 05:58:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1555419487; cv=none;
        d=google.com; s=arc-20160816;
        b=SsWUc365wPHD0kTrYvOSVgEhd9r1ykYdhd7eoEh0Bj1pU/TVF2PWHuT4EmSpWrc71i
         VxBIAJmL5nppO1j9/HNUXwp0UL5bskE4TkDS2TiezHYsoPjvXa+ZhZNdut73tlpnM2yP
         dA7/oz3JPcVbhSs3GU/p0sxCcIEk1jmCPRDNbi6DZpPlimzvy+rwq0ZFDvWMrbwHLOSR
         KJnvzKUL0WKT4iVauvWBTjTwAhhI+1zSNO9VmSCLtlzg0qHeMAvOvyBw9XHUbG7wudFW
         vMY0ZOx02eCilUAm34MlyVEjpWA0ncx5lSKJw4zhbEe547rhdIZKFnR1BGVtXwtk4/T7
         6TiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from
         :dkim-signature;
        bh=6nZ7otvE8hl7heFHIJUj8KIKUXWQ/qMPumMrlOkY7O0=;
        b=LVYtbKYidW8tPLA7PExNdOag3ELrXGzYejCiDo19PprJbGV5cTVROdmfPpA46loB63
         KJ7fwONT6ZaFTuauQbQwpObQH3TsEqEXQPz6hZFJ/ojs+fZnCcmoDtdupzENQ9Id/FtE
         McXA1v/BCylWMSBbJdLy2scxKOlk5HRgKgP56Z5MwO79SIs5ztrdPc1H8o8r9WQ1d9bV
         GRhCpr3DlM8ejlSfE0nOmrsy5hCUCNi3BgVrRpNsfr3TTd15+zjCjI3N12OReOuH0Rlv
         O1djP4i8XBfnDNj6WIN4L387Xiz1OLJk8/yFMZd/M0orYbHfehW3zad09m7leNrLIH4m
         bY/Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=lJ21sXRj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s8si31019860wrn.0.2019.04.16.05.58.07
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 16 Apr 2019 05:58:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=lJ21sXRj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:36244 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hGNf5-0004M0-1J
	for alex.bennee@linaro.org; Tue, 16 Apr 2019 08:58:07 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34237)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hGNep-0004L5-LW
	for qemu-arm@nongnu.org; Tue, 16 Apr 2019 08:57:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hGNeo-000100-0E
	for qemu-arm@nongnu.org; Tue, 16 Apr 2019 08:57:51 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:44060)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1hGNen-0000z6-Dz
	for qemu-arm@nongnu.org; Tue, 16 Apr 2019 08:57:49 -0400
Received: by mail-wr1-x42b.google.com with SMTP id y7so26891010wrn.11
	for <qemu-arm@nongnu.org>; Tue, 16 Apr 2019 05:57:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=6nZ7otvE8hl7heFHIJUj8KIKUXWQ/qMPumMrlOkY7O0=;
	b=lJ21sXRjVHN/uUY7NkesQ6oby4jBpYPS5PcwMFd6xNG3DW88PjjzyKn2IvuEPFEuu4
	70X4kVwH0PlY2PajZtMX6MDJbHf0WPnpOuzPVT+9fVVb2PEsvNfjfRbHCXaJsHUmY80u
	amELi1UNP5JW/TDll64mK8uSHKO67Hie8QmZ9hf2y3lXkxw2VY0oPfx9k24XmDbYA8nG
	VU9HIY8AMh4SI6UMQpLb94uPHRmyMZFhi7bXP5U6Lud3IGr+ropIg3QyXDIggQZLNCOW
	VU9Atw+Go7/1YoDGIVgFn0GqI14Phj59d8c+7RPU5N7zNeJNI7/fL+9lUfrAVWqa2Til
	iXnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=6nZ7otvE8hl7heFHIJUj8KIKUXWQ/qMPumMrlOkY7O0=;
	b=QZ4a72KTfpO13FXB+dExGIk4mc3FFq0lCRbdohQ8eXCJh6GnMccpJexCshJlTeDoYu
	HKbphz67nRiR65/E6/uFpcKC3p3Z1bO83qhES1DTW7gSYDBP2rh0GTb0KAv4NU3DV0ne
	r0v2S5riJ6vQh5gM+c38gsqqPGsUhgohdNd+DBFlVsetezM2WpzFlgVtNu6pIEH7zHZb
	io2wMd5HkkBye577rhorkgELzWIKb5pekr1rBjtAadaXcrU0qcsAF3kakx0jnAADbZGS
	vpVxa4h2buNlHLAfxwJd87c/DxI+ioetwLU8ImO2mhgeve3CIgy2UhPr3w7k0TsquXPC
	o6Rg==
X-Gm-Message-State: APjAAAW3zl9vfxZZ3LzeAb8HIukimAaWfDbgXNo1DB+2vs5ERAUYrfz4
	rFiElaLOV7C7LAHLghY/MR+LYGg+uf4=
X-Received: by 2002:a05:6000:12c8:: with SMTP id
	l8mr50511071wrx.80.1555419467655; 
	Tue, 16 Apr 2019 05:57:47 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
	by smtp.gmail.com with ESMTPSA id
	v184sm39476572wma.6.2019.04.16.05.57.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 16 Apr 2019 05:57:46 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue, 16 Apr 2019 13:57:18 +0100
Message-Id: <20190416125744.27770-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::42b
Subject: [Qemu-arm] [PATCH 00/26] target/arm: Implement M profile floating
 point
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 8O3fF4UFnJ6U

This patchset implements floating point support for the
M-profile Arm cores and enables it for the Cortex-M4 and
Cortex-M33 (both of which should really have an FPU).

The floating point instructions for M-profile are basically
the same as for A-profile (with some minor differences like
not having all the VFP sysregs, and definitely not having
the old VFP length/stride handling). The major differences are
in the exception handling:
 * on exception entry and exit we may want to stack and
   unstack FP registers, as we do for integer registers
 * M-profile supports a "lazy stacking" mode, which means that
   on exception entry we do not stack the FP registers that
   the calling convention requires us to preserve, but just
   reserve space for them. Then if the exception handler
   executes an FP instruction we spill the FP registers to
   the stack only at that point

There are also two M-profile-only instructions, VLLDM and
VLSTM, which are for guest code to actively trigger the
lazy-stacking.

Most interesting bit to review is probably whether I got the
handling of the new TB flag bits right (in patches 18, 19
and 23), since they have a kind of self-clearing property
that's a bit non-standard.

thanks
-- PMM

Peter Maydell (26):
  target/arm: Make sure M-profile FPSCR RES0 bits are not settable
  hw/intc/armv7m_nvic: Allow reading of M-profile MVFR* registers
  target/arm: Implement dummy versions of M-profile FP-related registers
  target/arm: Disable most VFP sysregs for M-profile
  target/arm: Honour M-profile FP enable bits
  target/arm: Decode FP instructions for M profile
  target/arm: Clear CONTROL_S.SFPA in SG insn if FPU present
  target/arm: Handle SFPA and FPCA bits in reads and writes of CONTROL
  target/arm/helper: don't return early for STKOF faults during stacking
  target/arm: Handle floating point registers in exception entry
  target/arm: Implement v7m_update_fpccr()
  target/arm: Clear CONTROL.SFPA in BXNS and BLXNS
  target/arm: Clean excReturn bits when tail chaining
  target/arm: Allow for floating point in callee stack integrity check
  target/arm: Handle floating point registers in exception return
  target/arm: Move NS TBFLAG from bit 19 to bit 6
  target/arm: Overlap VECSTRIDE and XSCALE_CPAR TB flags
  target/arm: Set FPCCR.S when executing M-profile floating point insns
  target/arm: Activate M-profile floating point context when FPCCR.ASPEN
    is set
  target/arm: New helper function arm_v7m_mmu_idx_all()
  target/arm: New function armv7m_nvic_set_pending_lazyfp()
  target/arm: Add lazy-FP-stacking support to v7m_stack_write()
  target/arm: Implement M-profile lazy FP state preservation
  target/arm: Implement VLSTM for v7M CPUs with an FPU
  target/arm: Implement VLLDM for v7M CPUs with an FPU
  target/arm: Enable FPU for Cortex-M4 and Cortex-M33

 target/arm/cpu.h        |  95 ++++-
 target/arm/helper.h     |   5 +
 target/arm/translate.h  |   3 +
 hw/intc/armv7m_nvic.c   | 261 ++++++++++++
 target/arm/cpu.c        |  20 +
 target/arm/helper.c     | 873 +++++++++++++++++++++++++++++++++++++---
 target/arm/machine.c    |  16 +
 target/arm/translate.c  | 150 ++++++-
 target/arm/vfp_helper.c |   8 +
 9 files changed, 1350 insertions(+), 81 deletions(-)

-- 
2.20.1

