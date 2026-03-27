Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC95010ED65C
	for <qemu-arm@archiver.kernel.org>; Fri, 27 Mar 2026 11:24:33 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w65Bv-0006cV-Pu; Fri, 27 Mar 2026 07:17:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1w65Br-0006We-LA
 for qemu-arm@nongnu.org; Fri, 27 Mar 2026 07:17:23 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1w65Bo-0007ur-Kt
 for qemu-arm@nongnu.org; Fri, 27 Mar 2026 07:17:23 -0400
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-43b5bded412so1432317f8f.0
 for <qemu-arm@nongnu.org>; Fri, 27 Mar 2026 04:17:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1774610239; x=1775215039; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7oCFUH8gap/6SDnvGDvqqyJf9FNOwDhKGaU4TmrDjPQ=;
 b=fp0cSAXYnzJHQbk5SO1URItFA+ZFYM+1Fv4vITzXvXRR+F4ORpRgpJuA3gHtlK3Bk9
 9eNeJexlWoNzLD2JXGJSF45BpvSq3rVy5WqBzEx5ounVICn61OoEGW7PwDDiWaB2WRmv
 pH04lGal4NZvI/Q4mOAeDj2yp9pS5Xuuk/SBvkpoLPX9nlOlba/zQDHYjCO36J8RbyAB
 8mtkmVQwnOJQ5MIzjhMHuIOtlYO+64gemMJap0lkvynbWpb3Yhao6F8pM7KhesSJuYab
 S2Vb1nrpzEcJXZGcOsA+85XHFa7YrNijS+4fW4oVxFNV9WszOKY2CfqbqyLsRNGiiJPG
 isZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774610239; x=1775215039;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=7oCFUH8gap/6SDnvGDvqqyJf9FNOwDhKGaU4TmrDjPQ=;
 b=AL7xrpsK4BMsuegUnOkFwvHb34OCX8e/rHbKNdjPLiE1A7wS60q/9fqxj7SwyPm6Y/
 EKBSo3imUpsti+da8s7WJLknCnbeEPcIt2ULhBrLts0vR0/EpEx8jOpPwSdzzeUc25q6
 idXao6eqbVEl4huEjk7SYBJZ/ThD4X0kcn2W+pPMIDL0YdmJ/z6f+qzgengfepXvFtpe
 HjNytFtzxY7XY/1j9yetQ3Lv2cy01wX9FTIuQ1bZdOs562/PcK2FBj21gz4Wq+t35k0N
 tjn3jdO10V1tMdPoWex//jdDqeOjiLGx3Wp7YwMJEUPNSNAg6P1DyHq+lfTJUl+Kt03D
 Ooxg==
X-Gm-Message-State: AOJu0Yw6s+xlVm7BmoqqHxpNqi+15bvPW3eIW8s53pi9XKh6sBgRm8LQ
 9HFzKFZLre25D7G05U5VySWuaJa0Qpep/+9E6WRVL9ziPSBz+LIL3WzbDFwUDsMQDruLWJwGw8V
 9aCj5PSM=
X-Gm-Gg: ATEYQzwmOyM+E0qgaoOC2wRePNh6A6rauAJVMRkukFUhE2r+YTDgVmmqi8CkULN6ue8
 QkH2WRHBNthr7rHZ28ZWgdSTs8XKQKIB5bRzY1fGCjFhD8GsqogeuNDFmdKei9KrirUGjoLwQJA
 lloIqOmVNrKYml3HcpvBY4Q7fA8oq2Yt/jkgXLWk2tTsaC8gmrR6XSRx/clcr5yMt90AEPMt59n
 pXjRS8EKqURIeige61reVQo1gER3JeE+CD3UxFewZLm8maTF9vHeYYByFSbZjXEuJGRbwfNxEnT
 LXHDM7OFGW3Nk8x0Y8GwiL9FOynKlWS/T1YdlzqnLANSeU/Gao+TMPvlIQZ9ZXgZIdrkgDeVSm9
 FSUFGrSEemVdZDFRdXm4w3Awur05/+M/D+ieH/4Aq68YGhTQ6SsremENzBGJ1fk41RR+r0ZCBWi
 QUF9oni6MYG4vTw3/16bImS+bpehl3v2IDgQiKQOijlPL6sXfhlD3oWmd1/mRhoWFynAJU70Dge
 REO1WeK51cZVbrT6KcbrkicvQvzfbA=
