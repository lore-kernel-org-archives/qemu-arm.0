Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73BF0C55167
	for <qemu-arm@archiver.kernel.org>; Fri, 31 Jul 2026 00:07:04 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wpakW-0001h9-5D; Thu, 30 Jul 2026 20:05:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wpakR-0001a2-HJ
 for qemu-arm@nongnu.org; Thu, 30 Jul 2026 20:05:11 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wpakM-0001Gq-UI
 for qemu-arm@nongnu.org; Thu, 30 Jul 2026 20:05:08 -0400
Received: by mail-pg1-x529.google.com with SMTP id
 41be03b00d2f7-ca7c1176317so308878a12.1
 for <qemu-arm@nongnu.org>; Thu, 30 Jul 2026 17:05:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1785456305; x=1786061105; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=M4s43wQWqjMi7QpvQ0agCHumO9YRvt/SOatjgS+qX7A=;
 b=Ph4rBL88hnby65ff5LmDi7OetV8oqqeTK/lr95tUNHKIOijUHwoEflIIZmzDeVXq0h
 uMoSrdA/jmqp11ZRiMTVvYz1tKU6AfRQ5dVTSgwodUkL8yG1FsrvJgyLZR7YlGu13ycX
 QqHGOsPTHX3B3uf2z90LhMZV4nmtw9PkGkKj+E66SyMrnlyRPJYVlIHBpD4IeqXTtQnz
 P6TTsJ4DXttZuM6syYAY+qCqeAPaGib4RCdgned2j9XNTHGzgNi6N+3l0sl9HeWyece5
 6FgYq7ETXo4QVcOsscLE05zCaf6YElwjyGkKDB6wRYqbjU++Lum2VFydAVtuuQLjAuj5
 mTAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785456305; x=1786061105;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=M4s43wQWqjMi7QpvQ0agCHumO9YRvt/SOatjgS+qX7A=;
 b=Nwx6odjJMTHycmF0VHDz/PxpQxEhMiC93tQLSSlC0qXjZes0eJXP0o8gaNfci4uPgH
 EfO4Kr95fJNRp8O+0IGI8qgTgJvkUy/R30QOyx1Vz/rPTYSFBQUXAgjpU1azaaKK/pMK
 VbgBKCZIEAI3wDbK4OR5lNAqGWeEINBDaAUQQRtmBwvPeAxzzgnag7tfqXHtG3O0KBQI
 kZJcA6dB0nV76G8wauuSgK75n5aLfuQjFkX8HX1D6MFli7b8xYwiQvYo7+BwBzNc+rhQ
 wtXxzYH9sWGC3dSDG4VD7QcJWpIj05VcHWtdhVvxrgh5MSZMEjDbM6YGFsn2JMysCU11
 XDrw==
X-Forwarded-Encrypted: i=1;
 AHgh+Rp5vm/tInxaPM1M38IB5gwZGo5i8U2pL7MO/deG3+yetTlq7EECp6bD5xtcBp2mEJ2+3nIACxuH6w==@nongnu.org
X-Gm-Message-State: AOJu0YwJzOnf+l4bRrSNyCB7rRL3pWyjFCJ6IZcfxgNwPnGHnIRmgejM
 mavyXLWIRI1lDsjtoFRC0ePyJg16VvSce09dM7UoQVlmNvXUPpaB9Dk4QlVFBBb6IRk=
X-Gm-Gg: AR+sD12LuPCBv9wxk4Od6JyD/m1fKCgy5pNcOgsOY1IhgmVfD4lUIH/G0RkxhGZ9N6E
 Xz8NwEIU8CghEI4uyMjJM24PdgZfwLCIag3HpdmxOOpqtyXeGqy2C9qWM/o3Ldy770ClGMwmnKU
 kHMCSSc0ipCrXgNRUiokiD+EFqd5MlHhat1/rHJGWmY0oOjcljjC7/HAaIUXebdfOvK5Yde0WA7
 G3xs/ulbddFQdcw/XeHnMWtHTcVhWRnd8V58qWdxf7npwIQ0FlBoxRuwKkbGCXP0EEnYEsmhJIh
 kH7n9Y/jshdC73Bn6rA9cG8Aw2Fblol2OeU7r7+Y5Bb0fXuu1EnblexKSJbZSMd4TDBnSns5Btc
 LykIiqffHkH9U6zuoiI1X82J9Kci6zHSZZo1wYVntTUxxET4eJff5vGDPCS0VUP8dVNj2osvAaF
 mkeAS/u2OgUETODLsCc3hhfK7IjfQVV5i/rlPlMfZyTi+UzlZHnqWJpy88ajnEd/cLm4bCHiFT3
 qpXUtdoo4L0hqy0Un7y
