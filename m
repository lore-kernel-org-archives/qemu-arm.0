Received: by 2002:a17:906:755:b0:a37:6271:4f3c with SMTP id z21csp1789975ejb;
        Tue, 6 Feb 2024 05:30:07 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEl2loBZfoTO1rrhJBnv6cYDX6b11KHMW3W86swS81eUWex/Rtn2oIiEyAPE7vOcfI87k6A
X-Received: by 2002:ae9:f714:0:b0:785:8aa8:f3ba with SMTP id s20-20020ae9f714000000b007858aa8f3bamr2391150qkg.54.1707226207118;
        Tue, 06 Feb 2024 05:30:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1707226207; cv=none;
        d=google.com; s=arc-20160816;
        b=CQ7+nlDM52HcYEJ5o3cjuylRsb93U1Ab8iDkcye7ZiP2oYu0mnomUpr/V33Abu775M
         rhP99pVyAnKem9CsMSSl+QFyin0l0059MCfUAx7XZwOyAbFPZlg1/GExTljPj1WOIJDz
         LJue1Z5cgA7LD9teb9KBxZkoS7eWIjz6f3VTABIa3LaZUb3JpvDOkxMxLYew6mgAnMXf
         06t2Ru2+s1EjdbDe+zGWeJ7lm9iqaLkmxgbbPIg2Mv+NB3b0HCVjwpTYtQJ/s+NpEel5
         fk/sfImE6332T+c61DHfn2/yMeBvBq2zfRdIKgzegne6SIRAaFPKo0udfkqqJAE4+C8F
         9jsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=h7YaNX76JwqZEJT0rHKxb3cowkocOAyFr6+DgbOiGaE=;
        fh=aK9ASWy5P3JKJUkRXVqinMYEx5pZa/wYMdoJmUqqyWQ=;
        b=Wb4Wx1949DtU9lm9zEGMhd3Eih1k93ZzQ1q36YXIEji6S+5qLpqHWyPq7v7mFer6Or
         5L3tYoaOS+33p78k+U0Ejh9PsDGBjG+OK82uRK3k/wD6/5RTqLJlXEJK/5ZvJJ2C3+PS
         xJjiVs87JtgZ4AYNfbTUC5XsH5BL7xiTokCSu1Uagnbmc54bMm1Z8DeUSzm5EKBDtij0
         Jx3URKs0vqOLOPitnFeLSRZuU30kK84rE8rkKchWGXDZJCPSe6UGm5XK52MUOxV7bEKJ
         +2pCldg//8/bg3jF5mQj59MPOeDxh8CEBpkdtxENN0/Br2+C8UkkOvcDooZfo2e4ZU0q
         vpOw==;
        darn=linaro.org
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VRAiac+Q;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
X-Forwarded-Encrypted: i=0; AJvYcCWpfn3fe9beLJZBYsPk1UyI9Dkz1U8OtZMCNoAVzVwlf1QBQA2zilqiy0RLbmXy6k4HiljaO/SPZN0rCrt3cnkPTKw8eomg
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b27-20020a05620a089b00b007858f88d38dsi1301172qka.302.2024.02.06.05.30.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 06 Feb 2024 05:30:07 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VRAiac+Q;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rXLW9-0000Re-GN; Tue, 06 Feb 2024 08:29:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rXLW7-0000PA-PU
 for qemu-arm@nongnu.org; Tue, 06 Feb 2024 08:29:39 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rXLW4-0008Dj-Eg
 for qemu-arm@nongnu.org; Tue, 06 Feb 2024 08:29:39 -0500
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-33b1d7f736bso3193988f8f.3
 for <qemu-arm@nongnu.org>; Tue, 06 Feb 2024 05:29:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1707226174; x=1707830974; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=h7YaNX76JwqZEJT0rHKxb3cowkocOAyFr6+DgbOiGaE=;
 b=VRAiac+QPyabZ6xxWZZoUs3NPPwiZkIzarYqWlx6s4yOMojHN+Eu29em/60mmub/DJ
 zn2j2SM4E9LbLy189ysGlihKb4afCpgV1tsx/lcuy09Bc9GnSKdwfrFikBE6vZjPAZPx
 +rTGs9mwFYzKjHQhVHicnbh3dWfNEwLETlfLW4/mxtDYFsuOpH1qu9KJMgESyMmglKuB
 otaYcUpSawbJq2180wHTgqJORsIol9rzUUUfM7uVT4pVhf2Sq5MdRtd7Oe4CpKG8PxEr
 C62nKQP0fv/9SUmMVQbDrPcEypQiTPGVaS1CxC7uX3ShBQwiqgP1RuqxauLyj7yqx3Vy
 or/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707226174; x=1707830974;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=h7YaNX76JwqZEJT0rHKxb3cowkocOAyFr6+DgbOiGaE=;
 b=BkcRhhKoSW0pEuX5OuB1ulwLDZ1/R9k5tn+hNgj+4WvQmJEvrfx0yOXE+oJgIOKafn
 walKG42NqVSe1Bup4++NkP54WFgOG0r4luYoUs84ApBADE4f+4F2jeK+5leOo0bciEQG
 zLPPsrJxq82hb/VlGFljn6bGFTEfC7rrMtdC0Lg1mmeMjvwSm6wx2IQp7jT/Ggm5oZpP
 kmPNMwHi3p8pjrU9BeIIEsCmoFKXollKGgpx6xYO2zl9HzlATGGA0plXT92NCSjlDH+S
 qrZQ6FhqAdVKsr40HvSvAkXNjsJOTuAFU8k0Dr6qWdEJNIzWjmbx1U48BHGhCBhKK5um
 DAtA==
