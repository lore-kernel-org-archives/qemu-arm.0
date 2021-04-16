Received: by 2002:ac2:5e6c:0:0:0:0:0 with SMTP id a12csp753219lfr;
        Fri, 16 Apr 2021 14:53:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxyjWOe1gJdcsZ7Mf58daCLbu1fOgA5sZNTUBSxbzg/P6dnPYc1ZG4t2Kb+8s7SQ+gGULDF
X-Received: by 2002:a6b:fa09:: with SMTP id p9mr5240637ioh.14.1618609989787;
        Fri, 16 Apr 2021 14:53:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618609989; cv=none;
        d=google.com; s=arc-20160816;
        b=gx/RM4weQf7eOrInuLxBJV3vpW2niDeGJbSoGIdiyZVKu7r7FnJIIUb8eNBohxH55j
         kyEWVJ980IBUfeTFx/vrrBXC5OfWuS05ZlRvdB4h/lScSJD+vfRB9jAjaXbPJMiFIkyq
         n95sfv3QHzWEySF266trm6c1ydrcJu/4tk9qNbhcpglI3ad0P7M/z1nvTXvPd3ewYYHm
         Qqdf7EbQcac/XsjVoFNiGq9fBufK5ubRzf74HzdG4vEzbjX2/p3t0m19p8UhyUFJPUU+
         YUW9NalWtnrxmjUakvwgw85zibM0KkJfHQhW0/YBSRlvG+NkruJNhXsTwdh42EEAf/Od
         4n/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=BxrpeVsOh7NSGL6r65vW+3WtU9d9sINqZuLtaN2MbiQ=;
        b=lHbVLzVqyKTu2yxN1NOWdboQ76FMsH5mIf4XOsqM0DNqcP7q8a5dE0GNZYLNteasCz
         ULB+iVQ29OBxbbdfmnFIVTzwqDjp1sI+jrLe3jXgIHPdSi2ZXoa+vraf7TrIwPBDmbBI
         7xI69eCNys3TgXP9iUhCzEC+oxkekOsXz48kAJFv47lqHvXG/YJGJLuJnnsCtP/zD5nr
         NLNEqIoUDMpYriB1pjSq1JvkwwNUMRAyrYdpz8cuTyE2C3jAYz3jzatVnvt0IPIbIqC0
         PJV25i8qk8ju0mo9JOYIypFSYHU3Ja/iEbMBxjHNKkwH86hboYtbtb6IdfStSYztIXEP
         n1Kw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dQtGuTpc;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g2si3132895ilk.84.2021.04.16.14.53.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 16 Apr 2021 14:53:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dQtGuTpc;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lXWOj-0007Nt-4i
	for alex.bennee@linaro.org; Fri, 16 Apr 2021 17:53:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXVdv-0006ms-5J
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 17:04:47 -0400
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f]:43905)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXVda-0001pD-0M
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 17:04:46 -0400
Received: by mail-pg1-x52f.google.com with SMTP id p12so20003761pgj.10
 for <qemu-devel@nongnu.org>; Fri, 16 Apr 2021 14:04:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BxrpeVsOh7NSGL6r65vW+3WtU9d9sINqZuLtaN2MbiQ=;
 b=dQtGuTpc+NnybSBeYfxxsdU2HzlD1xhbiW2S68xYO+cmm+HEjsLGTZhqlBko8Ftxyw
 zUFjXLBfHwFsm3LKUeMGWMT27T61FHPSAOyXNxTQpwa6fVeXOTM+C0ZTc1yLAIVOT0wf
 vydxPPOuI5p9ZaOx//njoBwC0VMW4w7oPKWAw7fITsrFLmYBNb4vOrILT4qky/XxRuzV
 R9FkVt70x7aPJTDnjoFPTToD9pulhax+xuEcqS/O3cZ9P82hZk4DUuY4ckSBWGrt9Vmp
 Lyn7C226SBWP68Ly9HPRRWWDhNpWynYnUe4HFI2YzgODlL/EHI1diZ2U54TQp6yPEXfn
 zUbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BxrpeVsOh7NSGL6r65vW+3WtU9d9sINqZuLtaN2MbiQ=;
 b=cNh4mqZ7UqjOCiaZgpeVF0orjNKfpRCfQf5Xf7tyQFFa3Wm0GfyBTVdWTcRdt/uT4p
 RuSRbJvroVULna0DJpcZegU0Saf0pVMkPV/eEvN5f21uiaQDgdZYv7hLGS4zezJyiuLI
 Wk1/BSTDdhINuTMRd+DRJHOGW3YZ1SIFCGMW29JAh2YWdG/SJnZaV3iTGlPFkyObZGwF
 nU6CJVnu9u8wgo0bt7dhUryQtIo3aS3MK41IwpCkPdKiCJg7+rhz4Ey2d4P1K4YckHu+
 RP1q5lV7VP2H4cgBWoozcuTWXMISZaYWHYja/NhVXSL1EDvxcnq+rgKzspfJV/eXF0dT
 MSNw==
