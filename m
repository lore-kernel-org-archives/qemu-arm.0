Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EF4DECD999
	for <qemu-arm@archiver.kernel.org>; Thu,  5 Feb 2026 20:01:35 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vo5V6-0006XB-R2; Thu, 05 Feb 2026 14:58:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruslichenko.r@gmail.com>)
 id 1vo5V6-0006Wt-2O
 for qemu-arm@nongnu.org; Thu, 05 Feb 2026 14:58:52 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ruslichenko.r@gmail.com>)
 id 1vo5V3-000322-Q7
 for qemu-arm@nongnu.org; Thu, 05 Feb 2026 14:58:51 -0500
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-435f177a8f7so1401030f8f.1
 for <qemu-arm@nongnu.org>; Thu, 05 Feb 2026 11:58:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770321528; x=1770926328; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=d3V9JSkg1WfwLiLRtCGWm57UuYE5ACJQoo8jfnurwO4=;
 b=ZvmVN64n4x4f73LM9K6Y0SSV1xT1NlXQPajMAy2x/g9moRh6b959IOO8y7JZSApPaU
 bgI7dMsX63oBi2f/INNWWJl1YR3jX3ZKJjSDJaeFMwbVafs9Y8XoOE9VhReS5dAt5nnE
 aMeDR2i2AM+9pwVcqzEBPYRKT1BHdHls3+2Zafb7WmUUIhoYqP25b04wwDGOcwdhktUU
 KAQc6oHpcqMTOlw6SjnH9hXkD+6eccIOZt11qxAPUUdrg1LI6lI3lZGAOHDfCRqqzFW5
 +r/2Mu4Wm/qa8Kqx2GE0iNEnF7PB0mh8/VWdQMrHc4dIupgcirPC36BlzTd1B3M8LLBb
 dg/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770321528; x=1770926328;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=d3V9JSkg1WfwLiLRtCGWm57UuYE5ACJQoo8jfnurwO4=;
 b=CNezHYSIh15fPYemQIvZlKStp3PyfABkWjMYNEBGEeoDupZ8KvJ/NJCQgVmPLICnHX
 x4V1X+GxPHH+yCUqsWpWBdf6P1P2nP5gmxuDNLK6zAgJhYpT+Sl3Tmk4UkmBEijlpcYc
 9cKPFXVWIpNXu7wP65fS44TUzYq8B4gNqypWr0ea1gErTfdFrWM1szhSAgiwwU7J8VZj
 T+kXwyG4rZbSpDlvOByTw2pKMM9nxrOr0CYLCIbyJpMUxATVL0p8W/2c8Du62voWOtg9
 K8MAIOG0OVqc7EY7nRg+ZWAdoYy2Fs7sLRq0OdEvZyd7opP5WugWaOkx/7IB1ab3FczX
 rQOw==
X-Gm-Message-State: AOJu0YyPzsab2z9fmcVh7fVFFfypojlEv4jwTBKL8CjRM89J87+U0t7u
 euM+u9KqyKmX7QO/E3j5FbaC06pd9cAsjuEIVPmxgpSCUOhD4iES2BCH
X-Gm-Gg: AZuq6aLi3rPxJl8NefW14H8TUHcjLic6Ll4I1iUgcZ2fiRyayEqZoepoves75cj1ziG
 zt2YsqwEfVIawf02UVqE3uaUUn39QUm5ON+crY4Bzl49oqeOTQsqz4t7C8MDktM/3TnzYJOxqlq
 3KkweOfsX2zlV/TgLx2eHILhVT71T9chTdFk5I4989v+wfAw4YDUu0H4noctJDfJj9qh3tufmD5
 1LwKNiGpRDApugtvHiZ3ycKHRyUU5iy7Eiye0qP2oaXYpv1sJGT4B5Av2veGIhOJ8frCqvfuj05
 JgqAYiOzYrDAwjT7ea+9tlfj6kHIkd/1GtUciMug0+2yMHiOmu/H0eBz7daNXLqKZLb/HPNltxR
 YsIQjMXD2/2xfv+s51590wM2StuRS1JSUTClgFqwBOTjImXwvppAwKL/IxiF8ArI8IyUlrsD5oK
 +jTKT0Buj21oGFe6mNurzNX07E1WO/5w==
