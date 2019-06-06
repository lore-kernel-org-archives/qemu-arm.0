Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp4753054wrg;
        Thu, 6 Jun 2019 10:52:40 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyHNKsa4tFRgtheTkqsWzi1IwwBIrxENIs8cHFBO/tvQ3mXt3epL48sLxK98Yh7evtSi6aI
X-Received: by 2002:a37:ef03:: with SMTP id j3mr321558qkk.233.1559843560821;
        Thu, 06 Jun 2019 10:52:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1559843560; cv=none;
        d=google.com; s=arc-20160816;
        b=xvye89blXPdiYzvUWVse/yV2GyAJegpOIlwM2VrmORzu/Qj5NAFWzvxwo3RwY3H7mQ
         Oc/AwCY+S1WBoB+WG+D9eofXrMkWY5FWuOuqDFmPbXndgtYTao9Sy91BSSlHHgckXS+f
         wDOsnoRtDzEn9uI8+u4H6azY/WHT+3HUrpnlpY/mX47KsOduGWpE8uJQnFbXDT2FG8P9
         sKb3QIpeHsyDQ0NhxBlEV5T9VNY+oYAIkXMGpFyLy3U7rC0stHxDQN9k4Zw8XzVu21hq
         sy30FeBZ89qlnRcxlpeZjw12BEFgQkqgnAg/t2O7dv0OgLPzZOZTYF+vjTj5rFKT4aj0
         xElg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=GZ0x0o1HQFZ10vVq+O8T2K/nYflpLwHxG+mZSGXfk1c=;
        b=GXQy/ePwHSMbk28X6nDIGoehzwptuwGfIU9N0QpySsNIsZ3OPDiCPw7XpFeUZYzEBQ
         YcGLSEh5BnQJca9EIC11HyHEG6EkSrzn5q57psmTNt8EsuK6x1HIi+s/pA+/KdSTgONt
         BBmlDLwFNjTT9YiPFeWBBdRNfr7/3K84ScHT1nWXjAcSMWM/uDn+k8XIzWxNscJUl5qz
         sp7ovhthh5cZAhhPOKbWQewJUCXUNQBMmi8rw6XuJ7w6BZ/IepmqDRq/FqaSfWtQhrPe
         zjAsPPnwHOSWiKUgRT+DDKXK4Eg+Dq/LWgs2MAVNyMg5vAwqxWyB7TkBnQIdst9vndYW
         UmtQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=F5IQ3U0+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s13si2307987qts.59.2019.06.06.10.52.40
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 06 Jun 2019 10:52:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=F5IQ3U0+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:35946 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hYwZ6-0000kg-4l
	for alex.bennee@linaro.org; Thu, 06 Jun 2019 13:52:40 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44447)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hYwTp-00048x-G5
	for qemu-arm@nongnu.org; Thu, 06 Jun 2019 13:47:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hYwTm-0003bz-9G
	for qemu-arm@nongnu.org; Thu, 06 Jun 2019 13:47:12 -0400
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:33727)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1hYwTk-00034k-3W
	for qemu-arm@nongnu.org; Thu, 06 Jun 2019 13:47:08 -0400
