Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44E22D43362
	for <qemu-arm@archiver.kernel.org>; Thu, 11 Dec 2025 23:45:04 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vTqKt-0003Oo-P7; Thu, 11 Dec 2025 18:44:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1vTqKr-0003Ml-Pg
 for qemu-arm@nongnu.org; Thu, 11 Dec 2025 18:44:37 -0500
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1vTqKp-0003Wn-Tp
 for qemu-arm@nongnu.org; Thu, 11 Dec 2025 18:44:37 -0500
Received: by mail-pf1-x42d.google.com with SMTP id
 d2e1a72fcca58-7aab061e7cbso803096b3a.1
 for <qemu-arm@nongnu.org>; Thu, 11 Dec 2025 15:44:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1765496674; x=1766101474; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=n/kApJcFOEGmRRa1OLrQIEELHvqnoG2PtkXXaM683OI=;
 b=VDovCPwkfFJLoqMGtPnfgKo88xqACe+qbUU/Al2nKegO9mnjOcqNuMjXgoZxZBPxhd
 wBNJpA455OwFwIeZCFgw0ktX/1LFIJ9ubJ78kY8bCSHB/+dv0Rj2s5u72515dzhb2mO/
 xGFiJRwqhgAV0iguldObFvI5gZ8gK72Jyj9Icb0zOTexjuw6EtVxDLNGWjFVnB4cPlWX
 EGZT9mbv56GoplMNYPJFt5U5UZILKsTSq9cfd92ggTqrFyh0DgsGCKYHjp+4HzdYcQ2g
 O2PZyDQBv7VwicVzueaeMtSpV+Q62ycLvbVtwMI0r8FAN24wzTUpIRmsqLIHq4aPrATL
 7UyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765496674; x=1766101474;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=n/kApJcFOEGmRRa1OLrQIEELHvqnoG2PtkXXaM683OI=;
 b=dxdXAwUsuJDZb+nZvvPJ2+7owIDmu1U2nY9LROd8XKK9MOKGQQxPhoR3fywmhKIjZG
 fhiWYnLXu7zCUEixylCl0hhkKTA/7uMh/zh7jLvv8bDt91Ato/Vg0r7GvWTx6Z1Za8iA
 LxhZuc9c3/sU9vC5mL0QigbBxH2+a+EHFFGqUSCsZLtN9acnQ0GyH78Tf9JD9OPQ2rdD
 z1nFocX9bjZyEpz/QF8OjFpAEaeR1GiC8OpKnXGukMLwdF4KPDK2lUAgfXpFMEfTerOU
 WHnmS1m66cLWH1n30xMj/12lUt3H1kA08SJhpUf7aWNjFJKKNZZtJk7ej+5hQedqRTMq
 zOWw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVI9iiSy0Jh+Njb5D0frkLzDCaePHiSgyPALDVM2YJhIna/OZ+VgLquPJi5tclDv5RdXX80eIAXcQ==@nongnu.org
X-Gm-Message-State: AOJu0Yy4VlGg+j1P5OveYFqsTtSelidiY9fXgKXuuHfN75nTvDrIqLkd
 r+fMKwafv/2ScTJnwSk4T6Vp3UxAOF5KRmVZbEeHOIWVEy6PiYmgeGKZjslAQuNx6MU=
X-Gm-Gg: AY/fxX4vMHtCxmuUMsiTdXnzrrzB7UozIuObcYpP6w28nqwAujwg89cgJPfO45+XL5f
 e9wz5K02BV61tgi2KU1SH0eObkDj+H6MMQEXyOlmvDXeNlhSrVZYpIQ5t/1v+RTwS3SqWLAbLfF
 v/KeiuCClvq/ptkK9DvB7yCw7dkywGf4bE7ByAdtkw+Z1FnZi1FhpAWCW3Pj0IWF2pZLDtH/oGk
 LaGOp5QSW20aTxLvTXcCft5jxy6IZUY/EeRAx26tHOYToRTZybZOuSn21MgA1UR0zuLCQ/Jo0k9
 uyQeUVsqCJ83mbeCbWCQhtmK4V7jV0olD66LKf3INstHGRMHANZwCVP7mtaS2T0vvXGzqe8Rlkt
 IpbEa/qKvBG2xZV9A+7jj6YG3UqfYTh5fUZ4XkZF9pZ53cTzwOmX830hLbhsRv/3LMZjRoo/VNU
 FMbOWIx1GzaJUKaYXWf4gJAN7XAIVpcOvYl4/dMyatr8fDMDqUuVSR1I4ei7aeDjg=
