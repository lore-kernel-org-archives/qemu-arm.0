Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DA30CCD18E
	for <qemu-arm@archiver.kernel.org>; Tue, 14 Oct 2025 20:17:06 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v8lKI-0002wF-Db; Tue, 14 Oct 2025 16:08:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v8lKE-0002pV-KM
 for qemu-arm@nongnu.org; Tue, 14 Oct 2025 16:08:50 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v8lJC-0005R3-LX
 for qemu-arm@nongnu.org; Tue, 14 Oct 2025 16:08:48 -0400
Received: by mail-pl1-x629.google.com with SMTP id
 d9443c01a7336-27eec33b737so85826055ad.1
 for <qemu-arm@nongnu.org>; Tue, 14 Oct 2025 13:07:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1760472464; x=1761077264; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XbIPf39C/nOyYzA/Hj0JrQcXy1Pq3ydN164jP8835Fk=;
 b=uQuRuQtZSHnomhDr3AHn9tFy3uMDUgjnfoWYx2wrHU/E0TAyIivsq/Gm828V1CxUub
 VGBY74FnCvLpsXZlGI5yz7Zr+osIGUpQxnIcpjgWeoa31IPWnug1cO/oxkmvM10GW3dB
 z+5KyL0WR8pq06BvB4VsqMAB9qvjTxz2I6Yut2o+COIzpmTgoHYDP7QCTa6Y09d4nABy
 tjuoAvnp/loTbxdvod9kO5aXvmDuDbbnRex1dLqko58ao+5c/ic5IoFry6xKLBpvEd9L
 Vq6cQMHMkVkyCEwPRwXCKzCOUoTN4nL5cz3AbiQTD62pVVDYE5eBPRGfeeg6QKiOCGVJ
 eDIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760472464; x=1761077264;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XbIPf39C/nOyYzA/Hj0JrQcXy1Pq3ydN164jP8835Fk=;
 b=lLMeFmKFad5WpMtC1vpuN72/WegI84dphsqI+oVjuV+0vfe0jdsZGWNp2XM1GL2Ww7
 B+IMRKwga/KGP2zTG/g3KmUmaRsKN6jlEhsgzl/brkyn2Au16NGfUBV56+V6u3M6hbdF
 70TaSutG8JOSia+IAbUkcVRwDruVXFF1g19FUaMQnKJXOGYWdaycldurHRyUIPbcnpPc
 sChLy7/UMhI9EdTJXW/qHYZsF7+Ofvs/h5h2CjErDQD9GMppCpxdmq7I1zV1EW+B/3n6
 F+IdhUN4nbbio9RHwbwfDnmmbVC2gPSjAjMf1zTn5BxJTn2bfgbFozN1tdR2AE8rvL1c
 U21g==
X-Gm-Message-State: AOJu0YyL5c7JPeuJN3Zzjlx8UmyiPGC1nslpouLah00YkSvlXlmORLfO
 0wuB+rT8csGPd7st0Ypg+xP8JV0ZgBLjfV8+ZGlyD581ZNHOxaM2dTqNJ3rwlEZJqEs=
X-Gm-Gg: ASbGncsnUKfXsCGa2L7ZwKeEtkPlh2+kA8be3DIxLPntNLe99mRxZAlaEW77Nae/1oi
 Z8lySnvNATl5b10CacJVTFzZznEgCfQCaOH/QYb4swqfD4Dug8Ginw5fNqvYcGrDVTQmRqx0G4E
 8HmczK2/H0QE1+tiEJtnCa+mUzX5Vi4jcPHSY35RBuStbbwhXuVuRmXOlHfR2t96lwBQsCIdlBz
 k4hIfnOMHYzTfvytRv2lziGE2KQxwH4mUZV2n1fQrz/VTsYXX3E5UAUzbycqTOr0U3YaFnLQRrA
 tVIY1f+jwjU/H4wvXKY977zHZ0/HMbxQf5Qlu8FAjaqG0SmanLCHhJM1YhQZ0bf2q/VguU84ev7
 2vpAPcD9mV2/gn1dvh8EM45wlD+zybvRpjCavEuwO9xXD/CpaM18=
X-Google-Smtp-Source: AGHT+IGd5hkteQKarqIN6FTT4P5RJrY0E4jhj9ekdZ6C8HtQrKdGIgcbtoxACBZflDvUMeEj0JWxdQ==
X-Received: by 2002:a17:902:d60f:b0:269:ba61:222e with SMTP id
 d9443c01a7336-29027303330mr328562865ad.53.1760472463921; 
 Tue, 14 Oct 2025 13:07:43 -0700 (PDT)
Received: from stoup.. ([71.212.157.132]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29034f93ea2sm172100975ad.126.2025.10.14.13.07.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Oct 2025 13:07:43 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v2 35/37] target/arm: Implement TLBIP VA{L}E2{IS,OS}
Date: Tue, 14 Oct 2025 13:07:16 -0700
Message-ID: <20251014200718.422022-36-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251014200718.422022-1-richard.henderson@linaro.org>
References: <20251014200718.422022-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
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
 target/arm/tcg/tlb-insns.c | 35 +++++++++++++++++++++++++++--------
 1 file changed, 27 insertions(+), 8 deletions(-)

