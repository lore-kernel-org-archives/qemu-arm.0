Received: by 2002:a17:906:724b:b0:a35:eedd:80b0 with SMTP id n11csp1164500ejk;
        Tue, 30 Jan 2024 16:25:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF1u9w30VA3L4C+PkVFOTdQkpsEcNvmyiAJZyZnppH56iGnyMuOFMZc+m2d46txbH+m+L68
X-Received: by 2002:ac8:5f91:0:b0:42a:b53a:5bbe with SMTP id j17-20020ac85f91000000b0042ab53a5bbemr295036qta.26.1706660739663;
        Tue, 30 Jan 2024 16:25:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1706660739; cv=none;
        d=google.com; s=arc-20160816;
        b=yY9vp4dqkN1ybB/uIE8hPnhLfrBnUmq9Yynl2j3XaXX8KecdDkWhUcRJ2J+h8BMEOc
         bQ0sbvoCtk1uOPKPAy8Nct5tmsd9tSCbMS+h2lj7SYnFCZHW6B+SyF+fu0wR2YUF5SHC
         w2X+fsdM5v9fX1Oyd9dKVEaXZbDzRI+FJXpH3YV16NguUuEPmcDKiUhakl1SEcPhrIS0
         jHbkCGvPf+8nMx9ZnE6WN4VdJJ338GN2MwbQp+A9W0dsEy9qvGfYOm/qJRACCl4ujnuu
         poo/F+cgB5gH0ntZQOgzhNZv/c6DLReUkgwl+yWY6VbPW1Wbg2Tsca+0XdfMLxcXsDwj
         MVWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:message-id
         :references:mime-version:in-reply-to:date:dkim-signature;
        bh=dFyliLXvZb/QDwW17SrqaElvH2rdmumtRR3TvreOmZM=;
        fh=+aVB0apLn7P4p3cMF9Qg7nFZ6+AnRx2Fcri+oFjNFtM=;
        b=xGnCTmS9QjJXG1NZITpY8uHDwVGRb34hzhHDDPwfhZtnXK727PIakfJ5Qs0OI5XxzY
         R+Xy+05W2bYpLh35F14CqLGVUiONAc1F2EIjB3AbZptoRNYwd1S1yyEITx/PS/tEXyhV
         1/aZmIXOXvfHO62P4wB6YewoVGbQ3lBv3CpOOO1pTdQO/nfUbi2aQ7NkHvGN30vtT605
         BQr1ssvzd0BEhOzUERtjXYiwq+Ka8zssr5Dy3BuhLV6rQ+Vj0R/9HSUVWLb9aPaR4Q0j
         Q47aAi2XKJUChWQgGBO6k63Q05R7pmNIXev5mUWAgHyiluUXhoXC7sLp7kyEvxzE4LqI
         vhEg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=jSX+fZcV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p7-20020a05622a048700b0042a111b261bsi11024868qtx.776.2024.01.30.16.25.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 30 Jan 2024 16:25:39 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=jSX+fZcV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rUyPz-0002Ih-54; Tue, 30 Jan 2024 19:25:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3dZO5ZQwKCLYjWXedaopabWjckkcha.Ykimaiq-Wnijkjcjq.knc@flex--nabihestefan.bounces.google.com>)
 id 1rUyPx-0002Gi-8p
 for qemu-arm@nongnu.org; Tue, 30 Jan 2024 19:25:29 -0500
