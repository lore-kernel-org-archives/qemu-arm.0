Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp4752517wrg;
        Thu, 6 Jun 2019 10:52:03 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwjuyoiEkwn1RuxJ3wmva6jfogCYZ4cIatqSmsbf++oZ0rgiHL9ZdPp35+xged+6swAchL8
X-Received: by 2002:a0c:96e7:: with SMTP id b36mr2469827qvd.155.1559843523525;
        Thu, 06 Jun 2019 10:52:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1559843523; cv=none;
        d=google.com; s=arc-20160816;
        b=NhecYIQenG3siW0JCkkIWidfye6WxiIIjVvvzPp4A76e6TDk6+c46a58zeIGKiQvFg
         XzXIEwV6i7JWOrCkfvKWMl1petV0fpBUDOTnw7TeB0CKrqzfLDK03ow36KTRwWqCTf1d
         paDSbi26+5c35BPQDBJFj55eqQYlb5JEv1SlHNno/8sTJczDKKDa2uNl8PVzPYblB+x2
         C1cLQEUdeplwEr/kK2KzdIihBbgEBh/cNn7JaQwa6ONsJB0lFYwuXV6T9HKfdUxXdHr3
         CrwprZ1qXhEbr4a1MX6jNVLhCBCZdWjzvXHfaFjdZaVf7WqkorLF9PRsK0iBpfkoPzUk
         g3TA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=B1+wWB3rNTZOHORyna/i52K8oN8xz+ryKjDaxSUmMDA=;
        b=S/3JpgAGl7rbXIM2MQiZpmcJriwETmGIDq/kx16EhSKoJTN3felGZe0ITQBtMwC1uU
         ucJq4T4clV1VVzkWah7XIW+OBMTXvnHTrw/XuWC7dOk3VDBgbYEFDkex3TihAQiZGtZo
         jC86H5JAdwvUDiClW/HwseqCSfIUMkXOB+lZFX4p74Qnr2aDTJ8tkaDRfZGGz7omP1kn
         GoneBVO2z6PwFbQemQhjMEUt29r00TaAdzzqWmc3rnKYa4whUMBNDyYue+G44UeUXDa0
         NUdkVwnLl8r96Gdezp52AUrWwSDO5G/9En2W/HlL7+QhYUujauLPriSTaeKvdPxhjvzH
         L9RA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ecqYYTIQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t8si2372440qtq.119.2019.06.06.10.52.03
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 06 Jun 2019 10:52:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ecqYYTIQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:35940 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hYwYV-00006D-0o
	for alex.bennee@linaro.org; Thu, 06 Jun 2019 13:52:03 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44365)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hYwTm-00045K-9b
	for qemu-arm@nongnu.org; Thu, 06 Jun 2019 13:47:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hYwTj-0003ZL-Gl
	for qemu-arm@nongnu.org; Thu, 06 Jun 2019 13:47:09 -0400
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:34155)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1hYwTj-0003Lk-6z
	for qemu-arm@nongnu.org; Thu, 06 Jun 2019 13:47:07 -0400
Received: by mail-wr1-x441.google.com with SMTP id e16so3357236wrn.1
	for <qemu-arm@nongnu.org>; Thu, 06 Jun 2019 10:46:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=B1+wWB3rNTZOHORyna/i52K8oN8xz+ryKjDaxSUmMDA=;
	b=ecqYYTIQnIUj7UQd/KwDb1Q7NNl45yDpRczzlOxXe96+kym6+CWpNHlhxAATXAGPPY
	HTH0fzH/D70LcofczuEjlPSP1ZtQTF7sp7z6zbLf08RqYUk2nIiefCHLIEcST0/HyoYk
	FJapHVzRAtJIrm/ZkpjwGTNjg+vK1uczHF9iyPZhfOMjbMuYQh1F/xoZ7gwzEwsY04sw
	Zoj6gI7NGUCcdmvQlQHPpCbofqNSFoQeq+rkxjUoxZIEZlD88yJlaihDRu2p5hOxhi+g
	m6FEDiMGvGivOMEJ4uIAEjcDy2d9HxVUND44WntuG7Q01kOqf0jqHb+/xx/n5FbfeRqD
	zWKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=B1+wWB3rNTZOHORyna/i52K8oN8xz+ryKjDaxSUmMDA=;
	b=lD70G4W7+ODlh00GYHTsAT3BbCP+0yQf5L3+BDqabiOIruBZV4cVs9QZlsOk/qndyA
	VUDn7IsbiEHHuBfWGM8FqDKHesiHI1SeLjWcBVcwIHTiymonJ+44porFSo0Rjzrh0R8+
	XJ0XyaVJC2rAv+AP/fwxtDzTGk4zvOPhbkTwhAHedK2x/A1BOA546LGzUmIJRMEWb4l0
	1kdBAF+UBTKLSQZnm19tg9Dhyruhq0lQWYnhfiXV0yjK4g8zN2G1kZx+VuBXzSvXlzBG
	Ca/n5EA1V2h+Lgb5q+tk6iIr5QgbdCCUeduOP7N1Vtfp56ZbEqraIdspITT+gSS3YGeT
	mgoA==
X-Gm-Message-State: APjAAAVpjw1EXnETw6raljl1yONMHRsq6hEZ3s9lpuNl5oXNwGS8Y2HR
	3Lob9Da6F9vX1NisI1ftfClX8h3+VHMmnA==
