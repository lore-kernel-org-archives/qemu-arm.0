Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6734CC87FCC
	for <qemu-arm@archiver.kernel.org>; Sun, 27 Jul 2025 08:04:27 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ufwLo-0005FY-M0; Sun, 27 Jul 2025 04:03:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ufwLa-0004qA-9b
 for qemu-arm@nongnu.org; Sun, 27 Jul 2025 04:03:06 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ufwLY-00041D-5e
 for qemu-arm@nongnu.org; Sun, 27 Jul 2025 04:03:05 -0400
Received: by mail-pl1-x62e.google.com with SMTP id
 d9443c01a7336-2401b855635so325465ad.2
 for <qemu-arm@nongnu.org>; Sun, 27 Jul 2025 01:03:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1753603383; x=1754208183; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NBl8wbDOpfkOgn+Qj5iZnDh6LWcdNiRislLxlLvgUus=;
 b=Qq87pOknrhZrJ9Wk07bAqagbbwEBi9ZBt/G2JVThL6wOrnqvCUWdf4WtGu0zjUa0qY
 c7d7i0C0cGe3XeVTS8J3rUbC3Q5Z8Hgp4MdIXEfthmIHOyM/Zu/Pcds5j+I/9zuJU7Og
 hR2K8RTtVV94SGho6UJeyr5X4bfM8fo1khM9FKWPcua+xOuAo0Xy8sA7EQ+Yy6Op+8Pi
 +BTmsk2AdJ23LQqGBOYrwugICwdAZba8Es0mkfbVIO6C+fiOc4C0uCIO/b2U7T0aBM2X
 /veav2i3uZcYR8frXHRtNGx6TWwvhJY4RVPX9qM8N4vuQ5ZBR0QEpNIdcmomvzggG8wZ
 xkVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753603383; x=1754208183;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NBl8wbDOpfkOgn+Qj5iZnDh6LWcdNiRislLxlLvgUus=;
 b=SFhqjdEcXHUyiKBwoURTaZH4Lixc2AeTECqLz91ILJrNcStD1q+N0loKFB/kwyzNIs
 99prPRJkF1wkUPoEouffKHb0Ax9MPUhOz9zdLD9kVED2qvMIDfZQQ6y9AFtlo3KMb5Yx
 pR69aJGRXfkq4QcYn8WHMrLQxfkt0/8yv7n3MUP37wqKF8YdfQzzKiAGI8ImmVoXf7jM
 WnMgyRh77Hbm48v5+fiX3q4nxXqZmmvkGlTiVtDfenF4/Kg6Q5AZ7c4bU7qc76li4MmN
 Bi3iTvdi9vu6u3B5miUpLQNxw4upgYsC31S2y+3DgHWVKk4BSoN7O2wNUOuCewXxxXRd
 V+VQ==
X-Gm-Message-State: AOJu0YxiT/BpL4EdBXCPnzoHzqk8B6aLxTCa5usSVmHIVnlUD2+wZ4xG
 2A1t3SMX9QSO0cmm/2MfjFaLivABmSj6KOLPuPY8iKt+9w15+0Ok+caivJ5L3C0YDYL0NWmVAn3
 XAOso
X-Gm-Gg: ASbGncvHYIJppjQ6CryjpSvznEzN/KFtvl5HdKI9+nFqRrK+tFd+6n0NGxzowj62sX/
 H9VBQqR5jXF4zpn9DqD5sY2aYNND1TCmbk2LM2GefHxglGq46Xmnbo1gg5+3jSYRsfWD1nbig/n
 VeMtW+cvhusJo4sDnFUlp0sP4kKmcV2cY4nQzt30Gk7z3LDhPHzHh30fBYyC0RGhIXmDTHWPWjc
 ZLdKbhtIFf9sPjpopxqHpuDQst8EsOhGnAVJpaKGKtTyuKubZNLT7Q33XLs1kS+dXbZBog+dSWC
 19noLBjpRJWbUuLUqNi5QjdJCi8Tl7cGxQoL+BFduLzZLJDgrUpkcd/Oj0RIf0bjX0XaPTBljNw
 yysWwYqey5OoDNV75vM4CQ5lxgEFFsOkHRHLCeNtPGS1tMAkwtnaVqVuhjyNGLwmP4O7j1b1OnT
 22iHCoSz/nfg==
X-Google-Smtp-Source: AGHT+IEgJ6ZyBs2S1E41d1MudyquAGu/lrvMtcFIScCW1Hdi9hk3xoB5Tnt6lm7KgyG4jYDxEvg9/A==
X-Received: by 2002:a17:902:c7ca:b0:23f:f96f:9dbe with SMTP id
 d9443c01a7336-23ff96f9fecmr27379525ad.24.1753603382640; 
 Sun, 27 Jul 2025 01:03:02 -0700 (PDT)
Received: from localhost.localdomain (syn-098-150-199-049.res.spectrum.com.
 [98.150.199.49]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23fbe333efesm30016415ad.65.2025.07.27.01.03.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Jul 2025 01:03:02 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 04/82] target/arm: Introduce get_phys_addr_for_at