X-Received: by 2002:a05:6000:1a87:b0:436:233c:c7c0 with SMTP id
 ffacd0b85a97d-43629342249mr764437f8f.26.1770321528158; 
 Thu, 05 Feb 2026 11:58:48 -0800 (PST)
Received: from thinkpad-t470s.. ([93.140.16.93])
 by smtp.googlemail.com with ESMTPSA id
 ffacd0b85a97d-436297450b4sm514079f8f.34.2026.02.05.11.58.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Feb 2026 11:58:47 -0800 (PST)
From: Ruslan Ruslichenko <ruslichenko.r@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, peter.maydell@linaro.org, artem_mygaiev@epam.com,
 volodymyr_babchuk@epam.com, takahiro.nakata.wr@renesas.com,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 francisco.iglesias@amd.com, Ruslan_Ruslichenko@epam.com,
 "Edgar E . Iglesias" <edgar.iglesias@amd.com>
Subject: [PATCH 04/29] hw/core: Implement Remote Port bus access helpers
Date: Thu,  5 Feb 2026 20:57:59 +0100
Message-ID: <20260205195824.2610192-5-ruslichenko.r@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260205195824.2610192-1-ruslichenko.r@gmail.com>
References: <20260205195824.2610192-1-ruslichenko.r@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=ruslichenko.r@gmail.com; helo=mail-wr1-x42a.google.com
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

From: Ruslan Ruslichenko <Ruslan_Ruslichenko@epam.com>

Add bus access logic for Remote Port memory transactions.
The patch add support for read and write commands, which
enables data communication via the protocol.

This includes support for both legacy and extended packet
formats (such as 64-bit Master IDs) based on peer's
capabilities.

Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
Signed-off-by: Takahiro Nakata <takahiro.nakata.wr@renesas.com>
Signed-off-by: Ruslan Ruslichenko <Ruslan_Ruslichenko@epam.com>
---
 hw/core/remote-port-proto.c         | 152 ++++++++++++++++++++++++++++
 include/hw/core/remote-port-proto.h | 133 ++++++++++++++++++++++++
 2 files changed, 285 insertions(+)

