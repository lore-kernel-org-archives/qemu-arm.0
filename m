Received: by 10.223.172.38 with SMTP id v35csp4137358wrc;
        Mon, 18 Sep 2017 12:52:02 -0700 (PDT)
X-Received: by 10.55.7.22 with SMTP id 22mr20407663qkh.43.1505764322688;
        Mon, 18 Sep 2017 12:52:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505764322; cv=none;
        d=google.com; s=arc-20160816;
        b=pDXqc4VQo0ZR/t0GxEm1Yjsp6/Id0Nz6ChQa5D3YlCrGiGOzHUa5VEPDo0EoolNAhl
         t3bwG10WK1vBH0gPTjIBr+Z7FJtXXX1xkXfQTxDWlUqcIAxkGpBtzQZn13+4g9JjRWqQ
         DZ0utxTqbufCN+SFoXHRULO3uKjeUap/Q1aptdibDbzfHD2pB/u+IoRs+9jU73cn2xJ+
         GY1QniCwOz8wrvRemDt8mJ3fc8nUAPEdAFUXW2ZGOXOr2itLA+fh+QHw8xSadVRzk+RJ
         vnHsqZz3c2GqxNUAYc5y6WjT53yS3W5EEwDO4uql3Nl5aktAepCj86XLUnYbXOBTtUwi
         7Y9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=BNk/XMXexa9eZG4ckigFUy60XK40Fo/MvaxQGV5lvgQ=;
        b=Zeo6wEnuqInPzOl1gTGCbHoLIchN1tq+NT2lScaCJz2Msv43u/Fm1GvxAyROMfHZIy
         8T8VfxoVN5vxTLPanwvWKURunCo0pjJQtv3SWj+NNOJCXDI60m8cFvkcZv6Md3AOAqyk
         V9dsYkZEr6TAXsOVo5IRNbzEa1olq+ox5Ir5KKNr7ut6H4gE3oSol+870c51sZwqE7A7
         yTa8t3S6IW+z0lQ5j63i1L5cd+SpIqkkh9uaPhKNeSPYA3eMgbhYnaeA3+W1iuSWmzS6
         1f8Vou6UeGzUGRil8zm2y7E43N8/F4lcdEUl6qM2IIih6/emdGslyCdBMtX7LKmlyKX5
         QNEw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=QvhgHHB8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h57si7781399qtk.24.2017.09.18.12.52.02
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 18 Sep 2017 12:52:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=QvhgHHB8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:38613 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1du25I-00079L-Ac
	for alex.bennee@linaro.org; Mon, 18 Sep 2017 15:52:00 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37306)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1du24r-0006ln-FV
	for qemu-arm@nongnu.org; Mon, 18 Sep 2017 15:51:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1du24q-0006Gg-Dz
	for qemu-arm@nongnu.org; Mon, 18 Sep 2017 15:51:33 -0400
Received: from mail-pf0-x242.google.com ([2607:f8b0:400e:c00::242]:35297)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <andrew.smirnov@gmail.com>)
	id 1du24q-0006G7-8H; Mon, 18 Sep 2017 15:51:32 -0400
Received: by mail-pf0-x242.google.com with SMTP id i23so595368pfi.2;
	Mon, 18 Sep 2017 12:51:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=BNk/XMXexa9eZG4ckigFUy60XK40Fo/MvaxQGV5lvgQ=;
	b=QvhgHHB8flbUfpapmkGLhLYiMeXuQ25iYA143oGavJCb3eZovhxdABdDGg6sgsiUZ3
	/V7sRrZO6UO9M/dJ5t92RkEdcvslWJt7p/Awr07+cIVbW8qlJEvHsrXmR7Bz3moPmXPJ
	2LUxODZbk1vpAo070mikblrl+2h+Xb66xoNUwYHK/nPjOl1siVPLCh3l857PKYghMbnB
	bksEh2CoIA5jqi7HXLkV4GU4uKyvTvi61PRFnpFDC02SPwhmJvXSCETGFomoNGkSdA4C
	Kp4/gJ2xdTrADHqCU9EKAXvT6CO+Vak8tBQtdAJU38dsYHxUwzD+rePsgUe9VHcvv4M0
	oCzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=BNk/XMXexa9eZG4ckigFUy60XK40Fo/MvaxQGV5lvgQ=;
	b=dIK2H42UrddseyAdfwxnKgwBuL95XFCGOKVr9HJNRrrlerTN9QLzakXDbPtSnY5TMh
	3/IfiSvx64Dk79L4IAt/iD56UQW3cga9PRAijXJHIQ3dpTBsCNgoUPztbzRwDNGcZA2m
	PLRt65F2oCQ7R4VeLgNSxUOdOHzN4jQl/Bdntb4TCKrYxFGoN46/rkxPUDhanO8Prt//
	PA6wgi9cS4IHUZjoLMoC7pcZELNDiHqomTlOIUzhwzg0+EUaTC+AwJjU0ngpMflUkjzp
	Z8czHepy0v1T2UvIrjELzBFVfQJeLnTKJ63Q0BzzeK/mGQynx7NHcMvFapTBYkVySwK2
	qhcA==
X-Gm-Message-State: AHPjjUjcs/s/tZJ3AMMw+OOXp/iqbV3g7caP/jv1V1FfLK1Jj0hjUzX+
	la+Xa2W2BTY4fuBkP/4=
X-Google-Smtp-Source: AOwi7QAMng1NP353B/itu0CPRwDTFZErnf5F1S0bvXKcywbKS7WTmgd9r/CbBBdZ3qWTYL7YsNeUMw==
X-Received: by 10.84.253.23 with SMTP id z23mr18994021pll.210.1505764291145;
	Mon, 18 Sep 2017 12:51:31 -0700 (PDT)
Received: from squirtle.westlake.spaceflightindustries.com ([173.226.206.194])
	by smtp.gmail.com with ESMTPSA id
	d186sm200791pfd.117.2017.09.18.12.51.29
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 18 Sep 2017 12:51:30 -0700 (PDT)
From: Andrey Smirnov <andrew.smirnov@gmail.com>
To: qemu-arm@nongnu.org
Date: Mon, 18 Sep 2017 12:50:49 -0700
Message-Id: <20170918195100.17593-7-andrew.smirnov@gmail.com>
X-Mailer: git-send-email 2.13.5
In-Reply-To: <20170918195100.17593-1-andrew.smirnov@gmail.com>
References: <20170918195100.17593-1-andrew.smirnov@gmail.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::242
Subject: [Qemu-arm] [PATCH 06/17] imx_fec: Use MIN instead of explicit
 ternary operator
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
X-TUID: B53jqh2pVHfa

Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: Jason Wang <jasowang@redhat.com>
Cc: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Cc: yurovsky@gmail.com
Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
---
 hw/net/imx_fec.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/net/imx_fec.c b/hw/net/imx_fec.c
index 989c11be5f..8a77136d38 100644
--- a/hw/net/imx_fec.c
+++ b/hw/net/imx_fec.c
@@ -1074,7 +1074,7 @@ static ssize_t imx_enet_receive(NetClientState *nc, const uint8_t *buf,
                           TYPE_IMX_FEC, __func__);
             break;
         }
-        buf_len = (size <= s->regs[ENET_MRBR]) ? size : s->regs[ENET_MRBR];
+        buf_len = MIN(size, s->regs[ENET_MRBR]);
         bd.length = buf_len;
         size -= buf_len;
 
-- 
2.13.5

