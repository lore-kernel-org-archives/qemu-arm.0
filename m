Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88BD0F46C47
	for <qemu-arm@archiver.kernel.org>; Mon,  6 Apr 2026 15:05:03 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w9lVR-0002sf-OU; Mon, 06 Apr 2026 11:04:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1w9lVP-0002ru-R5
 for qemu-arm@nongnu.org; Mon, 06 Apr 2026 11:04:48 -0400
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1w9lVN-0003q8-Ap
 for qemu-arm@nongnu.org; Mon, 06 Apr 2026 11:04:47 -0400
Received: by mail-pg1-x52f.google.com with SMTP id
 41be03b00d2f7-c70f91776fcso1523888a12.0
 for <qemu-arm@nongnu.org>; Mon, 06 Apr 2026 08:04:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1775487883; x=1776092683; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=xhWX4LN6/7U+l0GQfGNZYyz9ZAXayPixhHRwsoCZtho=;
 b=qFhypsFrXCREBjfjAdLxtpvu8oLFpSKLvcgHz1RfMYihbWzO2zLpk0Xuryx+Z8VwPY
 sh1fV4EQ+mG8RQ/RAMNhGJQDXkuHvwCU3KH5dSjYwWy8Q/R52G536QDVzpWAnzP2UE7m
 cyr16BFhXuGhFL4AZBwPivo08zzvFDxRwSmWZyNRQ39F1fNUMPGxvz9BflpZh4Qn9+Om
 atNbblG8Yi9Xw2gHTJSJPmt4F67Wv6SCfiUNy517mihFHPVMncVibmU4m/ivxjEYnOCQ
 2NmlpeXQQJe2FpTtjmhXs17gENqPihDCWEkmxZgtxxBWUKIMv8XwVINVXCJ24eCLg70R
 EgOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775487883; x=1776092683;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xhWX4LN6/7U+l0GQfGNZYyz9ZAXayPixhHRwsoCZtho=;
 b=bkANzpGslg0593YnWxa1ZK/9JvH968m8pECJfyvFWd7A6c6fnFUHv5l52SrjaPEVY3
 opJtcTN/ZuH82sEC76umeYzTaNbVJAHP5xnAhl/T0hAjsj8Iotuw0xyxMD6PzsHJxBwJ
 fbjlkVqHLWtjpuWw5buvjjFET2oGOQwe6neOwO7dGLWHI7oFP6kLolg1LgZv55BOxwkL
 IpRziJVmTRY93GwPSWV9/MC8kqqDNUW6myMXnXjJzV5Tgy4LVgzQL4wp34Y2+ya6ioV2
 IHhzzkp1ZKD4TFfqy7OqmsB3GPkg/eQnOKZSKeIbB07R6/rNCpS2Iqf2JM11CLs7tGUi
 Ookw==
X-Gm-Message-State: AOJu0YwkWxmJBuT1GIqnTuA60gyElXu37AB5CJBnkrIfJbaY+7zHuRo/
 NiE6HgW1Ob+pZuo8BoI0Ai1Fc3ll+JwjpVWIEU1OtU3zStt+V7fBgjQRuBB601sKObQ=
X-Gm-Gg: AeBDiespC54IX/uI0nConas4C4z4PT6dwqICst7QRq6f4UUEYJ6HR/9YrtIGEnQUJmA
 uh15xzP5kWxVA45J7yllmAZzy1YxtC638UIvBET9n+B19Mwrz51SEOS0tu3NrBp6WgM8+z6+A98
 IPXnT0CY/E4cOD9HbOEhRkck6cIvp/GlSnijPjwBFTimmAZTKSiUk9uaCWKzd/jeTX0YvCVCCRV
 0F3CTsAM0ps1uxvjmzhyZpNIizJdd9Lu29NwnYau+uTfSgTMW9ZvkgPvHfjWPo92F7mdPNMvMlE
 fl1StAT+3iJSydfOxLwDNj9C9QKnJqZ1zUIKgE0F+NrtwOhNW9xzbPFjy8E+piYRHd7IZVlOg3W
 rdWLEieN8FAgVzg52mOEsWvNNgDlbTld//kq7wewrkgHjZhZOhWyRvTrzloZ19Su/jpb+tWOGNK
 7ZWYSqQIxSpLIM6KDs1GHOH9csoBFzmdze68OJIUz+YuteW2ptBfXt0o7xC1laoTvj9FdGAiy0/
 0yuP5qMf5SITlM=
X-Received: by 2002:a17:903:3804:b0:2b0:59c4:e9dc with SMTP id
 d9443c01a7336-2b28170f376mr139020735ad.22.1775487883264; 
 Mon, 06 Apr 2026 08:04:43 -0700 (PDT)
Received: from pc.taild8403c.ts.net (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2b274979d72sm137770075ad.51.2026.04.06.08.04.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Apr 2026 08:04:42 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, philmd@linaro.org,
 jim.macarthur@linaro.org, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v7 00/14] target/arm: single-binary
Date: Mon,  6 Apr 2026 08:04:20 -0700
Message-ID: <20260406150434.407201-1-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pg1-x52f.google.com
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

Pierrick Bouvier (14):
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

 include/exec/translator.h        |   4 +-
 include/tcg/tcg-op-mem.h         | 126 +++++++++++++++++++++++++++++++
 include/tcg/tcg-op.h             | 100 +-----------------------
 include/tcg/tcg.h                |   5 ++
 target/arm/tcg/translate.h       |  14 +---
 accel/tcg/translator.c           |   4 +-
 target/alpha/translate.c         |   3 +-
 target/arm/tcg/op_helper.c       |   1 -
 target/arm/tcg/stubs32.c         |  17 +++++
 target/arm/tcg/translate-a64.c   |   1 +
 target/arm/tcg/translate-sme.c   |   1 +
 target/arm/tcg/translate-sve.c   |   1 +
 target/arm/tcg/translate.c       |  36 ++++-----
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
 target/arm/tcg/meson.build       |  51 +++++++++----
 31 files changed, 255 insertions(+), 160 deletions(-)
 create mode 100644 include/tcg/tcg-op-mem.h
 create mode 100644 target/arm/tcg/stubs32.c

-- 
2.47.3


