Received: by 2002:a17:906:9c0a:0:0:0:0 with SMTP id ff10csp992285ejc;
        Mon, 22 Aug 2022 08:53:41 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7Yf2fAeNBdvq7k/Pif6rk7XJLL7MwFK2clrfhWFnm6W1jUKEg6SH4Uequ4uM3W4yOFcvHP
X-Received: by 2002:a05:620a:29ce:b0:6a7:1379:62d4 with SMTP id s14-20020a05620a29ce00b006a7137962d4mr13289213qkp.604.1661183621472;
        Mon, 22 Aug 2022 08:53:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1661183621; cv=none;
        d=google.com; s=arc-20160816;
        b=TUColouCdmVa+xNrDI/IvitVjet7z/25+qG8bh99k5mBiA4/Nw3QWfyW+CcLorJs1c
         EITCILAZHsTldV3iTNTdaCwTYFjB0PRvx+/bbCVeeRLOVxu53DK0n+R5OeBZG2SrehCx
         GJWYImSvM5w/0K+EN1Vu7L5cbEBanaNkhGV8pWln3aRlZJJ7M/pbQFHM4lag1b7ORe6R
         RINT+vBKhKjDggDUZ0tbcbCoNcAnqjpa0bURGWzf/FsY6JFa7HurTHayoMRMp0wL1j7d
         9FbuGE3TXkCcBlnJlC3GuzLKOAJ3+2cXyViqeojD2HfwUO6PbbtIyrw5X2T8U4crJdez
         YisA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Fwz1VSgCHMlHYHX8znfhremY/2VoXOxNoCIJmQ0b+LY=;
        b=VmnvC+SL6WInHZAINxl8fscddMDc4Y2aQASqz3yjmMvor08WNqQstl4iw3AC76uHJP
         EdTvkx+V5ppSu1S94wtrWgVYMxaiyaa84dDxRCYUNmgrvSOuwCN2MEhfivpAGq5AIb30
         n57AYJRtb2r9P5PqbcjmIr7MdJq+fjy1aIwQ8soTnLfIwlxvqaYj1MbnHS5QTDlFgaRV
         K8qPxHCTAy+URHEAFC31+RNqg++hPvJcXI4mK3wD5HOkQu2iSxmnf8m7SPE897M7xZot
         SKHAv7IVIOmksikGkXYVsQXDVlfgJJrhnQ3OW009ZBaqQ3VAe9FnMsyyvn8ADjh3MFZh
         XBnA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="BN/dH4D6";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f4-20020a05622a104400b0034363bee07csi5339813qte.712.2022.08.22.08.53.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 22 Aug 2022 08:53:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="BN/dH4D6";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oQ9kC-0000Xd-Qz
	for alex.bennee@linaro.org; Mon, 22 Aug 2022 11:53:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQ9Lm-0000Dg-My
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 11:28:26 -0400
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d]:36624)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQ9LQ-0000eK-PK
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 11:28:26 -0400
Received: by mail-pg1-x52d.google.com with SMTP id s206so9691683pgs.3
 for <qemu-devel@nongnu.org>; Mon, 22 Aug 2022 08:28:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=Fwz1VSgCHMlHYHX8znfhremY/2VoXOxNoCIJmQ0b+LY=;
 b=BN/dH4D6vY+gpK33hUjr9Tk/PypnnTU0gBoauMJgIQMQEp5B5fAlZu8Bxmp2rKJXAK
 F4kEIKQDazkTMI2eFbv2npqmsxxUvXQYlESfUhUeSZQYLWVPyi+94mXTAbpB69ewAa84
 e0RdGrcT7YUds/4/qfGIQuDBTXOERv98bo8ZKgqQqVn9vMxaogcL6s9fg/w9c2UZnKOX
 75X2b0iDEKlYFXfllGAE1yjPFljoYjfdN9MCvtb6e/yeVpU8rpUZ81dK2B2aEM7h2p2w
 b6ZHzDjMBSlnqBAQ+41TS3a+JVB6qkXbCO9pn8BcWPu2OImgBL5uWOVZ6fDRWhoRNlG4
 dSeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=Fwz1VSgCHMlHYHX8znfhremY/2VoXOxNoCIJmQ0b+LY=;
 b=zQJXevYwk0F6SsiveQSoxBSu7gKJ2+ZO6RQkHCli/1XvN01RTPVvBzat11Ci1KWS/4
 +gdSzIkAQAJ5hZAmZXxjXhU2/FRV+5EGACdTbQyucCE9d7dNTpywJUx4SjnxGW/LB+1n
 QBLG7GN9RDEikyy6XPLEc/lEBuHAH+XGi2FbwpyUaSXjGW98LgwCG58YetbZwNCPYreq
 R3TTZg+7RZFTW9I5USC1cLSrv2DbTZ61eFp/fIpgZpaF36G6opTT5BJ852RFvxy/ZGEo
 KyrfbCvc9ESNNA4216rvZnN4/F8QhFWLYhzlmQQBhIUHemrp6dm3VtwRbDCmth+6BuT5
 8yXQ==
