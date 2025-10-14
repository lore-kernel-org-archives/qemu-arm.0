Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2A1BCCD184
	for <qemu-arm@archiver.kernel.org>; Tue, 14 Oct 2025 20:10:18 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v8lL0-0003pJ-KG; Tue, 14 Oct 2025 16:09:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v8lKH-0002uf-Qt
 for qemu-arm@nongnu.org; Tue, 14 Oct 2025 16:08:54 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v8lJC-0005PX-LX
 for qemu-arm@nongnu.org; Tue, 14 Oct 2025 16:08:52 -0400
Received: by mail-pl1-x633.google.com with SMTP id
 d9443c01a7336-2698e4795ebso56484905ad.0
 for <qemu-arm@nongnu.org>; Tue, 14 Oct 2025 13:07:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1760472461; x=1761077261; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fnPHkR0njX4AqazQ6eEmA4gBMrMS6vcZ8iE2evnsKIo=;
 b=To07x0sRHRUCXrtJG/NV/5qYt1EqQ24xdAwwRWmjo45K3fu0/EZpscaxNTHW5a6jvd
 HOrpyAS34P/lKrnW4NTMAULgFcU2Lam6Hc9HfAZb4yPbSEOpWK23rL/JJ8+VnlXwr63B
 LkxBLwx1om7gvMV+CZqUGkU4K8uRXBEin9UsnM6KcJzO6ufKK57myA36Neo28ZpM0gzb
 pTmv2KOg2lFrlce9s3ooSzg+KenkcO5Dtj8263C7Ed4OU2EaYv5N8h11B++QSLpDfec5
 9ixpfvOjNStp3xhI7ZM2509H56i4P3eTZWRQOK09wZVMlzG4zfaVLgMGD5zdxjsjkB9P
 Xlug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760472461; x=1761077261;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fnPHkR0njX4AqazQ6eEmA4gBMrMS6vcZ8iE2evnsKIo=;
 b=LphLpSKXQuBv7R3QtdZQsQ/KqqQhO33Z5m/rWK14LA4knridnhjA9kBhEQgDuv5Xb+
 26hcJp1l9x7f0nIYrNku/hsG+eqy8b85VyK8nhu76y3O8OQE7/isPBLHikq6XrU2A0P4
 mjBns1kNr5BWcSPU73DlGZAJCGKQjjyZ0PmWi3rBB3FrIDOTEBPaqaATwu60UNGSXsT8
 9M0s2hZ9hTMKarkPijTJhF7on8lfKzSCJZ7uCnDMDQbK4uEbOalY/qV39bULLZmgF2bU
 v70FVLnG4jXaIgOyPfW5+K5HzEVXGZUKwaRA3qXPx3ZPZL16YQW4AItn8O/CmzcmAxX3
 pdCQ==
X-Gm-Message-State: AOJu0Yw46ZjHo7iV+DeINvdnvjrE4ZH5XivBrM3GgJIRMCrP3oatkou+
 jEFzFYHbs/4vSPRuTqB4aiv82wKvcfeE8ofTJ43dVxsA5PkQhGyIpEQL1DPzGOBLZcVgJxwpME9
 PVD/TW2Q=
X-Gm-Gg: ASbGncseFkfHiXw60s6TC/bKFBxKJPrd+5NhT8PP+lQOCC46v9GN5jKy3SilwbZm0Cl
 RDXrr0DzBXQfDwDVR6kIujhzF8GXMYx9mcyUHgHE327n+LXnd6z9fL5jqxAE7oDtmW1TV6osj3A
 SbX8kJSjh9UXTmEgdGdzkbu6Gsne1XY5AnWSx888EgCJfhmsQ524JYYzL7ykC6fWy2PAlNzeu6b
 ACJHuDDGLY3hZkUprHUuYbtgGrEtSLKJoDmuUeutYnygeNZ+D7IrpitXI/wLK9bYzh8X9X8MR0A
 7SKAzGv45zTM7y1VqBa/r0b/mz3J6hUXVoRNiaXtS000ozpE4G2Ke3vz+vFztfK4h3gHSaMPzA8
 u4HxuSSfp+QVlUuFaQ9iDdEmyrG66/7u7q25uI+Onb6hFEtIKm/tZNJBQYnOSjg==
