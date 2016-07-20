Received: by 10.25.21.156 with SMTP id 28csp1960497lfv;
        Tue, 19 Jul 2016 22:03:39 -0700 (PDT)
X-Received: by 10.98.196.77 with SMTP id y74mr50246243pff.97.1468991019258;
        Tue, 19 Jul 2016 22:03:39 -0700 (PDT)
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id d10si1260915pat.143.2016.07.19.22.03.39;
        Tue, 19 Jul 2016 22:03:39 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@gmail.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
	id S1751352AbcGTFD1 (ORCPT <rfc822;xinliang.liu@linaro.org>
	+ 8 others); Wed, 20 Jul 2016 01:03:27 -0400
Received: from mail-pa0-f68.google.com ([209.85.220.68]:35364 "EHLO
	mail-pa0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750888AbcGTFDV (ORCPT <rfc822;kvm@vger.kernel.org>);
	Wed, 20 Jul 2016 01:03:21 -0400
Received: by mail-pa0-f68.google.com with SMTP id cf3so2560090pad.2
        for <kvm@vger.kernel.org>; Tue, 19 Jul 2016 22:03:21 -0700 (PDT)
DKIM-Signature:	v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=A0PamD8iU4GDuPW8RjqSeMKaae0agE2Ey+8YJRKfUnQ=;
        b=gYy5UqIDmxur6wrZVutqMIya0o6PYHe/6YUWlESupQd2A0pyq2+bB2o5KJIg/rwDuQ
         GgGfUOW3Pij1TpTMZj7zyKEed+N72MMyu2DtljGuAWN4uOvACtgRWDSFd8BRjtVaOUgC
         P503/bqfUv53BbAb2ClqObu9B0lFbENtBJemz8IGVMEwLd4KeQzTxZsonP5Hj8dmRmFM
         tyok5oHLqXb8pYqQqjQUsV/n5bBohhy9yT+4ZLQrnMJVPM1RRJ1iI5W7hI/ms5X3Andc
         y443JbojUOtD/ENIOGKM5UWNcQn3QvLebohpkysJ6Lfv5FZEI8lRB9aakad2iG2zSenQ
         Wv8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=A0PamD8iU4GDuPW8RjqSeMKaae0agE2Ey+8YJRKfUnQ=;
        b=U15lE2tAWP186J8/cAX+X6daB+FWkS9Qa2ZBqxgmq24s414LjVCj4sHxUMrdJdySBB
         UqMB8WuKOAAobbOPapvLM8bxycib5zDy722OqF5JFkDbr85iMrmiVzSR8gWdL+jl7phq
         GbF4KxarNPhkbNLiZ0CbuuDXFSu8TPNY+K66+r8jRw9msGlveEYunum445XD6TSULp1/
         MMdy9seCoBLntWNYdYLUoffrfwRknkAfqI/w59MkBsiV1ufl8fXFz79et8/ErdQdfCZc
         huRyV5d+iBEjRwxaw9EvYSBQId/uoAJbAAmYQX6VAoqYpIKYsETeaiDGTadrMplPw/HS
         8GFQ==
X-Gm-Message-State: ALyK8tK9HHTkgBHnKstxMx5kNkh1sSEEI0web1DIdsmcqhD6K5Fyj9f+oCDPwpBH0IzzLg==
X-Received: by 10.66.242.166 with SMTP id wr6mr71774855pac.147.1468991000740;
        Tue, 19 Jul 2016 22:03:20 -0700 (PDT)
Received: from squirtle.localdomain.localdomain (c-73-225-163-254.hsd1.wa.comcast.net. [73.225.163.254])
        by smtp.gmail.com with ESMTPSA id c66sm1031757pfd.24.2016.07.19.22.03.19
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 19 Jul 2016 22:03:20 -0700 (PDT)
From:	Andrey Smirnov <andrew.smirnov@gmail.com>
To:	qemu-devel@nongnu.org
Cc:	Andrey Smirnov <andrew.smirnov@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	David Gibson <david@gibson.dropbear.id.au>,
	qemu-ppc@nongnu.org, qemu-arm@nongnu.org, kvm@vger.kernel.org
Subject: [PATCH v3 03/10] Change signature of address_space_write() to avoid casting
Date:	Tue, 19 Jul 2016 22:02:53 -0700
Message-Id: <1468990980-4598-4-git-send-email-andrew.smirnov@gmail.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <1468990980-4598-1-git-send-email-andrew.smirnov@gmail.com>
References: <1468990980-4598-1-git-send-email-andrew.smirnov@gmail.com>
Sender:	kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List:	kvm@vger.kernel.org
X-TUID: zz8oYSUJhD3X

Change signature of address_space_write() to expectet void * as a buffer
instead of uint8_t * to avoid forcing the caller of the function to do a
type cast.

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
---
 exec.c                | 10 +++++-----
 hw/net/dp8393x.c      | 10 +++++-----
 hw/virtio/virtio.c    |  2 +-
 include/exec/memory.h |  2 +-
 4 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/exec.c b/exec.c
index 76d55ed..44cd424 100644
--- a/exec.c
+++ b/exec.c
@@ -2621,7 +2621,7 @@ static MemTxResult address_space_write_continue(AddressSpace *as, hwaddr addr,
 }
 
 MemTxResult address_space_write(AddressSpace *as, hwaddr addr, MemTxAttrs attrs,
-                                const uint8_t *buf, int len)
+                                const void *buf, int len)
 {
     hwaddr l;
     hwaddr addr1;
@@ -2734,7 +2734,7 @@ MemTxResult address_space_rw(AddressSpace *as, hwaddr addr, MemTxAttrs attrs,
                              uint8_t *buf, int len, bool is_write)
 {
     if (is_write) {
-        return address_space_write(as, addr, attrs, (uint8_t *)buf, len);
+        return address_space_write(as, addr, attrs, buf, len);
     } else {
         return address_space_read(as, addr, attrs, buf, len);
     }
@@ -3582,7 +3582,7 @@ void address_space_stq(AddressSpace *as, hwaddr addr, uint64_t val,
 {
     MemTxResult r;
     val = tswap64(val);
-    r = address_space_write(as, addr, attrs, (void *) &val, 8);
+    r = address_space_write(as, addr, attrs, &val, 8);
     if (result) {
         *result = r;
     }
@@ -3593,7 +3593,7 @@ void address_space_stq_le(AddressSpace *as, hwaddr addr, uint64_t val,
 {
     MemTxResult r;
     val = cpu_to_le64(val);
-    r = address_space_write(as, addr, attrs, (void *) &val, 8);
+    r = address_space_write(as, addr, attrs, &val, 8);
     if (result) {
         *result = r;
     }
@@ -3603,7 +3603,7 @@ void address_space_stq_be(AddressSpace *as, hwaddr addr, uint64_t val,
 {
     MemTxResult r;
     val = cpu_to_be64(val);
-    r = address_space_write(as, addr, attrs, (void *) &val, 8);
+    r = address_space_write(as, addr, attrs, &val, 8);
     if (result) {
         *result = r;
     }
diff --git a/hw/net/dp8393x.c b/hw/net/dp8393x.c
index b8b33ee..e5712a2 100644
--- a/hw/net/dp8393x.c
+++ b/hw/net/dp8393x.c
@@ -431,7 +431,7 @@ static void dp8393x_do_transmit_packets(dp8393xState *s)
         size = sizeof(uint16_t) * width;
         address_space_write(&s->as,
             (s->regs[SONIC_UTDA] << 16) | s->regs[SONIC_TTDA],
-            MEMTXATTRS_UNSPECIFIED, (uint8_t *)data, size);
+            MEMTXATTRS_UNSPECIFIED, data, size);
 
         if (!(s->regs[SONIC_CR] & SONIC_CR_HTX)) {
             /* Read footer of packet */
@@ -722,10 +722,10 @@ static ssize_t dp8393x_receive(NetClientState *nc, const uint8_t * buf,
     DPRINTF("Receive packet at %08x\n", (s->regs[SONIC_CRBA1] << 16) | s->regs[SONIC_CRBA0]);
     address = (s->regs[SONIC_CRBA1] << 16) | s->regs[SONIC_CRBA0];
     address_space_write(&s->as, address,
-        MEMTXATTRS_UNSPECIFIED, (uint8_t *)buf, rx_len);
+        MEMTXATTRS_UNSPECIFIED, buf, rx_len);
     address += rx_len;
     address_space_write(&s->as, address,
-        MEMTXATTRS_UNSPECIFIED, (uint8_t *)&checksum, 4);
+        MEMTXATTRS_UNSPECIFIED, &checksum, 4);
     rx_len += 4;
     s->regs[SONIC_CRBA1] = address >> 16;
     s->regs[SONIC_CRBA0] = address & 0xffff;
@@ -756,7 +756,7 @@ static ssize_t dp8393x_receive(NetClientState *nc, const uint8_t * buf,
     address_space_write(&s->as,
                         (s->regs[SONIC_URDA] << 16) |
                         s->regs[SONIC_CRDA],
-                        MEMTXATTRS_UNSPECIFIED, (uint8_t *)data, size);
+                        MEMTXATTRS_UNSPECIFIED, data, size);
 
     /* Move to next descriptor */
     size = sizeof(uint16_t) * width;
@@ -771,7 +771,7 @@ static ssize_t dp8393x_receive(NetClientState *nc, const uint8_t * buf,
         data[0 * width] = 0; /* in_use */
         address_space_write(&s->as,
             ((s->regs[SONIC_URDA] << 16) | s->regs[SONIC_CRDA]) + sizeof(uint16_t) * 6 * width,
-            MEMTXATTRS_UNSPECIFIED, (uint8_t *)data, sizeof(uint16_t));
+            MEMTXATTRS_UNSPECIFIED, data, sizeof(uint16_t));
         s->regs[SONIC_CRDA] = s->regs[SONIC_LLFA];
         s->regs[SONIC_ISR] |= SONIC_ISR_PKTRX;
         s->regs[SONIC_RSC] = (s->regs[SONIC_RSC] & 0xff00) | (((s->regs[SONIC_RSC] & 0x00ff) + 1) & 0x00ff);
diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
index 6e04cea..f4b7d59 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -164,7 +164,7 @@ static inline void vring_used_write(VirtQueue *vq, VRingUsedElem *uelem,
     virtio_tswap32s(vq->vdev, &uelem->len);
     pa = vq->vring.used + offsetof(VRingUsed, ring[i]);
     address_space_write(&address_space_memory, pa, MEMTXATTRS_UNSPECIFIED,
-                       (void *)uelem, sizeof(VRingUsedElem));
+                        uelem, sizeof(VRingUsedElem));
 }
 
 static uint16_t vring_used_idx(VirtQueue *vq)
diff --git a/include/exec/memory.h b/include/exec/memory.h
index 262ecab..7851ca9 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -1304,7 +1304,7 @@ MemTxResult address_space_rw(AddressSpace *as, hwaddr addr,
  */
 MemTxResult address_space_write(AddressSpace *as, hwaddr addr,
                                 MemTxAttrs attrs,
-                                const uint8_t *buf, int len);
+                                const void *buf, int len);
 
 /* address_space_ld*: load from an address space
  * address_space_st*: store to an address space
-- 
2.5.5

