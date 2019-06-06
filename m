Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp4752808wrg;
        Thu, 6 Jun 2019 10:52:21 -0700 (PDT)
X-Google-Smtp-Source: APXvYqy+4K2nXz0XV4tJE2kP+TeCWrZx3xIMHzH3zGPhSnNBPmwBdxT+4jJpfPBtz/TE50sHCIwm
X-Received: by 2002:ac8:f96:: with SMTP id b22mr41543554qtk.280.1559843541765;
        Thu, 06 Jun 2019 10:52:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1559843541; cv=none;
        d=google.com; s=arc-20160816;
        b=PhU4JYmfhTdgYUzOVPZLTcBXcCbWWeF5Q1ASyQGX+ni/vI+Urg6nhskQzFdHFyd668
         bmppMertG/yYNIi0HCb7z04EqPjkKe0h46hi93LnA4QcYDdOBtGEdyFjCUaJSTsLr9C4
         tDcF2eeeoYMk4cD2It4nDY1Ym9l84yKc/bmWiwi0zmGBR+JGT0dqYRfhXsffYqGZZLu/
         V4RI19OGzIT9QhDEo0h+VuJgBVk/rQCbRlDopqEPUSPo7nBRSm+Y7eoO3o/3SefDpuy3
         Mrn2wVSfWRvhPCAI6H7M7+fhykrbPF6tRU9J8BDzzGXz6vhCPT3iFer9cameqkVjd738
         O18w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=fqQD45cISRBPqS8e6LTFUDKMsysfUAaIcXUmuocZRaE=;
        b=sT6yLMd53Xw1bQX9tdFKmdIsC8yTIF12iKvrSW7sliGZN+60gUUqLzEN4XP3A/9ntW
         5lxS7dI868epgSyiy5raqankv2v6dFqMLEPt1M7G99RhEBGy2OiMFlNvae2j8V1zSTJG
         YxPDTPtmOsVs/dfKRfHyP3ObvPmoweBKZ5Hb+dCYVh4iQVpt0DVawdxNFK+TGHRpAeL5
         AqvCw/DV/xs+3yUp8tPRNtsy0Iihqy59HeCrKdmUyYTka7nIXz4lHa7WsFtH+7mM8Htb
         douWhIr99GPnINsuLUf2HPY5GHQ3NNvuu8dvMt+ZwMZPqU0+PkuyI/KRcQ/zwVnFyFO1
         BbSg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=nkQYzNXN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s20si2629601qth.393.2019.06.06.10.52.21
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 06 Jun 2019 10:52:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=nkQYzNXN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:35942 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hYwYn-0000Ui-7r
	for alex.bennee@linaro.org; Thu, 06 Jun 2019 13:52:21 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44413)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hYwTo-00047i-Fg
	for qemu-arm@nongnu.org; Thu, 06 Jun 2019 13:47:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hYwTl-0003az-5n
	for qemu-arm@nongnu.org; Thu, 06 Jun 2019 13:47:11 -0400
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:44657)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1hYwTj-0003Ky-GA
	for qemu-arm@nongnu.org; Thu, 06 Jun 2019 13:47:07 -0400
Received: by mail-wr1-x442.google.com with SMTP id b17so2237625wrq.11
	for <qemu-arm@nongnu.org>; Thu, 06 Jun 2019 10:46:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=fqQD45cISRBPqS8e6LTFUDKMsysfUAaIcXUmuocZRaE=;
	b=nkQYzNXNHDbWLrVXlPKFKH8LPdS9LPj+vnqLLyPUAAlocrmVHkUs+kd129b+gxnOE8
	BLfekcL4snvSKQVCkmzUKg0tYbnl6Cpyud01MJhGGJU8FuofNs1uTBgMuq/ROFmiJTdG
	WlYrkeDDOqaGQT374lN1X3AbCFsGOIetX29DbVAq2NypysWNp79jM0/Wn48kk8fJUj9Y
	Hmee2K90jE85soQnje5kP6RcLJWAQuzRQVI82PPzB7AqJytHt6UivCLmA5qh82TWQjEw
	Vxx0bYzW36jxRbYElZO4PnfhQvx/gdVoAcPBtVakfpYvibz2Df7zFE3CwgaCHOmoSIbV
	orng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=fqQD45cISRBPqS8e6LTFUDKMsysfUAaIcXUmuocZRaE=;
	b=Wjh83nhmV/bPoTc0aH+IMoXr3UzLvCYXSva/7tkxutYfP967GtMEojyB/aPnLsKJKZ
	8pZfRcp7URrBaGdPZsCDFDrubvxkXQLTjjbCStjjlkizIu5wMAeDFTD9GbbugpPmV/MO
	uYLD0pVoo5TcKr89bbnFPTIgpl0Upv0oMJxOo9sQLlTk/ZVTKjqvJenrrv36J3CfE1Ae
	LZtYwY03x5mcvLOj2GApW8oyuIPtVLBhFmSn5xpFHSsH7DbavzonBOhxLdOib191VpWt
	NkoeP4HeDz7Z1uAsBX3ocdfjBOgqphfve9glagKBG5C2L+omnCPmNRMJSmN1cCmpJUx2
	wmsw==
X-Gm-Message-State: APjAAAUVgf4OWUL46KPUJC7d5XEO50BDZ5J/Oj1hGuAE2XHLQotjHcd5
	3m14gtL1Yc6arwuKggX61Sx/SEn8Nr46Hw==
