Received: by 10.80.166.35 with SMTP id d32csp249450edc;
        Wed, 26 Oct 2016 13:03:08 -0700 (PDT)
X-Received: by 10.55.66.76 with SMTP id p73mr3524068qka.284.1477512188698;
        Wed, 26 Oct 2016 13:03:08 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q7si2204850qkf.99.2016.10.26.13.03.08
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 26 Oct 2016 13:03:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:37193 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bzUPk-0002CS-53
	for alex.bennee@linaro.org; Wed, 26 Oct 2016 16:03:08 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48011)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ppandit@redhat.com>) id 1bzUPg-0002CB-Rr
	for qemu-arm@nongnu.org; Wed, 26 Oct 2016 16:03:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ppandit@redhat.com>) id 1bzUPb-00069z-2Q
	for qemu-arm@nongnu.org; Wed, 26 Oct 2016 16:03:04 -0400
Received: from mx1.redhat.com ([209.132.183.28]:60358)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ppandit@redhat.com>)
	id 1bzUPa-00069g-Px; Wed, 26 Oct 2016 16:02:58 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C6663C04B95A;
	Wed, 26 Oct 2016 20:02:57 +0000 (UTC)
Received: from javelin.localdomain (vpn-55-145.rdu2.redhat.com [10.10.55.145])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with
	ESMTP id u9QK2pkN029168
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Wed, 26 Oct 2016 16:02:53 -0400
From: P J P <ppandit@redhat.com>
To: Qemu Developers <qemu-devel@nongnu.org>
Date: Thu, 27 Oct 2016 01:32:49 +0530
Message-Id: <1477512169-7737-1-git-send-email-ppandit@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Wed, 26 Oct 2016 20:02:57 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v3] net: smc91c111: check packet number and data
 register index
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Azure Yang <azureyang@tencent.com>, Jason Wang <jasowang@redhat.com>,
	qemu-arm <qemu-arm@nongnu.org>, Prasad J Pandit <pjp@fedoraproject.org>,
	Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: n0i/denP8O9+

From: Prasad J Pandit <pjp@fedoraproject.org>

SMSC91C111 Ethernet interface emulator has registers to store
'packet number' and a 'pointer' to Tx/Rx FIFO buffer area.
These two are used to derive an address to access into 'data'
registers. If they are set incorrectly, they could lead to an
OOB r/w access beyond packet 'data' area. Add check to avoid it.

Reported-by: Azure Yang <azureyang@tencent.com>
Signed-off-by: Prasad J Pandit <pjp@fedoraproject.org>
---
 hw/net/smc91c111.c | 32 ++++++++++++++++++++++++--------
 1 file changed, 24 insertions(+), 8 deletions(-)

Update per: add check to _release_packet and for 's->allocated'
  -> https://lists.gnu.org/archive/html/qemu-devel/2016-10/msg06530.html

diff --git a/hw/net/smc91c111.c b/hw/net/smc91c111.c
index 3b16dcf..e9b37c2 100644
--- a/hw/net/smc91c111.c
+++ b/hw/net/smc91c111.c
@@ -203,6 +203,9 @@ static void smc91c111_pop_tx_fifo_done(smc91c111_state *s)
 /* Release the memory allocated to a packet.  */
 static void smc91c111_release_packet(smc91c111_state *s, int packet)
 {
+    if (packet >= NUM_PACKETS || !(packet & s->allocated)) {
+        return;
+    }
     s->allocated &= ~(1 << packet);
     if (s->tx_alloc == 0x80)
         smc91c111_tx_alloc(s);
@@ -224,6 +227,9 @@ static void smc91c111_do_tx(smc91c111_state *s)
         return;
     for (i = 0; i < s->tx_fifo_len; i++) {
         packetnum = s->tx_fifo[i];
+        if (packetnum >= NUM_PACKETS || !(packetnum & s->allocated)) {
+            return;
+        }
         p = &s->data[packetnum][0];
         /* Set status word.  */
         *(p++) = 0x01;
@@ -418,7 +424,7 @@ static void smc91c111_writeb(void *opaque, hwaddr offset,
             /* Ignore.  */
             return;
         case 2: /* Packet Number Register */
-            s->packet_num = value;
+            s->packet_num = value & 0x03F;
             return;
         case 3: case 4: case 5:
             /* Should be readonly, but linux writes to them anyway. Ignore.  */
@@ -438,13 +444,17 @@ static void smc91c111_writeb(void *opaque, hwaddr offset,
                     n = s->rx_fifo[0];
                 else
                     n = s->packet_num;
-                p = s->ptr & 0x07ff;
+                p = s->ptr;
                 if (s->ptr & 0x4000) {
                     s->ptr = (s->ptr & 0xf800) | ((s->ptr + 1) & 0x7ff);
                 } else {
                     p += (offset & 3);
                 }
-                s->data[n][p] = value;
+                p &= 0x07ff;
+                if (s->allocated < NUM_PACKETS
+                    && n < NUM_PACKETS && n & s->allocated) {
+                    s->data[n][p] = value;
+                }
             }
             return;
         case 12: /* Interrupt ACK.  */
@@ -517,7 +527,8 @@ static uint32_t smc91c111_readb(void *opaque, hwaddr offset)
                 int i;
                 int n;
                 n = 0;
-                for (i = 0; i < NUM_PACKETS; i++) {
+                for (i = 0;
+                     s->allocated < NUM_PACKETS && i < NUM_PACKETS; i++) {
                     if (s->allocated & (1 << i))
                         n++;
                 }
@@ -558,9 +569,9 @@ static uint32_t smc91c111_readb(void *opaque, hwaddr offset)
         case 0: case 1: /* MMUCR Busy bit.  */
             return 0;
         case 2: /* Packet Number.  */
-            return s->packet_num;
+            return s->packet_num & 0x3F;
         case 3: /* Allocation Result.  */
-            return s->tx_alloc;
+            return s->tx_alloc < NUM_PACKETS ? s->tx_alloc : 0;
         case 4: /* TX FIFO */
             if (s->tx_fifo_done_len == 0)
                 return 0x80;
@@ -584,13 +595,18 @@ static uint32_t smc91c111_readb(void *opaque, hwaddr offset)
                     n = s->rx_fifo[0];
                 else
                     n = s->packet_num;
-                p = s->ptr & 0x07ff;
+                p = s->ptr;
                 if (s->ptr & 0x4000) {
                     s->ptr = (s->ptr & 0xf800) | ((s->ptr + 1) & 0x07ff);
                 } else {
                     p += (offset & 3);
                 }
-                return s->data[n][p];
+                p &= 0x07ff;
+                if (s->allocated < NUM_PACKETS
+                    && n < NUM_PACKETS && n & s->allocated) {
+                    return s->data[n][p];
+                }
+                return 0;
             }
         case 12: /* Interrupt status.  */
             return s->int_level;
-- 
2.7.4

