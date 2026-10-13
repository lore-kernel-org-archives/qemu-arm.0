Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6C9CCA9ED2
	for <qemu-arm@archiver.kernel.org>; Tue, 13 Oct 2026 08:48:45 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xGY6e-0005FF-B2; Tue, 13 Oct 2026 04:43:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xGY48-0000JQ-5w
 for qemu-arm@nongnu.org; Tue, 13 Oct 2026 04:40:57 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xGY44-00085I-Nn
 for qemu-arm@nongnu.org; Tue, 13 Oct 2026 04:40:55 -0400
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-486e70f2457so1159821f8f.2
 for <qemu-arm@nongnu.org>; Tue, 13 Oct 2026 01:40:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1791880851; x=1792485651; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=Q24yZtF6JH+M8UUja9cJN6DozeEXycsaupE/igqjcjo=;
 b=JisIGbKBSqpFdIKAURsQBtwt5M+GJfzxnMX+/SUsJzbUSF2QVGpTz40yDWetAr/v9i
 w4lIQJbdVQkyuAD8as+As9dU93XUdqS6e+qFRh0+ysAqQW3Y2H7dPUZ407OgVTom49Kk
 ws4mCyumt6hxHAPSDDhkO3kdx24AdL8uP2FllMgn7ilEF2yu3dEpb8Ke9BBLgt/28i/e
 upJdjN2PCXbVS8sq4IaKtWdwW7OJNJb/boujccz440m88kDI1Qb+UTCwY9jKVTficiPR
 v5hDCCCp+KnI1wT9Hcw6gf5ibY3VMXHmRLJo55cP46Wdcm/k71pdmuaZkJnkM9ax65yH
 v9zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791880851; x=1792485651;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to:content-type;
 bh=Q24yZtF6JH+M8UUja9cJN6DozeEXycsaupE/igqjcjo=;
 b=Gk9JgpUy5+R1SCzxhIyzBXTqLG8L2idncy10QysepHI1D4FtaPia7yfkP2sHsV+TIX
 EL2+r5aiJimOt2orR80LPgJhMXVHqsOLVk0ksvsQynQkwVjKCZyNjORJd7HJTuKvZ1p6
 +j4ImtJaMabQvy9E6nY/+V6h+s45ITQxFLu40YYYGJvJh5Dbh+0+AMqOOeV6uBWOlJKO
 pkW/8d2j3Mk3n4hHXrmNdk1nAVnX3zA1sfCfEVLCqDa+74kNjRgqM9g6gTVqlTNdWxDI
 aOjU+Cc3/Psyu7j4qmKUl8k93xoytjCVhBiyb+OHSZDENV9EOe4yvtuN8hlqCNaD6MUQ
 pQKA==
X-Gm-Message-State: AFq9FYI7S/YEFf/KQbjFQZeiRDUHuOAOKKm+Fe0siS9lxR4+XwhiQq4k
 Q7qYEcopwTPGBO9on4lw1GKkjqB0DL8gGQ74wxzPp9I2NapMu9fKyq5aL4t81508jtCaCsrbsp3
 C4ZjGx3w=
X-Gm-Gg: AYBFou1fzhUnKc69eJm1iliTjyAUrfa86Q07incQCb7nQDmjZyIeqsE+SS6ieRRMHfk
 6h6bk0b3Leh8f/4InIDeFpOtiREdIy0p41D1SoVP/9FKI41eyTnTFDwpR+ndMh0fAw2gGpiWnlX
 A4tAzE1gCh5QKSJkkGKkZKhqSJuCKK0iahgwHHwjXWLHdKsPzLH8FqHQn+upPCtXyy6vh2B3OiL
 o4VBrZIiSkjaK3VTleU9zEy2yaDHHzRMDcOFFR4gKYCXwBCdqCeAwqt3r3csOdNxbt1wmlLhEUn
 xhphEFMy9JhxP2SVr3NGJPAJUEbaT3P5rmyCyj7iLuvaY90/5w0afB1fTp+dN/fQ+jRMyniD4PQ
 IAIt9yHl7C8MmMu4hHenGhWqCzRt6+kdQ55KPOesMbn3yL43EYthQTna3shC7OlB+Wh8Um7JoUU
 fy9a1ainxLoAQEDYsXmQ7Mk3xOnI/RqztD9Dk/3ZG6fYYVjkVM1xZRSO/gmnlloX4wGG3uekMLO
 T6KBfFK8qRgTRXP6G8C72D78bqcVbEnIYsiq7W9RuXPLQd+JuNrKTxOK6I55rE9A5QogRHPOBpb
 ZN1z
X-Received: by 2002:a05:600c:c107:b0:4a1:875b:8be4 with SMTP id
 5b1f17b1804b1-4a193f3b3a4mr144753915e9.8.1791880850917; 
 Tue, 13 Oct 2026 01:40:50 -0700 (PDT)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a18be96549sm495086735e9.6.2026.10.13.01.40.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Oct 2026 01:40:50 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 57/86] hw/intc/arm_gicv5: Factor out code to fill in a
 GICv5ISTConfig
