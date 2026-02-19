Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69C0CE9A03B
	for <qemu-arm@archiver.kernel.org>; Thu, 19 Feb 2026 04:03:55 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vsvFL-0008Ua-7d; Wed, 18 Feb 2026 23:02:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1vsvFE-0008SE-5X
 for qemu-arm@nongnu.org; Wed, 18 Feb 2026 23:02:29 -0500
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1vsvFA-0001HD-33
 for qemu-arm@nongnu.org; Wed, 18 Feb 2026 23:02:27 -0500
Received: by mail-pl1-x62c.google.com with SMTP id
 d9443c01a7336-2ad22a5e245so3451025ad.2
 for <qemu-arm@nongnu.org>; Wed, 18 Feb 2026 20:02:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1771473743; x=1772078543; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WTZflre1420AW/UKhqUXzYtghEaZbDSYkcNh+uvH6MI=;
 b=trvaq29W0kiR2qsh0NIPeNP7FikZ6J50jHb107vvRqCB0POFopXfP8P9KtNJO1yw+r
 gfbkJP69zFgX6HwiISxJe+T4hgsFqzB/W07Gfs9TFit7/SXdrvZBpda3PmZdt9YfpEXW
 uscwWptcyLYq0CJYX+7cWzF4RGEsaMMMTpQid08P9FillVylPDfQEvGw4Goz2XRdRX0h
 7+/b1CDEu1q8gFVnqPfx3x2/JDygNvcSGexElJokg83Bn79zU6TYrP09HPRWfLqMegbQ
 Bi/BGzK41VTViSUaJpqUKnDFaiLjBO+AUb2A+TyHAaG0py+n8Yi52zWrzX4oWNItPv2A
 m3iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771473743; x=1772078543;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=WTZflre1420AW/UKhqUXzYtghEaZbDSYkcNh+uvH6MI=;
 b=GXJIpJ/e601XKPErHoomZl2MKgUXk51vsVsoF1YeWytA89BKGmxwUUeXtObnUkL/g8
 YIX4p3MgU+5nYU3S+0YCG2m7dEleDpxrZiSSOpIlQDE8MFgI3DF03jv3a9Rnsj01xgEz
 TXDoKZIQEAjeRwdKbdOLelOaS+5g+064xuo53PXa4BUSVAFyb+9pgW0OuXC13iOhoCnK
 v7/AAaMQ/b2DwI8tEnDfBmmPOjZL0LjhtYj+RM1PvCdEP+74uyUbLMKm0INXoxKADLlP
 tzAghZhDnzIODuZraxHZhR2N3ubHyPQrtH+fMzFh96pGBcc3JebE6qwRbzXoPXIv26Nt
 gVnw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWlFEg4YAPGsMKB/0lzzZH8bmtBEe7yjKQisW6TooF7FqXtpWKh4ake3MY0YIZVldxu2sn27SRu3g==@nongnu.org
X-Gm-Message-State: AOJu0Yx5qKYcihy/cak6C9favj0vKjpbwlkQMfd5RP2wh6Wu1N2KRkKN
 UV3B5cArSZk0jFhBStoftOVxwbYN62haggOmjI5uBY3owV2VtFKbK61s7UofUX+yyeQ=
X-Gm-Gg: AZuq6aIosZyo9LNsrnOnPSRoKLMkeyvfaFEE/a+o6uPSa9YWp4m1TaBo0UmjbkcRSFI
 wKWyoYFG4Ki9bkyC1NUvNn/IUzt6zY7QkMgjOb6Ai8oqW0VFEPiHY2+uGiQoJZhMlbHFdYzXPA0
 rf+COefLJNN5KNl6ERQZz37tNsODo+Lud3HRZbsvlK3UdufUDHU0fVA4L45FxxeayK0G3EzewG2
 ZoJW22jKmdEwLez1YU5YuZlU/XjiF7JiQhs1RcdV0Pk1XeAT28xICeMocGN1ophSoIj5VpCPTRw
 MtOT5xNGYcbsgiE1yi3GNd6uwKSO/K5kK8s8HxrtASwoia90Fu48zhTPhIbi55oaEjQlulGaWFn
 A/db5Iv2Mv5oCvCtErLT0+QSPduChNXFVt1v2MBqwD4kyD8VQUrWCZU8ERY7PhwRvFpulluUz0C
 0Y6NUwH6zKMaoiLQ09mn5XsMX0Ccl4kNPhxmE+YAX5yW9I/XXX3Z7FNlquOwZPy+ht0XZ/iTkxn
 5EC
