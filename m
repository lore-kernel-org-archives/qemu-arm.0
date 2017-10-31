Received: by 10.223.161.27 with SMTP id o27csp3866903wro;
        Tue, 31 Oct 2017 08:48:40 -0700 (PDT)
X-Google-Smtp-Source: ABhQp+QH4xjHA7dD2MpxEcYW/OFMR4V9IREWwe3W1SN3wyHkX0awi8as9cz/sVhDewMAQveQ3G0v
X-Received: by 10.129.169.69 with SMTP id g66mr1504355ywh.501.1509464920182;
        Tue, 31 Oct 2017 08:48:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1509464920; cv=none;
        d=google.com; s=arc-20160816;
        b=QOBT7x6IIs7whzxbSnlYxroZMJMgSJLGfYZfwqp3RcACb8V6uJAyBXy634xQdzAWMJ
         qxDW75VgcLVK2DrQwZVnL6hrIQjRxZ4qG/jEckxRb8H+LRQsBTGDfAjGmXrGZtwgk1OI
         EVWSJCGhjMJaST3/TLQPk/gfcoc8eI9E7x8tBnoS+0+SSZ37N5j1OxMP17vNO2vmj1UX
         JX8NO4oojMksZnJBhdWHx1C6nV6Nz0O1c5HMQhOiaJEEuAmz7k/z4rOPtW1E03pKNa56
         0aHxUxbGt4e48rM04T36sy8HCqeNZScKXs+Qbl+xORGZeYdj48W6xUUE/Fbhc1gYy/hO
         DyvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:references
         :in-reply-to:message-id:date:to:from:arc-authentication-results;
        bh=LNjQkCbu2fe5gCmR/UcRWsR1tKHHmAgvlC5e2A/Tzic=;
        b=TxOmvzh2mlMXBVUpd9KLrLyBdxCImPyvPsq2xTYlLD4861Oms3fPZoFF97qnz3g/0k
         O89v+7PJT95rzO0dVJ3RCjBQ3ZXSfEYB6QwV8lDvxKSAUz3qfIzfMLRBn81C9Begx+mY
         L4CzaxlHuox6o/8uVkTGq/vLi3Lm5r1xHeCkJ+gRAE1oTpVjE8YsRzwigSxWGGLMseT3
         h4L4c9olUdXnT5W6zK6f+j15x0lhcGifsaEX6AappAaAb57zTDa4BVewDl1iAdf/8Yx0
         +jtSxEin/6krAt13XEDTpyYdbP3x3VoT4VfEFihrrZ0veKoyaobDknQ7L0uRkOZyMPGD
         CYew==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e135si405184ybf.294.2017.10.31.08.48.39
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 31 Oct 2017 08:48:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:46282 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e9YmN-0003QU-Lm
	for alex.bennee@linaro.org; Tue, 31 Oct 2017 11:48:39 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46854)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Michael.Nawrocki@gtri.gatech.edu>)
	id 1e9YjV-0001Tt-C8
	for qemu-devel@nongnu.org; Tue, 31 Oct 2017 11:45:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Michael.Nawrocki@gtri.gatech.edu>)
	id 1e9YjT-0007Yn-EJ
	for qemu-devel@nongnu.org; Tue, 31 Oct 2017 11:45:41 -0400
Received: from relay2.gtri.gatech.edu ([130.207.199.168]:52382)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <Michael.Nawrocki@gtri.gatech.edu>)
	id 1e9YjT-0007WZ-A3
	for qemu-devel@nongnu.org; Tue, 31 Oct 2017 11:45:39 -0400
X-ASG-Debug-ID: 1509464737-0768e41b30561b70001-jgbH7p
Received: from kiawah.core.gtri.org (kiawah.core.gtri.org [10.41.31.71]) by
	relay2.gtri.gatech.edu with ESMTP id UQeylM5lNNk0gP6e
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128
	verify=NO); Tue, 31 Oct 2017 11:45:37 -0400 (EDT)
X-Barracuda-Envelope-From: Michael.Nawrocki@gtri.gatech.edu
Received: from tybee.core.gtri.org (10.41.1.49) by kiawah.core.gtri.org
	(10.41.31.71) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1034.26;
	Tue, 31 Oct 2017 11:45:37 -0400
