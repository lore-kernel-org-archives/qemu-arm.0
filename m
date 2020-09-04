Received: by 2002:a0c:f381:0:0:0:0:0 with SMTP id i1csp2335757qvk;
        Fri, 4 Sep 2020 08:51:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzUIaNSOfyPgVgkaiwPA+JhOIh4+5NAgi/nUKQp+c6n8zn7ShODI7blqc2FKtlJg3Oh3l9G
X-Received: by 2002:a25:6808:: with SMTP id d8mr11067963ybc.265.1599234675368;
        Fri, 04 Sep 2020 08:51:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1599234675; cv=none;
        d=google.com; s=arc-20160816;
        b=WoOL+QURdKNduGJemq3URcQqQ4FUPWgKEov25gRfLzNQYbSPgxpUvQXMqJ/OMdOqN7
         YSE6YSMPVBgtbMAZNfkF3lJnT6g/1qLUK+DiP6GDYyPqKJYLArpYUXQs+4G/nZaHRJAj
         k5BMQBGgA/Szjh2V3+7HuflTwkiTqlrUerChrfF958UEsawEyPRllKz1u2wF8Z0Br/vB
         v7GgV5mJqOjotc4sVie1EllYnrxNmMknPuZ6wmJziBFkYVlrqYNGXqC6VGVdtSTh7veU
         BdozeC0+JYlQKwOqGm1QYNB4IZkA5GEm+92Zdb6g/KJgdBi1z8uMgGqdi3klMUmpxTra
         /C6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=khXKkenFR9AvnwP6J9ds27+FZ+t2ROKiLWrXDiG4RrQ=;
        b=hLf9V87k1DQYiagc+/kVmlGVSaNpJcZ6aNLpNf6IcIjK5Oj8+cZ/CofQTaA0OMTfQO
         3dFQzVvYNcO5ty8Pr0bW5gAnRTVZ8HwlYWgz67T35neEVaN5hdzfl4M2lyw+nMPcGQzD
         2WLlt/NeQ0YQ+LK/qImpBE5RE5D74w6uJlOmpi2IKycsT3bgtiqpKzmMJAVyaLMVsjFa
         /prNu18Hcbz0/xls7SJWn8dhsUHxT3HfT8+NRwCfmdzVF2bYyuKpCOiFlfIuuA8rBKyr
         4EsGnGvB+JV4kn9kXWZCDe4iYYedEAgZ0HYN3TFUPzCi1x0S5BSMju933v+RyHpeDoKb
         kr0g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k5si6263356ybd.21.2020.09.04.08.51.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 04 Sep 2020 08:51:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:36630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kEDze-0003EJ-RJ
	for alex.bennee@linaro.org; Fri, 04 Sep 2020 11:51:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56024)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kEDuT-0002G3-9L
 for qemu-arm@nongnu.org; Fri, 04 Sep 2020 11:45:54 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:37812
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kEDuQ-0007kw-9U
 for qemu-arm@nongnu.org; Fri, 04 Sep 2020 11:45:53 -0400
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-157-GeJcoORHPGqPE_7LibDzdg-1; Fri, 04 Sep 2020 11:45:46 -0400
X-MC-Unique: GeJcoORHPGqPE_7LibDzdg-1
Received: by mail-wm1-f70.google.com with SMTP id a5so1839363wmj.5
 for <qemu-arm@nongnu.org>; Fri, 04 Sep 2020 08:45:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=khXKkenFR9AvnwP6J9ds27+FZ+t2ROKiLWrXDiG4RrQ=;
 b=VaQ3ylzjzMVex3bwKGIKCT+1O8MQypJEnu95lFPe/lgEcPB76LZhuVCEQhO2HlC+um
 WAvklBGCfNPCpZ0kvTVs3L3w73cHR5/cumGugutQNq6vXO+iu7JNWF1P18LZ2JddiWRy
 13mPLvXe8nrZgU8Z2sVAzZQDoStVxbYWwjQmuz8gFQFZMvVh8xSTyNdMfj8aLFeLXUs+
 GFsA7WQ2XKE9edlVWDNbS0fwZ7X3u5QveHIuyaMHy5XH7tDtYppOUOwNOZn5rZewlcpM
 xFpX1nqsL02WjASkxF59FR6z3gP0u6bgMKdArBqpM4l65dq0tGOK3lZXmxTMTAgG0XP9
 uMHQ==
