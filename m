Received: by 2002:a19:4310:0:0:0:0:0 with SMTP id q16csp520210lfa;
        Wed, 2 Jun 2021 11:05:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzz3LnCm4Y1/A6IYWp4GOtU8ePWTJe7oL+qAfY8ODtKYlRJi+hnpzUN+waJj8XGy0fcmBr3
X-Received: by 2002:a17:906:4882:: with SMTP id v2mr33686288ejq.134.1622657118528;
        Wed, 02 Jun 2021 11:05:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1622657118; cv=none;
        d=google.com; s=arc-20160816;
        b=iGbeuPdKEELeAldNOIi6L9wVN5QzKZYqUZ4RdfjCO/zPJyr8fElwTIV0D3V1wHvm6K
         B4NXbud1dE1EHSA0+wwi7LKuYJqMnRxRBCKb/m1Oe+QtghCkOdwE7FexRJsGUH1V+r3B
         WvpkBU6b/HQ/9s6TitZI/YUaawueAfIdQReY5YfRugIgXmndXi/fRF3mjuo9dY9mGx8Y
         VSl2vUnGWI+4mD4u353Gu0qivlIrbfCrucALEp0yh2ffzy4CZeWWYYXZbfl4DSUL5/Zx
         h5qRkafiJK1fngreJf53koQLZQjXfGsl7QBhEydPkkHwjVTzk3H8slXgAakMeEWzc1em
         r8GA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=vR91bQg6bsOS7D7nYFe5jBbd7zoseWX0x9akFSNuU/w=;
        b=HNP/DdIQ4Oss6AbYpiVSeO/WNDViZKEKg7qaFdysKUpusgcSAy1rRD3tgZr3630lmT
         w42pPoNUxhDGz45SLxgYysr6wClStuWhJYIQxi6QsjWr8zUCjOUPshKaxYIhb9z05BXl
         0gGbmW2WGdO6rGbOO6ZZzXAlahnlZ0QhMpr33lIYMz6XQAyU8skYIYX88B5sql1wsQWL
         i0xqab3rpJjj9x/9E9+HHHoS/QkEEPMsQiTPcS8i7NpnGi/XnKeFpNa90Uqqs5y0+Jct
         3SbkhPTafl1DCWNbz2QjUKjGfQVQP+AbJKBiqlsi4HAhAEI8/87hKCY+MkkEN+Cfi4pE
         8s+A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rUUhxqOz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s10si430854ejm.526.2021.06.02.11.05.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 02 Jun 2021 11:05:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rUUhxqOz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53906 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1loVEz-0000QH-EE
	for alex.bennee@linaro.org; Wed, 02 Jun 2021 14:05:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51156)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1loVAl-0008Ft-RO
 for qemu-arm@nongnu.org; Wed, 02 Jun 2021 14:00:55 -0400
Received: from mail-qt1-x82c.google.com ([2607:f8b0:4864:20::82c]:33537)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1loVAg-0006b5-L4
 for qemu-arm@nongnu.org; Wed, 02 Jun 2021 14:00:55 -0400
