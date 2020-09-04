Received: by 2002:a0c:f381:0:0:0:0:0 with SMTP id i1csp2336133qvk;
        Fri, 4 Sep 2020 08:51:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxVwth+lJUtD18eyV0c8G6zdZF68n0sLeUwL2rP2g/fUFrLm7Qu/zM9WhImN82H9lnvDZhf
X-Received: by 2002:a25:ced2:: with SMTP id x201mr11380195ybe.137.1599234704179;
        Fri, 04 Sep 2020 08:51:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1599234704; cv=none;
        d=google.com; s=arc-20160816;
        b=eoLrR+6VmIERTGNlD3gRwvdaezqUuDnBGA4mnX0XuY0PkyUEBf8mU0C2Ob8UL0eXSE
         P4co6HgCiOG5zQUqiJ08Dpu4s2T+daBWeo6z6ukEJgwU8IQQYVynBy6QX6tgN7aK19pT
         02KpFbZ2RWL6Tx05IME8nvKLxmB/IepMXbCh/FV5lpBne+52fua4MD2EIoBwao1o3eJA
         mnPN7GFcadPd05/tdjL45qN0NKJoippTvdba1psP6n3Gz/c4by0D0sTguidHjzVslcFY
         zkTS7BSC3BFjo3s3bNfq6BzWHccMlueKhGXlLwh3Rpm2Y2+Hg2CUosr5/YR2W+UpTVzc
         ViVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=/a/Z9w+Xg03zgl0GWIeP84t4ZkpMkDDsK/6zyzxs+s0=;
        b=Wk39LOzwDYB4EpV7m6SiHBBLElUx+Z3oFurRm21yAgjijKpfMzkFo47gpTvobGM6GZ
         T5eGrjG9tQvZqMnE495+f3LrGNumMkMM6vPLfbfQVMb6rPBbQ4mNcZLYc7bfRfLRvNG/
         DUgZviDhL6ZCTahKa+iH+7ZSD3AUrR3pzHYG4+rbJ4cs0QT9AMa4Ak+TsDC2mOb6Ool+
         EfcSzU8xC1oNgrTapvWG9LFxKerYg4/GqFUCfvEvihm2kd0YeEL63a/8RlFGCNGzAX8e
         GEvTUq8GDf10z3M3enawfyXcMQN78EaF7SLN29tTLcwd3w9IIMSbAycBHDGEP/syK1Zf
         yIZw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x13si5926931ybk.490.2020.09.04.08.51.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 04 Sep 2020 08:51:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:39036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kEE07-0004C2-L9
	for alex.bennee@linaro.org; Fri, 04 Sep 2020 11:51:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56128)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kEDuc-0002Nt-4i
 for qemu-arm@nongnu.org; Fri, 04 Sep 2020 11:46:02 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:35925
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kEDua-0007rh-5e
 for qemu-arm@nongnu.org; Fri, 04 Sep 2020 11:46:01 -0400
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-205-8D4XEHPhP8CaO26PQU6xEA-1; Fri, 04 Sep 2020 11:45:58 -0400
X-MC-Unique: 8D4XEHPhP8CaO26PQU6xEA-1
Received: by mail-wm1-f72.google.com with SMTP id d5so1847557wmb.2
 for <qemu-arm@nongnu.org>; Fri, 04 Sep 2020 08:45:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/a/Z9w+Xg03zgl0GWIeP84t4ZkpMkDDsK/6zyzxs+s0=;
 b=JUuleAftPe58FlSKeGjCxWLsBPkjKSG3PwkH7T6WWr5yS9arRgRQXmYLM5P7flYBrb
 OsnAVLnGAHsy5EF4B2IcK41n1pHIYZTY3cOceLYoJMAstolVRdfJzpSkm84JqUO2fn5x
 uwjW7VwW4mNboxwTKcjz/9iwaDiLgB1ocrgz5ZtSwr+aSizQ8zG5nYicrHslY8oNZfkZ
 6v5JKn8KXxT+hnNejfYX4FZf0aTz5o125xmHMxnnXdtNJ5joHPUYYwacsAfMGD/ZdOGR
 dQPb/QdRTSRwI4h2mLObe20KqhuvptjO6J4ysNzM6gsJslpPCBabKeqznCClaiC+Vu+2
 rVwQ==
