Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp4769624wrg;
        Thu, 6 Jun 2019 11:08:53 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxZFSj7zEY2BsIzqcYg0S7cn/84T6H+bCKMcxzYlyP0+fdSlWI4/wh/KLRIF1GxxM3NkMHX
X-Received: by 2002:a0c:e751:: with SMTP id g17mr34970896qvn.197.1559844533165;
        Thu, 06 Jun 2019 11:08:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1559844533; cv=none;
        d=google.com; s=arc-20160816;
        b=bmHMadWxcPqrOa6XzrtEDMfaozGGzvPd7ScaYPTTfs+KwdDVCY6ZhZxWNgnO7RSjtX
         MlvdyWPwAZ6hES/0cQV8h6Q9Y1n7uJuYdwFp1xXuuxjGT+CFtMpzvCcQnzj+HilO389G
         pmzx0YCFHDgSKuHKKHk1ZpwqyMUJMbuOYYEDJxPBYxYZ4MdOk112YzFIocDXNccC6VBw
         cKH7D189laAUeq0msOSyisCiRw6NLaV6qqIk2vcEIBsEM5pAQKHGOD+pj/KRlVVi6OFy
         SeEGmePYvER38rcQiJQHF8/bD1Gbz0FauG/4iNEwTnhENWoovffu+SO17c/jZ1KtsJh5
         8/4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=MfHjpfcV8rDRbagZf+maajLYmXP1fuWCMssnWt0JYC0=;
        b=Ry3zeHHhD3ejyl+NxuqBkM7YTvP1pFIWMpb+lYlUbtV771zBqYs55HKbP+qxfSaU63
         QDiTgLhF14hyp1iOEXgJIz22HQftO9nkqBMwp2R43bD2fO6LsOr/yJv2gtw5zFxWoBDj
         1yeTGehufnN37bcDLB4lhA/2/uVbK1nfQ8L4n2bHmgPf1sS5bhBxxfvYAeHzEIHyj2z8
         zKnxWtSmwkQcPQYqNdSAe0uuViZrVNwrMxKAIhbKiid/nuHTqfF3V4njgz6P6v4x4XTM
         hmxH9I5l8Oc/M0mXbo6NErrarZv/ozHnh6rnKj0AUn5q5xk/4muOUgdufVTqMeyFuJSP
         KwwA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=yTg68Oce;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h40si1126527qta.172.2019.06.06.11.08.53
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 06 Jun 2019 11:08:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=yTg68Oce;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:36242 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hYwom-0000hg-II
	for alex.bennee@linaro.org; Thu, 06 Jun 2019 14:08:52 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44958)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hYwU9-0004W0-3O
	for qemu-arm@nongnu.org; Thu, 06 Jun 2019 13:47:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hYwU7-0004At-1b
	for qemu-arm@nongnu.org; Thu, 06 Jun 2019 13:47:33 -0400
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:41004)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1hYwU6-0002rJ-KM
	for qemu-arm@nongnu.org; Thu, 06 Jun 2019 13:47:30 -0400
Received: by mail-wr1-x444.google.com with SMTP id c2so3325850wrm.8
	for <qemu-arm@nongnu.org>; Thu, 06 Jun 2019 10:46:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=MfHjpfcV8rDRbagZf+maajLYmXP1fuWCMssnWt0JYC0=;
	b=yTg68OceOZ38PgiDkMW5TtwPXHzi65k/HC4f8vFpSstOQMU3uB75wWeANhx4ukGQ6e
	7M1U48n8ZH29oHS2U1aRF4yuAbqPjzN7veq65Cxhq94CRMcaitGMm8vVpkNfpbijb1X6
	ZxEPULqE1Kf36LgAhugozeyYEWYX/oXlHakwUUtdVGEhPrNpzo9P9YKFHDuwTM2pDD5+
	IoIDbVqtRT0rBmnUVa88Dk5SQk/cui4LRD79p8HgJuTFLKnc+ptV8B2EvS0JquU+yEtH
	ke1ljXj385TQjdKVr4sA8vGe8JUlLh5PyVR903T4cZdABZrYOw3efCm98JG/pZCPShdW
	w5cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=MfHjpfcV8rDRbagZf+maajLYmXP1fuWCMssnWt0JYC0=;
	b=tTS+Ws2LgmaSBwJyDtNgO29e4exRSWlN38nq0J1otEeEQn+tEmzYmSLK88UwddPajv
	zMYsLBr5vmYtHEdqv9ojVsF7hdGTIQiXuUM9C1WQb5tBSwHL7NOxxv3u0J7b6BVoBa/h
	OpbtZItpfU1KF/G/OBJlgbAhGUfO7BvOFNGwVXP5+urOUGV6Hkt6vsD/ObMKJlSBViEG
	Zdkb+61oMBEn031VK4XbHUxV8n7a4nDSHDeHzc1qRcGjgy4a066D+F6sbmhv5tSkOCkM
	dSJdve/ZZ9GoDvPE6lHnlCVWZO/3oZyY0d5zwyyHD0CLBzWRFwUND7Tcx8ld2/nAz8mb
	i//g==
X-Gm-Message-State: APjAAAVbvs9qen/Gso1XAGlW/Ru1r74GSEDTGv40Olv9fH/MaYbogmWM
	04YT+w6PaPGZrDbOyrlt3f8vu6IV+hXuDA==
