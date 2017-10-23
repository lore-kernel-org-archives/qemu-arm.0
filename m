Received: by 10.223.161.27 with SMTP id o27csp229654wro;
        Mon, 23 Oct 2017 13:11:38 -0700 (PDT)
X-Received: by 10.129.74.84 with SMTP id x81mr9506618ywa.219.1508789498219;
        Mon, 23 Oct 2017 13:11:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1508789498; cv=none;
        d=google.com; s=arc-20160816;
        b=zSj5D2gEeWzRnZDkI19nVtN5jxIOYzyhPQCG8Xu1jTkvwe2x5MQkboM7GPtTAL1grP
         9E8wgnMnUb9IIbx8w04Hpf1wWh/hbUWtbpd5tfhH0VXIrMJ5Ua20/31LTKHn5WAtFeIG
         A+7Z7dHiFLaouOVt7SHMa5r6DZ6NDvRVKjwc3eSlSQhnfsP9BKx0k7xrmeRjhfnKtVl4
         4Y4a3BENMt9RSlkaXw2x1V03FBiGZmgOBK00FxIyG9cPDZQHRv0vRakPj7tLkei6WiyO
         uGl03Z8HqYPKidkXQIIS/mDNEV2JuEy8ALxCKiJDMoLZbxxdGXPwIxJw0COiOZDqGPNJ
         9brQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=+YqRSUlO8UVt4KhrEMRENRxa2VJKL09ZOzda1SuGMZY=;
        b=iedJIgFzjb/1vnULDae9i//T7GIIpvefRSI8rj3Db5j69YROW87xdSrFbSeY0G2dtt
         CZVRvuN6PUiBW104OXve1MDh+k3ldnOgMKa9TXE45rejH3WY2dV8H4LK6ZTwbZyrRwfK
         u7B4p3TAEwADn4lHfLBUpngLivYdE7/UcabgbZldlPVoni2Ie8L53VpT5Exo4Ovk3AZu
         Gir+jsnzjAF1MvPWVQyRLWm/qHIKGDWkL4FbApYRoxz0QX5e5yQ8yQYrwRLq/5BZ6o6g
         RhaL5FdIHcmmIyZAQ9zyH5+UsjpRaS7P34GUUBa4+JLeP3SBc4SlZrYPMBUHy42eTm+m
         CNcw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=SvbAt/k0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w14si1308005ybk.139.2017.10.23.13.11.38
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 23 Oct 2017 13:11:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=SvbAt/k0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:40370 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e6j4T-0000Ac-GQ
	for alex.bennee@linaro.org; Mon, 23 Oct 2017 16:11:37 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46055)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1e6j4D-00007V-8b
	for qemu-arm@nongnu.org; Mon, 23 Oct 2017 16:11:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1e6j4B-0002Rn-Tg
	for qemu-arm@nongnu.org; Mon, 23 Oct 2017 16:11:21 -0400
Received: from mail-pf0-x242.google.com ([2607:f8b0:400e:c00::242]:51657)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <andrew.smirnov@gmail.com>)
	id 1e6j4B-0002Rb-LB; Mon, 23 Oct 2017 16:11:19 -0400
Received: by mail-pf0-x242.google.com with SMTP id n14so17898264pfh.8;
	Mon, 23 Oct 2017 13:11:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=+YqRSUlO8UVt4KhrEMRENRxa2VJKL09ZOzda1SuGMZY=;
	b=SvbAt/k0Xu4k36rfPaApvoaBgdPkDLY3b77kTPj7mSj8iMsiUqwVNwL8o7U0dCet7J
	EAS+XPY36z8ftroZjuIAlEm+kflCIrltHB3Ho4qWzzPYsM9avC+9o05gOBHJIGJ1Jcxb
	CpXxUi8HkN2WHFogsfjMgY+AzDal3o8c8ziI2yKtDR++w81Zd9yti1SINSJKyZSpLgNu
	CsSHbxiIdkFXGg/38mNM70+52IMKelq9rJ4FsXEzT78xtQ0K/5QV+m9M65laLFWSzaWl
	c17F7nO+I32djCCkIyWV6L7P3oAOe1hFpzGGDZcegDDlcY0It0OkJVxrG9+g6twPDHqH
	io8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=+YqRSUlO8UVt4KhrEMRENRxa2VJKL09ZOzda1SuGMZY=;
	b=mfarxPI6R/qDqmVZDvIuLPbYGAUEQOI53IAZyeVQJbnpK3xzDrrtmAWpw4y2NNt8xb
	A8vE2f1ZMbEh8xNAcYYKTgn9dDg2EgPYnXiuyD5iM2bCF1tTFaOayRYHKQdeNRFxj+xl
	JxDix71cbxCgV6se4wbX2zOHBhtQwRnE2H2DCEMmumnCckF+jAqjobm8EXgEwpSzPUaX
	aCUnewtt325SbtWQNCepKAXkORiwBN0az0muDMUszEO1lx2B6FskfSSaRgShGeN6zR08
	+7JfTeoB/qKBtppLEE9nXD/Qv74HD2qyTcSbM2k/tbUc3Sgx05vY7yvAhkuL+987wN+o
	tmvA==
X-Gm-Message-State: AMCzsaX1iIoPod6uOdRUIlWLjHtO2RKja/dm6pagQkhHyMVnv74eqq2t
	RYp6dFxiz1ShnS88SkqiPwAIsNaH
X-Google-Smtp-Source: ABhQp+RzzKVPnZIRB8XFi6IY255N1cd7EAalNnR0zVX05t73YUaE1iLw14CKd0Xh62aA4r2KDAPBHw==
X-Received: by 10.99.114.24 with SMTP id n24mr12508572pgc.253.1508789478379;
	Mon, 23 Oct 2017 13:11:18 -0700 (PDT)
Received: from squirtle.westlake.spaceflightindustries.com ([173.226.206.194])
	by smtp.gmail.com with ESMTPSA id
	j1sm15181623pfj.108.2017.10.23.13.11.17
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 23 Oct 2017 13:11:17 -0700 (PDT)
From: Andrey Smirnov <andrew.smirnov@gmail.com>
To: qemu-arm@nongnu.org
Date: Mon, 23 Oct 2017 13:10:31 -0700
Message-Id: <20171023201055.21973-4-andrew.smirnov@gmail.com>
X-Mailer: git-send-email 2.13.5
In-Reply-To: <20171023201055.21973-1-andrew.smirnov@gmail.com>
References: <20171023201055.21973-1-andrew.smirnov@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::242
Subject: [Qemu-arm] [PATCH v2 03/27] imx_fec: Change queue flushing
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
X-TUID: 0it7YU+ZoHtN

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
2.13.5

