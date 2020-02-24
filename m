Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp844695lfg;
        Mon, 24 Feb 2020 14:24:31 -0800 (PST)
X-Google-Smtp-Source: APXvYqzniNU2G7RbvkiLsly1Ae4BccurhHaOLzZ8BOX3SPRvf2di1gOoMNT2Mlf/sJO+pGm9wHSY
X-Received: by 2002:ac8:5205:: with SMTP id r5mr52380721qtn.230.1582583071124;
        Mon, 24 Feb 2020 14:24:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582583071; cv=none;
        d=google.com; s=arc-20160816;
        b=TcsLfXyyWke/dbO/PiAnXhQhc1qt8Td/3T8NvimSFIm3uWQatLHTtPylio7PXQngyZ
         k4CxoilSEf5Vx00YgQqgd3dsYxSxJQXy2ds1VLai+lFtEY9Z/BZxly8BpAVuc2+jOfAn
         sMpAQkBphR9PREQh3L1qvyHFoF7KB3dsJSPuJ88e1do6zoJX2Ssir/pdJJ8tBn60gH0a
         laCIOSy0CQ7z4cTf3uFEyXR9kf7Qs4v6kCIaTnxWtGBgipXVLxrcz0PFy74p94M4/p9Y
         6mJyED3BGnFIWSf0lM1JtwInct0dDr+u2LvCP9teLOZ2G3+1cpMDIZyWXYlDnA6Ybp1n
         cQvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=ABqg53SHadErlQ1KJw2EVsyG66DudT3m5ptP92s2kV4=;
        b=mU0HZoqwnjasxMhpQjfX8BJfHPKlOrjxOTJrh00jMomS7kcjwie2hEe1+o47ECH3E7
         b9mebDv+BV1yxdMJYFtbzLGy2PFNWcDRCfjW79cAG7RROxhEe2Ckg1g57kcHfx9kRhDh
         rw+1Mhbp3JV7yc1P8ouJtyLpvGey6VHKS9aJNO44E7RE9f55WWCHcM9jNHxAzwn80ocp
         EIh+82oNs6+RZwZ/w3ISsnsg26Jc4NP7VOc/UPDvZjoH1/iqLOK+r+BXzY/ZyaU9pE51
         GxGbxTDODw4IKhLt4c5YZcMTQGW5SQc0s2RhVdG+q0IOlV04o0IfnMAxQ/CRVcmPXMko
         0KMg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="ml/LGDeM";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y82si6527357qkb.103.2020.02.24.14.24.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 Feb 2020 14:24:31 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="ml/LGDeM";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j6M9O-0007b8-AO
	for alex.bennee@linaro.org; Mon, 24 Feb 2020 17:24:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37870)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1j6M7k-0004NP-MS
 for qemu-arm@nongnu.org; Mon, 24 Feb 2020 17:22:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1j6M7j-0005s7-8g
 for qemu-arm@nongnu.org; Mon, 24 Feb 2020 17:22:48 -0500
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441]:36364)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1j6M7j-0005rr-2d
 for qemu-arm@nongnu.org; Mon, 24 Feb 2020 17:22:47 -0500
