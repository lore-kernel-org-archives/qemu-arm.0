Received: by 2002:a17:906:b78f:b0:98d:b2f5:1316 with SMTP id dt15csp216099ejb;
        Fri, 21 Jul 2023 07:33:17 -0700 (PDT)
X-Google-Smtp-Source: APBJJlF4Y9k1OuRz8sTiNcJZQf5m2Y1XHsgr/0a/m/0aU2jnnHiBsV3HrLCyYTaYsF2jAi2hwc0f
X-Received: by 2002:a05:6808:8dc:b0:3a4:5063:dd94 with SMTP id k28-20020a05680808dc00b003a45063dd94mr2061233oij.42.1689949997542;
        Fri, 21 Jul 2023 07:33:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1689949997; cv=none;
        d=google.com; s=arc-20160816;
        b=d+GgMRaEXix2EIp0tCoVx0xwXXyJDrADXeRIoNymVB4aYGLu+fqqQCg2ndJEXBe6AF
         9t4IzY3l94/UVESvezElzoIcBPSt/a4G/pBv5z1L90M4BLM82v32UlzpcEEIpH4XdKEF
         kC0gGS3ls+I0ykECmQkU1q0UFMxR0RJ+zE4+htu+YVPa1vOMU2SXd9c3fRAZrcICdtHr
         UZU+7m8jqF4k1NWYHLqt2PKQcG9jrmc323dgxe0dcyhbAbnnv/U8P0stQPIz2tvBMmMh
         mfX1eAE2W4Xm3ogFsKh8AmE81i+XWR6/B4VdzgF9zpIE/oTLT4VGff6R7gudJsu20T6Z
         2+4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=9Eu0+efAdWmcM1kvXZ0gk+7iJlGZwvte0bs6QH7LutQ=;
        fh=jvpdohKmRoZMO537s6xMKXXtj7EZws1LOMQI/oP4vXs=;
        b=qCPx316S6tdv66AB6zl9c5YqVXtuXyS7w7qUYYXxNAgJxyTZGvXYq91G9wG7r8jgwO
         ziN/dMjheNw3x0bJEy32fuYJrIPLFVooXYmTHXZXIt63bM+pJFLrIZ2J/iDEwwXaS7Si
         XPF6h9UVbZCnfoyUYCQXb3/8BA1JPJBjDQ13KS9auKkXHHxuwv3QkCGOVWc/jQdtkBOm
         soFaz74qDKxjp9g1NBTpqurFDYEAwTKa+CyLxTfQ+aQEG6uHMvdxYcbw87woM1llKgDA
         PF7XW5Vyfugde9C2gVgFx70aI3Zi43zOAvqAs7+gMR9ylAr68A3Vzwwl0AZ4IC/CFfvT
         A+0Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="p+P/js7F";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g14-20020a0cf08e000000b00635edc7414bsi1527436qvk.387.2023.07.21.07.33.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 21 Jul 2023 07:33:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="p+P/js7F";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qMrBW-0005EA-NT; Fri, 21 Jul 2023 10:32:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qMrBV-0005Dr-Ht
 for qemu-arm@nongnu.org; Fri, 21 Jul 2023 10:32:45 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qMrBT-00085t-Oh
 for qemu-arm@nongnu.org; Fri, 21 Jul 2023 10:32:45 -0400
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-316feb137a7so1693848f8f.1
 for <qemu-arm@nongnu.org>; Fri, 21 Jul 2023 07:32:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1689949961; x=1690554761;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=9Eu0+efAdWmcM1kvXZ0gk+7iJlGZwvte0bs6QH7LutQ=;
 b=p+P/js7FdoZ0UlkJmWtnUKM5bZRYeVU7S5ga4C8XqVq0zxS+AMNuM63g//wk+ve+k8
 l0bwSJ/KpOGfGXQWC6Lbal6yUg5Z4EXiHaYnSra6IiX0rCG3VrN6w3K0RMuYj3ialsLH
 ycrelooUaA0C+ieDVW62KHAA7fA9NzFyP/hky/RLhYsfHq+r1AbYkOaH/9hJ5ru4z+fC
 z3ev1ZCRyYWaUAwAGivpXdt8vBjwaQPQXXa37nps8AipfX2DHbnTd+1LwZ4lKr2xHwth
 6AuKb+zhEsQZQogZ/HbOIQ1PX1LJBgbra8StggTUHbjHHh6YDHSf8w/akYwrFMgvcAzF
 WyoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689949961; x=1690554761;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9Eu0+efAdWmcM1kvXZ0gk+7iJlGZwvte0bs6QH7LutQ=;
 b=cXIbG+uu10n0lB2zMdKV/hLwIKfGlt+NMo7SrcVDqeNFCBrg4Rb4bRKwKfP7LcAOl2
 p0W8GYE/jCZITZ6z4+1pOer7P9szFB2P2VEo0j5zFzgcUs/vL3HAE2wyC/xgqqd0cAgF
 uODKTW2HXrpLBH6JDxHOjx3/qraHL4j1CVf4WG4M6XShPCPZ+Lw6KIrZNIqgL3ef9MeS
 uZKXTZwglC+y4LdPNzdrJb7gxWjckjImFquXmqmMQz468aZeQ7zPJuB84Sn5VwWSevMD
 fZG2QLhMcxhv6DwjNbaGId2ixURVRBAYdmt7KveysxTnjx9BP4ZJc7lvbDt83FL9m6pz
 QLOQ==
