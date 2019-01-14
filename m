Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp2531572wrt;
        Sun, 13 Jan 2019 17:13:43 -0800 (PST)
X-Google-Smtp-Source: ALg8bN5K4THKimv59irAd8oNvDIdOdooeXfMnIM/pk16co4dJq/lNpCEoAnYCd33qSe13DzsIk8X
X-Received: by 2002:a1c:5f8a:: with SMTP id t132mr10150825wmb.40.1547428423248;
        Sun, 13 Jan 2019 17:13:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1547428423; cv=none;
        d=google.com; s=arc-20160816;
        b=HNIYWfYIXo42F8FacuozLj8BgMmA5C8uGLUD1E2UAvxPEtoFmGGhqbsZmpfso+neyw
         GkiUE3tVw0LHfkCTJa3fGFFFXdJQODMFAPwwqlS1xbLPXjtkdJGJ9vSCWEegTzLOpi2F
         QgxS+Jj0sF3/I81oD9xnKowMtXg8Yes5+ZqGVTjmywmpz+9vim7OjJW+ts49wU9wC8YP
         JJEapXdtcDPYnq9y9qDZXZwmMNUaL7HkNfNUnpoLdq6uiJNcrmkQT9WO9tl9tEmRgba5
         pZLev8dhDwzSLBM3NpWx4g9TaO5gy5FiL3YSScxqmB6CJ0ONufCvW5T4T9vErpjgTFjA
         jV8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :dkim-signature;
        bh=tnx7xVRujXz7qQB7rlurDZGkvnA+hAoeepuAnHtEEjc=;
        b=MZwU1qVQuFuC5ixmGJuI3/fGUrGQzcdokOR3NSIJ8ZNu0q63x7+WonJXd7Uy7fZ5ED
         mF9yS0FpIkhZGk8yHIHfGLnBlljUF+knp64PPvGyif3Ht8aNTrk+CrzB6GrqNgG5H0hu
         kN/9VNnZu07GrizX8aVNnsN1Tk36h7qrz8dtstKxeofLIo6cWWkbyDfuMMawo/EKi4Cw
         SuPgwxjNSvykntTor+TxdIFyr0P1VOi6TGke6g/PLwePMCQJTFnKr0B8pxlZSvT2R161
         mvc6INtQav/DMW9ccV/h3hwz2pp6VwIl9PHCYuwStgDcSJsI2PMbUhqufi2Jw+BU+BTS
         HHOw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=TAhgx7ie;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 89si8313787wrk.98.2019.01.13.17.13.43
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 13 Jan 2019 17:13:43 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=TAhgx7ie;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:54702 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1giqow-0006Td-8e
	for alex.bennee@linaro.org; Sun, 13 Jan 2019 20:13:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36800)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1giqmt-0005OD-Le
	for qemu-devel@nongnu.org; Sun, 13 Jan 2019 20:11:36 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1giqms-0000ht-NR
	for qemu-devel@nongnu.org; Sun, 13 Jan 2019 20:11:35 -0500
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641]:33783)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1giqms-0000hA-FH
	for qemu-devel@nongnu.org; Sun, 13 Jan 2019 20:11:34 -0500
Received: by mail-pl1-x641.google.com with SMTP id z23so9365984plo.0
	for <qemu-devel@nongnu.org>; Sun, 13 Jan 2019 17:11:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=tnx7xVRujXz7qQB7rlurDZGkvnA+hAoeepuAnHtEEjc=;
	b=TAhgx7ieRfryRJDaa506PuROIQxDubMJWjGqG7hZ91gqOvgiIv+dJ0eBl454Hlgs40
	B4tFwhM5R7t/Q4aCQH1TGagakK1q6SGqgsqltEcOq+QQSefUKZu2uoMQhAgkwttQckFq
	NjmylDAHgq43fo4zzoT425qSA60NPbu6FDG34=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=tnx7xVRujXz7qQB7rlurDZGkvnA+hAoeepuAnHtEEjc=;
	b=T5VbgErC9CCIJzb4QPIh0EZzsibdBLlYoC2btKkWJW9eUjaaCnxOhWmORAmF8lq62C
	vulOzv5SCnJrDxziQbiniiGcGVR3wHeAjM9OlX9IXOluEYFLMOyN5AuMpu/0+tzi6AkA
	P/kdTPWmuwW4w8JTsCQMaYzWpxXH0xkHFBZJ5XZyDiKRUmmbPFoVwsLHhhbTdPljSLJS
	9XEHQHLsG7OdMstC4rvcTSpmTG+qkPe032QJUNHOxsLEwB/UcDD4kArPZZCVt4Mr52hH
	m0K3zT0UaUnOkN0XO0ABwxc+dxNqMAmjhxNFGFTqATW4wCgd7NzflbjY6I0RUAnRA7je
	UbEw==
