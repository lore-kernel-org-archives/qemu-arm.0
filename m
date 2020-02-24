Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp844851lfg;
        Mon, 24 Feb 2020 14:24:44 -0800 (PST)
X-Google-Smtp-Source: APXvYqw0a/Lbx4sUlI5RPimYwHtJTWtVltNYaVQcuvMKtUTzL3w8k2JwwOKdwZvpGSZDGQMIs75p
X-Received: by 2002:a37:644f:: with SMTP id y76mr3290489qkb.488.1582583084063;
        Mon, 24 Feb 2020 14:24:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582583084; cv=none;
        d=google.com; s=arc-20160816;
        b=YU4BS7+hAW5Q3DvZNstoYrPOQmeT2xMIF4j8ryfhMusnwV6Qfdzjn5eUCVYIYySjtu
         yhQ7bo8vgPqaqaKOgQTeydOxRwhnaffBIRscxi6rS5rSlyuGXTgni4MvKBLqNtn9Oxpc
         4skQsbeVXuMijUNeNnKcrfDRUZXzmqs66FTLJpA4cy2VLqiX5iHpRbrmHsUmLt3vy7Ym
         U0g4mjNzpvllFCs5V4Hi+pdmuG4/fJGe36HwRCj7VckEQF5aQVIiDKqJpGBrSsAvHPfS
         llJIFZB3h83vj1U014/HHTITekM314FJ14so0Ca1vT2bnn90Ik2+WkkRHy/LBprjDlCY
         I1Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=BR6sc2PsWl2NSv+8xYHc8XwgP3dTmPaC/PPPaHkcT3I=;
        b=aH3dMNBzGsIkILPHNYsdZ6BcfmHBDjb7yLXsqmn4MEd687HY9hJ7a1BsFJn9MOmk7D
         hR7wpFwi2AAYJ+ezNmzFJKQn6TKWA5bfUbyZbwEkrbucIjFnoTV2qvXwvNiD7Gvb/wbB
         v65icpIep8xtFN0frf8y/li61MNLQYMS/T+UGuuMn6I0veEWj9Zncr1VNWshi4jCqYT+
         Pmjwb3WqybUHaRZDlRpj+isghHpeLL18MiXy4JAJ+foKCFan7PmDN8Ag4TdJ13p9koXW
         DeNICGVv19CCb6xJhOb2Rgs1hLXjPdLQHNksI2iwHKgjLZ/voq4hQo4DPZcnT/PKI1sK
         4/uA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=DQ2dparv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x26si6525020qtq.63.2020.02.24.14.24.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 Feb 2020 14:24:44 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=DQ2dparv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j6M9b-00085x-Ez
	for alex.bennee@linaro.org; Mon, 24 Feb 2020 17:24:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37815)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1j6M7h-0004Fk-Sr
 for qemu-arm@nongnu.org; Mon, 24 Feb 2020 17:22:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1j6M7g-0005qR-Kv
 for qemu-arm@nongnu.org; Mon, 24 Feb 2020 17:22:45 -0500
Received: from mail-pj1-x1042.google.com ([2607:f8b0:4864:20::1042]:39754)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1j6M7g-0005q0-Ew
 for qemu-arm@nongnu.org; Mon, 24 Feb 2020 17:22:44 -0500
Received: by mail-pj1-x1042.google.com with SMTP id e9so365487pjr.4
 for <qemu-arm@nongnu.org>; Mon, 24 Feb 2020 14:22:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BR6sc2PsWl2NSv+8xYHc8XwgP3dTmPaC/PPPaHkcT3I=;
 b=DQ2dparviTdEn1mh9O1lQXFqY3QilS/OGLcCZ+Huii0oWHWSzMo2G6iYtJircXbGPC
 /gAs6Dz8gir/vzxWET88fVpkmNSKc9+2luOAiZAjF0Ku+ZxAu4d6PYJwpeTPwXFh5sbL
 WfbVPfeBSClTLbogMwUlHYwdhKFqwxIDs79mlGZwtkLb7rU8oQkS/7vn4aqqy5Bi12jK
 RMKhCYFJiMk6wKsXBKcc+8aHSsbS5aUVr3WOL1zmUoexLsBHUEDkdmR3/YUp1WnIvznY
 wHHoF6y1K2n+o4Xn2vd+RYvHv5u7D+lA+gSZexh7+p0KLkcIlT3EpzoqEcoSlJppmiJ5
 5TuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BR6sc2PsWl2NSv+8xYHc8XwgP3dTmPaC/PPPaHkcT3I=;
 b=nZVOosPa1LYlhdtTtPmU++NIDXWH7t8phdoy7vBTchBFg4TJnCfj76+pwcwFMPMcit
 qflIdWvX+CWb72S38rZ3LvOGESkbOh7QfG/OEkxxbbYRDFGXnVPuuUIrtjJr7RUwOYUm
 y66xZD2smR5x6KX8dFwAAJG4WHISG6VUGqfHJfyBl78FmMbNeLQNkcxIqSlSza6q+u49
 oGBjtYa8qK+kjvam8HV0qbWCSH9Nq89tzNe5LlxYUDNXDQvUFfhVjfWYYtsNbuRdNLGN
 jHkg60aE/IvjQBMOOPbEDNKC9p9h2RwYrMujt35JKHo1USlcpjkTKgFzkPPXMMowoIVC
 a9qA==