X-Gm-Message-State: AOAM530/2gFamqy346tOX3Orl+uSGPjOS6zcTHUZdume+bkOKGZVGvd8
 GohTQciEVq2fMFcSAgToT0B4GEMH78qVnA==
X-Received: by 2002:a65:6184:: with SMTP id c4mr857679pgv.200.1618607064762;
 Fri, 16 Apr 2021 14:04:24 -0700 (PDT)
Received: from localhost.localdomain ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id m9sm5766734pgt.65.2021.04.16.14.04.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Apr 2021 14:04:24 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 74/81] target/arm: Implement aarch64 SUDOT, USDOT
Date: Fri, 16 Apr 2021 14:02:33 -0700
Message-Id: <20210416210240.1591291-75-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210416210240.1591291-1-richard.henderson@linaro.org>
References: <20210416210240.1591291-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: qVlA6oIBBICO

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h           |  5 +++++
 target/arm/translate-a64.c | 25 +++++++++++++++++++++++++
 2 files changed, 30 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index b43fd066ba..a0865e224c 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -4206,6 +4206,11 @@ static inline bool isar_feature_aa64_rcpc_8_4(const ARMISARegisters *id)
     return FIELD_EX64(id->id_aa64isar1, ID_AA64ISAR1, LRCPC) >= 2;
 }
 
+static inline bool isar_feature_aa64_i8mm(const ARMISARegisters *id)
+{
+    return FIELD_EX64(id->id_aa64isar1, ID_AA64ISAR1, I8MM) != 0;
+}
+
 static inline bool isar_feature_aa64_ccidx(const ARMISARegisters *id)
 {
     return FIELD_EX64(id->id_aa64mmfr2, ID_AA64MMFR2, CCIDX) != 0;
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index f45b81e56d..0d45a44f51 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -12190,6 +12190,13 @@ static void disas_simd_three_reg_same_extra(DisasContext *s, uint32_t insn)
         }
         feature = dc_isar_feature(aa64_dp, s);
         break;
+    case 0x03: /* USDOT */
+        if (size != MO_32) {
+            unallocated_encoding(s);
+            return;
+        }
+        feature = dc_isar_feature(aa64_i8mm, s);
+        break;
     case 0x18: /* FCMLA, #0 */
     case 0x19: /* FCMLA, #90 */
     case 0x1a: /* FCMLA, #180 */
@@ -12230,6 +12237,10 @@ static void disas_simd_three_reg_same_extra(DisasContext *s, uint32_t insn)
                          u ? gen_helper_gvec_udot_b : gen_helper_gvec_sdot_b);
         return;
 
+    case 0x3: /* USDOT */
+        gen_gvec_op4_ool(s, is_q, rd, rn, rm, rd, 0, gen_helper_gvec_usdot_b);
+        return;
+
     case 0x8: /* FCMLA, #0 */
     case 0x9: /* FCMLA, #90 */
     case 0xa: /* FCMLA, #180 */
@@ -13375,6 +13386,13 @@ static void disas_simd_indexed(DisasContext *s, uint32_t insn)
             return;
         }
         break;
+    case 0x0f: /* SUDOT, USDOT */
+        if (is_scalar || (size & 1) || !dc_isar_feature(aa64_i8mm, s)) {
+            unallocated_encoding(s);
+            return;
+        }
+        size = MO_32;
+        break;
     case 0x11: /* FCMLA #0 */
     case 0x13: /* FCMLA #90 */
     case 0x15: /* FCMLA #180 */
@@ -13489,6 +13507,13 @@ static void disas_simd_indexed(DisasContext *s, uint32_t insn)
                          u ? gen_helper_gvec_udot_idx_b
                          : gen_helper_gvec_sdot_idx_b);
         return;
+    case 0x0f: /* SUDOT, USDOT */
+        gen_gvec_op4_ool(s, is_q, rd, rn, rm, rd, index,
+                         extract32(insn, 23, 1)
+                         ? gen_helper_gvec_usdot_idx_b
+                         : gen_helper_gvec_sudot_idx_b);
+        return;
+
     case 0x11: /* FCMLA #0 */
     case 0x13: /* FCMLA #90 */
     case 0x15: /* FCMLA #180 */
-- 
2.25.1