Received: by mail-qt1-x82c.google.com with SMTP id a15so2520044qta.0
 for <qemu-arm@nongnu.org>; Wed, 02 Jun 2021 11:00:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vR91bQg6bsOS7D7nYFe5jBbd7zoseWX0x9akFSNuU/w=;
 b=rUUhxqOzNEmV+LtKUII5mTDg5tIbVWNjh0rgdGQMc8cl0Xt3Uk1R6qut/nJGj3uTfl
 MmyC5gYkuO3/l/lbaDPtaY+4NJO7fFg3dODa2iiwgQTY+0p8fVx7yWo8FXLRzoYmMCCH
 4uwqP8ONE1sXNEmP3p+qIvpVzFqLQAhqu1nJNlZiujyzWgJtkqSTTNYYlWZJoGSG11Pl
 +nR0kyftx6X+Gx8EuFkZOALLvBV/tycdZ8iKgoCOqm92m/ZUR9YBpTjWDCjOcy6hBDXq
 eGt0cSEKCefz5lKpE1WK4CerowOb55FONCT2sB0I6LI2LEn4Bndt7Rx2XgcIel9OLomA
 wV2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vR91bQg6bsOS7D7nYFe5jBbd7zoseWX0x9akFSNuU/w=;
 b=QDLZNMWjYT2BQ47zzjcH6y/vR8/BYtDF10C60c8V+MPTRfH3NDtmwJFvosjJlcJNs+
 Q6iGmcCVkCEYnPl56eYmJpeDKXbUYbp8ApnS0QLEOP88eBy5Ya3cKj548uKdNnU/4xvj
 1wJGxm9xzY3QN6mYOkkEFRwVthItwK1TEJun5HBeWXiplbfroIJtqNNMmA9+fW0toenj
 UQqwTHSLfMKicKLKUzCiTTBCg+uKp0GofGSds6d1MfxvzZ8WQ3vgpN5vence7FLAN9tN
 BikPz4lq79Wnuhq6S6DiMTLhmV8doqrjKu+OkqLAIpUhaHBdRQDiXFu4YPTsYZAY336q
 JoqQ==
X-Gm-Message-State: AOAM531N3xi4iPUx+K/Sj5I4ANGRDbOV0SstWKcmwjLUlktLUiXAqEp0
 +nAoFzxYwrYKG0y7qZpB2NOY4Q==
X-Received: by 2002:ac8:6b93:: with SMTP id z19mr25435128qts.61.1622656847584; 
 Wed, 02 Jun 2021 11:00:47 -0700 (PDT)
Received: from localhost.localdomain
 (bras-base-stsvon1503w-grc-21-142-114-142-78.dsl.bell.ca. [142.114.142.78])
 by smtp.googlemail.com with ESMTPSA id 97sm273044qte.20.2021.06.02.11.00.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Jun 2021 11:00:47 -0700 (PDT)
From: Shashi Mallela <shashi.mallela@linaro.org>
To: peter.maydell@linaro.org,
	leif@nuviainc.com,
	rad@semihalf.com
Subject: [PATCH v4 4/8] hw/intc: GICv3 ITS Command processing
Date: Wed,  2 Jun 2021 14:00:38 -0400
Message-Id: <20210602180042.111347-5-shashi.mallela@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210602180042.111347-1-shashi.mallela@linaro.org>
References: <20210602180042.111347-1-shashi.mallela@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82c;
 envelope-from=shashi.mallela@linaro.org; helo=mail-qt1-x82c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: OijFw7ZrMtGK

Added ITS command queue handling for MAPTI,MAPI commands,handled ITS
translation which triggers an LPI via INT command as well as write
to GITS_TRANSLATER register,defined enum to differentiate between ITS
command interrupt trigger and GITS_TRANSLATER based interrupt trigger.
Each of these commands make use of other functionalities implemented to
get device table entry,collection table entry or interrupt translation
table entry required for their processing.

Signed-off-by: Shashi Mallela <shashi.mallela@linaro.org>
---
 hw/intc/arm_gicv3_its.c            | 334 +++++++++++++++++++++++++++++
 hw/intc/gicv3_internal.h           |  12 ++
 include/hw/intc/arm_gicv3_common.h |   2 +
 3 files changed, 348 insertions(+)

diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
index 6551c577b3..82bb5b84ef 100644
--- a/hw/intc/arm_gicv3_its.c
+++ b/hw/intc/arm_gicv3_its.c
@@ -28,6 +28,13 @@ struct GICv3ITSClass {
     void (*parent_reset)(DeviceState *dev);
 };
 
