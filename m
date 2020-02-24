Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp843339lfg;
        Mon, 24 Feb 2020 14:22:51 -0800 (PST)
X-Google-Smtp-Source: APXvYqzEG1zHjvhbdIAdD4990cC1WTDKj56kEKVNntrHTKlzozqcPpjaPMZ/xI/K82W30vOqqv4j
X-Received: by 2002:a37:4755:: with SMTP id u82mr50411516qka.43.1582582971209;
        Mon, 24 Feb 2020 14:22:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582582971; cv=none;
        d=google.com; s=arc-20160816;
        b=bmSRWeqCu8bgQK5afARE7zSQOtqPl9hgfs60Qpw/UK5aWAj883OnNQQZHEbsi2wpT+
         58huEJ51JzoeE8/Xilsl7lyJSoALpgaFmeNXdy3HzTfqq1951RcOlNp9f42glI6y0BNy
         RQg2J7RMsmigbwDm7TtUuBoee12mTJPSH6+iEFi175i99FPn8ozVNa/DJSRx6wr+D929
         tZd/11BlBlKHZB6SWW4UP+23jNEGUPCFw9Qs47lTxe6IxsK5wVzxVV0EPAHee6fzRZcb
         E953wy5Z0Is1oDKuChc9WT2MiGfb4LNfXfgFZQfzVneMY2qq/jKRV13vYbPDEZwM8yrC
         FOcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=8VBDdJ2XXe8vgr+0Pu3Ei4ErsKpoLGqHBt+iFGkJN3g=;
        b=yeVHiyj02sy/q9bReDmXBxFjMwAKC1NHA89EqBcTOK82lIgMGT0w04UEl5w4zOaY8B
         OQxNcLrS4cx1y+gEZ9mTxiUQv3l5+292/mz1LMnuwYS/ED0/ISOcbeA8ZmKL9I1ZvNK+
         qocXYad8/k+mlNe1p6oOSkysyT2nceuIPmuU2lPWzXhMBnHHMmfh0gef88amFjJZsZW/
         DOhzkC2YZRCy9l2Sc/tZ31as4MBSSHEE/gi83jFXfxXytLoZSWggO8nGGSQWhkxyxxKI
         zBZC1gaJ1lnHxPi1b5Eq7S2scZvZXJVtw8FwcA8MEs2qrnmDhKG0KpvZQ87/ZCbEjLKF
         OmzQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=w4z1kwQP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p21si6710466qkh.84.2020.02.24.14.22.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 Feb 2020 14:22:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=w4z1kwQP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44986 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j6M7m-000464-Hb
	for alex.bennee@linaro.org; Mon, 24 Feb 2020 17:22:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37687)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1j6M7b-00040p-Hd
 for qemu-arm@nongnu.org; Mon, 24 Feb 2020 17:22:40 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1j6M7a-0005k7-6Q
 for qemu-arm@nongnu.org; Mon, 24 Feb 2020 17:22:39 -0500
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444]:44912)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1j6M7a-0005jd-0h
 for qemu-arm@nongnu.org; Mon, 24 Feb 2020 17:22:38 -0500
Received: by mail-pf1-x444.google.com with SMTP id y5so6060345pfb.11
 for <qemu-arm@nongnu.org>; Mon, 24 Feb 2020 14:22:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8VBDdJ2XXe8vgr+0Pu3Ei4ErsKpoLGqHBt+iFGkJN3g=;
 b=w4z1kwQPk/JnG8w6+Gzb05842L5NXu3+w8WpW7vUfNqbqCMHrdqbpeYCQcgMnHQSJL
 w/eeRExZx6WeEVRuZUOMNoy2nBfCkUbBkGSyUOlC2RU9EvebswVAAQJVFXESkXgl9jfp
 LhVZs8CDzaQsjN/Wsy00R9Mg5uWmsSstW3lgPWAkjG6aL97/KG+caAXy1Wgh8ghLjjOD
 NcKRIiddA5BmQxl7Qjg4Lr3sl0pEbFhGFFvNn+8t0tOUV7G2qu1P8uzs33Pm9sWwp7rl
 cOu58Qv+gdNwnx6DkWFcYrJaPgZTqM9LBfr8rjd39+dykYGt02PEjR3RjykOTVsOn/WB
 coaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8VBDdJ2XXe8vgr+0Pu3Ei4ErsKpoLGqHBt+iFGkJN3g=;
 b=bGhkBAvO26VhXFKqF904Jc37oxpzRVavkspH6gCfA56zmyu4eLe+5MZby9XnDLhEOD
 UveEft81hbdvNXOYT7JP8SLcFT5JRBEr4YcCdEtLiUr9nxXAMVTH+nw3FL/nUcrsSA4f
 kNR9kGr06BGYP8INgBeEBm8jSZoTYbpA9e5BWMJCk0BX8ukVt+595JNubnYmpyLvdjQV
 vvxIqt17V8PcNs2oJkCkIb1iOOCJzOLS5m87eJQ6ldLvImeWNbwKz5Ak+ry+Vs8Lbwvv
 tveE09cppSBG5ekuibNMiVRQ9h+hQ1ObmQbIw+ShYwPB32D/hxxFpQ8SfgZW3QjkV8WE
 GsSA==
