Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp4766581wrg;
        Thu, 6 Jun 2019 11:06:03 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzKrkaFB+3a7Jy/tqaxminQSYeRqFdebMSZ0Nle2evfIcbuC7dWIsjTxlKV9sqcWwm0bvZq
X-Received: by 2002:ac8:2ac5:: with SMTP id c5mr39225052qta.332.1559844363536;
        Thu, 06 Jun 2019 11:06:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1559844363; cv=none;
        d=google.com; s=arc-20160816;
        b=PA/vZwYXxyPs+eShGsGaTyytdMRci5g73FXmwFn86TaH8ovwM7Ddz+jzR7FaQZlCQX
         rWsUNrNFsjM64jOHFGi/f+twFdI4BrJcOb4AKT23G4WEWr8JDfgtl0WcWi3cZuajAkLf
         aFRfjTao+et94Hr8OS0BGXq9Hdmb/NWV1wmKgiMvazLGLfN25rJ+nx67c8dOJDb2Ueah
         yHN0Ngp9TvWQn4SiXWdecybFsfuR5Gr4wua6PxL+alzKOUhX0sheZnmDo0jhGmOk2m0B
         X1LOwCDQYvAblOCjf91+G4t1oohsBTKsdb3dmPPb2ffdzTR4jzaMVHpVzQrj0EJdoQgM
         SedQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=wS5685L1Ipovmuag8NGIyla+uLm909fdDbELT7NCVTo=;
        b=MYdEgjonjaNJ3D6GBD3wgbNYZyF8L0LAp0KvKhhQFjigfK7+pq95xJwl0XX8ZdWLUb
         l/OQ8zOu0NwSHr2XlrcEMraiYEjotESOutXDlht+KoDsno0KoIhytZOEdqXcJVMdBiU2
         jqtEFqL8HuNgcTED+nenwpLmi9I1BpLZH/95TcURuA2x4AWCkfYn/4bcz0VJUDcVUVNd
         /467u3eZo8KTuuzgFNyLsXEZf/R2G1NzyJRytwE7iFPKMVh7FNe9GgNfX/DXpanhWNES
         B1zPBENCTHy7g8TIIiAR8i22DixS+NULDjQe2tfFNqq+PFKELMEiIXNy7fBKFQesvUgn
         uauA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=kO6gxBgD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v49si2347792qtv.51.2019.06.06.11.06.03
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 06 Jun 2019 11:06:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=kO6gxBgD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:36214 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hYwm2-0006Ey-SI
	for alex.bennee@linaro.org; Thu, 06 Jun 2019 14:06:02 -0400
Received: from eggs.gnu.org ([209.51.188.92]:45018)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hYwUB-0004a2-6j
	for qemu-arm@nongnu.org; Thu, 06 Jun 2019 13:47:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hYwU7-0004Cx-LS
	for qemu-arm@nongnu.org; Thu, 06 Jun 2019 13:47:35 -0400
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:38761)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1hYwU7-0003MM-B5
	for qemu-arm@nongnu.org; Thu, 06 Jun 2019 13:47:31 -0400
Received: by mail-wr1-x444.google.com with SMTP id d18so3338582wrs.5
	for <qemu-arm@nongnu.org>; Thu, 06 Jun 2019 10:46:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=wS5685L1Ipovmuag8NGIyla+uLm909fdDbELT7NCVTo=;
	b=kO6gxBgDunxYaZYyfKx8QunKxrUrtFymb5DZKMA+mF68gHnV4hwKkXnfMBI59daABS
	TZBOaekNzRVCX0ycFJJDphkMuE97oQmykGnSOaK/GnTc3OrRfS9j5Nt+yXjYWmDQu3TS
	l/76AYhz8P6dSaX6x+7UMGvWRVnTRtQxn7Z9XYt/Zxg6vhKARprQ31CK0oJ2amhX6gxm
	+v+29d7HIOeoJdLtHR94VfqqhrlKWVFgAn3I/PULwq6CIRFNFjHIcvTehds++sNyYF2A
	vz0By02ix9QAfEru/QnA/fXf7juJheAcpK6knH7VaMc2QkCDLeGBzK5l4SMB6lYKbv+c
	RqRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=wS5685L1Ipovmuag8NGIyla+uLm909fdDbELT7NCVTo=;
	b=efUjVFx6m8qV3gwtXP+QugQbbYNzvt402ykvyZmn3IgHIE2VGcNvC81Fdd9bbQSumO
	oSCOP44ocISFcmVkaNv/soUyNzAvNsS2m4x2Tz1qYRzwq76Yo2zfyQwzYFj31e/Jf4oN
	eq2aPr1vGWF8WxOyCG6gZkTCL7EnQtnasPJWxKyG6HY+E0PfcHT2Oh5L3sWYPDPCJTHs
	LylJF+IAjWTCBgJUKj3XLrIRNOev6mAwp6RrpE6asJ2OtNxxC0MjOlMgCU3aol3Ql5pB
	kK1ILNUmY0qDT0A92Zlu1e4SbAjDakBsCbln3isObk4zT4rNiieuot4FbdTrp54VLF0O
	kU2w==
