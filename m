Received: by 10.80.166.35 with SMTP id d32csp45198edc;
        Wed, 26 Oct 2016 05:48:42 -0700 (PDT)
X-Received: by 10.237.36.28 with SMTP id r28mr1332057qtc.99.1477486122055;
        Wed, 26 Oct 2016 05:48:42 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 38si1237861qtv.117.2016.10.26.05.48.41
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 26 Oct 2016 05:48:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:33943 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bzNdH-0001yc-3g
	for alex.bennee@linaro.org; Wed, 26 Oct 2016 08:48:39 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49050)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ppandit@redhat.com>) id 1bzN9O-0001hk-1A
	for qemu-arm@nongnu.org; Wed, 26 Oct 2016 08:17:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ppandit@redhat.com>) id 1bzN9J-0002EG-AB
	for qemu-arm@nongnu.org; Wed, 26 Oct 2016 08:17:46 -0400
Received: from mx1.redhat.com ([209.132.183.28]:43956)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ppandit@redhat.com>)
	id 1bzN9J-0002E4-4V; Wed, 26 Oct 2016 08:17:41 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 600CB12B2D;
	Wed, 26 Oct 2016 12:17:40 +0000 (UTC)
Received: from javelin.localdomain (vpn-55-145.rdu2.redhat.com [10.10.55.145])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with
	ESMTP id u9QCHYHC021093
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Wed, 26 Oct 2016 08:17:37 -0400
From: P J P <ppandit@redhat.com>
To: Qemu Developers <qemu-devel@nongnu.org>
Date: Wed, 26 Oct 2016 17:47:33 +0530
Message-Id: <1477484253-32731-1-git-send-email-ppandit@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Wed, 26 Oct 2016 12:17:40 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v2] net: smc91c111: check packet number and data
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
X-TUID: OzzF6Chp4oZB

From: Prasad J Pandit <pjp@fedoraproject.org>

SMSC91C111 Ethernet interface emulator has registers to store
'packet number' and a 'pointer' to Tx/Rx FIFO buffer area.
These two are used to derive an address to access into 'data'
registers. If they are set incorrectly, they could lead to an
OOB r/w access beyond packet 'data' area. Add check to avoid it.

Reported-by: Azure Yang <azureyang@tencent.com>
Signed-off-by: Prasad J Pandit <pjp@fedoraproject.org>
---
 hw/net/smc91c111.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

Update per:
  -> https://lists.gnu.org/archive/html/qemu-devel/2016-10/msg06108.html

diff --git a/hw/net/smc91c111.c b/hw/net/smc91c111.c
index 3b16dcf..f9698ca 100644
--- a/hw/net/smc91c111.c
+++ b/hw/net/smc91c111.c
@@ -418,7 +418,7 @@ static void smc91c111_writeb(void *opaque, hwaddr offset,
             /* Ignore.  */
             return;
         case 2: /* Packet Number Register */
-            s->packet_num = value;
+            s->packet_num = value & 0x03F;
             return;
         case 3: case 4: case 5:
             /* Should be readonly, but linux writes to them anyway. Ignore.  */
@@ -438,13 +438,16 @@ static void smc91c111_writeb(void *opaque, hwaddr offset,
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
+                if (n < NUM_PACKETS && n & s->allocated) {
+                    s->data[n][p] = value;
+                }
             }
             return;
         case 12: /* Interrupt ACK.  */
@@ -584,13 +587,17 @@ static uint32_t smc91c111_readb(void *opaque, hwaddr offset)
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
+                if (n < NUM_PACKETS && n & s->allocated) {
+                    return s->data[n][p];
+                }
+                return 0;
             }
         case 12: /* Interrupt status.  */
             return s->int_level;
-- 
2.7.4

