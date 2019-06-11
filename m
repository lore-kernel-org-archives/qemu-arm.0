Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp4223707wrg;
        Tue, 11 Jun 2019 04:20:18 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwuc6T2QUiRfI1/TGZArDD5b5RPqBTyvVg2StG+SDuw5gNxKnNLL3rqvNlau8emrO4CdTtd
X-Received: by 2002:ac8:2b90:: with SMTP id m16mr9275672qtm.384.1560252018478;
        Tue, 11 Jun 2019 04:20:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560252018; cv=none;
        d=google.com; s=arc-20160816;
        b=o06fbD4OVuEO+O6pQfRvvLdF5GA5y2ZzKVP0SLxAWHI57QmKx6FThN79XPsDteRjCi
         UJgsjWMBIx7vv3jMZtrxo8MNLLTviEBjA8YvrqLRzyJgTI/Jllc7j83/fmrt7xXuh3/l
         iE/m2qs0XmZFEFYIQv54EgPCsR+A0+ElDaWZVH12oSxpSzoNJOo594sPv96OMF0FB6kS
         5d+SSB/3zxbvdxKLwXsJXvNC0IinyAMI8RP/U57s7ygM8x9ZBFqyZISyk3rw3hSFmb7d
         ZKZgn7Cho1H3u+wm9NBfVa3ifnrGffdk/JYeyrS+a+iLrEFCKXvb5yY5HuVuUPtJm/JR
         Eweg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=+1Eu0a2rG77UT6/ymd+XIjDhnuEka8Y1v776h2ywKc0=;
        b=ZQRNNmMDr0dSUpMDUTKQuTqGkliRaVHD1LErgbrA1wU9nbzPRuA2j/jKuTO5yDs3MP
         Qj5r1vNftayAVDGcx+ba1x43AzLKB60dF336ra52iC1uCEbRgmvVWY4LCbOXoQsWnkwK
         YBcnjW6xohns3DKATgc/YTznkKGbd9tCNyjpKEhicCUAdNL7tLPU95LjcwhyPzTivFOK
         t8kTVB49imdWUG3rsJam6b3WJwU3p2IwP5HGKIHJQxEJit/OLAkPgMhpTMcHEefK/9Gb
         tZ7yVkZtpqxyDWKUHHjNJLGGJLJWNte9+8Uj1ttxKQ9/tsEWxOWS1TtiL30JbR9wX/2Y
         fpNg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=uT3zhEdn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u30si2740308qvh.46.2019.06.11.04.20.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 11 Jun 2019 04:20:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=uT3zhEdn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56356 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1haep8-0004DQ-0z
	for alex.bennee@linaro.org; Tue, 11 Jun 2019 07:20:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39587)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1haeQN-0007Ye-MS
 for qemu-arm@nongnu.org; Tue, 11 Jun 2019 06:54:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1haeQK-0007qP-JB
 for qemu-arm@nongnu.org; Tue, 11 Jun 2019 06:54:43 -0400
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:38991)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1haeQK-0007bw-7Z
 for qemu-arm@nongnu.org; Tue, 11 Jun 2019 06:54:40 -0400
Received: by mail-wr1-x444.google.com with SMTP id x4so9835163wrt.6
 for <qemu-arm@nongnu.org>; Tue, 11 Jun 2019 03:54:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+1Eu0a2rG77UT6/ymd+XIjDhnuEka8Y1v776h2ywKc0=;
 b=uT3zhEdn0lKzwiheehj4venzx0QVhp5nQU8BhWubTNcf5Ml6Swr7amh7oUrn0/UMFR
 pb0BfVr62HPq1RZpOyRLcu/ztjSEOtSa3p+/NM26MQPnziyRoGCutZkcshxxrI5BjToe
 wmy8cuq4UHiLjCOs8awyvOMwY4AtYkfGQPCRAkhIv2gPdSH5a95DctwqfLrheXsz7CfE
 9tVERF+SkSr6/pFyRnlZmjrK9o/ko0ToUzplTvUXjmIfkzK6dC0dOl6A1wbO8oOl/dY1
 uwqCY7+tzHSvnMQ1/9nORn8xMg6UR8x1NtwYWSY4FcJCwjgtG4AU9SI2tl9Xv4kn/tWb
 EOzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+1Eu0a2rG77UT6/ymd+XIjDhnuEka8Y1v776h2ywKc0=;
 b=bW4pP/PMS/QUDer69tqfoY/kjT+dJKsk0psLvUPT1CvtiW9mMUDrrzF0e30Vf/yQ/6
 LRRkbC2OqlWcP3L04oC8hx4c9ch0soU8qrm01DHWfn2B9XSv04FdRaAGDttf7WqY4BB1
 ZZ+OLXlrEdKw2nVe310WtjBTUx3nKL5kRaqlWvijRDtPx0PwFSLSFU7CYtE2HYXDOVa8
 8jK+zLgP0OSKzal/bBpCUkkTzOQw2CfzxwbnoGXNhv6k8CMCy5GVjLJVa0TuWkzwJkW8
 tumKJ7zvNYzOsph1ZEq1MubPXHsJThpoQ4r4IWZ32nSoEgVgJVODR7HWqpnV7d+hpaXW
 ov1Q==
