Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp55505lfm;
        Thu, 25 Jun 2020 20:47:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzVufjDlOqhrc+fIkC/l6NLyTnB9DRDSbMbyyB1fbhIK7C3kwyTIgh0bIYG8/xZhiivy3C2
X-Received: by 2002:a5b:58f:: with SMTP id l15mr1912087ybp.236.1593143267982;
        Thu, 25 Jun 2020 20:47:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593143267; cv=none;
        d=google.com; s=arc-20160816;
        b=y2JoTd9DDW9qg/pV5NOtQkqNTFd64KbJw5bXEe68uev59Yr+yDm95csjzEoPz/3x3X
         N/OphTsINGnWDGNNElwF3z+YUBtEt1B66OKG4u/xAjjqVuqWaBKKO4PHMSZdoQkVu8Yc
         LoRq1lkyabVl9WEx1xknNbNcistNNeAJNFu8Kz+ZQtURiuDHJik2KBfkeYz4K5O9yj7R
         zHfDKwnW4I5mdy5Q647otxXAXG4vw8Dp3yUQf21aQHeGUaoWZCLCzOWCT1yohjussAcm
         zkLwPnMK2AbEyjUm6Sm0P0BRbAg6uLi131LatDwQ+X1Kg0OfG3ybl/uIeZPq4VfAPdmT
         zhHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=2dxpfAALNb5XPHu6yGNW/9lvY8jd7zeVUnhvGixmCRk=;
        b=fUdcsp4xW4SfUGmg473hShfKenGVOkh9aCpqbULOUr9VthFUFQysy+QXk3gf6Xtic8
         Gf4YsWjekYajYdVbqQf1BZROMnLlp6w3No4ukaPJQAzS191jn4bRuEM8/Br3m8viv5F4
         gpe0XID+gL9uiTRHjLrDrGEwfP7MOeHpP1o5f4N1X/s/wq2Zd6mzlPWciYHZfwPmCS7D
         FbPB26Mo2MUIF2cZ54J1pib0/TZ+6oLajNdvnVnrabML82+84cQA7jwsEm3qS7MjxoFW
         GQm72t22khli8V8QENeFZZaNP9r0GVHQn2DjHKvHzmyk1fDnnmLpN0lgJrgt7uP4Xd+T
         e9XQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="kljY/tg6";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i201si23709367yba.183.2020.06.25.20.47.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 Jun 2020 20:47:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="kljY/tg6";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39378 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jofL9-0003aN-BJ
	for alex.bennee@linaro.org; Thu, 25 Jun 2020 23:47:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jof6O-0000pR-FT
 for qemu-arm@nongnu.org; Thu, 25 Jun 2020 23:32:32 -0400
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641]:33139)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jof6M-00021y-OH
 for qemu-arm@nongnu.org; Thu, 25 Jun 2020 23:32:32 -0400
Received: by mail-pl1-x641.google.com with SMTP id 35so3770059ple.0
 for <qemu-arm@nongnu.org>; Thu, 25 Jun 2020 20:32:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2dxpfAALNb5XPHu6yGNW/9lvY8jd7zeVUnhvGixmCRk=;
 b=kljY/tg6Bistn9AWqo8DXLls8tbqdXIGjUwRIYsToIvVMzlbCHSNRC+kwe8m3RN17D
 ohgsa338k+hriVsFYaW635R1rr/PtfFGlGgnojo5oLvpXoDmMtMjzXHEoRxxRdIIDseQ
 3ztNDSjJekgvyFvqGFxRtBOwplSOP04HMLXbVbSnP5vcuHYn9IaTE5Y9cyX8bOsYLJ+z
 UYjihISs6+X3+GsKM03LlxG2mFDM+iD/ShrSftjk0NghDV8sSt9HJNgrjRMSnV0KO6Nd
 rgBo5AO5+ZPf2BzmD1rUz/jK6OH+9v1JzOmEU0UYyNFDZf5AZLZWCehLy+38uPiXbvX/
 pcyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2dxpfAALNb5XPHu6yGNW/9lvY8jd7zeVUnhvGixmCRk=;
 b=iqGFRp6FIFTHwjIVyTWz+ZTLdYEA0TMPlb2mmRmC05lb4X2cktFUwCBFsnNVUaRNZy
 EAeLQ3SB3CgPrB71TD0RwEse14fuYpzIr/4ANMNTO7vtSEcr8z8q8HfV2kN+LLj17AYb
 QHbcJP4CKaIXJNy97ZT3JEp3cwHK+67KM50Tbk1C26tkUkkg5Hof+VwO/3TF4g6wj2t/
 MJ0IODCp5NHOVQHAA19fQdSs4RBUsxw9jcmU5ygueHDwQDatcRpeT5c9sLgD8dDPyH/C
 uDW+kKLF8aH0oaCG/IXSBV8NVRNFssQ/LPto58sxliEO7pKyR9jvysEWEotty63IB/5y
 j2zw==
