Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp4202414wrg;
        Tue, 11 Jun 2019 03:59:47 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwMWABU6eSujzr99xat9b+OFi7cztRh6T360dFcIHYXCZY9heC7r6D8Q+u7XZAaEKz9CrHE
X-Received: by 2002:a05:620a:119a:: with SMTP id b26mr40669432qkk.332.1560250786922;
        Tue, 11 Jun 2019 03:59:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560250786; cv=none;
        d=google.com; s=arc-20160816;
        b=SD/dZSkzxZcs1DZLPgzLyhK4K7Z8jgasNE2y/d8+gIrz0XRHS8DEelrny+33iY6JuE
         w6CYJokR18GiV1fNzQ/r7yKw80EOk+FeAXCY+gXQ2YlntVnm1rpuMhP+p1h+B5/h8Z8K
         9uHzbf9eFE/DJzK61DFjngqb8xHQ+nryKA0HUdBhxrPozw7IZHQmyLKVvMKrJFCHyRnd
         +aHvrSPbC7a5ZPkxB6GxlJXPVLEqnf0ZDGPFjfCscv58+9asJRWRBk7p6v4Y9G7WVPC3
         72B3Xx24CaHntMsIi9/eIa4kq4B5G3H4BMYVFv09LO0y7uZfcg1fSN6y6QLtexfYDT8Z
         VpLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=JD4GO8F9aylwZA/zvoGNYNDsDGK74aumUd+PDKM7Pbc=;
        b=TPdR+krcDFWzdh0UJ3lw8FKIkhBxs7I7djfhLK4ajgswuIeYcm05mujCIS3ex0NBMJ
         tOEM23JRdP/UWjkX2Fgq3DDkKLtI5OuCbf7+c9CCQQVdliDB7GfolqpOTMSW0VlAXMGz
         fc0TQsTwFim3Yg6v3akneym8cVKJbK5GtRwvchFSper8LPDWZyNCXlH0raR6Qd4TQXC9
         F8ZgIQRPae0Hd9GxtLUtASEdCzi5KTqMGENZiphZyBHm5Cg+VB+QFLb/3V0gKfWH1KXT
         aoklEzOzstWg0WgdsmPUbJdcYhbNj+Th0awXPMBmqJwSiSZ5xZn/N1DmDOwlwOHA7A2+
         2NNg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=CWuiyj6v;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i31si6650128qvi.180.2019.06.11.03.59.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 11 Jun 2019 03:59:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=CWuiyj6v;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56210 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1haeVG-0004cF-En
	for alex.bennee@linaro.org; Tue, 11 Jun 2019 06:59:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39131)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1haePu-0007EJ-UA
 for qemu-arm@nongnu.org; Tue, 11 Jun 2019 06:54:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1haePs-0007Pl-8w
 for qemu-arm@nongnu.org; Tue, 11 Jun 2019 06:54:14 -0400
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:42829)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1haePr-0007Md-MT
 for qemu-arm@nongnu.org; Tue, 11 Jun 2019 06:54:11 -0400
Received: by mail-wr1-x444.google.com with SMTP id x17so12456697wrl.9
 for <qemu-arm@nongnu.org>; Tue, 11 Jun 2019 03:54:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JD4GO8F9aylwZA/zvoGNYNDsDGK74aumUd+PDKM7Pbc=;
 b=CWuiyj6vGqzaoYGguLMq8hLrRJ+JSgRtxxOhh5fbGudlG4+ClHm2Kx8ozTRh4WQIi2
 +MBuTf0nEhwxNPqQeLsywME5mAXax8XWrvelYVVeF2rDAQXQg+BAlfCfDQkhXoEJYNSP
 zeorXa8sb56AItT79QilDjmvU2ecs0Wj8dIKdV/YOBbDPpsVUtwNLrqb4yq9IcuiQeX+
 kgZXvqGplT+I598216NBuR7rkiY566TfTrs87d77xb6Ob39+tR9PkvrLaEXLvffo10ks
 JcHVkWBLyL2SjD7ZperMwKNYX4CZorHVM7Usu8yXElBktxPdn2xhvGUSGdCTFynnef5d
 pHZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JD4GO8F9aylwZA/zvoGNYNDsDGK74aumUd+PDKM7Pbc=;
 b=TyuziPYg8GCAE3rhCC0+rGmvrEhz7/jdiPNsnVmqFcl2Ad5rlwJXHgHK/nzlYEaECt
 zNdIbyS7crK5aipTaDj1ForVZ5LPX9iOhmw6yuHE5sBkpWyhAAf7TjowiR/uhGSkZCyA
 U0oURJLXbDBUTxrk8k/An50KST7hS/TkoPM7ih9w7Ugx0/hGGgOnymmKLeKJB3YfXyjb
 rnbQZZyvnI5hNUBM1naYuam+zFM5A/cGT8OVvfClTDGCP3/Wvb41Hggx2XPSX4z6F/wi
 2tDI9b7d2aV+1h6vk9JiXCT3ZerGi5GzzS5WekcjSWVH9zvMEAFoeKOx5trk+1cVLJwd
 lEfg==
