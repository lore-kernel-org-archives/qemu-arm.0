Received: by 2002:a17:906:1917:b0:98d:b2f5:1316 with SMTP id a23csp5702308eje;
        Mon, 17 Jul 2023 06:27:28 -0700 (PDT)
X-Google-Smtp-Source: APBJJlFFYKysE2L8fgRRlHnEFJ03KTPBMl7f54WJe4ESxEDPEwi+7l8vdgNOqt5XdRTocrpSDD5f
X-Received: by 2002:a05:622a:13c6:b0:403:c1c6:2662 with SMTP id p6-20020a05622a13c600b00403c1c62662mr10463594qtk.2.1689600448174;
        Mon, 17 Jul 2023 06:27:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1689600448; cv=none;
        d=google.com; s=arc-20160816;
        b=Nqt2DMdCfXac2RtzrtszG8EIHqtdkJQ1mPf3Sm5xJazzHvNL5/POvsvqOwS6E1ds3/
         bB2pxPSuc9m2/wccQeZWlzz0x8fi1FR/kkB/zhyUXtvJ6rcQLlrkS+ivnd5xZdlggJn1
         0av26hr8WBeAIMKqGOTNnZMMFcoDP2RgFrP7UCDwiSGNWpY5Ah4pGi93wUlTpcb1lKmv
         1hxR6QyJJJCYEvIMfK0WZpyQGPx77wev8t32DpjpPH7I3xAB6QPrMxKYs/C9cdRaQzZ7
         UynhA+oqqoS4Mm23gJtgnaReNr6npUreFA8IfCkSURdj5igqRTlLINFl7ehM0AWmUP7G
         Zjrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=jHHNLuXxMyb4d2xXXOlpvCwb+ZTFaCXaYWj7j4hbv5Y=;
        fh=bQJMnmQ0VoH+MwVuExw+aG4zUbzC1rnHjPO2njF07Lo=;
        b=uLhUvNYUkOEpJo27f2jHUJtzEYiyIs77fPHkiiXqZ+kt2oaoBdIbJ8C16/NDqUiziP
         GaeoZ8oREPiUds5TamwPYmL3XWDAL+Pjc/wzKjTIrblEyOsfw4bv+K0a7B+eHNSJ6t+D
         jrB6PhXv8GF0vHklAO7ffV6SN3uwkLbw3ti5Ml9j9xiZfZhrHEHXHCUymudRkzjlpV2h
         /5NkQR4kj7o/xsvOgtLlEoC55lo1Wm7nqqi0PvQ9X9fddPCkOVQV8hOqPKFTMXrt49IG
         NLEZTSdvzd6mDI42IeC9HiqSE+BXu1ziEaI0Wymspx28P2O/TnrhBonPEsgMPoRV+ASl
         4cbw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="qu5/evbB";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v34-20020a05622a18a200b004008c7f5283si8356010qtc.261.2023.07.17.06.27.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 17 Jul 2023 06:27:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="qu5/evbB";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qLOFV-0005vs-90; Mon, 17 Jul 2023 09:26:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qLOFS-0005vJ-D0
 for qemu-devel@nongnu.org; Mon, 17 Jul 2023 09:26:46 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qLOFQ-0003JX-Fx
 for qemu-devel@nongnu.org; Mon, 17 Jul 2023 09:26:46 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-3fbab0d0b88so34384475e9.0
 for <qemu-devel@nongnu.org>; Mon, 17 Jul 2023 06:26:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1689600402; x=1692192402;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=jHHNLuXxMyb4d2xXXOlpvCwb+ZTFaCXaYWj7j4hbv5Y=;
 b=qu5/evbBziVwv1AuxKjdmD5AkJJnTn+QLqV/sNP+VlQjYG1wVwOxZe6feIUqBgnu+a
 fsmkAB8FrCJ2bIG/ktEODNszGGSfu0Ls/MjuxvDTzfhokfukXLhAj8W+mkBor2Z6Lr1p
 WKjJb5XuQHhP1X1niXp/anAjTtYrIsJrylccbm+VgRslpDQp0/RQOLR+kTx6iWzQjjU+
 OsAYgA7NyNmYJ05UQ4L+XMI+o8Qy1yKqB4qxj/6zfwLywRrQMFXYJdpTeWnvnxPpDFu9
 fBQaUONdZ6bMnmYrM5kuNXFQowFwSabGzqWrQGNOog5J8+qmAJftXC3QtYa3KRJnOb5z
 nmIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689600402; x=1692192402;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jHHNLuXxMyb4d2xXXOlpvCwb+ZTFaCXaYWj7j4hbv5Y=;
 b=I5HIBMRUsF85Df75OunxS1urexszk0PSyRFnlWNUpSsJ4RnIHU+qMZa0bKiBifzZXR
 cZ/BmgRNQLJN/DquSbHhkeoP7/L9LVCSZWDj1l90Xjn2fCiBOuIlBM7Y50yy64GtTjgP
 XNdJz/jZVzKCkMsUuqAclNvv5aUlZOQCe4Wchje1Udx4kzzc4Vi1m6nIkFozYwo1A9jO
 NOjtMWMv9f7zfK8GhiKc/SY6Y6cfO52DuFWDrALbhhQEWOrDWAOYpilVZNzGaqo7D419
 +MXov5Pw30RSCqo0ct6qjfnPkeTuy5aYY1z85zpycbmK6id+rwpIYJjCgVc0BLBwyuxO
 U9+A==
