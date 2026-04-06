Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4513EF46C6D
	for <qemu-arm@archiver.kernel.org>; Mon,  6 Apr 2026 18:27:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w9oeV-0007Ig-Bj; Mon, 06 Apr 2026 14:26:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1w9oeS-0007I4-Pw
 for qemu-arm@nongnu.org; Mon, 06 Apr 2026 14:26:20 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1w9oeQ-0002KP-TM
 for qemu-arm@nongnu.org; Mon, 06 Apr 2026 14:26:20 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 98e67ed59e1d1-35d8e548a05so4649415a91.1
 for <qemu-arm@nongnu.org>; Mon, 06 Apr 2026 11:26:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1775499977; x=1776104777; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=M97suiVPrp1lyPoQkNqQ+dJH5bK6giyR71NuVAofqHg=;
 b=OxNfHvYfZXxzG+aV9vD7p6arQsibchSxxSo5qLLnunk0SGGffVlo/zz9YeYBxm6WKf
 Jj8TZkxuqWy54y1/8EITCTw9Kq0v5Sl7oV6ZLzpTyUmGh1sp44Ce2kz6CrNF5NzVOVIy
 j3NCtd0Zr/rQi9NMBg85i8KoYvxEJUd9+DYA6AQGw2DCVVjTKWjfoza5KILIUDLJdbWg
 XEtghhV/VoQQFs4qKZT60gHRH+wcQK9qYX/Sm3q5h3ipo8abR9XnxLZyvqSkP+0CPGX1
 qi0sHtZGKEcj1iiK7HKep92JZZzt58BSy3h/uiNsPTQUYpn8ikDbXPVE6KBc1+T7GEfU
 XNgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775499977; x=1776104777;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=M97suiVPrp1lyPoQkNqQ+dJH5bK6giyR71NuVAofqHg=;
 b=OaFvsFuopdOVUPIAnu3LJoE875qtijm9J0STio9HPYE4A4SZDMX6cTRSSobLD/UmVu
 EaezpXowd20/kqdJXvsO1RCrTu9JIsseZ0dbm2VmTHVQt4Ik5WlKaXVy8kGzEB48yMkC
 95jHdMyiqLKdWv+8JxgX+w5fyWyR1WkkXsjTBReJ2OobLgenkMXCTAvtn7rq4KOg1H/q
 e72wvt6hOjblOcWo9o2QsxzbaJuy8/bxSq/V6nUuupBCxf42gN/QhTjc1DI2OcEM61v+
 n30YfGj1vWgjKJKyw9QQ8RgHTR5+rg63BAte2hLHieECLLhKQflbZUoC+xUui+qIYoZl
 O96A==
X-Forwarded-Encrypted: i=1;
 AJvYcCV/Azu+ZAfOQdBjM0sil5prs7ElGj6xj6K3HPaj63qjpXb1uCziwdnXDDc+lLZvDa20TgPP4uMtlw==@nongnu.org
X-Gm-Message-State: AOJu0YzS8ZCokCtC1csW/NJ3mkZnxd7nvxLXiIzHZF/ErVHsplT3DjgB
 Y9zDqg1l8rWaPW0LqYIXEQOHR/9RcmD/sT4w9flTtkcnJ3Hs8+rsZFt4xHK36NtIGTU=
X-Gm-Gg: AeBDiesZlY3z82wUm1wq0jLe/HH22J4lHIwCbPdx1RuhPQASXBEGpwHicJWHV87xNSh
 sr9BXMB/v2PJPGR10eobOiiwhQC/SKm3f6DtfYZMrg6LlgBNNWo57JEe4UFAaZZXRcz25IUydP8
 Sn62IIYweOfMmsebBWE40yUE1+8sVaFeP4oSpoUw2m+GEa3HZRBdpBgz7sJosrkSV6HoeAkImwx
 rL4uNQi1wzx8ZfO4RhT3k7XMNyJtBfFAWNSIfSQsmLv9eiASsybZamUT0qH/9SEF/fP02Jte/2+
 0kF//ytfiXcSSboCilltQBT/w6zpzg0nDUriSHOporZKEockcz0FQBplVz8XFjz3Hu0xW4uVoqw
 1ncb6R1jqk8UINO3ZKtCL6PXrjP0gxS449pOsSybxfm6QLKKJdgz/FvJD+RPI6hpbxFHKv5Jicr
 wa+UhqOGRx3RQWN2fvUUuVEq56vqJXIlS7uiypXlzZuEr1YxfBZy62OsOFeTK2sh2gqKocotmcq
 JDBKgFUY0+GjUA=
X-Received: by 2002:a05:6a20:12c5:b0:39f:24ad:ad00 with SMTP id
 adf61e73a8af0-39f2ed758bamr14155230637.7.1775499976973; 
 Mon, 06 Apr 2026 11:26:16 -0700 (PDT)
