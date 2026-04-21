Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22A17F55805
	for <qemu-arm@archiver.kernel.org>; Tue, 21 Apr 2026 05:14:32 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wF3R6-0007wi-2f; Tue, 21 Apr 2026 01:14:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wF3Qt-0007ut-4L
 for qemu-arm@nongnu.org; Tue, 21 Apr 2026 01:14:01 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wF3Qr-0006Jr-7q
 for qemu-arm@nongnu.org; Tue, 21 Apr 2026 01:13:58 -0400
Received: by mail-pl1-x62d.google.com with SMTP id
 d9443c01a7336-2b2589c26e3so34125815ad.1
 for <qemu-arm@nongnu.org>; Mon, 20 Apr 2026 22:13:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1776748435; x=1777353235; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/xapIpLETptineJX0lgqdbGa1HlQeIgwkY2ZGyDukvI=;
 b=GKDtbsnwWXBUyez5l22quUYvHv3igKtOzh8KfEUZ4TqyxzisBUoy/7QPlPP5MsI5Ec
 Ls8CCRuGdw7oJsErc8ghmp9tnvAz/HQewK9ycLoKLHg3PEND2Ki0QxlGEOnZJl7aFVFe
 8K2XzWv4PvvzIPhPzBcl0h0MARChBcnC7OZ6DwJxrtHcARNwXkk/rfsTzI7gGBsyOCsN
 e/PL8ToVYmVjD2PQKWclJNE7qXHPb68AP1yVFNkqmf+e7/wo/gLl1rFIxyd0gBTdeELR
 7gFBLNGS1TRrtsGsfjON26Oc4RokzuHHV2lWm8QhmMuu0kZt6jf3roaUKRHs1bZcJoGp
 PEDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776748435; x=1777353235;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=/xapIpLETptineJX0lgqdbGa1HlQeIgwkY2ZGyDukvI=;
 b=bXKGFDdIgP0L8/zawG5+9ol6QnFEg1vLxAtxmF21VSJajYJjcylRpT9XitaEbJn65X
 SnLWmzjaf1WWVp7WkWgOpU3ukgPUKPPZpHXM2JlMYzDi3iDEKKIwivifVEWVjbq+W/q5
 im39mMcgXfQgnlqVXeY/O9lr2Ok7pd3a7aDiIB37QDYLJCOYqE0iUe3t9ApnM+nmqb7D
 Xn0epJd3FqhPz0VZ7yRcVO0f+LW4uFNcp1yfy1oeZn2tpNd9YvJXer67Km5nF00eGg+c
 aHGGBg/RX6N+GCD7fOwu02Yl66wN9fPMCn/7uhhrB2QbLKRV7Fe1ADiFM8KpJT0eC+YS
 s2lA==
X-Gm-Message-State: AOJu0YzCYBRGSdpTcmH2IyC6ZrIGIwddHaJhlmPTq9pXeZLbuE+gpgHq
 0kjcE0cZSLKdPx1xq2TGECPgpNRAE4OX8H+NFBJZ90VHPfmZgsqqIZwzwuiQRuGMwP9MmoPbTvF
 0TUZFSlU=
X-Gm-Gg: AeBDieu7jXxMa82LDFd2keakM/rzlI6JM/8aKkjrPuty8UArv0fZrWY2uoNf/KARVS6
 ep5Vn50nm/sXsXXszRTo82XE+q1lNM7AAAoU9NhYyLmyr5ZmjIuS4MQ4FAM0g0qVLEq08AfkSpU
 A9X2rPYARrdtyShp0Vj56i9N/96P2w2BEjJ7oPm+MwC+X36eDLwXgmSJCfVoA1WVi1lQ2RdEMMy
 guuGL2gIRTUPOWYiyvgIxx931EM3DcRZoStTzpPBHTFb1OkNAiEYrTy55jjWAn0VqdI2zXhG8qe
 VcTxLuWu3TOPbRJ1zXczrkE4p8IuHzyEs9SI44MFRjSXsMrxBKa/xx3pgeOLXbfmY8rhE0aRDRx
 qAhQ1DSlFclhWMfiQaxH4DLcFV+HOQIkhG2ndjtrVdn/1414zhHAQTeGJkEW+HoLJE52iWter3Q
 m/rCpD461MS4dWxp1KNkuzS61X7rSdQGFZW2zVbckW
X-Received: by 2002:a17:902:988d:b0:2b2:6cab:30fe with SMTP id
 d9443c01a7336-2b5f9fca466mr131495985ad.29.1776748434622; 
 Mon, 20 Apr 2026 22:13:54 -0700 (PDT)