Received: from mail-yw1-x114a.google.com ([2607:f8b0:4864:20::114a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3dZO5ZQwKCLYjWXedaopabWjckkcha.Ykimaiq-Wnijkjcjq.knc@flex--nabihestefan.bounces.google.com>)
 id 1rUyPu-0003rf-Rv
 for qemu-arm@nongnu.org; Tue, 30 Jan 2024 19:25:29 -0500
Received: by mail-yw1-x114a.google.com with SMTP id
 00721157ae682-6002a655cc1so72031577b3.1
 for <qemu-arm@nongnu.org>; Tue, 30 Jan 2024 16:25:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1706660725; x=1707265525; darn=nongnu.org;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=dFyliLXvZb/QDwW17SrqaElvH2rdmumtRR3TvreOmZM=;
 b=jSX+fZcVrWUWI2Vcf5NUYS0a+bR95EhQzIjTkW3PRgbeb4xiExggBGwuNCC5d4AXdI
 sWmYw/U0LR8AfOb2S8VeDd5lfgG+YW7mF56rZORIhm7K67IppEjI/TSbN6peczMLZLOo
 UIs6dXOWNU9+bt+Csb4o+PouSkNczjQ1wx00aCcESlGZieJiv01qa1AkG4ej7pTZ22kf
 XQbS4DJzh93RZwh+A0x+oFQsSOJe/Is0D2qaIqUB2acuB2XPFKVLgZ9GB0c8YnB7mrvh
 umgH6LMCUR1WRjBPZxBUGpJrWM91WvbvbfyWcjtNmktC0DyMR4cyl/+i+fWmUlfFtLWG
 fvQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706660725; x=1707265525;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dFyliLXvZb/QDwW17SrqaElvH2rdmumtRR3TvreOmZM=;
 b=a/QTpfufdLEA7KVeZDSbWlMzDWaZvIo5b+e6k9I9MVTaTeCndgLunrxxgJ3vpOjA2f
 hRoEgTBot4ufjrwtEXBZZ180bCjRCVV3kpY6wZMwjNbT5HxqoDms9peCoLq2F7Wv10kL
 deJ3M4E2VKPjgylZJ5I3cznUcJftXkDPmofspnul7LMABTjuXUaIoXuJdnzPHuFLl4JD
 Td6owTcxLPiP7Vo7otXUtpSyOLVjzEA9hEvHwOvHvfFXAMJUqqJ5BFVSSUeThhX/+AoY
 qoTbrn5viHtlFnd6v1Abmr4huw9vQCO0fMcs6l31/PbIuQ+DJaZNXpzytOcHCsOMxo/t
 Y2wA==
X-Gm-Message-State: AOJu0Yw0jkx96uK9Yptf68W4LOgjF5hOJV9L0RX6qGdi4kGNNAcV9uJW
 jn4CcbGHl0RCOx8mwr1wowW3CNuGmFs7ih0nG3F3PNcfi8a27BOyC4Pb32aKnRttsEJLnfNUwM7
 rToLkxBBTIoNH+Z2di4C+kOQBtg==
X-Received: from nabihestefan.c.googlers.com
 ([fda3:e722:ac3:cc00:20:ed76:c0a8:2737])
 (user=nabihestefan job=sendgmr) by 2002:a81:9bcd:0:b0:5ff:5135:ffcf with SMTP
 id s196-20020a819bcd000000b005ff5135ffcfmr2134055ywg.4.1706660725287; Tue, 30
 Jan 2024 16:25:25 -0800 (PST)
Date: Wed, 31 Jan 2024 00:25:09 +0000
In-Reply-To: <20240131002511.986787-1-nabihestefan@google.com>
Mime-Version: 1.0
References: <20240131002511.986787-1-nabihestefan@google.com>
X-Mailer: git-send-email 2.43.0.429.g432eaa2c6b-goog
Message-ID: <20240131002511.986787-5-nabihestefan@google.com>
Subject: [PATCH v16 4/6] hw/net: GMAC Rx Implementation
From: Nabih Estefan <nabihestefan@google.com>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, kfting@nuvoton.com, 
 wuhaotsh@google.com, jasowang@redhat.com, avi.fishman@nuvoton.com, 
 nabihestefan@google.com, kwliu@nuvoton.com, tomer.maimon@nuvoton.com, 
 Hila.Miranda-Kuzi@nuvoton.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::114a;
 envelope-from=3dZO5ZQwKCLYjWXedaopabWjckkcha.Ykimaiq-Wnijkjcjq.knc@flex--nabihestefan.bounces.google.com;
 helo=mail-yw1-x114a.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=unavailable autolearn_force=no
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
X-TUID: kzsyDBqBnmmk

From: Nabih Estefan Diaz <nabihestefan@google.com>

- Implementation of Receive function for packets
- Implementation for reading and writing from and to descriptors in
  memory for Rx

When RX starts, we need to flush the queued packets so that they
can be received by the GMAC device. Without this it won't work
with TAP NIC device.

When RX descriptor list is full, it returns a DMA_STATUS for
software to handle it. But there's no way to indicate the software has
handled all RX descriptors and the whole pipeline stalls.

We do something similar to NPCM7XX EMC to handle this case.

1. Return packet size when RX descriptor is full, effectively dropping
these packets in such a case.
2. When software clears RX descriptor full bit, continue receiving
further packets by flushing QEMU packet queue.

Added relevant trace-events

Change-Id: I132aa254a94cda1a586aba2ea33bbfc74ecdb831
Signed-off-by: Hao Wu <wuhaotsh@google.com>
Signed-off-by: Nabih Estefan <nabihestefan@google.com>
Reviewed-by: Tyrone Ting <kfting@nuvoton.com>
---
 hw/net/npcm_gmac.c  | 276 +++++++++++++++++++++++++++++++++++++++++++-
 hw/net/trace-events |   5 +
 2 files changed, 279 insertions(+), 2 deletions(-)

diff --git a/hw/net/npcm_gmac.c b/hw/net/npcm_gmac.c
index 7118b4c7c7..a3c626e1b8 100644
--- a/hw/net/npcm_gmac.c
+++ b/hw/net/npcm_gmac.c
@@ -27,6 +27,10 @@
 #include "hw/net/mii.h"
 #include "hw/net/npcm_gmac.h"
 #include "migration/vmstate.h"
+#include "net/checksum.h"
+#include "net/eth.h"
+#include "net/net.h"
+#include "qemu/cutils.h"
 #include "qemu/log.h"
 #include "qemu/units.h"
 #include "sysemu/dma.h"
@@ -149,6 +153,17 @@ static void gmac_phy_set_link(NPCMGMACState *gmac, bool active)
 
 static bool gmac_can_receive(NetClientState *nc)
 {
+    NPCMGMACState *gmac = NPCM_GMAC(qemu_get_nic_opaque(nc));
+
+    /* If GMAC receive is disabled. */
+    if (!(gmac->regs[R_NPCM_GMAC_MAC_CONFIG] & NPCM_GMAC_MAC_CONFIG_RX_EN)) {
+        return false;
+    }
+
+    /* If GMAC DMA RX is stopped. */
+    if (!(gmac->regs[R_NPCM_DMA_CONTROL] & NPCM_DMA_CONTROL_START_STOP_RX)) {
+        return false;
+    }
     return true;
 }
 
@@ -192,12 +207,258 @@ static void gmac_update_irq(NPCMGMACState *gmac)
     qemu_set_irq(gmac->irq, level);
 }
 
