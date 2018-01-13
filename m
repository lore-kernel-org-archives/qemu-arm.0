Received: by 10.28.173.206 with SMTP id w197csp515397wme;
        Sat, 13 Jan 2018 03:35:26 -0800 (PST)
X-Google-Smtp-Source: ACJfBouGsUxf65e6NzwydEe8lsvJSED3oiGJKfyTHvXfTh4cbZStqEYUaa/r+ajTWXt6AcMgHASG
X-Received: by 10.37.131.130 with SMTP id t2mr7889244ybk.170.1515843326402;
        Sat, 13 Jan 2018 03:35:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1515843326; cv=none;
        d=google.com; s=arc-20160816;
        b=QPcASy7mhjLw0xCyUG7VtUjmV9UiBhldsgCPUdpydQOfTf4VZF8CV4NV/iOugLHtp4
         wjgXUHg8hS8n6vyKq2pCCiIjRTtF1v5uHVT8Hb9jGhRJLb3PInxtrTAwUPQaPz4Be1yb
         yutja8QN57k/B4OoVYY9Pe06ias0nsWLNXuZFZcplz8P892kN/F1ykevM1mDqd8mQ+0r
         I1+yEybhqX6qzDbXcOfiJjDOgJciEm6Q5tg7UZqI5mS0hH05CIRJIFC7UZCbqm/mZj+V
         SRnBHXx99a7PAaS3Gx0CFL/mnIpBPjWNFBWZk53ERllXfeOUwoBF3er2yqbieP4B2X+0
         3FFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :arc-authentication-results;
        bh=2SoB1vTii0oFAELrDiFHKFneIvohm0row2+bDcIJ+J8=;
        b=Du7MtPvmSJeV9RA2+dHmuTBQ3zl9CbSOvmKJPjm9h9VCqrb70nLQEqtnPycV/0/IZv
         RwE3LnL0to1aB4oOFWOAf77PgLJtSgJUQpWAdra+CoF+rMFN4zinLKMhzJE0GiRhsR4P
         bRrX5nqsQe3tTquIzp48cbhQFza5Rzt5SClw33+CrnhURix8hDERX3ve79bqUlZKX7CH
         qaHHdS5a3e2bEFH0Bwf0td8XHZ1190ileqlXZd5SYOLHq2wSUEy+ULtaYmhdXxB6sKwW
         NBA4wMTcv/tlOYF1pIWKwvD+j9zY38xrBa5IVpJpjUn8fi30AbAUeuyx5cNJ9LR+CpPU
         7BzA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p10si4877102ywb.463.2018.01.13.03.35.26
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 13 Jan 2018 03:35:26 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:59530 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eaK5t-0001uf-Rn
	for alex.bennee@linaro.org; Sat, 13 Jan 2018 06:35:25 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37441)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jcd@tribudubois.net>) id 1eaK5m-0001uU-T3
	for qemu-arm@nongnu.org; Sat, 13 Jan 2018 06:35:19 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jcd@tribudubois.net>) id 1eaK5j-0006uU-PB
	for qemu-arm@nongnu.org; Sat, 13 Jan 2018 06:35:18 -0500
Received: from relay2-d.mail.gandi.net ([217.70.183.194]:43713)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <jcd@tribudubois.net>)
	id 1eaK5j-0006th-Ii; Sat, 13 Jan 2018 06:35:15 -0500
Received: from localhost.localdomain (unknown
	[IPv6:2a01:e34:eebf:9c0:418e:be1e:e2ef:ab3])
	(Authenticated sender: jcd@tribudubois.net)
	by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id D8F29C5A5D;
	Sat, 13 Jan 2018 12:35:09 +0100 (CET)
From: Jean-Christophe Dubois <jcd@tribudubois.net>
To: jasowang@redhat.com
Date: Sat, 13 Jan 2018 12:34:45 +0100
Message-Id: <20180113113445.2705-1-jcd@tribudubois.net>
X-Mailer: git-send-email 2.14.1
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 217.70.183.194
Subject: [Qemu-arm] [PATCH v2] i.MX: Fix FEC/ENET receive funtions
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
Cc: peter.maydell@linaro.org, fyleo45@gmail.com, qemu-devel@nongnu.org,
	Jean-Christophe Dubois <jcd@tribudubois.net>,
	qemu-arm@nongnu.org, peter.chubb@nicta.com.au
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3t/0t/POt1ac

The actual imx_eth_enable_rx() function is buggy.

It updates s->regs[ENET_RDAR] after calling qemu_flush_queued_packets().

qemu_flush_queued_packets() is going to call imx_XXX_receive() which itself
is going to call imx_eth_enable_rx().

By updating s->regs[ENET_RDAR] after calling qemu_flush_queued_packets()
we end up updating the register with an outdated value which might
lead to disabling the receive function in the i.MX FEC/ENET device.

This patch change the place where the register update is done so that the
register value stays up to date and the receive function can keep
running.

Reported-by: Fyleo <fyleo45@gmail.com>
Tested-by: Fyleo  <fyleo45@gmail.com>
Signed-off-by: Jean-Christophe Dubois <jcd@tribudubois.net>
---
Change since v1:
1. Rebase the patch on the updated master branch

 hw/net/imx_fec.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/hw/net/imx_fec.c b/hw/net/imx_fec.c
index 4fb48f62ba..9506f9b69f 100644
--- a/hw/net/imx_fec.c
+++ b/hw/net/imx_fec.c
@@ -595,19 +595,16 @@ static void imx_eth_do_tx(IMXFECState *s, uint32_t index)
 static void imx_eth_enable_rx(IMXFECState *s, bool flush)
 {
     IMXFECBufDesc bd;
-    bool rx_ring_full;
 
     imx_fec_read_bd(&bd, s->rx_descriptor);
 
-    rx_ring_full = !(bd.flags & ENET_BD_E);
+    s->regs[ENET_RDAR] = (bd.flags & ENET_BD_E) ? ENET_RDAR_RDAR : 0;
 
-    if (rx_ring_full) {
+    if (!s->regs[ENET_RDAR]) {
         FEC_PRINTF("RX buffer full\n");
     } else if (flush) {
         qemu_flush_queued_packets(qemu_get_queue(s->nic));
     }
-
-    s->regs[ENET_RDAR] = rx_ring_full ? 0 : ENET_RDAR_RDAR;
 }
 
 static void imx_eth_reset(DeviceState *d)
@@ -866,7 +863,6 @@ static void imx_eth_write(void *opaque, hwaddr offset, uint64_t value,
     case ENET_RDAR:
         if (s->regs[ENET_ECR] & ENET_ECR_ETHEREN) {
             if (!s->regs[index]) {
-                s->regs[index] = ENET_RDAR_RDAR;
                 imx_eth_enable_rx(s, true);
             }
         } else {
-- 
2.14.1

