Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp846845lfg;
        Mon, 24 Feb 2020 14:27:27 -0800 (PST)
X-Google-Smtp-Source: APXvYqx0c7rfKIn0c4jCVzEptMreTXAneCp1HJrD3FmYMct7FavL4eCBI3hC7nvj8DEGjULussqC
X-Received: by 2002:ac8:8e7:: with SMTP id y36mr50800101qth.26.1582583247038;
        Mon, 24 Feb 2020 14:27:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582583247; cv=none;
        d=google.com; s=arc-20160816;
        b=ts2EW1akIRQZkAzrBjauSj6VjgeFWjeeiU7zqbZ3Cmy3s7/Ixa2wc8BbpzbaN493Xz
         BeNlt8IdNBMCWJN8U3HgGA5j23fxy+CEWo/RLuhiN7MVBs1EuPXsvNeYEKIx5MmAi71C
         i/gl6MZ99kv+Zo3OwePPXaCARItJLD8jX2PKuMTVrokCotRzWnrkdI+Qt2/J9sZd3taY
         gG9SUBFUEfFVxntRL1gD2dRxl4jokJclNuI5+eA/5aWRyUs4swo6iPtnnJUBoBH3uKjT
         TTZ8oVYqFiN3TZdDiqXjqKTbgEsyzkQxQSE/LfytAYRVr4iWmYKLJSuXQKks/ebTdYWy
         55nQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=+oOoLUU3WLw+5ICoiVu4+Hc3ZhB0R58hfDF27U8damo=;
        b=aOnrGOehNjB9SHSfmH0ELjVCuc8/MlUAkWGlwV804k76RFVSxlxfcV3mjoo2CVtxzi
         DCu7tdWDKqiHLDEv+AW1eJ3Glvz8cgd5yZ2gFC2wV9GiUicTecTyItw3TJm08MapspwU
         mLLBWBNXFgyePqtNnFZ67jdrp8m1IQ4FxmeX4eC717W4WE1EdTR7JSsuZeJjbHEYjQdt
         xHGXOPogb4iv2To/qyvjvioMFggfbnBMomMH4Em4+eETJg/lKvEkwpzgirK8XhLGtrES
         WnUXnlsMoRZhMl/JA7qMyyKC7L+CtqporJy/3GU5hZUgcXFeL+cyMEEnSL9b2/7jivnv
         lzdw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rdl7P8Hq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l19si5980115qvt.203.2020.02.24.14.27.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 Feb 2020 14:27:27 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rdl7P8Hq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j6MCE-0004Vy-F9
	for alex.bennee@linaro.org; Mon, 24 Feb 2020 17:27:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37978)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1j6M7q-0004b7-3K
 for qemu-arm@nongnu.org; Mon, 24 Feb 2020 17:22:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1j6M7o-0005vs-V1
 for qemu-arm@nongnu.org; Mon, 24 Feb 2020 17:22:54 -0500
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541]:46340)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1j6M7o-0005vM-PE
 for qemu-arm@nongnu.org; Mon, 24 Feb 2020 17:22:52 -0500
Received: by mail-pg1-x541.google.com with SMTP id y30so5817925pga.13
 for <qemu-arm@nongnu.org>; Mon, 24 Feb 2020 14:22:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+oOoLUU3WLw+5ICoiVu4+Hc3ZhB0R58hfDF27U8damo=;
 b=rdl7P8Hq3/Kg6rc5J+JkXLQCkrD0N+nW18ABtWYzqGWWkBGsh7eEjsudKWGDZ7ZfEY
 wZoQL1mW+Hc49keUzSaVOAlix7bgnO1oLscek8OrwZ32UHD6WQoIgb+ZdMIm1eXyYzbU
 UAa4rWrVsgHqo601t0T5xz00ihQS1EL0lCeJgC/jyJAQzcLyattgoA717oZhwROmD7Q4
 tTDjkP/nIgC5ApOYGOu7JhW7323wE4rWCpGlZylwqmLrMdlWxl28SNhzcfjyff7dOvcj
 wMLhEU7rGOCfm1JNTy7p8quWT4edfyC1/VPbxboWZUjgZUqv4wxOIuM1XYNTe/FSWHV/
 OkkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+oOoLUU3WLw+5ICoiVu4+Hc3ZhB0R58hfDF27U8damo=;
 b=KcEaos6Fa1nIVSBLiSHOEwCqgwdnRAsrqN05x0aWoym99iGNv9pMmDeEftr8uHoWgt
 0kBVY5E9XkFOrgF5d8KhNYrJhh/6JQpC7MKbnG/HyiIiLCQlQ9CvOCY550uL+o1IX+gU
 eqrSr1C890iTxfv2QcylhtWyBl+Zr65M+1XKLC2mLzQMGP7tdGxj/jc0qw5T3vm4qSBv
 EGEmDxZ5XvDk5aCnWYyJ6hg34ukbFh9aVrcU9fpXilQb7jBweydZKA6hphatuuFe7m5Q
 Co5D2G4yKE9DQ+qIBZbvRqOlYDc+5qAuXKYj8VWhz5ZgrvN0tQjaMmySEksDdfP70Xy1
 1lJw==
