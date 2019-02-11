Received: by 2002:a5d:4506:0:0:0:0:0 with SMTP id s6csp1941828wrq;
        Sun, 10 Feb 2019 17:08:57 -0800 (PST)
X-Google-Smtp-Source: AHgI3IYFDtHEdnb+K4ubNISb9+9I1+5IR4PVWMKZ1YLZ0fc6ATS/pb/XC+nj5wWgGStV98+Z9KGx
X-Received: by 2002:a1c:7211:: with SMTP id n17mr2796117wmc.92.1549847337151;
        Sun, 10 Feb 2019 17:08:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1549847337; cv=none;
        d=google.com; s=arc-20160816;
        b=rQ3uBRxc8MOiTmAz8bPFL0I53k6Ur56PNMZ+N6YSxSfv4yd62d2C2izGro6yXerMSV
         SpH3c7xwIHyjfs3Z4EZlAIuP0BT58ApNzqIJQUR2jLl6TbQzhVJ5KshQLoqBY+1bHPIp
         9j8IN31mrGJk4LmGhOI7YpmPHIoPjvJMmwMNvqivzJEy5ZXpeFhthFNiZ4Qz0Bu9A0yJ
         +V7emzrh/+lEiTIn4DFPab4bwWsGDCuklnXBKerb/gev91UcNAvZ7V+kCGJ+yNEC9Can
         Umu7+udq3ANye8lc2x7VDqm1m1vP5iWBtw1rGrJmBY3NqXROcaJDO4VOJPldHgB9tUGN
         00Ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :dkim-signature;
        bh=Z/+P88U6HTRT97Deomt+7PJ0HBzMiMRaWaClb4I1Ngg=;
        b=OGFAU56DFghljsoBEKQxWG01tdNJ8mIvxruGMge6xkPKIUTMACctEXOML8Nvdha8xy
         QlGUVbm/z22cnJvTH1DSVKXJS8jw7f69im/KKJrw8G/6J6ySHKSzwrdZ4bY2USMG8FKV
         ZPFVfE0XB0v0y/gIKMY8K9BeirqMZggUVg1d2JNj5RwuelP/8mEF+JyANwkfU4Ks1cAV
         5XAEB97sG6C6OdncJGgFRsx+r6qse7RSbe/4wNLSLEcBgDbvvP5Ck/J3DdMz99AwRKSk
         xfb9D6OXVy/+WkdPdzSsqHPSsEBh2bQ+8OpWnQ1ynj3dJDItDmCv9WaUUtFTksqwiwuM
         4Ssg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=g5+7bKPD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l5si6315703wrw.310.2019.02.10.17.08.56
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 10 Feb 2019 17:08:57 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=g5+7bKPD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:42046 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gt05g-0005Pj-3v
	for alex.bennee@linaro.org; Sun, 10 Feb 2019 20:08:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37057)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gt05L-0005MA-Cc
	for qemu-arm@nongnu.org; Sun, 10 Feb 2019 20:08:36 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gt05K-0007wt-5n
	for qemu-arm@nongnu.org; Sun, 10 Feb 2019 20:08:35 -0500
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643]:34269)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gt05J-0007vu-KW
	for qemu-arm@nongnu.org; Sun, 10 Feb 2019 20:08:34 -0500
Received: by mail-pl1-x643.google.com with SMTP id w4so4525295plz.1
	for <qemu-arm@nongnu.org>; Sun, 10 Feb 2019 17:08:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=Z/+P88U6HTRT97Deomt+7PJ0HBzMiMRaWaClb4I1Ngg=;
	b=g5+7bKPDgXzBAiRC27r/ACGhb1St/suVymUkmaWVTGUIz7xi8zNVg/zOInRv9KyLni
	3Fpbtec0+aP32oW0fRqkBtHjrBvTS8wVHpRhDvHjoly3AWKdK+gPEdzMHXgcBhyoHEqC
	Pk9D0nB8MKNDgy9m3wrLJztPnG9ohB3zS86aTXxLNnaKtE+UmNZUHjd9Eja6L6Gpvc3W
	0hVjVtKm2mhdemfLbxS0hckENJ9lNLvopAyzDpASA7E9W1nkdYgLc2IK9ImmDQKvtDzC
	XMqHhWebwLWxqIIT+8XAbI2W28bSKmNE6L6Qm7k9qphQnhG0fWlsZkOI2e612Udabtsl
	G/Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Z/+P88U6HTRT97Deomt+7PJ0HBzMiMRaWaClb4I1Ngg=;
	b=rY4gfahwJ/TIkouJvW+nFaN5aTEdiMN//k9NUFutCp8g2D7F1DD7rzGG0sDQhwzNv5
	9HBwEmUY0foev2BB0fEQPN3P1gif3t7DtRhiVkf1yUDlOkUKTa/uNAMRj+aF5aVQGiKF
	/zm2SggsKFU4wNVGRry/zIqg5v0Y4mitS97pnFa4qlNMchpB+p5QCSYcTLrId1r4YQr+
	a+ccNaV8IRmqEto1z5KodzxqR+7xEDjf2tbUHfxlkPO+t6BA/TkSOEptO2MI/Jd1cKDa
	K/i6cRL2vNr37jixluW4l9sHnuGTMUOY1eMh5OYAJ/47YzyJZC67UiOH9evp6uFiJxCG
	3cGQ==
