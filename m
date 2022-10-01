Received: by 2002:a8a:1193:0:0:0:0:0 with SMTP id m19csp461984ocs;
        Sat, 1 Oct 2022 09:31:25 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM58309MV0H8ROq6oxSiPzXk4cAu8X0X6IWhkLUAfTWEba2LlNlJFitt61Cqy80J7yittRE4
X-Received: by 2002:a05:6214:62c:b0:4aa:b05d:c5b8 with SMTP id a12-20020a056214062c00b004aab05dc5b8mr11303274qvx.49.1664641885021;
        Sat, 01 Oct 2022 09:31:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1664641885; cv=none;
        d=google.com; s=arc-20160816;
        b=QeP1tKeuET6BjKH3Y1pBw8VYuE/Xe0zRNX182w61inaGGuWOF2bdk8cVRsdrxPMFei
         /4nxkPIC1JiL+GjMFQP+ByD9+4ifLceEBV6DW1BQyTNIq4FHCHqnbPMx13Ldiuqa72cv
         qhxUx9z3iqSODypv+B/8fsY4qefPKbw9LtcfWo7qdS+3x9tx37ImdjcN0cNmR0gXcO9V
         OEs6esyLXX0vX467wtzUmDlNtIi7V2cg7TkFL93ezP7cFlGmC60buHOq6lThljdQ9tNO
         wHp9G3Qdp96hmP+uRVOZwSYcpkyLTfLO/qHtC9y9mVBM9/pGe7KM7BEBH69dlcWEydlj
         p6Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=05f/pRTmfbp1ZrlM5+i+EnCZM40Ehp5l9D83IpJHRPk=;
        b=gnbDC0AX0lEhgJUdOahk1sdijzewIidIDobYhyKjp+8LgXjKD9M8FsQCdfkBEgjGKK
         pfdTL/wXCkwAez8rS2ahj96Bo6iZLDtRjshtD9E6206poqs2OigoX6LbaqN9mCSiQMSj
         tWUuxPxmy3wCojWEa2yHNmlRbAQkIOMz/cR+zBLLOJgfZtJ4ua3oLEnpzQsE/p+I4Q/+
         5j+nZL3I/DERP9+Khvt2UtPTYEnC2lw15NNowPs5N/rSxPy7JmcgKBE5Wjy0c+kuoT7z
         pO+mqe8s2u4Kag/ZsWMpZeytQ04yp6RQLpnEd81bDCXrQdVbigy9juLX5lFkQ67QIgsa
         BMyA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zxpKqWa+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id cb19-20020a05622a1f9300b0035d477556dcsi2743237qtb.631.2022.10.01.09.31.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 01 Oct 2022 09:31:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zxpKqWa+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oefOe-0003US-JY
	for alex.bennee@linaro.org; Sat, 01 Oct 2022 12:31:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oefHO-0006ji-K7
 for qemu-arm@nongnu.org; Sat, 01 Oct 2022 12:23:58 -0400
Received: from mail-qk1-x72c.google.com ([2607:f8b0:4864:20::72c]:36638)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oefHD-0006GA-Sl
 for qemu-arm@nongnu.org; Sat, 01 Oct 2022 12:23:48 -0400
Received: by mail-qk1-x72c.google.com with SMTP id i3so4548947qkl.3
 for <qemu-arm@nongnu.org>; Sat, 01 Oct 2022 09:23:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=05f/pRTmfbp1ZrlM5+i+EnCZM40Ehp5l9D83IpJHRPk=;
 b=zxpKqWa+hznlM2ZjOZBZoCOxoLdu8sd6U9Q0GrxUgOVUka+ZxWgnP+ZF68U1H/DioN
 jloc7IPFjFZPgjQyOOygsGj0DGOXROYbn+8TSN5Ir6et3AKDlDHKGU4SI5Q2Aic9IF8F
 4GqzVpXr9F3kcpExgJfsGypFmukYDHuvIw2+bIhGZFVMK49naFwV3YZn2XqRdSv/52lO
 9vl5SyL0TpJdo5KJHWqGdhPxjiHmXaYz4Lwu01K1QPaiFSgG4KoNWL5ZHPMpUcmG/sn6
 2nKEeZ/g9tAO7zr6boRj1SdH15CbKtI5BAetrLWKq6KlNLwJP9fmQUEeLsdqqVnLm0P1
 bsnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=05f/pRTmfbp1ZrlM5+i+EnCZM40Ehp5l9D83IpJHRPk=;
 b=NgiWEhBnJIaHMiCACbUxwoN0Cj9U0NYsg6cdxZC4+ou/DQLs1cEyxRDcgIAKHFQF0I
 Psv9gjZHpbhVOlHiqJibAP2HjYM6WwJY3qvYkRDzMBVXei0eQCt+Q3zg1hx4R/8Omrq3
 nwXvsSNVqbBDrm8COnai6wOZaFpzIFroQ3JP1cSfp81zwXU1f6xWUrflrdXEQma5b9YY
 6aaOfLgOPvr3GqliHaPXb+f4ke68hYMUrEUG1QbHe50jj4eupDoNpnWAFmxBArDDaDMy
 5UGZGpW3bOCbwHMElTYjLzfnynIYOX1391vHi7PGdI1fUTNOzweWpsI9oM13ZwkWXd0a
 P82w==
X-Gm-Message-State: ACrzQf1gsPLEoJzwYcPcOaHfAa9yHlOmyzA8E7P94FY6v4XKYDdlkmxx
 8gJ1C1cBia1yS+2WSQysevtQjtlWUaSr5Q==
X-Received: by 2002:a05:620a:2490:b0:6ce:4054:ca14 with SMTP id
 i16-20020a05620a249000b006ce4054ca14mr9750361qkn.62.1664641422364; 
 Sat, 01 Oct 2022 09:23:42 -0700 (PDT)
