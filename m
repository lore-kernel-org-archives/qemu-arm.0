Received: by 2002:adf:efc1:0:0:0:0:0 with SMTP id i1csp103089wrp;
        Mon, 11 Feb 2019 15:53:20 -0800 (PST)
X-Google-Smtp-Source: AHgI3Iai+fbaB/AGnofO6PL3CtzONSDtyKRtE7ZZ3l5gvmy0ghXzpQxcWF2m4nhaBOeIElxB6hno
X-Received: by 2002:a0d:c046:: with SMTP id b67mr607748ywd.93.1549929200071;
        Mon, 11 Feb 2019 15:53:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1549929200; cv=none;
        d=google.com; s=arc-20160816;
        b=Y1yd/FrlQuqOk5/KmnT9xW8RxaCAit65oGIQglwgOl+wmVc0RHqcI6GGSGx4X6QXSI
         VJ80meFK3GBVxt7D0suyTLdQY9qDPkXNNqL45MqYoCLFtAqcO/1tpxVYXq8UMeIhgEXy
         zawFLnKrzRn0Pgki6TCzAiKUriTk3LrOq1LEvXsK8FuMSgvvfrnsM4YPEDN/g5KO+1CD
         b3+mDyg9pZcMufyNeeCEkqN2EoNIlOMt0EdxiXFBr5csxqvtN1KIT+ixqrJQm1YnIfKt
         GvFfsfHkaU+LtV2fdkCREPf55Af1ABPzrCCA+zwHdyJoMyFDhKkYJVpBgiPV3B/lp6M7
         N3vA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :dkim-signature;
        bh=nUC5b450Pf/NYwQMNMdAlF16vxC3MZp5egVQzbvGAKY=;
        b=lIyvDoETIChjh0tdjGPTFq5oXI+jcW5QFX5hj554nKfqGA5gfQTr12eGop/scr0jQk
         XiOWDUHosbG2BQLj0utYn4y8k5t0hzewQlssBk4aRmjXuNWk3aPQbLYLlssS7SMuJI5J
         e0p2eLr07lcgnVHLNc2ifZz7M57OPCkP0GPQ7x+PNNFt9CJfNbv3F1mXOf0SxLI8Ef1O
         UktJHnEoaavg7G1grvp1CnlPZdeRzWdWLM/tlc5wt+yybJ+oEppgQaLCyTVKSWyfZCdf
         Dqzj7Fr6nfU+ClUlKXgsc4rCT6SykXpYgtnmESPoVwyBnGfpDy5ZjS8x5Nh4bg+StAOh
         Amjg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=yw1QjlCP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i1si7020507ywd.97.2019.02.11.15.53.19
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 11 Feb 2019 15:53:20 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=yw1QjlCP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:58122 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gtLO3-00051Y-Ei
	for alex.bennee@linaro.org; Mon, 11 Feb 2019 18:53:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37660)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gtLNo-0004zx-Rs
	for qemu-arm@nongnu.org; Mon, 11 Feb 2019 18:53:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gtLNn-0004EA-GI
	for qemu-arm@nongnu.org; Mon, 11 Feb 2019 18:53:04 -0500
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641]:39187)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gtLNn-0004Bg-52
	for qemu-arm@nongnu.org; Mon, 11 Feb 2019 18:53:03 -0500
Received: by mail-pl1-x641.google.com with SMTP id 101so331271pld.6
	for <qemu-arm@nongnu.org>; Mon, 11 Feb 2019 15:53:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=nUC5b450Pf/NYwQMNMdAlF16vxC3MZp5egVQzbvGAKY=;
	b=yw1QjlCPCgXGQSY+TEOGzDOFJQlq+hC/5fJbvR1BBeBErnnobrUbpsv6PHtnjMJ0rd
	5RYJnqqY3gqq7rkHqLd8nj40O/7ujqhwRtmuHLCvTsMoszbpfLwBexY1fNirFxj73yDx
	535VWo+a+ymfJxJKscTY9Fs7TzBBGliQS3CX8dn12cZIKw7vXN+75Cad+/9rtJVqxZzj
	hecIoOVK9yXiMIFIcjgaZw9JnTDvPg5CSsKqxnR1Qr10yycdJT7vnQ/sY2M5UCKlxNd1
	s2wwIbvxExXt7alk3v2ugVifqEDdl35f7ap6JSTckJ4sbuLxdWWmJJ2pQUF7GK7Kvb+3
	7osw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=nUC5b450Pf/NYwQMNMdAlF16vxC3MZp5egVQzbvGAKY=;
	b=NyDsaPq7dbbQSmZUgNCDyB2i4dhCdMzkUfZrd7PyJuu8yeGQL9ldyEw5JiFjYTm6rJ
	J/w2WqWzsRko4vu19/0CyX3ZE4YUHqZQl4Ih9xtz7JhYQSzmnW2gvqnBE2ymZAJnbyFq
	TotHRvD1cQBd0UvUp6EJrz7LZ9MB9LrAeMmn6lxZZwOe5xAYUy+oNeMFOG7QW2jKgvza
	wTK57XeJckULtcRcYtru6rjLZysdwz5wOiQeRnLLXh94/rv9Vg1ell16I270TfuKczV6
	ItWfGQ0J1JabMFA205SCRArm106FV3PLaoI41204mVFOkBZyx7Bt1CDRWNyYmVc4w4TU
	JrOg==
X-Gm-Message-State: AHQUAuYKLyclGBNoHYaB28to5STMDg4lfWB0cbbBnvVenm8EkdpexgwN
	dJoTRI4pNmkw7UWAfKdcuo8QPw==