-static ssize_t gmac_receive(NetClientState *nc, const uint8_t *buf, size_t len)
+static int gmac_read_rx_desc(dma_addr_t addr, struct NPCMGMACRxDesc *desc)
+{
+    if (dma_memory_read(&address_space_memory, addr, desc,
+                        sizeof(*desc), MEMTXATTRS_UNSPECIFIED)) {
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: Failed to read descriptor @ 0x%"
+                      HWADDR_PRIx "\n", __func__, addr);
+        return -1;
+    }
+    desc->rdes0 = le32_to_cpu(desc->rdes0);
+    desc->rdes1 = le32_to_cpu(desc->rdes1);
+    desc->rdes2 = le32_to_cpu(desc->rdes2);
+    desc->rdes3 = le32_to_cpu(desc->rdes3);
+    return 0;
+}
+
+static int gmac_write_rx_desc(dma_addr_t addr, struct NPCMGMACRxDesc *desc)
 {
-    /* Placeholder. Function will be filled in following patches */
+    struct NPCMGMACRxDesc le_desc;
+    le_desc.rdes0 = cpu_to_le32(desc->rdes0);
+    le_desc.rdes1 = cpu_to_le32(desc->rdes1);
+    le_desc.rdes2 = cpu_to_le32(desc->rdes2);
+    le_desc.rdes3 = cpu_to_le32(desc->rdes3);
+    if (dma_memory_write(&address_space_memory, addr, &le_desc,
+                        sizeof(le_desc), MEMTXATTRS_UNSPECIFIED)) {
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: Failed to write descriptor @ 0x%"
+                      HWADDR_PRIx "\n", __func__, addr);
+        return -1;
+    }
     return 0;
 }
 