X-Received: by 2002:a17:903:15ce:b0:2a9:47ff:101c with SMTP id
 d9443c01a7336-2ad50fa0c97mr33807705ad.46.1771473742551; 
 Wed, 18 Feb 2026 20:02:22 -0800 (PST)
Received: from pc.taild8403c.ts.net (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2ad1a73200asm147636225ad.36.2026.02.18.20.02.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Feb 2026 20:02:21 -0800 (PST)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 kvm@vger.kernel.org, Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>, anjo@rev.ng,
 Peter Maydell <peter.maydell@linaro.org>,
 Jim MacArthur <jim.macarthur@linaro.org>
Subject: [PATCH v4 14/14] include/tcg/tcg-op.h: eradicate
 TARGET_INSN_START_EXTRA_WORDS
Date: Wed, 18 Feb 2026 20:01:50 -0800
Message-ID: <20260219040150.2098396-15-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260219040150.2098396-1-pierrick.bouvier@linaro.org>
References: <20260219040150.2098396-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pl1-x62c.google.com
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

This commit removes TARGET_INSN_START_EXTRA_WORDS and force all arch to
call the same version of tcg_gen_insn_start, with additional 0 arguments
if needed. Since all arch have a single call site (in translate.c), this
is as good documentation as having a single define.

The notable exception is target/arm, which has two different translate
files for 32/64 bits. Since it's the only one, we accept to have two
call sites for this.

As well, we update parameter type to use uint64_t instead of
target_ulong, so it can be called from common code.

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 include/tcg/tcg-op-common.h      |  8 ++++++++
 include/tcg/tcg-op.h             | 29 -----------------------------
 target/alpha/cpu-param.h         |  2 --
 target/arm/cpu-param.h           |  7 -------
 target/avr/cpu-param.h           |  2 --
 target/hexagon/cpu-param.h       |  2 --
 target/hppa/cpu-param.h          |  2 --
 target/i386/cpu-param.h          |  2 --
 target/loongarch/cpu-param.h     |  2 --
 target/m68k/cpu-param.h          |  2 --
 target/microblaze/cpu-param.h    |  2 --
 target/mips/cpu-param.h          |  2 --
 target/or1k/cpu-param.h          |  2 --
 target/ppc/cpu-param.h           |  2 --
 target/riscv/cpu-param.h         |  7 -------
 target/rx/cpu-param.h            |  2 --
 target/s390x/cpu-param.h         |  2 --
 target/sh4/cpu-param.h           |  2 --
 target/sparc/cpu-param.h         |  2 --
 target/tricore/cpu-param.h       |  2 --
 target/xtensa/cpu-param.h        |  2 --
 target/alpha/translate.c         |  4 ++--
 target/avr/translate.c           |  2 +-
 target/hexagon/translate.c       |  2 +-
 target/i386/tcg/translate.c      |  2 +-
 target/loongarch/tcg/translate.c |  2 +-
 target/m68k/translate.c          |  2 +-
 target/microblaze/translate.c    |  2 +-
 target/or1k/translate.c          |  2 +-
 target/ppc/translate.c           |  2 +-
 target/rx/translate.c            |  2 +-
 target/sh4/translate.c           |  4 ++--
 target/sparc/translate.c         |  2 +-
 target/tricore/translate.c       |  2 +-
 target/xtensa/translate.c        |  2 +-
 35 files changed, 24 insertions(+), 93 deletions(-)

diff --git a/include/tcg/tcg-op-common.h b/include/tcg/tcg-op-common.h
index f752ef440b2..e02f209c093 100644
--- a/include/tcg/tcg-op-common.h
+++ b/include/tcg/tcg-op-common.h
@@ -30,6 +30,14 @@ TCGv_i64 tcg_global_mem_new_i64(TCGv_ptr reg, intptr_t off, const char *name);
 TCGv_ptr tcg_global_mem_new_ptr(TCGv_ptr reg, intptr_t off, const char *name);
 
 /* Generic ops.  */
+static inline void tcg_gen_insn_start(uint64_t pc, uint64_t a1,
+                                      uint64_t a2)
+{
+    TCGOp *op = tcg_emit_op(INDEX_op_insn_start, INSN_START_WORDS);
+    tcg_set_insn_start_param(op, 0, pc);
+    tcg_set_insn_start_param(op, 1, a1);
+    tcg_set_insn_start_param(op, 2, a2);
+}
 
 void gen_set_label(TCGLabel *l);
 void tcg_gen_br(TCGLabel *l);
diff --git a/include/tcg/tcg-op.h b/include/tcg/tcg-op.h
index ee379994e76..7024be938e6 100644
--- a/include/tcg/tcg-op.h
+++ b/include/tcg/tcg-op.h
@@ -28,35 +28,6 @@
 # error Mismatch with insn-start-words.h
 #endif
 
-#if TARGET_INSN_START_EXTRA_WORDS == 0
-static inline void tcg_gen_insn_start(target_ulong pc)
-{
-    TCGOp *op = tcg_emit_op(INDEX_op_insn_start, INSN_START_WORDS);
-    tcg_set_insn_start_param(op, 0, pc);
-    tcg_set_insn_start_param(op, 1, 0);
-    tcg_set_insn_start_param(op, 2, 0);
-}
-#elif TARGET_INSN_START_EXTRA_WORDS == 1
-static inline void tcg_gen_insn_start(target_ulong pc, target_ulong a1)
-{
-    TCGOp *op = tcg_emit_op(INDEX_op_insn_start, INSN_START_WORDS);
-    tcg_set_insn_start_param(op, 0, pc);
-    tcg_set_insn_start_param(op, 1, a1);
-    tcg_set_insn_start_param(op, 2, 0);
-}
-#elif TARGET_INSN_START_EXTRA_WORDS == 2
-static inline void tcg_gen_insn_start(target_ulong pc, target_ulong a1,
-                                      target_ulong a2)
-{
-    TCGOp *op = tcg_emit_op(INDEX_op_insn_start, INSN_START_WORDS);
-    tcg_set_insn_start_param(op, 0, pc);
-    tcg_set_insn_start_param(op, 1, a1);
-    tcg_set_insn_start_param(op, 2, a2);
-}
-#else
-#error Unhandled TARGET_INSN_START_EXTRA_WORDS value
-#endif
-
 #if TARGET_LONG_BITS == 32
 typedef TCGv_i32 TCGv;
 #define tcg_temp_new() tcg_temp_new_i32()
diff --git a/target/alpha/cpu-param.h b/target/alpha/cpu-param.h
index a799f42db31..c9da620ab3e 100644
--- a/target/alpha/cpu-param.h
+++ b/target/alpha/cpu-param.h
@@ -24,6 +24,4 @@
 # define TARGET_VIRT_ADDR_SPACE_BITS  (30 + TARGET_PAGE_BITS)
 #endif
 
-#define TARGET_INSN_START_EXTRA_WORDS 0
-
 #endif
diff --git a/target/arm/cpu-param.h b/target/arm/cpu-param.h
index 8b46c7c5708..7de0099cbfa 100644
--- a/target/arm/cpu-param.h
+++ b/target/arm/cpu-param.h
@@ -32,11 +32,4 @@
 # define TARGET_PAGE_BITS_LEGACY 10
 #endif /* !CONFIG_USER_ONLY */
 
-/*
- * ARM-specific extra insn start words:
- * 1: Conditional execution bits
- * 2: Partial exception syndrome for data aborts
- */
-#define TARGET_INSN_START_EXTRA_WORDS 2
-
 #endif
diff --git a/target/avr/cpu-param.h b/target/avr/cpu-param.h
index f74bfc25804..ea7887919a7 100644
--- a/target/avr/cpu-param.h
+++ b/target/avr/cpu-param.h
@@ -25,6 +25,4 @@
 #define TARGET_PHYS_ADDR_SPACE_BITS 24
 #define TARGET_VIRT_ADDR_SPACE_BITS 24
 
-#define TARGET_INSN_START_EXTRA_WORDS 0
-
 #endif
diff --git a/target/hexagon/cpu-param.h b/target/hexagon/cpu-param.h
index 635d509e743..45ee7b46409 100644
--- a/target/hexagon/cpu-param.h
+++ b/target/hexagon/cpu-param.h
@@ -23,6 +23,4 @@
 #define TARGET_PHYS_ADDR_SPACE_BITS 36
 #define TARGET_VIRT_ADDR_SPACE_BITS 32
 
-#define TARGET_INSN_START_EXTRA_WORDS 0
-
 #endif
diff --git a/target/hppa/cpu-param.h b/target/hppa/cpu-param.h
index 9bf7ac76d0c..e0b2c7c9157 100644
--- a/target/hppa/cpu-param.h
+++ b/target/hppa/cpu-param.h
@@ -19,6 +19,4 @@
 
 #define TARGET_PAGE_BITS 12
 
-#define TARGET_INSN_START_EXTRA_WORDS 2
-
 #endif
diff --git a/target/i386/cpu-param.h b/target/i386/cpu-param.h
index ebb844bcc83..909bc027923 100644
--- a/target/i386/cpu-param.h
+++ b/target/i386/cpu-param.h
@@ -22,6 +22,4 @@
 #endif
 #define TARGET_PAGE_BITS 12
 
-#define TARGET_INSN_START_EXTRA_WORDS 1
-
 #endif
diff --git a/target/loongarch/cpu-param.h b/target/loongarch/cpu-param.h
index 58cc45a377e..071567712b3 100644
--- a/target/loongarch/cpu-param.h
+++ b/target/loongarch/cpu-param.h
@@ -13,6 +13,4 @@
 
 #define TARGET_PAGE_BITS 12
 
-#define TARGET_INSN_START_EXTRA_WORDS 0
-
 #endif
diff --git a/target/m68k/cpu-param.h b/target/m68k/cpu-param.h
index 256a2b5f8b2..7afbf6d302d 100644
--- a/target/m68k/cpu-param.h
+++ b/target/m68k/cpu-param.h
@@ -17,6 +17,4 @@
 #define TARGET_PHYS_ADDR_SPACE_BITS 32
 #define TARGET_VIRT_ADDR_SPACE_BITS 32
 
-#define TARGET_INSN_START_EXTRA_WORDS 1
-
 #endif
diff --git a/target/microblaze/cpu-param.h b/target/microblaze/cpu-param.h
index e0a37945136..6a0714bb3d7 100644
--- a/target/microblaze/cpu-param.h
+++ b/target/microblaze/cpu-param.h
@@ -27,6 +27,4 @@
 /* FIXME: MB uses variable pages down to 1K but linux only uses 4k.  */
 #define TARGET_PAGE_BITS 12
 
-#define TARGET_INSN_START_EXTRA_WORDS 1
-
 #endif
diff --git a/target/mips/cpu-param.h b/target/mips/cpu-param.h
index 58f450827f7..a71e7383d24 100644
--- a/target/mips/cpu-param.h
+++ b/target/mips/cpu-param.h
@@ -20,6 +20,4 @@
 #endif
 #define TARGET_PAGE_BITS 12
 
-#define TARGET_INSN_START_EXTRA_WORDS 2
-
 #endif
diff --git a/target/or1k/cpu-param.h b/target/or1k/cpu-param.h
index b4f57bbe692..3011bf5fcca 100644
--- a/target/or1k/cpu-param.h
+++ b/target/or1k/cpu-param.h
@@ -12,6 +12,4 @@
 #define TARGET_PHYS_ADDR_SPACE_BITS 32
 #define TARGET_VIRT_ADDR_SPACE_BITS 32
 
-#define TARGET_INSN_START_EXTRA_WORDS 1
-
 #endif
diff --git a/target/ppc/cpu-param.h b/target/ppc/cpu-param.h
index e4ed9080ee9..ca7602d8983 100644
--- a/target/ppc/cpu-param.h
+++ b/target/ppc/cpu-param.h
@@ -37,6 +37,4 @@
 # define TARGET_PAGE_BITS 12
 #endif
 
-#define TARGET_INSN_START_EXTRA_WORDS 0
-
 #endif
diff --git a/target/riscv/cpu-param.h b/target/riscv/cpu-param.h
index cfdc67c258c..039e877891a 100644
--- a/target/riscv/cpu-param.h
+++ b/target/riscv/cpu-param.h
@@ -17,13 +17,6 @@
 #endif
 #define TARGET_PAGE_BITS 12 /* 4 KiB Pages */
 
-/*
- * RISC-V-specific extra insn start words:
- * 1: Original instruction opcode
- * 2: more information about instruction
- */
-#define TARGET_INSN_START_EXTRA_WORDS 2
-
 /*
  * The current MMU Modes are:
  *  - U mode 0b000
diff --git a/target/rx/cpu-param.h b/target/rx/cpu-param.h
index 84934f3bcaf..ef1970a09e9 100644
--- a/target/rx/cpu-param.h
+++ b/target/rx/cpu-param.h
@@ -24,6 +24,4 @@
 #define TARGET_PHYS_ADDR_SPACE_BITS 32
 #define TARGET_VIRT_ADDR_SPACE_BITS 32
 
-#define TARGET_INSN_START_EXTRA_WORDS 0
-
 #endif
diff --git a/target/s390x/cpu-param.h b/target/s390x/cpu-param.h
index abfae3bedfb..a5f798eeae7 100644
--- a/target/s390x/cpu-param.h
+++ b/target/s390x/cpu-param.h
@@ -12,6 +12,4 @@
 #define TARGET_PHYS_ADDR_SPACE_BITS 64
 #define TARGET_VIRT_ADDR_SPACE_BITS 64
 
-#define TARGET_INSN_START_EXTRA_WORDS 2
-
 #endif
diff --git a/target/sh4/cpu-param.h b/target/sh4/cpu-param.h
index f328715ee86..2b6e11dd0ac 100644
--- a/target/sh4/cpu-param.h
+++ b/target/sh4/cpu-param.h
@@ -16,6 +16,4 @@
 # define TARGET_VIRT_ADDR_SPACE_BITS 32
 #endif
 
-#define TARGET_INSN_START_EXTRA_WORDS 1
-
 #endif
diff --git a/target/sparc/cpu-param.h b/target/sparc/cpu-param.h
index 45eea9d6bac..6e8e2a51469 100644
--- a/target/sparc/cpu-param.h
+++ b/target/sparc/cpu-param.h
@@ -21,6 +21,4 @@
 # define TARGET_VIRT_ADDR_SPACE_BITS 32
 #endif
 
-#define TARGET_INSN_START_EXTRA_WORDS 1
-
 #endif
diff --git a/target/tricore/cpu-param.h b/target/tricore/cpu-param.h
index eb33a67c419..790242ef3d2 100644
--- a/target/tricore/cpu-param.h
+++ b/target/tricore/cpu-param.h
@@ -12,6 +12,4 @@
 #define TARGET_PHYS_ADDR_SPACE_BITS 32
 #define TARGET_VIRT_ADDR_SPACE_BITS 32
 
-#define TARGET_INSN_START_EXTRA_WORDS 0
-
 #endif
diff --git a/target/xtensa/cpu-param.h b/target/xtensa/cpu-param.h
index 7a0c22c9005..06d85218b84 100644
--- a/target/xtensa/cpu-param.h
+++ b/target/xtensa/cpu-param.h
@@ -16,6 +16,4 @@
 #define TARGET_VIRT_ADDR_SPACE_BITS 32
 #endif
 
-#define TARGET_INSN_START_EXTRA_WORDS 0
-
 #endif
diff --git a/target/alpha/translate.c b/target/alpha/translate.c
index 4442462891e..4d22d7d5a45 100644
--- a/target/alpha/translate.c
+++ b/target/alpha/translate.c
@@ -2899,9 +2899,9 @@ static void alpha_tr_insn_start(DisasContextBase *dcbase, CPUState *cpu)
     DisasContext *ctx = container_of(dcbase, DisasContext, base);
 
     if (ctx->pcrel) {
-        tcg_gen_insn_start(dcbase->pc_next & ~TARGET_PAGE_MASK);
+        tcg_gen_insn_start(dcbase->pc_next & ~TARGET_PAGE_MASK, 0, 0);
     } else {
-        tcg_gen_insn_start(dcbase->pc_next);
+        tcg_gen_insn_start(dcbase->pc_next, 0, 0);
     }
 }
 
diff --git a/target/avr/translate.c b/target/avr/translate.c
index 78ae83df219..649dd4b0112 100644
--- a/target/avr/translate.c
+++ b/target/avr/translate.c
@@ -2689,7 +2689,7 @@ static void avr_tr_insn_start(DisasContextBase *dcbase, CPUState *cs)
 {
     DisasContext *ctx = container_of(dcbase, DisasContext, base);
 
-    tcg_gen_insn_start(ctx->npc);
+    tcg_gen_insn_start(ctx->npc, 0, 0);
 }
 
 static void avr_tr_translate_insn(DisasContextBase *dcbase, CPUState *cs)
diff --git a/target/hexagon/translate.c b/target/hexagon/translate.c
index 2fdc956bf99..8a223f6e13e 100644
--- a/target/hexagon/translate.c
+++ b/target/hexagon/translate.c
@@ -998,7 +998,7 @@ static void hexagon_tr_insn_start(DisasContextBase *dcbase, CPUState *cpu)
 {
     DisasContext *ctx = container_of(dcbase, DisasContext, base);
 
-    tcg_gen_insn_start(ctx->base.pc_next);
+    tcg_gen_insn_start(ctx->base.pc_next, 0, 0);
 }
 
 static bool pkt_crosses_page(CPUHexagonState *env, DisasContext *ctx)
diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index 7186517239c..14210d569f7 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -3501,7 +3501,7 @@ static void i386_tr_insn_start(DisasContextBase *dcbase, CPUState *cpu)
     if (tb_cflags(dcbase->tb) & CF_PCREL) {
         pc_arg &= ~TARGET_PAGE_MASK;
     }
-    tcg_gen_insn_start(pc_arg, dc->cc_op);
+    tcg_gen_insn_start(pc_arg, dc->cc_op, 0);
 }
 
 static void i386_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
diff --git a/target/loongarch/tcg/translate.c b/target/loongarch/tcg/translate.c
index 30f375b33f0..b9ed13d19c6 100644
--- a/target/loongarch/tcg/translate.c
+++ b/target/loongarch/tcg/translate.c
@@ -159,7 +159,7 @@ static void loongarch_tr_insn_start(DisasContextBase *dcbase, CPUState *cs)
 {
     DisasContext *ctx = container_of(dcbase, DisasContext, base);
 
-    tcg_gen_insn_start(ctx->base.pc_next);
+    tcg_gen_insn_start(ctx->base.pc_next, 0, 0);
 }
 
 /*
diff --git a/target/m68k/translate.c b/target/m68k/translate.c
index a0309939012..abc1c79f3cd 100644
--- a/target/m68k/translate.c
+++ b/target/m68k/translate.c
@@ -6041,7 +6041,7 @@ static void m68k_tr_tb_start(DisasContextBase *dcbase, CPUState *cpu)
 static void m68k_tr_insn_start(DisasContextBase *dcbase, CPUState *cpu)
 {
     DisasContext *dc = container_of(dcbase, DisasContext, base);
-    tcg_gen_insn_start(dc->base.pc_next, dc->cc_op);
+    tcg_gen_insn_start(dc->base.pc_next, dc->cc_op, 0);
 }
 
 static void m68k_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
diff --git a/target/microblaze/translate.c b/target/microblaze/translate.c
index 0be3c98dc17..2af67beecec 100644
--- a/target/microblaze/translate.c
+++ b/target/microblaze/translate.c
@@ -1630,7 +1630,7 @@ static void mb_tr_insn_start(DisasContextBase *dcb, CPUState *cs)
 {
     DisasContext *dc = container_of(dcb, DisasContext, base);
 
-    tcg_gen_insn_start(dc->base.pc_next, dc->tb_flags & ~MSR_TB_MASK);
+    tcg_gen_insn_start(dc->base.pc_next, dc->tb_flags & ~MSR_TB_MASK, 0);
 }
 
 static void mb_tr_translate_insn(DisasContextBase *dcb, CPUState *cs)
diff --git a/target/or1k/translate.c b/target/or1k/translate.c
index ce2dc466dc7..de81dc6ef8d 100644
--- a/target/or1k/translate.c
+++ b/target/or1k/translate.c
@@ -1552,7 +1552,7 @@ static void openrisc_tr_insn_start(DisasContextBase *dcbase, CPUState *cs)
     DisasContext *dc = container_of(dcbase, DisasContext, base);
 
     tcg_gen_insn_start(dc->base.pc_next, (dc->delayed_branch ? 1 : 0)
-                       | (dc->base.num_insns > 1 ? 2 : 0));
+                       | (dc->base.num_insns > 1 ? 2 : 0), 0);
 }
 
 static void openrisc_tr_translate_insn(DisasContextBase *dcbase, CPUState *cs)
diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index e9acfa239ec..a09a6df93fd 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -6575,7 +6575,7 @@ static void ppc_tr_tb_start(DisasContextBase *db, CPUState *cs)
 
 static void ppc_tr_insn_start(DisasContextBase *dcbase, CPUState *cs)
 {
-    tcg_gen_insn_start(dcbase->pc_next);
+    tcg_gen_insn_start(dcbase->pc_next, 0, 0);
 }
 
 static bool is_prefix_insn(DisasContext *ctx, uint32_t insn)
diff --git a/target/rx/translate.c b/target/rx/translate.c
index 26d41548294..a245b9db8fe 100644
--- a/target/rx/translate.c
+++ b/target/rx/translate.c
@@ -2217,7 +2217,7 @@ static void rx_tr_insn_start(DisasContextBase *dcbase, CPUState *cs)
 {
     DisasContext *ctx = container_of(dcbase, DisasContext, base);
 
-    tcg_gen_insn_start(ctx->base.pc_next);
+    tcg_gen_insn_start(ctx->base.pc_next, 0, 0);
 }
 
 static void rx_tr_translate_insn(DisasContextBase *dcbase, CPUState *cs)
diff --git a/target/sh4/translate.c b/target/sh4/translate.c
index b3ae0a3814c..b1057727c55 100644
--- a/target/sh4/translate.c
+++ b/target/sh4/translate.c
@@ -2181,7 +2181,7 @@ static void decode_gusa(DisasContext *ctx, CPUSH4State *env)
      * tb->icount * insn_start.
      */
     for (i = 1; i < max_insns; ++i) {
-        tcg_gen_insn_start(pc + i * 2, ctx->envflags);
+        tcg_gen_insn_start(pc + i * 2, ctx->envflags, 0);
         ctx->base.insn_start = tcg_last_op();
     }
 }
