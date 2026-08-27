Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1C1CC61DB9
	for <qemu-arm@archiver.kernel.org>; Thu, 27 Aug 2026 05:10:32 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wzSNY-0002Rf-2f; Thu, 27 Aug 2026 01:10:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1wzSNW-0002R7-NV
 for qemu-arm@nongnu.org; Thu, 27 Aug 2026 01:10:18 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1wzSNT-0003yZ-Kr
 for qemu-arm@nongnu.org; Thu, 27 Aug 2026 01:10:18 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 98e67ed59e1d1-38511175ad3so345874a91.2
 for <qemu-arm@nongnu.org>; Wed, 26 Aug 2026 22:10:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1787807414; x=1788412214; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=U0GeqQ+RGSdjpn23RnRlwS7n66mf1Vtk0bCrAtGxWPU=;
 b=JYU540DUQuMUAR5ERF+e9zzPy1V8F/B4u6OvuEW0RB7IUdFfwJ/aNn8Iw9o1WM1PV/
 QtSOxpfkDNdb2jCTCO5JO0NlcqN79gJBwVLvOw7RGyrfD0/wtMOuL8BLKUOuUbtkQYKN
 I2ctQb9utfhcBYCuHr8scETsHjgC6aADDocdncuHRdEXixnJIyesEsJTIRS28RpD952S
 SU/K43PPYvONpyCHXyzRJFBDHaXS8UVl5GtbYNv89dWGf65P/eMu90G213YkjsN9eO0A
 Q00UUy+9Et6vsZSjAtoTb6yz9Ubv0BmOgiCJABsoKT0m7FuFNDnzpRFg1U+58IBHDPh2
 dHvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787807414; x=1788412214;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=U0GeqQ+RGSdjpn23RnRlwS7n66mf1Vtk0bCrAtGxWPU=;
 b=eaBAs7AamMzMWGs3eZy3qUikasfRzLf5Ir4fTtKDJUdzKb7LAC2n5yZTh/7Kbliep3
 CwRjTAoOMm5ui6RTf0hXUeA9XlCOsDJPbCF9b05uitMxByaL63SJ0kb4qndOZ8EOYTtw
 K2XJfHJWKcn5NkcRarcW8dj+D9l6uV3TucLP1Y6u6/8THP6CuRiSNlxpv9v0smtZnLE3
 4tUoSUrN/aLUFOJpIAWXMVSg6m3wwPD1/mNuh2UvYEDoRIU7iDt80SnVQRq1h9gIXhzK
 mnh5iJa64cHV/6PUuLceoIJEBzaju5436S2vGzS3BSOFByVLvFDyyVV9TSAuNv9L+OYg
 4C0g==
X-Forwarded-Encrypted: i=1;
 AHgh+RokeIORSP1Ir9HMsBijGY7QXJEO0HL/9t01C/xyNj0jvyfUo/9/TAnXqHCyXoKTuxmYn9YA15Bgig==@nongnu.org
X-Gm-Message-State: AFuF++nyRZofpQJSM07CKM9lybdAJhJolod7tHJ00xIz/Ns3upJ49ig1
 2z+PvthFHeAZD93EclNRizUpKscn6ZBtwtUBO0SXEm/V9W918rkRA5VF
