Received: by 10.223.159.74 with SMTP id f10csp3053041wrg;
        Mon, 11 Dec 2017 13:31:37 -0800 (PST)
X-Google-Smtp-Source: ACJfBovj2TYE8H6wfWl0gGI8WL29rPhbohirt9Qx/sIFCUVoTUuZHAfVBKt95PebYHQNnkyfv9BG
X-Received: by 10.13.202.77 with SMTP id m74mr1413748ywd.408.1513027897842;
        Mon, 11 Dec 2017 13:31:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1513027897; cv=none;
        d=google.com; s=arc-20160816;
        b=gR4qMHgpo9/i5Qjug/mvf9fvssotYaUKhzb2TVWrpMJZT/I5wVaFr8Ctl5ECbq6VMQ
         S9Qzg2zeIGwli/+3FcP73C+QPxEbnLz02rmzZz1p/TRUaTk4gMWTATsmtD8NlFk8PdMr
         SjwMbQ2Gs/NnS+B4jRVpgyh6qs3siWpRegA3kKQyTwMSyHt8qZBLaNvjsjCmBIEMYOTM
         GwlIMmEbEEpTjNGfOS7FqzsFtizbiGtxgFS3eJKJafsKQJiIo7zjMGhkH/J35ZoLy1z/
         UBrYO8g3yafAcHC3nemdw6sNW7NV66KX07NN9lydjYMt4WpjH9kuyj0RQ8o4EEeSQ/ut
         d0EA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=okFMpTBn3CPHVnnf0sYzsV4tcjnm7uVfAD8Wu4GZgfo=;
        b=jeNdWTbN3vWzq+AAGxQ45T3BMoGYsXDeaHyO5+HIS+omP/b2uwCDYoNXvh5o+9YiZB
         m9YHKGAjs58fUVxLk2MdQxFZ4XPwb02+Qqw22iYVfFsyH5dCDCcpUrfBS54io8Ops4Hb
         Ew127rXthrQWZTrYw+ZvSYIXhIJK4M2gs8jRM3BzMxOGp+yOM2JkrqGZJ4ZBd0EoUBtz
         P/BgRRqIYU9aFQw4KR1l1D8okPIi88+rcrC1G/baYI4k/+lfn28QRyRLRiJk6J8XlBaK
         zlnOEDCkmXdqVTtLP2N7DfTFgGzHOGTtyxQ/Uao0iGE04lqT+a2Q9GjYOtAJo1XPKwEz
         HlGQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=M6OW++t0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n186si3161726ybc.513.2017.12.11.13.31.37
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 11 Dec 2017 13:31:37 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=M6OW++t0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:55534 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eOVfl-000139-5H
	for alex.bennee@linaro.org; Mon, 11 Dec 2017 16:31:37 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35678)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1eOVf4-0000iP-Ul
	for qemu-arm@nongnu.org; Mon, 11 Dec 2017 16:30:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1eOVf2-0003ze-8j
	for qemu-arm@nongnu.org; Mon, 11 Dec 2017 16:30:54 -0500
Received: from mail-pg0-x244.google.com ([2607:f8b0:400e:c05::244]:43460)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <andrew.smirnov@gmail.com>)
	id 1eOVf2-0003xO-1p; Mon, 11 Dec 2017 16:30:52 -0500
Received: by mail-pg0-x244.google.com with SMTP id b18so11844954pgv.10;
	Mon, 11 Dec 2017 13:30:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=okFMpTBn3CPHVnnf0sYzsV4tcjnm7uVfAD8Wu4GZgfo=;
	b=M6OW++t0N8SEg8YBj2jGDfXYoGMLMT6n6uRCrVSz4UuLT8+2WOiltiMC/eB6Ey+v8V
	VyKIok+i9Fw9pn/GdUkIgDMcSDguek/cjo6Bqzl20F5G8JIYQWGDbY8HGWW0h+OiS8Ru
	4Keq7xE7kMIBbsPaTz3xv1vrpdLBpiD2fC/eokKcFkHqIUKR64QdIpcJbzMM0nSJOJ51
	Sudc23+G5mLOyzBI+wj3e3d0HbBC1TVtg4R+glzeoPrwXoUPwR+kRBCSi8Mg6pjh163c
	1hJ3dthASug3/+9Is1w7Od1IIo+fzjQfjmw0chFi4j6pG4RGhuxC351jliC4znyAmrFs
	vpDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=okFMpTBn3CPHVnnf0sYzsV4tcjnm7uVfAD8Wu4GZgfo=;
	b=ejeDWUkPeJO6E3t0zx0KsyG/Eo12CYxnsgh+sgtuibISHVEhxXJTbxHwfxoEEYZllQ
	Ox0B9qllAfdYe8D9ki4msN2UtLuG1T9w/Za/tOt4P84gAfxoBuoqufDEdw8WgIqg42Eq
	F7prvWadwxXYZGZtd6cpJ6OSgdFWfyl7O0HaJFs0SYJVbvq/rLwmE7Nz4F3FCAIxmXfq
	LoWCII/l2CTAVmLdaKSZU2MPvj542Vg+zn6J9YIgmt8IpUxe/ANqqYkJ7BJ6HnXJBXoU
	WlTvYnbLsfcG0vXMwwCnKoQ1qqOk3MkpkY2rgCcPk9U5VVJypMpd4y6UEDBcA+K7Bx18
	ML6Q==
X-Gm-Message-State: AKGB3mLVUHaZ4gAG/4xlGjzS2uh7KLpOgmJLwGR0W17y6QOfJ+pxvpoM
	6sTKgxTFKye0f18h/ng5OqDrJVrm
X-Received: by 10.84.217.206 with SMTP id d14mr1648407plj.132.1513027850632;
	Mon, 11 Dec 2017 13:30:50 -0800 (PST)
Received: from squirtle.westlake.spaceflightindustries.com ([173.226.206.194])
	by smtp.gmail.com with ESMTPSA id
	q10sm25359690pgc.84.2017.12.11.13.30.49
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 11 Dec 2017 13:30:49 -0800 (PST)
From: Andrey Smirnov <andrew.smirnov@gmail.com>
To: qemu-arm@nongnu.org
Date: Mon, 11 Dec 2017 13:29:57 -0800
Message-Id: <20171211213007.7353-4-andrew.smirnov@gmail.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20171211213007.7353-1-andrew.smirnov@gmail.com>
References: <20171211213007.7353-1-andrew.smirnov@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::244
Subject: [Qemu-arm] [PATCH 03/13] imx_fec: Change queue flushing heuristics
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
X-TUID: AW0rrCRwtuPN

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