X-Gm-Message-State: AJcUukdpazg7VTlp9TiugUv+GVOBaPnvPqAHYCCUOFhSCNQBoY+slM9R
	fOw9GB1OemhpGjgcXNzopc5KzGv7NsZv5g==
X-Received: by 2002:a17:902:12b:: with SMTP id
	40mr23020511plb.72.1547428292621; 
	Sun, 13 Jan 2019 17:11:32 -0800 (PST)
Received: from cloudburst.twiddle.net
	([2001:8000:1064:7600:4085:6ae6:1bde:1c45])
	by smtp.gmail.com with ESMTPSA id
	5sm159602229pfz.149.2019.01.13.17.11.27
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sun, 13 Jan 2019 17:11:31 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Mon, 14 Jan 2019 12:11:05 +1100
Message-Id: <20190114011122.5995-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.2
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::641
Subject: [Qemu-devel] [PATCH 00/17] target/arm: Implement ARMv8.5-MemTag
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
Cc: mark.rutland@arm.com, peter.maydell@linaro.org, szabolcs.nagy@arm.com,
	catalin.marinas@arm.com, Will Deacon <will.deacon@arm.com>,
	qemu-arm@nongnu.org, Ramana Radhakrishnan <ramana.radhakrishnan@arm.com>,
	dave.martin@arm.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: E3h+14DtLJ4y

Based-on: 20190110124951.15473-1-richard.henderson@linaro.org
aka the TBID patch set, which itself is based on the BTI patch set.

The full tree is available at

  https://github.org/rth7680/qemu.git tgt-arm-mte

This extension isl also spelled MTE in the ARM.

This patch set only attempts to implement linux-user emulation.
For system emulation, I still miss the new cache flushing insns (easy)
and the out-of-band physical memory for the allocation tags (harder).

From a few mis-steps in writing the test cases for the extension,
I might suggest that some future kernel's userland ABI for this have
TCR.TCMA0 = 1, so that legacy code that is *not* MTE aware can use
a frame pointer without accidentally tripping left over stack tags.
(As seen in patch 5, SP+OFF is unchecked per the ISA but FP+OFF is not.)

OTOH, depending on the application, that does make it easier for an
attack vector to clean the tag off the top of a pointer to bypass
store checking.  So, tricky.


r~


Cc: Ramana Radhakrishnan <ramana.radhakrishnan@arm.com>
Cc: Will Deacon <will.deacon@arm.com>
Cc: dave.martin@arm.com
Cc: szabolcs.nagy@arm.com
Cc: catalin.marinas@arm.com
Cc: mark.rutland@arm.com

Richard Henderson (17):
  target/arm: Add MTE_ACTIVE to tb_flags
  target/arm: Extract TCMA with ARMVAParameters
  target/arm: Add MTE system registers
  target/arm: Fill in helper_mte_check
  target/arm: Suppress tag check for sp+offset
  target/arm: Implement the IRG instruction
  target/arm: Implement ADDG, SUBG instructions
  target/arm: Implement the GMI instruction
  target/arm: Implement the SUBP instruction
  target/arm: Implement LDG, STG, ST2G instructions
  target/arm: Implement the STGP instruction
  target/arm: Implement the LDGV and STGV instructions
  target/arm: Set PSTATE.TCO on exception entry
  tcg: Introduce target-specific page data for user-only
  target/arm: Add allocation tag storage for user-only
  target/arm: Enable MTE
  tests/tcg/aarch64: Add mte smoke tests

 include/exec/cpu-all.h            |  10 +-
 target/arm/cpu.h                  |  18 ++
 target/arm/helper-a64.h           |  11 +
 target/arm/internals.h            |  22 ++
 target/arm/translate.h            |  13 ++
 accel/tcg/translate-all.c         |  28 +++
 linux-user/mmap.c                 |  10 +-
 linux-user/syscall.c              |   4 +-
 target/arm/cpu.c                  |  10 +
 target/arm/cpu64.c                |   1 +
 target/arm/helper.c               |  99 ++++++--
 target/arm/mte_helper.c           | 369 ++++++++++++++++++++++++++++++
 target/arm/translate-a64.c        | 305 ++++++++++++++++++++----
 tests/tcg/aarch64/mte-1.c         |  27 +++
 tests/tcg/aarch64/mte-2.c         |  39 ++++
 target/arm/Makefile.objs          |   2 +-
 tests/tcg/aarch64/Makefile.target |   4 +
 17 files changed, 907 insertions(+), 65 deletions(-)
 create mode 100644 target/arm/mte_helper.c
 create mode 100644 tests/tcg/aarch64/mte-1.c
 create mode 100644 tests/tcg/aarch64/mte-2.c

-- 
2.17.2

