Received: by 10.223.134.117 with SMTP id 50csp11156579wrw;
        Tue, 2 Jan 2018 11:37:12 -0800 (PST)
X-Google-Smtp-Source: ACJfBosMDDHChw4h5+9QgTt4DwCaWTmWd62L/bo+ZUsET1HuO1WjyrHe3RMwxWoaKy355raiSdwh
X-Received: by 10.129.75.8 with SMTP id y8mr30916783ywa.100.1514921832395;
        Tue, 02 Jan 2018 11:37:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1514921832; cv=none;
        d=google.com; s=arc-20160816;
        b=wO/VqgavbPbfdndqnkC2dXVTE7MJR7fG3+HvfNz5pR1ERAv+SyrY4aEYVgVexpByb8
         EpS14D4A/oLUj/BKXJB6/V5ioL4tH7O3v5NgQ7N6UJzAh7EPXWJKB2Xp0AbI2sMEd9Ja
         tXYRYGM3r5Ihmz9hkp1t7WhEoMYxe9UfgOc0Z9elpV1ktlEGGOgOEyqy9tqxkrt3qpIX
         xDlxXz9n7WEiy2jn4iMvVUBEB63MmrOKbsI1kHgp6Xr9UP8okQGhnRz49OCAnOsASWOy
         in6OxCM88tRhpaXcNCYZM7HYP/bbo5NOYs8RR3DhQluNTR7JseomAgF43iTiWs2EBlQn
         eiNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=okFMpTBn3CPHVnnf0sYzsV4tcjnm7uVfAD8Wu4GZgfo=;
        b=cSUqBGIfHJB6kQxmTfv8dREOuceuHVjrLSaejVrG8IUGNgjuXgYHhSJDb2MSa+Asre
         VHGPyP71FyurggdekF7HBz7NJm0zRLzcdt9HqCM7SADxefPmjY/PrZe3Xz6/7f7mVe/H
         SZuqhOqhg2yHTrP0Cx7dnMx3wIuFobDwZvJm5IEUVDHRcj38hdqM48C+F6SRZqorJcFV
         wuH6NI3O8XyDw1WqhEuKPD0piNuPmLfyYkkm5qZz5172LcNw4S36C5nZTG7wyffWMtRD
         BysLn6QO8xX/5VthKPSakCkzJDUZtaSSiF8doyNxcr4evbcGjVXaZRCRY/HDV9FeAMzJ
         QGTA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=DZtBnlOV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t10si8564636ywl.225.2018.01.02.11.37.12
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 02 Jan 2018 11:37:12 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=DZtBnlOV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:52903 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eWSN5-0003WB-ME
	for alex.bennee@linaro.org; Tue, 02 Jan 2018 14:37:11 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58495)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1eWSMa-0003E2-49
	for qemu-arm@nongnu.org; Tue, 02 Jan 2018 14:36:41 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1eWSMY-0000HV-IN
	for qemu-arm@nongnu.org; Tue, 02 Jan 2018 14:36:40 -0500
Received: from mail-pf0-x242.google.com ([2607:f8b0:400e:c00::242]:37097)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <andrew.smirnov@gmail.com>)
	id 1eWSMY-0000HK-Cb; Tue, 02 Jan 2018 14:36:38 -0500
Received: by mail-pf0-x242.google.com with SMTP id n6so26026553pfa.4;
	Tue, 02 Jan 2018 11:36:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=okFMpTBn3CPHVnnf0sYzsV4tcjnm7uVfAD8Wu4GZgfo=;
	b=DZtBnlOVE1MirJhuhKbwAUZfDM5a0maU+97ALdGvCqIBe7wIroM5+mwgxTandjYuax
	pEYWeEEo0M5hWpRpAWWLrFXisS3m7SkcwGcO361WlzYaNDi1nY4Qfp9ArYhjv3aR186R
	GfS27Ywf3x8jNq0RB7N4n0uULJbvjCLa5ZgC8qsW/emYcU4KdAJ7QdTRo30XfRBTRW2v
	ubXfA4sGVwAHsnqrw16wa3ybd/4TKLMmOqrYmQYVrhEXkbXDXAUgeS94gcoRb/2bhu4U
	wJEr14cp791qSKXHQkyaaes4AZ5KCH+ScJ7qZgEpZgyQc3DDqQynWVY8i4yzb/CojweW
	WN5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=okFMpTBn3CPHVnnf0sYzsV4tcjnm7uVfAD8Wu4GZgfo=;
	b=UdL/S/AIHcu0ePVsE9lPNXf5ou7BubWCY2nRqTI+vqIzaiEcazAx+CWz1vpmsuj823
	m4sDzFPP8uDGEyaApnvbIiJ+DbIvB/RyYHZyt+ch6C/K2OvNxl0RPdSpGMnBB+1+Qk10
	gHJd0HpTwn2cypd6hU91ykbC2CG92EhvN9vib934o2IpZ01cEFFJjqhhs5EnX6Ij4Prd
	HzB1H7i0bTsh07qMW4rWLvAo4G7ObwqOwduxzdv+lA9t7ApWsEEbkClRZiDTgYmLLz+Y
	uVikVJYkCI54CT2HsiCk7iue/kVEgx4N3QY1ZvLyuyHq8PYVktHbU2TVDLq0FYCNSiN3
	XBsw==
X-Gm-Message-State: AKGB3mIem3h8nlkzzB9pKlY4oSZd1mGZwuHOgzMJvOjXWbtDkz3sL+3C
	s23i8utFtwfCtJWaYKK6pPwQJyxpQCE=
X-Received: by 10.98.102.219 with SMTP id s88mr46704688pfj.191.1514921796960; 
	Tue, 02 Jan 2018 11:36:36 -0800 (PST)
Received: from squirtle.westlake.spaceflightindustries.com ([173.226.206.194])
	by smtp.gmail.com with ESMTPSA id
	g9sm97905951pfk.0.2018.01.02.11.36.36
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 02 Jan 2018 11:36:36 -0800 (PST)
From: Andrey Smirnov <andrew.smirnov@gmail.com>
To: qemu-arm@nongnu.org
Date: Tue,  2 Jan 2018 11:36:14 -0800
Message-Id: <20180102193622.27215-4-andrew.smirnov@gmail.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180102193622.27215-1-andrew.smirnov@gmail.com>
References: <20180102193622.27215-1-andrew.smirnov@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::242
Subject: [Qemu-arm] [PATCH v3 03/11] imx_fec: Change queue flushing
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
X-TUID: HQQftC3BtUW6

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

