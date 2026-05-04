Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EFF9CD3427
	for <qemu-arm@archiver.kernel.org>; Mon,  4 May 2026 15:52:40 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wJvZk-0000tD-6t; Mon, 04 May 2026 11:51:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <brookmangabriel@gmail.com>)
 id 1wJvZi-0000s7-9z
 for qemu-arm@nongnu.org; Mon, 04 May 2026 11:51:14 -0400
Received: from mail-qt1-x836.google.com ([2607:f8b0:4864:20::836])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <brookmangabriel@gmail.com>)
 id 1wJvZf-0006Ak-6k
 for qemu-arm@nongnu.org; Mon, 04 May 2026 11:51:14 -0400
Received: by mail-qt1-x836.google.com with SMTP id
 d75a77b69052e-50fb18c55beso43202141cf.2
 for <qemu-arm@nongnu.org>; Mon, 04 May 2026 08:51:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1777909870; x=1778514670; darn=nongnu.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=JUfPR3DjYgqYV/pHwWpNda6f5sDlnU1W0T/qSKzuPj8=;
 b=LR72MCY1jN6YIf3o+Id/e/bNwNg3YC2ZyhtGfY029WffNvCFVm/T32OCEfzZUttckp
 QhVkmxiwzzF8+u0iORWZ1ZdRxKJZOcfMNf7wv2xUN6gPERsyMjuw9j9mA6NQYRmec9is
 In0eDB9EouVXzjYdpQYSWKdTWGXugCybX6TZY/Z7oGWQr9k0uvYnbWYHhiuiDEwYCEBj
 Xp1J32VsX0/uEE84Wp2LEPvYDCnHmHijAi1N5Ij0bT4WPj1Fr/C1JVq1hqrsGSlN6TCt
 EM2KNNj76Jpp70lR+VXopg1yOwvQOHIglaR/kAX8ADriTJy/nJ1VPkryK9+SKeoTvSZg
 jMuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777909870; x=1778514670;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=JUfPR3DjYgqYV/pHwWpNda6f5sDlnU1W0T/qSKzuPj8=;
 b=dEIr8FDWTEP9xCbzVHn1s7qS92m9RQnrEc8zipodHCp4pktWQ3RWuVyD25aXN/AjoJ
 m+HWB54SPkpf+Ff89KkM+ceO0E7CGLTUtHKkxFje88W8FLwPXzwOdGaN7PFsyPjIwXtI
 1J558uXXeuARKachFrcvVyZK+puNQGQgNK1AEwVaYukbw6Msd/qS0133rSmcqNCHQeon
 BzBrGtufpFulM7V7P1rccFnpIcFuc8ryKspjT1tSmCtV13ZLwKrepbqzHft3I9IPQcxE
 GdWhmvcs9QZQG1vGzIWrGmXkesv742r5qMsyxvyo1g+jykTARvAxxMfRzZd6sKO1o8g/
 Pazg==
X-Forwarded-Encrypted: i=1;
 AFNElJ8yxNBggmUPvjuHKq1xlEmnoBkzKzVBPzQN/djtu51rfrvGLcJ4aORvvgx87OYk6t8hvAXqvR/2TQ==@nongnu.org
X-Gm-Message-State: AOJu0Yxdn0WWkxRn3p17SIv8L+J0EfvgUICPpZUXqG44AFqJW5r4IORK
 46WKCue+/nJmgSo/9zXWhps4JewzucUy8H8Bdg7rdSIti5nPFYBKOpIe
X-Gm-Gg: AeBDievg2emFtdecyxfsMVOg3WgGCa2q+OI5YFxKCtjzVCkGxmwC76hBsP1A/p0BKit
 80AzuBk7iM+6kFgzKVub1B40WZysYeRNv6f6ixB2iThQ/m1+nl1XNoNANrp4/b88IHTrELPOhgq
 1Cm6VeANUbgieAr3ux4iEsuOcejGBbTzozuBioNBjd+VyzKq3rjp3DeBTHFX1OSNndCLyzKYd+J
 iUfvgXgjrKamejJ7qLj0wjl9lqEUgGsM08r4gbtxN6RB6jPnDwFkdxFz6erfuGI4NmrWvaoPXjw
 JilFSQNPsYPDkJ2lmo4Y5m2w2yXmzkKbKlqRev+CXq5oa8+Mg0azZ0C+6nehDkAlTLH+zFelWym
 pCb9YEr0s3gr2ugTZD9KldyDuhDtn8jGjfpvvwJNKzCb8tBFHs+lUHxGTYmLxm/7CfEeQyFwlFr
 S/AjRzi3mNqU+QTXnic2Y7OlLnW1pNQcj9mXUuD+HT2IaOSQo3jaw=