Received: from pc.taild8403c.ts.net (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c76c6561fe9sm12765080a12.15.2026.04.06.11.26.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Apr 2026 11:26:16 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>, jim.macarthur@linaro.org,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, philmd@linaro.org, qemu-arm@nongnu.org
Subject: [PATCH v8 00/20] target/arm: single-binary
Date: Mon,  6 Apr 2026 11:25:49 -0700
Message-ID: <20260406182609.193886-1-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pj1-x1031.google.com
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

This series tackles (most of) the rest of target/arm, especially tcg folder.

We extract tcg memory operation in a new header, with a new type representing
virtual addresses.

Initially, I went down the way to have a dynamic definition of TCGv, which
required much more boilerplate and runtime checks. After discussing with
Richard, I realized it was not needed, and that could simply split 32 and 64 bit
properly in different files instead. This approach will not work with other
architectures, requiring something else, but it's enough for target/arm.

Files left are:
- target/arm/tcg/mve_helper.c
- target/arm/tcg/m_helper.c
- target/arm/tcg/cpu32.c

v8
--

- make translate.c compilation unit common.

v7
--

- add parameter to translator_loop to indicate address type for current tb.
- remove TCGv from target/arm/tcg/translate.c

v6
--

- meson.build: extract decode files in separate variables and explicitly include
  them in user and system code. The duplication is now minimized: one instance
  for all system binaries, and one per user binary.

v5
--

- reimplemented what v0 did with new approach defining new tcg-op-mem header
- reapply all straightforward patches from v0
- only translate.c is left, but first want to validate that changes here are ok
  for maintainers before doing more.

v0
--

See original thread:
https://lore.kernel.org/qemu-devel/20260109053158.2800705-1-pierrick.bouvier@linaro.org/#t

Note about v1 -> v4
-------------------

- After v0 which was trying to do too many changes, v1 to v4 focused on smaller
  things, and all patches have been merged already.
  https://patchew.org/QEMU/20260219040150.2098396-1-pierrick.bouvier@linaro.org/

Pierrick Bouvier (20):
  include/tcg/tcg-op: extract memory operations to tcg-op-mem.h
  target/arm/translate.h: remove tcg-op.h include
  target/arm/tcg/translate.h: remove tcg-op-gvec.h include
  target/arm/tcg/translate.h: remove TARGET_AARCH64
  target/arm/tcg/translate-vfp.c: make compilation unit common
  target/arm/tcg/translate-neon.c: make compilation unit common
  target/arm/tcg/translate-mve.c: make compilation unit common
  target/arm/tcg/translate-m-nocp.c: make compilation unit common
  target/arm/tcg/op_helper.c: make compilation unit common
  target/arm/tcg/gengvec.c: make compilation unit common
  target/arm/tcg/translate.c: remove MO_TE usage
  target/arm/tcg/translate.c: replace target_ulong with uint32_t
  tcg/translator: add parameter to translator_loop for current addr type
  target/arm/tcg/translate.c: replace TCGv with TCGv_va
  target/arm/tcg/translate-a64.c: use translator_ldl_end instead of
    arm_ldl_code
  target/arm/tcg/arm_ldst.h: merge in translate.c
  target/arm/tcg/translate.c: replace translator_ldl_swap with
    translator_ldl_end
  target/arm/tcg/translate.c: remove target_ulong
  target/arm/tcg/translate.c: remove TARGET_AARCH64
  target/arm/tcg/translate.c: make compilation unit common

 include/exec/translator.h        |   4 +-
 include/tcg/tcg-op-mem.h         | 126 +++++++++++++++++++++++++++++++
 include/tcg/tcg-op.h             | 100 +-----------------------
 include/tcg/tcg.h                |   5 ++
 target/arm/internals.h           |   2 +
 target/arm/tcg/arm_ldst.h        |  47 ------------
 target/arm/tcg/translate.h       |  14 +---
 accel/tcg/translator.c           |   4 +-
 target/alpha/translate.c         |   3 +-
 target/arm/tcg/op_helper.c       |   1 -
 target/arm/tcg/stubs32.c         |  24 ++++++
 target/arm/tcg/translate-a64.c   |  14 +++-
 target/arm/tcg/translate-sme.c   |   1 +
 target/arm/tcg/translate-sve.c   |   1 +
 target/arm/tcg/translate.c       |  80 +++++++++++++-------
 target/avr/translate.c           |   3 +-
 target/hexagon/translate.c       |   3 +-
 target/hppa/translate.c          |   3 +-
 target/i386/tcg/translate.c      |   3 +-
 target/loongarch/tcg/translate.c |   3 +-
 target/m68k/translate.c          |   3 +-
 target/microblaze/translate.c    |   3 +-
 target/mips/tcg/translate.c      |   3 +-
 target/or1k/translate.c          |   3 +-
 target/ppc/translate.c           |   3 +-
 target/riscv/translate.c         |   3 +-
 target/rx/translate.c            |   3 +-
 target/s390x/tcg/translate.c     |   3 +-
 target/sh4/translate.c           |   3 +-
 target/sparc/translate.c         |   3 +-
 target/tricore/translate.c       |   3 +-
 target/xtensa/translate.c        |   3 +-
 target/arm/tcg/meson.build       |  57 ++++++++++----
 33 files changed, 312 insertions(+), 222 deletions(-)
 create mode 100644 include/tcg/tcg-op-mem.h
 create mode 100644 target/arm/tcg/stubs32.c

-- 
2.47.3