X-Received: by 2002:a05:6000:400e:b0:439:b7a2:60ff with SMTP id
 ffacd0b85a97d-43b9ea4a495mr3120574f8f.32.1774610238909; 
 Fri, 27 Mar 2026 04:17:18 -0700 (PDT)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43b919cf2b2sm15484227f8f.18.2026.03.27.04.17.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Mar 2026 04:17:18 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Jonathan Cameron <jonathan.cameron@huawei.com>
Subject: [PATCH v2 18/65] hw/intc/arm_gicv5: Implement gicv5_set_priority()
Date: Fri, 27 Mar 2026 11:16:13 +0000
Message-ID: <20260327111700.795099-19-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260327111700.795099-1-peter.maydell@linaro.org>
References: <20260327111700.795099-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x434.google.com
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

Implement the gicv5_set_priority() function, which is our equivalent
of the Stream Protocol SetPriority command.  This acts by looking the
interrupt ID up in the Interrupt State Table and storing the new
priority value into the table entry.

The memory transaction has to have the right transaction attributes
for the domain it is for; we precalculate these and keep them in the
GICv5ISTConfig.

The GIC has an optional software-error reporting mechanism via the
IRS_SWERR_* registers; this does not report all failure cases, only
those that would be annoying to detect and debug in some other way.
We choose not to implement this, but include some comments for
reportable error cases for future reference.  Our LOG_GUEST_ERROR
logging is a superset of this.

At this point we implement only handling of SetPriority for LPIs; we
will add SPI handling in a later commit.  Virtual interrupts aren't
supported by this initial EL1-only GICv5 implementation.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
---
 hw/intc/arm_gicv5.c                | 233 +++++++++++++++++++++++++++++
 hw/intc/trace-events               |   1 +
 include/hw/intc/arm_gicv5.h        |   1 +
 include/hw/intc/arm_gicv5_stream.h |  29 ++++
 include/hw/intc/arm_gicv5_types.h  |  10 ++
 5 files changed, 274 insertions(+)

diff --git a/hw/intc/arm_gicv5.c b/hw/intc/arm_gicv5.c
index 172c5be0d4..3588f3323f 100644
--- a/hw/intc/arm_gicv5.c
+++ b/hw/intc/arm_gicv5.c
@@ -9,6 +9,7 @@
 #include "qemu/osdep.h"
 #include "hw/core/registerfields.h"
 #include "hw/intc/arm_gicv5.h"
+#include "hw/intc/arm_gicv5_stream.h"
 #include "qapi/error.h"
 #include "qemu/log.h"
 #include "trace.h"
@@ -23,6 +24,25 @@ static const char *domain_name[] = {
     [GICV5_ID_REALM] = "Realm",
 };
 
+static const char *inttype_name(GICv5IntType t)
+{
+    /*
+     * We have to be more cautious with getting human readable names
+     * for a GICv5IntType for trace strings than we do with the domain
+     * enum, because here the value can come from a guest register
+     * field.
+     */
+    static const char *names[] = {
+        [GICV5_PPI] = "PPI",
+        [GICV5_LPI] = "LPI",
+        [GICV5_SPI] = "SPI",
+    };
+    if (t >= ARRAY_SIZE(names) || !names[t]) {
+        return "RESERVED";
+    }
+    return names[t];
+}
+
 REG32(IRS_IDR0, 0x0)
     FIELD(IRS_IDR0, INT_DOM, 0, 2)
     FIELD(IRS_IDR0, PA_RANGE, 2, 4)
@@ -265,6 +285,218 @@ REG64(IRS_SWERR_SYNDROMER0, 0x3c8)
 REG64(IRS_SWERR_SYNDROMER1, 0x3d0)
     FIELD(IRS_SWERR_SYNDROMER2, ADDR, 3, 53)
 