X-Gm-Message-State: APjAAAUEXMTUtcDnTw/aED4ts7t+BE2+umGG/agwq6bGKK1si3LXTaOO
 qYtOdLl1n4NpfrhPM/LIyBEgxFCKwivHxg==
X-Received: by 2002:adf:9dcc:: with SMTP id q12mr24218921wre.93.1560250448751; 
 Tue, 11 Jun 2019 03:54:08 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id e17sm10785945wrt.95.2019.06.11.03.54.07
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 11 Jun 2019 03:54:08 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue, 11 Jun 2019 11:53:23 +0100
Message-Id: <20190611105351.9871-15-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190611105351.9871-1-peter.maydell@linaro.org>
References: <20190611105351.9871-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::444
Subject: [Qemu-arm] [PATCH v2 14/42] target/arm: Convert VFP two-register
 transfer insns to decodetree
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: TbQz/L53yMJe

Convert the VFP two-register transfer instructions to decodetree
(in the v8 Arm ARM these are the "Advanced SIMD and floating-point
64-bit move" encoding group).

Again, we expand out the sequences involving gen_vfp_msr() and
gen_msr_vfp().

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-vfp.inc.c | 70 ++++++++++++++++++++++++++++++++++
 target/arm/translate.c         | 46 +---------------------
 target/arm/vfp.decode          |  5 +++
 3 files changed, 77 insertions(+), 44 deletions(-)

diff --git a/target/arm/translate-vfp.inc.c b/target/arm/translate-vfp.inc.c
index 74c10f9024b..5f081221b83 100644
--- a/target/arm/translate-vfp.inc.c
+++ b/target/arm/translate-vfp.inc.c
@@ -783,3 +783,73 @@ static bool trans_VMOV_single(DisasContext *s, arg_VMOV_single *a)
 
     return true;
 }
