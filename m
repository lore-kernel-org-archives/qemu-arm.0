Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp777952wru;
        Fri, 27 Jul 2018 07:38:29 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpeKDa4nbID95Vq0CgTU7N0JwLIiukXqtZnLU37JVOzQLcatJFb0a9+cxVeglsgsQ2nf/G5A
X-Received: by 2002:ae9:df81:: with SMTP id t123-v6mr6148176qkf.55.1532702309769;
        Fri, 27 Jul 2018 07:38:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1532702309; cv=none;
        d=google.com; s=arc-20160816;
        b=OP4ODsAkfb6AbnhLq/4BrR3XfDc0ab3Wdt4Swl860/Wasv6LtQPRLXvlgpzueydUB7
         5RV3inBaN1E1ot5CN5yi0sCCV1EejEH0snMuzDFiwatVDlMvtGsB6wEZ9C7kC1FBthS/
         8QBs97Izru0dl0hhVNjjGduBDwNEFdmrrmZeIJ685q9/Kh0+ipi8mnPU9rV/aQL7EVX1
         q6CANRFnEdmZDYltSldU3SKG4lTGQn11GN6N8Efs7LZYCAsz2Vfzb/MA41oca04SMD3f
         gBOJYteJ8BfBdybfpqGwZLwYUae6GyDqnrfdFHkc6ZFWvVPB3KyL7Mp2yeqjFtWZNVJD
         fztQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:dkim-signature
         :dkim-signature:arc-authentication-results;
        bh=PlGrz5v8RzUclmKgYYr0ol3JlSl77I9plVLOHHDhY6U=;
        b=BP0JSHSmjm6ZJZyuw41DRmsNCfASdnPgbv6yveZsVjcya7LzuBuOKS2vJs5o6ln4vl
         zAuBN8IzGQlwRSwEQeEk2QJtZ8ht01N1DtxM8+jZyHeAx9xLtJYv2tbw2RgMD+BYzGsT
         NJqbvihgWFDtt7WQfTowekWiXhv3StZKJMBsRC2SbTlOOakhDBWrXapzeAFZjkjn4ouD
         cve6VIlON32PZMiUXxVzjnKlm6kDngOf82mF/c/HGhyGL2a2IX4wKh8kMkP8jo51PkWx
         XOrbwN80ilpKrrkcXC2+SGfGXOwAP5+B5QMsoXgT2sqGt7UEBFcUnW47tdJ6VfgOqica
         lVRA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=YHgyaG+S;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=O2KzR2Sk;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=O2KzR2Sk;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s76-v6si3908308qki.146.2018.07.27.07.38.29
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 27 Jul 2018 07:38:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=YHgyaG+S;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=O2KzR2Sk;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=O2KzR2Sk;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:41593 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fj3sz-0003I1-7C
	for alex.bennee@linaro.org; Fri, 27 Jul 2018 10:38:29 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34362)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <damien.hedde@greensocs.com>) id 1fj3sH-0003F9-HO
	for qemu-devel@nongnu.org; Fri, 27 Jul 2018 10:37:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <damien.hedde@greensocs.com>) id 1fj3sG-0008IW-Ge
	for qemu-devel@nongnu.org; Fri, 27 Jul 2018 10:37:45 -0400
Received: from greensocs.com ([193.104.36.180]:50602)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <damien.hedde@greensocs.com>)
	id 1fj3sB-0008Aa-Fd; Fri, 27 Jul 2018 10:37:39 -0400
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id 2E30D4434B9;
	Fri, 27 Jul 2018 16:37:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1532702252;
	bh=UBhdrBu2BfWci6XjZcmChBfVWClCxpRVoV2fRvnJnIE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=YHgyaG+SHy6PAzRacAZbfiZxsnljJ4404PXXsHuT9EbEEMJ7SX8Ak9gPAINnKi0li
	q/WUaDft4/ivuHR0UMkJCb83xJfdyCuMfBUTYLbRMlE32em9ONVYxW8hUBoKyNATm6
	w2tKwGwtY30YfUlFa3cSJe3FBiwQ/PLaGbQzHUtw=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=O2KzR2Sk;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=O2KzR2Sk
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sgUzPoqcCvsw; Fri, 27 Jul 2018 16:37:31 +0200 (CEST)
Received: by greensocs.com (Postfix, from userid 998)
	id 4E104443552; Fri, 27 Jul 2018 16:37:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1532702251;
	bh=UBhdrBu2BfWci6XjZcmChBfVWClCxpRVoV2fRvnJnIE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=O2KzR2Sku+YnMJ4m1cersMprpJILLXjlws4WagiFgUmzx4WrC0bzbZBw3t2dfS74K
	kqmog3mjJ32v+ZjAQnP8tpnaBKgFsM4E61iL8248qJB1BsUc3H1fuGF5RbYx2sruP6
	R73IhI6UkFQ/JjSzWWShoJaIyjiFuCRU+Kz+IDnI=