X-Received: by 2002:a5d:4603:: with SMTP id t3mr7683795wrq.315.1559843212359; 
	Thu, 06 Jun 2019 10:46:52 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
	by smtp.gmail.com with ESMTPSA id
	z135sm2596784wmc.45.2019.06.06.10.46.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 06 Jun 2019 10:46:51 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Thu,  6 Jun 2019 18:46:04 +0100
Message-Id: <20190606174609.20487-38-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190606174609.20487-1-peter.maydell@linaro.org>
References: <20190606174609.20487-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::442
Subject: [Qemu-arm] [PATCH 37/42] target/arm: Convert double-single
 precision conversion insns to decodetree
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ERCPVnGMAs/f

Convert the VCVT double/single precision conversion insns to decodetree.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-vfp.inc.c | 48 ++++++++++++++++++++++++++++++++++
 target/arm/translate.c         | 13 +--------
 target/arm/vfp.decode          |  6 +++++
 3 files changed, 55 insertions(+), 12 deletions(-)

diff --git a/target/arm/translate-vfp.inc.c b/target/arm/translate-vfp.inc.c
index 5768be40c3e..c4bf1249ee7 100644
--- a/target/arm/translate-vfp.inc.c
+++ b/target/arm/translate-vfp.inc.c
@@ -2312,3 +2312,51 @@ static bool trans_VRINTX_dp(DisasContext *s, arg_VRINTX_dp *a)
     tcg_temp_free_i64(tmp);
     return true;
 }
+
+static bool trans_VCVT_sp(DisasContext *s, arg_VCVT_sp *a)
+{
+    TCGv_i64 vd;
+    TCGv_i32 vm;
+
+    /* UNDEF accesses to D16-D31 if they don't exist. */
+    if (!dc_isar_feature(aa32_fp_d32, s) && (a->vd & 0x10)) {
+        return false;
+    }
+
+    if (!vfp_access_check(s)) {
+        return true;
+    }
+
+    vm = tcg_temp_new_i32();
+    vd = tcg_temp_new_i64();
+    neon_load_reg32(vm, a->vm);
+    gen_helper_vfp_fcvtds(vd, vm, cpu_env);
+    neon_store_reg64(vd, a->vd);
+    tcg_temp_free_i32(vm);
+    tcg_temp_free_i64(vd);
+    return true;
+}
+
+static bool trans_VCVT_dp(DisasContext *s, arg_VCVT_dp *a)
+{
+    TCGv_i64 vm;
+    TCGv_i32 vd;
+
+    /* UNDEF accesses to D16-D31 if they don't exist. */
+    if (!dc_isar_feature(aa32_fp_d32, s) && (a->vm & 0x10)) {
+        return false;
+    }
+
+    if (!vfp_access_check(s)) {
+        return true;
+    }
+
+    vd = tcg_temp_new_i32();
+    vm = tcg_temp_new_i64();
+    neon_load_reg64(vm, a->vm);
+    gen_helper_vfp_fcvtsd(vd, vm, cpu_env);
+    neon_store_reg32(vd, a->vd);
+    tcg_temp_free_i32(vd);
+    tcg_temp_free_i64(vm);
+    return true;
+}
diff --git a/target/arm/translate.c b/target/arm/translate.c
index e7831bf8abb..2902bb7488e 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -3050,7 +3050,7 @@ static int disas_vfp_insn(DisasContext *s, uint32_t insn)
                 return 1;
             case 15:
                 switch (rn) {
-                case 0 ... 14:
+                case 0 ... 15:
                     /* Already handled by decodetree */
                     return 1;
                 default:
@@ -3063,10 +3063,6 @@ static int disas_vfp_insn(DisasContext *s, uint32_t insn)
             if (op == 15) {
                 /* rn is opcode, encoded as per VFP_SREG_N. */
                 switch (rn) {
-                case 0x0f: /* vcvt double<->single */
-                    rd_is_dp = !dp;
-                    break;
-
                 case 0x10: /* vcvt.fxx.u32 */
                 case 0x11: /* vcvt.fxx.s32 */
                     rm_is_dp = false;
@@ -3185,13 +3181,6 @@ static int disas_vfp_insn(DisasContext *s, uint32_t insn)
                 switch (op) {
                 case 15: /* extension space */
                     switch (rn) {
-                    case 15: /* single<->double conversion */
-                        if (dp) {
-                            gen_helper_vfp_fcvtsd(cpu_F0s, cpu_F0d, cpu_env);
-                        } else {
-                            gen_helper_vfp_fcvtds(cpu_F0d, cpu_F0s, cpu_env);
-                        }
-                        break;
                     case 16: /* fuito */
                         gen_vfp_uito(dp, 0);
                         break;
diff --git a/target/arm/vfp.decode b/target/arm/vfp.decode
index 9942d2ae7ad..56b8b4e6046 100644
--- a/target/arm/vfp.decode
+++ b/target/arm/vfp.decode
@@ -208,3 +208,9 @@ VRINTX_sp    ---- 1110 1.11 0111 .... 1010 01.0 .... \
              vd=%vd_sp vm=%vm_sp
 VRINTX_dp    ---- 1110 1.11 0111 .... 1011 01.0 .... \
              vd=%vd_dp vm=%vm_dp
+
+# VCVT between single and double: Vm precision depends on size; Vd is its reverse
+VCVT_sp      ---- 1110 1.11 0111 .... 1010 11.0 .... \
+             vd=%vd_dp vm=%vm_sp
+VCVT_dp      ---- 1110 1.11 0111 .... 1011 11.0 .... \
+             vd=%vd_sp vm=%vm_dp
-- 
2.20.1