Received: by mail-wr1-x441.google.com with SMTP id n9so3362006wru.0
	for <qemu-arm@nongnu.org>; Thu, 06 Jun 2019 10:46:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=GZ0x0o1HQFZ10vVq+O8T2K/nYflpLwHxG+mZSGXfk1c=;
	b=F5IQ3U0+lGe5a2Qb1CD3+VtqncMm81++cPZHMdGZ2PIiPr7XFvkeUTnGdscifQP/eO
	PrnQlmQtx3DED+z3nP+w/TFZqE2XZuGhGyd1g+5xoZ+AJSOLFIH2uQPvv7fkUqTBINVz
	DVqki0qdRq0vCWPipqtx2KDFHVh7wwfg1G1oP2g192ytetxUdgFcwv1dCfv4M19HBj4b
	vAEQbiBsyXW5hb2cusFy/3YAPtSBgb/ficMlO6e8bM8klE6d1+kdirJc8bg06s9pnqmy
	eSjfXL30lOtiwtrfky+jVGU/vCnsu4nOqpHc9h0ccV5s8NXrMI4XJXR0qz0TKUgOSZwG
	qs9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=GZ0x0o1HQFZ10vVq+O8T2K/nYflpLwHxG+mZSGXfk1c=;
	b=j+9qrbraMEXZU3YsMvc4zQw1fy005IW7z/6h69C/YIXxbu1jvSxvWfaJa6DK7pI9iD
	ek5LCtTsckicLPB3+EZV0Jwcybgub9ev1BrHUYdp358Xy1gKoVln8Aso3CMyUcQPgykW
	lKIYLd2MgFvBYBUnO5APpRuB+3hS/cNAfqYk2jjy66lw0VtTgPFf4jEaaOztExMEdK24
	mHCKkbIYyJipFtTXQNl2LmRYcBYR3FA73rI+uBffQceo/ZmITyQU/2OT0AxUy7/xQQQZ
	BREkyi/OSyvTylUeigb5sFk+qypnsNCGLXvRdUN4oUgkNnyhqj7IVkvqos7nPZQzet7K
	JLWA==
X-Gm-Message-State: APjAAAXwYHrYMl9jwKi72OOx9/IzpbwLCUtcejumATcuL+XpaC0nD+E7
	+xm4t5gx2gSirVNLeoKTUX/J+wuYWTMbTQ==
X-Received: by 2002:adf:8385:: with SMTP id 5mr4068311wre.194.1559843193653;
	Thu, 06 Jun 2019 10:46:33 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
	by smtp.gmail.com with ESMTPSA id
	z135sm2596784wmc.45.2019.06.06.10.46.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 06 Jun 2019 10:46:33 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Thu,  6 Jun 2019 18:45:47 +0100
Message-Id: <20190606174609.20487-21-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190606174609.20487-1-peter.maydell@linaro.org>
References: <20190606174609.20487-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::441
Subject: [Qemu-arm] [PATCH 20/42] target/arm: Convert VFP VNMLS to decodetree
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
X-TUID: D4VyTaIi7Hxj

Convert the VFP VNMLS instruction to decodetree.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-vfp.inc.c | 42 ++++++++++++++++++++++++++++++++++
 target/arm/translate.c         | 24 +------------------
 target/arm/vfp.decode          |  5 ++++
 3 files changed, 48 insertions(+), 23 deletions(-)

diff --git a/target/arm/translate-vfp.inc.c b/target/arm/translate-vfp.inc.c
index 00f64401dda..1d7100debe4 100644
--- a/target/arm/translate-vfp.inc.c
+++ b/target/arm/translate-vfp.inc.c
@@ -1341,3 +1341,45 @@ static bool trans_VMLS_dp(DisasContext *s, arg_VMLS_sp *a)
 {
     return do_vfp_3op_dp(s, gen_VMLS_dp, a->vd, a->vn, a->vm, true);
 }
