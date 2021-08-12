Received: by 2002:a19:c144:0:0:0:0:0 with SMTP id r65csp538555lff;
        Thu, 12 Aug 2021 09:57:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwS2m6py+UbXaxXA2TUPE5q+ZqwDDEUG4FBkxTfxGLuJEamlfYW9Kch18W5xVFBZeyn68EP
X-Received: by 2002:a05:622a:1650:: with SMTP id y16mr4397263qtj.98.1628787478451;
        Thu, 12 Aug 2021 09:57:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1628787478; cv=none;
        d=google.com; s=arc-20160816;
        b=YG5OwM2URwpQ+parOVjAThp8WT1AFkps6cXuLOyyVGQ/9P7Yv6U+1GiIZGcW/6j6/4
         9LGbV3tQRX3mdxa+0Wj7X/ot+74lSSkGz1f6auT+aYz2GHdvGcJvyVYgHyriDhkr1Xbl
         5aIb577pZR7YC8UKPlE22AqhNDmqCE7BRMOMNdtixmL3DnXzMGqko42sK9sMz3bOo1nb
         2gK6BoKJqVHVubYmjQngdahHrKyuWvh2//ekodPWWEA5Mzeo2CQN7tOZ8DVwW+63hu/G
         8axJPN41/5hMrT0XB9ixCY7ZTKZE9W9zSA7kK29EhplnO0ObYVwKIVYfsg6rOW3rYgFL
         unLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=sFqL6JtThMV/uzqj7CPDUttJzXO4ytm6/MBAGbhLJDI=;
        b=IbwLSrd1jXCiVszybp5N3eqH+k63HDtpKj/0JWpEp+ke9YBngZ2tD+UDfdrqqRQt+L
         waVC+3f34r3x1PwtWcuWwbnlEtWYBZyZQDa98JADcbQr2XiJmRGmeKJuntQfYPOp9srU
         fJpK+ye5JEuFxEgL9damTEcpTrg/azE+U8Elp1gH0mlUEJHLyt50ye1eBmdqcLTZakE6
         f3c4jJxnVw6rUiFxBnspH3JGNbuhQhzJjPZ3Yv0FnZTkcxZHSuI9aP2cwZijvxkpVtb8
         Xcws1+7B97m9vrPwreiDGy76z0VvgdVDM6u8bKbBbPm1jh0Srf1gP/Ds3p6wGkFsD5gv
         ajNw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=CAWOThyx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e17si2055241qvp.114.2021.08.12.09.57.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 12 Aug 2021 09:57:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=CAWOThyx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60470 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mEE1l-0006G9-Kj
	for alex.bennee@linaro.org; Thu, 12 Aug 2021 12:57:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50838)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1mEDxu-0007o8-Va
 for qemu-arm@nongnu.org; Thu, 12 Aug 2021 12:53:59 -0400
Received: from mail-qt1-x835.google.com ([2607:f8b0:4864:20::835]:34692)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1mEDxl-000621-6L
 for qemu-arm@nongnu.org; Thu, 12 Aug 2021 12:53:58 -0400
Received: by mail-qt1-x835.google.com with SMTP id e15so5780579qtx.1
 for <qemu-arm@nongnu.org>; Thu, 12 Aug 2021 09:53:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sFqL6JtThMV/uzqj7CPDUttJzXO4ytm6/MBAGbhLJDI=;
 b=CAWOThyxkbV0X32UAKAIPlpWfO/b24F+S+goQHZJ535dAH6d36MnwnIOJF6LhyHIgn
 cdnu8MCUM89Dsa17U5HgXXJdlGDJTZHQp/H8lJ33PF6dq5R8u0EbzHXABHaB4bqVALU2
 T2jclaKKfJ0mCU8AMz+txAro7vwebwhINI0GVQdTn2l2UaQQ+ZBcIAacScvZ6Awd2osy
 PoD2+lDWHtNA9YmB+A0BD8jEfp+r3Q88AoWXXbZtJvpkaUhd20BOXqk1GbS+y1JQnwWV
 jApH/nDJXhktSSJXwRtxxPmNt6HwmKuwaxSqdKSwKosU8BiMze6+BFQsx8TJfilehqcO
 04Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sFqL6JtThMV/uzqj7CPDUttJzXO4ytm6/MBAGbhLJDI=;
 b=Dr3u4Yqo2DUC3TGOwrYsK+q1M+flARs03MSFViVdvt7YESHUNg478A2BeuBUgiWDv5
 T9KvbBWjr7XOqaCOfwqy8qTrGC0shHHEkWp4r1QJ0jEuSe+HX+LZu+Lo5vv8zkMpYB9P
 3VbJFUuH2fAQowKVqT3DKPl5shYjHX8BIA6Ci+eaAAGJMsz5CnUm1ErpwWIaGIRBCCXv
 OVvkBj11HNYVhy3b7Fq0sqG6WF1vj24+LtAN6tPqcyevslDpPVuV2ajlhYCG/XmfyBZs
 kVyOgKpZMOERGy2V60wq5flBCc5x5dkS7/xH3LvwNhH0744AEbIGumtuKTH+pjrLQ+ms
 8BWA==
