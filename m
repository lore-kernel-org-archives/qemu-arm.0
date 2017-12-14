Received: by 10.223.159.74 with SMTP id f10csp6409420wrg;
        Thu, 14 Dec 2017 06:56:39 -0800 (PST)
X-Google-Smtp-Source: ACJfBosPVTpsulDwU4Zj9EcT3YfAnsUpswNU0/yfJVCScJTLq+kUt9/IaFJIIVBryYO1CZRQAtAz
X-Received: by 10.129.155.209 with SMTP id s200mr4437804ywg.173.1513263399608;
        Thu, 14 Dec 2017 06:56:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1513263399; cv=none;
        d=google.com; s=arc-20160816;
        b=Iczd2ygIn8yDBfLHqpvBAd1PfRzyEERA60RBSNWJL6v3DHM/5Uwnfjo1Kw6/3agK1K
         dd0y8JgBSxO2KZ31KeCm0gYI8jnA5z25Y3yTATXZIeui6sL5uDSX7LWCdHXJefnORRrz
         +s0qTxvY5jsUA/1FMMwQ6OyY2NcLwyc9t4TJ+EnLm/8inTVIpuko1LnOC9LKBZgy11Vx
         oPJXvhJTAlo4Pxl+01L0QnlHm9DcrOKTXAY+3V6lw0WZDuwX+hMrcbKyRFsusTjXE4WG
         wqIR305mevw22Gi02nITPS2d7XlJlaOnKy0RO6uj5+Tb/BzkYOHvPPl74B6BQgm+7EJb
         nSlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=okFMpTBn3CPHVnnf0sYzsV4tcjnm7uVfAD8Wu4GZgfo=;
        b=Wx+ImAT/Pzb1qm35xSUhVHiDZGmHG52LGpZWcmjKyFvGtXbQjpJ1TC2GJ9VinYn2Pa
         ACSP/zaciNkycKVt2l/A3oLnUtRWYl9RlBxVygblSD0ORag+Xt9+j9TM7pEkSeA4Gxbi
         8ZZE593sNEYh5cMTK5THJe9CFvLt3L3qABmBCwyzpLT3fFB1tHdLrd/Vjzbvz9TujNjw
         ZOBz6RERE4zAkoV0dD6h9EXwRv1eHT7CTMB1o/AVwFGjiyhnY4iA8+DEIAvUEv+dtUwa
         zet1sAAnm2j4vARfAdNra8mVseeuiVbgPgtfkQGUfVRVfcbb9HQ9Jfa/0NwPE4V0e7E8
         yZdw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=eEIw2cvo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d123si865390ywe.744.2017.12.14.06.56.39
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 14 Dec 2017 06:56:39 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=eEIw2cvo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:41379 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ePUwB-0003ss-0H
	for alex.bennee@linaro.org; Thu, 14 Dec 2017 09:56:39 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55064)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1ePUt3-0001M4-Dh
	for qemu-arm@nongnu.org; Thu, 14 Dec 2017 09:53:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1ePUt2-0000JC-DH
	for qemu-arm@nongnu.org; Thu, 14 Dec 2017 09:53:25 -0500
Received: from mail-pf0-x243.google.com ([2607:f8b0:400e:c00::243]:36674)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <andrew.smirnov@gmail.com>)
	id 1ePUt2-0000H0-7F; Thu, 14 Dec 2017 09:53:24 -0500
Received: by mail-pf0-x243.google.com with SMTP id p84so3774381pfd.3;
	Thu, 14 Dec 2017 06:53:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=okFMpTBn3CPHVnnf0sYzsV4tcjnm7uVfAD8Wu4GZgfo=;
	b=eEIw2cvoDIF0i9IZJRNSkYsErfyvjD9nSSnU96Nm3Zrjp1mlFNDsSvJpxPj4WX7sWQ
	VHXoXz8o/zYrClw/kDxjqZGI65XpiNC77XsHvl8UMJ9L2lS5eFZvO3ZxgGy3gfrw2W9J
	MDbREOdnl/LBtUmoRtgf0cEVxdxW9ajtj3tw1qdX++I5+xLUNy+++TWFHhBS7daCLjml
	ywhMFx6R34ocNRZpg1Qql/Lo6XODIT+4J+wj2tYB/O+JCNgNP0aAp1gcR90CmG5kpw/U
	RLErOyyjj6NU89PBODRSjwIJR+Ao2m3fW8T4AqH+pjVsvrWGrDPxpPQQqJIDsddIAoPU
	5P9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=okFMpTBn3CPHVnnf0sYzsV4tcjnm7uVfAD8Wu4GZgfo=;
	b=idfae42+0vZ6w2H5UVc7SPth0kt8t4ehdqDfV2YSe1NmRtmE4fYkOkRFxzaBOF+NqU
	Dx8hIwRa33vxyF/3fyskmiLHUQY3bx8Z0+QxmM+jMbVP7JZs/8rgt7DoAv4MYRXI4xLj
	OHFh4v9N0jeLGT1Ta73Ml1V8srWBegDLbm3tr+UwXU4+W0izkkCfr1ZoQEIFsRH1YYYr
	1t1ScbRQESffu2OuCDYkTxNK/GSu5nC8KIWlLQa+Iamrlk2d47A+UJfLxh49zPGyP//2
	dlp9qvaarFVpXR9xwgPgKnrhOF+yky006zC5A56Jr2NMZFh4Cec6fgfqeKmajT+DxXWo
	qzfA==
