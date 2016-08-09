Received: by 10.25.21.156 with SMTP id 28csp304279lfv;
        Mon, 8 Aug 2016 20:54:26 -0700 (PDT)
X-Received: by 10.55.33.80 with SMTP id h77mr6802656qkh.133.1470714866359;
        Mon, 08 Aug 2016 20:54:26 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o84si3940262qke.190.2016.08.08.20.54.26
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 08 Aug 2016 20:54:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=hotmail.com
Received: from localhost ([::1]:33341 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bWy7V-0001FR-Re
	for alex.bennee@linaro.org; Mon, 08 Aug 2016 23:54:25 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44395)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <chaojianhu@hotmail.com>) id 1bWy6G-0000Ea-8W
	for qemu-devel@nongnu.org; Mon, 08 Aug 2016 23:53:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <chaojianhu@hotmail.com>) id 1bWy6D-0006cD-4p
	for qemu-devel@nongnu.org; Mon, 08 Aug 2016 23:53:08 -0400
Received: from blu004-omc2s10.hotmail.com ([65.55.111.85]:55196)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <chaojianhu@hotmail.com>)
	id 1bWy6D-0006c6-0q; Mon, 08 Aug 2016 23:53:05 -0400
Received: from BLU436-SMTP98 ([65.55.111.71]) by BLU004-OMC2S10.hotmail.com
	over TLS secured channel with Microsoft SMTPSVC(7.5.7601.23008);
	Mon, 8 Aug 2016 20:53:04 -0700
X-TMN: [+6p7uL/wdLvB9XmEiurSQztHeT5cWB3CBKQM7T9Xqik=]
X-Originating-Email: [chaojianhu@hotmail.com]
Message-ID: <BLU436-SMTP98842C445B9A4E4B033261DB1C0@phx.gbl>
From: chaojianhu <chaojianhu@hotmail.com>
To: qemu-devel@nongnu.org
Date: Tue, 9 Aug 2016 11:52:54 +0800
X-Mailer: git-send-email 1.9.1
X-OriginalArrivalTime: 09 Aug 2016 03:53:03.0763 (UTC)
	FILETIME=[87C3E630:01D1F1F1]
MIME-Version: 1.0
Content-Type: text/plain
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 65.55.111.85
Subject: [Qemu-devel] [PATCH] hw/net: Fix a heap overflow in
 xlnx.xps-ethernetlite
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
Cc: qemu-trivial@nongnu.org, jasowang@redhat.com, alistair.francis@xilinx.com,
	qemu-arm@nongnu.org, edgar.iglesias@gmail.com,
	chaojianhu <chaojianhu@hotmail.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: OxWMTC+b+Vf7

The .receive callback of xlnx.xps-ethernetlite doesn't check the length
of data before calling memcpy. As a result, the NetClientState object in
heap will be overflowed. All versions of qemu with xlnx.xps-ethernetlite
will be affected.

Reported-by: chaojianhu <chaojianhu@hotmail.com>
Signed-off-by: chaojianhu <chaojianhu@hotmail.com>

---
 hw/net/xilinx_ethlite.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/net/xilinx_ethlite.c b/hw/net/xilinx_ethlite.c
index 54db2b8..35de353 100644
--- a/hw/net/xilinx_ethlite.c
+++ b/hw/net/xilinx_ethlite.c
@@ -197,6 +197,10 @@ static ssize_t eth_rx(NetClientState *nc, const uint8_t *buf, size_t size)
     }
 
     D(qemu_log("%s %zd rxbase=%x\n", __func__, size, rxbase));
+    if (size > (R_MAX - R_RX_BUF0 - rxbase) * 4) {
+        D(qemu_log("ethlite packet is too big, size=%x\n", size));
+        return -1;
+    }
     memcpy(&s->regs[rxbase + R_RX_BUF0], buf, size);
 
     s->regs[rxbase + R_RX_CTRL0] |= CTRL_S;
-- 
1.9.1