diff --git a/hw/core/remote-port-proto.c b/hw/core/remote-port-proto.c
index 969dfc3cb2..33a6769087 100644
--- a/hw/core/remote-port-proto.c
+++ b/hw/core/remote-port-proto.c
@@ -62,6 +62,8 @@ int rp_decode_hdr(struct rp_pkt *pkt)
 int rp_decode_payload(struct rp_pkt *pkt)
 {
     int used = 0;
+    /* Master_id has an odd decoding due to historical reasons.  */
+    uint64_t master_id;
 
     switch (pkt->hdr.cmd) {
     case RP_CMD_hello:
@@ -101,6 +103,34 @@ int rp_decode_payload(struct rp_pkt *pkt)
          */
         used = pkt->hdr.len;
         break;
+    case RP_CMD_write:
+    case RP_CMD_read:
+        assert(pkt->hdr.len >= sizeof pkt->busaccess - sizeof pkt->hdr);
+        pkt->busaccess.timestamp = be64_to_cpu(pkt->busaccess.timestamp);
+        pkt->busaccess.addr = be64_to_cpu(pkt->busaccess.addr);
+        pkt->busaccess.attributes = be64_to_cpu(pkt->busaccess.attributes);
+        pkt->busaccess.len = be32_to_cpu(pkt->busaccess.len);
+        pkt->busaccess.width = be32_to_cpu(pkt->busaccess.width);
+        pkt->busaccess.stream_width = be32_to_cpu(pkt->busaccess.stream_width);
+        master_id = be16_to_cpu(pkt->busaccess.master_id);
+
+        used += sizeof pkt->busaccess - sizeof pkt->hdr;
+
+        if (pkt->busaccess.attributes & RP_BUS_ATTR_EXT_BASE) {
+            struct rp_pkt_busaccess_ext_base *pext = &pkt->busaccess_ext_base;
+
+            assert(pkt->hdr.len >= sizeof *pext - sizeof pkt->hdr);
+            master_id |= (uint64_t)be16_to_cpu(pext->master_id_31_16) << 16;
+            master_id |= (uint64_t)be32_to_cpu(pext->master_id_63_32) << 32;
+            pext->data_offset = be32_to_cpu(pext->data_offset);
+            pext->next_offset = be32_to_cpu(pext->next_offset);
+            pext->byte_enable_offset = be32_to_cpu(pext->byte_enable_offset);
+            pext->byte_enable_len = be32_to_cpu(pext->byte_enable_len);
+
+            used += sizeof *pext - sizeof pkt->busaccess;
+        }
+        pkt->busaccess.master_id = master_id;
+        break;
     default:
         break;
     }
@@ -143,6 +173,127 @@ size_t rp_encode_hello_caps(uint32_t id, uint32_t dev, struct rp_pkt_hello *pkt,
     return sizeof *pkt;
 }
 
+static void rp_encode_busaccess_common(struct rp_pkt_busaccess *pkt,
+                                  int64_t clk, uint16_t master_id,
+                                  uint64_t addr, uint64_t attr, uint32_t size,
+                                  uint32_t width, uint32_t stream_width)
+{
+    pkt->timestamp = cpu_to_be64(clk);
+    pkt->master_id = cpu_to_be16(master_id);
+    pkt->addr = cpu_to_be64(addr);
+    pkt->attributes = cpu_to_be64(attr);
+    pkt->len = cpu_to_be32(size);
+    pkt->width = cpu_to_be32(width);
+    pkt->stream_width = cpu_to_be32(stream_width);
+}
+
+size_t rp_encode_read(uint32_t id, uint32_t dev,
+                      struct rp_pkt_busaccess *pkt,
+                      int64_t clk, uint16_t master_id,
+                      uint64_t addr, uint64_t attr, uint32_t size,
+                      uint32_t width, uint32_t stream_width)
+{
+    rp_encode_hdr(&pkt->hdr, RP_CMD_read, id, dev,
+                  sizeof *pkt - sizeof pkt->hdr, 0);
+    rp_encode_busaccess_common(pkt, clk, master_id, addr, attr,
+                               size, width, stream_width);
+    return sizeof *pkt;
+}
+
+size_t rp_encode_read_resp(uint32_t id, uint32_t dev,
+                           struct rp_pkt_busaccess *pkt,
+                           int64_t clk, uint16_t master_id,
+                           uint64_t addr, uint64_t attr, uint32_t size,
+                           uint32_t width, uint32_t stream_width)
+{
+    rp_encode_hdr(&pkt->hdr, RP_CMD_read, id, dev,
+                  sizeof *pkt - sizeof pkt->hdr + size, RP_PKT_FLAGS_response);
+    rp_encode_busaccess_common(pkt, clk, master_id, addr, attr,
+                               size, width, stream_width);
+    return sizeof *pkt + size;
+}
+
+size_t rp_encode_write(uint32_t id, uint32_t dev,
+                       struct rp_pkt_busaccess *pkt,
+                       int64_t clk, uint16_t master_id,
+                       uint64_t addr, uint64_t attr, uint32_t size,
+                       uint32_t width, uint32_t stream_width)
+{
+    rp_encode_hdr(&pkt->hdr, RP_CMD_write, id, dev,
+                  sizeof *pkt - sizeof pkt->hdr + size, 0);
+    rp_encode_busaccess_common(pkt, clk, master_id, addr, attr,
+                               size, width, stream_width);
+    return sizeof *pkt;
+}
+
+size_t rp_encode_write_resp(uint32_t id, uint32_t dev,
+                       struct rp_pkt_busaccess *pkt,
+                       int64_t clk, uint16_t master_id,
+                       uint64_t addr, uint64_t attr, uint32_t size,
+                       uint32_t width, uint32_t stream_width)
+{
+    rp_encode_hdr(&pkt->hdr, RP_CMD_write, id, dev,
+                  sizeof *pkt - sizeof pkt->hdr, RP_PKT_FLAGS_response);
+    rp_encode_busaccess_common(pkt, clk, master_id, addr, attr,
+                               size, width, stream_width);
+    return sizeof *pkt;
+}
+
+/* New API for extended header.  */
+size_t rp_encode_busaccess(struct rp_peer_state *peer,
+                           struct rp_pkt_busaccess_ext_base *pkt,
+                           struct rp_encode_busaccess_in *in) {
+    struct rp_pkt_busaccess *pkt_v4_0 = (void *) pkt;
+    uint32_t hsize = 0;
+    uint32_t ret_size = 0;
+
+    /* Allocate packet space.  */
+    if (in->cmd == RP_CMD_write && !(in->flags & RP_PKT_FLAGS_response)) {
+        hsize = in->size;
+    }
+    if (in->cmd == RP_CMD_read && (in->flags & RP_PKT_FLAGS_response)) {
+        hsize = in->size;
+        ret_size = in->size;
+    }
+
+    /*
+     * If peer does not support the busaccess base extensions, use the
+     * old layout. For responses, what matters is if we're responding
+     * to a packet with the extensions.
+     */
+    if (!peer->caps.busaccess_ext_base && !(in->attr & RP_BUS_ATTR_EXT_BASE)) {
+        /* Old layout.  */
+        assert(in->master_id < UINT16_MAX);
+
+        rp_encode_hdr(&pkt->hdr, in->cmd, in->id, in->dev,
+                  sizeof *pkt_v4_0 - sizeof pkt->hdr + hsize, in->flags);
+        rp_encode_busaccess_common(pkt_v4_0, in->clk, in->master_id,
+                                   in->addr, in->attr,
+                                   in->size, in->width, in->stream_width);
+        return sizeof *pkt_v4_0 + ret_size;
+    }
+
+    /* Encode the extended fields.  */
+    pkt->master_id_31_16 = cpu_to_be16(in->master_id >> 16);
+    pkt->master_id_63_32 = cpu_to_be32(in->master_id >> 32);
+
+    /* We always put data right after the header.  */
+    pkt->data_offset = cpu_to_be32(sizeof *pkt);
+    pkt->next_offset = 0;
+
+    pkt->byte_enable_offset = cpu_to_be32(sizeof *pkt + hsize);
+    pkt->byte_enable_len = cpu_to_be32(in->byte_enable_len);
+    hsize += in->byte_enable_len;
+
+    rp_encode_hdr(&pkt->hdr, in->cmd, in->id, in->dev,
+                  sizeof *pkt - sizeof pkt->hdr + hsize, in->flags);
+    rp_encode_busaccess_common(pkt_v4_0, in->clk, in->master_id, in->addr,
+                               in->attr | RP_BUS_ATTR_EXT_BASE,
+                               in->size, in->width, in->stream_width);
+
+    return sizeof *pkt + ret_size;
+}
+
 void rp_process_caps(struct rp_peer_state *peer,
                      void *caps, size_t caps_len)
 {
@@ -172,6 +323,7 @@ void rp_process_caps(struct rp_peer_state *peer,
     }
 }
 
+
 void rp_dpkt_alloc(RemotePortDynPkt *dpkt, size_t size)
 {
     if (dpkt->size < size) {
diff --git a/include/hw/core/remote-port-proto.h b/include/hw/core/remote-port-proto.h
index ca1ab2f1d3..f65f82195d 100644
--- a/include/hw/core/remote-port-proto.h
+++ b/include/hw/core/remote-port-proto.h
@@ -350,6 +350,134 @@ rp_encode_hello(uint32_t id, uint32_t dev, struct rp_pkt_hello *pkt,
                                 NULL, NULL, 0);
 }
 
+static inline void *__attribute__ ((deprecated))
+rp_busaccess_dataptr(struct rp_pkt_busaccess *pkt)
+{
+    /* Right after the packet.  */
+    return pkt + 1;
+}
+
+/*
+ * rp_busaccess_rx_dataptr
+ *
+ * Predicts the dataptr for a packet to be transmitted.
+ * This should only be used if you are trying to keep
+ * the entire packet in a linear buffer.
+ */
+static inline unsigned char *
+rp_busaccess_tx_dataptr(struct rp_peer_state *peer,
+                        struct rp_pkt_busaccess_ext_base *pkt)
+{
+    unsigned char *p = (unsigned char *) pkt;
+
+    if (peer->caps.busaccess_ext_base) {
+        /* We always put our data right after the header.  */
+        return p + sizeof *pkt;
+    } else {
+        /* Right after the old packet layout.  */
+        return p + sizeof(struct rp_pkt_busaccess);
+    }
+}
+
+/*
+ * rp_busaccess_rx_dataptr
+ *
+ * Extracts the dataptr from a received packet.
+ */
+static inline unsigned char *
+rp_busaccess_rx_dataptr(struct rp_peer_state *peer,
+                        struct rp_pkt_busaccess_ext_base *pkt)
+{
+    unsigned char *p = (unsigned char *) pkt;
+
+    if (pkt->attributes & RP_BUS_ATTR_EXT_BASE) {
+        return p + pkt->data_offset;
+    } else {
+        /* Right after the old packet layout.  */
+        return p + sizeof(struct rp_pkt_busaccess);
+    }
+}
+
+static inline unsigned char *
+rp_busaccess_byte_en_ptr(struct rp_peer_state *peer,
+                         struct rp_pkt_busaccess_ext_base *pkt)
+{
+    unsigned char *p = (unsigned char *) pkt;
+
+    if ((pkt->attributes & RP_BUS_ATTR_EXT_BASE)
+        && pkt->byte_enable_len) {
+        assert(pkt->byte_enable_offset >= sizeof *pkt);
+        assert(pkt->byte_enable_offset + pkt->byte_enable_len
+               <= pkt->hdr.len + sizeof pkt->hdr);
+        return p + pkt->byte_enable_offset;
+    }
+    return NULL;
+}
+
+size_t __attribute__ ((deprecated))
+rp_encode_read(uint32_t id, uint32_t dev,
+               struct rp_pkt_busaccess *pkt,
+               int64_t clk, uint16_t master_id,
+               uint64_t addr, uint64_t attr, uint32_t size,
+               uint32_t width, uint32_t stream_width);
+
+size_t __attribute__ ((deprecated))
+rp_encode_read_resp(uint32_t id, uint32_t dev,
+                    struct rp_pkt_busaccess *pkt,
+                    int64_t clk, uint16_t master_id,
+                    uint64_t addr, uint64_t attr, uint32_t size,
+                    uint32_t width, uint32_t stream_width);
+
+size_t __attribute__ ((deprecated))
+rp_encode_write(uint32_t id, uint32_t dev,
+                struct rp_pkt_busaccess *pkt,
+                int64_t clk, uint16_t master_id,
+                uint64_t addr, uint64_t attr, uint32_t size,
+                uint32_t width, uint32_t stream_width);
+
+size_t __attribute__ ((deprecated))
+rp_encode_write_resp(uint32_t id, uint32_t dev,
+                     struct rp_pkt_busaccess *pkt,
+                     int64_t clk, uint16_t master_id,
+                     uint64_t addr, uint64_t attr, uint32_t size,
+                     uint32_t width, uint32_t stream_width);
+
+struct rp_encode_busaccess_in {
+    uint32_t cmd;
+    uint32_t id;
+    uint32_t flags;
+    uint32_t dev;
+    int64_t clk;
+    uint64_t master_id;
+    uint64_t addr;
+    uint64_t attr;
+    uint32_t size;
+    uint32_t width;
+    uint32_t stream_width;
+    uint32_t byte_enable_len;
+};
+
+/* Prepare encode_busaccess input parameters for a packet response.  */
+static inline void
+rp_encode_busaccess_in_rsp_init(struct rp_encode_busaccess_in *in,
+                                struct rp_pkt *pkt) {
+    memset(in, 0, sizeof *in);
+    in->cmd = pkt->hdr.cmd;
+    in->id = pkt->hdr.id;
+    in->flags = pkt->hdr.flags | RP_PKT_FLAGS_response;
+    in->dev = pkt->hdr.dev;
+    /* FIXME: Propagate all master_id fields?  */
+    in->master_id = pkt->busaccess.master_id;
+    in->addr = pkt->busaccess.addr;
+    in->size = pkt->busaccess.len;
+    in->width = pkt->busaccess.width;
+    in->stream_width = pkt->busaccess.stream_width;
+    in->byte_enable_len = 0;
+}
+size_t rp_encode_busaccess(struct rp_peer_state *peer,
+                           struct rp_pkt_busaccess_ext_base *pkt,
+                           struct rp_encode_busaccess_in *in);
+
 void rp_process_caps(struct rp_peer_state *peer,
                      void *caps, size_t caps_len);
 
@@ -382,4 +510,9 @@ void rp_dpkt_invalidate(RemotePortDynPkt *dpkt);
 
 void rp_dpkt_free(RemotePortDynPkt *dpkt);
 
+static inline int rp_get_busaccess_response(struct rp_pkt *pkt)
+{
+    return (pkt->busaccess_ext_base.attributes & RP_BUS_RESP_MASK) >>
+                                                            RP_BUS_RESP_SHIFT;
+}
 #endif
-- 
2.43.0