X-Google-Smtp-Source: AGHT+IHn6tHZi6h1Qv6LVm0QmLNrZJXxEhVqAKrJR+w6QZos43FK4oToQEDPej26Q722QAOotaY1PQ==
X-Received: by 2002:a17:903:2f0e:b0:272:a900:c42b with SMTP id
 d9443c01a7336-290273ef03dmr326284525ad.31.1760472460826; 
 Tue, 14 Oct 2025 13:07:40 -0700 (PDT)
Received: from stoup.. ([71.212.157.132]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29034f93ea2sm172100975ad.126.2025.10.14.13.07.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Oct 2025 13:07:40 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v2 30/37] target/arm: Implement TLBIP RVA{L}E2{IS,OS}
Date: Tue, 14 Oct 2025 13:07:11 -0700
Message-ID: <20251014200718.422022-31-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251014200718.422022-1-richard.henderson@linaro.org>
References: <20251014200718.422022-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
 target/arm/tcg/tlb-insns.c | 52 +++++++++++++++++++++++++++-----------
 1 file changed, 37 insertions(+), 15 deletions(-)

diff --git a/target/arm/tcg/tlb-insns.c b/target/arm/tcg/tlb-insns.c
index 6c07839e3f..cbab7f81f9 100644
--- a/target/arm/tcg/tlb-insns.c
+++ b/target/arm/tcg/tlb-insns.c
@@ -1031,11 +1031,16 @@ static void tlbi_aa64_rvae2_write(CPUARMState *env,
      * since we don't support flush-for-specific-ASID-only or
      * flush-last-level-only.
      */
-
     do_rvae_write(env, value, vae2_tlbmask(env),
                   tlb_force_broadcast(env));
+}
 