Received: from stoup.. ([180.233.125.15]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2b5fab0cddfsm174631715ad.49.2026.04.20.22.13.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Apr 2026 22:13:54 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 01/37] target/arm: Implement ID_AA64ISAR3
Date: Tue, 21 Apr 2026 15:13:10 +1000
Message-ID: <20260421051346.41106-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260421051346.41106-1-richard.henderson@linaro.org>
References: <20260421051346.41106-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu-features.h    | 9 +++++++++
 target/arm/helper.c          | 8 ++++++--
 target/arm/cpu-sysregs.h.inc | 1 +
 3 files changed, 16 insertions(+), 2 deletions(-)

diff --git a/target/arm/cpu-features.h b/target/arm/cpu-features.h
index b683c9551a..b165fe0b1a 100644
--- a/target/arm/cpu-features.h
+++ b/target/arm/cpu-features.h
@@ -244,6 +244,15 @@ FIELD(ID_AA64ISAR2, CSSC, 52, 4)
 FIELD(ID_AA64ISAR2, LUT, 56, 4)
 FIELD(ID_AA64ISAR2, ATS1A, 60, 4)
 
+FIELD(ID_AA64ISAR3, CPA, 0, 4)
+FIELD(ID_AA64ISAR3, FAMINMAX, 4, 4)
+FIELD(ID_AA64ISAR3, TLBIW, 8, 4)
+FIELD(ID_AA64ISAR3, PACM, 12, 4)
+FIELD(ID_AA64ISAR3, LSFE, 16, 4)
+FIELD(ID_AA64ISAR3, OCCMO, 20, 4)
+FIELD(ID_AA64ISAR3, LSUI, 24, 4)
+FIELD(ID_AA64ISAR3, FPRCVT, 28, 4)
+
 FIELD(ID_AA64PFR0, EL0, 0, 4)
 FIELD(ID_AA64PFR0, EL1, 4, 4)
 FIELD(ID_AA64PFR0, EL2, 8, 4)
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 7389f2988c..08285b69a7 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -6552,11 +6552,11 @@ void register_cp_regs_for_features(ARMCPU *cpu)
               .access = PL1_R, .type = ARM_CP_CONST,
               .accessfn = access_tid3,
               .resetvalue = GET_IDREG(isar, ID_AA64ISAR2)},
-            { .name = "ID_AA64ISAR3_EL1_RESERVED", .state = ARM_CP_STATE_AA64,
+            { .name = "ID_AA64ISAR3_EL1", .state = ARM_CP_STATE_AA64,
               .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 6, .opc2 = 3,
               .access = PL1_R, .type = ARM_CP_CONST,
               .accessfn = access_tid3,
-              .resetvalue = 0 },
+              .resetvalue = GET_IDREG(isar, ID_AA64ISAR3) },
             { .name = "ID_AA64ISAR4_EL1_RESERVED", .state = ARM_CP_STATE_AA64,
               .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 6, .opc2 = 4,
               .access = PL1_R, .type = ARM_CP_CONST,
@@ -6785,6 +6785,10 @@ void register_cp_regs_for_features(ARMCPU *cpu)
                                R_ID_AA64ISAR2_BC_MASK |
                                R_ID_AA64ISAR2_RPRFM_MASK |
                                R_ID_AA64ISAR2_CSSC_MASK },
+            { .name = "ID_AA64ISAR3_EL1",
+              .exported_bits = R_ID_AA64ISAR3_FAMINMAX_MASK |
+                               R_ID_AA64ISAR3_LSFE_MASK |
+                               R_ID_AA64ISAR3_FPRCVT_MASK },
             { .name = "ID_AA64ISAR*_EL1_RESERVED",
               .is_glob = true },
         };
diff --git a/target/arm/cpu-sysregs.h.inc b/target/arm/cpu-sysregs.h.inc
index 3d1ed40f04..b99579f773 100644
--- a/target/arm/cpu-sysregs.h.inc
+++ b/target/arm/cpu-sysregs.h.inc
@@ -10,6 +10,7 @@ DEF(ID_AA64AFR1_EL1, 3, 0, 0, 5, 5)
 DEF(ID_AA64ISAR0_EL1, 3, 0, 0, 6, 0)
 DEF(ID_AA64ISAR1_EL1, 3, 0, 0, 6, 1)
 DEF(ID_AA64ISAR2_EL1, 3, 0, 0, 6, 2)
+DEF(ID_AA64ISAR3_EL1, 3, 0, 0, 6, 3)
 DEF(ID_AA64MMFR0_EL1, 3, 0, 0, 7, 0)
 DEF(ID_AA64MMFR1_EL1, 3, 0, 0, 7, 1)
 DEF(ID_AA64MMFR2_EL1, 3, 0, 0, 7, 2)
-- 
2.43.0