+typedef enum ItsCmdType {
+    NONE = 0, /* internal indication for GITS_TRANSLATER write */
+    CLEAR = 1,
+    DISCARD = 2,
+    INT = 3,
+} ItsCmdType;
+
 static uint64_t baser_base_addr(uint64_t value, uint32_t page_sz)
 {
     uint64_t result = 0;
@@ -49,6 +56,315 @@ static uint64_t baser_base_addr(uint64_t value, uint32_t page_sz)
     return result;
 }
 
+static bool get_cte(GICv3ITSState *s, uint16_t icid, uint64_t *cte,
+                    MemTxResult *res)
+{
+    AddressSpace *as = &s->gicv3->dma_as;
+    uint64_t l2t_addr;
+    uint64_t value;
+    bool valid_l2t;
+    uint32_t l2t_id;
+    uint32_t max_l2_entries;
+    bool status = false;
+
+    if (s->ct.indirect) {
+        l2t_id = icid / (s->ct.page_sz / L1TABLE_ENTRY_SIZE);
+
+        value = address_space_ldq_le(as,
+                                     s->ct.base_addr +
+                                     (l2t_id * L1TABLE_ENTRY_SIZE),
+                                     MEMTXATTRS_UNSPECIFIED, res);
+
+        if (*res == MEMTX_OK) {
+            valid_l2t = (value >> VALID_SHIFT) & VALID_MASK;
+
+            if (valid_l2t) {
+                max_l2_entries = s->ct.page_sz / s->ct.entry_sz;
+
+                l2t_addr = value & ((1ULL << 51) - 1);
+
+                *cte =  address_space_ldq_le(as, l2t_addr +
+                                    ((icid % max_l2_entries) * GITS_CTE_SIZE),
+                                    MEMTXATTRS_UNSPECIFIED, res);
+           }
+       }
+    } else {
+        /* Flat level table */
+        *cte =  address_space_ldq_le(as, s->ct.base_addr +
+                                     (icid * GITS_CTE_SIZE),
+                                      MEMTXATTRS_UNSPECIFIED, res);
+    }
+
+    if (*cte & VALID_MASK) {
+        status = true;
+    }
+
+    return status;
+}
+
+static MemTxResult update_ite(GICv3ITSState *s, uint32_t eventid, uint64_t dte,
+                              uint64_t itel, uint32_t iteh)
+{
+    AddressSpace *as = &s->gicv3->dma_as;
+    uint64_t itt_addr;
+    MemTxResult res = MEMTX_OK;
+
+    itt_addr = (dte >> 6ULL) & ITTADDR_MASK;
+    itt_addr <<= ITTADDR_SHIFT; /* 256 byte aligned */
+
+    address_space_stq_le(as, itt_addr + (eventid * sizeof(uint64_t)),
+                         itel, MEMTXATTRS_UNSPECIFIED, &res);
+
+    if (res == MEMTX_OK) {
+        address_space_stl_le(as, itt_addr + ((eventid + sizeof(uint64_t)) *
+                             sizeof(uint32_t)), iteh, MEMTXATTRS_UNSPECIFIED,
+                             &res);
+    }
+   return res;
+}
+
+static bool get_ite(GICv3ITSState *s, uint32_t eventid, uint64_t dte,
+                    uint16_t *icid, uint32_t *pIntid, MemTxResult *res)
+{
+    AddressSpace *as = &s->gicv3->dma_as;
+    uint64_t itt_addr;
+    bool status = false;
+    uint64_t itel = 0;
+    uint32_t iteh = 0;
+
+    itt_addr = (dte >> 6ULL) & ITTADDR_MASK;
+    itt_addr <<= ITTADDR_SHIFT; /* 256 byte aligned */
+
+    itel = address_space_ldq_le(as, itt_addr + (eventid * sizeof(uint64_t)),
+                                MEMTXATTRS_UNSPECIFIED, res);
+
+    if (*res == MEMTX_OK) {
+        iteh = address_space_ldl_le(as, itt_addr + ((eventid +
+                                    sizeof(uint64_t)) * sizeof(uint32_t)),
+                                    MEMTXATTRS_UNSPECIFIED, res);
+
+        if (*res == MEMTX_OK) {
+            if (itel & VALID_MASK) {
+                if ((itel >> ITE_ENTRY_INTTYPE_SHIFT) & GITS_TYPE_PHYSICAL) {
+                    *pIntid = (itel >> ITE_ENTRY_INTID_SHIFT) &
+                               ITE_ENTRY_INTID_MASK;
+                    *icid = iteh & ITE_ENTRY_ICID_MASK;
+                    status = true;
+                }
+            }
+        }
+    }
+    return status;
+}
+
+static uint64_t get_dte(GICv3ITSState *s, uint32_t devid, MemTxResult *res)
+{
+    AddressSpace *as = &s->gicv3->dma_as;
+    uint64_t l2t_addr;
+    uint64_t value;
+    bool valid_l2t;
+    uint32_t l2t_id;
+    uint32_t max_l2_entries;
+
+    if (s->dt.indirect) {
+        l2t_id = devid / (s->dt.page_sz / L1TABLE_ENTRY_SIZE);
+
+        value = address_space_ldq_le(as,
+                                     s->dt.base_addr +
+                                     (l2t_id * L1TABLE_ENTRY_SIZE),
+                                     MEMTXATTRS_UNSPECIFIED, res);
+
+        if (*res == MEMTX_OK) {
+            valid_l2t = (value >> VALID_SHIFT) & VALID_MASK;
+
+            if (valid_l2t) {
+                max_l2_entries = s->dt.page_sz / s->dt.entry_sz;
+
+                l2t_addr = value & ((1ULL << 51) - 1);
+
+                value =  address_space_ldq_le(as, l2t_addr +
+                                   ((devid % max_l2_entries) * GITS_DTE_SIZE),
+                                   MEMTXATTRS_UNSPECIFIED, res);
+            }
+        }
+    } else {
+        /* Flat level table */
+        value = address_space_ldq_le(as, s->dt.base_addr +
+                                     (devid * GITS_DTE_SIZE),
+                                     MEMTXATTRS_UNSPECIFIED, res);
+    }
+
+    return value;
+}
+
+static MemTxResult process_int(GICv3ITSState *s, uint64_t value,
+                               uint32_t offset, ItsCmdType cmd)
+{
+    AddressSpace *as = &s->gicv3->dma_as;
+    uint32_t devid, eventid;
+    MemTxResult res = MEMTX_OK;
+    bool dte_valid;
+    uint64_t dte = 0;
+    uint32_t max_eventid;
+    uint16_t icid = 0;
+    uint32_t pIntid = 0;
+    bool ite_valid = false;
+    uint64_t cte = 0;
+    bool cte_valid = false;
+    uint64_t itel = 0;
+    uint32_t iteh = 0;
+
+    if (cmd == NONE) {
+        devid = offset;
+    } else {
+        devid = (value >> DEVID_SHIFT) & DEVID_MASK;
+
+        offset += NUM_BYTES_IN_DW;
+        value = address_space_ldq_le(as, s->cq.base_addr + offset,
+                                     MEMTXATTRS_UNSPECIFIED, &res);
+    }
+
+    if (res != MEMTX_OK) {
+        return res;
+    }
+
+    eventid = (value & EVENTID_MASK);
+
+    dte = get_dte(s, devid, &res);
+
+    if (res != MEMTX_OK) {
+        return res;
+    }
+    dte_valid = dte & VALID_MASK;
+
+    if (dte_valid) {
+        max_eventid = (1UL << (((dte >> 1U) & SIZE_MASK) + 1));
+
+        ite_valid = get_ite(s, eventid, dte, &icid, &pIntid, &res);
+
+        if (res != MEMTX_OK) {
+            return res;
+        }
+
+        if (ite_valid) {
+            cte_valid = get_cte(s, icid, &cte, &res);
+        }
+
+        if (res != MEMTX_OK) {
+            return res;
+        }
+    }
+
+    if ((devid > s->dt.max_devids) || !dte_valid || !ite_valid ||
+            !cte_valid || (eventid > max_eventid)) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: invalid interrupt translation table attributes "
+                      "devid %d or eventid %d\n",
+                      __func__, devid, eventid);
+        /*
+         * in this implementation,in case of error
+         * we ignore this command and move onto the next
+         * command in the queue
+         */
+    } else {
+        /*
+         * Current implementation only supports rdbase == procnum
+         * Hence rdbase physical address is ignored
+         */
+        if (cmd == DISCARD) {
+            /* remove mapping from interrupt translation table */
+            res = update_ite(s, eventid, dte, itel, iteh);
+        }
+    }
+
+    return res;
+}
+
+static MemTxResult process_mapti(GICv3ITSState *s, uint64_t value,
+                                 uint32_t offset, bool ignore_pInt)
+{
+    AddressSpace *as = &s->gicv3->dma_as;
+    uint32_t devid, eventid;
+    uint32_t pIntid = 0;
+    uint32_t max_eventid, max_Intid;
+    bool dte_valid;
+    MemTxResult res = MEMTX_OK;
+    uint16_t icid = 0;
+    uint64_t dte = 0;
+    uint64_t itel = 0;
+    uint32_t iteh = 0;
+    uint32_t int_spurious = INTID_SPURIOUS;
+
+    devid = (value >> DEVID_SHIFT) & DEVID_MASK;
+    offset += NUM_BYTES_IN_DW;
+    value = address_space_ldq_le(as, s->cq.base_addr + offset,
+                                 MEMTXATTRS_UNSPECIFIED, &res);
+
+    if (res != MEMTX_OK) {
+        return res;
+    }
+
+    eventid = (value & EVENTID_MASK);
+
+    if (!ignore_pInt) {
+        pIntid = (value >> pINTID_OFFSET) & pINTID_MASK;
+    }
+
+    offset += NUM_BYTES_IN_DW;
+    value = address_space_ldq_le(as, s->cq.base_addr + offset,
+                                 MEMTXATTRS_UNSPECIFIED, &res);
+
+    if (res != MEMTX_OK) {
+        return res;
+    }
+
+    icid = value & ICID_MASK;
+
+    dte = get_dte(s, devid, &res);
+
+    if (res != MEMTX_OK) {
+        return res;
+    }
+    dte_valid = dte & VALID_MASK;
+
+    max_eventid = (1UL << (((dte >> 1U) & SIZE_MASK) + 1));
+
+    if (!ignore_pInt) {
+        max_Intid = (1UL << (FIELD_EX64(s->typer, GITS_TYPER, IDBITS) + 1));
+    }
+
+    if ((devid > s->dt.max_devids) || (icid > s->ct.max_collids) ||
+            !dte_valid || (eventid > max_eventid) ||
+            (!ignore_pInt && ((pIntid < GICV3_LPI_INTID_START) ||
+               (pIntid > max_Intid)))) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: invalid interrupt translation table attributes "
+                      "devid %d or icid %d or eventid %d or pIntid %d\n",
+                      __func__, devid, icid, eventid, pIntid);
+        /*
+         * in this implementation,in case of error
+         * we ignore this command and move onto the next
+         * command in the queue
+         */
+    } else {
+        /* add ite entry to interrupt translation table */
+        itel = (dte_valid & VALID_MASK) | (GITS_TYPE_PHYSICAL <<
+                                           ITE_ENTRY_INTTYPE_SHIFT);
+
+        if (ignore_pInt) {
+            itel |= (eventid << ITE_ENTRY_INTID_SHIFT);
+        } else {
+            itel |= (pIntid << ITE_ENTRY_INTID_SHIFT);
+        }
+        itel |= (int_spurious << ITE_ENTRY_INTSP_SHIFT);
+        iteh |= icid;
+
+        res = update_ite(s, eventid, dte, itel, iteh);
+    }
+
+    return res;
+}
+
 static MemTxResult update_cte(GICv3ITSState *s, uint16_t icid, bool valid,
                               uint64_t rdbase)
 {
@@ -295,8 +611,10 @@ static void process_cmdq(GICv3ITSState *s)
 
         switch (cmd) {
         case GITS_CMD_INT:
+            res = process_int(s, data, cq_offset, INT);
             break;
         case GITS_CMD_CLEAR:
+            res = process_int(s, data, cq_offset, CLEAR);
             break;
         case GITS_CMD_SYNC:
             /*
@@ -313,10 +631,13 @@ static void process_cmdq(GICv3ITSState *s)
             res = process_mapc(s, cq_offset);
             break;
         case GITS_CMD_MAPTI:
+            res = process_mapti(s, data, cq_offset, false);
             break;
         case GITS_CMD_MAPI:
+            res = process_mapti(s, data, cq_offset, true);
             break;
         case GITS_CMD_DISCARD:
+            res = process_int(s, data, cq_offset, DISCARD);
             break;
         default:
             break;
@@ -472,7 +793,20 @@ static MemTxResult gicv3_its_translation_write(void *opaque, hwaddr offset,
                                                uint64_t data, unsigned size,
                                                MemTxAttrs attrs)
 {
+    GICv3ITSState *s = (GICv3ITSState *)opaque;
     MemTxResult result = MEMTX_OK;
+    uint32_t devid = 0;
+
+    switch (offset) {
+    case GITS_TRANSLATER:
+        if (s->ctlr & ITS_CTLR_ENABLED) {
+            devid = attrs.requester_id;
+            result = process_int(s, data, devid, NONE);
+        }
+        break;
+    default:
+        break;
+    }
 
     return result;
 }
diff --git a/hw/intc/gicv3_internal.h b/hw/intc/gicv3_internal.h
index 0932a30560..ce45cd0ef6 100644
--- a/hw/intc/gicv3_internal.h
+++ b/hw/intc/gicv3_internal.h
@@ -324,6 +324,13 @@ FIELD(MAPC, RDBASE, 16, 32)
 #define ITTADDR_MASK              ((1ULL << ITTADDR_LENGTH) - 1)
 #define SIZE_MASK                 0x1f
 
+/* MAPI command fields */
+#define EVENTID_MASK              ((1ULL << 32) - 1)
+
+/* MAPTI command fields */
+#define pINTID_OFFSET              32
+#define pINTID_MASK               ((1ULL << 32) - 1)
+
 #define VALID_SHIFT               63
 #define VALID_MASK                1ULL
 
@@ -344,6 +351,11 @@ FIELD(MAPC, RDBASE, 16, 32)
  * vPEID = 16 bits
  */
 #define ITS_ITT_ENTRY_SIZE            0xC
+#define ITE_ENTRY_INTTYPE_SHIFT        1
+#define ITE_ENTRY_INTID_SHIFT          2
+#define ITE_ENTRY_INTID_MASK         ((1ULL << 24) - 1)
+#define ITE_ENTRY_INTSP_SHIFT          26
+#define ITE_ENTRY_ICID_MASK          ((1ULL << 16) - 1)
 
 /* 16 bits EventId */
 #define ITS_IDBITS                   GICD_TYPER_IDBITS
diff --git a/include/hw/intc/arm_gicv3_common.h b/include/hw/intc/arm_gicv3_common.h
index 1fd5cedbbd..0715b0bc2a 100644
--- a/include/hw/intc/arm_gicv3_common.h
+++ b/include/hw/intc/arm_gicv3_common.h
@@ -36,6 +36,8 @@
 #define GICV3_MAXIRQ 1020
 #define GICV3_MAXSPI (GICV3_MAXIRQ - GIC_INTERNAL)
 
+#define GICV3_LPI_INTID_START 8192
+
 #define GICV3_REDIST_SIZE 0x20000
 
 /* Number of SGI target-list bits */
-- 
2.27.0