X-Gm-Message-State: APjAAAXt7v0hcYzgqdw25TVj5hk9s+o8lQUZh9IY0jf8WMewPIsbT5fN
 VNywBT80S7HtEjSW7AXhaMhuag==
X-Received: by 2002:a63:48f:: with SMTP id 137mr8382543pge.245.1582582957128; 
 Mon, 24 Feb 2020 14:22:37 -0800 (PST)
Received: from localhost.localdomain (97-126-123-70.tukw.qwest.net.
 [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id o6sm13897097pgg.37.2020.02.24.14.22.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Feb 2020 14:22:36 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 02/17] target/arm: Rename isar_feature_aa32_fpdp_v2
Date: Mon, 24 Feb 2020 14:22:17 -0800
Message-Id: <20200224222232.13807-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200224222232.13807-1-richard.henderson@linaro.org>
References: <20200224222232.13807-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::444
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: U3Q/s1t0en2F

The old name, isar_feature_aa32_fpdp, does not reflect
that the test includes VFPv2.  We will introduce another
feature tests for VFPv3.

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h               |  4 ++--
 target/arm/translate-vfp.inc.c | 40 +++++++++++++++++-----------------
 2 files changed, 22 insertions(+), 22 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index a128d48d40..1e6eac0cd2 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -3470,9 +3470,9 @@ static inline bool isar_feature_aa32_fpshvec(const ARMISARegisters *id)
     return FIELD_EX32(id->mvfr0, MVFR0, FPSHVEC) > 0;
 }
 
-static inline bool isar_feature_aa32_fpdp(const ARMISARegisters *id)
+static inline bool isar_feature_aa32_fpdp_v2(const ARMISARegisters *id)
 {
-    /* Return true if CPU supports double precision floating point */
+    /* Return true if CPU supports double precision floating point, VFPv2 */
     return FIELD_EX32(id->mvfr0, MVFR0, FPDP) > 0;
 }
 
diff --git a/target/arm/translate-vfp.inc.c b/target/arm/translate-vfp.inc.c
index ba46e2557a..e94876c30c 100644
--- a/target/arm/translate-vfp.inc.c
+++ b/target/arm/translate-vfp.inc.c
@@ -206,7 +206,7 @@ static bool trans_VSEL(DisasContext *s, arg_VSEL *a)
         return false;
     }
 
-    if (dp && !dc_isar_feature(aa32_fpdp, s)) {
+    if (dp && !dc_isar_feature(aa32_fpdp_v2, s)) {
         return false;
     }
 
@@ -339,7 +339,7 @@ static bool trans_VMINMAXNM(DisasContext *s, arg_VMINMAXNM *a)
         return false;
     }
 
-    if (dp && !dc_isar_feature(aa32_fpdp, s)) {
+    if (dp && !dc_isar_feature(aa32_fpdp_v2, s)) {
         return false;
     }
 
@@ -425,7 +425,7 @@ static bool trans_VRINT(DisasContext *s, arg_VRINT *a)
         return false;
     }
 
-    if (dp && !dc_isar_feature(aa32_fpdp, s)) {
+    if (dp && !dc_isar_feature(aa32_fpdp_v2, s)) {
         return false;
     }
 
@@ -488,7 +488,7 @@ static bool trans_VCVT(DisasContext *s, arg_VCVT *a)
         return false;
     }
 