Received: from tia-mxn-d01.ctisl.gtri.org (130.207.205.130) by
	tybee.core.gtri.org (10.41.1.49) with Microsoft SMTP Server
	(version=TLS1_2, 
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1034.26;
	Tue, 31 Oct 2017 11:45:37 -0400
From: Mike Nawrocki <michael.nawrocki@gtri.gatech.edu>
To: <qemu-devel@nongnu.org>, <qemu-block@nongnu.org>, <qemu-arm@nongnu.org>,
	<qemu-ppc@nongnu.org>
Date: Tue, 31 Oct 2017 11:44:06 -0400
X-ASG-Orig-Subj: [PATCH 1/2] Add 8-byte access to AMD CFI devices
Message-ID: <20171031154407.4184-2-michael.nawrocki@gtri.gatech.edu>
X-Mailer: git-send-email 2.14.2
In-Reply-To: <20171031154407.4184-1-michael.nawrocki@gtri.gatech.edu>
References: <20171031154407.4184-1-michael.nawrocki@gtri.gatech.edu>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [130.207.205.130]
X-ClientProxiedBy: apatlisdmfe4.core.gtri.org (10.41.47.104) To
	tybee.core.gtri.org (10.41.1.49)
X-Barracuda-Connect: kiawah.core.gtri.org[10.41.31.71]
X-Barracuda-Start-Time: 1509464737
X-Barracuda-Encrypted: ECDHE-RSA-AES128-SHA256
X-Barracuda-URL: https://130.207.199.168:443/cgi-mod/mark.cgi
X-Virus-Scanned: by bsmtpd at gtri.gatech.edu
X-Barracuda-Scan-Msg-Size: 10491
X-Barracuda-BRTS-Status: 1
X-Barracuda-Spam-Score: 0.00
X-Barracuda-Spam-Status: No, SCORE=0.00 using global scores of TAG_LEVEL=1000.0
	QUARANTINE_LEVEL=1000.0 KILL_LEVEL=1000.0 tests=
X-Barracuda-Spam-Report: Code version 3.2, rules version 3.2.3.44359
	Rule breakdown below
	pts rule name              description
	---- ----------------------
	--------------------------------------------------
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 130.207.199.168
Subject: [Qemu-devel] [PATCH 1/2] Add 8-byte access to AMD CFI devices
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: kwolf@redhat.com, Mike Nawrocki <michael.nawrocki@gtri.gatech.edu>,
	magnus.damm@gmail.com, alistair.francis@xilinx.com,
	michael@walle.cc, jan.kiszka@web.de, edgar.iglesias@gmail.com,
	mreitz@redhat.com, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: kHh+kRgLGvPR

This adds 8-byte wide access support to AMD CFI flash devices.
Additionally, it migrates the MMIO operations from old_mmio to the new
API.

Signed-off-by: Mike Nawrocki <michael.nawrocki@gtri.gatech.edu>
---
 hw/block/pflash_cfi02.c | 172 +++++++++++++++++++++++-------------------------
 1 file changed, 81 insertions(+), 91 deletions(-)

diff --git a/hw/block/pflash_cfi02.c b/hw/block/pflash_cfi02.c
index c81ddd3a99..0aed0ab218 100644
--- a/hw/block/pflash_cfi02.c
+++ b/hw/block/pflash_cfi02.c
@@ -18,7 +18,7 @@
  */
 
 /*
- * For now, this code can emulate flashes of 1, 2 or 4 bytes width.
+ * For now, this code can emulate flashes of 1, 2, 4, or 8 bytes width.
  * Supported commands/modes are:
  * - flash read
  * - flash write
@@ -138,11 +138,11 @@ static void pflash_timer (void *opaque)
     pfl->cmd = 0;
 }
 
-static uint32_t pflash_read (pflash_t *pfl, hwaddr offset,
-                             int width, int be)
+static uint64_t pflash_read(pflash_t *pfl, hwaddr offset,
+                            int width, int be)
 {
     hwaddr boff;
-    uint32_t ret;
+    uint64_t ret;
     uint8_t *p;
 
     DPRINTF("%s: offset " TARGET_FMT_plx "\n", __func__, offset);
@@ -158,6 +158,8 @@ static uint32_t pflash_read (pflash_t *pfl, hwaddr offset,
         boff = boff >> 1;
     else if (pfl->width == 4)
         boff = boff >> 2;
+    else if (pfl->width == 8)
+        boff = boff >> 3;
     switch (pfl->cmd) {
     default:
         /* This should never happen : reset state & treat it as a read*/
@@ -200,6 +202,27 @@ static uint32_t pflash_read (pflash_t *pfl, hwaddr offset,
             }
 //            DPRINTF("%s: data offset %08x %08x\n", __func__, offset, ret);
             break;
+        case 8:
+            if (be) {
+                ret = (uint64_t)p[offset] << 56;
+                ret |= (uint64_t)p[offset + 1] << 48;
+                ret |= (uint64_t)p[offset + 2] << 40;
+                ret |= (uint64_t)p[offset + 3] << 32;
+                ret |= (uint64_t)p[offset + 4] << 24;
+                ret |= (uint64_t)p[offset + 5] << 16;
+                ret |= (uint64_t)p[offset + 6] << 8;
+                ret |= (uint64_t)p[offset + 7];
+            } else {
+                ret = (uint64_t)p[offset];
+                ret |= (uint64_t)p[offset + 1] << 8;
+                ret |= (uint64_t)p[offset + 2] << 16;
+                ret |= (uint64_t)p[offset + 3] << 24;
+                ret |= (uint64_t)p[offset + 4] << 32;
+                ret |= (uint64_t)p[offset + 5] << 40;
+                ret |= (uint64_t)p[offset + 6] << 48;
+                ret |= (uint64_t)p[offset + 7] << 56;
+            }
+            break;
         }
         break;
     case 0x90:
