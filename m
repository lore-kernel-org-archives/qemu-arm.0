Received: by 10.25.21.156 with SMTP id 28csp1960443lfv;
        Tue, 19 Jul 2016 22:03:29 -0700 (PDT)
X-Received: by 10.66.145.1 with SMTP id sq1mr71490676pab.107.1468991008196;
        Tue, 19 Jul 2016 22:03:28 -0700 (PDT)
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id j71si1263732pfa.161.2016.07.19.22.03.27;
        Tue, 19 Jul 2016 22:03:28 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@gmail.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
	id S1751041AbcGTFDW (ORCPT <rfc822;xinliang.liu@linaro.org>
	+ 8 others); Wed, 20 Jul 2016 01:03:22 -0400
Received: from mail-pf0-f193.google.com ([209.85.192.193]:36474 "EHLO
	mail-pf0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750796AbcGTFDU (ORCPT <rfc822;kvm@vger.kernel.org>);
	Wed, 20 Jul 2016 01:03:20 -0400
Received: by mail-pf0-f193.google.com with SMTP id y134so2685507pfg.3
        for <kvm@vger.kernel.org>; Tue, 19 Jul 2016 22:03:20 -0700 (PDT)
DKIM-Signature:	v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=fqML/CB4n416Mb9bBMskMiVKV5Y2QhJV1IEFX35GoMc=;
        b=la59SaaRtSC40ENBjNfAtEhbPVcbHy9XClHtMUc7t3PCqn3nX93/ESqNmDh8M4GZTG
         JDCeASjCQiE8QixiwYNL1PfbzmGEqgfHyJ8OT/v4MruRPy+nBIcgCcKn1uMYJnxxI9GY
         ibbKjvSJwG+uKyeCdUdZLaX6dr5UwFpvixdXT09v31ti+SGBtelUcCXk9dvxgaa/XCen
         8c6wZKZKiKJKB81oUmmd9cFH4jQ0tUspYAZYfXacxQbiWURSmY/iuWweHjwMxslqzhU0
         LlZ/PJht1InC+jb4R2+3MbNHnrxf6BjYw+aGrzaK5CLYk0zyylLEVQTu6gmZ8zI3m5Tw
         x1Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=fqML/CB4n416Mb9bBMskMiVKV5Y2QhJV1IEFX35GoMc=;
        b=aIUIpX7W9HJ8YCXJ5m7Nfq2ZuxKbio9TPfI9KN70CyvC4qn4HJIJxI1ltL9Cx9jR5m
         XsJMA/S1ycp9NYrSE+bEww4fwyJGm9Pa7gk8IdW9PZ/FqO04YN1xd37xww2slYxaygYI
         86k2aUj3qKmYPJJKMpiPs6mUmnQejWwI7+U7/LPPCD3MyvLTvktN6YOtzIT30HM0GVof
         frCv2IVBG9F2Rqkqecj5FgDPEkzzmjuDizJIPxrwcZX0QbCtyxv7YsbtyitlDweMkkZx
         MvT3gDJJPuz3+4TXLLukQtrKlQ3TinNx5WPOD9QJ9Zkje08nN73Pf/5y3RxRO5hzoP5f
         SV+g==
X-Gm-Message-State: ALyK8tIcj4MO5ynMmkR3k6B+RDIFqJyY2/cGyP95P+9vhOPk+glEuoS8q/6vmFeqe1LOeg==
X-Received: by 10.98.56.207 with SMTP id f198mr55693181pfa.83.1468990999898;
        Tue, 19 Jul 2016 22:03:19 -0700 (PDT)
Received: from squirtle.localdomain.localdomain (c-73-225-163-254.hsd1.wa.comcast.net. [73.225.163.254])
        by smtp.gmail.com with ESMTPSA id c66sm1031757pfd.24.2016.07.19.22.03.19
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 19 Jul 2016 22:03:19 -0700 (PDT)
From:	Andrey Smirnov <andrew.smirnov@gmail.com>
To:	qemu-devel@nongnu.org
Cc:	Andrey Smirnov <andrew.smirnov@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	David Gibson <david@gibson.dropbear.id.au>,
	qemu-ppc@nongnu.org, qemu-arm@nongnu.org, kvm@vger.kernel.org
Subject: [PATCH v3 02/10] Change signature of address_space_read() to avoid casting
Date:	Tue, 19 Jul 2016 22:02:52 -0700
Message-Id: <1468990980-4598-3-git-send-email-andrew.smirnov@gmail.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <1468990980-4598-1-git-send-email-andrew.smirnov@gmail.com>
References: <1468990980-4598-1-git-send-email-andrew.smirnov@gmail.com>
Sender:	kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List:	kvm@vger.kernel.org
X-TUID: mnKSnkCc7Oyn

Change signature of address_space_read() to expectet void * as a buffer
instead of uint8_t * to avoid forcing the caller of the function to do a
type cast.

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
---
 exec.c                |  2 +-
 hw/net/dp8393x.c      | 16 ++++++++--------
 hw/virtio/virtio.c    |  2 +-
 include/exec/memory.h |  2 +-
 4 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/exec.c b/exec.c
index 337ec01..76d55ed 100644
--- a/exec.c
+++ b/exec.c
@@ -2736,7 +2736,7 @@ MemTxResult address_space_rw(AddressSpace *as, hwaddr addr, MemTxAttrs attrs,
     if (is_write) {
         return address_space_write(as, addr, attrs, (uint8_t *)buf, len);
     } else {
-        return address_space_read(as, addr, attrs, (uint8_t *)buf, len);
+        return address_space_read(as, addr, attrs, buf, len);
     }
 }
 
diff --git a/hw/net/dp8393x.c b/hw/net/dp8393x.c
index 3af044f..b8b33ee 100644
--- a/hw/net/dp8393x.c
+++ b/hw/net/dp8393x.c
@@ -205,7 +205,7 @@ static void dp8393x_do_load_cam(dp8393xState *s)
         /* Fill current entry */
         address_space_read(&s->as,
             (s->regs[SONIC_URRA] << 16) | s->regs[SONIC_CDP],
-            MEMTXATTRS_UNSPECIFIED, (uint8_t *)data, size);
+            MEMTXATTRS_UNSPECIFIED, data, size);
         s->cam[index][0] = data[1 * width] & 0xff;
         s->cam[index][1] = data[1 * width] >> 8;
         s->cam[index][2] = data[2 * width] & 0xff;