X-Gm-Message-State: APjAAAUK1UrEVrWlvvWDYkih4W4NA+Jfz0kZnar8HgkrEL6kasigxbgQ
 E880UKSKaOlItuQTRGH3/MzHlg==
X-Received: by 2002:a17:902:8d83:: with SMTP id
 v3mr52983013plo.282.1582582963580; 
 Mon, 24 Feb 2020 14:22:43 -0800 (PST)
Received: from localhost.localdomain (97-126-123-70.tukw.qwest.net.
 [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id o6sm13897097pgg.37.2020.02.24.14.22.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Feb 2020 14:22:42 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 07/17] target/arm: Replace ARM_FEATURE_VFP3 checks with
 fp{sp, dp}_v3
Date: Mon, 24 Feb 2020 14:22:22 -0800
Message-Id: <20200224222232.13807-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200224222232.13807-1-richard.henderson@linaro.org>
References: <20200224222232.13807-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::1042
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: vGUFGXJO5v0C

Sort this check to the start of a trans_* function.
Merge this with any existing test for fpdp_v2.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-vfp.inc.c | 24 ++++++++----------------
 1 file changed, 8 insertions(+), 16 deletions(-)

diff --git a/target/arm/translate-vfp.inc.c b/target/arm/translate-vfp.inc.c
index ff30165045..51d46f4302 100644
--- a/target/arm/translate-vfp.inc.c
+++ b/target/arm/translate-vfp.inc.c
@@ -717,7 +717,7 @@ static bool trans_VMSR_VMRS(DisasContext *s, arg_VMSR_VMRS *a)
          * VFPv2 allows access to FPSID from userspace; VFPv3 restricts
          * all ID registers to privileged access only.
          */
-        if (IS_USER(s) && arm_dc_feature(s, ARM_FEATURE_VFP3)) {
+        if (IS_USER(s) && dc_isar_feature(aa32_fpsp_v3, s)) {
             return false;
         }
         ignore_vfp_enabled = true;
@@ -746,7 +746,7 @@ static bool trans_VMSR_VMRS(DisasContext *s, arg_VMSR_VMRS *a)
     case ARM_VFP_FPINST:
     case ARM_VFP_FPINST2:
         /* Not present in VFPv3 */
-        if (IS_USER(s) || arm_dc_feature(s, ARM_FEATURE_VFP3)) {
+        if (IS_USER(s) || dc_isar_feature(aa32_fpsp_v3, s)) {
             return false;
         }
         break;
@@ -1873,12 +1873,12 @@ static bool trans_VMOV_imm_sp(DisasContext *s, arg_VMOV_imm_sp *a)
 
     vd = a->vd;
 
-    if (!dc_isar_feature(aa32_fpshvec, s) &&
-        (veclen != 0 || s->vec_stride != 0)) {
+    if (!dc_isar_feature(aa32_fpsp_v3, s)) {
         return false;
     }
 
-    if (!arm_dc_feature(s, ARM_FEATURE_VFP3)) {
+    if (!dc_isar_feature(aa32_fpshvec, s) &&
+        (veclen != 0 || s->vec_stride != 0)) {
         return false;
     }
 
@@ -1923,7 +1923,7 @@ static bool trans_VMOV_imm_dp(DisasContext *s, arg_VMOV_imm_dp *a)
 
     vd = a->vd;
 
-    if (!dc_isar_feature(aa32_fpdp_v2, s)) {
+    if (!dc_isar_feature(aa32_fpdp_v3, s)) {
         return false;
     }
 
@@ -1937,10 +1937,6 @@ static bool trans_VMOV_imm_dp(DisasContext *s, arg_VMOV_imm_dp *a)
         return false;
     }
 
-    if (!arm_dc_feature(s, ARM_FEATURE_VFP3)) {
-        return false;
-    }
-
     if (!vfp_access_check(s)) {
         return true;
     }
@@ -2565,7 +2561,7 @@ static bool trans_VCVT_fix_sp(DisasContext *s, arg_VCVT_fix_sp *a)
     TCGv_ptr fpst;
     int frac_bits;
 
-    if (!arm_dc_feature(s, ARM_FEATURE_VFP3)) {
+    if (!dc_isar_feature(aa32_fpsp_v3, s)) {
         return false;
     }
 
@@ -2625,11 +2621,7 @@ static bool trans_VCVT_fix_dp(DisasContext *s, arg_VCVT_fix_dp *a)
     TCGv_ptr fpst;
     int frac_bits;
 
-    if (!dc_isar_feature(aa32_fpdp_v2, s)) {
-        return false;
-    }
-
-    if (!arm_dc_feature(s, ARM_FEATURE_VFP3)) {
+    if (!dc_isar_feature(aa32_fpdp_v3, s)) {
         return false;
     }
 
-- 
2.20.1

