Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C684CCCD184
	for <qemu-arm@archiver.kernel.org>; Tue, 14 Oct 2025 20:10:02 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v8lKX-0003FR-Tw; Tue, 14 Oct 2025 16:09:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v8lKD-0002pF-3S
 for qemu-arm@nongnu.org; Tue, 14 Oct 2025 16:08:49 -0400
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v8lJC-0005QW-AF
 for qemu-arm@nongnu.org; Tue, 14 Oct 2025 16:08:48 -0400
Received: by mail-pg1-x531.google.com with SMTP id
 41be03b00d2f7-b4fb8d3a2dbso3985625a12.3
 for <qemu-arm@nongnu.org>; Tue, 14 Oct 2025 13:07:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1760472463; x=1761077263; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eOldzdPHQhf3YrWEbwVnS4C8lSFLiSxsaEnJBfZTIIY=;
 b=re2tZL8ZAMwCcUhKseL058b7/OTWSD2mUnKYk128QFObGLKu4DLVfT6kMWOx4LNjep
 /DmRnRG3x4ezLg+dD/X+ZpGOTXBu2aXCcsaxjBxkosifXUYOqT8QC0l3BNLFw13VCK8H
 n5mJzosTeeXUMsJvrZ+BuiwMzu+CxLfBrWMGI7TueMQTLyr0GKZpEVkdajGR83Vp6F6d
 XdCujM8JAN4N/rWbMxYpCTKcGpEyVOwgV/hzosCOaU7+u9Jn07NABsx514/jvwTEsn9C
 dPQm4yt+2X6tZ0/BSAXCHWNZgPqJV23HiayQUBT8enOSRrOzPshPkraSICNz+E8s2CIq
 YnMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760472463; x=1761077263;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eOldzdPHQhf3YrWEbwVnS4C8lSFLiSxsaEnJBfZTIIY=;
 b=u4AkkqOq+rfbAurXodLBjZ4WWERERKQiGvb71nnDQg6YN3b1JJog/+rHpGdgzDrsJr
 Z5qr9K8j+eShdCD6xruQTecGTgsOMZeT184iXr6lLgnJZImY4pd4yrwwnVWjGaLTqn77
 4Yo4jIskO0ltFON+qAa4pr4jl5L9+MRws5yxy9u8K9ZbsR83Ek0LV3mIBm5FyX4txpw7
 PMdxQQ6tycuAlMePRQMF3QQHBA9zJn7kk7WjfxjXUNsRcalGA9uv+iBFIZFH9UH3oLdf
 EF4pR9jUdS66IBe+/pILIB6Eo3F21oB9ZcdFlgI2j9Ft/D7juJodrfJkSeBI4hI+6JLV
 rytg==
X-Gm-Message-State: AOJu0Yw18r/V4ErAtzVbx+NyX9PTHl2r38VsEpJ2Id7vI8oyg3Mx7nmn
 nV/1tAAInxsTsL+O9DSvzmX7gbjIsRnODdK1OxTFBK8qGo6nI56Iz8v9txKchFgfNLUDBpvbA+N
 fG5mZ65k=
X-Gm-Gg: ASbGncsaEFZBc0Gk7m8U9f5TKQ4Pcbf/0QMOiGhWt6ilcUaSrK+dKeNaBPQMszcBBs6
 c6oooUSWIc+Z/JquL7YALx+DWQWcaT5erGkwth8BB0PNq5zVbVlTHt1Lb0fPwaOfcN0ue4dsA2W
 LcXN9F1zLEpABCuiNyyT81+IOpzHmBSetowPQaRTjrcZF3gtsGgWytraTEj9EWVS7gtMX8k63gT
 4bfs8E4zgPvVGMxIzPqHoKgpC68TX7uBKzQNjzYrcRqxLnDJIrvNU5WzrBmF4qlaPfNtG30rQYw
 Zjb3+2FfeTUkgz9lQ0wyW3lPjISayXQcJ3exNtWxa6vSImY0BDJoL9N7kCtUlgzo3lmLXTyAk2C
 K4AQjw5X2kTM6n3C9yXGFEV1DoFPRT2wasPsFnq0WIU9IpHiH/tsRmvE/RLEAK+DMMLtjIZcY
