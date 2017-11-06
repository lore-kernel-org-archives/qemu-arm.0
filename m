Received: by 10.223.150.237 with SMTP id u100csp2783950wrb;
        Mon, 6 Nov 2017 07:49:24 -0800 (PST)
X-Google-Smtp-Source: ABhQp+RYnN6eLdhzikdeKQUr/2JmshEDH3ZfYh4jXg6BwEPWKwfR4tv7GugeAree00cxeD9sDfYH
X-Received: by 10.37.82.86 with SMTP id g83mr9631436ybb.106.1509983364345;
        Mon, 06 Nov 2017 07:49:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1509983364; cv=none;
        d=google.com; s=arc-20160816;
        b=EBRZUjbSB1K33EJ9j6NNY/5/00fJhVgBOEqKq1NLVT54Yzfv/MFBp76MFb0VY6swxh
         9xEiz86mI9S4MOzcyDFsZ+FEv8bs5FtA1qJUXOKRDcmBASBurjhDPrRmwTRsxFyhkU6q
         4kVuep4YElvZjX5aFhNI0ZHhTRmdDyMjGDeu6PBkUHq6xse7ZlJ2ljE+8QI5beisw9c7
         8XN7E7TyKWgrKQOvpdHdZt5k9qz9AXNSVxFhpu1KxXFZ82RlcJOoeKBbN9FgNl9fEvcV
         Nh5wEZYs2Usw3PQEl9UShx2+lPsEO8hhbkhPhMpif70g3YFngaHNFT1LB3n+/XxdMUfM
         eMOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=HHM0bWkdbbtuBP5Y1C0Yo+aOITHPwqW2WvJA6T7JlDw=;
        b=rtNVET2iXw14lh7Z9KhDlQCUseyXg4wOnBiGW+NqpJGkPKt5UBI0pV2jktuHwC+yLC
         U1ix0f2q509R+4k3MzKj8AU2qmgkKJPuBuVOlIiJ22NQZAlVWkj/4qtajoJQlfZ+rrMl
         2WPun7pHjWwmxy/UIJGqOhZ+7Od81/TrhEKRLXzMA7lcDr2VvlKWJx982bOyB2rbaJcS
         J/wlI0JH+nAC6yLYshwy20nXbeVobSFJW4vZOnNktBciWk3qDwQAxpm53QxOgHIaoSFw
         QCculvTkAucQUhyHm49z5iQPrwUy0yEhpxNJR9AowEisc1w7GQH01KofYq83/+sPTun8
         pDnA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=EHSW65S5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w20si2686462ybb.250.2017.11.06.07.49.24
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 06 Nov 2017 07:49:24 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=EHSW65S5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:48766 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eBjeN-0007d0-Mb
	for alex.bennee@linaro.org; Mon, 06 Nov 2017 10:49:23 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33280)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1eBjdZ-00070j-Kp
	for qemu-arm@nongnu.org; Mon, 06 Nov 2017 10:48:36 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1eBjdY-0000Ms-Ie
	for qemu-arm@nongnu.org; Mon, 06 Nov 2017 10:48:33 -0500
Received: from mail-pf0-x244.google.com ([2607:f8b0:400e:c00::244]:51854)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <andrew.smirnov@gmail.com>)
	id 1eBjdY-0000MX-AL; Mon, 06 Nov 2017 10:48:32 -0500
Received: by mail-pf0-x244.google.com with SMTP id n14so8007703pfh.8;
	Mon, 06 Nov 2017 07:48:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=HHM0bWkdbbtuBP5Y1C0Yo+aOITHPwqW2WvJA6T7JlDw=;
	b=EHSW65S5GhLFZzmDeEpKygyrHRb9oVZt1kRS3EHaPmXei55oJSTw2JV30lUJib8Twk
	ZAuZDiSJrysWFnM25p49Go0lCyJElPY3uZdUHAQiFEoYBQZ3qh8xdfXh7QdKCHd4mADS
	9bF+zjgs4dSeAsdabpVynf0JRQ/zAbpBGC8KyNcMIKc0+p/1BK19yU2+rMNKPk0saRiO
	InDopFHZbRPOrpRyP+C5V87g/CB6dpQeQO9Jl7GD/qSD9kW3PHc8RnYtLKpfOc/L94Tw
	LqE0IJIJ4OVBVabKzA+1mUrg2Kq/mvkn93BLhqys9N8uKZOKQVMc79BQmbNeNbphd+RQ
	8JqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=HHM0bWkdbbtuBP5Y1C0Yo+aOITHPwqW2WvJA6T7JlDw=;
	b=mHFF1N8siyvDI5Gem0H1wcV2j97xbk0SLfkMkeOtZvidjIyNWhJNsuvcJY9ElwgHOG
	cdVctGBbJK4jATv/H1WrNXFCCfajDgOK3lKej1YDDnC8yv96a4Bq6jr0ZupH1zqy9yiu
	QQNp27fgLts2tl7AMqmn4qMu4GCpVBgP5DBKa4A0Yg5DWnY+F3IxhF+ruUSnQOLnSQya
	JgJqi2W6VprmBbHrmeaqy1EI0SGlWK3U2iRUPLrNJtWc5ZtbELo7OWZ5TwTxMuMSNLhz
	+oZWs9YYbYxlKqRPD1DDtjIXYbZurA6NzuBeEGlZvCbZ3/vCCgU1awP3XqNXaLGRmrkU
	K3uQ==
X-Gm-Message-State: AMCzsaW/3yzJAogwEtXlxtGWrEdm/UtdDvKacNJhkBKkfqnvOxmC5Uav
	ZcIhAVpatLjAbzwJMrHZD38NvlN7b7o=
X-Received: by 10.98.55.133 with SMTP id e127mr16965775pfa.130.1509983310943; 
	Mon, 06 Nov 2017 07:48:30 -0800 (PST)
Received: from squirtle.lan (c-24-22-235-96.hsd1.wa.comcast.net.
	[24.22.235.96]) by smtp.gmail.com with ESMTPSA id
	x1sm22719590pfh.113.2017.11.06.07.48.29
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 06 Nov 2017 07:48:30 -0800 (PST)
From: Andrey Smirnov <andrew.smirnov@gmail.com>
To: qemu-arm@nongnu.org
Date: Mon,  6 Nov 2017 07:47:46 -0800
Message-Id: <20171106154813.19936-4-andrew.smirnov@gmail.com>
X-Mailer: git-send-email 2.13.6
In-Reply-To: <20171106154813.19936-1-andrew.smirnov@gmail.com>
References: <20171106154813.19936-1-andrew.smirnov@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::244
Subject: [Qemu-arm] [PATCH v3 03/30] imx_fec: Change queue flushing
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
X-TUID: 5tjDzLAPuCeX

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
Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
---
 hw/net/imx_fec.c         | 12 ++++++------
 include/hw/net/imx_fec.h |  1 +
 2 files changed, 7 insertions(+), 6 deletions(-)

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
diff --git a/include/hw/net/imx_fec.h b/include/hw/net/imx_fec.h
index 62ad473b05..4bc8f03ec2 100644
--- a/include/hw/net/imx_fec.h
+++ b/include/hw/net/imx_fec.h
@@ -252,6 +252,7 @@ typedef struct IMXFECState {
     uint32_t phy_int_mask;
 
     bool is_fec;
+    bool needs_flush;
 } IMXFECState;
 
 #endif
-- 
2.13.6