+
+static void gen_VNMLS_sp(TCGv_i32 vd, TCGv_i32 vn, TCGv_i32 vm, TCGv_ptr fpst)
+{
+    /*
+     * VNMLS: -fd + (fn * fm)
+     * Note that it isn't valid to replace (-A + B) with (B - A) or similar
+     * plausible looking simplifications because this will give wrong results
+     * for NaNs.
+     */
+    TCGv_i32 tmp = tcg_temp_new_i32();
+
+    gen_helper_vfp_muls(tmp, vn, vm, fpst);
+    gen_helper_vfp_negs(vd, vd);
+    gen_helper_vfp_adds(vd, vd, tmp, fpst);
+    tcg_temp_free_i32(tmp);
+}
+
+static bool trans_VNMLS_sp(DisasContext *s, arg_VNMLS_sp *a)
+{
+    return do_vfp_3op_sp(s, gen_VNMLS_sp, a->vd, a->vn, a->vm, true);
+}
+
+static void gen_VNMLS_dp(TCGv_i64 vd, TCGv_i64 vn, TCGv_i64 vm, TCGv_ptr fpst)
+{
+    /*
+     * VNMLS: -fd + (fn * fm)
+     * Note that it isn't valid to replace (-A + B) with (B - A) or similar
+     * plausible looking simplifications because this will give wrong results
+     * for NaNs.
+     */
+    TCGv_i64 tmp = tcg_temp_new_i64();
+
+    gen_helper_vfp_muld(tmp, vn, vm, fpst);
+    gen_helper_vfp_negd(vd, vd);
+    gen_helper_vfp_addd(vd, vd, tmp, fpst);
+    tcg_temp_free_i64(tmp);
+}
+
+static bool trans_VNMLS_dp(DisasContext *s, arg_VNMLS_sp *a)
+{
+    return do_vfp_3op_dp(s, gen_VNMLS_dp, a->vd, a->vn, a->vm, true);
+}
diff --git a/target/arm/translate.c b/target/arm/translate.c
index dc19d8fcab1..bb86c603712 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -1393,18 +1393,6 @@ VFP_OP2(div)
 
 #undef VFP_OP2
 
-static inline void gen_vfp_F1_mul(int dp)
-{
-    /* Like gen_vfp_mul() but put result in F1 */
-    TCGv_ptr fpst = get_fpstatus_ptr(0);
-    if (dp) {
-        gen_helper_vfp_muld(cpu_F1d, cpu_F0d, cpu_F1d, fpst);
-    } else {
-        gen_helper_vfp_muls(cpu_F1s, cpu_F0s, cpu_F1s, fpst);
-    }
-    tcg_temp_free_ptr(fpst);
-}
-
 static inline void gen_vfp_F1_neg(int dp)
 {
     /* Like gen_vfp_neg() but put result in F1 */
@@ -3134,7 +3122,7 @@ static int disas_vfp_insn(DisasContext *s, uint32_t insn)
             rn = VFP_SREG_N(insn);
 
             switch (op) {
-            case 0 ... 1:
+            case 0 ... 2:
                 /* Already handled by decodetree */
                 return 1;
             default:
@@ -3320,16 +3308,6 @@ static int disas_vfp_insn(DisasContext *s, uint32_t insn)
             for (;;) {
                 /* Perform the calculation.  */
                 switch (op) {
-                case 2: /* VNMLS: -fd + (fn * fm) */
-                    /* Note that it isn't valid to replace (-A + B) with (B - A)
-                     * or similar plausible looking simplifications
-                     * because this will give wrong results for NaNs.
-                     */
-                    gen_vfp_F1_mul(dp);
-                    gen_mov_F0_vreg(dp, rd);
-                    gen_vfp_neg(dp);
-                    gen_vfp_add(dp);
-                    break;
                 case 3: /* VNMLA: -fd + -(fn * fm) */
                     gen_vfp_mul(dp);
                     gen_vfp_F1_neg(dp);
diff --git a/target/arm/vfp.decode b/target/arm/vfp.decode
index 7bcf2260eec..08e4f427408 100644
--- a/target/arm/vfp.decode
+++ b/target/arm/vfp.decode
@@ -107,3 +107,8 @@ VMLS_sp      ---- 1110 0.00 .... .... 1010 .1.0 .... \
              vm=%vm_sp vn=%vn_sp vd=%vd_sp
 VMLS_dp      ---- 1110 0.00 .... .... 1011 .1.0 .... \
              vm=%vm_dp vn=%vn_dp vd=%vd_dp
+
+VNMLS_sp     ---- 1110 0.01 .... .... 1010 .0.0 .... \
+             vm=%vm_sp vn=%vn_sp vd=%vd_sp
+VNMLS_dp     ---- 1110 0.01 .... .... 1011 .0.0 .... \
+             vm=%vm_dp vn=%vn_dp vd=%vd_dp
-- 
2.20.1