X-Gm-Message-State: APjAAAVfnPlpZUOb+cjwMW9vljNtYLHPn8FEZI99c9WHt4GJG4j+HMWI
 fceWPL5Yik3F6flqgHUbdSicMQ==
X-Received: by 2002:a62:1dca:: with SMTP id
 d193mr54769709pfd.140.1582582971891; 
 Mon, 24 Feb 2020 14:22:51 -0800 (PST)
Received: from localhost.localdomain (97-126-123-70.tukw.qwest.net.
 [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id o6sm13897097pgg.37.2020.02.24.14.22.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Feb 2020 14:22:51 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 13/17] linux-user/arm: Replace ARM_FEATURE_VFP* tests for
 HWCAP
Date: Mon, 24 Feb 2020 14:22:28 -0800
Message-Id: <20200224222232.13807-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200224222232.13807-1-richard.henderson@linaro.org>
References: <20200224222232.13807-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::541
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
X-TUID: qSp+VdFYNI/y

Use isar feature tests instead of feature bit tests.

Although none of QEMUs current cpus have VFPv3 without D32,
replace the large comment explaining why with one line that
sets ARM_HWCAP_ARM_VFPv3D16 under the correct conditions.
Mirror the test sequence used in the linux kernel.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v2: Use isar_feature_aa32_vfp.
---
 linux-user/elfload.c | 23 +++++++++++++----------
 1 file changed, 13 insertions(+), 10 deletions(-)

diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index b1a895f24c..86cda127b7 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -468,22 +468,25 @@ static uint32_t get_elf_hwcap(void)
 
     /* EDSP is in v5TE and above, but all our v5 CPUs are v5TE */
     GET_FEATURE(ARM_FEATURE_V5, ARM_HWCAP_ARM_EDSP);
-    GET_FEATURE(ARM_FEATURE_VFP, ARM_HWCAP_ARM_VFP);
     GET_FEATURE(ARM_FEATURE_IWMMXT, ARM_HWCAP_ARM_IWMMXT);
     GET_FEATURE(ARM_FEATURE_THUMB2EE, ARM_HWCAP_ARM_THUMBEE);
     GET_FEATURE(ARM_FEATURE_NEON, ARM_HWCAP_ARM_NEON);
-    GET_FEATURE(ARM_FEATURE_VFP3, ARM_HWCAP_ARM_VFPv3);
     GET_FEATURE(ARM_FEATURE_V6K, ARM_HWCAP_ARM_TLS);
-    GET_FEATURE(ARM_FEATURE_VFP4, ARM_HWCAP_ARM_VFPv4);
+    GET_FEATURE(ARM_FEATURE_LPAE, ARM_HWCAP_ARM_LPAE);
     GET_FEATURE_ID(aa32_arm_div, ARM_HWCAP_ARM_IDIVA);
     GET_FEATURE_ID(aa32_thumb_div, ARM_HWCAP_ARM_IDIVT);
-    /* All QEMU's VFPv3 CPUs have 32 registers, see VFP_DREG in translate.c.
-     * Note that the ARM_HWCAP_ARM_VFPv3D16 bit is always the inverse of
-     * ARM_HWCAP_ARM_VFPD32 (and so always clear for QEMU); it is unrelated
-     * to our VFP_FP16 feature bit.
-     */
-    GET_FEATURE(ARM_FEATURE_VFP3, ARM_HWCAP_ARM_VFPD32);
-    GET_FEATURE(ARM_FEATURE_LPAE, ARM_HWCAP_ARM_LPAE);
+    GET_FEATURE_ID(aa32_vfp, ARM_HWCAP_ARM_VFP);
+
+    if (cpu_isar_feature(aa32_fpsp_v3, cpu) ||
+        cpu_isar_feature(aa32_fpdp_v3, cpu)) {
+        hwcaps |= ARM_HWCAP_ARM_VFPv3;
+        if (cpu_isar_feature(aa32_simd_r32, cpu)) {
+            hwcaps |= ARM_HWCAP_ARM_VFPD32;
+        } else {
+            hwcaps |= ARM_HWCAP_ARM_VFPv3D16;
+        }
+    }
+    GET_FEATURE_ID(aa32_simdfmac, ARM_HWCAP_ARM_VFPv4);
 
     return hwcaps;
 }
-- 
2.20.1

