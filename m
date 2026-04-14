Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 313C3F531DC
	for <qemu-arm@archiver.kernel.org>; Tue, 14 Apr 2026 00:54:58 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wCS3B-0001HB-A6; Mon, 13 Apr 2026 20:54:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wCS37-0001EV-Pi
 for qemu-arm@nongnu.org; Mon, 13 Apr 2026 20:54:41 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wCS35-0000PQ-JW
 for qemu-arm@nongnu.org; Mon, 13 Apr 2026 20:54:41 -0400
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-43d7605ec91so1564174f8f.3
 for <qemu-arm@nongnu.org>; Mon, 13 Apr 2026 17:54:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1776128078; x=1776732878; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dNGsl3yiigNl41yzHbmseBS762ufEDzK/Z62R4phLIU=;
 b=QgFsqcwfk7F/cDcgUMvVziE60VqhJuRNCz4JuH7JqIzrH93n/MnScR+kP442PSPf2P
 NOSZpJe/kU3NiM8lLCYmkSejut6c8bbXWYDYwRTud7R6PRj8fH+gkKI4c7lpsPQ4tSiV
 xdZWQrE+kfG5kQ6x6iYMtEc/eoMkWUvY8XhaRtb9RMM0CkOD7XcZvAwS+RzLu/rrHC+F
 hSSINjWJhIUcb4QBPZ2tsMPbY77ju13hrny2LN7a4NRBGX7rOFMqhF5nVOXin25FRZRv
 b3w7vpkOIbm25nH6TN45B8FBssSNQOhV6wtFxvavK/zU/+uglvxbJsriPieo5Vp4I/Eg
 l4SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776128078; x=1776732878;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=dNGsl3yiigNl41yzHbmseBS762ufEDzK/Z62R4phLIU=;
 b=V+78w/eu9NhsmYjVHGtno5xQgDXs9CC3SDCMaqtDNbjJCIoMubsd4/WDDVB6ctSS+m
 H8tzhyrevw5baolP/lJ0KUuZqOobm0Mu9EzKiaW2anz73a5F4obd5BULXd5o5mOCSq9O
 7LTj0PvJxCsPrj7OgnrgnHP+pkPV3tsDHvN0kvlGY4dlMh3xpnyYdZJEYQ4fU/2JOQVF
 w1Pzivs74/LygOxI/IRtzPFXipbeSqiyzYpkjStL3RZMp7bbdzWyS9PNlnTHZyXY2GKa
 I9js4uxZ7DeG4tRLEsPJbEXHfBv7tYKrEEiClvPqm7sIyNTHgx94w8SdN1XZYIrH7mSZ
 FWwA==
X-Forwarded-Encrypted: i=1;
 AFNElJ+SZT7Y3FxHSr8OlZSRj4xpKmR8GNduaZi+m7QNihxgnODvKj25NRAJBWXRCbGURZy3pWOtbrblbw==@nongnu.org
X-Gm-Message-State: AOJu0Yz0C/FgpPGZybgh+4u/uHKGqXQ71ni+sB0vWPDd7Mn/fQwdFZwv
 ebwH8FoRQFfqCa+znXikLTeEURF+rhdpOeUGldotdd8RYqE57meXFjq/p5g6Ca5pYdc=
X-Gm-Gg: AeBDieu0FAmJdzkwZY4+xxizKXXIKzy8n+KwbqkubrgkGX+YHMnCxVLN/TgpnUocxqN
 qKxlq5wWigM316p2aSctSdilt08O9Ts2n/6XqaJM07DIeDEkw9ERVNuSil3VFP9SLXgaZ1Bhcuz
 wXAoFXNXBuxI4Pu9stq+32tEqg9JUTBoGhzfMlqV66X7en0Eg1Ct60tbTeqsx22Dtujoo210rkF
 i3rC6M4VqAf5BZUhTyOWpIcSwRsD1mRDbPRnc0H89Mq5DtxxTl/7EerjRBIG6RD+94Y38SwyTQ/
 a9wcRlVWiYD02NGdPXL7qCCCQ141kou/bEi9nL/ANBeUqy8A6V2PuNA/HIcqLxd6sLRrcA65yto
 pHXtX1tYs0SFqF0WS3kuoc1J6g7suX2YHQiVTk0rJCHODWsZX83vZumzZg/cd5Y64noEW2w+aVn
 XKkuNgGPFvbDhlj6Sul/bGlY6ahMQMWa1qPuwIS4/wznrpYI7m4KlKLaHKo7BMq30zEuDCG3Tkm
 B75KdcrPJQ=