X-Gm-Message-State: APjAAAW9WcxHuLlLWyWnZbNC5dCWCn1VovUc6QwRaoC/Ow5U3f286Mo0
	bFR+id3QNQyj8wHWW98jyylE9TmQy1IQjQ==
X-Received: by 2002:adf:dd82:: with SMTP id x2mr6457485wrl.27.1559843214449;
	Thu, 06 Jun 2019 10:46:54 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
	by smtp.gmail.com with ESMTPSA id
	z135sm2596784wmc.45.2019.06.06.10.46.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 06 Jun 2019 10:46:53 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Thu,  6 Jun 2019 18:46:06 +0100
Message-Id: <20190606174609.20487-40-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190606174609.20487-1-peter.maydell@linaro.org>
References: <20190606174609.20487-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::444
Subject: [Qemu-arm] [PATCH 39/42] target/arm: Convert VJCVT to decodetree
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
X-TUID: xDuT6TeWaPry

Convert the VJCVT instruction to decodetree.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-vfp.inc.c | 24 ++++++++++++++++++++++++
 target/arm/translate.c         | 12 +-----------
 target/arm/vfp.decode          |  4 ++++
 3 files changed, 29 insertions(+), 11 deletions(-)

diff --git a/target/arm/translate-vfp.inc.c b/target/arm/translate-vfp.inc.c
index e5b5c3cd6a5..9bc852076a0 100644
--- a/target/arm/translate-vfp.inc.c
+++ b/target/arm/translate-vfp.inc.c
@@ -2418,3 +2418,27 @@ static bool trans_VCVT_int_dp(DisasContext *s, arg_VCVT_int_dp *a)
     tcg_temp_free_ptr(fpst);
     return true;
 }
+
+static bool trans_VJCVT(DisasContext *s, arg_VJCVT *a)
+{
+    TCGv_i32 vd;
+    TCGv_i64 vm;
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
+    vm = tcg_temp_new_i64();
+    vd = tcg_temp_new_i32();
+    neon_load_reg64(vm, a->vm);
+    gen_helper_vjcvt(vd, vm, cpu_env);
+    neon_store_reg32(vd, a->vd);
+    tcg_temp_free_i64(vm);
+    tcg_temp_free_i32(vd);
+    return true;
+}
diff --git a/target/arm/translate.c b/target/arm/translate.c
index b98f8f103ae..687ef093f97 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -3050,7 +3050,7 @@ static int disas_vfp_insn(DisasContext *s, uint32_t insn)
                 return 1;
             case 15:
                 switch (rn) {
-                case 0 ... 17:
+                case 0 ... 19:
                     /* Already handled by decodetree */
                     return 1;
                 default:
@@ -3085,13 +3085,6 @@ static int disas_vfp_insn(DisasContext *s, uint32_t insn)
                     rm_is_dp = false;
                     break;
 
-                case 0x13: /* vjcvt */
-                    if (!dp || !dc_isar_feature(aa32_jscvt, s)) {
-                        return 1;
-                    }
-                    rd_is_dp = false;
-                    break;
-
                 default:
                     return 1;
                 }
@@ -3177,9 +3170,6 @@ static int disas_vfp_insn(DisasContext *s, uint32_t insn)
                 switch (op) {
                 case 15: /* extension space */
                     switch (rn) {
-                    case 19: /* vjcvt */
-                        gen_helper_vjcvt(cpu_F0s, cpu_F0d, cpu_env);
-                        break;
                     case 20: /* fshto */
                         gen_vfp_shto(dp, 16 - rm, 0);
                         break;
diff --git a/target/arm/vfp.decode b/target/arm/vfp.decode
index 6da9a7913da..1a7c9b533de 100644
--- a/target/arm/vfp.decode
+++ b/target/arm/vfp.decode
@@ -220,3 +220,7 @@ VCVT_int_sp  ---- 1110 1.11 1000 .... 1010 s:1 1.0 .... \
              vd=%vd_sp vm=%vm_sp
 VCVT_int_dp  ---- 1110 1.11 1000 .... 1011 s:1 1.0 .... \
              vd=%vd_dp vm=%vm_sp
+
+# VJCVT is always dp to sp
+VJCVT        ---- 1110 1.11 1001 .... 1011 11.0 .... \
+             vd=%vd_sp vm=%vm_dp
-- 
2.20.1