X-Gm-Message-State: AKGB3mKVnD52ii2hLHSrGkwSKcAwKVIJ6rW8+03V8p2UmwyNxHLSdOZ8
	yHUXk5RowYJpIMGEXnwZaNNB2wA2
X-Received: by 10.98.17.196 with SMTP id 65mr9971369pfr.35.1513263202653;
	Thu, 14 Dec 2017 06:53:22 -0800 (PST)
Received: from squirtle.lan (c-24-22-235-96.hsd1.wa.comcast.net.
	[24.22.235.96])
	by smtp.gmail.com with ESMTPSA id e7sm8757439pfj.44.2017.12.14.06.53.20
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 14 Dec 2017 06:53:21 -0800 (PST)
From: Andrey Smirnov <andrew.smirnov@gmail.com>
To: qemu-arm@nongnu.org
Date: Thu, 14 Dec 2017 06:52:43 -0800
Message-Id: <20171214145255.31545-4-andrew.smirnov@gmail.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20171214145255.31545-1-andrew.smirnov@gmail.com>
References: <20171214145255.31545-1-andrew.smirnov@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::243
Subject: [Qemu-arm] [PATCH v2 03/15] imx_fec: Change queue flushing
 heuristics
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	Jason Wang <jasowang@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, yurovsky@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: c0SwbzjUfWd8

In current implementation, packet queue flushing logic seem to suffer
from a deadlock like scenario if a packet is received by the interface
before before Rx ring is initialized by Guest's driver. Consider the
following sequence of events:

	1. A QEMU instance is started against a TAP device on Linux
	   host, running Linux guest, e. g., something to the effect
	   of:

	   qemu-system-arm \
	      -net nic,model=imx.fec,netdev=lan0 \
	      netdev tap,id=lan0,ifname=tap0,script=no,downscript=no \
	      ... rest of the arguments ...

	2. Once QEMU starts, but before guest reaches the point where
	   FEC deriver is done initializing the HW, Guest, via TAP
	   interface, receives a number of multicast MDNS packets from
	   Host (not necessarily true for every OS, but it happens at
	   least on Fedora 25)

	3. Recieving a packet in such a state results in
	   imx_eth_can_receive() returning '0', which in turn causes
	   tap_send() to disable corresponding event (tap.c:203)

	4. Once Guest's driver reaches the point where it is ready to
	   recieve packets it prepares Rx ring descriptors and writes
	   ENET_RDAR_RDAR to ENET_RDAR register to indicate to HW that
	   more descriptors are ready. And at this points emulation
	   layer does this:

	   	 s->regs[index] = ENET_RDAR_RDAR;
                 imx_eth_enable_rx(s);

	   which, combined with:

	   	  if (!s->regs[ENET_RDAR]) {
		     qemu_flush_queued_packets(qemu_get_queue(s->nic));
		  }

	   results in Rx queue never being flushed and corresponding
	   I/O event beign disabled.

To prevent the problem, change the code to always flush packet queue
when ENET_RDAR transitions 0 -> ENET_RDAR_RDAR.

Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: Jason Wang <jasowang@redhat.com>
Cc: Philippe Mathieu-Daudé <f4bug@amsat.org>
Cc: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Cc: yurovsky@gmail.com
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
---
 hw/net/imx_fec.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/hw/net/imx_fec.c b/hw/net/imx_fec.c
index 8b2e4b8ffe..eb034ffd0c 100644
--- a/hw/net/imx_fec.c
+++ b/hw/net/imx_fec.c
@@ -533,7 +533,7 @@ static void imx_eth_do_tx(IMXFECState *s)
     }
 }
 
-static void imx_eth_enable_rx(IMXFECState *s)
+static void imx_eth_enable_rx(IMXFECState *s, bool flush)
 {
     IMXFECBufDesc bd;
     bool rx_ring_full;
@@ -544,7 +544,7 @@ static void imx_eth_enable_rx(IMXFECState *s)
 
     if (rx_ring_full) {
         FEC_PRINTF("RX buffer full\n");
-    } else if (!s->regs[ENET_RDAR]) {
+    } else if (flush) {
         qemu_flush_queued_packets(qemu_get_queue(s->nic));
     }
 
@@ -807,7 +807,7 @@ static void imx_eth_write(void *opaque, hwaddr offset, uint64_t value,
         if (s->regs[ENET_ECR] & ENET_ECR_ETHEREN) {
             if (!s->regs[index]) {
                 s->regs[index] = ENET_RDAR_RDAR;
-                imx_eth_enable_rx(s);
+                imx_eth_enable_rx(s, true);
             }
         } else {
             s->regs[index] = 0;
@@ -930,7 +930,7 @@ static int imx_eth_can_receive(NetClientState *nc)
 
     FEC_PRINTF("\n");
 
-    return s->regs[ENET_RDAR] ? 1 : 0;
+    return !!s->regs[ENET_RDAR];
 }
 
 static ssize_t imx_fec_receive(NetClientState *nc, const uint8_t *buf,
@@ -1020,7 +1020,7 @@ static ssize_t imx_fec_receive(NetClientState *nc, const uint8_t *buf,
         }
     }
     s->rx_descriptor = addr;
-    imx_eth_enable_rx(s);
+    imx_eth_enable_rx(s, false);
     imx_eth_update(s);
     return len;
 }
@@ -1116,7 +1116,7 @@ static ssize_t imx_enet_receive(NetClientState *nc, const uint8_t *buf,
         }
     }
     s->rx_descriptor = addr;
-    imx_eth_enable_rx(s);
+    imx_eth_enable_rx(s, false);
     imx_eth_update(s);
     return len;
 }
-- 
2.14.3

