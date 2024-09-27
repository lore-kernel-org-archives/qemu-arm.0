Received: by 2002:a17:504:5f68:b0:1be9:327d:8ee3 with SMTP id gl8csp159936njc;
        Fri, 27 Sep 2024 00:11:19 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXiCdI0dPO7YNyHd+jcB52Pn1kxy2SzWbRRw91aQr8BOFmpWlA14ioyfaNQAELtq3KiqwuC6Z7i3zo5vg==@linaro.org
X-Google-Smtp-Source: AGHT+IEFllsXE2F7Y/SdCNER1NhCPU6Y0xpJwWmkOWsnDAw9t8jGe1BzVR8aj0dwKR2x0NE5rbft
X-Received: by 2002:ac8:58c4:0:b0:45b:5cfc:d378 with SMTP id d75a77b69052e-45c9f1f0e41mr28888641cf.15.1727421079232;
        Fri, 27 Sep 2024 00:11:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1727421079; cv=none;
        d=google.com; s=arc-20240605;
        b=OyTpDKjIZH96CZRn7lT573POMVrp3IP5DAzbtrJ06znzP8wgbf2Cm0JE76CTk13qnv
         FIO5bZ/spsX7cPf08lGLMADnuwObIp3MvJu/TmVSzONfbNGZjdDuyPjHOhPZjflrIklH
         KKy/jEgUj+PA6sYbZ/tvFWxDFLTT6BVHIxXlEsNgtnmfhS+BNwFOLXOwLlpSrDQsY4mc
         R+UX3x4vEhCW+WbV9QsOGnGjCZcPhaQDGY7d3NiF+iHdaTU4GHaRuL6zFIMScr9BJVDN
         R1By/xgzjOYYCHDHUyu3G6PguO5rbJsKDZW2xV6O20ESWgB7ADU65/BmFJSsAIdy8x8A
         xh8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:message-id
         :mime-version:date:dkim-signature;
        bh=lOn6T+82Izo+xmMT9FJnB1AJP+keeTcBlNZwftIR+lo=;
        fh=btnt8NVcdS25fCVoiQ5WSEnfiWGptk+qaZeHIfDvGYs=;
        b=WqEn412UVQZP8rDOC54G4lf0tmyrYFtDO4swzCMx/Ik/KY1fo8+MekalD49jdoydnf
         rIWHMGQ+TFqAdefic3MpBOeQzaiS+1irpXgF1wCcux9hKidDKlFKrwF+0eBTUi5JEY/f
         GlvH6zOLa8sVKAZaBbSR88SLPJOOCEhap/sm3VFbIqxQ0Rom4twj5Ny6+ZLxcmwAT17Z
         0lEEuMi3u+c0M/XfM3P8dFLHnKjOrekteyEvssOj0R1KAxvWmCiIyXTJODL09zqNNZVa
         2EOuUpGFDuushHUtj3bipKoneuVBHPD1GLNk96h1vNXZJ8N8julgaiUkDfNMO4fAhIOG
         V5gQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b="aUBlm+/d";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-45c9f34d207si15118551cf.519.2024.09.27.00.11.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 27 Sep 2024 00:11:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b="aUBlm+/d";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1su588-0005r3-Oi; Fri, 27 Sep 2024 03:11:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3hFr2ZggKCFEtAwu+z1Cz77z4x.v759x5D-tA5676z6D.7Az@flex--ardb.bounces.google.com>)
 id 1su588-0005qT-1U
 for qemu-arm@nongnu.org; Fri, 27 Sep 2024 03:11:08 -0400
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3hFr2ZggKCFEtAwu+z1Cz77z4x.v759x5D-tA5676z6D.7Az@flex--ardb.bounces.google.com>)
 id 1su583-0001v4-FB
 for qemu-arm@nongnu.org; Fri, 27 Sep 2024 03:11:07 -0400