+FIELD(L1_ISTE, VALID, 0, 1)
+FIELD(L1_ISTE, L2_ADDR, 12, 44)
+
+FIELD(L2_ISTE, PENDING, 0, 1)
+FIELD(L2_ISTE, ACTIVE, 1, 1)
+FIELD(L2_ISTE, HM, 2, 1)
+FIELD(L2_ISTE, ENABLE, 3, 1)
+FIELD(L2_ISTE, IRM, 4, 1)
+FIELD(L2_ISTE, HWU, 9, 2)
+FIELD(L2_ISTE, PRIORITY, 11, 5)
+FIELD(L2_ISTE, IAFFID, 16, 16)
+
+static MemTxAttrs irs_txattrs(GICv5Common *cs, GICv5Domain domain)
+{
+    /*
+     * Return a MemTxAttrs to use for IRS memory accesses.  IRS_CR1
+     * has the usual Arm cacheability/shareability attributes, but
+     * QEMU doesn't care about those. All we need to specify here is
+     * the correct security attributes, which depend on the interrupt
+     * domain. Conveniently, our GICv5Domain encoding matches the
+     * ARMSecuritySpace one (because both follow an architecturally
+     * specified field). The exception is that the EL3 domain must be
+     * Secure instead of Root if we don't implement Realm.
+     */
+    if (domain == GICV5_ID_EL3 &&
+        !gicv5_domain_implemented(cs, GICV5_ID_REALM)) {
+        domain = GICV5_ID_S;
+    }
+    return (MemTxAttrs) {
+        .space = domain,
+        .secure = domain == GICV5_ID_S || domain == GICV5_ID_EL3,
+    };
+}
+
+static hwaddr l1_iste_addr(GICv5Common *cs, const GICv5ISTConfig *cfg,
+                           uint32_t id)
+{
+    /*
+     * In a 2-level IST configuration, return the address of the L1
+     * IST entry for this interrupt ID.  The bottom l2_idx_bits of the
+     * ID value are the index into the L2 table, and the higher bits
+     * of the ID index the L1 table.
+     */
+    uint32_t l1_index = id >> cfg->l2_idx_bits;
+    return cfg->base + (l1_index * 8);
+}
+
+static bool get_l2_iste_addr(GICv5Common *cs, const GICv5ISTConfig *cfg,
+                             uint32_t id, hwaddr *l2_iste_addr)
+{
+    /*
+     * Get the address of the L2 interrupt state table entry for this
+     * interrupt. On success, fill in l2_iste_addr and return true.
+     * On failure, return false.
+     */
+    hwaddr l2_base;
+
+    if (!cfg->valid) {
+        return false;
+    }
+
+    if (id >= (1 << cfg->id_bits)) {
+        return false;
+    }
+
+    if (cfg->structure) {
+        /*
+         * 2-level table: read the L1 IST. The bottom l2_idx_bits of
+         * the ID value are the index into the L2 table, and the
+         * higher bits of the ID index the L1 table. There is always
+         * at least one L1 table entry.
+         */
+        hwaddr l1_addr = l1_iste_addr(cs, cfg, id);
+        uint64_t l1_iste;
+        MemTxResult res;
+
+        l1_iste = address_space_ldq_le(&cs->dma_as, l1_addr,
+                                       cfg->txattrs, &res);
+        if (res != MEMTX_OK) {
+            /* Reportable with EC=0x01 if sw error reporting implemented */
+            qemu_log_mask(LOG_GUEST_ERROR, "L1 ISTE lookup failed for ID 0x%x"
+                          " at physical address 0x" HWADDR_FMT_plx "\n",
+                          id, l1_addr);
+            return false;
+        }
+        if (!FIELD_EX64(l1_iste, L1_ISTE, VALID)) {
+            return false;
+        }
+        l2_base = l1_iste & R_L1_ISTE_L2_ADDR_MASK;
+        id = extract32(id, 0, cfg->l2_idx_bits);
+    } else {
+        /* 1-level table */
+        l2_base = cfg->base;
+    }
+
+    *l2_iste_addr = l2_base + (id * cfg->istsz);
+    return true;
+}
+
+static bool read_l2_iste_mem(GICv5Common *cs, const GICv5ISTConfig *cfg,
+                             hwaddr addr, uint32_t *l2_iste)
+{
+    MemTxResult res;
+
+    *l2_iste = address_space_ldl_le(&cs->dma_as, addr, cfg->txattrs, &res);
+    if (res != MEMTX_OK) {
+        /* Reportable with EC=0x02 if sw error reporting implemented */
+        qemu_log_mask(LOG_GUEST_ERROR, "L2 ISTE read failed at physical "
+                      "address 0x" HWADDR_FMT_plx "\n", addr);
+    }
+    return res == MEMTX_OK;
+}
+
+static bool write_l2_iste_mem(GICv5Common *cs, const GICv5ISTConfig *cfg,
+                              hwaddr addr, uint32_t l2_iste)
+{
+    MemTxResult res;
+
+    address_space_stl_le(&cs->dma_as, addr, l2_iste, cfg->txattrs, &res);
+    if (res != MEMTX_OK) {
+        /* Reportable with EC=0x02 if sw error reporting implemented */
+        qemu_log_mask(LOG_GUEST_ERROR, "L2 ISTE write failed at physical "
+                      "address 0x" HWADDR_FMT_plx "\n", addr);
+    }
+    return res == MEMTX_OK;
+}
+
+/*
+ * This is returned by get_l2_iste() and has everything we need to do
+ * the writeback of the L2 ISTE word in put_l2_iste().  Currently the
+ * get/put functions always directly do guest memory reads and writes
+ * to update the L2 ISTE. In a future commit we will add support for a
+ * cache of some of the ISTE data in a local hashtable; the APIs are
+ * designed with that in mind.
+ */
+typedef struct L2_ISTE_Handle {
+    hwaddr l2_iste_addr;
+    uint32_t l2_iste;
+} L2_ISTE_Handle;
+
+static uint32_t *get_l2_iste(GICv5Common *cs, const GICv5ISTConfig *cfg,
+                             uint32_t id, L2_ISTE_Handle *h)
+{
+    /*
+     * Find the L2 ISTE for the interrupt @id.
+     *
+     * We return a pointer to the ISTE: the caller can freely read and
+     * modify the uint64_t pointed to to update the ISTE.  If the
+     * caller modifies the L2 ISTE word, it must call put_l2_iste(),
+     * passing it @h, to write back the ISTE.  If the caller is only
+     * reading the L2 ISTE, it does not need to call put_l2_iste().
+     *
+     * We fill in @h with information needed for put_l2_iste().
+     *
+     * If the ISTE could not be read (typically because of a memory
+     * error), return NULL.
+     */
+    if (!get_l2_iste_addr(cs, cfg, id, &h->l2_iste_addr) ||
+        !read_l2_iste_mem(cs, cfg, h->l2_iste_addr, &h->l2_iste)) {
+        return NULL;
+    }
+    return &h->l2_iste;
+}
+
+static void put_l2_iste(GICv5Common *cs, const GICv5ISTConfig *cfg,
+                        L2_ISTE_Handle *h)
+{
+    /*
+     * Write back the modified L2_ISTE word found with get_l2_iste().
+     * Once this has been called the L2_ISTE_Handle @h and the pointer
+     * to the L2 ISTE word are no longer valid.
+     */
+    write_l2_iste_mem(cs, cfg, h->l2_iste_addr, h->l2_iste);
+}
+
+void gicv5_set_priority(GICv5Common *cs, uint32_t id, uint8_t priority,
+                        GICv5Domain domain, GICv5IntType type, bool virtual)
+{
+    GICv5 *s = ARM_GICV5(cs);
+
+    trace_gicv5_set_priority(domain_name[domain], inttype_name(type), virtual,
+                             id, priority);
+    /* We must ignore unimplemented low-order priority bits */
+    priority &= MAKE_64BIT_MASK(5 - QEMU_GICV5_PRI_BITS, QEMU_GICV5_PRI_BITS);
+
+    if (virtual) {
+        qemu_log_mask(LOG_GUEST_ERROR, "gicv5_set_priority: tried to set "
+                      "priority of a virtual interrupt\n");
+        return;
+    }
+
+    switch (type) {
+    case GICV5_LPI:
+    {
+        const GICv5ISTConfig *cfg = &s->phys_lpi_config[domain];
+        L2_ISTE_Handle h;
+        uint32_t *l2_iste_p = get_l2_iste(cs, cfg, id, &h);
+
+        if (!l2_iste_p) {
+            return;
+        }
+        *l2_iste_p = FIELD_DP32(*l2_iste_p, L2_ISTE, PRIORITY, priority);
+        put_l2_iste(cs, cfg, &h);
+        break;
+    }
+    default:
+        qemu_log_mask(LOG_GUEST_ERROR, "gicv5_set_priority: tried to set "
+                      "priority of bad interrupt type %d\n", type);
+        return;
+    }
+}
+
 static void irs_ist_baser_write(GICv5 *s, GICv5Domain domain, uint64_t value)
 {
     GICv5Common *cs = ARM_GICV5_COMMON(s);
@@ -331,6 +563,7 @@ static void irs_ist_baser_write(GICv5 *s, GICv5Domain domain, uint64_t value)
          */
         l2_idx_bits = l2bits - istbits;
         cfg->base = cs->irs_ist_baser[domain] & R_IRS_IST_BASER_ADDR_MASK;
+        cfg->txattrs = irs_txattrs(cs, domain),
         cfg->id_bits = id_bits;
         cfg->istsz = 1 << istbits;
         cfg->l2_idx_bits = l2_idx_bits;
diff --git a/hw/intc/trace-events b/hw/intc/trace-events
index 80fc47794b..42f5e73d54 100644
--- a/hw/intc/trace-events
+++ b/hw/intc/trace-events
@@ -235,6 +235,7 @@ gicv5_badwrite(const char *domain, uint64_t offset, uint64_t data, unsigned size
 gicv5_spi(uint32_t id, int level) "GICv5 SPI ID %u asserted at level %d"
 gicv5_ist_valid(const char *domain, uint64_t base, uint8_t id_bits, uint8_t l2_idx_bits, uint8_t istsz, bool structure) "GICv5 IRS %s IST now valid: base 0x%" PRIx64 " id_bits %u l2_idx_bits %u IST entry size %u 2-level %d"
 gicv5_ist_invalid(const char *domain) "GICv5 IRS %s IST no longer valid"
+gicv5_set_priority(const char *domain, const char *type, bool virtual, uint32_t id, uint8_t priority) "GICv5 IRS SetPriority %s %s virtual:%d ID %u prio %u"
 
 # arm_gicv5_common.c
 gicv5_common_realize(uint32_t irsid, uint32_t num_cpus, uint32_t spi_base, uint32_t spi_irs_range, uint32_t spi_range) "GICv5 IRS realized: IRS ID %u, %u CPUs, SPI base %u, SPI IRS range %u, SPI range %u"
diff --git a/include/hw/intc/arm_gicv5.h b/include/hw/intc/arm_gicv5.h
index f6ecd9c323..c631ecc3e8 100644
--- a/include/hw/intc/arm_gicv5.h
+++ b/include/hw/intc/arm_gicv5.h
@@ -19,6 +19,7 @@ OBJECT_DECLARE_TYPE(GICv5, GICv5Class, ARM_GICV5)
 
 typedef struct GICv5ISTConfig {
     hwaddr base; /* Base address */
+    MemTxAttrs txattrs; /* TX attrs to use for this table */
     uint8_t id_bits; /* number of bits in an ID for this table */
     uint8_t l2_idx_bits; /* number of ID bits that index into L2 table */
     uint8_t istsz; /* L2 ISTE size in bytes */
diff --git a/include/hw/intc/arm_gicv5_stream.h b/include/hw/intc/arm_gicv5_stream.h
index 7257ddde90..e1649cbb40 100644
--- a/include/hw/intc/arm_gicv5_stream.h
+++ b/include/hw/intc/arm_gicv5_stream.h
@@ -12,6 +12,7 @@
 #define HW_INTC_ARM_GICV5_STREAM_H
 
 #include "target/arm/cpu-qom.h"
+#include "hw/intc/arm_gicv5_types.h"
 
 typedef struct GICv5Common GICv5Common;
 
@@ -29,4 +30,32 @@ typedef struct GICv5Common GICv5Common;
  */
 bool gicv5_set_gicv5state(ARMCPU *cpu, GICv5Common *cs);
 
+/*
+ * The architected Stream Protocol is asynchronous; commands can be
+ * initiated both from the IRS and from the CPU interface, and some
+ * require acknowledgement. For QEMU, we simplify this because we know
+ * that in the CPU interface code we hold the BQL and so our IRS model
+ * is not going to be busy; when we send commands from the CPUIF
+ * ("upstream commands") we can model this as a synchronous function
+ * call whose return corresponds to the acknowledgement of a completed
+ * command.
+ */
+
+/**
+ * gicv5_set_priority
+ * @cs: GIC IRS to send command to
+ * @id: interrupt ID
+ * @priority: priority to set
+ * @domain: interrupt Domain to act on
+ * @type: interrupt type (LPI or SPI)
+ * @virtual: true if this is a virtual interrupt
+ *
+ * Set priority of an interrupt; matches stream interface SetPriority
+ * command from CPUIF to IRS. There is no report back of
+ * success/failure to the CPUIF in the protocol.
+ */
+void gicv5_set_priority(GICv5Common *cs, uint32_t id,
+                        uint8_t priority, GICv5Domain domain,
+                        GICv5IntType type, bool virtual);
+
 #endif
diff --git a/include/hw/intc/arm_gicv5_types.h b/include/hw/intc/arm_gicv5_types.h
index 7d23752ece..e2b937fe62 100644
--- a/include/hw/intc/arm_gicv5_types.h
+++ b/include/hw/intc/arm_gicv5_types.h
@@ -45,4 +45,14 @@ typedef enum GICv5Domain {
 #define GICV5_PPI_CNTP 30
 #define GICV5_PPI_TRBIRQ 31
 
+/*
+ * Type of the interrupt; these values match the 3-bit format
+ * specified in the GICv5 spec R_GYVWB.
+ */
+typedef enum GICv5IntType {
+    GICV5_PPI = 1,
+    GICV5_LPI = 2,
+    GICV5_SPI = 3,
+} GICv5IntType;
+
 #endif
-- 
2.43.0