Received: from kouign-amann.hive.antfield.fr (antfield.tima.u-ga.fr
	[147.171.129.253])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: damien.hedde@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id C3A34428994;
	Fri, 27 Jul 2018 16:37:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1532702251;
	bh=UBhdrBu2BfWci6XjZcmChBfVWClCxpRVoV2fRvnJnIE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=O2KzR2Sku+YnMJ4m1cersMprpJILLXjlws4WagiFgUmzx4WrC0bzbZBw3t2dfS74K
	kqmog3mjJ32v+ZjAQnP8tpnaBKgFsM4E61iL8248qJB1BsUc3H1fuGF5RbYx2sruP6
	R73IhI6UkFQ/JjSzWWShoJaIyjiFuCRU+Kz+IDnI=
From: Damien Hedde <damien.hedde@greensocs.com>
To: qemu-devel@nongnu.org
Date: Fri, 27 Jul 2018 16:37:23 +0200
Message-Id: <81e37f79d335d17d8802f127d59f89e263c50136.1532701430.git.damien.hedde@greensocs.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <cover.1532701430.git.damien.hedde@greensocs.com>
References: <cover.1532701430.git.damien.hedde@greensocs.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 193.104.36.180
Subject: [Qemu-devel] [RFC PATCH 4/6] cadence_uart: add clock/power gating
 support
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
Cc: edgar.iglesias@xilinx.com, peter.maydell@linaro.org, alistair@alistair23.me,
	mark.burton@greensocs.com, saipava@xilinx.com,
	qemu-arm@nongnu.org, Damien Hedde <damien.hedde@greensocs.com>,
	pbonzini@redhat.com, luc.michel@greensocs.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ZRDtNyTSdjhi

Only discard input characters when unpowered/unclocked.
As it is a sysbus device, mmio are already disabled when unpowered
or unclocked.

Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
---
 hw/char/cadence_uart.c | 25 ++++++++++++++++++++++++-
 1 file changed, 24 insertions(+), 1 deletion(-)

diff --git a/hw/char/cadence_uart.c b/hw/char/cadence_uart.c
index fbdbd463bb..dd51d9a087 100644
--- a/hw/char/cadence_uart.c
+++ b/hw/char/cadence_uart.c
@@ -335,8 +335,14 @@ static void uart_write_tx_fifo(CadenceUARTState *s, const uint8_t *buf,
 static void uart_receive(void *opaque, const uint8_t *buf, int size)
 {
     CadenceUARTState *s = opaque;
+    DeviceState *dev = DEVICE(s);
     uint32_t ch_mode = s->r[R_MR] & UART_MR_CHMODE;
 
+    /* ignore characters if unpowered or unclocked */
+    if (!dev->powered || !dev->clocked) {
+        return;
+    }
+
     if (ch_mode == NORMAL_MODE || ch_mode == ECHO_MODE) {
         uart_write_rx_fifo(opaque, buf, size);
     }
@@ -348,8 +354,14 @@ static void uart_receive(void *opaque, const uint8_t *buf, int size)
 static void uart_event(void *opaque, int event)
 {
     CadenceUARTState *s = opaque;
+    DeviceState *dev = DEVICE(s);
     uint8_t buf = '\0';
 
+    /* ignore event if we're unpowered or unclocked */
+    if (!dev->powered || !dev->clocked) {
+        return;
+    }
+
     if (event == CHR_EVENT_BREAK) {
         uart_write_rx_fifo(opaque, &buf, 1);
     }
@@ -516,10 +528,19 @@ static int cadence_uart_post_load(void *opaque, int version_id)
     return 0;
 }
 
+static int cadence_uart_pre_load(void *opaque)
+{
+    DeviceState *s = opaque;
+    s->clocked = true;
+    s->powered = true;
+    return 0;
+}
+
 static const VMStateDescription vmstate_cadence_uart = {
     .name = "cadence_uart",
-    .version_id = 2,
+    .version_id = 3,
     .minimum_version_id = 2,
+    .pre_load = cadence_uart_pre_load,
     .post_load = cadence_uart_post_load,
     .fields = (VMStateField[]) {
         VMSTATE_UINT32_ARRAY(r, CadenceUARTState, CADENCE_UART_R_MAX),
@@ -531,6 +552,8 @@ static const VMStateDescription vmstate_cadence_uart = {
         VMSTATE_UINT32(tx_count, CadenceUARTState),
         VMSTATE_UINT32(rx_wpos, CadenceUARTState),
         VMSTATE_TIMER_PTR(fifo_trigger_handle, CadenceUARTState),
+        VMSTATE_BOOL_V(powered, DeviceState, 3),
+        VMSTATE_BOOL_V(clocked, DeviceState, 3),
         VMSTATE_END_OF_LIST()
     }
 };
-- 
2.18.0

