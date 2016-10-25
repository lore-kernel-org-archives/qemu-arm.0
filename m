Received: by 10.80.166.35 with SMTP id d32csp3157744edc;
        Tue, 25 Oct 2016 05:22:50 -0700 (PDT)
X-Received: by 10.55.81.85 with SMTP id f82mr18274091qkb.294.1477398136382;
        Tue, 25 Oct 2016 05:22:16 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 95si13347872qkp.204.2016.10.25.05.22.16
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 25 Oct 2016 05:22:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:54084 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bz0kB-0001ee-Oz
	for alex.bennee@linaro.org; Tue, 25 Oct 2016 08:22:15 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42113)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ppandit@redhat.com>) id 1bz0k7-0001db-JB
	for qemu-arm@nongnu.org; Tue, 25 Oct 2016 08:22:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ppandit@redhat.com>) id 1bz0k3-0005ln-KA
	for qemu-arm@nongnu.org; Tue, 25 Oct 2016 08:22:11 -0400
Received: from mx1.redhat.com ([209.132.183.28]:51768)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ppandit@redhat.com>)
	id 1bz0k3-0005lF-F0; Tue, 25 Oct 2016 08:22:07 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B728A7F415;
	Tue, 25 Oct 2016 12:22:06 +0000 (UTC)
Received: from javelin.localdomain (vpn-55-172.rdu2.redhat.com [10.10.55.172])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with
	ESMTP id u9PCM1cH007843
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Tue, 25 Oct 2016 08:22:03 -0400
From: P J P <ppandit@redhat.com>
To: Qemu Developers <qemu-devel@nongnu.org>
Date: Tue, 25 Oct 2016 17:52:00 +0530
Message-Id: <1477398120-9000-1-git-send-email-ppandit@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Tue, 25 Oct 2016 12:22:06 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH] net: smc91c111: check packet number and data
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
	qemu-arm <qemu-arm@nongnu.org>, Prasad J Pandit <pjp@fedoraproject.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: e4lNk9/AN0Io

From: Prasad J Pandit <pjp@fedoraproject.org>

SMSC91C111 Ethernet interface emulator has registers to store
'packet number' and a 'pointer' to Tx/Rx FIFO buffer area.
These two are used to derive an address to access into 'data'
registers. If they are not set correctly, they could lead to
OOB r/w access beyond packet 'data' area. Add check to avoid it.

Reported-by: Azure Yang <azureyang@tencent.com>
Signed-off-by: Prasad J Pandit <pjp@fedoraproject.org>
---
 hw/net/smc91c111.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/hw/net/smc91c111.c b/hw/net/smc91c111.c
index 3b16dcf..2425da1 100644
--- a/hw/net/smc91c111.c
+++ b/hw/net/smc91c111.c
@@ -418,7 +418,7 @@ static void smc91c111_writeb(void *opaque, hwaddr offset,
             /* Ignore.  */
             return;
         case 2: /* Packet Number Register */
-            s->packet_num = value;
+            s->packet_num = value & (NUM_PACKETS - 1);
             return;
         case 3: case 4: case 5:
             /* Should be readonly, but linux writes to them anyway. Ignore.  */
@@ -444,7 +444,10 @@ static void smc91c111_writeb(void *opaque, hwaddr offset,
                 } else {
                     p += (offset & 3);
                 }
-                s->data[n][p] = value;
+                if (n < NUM_PACKETS
+                    && p < sizeof(s->data[n]) / sizeof(s->data[n][0])) {
+                    s->data[n][p] = value;
+                }
             }
             return;
         case 12: /* Interrupt ACK.  */
@@ -590,7 +593,12 @@ static uint32_t smc91c111_readb(void *opaque, hwaddr offset)
                 } else {
                     p += (offset & 3);
                 }
-                return s->data[n][p];
+
+                if (n < NUM_PACKETS
+                    && p < sizeof(s->data[n]) / sizeof(s->data[n][0])) {
+                    return s->data[n][p];
+                }
+                return 0x80;
             }
         case 12: /* Interrupt status.  */
             return s->int_level;
-- 
2.7.4

