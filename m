Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 892F5CCD190
	for <qemu-arm@archiver.kernel.org>; Tue, 14 Oct 2025 20:12:02 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v8lKD-0002ou-Tv; Tue, 14 Oct 2025 16:08:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v8lK5-0002jr-U5
 for qemu-arm@nongnu.org; Tue, 14 Oct 2025 16:08:44 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v8lJ9-0005Pv-N7
 for qemu-arm@nongnu.org; Tue, 14 Oct 2025 16:08:41 -0400
Received: by mail-pl1-x632.google.com with SMTP id
 d9443c01a7336-28e7cd34047so45274915ad.2
 for <qemu-arm@nongnu.org>; Tue, 14 Oct 2025 13:07:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1760472461; x=1761077261; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=S1HXAga8NsrRrTAL1Ri+/I+45ifsoA4Nqr/eKxaAD+I=;
 b=pjQLYvDQ1yhr2SrN4XYYEbnLAqjramv6IkkXLFNqersxRpQeOeqPkYexdlvDujLQ7o
 xHWKYmEmr+HYETzS6KHvpAZVMle/YXCkDJV8hqebDelD7O8mu6F2ylX3Sb98/KNHp5+c
 vIY1ik80Z+tvOtdMD0GPqdfSdcCFGKxiX0F0tsmHKE+fIeuTf0aOckY8aXfzLPfAyfQ/
 2JDHK44MmWuaue23UMk5YT/5OjlBtvtiDIF3BKVOpv2/hch7ANWXTiIGIqa3G/GNWfg0
 cRfXAOjnoJomQKAfLozW/IoM68fuTigdKbgFp/5mUZlx9PQhB0qap2LNkcHixMdwv+LL
 h9Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760472461; x=1761077261;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=S1HXAga8NsrRrTAL1Ri+/I+45ifsoA4Nqr/eKxaAD+I=;
 b=paj+jFo3aDGm3yCR9MQfK3oJuc+fPBXdge4qFlUpq54QX2YuRdfFw4XqzZ1dYr+rU6
 AJzgESa9pjLBU7as8nPAGc9zve8zQS5mWiyvsKRtw7gfl1evxvs1aU4LXcxBzF6NqTcL
 XM9FCj5vfY09s77NJRN0L6tO6gp5ZyrD/zVaHXYsfMEaDLd2LcHnnY8N5jN0yeRjIOH+
 2DUD6+Oa0b6BRACGXjXzS6TJdPC87S3DM66CfLZeAt8zsH9VOVyK+TS5KSu3mJ+MlAUt
 gnbpJTi9MbTHIe4uM2AU/R2K1fj9Bc9/5v71fI1BzQwhSp7j28zvfGCQURx8ydOolhn1
 zw+Q==
X-Gm-Message-State: AOJu0YwI7+IiztWLa7HzHgbkhiLqVX/PaqWNyWubNhBpn+yHuIaLP2M1
 dKg9fCO8ZtJ/goit+jXF2BmOOLnM4aPwvgtOc2SCRra+oh1+y4DvOI2aQ32b3VQhI1k=
X-Gm-Gg: ASbGncvFpcPJ09GfiGMawdtNcNjOn635lvNLv8FvG3JXpvs+aU0XW1x3+4NpTZIwzFa
 iu6yo65orZcUeKRZLFmOR4Ih0gZLE4rHInCe/DPgm+Ur4o+q0y5W8Qzve+8f1ugQsZw9ZJ5q7Zh
 lpKSvGTEjFAzwXJLWQvuB11DCepgwgB49BumPH1wFsr6Vn+Ndy3lUPptUz+cT3zfKPx42mr8DzX
 aNp6LNhSHKDBHEEDAm+Y7Eu1CwvMX78KhOOhbknhEOCp8ny5huIVpXOemk2q9Kuctl67l1WCFBz
 LkkejiU0Dwx0NlnzzGimY21pWOCNuFNpG8Och79RodMeFyW6r/fVAyvATs7ZS95N+GaCfHMU8o4
 R28Vm+uAajxLO4NSt5e7HgC4rD2j70IxfxVmrnUFvBAoqxOxSMDzzcbNwQCht4DNdinlyym0Q
X-Google-Smtp-Source: AGHT+IHBjaP8HBExhWP/blRTgUr5bperyPim6I27GBqc2LHTrZPDvG5Ws6Aub0uJ8VlToFZSZncu8g==
X-Received: by 2002:a17:903:2409:b0:290:52aa:7291 with SMTP id
 d9443c01a7336-29052aa8299mr171944845ad.53.1760472461456; 
 Tue, 14 Oct 2025 13:07:41 -0700 (PDT)
Received: from stoup.. ([71.212.157.132]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29034f93ea2sm172100975ad.126.2025.10.14.13.07.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Oct 2025 13:07:41 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v2 31/37] target/arm: Implement TLBIP RVA{L}E3{IS,OS}
Date: Tue, 14 Oct 2025 13:07:12 -0700
Message-ID: <20251014200718.422022-32-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251014200718.422022-1-richard.henderson@linaro.org>
References: <20251014200718.422022-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
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
 target/arm/tcg/tlb-insns.c | 53 ++++++++++++++++++++++++++++----------
 1 file changed, 39 insertions(+), 14 deletions(-)