@@ -224,7 +224,7 @@ static void dp8393x_do_load_cam(dp8393xState *s)
     /* Read CAM enable */
     address_space_read(&s->as,
         (s->regs[SONIC_URRA] << 16) | s->regs[SONIC_CDP],
-        MEMTXATTRS_UNSPECIFIED, (uint8_t *)data, size);
+        MEMTXATTRS_UNSPECIFIED, data, size);
     s->regs[SONIC_CE] = data[0 * width];
     DPRINTF("load cam done. cam enable mask 0x%04x\n", s->regs[SONIC_CE]);
 
@@ -244,7 +244,7 @@ static void dp8393x_do_read_rra(dp8393xState *s)
     size = sizeof(uint16_t) * 4 * width;
     address_space_read(&s->as,
         (s->regs[SONIC_URRA] << 16) | s->regs[SONIC_RRP],
-        MEMTXATTRS_UNSPECIFIED, (uint8_t *)data, size);
+        MEMTXATTRS_UNSPECIFIED, data, size);
 
     /* Update SONIC registers */
     s->regs[SONIC_CRBA0] = data[0 * width];
@@ -362,7 +362,7 @@ static void dp8393x_do_transmit_packets(dp8393xState *s)
         s->regs[SONIC_TTDA] = s->regs[SONIC_CTDA];
         address_space_read(&s->as,
             ((s->regs[SONIC_UTDA] << 16) | s->regs[SONIC_TTDA]) + sizeof(uint16_t) * width,
-            MEMTXATTRS_UNSPECIFIED, (uint8_t *)data, size);
+            MEMTXATTRS_UNSPECIFIED, data, size);
         tx_len = 0;
 
         /* Update registers */
