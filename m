Received: by 10.223.159.74 with SMTP id f10csp6408467wrg;
        Thu, 14 Dec 2017 06:55:41 -0800 (PST)
X-Google-Smtp-Source: ACJfBouYjpwKUu0FTIB7hF+87sod3sAox1yl1McwZ9eMKSuvd2XT/wIMwwiTPYya16UDgpsiZY9d
X-Received: by 10.37.46.12 with SMTP id u12mr4369748ybu.140.1513263341474;
        Thu, 14 Dec 2017 06:55:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1513263341; cv=none;
        d=google.com; s=arc-20160816;
        b=hB01iwA2hVseCMGCHBWYEUZw38epHeWYP50dwxdjq2mk0PSDf83iO/WqNzzzkejH0C
         EQvYBgRARxrPvcV8W8mNki0Aw4ma6EXYZIa2bN/1rGkp3zCFsIKbRzOOK8uRRrzzEHxD
         OLB7J1yrNJRiQ+51kymfCNRlLgY35psHka+hyn5otTbq88wAk6EFCOi0x2nGMFqR5+O/
         uNz90v9hSxvataDa8IEihl+uL8lQNW6nbvAlzE3I2ZdYupGrpXJ/V9GU2ddLz3Q+2zZp
         QUIQObYEp0xba2CFUm2IPdsesTO92tgAN9rI28L5/6ay7KTednL8BNWV+3cIK8gnsPgR
         NiNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=gHgUtmN0/rGU/APCPhW0EAHnmsZlsiEW/PZANp51ENA=;
        b=YQH+DgyRt+AYw0bXAmRa6s0sPiEIk2Vrgshm0Niw7Mq3SpJgewfIrUZDbr7GtRswVA
         Wrdsz7UY9dgRabmT8yw/UrIiFdPcpV65h3oGD03nwDplhcV8zRisO6/jQnhgZYx26/0R
         y7U2je5nQHjH0ufhs1CLdW0Mtbrz3+LRNFS7rVsh644YMlb96548CjXx8b1w15xZvofg
         4y9RaP1+1bzU2+VEeq0ywpoMnS+4r3Jicy0vROFxPgBzT2ta34qYw1pDlfXcm1wlf7Ol
         reRxhE/Sv5DpxQMohbBsMaxxfENZyu/4PIE7jvhUpcfTsJqxhEAO/ahkcrzusZ+6SRUM
         OD0g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=T0ndEdMN;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p14si845231ybl.452.2017.12.14.06.55.41
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 14 Dec 2017 06:55:41 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=T0ndEdMN;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:41367 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ePUvE-0002eB-Qp
	for alex.bennee@linaro.org; Thu, 14 Dec 2017 09:55:40 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55074)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1ePUt3-0001MK-TG
	for qemu-devel@nongnu.org; Thu, 14 Dec 2017 09:53:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1ePUt3-0000K9-2r
	for qemu-devel@nongnu.org; Thu, 14 Dec 2017 09:53:25 -0500
Received: from mail-pg0-x243.google.com ([2607:f8b0:400e:c05::243]:40468)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <andrew.smirnov@gmail.com>)
	id 1ePUt0-0000DW-8F; Thu, 14 Dec 2017 09:53:22 -0500