X-Gm-Message-State: AOAM533UYpZb3Uw9KXNsrLRm23LXmkKivw6HnuAt9ThZSiVaIoUqkzmT
 5/E7Q3cXHYMUoFhOg15a5XGn5OlAD55TscvcfWsWgVPyA3r0iOWwO0kcOOp+j+dxT5Ioq0edvzZ
 mAY4jDLmoyJ3G
X-Received: by 2002:a5d:610d:: with SMTP id v13mr7905722wrt.23.1599234344805; 
 Fri, 04 Sep 2020 08:45:44 -0700 (PDT)
X-Received: by 2002:a5d:610d:: with SMTP id v13mr7905691wrt.23.1599234344545; 
 Fri, 04 Sep 2020 08:45:44 -0700 (PDT)
Received: from localhost.localdomain (50.red-83-52-54.dynamicip.rima-tde.net.
 [83.52.54.50])
 by smtp.gmail.com with ESMTPSA id a127sm12108386wmh.34.2020.09.04.08.45.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Sep 2020 08:45:43 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH 11/13] dma: Let dma_memory_rw() take MemTxAttrs argument
Date: Fri,  4 Sep 2020 17:44:37 +0200
Message-Id: <20200904154439.643272-12-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200904154439.643272-1-philmd@redhat.com>
References: <20200904154439.643272-1-philmd@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/04 03:57:33
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
X-TUID: NvaoByt+EfZA

Let devices specify transaction attributes when calling
dma_memory_rw().

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 include/hw/pci/pci.h |  3 ++-
 include/sysemu/dma.h | 11 ++++++-----
 dma-helpers.c        |  3 ++-
 hw/intc/spapr_xive.c |  3 ++-
 hw/usb/hcd-ohci.c    | 10 ++++++----
 5 files changed, 18 insertions(+), 12 deletions(-)

diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
index 896cef9ad47..0c3217e019c 100644
--- a/include/hw/pci/pci.h
+++ b/include/hw/pci/pci.h
@@ -788,7 +788,8 @@ static inline AddressSpace *pci_get_address_space(PCIDevice *dev)
 static inline int pci_dma_rw(PCIDevice *dev, dma_addr_t addr,
                              void *buf, dma_addr_t len, DMADirection dir)
 {
-    return dma_memory_rw(pci_get_address_space(dev), addr, buf, len, dir);
+    return dma_memory_rw(pci_get_address_space(dev), addr, buf, len,
+                         dir, MEMTXATTRS_UNSPECIFIED);
 }
 
 static inline int pci_dma_read(PCIDevice *dev, dma_addr_t addr,
diff --git a/include/sysemu/dma.h b/include/sysemu/dma.h
index 59331ec0bd3..0695d430119 100644
--- a/include/sysemu/dma.h
+++ b/include/sysemu/dma.h
@@ -121,15 +121,15 @@ static inline MemTxResult dma_memory_write_relaxed(AddressSpace *as,
  * @buf: buffer with the data transferred
  * @len: the number of bytes to read or write
  * @dir: indicates the transfer direction
+ * @attrs: memory transaction attributes
  */
 static inline MemTxResult dma_memory_rw(AddressSpace *as, dma_addr_t addr,
                                         void *buf, dma_addr_t len,
-                                        DMADirection dir)
+                                        DMADirection dir, MemTxAttrs attrs)
 {
     dma_barrier(as, dir);
 
-    return dma_memory_rw_relaxed(as, addr, buf, len, dir,
-                                 MEMTXATTRS_UNSPECIFIED);
+    return dma_memory_rw_relaxed(as, addr, buf, len, dir, attrs);
 }
 
 /**
@@ -147,7 +147,8 @@ static inline MemTxResult dma_memory_rw(AddressSpace *as, dma_addr_t addr,
 static inline MemTxResult dma_memory_read(AddressSpace *as, dma_addr_t addr,
                                           void *buf, dma_addr_t len)
 {
-    return dma_memory_rw(as, addr, buf, len, DMA_DIRECTION_TO_DEVICE);
+    return dma_memory_rw(as, addr, buf, len,
+                         DMA_DIRECTION_TO_DEVICE, MEMTXATTRS_UNSPECIFIED);
 }
 
 /**
@@ -166,7 +167,7 @@ static inline MemTxResult dma_memory_write(AddressSpace *as, dma_addr_t addr,
                                            const void *buf, dma_addr_t len)
 {
     return dma_memory_rw(as, addr, (void *)buf, len,
-                         DMA_DIRECTION_FROM_DEVICE);
+                         DMA_DIRECTION_FROM_DEVICE, MEMTXATTRS_UNSPECIFIED);
 }
 
 /**
diff --git a/dma-helpers.c b/dma-helpers.c
index 6a9735386dc..6c3b2200f16 100644
--- a/dma-helpers.c
+++ b/dma-helpers.c
@@ -305,7 +305,8 @@ static uint64_t dma_buf_rw(uint8_t *ptr, int32_t len, QEMUSGList *sg,
     while (len > 0) {
         ScatterGatherEntry entry = sg->sg[sg_cur_index++];
         int32_t xfer = MIN(len, entry.len);
-        dma_memory_rw(sg->as, entry.base, ptr, xfer, dir);
+        dma_memory_rw(sg->as, entry.base, ptr, xfer, dir,
+                      MEMTXATTRS_UNSPECIFIED);
         ptr += xfer;
         len -= xfer;
         resid -= xfer;
diff --git a/hw/intc/spapr_xive.c b/hw/intc/spapr_xive.c
index 4bd0d606ba1..dbf73a8bf47 100644
--- a/hw/intc/spapr_xive.c
+++ b/hw/intc/spapr_xive.c
@@ -1666,7 +1666,8 @@ static target_ulong h_int_esb(PowerPCCPU *cpu,
         mmio_addr = xive->vc_base + xive_source_esb_mgmt(xsrc, lisn) + offset;
 
         if (dma_memory_rw(&address_space_memory, mmio_addr, &data, 8,
-                          (flags & SPAPR_XIVE_ESB_STORE))) {
+                          (flags & SPAPR_XIVE_ESB_STORE),
+                          MEMTXATTRS_UNSPECIFIED)) {
             qemu_log_mask(LOG_GUEST_ERROR, "XIVE: failed to access ESB @0x%"
                           HWADDR_PRIx "\n", mmio_addr);
             return H_HARDWARE;
diff --git a/hw/usb/hcd-ohci.c b/hw/usb/hcd-ohci.c
index 1e6e85e86a8..bac1adf439c 100644
--- a/hw/usb/hcd-ohci.c
+++ b/hw/usb/hcd-ohci.c
@@ -586,7 +586,8 @@ static int ohci_copy_td(OHCIState *ohci, struct ohci_td *td,
     if (n > len)
         n = len;
 
-    if (dma_memory_rw(ohci->as, ptr + ohci->localmem_base, buf, n, dir)) {
+    if (dma_memory_rw(ohci->as, ptr + ohci->localmem_base, buf,
+                      n, dir, MEMTXATTRS_UNSPECIFIED)) {
         return -1;
     }
     if (n == len) {
@@ -595,7 +596,7 @@ static int ohci_copy_td(OHCIState *ohci, struct ohci_td *td,
     ptr = td->be & ~0xfffu;
     buf += n;
     if (dma_memory_rw(ohci->as, ptr + ohci->localmem_base, buf,
-                      len - n, dir)) {
+                      len - n, dir, MEMTXATTRS_UNSPECIFIED)) {
         return -1;
     }
     return 0;
@@ -613,7 +614,8 @@ static int ohci_copy_iso_td(OHCIState *ohci,
     if (n > len)
         n = len;
 
-    if (dma_memory_rw(ohci->as, ptr + ohci->localmem_base, buf, n, dir)) {
+    if (dma_memory_rw(ohci->as, ptr + ohci->localmem_base, buf,
+                      n, dir, MEMTXATTRS_UNSPECIFIED)) {
         return -1;
     }
     if (n == len) {
@@ -622,7 +624,7 @@ static int ohci_copy_iso_td(OHCIState *ohci,
     ptr = end_addr & ~0xfffu;
     buf += n;
     if (dma_memory_rw(ohci->as, ptr + ohci->localmem_base, buf,
-                      len - n, dir)) {
+                      len - n, dir, MEMTXATTRS_UNSPECIFIED)) {
         return -1;
     }
     return 0;
-- 
2.26.2