@@ -397,7 +397,7 @@ static void dp8393x_do_transmit_packets(dp8393xState *s)
                 size = sizeof(uint16_t) * 3 * width;
                 address_space_read(&s->as,
                     ((s->regs[SONIC_UTDA] << 16) | s->regs[SONIC_TTDA]) + sizeof(uint16_t) * (4 + 3 * i) * width,
-                    MEMTXATTRS_UNSPECIFIED, (uint8_t *)data, size);
+                    MEMTXATTRS_UNSPECIFIED, data, size);
                 s->regs[SONIC_TSA0] = data[0 * width];
                 s->regs[SONIC_TSA1] = data[1 * width];
                 s->regs[SONIC_TFS] = data[2 * width];
@@ -438,7 +438,7 @@ static void dp8393x_do_transmit_packets(dp8393xState *s)
             size = sizeof(uint16_t) * width;
             address_space_read(&s->as,
                 ((s->regs[SONIC_UTDA] << 16) | s->regs[SONIC_TTDA]) + sizeof(uint16_t) * (4 + 3 * s->regs[SONIC_TFC]) * width,
-                MEMTXATTRS_UNSPECIFIED, (uint8_t *)data, size);
+                MEMTXATTRS_UNSPECIFIED, data, size);
             s->regs[SONIC_CTDA] = data[0 * width] & ~0x1;
             if (data[0 * width] & 0x1) {
                 /* EOL detected */
@@ -702,7 +702,7 @@ static ssize_t dp8393x_receive(NetClientState *nc, const uint8_t * buf,
         size = sizeof(uint16_t) * 1 * width;
         address = ((s->regs[SONIC_URDA] << 16) | s->regs[SONIC_CRDA]) + sizeof(uint16_t) * 5 * width;
         address_space_read(&s->as, address, MEMTXATTRS_UNSPECIFIED,
-                           (uint8_t *)data, size);
+                           data, size);
         if (data[0 * width] & 0x1) {
             /* Still EOL ; stop reception */
             return -1;
@@ -762,7 +762,7 @@ static ssize_t dp8393x_receive(NetClientState *nc, const uint8_t * buf,
     size = sizeof(uint16_t) * width;
     address_space_read(&s->as,
         ((s->regs[SONIC_URDA] << 16) | s->regs[SONIC_CRDA]) + sizeof(uint16_t) * 5 * width,
-        MEMTXATTRS_UNSPECIFIED, (uint8_t *)data, size);
+        MEMTXATTRS_UNSPECIFIED, data, size);
     s->regs[SONIC_LLFA] = data[0 * width];
     if (s->regs[SONIC_LLFA] & 0x1) {
         /* EOL detected */
diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
index 18153d5..6e04cea 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -122,7 +122,7 @@ static void vring_desc_read(VirtIODevice *vdev, VRingDesc *desc,
                             hwaddr desc_pa, int i)
 {
     address_space_read(&address_space_memory, desc_pa + i * sizeof(VRingDesc),
-                       MEMTXATTRS_UNSPECIFIED, (void *)desc, sizeof(VRingDesc));
+                       MEMTXATTRS_UNSPECIFIED, desc, sizeof(VRingDesc));
     virtio_tswap64s(vdev, &desc->addr);
     virtio_tswap32s(vdev, &desc->len);
     virtio_tswap16s(vdev, &desc->flags);
diff --git a/include/exec/memory.h b/include/exec/memory.h
index 3e4d416..262ecab 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -1451,7 +1451,7 @@ static inline bool memory_access_is_direct(MemoryRegion *mr, bool is_write)
  */
 static inline __attribute__((__always_inline__))
 MemTxResult address_space_read(AddressSpace *as, hwaddr addr, MemTxAttrs attrs,
-                               uint8_t *buf, int len)
+                               void *buf, int len)
 {
     MemTxResult result = MEMTX_OK;
     hwaddr l, addr1;
-- 
2.5.5