X-Gm-Gg: AR+sD1023xPwHcYP6EERoGFOr5+8BcIFZCDV10k+nwHJ0L1iICWC9gZUHd6eDkKyA5u
 2vXsNbOU7JHNoInpmJRNIjw6W1j/fs70MLQRHlrO/xY1e0STwoh/PEyj/3DKtxhliZSo7RwiDoS
 mDUhsGCa0G8vP0WhVQtF/RpHr0ETmISU4gkiU9mhsNB41iJllsqzF6YdMC8r5qGu0ZxynArsQBW
 jCZ8do7yTeBh8+KXjtmE0rj8fiMzwsegWP0eMuc4XUd14NeQWLeTzlfdy9woH5aOLT+CykVfmpc
 m9TRleY5TCFBtAZwpQY3RVTVMWggWpZaDtaKsd+03M883VCwRTAKCa47Uc7WSrrpqeH1n3KXUdx
 i2lEBRmcq9xqtEcc3o+09OBuc9TLKqzGtxL3VlrjV9aUd78rsBLZcziflBqtqIxFx0nWgfqgqLO
 Flar1LctH/H//0Adj1MaUeF4o+QfObL8xN3VpQPIAwlqyPE+Jpf8U2RK4RrwMahjRBkOKxsVyYH
 7nx60ii/1XunXpz8LNOxNmeCNa8mkDjcg1u8bNTVHal5fUKa426urcyOAO7QSHiiQGcIz5fDaE9
 00V6Dz+F5EhOTlG5Zue7
X-Received: by 2002:a17:90b:4c09:b0:37f:e177:f58 with SMTP id
 98e67ed59e1d1-3966d3dcdb1mr23283816a91.9.1787807414025; 
 Wed, 26 Aug 2026 22:10:14 -0700 (PDT)
Received: from donnager-debian.. ([180.150.112.50])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-39670599275sm2210473a91.0.2026.08.26.22.10.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Aug 2026 22:10:11 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: Alistair Francis <alistair.francis@wdc.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, Weiwei Li <liwei1518@gmail.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
 Michael Ellerman <mpe@kernel.org>,
 Portia Stephens <portias@oss.tenstorrent.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org
Subject: [PATCH 00/12] tests/tcg: Multiarch tests for riscv64
Date: Thu, 27 Aug 2026 14:39:39 +0930
Message-ID: <20260827050953.67184-1-joel@jms.id.au>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=joel.stan@gmail.com; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.001,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

When testing Richard's TCG RVV changes I went down the rabbit hole that
is tests/tcg/multiarch. Out the other side is this series, which enables
the multiarch and record/replay tests for riscv64, and fixes the
memory-sve aarch64 test while adding a memory-rvv test for riscv64.

The first half of the series performs some housekeeping on the semihost
tests and the softmmu makefile in tests/tcg/riscv64. The second half
enables the multiarch tests, and looks at the vectorised memory.c test.

The final patch adds a very coarse check for vectorisation by grepping
objdump for vector loads and stores. Although it's not the neatest, it
would have caught the regression in memory-sve, so it is worthwhile
having in the tree.

Joel Stanley (12):
  tests/tcg/riscv64: Include stdint.h in semicall.h
  tests/tcg/riscv64: Clean up semicall.h inline asm
  tests/tcg/riscv64: Boot semihost tests with -bios none -kernel
  tests/tcg/riscv64: Update semihosting linker script
  tests/tcg/riscv64: Rework rules for semihost tests
  tests/tcg/riscv64: Enable multiarch system tests
  tests/tcg/riscv64: Enable memory record and replay test
  tests/tcg/aarch64: Don't leak memory-sve CFLAGS
  tests/tcg/multiarch: Fix vectorisation of memory test
  tests/tcg/riscv64: Enable vectorised memory test
  configure: Provide OBJDUMP to the tcg tests
  tests/tcg: Check vector memory tests contain vector ops

 configure                                 |  11 ++
 tests/tcg/riscv64/semicall.h              |  12 +-
 tests/tcg/multiarch/system/memory.c       | 113 ++++++++----------
 tests/tcg/riscv64/system.c                |  30 +++++
 tests/tcg/Makefile.target                 |  10 +-
 tests/tcg/aarch64/Makefile.softmmu-target |   3 +-
 tests/tcg/riscv64/Makefile.softmmu-target | 134 +++++++++++++---------
 tests/tcg/riscv64/boot.S                  |  23 ++++
 tests/tcg/riscv64/semihost.ld             |  47 ++++++--
 9 files changed, 251 insertions(+), 132 deletions(-)
 create mode 100644 tests/tcg/riscv64/system.c
 create mode 100644 tests/tcg/riscv64/boot.S

-- 
2.47.3