Received: by mail-yb1-xb49.google.com with SMTP id
 3f1490d57ef6-e1159159528so4056432276.1
 for <qemu-arm@nongnu.org>; Fri, 27 Sep 2024 00:11:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1727421060; x=1728025860; darn=nongnu.org;
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=lOn6T+82Izo+xmMT9FJnB1AJP+keeTcBlNZwftIR+lo=;
 b=aUBlm+/dKEAP9pvuKWhtwas9dxUBbNokngHG5Yc8pJmvIQuggkGb/Dpyjlp37jccUE
 X1xl/VbVDS/TEHa3SU8ZCoFkv88VneaynbV6X6WfePoElyvLR6Ea4UTRqj+qRZFNr/vV
 uDfwNXVaco1TH3gF/a4218mmHz4RHDytxj+kMOdkqR2K1ELjzPxyf5zU7plxl2ID32ma
 Rl2g17e4uiiXFN5VDww1fwJNd5n3ScrLFglZtjaK6wg4mQb/Xh+66HakSNWYV4ak7HEW
 +c0RtyYp5tQS/8NwP4fkCa11bqv/pTZlzZxaK22BpMCOJ1Q2avlJ+Cx+GQZ4n0Vgc9+7
 LJtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727421060; x=1728025860;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=lOn6T+82Izo+xmMT9FJnB1AJP+keeTcBlNZwftIR+lo=;
 b=hHl4vPplj+DXLib7cae7qVlgpQUv/Oi9TytxGCp9jvRmqvKEigwdhFghyUBzkIjnrI
 +L24zZNhV9AEyN8ZJar796WcEZT/FnCHJqv6fQ5YAH5ucBJsM1YImS/++OqTS+wsVJCI
 PACzrL1j8dQvmrVLKCK93JCldpQmibQYzIsnwAuX3B6S5VD8g8vmq180VudUgiqmvyY0
 Z18yPqb9oM25dtVso0xZSyyfYcBUxmfMKb+giBnmRz+ugc2qEw0hVdBKPDOc5lPLIut/
 y+sTfsQ/DQRGBMIPnWTPoc52XBAXYFDMKBryPdx5IXSf4hbIksAb6O5gCSj1mlUWGBqG
 wYmQ==
X-Gm-Message-State: AOJu0YxnnoivC6UaHA1Y5QctDclqqbNXyIl0upFPWBedBdM2CkYCdE+p
 53tnlZqLV2nrAK4QEaHogpZ/PPMDyHZf6x7+jKTon54zPjiqc3CV0rvOdU6TIdqK85My5Q==
X-Received: from palermo.c.googlers.com
 ([fda3:e722:ac3:cc00:7b:198d:ac11:8138])
 (user=ardb job=sendgmr) by 2002:a25:2d17:0:b0:e20:cfc2:a326 with SMTP id
 3f1490d57ef6-e25e6c34060mr15841276.6.1727421060114; Fri, 27 Sep 2024 00:11:00
 -0700 (PDT)
Date: Fri, 27 Sep 2024 09:10:51 +0200
Mime-Version: 1.0
X-Mailer: git-send-email 2.46.1.824.gd892dcdcdd-goog
Message-ID: <20240927071051.1444768-1-ardb+git@google.com>
Subject: [PATCH v2] target/arm: Avoid target_ulong for physical address lookups
From: Ard Biesheuvel <ardb+git@google.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Ard Biesheuvel <ardb@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, 
 Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b49;
 envelope-from=3hFr2ZggKCFEtAwu+z1Cz77z4x.v759x5D-tA5676z6D.7Az@flex--ardb.bounces.google.com;
 helo=mail-yb1-xb49.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
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
X-TUID: YruOIBBkAAEd

From: Ard Biesheuvel <ardb@kernel.org>

target_ulong is typedef'ed as a 32-bit integer when building the
qemu-system-arm target, and this is smaller than the size of an
intermediate physical address when LPAE is being used.

Given that Linux may place leaf level user page tables in high memory
when built for LPAE, the kernel will crash with an external abort as
soon as it enters user space when running with more than ~3 GiB of
system RAM.

So replace target_ulong with vaddr in places where it may carry an
address value that is not representable in 32 bits.

