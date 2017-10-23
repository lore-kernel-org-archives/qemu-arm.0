Received: by 10.223.161.27 with SMTP id o27csp232345wro;
        Mon, 23 Oct 2017 13:15:11 -0700 (PDT)
X-Received: by 10.37.181.145 with SMTP id q17mr8995119ybj.352.1508789711489;
        Mon, 23 Oct 2017 13:15:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1508789711; cv=none;
        d=google.com; s=arc-20160816;
        b=qOE7ItdVUySkoIjyuSHXQUoky+w8ilqLDqTsgXYQjy1W9ocWa9uduN9SpqiuxS6AiR
         5hh20WB3EUk1+n6nvz9TTwQ0EiSx5BZqQGoxOZhuds0C6KtnRkcAN3G0K/P/SB6G5w8m
         FPZkVwX+ubqB6LueXvE2ttLms4DWhC9mTJxqFEl63glPD9CCzPBmIv8OBVau33xrE1mH
         BE9HXxDCZKhVx5GVp5nMnCFeRnsEBhkYk9YqzW0qzju8iOEkf6aLiXU1Y5c8CGnSGGhL
         s6U7Vg3Sb18ROF6yQEe+hN9DNvrLPc8cS2rpnKzbvrP2QHw6H4oqD6V78EG2OoCn8iUi
         y/Jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=cU6LPv/VJq5OFaAYNlxSFjFZXECMX+vfLMFd92s3EMM=;
        b=JKZHdpfrAnRtknjuAeaf3DQ073dGOEEvEW6UnQwzhY65zhp/9iNYRsYl38bfm2ynXn
         5Wk0vC1ZR+Wf9j5JRawwaaCOldkQHy8OM6QfftDG3/rsrFDxDKXIEFgmko2FgCCmQQSX
         W7v50PTBq7clmXsI5uA8JNNMqj7arCS4MNoVcu8efM0hK4glCcEf8XgKgatqnEVt2V2D
         FnQSRh7k0PtWmiwHC+6/ohgtarOHaX8V0NS1LwfGkEoQ6ePg1hHoW6MRFM7x8ki2QX4e
         XwFjBoWbr4nJwEY/tZl/YjJEqw4uTiwoziF1YQbUTK2KPNIkMCc7H7MdsFX1t4CbU8qY
         3lNA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=qxR0ZU4Y;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f196si1317664yba.269.2017.10.23.13.15.11
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 23 Oct 2017 13:15:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=qxR0ZU4Y;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:40392 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e6j7u-0003Km-Qq
	for alex.bennee@linaro.org; Mon, 23 Oct 2017 16:15:10 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46199)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1e6j4K-0000F6-6I
	for qemu-arm@nongnu.org; Mon, 23 Oct 2017 16:11:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1e6j4H-0002VB-Ly
	for qemu-arm@nongnu.org; Mon, 23 Oct 2017 16:11:28 -0400
Received: from mail-pf0-x243.google.com ([2607:f8b0:400e:c00::243]:49370)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <andrew.smirnov@gmail.com>)
	id 1e6j4H-0002Uw-GR; Mon, 23 Oct 2017 16:11:25 -0400
Received: by mail-pf0-x243.google.com with SMTP id i5so17913744pfe.6;
	Mon, 23 Oct 2017 13:11:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=cU6LPv/VJq5OFaAYNlxSFjFZXECMX+vfLMFd92s3EMM=;
	b=qxR0ZU4YUrpGzx7F8XAcF+NCN/rtKcauth7pBQs4v+FHo2cF0ZecW60gfJBFcqmkn4
	8r5q1PM7WRozXV3EU7e2jtmixWSwNSDuIdjOX1pqTJZgIGb5D1fXGU7uZ+uvWd4jZGcs
	SMvE7m6uOSvx7L9kfVL4cGofM/VbnDzA9OAPihRC22AoCTcZ+UX72pUb9d9svcg1gGeQ
	W0I9o+2iIDTaqooZx5sPdlmxqKBcB+rNLJvv1VdxxcyfrBsNf6R++Ze1RzI4YMh0o0Vh
	GBLK8qXOrHa+6Hcli4McNufnPi8X1WpGXyySNLhPVIUTy+g6J31hG+z29vFYtrikNV8y
	Qtzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=cU6LPv/VJq5OFaAYNlxSFjFZXECMX+vfLMFd92s3EMM=;
	b=DMMPFZTzSiWaU1FuFotGEb8O6N3NUp5PlXf59UWKGqC6YfBGZvYLUcw6pDkAaVF2zU
	TOHhP4afBl2WIg/IXKDAHX6utisR0cv5nDfm98zylr95hPGZfGFofvNnRd3SpubtQd0d
	YG2rMS2Xk8r0lxLVDT2j2NsX2VOI+Yf1f2+qzUduuFv7x5nzP+atX6lEpnQeuj3WiXZx
	zMguLnyh0HyQjVzF2nREBPSfvAww1nFvtKemvHdLIdQzH+Kyo9REt7VmxiM93fhwEV3P
	FdkvengE7MNRiV9D1gTbmOzX8JGnsIMPxVb8DcoGk4Bq+CtC5fJdNFjfqzUf7/LLmfXW
	ulvw==
X-Gm-Message-State: AMCzsaVAidyp3izcpFhPQDcK6zOuCciKLMKj8d+6al0rCYkgnNLXiUDG
	tJfELgrBfLolaQyEJ0qnEP72Va1a
X-Google-Smtp-Source: ABhQp+SnYLoMiRu81nkADoYuilHn4e6cMxStp6/SCn38RV+agDuRBc9nMmc8Mli8DEodqd4efCDHRQ==
X-Received: by 10.98.196.209 with SMTP id h78mr14305307pfk.249.1508789484209; 
	Mon, 23 Oct 2017 13:11:24 -0700 (PDT)
Received: from squirtle.westlake.spaceflightindustries.com ([173.226.206.194])
	by smtp.gmail.com with ESMTPSA id
	j1sm15181623pfj.108.2017.10.23.13.11.23
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 23 Oct 2017 13:11:23 -0700 (PDT)
From: Andrey Smirnov <andrew.smirnov@gmail.com>
To: qemu-arm@nongnu.org
Date: Mon, 23 Oct 2017 13:10:37 -0700
Message-Id: <20171023201055.21973-10-andrew.smirnov@gmail.com>
X-Mailer: git-send-email 2.13.5
In-Reply-To: <20171023201055.21973-1-andrew.smirnov@gmail.com>
References: <20171023201055.21973-1-andrew.smirnov@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::243
Subject: [Qemu-arm] [PATCH v2 09/27] imx_fec: Fix a typo in
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
X-TUID: YnRAz+ld+/5k

Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: Jason Wang <jasowang@redhat.com>
Cc: Philippe Mathieu-Daudé <f4bug@amsat.org>
Cc: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Cc: yurovsky@gmail.com
Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
---
 hw/net/imx_fec.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/net/imx_fec.c b/hw/net/imx_fec.c
index eefb3b2c62..48d012cad6 100644
--- a/hw/net/imx_fec.c
+++ b/hw/net/imx_fec.c
@@ -1121,7 +1121,7 @@ static ssize_t imx_enet_receive(NetClientState *nc, const uint8_t *buf,
         size += 2;
     }
 
-    /* Huge frames are truncted.  */
+    /* Huge frames are truncated. */
     if (size > s->regs[ENET_FTRL]) {
         size = s->regs[ENET_FTRL];
         flags |= ENET_BD_TR | ENET_BD_LG;
-- 
2.13.5