@@ -222,14 +245,15 @@ static uint32_t pflash_read (pflash_t *pfl, hwaddr offset,
         default:
             goto flash_read;
         }
-        DPRINTF("%s: ID " TARGET_FMT_plx " %x\n", __func__, boff, ret);
+        DPRINTF("%s: ID " TARGET_FMT_plx " %" PRIx64 "\n", __func__,
+                boff, ret);
         break;
     case 0xA0:
     case 0x10:
     case 0x30:
         /* Status register read */
         ret = pfl->status;
-        DPRINTF("%s: status %x\n", __func__, ret);
+        DPRINTF("%s: status %" PRIx64 "\n", __func__, ret);
         /* Toggle bit 6 */
         pfl->status ^= 0x40;
         break;
@@ -246,8 +270,7 @@ static uint32_t pflash_read (pflash_t *pfl, hwaddr offset,
 }
 
 /* update flash content on disk */
-static void pflash_update(pflash_t *pfl, int offset,
-                          int size)
+static void pflash_update(pflash_t *pfl, int offset, int size)
 {
     int offset_end;
     if (pfl->blk) {
@@ -260,8 +283,8 @@ static void pflash_update(pflash_t *pfl, int offset,
     }
 }
 
-static void pflash_write (pflash_t *pfl, hwaddr offset,
-                          uint32_t value, int width, int be)
+static void pflash_write(pflash_t *pfl, hwaddr offset,
+                         uint64_t value, int width, int be)
 {
     hwaddr boff;
     uint8_t *p;
@@ -275,17 +298,19 @@ static void pflash_write (pflash_t *pfl, hwaddr offset,
 #endif
         goto reset_flash;
     }
-    DPRINTF("%s: offset " TARGET_FMT_plx " %08x %d %d\n", __func__,
-            offset, value, width, pfl->wcycle);
+    DPRINTF("%s: offset " TARGET_FMT_plx " %08" PRIx64 " %d %d\n",
+            __func__, offset, value, width, pfl->wcycle);
     offset &= pfl->chip_len - 1;
 
-    DPRINTF("%s: offset " TARGET_FMT_plx " %08x %d\n", __func__,
-            offset, value, width);
+    DPRINTF("%s: offset " TARGET_FMT_plx " %08" PRIx64 " %d\n",
+            __func__, offset, value, width);
     boff = offset & (pfl->sector_len - 1);
     if (pfl->width == 2)
         boff = boff >> 1;
     else if (pfl->width == 4)
         boff = boff >> 2;
+    else if (pfl->width == 8)
+        boff = boff >> 3;
     switch (pfl->wcycle) {
     case 0:
         /* Set the device in I/O access mode if required */
@@ -346,8 +371,8 @@ static void pflash_write (pflash_t *pfl, hwaddr offset,
             /* We need another unlock sequence */
             goto check_unlock0;
         case 0xA0:
-            DPRINTF("%s: write data offset " TARGET_FMT_plx " %08x %d\n",
-                    __func__, offset, value, width);
+            DPRINTF("%s: write data offset " TARGET_FMT_plx
+                    " %08" PRIx64 " %d\n", __func__, offset, value, width);
             p = pfl->storage;
             if (!pfl->ro) {
                 switch (width) {
@@ -379,6 +404,28 @@ static void pflash_write (pflash_t *pfl, hwaddr offset,
                     }
                     pflash_update(pfl, offset, 4);
                     break;
+                case 8:
+                    if (be) {
+                        p[offset] &= value >> 56;
+                        p[offset + 1] &= value >> 48;
+                        p[offset + 2] &= value >> 40;
+                        p[offset + 3] &= value >> 32;
+                        p[offset + 4] &= value >> 24;
+                        p[offset + 5] &= value >> 16;
+                        p[offset + 6] &= value >> 8;
+                        p[offset + 7] &= value;
+                    } else {
+                        p[offset] &= value;
+                        p[offset + 1] &= value >> 8;
+                        p[offset + 2] &= value >> 16;
+                        p[offset + 3] &= value >> 24;
+                        p[offset + 4] &= value >> 32;
+                        p[offset + 5] &= value >> 40;
+                        p[offset + 6] &= value >> 48;
+                        p[offset + 7] &= value >> 56;
+                    }
+                    pflash_update(pfl, offset, 8);
+                    break;
                 }
             }
             pfl->status = 0x00 | ~(value & 0x80);
@@ -494,103 +541,46 @@ static void pflash_write (pflash_t *pfl, hwaddr offset,
     pfl->cmd = 0;
 }
 
-
-static uint32_t pflash_readb_be(void *opaque, hwaddr addr)
-{
-    return pflash_read(opaque, addr, 1, 1);
-}
-
-static uint32_t pflash_readb_le(void *opaque, hwaddr addr)
-{
-    return pflash_read(opaque, addr, 1, 0);
-}
-
-static uint32_t pflash_readw_be(void *opaque, hwaddr addr)
+static uint64_t pflash_read_le(void *opaque, hwaddr addr, unsigned size)
 {
     pflash_t *pfl = opaque;
-
-    return pflash_read(pfl, addr, 2, 1);
+    return pflash_read(pfl, addr, size, 0);
 }
 
-static uint32_t pflash_readw_le(void *opaque, hwaddr addr)
+static uint64_t pflash_read_be(void *opaque, hwaddr addr, unsigned size)
 {
     pflash_t *pfl = opaque;
-
-    return pflash_read(pfl, addr, 2, 0);
+    return pflash_read(pfl, addr, size, 1);
 }
 
-static uint32_t pflash_readl_be(void *opaque, hwaddr addr)
+static void pflash_write_le(void *opaque, hwaddr addr, uint64_t data,
+                            unsigned size)
 {
     pflash_t *pfl = opaque;
-
-    return pflash_read(pfl, addr, 4, 1);
+    pflash_write(pfl, addr, data, size, 0);
 }
 
-static uint32_t pflash_readl_le(void *opaque, hwaddr addr)
+static void pflash_write_be(void *opaque, hwaddr addr, uint64_t data,
+                            unsigned size)
 {
     pflash_t *pfl = opaque;
-
-    return pflash_read(pfl, addr, 4, 0);
-}
-
-static void pflash_writeb_be(void *opaque, hwaddr addr,
-                             uint32_t value)
-{
-    pflash_write(opaque, addr, value, 1, 1);
-}
-
-static void pflash_writeb_le(void *opaque, hwaddr addr,
-                             uint32_t value)
-{
-    pflash_write(opaque, addr, value, 1, 0);
-}
-
-static void pflash_writew_be(void *opaque, hwaddr addr,
-                             uint32_t value)
-{
-    pflash_t *pfl = opaque;
-
-    pflash_write(pfl, addr, value, 2, 1);
-}
-
-static void pflash_writew_le(void *opaque, hwaddr addr,
-                             uint32_t value)
-{
-    pflash_t *pfl = opaque;
-
-    pflash_write(pfl, addr, value, 2, 0);
-}
-
-static void pflash_writel_be(void *opaque, hwaddr addr,
-                             uint32_t value)
-{
-    pflash_t *pfl = opaque;
-
-    pflash_write(pfl, addr, value, 4, 1);
-}
-
-static void pflash_writel_le(void *opaque, hwaddr addr,
-                             uint32_t value)
-{
-    pflash_t *pfl = opaque;
-
-    pflash_write(pfl, addr, value, 4, 0);
+    pflash_write(pfl, addr, data, size, 1);
 }
 
 static const MemoryRegionOps pflash_cfi02_ops_be = {
-    .old_mmio = {
-        .read = { pflash_readb_be, pflash_readw_be, pflash_readl_be, },
-        .write = { pflash_writeb_be, pflash_writew_be, pflash_writel_be, },
-    },
+    .read = pflash_read_be,
+    .write = pflash_write_be,
     .endianness = DEVICE_NATIVE_ENDIAN,
+    .valid.max_access_size = 8,
+    .impl.max_access_size = 8,
 };
 
 static const MemoryRegionOps pflash_cfi02_ops_le = {
-    .old_mmio = {
-        .read = { pflash_readb_le, pflash_readw_le, pflash_readl_le, },
-        .write = { pflash_writeb_le, pflash_writew_le, pflash_writel_le, },
-    },
+    .read = pflash_read_le,
+    .write = pflash_write_le,
     .endianness = DEVICE_NATIVE_ENDIAN,
+    .valid.max_access_size = 8,
+    .impl.max_access_size = 8,
 };
 
 static void pflash_cfi02_realize(DeviceState *dev, Error **errp)
-- 
2.14.2