X-Gm-Message-State: AOAM5319l42upTlnQMj/eTwuEhqGWR5OYCjGPtg88JrAbIrLTK3mIj4t
 pflm/0mc9Nt/doMWPgtv1W9kL3w+FgYwWQo9qV5BoIsi9wW36QyNGOl8ndgp/VhPpK8Zkf7WEkb
 oLcQtbJXKziM+
X-Received: by 2002:adf:cc8c:: with SMTP id p12mr8625251wrj.92.1599234356871; 
 Fri, 04 Sep 2020 08:45:56 -0700 (PDT)
X-Received: by 2002:adf:cc8c:: with SMTP id p12mr8625224wrj.92.1599234356604; 
 Fri, 04 Sep 2020 08:45:56 -0700 (PDT)
Received: from localhost.localdomain (50.red-83-52-54.dynamicip.rima-tde.net.
 [83.52.54.50])
 by smtp.gmail.com with ESMTPSA id y1sm11646185wma.36.2020.09.04.08.45.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Sep 2020 08:45:55 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH 13/13] dma: Let dma_memory_map() take MemTxAttrs argument
Date: Fri,  4 Sep 2020 17:44:39 +0200
Message-Id: <20200904154439.643272-14-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200904154439.643272-1-philmd@redhat.com>
References: <20200904154439.643272-1-philmd@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=philmd@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/04 03:58:24
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, Peter Xu <peterx@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, qemu-block@nongnu.org,
 Joel Stanley <joel@jms.id.au>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 Beniamino Galvani <b.galvani@gmail.com>, Eric Auger <eric.auger@redhat.com>,
 qemu-arm@nongnu.org, Jan Kiszka <jan.kiszka@web.de>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 John Snow <jsnow@redhat.com>, Richard Henderson <rth@twiddle.net>,
 Andrew Jeffery <andrew@aj.id.au>, Laszlo Ersek <lersek@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>, qemu-ppc@nongnu.org,
 Peter Chubb <peter.chubb@nicta.com.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: lVguKJErMfTK

Let devices specify transaction attributes when calling
dma_memory_map().

Patch created mechanically using spatch with this script:

  @@
  expression E1, E2, E3, E4;
  @@
  - dma_memory_map(E1, E2, E3, E4)
  + dma_memory_map(E1, E2, E3, E4, MEMTXATTRS_UNSPECIFIED)

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 include/hw/pci/pci.h    | 3 ++-
 include/sysemu/dma.h    | 5 +++--
 dma-helpers.c           | 3 ++-
 hw/display/virtio-gpu.c | 8 ++++++--
 hw/hyperv/vmbus.c       | 8 +++++---
 hw/ide/ahci.c           | 9 ++++++---
 hw/usb/libhw.c          | 3 ++-
 hw/virtio/virtio.c      | 6 ++++--
 8 files changed, 30 insertions(+), 15 deletions(-)

diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
index 0c3217e019c..a221dfb3b08 100644
--- a/include/hw/pci/pci.h
+++ b/include/hw/pci/pci.h
@@ -831,7 +831,8 @@ static inline void *pci_dma_map(PCIDevice *dev, dma_addr_t addr,
 {
     void *buf;
 
-    buf = dma_memory_map(pci_get_address_space(dev), addr, plen, dir);
+    buf = dma_memory_map(pci_get_address_space(dev), addr, plen, dir,
+                         MEMTXATTRS_UNSPECIFIED);
     return buf;
 }
 
diff --git a/include/sysemu/dma.h b/include/sysemu/dma.h
index b9cb9c8944b..bb8b0a059f5 100644
--- a/include/sysemu/dma.h
+++ b/include/sysemu/dma.h
@@ -203,16 +203,17 @@ MemTxResult dma_memory_set(AddressSpace *as, dma_addr_t addr,
  * @addr: address within that address space
  * @len: pointer to length of buffer; updated on return
  * @dir: indicates the transfer direction
+ * @attrs: memory attributes
  */
 static inline void *dma_memory_map(AddressSpace *as,
                                    dma_addr_t addr, dma_addr_t *len,
-                                   DMADirection dir)
+                                   DMADirection dir, MemTxAttrs attrs)
 {
     hwaddr xlen = *len;
     void *p;
 
     p = address_space_map(as, addr, &xlen, dir == DMA_DIRECTION_FROM_DEVICE,
-                          MEMTXATTRS_UNSPECIFIED);
+                          attrs);
     *len = xlen;
     return p;
 }
