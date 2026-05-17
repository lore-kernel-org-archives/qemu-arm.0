Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB987CD4851
	for <qemu-arm@archiver.kernel.org>; Sun, 17 May 2026 00:31:01 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wOPP9-0007S0-3O; Sat, 16 May 2026 20:30:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wOPOU-000768-V9
 for qemu-arm@nongnu.org; Sat, 16 May 2026 20:30:13 -0400
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wOPOP-0004m0-Re
 for qemu-arm@nongnu.org; Sat, 16 May 2026 20:30:08 -0400
Received: by mail-pf1-x430.google.com with SMTP id
 d2e1a72fcca58-82f8b60e54dso961245b3a.2
 for <qemu-arm@nongnu.org>; Sat, 16 May 2026 17:30:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1778977804; x=1779582604; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FjP/qEuf/tycrqFw+mSyrMAF+WG+DYMnwHYOmyGsbr4=;
 b=S1ti30OevQ3yKzdpFa14Czi9fWKejfeJC/8fniQZmKbJwuMEE46tFymK11c74V5A5E
 fTMqCumV8TmLjrLwd5pwSPnjx3FhEG523dAZHPccAs9WONCMKACz0VG1Sc+zZkZ1eQhP
 +lKNAQ5yoi2EUqgB5WkL+Es00zN1VLZTJ9hAXJlcd7fLLY5jN/+/TbQT0FhZymwxe5wy
 qll6yXqk/1qrJfu498kFx8WJVmTsbE7mwQujNSxijOCATwPW7f6vzKXTz6poVZqhdcQk
 PVnx/upBwufttX3Yr1GXVzCwgk9xcUtn6uf4ZWgZF+xT+Xblp5mxf/qhVbi+KubKbl1C
 5nfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778977804; x=1779582604;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=FjP/qEuf/tycrqFw+mSyrMAF+WG+DYMnwHYOmyGsbr4=;
 b=ros6zQEQpxsmVmZnifAaLOKlyC0QQHJTHmNkmexWT9vd5Od3TlzHw0MUejekr3Uo82
 ghqksbFioHZwscac4Edrt83KWsOsGY5YAc70gi6S81Ey4l+nQRqmgvGT0PzwMsWwwoip
 cFKdaN0arZE6d53pKzz4Yp7xKF9Y0XMNfHctklRZTS/tDVpwx9N4+Eb0TP3GSV5DeShU
 /jidFSaTjwmRZpIC7UFEVSjmyW9zQcRyl1kDQtM08IIOyoW7VJgnCTZKwTagatmmKiJN
 UuXfJjDku1TtoKbjSvR6DIp1rgBP892smnLTv76SEY5fSB/dvJy5L7j0hB19OlqvTMDi
 ncFQ==
X-Gm-Message-State: AOJu0YzFxhVyt4fBty/smKsCtizZm7Xy9HCETdXknF7fTw+dpCQqq37X
 sGzHqu65fA2Sq5Y6PStBqZH49tujlbLvwW8SPPkxzMSAT7YBobr02PeB4CQiXg2d4U5SZk8aChI
 AtAeO
X-Gm-Gg: Acq92OGJgLUfK076o6DNYacPNTgNoMjTHchGnOjLdELREBXAwHJooih8fCpsO3BKoXm
 D+AtYZuKdPP8/WQERy+SSBYwvrAqrtTM56DEjqe2jnj/u+y1og62o2XSQxewtZGfHO33BicsfCN
 arCpUbJRtRsEXUVOGa9D9OAGG7A66mSoYdnkGgFIbbYuUNirh5DutTacego+cxtmvnYRT4pCHVq
 fTeL+eISAbSyihgHXvl98ND1/ke9yUbExbLi9V00j3zxxdJYLLQdonLgPJEphWQ3mtUGr18+Lu2
 mpqv9dR2dA1JF+2EkQ9UAKJwvKIS3xaUNcIZ/k8dqRWujO1QMU9Ey8APdO2/GVDenAupxiEQ7Tu
 VCsMe+vDhQef0NbHDorEaEckzAV0Eriq+lvXNont+hgBxhq3/ZspuAqjows81WZ+GXvrxCqxf1n
 HLwiM0LdgALbCQQ4Ta3DBHfq8nEhd9
X-Received: by 2002:a05:6a00:ac3:b0:82c:9e00:f958 with SMTP id
 d2e1a72fcca58-83f33a1c9fdmr10663267b3a.0.1778977803925; 
 Sat, 16 May 2026 17:30:03 -0700 (PDT)
Received: from stoup.. ([71.212.142.33]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-83f19663cfdsm12272745b3a.9.2026.05.16.17.30.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 May 2026 17:30:03 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v5 01/63] target/arm: Implement ID_AA64ISAR3
Date: Sat, 16 May 2026 17:29:00 -0700
Message-ID: <20260517003002.321430-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260517003002.321430-1-richard.henderson@linaro.org>
References: <20260517003002.321430-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
index 4e44245a8b..50776347a5 100644
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
index 8240f1b384..6ad01b345f 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -6519,11 +6519,11 @@ void register_cp_regs_for_features(ARMCPU *cpu)
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
@@ -6752,6 +6752,10 @@ void register_cp_regs_for_features(ARMCPU *cpu)
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


