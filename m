Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp499265lfg;
        Fri, 30 Apr 2021 14:12:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxTvg7pkRgFHAm+MH+U3kU9C/gxf5XdiJl9i5eMxZr00fKUTaW/i4Uct4C5VOEILiQh3Nw4
X-Received: by 2002:a92:360f:: with SMTP id d15mr6046570ila.31.1619817150902;
        Fri, 30 Apr 2021 14:12:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1619817150; cv=none;
        d=google.com; s=arc-20160816;
        b=AbcNj57XjFgPKndDmt5Hmx5GZ3wfjBA8ubORuIeTB6/caKff4w8GATceEBNEllg+0K
         PoEUyfMgh5WPeO5qGSHyFPLngImZR83/uwh3G/KgdNltrRnaBjQNc5vDfYOYzIZeizmr
         6TmDDB2u/ecs1aD+41QklIsYO9ZVPrqPAnbzLKpEmosXohg6QiogbE0xlpPz3O4J+Iw0
         oWkhUpPezFKvt78QYB0pNu2UEs9vEOHu80GO9flaUIZLVs7TW91TFz8LyQ0fzFYC0swL
         XOesP4aygXAiWirOCCDne4jfgqqGwCQ2nfNGwNhCheCCBRM+PKpiy7OSYFp+u1tegp7I
         jDgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=cRF8Mv+M0NzHkJxcMg0tP1cErf1whBJVFSultKETQRM=;
        b=JFamPCOorypIlKxuo4+mq9Zbdi/BBVm1a6w5cU4PW5r4Mu0oOokxnRnc9iFgbsirww
         YrQb9NDiPHoSGQlp63RMq54cBhICtxOcwRSAS/Z/BUL/nDl910onwfaaLaGlxYd/LDU5
         RCgkbl/kMlXuY1haIKTcu84TuFjiuwzzdvOwe1+/GgoDmngtLlHIx3MjCf3HxgCbTEVs
         xDHah8HjzKOCu/JFIVegmtN2sJjn06svGa/37bCsFw9VLov0op8HXR4Hc/JPhyFi/SLf
         JxxoMWWurcQ+n2rS1ZxOYF4MLrk8pOSMIbDb7PoyKfGB1Lbb6YF5cwRno98O/5ypw1jy
         dZ3g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JItORHXN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l11si3704923ilo.63.2021.04.30.14.12.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 30 Apr 2021 14:12:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JItORHXN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lcaR4-0005dC-80
	for alex.bennee@linaro.org; Fri, 30 Apr 2021 17:12:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcZmg-0004zg-O2
 for qemu-arm@nongnu.org; Fri, 30 Apr 2021 16:30:46 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435]:36786)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcZlw-0007oF-WB
 for qemu-arm@nongnu.org; Fri, 30 Apr 2021 16:30:46 -0400
Received: by mail-pf1-x435.google.com with SMTP id p4so1772856pfo.3
 for <qemu-arm@nongnu.org>; Fri, 30 Apr 2021 13:29:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cRF8Mv+M0NzHkJxcMg0tP1cErf1whBJVFSultKETQRM=;
 b=JItORHXNVtCDA74Dgt76waqUAe8+Mmip0wKIrv1Uxa5ZlmUPJf0XICf8pXb6jrE7y4
 tOvG99ah2QCcUdQhmBhK/f9gXRRsDOuGnVXujooYf2ZCHRZ34ZNUsNLVFogiPZ6/5Nnx
 yLJVqROjceF8+8I798IwnjQoqoiIx3boW7rPP/OyJCV7qpVcPOqksYFReyP+1/ZlB44e
 Q3dfmKPfJQhTCjXTqn3WkfkxsO8/TqmHkB5SHN0wSJDubD4QETRFctGH3AT/twa4huoW
 i+FTgBAsmlybuUc8PAGzXUz+93+ERDylTU2Uoc4yaj/3HQDEE2hX1AFGyess8LX4Eukd
 2D4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cRF8Mv+M0NzHkJxcMg0tP1cErf1whBJVFSultKETQRM=;
 b=nYNjva+WVrQPJKrN3NKyYiium/hW7ZNL6hXf5WePo5d4cZrM8DR/oR/ohp5T9XYk81
 jTztVKQwmjxXyXT2hyZbFccErEQaJCu5rvFuZW4CPIbyDIpP7fnobouGy1dzZD6mQMb/
 nIYutwW8neRCHgeUJIjqrEdlibhi4tzXWlgXXvMfqq2nMbhPlFtRZcLYxaoHht2mp8vS
 D4sXyplUCJn5X6i/t2YUADmZLYWI1ogDEb2AilBujQovCc+lzhFtFBZUVmF1f0mYmL9X
 vCpcxP3EWrznnchvG3+2XjrZTqekVuE7EW/pdeDN8pQPSrEJjnzkGf3jRiNSHnrGMMUu
 POlQ==
X-Gm-Message-State: AOAM530jgrK93KyH1lw2dcXGAhBbGAu9daY4veW6Z0GFjaMokhz+89RY
 4/N438px7rYSc52hhRxm6wWB6Q==
X-Received: by 2002:aa7:8f15:0:b029:27a:4eb9:7c9a with SMTP id
 x21-20020aa78f150000b029027a4eb97c9amr6617043pfr.62.1619814597009; 
 Fri, 30 Apr 2021 13:29:57 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id q23sm3788781pgt.42.2021.04.30.13.29.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Apr 2021 13:29:56 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 74/82] target/arm: Implement aarch64 SUDOT, USDOT
Date: Fri, 30 Apr 2021 13:26:02 -0700
Message-Id: <20210430202610.1136687-75-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210430202610.1136687-1-richard.henderson@linaro.org>
References: <20210430202610.1136687-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: hepa+wfkXu/6

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h           |  5 +++++
 target/arm/translate-a64.c | 25 +++++++++++++++++++++++++
 2 files changed, 30 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index c75601b221..b2b684df55 100644
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
index a8edd2d281..c875481784 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -12175,6 +12175,13 @@ static void disas_simd_three_reg_same_extra(DisasContext *s, uint32_t insn)
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
@@ -12215,6 +12222,10 @@ static void disas_simd_three_reg_same_extra(DisasContext *s, uint32_t insn)
                          u ? gen_helper_gvec_udot_b : gen_helper_gvec_sdot_b);
         return;
 
+    case 0x3: /* USDOT */
+        gen_gvec_op4_ool(s, is_q, rd, rn, rm, rd, 0, gen_helper_gvec_usdot_b);
+        return;
+
     case 0x8: /* FCMLA, #0 */
     case 0x9: /* FCMLA, #90 */
     case 0xa: /* FCMLA, #180 */
@@ -13360,6 +13371,13 @@ static void disas_simd_indexed(DisasContext *s, uint32_t insn)
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
@@ -13474,6 +13492,13 @@ static void disas_simd_indexed(DisasContext *s, uint32_t insn)
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

