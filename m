Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp4224939wrg;
        Tue, 11 Jun 2019 04:21:48 -0700 (PDT)
X-Google-Smtp-Source: APXvYqywAI1Z22vGchMMmcrJOaOSHVkUrcHfYo31uzzZCm28YlYW/OgP32dUOoEOuqgZj27wLtXy
X-Received: by 2002:a37:6587:: with SMTP id z129mr27497887qkb.295.1560252108681;
        Tue, 11 Jun 2019 04:21:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560252108; cv=none;
        d=google.com; s=arc-20160816;
        b=pruHb+BvxwkXolEIzzUkD3HhuL5Ym8G0+Clh3000WgzRvIMo7g+3mloaT+vf3+yNOL
         HeSyb4Y0cenHUTaAF2yYAL2cSpnPMgfI4ZCSmtqNEN2RMfBRkonQ7DxgVPbLYCOgCDTU
         IbET5dp4nvpdqEZOkVuKKPTPFdqLPNROG7poXS8ioyjLhEUti4Wj9WPrrUJfTGUrtquM
         3XjQJPNe224h3UOL9e7NrYDh2+L78gV3LCSB5c0OhANHSB5AFIdKeRm+5bu/tjCZ95hQ
         LVF3OAxD8IwylzJ0zSgvvmVGLJRvpnJK8r/k4Mk8XEvVfK2B7Y850SwjrYyp4tFtBj2e
         rHUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=RESFSOfye+/QpUNOwYF+OWDweWBNnoP2IOQhWx0uTd0=;
        b=hppTmlsvTv34kVn7lLWJcFZ3QokpmhhUGnERyUYieJYmTAgEz+ip0jT1liHgBhq2l6
         8FDDufv0z2DZ53/zt06XgObrOIkKKi4yrP2EbVfwEwsbbASEAzG93QGT4wH/Tw9mhdC9
         QhzZbQpmeQPtIwfkgF040adR8AIIbgZ6tG7ssvKDDUUocewg2HWNi8La1YhpshyKdugU
         2Y5z3HCGKjDMmJBgyvHALKFPrxXhKJKUuZsVhJef/dO6OF322gzvMzfZxXkKwVzZ6Zz3
         OljdsdOF2oTZw9ClG3DiCB5knRzFNkBZ1PsamXpnJpNvZ9+qEaKNiJZ2h5TV0yASMBQg
         Fn6g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=E43A2t2S;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l17si621636qkk.57.2019.06.11.04.21.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 11 Jun 2019 04:21:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=E43A2t2S;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56372 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1haeqa-0005N7-6f
	for alex.bennee@linaro.org; Tue, 11 Jun 2019 07:21:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39417)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1haeQ7-0007O9-RG
 for qemu-arm@nongnu.org; Tue, 11 Jun 2019 06:54:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1haeQ0-0007Zy-Du
 for qemu-arm@nongnu.org; Tue, 11 Jun 2019 06:54:25 -0400
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:38716)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1haeQ0-0007Z8-4e
 for qemu-arm@nongnu.org; Tue, 11 Jun 2019 06:54:20 -0400
Received: by mail-wm1-x343.google.com with SMTP id s15so2385723wmj.3
 for <qemu-arm@nongnu.org>; Tue, 11 Jun 2019 03:54:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RESFSOfye+/QpUNOwYF+OWDweWBNnoP2IOQhWx0uTd0=;
 b=E43A2t2SDQeoLm2592JvpUMJQmpoXyummNYfKxxtlc4iZP78XXqb+3zBNOlV/LrP3e
 bn+DuUZb9soBvZ2NVgGZVHWe6Z7ieyjmbQydmuZmvSIg6CrOH//4bUCnEmht6JJoJPwh
 6R0CbyfnSfqTb5JlEj8hW0rpw/J/mR+sP3L+ezth/j3rVVY/d6qe1fxWeG0KF/hV75A0
 4tAGMdMv/Fo4GjnLTy0PPgr3xFUxA7tVdMraxRF1Gj46X9tLyzn2JOyWTZyNk6NNFMoG
 nBNkXluKSnE67IUgja/V21KVDEYSxy+6Bjy/85u9/4PfltUQ2212Ub1OY7Qnkw4rbLJ3
 96lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RESFSOfye+/QpUNOwYF+OWDweWBNnoP2IOQhWx0uTd0=;
 b=a4fETFrgjhX1WYePb76mhUHiRII7Vkl7s8XQnZksM8P1WHgqDBGkXQ8qTuODdU/D0i
 4XZoJ2evypVEwAik4zXr9h4jB4maFpm4HL7S/wqwmS0jeuiIui2GQ7F1hSv+3JS0QnSS
 vG4rQjg7PBI+27ykABs4B2ZO1VZ3q5yCu/6IlYF27am1dPFRwud2cagpusmHX5mi0mM2
 02jTYm+rqaApGXbxRxSom0EXx7d9AyrknuBmNA6OMU6PjdN0NskA4AGRt/FI9G348TxN
 DmI7I+LQqN6Rdjjpo2bPdYFPaHsR0DGTzGktBJpClt4hFx70OahG9NeUGFe+RXT+Lb5E
 HXdA==