X-Gm-Message-State: AOJu0YzPOeh56uMF6l1XHyGnydiBjccuPiEMW26MZmDlxZ/KWl5v9wEh
 SNso0XIR5gaXxv4fiKyo+KRVVdktPjxyaPHCZsc9QHb0HBuE2T4JV1jWNhZvS4HbzhA6sxN6jl+
 i
X-Received: by 2002:a5d:6682:0:b0:33a:eec4:c0c6 with SMTP id
 l2-20020a5d6682000000b0033aeec4c0c6mr1251743wru.12.1707226173986; 
 Tue, 06 Feb 2024 05:29:33 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCU1s9rGIXOur/AiDMftwLUWKqfXHFK+gVeCGoeqCaVAy60DXB5ga24x9kX2ATYiBBTeQQ1hZeEMH/J+dtY5P+cDS7KIdCU=
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 y7-20020a056000108700b0033b470a137esm1492932wrw.79.2024.02.06.05.29.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Feb 2024 05:29:33 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 03/13] target/arm: Add Cortex-R52 IMPDEF sysregs
Date: Tue,  6 Feb 2024 13:29:21 +0000
Message-Id: <20240206132931.38376-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240206132931.38376-1-peter.maydell@linaro.org>
References: <20240206132931.38376-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x434.google.com
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
X-TUID: bLiDwE5UERqQ

Add the Cortex-R52 IMPDEF sysregs, by defining them here and
also by enabling the AUXCR feature which defines the ACTLR
and HACTLR registers. As is our usual practice, we make these
simple reads-as-zero stubs for now.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/tcg/cpu32.c | 108 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 108 insertions(+)

diff --git a/target/arm/tcg/cpu32.c b/target/arm/tcg/cpu32.c
index 311d654cdce..6eb08a41b01 100644
--- a/target/arm/tcg/cpu32.c
+++ b/target/arm/tcg/cpu32.c
@@ -800,6 +800,111 @@ static void cortex_r5_initfn(Object *obj)
     define_arm_cp_regs(cpu, cortexr5_cp_reginfo);
 }
 
