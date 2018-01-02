Received: by 10.223.134.117 with SMTP id 50csp11156338wrw;
        Tue, 2 Jan 2018 11:36:56 -0800 (PST)
X-Google-Smtp-Source: ACJfBotlybs7DwV5lPdTQA/bm6bXWRUcOkVQpRl/RYjLty+ezAkmO7h9OWxu/uNQvWfPLb26fBIg
X-Received: by 10.13.210.69 with SMTP id u66mr33000291ywd.126.1514921816313;
        Tue, 02 Jan 2018 11:36:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1514921816; cv=none;
        d=google.com; s=arc-20160816;
        b=eqqOCja4S1jYcCGV1GlH4mUjvMio00AWWwZo2LaIZvOWHSDJ3mImv5E30O+FDKa6NG
         AdJ16hrFiuFkI+gSD6mng+ZxvIyZ3TVmEpd4DV/+ia9vUgs1EPWptOI3EGXno610FXbJ
         4TOXnVl70SNhCBga4jxEYeqXkGiakyK1YJEVonQLjNV2eFswfqxveHAP0I8oAt36GFf6
         JHxDU/NmLIeGM5OuKSLx00mOCGVxDHCyUSCptYLsIbFFAdLrnh4dVaXia4+8qMzgDgRl
         qocZVBBlHqVZJxWUAK9ecct0wAAxmrF1SyRQfJtnpB2nbp1tpqnyhXJvcpw45RTQpHax
         qZXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=+R7JD2AboYJs7m3vYE67ODV+/FajhNS+oxOIt/bT5AM=;
        b=Yruu/TRtueLj/EjmvZ5Y34Ws/YPhZUpE5x1wCbskQjbGo66yjE5d6OhjlzpvjloJbR
         eO85heu7P+jMNCgxBJ9lTUelSJzLnkIhHOBeb4RytzTkSkzkw8InOuQ4j01OjnKKGYaR
         JQ2/vUdC4KQdkoxmrudwZU/hhmWCE1Yv3+7URZhmvcBzBfA3/Sk/aGEsTIQkvvsJOaQs
         wkhnkThR5rc8jgglfsDDj4y8beG+fBUX3nu+aDUMQCleRrdTTo7DcOqJdvUMqL9Dlk5s
         O/mkUXyZfJ2yl76fDayC9ElpZaCSdteNLCiE3FBqSQ+ezxLWgicMoS5QZUPJ/mZ/1xlR
         SdMw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=eRqJZfZg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g124si8782724ybg.437.2018.01.02.11.36.56
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 02 Jan 2018 11:36:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=eRqJZfZg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:52899 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eWSMp-0003EF-M8
	for alex.bennee@linaro.org; Tue, 02 Jan 2018 14:36:55 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58478)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1eWSMZ-0003Dy-Bk
	for qemu-arm@nongnu.org; Tue, 02 Jan 2018 14:36:40 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1eWSMX-0000Gq-EP
	for qemu-arm@nongnu.org; Tue, 02 Jan 2018 14:36:39 -0500
Received: from mail-pf0-x243.google.com ([2607:f8b0:400e:c00::243]:45443)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <andrew.smirnov@gmail.com>)
	id 1eWSMX-0000Gb-8R; Tue, 02 Jan 2018 14:36:37 -0500
Received: by mail-pf0-x243.google.com with SMTP id u19so26002863pfa.12;
	Tue, 02 Jan 2018 11:36:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=+R7JD2AboYJs7m3vYE67ODV+/FajhNS+oxOIt/bT5AM=;
	b=eRqJZfZgDXLpzHUUBegHQrKBdnZ8gqFSNYg7EMm0Jng1LwvnoqwqYelZFtoR31EPcN
	DxQ1Vtzf+Ge8idnIZciTWOTlMeVjfjLnXldHPOn02on7jZ98yS9NHe2h+sIsS3LyOWTc
	7IYOaxEZPkyJjw287vgZfDTFHCEpZ7aHgv5C6p9Bpiw05vUbjYuIK6+ynZHRBOgUNMoJ
	rz0JHSgvbR7+9vGGEDPdrfmDcgjGsV1/2Yl+gfJ6ULogjRAE7ppbTIXStlJO8XBvp3ij
	4EcXEUCEE+1eJ+Le16JzLZpihNRtYzvN8VWwrS+40DIE6lcmvGExiGs9cgx8KR6wMKQn
	EICQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=+R7JD2AboYJs7m3vYE67ODV+/FajhNS+oxOIt/bT5AM=;
	b=LzDlYfWwVbEXY5AvfKqUnGVm/Wyq6ZlKooKVxo7tgx6IwB38rG6uxnZ5X3ohAM9v6l
	yuVUoawKMPSV8TtxHT/l8omHsBepAzHxqtmERoT4sr4dhvT2lFpmwNXzfBid5uZwZMKH
	bm/wRWv8bfWVqt0k2maUpmCfokwt/Y4v5yJXwpikuTUnEn/7dSU7iZ+BgmJNwluEBVvY
	T/1scDtu3HjGKoYzIX29U7HlsEBaTE0G9gHzroRXH5EgivXNrv/s/xIuyhqi3Izk6qKf
	dncD05vqYF+6g6XXcrNhE5MAsynku36ufqrQQEzk0QjCjaNcPe8Jrex0Gi6vA6Mu8ayV
	XIAg==
X-Gm-Message-State: AKGB3mItNO1MPX56x4GBEOyc8Ll6pXGH669c0V9VKTcSWFB+NLROorGJ
	bKCTF2T97KTKlEtHA8DSahUpiQdTSVI=
X-Received: by 10.98.87.142 with SMTP id i14mr46637906pfj.212.1514921796017;
	Tue, 02 Jan 2018 11:36:36 -0800 (PST)
Received: from squirtle.westlake.spaceflightindustries.com ([173.226.206.194])
	by smtp.gmail.com with ESMTPSA id
	g9sm97905951pfk.0.2018.01.02.11.36.35
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 02 Jan 2018 11:36:35 -0800 (PST)
From: Andrey Smirnov <andrew.smirnov@gmail.com>
To: qemu-arm@nongnu.org
Date: Tue,  2 Jan 2018 11:36:13 -0800
Message-Id: <20180102193622.27215-3-andrew.smirnov@gmail.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180102193622.27215-1-andrew.smirnov@gmail.com>
References: <20180102193622.27215-1-andrew.smirnov@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::243
Subject: [Qemu-arm] [PATCH v3 02/11] imx_fec: Refactor imx_eth_enable_rx()
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
X-TUID: f00nopQhNj38

Refactor imx_eth_enable_rx() to have more meaningfull variable name
than 'tmp' and to reduce number of logical negations done.

Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: Jason Wang <jasowang@redhat.com>
Cc: Philippe Mathieu-Daudé <f4bug@amsat.org>
Cc: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Cc: yurovsky@gmail.com
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
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