+
+static bool trans_VMOV_64_sp(DisasContext *s, arg_VMOV_64_sp *a)
+{
+    TCGv_i32 tmp;
+
+    /*
+     * VMOV between two general-purpose registers and two single precision
+     * floating point registers
+     */
+    if (!vfp_access_check(s)) {
+        return true;
+    }
+
+    if (a->op) {
+        /* fpreg to gpreg */
+        tmp = tcg_temp_new_i32();
+        neon_load_reg32(tmp, a->vm);
+        store_reg(s, a->rt, tmp);
+        tmp = tcg_temp_new_i32();
+        neon_load_reg32(tmp, a->vm + 1);
+        store_reg(s, a->rt2, tmp);
+    } else {
+        /* gpreg to fpreg */
+        tmp = load_reg(s, a->rt);
+        neon_store_reg32(tmp, a->vm);
+        tmp = load_reg(s, a->rt2);
+        neon_store_reg32(tmp, a->vm + 1);
+    }
+
+    return true;
+}
+
+static bool trans_VMOV_64_dp(DisasContext *s, arg_VMOV_64_sp *a)
+{
+    TCGv_i32 tmp;
+
+    /*
+     * VMOV between two general-purpose registers and one double precision
+     * floating point register
+     */
+
+    /* UNDEF accesses to D16-D31 if they don't exist */
+    if (!dc_isar_feature(aa32_fp_d32, s) && (a->vm & 0x10)) {
+        return false;
+    }
+
+    if (!vfp_access_check(s)) {
+        return true;
+    }
+
+    if (a->op) {
+        /* fpreg to gpreg */
+        tmp = tcg_temp_new_i32();
+        neon_load_reg32(tmp, a->vm * 2);
+        store_reg(s, a->rt, tmp);
+        tmp = tcg_temp_new_i32();
+        neon_load_reg32(tmp, a->vm * 2 + 1);
+        store_reg(s, a->rt2, tmp);
+    } else {
+        /* gpreg to fpreg */
+        tmp = load_reg(s, a->rt);
+        neon_store_reg32(tmp, a->vm * 2);
+        tcg_temp_free_i32(tmp);
+        tmp = load_reg(s, a->rt2);
+        neon_store_reg32(tmp, a->vm * 2 + 1);
+        tcg_temp_free_i32(tmp);
+    }
+
+    return true;
+}
diff --git a/target/arm/translate.c b/target/arm/translate.c
index cbb86a49213..d2dced7c45a 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -3703,50 +3703,8 @@ static int disas_vfp_insn(DisasContext *s, uint32_t insn)
     case 0xc:
     case 0xd:
         if ((insn & 0x03e00000) == 0x00400000) {
-            /* two-register transfer */
-            rn = (insn >> 16) & 0xf;
-            rd = (insn >> 12) & 0xf;
-            if (dp) {
-                VFP_DREG_M(rm, insn);
-            } else {
-                rm = VFP_SREG_M(insn);
-            }
-
-            if (insn & ARM_CP_RW_BIT) {
-                /* vfp->arm */
-                if (dp) {
-                    gen_mov_F0_vreg(0, rm * 2);
-                    tmp = gen_vfp_mrs();
-                    store_reg(s, rd, tmp);
-                    gen_mov_F0_vreg(0, rm * 2 + 1);
-                    tmp = gen_vfp_mrs();
-                    store_reg(s, rn, tmp);
-                } else {
-                    gen_mov_F0_vreg(0, rm);
-                    tmp = gen_vfp_mrs();
-                    store_reg(s, rd, tmp);
-                    gen_mov_F0_vreg(0, rm + 1);
-                    tmp = gen_vfp_mrs();
-                    store_reg(s, rn, tmp);
-                }
-            } else {
-                /* arm->vfp */
-                if (dp) {
-                    tmp = load_reg(s, rd);
-                    gen_vfp_msr(tmp);
-                    gen_mov_vreg_F0(0, rm * 2);
-                    tmp = load_reg(s, rn);
-                    gen_vfp_msr(tmp);
-                    gen_mov_vreg_F0(0, rm * 2 + 1);
-                } else {
-                    tmp = load_reg(s, rd);
-                    gen_vfp_msr(tmp);
-                    gen_mov_vreg_F0(0, rm);
-                    tmp = load_reg(s, rn);
-                    gen_vfp_msr(tmp);
-                    gen_mov_vreg_F0(0, rm + 1);
-                }
-            }
+            /* Already handled by decodetree */
+            return 1;
         } else {
             /* Load/store */
             rn = (insn >> 16) & 0xf;
diff --git a/target/arm/vfp.decode b/target/arm/vfp.decode
index bb7de403df3..134f1c9ef58 100644
--- a/target/arm/vfp.decode
+++ b/target/arm/vfp.decode
@@ -66,3 +66,8 @@ VDUP         ---- 1110 1 b:1 q:1 0 .... rt:4 1011 . 0 e:1 1 0000 \
 VMSR_VMRS    ---- 1110 111 l:1 reg:4 rt:4 1010 0001 0000
 VMOV_single  ---- 1110 000 l:1 .... rt:4 1010 . 001 0000 \
              vn=%vn_sp
+
+VMOV_64_sp   ---- 1100 010 op:1 rt2:4 rt:4 1010 00.1 .... \
+             vm=%vm_sp
+VMOV_64_dp   ---- 1100 010 op:1 rt2:4 rt:4 1011 00.1 .... \
+             vm=%vm_dp
-- 
2.20.1

