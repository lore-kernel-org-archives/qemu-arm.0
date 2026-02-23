Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78D66EC110C
	for <qemu-arm@archiver.kernel.org>; Mon, 23 Feb 2026 17:03:08 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vuZKh-0002QZ-TO; Mon, 23 Feb 2026 12:02:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vuZKg-0002Oh-Gx
 for qemu-arm@nongnu.org; Mon, 23 Feb 2026 12:02:54 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vuZKe-0000GD-4N
 for qemu-arm@nongnu.org; Mon, 23 Feb 2026 12:02:54 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-480706554beso55475025e9.1
 for <qemu-arm@nongnu.org>; Mon, 23 Feb 2026 09:02:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1771866171; x=1772470971; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=oJkPB1+usEO1iILLwjFfPn1z9uieHX7lfkftnDGLpWQ=;
 b=tvlAZCI+J5/x8pDYcd2sitm2WKc8II8CH+w8Htcze+T4RjiO8iTf2oghWVWFyBbxPw
 peoJq5GUHxp+RYcBNamcfrahBKwFfpscY8K7T45caAaXcewOJNVXlPkt8GSStxbdtFus
 1CoJV0NrPWkCMT6yi1cBLyksO4upHyLRDpgZwCbS4viTf7Q0ZetmsvZIFeDIQjWVojNg
 t8lVcfpBP0VgSu2sMFFUd2IznSbeOZXljFHpz0IXbVOr9eYpCGZZhj88yebrdWH/vbJM
 CSv2P9xUrW+uWFR0oCFCkGDX+NSNIlgr4v2n0QiO0goGaxLeGbMNLJNZfsniYpKCpOOa
 mCEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771866171; x=1772470971;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=oJkPB1+usEO1iILLwjFfPn1z9uieHX7lfkftnDGLpWQ=;
 b=nKtVCiMfsEF6IkNJlHIf5FmrAoQ80yPNycxXuekaUpCUje4qRUeB9SyTsMDPwZpQCH
 I39O9ciMCv8S/D7eh4IlyGxAE9d15IT3EmdnxBljpKGG2+gBeGN8Q95OJ6Hs0fgSj4V1
 8pRKhmKMSSLKsicJ5cT3IAKneI3qq1SYuc+maFLp5sqfAjLAIysQMEcN5eJMS2BMHHvX
 souf9m/rDTv6Qlg3m7AMPtRg66HkfNI+twkhHfeZ9GBiNEHgcohwHmrQw3NC8PRb+Gvb
 wOFgiz/5EuBxhDWOR8gMguY6TTwrVsRZEkc6/AYHEJnx7A0zsYj149tadFQ8gEW0H1Xx
 6tHQ==
X-Gm-Message-State: AOJu0YywE/x6t8gPggTzYFaYyx5xdPGh8Jyf2EggUNixUPHKsMguKUrp
 ctR90JwU00k6PubDt7VVpI+NO1Hk2jmu/nitRNABHsPw3yV0qOBVdwe7tv83GHIDwYPzN9SRvSy
 uiDN5
X-Gm-Gg: AZuq6aKxyLiYr2au4x2cfVTPRQ/g7iemAelZ8oDKn1/SBZSzP6+FBPbQNE6CV62cAf8
 CGv0PZtldYxTZOnc7LEb4ICjAQSHx6G9xG5zLQBGN1Y0p7H0D2PC04XpkmPvQg45CdKfsqm/ctc
 /5bpIw3fuBw9utjLukp0SEh3vpsgVHteZssCEpR7xZNfJUdbKNFjW07zIFhsIGckKZgmKjKMxV7
 VV6B5dY/SMN/O6LrGH1khkNPsWs+e8MranOHcf6OtRVShcC+NnCQmwpFrWe9x29l5VJV6o49ZFs
 b8dPccTFxmqGVmnYBMj4ZEjwJRYnwy46NP4XoZd6KsofuxdsjM7Uw0QZSKld+NFlkcY0fxHMJkx
 hJ8Pyh1POtvfcgpPsP+9Tqdi9aL1zZ+AuQXRAQna8Aqi2S6aepg85cxFrRFvt5wetEFimWK8YTW
 XL84dVWUeRYhc1C1HVmoECf3BAkvWgaDSh5ZdksJ81PIyohD/IfCQn8MqcNukMEy5SyKzShxjcG
 UeLCC2QJeibX/Hr2nkeGIYvrF3STwynciA6Y2OMXg==
X-Received: by 2002:a05:600c:8717:b0:483:612d:7a5c with SMTP id
 5b1f17b1804b1-483a96375e3mr149074005e9.25.1771866170516; 
 Mon, 23 Feb 2026 09:02:50 -0800 (PST)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483a9b21ceasm200155625e9.0.2026.02.23.09.02.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Feb 2026 09:02:49 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 32/65] hw/intc/arm_gicv5: Cache pending LPIs in a hash table
