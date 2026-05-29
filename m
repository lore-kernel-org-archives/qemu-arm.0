Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3448DCD4F54
	for <qemu-arm@archiver.kernel.org>; Fri, 29 May 2026 19:54:05 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wT3Gl-0005YY-70; Fri, 29 May 2026 15:53:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <brookmangabriel@gmail.com>)
 id 1wT3GQ-0004x2-Vq
 for qemu-arm@nongnu.org; Fri, 29 May 2026 15:53:04 -0400
Received: from mail-oo1-xc2b.google.com ([2607:f8b0:4864:20::c2b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <brookmangabriel@gmail.com>)
 id 1wT3GM-0005X1-Ru
 for qemu-arm@nongnu.org; Fri, 29 May 2026 15:53:02 -0400
Received: by mail-oo1-xc2b.google.com with SMTP id
 006d021491bc7-69d7cdd3b8eso3103432eaf.2
 for <qemu-arm@nongnu.org>; Fri, 29 May 2026 12:52:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1780084377; x=1780689177; darn=nongnu.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=VbW6Hbyj3U6aT8UlGYOD2Cj2J91JoG8oSSN/XuQKEIk=;
 b=cDYFgd69CFaxn9F0AnVm67sxkt9ZKY3ofb+/Bi1IuPZZHNgbC/V7Ncp8Y9OeFSDrdw
 CTPtUz6bQ/3aM02IeDplVQ9mDMZzNK1IZMkuOExpdWETFCot/DxN0kVEZLei+ClH12PS
 NAFCghLySURWJEN4kZx5ma+apSaDvXEcZv8ao32KDISKiaXZkaORCkixCralvqhAEcnt
 awN1Y84q0EJy7avVQlh0AkEtYuDhAVT0uvnEhWEFPYop4+xJUN2WPMPrXRwQy2f1Dkr8
 FpTaOi/mgJ2HKQ6WmSCAd9mwoEpxH0xV8WQ4Vq8X1lisiB+6Io+ehXOitCn9x4R6R6cy
 CC/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780084377; x=1780689177;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=VbW6Hbyj3U6aT8UlGYOD2Cj2J91JoG8oSSN/XuQKEIk=;
 b=pAgH9dG9Ak/Qeavcy9uWjomjEh1N0O/iEgT+VbJZCfV0nQ6onwYp1aJ57uZko7pIAv
 4mqLjtQ6w+lRqLTen7swBTzS0yGSqWLXZu5QhvLUHjtxPs4wZyWzSE496NQOthlKGIM9
 BbC55rsy+uB1ye1+UCUCAS1fXijBNdn/59DvZwAjdO6kqC9Np+AMqVILORpQTOHjqYac
 FYfIzMIdfhn1e3aycxhnkAolLhyLX1qbs/mCDHVetuRgXGpa8vj+amAgYImHZH6XnIpy
 BdnBAXdEYBiX8BFjfALgv76JrnHzmpRhga+zcn/1QKe8ri4CjGXzPfKef5qwkhu81sQd
 I1YA==
X-Forwarded-Encrypted: i=1;
 AFNElJ/cjZk5OSxsKOKXZJ778nlkd1OE2QT5RD9mF9ERNtff564vrmv3JkGkVtj8jfeKEAAWfAXLi1AnlA==@nongnu.org
X-Gm-Message-State: AOJu0YyZwQPaRRDgJmJus7htQ6E5Ik6jyv1eEITo9yevAxfn4iXKMNqH
 y/AqFtA+Cd7AkKX+gpHbPNkLV6ZSzQHC4FM+PURPam7CgZWiLQK9ARp5
X-Gm-Gg: Acq92OFaabKyTNU6WETKgpROCQNkfKn9yRhLITz6ZF24jqaiqSRCRk2JrC2in2KUuRL
 EuIIoU8xIlTWNsiudL1c/3SuvbQYCJBcx7BLVfYH02CL3M9/wz7xv0QjSKpuFQRA/2AZ48ZKkZO
 BxnLzVVzXE71Yyf+3hSDXlja0P1x8d+SQjb25L2qXnMo7gTOhmxK9zPYJyRraPorb6EcgsWwZt5
 4cKq5nybWGmhzk4GK8RDq93hhjlhb43OYwylAS45EVBBSTre4uWWr02R0OFlyLtyVo5AqqA+7Cc
 wFAfPUBZNiTyGfO2NRwn6NUZjTAifbJBXOygWhy9JKTAVfhDGQE5Wb9EHgqPyQteDMToGsvxO1t
 pm5cQLhj8zTHtocVgCrHcQi11OcShNfnPvX2I632wnMookDnLbxh29hU7lvEg3XoseeieSK5dZC
 kW17xQzQaIeqYWTEQtA1WudGKALGKV9gdyNzQyJiy0lG4=
X-Received: by 2002:a05:6820:c82:b0:694:8fb2:2c35 with SMTP id
 006d021491bc7-69e104765bcmr440621eaf.2.1780084377473; 
 Fri, 29 May 2026 12:52:57 -0700 (PDT)
Received: from [10.21.163.79] ([146.74.94.63])
 by smtp.gmail.com with ESMTPSA id
 006d021491bc7-69e06587eecsm1626692eaf.0.2026.05.29.12.52.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 May 2026 12:52:56 -0700 (PDT)
From: Gabriel Brookman <brookmangabriel@gmail.com>
Date: Fri, 29 May 2026 12:52:41 -0700
Subject: [PATCH v7 01/15] target/arm: implement MTE_PERM
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260529-feat-mte4-v7-1-ccbd3c14eb3c@gmail.com>
References: <20260529-feat-mte4-v7-0-ccbd3c14eb3c@gmail.com>
In-Reply-To: <20260529-feat-mte4-v7-0-ccbd3c14eb3c@gmail.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, 
 Gustavo Romero <gustavo.romero@linaro.org>, 
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org, 
 Laurent Vivier <laurent@vivier.eu>, 
 Gabriel Brookman <brookmangabriel@gmail.com>, Helge Deller <deller@gmx.de>, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780084373; l=4761;
 i=brookmangabriel@gmail.com; s=20251009; h=from:subject:message-id;
 bh=hMnVVCR5aDsXksNo9hA/xVe759MtMSZHmHwiTMnpTcw=;
 b=eryx34ZM8YCj6tPqJP5zRYRnuFQcK7VT5G4vzXX3GjiKJhXUtShKnz/cWCZH2vPSEDLH9zdje
 +IeHg37QIl7BBCaY9GckuTIoHDCCa8/i7qmJVkRlJhD/2FIaWZ6hzQ2
X-Developer-Key: i=brookmangabriel@gmail.com; a=ed25519;
 pk=m9TtPDal6WzoHNnQiHHKf8dTrv3DUCPUUTujuo8vNrw=
Received-SPF: pass client-ip=2607:f8b0:4864:20::c2b;
 envelope-from=brookmangabriel@gmail.com; helo=mail-oo1-xc2b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Introduces a new stage 2 memory attribute, NoTagAccess, that raises a
stage 2 data abort on a tag check, tag read, or tag write.

Signed-off-by: Gabriel Brookman <brookmangabriel@gmail.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu-features.h   |  5 +++++
 target/arm/ptw.c            | 25 ++++++++++++++++++++++---
 target/arm/tcg/mte_helper.c | 38 ++++++++++++++++++++++++++++++++++++--
 3 files changed, 63 insertions(+), 5 deletions(-)

diff --git a/target/arm/cpu-features.h b/target/arm/cpu-features.h
index f9c979d20b..9451df3813 100644
--- a/target/arm/cpu-features.h
+++ b/target/arm/cpu-features.h
@@ -1181,6 +1181,11 @@ static inline bool isar_feature_aa64_mte3(const ARMISARegisters *id)
     return FIELD_EX64_IDREG(id, ID_AA64PFR1, MTE) >= 3;
 }
 
