Received: by 10.25.159.19 with SMTP id i19csp1664124lfe;
        Thu, 14 Jan 2016 01:43:44 -0800 (PST)
X-Received: by 10.55.76.134 with SMTP id z128mr3961600qka.90.1452764624047;
        Thu, 14 Jan 2016 01:43:44 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z194si6536611qhz.89.2016.01.14.01.43.43
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 14 Jan 2016 01:43:44 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:41072 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aJeRS-0006GC-B3
	for alex.bennee@linaro.org; Thu, 14 Jan 2016 04:43:42 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43881)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1aJeRQ-0006G0-9e
	for qemu-arm@nongnu.org; Thu, 14 Jan 2016 04:43:41 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1aJeRN-0004lA-0l
	for qemu-arm@nongnu.org; Thu, 14 Jan 2016 04:43:40 -0500
Received: from mx1.redhat.com ([209.132.183.28]:46944)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>)
	id 1aJeRM-0004l6-S6; Thu, 14 Jan 2016 04:43:36 -0500
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (Postfix) with ESMTPS id 387A0A0626;
	Thu, 14 Jan 2016 09:43:35 +0000 (UTC)
Received: from redhat.com (vpn1-7-92.ams2.redhat.com [10.36.7.92])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u0E9hVsx013094; Thu, 14 Jan 2016 04:43:31 -0500
Date: Thu, 14 Jan 2016 11:43:30 +0200
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Message-ID: <1452764448-17953-1-git-send-email-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
X-Mutt-Fcc: =sent
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: Jason Wang <jasowang@redhat.com>, Prasad Pandit <ppandit@redhat.com>,
	qemu-arm@nongnu.org,
	=?us-ascii?B?PT9VVEYtOD9xPz1FNT04OD05OD1FND1CQj1BND89?=
	<liuling-it@360.cn>, Alistair Francis <alistair.francis@xilinx.com>
Subject: [Qemu-arm] [PATCH] cadence_gem: fix buffer overflow
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
X-TUID: xnpfKMnpboMc

gem_receive copies a packet received from network into an rxbuf[2048]
array on stack, with size limited by descriptor length set by guest.  If
guest is malicious and specifies a descriptor length that is too large,
and should packet size exceed array size, this results in a buffer
overflow.

Reported-by: =E5=88=98=E4=BB=A4 <liuling-it@360.cn>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/net/cadence_gem.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/hw/net/cadence_gem.c b/hw/net/cadence_gem.c
index 3639fc1..15a0786 100644
--- a/hw/net/cadence_gem.c
+++ b/hw/net/cadence_gem.c
@@ -862,6 +862,14 @@ static void gem_transmit(CadenceGEMState *s)
             break;
         }
=20
+        if (tx_desc_get_length(desc) > sizeof(tx_packet) - (p - tx_packe=
t)) {
+            DB_PRINT("TX descriptor @ 0x%x too large: size 0x%x space 0x=
%x\n",
+                     (unsigned)packet_desc_addr,
+                     (unsigned)tx_desc_get_length(desc),
+                     sizeof(tx_packet) - (p - tx_packet));
+            break;
+        }
+
         /* Gather this fragment of the packet from "dma memory" to our c=
ontig.
          * buffer.
          */
--=20
MST