-
+static void tlbi_aa64_rvae2_write128(CPUARMState *env,
+                                     const ARMCPRegInfo *ri,
+                                     uint64_t vallo, uint64_t valhi)
+{
+    do_rvae_write128(env, vallo, valhi, vae2_tlbmask(env),
+                     tlb_force_broadcast(env));
 }
 
 static void tlbi_aa64_rvae2is_write(CPUARMState *env,
@@ -1048,9 +1053,14 @@ static void tlbi_aa64_rvae2is_write(CPUARMState *env,
      * since we don't support flush-for-specific-ASID-only,
      * flush-last-level-only or inner/outer shareable specific flushes.
      */
-
     do_rvae_write(env, value, vae2_tlbmask(env), true);
+}
 
+static void tlbi_aa64_rvae2is_write128(CPUARMState *env,
+                                       const ARMCPRegInfo *ri,
+                                       uint64_t vallo, uint64_t valhi)
+{
+    do_rvae_write128(env, vallo, valhi, vae2_tlbmask(env), true);
 }
 
 static void tlbi_aa64_rvae3_write(CPUARMState *env,
@@ -1202,13 +1212,17 @@ static const ARMCPRegInfo tlbirange_reginfo[] = {
     { .name = "TLBI_RVAE2IS", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 4, .crn = 8, .crm = 2, .opc2 = 1,
       .access = PL2_W,
-      .type = ARM_CP_NO_RAW | ARM_CP_ADD_TLBI_NXS | ARM_CP_EL3_NO_EL2_UNDEF,
-      .writefn = tlbi_aa64_rvae2is_write },
+      .type = ARM_CP_NO_RAW | ARM_CP_ADD_TLBI_NXS |
+              ARM_CP_EL3_NO_EL2_UNDEF | ARM_CP_128BIT,
+      .writefn = tlbi_aa64_rvae2is_write,
+      .write128fn = tlbi_aa64_rvae2is_write128 },
    { .name = "TLBI_RVALE2IS", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 4, .crn = 8, .crm = 2, .opc2 = 5,
       .access = PL2_W,
-      .type = ARM_CP_NO_RAW | ARM_CP_ADD_TLBI_NXS | ARM_CP_EL3_NO_EL2_UNDEF,
-      .writefn = tlbi_aa64_rvae2is_write },
+      .type = ARM_CP_NO_RAW | ARM_CP_ADD_TLBI_NXS |
+              ARM_CP_EL3_NO_EL2_UNDEF | ARM_CP_128BIT,
+      .writefn = tlbi_aa64_rvae2is_write,
+      .write128fn = tlbi_aa64_rvae2is_write128 },
     { .name = "TLBI_RIPAS2E1", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 4, .crn = 8, .crm = 4, .opc2 = 2,
       .access = PL2_W,
@@ -1224,23 +1238,31 @@ static const ARMCPRegInfo tlbirange_reginfo[] = {
    { .name = "TLBI_RVAE2OS", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 4, .crn = 8, .crm = 5, .opc2 = 1,
       .access = PL2_W,
-      .type = ARM_CP_NO_RAW | ARM_CP_ADD_TLBI_NXS | ARM_CP_EL3_NO_EL2_UNDEF,
-      .writefn = tlbi_aa64_rvae2is_write },
+      .type = ARM_CP_NO_RAW | ARM_CP_ADD_TLBI_NXS |
+              ARM_CP_EL3_NO_EL2_UNDEF | ARM_CP_128BIT,
+      .writefn = tlbi_aa64_rvae2is_write,
+      .write128fn = tlbi_aa64_rvae2is_write128 },
    { .name = "TLBI_RVALE2OS", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 4, .crn = 8, .crm = 5, .opc2 = 5,
       .access = PL2_W,
-      .type = ARM_CP_NO_RAW | ARM_CP_ADD_TLBI_NXS | ARM_CP_EL3_NO_EL2_UNDEF,
-      .writefn = tlbi_aa64_rvae2is_write },
+      .type = ARM_CP_NO_RAW | ARM_CP_ADD_TLBI_NXS |
+              ARM_CP_EL3_NO_EL2_UNDEF | ARM_CP_128BIT,
+      .writefn = tlbi_aa64_rvae2is_write,
+      .write128fn = tlbi_aa64_rvae2is_write128 },
     { .name = "TLBI_RVAE2", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 4, .crn = 8, .crm = 6, .opc2 = 1,
       .access = PL2_W,
-      .type = ARM_CP_NO_RAW | ARM_CP_ADD_TLBI_NXS | ARM_CP_EL3_NO_EL2_UNDEF,
-      .writefn = tlbi_aa64_rvae2_write },
+      .type = ARM_CP_NO_RAW | ARM_CP_ADD_TLBI_NXS |
+              ARM_CP_EL3_NO_EL2_UNDEF | ARM_CP_128BIT,
+      .writefn = tlbi_aa64_rvae2_write,
+      .write128fn = tlbi_aa64_rvae2_write128 },
    { .name = "TLBI_RVALE2", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 4, .crn = 8, .crm = 6, .opc2 = 5,
       .access = PL2_W,
-      .type = ARM_CP_NO_RAW | ARM_CP_ADD_TLBI_NXS | ARM_CP_EL3_NO_EL2_UNDEF,
-      .writefn = tlbi_aa64_rvae2_write },
+      .type = ARM_CP_NO_RAW | ARM_CP_ADD_TLBI_NXS |
+              ARM_CP_EL3_NO_EL2_UNDEF | ARM_CP_128BIT,
+      .writefn = tlbi_aa64_rvae2_write,
+      .write128fn = tlbi_aa64_rvae2_write128 },
    { .name = "TLBI_RVAE3IS", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 6, .crn = 8, .crm = 2, .opc2 = 1,
       .access = PL3_W, .type = ARM_CP_NO_RAW | ARM_CP_ADD_TLBI_NXS,
-- 
2.43.0