X-Received: by 2002:adf:db12:: with SMTP id s18mr6005707wri.335.1559843179086; 
	Thu, 06 Jun 2019 10:46:19 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
	by smtp.gmail.com with ESMTPSA id
	z135sm2596784wmc.45.2019.06.06.10.46.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 06 Jun 2019 10:46:18 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Thu,  6 Jun 2019 18:45:34 +0100
Message-Id: <20190606174609.20487-8-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190606174609.20487-1-peter.maydell@linaro.org>
References: <20190606174609.20487-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::444
Subject: [Qemu-arm] [PATCH 07/42] target/arm: Convert VMINNM,
 VMAXNM to decodetree
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
X-TUID: EImAAN9Wmj4E

Convert the VMINNM and VMAXNM instructions to decodetree.
As with VSEL, we leave the trans_VMINMAXNM() function
in translate.c for the moment.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate.c       | 41 ++++++++++++++++++++++++------------
 target/arm/vfp-uncond.decode |  5 +++++
 2 files changed, 33 insertions(+), 13 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 50545062195..312ec455c28 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -3202,11 +3202,31 @@ static bool trans_VSEL(DisasContext *s, arg_VSEL *a)
     return true;
 }
 
-static int handle_vminmaxnm(uint32_t insn, uint32_t rd, uint32_t rn,
-                            uint32_t rm, uint32_t dp)
+static bool trans_VMINMAXNM(DisasContext *s, arg_VMINMAXNM *a)
 {
-    uint32_t vmin = extract32(insn, 6, 1);
-    TCGv_ptr fpst = get_fpstatus_ptr(0);
+    uint32_t rd, rn, rm;
+    bool dp = a->dp;
+    bool vmin = a->op;
+    TCGv_ptr fpst;
+
+    if (!dc_isar_feature(aa32_vminmaxnm, s)) {
+        return false;
+    }
+
+    /* UNDEF accesses to D16-D31 if they don't exist */
+    if (dp && !dc_isar_feature(aa32_fp_d32, s) &&
+        ((a->vm | a->vn | a->vd) & 0x10)) {
+        return false;
+    }
+    rd = a->vd;
+    rn = a->vn;
+    rm = a->vm;
+
+    if (!vfp_access_check(s)) {
+        return true;
+    }
+
+    fpst = get_fpstatus_ptr(0);
 
     if (dp) {
         TCGv_i64 frn, frm, dest;
@@ -3247,7 +3267,7 @@ static int handle_vminmaxnm(uint32_t insn, uint32_t rd, uint32_t rn,
     }
 
     tcg_temp_free_ptr(fpst);
-    return 0;
+    return true;
 }
 
 static int handle_vrint(uint32_t insn, uint32_t rd, uint32_t rm, uint32_t dp,
@@ -3359,23 +3379,18 @@ static const uint8_t fp_decode_rm[] = {
 
 static int disas_vfp_misc_insn(DisasContext *s, uint32_t insn)
 {
-    uint32_t rd, rn, rm, dp = extract32(insn, 8, 1);
+    uint32_t rd, rm, dp = extract32(insn, 8, 1);
 
     if (dp) {
         VFP_DREG_D(rd, insn);
-        VFP_DREG_N(rn, insn);
         VFP_DREG_M(rm, insn);
     } else {
         rd = VFP_SREG_D(insn);
-        rn = VFP_SREG_N(insn);
         rm = VFP_SREG_M(insn);
     }
 
-    if ((insn & 0x0fb00e10) == 0x0e800a00 &&
-        dc_isar_feature(aa32_vminmaxnm, s)) {
-        return handle_vminmaxnm(insn, rd, rn, rm, dp);
-    } else if ((insn & 0x0fbc0ed0) == 0x0eb80a40 &&
-               dc_isar_feature(aa32_vrint, s)) {
+    if ((insn & 0x0fbc0ed0) == 0x0eb80a40 &&
+        dc_isar_feature(aa32_vrint, s)) {
         /* VRINTA, VRINTN, VRINTP, VRINTM */
         int rounding = fp_decode_rm[extract32(insn, 16, 2)];
         return handle_vrint(insn, rd, rm, dp, rounding);
diff --git a/target/arm/vfp-uncond.decode b/target/arm/vfp-uncond.decode
index b7f7c27fe86..8ab201fa058 100644
--- a/target/arm/vfp-uncond.decode
+++ b/target/arm/vfp-uncond.decode
@@ -45,3 +45,8 @@ VSEL        1111 1110 0. cc:2 .... .... 1010 .0.0 .... \
             vm=%vm_sp vn=%vn_sp vd=%vd_sp dp=0
 VSEL        1111 1110 0. cc:2 .... .... 1011 .0.0 .... \
             vm=%vm_dp vn=%vn_dp vd=%vd_dp dp=1
+
+VMINMAXNM   1111 1110 1.00 .... .... 1010 . op:1 .0 .... \
+            vm=%vm_sp vn=%vn_sp vd=%vd_sp dp=0
+VMINMAXNM   1111 1110 1.00 .... .... 1011 . op:1 .0 .... \
+            vm=%vm_dp vn=%vn_dp vd=%vd_dp dp=1
-- 
2.20.1

