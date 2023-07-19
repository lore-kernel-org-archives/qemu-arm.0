Received: by 2002:a17:906:1917:b0:98d:b2f5:1316 with SMTP id a23csp7196616eje;
        Wed, 19 Jul 2023 08:57:34 -0700 (PDT)
X-Google-Smtp-Source: APBJJlFCg72opO/7d7TM4Imf+mi1grOszeCJyWo1+Nf42MvU31XXBAMw8BA+K09liB7vGrUCnHwc
X-Received: by 2002:a05:622a:180e:b0:400:aaaf:cf0b with SMTP id t14-20020a05622a180e00b00400aaafcf0bmr4147016qtc.4.1689782254361;
        Wed, 19 Jul 2023 08:57:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1689782254; cv=none;
        d=google.com; s=arc-20160816;
        b=lj1HBL6sCzGEdRtefLdiw5eI6MIw+MWagsZO93Z0cqFQ3UxZDFBVy4Da38WX/+CywE
         wJ5N3qbRR6cg1jdOQRjH/C1fWYPJEpzi+7lQFNoMLVOJixzU1IjCUgTXRZrPdKuU6LeO
         Y/GKWqEJe3103mgmQco3KVQPl+LhNCL4jSz9VyLIWzdGV20lg19/PdUF3r+TMd8pGbjO
         YsMm+YQELMbTBdC3Fx9IQVC0Kf7Mw5JzPoCUhJm/6G4ND+Y7Yrqn6y8QbvxdMGKPn84x
         E//O0AhNwcE9nT4iez3rbaojXW/3RfaTUPx67aBUHlM3w/afd6i8dNvVwu9pbur2s8ce
         vz5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=gGmNjom1dWAWIl07haN1UV6R0kEmVNpwwthNJP86YHc=;
        fh=zMLmPP9ozJY0jj0bAXqZquWHP0BgmjJZ9lKiHhJNaWU=;
        b=b637VWRbZN5zQeLNoTQQcuG0JPfhbA9l6TOGbbOiumTnW8092lig9qRBPhGB2WRF3Z
         E4Ch7A1vUhxZXDqrnpniiiXE7v4f9n0iI8SURTLdmGacD6ncPTZ/zo/hb0v3dAMCWqLv
         vgnUoIKb5nT2c0U6MKLE2aHqxFHcd/vighZh3cgbiUCAwCakeDTXQbMNDIDG0TOvhNBB
         YG2shvynrFPwMQc1bCHaMORRNS5vaNWFeDAS3mlk3B6oH82PCx1CMvQNkDrDd7h9ypsg
         +mP9YnD5Wk2g4vHk2wlsry5RC0eUBjMsR4IgOgs7nb6iBJlfGAxIInHwdYQ+aQoEwLOf
         fr8g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yc3U8vt2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a14-20020a05622a064e00b00403ff6b7767si1705517qtb.60.2023.07.19.08.57.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 19 Jul 2023 08:57:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yc3U8vt2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qM9Xv-00038x-7d; Wed, 19 Jul 2023 11:56:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1qM9Xp-000362-FG
 for qemu-arm@nongnu.org; Wed, 19 Jul 2023 11:56:53 -0400
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1qM9Xl-0007Im-8N
 for qemu-arm@nongnu.org; Wed, 19 Jul 2023 11:56:53 -0400
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-4f4b2bc1565so11930086e87.2
 for <qemu-arm@nongnu.org>; Wed, 19 Jul 2023 08:56:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1689782207; x=1690387007;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gGmNjom1dWAWIl07haN1UV6R0kEmVNpwwthNJP86YHc=;
 b=yc3U8vt2vXQK75uiC3aDqfTR6BF9hOFQCZ2Qz6hdQlQHpPvknydPCn303pSPVXxxl7
 xR6gnjZwtJK3HCGgZBxhvUGJDD711Kw/8XRlKjAFgJkItCjT9o62gBe9YnIiWLCjKgE5
 B5/uSG6ZXMXlY6cnHbF38VgSkwsSm+r5DmQHxWqU4cGjjoip9sFbECzjdr6DtR8mW0W8
 WuwqSXKqHApzyQoYj+SaXtYlU46h1FaR+6ohGA0BP1UDZDS/nCVvxPRWwnaozGQ0gRfm
 xfw3viTwua33px84TKOYCYU7VPz7cTDSoFpYXO1+YhpunEk0vMdPUDpsckCm2KjIYKob
 gKSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689782207; x=1690387007;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gGmNjom1dWAWIl07haN1UV6R0kEmVNpwwthNJP86YHc=;
 b=R+CD95+/OSs1nBlwtVcMQ9HcGWjnC2f3pTa5vKhs7riyBfc2Wb0vdSeEm2u6H11TVq
 LNRK2qzPGEeiaaqLTMBRrqMB/sayamMcNWn0UnLUBCzPhUpf3KQCYI8kV8etODXA8nO9
 BKw1lyobu6TM39wlwdKT6EnVLaqibIS3vBBw/yuZd3GOHIagsUEz03j03bDnF27xxSmA
 +TtaWjktpwVDVP/8Z+FvuFz0Vv3Muls8oA7Ajc2BjT0e2JaARyf/wQ14LisR9TeIN8J+
 j5yKhlaq24PKmFCDHArMhzmX0W2fwGVRT/mDo2u16s4DCZZRoM5mxtOyvXQ9dKV+7zSe
 XnhQ==