+static const ARMCPRegInfo cortex_r52_cp_reginfo[] = {
+    { .name = "CPUACTLR", .cp = 15, .opc1 = 0, .crm = 15,
+      .access = PL1_RW, .type = ARM_CP_CONST | ARM_CP_64BIT, .resetvalue = 0 },
+    { .name = "IMP_ATCMREGIONR",
+      .cp = 15, .opc1 = 0, .crn = 9, .crm = 1, .opc2 = 0,
+      .access = PL1_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
+    { .name = "IMP_BTCMREGIONR",
+      .cp = 15, .opc1 = 0, .crn = 9, .crm = 1, .opc2 = 1,
+      .access = PL1_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
+    { .name = "IMP_CTCMREGIONR",
+      .cp = 15, .opc1 = 0, .crn = 9, .crm = 1, .opc2 = 2,
+      .access = PL1_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
+    { .name = "IMP_CSCTLR",
+      .cp = 15, .opc1 = 1, .crn = 9, .crm = 1, .opc2 = 0,
+      .access = PL1_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
+    { .name = "IMP_BPCTLR",
+      .cp = 15, .opc1 = 1, .crn = 9, .crm = 1, .opc2 = 1,
+      .access = PL1_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
+    { .name = "IMP_MEMPROTCLR",
+      .cp = 15, .opc1 = 1, .crn = 9, .crm = 1, .opc2 = 2,
+      .access = PL1_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
+    { .name = "IMP_SLAVEPCTLR",
+      .cp = 15, .opc1 = 0, .crn = 11, .crm = 0, .opc2 = 0,
+      .access = PL1_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
+    { .name = "IMP_PERIPHREGIONR",
+      .cp = 15, .opc1 = 0, .crn = 15, .crm = 0, .opc2 = 0,
+      .access = PL1_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
+    { .name = "IMP_FLASHIFREGIONR",
+      .cp = 15, .opc1 = 0, .crn = 15, .crm = 0, .opc2 = 1,
+      .access = PL1_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
+    { .name = "IMP_BUILDOPTR",
+      .cp = 15, .opc1 = 0, .crn = 15, .crm = 2, .opc2 = 0,
+      .access = PL1_R, .type = ARM_CP_CONST, .resetvalue = 0 },
+    { .name = "IMP_PINOPTR",
+      .cp = 15, .opc1 = 0, .crn = 15, .crm = 2, .opc2 = 7,
+      .access = PL1_R, .type = ARM_CP_CONST, .resetvalue = 0 },
+    { .name = "IMP_QOSR",
+      .cp = 15, .opc1 = 1, .crn = 15, .crm = 3, .opc2 = 1,
+      .access = PL1_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
+    { .name = "IMP_BUSTIMEOUTR",
+      .cp = 15, .opc1 = 1, .crn = 15, .crm = 3, .opc2 = 2,
+      .access = PL1_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
+    { .name = "IMP_INTMONR",
+      .cp = 15, .opc1 = 1, .crn = 15, .crm = 3, .opc2 = 4,
+      .access = PL1_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
+    { .name = "IMP_ICERR0",
+      .cp = 15, .opc1 = 2, .crn = 15, .crm = 0, .opc2 = 0,
+      .access = PL1_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
+    { .name = "IMP_ICERR1",
+      .cp = 15, .opc1 = 2, .crn = 15, .crm = 0, .opc2 = 1,
+      .access = PL1_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
+    { .name = "IMP_DCERR0",
+      .cp = 15, .opc1 = 2, .crn = 15, .crm = 1, .opc2 = 0,
+      .access = PL1_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
+    { .name = "IMP_DCERR1",
+      .cp = 15, .opc1 = 2, .crn = 15, .crm = 1, .opc2 = 1,
+      .access = PL1_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
+    { .name = "IMP_TCMERR0",
+      .cp = 15, .opc1 = 2, .crn = 15, .crm = 2, .opc2 = 0,
+      .access = PL1_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
+    { .name = "IMP_TCMERR1",
+      .cp = 15, .opc1 = 2, .crn = 15, .crm = 2, .opc2 = 1,
+      .access = PL1_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
+    { .name = "IMP_TCMSYNDR0",
+      .cp = 15, .opc1 = 2, .crn = 15, .crm = 2, .opc2 = 2,
+      .access = PL1_R, .type = ARM_CP_CONST, .resetvalue = 0 },
+    { .name = "IMP_TCMSYNDR1",
+      .cp = 15, .opc1 = 2, .crn = 15, .crm = 2, .opc2 = 3,
+      .access = PL1_R, .type = ARM_CP_CONST, .resetvalue = 0 },
+    { .name = "IMP_FLASHERR0",
+      .cp = 15, .opc1 = 2, .crn = 15, .crm = 3, .opc2 = 0,
+      .access = PL1_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
+    { .name = "IMP_FLASHERR1",
+      .cp = 15, .opc1 = 2, .crn = 15, .crm = 3, .opc2 = 1,
+      .access = PL1_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
+    { .name = "IMP_CDBGDR0",
+      .cp = 15, .opc1 = 3, .crn = 15, .crm = 0, .opc2 = 0,
+      .access = PL1_R, .type = ARM_CP_CONST, .resetvalue = 0 },
+    { .name = "IMP_CBDGBR1",
+      .cp = 15, .opc1 = 3, .crn = 15, .crm = 0, .opc2 = 1,
+      .access = PL1_R, .type = ARM_CP_CONST, .resetvalue = 0 },
+    { .name = "IMP_TESTR0",
+      .cp = 15, .opc1 = 4, .crn = 15, .crm = 0, .opc2 = 0,
+      .access = PL1_R, .type = ARM_CP_CONST, .resetvalue = 0 },
+    { .name = "IMP_TESTR1",
+      .cp = 15, .opc1 = 4, .crn = 15, .crm = 0, .opc2 = 1,
+      .access = PL1_W, .type = ARM_CP_NOP, .resetvalue = 0 },
+    { .name = "IMP_CDBGDCI",
+      .cp = 15, .opc1 = 0, .crn = 15, .crm = 15, .opc2 = 0,
+      .access = PL1_W, .type = ARM_CP_NOP, .resetvalue = 0 },
+    { .name = "IMP_CDBGDCT",
+      .cp = 15, .opc1 = 3, .crn = 15, .crm = 2, .opc2 = 0,
+      .access = PL1_W, .type = ARM_CP_NOP, .resetvalue = 0 },
+    { .name = "IMP_CDBGICT",
+      .cp = 15, .opc1 = 3, .crn = 15, .crm = 2, .opc2 = 1,
+      .access = PL1_W, .type = ARM_CP_NOP, .resetvalue = 0 },
+    { .name = "IMP_CDBGDCD",
+      .cp = 15, .opc1 = 3, .crn = 15, .crm = 4, .opc2 = 0,
+      .access = PL1_W, .type = ARM_CP_NOP, .resetvalue = 0 },
+    { .name = "IMP_CDBGICD",
+      .cp = 15, .opc1 = 3, .crn = 15, .crm = 4, .opc2 = 1,
+      .access = PL1_W, .type = ARM_CP_NOP, .resetvalue = 0 },
+};
+
+
 static void cortex_r52_initfn(Object *obj)
 {
     ARMCPU *cpu = ARM_CPU(obj);
@@ -810,6 +915,7 @@ static void cortex_r52_initfn(Object *obj)
     set_feature(&cpu->env, ARM_FEATURE_NEON);
     set_feature(&cpu->env, ARM_FEATURE_GENERIC_TIMER);
     set_feature(&cpu->env, ARM_FEATURE_CBAR_RO);
+    set_feature(&cpu->env, ARM_FEATURE_AUXCR);
     cpu->midr = 0x411fd133; /* r1p3 */
     cpu->revidr = 0x00000000;
     cpu->reset_fpsid = 0x41034023;
@@ -840,6 +946,8 @@ static void cortex_r52_initfn(Object *obj)
 
     cpu->pmsav7_dregion = 16;
     cpu->pmsav8r_hdregion = 16;
+
+    define_arm_cp_regs(cpu, cortex_r52_cp_reginfo);
 }
 
 static void cortex_r5f_initfn(Object *obj)
-- 
2.34.1