Received: by mail-pf1-x441.google.com with SMTP id 185so6081860pfv.3
 for <qemu-arm@nongnu.org>; Mon, 24 Feb 2020 14:22:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ABqg53SHadErlQ1KJw2EVsyG66DudT3m5ptP92s2kV4=;
 b=ml/LGDeM83+tA/QuI9WQvvsXX+P52t3WEQ5SAtw+bAXUiCz0nN4ReHgPEwUqPnhZsD
 fvaMa4fOI+ttGPyxkAZ9L1Lmrvf8zS1PcbbxL1VHrWWls1eInuHQnSTvLqjuv3VJ/z6j
 xEknPQQu8h1NZrIAz9KLGE92mSw1cUXs3TPPo7TxBramSMrtftYEeINKRFenVtvGrtQ3
 ag2l6KyYT3IwXljfc13/ciUf7TWjY2fEQfAAmXsfiZFwCaVutE8sSFASLtWEi1hibzgz
 fXsfpQNt1C1TKFcdttXosEUF7SQv5UM7zM4I4khWEUSsKbbDQSICfBSyAWs4adBpF/uL
 +Kcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ABqg53SHadErlQ1KJw2EVsyG66DudT3m5ptP92s2kV4=;
 b=mEBs/fuhfr1anxD0wOjT6OLdB0F0+a5b8U7hQn8gQttSC/OTMDkCRC/doYnsXdgQQ8
 dvwOp0LMJ/29uprI3z4G8dWBTqbcB28wjc1a6LKePEeWX9g2Jm6UERGHtPl2Ek9xhyNW
 uHXiQSsOH1W++lSuR2DMR8BoaiKGI9uuOWQZvISDMWtAwNK0R8uaqLJyJ8Qdd1DIKoAG
 bAgRp9lYJ6NBm2Xeb58hWETUJvjqmQ7mVOFT4ghsdoKxKWWmRdBL+9x7xxW3khICEqKr
 Zlu/d7oj50xN2F97jS9uJ9pi/x8HBSf3mrQt2dYn55lYR4UFvoH98QRJhj/S4iJtGEWz
 g2Lg==
X-Gm-Message-State: APjAAAV564aYmIDhS0SVy40jldwj0GfzWcyzohABuA7tDa3Qk032Njxi
 arI5lFvu+VX1+cw3nnG8X61QFA==
X-Received: by 2002:a65:5905:: with SMTP id f5mr17972398pgu.87.1582582966092; 
 Mon, 24 Feb 2020 14:22:46 -0800 (PST)
Received: from localhost.localdomain (97-126-123-70.tukw.qwest.net.
 [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id o6sm13897097pgg.37.2020.02.24.14.22.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Feb 2020 14:22:45 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 09/17] target/arm: Replace ARM_FEATURE_VFP4 with
 isar_feature_aa32_simdfmac
Date: Mon, 24 Feb 2020 14:22:24 -0800
Message-Id: <20200224222232.13807-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200224222232.13807-1-richard.henderson@linaro.org>
References: <20200224222232.13807-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::441
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
X-TUID: g60DHW95Gcaj

All remaining tests for VFP4 are for fused multiply-add insns.

Since the MVFR1 field is used for both VFP and NEON, move its adjustment
from the !has_neon block to the (!has_vfp && !has_neon) block.

Test for vfp of the appropraite width alongside the test for simdfmac
within translate-vfp.inc.c.  Within disas_neon_data_insn, we have
already tested for ARM_FEATURE_NEON.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v2: Applied Peter's fixups, plus test fpdp_v2 in trans_VFM_dp.
---
 target/arm/cpu.h               | 12 ++++++++++++
 target/arm/cpu.c               |  6 +++++-
 target/arm/translate-vfp.inc.c | 22 ++++++++++++++++++----
 target/arm/translate.c         |  2 +-
 4 files changed, 36 insertions(+), 6 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index b94d2a5ace..b29b0eddfc 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -3514,6 +3514,18 @@ static inline bool isar_feature_aa32_fp16_dpconv(const ARMISARegisters *id)
     return FIELD_EX32(id->mvfr1, MVFR1, FPHP) > 1;
 }
 