Date: Sat, 26 Jul 2025 22:01:36 -1000
Message-ID: <20250727080254.83840-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250727080254.83840-1-richard.henderson@linaro.org>
References: <20250727080254.83840-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Rename get_phys_addr_with_space_nogpc for its only
caller, do_ats_write.  Drop the MemOp memop argument
as it doesn't make sense in the new context.  Replace
the access_type parameter with prot_check.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/internals.h     | 18 +++++++-----------
 target/arm/ptw.c           | 21 ++++++++++++++-------
 target/arm/tcg/cpregs-at.c | 11 ++---------
 3 files changed, 23 insertions(+), 27 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index 326b5a73cf..0dd1b214c8 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1604,25 +1604,21 @@ bool get_phys_addr(CPUARMState *env, vaddr address,
     __attribute__((nonnull));
 
 /**
- * get_phys_addr_with_space_nogpc: get the physical address for a virtual
- *                                 address
+ * get_phys_addr_for_at:
  * @env: CPUARMState
  * @address: virtual address to get physical address for
- * @access_type: 0 for read, 1 for write, 2 for execute
- * @memop: memory operation feeding this access, or 0 for none
+ * @prot_check: PAGE_{READ,WRITE,EXEC}, or 0
  * @mmu_idx: MMU index indicating required translation regime
  * @space: security space for the access
  * @result: set on translation success.
  * @fi: set to fault info if the translation fails
  *
- * Similar to get_phys_addr, but use the given security space and don't perform
- * a Granule Protection Check on the resulting address.
+ * Similar to get_phys_addr, but for use by AccessType_AT, i.e.
+ * system instructions for address translation.
  */
-bool get_phys_addr_with_space_nogpc(CPUARMState *env, vaddr address,
-                                    MMUAccessType access_type, MemOp memop,
-                                    ARMMMUIdx mmu_idx, ARMSecuritySpace space,
-                                    GetPhysAddrResult *result,
-                                    ARMMMUFaultInfo *fi)
+bool get_phys_addr_for_at(CPUARMState *env, vaddr address, unsigned prot_check,
+                          ARMMMUIdx mmu_idx, ARMSecuritySpace space,
+                          GetPhysAddrResult *result, ARMMMUFaultInfo *fi)
     __attribute__((nonnull));
 
 bool pmsav8_mpu_lookup(CPUARMState *env, uint32_t address,
diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index c7db93b95c..1866c494ef 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -3545,18 +3545,25 @@ static bool get_phys_addr_gpc(CPUARMState *env, S1Translate *ptw,
     return false;
 }
 
-bool get_phys_addr_with_space_nogpc(CPUARMState *env, vaddr address,
-                                    MMUAccessType access_type, MemOp memop,
-                                    ARMMMUIdx mmu_idx, ARMSecuritySpace space,
-                                    GetPhysAddrResult *result,
-                                    ARMMMUFaultInfo *fi)
+bool get_phys_addr_for_at(CPUARMState *env, vaddr address,
+                          unsigned prot_check, ARMMMUIdx mmu_idx,
+                          ARMSecuritySpace space, GetPhysAddrResult *result,
+                          ARMMMUFaultInfo *fi)
 {
     S1Translate ptw = {
         .in_mmu_idx = mmu_idx,
         .in_space = space,
+        .in_prot_check = prot_check,
     };
-    return get_phys_addr_nogpc(env, &ptw, address, access_type,
-                               memop, result, fi);
+    /*
+     * I_MXTJT: Granule protection checks are not performed on the final
+     * address of a successful translation.  This is a translation not a
+     * memory reference, so MMU_DATA_LOAD is arbitrary (the exact protection
+     * check is handled or bypassed by .in_prot_check) and "memop = MO_8"
+     * bypasses any alignment check.
+     */
+    return get_phys_addr_nogpc(env, &ptw, address,
+                               MMU_DATA_LOAD, MO_8, result, fi);
 }
 
 static ARMSecuritySpace
diff --git a/target/arm/tcg/cpregs-at.c b/target/arm/tcg/cpregs-at.c
index 398a61d398..2ff0b3e76f 100644
--- a/target/arm/tcg/cpregs-at.c
+++ b/target/arm/tcg/cpregs-at.c
@@ -27,19 +27,12 @@ static uint64_t do_ats_write(CPUARMState *env, uint64_t value,
                              MMUAccessType access_type, ARMMMUIdx mmu_idx,
                              ARMSecuritySpace ss)
 {
-    bool ret;
     uint64_t par64;
     bool format64 = false;
     ARMMMUFaultInfo fi = {};
     GetPhysAddrResult res = {};
-
-    /*
-     * I_MXTJT: Granule protection checks are not performed on the final
-     * address of a successful translation.  This is a translation not a
-     * memory reference, so "memop = none = 0".
-     */
-    ret = get_phys_addr_with_space_nogpc(env, value, access_type, 0,
-                                         mmu_idx, ss, &res, &fi);
+    bool ret = get_phys_addr_for_at(env, value, 1 << access_type,
+                                    mmu_idx, ss, &res, &fi);
 
     /*
      * ATS operations only do S1 or S1+S2 translations, so we never
-- 
2.43.0


