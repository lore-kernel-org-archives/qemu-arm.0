Received: by 10.223.172.38 with SMTP id v35csp4141173wrc;
        Mon, 18 Sep 2017 12:56:10 -0700 (PDT)
X-Received: by 10.200.41.232 with SMTP id 37mr4431455qtt.47.1505764569984;
        Mon, 18 Sep 2017 12:56:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505764569; cv=none;
        d=google.com; s=arc-20160816;
        b=aJr21Ppv7CTh8EE9J9dTJSSBaXyC3/iJKmtkCW2iZbmyZU5zr74UuO6lLCSMy/EBVT
         zP+RMTSywcNLzzlCN8hnWEiRN8qzle6Yofc84gQA8d4kiZQBYnD/dpv0b97gEhEjw6tm
         HNCQCpBKHEZ+UQYg0zqv0ECxqU8mfZyLl/YzmlEvFxQioybvbFOERdwjAGN+sTOfAsdq
         dKSLRLZ0KSLlxKzsWh/By+7yZSzJAMFyu2NaIoHjZleHlppQVBPyUygjbWyjapmfJ9Ve
         EvAr5jjq3I5plco7VAM8gPxL+igQ05zRHr3Y+S+Jb/HwiW5WLcDsczY5bHJt0Gwa1aY+
         LMdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=rzYOxbYwJj+GD3IhY8nPvTyU1APl7Am2GgKyHUaZxR0=;
        b=vtu9LuPwlH/wjRJbfFyehKxnNL6TR8HmxT/177iIMQjvoeUnwQtDVLRS2dPpKeCyFp
         gmMMDFVsDvMMB48HwPtCxCQrcTSe80mQ9rb4Vmlk0tim6D90VDSEBEb4nXx7cvuGeno3
         evDIKK7Weng+qkDIkxY1eYYHpK7xbUL4Kaf8aABQWAKjSZPyNwctFoGDPINUBqiXhETD
         D5w14ifoknh3CBBXDH7YAUR+OXUkphuybmvk3hL/pM6PtN6YgQ8W+gf39N9gbCV12Mqn
         d1tLEUBaSG69fqUILTZ2+df8YnilMP/y1bxCx9Yv6Ljcx99/En2QXdXPR13/VOSL2oyG
         5ugg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=W6iI7d0o;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a124si7418688qkd.268.2017.09.18.12.56.09
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 18 Sep 2017 12:56:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=W6iI7d0o;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:38639 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1du29H-0002L7-Kj
	for alex.bennee@linaro.org; Mon, 18 Sep 2017 15:56:07 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37227)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1du24p-0006kA-6l
	for qemu-arm@nongnu.org; Mon, 18 Sep 2017 15:51:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1du24n-0006FL-TS
	for qemu-arm@nongnu.org; Mon, 18 Sep 2017 15:51:31 -0400
Received: from mail-pf0-x242.google.com ([2607:f8b0:400e:c00::242]:38322)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <andrew.smirnov@gmail.com>)
	id 1du24n-0006FC-Ni; Mon, 18 Sep 2017 15:51:29 -0400
Received: by mail-pf0-x242.google.com with SMTP id q76so589281pfq.5;
	Mon, 18 Sep 2017 12:51:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=rzYOxbYwJj+GD3IhY8nPvTyU1APl7Am2GgKyHUaZxR0=;
	b=W6iI7d0oIv6XqgMHmdsZzBumdw3nGzpaxkDGch2t+yPPPg2wxRKKE9fAKi798wpAq7
	ghL1H0PX7akWAu0xOX/GhwEOZv5RnpqMVpgU5A338bv1L7H1eO5aAyiYuIfkhb9ynk8O
	Z38YYtDh5UzbgNkPEIuXSlZSTpMYKCC+bLmnwF3zFT6xTZGTUyyiOW7jAx5Ke8nDIuzg
	Vchbg12xPCRB6OUe6Qrej58fU8Yk4/ABJlezodr+uUMvZtlM8yYwBnXZm6A86o03mjSE
	fLM8E2veoUw7ic0lHNZVELHeRIqg5W6pmvxo4NyXN/4kIm6kqYjboeLQKhTGsGU7Odaw
	h/0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=rzYOxbYwJj+GD3IhY8nPvTyU1APl7Am2GgKyHUaZxR0=;
	b=CnMU4yna4SgFJHx5MqMZ06mYD6d4QiCRLcRVEZlrNgL2JMAHmTNpLoUBDTyIW0Nv08
	C3k++5KQkZIjbZbHTfQro8fcbKfw4g/gsQjrpTREdlIxFfURvASv3fkbzwEhZ1b56wQz
	Sl/je8e1e3rq+pxF67Eld9h2PfXjjZIf43nZbL8NGMbZrWvSe5fIHEJUtLEBshLIBjc/
	B8rl0x+L1DAlS5YxtmV+kzkHx122ZPyimGeDYq1DnCyWfbAjsSn1z8IdsotlKadSNgBU
	E3bIMXO7jZhNqPlWkj5nuR0iotpFZgvJFW8nX//pOWKcKdMB2c0IQL6AmSO9coCDDJcg
	W/tQ==
