Received: by 2002:a17:906:43c7:b0:78d:9f02:16a1 with SMTP id j7csp1260415ejn;
        Fri, 28 Oct 2022 06:43:06 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5zyWHlIKU8DqQ+Bm3FLfykvJ2GsTEGKQu0JidhXbX9jd2V9UpE8a5tR78bYrTsAbfB0GMn
X-Received: by 2002:a37:696:0:b0:6f9:78f9:fac2 with SMTP id 144-20020a370696000000b006f978f9fac2mr8883668qkg.255.1666964586256;
        Fri, 28 Oct 2022 06:43:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1666964586; cv=none;
        d=google.com; s=arc-20160816;
        b=dDxlD4ciEMgwV9SW0XXoDoiimWalKt1e1PIn4IU7fCcqZElfjE8r0UD8WSmE51nJ9g
         YGknUW1VxocOOUrQyBH+60DQA5Z4nHMzh3313eL8rJWwN/1nO2cI/3dyLPqWgb4HZGnz
         PW+XkdzxpZWZMaTYZYPTk1xy/ZqstHqa/abZUWtJyoatjXOsop5XOO1jo5OuYbk4Wao+
         tvneQpyPCG0lDdWsTBjr4r3P+xa7LyRbWDe3glM3aTcma+3ZwUVRewD7mT5xXuvwsexB
         o3HJKTM6YjLBZVUtNuIVtHDwVK5uRmnP17iB87FhQ2h3uq7LMf/zRaqg6/XvWuh5rZ7h
         RhJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=errors-to:sender:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=Mt9EnEn6Ha0zSiDllAuOLDMPT9KKkIBQEDSf8mieluU=;
        b=ndz7ClHMpCUX+p7g8q+7FqYa33dHc4skg157K0ZVdR5eSbk0cyUC6ddv48LGfLngYD
         o1GmzBE+OulYRKc38cHFa8ekyQ7szyuj6GXVd4G0sfyBPqP7k6qGg/gdigKxv33ucdX1
         8nYS6meBS77LMTJvtKkxsWrznQjMuwMmVoQxR1I8fSzOCL5cFYT9T3MCOfG/P5VeNy+b
         6FCxoL+E8WX2WbQ3SqMuA4h+8xow956hb+oDeZqLXoT9YOmpijWNoip8XmUmsVpI2W1v
         iCRjFFubCCm1HefleCcLYmrAoNv2cDgSQaeGd5whV23/wMoHKNPaa6N3Qkpp0uAPjlDS
         6YkA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZfatHAtf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y1-20020ac87081000000b0039cdb0e5e41si2193619qto.626.2022.10.28.06.43.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 28 Oct 2022 06:43:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZfatHAtf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ooPcW-0000ms-Px; Fri, 28 Oct 2022 09:42:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ooPap-0008NQ-Cu
 for qemu-arm@nongnu.org; Fri, 28 Oct 2022 09:40:15 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ooPan-0007sG-5h
 for qemu-arm@nongnu.org; Fri, 28 Oct 2022 09:40:14 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 r186-20020a1c44c3000000b003cf4d389c41so3847164wma.3
 for <qemu-arm@nongnu.org>; Fri, 28 Oct 2022 06:40:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Mt9EnEn6Ha0zSiDllAuOLDMPT9KKkIBQEDSf8mieluU=;
 b=ZfatHAtfqlrVceqfAPLrLqzdI/T6otqAPMQdIdUYZVeaqGzmF3OZfZ0HU2g6ak9VLk
 RBImHLmmnP6F5CkXpx68JqbkTFeGMtl3PVqD8RYMCJM4pRPutWZp/eB88sM/wC8vZwQ5
 3CuynWt3ueYx2g9kVN1TlyCbxT0upy4IL3SbnzuaQnr6Tb+/g3YUKUR5+SuiF1Rp7Eqe
 FDNLvng/Qd/pI9cWnT+QiPPyojF3STS/6kMvTYLvOBoF50REnpgBemeeNQxZW8GmX2Fd
 EMLQ18tK3srmjWNiluZc3j0u5l9D+QuTNJg7THaHTZpczjjZOs//2jLuB6HDd0TR5ACk
 BkTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Mt9EnEn6Ha0zSiDllAuOLDMPT9KKkIBQEDSf8mieluU=;
 b=oD5KJ1DzoOUbGbMzSjBlmOEH47SPqGnJ+0+vcaHb1aIZiSqwy1LpODQzBrZhBnBNzh
 GHdt7gK+tXctn+6lnKNE8SnC71VyF3ngNEN3Eda15XR8xHHKUn7/FAlvnU9QsPa02iAS
 T8mF27uWRyxn6NNBjd8j6srwRNtvA0sNiwthgexLRm/WweqhmRBqGpl/LnFVLRT+Kv4C
 OVMJDPJV/6pPkDqgqDcHhqYBefy2daaJwnJ0VJV2Lo7SvJvxJJdtOW58d3/mKpoR8yBq
 oI/n2tpnEJuDjcuKUxa5cCcXunOjyS0cswThtpG6jLrgI/n0qhFTadH5Zm0tVkwM9r9P
 L+6g==