X-Received: by 2002:a17:902:9008:: with SMTP id a8mr969252plp.38.1549929181341;
	Mon, 11 Feb 2019 15:53:01 -0800 (PST)
Received: from cloudburst.twiddle.net (97-113-188-82.tukw.qwest.net.
	[97.113.188.82]) by smtp.gmail.com with ESMTPSA id
	c4sm11861031pgq.85.2019.02.11.15.53.00
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 11 Feb 2019 15:53:00 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Mon, 11 Feb 2019 15:52:30 -0800
Message-Id: <20190211235258.542-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.2
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::641
Subject: [Qemu-arm] [PATCH v3 00/28] target/arm: Implement ARMv8.5-MemTag
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: CmT0IUIgzTX9

Based-on: <20190204131228.25949-1-richard.henderson@linaro.org>
aka "[PATCH v3 0/4] target/arm: Implement ARMv8.5-BTI".

The full tree is available at

  https://github.org/rth7680/qemu.git tgt-arm-mte

Major changes since v2:

* LDG, STG, ST2G, LDGM, STGM STZGM instructions updated.

  The new definition of these functions allows me to clean TBI
  within the translator, without having to have the helpers dig
  back down into TCR to determine this.  Removing strip_tbi from
  mte_helper.c does make things a bit cleaner.

* Add GMID_EL1, trap MTE register accesses to EL[23] as required.

Major changes since v1:

* Updates to a newer revision of the spec.  I know there is still work to
  do here: another argument to STG, ST2G, and a new STZGM insn.

* User emulation adds an x-tagged-pages property.  Without that, all pages
  are MemAttr != Tagged and so all accesses unchecked.  I am not turning
  off SCTLR_EL1.ATA0, so even without x-tagged-pages the program has access
  to tag generation (e.g. the IRG insn).

* System emulation is new, though effectively untested.  I need to fiddle
  around with the kernel to see what I can put together there.

  What I can see is:

  address-space: cpu-tag-memory-0
    0000000000000000-07fffffffffffffe (prio 0, i/o): tag-memory
      0000000002000000-0000000009ffffff (prio 0, ram): mach-virt.tag

  address-space: cpu-memory-0
    0000000000000000-ffffffffffffffff (prio 0, i/o): system
      0000000040000000-000000013fffffff (prio 0, ram): mach-virt.ram

* New checks for alignment and page permissions before allowing
  access to the tag memory.


r~


Richard Henderson (28):
  target/arm: Split out arm_sctlr
  target/arm: Split helper_msr_i_pstate into 3
  target/arm: Add clear_pstate_bits, share gen_ss_advance
  target/arm: Add MTE_ACTIVE to tb_flags
  target/arm: Extract TCMA with ARMVAParameters
  target/arm: Add MTE system registers
  target/arm: Assert no manual change to CACHED_PSTATE_BITS
  target/arm: Add helper_mte_check{1,2}
  target/arm: Suppress tag check for sp+offset
  target/arm: Implement the IRG instruction
  target/arm: Implement ADDG, SUBG instructions
  target/arm: Implement the GMI instruction
  target/arm: Implement the SUBP instruction
  target/arm: Define arm_cpu_do_unaligned_access for CONFIG_USER_ONLY
  target/arm: Implement LDG, STG, ST2G instructions
  target/arm: Implement the STGP instruction
  target/arm: Implement the LDGM and STGM instructions
  target/arm: Implement the access tag cache flushes
  target/arm: Clean address for DC ZVA
  target/arm: Implement data cache set allocation tags
  target/arm: Set PSTATE.TCO on exception entry
  tcg: Introduce target-specific page data for user-only
  target/arm: Cache the Tagged bit for a page in MemTxAttrs
  target/arm: Create tagged ram when MTE is enabled
  target/arm: Add allocation tag storage for user mode
  target/arm: Add allocation tag storage for system mode
  target/arm: Enable MTE
  tests/tcg/aarch64: Add mte smoke tests

 include/exec/cpu-all.h            |  10 +-
 target/arm/cpu.h                  |  52 ++-
 target/arm/helper-a64.h           |  19 +
 target/arm/helper.h               |   3 -
 target/arm/internals.h            |  44 +++
 target/arm/translate.h            |  36 ++
 accel/tcg/translate-all.c         |  28 ++
 hw/arm/virt.c                     |  33 ++
 linux-user/mmap.c                 |  10 +-
 linux-user/syscall.c              |   4 +-
 target/arm/cpu.c                  |  31 +-
 target/arm/cpu64.c                |  19 +
 target/arm/helper-a64.c           |  30 ++
 target/arm/helper.c               | 229 +++++++++--
 target/arm/mte_helper.c           | 617 ++++++++++++++++++++++++++++++
 target/arm/op_helper.c            |  80 +---
 target/arm/translate-a64.c        | 390 +++++++++++++++----
 target/arm/translate.c            |  11 -
 tests/tcg/aarch64/mte-1.c         |  27 ++
 tests/tcg/aarch64/mte-2.c         |  39 ++
 target/arm/Makefile.objs          |   2 +-
 tests/tcg/aarch64/Makefile.target |   4 +
 22 files changed, 1517 insertions(+), 201 deletions(-)
 create mode 100644 target/arm/mte_helper.c
 create mode 100644 tests/tcg/aarch64/mte-1.c
 create mode 100644 tests/tcg/aarch64/mte-2.c

-- 
2.17.2