diff --git a/dma-helpers.c b/dma-helpers.c
index 6c3b2200f16..0507a6f95b9 100644
--- a/dma-helpers.c
+++ b/dma-helpers.c
@@ -143,7 +143,8 @@ static void dma_blk_cb(void *opaque, int ret)
     while (dbs->sg_cur_index < dbs->sg->nsg) {
         cur_addr = dbs->sg->sg[dbs->sg_cur_index].base + dbs->sg_cur_byte;
         cur_len = dbs->sg->sg[dbs->sg_cur_index].len - dbs->sg_cur_byte;
-        mem = dma_memory_map(dbs->sg->as, cur_addr, &cur_len, dbs->dir);
+        mem = dma_memory_map(dbs->sg->as, cur_addr, &cur_len, dbs->dir,
+                             MEMTXATTRS_UNSPECIFIED);
         /*
          * Make reads deterministic in icount mode. Windows sometimes issues
          * disk read requests with overlapping SGs. It leads
diff --git a/hw/display/virtio-gpu.c b/hw/display/virtio-gpu.c
index 5f0dd7c1500..be7f5cdee46 100644
--- a/hw/display/virtio-gpu.c
+++ b/hw/display/virtio-gpu.c
@@ -648,7 +648,9 @@ int virtio_gpu_create_mapping_iov(VirtIOGPU *g,
         hwaddr len = l;
         (*iov)[i].iov_len = l;
         (*iov)[i].iov_base = dma_memory_map(VIRTIO_DEVICE(g)->dma_as,
-                                            a, &len, DMA_DIRECTION_TO_DEVICE);
+                                            a, &len,
+                                            DMA_DIRECTION_TO_DEVICE,
+                                            MEMTXATTRS_UNSPECIFIED);
         if (addr) {
             (*addr)[i] = a;
         }
@@ -1049,7 +1051,9 @@ static int virtio_gpu_load(QEMUFile *f, void *opaque, size_t size,
             hwaddr len = res->iov[i].iov_len;
             res->iov[i].iov_base =
                 dma_memory_map(VIRTIO_DEVICE(g)->dma_as,
-                               res->addrs[i], &len, DMA_DIRECTION_TO_DEVICE);
+                               res->addrs[i], &len,
+                               DMA_DIRECTION_TO_DEVICE,
+                               MEMTXATTRS_UNSPECIFIED);
 
             if (!res->iov[i].iov_base || len != res->iov[i].iov_len) {
                 /* Clean up the half-a-mapping we just created... */
diff --git a/hw/hyperv/vmbus.c b/hw/hyperv/vmbus.c
index 75af6b83dde..56621d72e5b 100644
--- a/hw/hyperv/vmbus.c
+++ b/hw/hyperv/vmbus.c
@@ -372,7 +372,8 @@ static ssize_t gpadl_iter_io(GpadlIter *iter, void *buf, uint32_t len)
 
             maddr = (iter->gpadl->gfns[idx] << TARGET_PAGE_BITS) | off_in_page;
 
-            iter->map = dma_memory_map(iter->as, maddr, &mlen, iter->dir);
+            iter->map = dma_memory_map(iter->as, maddr, &mlen, iter->dir,
+                                       MEMTXATTRS_UNSPECIFIED);
             if (mlen != pgleft) {
                 dma_memory_unmap(iter->as, iter->map, mlen, iter->dir, 0);
                 iter->map = NULL;
@@ -488,7 +489,8 @@ int vmbus_map_sgl(VMBusChanReq *req, DMADirection dir, struct iovec *iov,
                 goto err;
             }
 
-            iov[ret_cnt].iov_base = dma_memory_map(sgl->as, a, &l, dir);
+            iov[ret_cnt].iov_base = dma_memory_map(sgl->as, a, &l, dir,
+                                                   MEMTXATTRS_UNSPECIFIED);
             if (!l) {
                 ret = -EFAULT;
                 goto err;
@@ -564,7 +566,7 @@ static vmbus_ring_buffer *ringbuf_map_hdr(VMBusRingBufCommon *ringbuf)
     dma_addr_t mlen = sizeof(*rb);
 
     rb = dma_memory_map(ringbuf->as, ringbuf->rb_addr, &mlen,
-                        DMA_DIRECTION_FROM_DEVICE);
+                        DMA_DIRECTION_FROM_DEVICE, MEMTXATTRS_UNSPECIFIED);
     if (mlen != sizeof(*rb)) {
         dma_memory_unmap(ringbuf->as, rb, mlen,
                          DMA_DIRECTION_FROM_DEVICE, 0);
diff --git a/hw/ide/ahci.c b/hw/ide/ahci.c
index b696c6291a3..fe1a4e2b1a2 100644
--- a/hw/ide/ahci.c
+++ b/hw/ide/ahci.c
@@ -249,7 +249,8 @@ static void map_page(AddressSpace *as, uint8_t **ptr, uint64_t addr,
         dma_memory_unmap(as, *ptr, len, DMA_DIRECTION_FROM_DEVICE, len);
     }
 
-    *ptr = dma_memory_map(as, addr, &len, DMA_DIRECTION_FROM_DEVICE);
+    *ptr = dma_memory_map(as, addr, &len, DMA_DIRECTION_FROM_DEVICE,
+                          MEMTXATTRS_UNSPECIFIED);
     if (len < wanted) {
         dma_memory_unmap(as, *ptr, len, DMA_DIRECTION_FROM_DEVICE, len);
         *ptr = NULL;
@@ -938,7 +939,8 @@ static int ahci_populate_sglist(AHCIDevice *ad, QEMUSGList *sglist,
 
     /* map PRDT */
     if (!(prdt = dma_memory_map(ad->hba->as, prdt_addr, &prdt_len,
-                                DMA_DIRECTION_TO_DEVICE))){
+                                DMA_DIRECTION_TO_DEVICE,
+                                MEMTXATTRS_UNSPECIFIED))) {
         trace_ahci_populate_sglist_no_map(ad->hba, ad->port_no);
         return -1;
     }
@@ -1299,7 +1301,8 @@ static int handle_cmd(AHCIState *s, int port, uint8_t slot)
     tbl_addr = le64_to_cpu(cmd->tbl_addr);
     cmd_len = 0x80;
     cmd_fis = dma_memory_map(s->as, tbl_addr, &cmd_len,
-                             DMA_DIRECTION_FROM_DEVICE);
+                             DMA_DIRECTION_FROM_DEVICE,
+                             MEMTXATTRS_UNSPECIFIED);
     if (!cmd_fis) {
         trace_handle_cmd_badfis(s, port);
         return -1;
diff --git a/hw/usb/libhw.c b/hw/usb/libhw.c
index 9c33a1640f7..f350eae443d 100644
--- a/hw/usb/libhw.c
+++ b/hw/usb/libhw.c
@@ -36,7 +36,8 @@ int usb_packet_map(USBPacket *p, QEMUSGList *sgl)
 
         while (len) {
             dma_addr_t xlen = len;
-            mem = dma_memory_map(sgl->as, base, &xlen, dir);
+            mem = dma_memory_map(sgl->as, base, &xlen, dir,
+                                 MEMTXATTRS_UNSPECIFIED);
             if (!mem) {
                 goto err;
             }
diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
index e9830252176..c951131ba39 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -1320,7 +1320,8 @@ static bool virtqueue_map_desc(VirtIODevice *vdev, unsigned int *p_num_sg,
         iov[num_sg].iov_base = dma_memory_map(vdev->dma_as, pa, &len,
                                               is_write ?
                                               DMA_DIRECTION_FROM_DEVICE :
-                                              DMA_DIRECTION_TO_DEVICE);
+                                              DMA_DIRECTION_TO_DEVICE,
+                                              MEMTXATTRS_UNSPECIFIED);
         if (!iov[num_sg].iov_base) {
             virtio_error(vdev, "virtio: bogus descriptor or out of resources");
             goto out;
@@ -1369,7 +1370,8 @@ static void virtqueue_map_iovec(VirtIODevice *vdev, struct iovec *sg,
         sg[i].iov_base = dma_memory_map(vdev->dma_as,
                                         addr[i], &len, is_write ?
                                         DMA_DIRECTION_FROM_DEVICE :
-                                        DMA_DIRECTION_TO_DEVICE);
+                                        DMA_DIRECTION_TO_DEVICE,
+                                        MEMTXATTRS_UNSPECIFIED);
         if (!sg[i].iov_base) {
             error_report("virtio: error trying to map MMIO memory");
             exit(1);
-- 
2.26.2