X-Received: by 2002:a05:6000:2001:b0:43d:773d:78ff with SMTP id
 ffacd0b85a97d-43d773d7b1fmr10691738f8f.27.1776128077893; 
 Mon, 13 Apr 2026 17:54:37 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43d7bd2f237sm9305131f8f.23.2026.04.13.17.54.35
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 13 Apr 2026 17:54:36 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v2 6/9] target/arm: Replace MO_TE -> mo_endian() for MVE
 helpers
Date: Tue, 14 Apr 2026 02:53:45 +0200
Message-ID: <20260414005348.4767-7-philmd@linaro.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260414005348.4767-1-philmd@linaro.org>
References: <20260414005348.4767-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42b.google.com
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

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/mve_helper.c | 47 +++++++++++++++++++++++--------------
 1 file changed, 30 insertions(+), 17 deletions(-)

diff --git a/target/arm/tcg/mve_helper.c b/target/arm/tcg/mve_helper.c
index a5a23c97056..64ab804abcb 100644
--- a/target/arm/tcg/mve_helper.c
+++ b/target/arm/tcg/mve_helper.c
@@ -160,7 +160,7 @@ static void mve_advance_vpt(CPUARMState *env)
         uint16_t eci_mask = mve_eci_mask(env);                          \
         unsigned b, e;                                                  \
         int mmu_idx = arm_to_core_mmu_idx(arm_mmu_idx(env));            \