X-Gm-Message-State: ACrzQf3dIH7wkRvFF+PebtljuMXqMl/lAIT+EtPte6zP6BcjPkpgi4vZ
 nqDDSMbrO5SFJfjG0WazT+Va4NSJFS29Lw==
X-Received: by 2002:a1c:ac81:0:b0:3c6:e566:cc21 with SMTP id
 v123-20020a1cac81000000b003c6e566cc21mr9816670wme.0.1666964410538; 
 Fri, 28 Oct 2022 06:40:10 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 l16-20020a5d4110000000b002365cd93d05sm3572858wrp.102.2022.10.28.06.40.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Oct 2022 06:40:09 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 4/7] target/arm: Implement HCR_EL2.TTLBOS traps
Date: Fri, 28 Oct 2022 14:39:59 +0100
Message-Id: <20221028134002.730598-5-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221028134002.730598-1-peter.maydell@linaro.org>
References: <20221028134002.730598-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x336.google.com
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
Sender: "Qemu-arm" <qemu-arm-bounces@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: BQnuHkF3M/Xr

For FEAT_EVT, the HCR_EL2.TTLBOS bit allows trapping on EL1
use of TLB maintenance instructions that operate on the
outer shareable domain:

TLBI VMALLE1OS, TLBI VAE1OS, TLBI ASIDE1OS,TLBI VAAE1OS,
TLBI VALE1OS, TLBI VAALE1OS, TLBI RVAE1OS, TLBI RVAAE1OS,
TLBI RVALE1OS, and TLBI RVAALE1OS.

(There are no AArch32 outer-shareable TLB maintenance ops.)

Implement the trapping.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c | 33 +++++++++++++++++++++++----------
 1 file changed, 23 insertions(+), 10 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index dcd3af6e7d9..5baa06a0cec 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -373,6 +373,19 @@ static CPAccessResult access_ttlbis(CPUARMState *env, const ARMCPRegInfo *ri,
     return CP_ACCESS_OK;
 }
 