X-Gm-Message-State: ABy/qLb10FlXpnnnYksypIKpbTP0Zl7uyX3xMfX+RcNxZ77hGhbtjiIt
 7bNGheXbf7Gc1XmkOMdQDBZrIw==
X-Received: by 2002:a05:6512:3b8b:b0:4fb:89f2:594c with SMTP id
 g11-20020a0565123b8b00b004fb89f2594cmr253129lfv.56.1689782206633; 
 Wed, 19 Jul 2023 08:56:46 -0700 (PDT)
Received: from localhost.localdomain ([2.219.138.198])
 by smtp.gmail.com with ESMTPSA id
 l14-20020a1c790e000000b003fc3b03caa4sm2351006wme.0.2023.07.19.08.56.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Jul 2023 08:56:46 -0700 (PDT)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: peter.maydell@linaro.org
Cc: richard.henderson@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: [PATCH 3/5] target/arm: Skip granule protection checks for AT
 instructions
Date: Wed, 19 Jul 2023 16:30:17 +0100
Message-ID: <20230719153018.1456180-5-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230719153018.1456180-2-jean-philippe@linaro.org>
References: <20230719153018.1456180-2-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::12e;
 envelope-from=jean-philippe@linaro.org; helo=mail-lf1-x12e.google.com
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
X-TUID: fLz5GMVGF+7T

GPC checks are not performed on the output address for AT instructions,
as stated by ARM DDI 0487J in D8.12.2:

  When populating PAR_EL1 with the result of an address translation
  instruction, granule protection checks are not performed on the final
  output address of a successful translation.

Rename get_phys_addr_with_secure(), since it's only used to handle AT
instructions.

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
This incidentally fixes a problem with AT S1E1 instructions which can
output an IPA and should definitely not cause a GPC.
---
 target/arm/internals.h | 25 ++++++++++++++-----------
 target/arm/helper.c    |  8 ++++++--
 target/arm/ptw.c       | 11 ++++++-----
 3 files changed, 26 insertions(+), 18 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index 0f01bc32a8..fc90c364f7 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1190,12 +1190,11 @@ typedef struct GetPhysAddrResult {
 } GetPhysAddrResult;
 
 /**
- * get_phys_addr_with_secure: get the physical address for a virtual address
+ * get_phys_addr: get the physical address for a virtual address
  * @env: CPUARMState
  * @address: virtual address to get physical address for
  * @access_type: 0 for read, 1 for write, 2 for execute
  * @mmu_idx: MMU index indicating required translation regime
- * @is_secure: security state for the access
  * @result: set on translation success.
  * @fi: set to fault info if the translation fails
  *
@@ -1212,26 +1211,30 @@ typedef struct GetPhysAddrResult {
  *  * for PSMAv5 based systems we don't bother to return a full FSR format
  *    value.
  */
