Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AED9CCD184
	for <qemu-arm@archiver.kernel.org>; Tue, 14 Oct 2025 20:15:42 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v8lJI-00027z-1o; Tue, 14 Oct 2025 16:07:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v8lJE-000266-S1
 for qemu-arm@nongnu.org; Tue, 14 Oct 2025 16:07:48 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v8lIv-0005KI-8w
 for qemu-arm@nongnu.org; Tue, 14 Oct 2025 16:07:48 -0400
Received: by mail-pl1-x636.google.com with SMTP id
 d9443c01a7336-279e2554c8fso59001845ad.2
 for <qemu-arm@nongnu.org>; Tue, 14 Oct 2025 13:07:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1760472443; x=1761077243; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nVLp2fMlNwwT84vDf2syQ7Ds5F9iDytds/Dwe6kgLt8=;
 b=BRsx4Z51DGoR5yBPilIF/AJZTSGUjXttk6NkCHrOKYjK/FSS69i4a/TTrpnPJG2yGI
 SPCQ0h0TE8XH+xXaZ8C2wBUAyA/MyJiIojG7nDdd+dmbZnOoci9V8ariCUjtQ1MuAlZk
 3BAHkxDvnrehLt20OGWPDHtnNIbpqTzR06eu2xZRqM073WPDpF4EsFGXKgdNwgTMhaKb
 1Tym61M1FD0V/9TbJntsUp3qgm7VDFWbAOWHSserilkvwq2fjs5W3iqDCaNlZ7VDUlgQ
 gBi/WJXr3uEW5dHt5noxtv9x/RnqYn0AOLCOQsCAtV/1/mfxuqR1Nvkzp207+eDKoDZ1
 s6yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760472443; x=1761077243;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nVLp2fMlNwwT84vDf2syQ7Ds5F9iDytds/Dwe6kgLt8=;
 b=ZcA9R4iA6XJjTRckZhaF3UchaqsfwvYLQknvb7QLPgBUQfj2fSlfJ2aWvWOd3ntwoE
 r7fCUrdC7UCMzoj4HMaKwO6f+vQdU8/VBJJCoCmXj3z2P6p+EvZ+3jCYQCAOXvcDMnSK
 G2zCDwcuafLpcEYujLQfF2jkgM/ygAQaxcr4l9yWFhEndih0F9ut71hL3BX8zG1ZdWhe
 47jIAV4lhzffCtePCNdZFEash1eb4ENb1/WgOqJtVDx8dclUsMqjtHXHGrlpWFaPQTcL
 paDizA4hBVyKMGU60N/f+kVxPKqAOeodcYkc2ewEBiikGYE8eURPoVaS0vMU4+QZ2Psd
 FGaQ==
X-Gm-Message-State: AOJu0YwoSAPC9utFVHKcs1C/SIu1//tbofR6nMQOEZ24ZshjLZNQv/vb
 Lv0ETuBhKNOk71MFNC2r964WgWGinwXu1gbB2Haac5lHgyuhb/MwhSLGKt+FvM8CuuE=
X-Gm-Gg: ASbGncvKlAB/99JKUhm2yek96l11AYDrqq7B7wF9kgsk6mpwNPupU7Zg87LxXglVUB7
 r90EPdF9TtXv9SdL20e8Ef0toh5dS817MgAqwQMyz+vFbiR/SjoCUHmx0ArypAGmIecTtrySOhL
 ahEKPZ6jXvZ3SAOL+t7lHbCW0dhjcVXBlv1qfwGwsQ2I1q6+tIUhnRtOTY7TkYx4NnCJFFLL5Do
 oCf3oHDTZRNEJQsOl4ymeD5j8qxUBI5uxMxhQS8qE53SQa/NtIy7Nh84pIyOjo72lBDnIKyPUpU
 Bl+9BogkRWny9QPrdwxgRBBnsN5jpwSyPYiyp+ssYK1+Ir+aZ8SYrg92SUwJi5qQ3zfXmMsUp7X
 MKcE2NH7waA27y+B1+rQXwV3ftjjDPrRPIK3h44pZwCrCJ8ixLPHFN0rX3S9WlJlzW4v5jiyZaY
 e7GD3q/q8VVw==
X-Google-Smtp-Source: AGHT+IF3BrAmthwPP0cKfOYrGdFnqXDCZjrsoW5R/7pgybN6uH6v2dWfQrTGHH7lapZcdSv4utMSVA==
X-Received: by 2002:a17:903:32cd:b0:269:8fa3:c227 with SMTP id
 d9443c01a7336-2902721310amr330372025ad.8.1760472442677; 
 Tue, 14 Oct 2025 13:07:22 -0700 (PDT)
Received: from stoup.. ([71.212.157.132]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29034f93ea2sm172100975ad.126.2025.10.14.13.07.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Oct 2025 13:07:22 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v2 05/37] target/arm: Split add_cpreg_to_hashtable_aa64
Date: Tue, 14 Oct 2025 13:06:46 -0700
Message-ID: <20251014200718.422022-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251014200718.422022-1-richard.henderson@linaro.org>
References: <20251014200718.422022-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
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
 target/arm/helper.c | 61 ++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 57 insertions(+), 4 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 3b06704963..c240edf182 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -7668,11 +7668,9 @@ static void add_cpreg_to_hashtable_aa32(ARMCPU *cpu, ARMCPRegInfo *r)
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
@@ -7740,6 +7738,10 @@ static void add_cpreg_to_hashtable_aa64(ARMCPU *cpu, ARMCPRegInfo *r)
         r2->writefn = NULL;
         r2->raw_readfn = NULL;
         r2->raw_writefn = NULL;
+        r2->read128fn = NULL;
+        r2->write128fn = NULL;
+        r2->raw_read128fn = NULL;
+        r2->raw_write128fn = NULL;
         r2->accessfn = NULL;
         r2->fieldoffset = 0;
 
@@ -7761,6 +7763,57 @@ static void add_cpreg_to_hashtable_aa64(ARMCPU *cpu, ARMCPRegInfo *r)
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
+        r->fieldoffsethi = 0;
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


