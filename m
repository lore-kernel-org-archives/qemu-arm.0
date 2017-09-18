Received: by 10.223.172.38 with SMTP id v35csp4137105wrc;
        Mon, 18 Sep 2017 12:51:46 -0700 (PDT)
X-Received: by 10.55.47.6 with SMTP id v6mr21814905qkh.181.1505764306456;
        Mon, 18 Sep 2017 12:51:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505764306; cv=none;
        d=google.com; s=arc-20160816;
        b=shqrFU+FfRcIwHBXAmxYTyw50bJUG3uR98NjMdOkAwjUewNMI3za/PzTUeHVSZ1dnK
         eAraE7KVDSo/1tQcu9i7u8fIAWhZRVPznNxqJU212gErHGDXl5+Ahtg20nIwj/bbg/Hy
         huvKpQhARrQOPxridDed+B6y+ULqoRYH7+R3oqgDI/4kuae+327FscVCp0rInuQ3Add4
         6rfTqOiyna6FW3gAaDv91m6iK+snEEIT948xe4dN3NimtSEMnRDRg/x0oRL55o4+IcN8
         R9/D60UwuGURKa8jf/x/8enUNsxiw8ifspkCpyAUbtu3rL2Sunbve9c8dEPaADDXPekJ
         pvKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=xH4PDlbQmfZ4+FLF/gb6b2Wyr7awmkrKNjYJcWTOOC8=;
        b=ac6FFoCAjB6Ko03GCDQ/e4biFzDShRaFxNX2MwmHHlVHaPyOU9qMVAcCyNfT7MJEU2
         oTiXKyNSgWv/e60lAi9ucP2KSu0qJvank0x8clzOrw14kvE5dUGA5Sqm9Prk7Ip4nzFZ
         fkAW6GbJnMMMSJZCwfjMO8Qyjcwkkhrc8qN/se2ek/KQdVBPxKgqspyz6lSHtaFAesNO
         fb1lrfztyTPQ5mqyKWXRF0SADK+5pg9zxBXgqY47DxRNgqwD/PhG53tIUejuTndTweIc
         AOw+CAbs2gwwW9J8yquHSe7ZYm7r6i7Jwffy+LbBeqTqtPLp71TBbIGC9lZEZOxy/shP
         UxEQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=OU4QQxIV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k6si4092692qkc.350.2017.09.18.12.51.45
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 18 Sep 2017 12:51:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=OU4QQxIV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:38611 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1du252-0006ld-34
	for alex.bennee@linaro.org; Mon, 18 Sep 2017 15:51:44 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37219)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1du24o-0006k1-TD
	for qemu-arm@nongnu.org; Mon, 18 Sep 2017 15:51:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1du24m-0006Et-OK
	for qemu-arm@nongnu.org; Mon, 18 Sep 2017 15:51:30 -0400
Received: from mail-pg0-x244.google.com ([2607:f8b0:400e:c05::244]:33825)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <andrew.smirnov@gmail.com>)
	id 1du24m-0006Eb-Ij; Mon, 18 Sep 2017 15:51:28 -0400
Received: by mail-pg0-x244.google.com with SMTP id u18so658558pgo.1;
	Mon, 18 Sep 2017 12:51:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=xH4PDlbQmfZ4+FLF/gb6b2Wyr7awmkrKNjYJcWTOOC8=;
	b=OU4QQxIV3zWdJ5OqvtItfVSwJFDst4W9eFoPkP9T8DXH82t7AlFmXnt+Sn3tSnMsM2
	TSg8YfoHUlYe/NOZmHlNikGENC199D2+/Eu/7EcMnRQ48bG60qyArShWmnh4/N5pD/Uf
	/9CsHQq2m21Qa/B0Bupw55oWNvOs8Jcu0h/1h4LZKNRgmGssj6yHUnz+jYAc1Xi5l7ci
	ANm1xT4Wt6ALvrIAq7h89OEb9MuvSGr5c1zepEMaHGwPbm8gnXREt2db7tDXgENjqK1Z
	tD1eIqD9MXo+EIqxW8nSVdhkyHexoBOQcFoOzZ00BZzikpW7Tf6VB8Jga+1Pl2V+TIjp
	BWuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=xH4PDlbQmfZ4+FLF/gb6b2Wyr7awmkrKNjYJcWTOOC8=;
	b=SwIjjzD4Csq4OsIDZQ+axltxO7O/TWcWCPaVnBhEoPBlYmqdyT8GIfHp++hDtdG90H
	WPa5XwmsaR0Z9ldQdRbE1bMLNwkuxDrxdSuw+mnwsgwAlNmoN7cy5vtlh+ALbY7lu/9e
	WybBRcNUCfvwRKfyYRMF2kkU4jfpCnJO7oFYlhxTw2DTZSVmpQxPTkdi7SLpTzhczUR8
	lQfQ0ka1GaL+EBT1GJ2TU/GPYsSBs74LWheQpGFV2KDLfPcG/hNf8+3iE9C1UNxchc9I
	bfm8FLtEili4E9jlkMOyTjzRuBCpFW5j1yFT2YakK2mZ7atyHaPx8sbmn+H/FczZch0M
	7ljw==
X-Gm-Message-State: AHPjjUjlGbEGCRqORSTX8Es2x9UGHgZx6vXheSyd1m6Re+ORk347INWO
	+JFMGCBubgSWEsNm0rs=
X-Google-Smtp-Source: AOwi7QAj2+AKeKbC3j3N2UB4nmAcKUSKo53DDZ+tE1ygJcI8TUb9qGQWJLhi43tVIyTJdJR0a5IO7w==
X-Received: by 10.84.128.73 with SMTP id 67mr2244306pla.128.1505764287338;
	Mon, 18 Sep 2017 12:51:27 -0700 (PDT)
Received: from squirtle.westlake.spaceflightindustries.com ([173.226.206.194])
	by smtp.gmail.com with ESMTPSA id
	d186sm200791pfd.117.2017.09.18.12.51.26
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 18 Sep 2017 12:51:26 -0700 (PDT)
From: Andrey Smirnov <andrew.smirnov@gmail.com>
To: qemu-arm@nongnu.org
Date: Mon, 18 Sep 2017 12:50:46 -0700
Message-Id: <20170918195100.17593-4-andrew.smirnov@gmail.com>
X-Mailer: git-send-email 2.13.5
In-Reply-To: <20170918195100.17593-1-andrew.smirnov@gmail.com>
References: <20170918195100.17593-1-andrew.smirnov@gmail.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::244
Subject: [Qemu-arm] [PATCH 03/17] imx_fec: Refactor imx_eth_enable_rx()
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
X-TUID: oPQEyFvFSi51

Refactor imx_eth_enable_rx() to have more meaningfull variable name
than 'tmp' and to reduce number of logical negations done.

Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: Jason Wang <jasowang@redhat.com>
Cc: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Cc: yurovsky@gmail.com
Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
---
 hw/net/imx_fec.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/net/imx_fec.c b/hw/net/imx_fec.c
index 75822344fc..84085afe09 100644
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
2.13.5

