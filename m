Received: by 10.25.21.156 with SMTP id 28csp1960615lfv;
        Tue, 19 Jul 2016 22:04:01 -0700 (PDT)
X-Received: by 10.66.52.11 with SMTP id p11mr71788553pao.155.1468991029291;
        Tue, 19 Jul 2016 22:03:49 -0700 (PDT)
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id f74si1265911pff.158.2016.07.19.22.03.49;
        Tue, 19 Jul 2016 22:03:49 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@gmail.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
	id S1751397AbcGTFD2 (ORCPT <rfc822;xinliang.liu@linaro.org>
	+ 8 others); Wed, 20 Jul 2016 01:03:28 -0400
Received: from mail-pf0-f193.google.com ([209.85.192.193]:36471 "EHLO
	mail-pf0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750842AbcGTFDU (ORCPT <rfc822;kvm@vger.kernel.org>);
	Wed, 20 Jul 2016 01:03:20 -0400
Received: by mail-pf0-f193.google.com with SMTP id y134so2685495pfg.3
        for <kvm@vger.kernel.org>; Tue, 19 Jul 2016 22:03:19 -0700 (PDT)
DKIM-Signature:	v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=nef6JT76msUoKNxWZR/eIkgJVrAGASB3qrA55HgbfAY=;
        b=laWwV5WDhMVTk5vBfGWnyqJa9OCiPkAXmPy1JNnyRGtx3s6RsRBD/QbDKrjtwqo1Th
         ycdbfZvgWHgmuEeMma0E6faQGO/wqfNtel0IMhlj/4GRp6fLS2WFs6t65jPJZ9ouvpRZ
         sMGN3WRqNAHl4k7MlU3f/rHNdEYIUKh788Sk/5yVXijgVDqLczHxxey6TSkzoQ2rNaqS
         tFWztN+y8s3D/7Ec8Peub5LFA1IIVMMwrpzxdbozPinQS6RAYJ88PzvMc/CBcQ6ubY2g
         QyB6NpeI5y/LuQGx34YZ7gPfTtLSaGjltSNFsnmE8wOxxzNVuI40A1yUUxbPEfW4NM2a
         CPeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=nef6JT76msUoKNxWZR/eIkgJVrAGASB3qrA55HgbfAY=;
        b=iEIeNI0YNMia4I3DLTSmx5PFOzsZ1uk5xRIckX3UNulEZpNcLshCjb6Lj1MLj06c4m
         Ji6mXgDKc0l8o2KPdp6l9JAqAw9nXhPLIWMXYBDtxQkcoZUNPYfFnJKrNiNELzAKdOZy
         ZjSvyTqtQ5cQHRTQwxhV1iJtvEhqS1NcoUiBNyllNmHcmLMcYRntmJQHo1fd3HtM8Wls
         5qpK8LDMj4qWNLoNp4QCTozbio1JAOLreuVmcvGLcO+uMc2xNjYaKRYAhGR/ZFX+AYPJ
         nZibKtt9eRDFq3HrFeMpwKBj3EkZ99Qs+uk7JcRfXGTk/naKWi3A+6IuKE7Uh9oKvN9P
         3jUw==
X-Gm-Message-State: ALyK8tIeEKdtuL7CzjQh7r+KzZxEDKAQiBvgd4stU4f8VuP0c0fJyLSLStZbM1aEEMER+w==
X-Received: by 10.98.86.154 with SMTP id h26mr27329463pfj.22.1468990999095;
        Tue, 19 Jul 2016 22:03:19 -0700 (PDT)
Received: from squirtle.localdomain.localdomain (c-73-225-163-254.hsd1.wa.comcast.net. [73.225.163.254])
        by smtp.gmail.com with ESMTPSA id c66sm1031757pfd.24.2016.07.19.22.03.18
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 19 Jul 2016 22:03:18 -0700 (PDT)
From:	Andrey Smirnov <andrew.smirnov@gmail.com>
To:	qemu-devel@nongnu.org
Cc:	Andrey Smirnov <andrew.smirnov@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	David Gibson <david@gibson.dropbear.id.au>,
	qemu-ppc@nongnu.org, qemu-arm@nongnu.org, kvm@vger.kernel.org
Subject: [PATCH v3 01/10] Avoid needless calls to address_space_rw()
Date:	Tue, 19 Jul 2016 22:02:51 -0700
Message-Id: <1468990980-4598-2-git-send-email-andrew.smirnov@gmail.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <1468990980-4598-1-git-send-email-andrew.smirnov@gmail.com>
References: <1468990980-4598-1-git-send-email-andrew.smirnov@gmail.com>
Sender:	kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List:	kvm@vger.kernel.org
X-TUID: 2Dt4xzR7XA0V

Avoid calling address_space_rw() when direction of the transfer is
constant and known at compile time and replace them with explicit calls
to address_space_read()/address_space_write().

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
---
 dma-helpers.c    |  4 ++--
 exec.c           | 10 +++++-----
 hw/net/dp8393x.c | 58 +++++++++++++++++++++++++++++---------------------------
 3 files changed, 37 insertions(+), 35 deletions(-)

diff --git a/dma-helpers.c b/dma-helpers.c
index 9defc10..98c070e 100644
--- a/dma-helpers.c
+++ b/dma-helpers.c
@@ -28,8 +28,8 @@ int dma_memory_set(AddressSpace *as, dma_addr_t addr, uint8_t c, dma_addr_t len)
     memset(fillbuf, c, FILLBUF_SIZE);
     while (len > 0) {
         l = len < FILLBUF_SIZE ? len : FILLBUF_SIZE;
-        error |= address_space_rw(as, addr, MEMTXATTRS_UNSPECIFIED,
-                                  fillbuf, l, true);
+        error |= address_space_write(as, addr, MEMTXATTRS_UNSPECIFIED,
+                                     fillbuf, l);
         len -= l;
         addr += l;
     }
diff --git a/exec.c b/exec.c
index 011babd..337ec01 100644
--- a/exec.c
+++ b/exec.c
@@ -3224,7 +3224,7 @@ uint32_t address_space_ldub(AddressSpace *as, hwaddr addr,
     uint8_t val;
     MemTxResult r;
 
-    r = address_space_rw(as, addr, attrs, &val, 1, 0);
+    r = address_space_read(as, addr, attrs, &val, 1);
     if (result) {
         *result = r;
     }
@@ -3474,7 +3474,7 @@ void address_space_stb(AddressSpace *as, hwaddr addr, uint32_t val,
     uint8_t v = val;
     MemTxResult r;
 
-    r = address_space_rw(as, addr, attrs, &v, 1, 1);
+    r = address_space_write(as, addr, attrs, &v, 1);
     if (result) {
         *result = r;
     }
@@ -3582,7 +3582,7 @@ void address_space_stq(AddressSpace *as, hwaddr addr, uint64_t val,
 {
     MemTxResult r;
     val = tswap64(val);
-    r = address_space_rw(as, addr, attrs, (void *) &val, 8, 1);
+    r = address_space_write(as, addr, attrs, (void *) &val, 8);
     if (result) {
         *result = r;
     }
@@ -3593,7 +3593,7 @@ void address_space_stq_le(AddressSpace *as, hwaddr addr, uint64_t val,
 {
     MemTxResult r;
     val = cpu_to_le64(val);
-    r = address_space_rw(as, addr, attrs, (void *) &val, 8, 1);
+    r = address_space_write(as, addr, attrs, (void *) &val, 8);
     if (result) {
         *result = r;
     }
@@ -3603,7 +3603,7 @@ void address_space_stq_be(AddressSpace *as, hwaddr addr, uint64_t val,
 {
     MemTxResult r;
     val = cpu_to_be64(val);
-    r = address_space_rw(as, addr, attrs, (void *) &val, 8, 1);
+    r = address_space_write(as, addr, attrs, (void *) &val, 8);
     if (result) {
         *result = r;
     }
diff --git a/hw/net/dp8393x.c b/hw/net/dp8393x.c
index 0fa652c..3af044f 100644
--- a/hw/net/dp8393x.c
+++ b/hw/net/dp8393x.c
@@ -203,9 +203,9 @@ static void dp8393x_do_load_cam(dp8393xState *s)
 
     while (s->regs[SONIC_CDC] & 0x1f) {
         /* Fill current entry */
-        address_space_rw(&s->as,
+        address_space_read(&s->as,
             (s->regs[SONIC_URRA] << 16) | s->regs[SONIC_CDP],
-            MEMTXATTRS_UNSPECIFIED, (uint8_t *)data, size, 0);
+            MEMTXATTRS_UNSPECIFIED, (uint8_t *)data, size);
         s->cam[index][0] = data[1 * width] & 0xff;
         s->cam[index][1] = data[1 * width] >> 8;
         s->cam[index][2] = data[2 * width] & 0xff;
@@ -222,9 +222,9 @@ static void dp8393x_do_load_cam(dp8393xState *s)
     }
 
     /* Read CAM enable */
-    address_space_rw(&s->as,
+    address_space_read(&s->as,
         (s->regs[SONIC_URRA] << 16) | s->regs[SONIC_CDP],
-        MEMTXATTRS_UNSPECIFIED, (uint8_t *)data, size, 0);
+        MEMTXATTRS_UNSPECIFIED, (uint8_t *)data, size);
     s->regs[SONIC_CE] = data[0 * width];
     DPRINTF("load cam done. cam enable mask 0x%04x\n", s->regs[SONIC_CE]);
 
@@ -242,9 +242,9 @@ static void dp8393x_do_read_rra(dp8393xState *s)
     /* Read memory */
     width = (s->regs[SONIC_DCR] & SONIC_DCR_DW) ? 2 : 1;
     size = sizeof(uint16_t) * 4 * width;
-    address_space_rw(&s->as,
+    address_space_read(&s->as,
         (s->regs[SONIC_URRA] << 16) | s->regs[SONIC_RRP],
-        MEMTXATTRS_UNSPECIFIED, (uint8_t *)data, size, 0);
+        MEMTXATTRS_UNSPECIFIED, (uint8_t *)data, size);
 
     /* Update SONIC registers */
     s->regs[SONIC_CRBA0] = data[0 * width];
@@ -360,9 +360,9 @@ static void dp8393x_do_transmit_packets(dp8393xState *s)
                 (s->regs[SONIC_UTDA] << 16) | s->regs[SONIC_CTDA]);
         size = sizeof(uint16_t) * 6 * width;
         s->regs[SONIC_TTDA] = s->regs[SONIC_CTDA];
-        address_space_rw(&s->as,
+        address_space_read(&s->as,
             ((s->regs[SONIC_UTDA] << 16) | s->regs[SONIC_TTDA]) + sizeof(uint16_t) * width,
-            MEMTXATTRS_UNSPECIFIED, (uint8_t *)data, size, 0);
+            MEMTXATTRS_UNSPECIFIED, (uint8_t *)data, size);
         tx_len = 0;
 
         /* Update registers */
@@ -386,18 +386,18 @@ static void dp8393x_do_transmit_packets(dp8393xState *s)
             if (tx_len + len > sizeof(s->tx_buffer)) {
                 len = sizeof(s->tx_buffer) - tx_len;
             }
-            address_space_rw(&s->as,
+            address_space_read(&s->as,
                 (s->regs[SONIC_TSA1] << 16) | s->regs[SONIC_TSA0],
-                MEMTXATTRS_UNSPECIFIED, &s->tx_buffer[tx_len], len, 0);
+                MEMTXATTRS_UNSPECIFIED, &s->tx_buffer[tx_len], len);
             tx_len += len;
 
             i++;
             if (i != s->regs[SONIC_TFC]) {
                 /* Read next fragment details */
                 size = sizeof(uint16_t) * 3 * width;
-                address_space_rw(&s->as,
+                address_space_read(&s->as,
                     ((s->regs[SONIC_UTDA] << 16) | s->regs[SONIC_TTDA]) + sizeof(uint16_t) * (4 + 3 * i) * width,
-                    MEMTXATTRS_UNSPECIFIED, (uint8_t *)data, size, 0);
+                    MEMTXATTRS_UNSPECIFIED, (uint8_t *)data, size);
                 s->regs[SONIC_TSA0] = data[0 * width];
                 s->regs[SONIC_TSA1] = data[1 * width];
                 s->regs[SONIC_TFS] = data[2 * width];
@@ -429,16 +429,16 @@ static void dp8393x_do_transmit_packets(dp8393xState *s)
         /* Write status */
         data[0 * width] = s->regs[SONIC_TCR] & 0x0fff; /* status */
         size = sizeof(uint16_t) * width;
-        address_space_rw(&s->as,
+        address_space_write(&s->as,
             (s->regs[SONIC_UTDA] << 16) | s->regs[SONIC_TTDA],
-            MEMTXATTRS_UNSPECIFIED, (uint8_t *)data, size, 1);
+            MEMTXATTRS_UNSPECIFIED, (uint8_t *)data, size);
 
         if (!(s->regs[SONIC_CR] & SONIC_CR_HTX)) {
             /* Read footer of packet */
             size = sizeof(uint16_t) * width;
-            address_space_rw(&s->as,
+            address_space_read(&s->as,
                 ((s->regs[SONIC_UTDA] << 16) | s->regs[SONIC_TTDA]) + sizeof(uint16_t) * (4 + 3 * s->regs[SONIC_TFC]) * width,
-                MEMTXATTRS_UNSPECIFIED, (uint8_t *)data, size, 0);
+                MEMTXATTRS_UNSPECIFIED, (uint8_t *)data, size);
             s->regs[SONIC_CTDA] = data[0 * width] & ~0x1;
             if (data[0 * width] & 0x1) {
                 /* EOL detected */
@@ -701,8 +701,8 @@ static ssize_t dp8393x_receive(NetClientState *nc, const uint8_t * buf,
         /* Are we still in resource exhaustion? */
         size = sizeof(uint16_t) * 1 * width;
         address = ((s->regs[SONIC_URDA] << 16) | s->regs[SONIC_CRDA]) + sizeof(uint16_t) * 5 * width;
-        address_space_rw(&s->as, address, MEMTXATTRS_UNSPECIFIED,
-                         (uint8_t *)data, size, 0);
+        address_space_read(&s->as, address, MEMTXATTRS_UNSPECIFIED,
+                           (uint8_t *)data, size);
         if (data[0 * width] & 0x1) {
             /* Still EOL ; stop reception */
             return -1;
@@ -721,11 +721,11 @@ static ssize_t dp8393x_receive(NetClientState *nc, const uint8_t * buf,
     /* Put packet into RBA */
     DPRINTF("Receive packet at %08x\n", (s->regs[SONIC_CRBA1] << 16) | s->regs[SONIC_CRBA0]);
     address = (s->regs[SONIC_CRBA1] << 16) | s->regs[SONIC_CRBA0];
-    address_space_rw(&s->as, address,
-        MEMTXATTRS_UNSPECIFIED, (uint8_t *)buf, rx_len, 1);
+    address_space_write(&s->as, address,
+        MEMTXATTRS_UNSPECIFIED, (uint8_t *)buf, rx_len);
     address += rx_len;
-    address_space_rw(&s->as, address,
-        MEMTXATTRS_UNSPECIFIED, (uint8_t *)&checksum, 4, 1);
+    address_space_write(&s->as, address,
+        MEMTXATTRS_UNSPECIFIED, (uint8_t *)&checksum, 4);
     rx_len += 4;
     s->regs[SONIC_CRBA1] = address >> 16;
     s->regs[SONIC_CRBA0] = address & 0xffff;
@@ -753,23 +753,25 @@ static ssize_t dp8393x_receive(NetClientState *nc, const uint8_t * buf,
     data[3 * width] = s->regs[SONIC_TRBA1]; /* pkt_ptr1 */
     data[4 * width] = s->regs[SONIC_RSC]; /* seq_no */
     size = sizeof(uint16_t) * 5 * width;
-    address_space_rw(&s->as, (s->regs[SONIC_URDA] << 16) | s->regs[SONIC_CRDA],
-        MEMTXATTRS_UNSPECIFIED, (uint8_t *)data, size, 1);
+    address_space_write(&s->as,
+                        (s->regs[SONIC_URDA] << 16) |
+                        s->regs[SONIC_CRDA],
+                        MEMTXATTRS_UNSPECIFIED, (uint8_t *)data, size);
 
     /* Move to next descriptor */
     size = sizeof(uint16_t) * width;
-    address_space_rw(&s->as,
+    address_space_read(&s->as,
         ((s->regs[SONIC_URDA] << 16) | s->regs[SONIC_CRDA]) + sizeof(uint16_t) * 5 * width,
-        MEMTXATTRS_UNSPECIFIED, (uint8_t *)data, size, 0);
+        MEMTXATTRS_UNSPECIFIED, (uint8_t *)data, size);
     s->regs[SONIC_LLFA] = data[0 * width];
     if (s->regs[SONIC_LLFA] & 0x1) {
         /* EOL detected */
         s->regs[SONIC_ISR] |= SONIC_ISR_RDE;
     } else {
         data[0 * width] = 0; /* in_use */
-        address_space_rw(&s->as,
+        address_space_write(&s->as,
             ((s->regs[SONIC_URDA] << 16) | s->regs[SONIC_CRDA]) + sizeof(uint16_t) * 6 * width,
-            MEMTXATTRS_UNSPECIFIED, (uint8_t *)data, sizeof(uint16_t), 1);
+            MEMTXATTRS_UNSPECIFIED, (uint8_t *)data, sizeof(uint16_t));
         s->regs[SONIC_CRDA] = s->regs[SONIC_LLFA];
         s->regs[SONIC_ISR] |= SONIC_ISR_PKTRX;
         s->regs[SONIC_RSC] = (s->regs[SONIC_RSC] & 0xff00) | (((s->regs[SONIC_RSC] & 0x00ff) + 1) & 0x00ff);
-- 
2.5.5