-        MemOpIdx oi = make_memop_idx(MO_TE | MFLAG | MO_ALIGN,          \
+        MemOpIdx oi = make_memop_idx(mo_endian(env) | MFLAG | MO_ALIGN, \
                                      mmu_idx);                          \
         /*                                                              \
          * R_SXTM allows the dest reg to become UNKNOWN for abandoned   \
@@ -184,7 +184,7 @@ static void mve_advance_vpt(CPUARMState *env)
         uint16_t mask = mve_element_mask(env);                          \
         unsigned b, e;                                                  \
         int mmu_idx = arm_to_core_mmu_idx(arm_mmu_idx(env));            \
-        MemOpIdx oi = make_memop_idx(MO_TE | MFLAG | MO_ALIGN,          \
+        MemOpIdx oi = make_memop_idx(mo_endian(env) | MFLAG | MO_ALIGN, \
                                      mmu_idx);                          \
         for (b = 0, e = 0; b < 16; b += ESIZE, e++) {                   \
             if (mask & (1 << b)) {                                      \
@@ -235,7 +235,7 @@ DO_VSTR(vstrh_w, MO_UW, 2, stw, 4, int32_t)
         unsigned e;                                                     \
         uint32_t addr;                                                  \
         int mmu_idx = arm_to_core_mmu_idx(arm_mmu_idx(env));            \
-        MemOpIdx oi = make_memop_idx(MO_TE | MFLAG | MO_ALIGN,          \
+        MemOpIdx oi = make_memop_idx(mo_endian(env) | MFLAG | MO_ALIGN, \
                                      mmu_idx);                          \
         for (e = 0; e < 16 / ESIZE; e++, mask >>= ESIZE, eci_mask >>= ESIZE) { \
             if (!(eci_mask & 1)) {                                      \
@@ -263,7 +263,7 @@ DO_VSTR(vstrh_w, MO_UW, 2, stw, 4, int32_t)
         unsigned e;                                                     \
         uint32_t addr;                                                  \
         int mmu_idx = arm_to_core_mmu_idx(arm_mmu_idx(env));            \
-        MemOpIdx oi = make_memop_idx(MO_TE | MFLAG | MO_ALIGN,          \
+        MemOpIdx oi = make_memop_idx(mo_endian(env) | MFLAG | MO_ALIGN, \
                                      mmu_idx);                          \
         for (e = 0; e < 16 / ESIZE; e++, mask >>= ESIZE, eci_mask >>= ESIZE) { \
             if (!(eci_mask & 1)) {                                      \
@@ -326,7 +326,8 @@ DO_VSTR(vstrh_w, MO_UW, 2, stw, 4, int32_t)
         unsigned e;                                                     \
         uint32_t addr;                                                  \
         int mmu_idx = arm_to_core_mmu_idx(arm_mmu_idx(env));            \
-        MemOpIdx oi = make_memop_idx(MO_TE | MO_UL | MO_ALIGN, mmu_idx);\
+        MemOpIdx oi = make_memop_idx(mo_endian(env) | MO_UL | MO_ALIGN, \
+                                     mmu_idx);                          \
         for (e = 0; e < 16 / 4; e++, mask >>= 4, eci_mask >>= 4) {      \
             if (!(eci_mask & 1)) {                                      \
                 continue;                                               \
@@ -413,7 +414,8 @@ DO_VSTR64_SG(vstrd_sg_wb_ud, ADDR_ADD, true)
         static const uint8_t off[4] = { O1, O2, O3, O4 };               \
         uint32_t addr, data;                                            \
         int mmu_idx = arm_to_core_mmu_idx(arm_mmu_idx(env));            \
-        MemOpIdx oi = make_memop_idx(MO_TE | MO_UL | MO_ALIGN, mmu_idx);\
+        MemOpIdx oi = make_memop_idx(mo_endian(env) | MO_UL | MO_ALIGN, \
+                                     mmu_idx);                          \
         for (beat = 0; beat < 4; beat++, mask >>= 4) {                  \
             if ((mask & 1) == 0) {                                      \
                 /* ECI says skip this beat */                           \
@@ -439,7 +441,8 @@ DO_VSTR64_SG(vstrd_sg_wb_ud, ADDR_ADD, true)
         int y; /* y counts 0 2 0 2 */                                   \
         uint16_t *qd;                                                   \
         int mmu_idx = arm_to_core_mmu_idx(arm_mmu_idx(env));            \
-        MemOpIdx oi = make_memop_idx(MO_TE | MO_UL | MO_ALIGN, mmu_idx);\
+        MemOpIdx oi = make_memop_idx(mo_endian(env) | MO_UL | MO_ALIGN, \
+                                     mmu_idx);                          \
         for (beat = 0, y = 0; beat < 4; beat++, mask >>= 4, y ^= 2) {   \
             if ((mask & 1) == 0) {                                      \
                 /* ECI says skip this beat */                           \
@@ -466,7 +469,8 @@ DO_VSTR64_SG(vstrd_sg_wb_ud, ADDR_ADD, true)
         uint32_t *qd;                                                   \
         int y;                                                          \
         int mmu_idx = arm_to_core_mmu_idx(arm_mmu_idx(env));            \
-        MemOpIdx oi = make_memop_idx(MO_TE | MO_UL | MO_ALIGN, mmu_idx);\
+        MemOpIdx oi = make_memop_idx(mo_endian(env) | MO_UL | MO_ALIGN, \
+                                     mmu_idx);                          \
         for (beat = 0; beat < 4; beat++, mask >>= 4) {                  \
             if ((mask & 1) == 0) {                                      \
                 /* ECI says skip this beat */                           \
@@ -505,7 +509,8 @@ DO_VLD4W(vld43w, 6, 7, 8, 9)
         uint32_t addr, data;                                            \
         uint8_t *qd;                                                    \
         int mmu_idx = arm_to_core_mmu_idx(arm_mmu_idx(env));            \
-        MemOpIdx oi = make_memop_idx(MO_TE | MO_UL | MO_ALIGN, mmu_idx);\
+        MemOpIdx oi = make_memop_idx(mo_endian(env) | MO_UL | MO_ALIGN, \
+                                     mmu_idx);                          \
         for (beat = 0; beat < 4; beat++, mask >>= 4) {                  \
             if ((mask & 1) == 0) {                                      \
                 /* ECI says skip this beat */                           \
@@ -531,7 +536,8 @@ DO_VLD4W(vld43w, 6, 7, 8, 9)
         int e;                                                          \
         uint16_t *qd;                                                   \
         int mmu_idx = arm_to_core_mmu_idx(arm_mmu_idx(env));            \
-        MemOpIdx oi = make_memop_idx(MO_TE | MO_UL | MO_ALIGN, mmu_idx);\
+        MemOpIdx oi = make_memop_idx(mo_endian(env) | MO_UL | MO_ALIGN, \
+                                     mmu_idx);                          \
         for (beat = 0; beat < 4; beat++, mask >>= 4) {                  \
             if ((mask & 1) == 0) {                                      \
                 /* ECI says skip this beat */                           \
@@ -556,7 +562,8 @@ DO_VLD4W(vld43w, 6, 7, 8, 9)
         uint32_t addr, data;                                            \
         uint32_t *qd;                                                   \
         int mmu_idx = arm_to_core_mmu_idx(arm_mmu_idx(env));            \
-        MemOpIdx oi = make_memop_idx(MO_TE | MO_UL | MO_ALIGN, mmu_idx);\
+        MemOpIdx oi = make_memop_idx(mo_endian(env) | MO_UL | MO_ALIGN, \
+                                     mmu_idx);                          \
         for (beat = 0; beat < 4; beat++, mask >>= 4) {                  \
             if ((mask & 1) == 0) {                                      \
                 /* ECI says skip this beat */                           \
@@ -587,7 +594,8 @@ DO_VLD2W(vld21w, 8, 12, 16, 20)
         static const uint8_t off[4] = { O1, O2, O3, O4 };               \
         uint32_t addr, data;                                            \
         int mmu_idx = arm_to_core_mmu_idx(arm_mmu_idx(env));            \
-        MemOpIdx oi = make_memop_idx(MO_TE | MO_UL | MO_ALIGN, mmu_idx);\
+        MemOpIdx oi = make_memop_idx(mo_endian(env) | MO_UL | MO_ALIGN, \
+                                     mmu_idx);                          \
         for (beat = 0; beat < 4; beat++, mask >>= 4) {                  \
             if ((mask & 1) == 0) {                                      \
                 /* ECI says skip this beat */                           \
@@ -614,7 +622,8 @@ DO_VLD2W(vld21w, 8, 12, 16, 20)
         int y; /* y counts 0 2 0 2 */                                   \
         uint16_t *qd;                                                   \
         int mmu_idx = arm_to_core_mmu_idx(arm_mmu_idx(env));            \
-        MemOpIdx oi = make_memop_idx(MO_TE | MO_UL | MO_ALIGN, mmu_idx);\
+        MemOpIdx oi = make_memop_idx(mo_endian(env) | MO_UL | MO_ALIGN, \
+                                     mmu_idx);                          \
         for (beat = 0, y = 0; beat < 4; beat++, mask >>= 4, y ^= 2) {   \
             if ((mask & 1) == 0) {                                      \
                 /* ECI says skip this beat */                           \
@@ -640,7 +649,8 @@ DO_VLD2W(vld21w, 8, 12, 16, 20)
         uint32_t *qd;                                                   \
         int y;                                                          \
         int mmu_idx = arm_to_core_mmu_idx(arm_mmu_idx(env));            \
-        MemOpIdx oi = make_memop_idx(MO_TE | MO_UL | MO_ALIGN, mmu_idx);\
+        MemOpIdx oi = make_memop_idx(mo_endian(env) | MO_UL | MO_ALIGN, \
+                                     mmu_idx);                          \
         for (beat = 0; beat < 4; beat++, mask >>= 4) {                  \
             if ((mask & 1) == 0) {                                      \
                 /* ECI says skip this beat */                           \
@@ -679,7 +689,8 @@ DO_VST4W(vst43w, 6, 7, 8, 9)
         uint32_t addr, data;                                            \
         uint8_t *qd;                                                    \
         int mmu_idx = arm_to_core_mmu_idx(arm_mmu_idx(env));            \
-        MemOpIdx oi = make_memop_idx(MO_TE | MO_UL | MO_ALIGN, mmu_idx);\
+        MemOpIdx oi = make_memop_idx(mo_endian(env) | MO_UL | MO_ALIGN, \
+                                     mmu_idx);                          \
         for (beat = 0; beat < 4; beat++, mask >>= 4) {                  \
             if ((mask & 1) == 0) {                                      \
                 /* ECI says skip this beat */                           \
@@ -706,7 +717,8 @@ DO_VST4W(vst43w, 6, 7, 8, 9)
         int e;                                                          \
         uint16_t *qd;                                                   \
         int mmu_idx = arm_to_core_mmu_idx(arm_mmu_idx(env));            \
-        MemOpIdx oi = make_memop_idx(MO_TE | MO_UL | MO_ALIGN, mmu_idx);\
+        MemOpIdx oi = make_memop_idx(mo_endian(env) | MO_UL | MO_ALIGN, \
+                                     mmu_idx);                          \
         for (beat = 0; beat < 4; beat++, mask >>= 4) {                  \
             if ((mask & 1) == 0) {                                      \
                 /* ECI says skip this beat */                           \
@@ -732,7 +744,8 @@ DO_VST4W(vst43w, 6, 7, 8, 9)
         uint32_t addr, data;                                            \
         uint32_t *qd;                                                   \
         int mmu_idx = arm_to_core_mmu_idx(arm_mmu_idx(env));            \
-        MemOpIdx oi = make_memop_idx(MO_TE | MO_UL | MO_ALIGN, mmu_idx);\
+        MemOpIdx oi = make_memop_idx(mo_endian(env) | MO_UL | MO_ALIGN, \
+                                     mmu_idx);                          \
         for (beat = 0; beat < 4; beat++, mask >>= 4) {                  \
             if ((mask & 1) == 0) {                                      \
                 /* ECI says skip this beat */                           \
-- 
2.53.0


