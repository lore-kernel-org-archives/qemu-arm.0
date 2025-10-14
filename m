Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A294CCD190
	for <qemu-arm@archiver.kernel.org>; Tue, 14 Oct 2025 20:09:58 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v8lLB-0003yX-Kj; Tue, 14 Oct 2025 16:09:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v8lKJ-0002wb-Mg
 for qemu-arm@nongnu.org; Tue, 14 Oct 2025 16:08:56 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v8lJE-0005RC-D8
 for qemu-arm@nongnu.org; Tue, 14 Oct 2025 16:08:55 -0400
Received: by mail-pf1-x435.google.com with SMTP id
 d2e1a72fcca58-781001e3846so5606306b3a.2
 for <qemu-arm@nongnu.org>; Tue, 14 Oct 2025 13:07:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1760472465; x=1761077265; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ghLuR3gXYt6fnGHVL4mdQCSf+iXVALSdZ/1qqHB0W5k=;
 b=yaBODpMPwwkMsXYX6+DcPxRuzL+gO++NB2Qwg7STMmtgEGXssrbRtrbWSBrX9xf84v
 iMROzJ/t5gfjySG+pQAr+Cc9bZ5x4TzNknDRDGGZcDQbWNmAiaXgEvFmLRf5cxWlWbiv
 wAJOovVnY7cLRNtQ9VgGp/5o8JM2u7fjXuCnb9XVVLA0iF/gXcLhkvKJfacdHeAmEVuj
 w3JpqXxtB9xgnluXRXWHZ6itUEmXUsGmA4YTPFZgVa5Y7FW3TPTaIEMjkMMzKFI4AW4p
 vDAnNeHwWvcCd5bJZdoxoiIlrVvYiWuRQ3OfwTtvtEyxNKOjm5QfNxT1DDtG1a0PaenJ
 VAug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760472465; x=1761077265;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ghLuR3gXYt6fnGHVL4mdQCSf+iXVALSdZ/1qqHB0W5k=;
 b=qPeiPG0PwoD3HkryqBIZgNMnK/sIxcXFL+Px5d4LchDzHJrvtiTYkGPFMr/GF8EvvZ
 u6KPxgIeUcohd4cRaAN/WzQJW//TZAx52wELiOPpCLsWhKJm0quULBqGxNdH5d1lo3jr
 XUlC9sGI2k+0vOuHZGOr0ZA5fqEB1MDD2HhUhybnHR3F2nrRHZ3jDFmhMoW5Xg7dW6kR
 dKon4eghX7P6W50AnjKpFgrwW4gmANn6T2CdvlRxyMWVH51oyjFLBx8HG4T9eerH9zqU
 /kbXI8zvk06CAqbsDcBZND5W0mbaYV1Ebd/fRPccWQqxBDqXaXhlGkAERMjUD/MoxFkl
 LA7w==
X-Gm-Message-State: AOJu0YwlJC7rvnhrQPwkDk4gnlqX75XylvymuyHCKu8zmuqWAZKpbQD/
 +fScxbgd1ceoosuQSYP5ilXT9FmBeDIwdg+wGyksmMsjJY/f1wDgQ8Aoox875jm9Rc8=
X-Gm-Gg: ASbGnctpkkzGfMdRQo5hUETBz883FkSqEuCQb5p4npz1Ah/i1nkTGAJk8NJBVWSoIKd
 k6FLeNNSntPun+jq3nlo9fJI/9stR1MmakgbVnwUdzik06BOZt9x6y8z/fwdW0tOs+6tGKqqhUE
 ZhG7MCNzhJa0FREQqRfKAMbAAlN984wegx8L6mmnA7cje2y8B0iOgAvLx+5KrqRbCTizAK46d/A
 Fc24d5/iJvpoPrTfIf9OFlEgR/lUQ/g9xrMRLUsOJrSKsiozsFiaidOR7uwWEtpWgFI7w5190N8
 Abx1cVB4r2veVmk7eyGeyQYlnExTXYO9tq+2VgwaoVFUvqVqlMY3toNzcz5cLQvNXFO157/LqnP
 7CkEKPL9rMGthcmk9Ls30vuoI2VIgImEpvoKBeS8E79FAUmTB+dA=
X-Google-Smtp-Source: AGHT+IH0J59BmeBYRPGNRw0Fex6sDoGBhYrUyKQQ4zqVuKTjjFThG+dNPUdEV1Hx4NnFdVOh1j+6Ag==
X-Received: by 2002:a17:903:910:b0:258:9d26:1860 with SMTP id
 d9443c01a7336-290273ffeb7mr357893535ad.40.1760472464536; 
 Tue, 14 Oct 2025 13:07:44 -0700 (PDT)
