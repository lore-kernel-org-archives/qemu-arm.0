Received: by 10.223.159.74 with SMTP id f10csp6412272wrg;
        Thu, 14 Dec 2017 06:59:36 -0800 (PST)
X-Google-Smtp-Source: ACJfBoviEtTKIpVbl7jOjuJGQmoZnf0tcnNFcm3kB3heMb0pIM7D6y93cNt5m/tnEoVVIrxz5a1S
X-Received: by 10.37.124.71 with SMTP id x68mr4623440ybc.278.1513263576749;
        Thu, 14 Dec 2017 06:59:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1513263576; cv=none;
        d=google.com; s=arc-20160816;
        b=IDRju4r6MaKBcsEaZ8IB+30tVnzrEidIbx8CWKCQFEnlZSbz31PRSCy7ghyp/z/8j/
         ccmUdzLNUETJc07yJ8yHcHslYZHQv3uCrur69Q5TXQRvqIFOA37g9qM93aHZBaoUkaHl
         q7YoCLlRYEJPlkvDKHuwoI/m1Bxuv9S2muIkTV3eb7tUxOESz2SqLckowpVLCdArdaTb
         pzj7wbtlDBOPbinmKUrlxqlHNL66Y3dUq64pZ9nMlXpjkDpwg3Wfz45Wb+t1LrggRX6G
         FKdZ6rwvrdZsXK94BBhbixhtMbncuEe8qHAG8UN4Pe9klznysr35f7Hx8bjbQ+dZg8E2
         bWyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=Uh6BWoCeucm/RqhnrLog4O3BSbZ2UG1LTw2gH+giLCc=;
        b=xjDwUkLTWSlWNctbtWCUfQtrzoDkLUy3PPu9/Quu/SJVMmnLB7fSbvChYLNgmOU+Th
         Xip1+OYJEsjuoqRUMtA+yaHnGMimJ2CuTn1IIb4CboZlwOD8X6m67EqhLi5OFVVHXJlF
         y8trE67ACsy+Ai/wjy9agizpuvtoSEvLbxZZeXrrNwRVkVWFeH9wC18F6EcoB32FxPmk
         Ah27s52TFyxN2OvlYBUsZe7cXHagphzjAi/J/wRsYhAPdLq4uTWirhiF/j+wRzFdo12N
         ykw+VWnkFS9iAKoQUVE6/vfjk0S7Y8aHxno3mEfHj27pYPz1OP55HHbeVJjWVuwNdbGV
         H1pg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=ay2Pn57E;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n186si876910ybc.513.2017.12.14.06.59.36
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 14 Dec 2017 06:59:36 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=ay2Pn57E;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:41401 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ePUz2-0006Tf-5Y
	for alex.bennee@linaro.org; Thu, 14 Dec 2017 09:59:36 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55269)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1ePUtC-0001WQ-Tz
	for qemu-arm@nongnu.org; Thu, 14 Dec 2017 09:53:37 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1ePUtC-0000bL-86
	for qemu-arm@nongnu.org; Thu, 14 Dec 2017 09:53:35 -0500
Received: from mail-pg0-x241.google.com ([2607:f8b0:400e:c05::241]:46611)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <andrew.smirnov@gmail.com>)
	id 1ePUtC-0000ZR-2p; Thu, 14 Dec 2017 09:53:34 -0500
Received: by mail-pg0-x241.google.com with SMTP id b11so3542124pgu.13;
	Thu, 14 Dec 2017 06:53:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=Uh6BWoCeucm/RqhnrLog4O3BSbZ2UG1LTw2gH+giLCc=;
	b=ay2Pn57Eiw9kHFqVexz+X5sWaVnwyeLokNSB41N9L6QwwSM8WjVm9E4fNQcU+4Jfw2
	B3ORfVO2jM+kOXuGJVA7Gbieyo+NqfQcf/pend8qSu71hNQD5UxkppEwh05+TQBefHiQ
	j8jBg/Y9cJt5hbx+xtFDFZLlW+XPKqnrZwzXrHQ6HTWDtzpeRbNg7MLiSc/rcUUNMi2s
	86Zd1jG/Ax3QBQb4TEHMISS9Xr/vbri49edlMo5sLbGT4fHFMKPPfk2t28oHI8kYfnB8
	DKOzbusjDyrcaOGzDIwlNSyrjF6BaBpTxHbMnuehL59Knt4vyOZsSBKpgb4lXpRW4MjF
	W+zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=Uh6BWoCeucm/RqhnrLog4O3BSbZ2UG1LTw2gH+giLCc=;
	b=RgV6pRCR5HRxhMDHkWn19uY0jMEyegP0uBfkCyGeVoWojObkCxgPaNQaf40UQPnTDP
	3NF3K8GFGxgbkL1dI/uS3GftxSmdWbIofC+LbyWpDjOvPQ2ljIxtCerpfrpgrlCYjlJ+
	1vwO8GobSaL47Q5kf0BlVQzkfQR6rd+YbQByplHsAf75X7KOpe8zxjPaLGpZzWM2/CK6
	faxUOhWEENNxeTAA6YEg0F47kxmOQm61UzbZfLI9G/uRjcFNAAm244DOlqYnQsuhDyMK
	DJkRGmvtybrwAbcVvuwvTnVYTZRyxJKsytsGUIEbD/wnrYlPJMBVsw9YC70UzLBBSwR2
	tVLg==
X-Gm-Message-State: AKGB3mIlBwU0GpSmckWx8OUrkKpjTHr0A2Bi30oDV5FL6UptoWUFHFnq
	1+RciO9OlkBNcns1CDuH3jy7MUPf
X-Received: by 10.99.45.4 with SMTP id t4mr8823377pgt.254.1513263212787;
	Thu, 14 Dec 2017 06:53:32 -0800 (PST)
Received: from squirtle.lan (c-24-22-235-96.hsd1.wa.comcast.net.
	[24.22.235.96])
	by smtp.gmail.com with ESMTPSA id e7sm8757439pfj.44.2017.12.14.06.53.31
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 14 Dec 2017 06:53:32 -0800 (PST)
From: Andrey Smirnov <andrew.smirnov@gmail.com>
To: qemu-arm@nongnu.org
Date: Thu, 14 Dec 2017 06:52:50 -0800
Message-Id: <20171214145255.31545-11-andrew.smirnov@gmail.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20171214145255.31545-1-andrew.smirnov@gmail.com>
References: <20171214145255.31545-1-andrew.smirnov@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::241
Subject: [Qemu-arm] [PATCH v2 10/15] imx_fec: Fix a typo in
 imx_enet_receive()
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
X-TUID: ky7nezh9TtiL

Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: Jason Wang <jasowang@redhat.com>
Cc: Philippe Mathieu-Daudé <f4bug@amsat.org>
Cc: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Cc: yurovsky@gmail.com
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
---
 hw/net/imx_fec.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/net/imx_fec.c b/hw/net/imx_fec.c
index 6cb9e2e20e..c1cf7f9c58 100644
--- a/hw/net/imx_fec.c
+++ b/hw/net/imx_fec.c
@@ -1150,7 +1150,7 @@ static ssize_t imx_enet_receive(NetClientState *nc, const uint8_t *buf,
         size += 2;
     }
 
-    /* Huge frames are truncted.  */
+    /* Huge frames are truncated. */
     if (size > s->regs[ENET_FTRL]) {
         size = s->regs[ENET_FTRL];
         flags |= ENET_BD_TR | ENET_BD_LG;
-- 
2.14.3

