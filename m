Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2FC7108E1FD
	for <qemu-arm@archiver.kernel.org>; Thu, 19 Mar 2026 12:14:31 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w3CFq-0000Iy-Ax; Thu, 19 Mar 2026 08:13:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jim.macarthur@linaro.org>)
 id 1w3CFo-0000I1-CS
 for qemu-arm@nongnu.org; Thu, 19 Mar 2026 08:13:32 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jim.macarthur@linaro.org>)
 id 1w3CFk-00065U-A5
 for qemu-arm@nongnu.org; Thu, 19 Mar 2026 08:13:31 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-486507134e4so10542065e9.0
 for <qemu-arm@nongnu.org>; Thu, 19 Mar 2026 05:13:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1773922404; x=1774527204; darn=nongnu.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=hrTNnlv+Qesh+/MOn/n9/9dKMB5JdqsCHfK1xvrwPWU=;
 b=ZTocrx5rEJCVZeie377pCtkX7o81wMxVubK3k4eTBugJVHm7z1pJMiHxofwTKGW+Jj
 glLTxVno/XrsPJXp1/7LXt3decWiglyJXhzPx2tef2/B3uIt9jZJlOwN87Osvoa+Mlvy
 81GQFs1joBTxcNW8KUiuWD61RdP6OzUJHY9qzxpCONHT+Vabu1rclWh3EDWJkox/I70j
 qdceSWQHckT+HXfqEuMsoZJcQmXxh9tOpIYKHAclZnwTRuGiG6Ea9q4wZYtP7rMfXQug
 VHgHPgUpWEcbsUN+qpR0c3EwfyIM96jorjjb7tGtFKef+sZz/r1fvvSpyqCgvL9J2xfO
 G9kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773922404; x=1774527204;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=hrTNnlv+Qesh+/MOn/n9/9dKMB5JdqsCHfK1xvrwPWU=;
 b=TfSX2aKh1j24NwXh/9uMhxAeaouVmIkQ9RahVwcffvxMKsTCcP4I6kmedxKzZBBXsd
 1RXFplZtAJ/mNDuGepF277iHmvDefB4YMwLktr+jOZPR6MS4nM8eq6yMu7CYMISN1oby
 YToBJMVwwVLRs9adWckCfG1+FavJns7OIMcnNZ2qL09ctRTcAV99jGGa5uYQ/hO9GlPn
 zlJFE4dizTBTfbhmKFLVeo0Pi1zywBnAq/umi+nMIKEGU7V+GFwy7Xze8KtKaXvNxzws
 8wCbt0g9I8ZRItDy2pZTJN4tIMHuTWvOsWYfx0QyICVe6pf3m8QczNwLLvkDQHDMqR7P
 yX0A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVN0dEc4gJetlJVmnuk9tsPHuB0GwQqdhXFHKAKOTZLhnz2v+z4uYsUaI/hgnTZmgJdGQ4rF/gf6g==@nongnu.org
X-Gm-Message-State: AOJu0YzyBsdmrUT9a7OSRuNkyQNMBj1784boSsHBxUV1n1PrvWf74CMX
 aqG32EXLx3d6XuShfh9c6qL+QwaWT5F7V40AZ3k5dTmJOxJSR5dYiGSjPEjAF4OpsDnp4vzRro9
 eGyLV
X-Gm-Gg: ATEYQzwYZkO4wGKU528cEub2nt6AuMBr/FRoGHy8xe3m0YJPB3Zn4Z62YNeDWFZsQ2N
 9HJQM8EWXS+WnCUAcZsnGPOBajtNhKdd14T6uYTazcCpy0B1czkVf///WvoqV8q1VSxyraeEcp4
 1RmiHiSLPrtn9B4A9VWcS8S6B4vgcr4ZPNK22YvW4/EIqgltjNRCoEhLwywZHL8UqOHRnx42kHV
 8MkiFaTbUNWmH2QAuBEEYuU2vC3INXz27SdUeF1GnE7JiU0maEsXSiykIXwAkkQo8gr00njgcQK
 Pe0rCGdlvAcGpWz8Sq24b6/mM8WEl8xHT8WlNCFobuVUqS0D9kOY5xq9xUMNRwt21evLTrPcKP7
 RSq/rhfZei/2eu0LEL3RdRtWCuz+uDhOHqOlg0Bve1oxdsXoYJjL7RJ2CVuwMoYMeo2HB/vTiVN
 VX3moutHqwdAgpS04wSIW5kriZmY0=
X-Received: by 2002:a05:600d:b:b0:486:fcc7:d6a with SMTP id
 5b1f17b1804b1-486fcc70e4bmr15156415e9.13.1773922403512; 
 Thu, 19 Mar 2026 05:13:23 -0700 (PDT)