Received: from stoup.. ([71.212.157.132]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29034f93ea2sm172100975ad.126.2025.10.14.13.07.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Oct 2025 13:07:44 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v2 36/37] target/arm: Implement TLBIP VA{L}E3{IS,OS}
Date: Tue, 14 Oct 2025 13:07:17 -0700
Message-ID: <20251014200718.422022-37-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251014200718.422022-1-richard.henderson@linaro.org>
References: <20251014200718.422022-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x435.google.com
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
 target/arm/tcg/tlb-insns.c | 35 +++++++++++++++++++++++++++--------
 1 file changed, 27 insertions(+), 8 deletions(-)

diff --git a/target/arm/tcg/tlb-insns.c b/target/arm/tcg/tlb-insns.c
index ea2b56e245..2b76ea077f 100644
--- a/target/arm/tcg/tlb-insns.c
+++ b/target/arm/tcg/tlb-insns.c
@@ -540,6 +540,17 @@ static void tlbi_aa64_vae3is_write(CPUARMState *env, const ARMCPRegInfo *ri,
                                                   vae3_tlbmask(), bits);
 }
 
+static void tlbi_aa64_vae3is_write128(CPUARMState *env, const ARMCPRegInfo *ri,
+                                      uint64_t vallo, uint64_t valhi)
+{
+    CPUState *cs = env_cpu(env);
+    uint64_t pageaddr = extract64(valhi << 12, 0, 56);
+    int bits = tlbbits_for_regime(env, ARMMMUIdx_E3, pageaddr);
+
+    tlb_flush_page_bits_by_mmuidx_all_cpus_synced(cs, pageaddr,
+                                                  ARMMMUIdxBit_E3, bits);
+}
+
 static int ipas2e1_tlbmask(CPUARMState *env, int64_t value)
 {
     /*
@@ -899,12 +910,16 @@ static const ARMCPRegInfo tlbi_el3_cp_reginfo[] = {
       .writefn = tlbi_aa64_alle3is_write },
     { .name = "TLBI_VAE3IS", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 6, .crn = 8, .crm = 3, .opc2 = 1,
-      .access = PL3_W, .type = ARM_CP_NO_RAW | ARM_CP_ADD_TLBI_NXS,
-      .writefn = tlbi_aa64_vae3is_write },
+      .access = PL3_W,
+      .type = ARM_CP_NO_RAW | ARM_CP_ADD_TLBI_NXS | ARM_CP_128BIT,
+      .writefn = tlbi_aa64_vae3is_write,
+      .write128fn = tlbi_aa64_vae3is_write128 },
     { .name = "TLBI_VALE3IS", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 6, .crn = 8, .crm = 3, .opc2 = 5,
-      .access = PL3_W, .type = ARM_CP_NO_RAW | ARM_CP_ADD_TLBI_NXS,
-      .writefn = tlbi_aa64_vae3is_write },
+      .access = PL3_W,
+      .type = ARM_CP_NO_RAW | ARM_CP_ADD_TLBI_NXS | ARM_CP_128BIT,
+      .writefn = tlbi_aa64_vae3is_write,
+      .write128fn = tlbi_aa64_vae3is_write128 },
     { .name = "TLBI_ALLE3", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 6, .crn = 8, .crm = 7, .opc2 = 0,
       .access = PL3_W, .type = ARM_CP_NO_RAW | ARM_CP_ADD_TLBI_NXS,
@@ -1474,12 +1489,16 @@ static const ARMCPRegInfo tlbios_reginfo[] = {
       .writefn = tlbi_aa64_alle3is_write },
     { .name = "TLBI_VAE3OS", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 6, .crn = 8, .crm = 1, .opc2 = 1,
-      .access = PL3_W, .type = ARM_CP_NO_RAW | ARM_CP_ADD_TLBI_NXS,
-      .writefn = tlbi_aa64_vae3is_write },
+      .access = PL3_W,
+      .type = ARM_CP_NO_RAW | ARM_CP_ADD_TLBI_NXS | ARM_CP_128BIT,
+      .writefn = tlbi_aa64_vae3is_write,
+      .write128fn = tlbi_aa64_vae3is_write128 },
     { .name = "TLBI_VALE3OS", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 6, .crn = 8, .crm = 1, .opc2 = 5,
-      .access = PL3_W, .type = ARM_CP_NO_RAW | ARM_CP_ADD_TLBI_NXS,
-      .writefn = tlbi_aa64_vae3is_write },
+      .access = PL3_W,
+      .type = ARM_CP_NO_RAW | ARM_CP_ADD_TLBI_NXS | ARM_CP_128BIT,
+      .writefn = tlbi_aa64_vae3is_write,
+      .write128fn = tlbi_aa64_vae3is_write128 },
 };
 
 static void tlbi_aa64_paall_write(CPUARMState *env, const ARMCPRegInfo *ri,
-- 
2.43.0