Date: Tue, 13 Oct 2026 09:39:04 +0100
Message-ID: <20261013083933.1024405-58-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261013083933.1024405-1-peter.maydell@linaro.org>
References: <20261013083933.1024405-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x432.google.com
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

irs_ist_baser_write() has code that fills in a GICv5ISTConfig based
on various register fields, including sanitizing uses of reserved
values, enforcing minimum and maximum values, and pre-calculating how
many bits index the L2 table.

We will want exactly the same logic for setting up GICv5ISTConfig
structs for a VM's LPI and SPI IST structures based on the fields in
the L2 VMTE.  Factor out the "fill in the GICv5ISTConfig" code to a
separate function that we can call.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/arm_gicv5.c | 181 ++++++++++++++++++++++++--------------------
 1 file changed, 100 insertions(+), 81 deletions(-)

diff --git a/hw/intc/arm_gicv5.c b/hw/intc/arm_gicv5.c
index f03b790cf41..8cf7e363f29 100644
--- a/hw/intc/arm_gicv5.c
+++ b/hw/intc/arm_gicv5.c
@@ -976,6 +976,96 @@ void gicv5_deactivate(GICv5Common *cs, uint32_t id, GICv5Domain domain,
     irs_recalc_hppi(s, domain, iaffid);
 }
 