X-Gm-Message-State: AOAM530AKvXO70yjWgrIPcI+cMax8h2G763gP9aWWpW8ZzE4qAZLYE88
 KZG6zMIHZeHM/Ah3pVK5TpH2qw==
X-Received: by 2002:ac8:468b:: with SMTP id g11mr4798398qto.385.1628787228180; 
 Thu, 12 Aug 2021 09:53:48 -0700 (PDT)
Received: from localhost.localdomain
 (bras-base-stsvon1503w-grc-22-142-114-143-47.dsl.bell.ca. [142.114.143.47])
 by smtp.googlemail.com with ESMTPSA id c69sm1714864qkg.1.2021.08.12.09.53.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Aug 2021 09:53:48 -0700 (PDT)
From: Shashi Mallela <shashi.mallela@linaro.org>
To: peter.maydell@linaro.org, leif@nuviainc.com, rad@semihalf.com,
 mst@redhat.com, imammedo@redhat.com
Subject: [PATCH v8 04/10] hw/intc: GICv3 ITS Command processing
Date: Thu, 12 Aug 2021 12:53:35 -0400
Message-Id: <20210812165341.40784-5-shashi.mallela@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210812165341.40784-1-shashi.mallela@linaro.org>
References: <20210812165341.40784-1-shashi.mallela@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::835;
 envelope-from=shashi.mallela@linaro.org; helo=mail-qt1-x835.google.com
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
Cc: eric.auger@redhat.com, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 narmstrong@baylibre.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 2AkKa+hq5/9m

Added ITS command queue handling for MAPTI,MAPI commands,handled ITS
translation which triggers an LPI via INT command as well as write
to GITS_TRANSLATER register,defined enum to differentiate between ITS
command interrupt trigger and GITS_TRANSLATER based interrupt trigger.
Each of these commands make use of other functionalities implemented to
get device table entry,collection table entry or interrupt translation
table entry required for their processing.

Signed-off-by: Shashi Mallela <shashi.mallela@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/arm_gicv3_its.c            | 351 +++++++++++++++++++++++++++++
 hw/intc/gicv3_internal.h           |  12 +
 include/hw/intc/arm_gicv3_common.h |   2 +
 3 files changed, 365 insertions(+)

diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
index 8bdbebbeca..d98b0e0f4c 100644
--- a/hw/intc/arm_gicv3_its.c
+++ b/hw/intc/arm_gicv3_its.c
@@ -29,6 +29,22 @@ struct GICv3ITSClass {
     void (*parent_reset)(DeviceState *dev);
 };
 
