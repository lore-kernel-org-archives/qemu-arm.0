Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12C9AF364C9
	for <qemu-arm@archiver.kernel.org>; Thu,  9 Apr 2026 22:07:34 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wAxW6-00086D-T8; Thu, 09 Apr 2026 18:06:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lucaaamaral@gmail.com>)
 id 1wAxW5-00085l-G3
 for qemu-arm@nongnu.org; Thu, 09 Apr 2026 18:06:25 -0400
Received: from mail-dy1-x132a.google.com ([2607:f8b0:4864:20::132a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <lucaaamaral@gmail.com>)
 id 1wAxW3-0000Zl-MU
 for qemu-arm@nongnu.org; Thu, 09 Apr 2026 18:06:25 -0400
Received: by mail-dy1-x132a.google.com with SMTP id
 5a478bee46e88-2c54c68db4dso2370352eec.0
 for <qemu-arm@nongnu.org>; Thu, 09 Apr 2026 15:06:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1775772382; x=1776377182; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=f1VQ1/2eZSo42FEAPmLv+CqNGqhkXL9pMDIBU0jSjJ4=;
 b=Bc9bKj2SBYDLJLhPmmhKrTc7Q+3JR34GyiqlywwhXpNqlU1lFPz+krbFnXXfijjROo
 uxxOmDQQAUVcC5sETe8+Bc3LuoIvSAkBqLHX6sg5vOdFgsuUlk2ziiJlThu8Jgy8VYQB
 pZY3C03zpYeJOhFZI5Y4LGXPm0gnXykAvc65INahcU8yjP9FEnB3GFUxXgsRrY+0EBRT
 lXBx6Y5Rs4VJayBM6KQA4N7nALpcqVcLrkdi0+QUVq98POkRwKCQhZPLWEh+899s+XkI
 iFva87GOxx930PzyFigiqTrAwiyxo9jbjzbtKtzKNE86QN/U0t3xuAX8fTFcoP0QQ36S
 qRCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775772382; x=1776377182;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=f1VQ1/2eZSo42FEAPmLv+CqNGqhkXL9pMDIBU0jSjJ4=;
 b=NC+MMjEOkCqN50XY1rgulxhb+wftkx3+VQG+Y9NiNF25aDZvIUs5cf/3NPWNCitX3f
 zupg07QJaxUONfRCI3X4myxAL0l31sKvATB6znBKvVKM9khKydV/AVfAYIUq1vSVeXy3
 Oeyvnf7KYFsJv8Breu0U+e2gIyeDPRXzsmeuewziwVXO/o8bZtdYuzL+l/oEfrPQ+805
 yFbQunfDf6zV4RLu0LX43X0/7OA95pu+NZmyR+3oMjFqA5cGqJ2jLo7yGdfxEuMX+CID
 /wC0RuoBiL5+6zWmSd7gXt+IMaNZT8/O04JVLzWgLaKDKfwkZ3+bllkP9hXA991+3sNG
 BUCA==
X-Gm-Message-State: AOJu0Yxlcl50hWNfTktuiLkR+EBWPa9WKC5aXKRQNJY8QfC2TjqEPV1d
 ghcJPdtecTqmxCzQS+U3Bh1Bb92a8m4h2MdVYklL3zrRKq2rRx7p9cfE
X-Gm-Gg: AeBDietAKTPV+p2iwzmyLKzSbsrZfypQuKqNAmzFgr/6Kz82JeGuipl0QEM9nij+qmt
 XxoYHsI+hP2KjP/xw0nVh10xScaNvLHH9C6Tve9MJdbhvWQaPtqpkL+ydNFy7RxSf+6R5GaRqdS
 ska8fFRnzwFevuG264hFEJ1atOdYGknfWiN1aWVfkzII9sofdJiM+JPH9JKzBXEoFZQRlQsDigh
 eWtFm0quvvX9Pn5uA/fJM9dUVIdXEATrownE4WKTbkLBefyKSJr5rfNrcYb6HvmpGjBcLmL88Q2
 FB0HcQEBy9aVs89ekljgfmQ1phcmN3XLCXxrJRHsCH0vkXrNmeQMYTjuacvxWPiK9h1fikD8xT8
 fNpPIjplIDFM9YEFPxk9L1SdZYs/Jck/gQH5b9zUBX7np2v4gzAZRhaINf/LVR5RrrJcg6BGAWy
 mzXRkMWyH21QTooBiPcCY0Jxrwep/FomVxzWRzbPBD/F3NCY37Vu7jxcyBSm92yA==
X-Received: by 2002:a05:7300:7c04:b0:2d4:532e:7e45 with SMTP id
 5a478bee46e88-2d5898aaaf4mr534764eec.23.1775772381665; 
 Thu, 09 Apr 2026 15:06:21 -0700 (PDT)
Received: from localhost.localdomain ([2804:7f4:c030:bb40:195d:78fd:ecba:d45])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-2d561bde68bsm1534567eec.17.2026.04.09.15.06.18
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 09 Apr 2026 15:06:21 -0700 (PDT)
From: Lucas Amaral <lucaaamaral@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, agraf@csgraf.de, peter.maydell@linaro.org,
 mohamed@unpredictable.fr, alex.bennee@linaro.org,
 richard.henderson@linaro.org, Lucas Amaral <lucaaamaral@gmail.com>
Subject: [PATCH v6 0/6] target/arm: ISV=0 data abort emulation library
Date: Thu,  9 Apr 2026 19:06:08 -0300
Message-ID: <20260409220614.65558-1-lucaaamaral@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::132a;
 envelope-from=lucaaamaral@gmail.com; helo=mail-dy1-x132a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

Add a shared emulation library for AArch64 load/store instructions that
cause ISV=0 data aborts under hardware virtualization, and wire it into
HVF (macOS) and WHPX (Windows).

When the Instruction Syndrome Valid bit is clear, the hypervisor cannot
determine the faulting instruction's target register or access size from
the syndrome alone.  This previously hit an assert(isv) and killed the
VM.  The library fetches and decodes the faulting instruction using a
decodetree-generated decoder, then emulates it directly against the vCPU
register file and memory.

The library uses its own a64-ldst.decode rather than sharing
target/arm/tcg/a64.decode — TCG's trans_* functions emit IR into a
translation block, while this library's execute directly.  Decode
patterns are kept consistent with TCG's where possible; differences
are noted in the relevant commit messages.

Changes since v5:
  - Replace cpu_memory_rw_debug() with get_phys_addr() +
    address_space_read/write() for proper guest MMU translation
    instead of debug access path (Richard Henderson)
  - Handle page-crossing accesses via per-page chunked loop
    instead of rejecting them
  - Replace custom sign_extend() with sextract64() from
    qemu/bitops.h (Richard Henderson)
  - Remove unnecessary (void) casts (Richard Henderson)
  - Add guest endianness support: be_data flag with
    ldn_le_p/ldn_be_p byte-order-aware helpers instead of
    host-endian memcpy (Richard Henderson)

Changes since v4:
  - Rebased onto current master
  - Add SPDX license identifier to new meson.build
  - Resent as new top-level thread (Alex Bennée)

Changes since v3:
  - Document decodetree pattern differences from TCG in commit
    messages for patches 1/6 and 5/6.

Changes since v2:
  - Inject synchronous external abort (matching kvm_inject_arm_sea()
    syndrome) on unhandled instruction or memory error, instead of
    silently advancing PC or returning an error.
  - Fix WHPX advance_pc bug: error paths no longer advance PC.
  - Add page-crossing guard in mem_read/mem_write to prevent partial
    side effects.

Changes since v1:
  - Split monolithic patch into 6 incremental patches: framework, then
    one patch per coherent instruction group (Peter)
  - Removed per-backend callback ops; library uses CPUArchState directly
    for memory access (Mohamed)
  - Removed mock unit tests (Mohamed; kvm-unit-tests is the right
    vehicle for decoder validation)
  - Added architectural justification for separate decode file

Lucas Amaral (6):
  target/arm/emulate: add ISV=0 emulation library with load/store
    immediate
  target/arm/emulate: add load/store register offset
  target/arm/emulate: add load/store pair
  target/arm/emulate: add load/store exclusive
  target/arm/emulate: add atomic, compare-and-swap, and PAC load
  target/arm/hvf,whpx: wire ISV=0 emulation for data aborts

 target/arm/emulate/a64-ldst.decode | 293 +++++++++++
 target/arm/emulate/arm_emulate.c   | 805 +++++++++++++++++++++++++++++
 target/arm/emulate/arm_emulate.h   |  30 ++
 target/arm/emulate/meson.build     |   8 +
 target/arm/hvf/hvf.c               |  46 +-
 target/arm/meson.build             |   1 +
 target/arm/whpx/whpx-all.c         |  61 ++-
 7 files changed, 1240 insertions(+), 4 deletions(-)
 create mode 100644 target/arm/emulate/a64-ldst.decode
 create mode 100644 target/arm/emulate/arm_emulate.c
 create mode 100644 target/arm/emulate/arm_emulate.h
 create mode 100644 target/arm/emulate/meson.build

-- 
2.52.0