Date: Mon, 23 Feb 2026 17:01:39 +0000
Message-ID: <20260223170212.441276-33-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260223170212.441276-1-peter.maydell@linaro.org>
References: <20260223170212.441276-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

The GICv5 stores information about LPIs in a guest-memory data
structure.  Iterating through this to identify the highest priority
pending interrupt would be expensive; to avoid this we will use a
hash table which contains an entry for each pending LPI and which
caches the L2 ISTE.  Typically only a few LPIs will be pending at any
one time, so iterating through the hash table should be fast.

We can access an L2 ISTE whenever it is valid, and can freely cache
the data for as long as the IST is valid.  We only need to ensure
that we have written back the data at the point where
IRS_IST_BASER.VALID is written to 0.

We add an LPI to the cache when the pending bit is written to 1, and
remove it when it is written to 0.  Handling of checking the cache,
and of adding and removing entries, is handled within get_l2_iste()
and put_l2_iste(), which all the operations that read and write ISTE
words use.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/arm_gicv5.c         | 110 +++++++++++++++++++++++++++++++++++-
 include/hw/intc/arm_gicv5.h |   2 +
 2 files changed, 111 insertions(+), 1 deletion(-)

diff --git a/hw/intc/arm_gicv5.c b/hw/intc/arm_gicv5.c
index fa7692ca0e..30368998d3 100644
--- a/hw/intc/arm_gicv5.c
+++ b/hw/intc/arm_gicv5.c
@@ -474,10 +474,21 @@ static bool write_l2_iste_mem(GICv5Common *cs, const GICv5ISTConfig *cfg,
  * reads and writes to update the L2 ISTE. In a future commit we
  * will add support for a cache of some of the ISTE data in a
  * local hashtable; the APIs are designed with that in mind.
+ * Not all these fields are always valid; they are private to
+ * the implementation of get_l2_iste() and put_l2_iste().
  */
 typedef struct L2_ISTE_Handle {
+    /* Guest memory address of the L2 ISTE; valid only if !hashed */
     hwaddr l2_iste_addr;
-    uint32_t l2_iste;
+    union {
+        /* Actual L2_ISTE word; valid only if !hashed */
+        uint32_t l2_iste;
+        /* Pointer to L2 ISTE word; valid only if hashed */
+        uint32_t *l2_iste_p;
+    };
+    uint32_t id;
+    /* True if this ISTE is currently in the cache */
+    bool hashed;
 } L2_ISTE_Handle;
 
 static uint32_t *get_l2_iste(GICv5Common *cs, const GICv5ISTConfig *cfg,
@@ -498,6 +509,25 @@ static uint32_t *get_l2_iste(GICv5Common *cs, const GICv5ISTConfig *cfg,
      * If the ISTE could not be read (typically because of a
      * memory error), return NULL.
      */
+    uint32_t *hashvalue;
+
+    if (!cfg->valid) {
+        /* Catch invalid config early, it has no lpi_cache */
+        return NULL;
+    }
+
+    hashvalue = g_hash_table_lookup(cfg->lpi_cache,
+                                    GINT_TO_POINTER(id));
+
+    h->id = id;
+
+    if (hashvalue) {
+        h->hashed = true;
+        h->l2_iste_p = hashvalue;
+        return hashvalue;
+    }
+
+    h->hashed = false;
     if (!get_l2_iste_addr(cs, cfg, id, &h->l2_iste_addr) ||
         !read_l2_iste_mem(cs, cfg, h->l2_iste_addr, &h->l2_iste)) {
         return NULL;
@@ -513,6 +543,34 @@ static void put_l2_iste(GICv5Common *cs, const GICv5ISTConfig *cfg,
      * Once this has been called the L2_ISTE_Handle @h and the
      * pointer to the L2 ISTE word are no longer valid.
      */
+    if (h->hashed) {
+        uint32_t l2_iste = *h->l2_iste_p;
+        if (!FIELD_EX32(l2_iste, L2_ISTE, PENDING)) {
+            /*
+             * We just made this not pending: remove from hash table
+             * and write back to memory.
+             */
+            hwaddr l2_iste_addr;
+
+            g_hash_table_remove(cfg->lpi_cache, GINT_TO_POINTER(h->id));
+            if (get_l2_iste_addr(cs, cfg, h->id, &l2_iste_addr)) {
+                write_l2_iste_mem(cs, cfg, l2_iste_addr, l2_iste);
+                /* Writeback errors are ignored. */
+            }
+        }
+        return;
+    }
+
+    if (FIELD_EX32(h->l2_iste, L2_ISTE, PENDING)) {
+        /*
+         * We just made this pending: add it to the hash table, and
+         * don't bother writing it back to memory.
+         */
+        uint32_t *hashvalue = g_new(uint32_t, 1);
+        *hashvalue = h->l2_iste;
+        g_hash_table_insert(cfg->lpi_cache, GINT_TO_POINTER(h->id), hashvalue);
+        return;
+    }
     write_l2_iste_mem(cs, cfg, h->l2_iste_addr, h->l2_iste);
 }
 
@@ -857,6 +915,38 @@ txfail:
                   "physical address 0x" HWADDR_FMT_plx "\n", intid, l1_addr);
 }
 
+/* Data we need to pass through to irs_clean_lpi_cache_entry() */
+typedef struct CleanLPICacheUserData {
+    GICv5Common *cs;
+    GICv5ISTConfig *cfg;
+} CleanLPICacheUserData;
+
+static gboolean irs_clean_lpi_cache_entry(gpointer key, gpointer value,
+                                          gpointer user_data)
+{
+    /* Drop this entry from the LPI cache, writing it back to guest memory. */
+    CleanLPICacheUserData *ud = user_data;
+    hwaddr l2_iste_addr;
+    uint64_t id = GPOINTER_TO_INT(key);
+    uint32_t l2_iste = *(uint32_t *)value;
+
+    if (!get_l2_iste_addr(ud->cs, ud->cfg, id, &l2_iste_addr) ||
+        !write_l2_iste_mem(ud->cs, ud->cfg, l2_iste_addr, l2_iste)) {
+        /* We drop the cached entry regardless of writeback errors */
+        return true;
+    }
+    return true;
+}
+
+static void irs_clean_lpi_cache(GICv5Common *cs, GICv5ISTConfig *cfg)
+{
+    /* Write everything in the LPI cache out to guest memory */
+    CleanLPICacheUserData ud;
+    ud.cs = cs;
+    ud.cfg = cfg;
+
+    g_hash_table_foreach_remove(cfg->lpi_cache, irs_clean_lpi_cache_entry, &ud);
+}
 
 static void irs_ist_baser_write(GICv5 *s, GICv5Domain domain, uint64_t value)
 {
@@ -869,6 +959,7 @@ static void irs_ist_baser_write(GICv5 *s, GICv5Domain domain, uint64_t value)
             /* Ignore 1->1 transition */
             return;
         }
+        irs_clean_lpi_cache(cs, &s->phys_lpi_config[domain]);
         cs->irs_ist_baser[domain] = FIELD_DP64(cs->irs_ist_baser[domain],
                                                IRS_IST_BASER, VALID, valid);
         s->phys_lpi_config[domain].valid = false;
@@ -930,6 +1021,15 @@ static void irs_ist_baser_write(GICv5 *s, GICv5Domain domain, uint64_t value)
         cfg->l2_idx_bits = l2_idx_bits;
         cfg->structure = FIELD_EX64(cs->irs_ist_cfgr[domain],
                                     IRS_IST_CFGR, STRUCTURE);
+        if (!cfg->lpi_cache) {
+            /*
+             * Keys are GINT_TO_POINTER(intid), so we want the g_direct_hash
+             * and g_direct_equal hash and equality functions. We don't
+             * want to free the keys, but we do want to free the values
+             * (which are pointer-to-uint32_t).
+             */
+            cfg->lpi_cache = g_hash_table_new_full(NULL, NULL, NULL, g_free);
+        }
         cfg->valid = true;
         trace_gicv5_ist_valid(domain_name[domain], cfg->base, cfg->id_bits,
                               cfg->l2_idx_bits, cfg->istsz, cfg->structure);
@@ -1406,6 +1506,14 @@ static void gicv5_reset_hold(Object *obj, ResetType type)
     /* IRS_IST_BASER and IRS_IST_CFGR reset to 0, clear cached info */
     for (int i = 0; i < NUM_GICV5_DOMAINS; i++) {
         s->phys_lpi_config[i].valid = false;
+        /*
+         * If we got reset (power-cycled) with data in the cache,
+         * we don't write it out to guest memory; just return to
+         * "empty cache".
+         */
+        if (s->phys_lpi_config[i].lpi_cache) {
+            g_hash_table_remove_all(s->phys_lpi_config[i].lpi_cache);
+        }
     }
 }
 
diff --git a/include/hw/intc/arm_gicv5.h b/include/hw/intc/arm_gicv5.h
index c631ecc3e8..fb13de0d01 100644
--- a/include/hw/intc/arm_gicv5.h
+++ b/include/hw/intc/arm_gicv5.h
@@ -25,6 +25,8 @@ typedef struct GICv5ISTConfig {
     uint8_t istsz; /* L2 ISTE size in bytes */
     bool structure; /* true if using 2-level table */
     bool valid; /* true if this table is valid and usable */
+    /* This caches IST information about pending LPIs */
+    GHashTable *lpi_cache;
 } GICv5ISTConfig;
 
 /*
-- 
2.43.0