X-Received: by 2002:a05:622a:18a9:b0:50d:6557:5c8f with SMTP id
 d75a77b69052e-5104bfa4eeemr143789841cf.58.1777909869851; 
 Mon, 04 May 2026 08:51:09 -0700 (PDT)
Received: from [192.168.1.164] ([2600:1009:a021:c665:5296:905f:3e4a:eb90])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-51040931552sm99599011cf.12.2026.05.04.08.51.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 May 2026 08:51:09 -0700 (PDT)
From: Gabriel Brookman <brookmangabriel@gmail.com>
Date: Mon, 04 May 2026 11:50:34 -0400
Subject: [PATCH v5 01/15] target/arm: implement MTE_PERM
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260504-feat-mte4-v5-1-232a648e63c6@gmail.com>
References: <20260504-feat-mte4-v5-0-232a648e63c6@gmail.com>
In-Reply-To: <20260504-feat-mte4-v5-0-232a648e63c6@gmail.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, 
 Gustavo Romero <gustavo.romero@linaro.org>, 
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org, 
 Laurent Vivier <laurent@vivier.eu>, 
 Gabriel Brookman <brookmangabriel@gmail.com>, Helge Deller <deller@gmx.de>, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777909867; l=4690;
 i=brookmangabriel@gmail.com; s=20251009; h=from:subject:message-id;
 bh=o+Y1Qx7rXo8nqYOsXdVp4KZ2JR8/3aepK/F4Yuu4kE0=;
 b=zShtqvYHaHGxVUpXOT9hN97Pcb+j1GeiUbhhEHsaC676k/VLLvNJIcBHb1PynGBkOxRWoCDSM
 mDZxzJq04lgDnWgZNUQoLQ8X07LzdpulYY8IeFv3KpEvVjTiZ1Kiowd
X-Developer-Key: i=brookmangabriel@gmail.com; a=ed25519;
 pk=m9TtPDal6WzoHNnQiHHKf8dTrv3DUCPUUTujuo8vNrw=
Received-SPF: pass client-ip=2607:f8b0:4864:20::836;
 envelope-from=brookmangabriel@gmail.com; helo=mail-qt1-x836.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

Introduces a new stage 2 memory attribute, NoTagAccess, that raises a
stage 2 data abort on a tag check, tag read, or tag write.

Signed-off-by: Gabriel Brookman <brookmangabriel@gmail.com>
---
 target/arm/cpu-features.h   |  5 +++++
 target/arm/ptw.c            | 25 ++++++++++++++++++++++---
 target/arm/tcg/mte_helper.c | 38 ++++++++++++++++++++++++++++++++++++--
 3 files changed, 63 insertions(+), 5 deletions(-)

diff --git a/target/arm/cpu-features.h b/target/arm/cpu-features.h
index 6e5212ff6c..c1f2336055 100644
--- a/target/arm/cpu-features.h
+++ b/target/arm/cpu-features.h
@@ -1149,6 +1149,11 @@ static inline bool isar_feature_aa64_mte3(const ARMISARegisters *id)
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
index 7b993bb5b3..4fdb27697d 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -3394,7 +3394,7 @@ static ARMCacheAttrs combine_cacheattrs(uint64_t hcr,
                                         ARMCacheAttrs s1, ARMCacheAttrs s2)
 {
     ARMCacheAttrs ret;
-    bool tagged = false;
+    bool tagged, notagaccess = false;
 
     assert(!s1.is_s2_format);
     ret.is_s2_format = false;
@@ -3404,6 +3404,18 @@ static ARMCacheAttrs combine_cacheattrs(uint64_t hcr,
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
@@ -3435,9 +3447,16 @@ static ARMCacheAttrs combine_cacheattrs(uint64_t hcr,
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


