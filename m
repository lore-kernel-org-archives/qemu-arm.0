Received: by 2002:a17:906:f20a:b0:98d:b2f5:1316 with SMTP id gt10csp2863803ejb;
        Wed, 9 Aug 2023 05:38:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH2rwSjbA4iJFic0y9vSBIg7eN6kPjcv0oiXYeQFqQ10FGjMUuosRM/wMofYmmcjnmWNPE2
X-Received: by 2002:ac8:7d08:0:b0:40b:9015:7eee with SMTP id g8-20020ac87d08000000b0040b90157eeemr2806887qtb.8.1691584710645;
        Wed, 09 Aug 2023 05:38:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1691584710; cv=none;
        d=google.com; s=arc-20160816;
        b=ir00LYP9BmNuGEqBrr1YjIJ0LE3QzULW/zmGC8s5gzEY7zw1MiGJq/8xw8IdtUMvJn
         qO+bZ4t07ZNJWgaUhNA3xMiEt8RnYx5xEucEfe4udIY6dndWgRMqzUjzk0CaqZ8ejq2N
         CnKEux+YxHSorWJNJSkAvjJ2OuoD1TIRN83TLkLsOqViIoP6QKjfL170S3PduIxC9odX
         vWSh77eKSMdZrPHYT7OSx8YW48qGPo3XQFJ290p+wNaYTepAJ9634oS9WNMpTstog+7m
         nx4fdDW5MFXWBKGCkO848mW7RXAh5o7IIaoCLnKOItJD4kcBH3HFQt878+y0QWQrqWCf
         Tp4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=FhowOvdNoqNAM56f9usHlhnKbRslUqskM9I47IE0+fw=;
        fh=zMLmPP9ozJY0jj0bAXqZquWHP0BgmjJZ9lKiHhJNaWU=;
        b=ovLX2cdmOK99si6ECZFFDUATBUOAxg3IlabA/bQXUQR3VRq/odkV5T6yHLBFyg1xVw
         ji1cT47zBej/Ko2d4BIi2v7oCbpatR5h6eyxsSLCmg7oadCmdjE0TZr3PmaOqANIEoOK
         wCBbJI6oOFsFW+ep42c7aeTzMD2bQp8z0UHdFGr6FBOJ+5B3xqj4pBpJJnEEkj+pbnJ0
         H5NgQlcDLIs9dO0FZszf7XOZ7BmJ5I08ekeN9ArWdSR0ztoqXUvjoLV6a8+n9xNkA3iG
         kQl/QokoFae7qjZ84plH3Gg6tmK1w2JD04q/eJ8zkYwmasTYsBRwmhgoMRilIOQoZQ1R
         zs2Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EMjHJ1r+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h15-20020ac85e0f000000b0040359f75303si7574731qtx.27.2023.08.09.05.38.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 09 Aug 2023 05:38:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EMjHJ1r+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qTiRJ-0002bN-6F; Wed, 09 Aug 2023 08:37:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1qTiRG-0002Z1-Mk
 for qemu-arm@nongnu.org; Wed, 09 Aug 2023 08:37:22 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1qTiRC-0002oF-BE
 for qemu-arm@nongnu.org; Wed, 09 Aug 2023 08:37:22 -0400
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-3178dd771ceso5778558f8f.2
 for <qemu-arm@nongnu.org>; Wed, 09 Aug 2023 05:37:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1691584636; x=1692189436;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FhowOvdNoqNAM56f9usHlhnKbRslUqskM9I47IE0+fw=;
 b=EMjHJ1r+b8XiGXmjgO2S6RSoXBLpgmIRwJwCyUr6+VNB9YBM9dQUuN/wF2b9HdDfG6
 8dZ9DYaAliGK+yTGHsH/n3EJsbIiHVdk6gomzwM9XtT+FpBj+tdHT+dEUYJQ15640GPH
 uG41gQupG8CZHR3Zs4/h2ygWdMKd2hV/PjzY91RlrZkG0ELlAsvFsXX1/i6IrXExoD98
 icWIMvZYUxIIktlY680bBD0phZlVzPIb5OcivbjZGCJiOt0MP7GfOOSs9rQ9rCkVElzQ
 jJe/1Vk6aK0Hi3xp+gmtJ/aaUjYZqurACEp4TUDBk6I1KohdRlPP9yX44Uf8pzcJAxPj
 cEBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691584636; x=1692189436;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FhowOvdNoqNAM56f9usHlhnKbRslUqskM9I47IE0+fw=;
 b=KOJLgMyV86RLn7sD/25PsjeqFPjkliqKbrU1OXehvnHZkRbvCv0FJ/q5obEvmzHXAS
 vH5l0Tsp2wesfMaS2uR5inkaIO+QIF1qvBwqK+QbFzBzhZsv4PLsWsV3s8lFcUL3MX00
 xwsmlX21wVGFyyMwlKP9dojQFy0t91Yoe+cTDFZiG+UJ872ViETFaO7HBSvwuiNgFeAX
 ScmRE94EwekwrZ36MCzUUatbULezDcLFgrov54qVFHpeGu1/3uI6IVBw6U8fxmR8e6Yh
 /E+dKd9iwW1sL8+8O2seKWC3+Y6Ji6vGFQ/NS1HDvBOQQVvbR4Pvpx2V+Bjs2DFrW1Cs
 sfag==
X-Gm-Message-State: AOJu0YxBsPnnUQKdg7tMyLlV1VAb1XoudgPaWKLwb49k5v4+KDRMsHAm
 sEOecVfMcERyx22rWsu3EEkZaQXID0Wk6gspLhg=
X-Received: by 2002:a5d:4d83:0:b0:314:2e77:afec with SMTP id
 b3-20020a5d4d83000000b003142e77afecmr1664367wru.57.1691584636287; 
 Wed, 09 Aug 2023 05:37:16 -0700 (PDT)
Received: from localhost.localdomain ([2.219.138.198])
 by smtp.gmail.com with ESMTPSA id
 k6-20020a5d5246000000b00317f70240afsm5617888wrc.27.2023.08.09.05.37.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Aug 2023 05:37:16 -0700 (PDT)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: peter.maydell@linaro.org
Cc: richard.henderson@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: [PATCH v3 3/6] target/arm: Skip granule protection checks for AT
 instructions
Date: Wed,  9 Aug 2023 13:37:03 +0100
Message-ID: <20230809123706.1842548-4-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230809123706.1842548-1-jean-philippe@linaro.org>
References: <20230809123706.1842548-1-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=jean-philippe@linaro.org; helo=mail-wr1-x42b.google.com
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: UFmXC0zff9kn

GPC checks are not performed on the output address for AT instructions,
as stated by ARM DDI 0487J in D8.12.2:

  When populating PAR_EL1 with the result of an address translation
  instruction, granule protection checks are not performed on the final
  output address of a successful translation.

Rename get_phys_addr_with_secure(), since it's only used to handle AT
instructions.

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
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
index a4c2c1bde5..427de6bd2a 100644
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
index 063adbd84a..33179f3471 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -3418,16 +3418,17 @@ static bool get_phys_addr_gpc(CPUARMState *env, S1Translate *ptw,
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