X-Gm-Message-State: ABy/qLZWy+kQWMo+yurfi4P2JgsxeV4MkhwB8GXN2P4xM01jdD1rCWEg
 fUpFml5f5uE+0M6gVEyviBNxbuscq+67z7FMSog=
X-Received: by 2002:adf:f488:0:b0:315:9fb7:bd9 with SMTP id
 l8-20020adff488000000b003159fb70bd9mr1445146wro.69.1689949961429; 
 Fri, 21 Jul 2023 07:32:41 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 j6-20020a5d6046000000b003143b14848dsm4304533wrt.102.2023.07.21.07.32.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Jul 2023 07:32:40 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-8.1] target/arm: Special case M-profile in debug_helper.c
 code
Date: Fri, 21 Jul 2023 15:32:39 +0100
Message-Id: <20230721143239.1753066-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: eEo+IDT889Nk

A lot of the code called from helper_exception_bkpt_insn() is written
assuming A-profile, but we will also call this helper on M-profile
CPUs when they execute a BKPT insn.  This used to work by accident,
but recent changes mean that we will hit an assert when some of this
code calls down into lower level functions that end up calling
arm_security_space_below_el3(), arm_el_is_aa64(), and other functions
that now explicitly assert that the guest CPU is not M-profile.

Handle M-profile directly to avoid the assertions:
 * in arm_debug_target_el(), M-profile debug exceptions always
   go to EL1
 * in arm_debug_exception_fsr(), M-profile always uses the short
   format FSR (compare commit d7fe699be54b2, though in this case
   the code in arm_v7m_cpu_do_interrupt() does not need to
   look at the FSR value at all)

Cc: qemu-stable@nongnu.org
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1775
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
Not sure exactly when this assert() got in (probably in the
semi-recent refactorings for realm support), but it won't hurt
to backport the fix even if the older QEMU doesn't assert().
---
 target/arm/debug_helper.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/target/arm/debug_helper.c b/target/arm/debug_helper.c
index 8362462a07e..abe72e35ae6 100644
--- a/target/arm/debug_helper.c
+++ b/target/arm/debug_helper.c
@@ -21,6 +21,10 @@ static int arm_debug_target_el(CPUARMState *env)
     bool secure = arm_is_secure(env);
     bool route_to_el2 = false;
 
+    if (arm_feature(env, ARM_FEATURE_M)) {
+        return 1;
+    }
+
     if (arm_is_el2_enabled(env)) {
         route_to_el2 = env->cp15.hcr_el2 & HCR_TGE ||
                        env->cp15.mdcr_el2 & MDCR_TDE;
@@ -434,18 +438,20 @@ static uint32_t arm_debug_exception_fsr(CPUARMState *env)
 {
     ARMMMUFaultInfo fi = { .type = ARMFault_Debug };
     int target_el = arm_debug_target_el(env);
-    bool using_lpae = false;
+    bool using_lpae;
 
-    if (target_el == 2 || arm_el_is_aa64(env, target_el)) {
+    if (arm_feature(env, ARM_FEATURE_M)) {
+        using_lpae = false;
+    } else if (target_el == 2 || arm_el_is_aa64(env, target_el)) {
         using_lpae = true;
     } else if (arm_feature(env, ARM_FEATURE_PMSA) &&
                arm_feature(env, ARM_FEATURE_V8)) {
         using_lpae = true;
+    } else if (arm_feature(env, ARM_FEATURE_LPAE) &&
+               (env->cp15.tcr_el[target_el] & TTBCR_EAE)) {
+        using_lpae = true;
     } else {
-        if (arm_feature(env, ARM_FEATURE_LPAE) &&
-            (env->cp15.tcr_el[target_el] & TTBCR_EAE)) {
-            using_lpae = true;
-        }
+        using_lpae = false;
     }
 
     if (using_lpae) {
-- 
2.34.1

