Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp1087667lfc;
        Thu, 12 Mar 2020 12:42:50 -0700 (PDT)
X-Received: by 2002:a63:c550:: with SMTP id g16mr9638302pgd.9.1584042170034;
        Thu, 12 Mar 2020 12:42:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584042170; cv=none;
        d=google.com; s=arc-20160816;
        b=nX40ti8nMMkneIbGSgoG975siwrV8uOb9Ln6OVS+qQ7J7au6fDyZcFlf4JvyIn/YhN
         OTGpinRJsfl2lMEZlYRNFbLBaksLEjMu8effCU8xDufgnTVqy6/fipQzxhBJbxjdBZde
         7p1dSgwc7wJQLZU/YslqGJqfyQFAfNlOT1qo2kHMxSFI0BpD1uDLAlEZtd3z8DGTW4DW
         YFq0w+wZszR7PshAHSOUuHJAzlWB0XMAT++F13BtK8b3dDSoPEQkuL5MfBQ0fMuu8MBl
         dVNctzxF5s0J02eyTbYvRAKhIkVI66SzVvbaKSFKTuREG6Tdfpxtjcm4dgwvRQhVJVbp
         ssxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=KKlja8O+mQ8iXiIKMzNB9d94+lPcoNwMRA3J2mjKmq8=;
        b=vkPVI+Rtfoa+4f3Uto/33bNppeBRQe39rw75oL4IZuk5NrBTP7y+M48tl2O594VyT4
         lxIJ5cm3r/IARQ9QmBsChTRwytngWVKsgak4/ejNyh/uvcdbLmMCPDQIeUAxJWj464WJ
         Nh2eyZJQ8mveRZTXdPsoyXS/949lcsZjbmOS7iZtnSJ5hYU298k2iJiNTz8bz+/V/don
         kKFIabcOBFtOE01iLMC59yECMCIA4YvNTyo1dmaD9EocfDmvuA1RcgT4sa/5Fmdj+ssd
         4xivGM3aKnkFpiuDih7/UcmmdS0SUVWncCfK7k18kayiWVcjvAlSCN9XP9V2IrsCVgHU
         490w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wYhN8mA6;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id gc8sor6812377pjb.3.2020.03.12.12.42.49
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 12 Mar 2020 12:42:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wYhN8mA6;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=KKlja8O+mQ8iXiIKMzNB9d94+lPcoNwMRA3J2mjKmq8=;
        b=wYhN8mA6uSPm/Tx4/2l4L5fu4AxfqE+D69Qh2Mv9sNEgcEPsjyvSVG7yT4lP3WoeqS
         lIPWEZi5xhy+6/NtpLZ82XQocewuKlNS93sBMktampoMCIfv2XEHmeusiVpowLEi9l8e
         xScvoOeYkM7xU3yBTNJnrBdcTlBJ4nCoTrMcSe0S72GesaHL71yeELFRDODhqDR5v4y5
         qQ3wVOZH57QeVzzR0mLHGUxs5JLlM1F0rcY7VOeUiftZuS9PdCmxxQe19fQrxea1nQc2
         3GoTibt0QglDQMcWrbgJrVAINinOpL7N+pflPQSrfv2WevPKI+RkW7TQ+t0tgTjAsSWY
         y/CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KKlja8O+mQ8iXiIKMzNB9d94+lPcoNwMRA3J2mjKmq8=;
        b=Rdj9C7BKgf1hlmF7ODFZHSLpwtl60mBa38yNOZXt3NZDm3DLP2XoV/LCUopl3mxJSg
         f9I8JAfhh+tBOJtEgQ74/elX+W2M2uaKmnOICaDR1igNQNjd17JwdIOD8Kk1tLFDLvpC
         8aRzYmQfrYB7yk5eAZjeRC1i8U878zVa3+07J3GespKfGRKv/e+XP6zqJRdlV1qFRT/J
         0lGe4/VfwXTH97EGmJArW6i6qCGSeFYBMnCTQqYAkwZHPBLCss7CmvABrMovlLlkqsWQ
         xN8RDvYG9C7Scp3AC0UbTp27oAuKiVNHb6e90rhJPSMr6W/ILGkwGSiMCZ/La1DyBda9
         8uog==
X-Gm-Message-State: ANhLgQ10m+siFpPptwaiYbrGKYfLqZPwDpAD6bTO/rr/8C6hIXoOWThC
	mKr46O4J8r0Ocj8jP8LsGTNdQznr
X-Google-Smtp-Source: ADFU+vs6zUp6jh3jMdvmlgJr5UGtJgbToN8tyNH1VixeWHlIFRPisZjfbENGdKrsHyZFU5xeh4WrBw==
X-Received: by 2002:a17:90a:7348:: with SMTP id j8mr4584415pjs.63.1584042169514;
        Thu, 12 Mar 2020 12:42:49 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (97-126-123-70.tukw.qwest.net. [97.126.123.70])
        by smtp.gmail.com with ESMTPSA id g69sm6824842pje.34.2020.03.12.12.42.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2020 12:42:48 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org,
	alex.bennee@linaro.org
