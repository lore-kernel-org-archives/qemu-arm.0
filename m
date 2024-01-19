Received: by 2002:a17:906:2b99:b0:a2e:1324:ea5c with SMTP id m25csp1237511ejg;
        Fri, 19 Jan 2024 14:48:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFCedYjm4KAOM24Ie0ZnyTELfupaQpW0OuCrIAiiUMcLVLlxmPlG5a2VY+22qpQBD7JXZN0
X-Received: by 2002:a54:4785:0:b0:3bd:93ed:fb3 with SMTP id o5-20020a544785000000b003bd93ed0fb3mr408875oic.94.1705704510742;
        Fri, 19 Jan 2024 14:48:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1705704510; cv=none;
        d=google.com; s=arc-20160816;
        b=QF9xOvgTphCacJ69sBlRwJ50s4arLJdsYWBE0HqCx7QMbLTOAtqcXzqmk4dfwjpNKx
         wOHtijQNsd0mdOWTeZYJkGa2cbpbAY1FkklwFr96Ua7y0WsP/U20QDPQDwFiwA3bln4L
         O8L/oueghWR+TBXvjWKGEkxUcRltU2US4RSWJmi5mK/eAK36HAf47enzQcKpTJKz5LPu
         zru1aUk03EnkRXWFEH47AcDzvD1RgfWzxlOZkv1YDqBf+OpqTVfj1nFUyM3Fax+rSQl2
         IwoVvZK/aT36Fsfrbmxzft5xrXSlLDbb3M6yIrrztGoREj6bhvRF1jCS/1xCtaxOuWlt
         T+Pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=0i49bfX5EKeDHdiiMATpVEET9ukdc5btc9PSeKgXkWY=;
        fh=FGhvf/J6viukKll+OHHiF0KzEfQoh7e0u+ACsGzuW1Y=;
        b=FVSh/VNnw6+k//a7BU0dbr6wpfqapGUIhM66TRQk0/3/yaOreqRSeMmgG1nYWkROax
         83omrbTCPnNgZ3d/hgWNjgcRMlimSP+bjaGPzZTfOtcRKcCzhpyqTAm3DViPBFhsUmgz
         fIeLem0p1LKui0xSirlx6N88wAcj263+G8JPMHvX5NLX2CVKP4GTJK0T7Hn7gh/bHP2b
         fMWL45+pLW84CgY6CshJaLjGDfjDYNnDuqV5eZAL227HnZ5Dfkx/yrH45/s7zdwuvWd+
         E+fh10xPw1nVhMo3kCAX4B0FUkk1OOrjnqNdLtOt+j1TTor28B8RUXQ7KBn87DPvClkg
         S10A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=N4kJLnJ2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y10-20020a05622a004a00b00429997abdbdsi283512qtw.6.2024.01.19.14.48.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 19 Jan 2024 14:48:30 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=N4kJLnJ2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rQxeN-00060n-In; Fri, 19 Jan 2024 17:47:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rQxeM-000605-DA
 for qemu-arm@nongnu.org; Fri, 19 Jan 2024 17:47:46 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rQxeK-00080N-JM
 for qemu-arm@nongnu.org; Fri, 19 Jan 2024 17:47:46 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-40e800461baso14094915e9.3
 for <qemu-arm@nongnu.org>; Fri, 19 Jan 2024 14:47:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1705704463; x=1706309263; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0i49bfX5EKeDHdiiMATpVEET9ukdc5btc9PSeKgXkWY=;
 b=N4kJLnJ2iz/KHtLYyu4fu5iS+qKem3beIuBd/LsOru1Lj9U9Oe3gYbZenp4nPyiSoE
 l+hXAo0hHnaNlh/UsS4co17bK9at9W5PadtMSBHJwZxhDNhahiI1P0cNpKmaIZyB/iLu
 IqB9drLphee4gj3B3lGLojs23GVEdJlXdzGd5Sb9xI7WT4A1MXJ13T14gKwciavlPtqT
 itqHCaX/OLS9UyAqZuojMm3mnZ+ytpKYGnYblIXv3CT23X0suLQi3zvdKxatty5mhXdS
 HMzqvBqZ7oScVevDzDQjuldZfFJO5OWOcY2WPHaatSBWsq3x24wYhHJjWTu7G3lmv2hx
 5iYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705704463; x=1706309263;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0i49bfX5EKeDHdiiMATpVEET9ukdc5btc9PSeKgXkWY=;
 b=j4TpsGl/LzRsIiZcOStnUiYLjkVvHornQFkbRZhgRnLDQ5LD2TxAMNBW9sFv9DIjhB
 u7xxFRBE07jfjVTfcXDdIwMGTeuxKsyE6p1+hyYQ0fbGfyX1ixPS2W47U1yeIDh09gMu
 jZdXSFsfhidp7eMkChRrH4FVuOneRudjiCMTdS5TqvwHKpQmJIw1+SGf5dBA+q4HZJ1o
 i7FE3SPlqPaMm0ZVsuXE/r9c0cTTfyKPz2KjNR3id35HoP5TEnw7XLeLeM72OJvy687g
 +A9kt8JUcQUC1ADtxXRo+duQKFMZ+G9NKV4kO2DxyfjAfTxCYpTTVkrlfcfpBbMKJblX
 0aFw==
