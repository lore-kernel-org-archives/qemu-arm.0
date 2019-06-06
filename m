Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp4753411wrg;
        Thu, 6 Jun 2019 10:53:05 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwACahP2HXx25zH1Xgh65kk2xlAuKIfA8fn4OmJIYCkz2vgKm+LkdlBlq9pERlHzk2mKxGe
X-Received: by 2002:aed:20c7:: with SMTP id 65mr7211388qtb.392.1559843585581;
        Thu, 06 Jun 2019 10:53:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1559843585; cv=none;
        d=google.com; s=arc-20160816;
        b=su9axNC+NWjaagTVGdHMckDaAc5PaKMJDZ2+BDVfz8DSWKOmSL9q0Dn0erey86sz4v
         Ju+1fISmHcnHez+7ZSehwBBEu2tYbqh/xg6+UW/wa5CaTSe1ERHbSRA7GIWwAhBcRpfZ
         siMSbG5sENhPGO6qZAIfSfKqW3zqe3qOO+n0iOP93ar5E1wRW2xb40WbSVXEYD1YCrKI
         L2VzuWoOAWDko8S7piNglJDQNXTrLgcFOEddH8OO3urqS1QHFLKyyxOAptoChGfyIg7M
         4nwPEzkqnHdXkommTjn5II1LTh3uguSwsN0GBCe0KTszMzd9AvYaZ7svOOB59m4X4Sml
         1mYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=SqWr88JmOAGI6frdEkmtZ44krQlgsO0nSdjyrz4VGyg=;
        b=PzGk47plYHi2dAfbCpw6ap314Q6s8BI2Tzhgz089JdHRhg8JPkRIcZW3E+8nmt2FS2
         1VyMVdids8jX3TiFqRn4Wrr/sJx3fK0TE83UpT6+Foyf+JYeCVL/Rq5Sfi0kHMdxw6no
         o8r1QJzQhQbfvnkyqzPBbp2VAyDCNlE1O9+noBQxRNVGPCirHnTxwm3Vgiy+osLjSMVu
         347sUgOZZEuHPUB1Pf3JKBptmiZrzNSOCPuxUaY2I6zEt8/Q8KzxiDYmCoD0spVmKrXF
         BqopcU0h0q/HXSxWpGpGRDqYwMoFYMLJhv4ipIejD7x41teoZySeflzO+HRPIgh3CGPm
         IRMQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Zz61whG9;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z34si2446292qve.96.2019.06.06.10.53.05
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 06 Jun 2019 10:53:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Zz61whG9;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:35950 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hYwZV-0000zo-4B
	for alex.bennee@linaro.org; Thu, 06 Jun 2019 13:53:05 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44406)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hYwTo-00047U-9I
	for qemu-devel@nongnu.org; Thu, 06 Jun 2019 13:47:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hYwTl-0003bE-6M
	for qemu-devel@nongnu.org; Thu, 06 Jun 2019 13:47:10 -0400
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:43856)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1hYwTj-0002yu-GF
	for qemu-devel@nongnu.org; Thu, 06 Jun 2019 13:47:08 -0400
Received: by mail-wr1-x442.google.com with SMTP id r18so3318944wrm.10
	for <qemu-devel@nongnu.org>; Thu, 06 Jun 2019 10:46:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=SqWr88JmOAGI6frdEkmtZ44krQlgsO0nSdjyrz4VGyg=;
	b=Zz61whG9O7K9HTb414mdrU89nSEyewjhCilA30j+pdjTslp1Vog/Uu+q/kTfsZ3JgY
	a1m3LHESmS9Uakee8rwobhWsHi3iwmOIOUDyEWvIT9Vkv1Jnga1prUPzThdSSwD+vOUW
	otU0yMdx04wwRLI4lJ5PRZLlwy/8Jtz2DMeVeQmVpLYS2gYTiWg8AGgUMKarFEXV0iDf
	aoztRMAk7+2G3ZOTEfin3vsc3iC0DnBnNARGX57JSV1hj8WkMVWaY7QmXMtqhYaZzzn5
	tDqGjEfRI54EWzVSAjKTqXn8UTPdYcA4Y/eOtUBkGpGE3ykJuwp3dHqGZoYBqclWRRkN
	8ogw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=SqWr88JmOAGI6frdEkmtZ44krQlgsO0nSdjyrz4VGyg=;
	b=YqGsu7rbXwzXCNxXKVz8kluzuzvVHAyx36KF4kHMm9vIKmOvcvMtZyzVjNmSCarNYj
	2qvKljfQyC00c51hGc1iKAjpfJLkMDn4vm8dhYYeA0Q8bH23fX8ZUiDtO1khbeXVvcQl
	tuFpaw0Aun4oKzSjbDsRw5EX8yN1AksHfZ14z/Ap/tdSmHcMNVpPGyg9Ly8V634jLKNE
	HZSJqkTYFyzFjEyscSvTbkCxvVLWpI4dGxSlCerkksnH3k9fh/DM4x4rlY9ifKCmjZ5e
	DbQ8ry0BPAiuuJOgrIKpW+sUWr2/MRfr9oMVqW77jhy2M41mGHtT316jGliOlwqxVBXY
	byQg==
X-Gm-Message-State: APjAAAV2OAC7XDJirojg0sR79vfSUOXD7JQeitsZvU9202xR1WpOMZxw
	jVjoEJf9kmwyxD0iQEmQhjomcQ==
X-Received: by 2002:a5d:4b49:: with SMTP id w9mr6084238wrs.113.1559843187147; 
	Thu, 06 Jun 2019 10:46:27 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
	by smtp.gmail.com with ESMTPSA id
	z135sm2596784wmc.45.2019.06.06.10.46.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 06 Jun 2019 10:46:26 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Thu,  6 Jun 2019 18:45:41 +0100
Message-Id: <20190606174609.20487-15-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190606174609.20487-1-peter.maydell@linaro.org>
References: <20190606174609.20487-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::442
Subject: [Qemu-devel] [PATCH 14/42] target/arm: Convert VFP two-register
 transfer insns to decodetree
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Cw152xRZ30+v

Convert the VFP two-register transfer instructions to decodetree
(in the v8 Arm ARM these are the "Advanced SIMD and floating-point
64-bit move" encoding group).

Again, we expand out the sequences involving gen_vfp_msr() and
gen_msr_vfp().

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
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
index 6bb0e994cc5..a57d972eaa7 100644
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