Subject: [PATCH v6 21/42] target/arm: Move regime_el to internals.h
Date: Thu, 12 Mar 2020 12:41:58 -0700
Message-Id: <20200312194219.24406-22-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200312194219.24406-1-richard.henderson@linaro.org>
References: <20200312194219.24406-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: PLcTCiRzZd4o

We will shortly need this in mte_helper.c as well.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/internals.h | 36 ++++++++++++++++++++++++++++++++++++
 target/arm/helper.c    | 36 ------------------------------------
 2 files changed, 36 insertions(+), 36 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index 3190fc40fc..f091891312 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -912,6 +912,42 @@ static inline bool regime_is_pan(CPUARMState *env, ARMMMUIdx mmu_idx)
     }
 }
 
+/* Return the exception level which controls this address translation regime */
+static inline uint32_t regime_el(CPUARMState *env, ARMMMUIdx mmu_idx)
+{
+    switch (mmu_idx) {
+    case ARMMMUIdx_E20_0:
+    case ARMMMUIdx_E20_2:
+    case ARMMMUIdx_E20_2_PAN:
+    case ARMMMUIdx_Stage2:
+    case ARMMMUIdx_E2:
+        return 2;
+    case ARMMMUIdx_SE3:
+        return 3;
+    case ARMMMUIdx_SE10_0:
+        return arm_el_is_aa64(env, 3) ? 1 : 3;
+    case ARMMMUIdx_SE10_1:
+    case ARMMMUIdx_SE10_1_PAN:
+    case ARMMMUIdx_Stage1_E0:
+    case ARMMMUIdx_Stage1_E1:
+    case ARMMMUIdx_Stage1_E1_PAN:
+    case ARMMMUIdx_E10_0:
+    case ARMMMUIdx_E10_1:
+    case ARMMMUIdx_E10_1_PAN:
+    case ARMMMUIdx_MPrivNegPri:
+    case ARMMMUIdx_MUserNegPri:
+    case ARMMMUIdx_MPriv:
+    case ARMMMUIdx_MUser:
+    case ARMMMUIdx_MSPrivNegPri:
+    case ARMMMUIdx_MSUserNegPri:
+    case ARMMMUIdx_MSPriv:
+    case ARMMMUIdx_MSUser:
+        return 1;
+    default:
+        g_assert_not_reached();
+    }
+}
+
 /* Return the FSR value for a debug exception (watchpoint, hardware
  * breakpoint or BKPT insn) targeting the specified exception level.
  */
diff --git a/target/arm/helper.c b/target/arm/helper.c
index f9daeec1f4..2a50d4e9a2 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -9753,42 +9753,6 @@ void arm_cpu_do_interrupt(CPUState *cs)
 }
 #endif /* !CONFIG_USER_ONLY */
 
-/* Return the exception level which controls this address translation regime */
-static uint32_t regime_el(CPUARMState *env, ARMMMUIdx mmu_idx)
-{
-    switch (mmu_idx) {
-    case ARMMMUIdx_E20_0:
-    case ARMMMUIdx_E20_2:
-    case ARMMMUIdx_E20_2_PAN:
-    case ARMMMUIdx_Stage2:
-    case ARMMMUIdx_E2:
-        return 2;
-    case ARMMMUIdx_SE3:
-        return 3;
-    case ARMMMUIdx_SE10_0:
-        return arm_el_is_aa64(env, 3) ? 1 : 3;
-    case ARMMMUIdx_SE10_1:
-    case ARMMMUIdx_SE10_1_PAN:
-    case ARMMMUIdx_Stage1_E0:
-    case ARMMMUIdx_Stage1_E1:
-    case ARMMMUIdx_Stage1_E1_PAN:
-    case ARMMMUIdx_E10_0:
-    case ARMMMUIdx_E10_1:
-    case ARMMMUIdx_E10_1_PAN:
-    case ARMMMUIdx_MPrivNegPri:
-    case ARMMMUIdx_MUserNegPri:
-    case ARMMMUIdx_MPriv:
-    case ARMMMUIdx_MUser:
-    case ARMMMUIdx_MSPrivNegPri:
-    case ARMMMUIdx_MSUserNegPri:
-    case ARMMMUIdx_MSPriv:
-    case ARMMMUIdx_MSUser:
-        return 1;
-    default:
-        g_assert_not_reached();
-    }
-}
-
 uint64_t arm_sctlr(CPUARMState *env, int el)
 {
     /* Only EL0 needs to be adjusted for EL1&0 or EL2&0. */
-- 
2.20.1