X-Gm-Message-State: AOJu0YzCm9+6VfGFUROLKhSuixJRQxxCPrY9xPESwt61LIEwIY/r5oS0
 NnsgD9G55mqcqla0ALVdAHM49t5lLdinaValb+Dwhxbn/0WfUfyYre0ptllRLzQ=
X-Received: by 2002:a7b:c389:0:b0:40e:76f4:8cc8 with SMTP id
 s9-20020a7bc389000000b0040e76f48cc8mr132652wmj.287.1705704463129; 
 Fri, 19 Jan 2024 14:47:43 -0800 (PST)
Received: from localhost.localdomain (91-163-26-170.subs.proxad.net.
 [91.163.26.170]) by smtp.gmail.com with ESMTPSA id
 p37-20020a05600c1da500b0040ea22b51cbsm911964wms.34.2024.01.19.14.47.42
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 19 Jan 2024 14:47:42 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v3 18/38 2/2] tcg/aarch64: Generate TBZ, TBNZ
Date: Fri, 19 Jan 2024 23:47:37 +0100
Message-ID: <20240119224737.48943-2-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240110224408.10444-19-richard.henderson@linaro.org>
References: <20240110224408.10444-19-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: PevS7anh1qhA

From: Richard Henderson <richard.henderson@linaro.org>

Test the sign bit for LT/GE vs 0, and TSTNE/EQ vs a power of 2.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 tcg/aarch64/tcg-target.c.inc | 71 ++++++++++++++++++++++++++++++------
 1 file changed, 59 insertions(+), 12 deletions(-)

diff --git a/tcg/aarch64/tcg-target.c.inc b/tcg/aarch64/tcg-target.c.inc
index a19158f4ea..55225313ad 100644
--- a/tcg/aarch64/tcg-target.c.inc
+++ b/tcg/aarch64/tcg-target.c.inc
@@ -105,6 +105,18 @@ static bool reloc_pc19(tcg_insn_unit *src_rw, const tcg_insn_unit *target)
     return false;
 }
 