diff --git a/target/arm/tcg/tlb-insns.c b/target/arm/tcg/tlb-insns.c
index cbab7f81f9..c7583957b0 100644
--- a/target/arm/tcg/tlb-insns.c
+++ b/target/arm/tcg/tlb-insns.c
@@ -1073,10 +1073,17 @@ static void tlbi_aa64_rvae3_write(CPUARMState *env,
      * since we don't support flush-for-specific-ASID-only or
      * flush-last-level-only.
      */
-
     do_rvae_write(env, value, vae3_tlbmask(), tlb_force_broadcast(env));
 }
 
+static void tlbi_aa64_rvae3_write128(CPUARMState *env,
+                                     const ARMCPRegInfo *ri,
+                                     uint64_t vallo, uint64_t valhi)
+{
+    do_rvae_write128(env, vallo, valhi, vae3_tlbmask(),
+                     tlb_force_broadcast(env));
+}
+
 static void tlbi_aa64_rvae3is_write(CPUARMState *env,
                                     const ARMCPRegInfo *ri,
                                     uint64_t value)
@@ -1087,10 +1094,16 @@ static void tlbi_aa64_rvae3is_write(CPUARMState *env,
      * since we don't support flush-for-specific-ASID-only,
      * flush-last-level-only or inner/outer specific flushes.
      */
-
     do_rvae_write(env, value, vae3_tlbmask(), true);
 }
 
+static void tlbi_aa64_rvae3is_write128(CPUARMState *env,
+                                       const ARMCPRegInfo *ri,
+                                       uint64_t vallo, uint64_t valhi)
+{
+    do_rvae_write128(env, vallo, valhi, vae3_tlbmask(), true);
+}
+
 static void tlbi_aa64_ripas2e1_write(CPUARMState *env, const ARMCPRegInfo *ri,
                                      uint64_t value)
 {
@@ -1265,28 +1278,40 @@ static const ARMCPRegInfo tlbirange_reginfo[] = {
       .write128fn = tlbi_aa64_rvae2_write128 },
    { .name = "TLBI_RVAE3IS", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 6, .crn = 8, .crm = 2, .opc2 = 1,
-      .access = PL3_W, .type = ARM_CP_NO_RAW | ARM_CP_ADD_TLBI_NXS,
-      .writefn = tlbi_aa64_rvae3is_write },
+      .access = PL3_W,
+      .type = ARM_CP_NO_RAW | ARM_CP_ADD_TLBI_NXS | ARM_CP_128BIT,
+      .writefn = tlbi_aa64_rvae3is_write,
+      .write128fn = tlbi_aa64_rvae3is_write128 },
    { .name = "TLBI_RVALE3IS", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 6, .crn = 8, .crm = 2, .opc2 = 5,
-      .access = PL3_W, .type = ARM_CP_NO_RAW | ARM_CP_ADD_TLBI_NXS,
-      .writefn = tlbi_aa64_rvae3is_write },
+      .access = PL3_W,
+      .type = ARM_CP_NO_RAW | ARM_CP_ADD_TLBI_NXS | ARM_CP_128BIT,
+      .writefn = tlbi_aa64_rvae3is_write,
+      .write128fn = tlbi_aa64_rvae3is_write128 },
    { .name = "TLBI_RVAE3OS", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 6, .crn = 8, .crm = 5, .opc2 = 1,
-      .access = PL3_W, .type = ARM_CP_NO_RAW | ARM_CP_ADD_TLBI_NXS,
-      .writefn = tlbi_aa64_rvae3is_write },
+      .access = PL3_W,
+      .type = ARM_CP_NO_RAW | ARM_CP_ADD_TLBI_NXS | ARM_CP_128BIT,
+      .writefn = tlbi_aa64_rvae3is_write,
+      .write128fn = tlbi_aa64_rvae3is_write128 },
    { .name = "TLBI_RVALE3OS", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 6, .crn = 8, .crm = 5, .opc2 = 5,
-      .access = PL3_W, .type = ARM_CP_NO_RAW | ARM_CP_ADD_TLBI_NXS,
-      .writefn = tlbi_aa64_rvae3is_write },
+      .access = PL3_W,
+      .type = ARM_CP_NO_RAW | ARM_CP_ADD_TLBI_NXS | ARM_CP_128BIT,
+      .writefn = tlbi_aa64_rvae3is_write,
+      .write128fn = tlbi_aa64_rvae3is_write128 },
    { .name = "TLBI_RVAE3", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 6, .crn = 8, .crm = 6, .opc2 = 1,
-      .access = PL3_W, .type = ARM_CP_NO_RAW | ARM_CP_ADD_TLBI_NXS,
-      .writefn = tlbi_aa64_rvae3_write },
+      .access = PL3_W,
+      .type = ARM_CP_NO_RAW | ARM_CP_ADD_TLBI_NXS | ARM_CP_128BIT,
+      .writefn = tlbi_aa64_rvae3_write,
+      .write128fn = tlbi_aa64_rvae3_write128 },
    { .name = "TLBI_RVALE3", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 6, .crn = 8, .crm = 6, .opc2 = 5,
-      .access = PL3_W, .type = ARM_CP_NO_RAW | ARM_CP_ADD_TLBI_NXS,
-      .writefn = tlbi_aa64_rvae3_write },
+      .access = PL3_W,
+      .type = ARM_CP_NO_RAW | ARM_CP_ADD_TLBI_NXS | ARM_CP_128BIT,
+      .writefn = tlbi_aa64_rvae3_write,
+      .write128fn = tlbi_aa64_rvae3_write128 },
 };
 
 static const ARMCPRegInfo tlbios_reginfo[] = {
-- 
2.43.0


