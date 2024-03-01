Received: by 2002:a17:906:489:b0:a44:3ba0:e9d1 with SMTP id f9csp1245221eja;
        Fri, 1 Mar 2024 10:32:48 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVDwU/BKIwTKzdV9ozvsly0vEbALaxEP4A8eF0qt9sGYg0KLQHGus57RvYhH+PpHKmgzqfTbuMxm5ygpBgkAkXS/jO5L/lq
X-Google-Smtp-Source: AGHT+IHv6Clbuc1ExsIT2NrDM/QuZWij1ScAmUrKUq8as001O0JWdVv2GzdtR2LsrdVZxUClZKlL
X-Received: by 2002:a05:620a:4081:b0:787:f8bb:9684 with SMTP id f1-20020a05620a408100b00787f8bb9684mr8164773qko.15.1709317968078;
        Fri, 01 Mar 2024 10:32:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709317968; cv=none;
        d=google.com; s=arc-20160816;
        b=zQ2lyebpwNpqsFS08msGiEGhaaG+QjiFOlBbpxAoxcQh6u/3kPtPnPpZafyDum/D/n
         lUlOBobrIgYJQF2Az18WXWl+curVsLN+KozaByU+GU96FvIJsWtawjcZkTjdOcCRbMlL
         2K4kxJbYcivekZn2OgKEWKwyfgk3h5ZNlPrJXy47TF9xH8W8aUWZVTE96onG6G4pLTPn
         hK7YhmGHxSzNJ/01Sa7oVAMWy02OJdEdazq+u5Y/NwfD6c2eAdsp26w59kXRF/ASw+cE
         tYoKH8c8Jh2BD0dJzcefBSGoXPMXOt4GMtjvSlJpawuKjB0QQqw1PWFwBvjPSj//YSdm
         SZ6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=8Rb0Z7zjLpv30F7lDtK7tZWHoJA0TmXTubgs4mA4pQs=;
        fh=x4yV6W++5EDM2T8pvDWfrYghCgb7XqbEnMjseNXnlds=;
        b=1FR2zQEvV0GM6T7iJwail6i0XrFoHaUK+pwnzsJyqHCq+C+vSis3cnizDq9XHB0Xtd
         oeVje6KltxVXMSx9nVGjHHGSAxEzZug/89sm2FvJjfQGtE9EThBBF3HpKIk8mcotwW14
         780ZJnXBFMFz53ij1V2Pf1X7RMVtoPjGVviaLDFZLnqPpwC61STv0BJRI8kE0d9bESfv
         XGf4S9I7ca51A5Hd9+Cfnvx/nnHDCvNmbpYJX3/DNipWEh78ap5tq9LwIl5gIwwP1gop
         gC4n8RilcDUzSRtL+fBzc4a3lCeQ8d/MuifS4rEiH4WLeZAPT9yE8xY13lsg2BUwRVro
         ohhA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MDWAURfx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j21-20020a05620a411500b00787cd10ac19si4410514qko.278.2024.03.01.10.32.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 01 Mar 2024 10:32:48 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MDWAURfx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rg7gS-0006T9-Uh; Fri, 01 Mar 2024 13:32:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rg7gM-0006Pl-10
 for qemu-arm@nongnu.org; Fri, 01 Mar 2024 13:32:31 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rg7gJ-0008L8-Gz
 for qemu-arm@nongnu.org; Fri, 01 Mar 2024 13:32:29 -0500
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-33dcd8dec88so1407436f8f.1
 for <qemu-arm@nongnu.org>; Fri, 01 Mar 2024 10:32:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1709317944; x=1709922744; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8Rb0Z7zjLpv30F7lDtK7tZWHoJA0TmXTubgs4mA4pQs=;
 b=MDWAURfxkz8z3ktjdnS8WzraE7ZAIszwTYbmzISy8n8MOddPCu7nm5jeHXR1JZvHsW
 3n42knSqliKeV4F77qRWUW9orQzMcS2Eag1rDOrf3xkr+EzJNIiSij8EB1NGqG8WxHTC
 Dx8ZG3xANL1VoKHujV+fl8ZIT9z5Fg8hQhZd8d7oSHyp9avHsIc8jDaVJTOp5WzlESs9
 PCfJSwod2PQo5NocnA60FWhWFTbFXKQgMMzukmK4q3afIGpjH5GAB4bCzmPL4Td/esXm
 n1sTQTexbXwJLKQdc5TTEOK8PoeDV7Trtt+lNgSl+dC+vDM9av6xbUCF7WmtiQVYRVMd
 RRUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709317944; x=1709922744;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8Rb0Z7zjLpv30F7lDtK7tZWHoJA0TmXTubgs4mA4pQs=;
 b=fdYrbMh9xf4F3joJqMUWR8A7gcehPVgkONhNCV61pDQrjlv+XRPBK5nZ+A9nVgabye
 BoP+AojaVNlK+eUCUHdlHIi2Z0ksqkuMmcOBWNbjMFsCwG1yH6qVQY9TOMuE1MzWpxIf
 MtUW1bUXgr7P1kppYnWvQUAYolsKTVFN4mcd2JLuFqVsejTn7ecjgOCfij10Bwr5D7oG
 HgONVyckjoAyzQF0AjbPxIr/hcwVmBQoAAOVSV/7Am3+1h6a9d8FTKc54dC1mWwZzD5z
 jf338VXn7VEDrPGPFkcDmqujbDjdn5fZKTS8ws8wcKIHO6tO6BEJYBnw1P2VG+KGcNLr
 8w+Q==
