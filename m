Received: by 10.223.159.74 with SMTP id f10csp3052652wrg;
        Mon, 11 Dec 2017 13:31:14 -0800 (PST)
X-Google-Smtp-Source: ACJfBovks9URP6JxEB+exu3l7Tr4HVa/XqnB/6UC5mZNDdylEznC5IZyyEeT+ozZyzWZbs7cuqSm
X-Received: by 10.37.188.67 with SMTP id d3mr1506092ybk.443.1513027874807;
        Mon, 11 Dec 2017 13:31:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1513027874; cv=none;
        d=google.com; s=arc-20160816;
        b=nW/aMlhwzJANh/EXgPPCPBkYA+WCFOAYxq8iQY1W8o5B8gl/tY78gO1AxaPcHSh2IA
         ZsaJuEmQQrCZpD3kPdOQXbHLTqLOAYZWKXTzYwn5MD0d9i4n61jEj4hbaxSVguExzX+L
         X9Ug3wKATmZm1XJt9soPcGEbo3qqOsLRDmzxhZ96j3yJBbv4gCLQKz3h8B2e6wD/jNjG
         ofPM7Nk5mlY7emvlw0B3Kw2Cc4dK4H58ywBs4mvC6IL26GCsPAbbXWnIHOuzgvnpgVek
         mpo5eteBgLxSLwl6Qq04u6ZBLeuzsL9x7f6lh9W3tehbiYxCrlcAlhe3ThHNpDIIcS21
         PNwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=gHgUtmN0/rGU/APCPhW0EAHnmsZlsiEW/PZANp51ENA=;
        b=kG93Tzn2xMpPOmiRiO415y4+cQtjNm/7QMi+HdysX7NbUei0OJQJvT1eSqAxCmz5G0
         HTG+BA+wzxi0Q1U+dpttIfE+nfjPktA54jzVaPxlUm8qMXV7XHSI+4VJTPWcvj2yNaHI
         Q+0CRSkyR1ZFSQ5Fz1mOUrr1XrRqx4AOX+Ni3F9qv4vdu5871bxGOI19KkaCUoKpekPz
         qkhk5fRkpcKxR+b9LKnEzMQFdZk5h7HqsaL7WmodBmMgvknBKI5JomX23D56XpdACJZP
         EH0ghaWmj+JlUoX8FE/80f3yIFmjHldPiQ29chd13qpMD3TVo8bshVS4SPcFpL4eQjiO
         JvLg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=lqQhQHdw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p3si1616705ybk.772.2017.12.11.13.31.14
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 11 Dec 2017 13:31:14 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=lqQhQHdw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:55528 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eOVfO-0000ir-41
	for alex.bennee@linaro.org; Mon, 11 Dec 2017 16:31:14 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35677)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1eOVf4-0000iO-Ug
	for qemu-arm@nongnu.org; Mon, 11 Dec 2017 16:30:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1eOVf1-0003x5-3G
	for qemu-arm@nongnu.org; Mon, 11 Dec 2017 16:30:54 -0500
Received: from mail-pg0-x242.google.com ([2607:f8b0:400e:c05::242]:45482)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <andrew.smirnov@gmail.com>)
	id 1eOVf0-0003us-TS; Mon, 11 Dec 2017 16:30:51 -0500
Received: by mail-pg0-x242.google.com with SMTP id m25so11839996pgv.12;
	Mon, 11 Dec 2017 13:30:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=gHgUtmN0/rGU/APCPhW0EAHnmsZlsiEW/PZANp51ENA=;
	b=lqQhQHdw0B6+UVafVQP3r75nmssP9hFrUULw9eAGxvsCVB9gQQq3J61w86lP+kWQ5S
	8SWOsQaW8xqrsnyHHnFwz+Ve6ejldRfaE4fRMFYTIw4BEbx5knOxs1/OvXfrgR/jIHD+
	CXClDF4lgRu6inJ+Jw8utklhW/ow4yqurStigz/8tpFdvHk6lkh0iaTb4K2KjqXwpcxS
	U3u42c0MlANxECwQMTscNGPa9RTS8rUGluebZ8tOz3A9R0A1LpbnzbKjfOejKtCKT0Xv
	UiwxRMdfS3X0hBIFw2Pg6P8UiRB9rDvTvzy+7Zskatrd1/GOnh9uvvMkilNEZsTBlAVV
	wGbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=gHgUtmN0/rGU/APCPhW0EAHnmsZlsiEW/PZANp51ENA=;
	b=SHBRlKOZFH7SMvFf6dyzECuxteZAkqz0N9uwCyz9arNf5+1hm4nHsL5kEJ91JRjKu1
	PwL10PKyCSlK8kym8d/2niadtjlxERQDV5IbWBN4x8JSNt0D3bPNIMwZgPrthVn5xOT7
	mYtJDDlc7fY+PXJQi07Cu3kAIfNgPqHt9G2//QhspMHvzGRS59xK3AM+qPeDDPo/nsFq
	SxwlOlnPKCs57wEdu7wGSaPyaTC6kIqjR6JT8QdyCmY81IuLpqcEXjrV7wbzDlkggNOD
	AVCsDIM2Py63b2VtbBblV9Cz1gQmqHRmaoPSvnZVtgvnclFFux1ycH081dpYMGB9vFIP
	gtAw==
X-Gm-Message-State: AKGB3mIhTOe3TZVZsrMT4UAx7oIQHmHKmDDyyliSoNQQ44gsW8ZltSxu
	0vm+Qmv3h+i/dN4TBqJkzf/3y3kH
X-Received: by 10.159.195.72 with SMTP id z8mr1628345pln.183.1513027849587;
	Mon, 11 Dec 2017 13:30:49 -0800 (PST)
Received: from squirtle.westlake.spaceflightindustries.com ([173.226.206.194])
	by smtp.gmail.com with ESMTPSA id
	q10sm25359690pgc.84.2017.12.11.13.30.48
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 11 Dec 2017 13:30:48 -0800 (PST)
From: Andrey Smirnov <andrew.smirnov@gmail.com>
To: qemu-arm@nongnu.org
Date: Mon, 11 Dec 2017 13:29:56 -0800
Message-Id: <20171211213007.7353-3-andrew.smirnov@gmail.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20171211213007.7353-1-andrew.smirnov@gmail.com>
References: <20171211213007.7353-1-andrew.smirnov@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::242
Subject: [Qemu-arm] [PATCH 02/13] imx_fec: Refactor imx_eth_enable_rx()
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
X-TUID: Jg+GmMcuIybG

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