diff --git a/target/arm/tcg/tlb-insns.c b/target/arm/tcg/tlb-insns.c
index 10ee973068..ea2b56e245 100644
--- a/target/arm/tcg/tlb-insns.c
+++ b/target/arm/tcg/tlb-insns.c
@@ -518,6 +518,17 @@ static void tlbi_aa64_vae2is_write(CPUARMState *env, const ARMCPRegInfo *ri,
     tlb_flush_page_bits_by_mmuidx_all_cpus_synced(cs, pageaddr, mask, bits);
 }
 
+static void tlbi_aa64_vae2is_write128(CPUARMState *env, const ARMCPRegInfo *ri,
+                                      uint64_t vallo, uint64_t valhi)
+{
+    CPUState *cs = env_cpu(env);
+    int mask = vae2_tlbmask(env);
+    uint64_t pageaddr = sextract64(valhi << 12, 0, 56);
+    int bits = vae2_tlbbits(env, pageaddr);
+
+    tlb_flush_page_bits_by_mmuidx_all_cpus_synced(cs, pageaddr, mask, bits);
+}
+
 static void tlbi_aa64_vae3is_write(CPUARMState *env, const ARMCPRegInfo *ri,
                                    uint64_t value)
 {
@@ -868,13 +879,17 @@ static const ARMCPRegInfo tlbi_el2_cp_reginfo[] = {
     { .name = "TLBI_VAE2IS", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 4, .crn = 8, .crm = 3, .opc2 = 1,
       .access = PL2_W,
-      .type = ARM_CP_NO_RAW | ARM_CP_ADD_TLBI_NXS | ARM_CP_EL3_NO_EL2_UNDEF,
-      .writefn = tlbi_aa64_vae2is_write },
+      .type = ARM_CP_NO_RAW | ARM_CP_ADD_TLBI_NXS |
+              ARM_CP_EL3_NO_EL2_UNDEF | ARM_CP_128BIT,
+      .writefn = tlbi_aa64_vae2is_write,
+      .write128fn = tlbi_aa64_vae2is_write128 },
     { .name = "TLBI_VALE2IS", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 4, .crn = 8, .crm = 3, .opc2 = 5,
       .access = PL2_W,
-      .type = ARM_CP_NO_RAW | ARM_CP_ADD_TLBI_NXS | ARM_CP_EL3_NO_EL2_UNDEF,
-      .writefn = tlbi_aa64_vae2is_write },
+      .type = ARM_CP_NO_RAW | ARM_CP_ADD_TLBI_NXS |
+              ARM_CP_EL3_NO_EL2_UNDEF | ARM_CP_128BIT,
+      .writefn = tlbi_aa64_vae2is_write,
+      .write128fn = tlbi_aa64_vae2is_write128 },
 };
 
 static const ARMCPRegInfo tlbi_el3_cp_reginfo[] = {
@@ -1421,8 +1436,10 @@ static const ARMCPRegInfo tlbios_reginfo[] = {
     { .name = "TLBI_VAE2OS", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 4, .crn = 8, .crm = 1, .opc2 = 1,
       .access = PL2_W,
-      .type = ARM_CP_NO_RAW | ARM_CP_ADD_TLBI_NXS | ARM_CP_EL3_NO_EL2_UNDEF,
-      .writefn = tlbi_aa64_vae2is_write },
+      .type = ARM_CP_NO_RAW | ARM_CP_ADD_TLBI_NXS |
+              ARM_CP_EL3_NO_EL2_UNDEF | ARM_CP_128BIT,
+      .writefn = tlbi_aa64_vae2is_write,
+      .write128fn = tlbi_aa64_vae2is_write128 },
    { .name = "TLBI_ALLE1OS", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 4, .crn = 8, .crm = 1, .opc2 = 4,
       .access = PL2_W,
@@ -1431,8 +1448,10 @@ static const ARMCPRegInfo tlbios_reginfo[] = {
     { .name = "TLBI_VALE2OS", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 4, .crn = 8, .crm = 1, .opc2 = 5,
       .access = PL2_W,
-      .type = ARM_CP_NO_RAW | ARM_CP_ADD_TLBI_NXS | ARM_CP_EL3_NO_EL2_UNDEF,
-      .writefn = tlbi_aa64_vae2is_write },
+      .type = ARM_CP_NO_RAW | ARM_CP_ADD_TLBI_NXS |
+              ARM_CP_EL3_NO_EL2_UNDEF | ARM_CP_128BIT,
+      .writefn = tlbi_aa64_vae2is_write,
+      .write128fn = tlbi_aa64_vae2is_write128 },
     { .name = "TLBI_VMALLS12E1OS", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 4, .crn = 8, .crm = 1, .opc2 = 6,
       .access = PL2_W, .type = ARM_CP_NO_RAW | ARM_CP_ADD_TLBI_NXS,
-- 
2.43.0