X-Gm-Message-State: APjAAAWQSVLB+pL+bjXiBJHAHW9txNh13nywA3+J3XGTJ9qmJBqvDxF6
 3l/ckez/JBOzCOP4tqoKIlw3T+lJQaiaKQ==
X-Received: by 2002:a1c:a848:: with SMTP id r69mr16623331wme.12.1560250458861; 
 Tue, 11 Jun 2019 03:54:18 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id e17sm10785945wrt.95.2019.06.11.03.54.17
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 11 Jun 2019 03:54:18 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue, 11 Jun 2019 11:53:32 +0100
Message-Id: <20190611105351.9871-24-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190611105351.9871-1-peter.maydell@linaro.org>
References: <20190611105351.9871-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::343
Subject: [Qemu-arm] [PATCH v2 23/42] target/arm: Convert VNMUL to decodetree
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
X-TUID: H83VafTWGcuC

Convert the VNMUL instruction to decodetree.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-vfp.inc.c | 24 ++++++++++++++++++++++++
 target/arm/translate.c         |  7 +------
 target/arm/vfp.decode          |  5 +++++
 3 files changed, 30 insertions(+), 6 deletions(-)

diff --git a/target/arm/translate-vfp.inc.c b/target/arm/translate-vfp.inc.c
index a2afe82b349..4c684f033b6 100644
--- a/target/arm/translate-vfp.inc.c
+++ b/target/arm/translate-vfp.inc.c
@@ -1427,3 +1427,27 @@ static bool trans_VMUL_dp(DisasContext *s, arg_VMUL_sp *a)
 {
     return do_vfp_3op_dp(s, gen_helper_vfp_muld, a->vd, a->vn, a->vm, false);
 }
+
+static void gen_VNMUL_sp(TCGv_i32 vd, TCGv_i32 vn, TCGv_i32 vm, TCGv_ptr fpst)
+{
+    /* VNMUL: -(fn * fm) */
+    gen_helper_vfp_muls(vd, vn, vm, fpst);
+    gen_helper_vfp_negs(vd, vd);
+}
+
+static bool trans_VNMUL_sp(DisasContext *s, arg_VNMUL_sp *a)
+{
+    return do_vfp_3op_sp(s, gen_VNMUL_sp, a->vd, a->vn, a->vm, false);
+}
+
+static void gen_VNMUL_dp(TCGv_i64 vd, TCGv_i64 vn, TCGv_i64 vm, TCGv_ptr fpst)
+{
+    /* VNMUL: -(fn * fm) */
+    gen_helper_vfp_muld(vd, vn, vm, fpst);
+    gen_helper_vfp_negd(vd, vd);
+}
+
+static bool trans_VNMUL_dp(DisasContext *s, arg_VNMUL_sp *a)
+{
+    return do_vfp_3op_dp(s, gen_VNMUL_dp, a->vd, a->vn, a->vm, false);
+}
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 96790e65c6f..1f9fa6b03a1 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -1388,7 +1388,6 @@ static inline void gen_vfp_##name(int dp)                             \
 
 VFP_OP2(add)
 VFP_OP2(sub)
-VFP_OP2(mul)
 VFP_OP2(div)
 
 #undef VFP_OP2
@@ -3112,7 +3111,7 @@ static int disas_vfp_insn(DisasContext *s, uint32_t insn)
             rn = VFP_SREG_N(insn);
 
             switch (op) {
-            case 0 ... 4:
+            case 0 ... 5:
                 /* Already handled by decodetree */
                 return 1;
             default:
@@ -3298,10 +3297,6 @@ static int disas_vfp_insn(DisasContext *s, uint32_t insn)
             for (;;) {
                 /* Perform the calculation.  */
                 switch (op) {
-                case 5: /* nmul: -(fn * fm) */
-                    gen_vfp_mul(dp);
-                    gen_vfp_neg(dp);
-                    break;
                 case 6: /* add: fn + fm */
                     gen_vfp_add(dp);
                     break;
diff --git a/target/arm/vfp.decode b/target/arm/vfp.decode
index d7fcb9709a9..3063fcac23f 100644
--- a/target/arm/vfp.decode
+++ b/target/arm/vfp.decode
@@ -122,3 +122,8 @@ VMUL_sp      ---- 1110 0.10 .... .... 1010 .0.0 .... \
              vm=%vm_sp vn=%vn_sp vd=%vd_sp
 VMUL_dp      ---- 1110 0.10 .... .... 1011 .0.0 .... \
              vm=%vm_dp vn=%vn_dp vd=%vd_dp
+
+VNMUL_sp     ---- 1110 0.10 .... .... 1010 .1.0 .... \
+             vm=%vm_sp vn=%vn_sp vd=%vd_sp
+VNMUL_dp     ---- 1110 0.10 .... .... 1011 .1.0 .... \
+             vm=%vm_dp vn=%vn_dp vd=%vd_dp
-- 
2.20.1