X-Gm-Message-State: APjAAAX8VUoOiEzlunQCvlXs3UVHKgLq8q7yck2Ej+p/+NORQcbdiiWv
 9QWViQofY6dE4G9kgHampcWZWTsN11SZtw==
X-Received: by 2002:adf:ead1:: with SMTP id o17mr4501460wrn.176.1560250461965; 
 Tue, 11 Jun 2019 03:54:21 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id e17sm10785945wrt.95.2019.06.11.03.54.21
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 11 Jun 2019 03:54:21 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue, 11 Jun 2019 11:53:35 +0100
Message-Id: <20190611105351.9871-27-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190611105351.9871-1-peter.maydell@linaro.org>
References: <20190611105351.9871-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::444
Subject: [Qemu-arm] [PATCH v2 26/42] target/arm: Convert VDIV to decodetree
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
X-TUID: 79mG8ybSMvMC

Convert the VDIV instruction to decodetree.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-vfp.inc.c | 10 ++++++++++
 target/arm/translate.c         | 21 +--------------------
 target/arm/vfp.decode          |  5 +++++
 3 files changed, 16 insertions(+), 20 deletions(-)

diff --git a/target/arm/translate-vfp.inc.c b/target/arm/translate-vfp.inc.c
index 12da3b8acb8..6af99605d5c 100644
--- a/target/arm/translate-vfp.inc.c
+++ b/target/arm/translate-vfp.inc.c
@@ -1471,3 +1471,13 @@ static bool trans_VSUB_dp(DisasContext *s, arg_VSUB_sp *a)
 {
     return do_vfp_3op_dp(s, gen_helper_vfp_subd, a->vd, a->vn, a->vm, false);
 }
+
+static bool trans_VDIV_sp(DisasContext *s, arg_VDIV_sp *a)
+{
+    return do_vfp_3op_sp(s, gen_helper_vfp_divs, a->vd, a->vn, a->vm, false);
+}
+
+static bool trans_VDIV_dp(DisasContext *s, arg_VDIV_sp *a)
+{
+    return do_vfp_3op_dp(s, gen_helper_vfp_divd, a->vd, a->vn, a->vm, false);
+}
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 18d4f9933ad..a9ec6eaef80 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -1374,22 +1374,6 @@ static TCGv_ptr get_fpstatus_ptr(int neon)
     return statusptr;
 }
 
-#define VFP_OP2(name)                                                 \
-static inline void gen_vfp_##name(int dp)                             \
-{                                                                     \
-    TCGv_ptr fpst = get_fpstatus_ptr(0);                              \
-    if (dp) {                                                         \
-        gen_helper_vfp_##name##d(cpu_F0d, cpu_F0d, cpu_F1d, fpst);    \
-    } else {                                                          \
-        gen_helper_vfp_##name##s(cpu_F0s, cpu_F0s, cpu_F1s, fpst);    \
-    }                                                                 \
-    tcg_temp_free_ptr(fpst);                                          \
-}
-
-VFP_OP2(div)
-
-#undef VFP_OP2
-
 static inline void gen_vfp_abs(int dp)
 {
     if (dp)
@@ -3109,7 +3093,7 @@ static int disas_vfp_insn(DisasContext *s, uint32_t insn)
             rn = VFP_SREG_N(insn);
 
             switch (op) {
-            case 0 ... 7:
+            case 0 ... 8:
                 /* Already handled by decodetree */
                 return 1;
             default:
@@ -3295,9 +3279,6 @@ static int disas_vfp_insn(DisasContext *s, uint32_t insn)
             for (;;) {
                 /* Perform the calculation.  */
                 switch (op) {
-                case 8: /* div: fn / fm */
-                    gen_vfp_div(dp);
-                    break;
                 case 10: /* VFNMA : fd = muladd(-fd,  fn, fm) */
                 case 11: /* VFNMS : fd = muladd(-fd, -fn, fm) */
                 case 12: /* VFMA  : fd = muladd( fd,  fn, fm) */
diff --git a/target/arm/vfp.decode b/target/arm/vfp.decode
index de56f44efc9..de305f60e18 100644
--- a/target/arm/vfp.decode
+++ b/target/arm/vfp.decode
@@ -137,3 +137,8 @@ VSUB_sp      ---- 1110 0.11 .... .... 1010 .1.0 .... \
              vm=%vm_sp vn=%vn_sp vd=%vd_sp
 VSUB_dp      ---- 1110 0.11 .... .... 1011 .1.0 .... \
              vm=%vm_dp vn=%vn_dp vd=%vd_dp
+
+VDIV_sp      ---- 1110 1.00 .... .... 1010 .0.0 .... \
+             vm=%vm_sp vn=%vn_sp vd=%vd_sp
+VDIV_dp      ---- 1110 1.00 .... .... 1011 .0.0 .... \
+             vm=%vm_dp vn=%vn_dp vd=%vd_dp
-- 
2.20.1

