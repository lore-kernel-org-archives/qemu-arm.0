Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F9F9CA0FED
	for <qemu-arm@archiver.kernel.org>; Wed, 27 Aug 2025 01:22:10 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ur4iL-00026R-7N; Tue, 26 Aug 2025 21:12:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ur4hO-00010P-3t
 for qemu-arm@nongnu.org; Tue, 26 Aug 2025 21:11:39 -0400
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ur4hC-0008WM-E2
 for qemu-arm@nongnu.org; Tue, 26 Aug 2025 21:11:37 -0400
Received: by mail-pf1-x430.google.com with SMTP id
 d2e1a72fcca58-76e2eb6d07bso5421491b3a.3
 for <qemu-arm@nongnu.org>; Tue, 26 Aug 2025 18:11:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1756257076; x=1756861876; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bvkLUgOXDyITyIWALCtPrGDx3CpfTtamo0IC8ggrCtE=;
 b=mG0zdXGijC6lweNq8AitLOetl12l5XFpcfGZRIxU1VQbxSMSNzO1B9ZgI7wp91++XQ
 2QMbt1sOHWj3WyarOIiqWU/NehkkJegfsf3Sw5bRt7tmhSgnn6mUoODuTEdOjYQF6slJ
 e3gN9aQMG43sFtDxS5dKJ03wxZp2jHedBaFypSsEcRmqPnOko/1he78d9/lAtNqP1D59
 WEZqgvpC6hBsvjDZaEkL3PEEaU00lQkkf6Z95QtqLUef/tvHN7rhzTvuLd7iGPG6gecT
 FtYGm0tRLs5pgXQFaMtUdW4D5hiQucQuE2EmKxYo7TuT7l9JvfxadzdfZvAgid1R6uoZ
 drWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756257076; x=1756861876;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bvkLUgOXDyITyIWALCtPrGDx3CpfTtamo0IC8ggrCtE=;
 b=OMYTUuPMeQAfDuyEE02rOUjya++J0AjdydHecU5eFAdDaqcfUrurdmhiCNtnpm0VOq
 yViypGeH2EYVLvExgXuVBw1FFF/V20YwwKi8Meo0N6k4SFhZVtSHTX2C+rhHQCOCHoNU
 FMSSJR2/eBxjYZsLAeKvXWJPrycgTZmeUVUBHPEgk5vaTju2Sd7Q2hbFKginH8Q5Zppk
 R1hxjvLhLN4S1im+6drFFkgkslQ3nUMQw8/rINZ83UUZOC9xL1/zyJ8DCehspOFCTlZA
 0H1TxxRdNMAQc6U8k30LsztXQjjB5U0RC4wVYYbI3Xc2FMTFNBAm/AkAv+2yX+KjQDWd
 WAfg==
X-Gm-Message-State: AOJu0YzZZ/HKiTmEvpnz3wE74RHhMy7aez5xH0xL37a9w9HII+KR53pl
 RJTRMOwOi3fm0y2/xtsdqsSbzkwpEo/yOZfwqJ6Zy7yZhtwGe5Po2cbhddDm3gOyoJU=
X-Gm-Gg: ASbGncvvHMZPoaD0urfmoppqujW/DRZOcnth9MjDJcu9cHWpcqtNXcqt+d92ldhbjCl
 FQ/tP3dDbffri7aOMPKSzfmrFOjkaHy1bCK3aqtKoV6DeGpEPeYqCIIYFOBLpakSllwayZZ1Uuc
 jBKFfJsXBdZ6vwmHRp3SihCYO5R1zZnqx9YoLsxjsAyPJtvHSpxweW3aJwrrvGlOfeOTpwCFfPJ
 NI4exu+V8LIh5H4MEq/vqJhOsofRBN0TeP8HSKttjJ7edYPLEHnLxdWLZ1qGakARXayZ4PWivLQ
 08BX+52oQQJL/fHcZgrj5AOpYRNHyY3YwJnJiCQ42ikML161LtXOwJ6gLhNBA1HxPMJXZBDCG30
 I4wjAAN0rsJYSJW8AyRDtoOOvatXVI5JcJ7EY
X-Google-Smtp-Source: AGHT+IGMz60NxSTH48MqbFRf76AyXdjwo5Pk1JgT/pecnfGmTkfnhyYLn8f+AkF7m8VWP25li2ovaQ==
X-Received: by 2002:a05:6a20:12c7:b0:220:33e9:15da with SMTP id
 adf61e73a8af0-24340bce54amr27943395637.2.1756257076100; 
 Tue, 26 Aug 2025 18:11:16 -0700 (PDT)
