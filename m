Received: by 10.25.159.19 with SMTP id i19csp284241lfe;
        Thu, 14 Jan 2016 23:00:56 -0800 (PST)
X-Received: by 10.140.230.8 with SMTP id a8mr12377975qhc.31.1452841256853;
        Thu, 14 Jan 2016 23:00:56 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p6si11823111qgd.81.2016.01.14.23.00.56
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 14 Jan 2016 23:00:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:45569 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aJyNU-0006Pa-An
	for alex.bennee@linaro.org; Fri, 15 Jan 2016 02:00:56 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48416)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ppandit@redhat.com>) id 1aJyNR-0006PE-Vk
	for qemu-arm@nongnu.org; Fri, 15 Jan 2016 02:00:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ppandit@redhat.com>) id 1aJyNO-0000uY-Ob
	for qemu-arm@nongnu.org; Fri, 15 Jan 2016 02:00:53 -0500
Received: from mx1.redhat.com ([209.132.183.28]:53976)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ppandit@redhat.com>)
	id 1aJyNO-0000u0-J2; Fri, 15 Jan 2016 02:00:50 -0500
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	by mx1.redhat.com (Postfix) with ESMTPS id 81435C07662E;
	Fri, 15 Jan 2016 07:00:49 +0000 (UTC)
Received: from javelin.localdomain (vpn1-4-105.ams2.redhat.com [10.36.4.105])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with
	ESMTP id u0F70g2U017834
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Fri, 15 Jan 2016 02:00:45 -0500
From: P J P <ppandit@redhat.com>
To: QEMU Developers <qemu-devel@nongnu.org>
Date: Fri, 15 Jan 2016 12:30:40 +0530
Message-Id: <1452841240-30377-1-git-send-email-ppandit@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: Jason Wang <jasowang@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	Prasad J Pandit <pjp@fedoraproject.org>, Ling Liu <liuling-it@360.cn>,
	"Michael S. Tsirkin" <mst@redhat.com>
Subject: [Qemu-arm] [PATCH] net: cadence_gem: check packet size in
	gem_recieve
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: Vf1MiPpZPD0b

From: Prasad J Pandit <pjp@fedoraproject.org>

While receiving packets in 'gem_receive' routine, if Frame Check
Sequence(FCS) is enabled, it copies the packet into a local
buffer without checking its size. Add check to validate packet
length against the buffer size to avoid buffer overflow.

Reported-by: Ling Liu <liuling-it@360.cn>
Signed-off-by: Prasad J Pandit <pjp@fedoraproject.org>
---
 hw/net/cadence_gem.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/hw/net/cadence_gem.c b/hw/net/cadence_gem.c
index 3639fc1..c3a273b 100644
--- a/hw/net/cadence_gem.c
+++ b/hw/net/cadence_gem.c
@@ -677,10 +677,14 @@ static ssize_t gem_receive(NetClientState *nc, const uint8_t *buf, size_t size)
     } else {
         unsigned crc_val;
 
+        if (size > sizeof(rxbuf) - sizeof(crc_val)) {
+            size = sizeof(rxbuf) - sizeof(crc_val);
+        }
+        bytes_to_copy = size;
+
         /* The application wants the FCS field, which QEMU does not provide.
          * We must try and calculate one.
          */
-
         memcpy(rxbuf, buf, size);
         memset(rxbuf + size, 0, sizeof(rxbuf) - size);
         rxbuf_ptr = rxbuf;
-- 
2.5.0