-bool get_phys_addr_with_secure(CPUARMState *env, target_ulong address,
-                               MMUAccessType access_type,
-                               ARMMMUIdx mmu_idx, bool is_secure,
-                               GetPhysAddrResult *result, ARMMMUFaultInfo *fi)
+bool get_phys_addr(CPUARMState *env, target_ulong address,
+                   MMUAccessType access_type, ARMMMUIdx mmu_idx,
+                   GetPhysAddrResult *result, ARMMMUFaultInfo *fi)
     __attribute__((nonnull));
 
 /**
- * get_phys_addr: get the physical address for a virtual address
+ * get_phys_addr_with_secure_nogpc: get the physical address for a virtual
+ *                                  address
  * @env: CPUARMState
  * @address: virtual address to get physical address for
  * @access_type: 0 for read, 1 for write, 2 for execute
  * @mmu_idx: MMU index indicating required translation regime
+ * @is_secure: security state for the access
  * @result: set on translation success.
  * @fi: set to fault info if the translation fails
  *
- * Similarly, but use the security regime of @mmu_idx.
+ * Similar to get_phys_addr, but use the given security regime and don't perform
+ * a Granule Protection Check on the resulting address.
  */
-bool get_phys_addr(CPUARMState *env, target_ulong address,
-                   MMUAccessType access_type, ARMMMUIdx mmu_idx,
-                   GetPhysAddrResult *result, ARMMMUFaultInfo *fi)
+bool get_phys_addr_with_secure_nogpc(CPUARMState *env, target_ulong address,
+                                     MMUAccessType access_type,
+                                     ARMMMUIdx mmu_idx, bool is_secure,
+                                     GetPhysAddrResult *result,
+                                     ARMMMUFaultInfo *fi)
     __attribute__((nonnull));
 
 bool pmsav8_mpu_lookup(CPUARMState *env, uint32_t address,
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 07a9ac70f5..3ee2bb5fe1 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -3365,8 +3365,12 @@ static uint64_t do_ats_write(CPUARMState *env, uint64_t value,
     ARMMMUFaultInfo fi = {};
     GetPhysAddrResult res = {};
 
-    ret = get_phys_addr_with_secure(env, value, access_type, mmu_idx,
-                                    is_secure, &res, &fi);
+    /*
+     * I_MXTJT: Granule protection checks are not performed on the final address
+     * of a successful translation.
+     */
+    ret = get_phys_addr_with_secure_nogpc(env, value, access_type, mmu_idx,
+                                          is_secure, &res, &fi);
 
     /*
      * ATS operations only do S1 or S1+S2 translations, so we never
diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 6318e13b98..1aef2b8cef 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -3412,16 +3412,17 @@ static bool get_phys_addr_gpc(CPUARMState *env, S1Translate *ptw,
     return false;
 }
 
-bool get_phys_addr_with_secure(CPUARMState *env, target_ulong address,
-                               MMUAccessType access_type, ARMMMUIdx mmu_idx,
-                               bool is_secure, GetPhysAddrResult *result,
-                               ARMMMUFaultInfo *fi)
+bool get_phys_addr_with_secure_nogpc(CPUARMState *env, target_ulong address,
+                                     MMUAccessType access_type,
+                                     ARMMMUIdx mmu_idx, bool is_secure,
+                                     GetPhysAddrResult *result,
+                                     ARMMMUFaultInfo *fi)
 {
     S1Translate ptw = {
         .in_mmu_idx = mmu_idx,
         .in_space = arm_secure_to_space(is_secure),
     };
-    return get_phys_addr_gpc(env, &ptw, address, access_type, result, fi);
+    return get_phys_addr_nogpc(env, &ptw, address, access_type, result, fi);
 }
 
 bool get_phys_addr(CPUARMState *env, target_ulong address,
-- 
2.41.0