X-Gm-Message-State: ACgBeo3AP/CRpVWaiJ3p4qo/uV1cEwi82vDys2KQtXKAPnXsof74Bh5g
 3BaK5DMF2AAshs1SIxYvMRMCp1III5CfBQ==
X-Received: by 2002:a63:1c64:0:b0:429:9ceb:57e with SMTP id
 c36-20020a631c64000000b004299ceb057emr17052468pgm.429.1661182082927; 
 Mon, 22 Aug 2022 08:28:02 -0700 (PDT)
Received: from stoup.. ([71.212.157.236]) by smtp.gmail.com with ESMTPSA id
 q7-20020a17090311c700b0016bffc59718sm8665222plh.58.2022.08.22.08.28.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Aug 2022 08:28:02 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v2 25/66] target/arm: Add is_secure parameter to do_ats_write
Date: Mon, 22 Aug 2022 08:27:00 -0700
Message-Id: <20220822152741.1617527-26-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220822152741.1617527-1-richard.henderson@linaro.org>
References: <20220822152741.1617527-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Di2EIBZq+ldY

Use get_phys_addr_with_secure directly.  This is the one place
where the value of is_secure may not equal arm_is_secure(env).

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 1fcfc85b76..09990ca096 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -3105,7 +3105,8 @@ static CPAccessResult ats_access(CPUARMState *env, const ARMCPRegInfo *ri,
 
 #ifdef CONFIG_TCG
 static uint64_t do_ats_write(CPUARMState *env, uint64_t value,
-                             MMUAccessType access_type, ARMMMUIdx mmu_idx)
+                             MMUAccessType access_type, ARMMMUIdx mmu_idx,
+                             bool is_secure)
 {
     bool ret;
     uint64_t par64;
@@ -3113,7 +3114,8 @@ static uint64_t do_ats_write(CPUARMState *env, uint64_t value,
     ARMMMUFaultInfo fi = {};
     GetPhysAddrResult res = {};
 
-    ret = get_phys_addr(env, value, access_type, mmu_idx, &res, &fi);
+    ret = get_phys_addr_with_secure(env, value, access_type, mmu_idx,
+                                    is_secure, &res, &fi);
 
     /*
      * ATS operations only do S1 or S1+S2 translations, so we never
@@ -3285,6 +3287,7 @@ static void ats_write(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t value)
         switch (el) {
         case 3:
             mmu_idx = ARMMMUIdx_SE3;
+            secure = true;
             break;
         case 2:
             g_assert(!secure);  /* ARMv8.4-SecEL2 is 64-bit only */
@@ -3306,6 +3309,7 @@ static void ats_write(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t value)
         switch (el) {
         case 3:
             mmu_idx = ARMMMUIdx_SE10_0;
+            secure = true;
             break;
         case 2:
             g_assert(!secure);  /* ARMv8.4-SecEL2 is 64-bit only */
@@ -3321,16 +3325,18 @@ static void ats_write(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t value)
     case 4:
         /* stage 1+2 NonSecure PL1: ATS12NSOPR, ATS12NSOPW */
         mmu_idx = ARMMMUIdx_E10_1;
+        secure = false;
         break;
     case 6:
         /* stage 1+2 NonSecure PL0: ATS12NSOUR, ATS12NSOUW */
         mmu_idx = ARMMMUIdx_E10_0;
+        secure = false;
         break;
     default:
         g_assert_not_reached();
     }
 
-    par64 = do_ats_write(env, value, access_type, mmu_idx);
+    par64 = do_ats_write(env, value, access_type, mmu_idx, secure);
 
     A32_BANKED_CURRENT_REG_SET(env, par, par64);
 #else
@@ -3346,7 +3352,8 @@ static void ats1h_write(CPUARMState *env, const ARMCPRegInfo *ri,
     MMUAccessType access_type = ri->opc2 & 1 ? MMU_DATA_STORE : MMU_DATA_LOAD;
     uint64_t par64;
 
-    par64 = do_ats_write(env, value, access_type, ARMMMUIdx_E2);
+    /* There is no SecureEL2 for AArch32. */
+    par64 = do_ats_write(env, value, access_type, ARMMMUIdx_E2, false);
 
     A32_BANKED_CURRENT_REG_SET(env, par, par64);
 #else
@@ -3389,6 +3396,7 @@ static void ats_write64(CPUARMState *env, const ARMCPRegInfo *ri,
             break;
         case 6: /* AT S1E3R, AT S1E3W */
             mmu_idx = ARMMMUIdx_SE3;
+            secure = true;
             break;
         default:
             g_assert_not_reached();
@@ -3407,7 +3415,8 @@ static void ats_write64(CPUARMState *env, const ARMCPRegInfo *ri,
         g_assert_not_reached();
     }
 
-    env->cp15.par_el[1] = do_ats_write(env, value, access_type, mmu_idx);
+    env->cp15.par_el[1] = do_ats_write(env, value, access_type,
+                                       mmu_idx, secure);
 #else
     /* Handled by hardware accelerator. */
     g_assert_not_reached();
-- 
2.34.1