+static void initialize_ist_config(GICv5Common *cs, GICv5Domain domain,
+                                  GICv5ISTConfig *cfg,
+                                  hwaddr base,
+                                  uint8_t id_bits, uint8_t istsz, uint8_t l2sz,
+                                  bool structure)
+{
+    uint8_t istbits, l2bits, l2_idx_bits;
+    int tableszbits;
+
+    switch (istsz) {
+    case 0:
+    case 3: /* reserved: acts like the minimum required size */
+        istbits = 2;
+        break;
+    case 1:
+        istbits = 3;
+        break;
+    case 2:
+        istbits = 4;
+        break;
+    default:
+        g_assert_not_reached();
+    }
+    switch (l2sz) {
+    case 0:
+    case 3: /* reserved; CONSTRAINED UNPREDICTABLE */
+        l2bits = 12; /* 4K: 12 bits */
+        break;
+    case 1:
+        l2bits = 14; /* 16K: 14 bits */
+        break;
+    case 2:
+        l2bits = 16; /* 64K: 16 bits */
+        break;
+    default:
+        g_assert_not_reached();
+    }
+    /*
+     * Calculate how many bits of an ID index the L2 table
+     * (e.g. if we need 14 bits to index each byte in a 16K L2 table,
+     * but each entry is 4 bytes wide then we need 14 - 2 = 12 bits
+     * to index an entry in the table).
+     */
+    l2_idx_bits = l2bits - istbits;
+    cfg->base = base;
+    cfg->txattrs = irs_txattrs(cs, domain);
+    cfg->id_bits = id_bits;
+    cfg->istsz = 1 << istbits;
+    cfg->l2_idx_bits = l2_idx_bits;
+    cfg->l2bits = l2bits;
+    cfg->structure = structure;
+
+    /*
+     * Bits [N:0] of the base addr are ignored, to enforce that in a
+     * 1-level IST it is aligned to the size of the ISTE array,
+     * and in a 2-level IST it is aligned to the size of the L1 table.
+     * The spec defines N in terms of the raw L2SZ, ISTSZ and LPI_ID_BITS
+     * fields, but we have already sanitized these to
+     *  istbits = ISTSZ + 2
+     *  l2bits = (L2SZ * 2) + 12
+     *  id_bits = LPI_ID_BITS
+     * We have also already enforced the "bottom 6 bits are 0" via
+     * the fixed field mask, so can skip the Max() operation.
+     * We want tableszbits == the number of bits to zero, which is N + 1.
+     */
+    if (cfg->structure) {
+        /*
+         * L1 table is indexed by the (id_bits - l2_idx_bits) bits in
+         * the ID, so has 2^(id_bits - l2_idx_bits) entries, and each
+         * entry is 8 bytes == 2^3.
+         */
+        tableszbits = id_bits - l2_idx_bits + 3;
+    } else {
+        /* table has 2^id_bits entries of 2^istbits size each */
+        tableszbits = id_bits + istbits;
+    }
+    cfg->base &= ~MAKE_64BIT_MASK(0, tableszbits);
+
+    if (!cfg->lpi_cache) {
+        /*
+         * Keys are GINT_TO_POINTER(intid), so we want the g_direct_hash
+         * and g_direct_equal hash and equality functions. We don't
+         * want to free the keys, but we do want to free the values
+         * (which are pointer-to-uint32_t).
+         */
+        cfg->lpi_cache = g_hash_table_new_full(NULL, NULL, NULL, g_free);
+    }
+    cfg->valid = true;
+}
+
 static void irs_map_l2_istr_write(GICv5 *s, GICv5Domain domain, uint64_t value)
 {
     GICv5Common *cs = ARM_GICV5_COMMON(s);
@@ -1086,92 +1176,21 @@ static void irs_ist_baser_write(GICv5 *s, GICv5Domain domain, uint64_t value)
          * sanitize the reserved values, and expand fields out into byte counts.
          */
         GICv5ISTConfig *cfg = &s->phys_lpi_config[domain];
-        uint8_t istbits, l2bits, l2_idx_bits;
-        int tableszbits;
+        hwaddr base = cs->irs_ist_baser[domain] & R_IRS_IST_BASER_ADDR_MASK;
         uint8_t id_bits = FIELD_EX64(cs->irs_ist_cfgr[domain],
                                      IRS_IST_CFGR, LPI_ID_BITS);
-        id_bits = MIN(MAX(id_bits, QEMU_GICV5_MIN_LPI_ID_BITS), QEMU_GICV5_ID_BITS);
-
-        switch (FIELD_EX64(cs->irs_ist_cfgr[domain], IRS_IST_CFGR, ISTSZ)) {
-        case 0:
-        case 3: /* reserved: acts like the minimum required size */
-            istbits = 2;
-            break;
-        case 1:
-            istbits = 3;
-            break;
-        case 2:
-            istbits = 4;
-            break;
-        default:
-            g_assert_not_reached();
-        }
-        switch (FIELD_EX64(cs->irs_ist_cfgr[domain], IRS_IST_CFGR, L2SZ)) {
-        case 0:
-        case 3: /* reserved; CONSTRAINED UNPREDICTABLE */
-            l2bits = 12; /* 4K: 12 bits */
-            break;
-        case 1:
-            l2bits = 14; /* 16K: 14 bits */
-            break;
-        case 2:
-            l2bits = 16; /* 64K: 16 bits */
-            break;
-        default:
-            g_assert_not_reached();
-        }
-        /*
-         * Calculate how many bits of an ID index the L2 table
-         * (e.g. if we need 14 bits to index each byte in a 16K L2 table,
-         * but each entry is 4 bytes wide then we need 14 - 2 = 12 bits
-         * to index an entry in the table).
-         */
-        l2_idx_bits = l2bits - istbits;
-        cfg->base = cs->irs_ist_baser[domain] & R_IRS_IST_BASER_ADDR_MASK;
-        cfg->txattrs = irs_txattrs(cs, domain),
-        cfg->id_bits = id_bits;
-        cfg->istsz = 1 << istbits;
-        cfg->l2_idx_bits = l2_idx_bits;
-        cfg->l2bits = l2bits;
-        cfg->structure = FIELD_EX64(cs->irs_ist_cfgr[domain],
+        uint8_t istsz = FIELD_EX64(cs->irs_ist_cfgr[domain],
+                                   IRS_IST_CFGR, ISTSZ);
+        uint8_t l2sz = FIELD_EX64(cs->irs_ist_cfgr[domain],
+                                  IRS_IST_CFGR, L2SZ);
+        bool structure = FIELD_EX64(cs->irs_ist_cfgr[domain],
                                     IRS_IST_CFGR, STRUCTURE);
 
-        /*
-         * Bits [N:0] of the base addr are ignored, to enforce that in a
-         * 1-level IST it is aligned to the size of the ISTE array,
-         * and in a 2-level IST it is aligned to the size of the L1 table.
-         * The spec defines N in terms of the raw L2SZ, ISTSZ and LPI_ID_BITS
-         * fields, but we have already sanitized these to
-         *  istbits = ISTSZ + 2
-         *  l2bits = (L2SZ * 2) + 12
-         *  id_bits = LPI_ID_BITS
-         * We have also already enforced the "bottom 6 bits are 0" via
-         * R_IRS_IST_BASER_ADDR_MASK, so can skip the Max() operation.
-         * We want tableszbits == the number of bits to zero, which is N + 1.
-         */
-        if (cfg->structure) {
-            /*
-             * L1 table is indexed by the (id_bits - l2_idx_bits) bits in
-             * the ID, so has 2^(id_bits - l2_idx_bits) entries, and each
-             * entry is 8 bytes == 2^3.
-             */
-            tableszbits = id_bits - l2_idx_bits + 3;
-        } else {
-            /* table has 2^id_bits entries of 2^istbits size each */
-            tableszbits = id_bits + istbits;
-        }
-        cfg->base &= ~MAKE_64BIT_MASK(0, tableszbits);
+        id_bits = MIN(MAX(id_bits, QEMU_GICV5_MIN_LPI_ID_BITS), QEMU_GICV5_ID_BITS);
+
+        initialize_ist_config(cs, domain, cfg, base, id_bits,
+                              istsz, l2sz, structure);
 
-        if (!cfg->lpi_cache) {
-            /*
-             * Keys are GINT_TO_POINTER(intid), so we want the g_direct_hash
-             * and g_direct_equal hash and equality functions. We don't
-             * want to free the keys, but we do want to free the values
-             * (which are pointer-to-uint32_t).
-             */
-            cfg->lpi_cache = g_hash_table_new_full(NULL, NULL, NULL, g_free);
-        }
-        cfg->valid = true;
         trace_gicv5_ist_valid(domain_name[domain], cfg->base, cfg->id_bits,
                               cfg->l2_idx_bits, cfg->istsz, cfg->structure);
         irs_recalc_hppi_all_cpus(s, domain);
-- 
2.43.0