Received: from [127.0.1.1] ([2a10:d582:31e:0:5dd6:71c1:29c2:4a3a])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-486fd9575ffsm2456215e9.7.2026.03.19.05.13.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Mar 2026 05:13:23 -0700 (PDT)
From: Jim MacArthur <jim.macarthur@linaro.org>
Date: Thu, 19 Mar 2026 12:12:42 +0000
Subject: [PATCH RFC 2/2] tcg/aarch64/tcg-target.c.inc: Manual replace of
 I3310, I3313
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260319-aarch64-tcg-instruction-format-rename-v1-2-8a13bf98f8ff@linaro.org>
References: <20260319-aarch64-tcg-instruction-format-rename-v1-0-8a13bf98f8ff@linaro.org>
In-Reply-To: <20260319-aarch64-tcg-instruction-format-rename-v1-0-8a13bf98f8ff@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org, 
 Jim MacArthur <jim.macarthur@linaro.org>
X-Mailer: b4 0.13.0
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=jim.macarthur@linaro.org; helo=mail-wm1-x32b.google.com
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

These are not formats in themselves, but extra constants to OR in with
the existing ldst_imm format.

Signed-off-by: Jim MacArthur <jim.macarthur@linaro.org>
---
 tcg/aarch64/tcg-target.c.inc | 64 +++++++++++++++++++++++++-------------------
 1 file changed, 36 insertions(+), 28 deletions(-)

diff --git a/tcg/aarch64/tcg-target.c.inc b/tcg/aarch64/tcg-target.c.inc
index e9f86176d2..1f59d40a77 100644
--- a/tcg/aarch64/tcg-target.c.inc
+++ b/tcg/aarch64/tcg-target.c.inc
@@ -458,8 +458,9 @@ typedef enum {
     Ildst_imm_LDRVQ  = 0x3c000000 | 3 << 22 | 0 << 30,
     Ildst_imm_STRVQ  = 0x3c000000 | 2 << 22 | 0 << 30,
 
-    Ildst_imm_TO_I3310 = 0x00200800,
-    Ildst_imm_TO_I3313 = 0x01000000,
+    /* Additions to the ldst_imm format */
+    ldst_imm_to_sign_extend = 0x00200800,
+    ldst_imm_to_uimm        = 0x01000000,
 
     /* Load/store register pair instructions.  */
     Ildstpair_LDP    = 0x28400000,
@@ -880,12 +881,12 @@ static void tcg_out_insn_qrr_e(TCGContext *s, AArch64Insn insn, bool q,
               | (rn & 0x1f) << 5 | (rd & 0x1f));
 }
 