Received: by mail-pg0-x243.google.com with SMTP id k15so3549869pgr.7;
	Thu, 14 Dec 2017 06:53:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=gHgUtmN0/rGU/APCPhW0EAHnmsZlsiEW/PZANp51ENA=;
	b=T0ndEdMNnV7WaRrU+I0GsAMkNpO9GD+jXEKKs5kspeuNe3FpW6FHulidUR7u7/YC+k
	rcuCcmxy3I56ZeTfYXuOOFmVaDOZ1o3up+INcfZS59MfrYP+N5oVjJ2wdckbrCJrYW+r
	qmTrA6rMFMEtWON+lfT4phdIlHxsC9QZ5kx6Sr7Z7e5+B1rrdc8vHTGcdtWdE62tJ4Jz
	mXXe4Xrd0rRHXte8PX6ABHy17mFzD/iexvA6rCN1I/Umf2w88NSYb4UrQXdQRI2+xxfO
	S+U9Z9tMsHERCwR7dEz+yeYkE9nJh02aiq7lpXqBZw5hD4EKP50tR40oDahPafoAYhkM
	CUWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=gHgUtmN0/rGU/APCPhW0EAHnmsZlsiEW/PZANp51ENA=;
	b=bgACIEs/eZbmBahdgm2Kwo1A9n0e32A5+wRabpeVutqmbiJQUxnlsVVb/RiirWZAqg
	LLBezPUToe9PI/Nh+gKKkeDobfzMRLkPTYBwbiVqpzIyEqDLJ42K3cbsTyrVxgFUOALe
	npN4xi6SSLUCjcRxrqCxZM4J3eeVY/o3/IA0ekg5XwBYPvr8OoRE5pS6j2OWtzV++FtB
	4+h2Kt7okJ7/B/1qoiI4d0LKXvZWlamEU9HB7S7HeuDm0gNf4sFn/D3wBWQqUiiA6rSm
	FfDGjxFdJTHLB/4GPnrdhaUp53YYYvxiT50Hl1OJyhpXTDKsyg3ofAJqop0jT7MnzNq8
	9Dqg==
X-Gm-Message-State: AKGB3mK9aHBdRIFET9ywd6wrhaEPvtLU0Y41u8HyUIqQ8TXTiVOYktoF
	6X8NEN5NDcwOlX8luLTMAW98p5FN
X-Received: by 10.98.197.68 with SMTP id j65mr10039598pfg.176.1513263200919;
	Thu, 14 Dec 2017 06:53:20 -0800 (PST)
Received: from squirtle.lan (c-24-22-235-96.hsd1.wa.comcast.net.
	[24.22.235.96])
	by smtp.gmail.com with ESMTPSA id e7sm8757439pfj.44.2017.12.14.06.53.19
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 14 Dec 2017 06:53:19 -0800 (PST)
From: Andrey Smirnov <andrew.smirnov@gmail.com>
To: qemu-arm@nongnu.org
Date: Thu, 14 Dec 2017 06:52:42 -0800
Message-Id: <20171214145255.31545-3-andrew.smirnov@gmail.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20171214145255.31545-1-andrew.smirnov@gmail.com>
References: <20171214145255.31545-1-andrew.smirnov@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::243
Subject: [Qemu-devel] [PATCH v2 02/15] imx_fec: Refactor imx_eth_enable_rx()
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	Jason Wang <jasowang@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, yurovsky@gmail.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: WbCWNnEFMWzF

Refactor imx_eth_enable_rx() to have more meaningfull variable name
than 'tmp' and to reduce number of logical negations done.

Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: Jason Wang <jasowang@redhat.com>
Cc: Philippe Mathieu-Daudé <f4bug@amsat.org>
Cc: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Cc: yurovsky@gmail.com
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
---
 hw/net/imx_fec.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/net/imx_fec.c b/hw/net/imx_fec.c
index 88b4b049d7..8b2e4b8ffe 100644
--- a/hw/net/imx_fec.c
+++ b/hw/net/imx_fec.c
@@ -536,19 +536,19 @@ static void imx_eth_do_tx(IMXFECState *s)
 static void imx_eth_enable_rx(IMXFECState *s)
 {
     IMXFECBufDesc bd;
-    bool tmp;
+    bool rx_ring_full;
 
     imx_fec_read_bd(&bd, s->rx_descriptor);
 
-    tmp = ((bd.flags & ENET_BD_E) != 0);
+    rx_ring_full = !(bd.flags & ENET_BD_E);
 
-    if (!tmp) {
+    if (rx_ring_full) {
         FEC_PRINTF("RX buffer full\n");
     } else if (!s->regs[ENET_RDAR]) {
         qemu_flush_queued_packets(qemu_get_queue(s->nic));
     }
 
-    s->regs[ENET_RDAR] = tmp ? ENET_RDAR_RDAR : 0;
+    s->regs[ENET_RDAR] = rx_ring_full ? 0 : ENET_RDAR_RDAR;
 }
 
 static void imx_eth_reset(DeviceState *d)
-- 
2.14.3