X-Google-Smtp-Source: AGHT+IGD6FVJaWr03FcKRamX2KIpwQhOOouZePc/7JlrPWm9U3hw58LS2Bt51Q6sN5pI/812ApoljA==
X-Received: by 2002:a17:903:2a87:b0:269:aba0:f0a7 with SMTP id
 d9443c01a7336-29027212f47mr352915605ad.2.1760472462677; 
 Tue, 14 Oct 2025 13:07:42 -0700 (PDT)
Received: from stoup.. ([71.212.157.132]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29034f93ea2sm172100975ad.126.2025.10.14.13.07.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Oct 2025 13:07:42 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v2 33/37] target/arm: Implement TLBIP VAE2, VALE2
Date: Tue, 14 Oct 2025 13:07:14 -0700
Message-ID: <20251014200718.422022-34-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251014200718.422022-1-richard.henderson@linaro.org>
References: <20251014200718.422022-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x531.google.com
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
 target/arm/tcg/tlb-insns.c | 23 +++++++++++++++++++----
 1 file changed, 19 insertions(+), 4 deletions(-)

diff --git a/target/arm/tcg/tlb-insns.c b/target/arm/tcg/tlb-insns.c
index beacb92f32..f99559e4a7 100644
--- a/target/arm/tcg/tlb-insns.c
+++ b/target/arm/tcg/tlb-insns.c
@@ -416,6 +416,17 @@ static void tlbi_aa64_vae2_write(CPUARMState *env, const ARMCPRegInfo *ri,
     tlb_flush_page_bits_by_mmuidx(cs, pageaddr, mask, bits);
 }
 
+static void tlbi_aa64_vae2_write128(CPUARMState *env, const ARMCPRegInfo *ri,
+                                    uint64_t vallo, uint64_t valhi)
+{
+    CPUState *cs = env_cpu(env);
+    int mask = vae2_tlbmask(env);
+    uint64_t pageaddr = sextract64(valhi << 12, 0, 56);
+    int bits = vae2_tlbbits(env, pageaddr);
+
+    tlb_flush_page_bits_by_mmuidx(cs, pageaddr, mask, bits);
+}
+
 static void tlbi_aa64_vae3_write(CPUARMState *env, const ARMCPRegInfo *ri,
                                  uint64_t value)
 {
@@ -831,13 +842,17 @@ static const ARMCPRegInfo tlbi_el2_cp_reginfo[] = {
     { .name = "TLBI_VAE2", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 4, .crn = 8, .crm = 7, .opc2 = 1,
       .access = PL2_W,
-      .type = ARM_CP_NO_RAW | ARM_CP_ADD_TLBI_NXS | ARM_CP_EL3_NO_EL2_UNDEF,
-      .writefn = tlbi_aa64_vae2_write },
+      .type = ARM_CP_NO_RAW | ARM_CP_ADD_TLBI_NXS |
+              ARM_CP_EL3_NO_EL2_UNDEF | ARM_CP_128BIT,
+      .writefn = tlbi_aa64_vae2_write,
+      .write128fn = tlbi_aa64_vae2_write128 },
     { .name = "TLBI_VALE2", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 4, .crn = 8, .crm = 7, .opc2 = 5,
       .access = PL2_W,
-      .type = ARM_CP_NO_RAW | ARM_CP_ADD_TLBI_NXS | ARM_CP_EL3_NO_EL2_UNDEF,
-      .writefn = tlbi_aa64_vae2_write },
+      .type = ARM_CP_NO_RAW | ARM_CP_ADD_TLBI_NXS |
+              ARM_CP_EL3_NO_EL2_UNDEF | ARM_CP_128BIT,
+      .writefn = tlbi_aa64_vae2_write,
+      .write128fn = tlbi_aa64_vae2_write128 },
     { .name = "TLBI_ALLE2IS", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 4, .crn = 8, .crm = 3, .opc2 = 0,
       .access = PL2_W,
-- 
2.43.0