-static void tcg_out_insn_3310(TCGContext *s, AArch64Insn insn,
-                              TCGReg rd, TCGReg base, TCGType ext,
-                              TCGReg regoff)
+static void tcg_out_insn_ldst_sign_extend(TCGContext *s, AArch64Insn insn,
+                                          TCGReg rd, TCGReg base, TCGType ext,
+                                          TCGReg regoff)
 {
     /* Note the AArch64Insn constants above are for C3.3.12.  Adjust.  */
-    tcg_out32(s, insn | Ildst_imm_TO_I3310 | regoff << 16 |
+    tcg_out32(s, insn | ldst_imm_to_sign_extend | regoff << 16 |
               0x4000 | ext << 13 | base << 5 | (rd & 0x1f));
 }
 
@@ -895,11 +896,11 @@ static void tcg_out_insn_ldst_imm(TCGContext *s, AArch64Insn insn,
     tcg_out32(s, insn | (offset & 0x1ff) << 12 | rn << 5 | (rd & 0x1f));
 }
 
-static void tcg_out_insn_3313(TCGContext *s, AArch64Insn insn,
-                              TCGReg rd, TCGReg rn, uintptr_t scaled_uimm)
+static void tcg_out_insn_ldst_uimm(TCGContext *s, AArch64Insn insn,
+                                   TCGReg rd, TCGReg rn, uintptr_t scaled_uimm)
 {
     /* Note the AArch64Insn constants above are for C3.3.12.  Adjust.  */
-    tcg_out32(s, insn | Ildst_imm_TO_I3313 | scaled_uimm << 10
+    tcg_out32(s, insn | ldst_imm_to_uimm | scaled_uimm << 10
               | rn << 5 | (rd & 0x1f));
 }
 
@@ -1203,9 +1204,6 @@ static void tcg_out_addi_ptr(TCGContext *s, TCGReg rd, TCGReg rs,
     g_assert_not_reached();
 }
 
-/* Define something more legible for general use.  */
-#define tcg_out_ldst_r  tcg_out_insn_3310
-
 static void tcg_out_ldst(TCGContext *s, AArch64Insn insn, TCGReg rd,
                          TCGReg rn, intptr_t offset, int lgsize)
 {
@@ -1214,7 +1212,7 @@ static void tcg_out_ldst(TCGContext *s, AArch64Insn insn, TCGReg rd,
     if (offset >= 0 && !(offset & ((1 << lgsize) - 1))) {
         uintptr_t scaled_uimm = offset >> lgsize;
         if (scaled_uimm <= 0xfff) {
-            tcg_out_insn_3313(s, insn, rd, rn, scaled_uimm);
+            tcg_out_insn_ldst_uimm(s, insn, rd, rn, scaled_uimm);
             return;
         }
     }
@@ -1227,7 +1225,7 @@ static void tcg_out_ldst(TCGContext *s, AArch64Insn insn, TCGReg rd,
 
     /* Worst-case scenario, move offset to temp register, use reg offset.  */
     tcg_out_movi(s, TCG_TYPE_I64, TCG_REG_TMP0, offset);
-    tcg_out_ldst_r(s, insn, rd, rn, TCG_TYPE_I64, TCG_REG_TMP0);
+    tcg_out_insn_ldst_sign_extend(s, insn, rd, rn, TCG_TYPE_I64, TCG_REG_TMP0);
 }
 
 static bool tcg_out_mov(TCGContext *s, TCGType type, TCGReg ret, TCGReg arg)
@@ -1764,28 +1762,34 @@ static void tcg_out_qemu_ld_direct(TCGContext *s, MemOp memop, TCGType ext,
 {
     switch (memop & MO_SSIZE) {
     case MO_UB:
-        tcg_out_ldst_r(s, Ildst_imm_LDRB, data_r, h.base, h.index_ext, h.index);
+        tcg_out_insn_ldst_sign_extend(s, Ildst_imm_LDRB, data_r, h.base,
+                                      h.index_ext, h.index);
         break;
     case MO_SB:
-        tcg_out_ldst_r(s, ext ? Ildst_imm_LDRSBX : Ildst_imm_LDRSBW,
-                       data_r, h.base, h.index_ext, h.index);
+        tcg_out_insn_ldst_sign_extend(s,
+                                      ext ? Ildst_imm_LDRSBX : Ildst_imm_LDRSBW,
+                                      data_r, h.base, h.index_ext, h.index);
         break;
     case MO_UW:
-        tcg_out_ldst_r(s, Ildst_imm_LDRH, data_r, h.base, h.index_ext, h.index);
+        tcg_out_insn_ldst_sign_extend(s, Ildst_imm_LDRH, data_r, h.base,
+                                      h.index_ext, h.index);
         break;
     case MO_SW:
-        tcg_out_ldst_r(s, (ext ? Ildst_imm_LDRSHX : Ildst_imm_LDRSHW),
-                       data_r, h.base, h.index_ext, h.index);
+        tcg_out_insn_ldst_sign_extend(s,
+                                      ext ? Ildst_imm_LDRSHX : Ildst_imm_LDRSHW,
+                                      data_r, h.base, h.index_ext, h.index);
         break;
     case MO_UL:
-        tcg_out_ldst_r(s, Ildst_imm_LDRW, data_r, h.base, h.index_ext, h.index);
+        tcg_out_insn_ldst_sign_extend(s, Ildst_imm_LDRW, data_r, h.base,
+                                      h.index_ext, h.index);
         break;
     case MO_SL:
-        tcg_out_ldst_r(s, Ildst_imm_LDRSWX, data_r, h.base, h.index_ext,
-                       h.index);
+        tcg_out_insn_ldst_sign_extend(s, Ildst_imm_LDRSWX, data_r, h.base,
+                                      h.index_ext, h.index);
         break;
     case MO_UQ:
-        tcg_out_ldst_r(s, Ildst_imm_LDRX, data_r, h.base, h.index_ext, h.index);
+        tcg_out_insn_ldst_sign_extend(s, Ildst_imm_LDRX, data_r, h.base,
+                                      h.index_ext, h.index);
         break;
     default:
         g_assert_not_reached();
@@ -1797,16 +1801,20 @@ static void tcg_out_qemu_st_direct(TCGContext *s, MemOp memop,
 {
     switch (memop & MO_SIZE) {
     case MO_8:
-        tcg_out_ldst_r(s, Ildst_imm_STRB, data_r, h.base, h.index_ext, h.index);
+        tcg_out_insn_ldst_sign_extend(s, Ildst_imm_STRB, data_r, h.base,
+                                      h.index_ext, h.index);
         break;
     case MO_16:
-        tcg_out_ldst_r(s, Ildst_imm_STRH, data_r, h.base, h.index_ext, h.index);
+        tcg_out_insn_ldst_sign_extend(s, Ildst_imm_STRH, data_r, h.base,
+                                      h.index_ext, h.index);
         break;
     case MO_32:
-        tcg_out_ldst_r(s, Ildst_imm_STRW, data_r, h.base, h.index_ext, h.index);
+        tcg_out_insn_ldst_sign_extend(s, Ildst_imm_STRW, data_r, h.base,
+                                      h.index_ext, h.index);
         break;
     case MO_64:
-        tcg_out_ldst_r(s, Ildst_imm_STRX, data_r, h.base, h.index_ext, h.index);
+        tcg_out_insn_ldst_sign_extend(s, Ildst_imm_STRX, data_r, h.base,
+                                      h.index_ext, h.index);
         break;
     default:
         g_assert_not_reached();

-- 
2.43.0