X-Gm-Message-State: AOJu0YwrL77fSU6KGv1oZY4epHaNKijovE5dJoaROyrwIpS6V7vSk3eu
 VUpgc2Pgea4R8rswD3/ulRrZHlV5DkcGOmqQxf3opAGpX+Ouj7RJRF3CbuK/D1XJ07C1D2vLO0S
 A
X-Received: by 2002:adf:9ccd:0:b0:33e:1f94:c493 with SMTP id
 h13-20020adf9ccd000000b0033e1f94c493mr2214804wre.65.1709317943986; 
 Fri, 01 Mar 2024 10:32:23 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 u2-20020adfeb42000000b0033b483d1abcsm5158934wrn.53.2024.03.01.10.32.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Mar 2024 10:32:23 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: [PATCH 6/8] target/arm: Define CNTPCTSS_EL0 and CNTVCTSS_EL0
Date: Fri,  1 Mar 2024 18:32:17 +0000
Message-Id: <20240301183219.2424889-7-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240301183219.2424889-1-peter.maydell@linaro.org>
References: <20240301183219.2424889-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: wAdmkIRdjg5l

For FEAT_ECV, new registers CNTPCTSS_EL0 and CNTVCTSS_EL0 are
defined, which are "self-synchronized" views of the physical and
virtual counts as seen in the CNTPCT_EL0 and CNTVCT_EL0 registers
(meaning that no barriers are needed around accesses to them to
ensure that reads of them do not occur speculatively and out-of-order
with other instructions).

For QEMU, all our system registers are self-synchronized, so we can
simply copy the existing implementation of CNTPCT_EL0 and CNTVCT_EL0
to the new register encodings.

This means we now implement all the functionality required for
ID_AA64MMFR0_EL1.ECV == 0b0001.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c | 43 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 6c528903a9a..3441b14ba39 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -3389,6 +3389,34 @@ static const ARMCPRegInfo generic_timer_cp_reginfo[] = {
     },
 };
 
+/*
+ * FEAT_ECV adds extra views of CNTVCT_EL0 and CNTPCT_EL0 which
+ * are "self-synchronizing". For QEMU all sysregs are self-synchronizing,
+ * so our implementations here are identical to the normal registers.
+ */
+static const ARMCPRegInfo gen_timer_ecv_cp_reginfo[] = {
+    { .name = "CNTVCTSS", .cp = 15, .crm = 14, .opc1 = 9,
+      .access = PL0_R, .type = ARM_CP_64BIT | ARM_CP_NO_RAW | ARM_CP_IO,
+      .accessfn = gt_vct_access,
+      .readfn = gt_virt_cnt_read, .resetfn = arm_cp_reset_ignore,
+    },
+    { .name = "CNTVCTSS_EL0", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 3, .crn = 14, .crm = 0, .opc2 = 6,
+      .access = PL0_R, .type = ARM_CP_NO_RAW | ARM_CP_IO,
+      .accessfn = gt_vct_access, .readfn = gt_virt_cnt_read,
+    },
+    { .name = "CNTPCTSS", .cp = 15, .crm = 14, .opc1 = 8,
+      .access = PL0_R, .type = ARM_CP_64BIT | ARM_CP_NO_RAW | ARM_CP_IO,
+      .accessfn = gt_pct_access,
+      .readfn = gt_cnt_read, .resetfn = arm_cp_reset_ignore,
+    },
+    { .name = "CNTPCTSS_EL0", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 3, .crn = 14, .crm = 0, .opc2 = 5,
+      .access = PL0_R, .type = ARM_CP_NO_RAW | ARM_CP_IO,
+      .accessfn = gt_pct_access, .readfn = gt_cnt_read,
+    },
+};
+
 #else
 
 /*
@@ -3422,6 +3450,18 @@ static const ARMCPRegInfo generic_timer_cp_reginfo[] = {
     },
 };
 
+/*
+ * CNTVCTSS_EL0 has the same trap conditions as CNTVCT_EL0, so it also
+ * is exposed to userspace by Linux.
+ */
+static const ARMCPRegInfo gen_timer_ecv_cp_reginfo[] = {
+    { .name = "CNTVCTSS_EL0", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 3, .crn = 14, .crm = 0, .opc2 = 6,
+      .access = PL0_R, .type = ARM_CP_NO_RAW | ARM_CP_IO,
+      .readfn = gt_virt_cnt_read,
+    },
+};
+
 #endif
 
 static void par_write(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t value)
@@ -9258,6 +9298,9 @@ void register_cp_regs_for_features(ARMCPU *cpu)
     if (arm_feature(env, ARM_FEATURE_GENERIC_TIMER)) {
         define_arm_cp_regs(cpu, generic_timer_cp_reginfo);
     }
+    if (cpu_isar_feature(aa64_ecv_traps, cpu)) {
+        define_arm_cp_regs(cpu, gen_timer_ecv_cp_reginfo);
+    }
     if (arm_feature(env, ARM_FEATURE_VAPA)) {
         ARMCPRegInfo vapa_cp_reginfo[] = {
             { .name = "PAR", .cp = 15, .crn = 7, .crm = 4, .opc1 = 0, .opc2 = 0,
-- 
2.34.1