X-Gm-Message-State: AHQUAuYWRms8Qp3TTxJfrWZLHSv3xaPxDq3fWCS9ES0dVQXZzG5Qrw6Z
	aH2ttn3nJzRFTPgsFrmb69Fg3A==
X-Received: by 2002:a17:902:8bc6:: with SMTP id
	r6mr34675615plo.67.1549847312019; 
	Sun, 10 Feb 2019 17:08:32 -0800 (PST)
Received: from cloudburst.twiddle.net (97-113-188-82.tukw.qwest.net.
	[97.113.188.82]) by smtp.gmail.com with ESMTPSA id
	g14sm17177630pfg.27.2019.02.10.17.08.30
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sun, 10 Feb 2019 17:08:30 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Sun, 10 Feb 2019 17:08:03 -0800
Message-Id: <20190211010829.29869-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.2
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::643
Subject: [Qemu-arm] [PATCH v2 00/26] target/arm: Implement ARMv8.5-MemTag
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
X-TUID: eFeGlpvj8Hmo

Based-on: <20190204131228.25949-1-richard.henderson@linaro.org>
aka "[PATCH v3 0/4] target/arm: Implement ARMv8.5-BTI".

The full tree is available at

  https://github.org/rth7680/qemu.git tgt-arm-mte

Changes since v1:

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


Richard Henderson (26):
  target/arm: Split out arm_sctlr
  target/arm: Split helper_msr_i_pstate into 3
  target/arm: Add clear_pstate_bits, share gen_ss_advance
  target/arm: Add MTE_ACTIVE to tb_flags
  target/arm: Extract TCMA with ARMVAParameters
  target/arm: Add MTE system registers
  target/arm: Assert no manual change to CACHED_PSTATE_BITS
  target/arm: Fill in helper_mte_check
  target/arm: Suppress tag check for sp+offset
  target/arm: Implement the IRG instruction
  target/arm: Implement ADDG, SUBG instructions
  target/arm: Implement the GMI instruction
  target/arm: Implement the SUBP instruction
  target/arm: Define arm_cpu_do_unaligned_access for CONFIG_USER_ONLY
  target/arm: Implement LDG, STG, ST2G instructions
  target/arm: Implement the STGP instruction
  target/arm: Implement the access tag cache flushes
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
 target/arm/helper-a64.h           |  15 +
 target/arm/helper.h               |   3 -
 target/arm/internals.h            |  37 +++
 target/arm/translate.h            |  36 ++
 accel/tcg/translate-all.c         |  28 ++
 hw/arm/virt.c                     |  33 ++
 linux-user/mmap.c                 |  10 +-
 linux-user/syscall.c              |   4 +-
 target/arm/cpu.c                  |  31 +-
 target/arm/cpu64.c                |  19 ++
 target/arm/helper-a64.c           |  30 ++
 target/arm/helper.c               | 208 ++++++++++--
 target/arm/mte_helper.c           | 529 ++++++++++++++++++++++++++++++
 target/arm/op_helper.c            |  80 +----
 target/arm/translate-a64.c        | 352 ++++++++++++++++----
 target/arm/translate.c            |  11 -
 tests/tcg/aarch64/mte-1.c         |  27 ++
 tests/tcg/aarch64/mte-2.c         |  39 +++
 target/arm/Makefile.objs          |   2 +-
 tests/tcg/aarch64/Makefile.target |   4 +
 22 files changed, 1360 insertions(+), 200 deletions(-)
 create mode 100644 target/arm/mte_helper.c
 create mode 100644 tests/tcg/aarch64/mte-1.c
 create mode 100644 tests/tcg/aarch64/mte-2.c

-- 
2.17.2