Received: from stoup.. ([144.6.121.55]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-771f2b2d2bfsm4348408b3a.93.2025.08.26.18.11.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Aug 2025 18:11:15 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 41/61] target/arm: Split add_cpreg_to_hashtable_aa64
Date: Wed, 27 Aug 2025 11:04:32 +1000
Message-ID: <20250827010453.4059782-46-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250827010453.4059782-1-richard.henderson@linaro.org>
References: <20250827010453.4059782-1-richard.henderson@linaro.org>
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

Rename the existing add_cpreg_to_hashtable_aa64 as *_1.
Introduce a new add_cpreg_to_hashtable_aa64 that handles
128-bit and 64-bit views of an AArch64 system register.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 63 ++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 59 insertions(+), 4 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 3b765408f2..18af67742d 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -7217,11 +7217,9 @@ static void add_cpreg_to_hashtable_aa32(ARMCPU *cpu, ARMCPRegInfo *r)
     }
 }
 
-static void add_cpreg_to_hashtable_aa64(ARMCPU *cpu, ARMCPRegInfo *r)
+static void add_cpreg_to_hashtable_aa64_1(ARMCPU *cpu, ARMCPRegInfo *r,
+                                          uint32_t key)
 {
-    uint32_t key = ENCODE_AA64_CP_REG(r->opc0, r->opc1,
-                                      r->crn, r->crm, r->opc2);
-
     if ((r->type & ARM_CP_ADD_TLBI_NXS) &&
         cpu_isar_feature(aa64_xs, cpu)) {
         /*
@@ -7288,6 +7286,10 @@ static void add_cpreg_to_hashtable_aa64(ARMCPU *cpu, ARMCPRegInfo *r)
         r2->writefn = NULL;
         r2->raw_readfn = NULL;
         r2->raw_writefn = NULL;
+        r2->read128fn = NULL;
+        r2->write128fn = NULL;
+        r2->raw_read128fn = NULL;
+        r2->raw_write128fn = NULL;
         r2->accessfn = NULL;
         r2->fieldoffset = 0;
 
@@ -7309,6 +7311,59 @@ static void add_cpreg_to_hashtable_aa64(ARMCPU *cpu, ARMCPRegInfo *r)
                            ARM_CP_SECSTATE_NS, key);
 }
 
+static void add_cpreg_to_hashtable_aa64(ARMCPU *cpu, ARMCPRegInfo *r)
+{
+    uint32_t key64 = ENCODE_AA64_CP_REG(r->opc0, r->opc1,
+                                        r->crn, r->crm, r->opc2);
+
+    /*
+     * All 128-bit system registers and instructions have 64-bit aliases.
+     * If the 128-bit feature is enabled, create a duplicate.
+     */
+    if (r->type & ARM_CP_128BIT) {
+        if (cpu_isar_feature(aa64_sysreg128, cpu) ||
+            cpu_isar_feature(aa64_sysinstr128, cpu)) {
+            ARMCPRegInfo *r128 = alloc_cpreg(r, NULL);
+            uint32_t key128 = key64 | CP_REG_AA64_128BIT_MASK;
+
+            r128->accessfn = r128->access128fn;
+            r128->access128fn = NULL;
+            r128->readfn = NULL;
+            r128->writefn = NULL;
+            r128->raw_readfn = NULL;
+            r128->raw_writefn = NULL;
+
+            if (r128->vhe_redir_to_el2) {
+                r128->vhe_redir_to_el2 |= CP_REG_AA64_128BIT_MASK;
+            }
+            if (r128->vhe_redir_to_el01) {
+                r128->vhe_redir_to_el01 |= CP_REG_AA64_128BIT_MASK;
+            }
+
+            add_cpreg_to_hashtable_aa64_1(cpu, r128, key128);
+
+            /*
+             * The 128-bit definition is the canonical view.
+             * The 64-bit definition is an alias, hidden from gdb.
+             */
+            r->type |= ARM_CP_ALIAS | ARM_CP_NO_GDB;
+        }
+
+        /* Squash the original to create the 64-bit view. */
+        r->type &= ~ARM_CP_128BIT;
+        r->access128fn = NULL;
+        r->read128fn = NULL;
+        r->write128fn = NULL;
+        r->raw_read128fn = NULL;
+        r->raw_write128fn = NULL;
+        if (HOST_BIG_ENDIAN && r->fieldoffset) {
+            r->fieldoffset += sizeof(uint64_t);
+        }
+    }
+
+    add_cpreg_to_hashtable_aa64_1(cpu, r, key64);
+}
+
 void define_one_arm_cp_reg(ARMCPU *cpu, const ARMCPRegInfo *r)
 {
     /*
-- 
2.43.0