Fixes: f3639a64f602ea ("target/arm: Use softmmu tlbs for page table walking")
Reported-by: Arnd Bergmann <arnd@arndb.de>
Tested-by: Arnd Bergmann <arnd@arndb.de>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 target/arm/internals.h |  4 ++--
 target/arm/ptw.c       | 16 ++++++++--------
 2 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index c5d7b0b492..1e5da81ce9 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1449,7 +1449,7 @@ typedef struct GetPhysAddrResult {
  *  * for PSMAv5 based systems we don't bother to return a full FSR format
  *    value.
  */
-bool get_phys_addr(CPUARMState *env, target_ulong address,
+bool get_phys_addr(CPUARMState *env, vaddr address,
                    MMUAccessType access_type, ARMMMUIdx mmu_idx,
                    GetPhysAddrResult *result, ARMMMUFaultInfo *fi)
     __attribute__((nonnull));
@@ -1468,7 +1468,7 @@ bool get_phys_addr(CPUARMState *env, target_ulong address,
  * Similar to get_phys_addr, but use the given security space and don't perform
  * a Granule Protection Check on the resulting address.
  */
-bool get_phys_addr_with_space_nogpc(CPUARMState *env, target_ulong address,
+bool get_phys_addr_with_space_nogpc(CPUARMState *env, vaddr address,
                                     MMUAccessType access_type,
                                     ARMMMUIdx mmu_idx, ARMSecuritySpace space,
                                     GetPhysAddrResult *result,
diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index defd6b84de..659855133c 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -74,13 +74,13 @@ typedef struct S1Translate {
 } S1Translate;
 
 static bool get_phys_addr_nogpc(CPUARMState *env, S1Translate *ptw,
-                                target_ulong address,
+                                vaddr address,
                                 MMUAccessType access_type,
                                 GetPhysAddrResult *result,
                                 ARMMMUFaultInfo *fi);
 
 static bool get_phys_addr_gpc(CPUARMState *env, S1Translate *ptw,
-                              target_ulong address,
+                              vaddr address,
                               MMUAccessType access_type,
                               GetPhysAddrResult *result,
                               ARMMMUFaultInfo *fi);
@@ -3217,7 +3217,7 @@ static ARMCacheAttrs combine_cacheattrs(uint64_t hcr,
  */
 static bool get_phys_addr_disabled(CPUARMState *env,
                                    S1Translate *ptw,
-                                   target_ulong address,
+                                   vaddr address,
                                    MMUAccessType access_type,
                                    GetPhysAddrResult *result,
                                    ARMMMUFaultInfo *fi)
@@ -3300,7 +3300,7 @@ static bool get_phys_addr_disabled(CPUARMState *env,
 }
 
 static bool get_phys_addr_twostage(CPUARMState *env, S1Translate *ptw,
-                                   target_ulong address,
+                                   vaddr address,
                                    MMUAccessType access_type,
                                    GetPhysAddrResult *result,
                                    ARMMMUFaultInfo *fi)
@@ -3405,7 +3405,7 @@ static bool get_phys_addr_twostage(CPUARMState *env, S1Translate *ptw,
 }
 
 static bool get_phys_addr_nogpc(CPUARMState *env, S1Translate *ptw,
-                                      target_ulong address,
+                                      vaddr address,
                                       MMUAccessType access_type,
                                       GetPhysAddrResult *result,
                                       ARMMMUFaultInfo *fi)
@@ -3542,7 +3542,7 @@ static bool get_phys_addr_nogpc(CPUARMState *env, S1Translate *ptw,
 }
 
 static bool get_phys_addr_gpc(CPUARMState *env, S1Translate *ptw,
-                              target_ulong address,
+                              vaddr address,
                               MMUAccessType access_type,
                               GetPhysAddrResult *result,
                               ARMMMUFaultInfo *fi)
@@ -3558,7 +3558,7 @@ static bool get_phys_addr_gpc(CPUARMState *env, S1Translate *ptw,
     return false;
 }
 
-bool get_phys_addr_with_space_nogpc(CPUARMState *env, target_ulong address,
+bool get_phys_addr_with_space_nogpc(CPUARMState *env, vaddr address,
                                     MMUAccessType access_type,
                                     ARMMMUIdx mmu_idx, ARMSecuritySpace space,
                                     GetPhysAddrResult *result,
@@ -3571,7 +3571,7 @@ bool get_phys_addr_with_space_nogpc(CPUARMState *env, target_ulong address,
     return get_phys_addr_nogpc(env, &ptw, address, access_type, result, fi);
 }
 
-bool get_phys_addr(CPUARMState *env, target_ulong address,
+bool get_phys_addr(CPUARMState *env, vaddr address,
                    MMUAccessType access_type, ARMMMUIdx mmu_idx,
                    GetPhysAddrResult *result, ARMMMUFaultInfo *fi)
 {
-- 
2.46.1.824.gd892dcdcdd-goog