X-Gm-Message-State: ABy/qLYUiGGVvdVAyZ5VPCT/f/5SAI4X3KCh8FavII0ROuodACDsQ75X
 WyU+XSWfZRFKo8Hn8IpVKzvXJQ==
X-Received: by 2002:a05:600c:3105:b0:3fa:9996:8e03 with SMTP id
 g5-20020a05600c310500b003fa99968e03mr7937260wmo.10.1689600402637; 
 Mon, 17 Jul 2023 06:26:42 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 z13-20020a7bc7cd000000b003fc05b89e5bsm7977646wmk.34.2023.07.17.06.26.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jul 2023 06:26:42 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: qemu-stable@nongnu.org,
	Eric Auger <eric.auger@redhat.com>
Subject: [PATCH for-8.1] hw/arm/smmu: Handle big-endian hosts correctly
Date: Mon, 17 Jul 2023 14:26:41 +0100
Message-Id: <20230717132641.764660-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: faN1k1Qx167F

The implementation of the SMMUv3 has multiple places where it reads a
data structure from the guest and directly operates on it without
doing a guest-to-host endianness conversion.  Since all SMMU data
structures are little-endian, this means that the SMMU doesn't work
on a big-endian host.  In particular, this causes the Avocado test
  machine_aarch64_virt.py:Aarch64VirtMachine.test_alpine_virt_tcg_gic_max
to fail on an s390x host.

Add appropriate byte-swapping on reads and writes of guest in-memory
data structures so that the device works correctly on big-endian
hosts.

As part of this we constrain queue_read() to operate only on Cmd
structs and queue_write() on Evt structs, because in practice these
are the only data structures the two functions are used with, and we
need to know what the data structure is to be able to byte-swap its
parts correctly.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-stable@nongnu.org
---
 hw/arm/smmu-common.c |  3 +--
 hw/arm/smmuv3.c      | 39 +++++++++++++++++++++++++++++++--------
 2 files changed, 32 insertions(+), 10 deletions(-)

diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
index 5ab9d45d58a..f35ae9aa22c 100644
--- a/hw/arm/smmu-common.c
+++ b/hw/arm/smmu-common.c
@@ -216,8 +216,7 @@ static int get_pte(dma_addr_t baseaddr, uint32_t index, uint64_t *pte,
     dma_addr_t addr = baseaddr + index * sizeof(*pte);
 
     /* TODO: guarantee 64-bit single-copy atomicity */
-    ret = dma_memory_read(&address_space_memory, addr, pte, sizeof(*pte),
-                          MEMTXATTRS_UNSPECIFIED);
+    ret = ldq_le_dma(&address_space_memory, addr, pte, MEMTXATTRS_UNSPECIFIED);
 
     if (ret != MEMTX_OK) {
         info->type = SMMU_PTW_ERR_WALK_EABT;
diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
index 932f0096974..1e9be8e89af 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -102,20 +102,34 @@ static void smmuv3_write_gerrorn(SMMUv3State *s, uint32_t new_gerrorn)
     trace_smmuv3_write_gerrorn(toggled & pending, s->gerrorn);
 }
 
-static inline MemTxResult queue_read(SMMUQueue *q, void *data)
+static inline MemTxResult queue_read(SMMUQueue *q, Cmd *cmd)
 {
     dma_addr_t addr = Q_CONS_ENTRY(q);
+    MemTxResult ret;
+    int i;
 
-    return dma_memory_read(&address_space_memory, addr, data, q->entry_size,
-                           MEMTXATTRS_UNSPECIFIED);
+    ret = dma_memory_read(&address_space_memory, addr, cmd, sizeof(Cmd),
+                          MEMTXATTRS_UNSPECIFIED);
+    if (ret != MEMTX_OK) {
+        return ret;
+    }
+    for (i = 0; i < ARRAY_SIZE(cmd->word); i++) {
+        le32_to_cpus(&cmd->word[i]);
+    }
+    return ret;
 }
 
-static MemTxResult queue_write(SMMUQueue *q, void *data)
+static MemTxResult queue_write(SMMUQueue *q, Evt *evt_in)
 {
     dma_addr_t addr = Q_PROD_ENTRY(q);
     MemTxResult ret;
+    Evt evt = *evt_in;
+    int i;
 
-    ret = dma_memory_write(&address_space_memory, addr, data, q->entry_size,
+    for (i = 0; i < ARRAY_SIZE(evt.word); i++) {
+        cpu_to_le32s(&evt.word[i]);
+    }
+    ret = dma_memory_write(&address_space_memory, addr, &evt, sizeof(Evt),
                            MEMTXATTRS_UNSPECIFIED);
     if (ret != MEMTX_OK) {
         return ret;
@@ -298,7 +312,7 @@ static void smmuv3_init_regs(SMMUv3State *s)
 static int smmu_get_ste(SMMUv3State *s, dma_addr_t addr, STE *buf,
                         SMMUEventInfo *event)
 {
-    int ret;
+    int ret, i;
 
     trace_smmuv3_get_ste(addr);
     /* TODO: guarantee 64-bit single-copy atomicity */
@@ -311,6 +325,9 @@ static int smmu_get_ste(SMMUv3State *s, dma_addr_t addr, STE *buf,
         event->u.f_ste_fetch.addr = addr;
         return -EINVAL;
     }
+    for (i = 0; i < ARRAY_SIZE(buf->word); i++) {
+        le32_to_cpus(&buf->word[i]);
+    }
     return 0;
 
 }
@@ -320,7 +337,7 @@ static int smmu_get_cd(SMMUv3State *s, STE *ste, uint32_t ssid,
                        CD *buf, SMMUEventInfo *event)
 {
     dma_addr_t addr = STE_CTXPTR(ste);
-    int ret;
+    int ret, i;
 
     trace_smmuv3_get_cd(addr);
     /* TODO: guarantee 64-bit single-copy atomicity */
@@ -333,6 +350,9 @@ static int smmu_get_cd(SMMUv3State *s, STE *ste, uint32_t ssid,
         event->u.f_ste_fetch.addr = addr;
         return -EINVAL;
     }
+    for (i = 0; i < ARRAY_SIZE(buf->word); i++) {
+        le32_to_cpus(&buf->word[i]);
+    }
     return 0;
 }
 
@@ -569,7 +589,7 @@ static int smmu_find_ste(SMMUv3State *s, uint32_t sid, STE *ste,
         return -EINVAL;
     }
     if (s->features & SMMU_FEATURE_2LVL_STE) {
-        int l1_ste_offset, l2_ste_offset, max_l2_ste, span;
+        int l1_ste_offset, l2_ste_offset, max_l2_ste, span, i;
         dma_addr_t l1ptr, l2ptr;
         STEDesc l1std;
 
@@ -593,6 +613,9 @@ static int smmu_find_ste(SMMUv3State *s, uint32_t sid, STE *ste,
             event->u.f_ste_fetch.addr = l1ptr;
             return -EINVAL;
         }
+        for (i = 0; i < ARRAY_SIZE(l1std.word); i++) {
+            le32_to_cpus(&l1std.word[i]);
+        }
 
         span = L1STD_SPAN(&l1std);
 
-- 
2.34.1