+static inline bool isar_feature_aa64_mteperm(const ARMISARegisters *id)
+{
+    return FIELD_EX64_IDREG(id, ID_AA64PFR2, MTEPERM) >= 1;
+}
+
 static inline bool isar_feature_aa64_sme(const ARMISARegisters *id)
 {
     return FIELD_EX64_IDREG(id, ID_AA64PFR1, SME) != 0;
diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 0a5201763a..6cb0fe5645 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -3415,7 +3415,7 @@ static ARMCacheAttrs combine_cacheattrs(uint64_t hcr,
                                         ARMCacheAttrs s1, ARMCacheAttrs s2)
 {
     ARMCacheAttrs ret;
-    bool tagged = false;
+    bool tagged = false, notagaccess = false;
 
     assert(!s1.is_s2_format);
     ret.is_s2_format = false;
@@ -3425,6 +3425,18 @@ static ARMCacheAttrs combine_cacheattrs(uint64_t hcr,
         s1.attrs = 0xff;
     }
 
+    if (hcr & HCR_FWB) {
+        if (s2.attrs >= 0xe) {
+            notagaccess = true;
+            s2.attrs = 0x7;
+        }
+    } else {
+        if (s2.attrs == 0x4) {
+            notagaccess = true;
+            s2.attrs = 0xf;
+        }
+    }
+
     /* Combine shareability attributes (table D4-43) */
     if (s1.shareability == 2 || s2.shareability == 2) {
         /* if either are outer-shareable, the result is outer-shareable */
@@ -3456,9 +3468,16 @@ static ARMCacheAttrs combine_cacheattrs(uint64_t hcr,
         ret.shareability = 2;
     }
 
-    /* TODO: CombineS1S2Desc does not consider transient, only WB, RWA. */
+    /*
+     * The attr encoding 0xe0 corresponds to Tagged NoTagAccess and is only
+     * valid with FEAT_MTE_PERM (otherwise RESERVED, constrained
+     * unpredictable)). The presence of this feature is checked in
+     * allocation_tag_mem_probe, where Tagged NoTagAccess has its effect. See
+     * J1.3.5.2 EncodePARAttrs.
+     * TODO: CombineS1S2Desc does not consider transient, only WB, RWA.
+     */
     if (tagged && ret.attrs == 0xff) {
-        ret.attrs = 0xf0;
+        ret.attrs = notagaccess ? 0xe0 : 0xf0;
     }
 
     return ret;
diff --git a/target/arm/tcg/mte_helper.c b/target/arm/tcg/mte_helper.c
index a9fb979f63..bf35dc10ce 100644
--- a/target/arm/tcg/mte_helper.c
+++ b/target/arm/tcg/mte_helper.c
@@ -58,6 +58,27 @@ static int choose_nonexcluded_tag(int tag, int offset, uint16_t exclude)
     return tag;
 }
 
+#ifndef CONFIG_USER_ONLY
+/*
+ * Constructs S2 Permission Fault as described in ARM ARM "Stage 2 Memory
+ * Tagging Attributes".
+ */
+static void mte_perm_check_fail(CPUARMState *env, uint64_t dirty_ptr,
+                                uintptr_t ra, bool is_write)
+{
+    uint64_t syn;
+
+    env->exception.vaddress = dirty_ptr;
+
+    syn = syn_data_abort_no_iss(0, 0, 0, 0, 0, is_write, 0);
+
+    syn |= BIT_ULL(41); /* TagAccess is bit 41 */
+
+    raise_exception_ra(env, EXCP_DATA_ABORT, syn, 2, ra);
+    g_assert_not_reached();
+}
+#endif
+
 uint8_t *allocation_tag_mem_probe(CPUARMState *env, int ptr_mmu_idx,
                                   uint64_t ptr, MMUAccessType ptr_access,
                                   int ptr_size, MMUAccessType tag_access,
@@ -117,8 +138,21 @@ uint8_t *allocation_tag_mem_probe(CPUARMState *env, int ptr_mmu_idx,
     }
     assert(!(flags & TLB_INVALID_MASK));
 
-    /* If the virtual page MemAttr != Tagged, access unchecked. */
-    if (full->extra.arm.pte_attrs != 0xf0) {
+    switch (full->extra.arm.pte_attrs) {
+    case 0xf0: /* Tagged */
+        break;
+
+    case 0xe0: /* NoTagAccess */
+        if (cpu_isar_feature(aa64_mteperm, env_archcpu(env))) {
+            if (probe) {
+                return NULL;
+            }
+            assert(ra);
+            mte_perm_check_fail(env, ptr, ra, tag_access == MMU_DATA_STORE);
+        }
+        /* fall through */
+
+    default: /* Not Tagged */
         return NULL;
     }
 

-- 
2.54.0