+/*
+ * Note that this ID register field covers both VFP and Neon FMAC,
+ * so should usually be tested in combination with some other
+ * check that confirms the presence of whichever of VFP or Neon is
+ * relevant, to avoid accidentally enabling a Neon feature on
+ * a VFP-no-Neon core or vice-versa.
+ */
+static inline bool isar_feature_aa32_simdfmac(const ARMISARegisters *id)
+{
+    return FIELD_EX32(id->mvfr1, MVFR1, SIMDFMAC) != 0;
+}
+
 static inline bool isar_feature_aa32_vsel(const ARMISARegisters *id)
 {
     return FIELD_EX32(id->mvfr2, MVFR2, FPMISC) >= 1;
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index f10f34b655..bdcaa46b8a 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1501,7 +1501,6 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
         u = FIELD_DP32(u, MVFR1, SIMDINT, 0);
         u = FIELD_DP32(u, MVFR1, SIMDSP, 0);
         u = FIELD_DP32(u, MVFR1, SIMDHP, 0);
-        u = FIELD_DP32(u, MVFR1, SIMDFMAC, 0);
         cpu->isar.mvfr1 = u;
 
         u = cpu->isar.mvfr2;
@@ -1524,6 +1523,11 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
         u = cpu->isar.mvfr0;
         u = FIELD_DP32(u, MVFR0, SIMDREG, 0);
         cpu->isar.mvfr0 = u;
+
+        /* Despite the name, this field covers both VFP and Neon */
+        u = cpu->isar.mvfr1;
+        u = FIELD_DP32(u, MVFR1, SIMDFMAC, 0);
+        cpu->isar.mvfr1 = u;
     }
 
     if (arm_feature(env, ARM_FEATURE_AARCH64) &&
diff --git a/target/arm/translate-vfp.inc.c b/target/arm/translate-vfp.inc.c
index f88a95438f..03ba8d7aac 100644
--- a/target/arm/translate-vfp.inc.c
+++ b/target/arm/translate-vfp.inc.c
@@ -1803,11 +1803,18 @@ static bool trans_VFM_sp(DisasContext *s, arg_VFM_sp *a)
 
     /*
      * Present in VFPv4 only.
+     * Note that we can't rely on the SIMDFMAC check alone, because
+     * in a Neon-no-VFP core that ID register field will be non-zero.
+     */
+    if (!dc_isar_feature(aa32_simdfmac, s) ||
+        !dc_isar_feature(aa32_fpsp_v2, s)) {
+        return false;
+    }
+    /*
      * In v7A, UNPREDICTABLE with non-zero vector length/stride; from
      * v8A, must UNDEF. We choose to UNDEF for both v7A and v8A.
      */
-    if (!arm_dc_feature(s, ARM_FEATURE_VFP4) ||
-        (s->vec_len != 0 || s->vec_stride != 0)) {
+    if (s->vec_len != 0 || s->vec_stride != 0) {
         return false;
     }
 
@@ -1861,11 +1868,18 @@ static bool trans_VFM_dp(DisasContext *s, arg_VFM_dp *a)
 
     /*
      * Present in VFPv4 only.
+     * Note that we can't rely on the SIMDFMAC check alone, because
+     * in a Neon-no-VFP core that ID register field will be non-zero.
+     */
+    if (!dc_isar_feature(aa32_simdfmac, s) ||
+        !dc_isar_feature(aa32_fpdp_v2, s)) {
+        return false;
+    }
+    /*
      * In v7A, UNPREDICTABLE with non-zero vector length/stride; from
      * v8A, must UNDEF. We choose to UNDEF for both v7A and v8A.
      */
-    if (!arm_dc_feature(s, ARM_FEATURE_VFP4) ||
-        (s->vec_len != 0 || s->vec_stride != 0)) {
+    if (s->vec_len != 0 || s->vec_stride != 0) {
         return false;
     }
 
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 79880adaad..0489e0cdaa 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -5150,7 +5150,7 @@ static int disas_neon_data_insn(DisasContext *s, uint32_t insn)
             }
             break;
         case NEON_3R_VFM_VQRDMLSH:
-            if (!arm_dc_feature(s, ARM_FEATURE_VFP4)) {
+            if (!dc_isar_feature(aa32_simdfmac, s)) {
                 return 1;
             }
             break;
-- 
2.20.1