X-Gm-Message-State: AHPjjUg79QiXJXLwyeudOFvT5PVfT8xnAG+ZJqLXolbFe79PQJ1wBtxq
	gjq6DrLKmknk+Q/kKp4=
X-Google-Smtp-Source: ADKCNb6wPrW/ShCNW8Pn3hcKtceQotREduEqqlVp+wXATyQ3NhUkdSgzQyz4Bz4Jc94/sueKSowv8A==
X-Received: by 10.84.133.37 with SMTP id 34mr38289850plf.362.1505764288325;
	Mon, 18 Sep 2017 12:51:28 -0700 (PDT)
Received: from squirtle.westlake.spaceflightindustries.com ([173.226.206.194])
	by smtp.gmail.com with ESMTPSA id
	d186sm200791pfd.117.2017.09.18.12.51.27
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 18 Sep 2017 12:51:27 -0700 (PDT)
From: Andrey Smirnov <andrew.smirnov@gmail.com>
To: qemu-arm@nongnu.org
Date: Mon, 18 Sep 2017 12:50:47 -0700
Message-Id: <20170918195100.17593-5-andrew.smirnov@gmail.com>
X-Mailer: git-send-email 2.13.5
In-Reply-To: <20170918195100.17593-1-andrew.smirnov@gmail.com>
References: <20170918195100.17593-1-andrew.smirnov@gmail.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::242
Subject: [Qemu-arm] [PATCH 04/17] imx_fec: Change queue flushing heuristics
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
Cc: Andrey Smirnov <andrew.smirnov@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org, yurovsky@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: EaIsKcI/Z4+C

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

Change the code to remember the fact that can_receive callback was
called before Rx ring was ready and use it to make a decision if
receive queue needs to be flushed.

Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: Jason Wang <jasowang@redhat.com>
Cc: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Cc: yurovsky@gmail.com
Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
---
 hw/net/imx_fec.c         | 6 ++++--
 include/hw/net/imx_fec.h | 1 +
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/hw/net/imx_fec.c b/hw/net/imx_fec.c
index 84085afe09..767402909d 100644
--- a/hw/net/imx_fec.c
+++ b/hw/net/imx_fec.c
@@ -544,8 +544,9 @@ static void imx_eth_enable_rx(IMXFECState *s)
 
     if (rx_ring_full) {
         FEC_PRINTF("RX buffer full\n");
-    } else if (!s->regs[ENET_RDAR]) {
+    } else if (s->needs_flush) {
         qemu_flush_queued_packets(qemu_get_queue(s->nic));
+        s->needs_flush = false;
     }
 
     s->regs[ENET_RDAR] = rx_ring_full ? 0 : ENET_RDAR_RDAR;
@@ -930,7 +931,8 @@ static int imx_eth_can_receive(NetClientState *nc)
 
     FEC_PRINTF("\n");
 
-    return s->regs[ENET_RDAR] ? 1 : 0;
+    s->needs_flush = !s->regs[ENET_RDAR];
+    return !!s->regs[ENET_RDAR];
 }
 
 static ssize_t imx_fec_receive(NetClientState *nc, const uint8_t *buf,
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