+static bool reloc_pc14(tcg_insn_unit *src_rw, const tcg_insn_unit *target)
+{
+    const tcg_insn_unit *src_rx = tcg_splitwx_to_rx(src_rw);
+    ptrdiff_t offset = target - src_rx;
+
+    if (offset == sextract64(offset, 0, 14)) {
+        *src_rw = deposit32(*src_rw, 5, 14, offset);
+        return true;
+    }
+    return false;
+}
+
 static bool patch_reloc(tcg_insn_unit *code_ptr, int type,
                         intptr_t value, intptr_t addend)
 {
@@ -115,6 +127,8 @@ static bool patch_reloc(tcg_insn_unit *code_ptr, int type,
         return reloc_pc26(code_ptr, (const tcg_insn_unit *)value);
     case R_AARCH64_CONDBR19:
         return reloc_pc19(code_ptr, (const tcg_insn_unit *)value);
+    case R_AARCH64_TSTBR14:
+        return reloc_pc14(code_ptr, (const tcg_insn_unit *)value);
     default:
         g_assert_not_reached();
     }
@@ -380,6 +394,10 @@ typedef enum {
     /* Conditional branch (immediate).  */
     I3202_B_C       = 0x54000000,
 
+    /* Test and branch (immediate).  */
+    I3205_TBZ       = 0x36000000,
+    I3205_TBNZ      = 0x37000000,
+
     /* Unconditional branch (immediate).  */
     I3206_B         = 0x14000000,
     I3206_BL        = 0x94000000,
@@ -660,6 +678,14 @@ static void tcg_out_insn_3202(TCGContext *s, AArch64Insn insn,
     tcg_out32(s, insn | tcg_cond_to_aarch64[c] | (imm19 & 0x7ffff) << 5);
 }
 
+static void tcg_out_insn_3205(TCGContext *s, AArch64Insn insn,
+                              TCGReg rt, int imm6, int imm14)
+{
+    insn |= (imm6 & 0x20) << (31 - 5);
+    insn |= (imm6 & 0x1f) << 19;
+    tcg_out32(s, insn | (imm14 & 0x3fff) << 5 | rt);
+}
+
 static void tcg_out_insn_3206(TCGContext *s, AArch64Insn insn, int imm26)
 {
     tcg_out32(s, insn | (imm26 & 0x03ffffff));
@@ -1415,7 +1441,7 @@ static inline void tcg_out_goto_label(TCGContext *s, TCGLabel *l)
 static void tcg_out_brcond(TCGContext *s, TCGType ext, TCGCond c, TCGArg a,
                            TCGArg b, bool b_const, TCGLabel *l)
 {
-    intptr_t offset;
+    int tbit = -1;
     bool need_cmp = true;
 
     switch (c) {
@@ -1425,31 +1451,52 @@ static void tcg_out_brcond(TCGContext *s, TCGType ext, TCGCond c, TCGArg a,
             need_cmp = false;
         }
         break;
+    case TCG_COND_LT:
+    case TCG_COND_GE:
+        if (b_const && b == 0) {
+            c = (c == TCG_COND_LT ? TCG_COND_TSTNE : TCG_COND_TSTEQ);
+            tbit = ext ? 63 : 31;
+            need_cmp = false;
+        }
+        break;
+    case TCG_COND_TSTEQ:
+    case TCG_COND_TSTNE:
+        if (b_const && is_power_of_2(b)) {
+            tbit = ctz64(b);
+            need_cmp = false;
+        }
+        break;
     default:
         break;
     }
 
     if (need_cmp) {
         tcg_out_cmp(s, ext, c, a, b, b_const);
-    }
-
-    if (!l->has_value) {
         tcg_out_reloc(s, s->code_ptr, R_AARCH64_CONDBR19, l, 0);
-        offset = tcg_in32(s) >> 5;
-    } else {
-        offset = tcg_pcrel_diff(s, l->u.value_ptr) >> 2;
-        tcg_debug_assert(offset == sextract64(offset, 0, 19));
+        tcg_out_insn(s, 3202, B_C, c, 0);
+        return;
     }
 
-    if (need_cmp) {
-        tcg_out_insn(s, 3202, B_C, c, offset);
+    if (tbit >= 0) {
+        tcg_out_reloc(s, s->code_ptr, R_AARCH64_TSTBR14, l, 0);
+        switch (c) {
+        case TCG_COND_TSTEQ:
+            tcg_out_insn(s, 3205, TBZ, a, tbit, 0);
+            break;
+        case TCG_COND_TSTNE:
+            tcg_out_insn(s, 3205, TBNZ, a, tbit, 0);
+            break;
+        default:
+            g_assert_not_reached();
+        }
     } else {
+        tcg_out_reloc(s, s->code_ptr, R_AARCH64_CONDBR19, l, 0);
         switch (c) {
         case TCG_COND_EQ:
-            tcg_out_insn(s, 3201, CBZ, ext, a, offset);
+            tcg_out_insn(s, 3201, CBZ, ext, a, 0);
             break;
         case TCG_COND_NE:
-            tcg_out_insn(s, 3201, CBNZ, ext, a, offset);
+            tcg_out_insn(s, 3201, CBNZ, ext, a, 0);
             break;
         default:
             g_assert_not_reached();
-- 
2.41.0