+static int gmac_rx_transfer_frame_to_buffer(uint32_t rx_buf_len,
+                                            uint32_t *left_frame,
+                                            uint32_t rx_buf_addr,
+                                            bool *eof_transferred,
+                                            const uint8_t **frame_ptr,
+                                            uint16_t *transferred)
+{
+    uint32_t to_transfer;
+    /*
+     * Check that buffer is bigger than the frame being transfered
+     * If bigger then transfer only whats left of frame
+     * Else, fill frame with all the content possible
+     */
+    if (rx_buf_len >= *left_frame) {
+        to_transfer = *left_frame;
+        *eof_transferred = true;
+    } else {
+        to_transfer = rx_buf_len;
+    }
+
+    /* write frame part to memory */
+    if (dma_memory_write(&address_space_memory, (uint64_t) rx_buf_addr,
+                         *frame_ptr, to_transfer, MEMTXATTRS_UNSPECIFIED)) {
+        return -1;
+    }
+
+    /* update frame pointer and size of whats left of frame */
+    *frame_ptr += to_transfer;
+    *left_frame -= to_transfer;
+    *transferred += to_transfer;
+
+    return 0;
+}
+
+static void gmac_dma_set_state(NPCMGMACState *gmac, int shift, uint32_t state)
+{
+    gmac->regs[R_NPCM_DMA_STATUS] = deposit32(gmac->regs[R_NPCM_DMA_STATUS],
+        shift, 3, state);
+}
+
+static ssize_t gmac_receive(NetClientState *nc, const uint8_t *buf, size_t len)
+{
+    /*
+     * Comments have steps that relate to the
+     * receiving process steps in pg 386
+     */
+    NPCMGMACState *gmac = NPCM_GMAC(qemu_get_nic_opaque(nc));
+    uint32_t left_frame = len;
+    const uint8_t *frame_ptr = buf;
+    uint32_t desc_addr;
+    uint32_t rx_buf_len, rx_buf_addr;
+    struct NPCMGMACRxDesc rx_desc;
+    uint16_t transferred = 0;
+    bool eof_transferred = false;
+
+    trace_npcm_gmac_packet_receive(DEVICE(gmac)->canonical_path, len);
+    if (!gmac_can_receive(nc)) {
+        qemu_log_mask(LOG_GUEST_ERROR, "GMAC Currently is not able for Rx");
+        return -1;
+    }
+    if (!gmac->regs[R_NPCM_DMA_HOST_RX_DESC]) {
+        gmac->regs[R_NPCM_DMA_HOST_RX_DESC] =
+            NPCM_DMA_HOST_RX_DESC_MASK(gmac->regs[R_NPCM_DMA_RX_BASE_ADDR]);
+    }
+    desc_addr = NPCM_DMA_HOST_RX_DESC_MASK(gmac->regs[R_NPCM_DMA_HOST_RX_DESC]);
+
+    /* step 1 */
+    gmac_dma_set_state(gmac, NPCM_DMA_STATUS_RX_PROCESS_STATE_SHIFT,
+        NPCM_DMA_STATUS_RX_RUNNING_FETCHING_STATE);
+    trace_npcm_gmac_packet_desc_read(DEVICE(gmac)->canonical_path, desc_addr);
+    if (gmac_read_rx_desc(desc_addr, &rx_desc)) {
+        qemu_log_mask(LOG_GUEST_ERROR, "RX Descriptor @ 0x%x cant be read\n",
+                      desc_addr);
+        gmac_dma_set_state(gmac, NPCM_DMA_STATUS_RX_PROCESS_STATE_SHIFT,
+            NPCM_DMA_STATUS_RX_SUSPENDED_STATE);
+        return -1;
+    }
+
+    /* step 2 */
+    if (!(rx_desc.rdes0 & RX_DESC_RDES0_OWN)) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "RX Descriptor @ 0x%x is owned by software\n",
+                      desc_addr);
+        gmac->regs[R_NPCM_DMA_STATUS] |= NPCM_DMA_STATUS_RU;
+        gmac->regs[R_NPCM_DMA_STATUS] |= NPCM_DMA_STATUS_RI;
+        gmac_dma_set_state(gmac, NPCM_DMA_STATUS_RX_PROCESS_STATE_SHIFT,
+            NPCM_DMA_STATUS_RX_SUSPENDED_STATE);
+        gmac_update_irq(gmac);
+        return len;
+    }
+    /* step 3 */
+    /*
+     * TODO --
+     * Implement all frame filtering and processing (with its own interrupts)
+     */
+    trace_npcm_gmac_debug_desc_data(DEVICE(gmac)->canonical_path, &rx_desc,
+                                    rx_desc.rdes0, rx_desc.rdes1, rx_desc.rdes2,
+                                    rx_desc.rdes3);
+    /* Clear rdes0 for the incoming descriptor and set FS in first descriptor.*/
+    rx_desc.rdes0 = RX_DESC_RDES0_FIRST_DESC_MASK;
+
+    gmac_dma_set_state(gmac, NPCM_DMA_STATUS_RX_PROCESS_STATE_SHIFT,
+        NPCM_DMA_STATUS_RX_RUNNING_TRANSFERRING_STATE);
+
+    /* Pad the frame with FCS as the kernel driver will strip it away. */
+    left_frame += ETH_FCS_LEN;
+
+    /* repeat while we still have frame to transfer to memory */
+    while (!eof_transferred) {
+        /* Return descriptor no matter what happens */
+        rx_desc.rdes0 &= ~RX_DESC_RDES0_OWN;
+        /* Set the frame to be an IPv4/IPv6 frame. */
+        rx_desc.rdes0 |= RX_DESC_RDES0_FRM_TYPE_MASK;
+
+        /* step 4 */
+        rx_buf_len = RX_DESC_RDES1_BFFR1_SZ_MASK(rx_desc.rdes1);
+        rx_buf_addr = rx_desc.rdes2;
+        gmac->regs[R_NPCM_DMA_CUR_RX_BUF_ADDR] = rx_buf_addr;
+        gmac_rx_transfer_frame_to_buffer(rx_buf_len, &left_frame, rx_buf_addr,
+                                         &eof_transferred, &frame_ptr,
+                                         &transferred);
+
+        trace_npcm_gmac_packet_receiving_buffer(DEVICE(gmac)->canonical_path,
+                                                rx_buf_len, rx_buf_addr);
+        /* if we still have frame left and the second buffer is not chained */
+         if (!(rx_desc.rdes1 & RX_DESC_RDES1_SEC_ADDR_CHND_MASK) && \
+              !eof_transferred) {
+            /* repeat process from above on buffer 2 */
+            rx_buf_len = RX_DESC_RDES1_BFFR2_SZ_MASK(rx_desc.rdes1);
+            rx_buf_addr = rx_desc.rdes3;
+            gmac->regs[R_NPCM_DMA_CUR_RX_BUF_ADDR] = rx_buf_addr;
+            gmac_rx_transfer_frame_to_buffer(rx_buf_len, &left_frame,
+                                             rx_buf_addr, &eof_transferred,
+                                             &frame_ptr, &transferred);
+            trace_npcm_gmac_packet_receiving_buffer( \
+                                                DEVICE(gmac)->canonical_path,
+                                                rx_buf_len, rx_buf_addr);
+        }
+        /* update address for descriptor */
+        gmac->regs[R_NPCM_DMA_HOST_RX_DESC] = rx_buf_addr;
+        /* Return descriptor */
+        rx_desc.rdes0 &= ~RX_DESC_RDES0_OWN;
+        /* Update frame length transferred */
+        rx_desc.rdes0 |= ((uint32_t)transferred)
+            << RX_DESC_RDES0_FRAME_LEN_SHIFT;
+        trace_npcm_gmac_debug_desc_data(DEVICE(gmac)->canonical_path, &rx_desc,
+                                        rx_desc.rdes0, rx_desc.rdes1,
+                                        rx_desc.rdes2, rx_desc.rdes3);
+
+        /* step 5 */
+        gmac_write_rx_desc(desc_addr, &rx_desc);
+        trace_npcm_gmac_debug_desc_data(DEVICE(gmac)->canonical_path,
+                                        &rx_desc, rx_desc.rdes0,
+                                        rx_desc.rdes1, rx_desc.rdes2,
+                                        rx_desc.rdes3);
+        /* read new descriptor into rx_desc if needed*/
+        if (!eof_transferred) {
+            /* Get next descriptor address (chained or sequential) */
+            if (rx_desc.rdes1 & RX_DESC_RDES1_RC_END_RING_MASK) {
+                desc_addr = gmac->regs[R_NPCM_DMA_RX_BASE_ADDR];
+            } else if (rx_desc.rdes1 & RX_DESC_RDES1_SEC_ADDR_CHND_MASK) {
+                desc_addr = rx_desc.rdes3;
+            } else {
+                desc_addr += sizeof(rx_desc);
+            }
+            trace_npcm_gmac_packet_desc_read(DEVICE(gmac)->canonical_path,
+                                             desc_addr);
+            if (gmac_read_rx_desc(desc_addr, &rx_desc)) {
+                qemu_log_mask(LOG_GUEST_ERROR,
+                              "RX Descriptor @ 0x%x cant be read\n",
+                              desc_addr);
+                gmac->regs[R_NPCM_DMA_STATUS] |= NPCM_DMA_STATUS_RU;
+                gmac_update_irq(gmac);
+                return len;
+            }
+
+            /* step 6 */
+            if (!(rx_desc.rdes0 & RX_DESC_RDES0_OWN)) {
+                if (!(gmac->regs[R_NPCM_DMA_CONTROL] & \
+                     NPCM_DMA_CONTROL_FLUSH_MASK)) {
+                    rx_desc.rdes0 |= RX_DESC_RDES0_DESC_ERR_MASK;
+                }
+                eof_transferred = true;
+            }
+            /* Clear rdes0 for the incoming descriptor */
+            rx_desc.rdes0 = 0;
+        }
+    }
+    gmac_dma_set_state(gmac, NPCM_DMA_STATUS_RX_PROCESS_STATE_SHIFT,
+        NPCM_DMA_STATUS_RX_RUNNING_CLOSING_STATE);
+
+    rx_desc.rdes0 |= RX_DESC_RDES0_LAST_DESC_MASK;
+    if (!(rx_desc.rdes1 & RX_DESC_RDES1_DIS_INTR_COMP_MASK)) {
+        gmac->regs[R_NPCM_DMA_STATUS] |= NPCM_DMA_STATUS_RI;
+        gmac_update_irq(gmac);
+    }
+    trace_npcm_gmac_debug_desc_data(DEVICE(gmac)->canonical_path, &rx_desc,
+                                    rx_desc.rdes0, rx_desc.rdes1, rx_desc.rdes2,
+                                    rx_desc.rdes3);
+
+    /* step 8 */
+    gmac->regs[R_NPCM_DMA_CONTROL] |= NPCM_DMA_CONTROL_FLUSH_MASK;
+
+    /* step 9 */
+    trace_npcm_gmac_packet_received(DEVICE(gmac)->canonical_path, left_frame);
+    gmac_dma_set_state(gmac, NPCM_DMA_STATUS_RX_PROCESS_STATE_SHIFT,
+        NPCM_DMA_STATUS_RX_RUNNING_WAITING_STATE);
+    gmac_write_rx_desc(desc_addr, &rx_desc);
+
+    /* Get next descriptor address (chained or sequential) */
+    if (rx_desc.rdes1 & RX_DESC_RDES1_RC_END_RING_MASK) {
+        desc_addr = gmac->regs[R_NPCM_DMA_RX_BASE_ADDR];
+    } else if (rx_desc.rdes1 & RX_DESC_RDES1_SEC_ADDR_CHND_MASK) {
+        desc_addr = rx_desc.rdes3;
+    } else {
+        desc_addr += sizeof(rx_desc);
+    }
+    gmac->regs[R_NPCM_DMA_HOST_RX_DESC] = desc_addr;
+    return len;
+}
+
 static void gmac_cleanup(NetClientState *nc)
 {
     /* Nothing to do yet. */
@@ -306,6 +567,7 @@ static void npcm_gmac_write(void *opaque, hwaddr offset,
         break;
 
     case A_NPCM_GMAC_MAC_CONFIG:
+        gmac->regs[offset / sizeof(uint32_t)] = v;
         break;
 
     case A_NPCM_GMAC_MII_ADDR:
@@ -347,6 +609,8 @@ static void npcm_gmac_write(void *opaque, hwaddr offset,
 
     case A_NPCM_DMA_RCV_POLL_DEMAND:
         /* We dont actually care about the value */
+        gmac_dma_set_state(gmac, NPCM_DMA_STATUS_RX_PROCESS_STATE_SHIFT,
+            NPCM_DMA_STATUS_RX_RUNNING_WAITING_STATE);
         break;
 
     case A_NPCM_DMA_STATUS:
@@ -357,6 +621,14 @@ static void npcm_gmac_write(void *opaque, hwaddr offset,
                            HWADDR_PRIx ", value: 0x%04" PRIx64 "\n",
                            DEVICE(gmac)->canonical_path, offset, v);
         }
+        /* for W1C bits, implement W1C */
+        gmac->regs[offset / sizeof(uint32_t)] &= ~NPCM_DMA_STATUS_W1C_MASK(v);
+        if (v & NPCM_DMA_STATUS_RU) {
+            /* Clearing RU bit indicates descriptor is owned by DMA again. */
+            gmac_dma_set_state(gmac, NPCM_DMA_STATUS_RX_PROCESS_STATE_SHIFT,
+                NPCM_DMA_STATUS_RX_RUNNING_WAITING_STATE);
+            qemu_flush_queued_packets(qemu_get_queue(gmac->nic));
+        }
         break;
 
     default:
diff --git a/hw/net/trace-events b/hw/net/trace-events
index 56057de47f..f91b1a4a3d 100644
--- a/hw/net/trace-events
+++ b/hw/net/trace-events
@@ -474,6 +474,11 @@ npcm_gmac_mdio_access(const char *name, uint8_t is_write, uint8_t pa, uint8_t gr
 npcm_gmac_reset(const char *name, uint16_t value) "%s: phy_regs[0][1]: 0x%04" PRIx16
 npcm_gmac_set_link(bool active) "Set link: active=%u"
 npcm_gmac_update_irq(const char *name, uint32_t status, uint32_t intr_en, int level) "%s: Status Reg: 0x%04" PRIX32 " Interrupt Enable Reg: 0x%04" PRIX32 " IRQ Set: %d"
+npcm_gmac_packet_desc_read(const char* name, uint32_t desc_addr) "%s: attempting to read descriptor @0x%04" PRIX32
+npcm_gmac_packet_receive(const char* name, uint32_t len) "%s: RX packet length: 0x%04" PRIX32
+npcm_gmac_packet_receiving_buffer(const char* name, uint32_t buf_len, uint32_t rx_buf_addr) "%s: Receiving into Buffer size: 0x%04" PRIX32 " at address 0x%04" PRIX32
+npcm_gmac_packet_received(const char* name, uint32_t len) "%s: Reception finished, packet left: 0x%04" PRIX32
+npcm_gmac_debug_desc_data(const char* name, void* addr, uint32_t des0, uint32_t des1, uint32_t des2, uint32_t des3)"%s: Address: %p Descriptor 0: 0x%04" PRIX32 " Descriptor 1: 0x%04" PRIX32 "Descriptor 2: 0x%04" PRIX32 " Descriptor 3: 0x%04" PRIX32
 
 # npcm_pcs.c
 npcm_pcs_reg_read(const char *name, uint16_t indirect_access_baes, uint64_t offset, uint16_t value) "%s: IND: 0x%02" PRIx16 " offset: 0x%04" PRIx64 " value: 0x%04" PRIx16
-- 
2.43.0.429.g432eaa2c6b-goog