Received: from stoup.. ([2605:ef80:8084:91a4:f7cb:db31:c505:b931])
 by smtp.gmail.com with ESMTPSA id
 t4-20020a37ea04000000b006d1d8fdea8asm4387445qkj.85.2022.10.01.09.23.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Oct 2022 09:23:41 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v3 08/42] target/arm: Merge regime_is_secure into get_phys_addr
Date: Sat,  1 Oct 2022 09:22:44 -0700
Message-Id: <20221001162318.153420-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221001162318.153420-1-richard.henderson@linaro.org>
References: <20221001162318.153420-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72c;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x72c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: OfGfqoZmdK02

This is the last use of regime_is_secure; remove it
entirely before changing the layout of ARMMMUIdx.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/internals.h | 42 ----------------------------------------
 target/arm/ptw.c       | 44 ++++++++++++++++++++++++++++++++++++++++--
 2 files changed, 42 insertions(+), 44 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index 3524d11dc5..14428730d4 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -670,48 +670,6 @@ static inline bool regime_has_2_ranges(ARMMMUIdx mmu_idx)
     }
 }
 
-/* Return true if this address translation regime is secure */
-static inline bool regime_is_secure(CPUARMState *env, ARMMMUIdx mmu_idx)
-{
-    switch (mmu_idx) {
-    case ARMMMUIdx_E10_0:
-    case ARMMMUIdx_E10_1:
-    case ARMMMUIdx_E10_1_PAN:
-    case ARMMMUIdx_E20_0:
-    case ARMMMUIdx_E20_2:
-    case ARMMMUIdx_E20_2_PAN:
-    case ARMMMUIdx_Stage1_E0:
-    case ARMMMUIdx_Stage1_E1:
-    case ARMMMUIdx_Stage1_E1_PAN:
-    case ARMMMUIdx_E2:
-    case ARMMMUIdx_Stage2:
-    case ARMMMUIdx_MPrivNegPri:
-    case ARMMMUIdx_MUserNegPri:
-    case ARMMMUIdx_MPriv:
-    case ARMMMUIdx_MUser:
-        return false;
-    case ARMMMUIdx_SE3:
-    case ARMMMUIdx_SE10_0:
-    case ARMMMUIdx_SE10_1:
-    case ARMMMUIdx_SE10_1_PAN:
-    case ARMMMUIdx_SE20_0:
-    case ARMMMUIdx_SE20_2:
-    case ARMMMUIdx_SE20_2_PAN:
-    case ARMMMUIdx_Stage1_SE0:
-    case ARMMMUIdx_Stage1_SE1:
-    case ARMMMUIdx_Stage1_SE1_PAN:
-    case ARMMMUIdx_SE2:
-    case ARMMMUIdx_Stage2_S:
-    case ARMMMUIdx_MSPrivNegPri:
-    case ARMMMUIdx_MSUserNegPri:
-    case ARMMMUIdx_MSPriv:
-    case ARMMMUIdx_MSUser:
-        return true;
-    default:
-        g_assert_not_reached();
-    }
-}
-
 static inline bool regime_is_pan(CPUARMState *env, ARMMMUIdx mmu_idx)
 {
     switch (mmu_idx) {
diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 542111f99e..9454ee9df5 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -2499,9 +2499,49 @@ bool get_phys_addr(CPUARMState *env, target_ulong address,
                    MMUAccessType access_type, ARMMMUIdx mmu_idx,
                    GetPhysAddrResult *result, ARMMMUFaultInfo *fi)
 {
+    bool is_secure;
+
+    switch (mmu_idx) {
+    case ARMMMUIdx_E10_0:
+    case ARMMMUIdx_E10_1:
+    case ARMMMUIdx_E10_1_PAN:
+    case ARMMMUIdx_E20_0:
+    case ARMMMUIdx_E20_2:
+    case ARMMMUIdx_E20_2_PAN:
+    case ARMMMUIdx_Stage1_E0:
+    case ARMMMUIdx_Stage1_E1:
+    case ARMMMUIdx_Stage1_E1_PAN:
+    case ARMMMUIdx_E2:
+    case ARMMMUIdx_Stage2:
+    case ARMMMUIdx_MPrivNegPri:
+    case ARMMMUIdx_MUserNegPri:
+    case ARMMMUIdx_MPriv:
+    case ARMMMUIdx_MUser:
+        is_secure = false;
+        break;
+    case ARMMMUIdx_SE3:
+    case ARMMMUIdx_SE10_0:
+    case ARMMMUIdx_SE10_1:
+    case ARMMMUIdx_SE10_1_PAN:
+    case ARMMMUIdx_SE20_0:
+    case ARMMMUIdx_SE20_2:
+    case ARMMMUIdx_SE20_2_PAN:
+    case ARMMMUIdx_Stage1_SE0:
+    case ARMMMUIdx_Stage1_SE1:
+    case ARMMMUIdx_Stage1_SE1_PAN:
+    case ARMMMUIdx_SE2:
+    case ARMMMUIdx_Stage2_S:
+    case ARMMMUIdx_MSPrivNegPri:
+    case ARMMMUIdx_MSUserNegPri:
+    case ARMMMUIdx_MSPriv:
+    case ARMMMUIdx_MSUser:
+        is_secure = true;
+        break;
+    default:
+        g_assert_not_reached();
+    }
     return get_phys_addr_with_secure(env, address, access_type, mmu_idx,
-                                     regime_is_secure(env, mmu_idx),
-                                     result, fi);
+                                     is_secure, result, fi);
 }
 
 hwaddr arm_cpu_get_phys_page_attrs_debug(CPUState *cs, vaddr addr,
-- 
2.34.1