+#ifdef TARGET_AARCH64
+/* Check for traps from EL1 due to HCR_EL2.TTLB or TTLBOS. */
+static CPAccessResult access_ttlbos(CPUARMState *env, const ARMCPRegInfo *ri,
+                                    bool isread)
+{
+    if (arm_current_el(env) == 1 &&
+        (arm_hcr_el2_eff(env) & (HCR_TTLB | HCR_TTLBOS))) {
+        return CP_ACCESS_TRAP_EL2;
+    }
+    return CP_ACCESS_OK;
+}
+#endif
+
 static void dacr_write(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t value)
 {
     ARMCPU *cpu = env_archcpu(env);
@@ -6751,19 +6764,19 @@ static const ARMCPRegInfo tlbirange_reginfo[] = {
       .writefn = tlbi_aa64_rvae1is_write },
     { .name = "TLBI_RVAE1OS", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 0, .crn = 8, .crm = 5, .opc2 = 1,
-      .access = PL1_W, .accessfn = access_ttlb, .type = ARM_CP_NO_RAW,
+      .access = PL1_W, .accessfn = access_ttlbos, .type = ARM_CP_NO_RAW,
       .writefn = tlbi_aa64_rvae1is_write },
     { .name = "TLBI_RVAAE1OS", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 0, .crn = 8, .crm = 5, .opc2 = 3,
-      .access = PL1_W, .accessfn = access_ttlb, .type = ARM_CP_NO_RAW,
+      .access = PL1_W, .accessfn = access_ttlbos, .type = ARM_CP_NO_RAW,
       .writefn = tlbi_aa64_rvae1is_write },
    { .name = "TLBI_RVALE1OS", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 0, .crn = 8, .crm = 5, .opc2 = 5,
-      .access = PL1_W, .accessfn = access_ttlb, .type = ARM_CP_NO_RAW,
+      .access = PL1_W, .accessfn = access_ttlbos, .type = ARM_CP_NO_RAW,
       .writefn = tlbi_aa64_rvae1is_write },
     { .name = "TLBI_RVAALE1OS", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 0, .crn = 8, .crm = 5, .opc2 = 7,
-      .access = PL1_W, .accessfn = access_ttlb, .type = ARM_CP_NO_RAW,
+      .access = PL1_W, .accessfn = access_ttlbos, .type = ARM_CP_NO_RAW,
       .writefn = tlbi_aa64_rvae1is_write },
     { .name = "TLBI_RVAE1", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 0, .crn = 8, .crm = 6, .opc2 = 1,
@@ -6850,27 +6863,27 @@ static const ARMCPRegInfo tlbirange_reginfo[] = {
 static const ARMCPRegInfo tlbios_reginfo[] = {
     { .name = "TLBI_VMALLE1OS", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 0, .crn = 8, .crm = 1, .opc2 = 0,
-      .access = PL1_W, .accessfn = access_ttlb, .type = ARM_CP_NO_RAW,
+      .access = PL1_W, .accessfn = access_ttlbos, .type = ARM_CP_NO_RAW,
       .writefn = tlbi_aa64_vmalle1is_write },
     { .name = "TLBI_VAE1OS", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 0, .crn = 8, .crm = 1, .opc2 = 1,
-      .access = PL1_W, .accessfn = access_ttlb, .type = ARM_CP_NO_RAW,
+      .access = PL1_W, .accessfn = access_ttlbos, .type = ARM_CP_NO_RAW,
       .writefn = tlbi_aa64_vae1is_write },
     { .name = "TLBI_ASIDE1OS", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 0, .crn = 8, .crm = 1, .opc2 = 2,
-      .access = PL1_W, .accessfn = access_ttlb, .type = ARM_CP_NO_RAW,
+      .access = PL1_W, .accessfn = access_ttlbos, .type = ARM_CP_NO_RAW,
       .writefn = tlbi_aa64_vmalle1is_write },
     { .name = "TLBI_VAAE1OS", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 0, .crn = 8, .crm = 1, .opc2 = 3,
-      .access = PL1_W, .accessfn = access_ttlb, .type = ARM_CP_NO_RAW,
+      .access = PL1_W, .accessfn = access_ttlbos, .type = ARM_CP_NO_RAW,
       .writefn = tlbi_aa64_vae1is_write },
     { .name = "TLBI_VALE1OS", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 0, .crn = 8, .crm = 1, .opc2 = 5,
-      .access = PL1_W, .accessfn = access_ttlb, .type = ARM_CP_NO_RAW,
+      .access = PL1_W, .accessfn = access_ttlbos, .type = ARM_CP_NO_RAW,
       .writefn = tlbi_aa64_vae1is_write },
     { .name = "TLBI_VAALE1OS", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 0, .crn = 8, .crm = 1, .opc2 = 7,
-      .access = PL1_W, .accessfn = access_ttlb, .type = ARM_CP_NO_RAW,
+      .access = PL1_W, .accessfn = access_ttlbos, .type = ARM_CP_NO_RAW,
       .writefn = tlbi_aa64_vae1is_write },
     { .name = "TLBI_ALLE2OS", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 4, .crn = 8, .crm = 1, .opc2 = 0,
-- 
2.25.1

