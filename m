Received: by 10.223.134.117 with SMTP id 50csp11158905wrw;
        Tue, 2 Jan 2018 11:39:57 -0800 (PST)
X-Google-Smtp-Source: ACJfBotZB7F3Ly8uOkl6x+3GqdUe7T0P8X2893/QbGPHkWFNCEYn+JtAl9vKPPA8o0/pSIEvKIsm
X-Received: by 10.37.248.29 with SMTP id u29mr35513929ybd.511.1514921997471;
        Tue, 02 Jan 2018 11:39:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1514921997; cv=none;
        d=google.com; s=arc-20160816;
        b=vPzae+7cSZjttiL2h1z3ROjeZQnMueoRF9uOh5cDp2X+Lv5B6fU9PZ+lxhkBVQxZOr
         LscU8PnIjigSglivO44g27wWJh1fY7I9zAmOlJGKXRFnlkP2s4lCUnPnbVHadZUEMgTw
         6AXVpfCU6NiszSkk4ExjKPKARVIxQzrYtxnraMvTXwY3akeziRkkx3/IdGa2D8p3ETFm
         zVcXTM6CciuC6m8nJkhAhKbV4XLtvJycUA7wG+TxrP9QnjtTQMwrCTPo4phAL0EDcZtv
         d5Zr7axTcAFtnuW3FkgKPBbhsBh11bZzIcOHGVL8N/pquuoZ2fc6H5LqOElk/z9eNGGV
         Ikmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=uZAjdu/ViWnu/aZpzw5alaZY2904L6KQcjj4bJJYMJ0=;
        b=pAKG5hpQQMSgPCD7dXPhaWyG649y9c9J0YYF07H0gwsQeQI924sfup6B7ET6g+odC5
         XR5Y2+oidENhrhAi+u6BOtgT8WGTIhSlqYz4TKdDagJWAJx6X2ShCcLWA6DsoRxf/4wJ
         UtPNC11zT+ULvosqEomnW5XipAKHwZ4QLYSycCYzAoRTUMCryhNWosD7ulpYy7BPPyZH
         kpKBfujV9jggks7d1yQXGX3IOR36WrfIV0d7gzG2LwKDqlWA2lCic8xe+E4FfHDBnwDY
         e3PsH9vIDQeTa9lI16y6BOgeHuziqWGcztFoBdIPoPlOFc4neQTIFSbVT8+Vj2VbKVzx
         Uu+g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=O09jzwsl;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d66si2111066ybi.127.2018.01.02.11.39.57
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 02 Jan 2018 11:39:57 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=O09jzwsl;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:52918 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eWSPk-0005IF-RR
	for alex.bennee@linaro.org; Tue, 02 Jan 2018 14:39:56 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58647)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1eWSMf-0003IX-1A
	for qemu-devel@nongnu.org; Tue, 02 Jan 2018 14:36:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1eWSMe-0000NX-7p
	for qemu-devel@nongnu.org; Tue, 02 Jan 2018 14:36:45 -0500
Received: from mail-pg0-x242.google.com ([2607:f8b0:400e:c05::242]:37963)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <andrew.smirnov@gmail.com>)
	id 1eWSMb-0000Jx-CZ; Tue, 02 Jan 2018 14:36:41 -0500
Received: by mail-pg0-x242.google.com with SMTP id t67so2960592pgc.5;
	Tue, 02 Jan 2018 11:36:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=uZAjdu/ViWnu/aZpzw5alaZY2904L6KQcjj4bJJYMJ0=;
	b=O09jzwslLkILJPDGbdloNmO6pLauAsRaj0sXr3hMuXfvLBeUCtdNuVuoFIja5b/Ovt
	+tUMaxQJNxo0EmR4+We6nM8PbnIuJY0J7GyiC3L2ZssjXMgcWXANghVqRoJPQAbKlq0/
	ToteLM2Z8mxP7DBz7m+D8K5MR7kmSspyT0V5ecB9YoIbXxlpG3uPsRBaxLfHajsts6oA
	hZTNNxArzwUM0X9Ym+PShATXBXXV3mbbzDmoEcoMw6qmniDHt4X8jSAyjcBU7MRfEu5K
	WeUnm32VJmJDJruDaGWM26UDgL6VIxJbYXR80bl5TFTaIq317yw5w6jHHpYZvHoKW7S6
	zN+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=uZAjdu/ViWnu/aZpzw5alaZY2904L6KQcjj4bJJYMJ0=;
	b=bZqfoK2BEuXJm8e8+mdF18+YSm59NRWD6VIppWQQfHIdRUioOGuc2s726+GHjrLSS7
	1cOy50/9BFT97UtfH7vb164qbr11YUFbyPbOT/lIh+pM203sYRsixFdf7YAHJ4otsvMb
	50QJ9qZNY5QtL5BvcCECvXxuZxW8EQC0wf8JEC2rWGDmGnuqa6gD796xJyKFWABfvM64
	uuj/MFoeA6tTFCcCxPQyvUB9UrFWURxqQ8zAc9/R2wCWleE0KjYdyqE0V5D9X6laLjTx
	SSyO3iCV9V+ytKI0kf1t9U33lEaePtZOuwYuXRIW/VnP7BkbrafFXUAEf0ihbUk3WJwM
	f98Q==
X-Gm-Message-State: AKGB3mLU6aB+vIBlkoruII4H8QHHPqLgPhoVGtjulltIBrkIb2bg9H7W
	qys2/bBD62cLEfSV648K49QldjcYlvs=
X-Received: by 10.98.71.90 with SMTP id u87mr46529901pfa.75.1514921800125;
	Tue, 02 Jan 2018 11:36:40 -0800 (PST)
Received: from squirtle.westlake.spaceflightindustries.com ([173.226.206.194])
	by smtp.gmail.com with ESMTPSA id
	g9sm97905951pfk.0.2018.01.02.11.36.39
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 02 Jan 2018 11:36:39 -0800 (PST)
From: Andrey Smirnov <andrew.smirnov@gmail.com>
To: qemu-arm@nongnu.org
Date: Tue,  2 Jan 2018 11:36:17 -0800
Message-Id: <20180102193622.27215-7-andrew.smirnov@gmail.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180102193622.27215-1-andrew.smirnov@gmail.com>
References: <20180102193622.27215-1-andrew.smirnov@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::242
Subject: [Qemu-devel] [PATCH v3 06/11] imx_fec: Use MIN instead of explicit
 ternary operator
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
X-TUID: Ni8oWPj7kviI

Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: Jason Wang <jasowang@redhat.com>
Cc: Philippe Mathieu-Daudé <f4bug@amsat.org>
Cc: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Cc: yurovsky@gmail.com
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
---
 hw/net/imx_fec.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/net/imx_fec.c b/hw/net/imx_fec.c
index 50da91bf9e..6feda18742 100644
--- a/hw/net/imx_fec.c
+++ b/hw/net/imx_fec.c
@@ -1076,7 +1076,7 @@ static ssize_t imx_enet_receive(NetClientState *nc, const uint8_t *buf,
                           TYPE_IMX_FEC, __func__);
             break;
         }
-        buf_len = (size <= s->regs[ENET_MRBR]) ? size : s->regs[ENET_MRBR];
+        buf_len = MIN(size, s->regs[ENET_MRBR]);
         bd.length = buf_len;
         size -= buf_len;
 
-- 
2.14.3