X-Google-Smtp-Source: AGHT+IGpndTZ+y98hnvSU0KUXddeQJcFrDHYu001T78oBYlkCp01KrbUELyJt9ankzp6tdKGP//cWw==
X-Received: by 2002:a05:6a20:3d1c:b0:342:fa4f:5849 with SMTP id
 adf61e73a8af0-369afc018ecmr187326637.39.1765496674336; 
 Thu, 11 Dec 2025 15:44:34 -0800 (PST)
Received: from pc.taild8403c.ts.net (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c0c2599228dsm3370410a12.1.2025.12.11.15.44.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Dec 2025 15:44:33 -0800 (PST)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Eric Auger <eric.auger@redhat.com>, qemu-arm@nongnu.org,
 Tao Tang <tangtao1634@phytium.com.cn>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH 0/2] target/arm: make granule_protection_check usable from SMMU
Date: Thu, 11 Dec 2025 15:44:24 -0800
Message-ID: <20251211234426.2403792-1-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.3
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pf1-x42d.google.com
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

This series prepare granule_protection_check to be usable from SMMU, for
implementing RME feature.
It's based on Tao's commit [1] extracting ARMSecuritySpace from cpu.h header for
convenience.

[1] https://lore.kernel.org/qemu-devel/20251012150701.4127034-5-tangtao1634@phytium.com.cn/

To demonstrate the purpose, this is the (wip) change to use that from SMMU:

diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
index 80f48df3dda..1acff3bbd66 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -1055,12 +1056,36 @@ static SMMUTranslationStatus smmuv3_do_translate(SMMUv3State *s, hwaddr addr,
     }

     cached_entry = smmu_translate(bs, cfg, addr, flag, &ptw_info);
     if (desc_s2_translation) {
         cfg->asid = asid;
         cfg->stage = stage;
     }

+    if (cached_entry) {
+        hwaddr paddress = CACHED_ENTRY_TO_ADDR(cached_entry, addr);
+        ARMSecuritySpace pspace = sec_sid_to_security_space(cfg->sec_sid);
+        ARMSecuritySpace ss = ARMSS_Root;
+        ARMMMUFaultInfo fi;
+
+        ARMGranuleProtectionConfig gpc = {
+            .gpccr = s->root.gpt_base_cfg,
+            .gptbr = s->root.gpt_base >> 12,
+            .parange = 6, /* 52 bits */
+            .support_sel2 = false,
+            .as_secure = &s->smmu_state.as_secure_memory
+        };
+        /* The fields in SMMU_ROOT_GPT_BASE_CFG are the same as for GPCCR_EL3,
+         * except there is no copy of GPCCR_EL3.GPC. See SMMU_ROOT_CR0.GPCEN. */
+        const bool gpc_enabled = FIELD_EX32(s->root.cr0, ROOT_CR0, GPCEN);
+        gpc.gpccr = FIELD_DP64(gpc.gpccr, GPCCR, GPC, gpc_enabled);
+        bool gpc_check = arm_granule_protection_check(gpc, paddress,
+                                                      pspace, ss, &fi);
+        if (!gpc_check) {
+            printf("ERROR: fi.type=%d fi.gpcf=%d\n", fi.type, fi.gpcf);
+            g_assert_not_reached();
+        }
+    }
+
     if (!cached_entry) {
         /* All faults from PTW has S2 field. */
         event->u.f_walk_eabt.s2 = (ptw_info.stage == SMMU_STAGE_2);

Pierrick Bouvier (1):
  target/arm/ptw: make granule_protection_check usable without a cpu

Tao Tang (1):
  target/arm: Move ARMSecuritySpace to a common header

 include/hw/arm/arm-security.h | 54 +++++++++++++++++++++++++++++++++++
 target/arm/cpu.h              | 39 ++++++++++---------------
 target/arm/ptw.c              | 41 +++++++++++++++-----------
 3 files changed, 93 insertions(+), 41 deletions(-)
 create mode 100644 include/hw/arm/arm-security.h

-- 
2.47.3