X-Gm-Message-State: AOAM530xgKT0XxbVTQaQzn5kz31MZ2pfiyw9jIE/PwZCD42k51y1SyU4
 xpI7/YqGvTvANy0Abgf+jYLiBw==
X-Received: by 2002:a17:902:8a96:: with SMTP id
 p22mr882471plo.281.1593142349428; 
 Thu, 25 Jun 2020 20:32:29 -0700 (PDT)
Received: from localhost.localdomain (174-21-143-238.tukw.qwest.net.
 [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id y27sm1605256pgc.56.2020.06.25.20.32.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Jun 2020 20:32:28 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v9 32/46] target/arm: Add arm_tlb_bti_gp
Date: Thu, 25 Jun 2020 20:31:30 -0700
Message-Id: <20200626033144.790098-33-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200626033144.790098-1-richard.henderson@linaro.org>
References: <20200626033144.790098-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::641;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x641.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, david.spickett@linaro.org,
 steplong@quicinc.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: mWYmj4l2/CGX

Introduce an lvalue macro to wrap target_tlb_bit0.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h           | 13 +++++++++++++
 target/arm/helper.c        |  2 +-
 target/arm/translate-a64.c |  2 +-
 3 files changed, 15 insertions(+), 2 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index cb4f6ba69f..c54f0ab18a 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -3393,6 +3393,19 @@ static inline uint64_t *aa64_vfp_qreg(CPUARMState *env, unsigned regno)
 /* Shared between translate-sve.c and sve_helper.c.  */
 extern const uint64_t pred_esz_masks[4];
 
+/* Helper for the macros below, validating the argument type. */
+static inline MemTxAttrs *typecheck_memtxattrs(MemTxAttrs *x)
+{
+    return x;
+}
+
+/*
+ * Lvalue macros for ARM TLB bits that we must cache in the TCG TLB.
+ * Using these should be a bit more self-documenting than using the
+ * generic target bits directly.
+ */
+#define arm_tlb_bti_gp(x) (typecheck_memtxattrs(x)->target_tlb_bit0)
+
 /*
  * Naming convention for isar_feature functions:
  * Functions which test 32-bit ID registers should have _aa32_ in
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 33f902387b..44a3f9fb48 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -11079,7 +11079,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, target_ulong address,
     }
     /* When in aarch64 mode, and BTI is enabled, remember GP in the IOTLB.  */
     if (aarch64 && guarded && cpu_isar_feature(aa64_bti, cpu)) {
-        txattrs->target_tlb_bit0 = true;
+        arm_tlb_bti_gp(txattrs) = true;
     }
 
     if (cacheattrs != NULL) {
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index a2a8280010..7a3774bfda 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -14434,7 +14434,7 @@ static bool is_guarded_page(CPUARMState *env, DisasContext *s)
      * table entry even for that case.
      */
     return (tlb_hit(entry->addr_code, addr) &&
-            env_tlb(env)->d[mmu_idx].iotlb[index].attrs.target_tlb_bit0);
+            arm_tlb_bti_gp(&env_tlb(env)->d[mmu_idx].iotlb[index].attrs));
 #endif
 }
 
-- 
2.25.1

