Received: by 10.28.173.206 with SMTP id w197csp5340455wme;
        Wed, 10 Jan 2018 12:38:58 -0800 (PST)
X-Google-Smtp-Source: ACJfBovsNhUoB9KR2gYsO/czIZjj7p9tBLJPWQHChUofoNbJQSsujpkJnslerdPozszF3D2op3oM
X-Received: by 10.37.5.150 with SMTP id 144mr13897856ybf.318.1515616737977;
        Wed, 10 Jan 2018 12:38:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1515616737; cv=none;
        d=google.com; s=arc-20160816;
        b=vnxu9SoI9+i8PzfT5MAva2/M+MvKtgWujjOPBQrCv2XdvXxdbRbHsfi82Qwq8Pdoli
         b3eK1LmKHCDayTfDP2+6UBGHgmU/hpO1gK3FLzWwUydM9a6VmwZzFPVFkmnz3gyrbOA1
         jz16TrR3mKZcw6F6PyQgGE+U0eBfZvn8SMrnT85tqngAYFaxIsrak7FEhaDnb3LDcRQa
         LasaEkby13wa/qrGas3uSm9U86jCzYnlywOcF7hPNU3XouopdFDAvrBfxyZ5DAZ8/5v1
         hiMqlgjo1KF8/KagL64RDR8MS5Bqz8iUtEx2BFwnPAwo4Qs4vUAjv8gxADJKrc9P518M
         ptgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :arc-authentication-results;
        bh=4/Ug5qEpN3oQ4dsd5sHJL74hzxF9TxtTpH2QpC/2cfk=;
        b=CcxJHvWJjqsj/CBoycgbGc0O/pwya90GtLFvdSPSgiUfu1jq99YXEuq+N3qA7or/Ba
         Ahwny/S9j0jCynnCtKvRkny93gsE3wKC6/mirtzHv1HOs634Q15pVC8IZZilB7wgfKF3
         t4VQocwQlpxu7yGNYQdwAPQeMu8OaiCeC2YOtWOa2UYX2m85rWLcyTuXFljT8QUC4z4b
         j8o5m7p+Reqo+YwXtpwQWWldOUwsFlUNGPeP3f9vjnpO3iElTY1lw6u2tj1GQh8mFAP9
         deWUMYdixD0bh+5Amsfgi6nn764t27nAR4gJ3ExdcgOvxuXoBPwOmr0a0C3OsFsOaEya
         vnCQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 75si2101105ywe.335.2018.01.10.12.38.57
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 10 Jan 2018 12:38:57 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:38440 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eZN9F-00082l-DZ
	for alex.bennee@linaro.org; Wed, 10 Jan 2018 15:38:57 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38620)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jcd@tribudubois.net>) id 1eZN93-00082b-3S
	for qemu-arm@nongnu.org; Wed, 10 Jan 2018 15:38:46 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jcd@tribudubois.net>) id 1eZN92-00052J-4U
	for qemu-arm@nongnu.org; Wed, 10 Jan 2018 15:38:45 -0500
Received: from relay4-d.mail.gandi.net ([2001:4b98:c:538::196]:53789)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <jcd@tribudubois.net>)
	id 1eZN91-0004yM-Mo; Wed, 10 Jan 2018 15:38:43 -0500
Received: from localhost.localdomain (unknown
	[IPv6:2a01:e34:eebf:9c0:418e:be1e:e2ef:ab3])
	(Authenticated sender: jcd@tribudubois.net)
	by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 6BE3317209B;
	Wed, 10 Jan 2018 21:38:38 +0100 (CET)
From: Jean-Christophe Dubois <jcd@tribudubois.net>
To: peter.maydell@linaro.org
Date: Wed, 10 Jan 2018 21:38:23 +0100
Message-Id: <20180110203823.22292-1-jcd@tribudubois.net>
X-Mailer: git-send-email 2.14.1
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:4b98:c:538::196
Subject: [Qemu-arm] [PATCH] i.MX: Fix FEC/ENET receive funtions
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
Cc: fyleo45@gmail.com, Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org,
	Jean-Christophe Dubois <jcd@tribudubois.net>,
	qemu-arm@nongnu.org, Peter Chubb <peter.chubb@nicta.com.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9GVIV1HSXwuh

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
Tested-by: Fyleo <fyleo45@gmail.com>
Signed-off-by: Jean-Christophe Dubois <jcd@tribudubois.net>
---
 hw/net/imx_fec.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/hw/net/imx_fec.c b/hw/net/imx_fec.c
index 90e6ee35ba..04a5cf12f1 100644
--- a/hw/net/imx_fec.c
+++ b/hw/net/imx_fec.c
@@ -536,19 +536,16 @@ static void imx_eth_do_tx(IMXFECState *s)
 static void imx_eth_enable_rx(IMXFECState *s)
 {
     IMXFECBufDesc bd;
-    bool tmp;
 
     imx_fec_read_bd(&bd, s->rx_descriptor);
 
-    tmp = ((bd.flags & ENET_BD_E) != 0);
+    s->regs[ENET_RDAR] = (bd.flags & ENET_BD_E) ? ENET_RDAR_RDAR : 0;
 
-    if (!tmp) {
+    if (!s->regs[ENET_RDAR]) {
         FEC_PRINTF("RX buffer full\n");
-    } else if (!s->regs[ENET_RDAR]) {
+    } else {
         qemu_flush_queued_packets(qemu_get_queue(s->nic));
     }
-
-    s->regs[ENET_RDAR] = tmp ? ENET_RDAR_RDAR : 0;
 }
 
 static void imx_eth_reset(DeviceState *d)
@@ -806,7 +803,6 @@ static void imx_eth_write(void *opaque, hwaddr offset, uint64_t value,
     case ENET_RDAR:
         if (s->regs[ENET_ECR] & ENET_ECR_ETHEREN) {
             if (!s->regs[index]) {
-                s->regs[index] = ENET_RDAR_RDAR;
                 imx_eth_enable_rx(s);
             }
         } else {
-- 
2.14.1