X-Received: by 2002:a05:6a20:cfa1:b0:3bf:6c08:fb8e with SMTP id
 adf61e73a8af0-3c9008d25b5mr4634370637.48.1785456304493; 
 Thu, 30 Jul 2026 17:05:04 -0700 (PDT)
Received: from stoup.. (174-21-93-59.tukw.qwest.net. [174.21.93.59])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-cbdb7a999ddsm2656460a12.4.2026.07.30.17.05.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Jul 2026 17:05:04 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: anjo@rev.ng, qemu-arm@nongnu.org, git@xen0n.name, 17746591750@163.com,
 maobibo@loongson.cn, lixianglai@loongson.cn, philmd@mailo.com
Subject: [PATCH 00/11] tcg: Add revbit opcodes
Date: Thu, 30 Jul 2026 17:04:52 -0700
Message-ID: <20260731000503.170446-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x529.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Adding these have been at the back of my mind for a while.  Most recently
tickled by the Octeon additions, and Anton's helper-to-tcg work.

I didn't add a 16-bit function or opcode because no host implements it.
The 16-bit reverse that the hexagon target does can be implemented with
a 32-bit reverse plus a shift.


r~


Richard Henderson (11):
  tcg: Fix opcode dump for bswap
  tcg: Add tcg_gen_revbit{32,64}
  target/arm: Use generic tcg_gen_revbit*
  target/loongarch: Use generic tcg_gen_revbit*
  target/loongarch: Expand bitswap inline
  target/mips: Expand octeon reflections inline
  tcg: Add revbit{32,64} opcodes
  tcg/optimize: Handle revbit{32,64}
  tcg/aarch64: Implement revbit{32,64}
  tcg/loongarch64: Import REVBIT insns
  tcg/loongarch64: Implement revbit{32,64}

 include/tcg/tcg-op-common.h                   |   3 +
 include/tcg/tcg-op.h                          |   5 +
 include/tcg/tcg-opc.h                         |   2 +
 target/arm/tcg/helper-a64-defs.h              |   1 -
 target/arm/tcg/helper-defs.h                  |   1 -
 target/loongarch/tcg/helper.h                 |   4 -
 target/mips/helper.h                          |   7 -
 target/arm/tcg/helper-a64.c                   |   5 -
 target/arm/tcg/op_helper.c                    |   5 -
 target/arm/tcg/translate-a64.c                |   4 +-
 target/arm/tcg/translate.c                    |   2 +-
 target/loongarch/tcg/op_helper.c              |  21 -
 target/mips/tcg/octeon_crypto.c               |  35 -
 target/mips/tcg/octeon_translate.c            |  49 +-
 tcg/optimize.c                                |  48 +-
 tcg/tcg-op.c                                  |  78 ++
 tcg/tcg.c                                     |   8 +-
 docs/devel/tcg-ops.rst                        |  11 +
 .../loongarch/tcg/insn_trans/trans_bit.c.inc  |  29 +-
 tcg/aarch64/tcg-target.c.inc                  |  24 +
 tcg/loongarch64/tcg-insn-defs.c.inc           | 944 +++++++++---------
 tcg/loongarch64/tcg-target.c.inc              |  26 +
 tcg/ppc64/tcg-target.c.inc                    |   8 +
 tcg/riscv64/tcg-target.c.inc                  |   8 +
 tcg/s390x/tcg-target.c.inc                    |   8 +
 tcg/sparc64/tcg-target.c.inc                  |   8 +
 tcg/tci/tcg-target.c.inc                      |   8 +
 tcg/x86_64/tcg-target.c.inc                   |   8 +
 28 files changed, 787 insertions(+), 573 deletions(-)

-- 
2.43.0