-    if (dp && !dc_isar_feature(aa32_fpdp, s)) {
+    if (dp && !dc_isar_feature(aa32_fpdp_v2, s)) {
         return false;
     }
 
@@ -1313,7 +1313,7 @@ static bool do_vfp_3op_dp(DisasContext *s, VFPGen3OpDPFn *fn,
         return false;
     }
 
-    if (!dc_isar_feature(aa32_fpdp, s)) {
+    if (!dc_isar_feature(aa32_fpdp_v2, s)) {
         return false;
     }
 
@@ -1462,7 +1462,7 @@ static bool do_vfp_2op_dp(DisasContext *s, VFPGen2OpDPFn *fn, int vd, int vm)
         return false;
     }
 
-    if (!dc_isar_feature(aa32_fpdp, s)) {
+    if (!dc_isar_feature(aa32_fpdp_v2, s)) {
         return false;
     }
 
@@ -1827,7 +1827,7 @@ static bool trans_VFM_dp(DisasContext *s, arg_VFM_dp *a)
         return false;
     }
 
-    if (!dc_isar_feature(aa32_fpdp, s)) {
+    if (!dc_isar_feature(aa32_fpdp_v2, s)) {
         return false;
     }
 
@@ -1926,7 +1926,7 @@ static bool trans_VMOV_imm_dp(DisasContext *s, arg_VMOV_imm_dp *a)
         return false;
     }
 
-    if (!dc_isar_feature(aa32_fpdp, s)) {
+    if (!dc_isar_feature(aa32_fpdp_v2, s)) {
         return false;
     }
 
@@ -2070,7 +2070,7 @@ static bool trans_VCMP_dp(DisasContext *s, arg_VCMP_dp *a)
         return false;
     }
 
-    if (!dc_isar_feature(aa32_fpdp, s)) {
+    if (!dc_isar_feature(aa32_fpdp_v2, s)) {
         return false;
     }
 
@@ -2143,7 +2143,7 @@ static bool trans_VCVT_f64_f16(DisasContext *s, arg_VCVT_f64_f16 *a)
         return false;
     }
 
-    if (!dc_isar_feature(aa32_fpdp, s)) {
+    if (!dc_isar_feature(aa32_fpdp_v2, s)) {
         return false;
     }
 
@@ -2209,7 +2209,7 @@ static bool trans_VCVT_f16_f64(DisasContext *s, arg_VCVT_f16_f64 *a)
         return false;
     }
 
-    if (!dc_isar_feature(aa32_fpdp, s)) {
+    if (!dc_isar_feature(aa32_fpdp_v2, s)) {
         return false;
     }
 
@@ -2269,7 +2269,7 @@ static bool trans_VRINTR_dp(DisasContext *s, arg_VRINTR_dp *a)
         return false;
     }
 
-    if (!dc_isar_feature(aa32_fpdp, s)) {
+    if (!dc_isar_feature(aa32_fpdp_v2, s)) {
         return false;
     }
 
@@ -2330,7 +2330,7 @@ static bool trans_VRINTZ_dp(DisasContext *s, arg_VRINTZ_dp *a)
         return false;
     }
 
-    if (!dc_isar_feature(aa32_fpdp, s)) {
+    if (!dc_isar_feature(aa32_fpdp_v2, s)) {
         return false;
     }
 
@@ -2389,7 +2389,7 @@ static bool trans_VRINTX_dp(DisasContext *s, arg_VRINTX_dp *a)
         return false;
     }
 
-    if (!dc_isar_feature(aa32_fpdp, s)) {
+    if (!dc_isar_feature(aa32_fpdp_v2, s)) {
         return false;
     }
 
@@ -2417,7 +2417,7 @@ static bool trans_VCVT_sp(DisasContext *s, arg_VCVT_sp *a)
         return false;
     }
 
-    if (!dc_isar_feature(aa32_fpdp, s)) {
+    if (!dc_isar_feature(aa32_fpdp_v2, s)) {
         return false;
     }
 
@@ -2445,7 +2445,7 @@ static bool trans_VCVT_dp(DisasContext *s, arg_VCVT_dp *a)
         return false;
     }
 
-    if (!dc_isar_feature(aa32_fpdp, s)) {
+    if (!dc_isar_feature(aa32_fpdp_v2, s)) {
         return false;
     }
 
@@ -2499,7 +2499,7 @@ static bool trans_VCVT_int_dp(DisasContext *s, arg_VCVT_int_dp *a)
         return false;
     }
 
-    if (!dc_isar_feature(aa32_fpdp, s)) {
+    if (!dc_isar_feature(aa32_fpdp_v2, s)) {
         return false;
     }
 
@@ -2539,7 +2539,7 @@ static bool trans_VJCVT(DisasContext *s, arg_VJCVT *a)
         return false;
     }
 
-    if (!dc_isar_feature(aa32_fpdp, s)) {
+    if (!dc_isar_feature(aa32_fpdp_v2, s)) {
         return false;
     }
 
@@ -2632,7 +2632,7 @@ static bool trans_VCVT_fix_dp(DisasContext *s, arg_VCVT_fix_dp *a)
         return false;
     }
 
-    if (!dc_isar_feature(aa32_fpdp, s)) {
+    if (!dc_isar_feature(aa32_fpdp_v2, s)) {
         return false;
     }
 
@@ -2728,7 +2728,7 @@ static bool trans_VCVT_dp_int(DisasContext *s, arg_VCVT_dp_int *a)
         return false;
     }
 
-    if (!dc_isar_feature(aa32_fpdp, s)) {
+    if (!dc_isar_feature(aa32_fpdp_v2, s)) {
         return false;
     }
 
-- 
2.20.1