+/*
+ * This is an internal enum used to distinguish between LPI triggered
+ * via command queue and LPI triggered via gits_translater write.
+ */
+typedef enum ItsCmdType {
+    NONE = 0, /* internal indication for GITS_TRANSLATER write */
+    CLEAR = 1,
+    DISCARD = 2,
+    INT = 3,
+} ItsCmdType;
+
+typedef struct {
+    uint32_t iteh;
+    uint64_t itel;
+} IteEntry;
+
 static uint64_t baser_base_addr(uint64_t value, uint32_t page_sz)
 {
     uint64_t result = 0;
@@ -50,6 +66,323 @@ static uint64_t baser_base_addr(uint64_t value, uint32_t page_sz)
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
+            valid_l2t = (value & L2_TABLE_VALID_MASK) != 0;
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
+    return (*cte & TABLE_ENTRY_VALID_MASK) != 0;
+}
+
+static MemTxResult update_ite(GICv3ITSState *s, uint32_t eventid, uint64_t dte,
+                              IteEntry ite)
+{
+    AddressSpace *as = &s->gicv3->dma_as;
+    uint64_t itt_addr;
+    MemTxResult res = MEMTX_OK;
+
+    itt_addr = (dte & GITS_DTE_ITTADDR_MASK) >> GITS_DTE_ITTADDR_SHIFT;
+    itt_addr <<= ITTADDR_SHIFT; /* 256 byte aligned */
+
+    address_space_stq_le(as, itt_addr + (eventid * (sizeof(uint64_t) +
+                         sizeof(uint32_t))), ite.itel, MEMTXATTRS_UNSPECIFIED,
+                         &res);
+
+    if (res == MEMTX_OK) {
+        address_space_stl_le(as, itt_addr + (eventid * (sizeof(uint64_t) +
+                             sizeof(uint32_t))) + sizeof(uint32_t), ite.iteh,
+                             MEMTXATTRS_UNSPECIFIED, &res);
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
+    IteEntry ite = {};
+
+    itt_addr = (dte & GITS_DTE_ITTADDR_MASK) >> GITS_DTE_ITTADDR_SHIFT;
+    itt_addr <<= ITTADDR_SHIFT; /* 256 byte aligned */
+
+    ite.itel = address_space_ldq_le(as, itt_addr +
+                                    (eventid * (sizeof(uint64_t) +
+                                    sizeof(uint32_t))), MEMTXATTRS_UNSPECIFIED,
+                                    res);
+
+    if (*res == MEMTX_OK) {
+        ite.iteh = address_space_ldl_le(as, itt_addr +
+                                        (eventid * (sizeof(uint64_t) +
+                                        sizeof(uint32_t))) + sizeof(uint32_t),
+                                        MEMTXATTRS_UNSPECIFIED, res);
+
+        if (*res == MEMTX_OK) {
+            if (ite.itel & TABLE_ENTRY_VALID_MASK) {
+                if ((ite.itel >> ITE_ENTRY_INTTYPE_SHIFT) &
+                    GITS_TYPE_PHYSICAL) {
+                    *pIntid = (ite.itel & ITE_ENTRY_INTID_MASK) >>
+                               ITE_ENTRY_INTID_SHIFT;
+                    *icid = ite.iteh & ITE_ENTRY_ICID_MASK;
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
+            valid_l2t = (value & L2_TABLE_VALID_MASK) != 0;
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
+/*
+ * This function handles the processing of following commands based on
+ * the ItsCmdType parameter passed:-
+ * 1. triggering of lpi interrupt translation via ITS INT command
+ * 2. triggering of lpi interrupt translation via gits_translater register
+ * 3. handling of ITS CLEAR command
+ * 4. handling of ITS DISCARD command
+ */
+static MemTxResult process_its_cmd(GICv3ITSState *s, uint64_t value,
+                                   uint32_t offset, ItsCmdType cmd)
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
+
+    if (cmd == NONE) {
+        devid = offset;
+    } else {
+        devid = ((value & DEVID_MASK) >> DEVID_SHIFT);
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
+    dte_valid = dte & TABLE_ENTRY_VALID_MASK;
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
+    if ((devid > s->dt.maxids.max_devids) || !dte_valid || !ite_valid ||
+            !cte_valid || (eventid > max_eventid)) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: invalid command attributes "
+                      "devid %d or eventid %d or invalid dte %d or"
+                      "invalid cte %d or invalid ite %d\n",
+                      __func__, devid, eventid, dte_valid, cte_valid,
+                      ite_valid);
+        /*
+         * in this implementation, in case of error
+         * we ignore this command and move onto the next
+         * command in the queue
+         */
+    } else {
+        /*
+         * Current implementation only supports rdbase == procnum
+         * Hence rdbase physical address is ignored
+         */
+        if (cmd == DISCARD) {
+            IteEntry ite = {};
+            /* remove mapping from interrupt translation table */
+            res = update_ite(s, eventid, dte, ite);
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
+    IteEntry ite;
+    uint32_t int_spurious = INTID_SPURIOUS;
+
+    devid = ((value & DEVID_MASK) >> DEVID_SHIFT);
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
+        pIntid = ((value & pINTID_MASK) >> pINTID_SHIFT);
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
+    dte_valid = dte & TABLE_ENTRY_VALID_MASK;
+
+    max_eventid = (1UL << (((dte >> 1U) & SIZE_MASK) + 1));
+
+    if (!ignore_pInt) {
+        max_Intid = (1ULL << (GICD_TYPER_IDBITS + 1)) - 1;
+    }
+
+    if ((devid > s->dt.maxids.max_devids) || (icid > s->ct.maxids.max_collids)
+            || !dte_valid || (eventid > max_eventid) ||
+            (!ignore_pInt && (((pIntid < GICV3_LPI_INTID_START) ||
+            (pIntid > max_Intid)) && (pIntid != INTID_SPURIOUS)))) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: invalid command attributes "
+                      "devid %d or icid %d or eventid %d or pIntid %d or"
+                      "unmapped dte %d\n", __func__, devid, icid, eventid,
+                      pIntid, dte_valid);
+        /*
+         * in this implementation, in case of error
+         * we ignore this command and move onto the next
+         * command in the queue
+         */
+    } else {
+        /* add ite entry to interrupt translation table */
+        ite.itel = (dte_valid & TABLE_ENTRY_VALID_MASK) |
+                    (GITS_TYPE_PHYSICAL << ITE_ENTRY_INTTYPE_SHIFT);
+
+        if (ignore_pInt) {
+            ite.itel |= (eventid << ITE_ENTRY_INTID_SHIFT);
+        } else {
+            ite.itel |= (pIntid << ITE_ENTRY_INTID_SHIFT);
+        }
+        ite.itel |= (int_spurious << ITE_ENTRY_INTSP_SHIFT);
+        ite.iteh = icid;
+
+        res = update_ite(s, eventid, dte, ite);
+    }
+
+    return res;
+}
+
 static MemTxResult update_cte(GICv3ITSState *s, uint16_t icid, bool valid,
                               uint64_t rdbase)
 {
@@ -303,8 +636,10 @@ static void process_cmdq(GICv3ITSState *s)
 
         switch (cmd) {
         case GITS_CMD_INT:
+            res = process_its_cmd(s, data, cq_offset, INT);
             break;
         case GITS_CMD_CLEAR:
+            res = process_its_cmd(s, data, cq_offset, CLEAR);
             break;
         case GITS_CMD_SYNC:
             /*
@@ -321,10 +656,13 @@ static void process_cmdq(GICv3ITSState *s)
             res = process_mapc(s, cq_offset);
             break;
         case GITS_CMD_MAPTI:
+            res = process_mapti(s, data, cq_offset, false);
             break;
         case GITS_CMD_MAPI:
+            res = process_mapti(s, data, cq_offset, true);
             break;
         case GITS_CMD_DISCARD:
+            res = process_its_cmd(s, data, cq_offset, DISCARD);
             break;
         case GITS_CMD_INV:
         case GITS_CMD_INVALL:
@@ -486,7 +824,20 @@ static MemTxResult gicv3_its_translation_write(void *opaque, hwaddr offset,
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
+            result = process_its_cmd(s, data, devid, NONE);
+        }
+        break;
+    default:
+        break;
+    }
 
     return result;
 }
diff --git a/hw/intc/gicv3_internal.h b/hw/intc/gicv3_internal.h
index 034fadfebe..1966444790 100644
--- a/hw/intc/gicv3_internal.h
+++ b/hw/intc/gicv3_internal.h
@@ -334,6 +334,13 @@ FIELD(MAPC, RDBASE, 16, 32)
 #define ITTADDR_MASK             MAKE_64BIT_MASK(ITTADDR_SHIFT, ITTADDR_LENGTH)
 #define SIZE_MASK                 0x1f
 
+/* MAPI command fields */
+#define EVENTID_MASK              ((1ULL << 32) - 1)
+
+/* MAPTI command fields */
+#define pINTID_SHIFT                 32
+#define pINTID_MASK               MAKE_64BIT_MASK(32, 32)
+
 #define DEVID_SHIFT                  32
 #define DEVID_MASK                MAKE_64BIT_MASK(32, 32)
 
@@ -359,6 +366,11 @@ FIELD(MAPC, RDBASE, 16, 32)
  *   Values:  |  vPEID    |  ICID   |
  */
 #define ITS_ITT_ENTRY_SIZE            0xC
+#define ITE_ENTRY_INTTYPE_SHIFT        1
+#define ITE_ENTRY_INTID_SHIFT          2
+#define ITE_ENTRY_INTID_MASK         MAKE_64BIT_MASK(2, 24)
+#define ITE_ENTRY_INTSP_SHIFT          26
+#define ITE_ENTRY_ICID_MASK          MAKE_64BIT_MASK(0, 16)
 
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