X-Received: by 2002:a5d:6949:: with SMTP id r9mr15936279wrw.73.1559843213416; 
	Thu, 06 Jun 2019 10:46:53 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
	by smtp.gmail.com with ESMTPSA id
	z135sm2596784wmc.45.2019.06.06.10.46.52
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 06 Jun 2019 10:46:52 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Thu,  6 Jun 2019 18:46:05 +0100
Message-Id: <20190606174609.20487-39-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190606174609.20487-1-peter.maydell@linaro.org>
References: <20190606174609.20487-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::441
Subject: [Qemu-arm] [PATCH 38/42] target/arm: Convert integer-to-float insns
 to decodetree
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
X-TUID: I751ThnuJBmi

Convert the VCVT integer-to-float instructions to decodetree.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-vfp.inc.c | 58 ++++++++++++++++++++++++++++++++++
 target/arm/translate.c         | 12 +------
 target/arm/vfp.decode          |  6 ++++
 3 files changed, 65 insertions(+), 11 deletions(-)

diff --git a/target/arm/translate-vfp.inc.c b/target/arm/translate-vfp.inc.c
index c4bf1249ee7..e5b5c3cd6a5 100644
--- a/target/arm/translate-vfp.inc.c
+++ b/target/arm/translate-vfp.inc.c
@@ -2360,3 +2360,61 @@ static bool trans_VCVT_dp(DisasContext *s, arg_VCVT_dp *a)
     tcg_temp_free_i64(vm);
     return true;
 }
+
+static bool trans_VCVT_int_sp(DisasContext *s, arg_VCVT_int_sp *a)
+{
+    TCGv_i32 vm;
+    TCGv_ptr fpst;
+
+    if (!vfp_access_check(s)) {
+        return true;
+    }
+
+    vm = tcg_temp_new_i32();
+    neon_load_reg32(vm, a->vm);
+    fpst = get_fpstatus_ptr(false);
+    if (a->s) {
+        /* i32 -> f32 */
+        gen_helper_vfp_sitos(vm, vm, fpst);
+    } else {
+        /* u32 -> f32 */
+        gen_helper_vfp_uitos(vm, vm, fpst);
+    }
+    neon_store_reg32(vm, a->vd);
+    tcg_temp_free_i32(vm);
+    tcg_temp_free_ptr(fpst);
+    return true;
+}
+
+static bool trans_VCVT_int_dp(DisasContext *s, arg_VCVT_int_dp *a)
+{
+    TCGv_i32 vm;
+    TCGv_i64 vd;
+    TCGv_ptr fpst;
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
+    fpst = get_fpstatus_ptr(false);
+    if (a->s) {
+        /* i32 -> f64 */
+        gen_helper_vfp_sitod(vd, vm, fpst);
+    } else {
+        /* u32 -> f64 */
+        gen_helper_vfp_uitod(vd, vm, fpst);
+    }
+    neon_store_reg64(vd, a->vd);
+    tcg_temp_free_i32(vm);
+    tcg_temp_free_i64(vd);
+    tcg_temp_free_ptr(fpst);
+    return true;
+}
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 2902bb7488e..b98f8f103ae 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -3050,7 +3050,7 @@ static int disas_vfp_insn(DisasContext *s, uint32_t insn)
                 return 1;
             case 15:
                 switch (rn) {
-                case 0 ... 15:
+                case 0 ... 17:
                     /* Already handled by decodetree */
                     return 1;
                 default:
@@ -3063,10 +3063,6 @@ static int disas_vfp_insn(DisasContext *s, uint32_t insn)
             if (op == 15) {
                 /* rn is opcode, encoded as per VFP_SREG_N. */
                 switch (rn) {
-                case 0x10: /* vcvt.fxx.u32 */
-                case 0x11: /* vcvt.fxx.s32 */
-                    rm_is_dp = false;
-                    break;
                 case 0x18: /* vcvtr.u32.fxx */
                 case 0x19: /* vcvtz.u32.fxx */
                 case 0x1a: /* vcvtr.s32.fxx */
@@ -3181,12 +3177,6 @@ static int disas_vfp_insn(DisasContext *s, uint32_t insn)
                 switch (op) {
                 case 15: /* extension space */
                     switch (rn) {
-                    case 16: /* fuito */
-                        gen_vfp_uito(dp, 0);
-                        break;
-                    case 17: /* fsito */
-                        gen_vfp_sito(dp, 0);
-                        break;
                     case 19: /* vjcvt */
                         gen_helper_vjcvt(cpu_F0s, cpu_F0d, cpu_env);
                         break;
diff --git a/target/arm/vfp.decode b/target/arm/vfp.decode
index 56b8b4e6046..6da9a7913da 100644
--- a/target/arm/vfp.decode
+++ b/target/arm/vfp.decode
@@ -214,3 +214,9 @@ VCVT_sp      ---- 1110 1.11 0111 .... 1010 11.0 .... \
              vd=%vd_dp vm=%vm_sp
 VCVT_dp      ---- 1110 1.11 0111 .... 1011 11.0 .... \
              vd=%vd_sp vm=%vm_dp
+
+# VCVT from integer to floating point: Vm always single; Vd depends on size
+VCVT_int_sp  ---- 1110 1.11 1000 .... 1010 s:1 1.0 .... \
+             vd=%vd_sp vm=%vm_sp
+VCVT_int_dp  ---- 1110 1.11 1000 .... 1011 s:1 1.0 .... \
+             vd=%vd_dp vm=%vm_sp
-- 
2.20.1