@@ -2241,7 +2241,7 @@ static void sh4_tr_insn_start(DisasContextBase *dcbase, CPUState *cs)
 {
     DisasContext *ctx = container_of(dcbase, DisasContext, base);
 
-    tcg_gen_insn_start(ctx->base.pc_next, ctx->envflags);
+    tcg_gen_insn_start(ctx->base.pc_next, ctx->envflags, 0);
 }
 
 static void sh4_tr_translate_insn(DisasContextBase *dcbase, CPUState *cs)
diff --git a/target/sparc/translate.c b/target/sparc/translate.c
index 57b50ff8b9a..7e8558dbbd8 100644
--- a/target/sparc/translate.c
+++ b/target/sparc/translate.c
@@ -5735,7 +5735,7 @@ static void sparc_tr_insn_start(DisasContextBase *dcbase, CPUState *cs)
             g_assert_not_reached();
         }
     }
-    tcg_gen_insn_start(dc->pc, npc);
+    tcg_gen_insn_start(dc->pc, npc, 0);
 }
 
 static void sparc_tr_translate_insn(DisasContextBase *dcbase, CPUState *cs)
diff --git a/target/tricore/translate.c b/target/tricore/translate.c
index 18d8726af6d..0eaf7a82f87 100644
--- a/target/tricore/translate.c
+++ b/target/tricore/translate.c
@@ -8410,7 +8410,7 @@ static void tricore_tr_insn_start(DisasContextBase *dcbase, CPUState *cpu)
 {
     DisasContext *ctx = container_of(dcbase, DisasContext, base);
 
-    tcg_gen_insn_start(ctx->base.pc_next);
+    tcg_gen_insn_start(ctx->base.pc_next, 0, 0);
 }
 
 static bool insn_crosses_page(DisasContext *ctx, CPUTriCoreState *env)
diff --git a/target/xtensa/translate.c b/target/xtensa/translate.c
index bb8d2ed86cf..5e3707d3fdf 100644
--- a/target/xtensa/translate.c
+++ b/target/xtensa/translate.c
@@ -1159,7 +1159,7 @@ static void xtensa_tr_tb_start(DisasContextBase *dcbase, CPUState *cpu)
 
 static void xtensa_tr_insn_start(DisasContextBase *dcbase, CPUState *cpu)
 {
-    tcg_gen_insn_start(dcbase->pc_next);
+    tcg_gen_insn_start(dcbase->pc_next, 0, 0);
 }
 
 static void xtensa_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
-- 
2.47.3


