Received: by 10.223.159.74 with SMTP id f10csp6406586wrg;
        Thu, 14 Dec 2017 06:53:43 -0800 (PST)
X-Google-Smtp-Source: ACJfBotjJgPjlZnY5cExh/831u09EteInGDLlGk63ppXMTx5a/d693oJjlyRWWW5lihHE7sKwPr3
X-Received: by 10.13.250.5 with SMTP id k5mr4329280ywf.122.1513263222959;
        Thu, 14 Dec 2017 06:53:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1513263222; cv=none;
        d=google.com; s=arc-20160816;
        b=fhZ5b09kjEr22/ENnHOlm3ihBLgqac7DjZJY+nODq4GyB8ILTM9X3P3PvruCyvQi19
         yAq3aE+uTXEuSMH9N7nAiw362Eo84jtO1HRhBj8KijW3J6FD/8IApk9/Mcp9LFvzBFok
         KfoXEZX1QnXQXe7CFhCMmwnLwVwL+3ns6bXrFbf3vS5dxYOrMXSDyWPwwHsKC04xQHB0
         VMO64D919L/WJYd23clM9XKwfc+6TSRx1Fmxq+7xgaeGD65F0kjp4jZv577ZlRTa1dqR
         tCQJXV01YflWqiRAnpuUOy9I9oMNqaPmtbiAtBeAOU0c7Ub99EEVhqW1k+nT//rAzdQS
         j5pQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=Xduqlof8RSbyi8r9qMPGqSAd4q4+/VM3I7uumoz45oU=;
        b=fIS6ZbuamWg66QylBWaEO/pPW4CkfYD57wtjc1yPHCexINqVd/rA/D/6mU4tUCc34S
         YSXs67ZSMAI4/Y1VXjlcyj7fGZjedH0ejlxgI4HEa0kNWxqR5zW654wlkHOIZ1ySZuxb
         HKKZSewOoEsQ+QMSGiI2RrEL3O6ilAeNDkQFQ3JT9jAFt1CBzheQtWtW7YiJQOy1N/MI
         GwPxsMEseZQ58i0tFtNGKRm5pQz7N5frmZJPoER00HVYJ6ilaWreN3mansrgZ50j8RAW
         uUyWU2fmdFod8rXaSermI5TlNy65dXqVhWcIctagIF2IazIS3NsxkcxZIQMW0niGfRW4
         yW1A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=UCe1UDEy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d6si870439ybi.127.2017.12.14.06.53.42
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 14 Dec 2017 06:53:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=UCe1UDEy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:41358 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ePUtK-0001Mj-8t
	for alex.bennee@linaro.org; Thu, 14 Dec 2017 09:53:42 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55028)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1ePUt1-0001LF-Sp
	for qemu-arm@nongnu.org; Thu, 14 Dec 2017 09:53:25 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1ePUsz-0000CK-1b
	for qemu-arm@nongnu.org; Thu, 14 Dec 2017 09:53:23 -0500
Received: from mail-pf0-x241.google.com ([2607:f8b0:400e:c00::241]:44890)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <andrew.smirnov@gmail.com>)
	id 1ePUsy-0000BH-Rh; Thu, 14 Dec 2017 09:53:20 -0500
Received: by mail-pf0-x241.google.com with SMTP id m26so3756437pfj.11;
	Thu, 14 Dec 2017 06:53:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=Xduqlof8RSbyi8r9qMPGqSAd4q4+/VM3I7uumoz45oU=;
	b=UCe1UDEyPqtI/IZSx+6+TiQ/bQSyBl1RPWoqc6FMVxODvqMSt3anSTehzAafvgijD+
	xgavBfC9moNsAAT52nelutBe6Hxc3eT4Yqv3WgXxNoYeloI1RWfqHkRLmVsFflqoQxnZ
	rwg2AdtqWXKOYZ0DduMk0rA/ZlcBFrx4GgKfEuvh/Ko0L7r32v1J+v34t60caBwqLou8
	ZkxthYQamG/raTAxTBHdY2YeabTjBKSo2e5r2e1zqTR+tnq381LFTO6zQk9wf/P2t7Ky
	buw4hcX0Mi11NfznEDwViRFu7W97Dx0J0KIesJm1VZn9QUEH3kvd3psN8W/fSJyEcu2t
	6FIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=Xduqlof8RSbyi8r9qMPGqSAd4q4+/VM3I7uumoz45oU=;
	b=CJPClYmS0xhYcgGq4lS2mK7HVybmqej3wxspm7wGRRimOqYrFu2OS3jJBaC3wEMDSM
	wXvDlHCqmjvwNqy3Z4IOZreDNqD6Ykh7iUingG7RIy/5JjuQEuA9b+rX0wBrq+Y4zuIQ
	X54KOxkVEvaS7gVHiPjMIy/yThLzeILdJaQeSSdVXw8sm0jaGEKJtwZdB9kur4xZr0HH
	QkH/I2rorWJNKKnkexx3EmXBhuqW9LWywMSw2l4WB0Yzm74GNPh46TDAZOg7Yp4AuuUy
	xbD/85q3cPrC0UjfSIhCqZDHAO0kwuGrW3cYwSyxjeBxmEUk5+aJdXSWcgIFq2kJY4w3
	naCQ==
X-Gm-Message-State: AKGB3mKR+bI7LzVy18zB71aBLwPAT0Uh58QIwsolGFmy7Jz3lnvqSKU3
	7KMSoJJTHaIwbq/jf2cNfKI8ExOQ
X-Received: by 10.99.7.8 with SMTP id 8mr8889808pgh.264.1513263199284;
	Thu, 14 Dec 2017 06:53:19 -0800 (PST)
Received: from squirtle.lan (c-24-22-235-96.hsd1.wa.comcast.net.
	[24.22.235.96])
	by smtp.gmail.com with ESMTPSA id e7sm8757439pfj.44.2017.12.14.06.53.18
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 14 Dec 2017 06:53:18 -0800 (PST)
From: Andrey Smirnov <andrew.smirnov@gmail.com>
To: qemu-arm@nongnu.org
Date: Thu, 14 Dec 2017 06:52:41 -0800
Message-Id: <20171214145255.31545-2-andrew.smirnov@gmail.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20171214145255.31545-1-andrew.smirnov@gmail.com>
References: <20171214145255.31545-1-andrew.smirnov@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::241
Subject: [Qemu-arm] [PATCH v2 01/15] imx_fec: Do not link to netdev
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
X-TUID: HN+aOE8ca3E8

Binding to a particular netdev doesn't seem to belong to this layer
and should probably be done as a part of board or SoC specific code.

Convert all of the users of this IP block to use
qdev_set_nic_properties() instead.

Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: Jason Wang <jasowang@redhat.com>
Cc: Philippe Mathieu-Daudé <f4bug@amsat.org>
Cc: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Cc: yurovsky@gmail.com
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
---
 hw/arm/fsl-imx6.c | 1 +
 hw/net/imx_fec.c  | 2 --
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/hw/arm/fsl-imx6.c b/hw/arm/fsl-imx6.c
index 26fd214004..2ed7146c52 100644
--- a/hw/arm/fsl-imx6.c
+++ b/hw/arm/fsl-imx6.c
@@ -385,6 +385,7 @@ static void fsl_imx6_realize(DeviceState *dev, Error **errp)
                                             spi_table[i].irq));
     }
 
+    qdev_set_nic_properties(DEVICE(&s->eth), &nd_table[0]);
     object_property_set_bool(OBJECT(&s->eth), true, "realized", &err);
     if (err) {
         error_propagate(errp, err);
diff --git a/hw/net/imx_fec.c b/hw/net/imx_fec.c
index 90e6ee35ba..88b4b049d7 100644
--- a/hw/net/imx_fec.c
+++ b/hw/net/imx_fec.c
@@ -1171,8 +1171,6 @@ static void imx_eth_realize(DeviceState *dev, Error **errp)
 
     qemu_macaddr_default_if_unset(&s->conf.macaddr);
 
-    s->conf.peers.ncs[0] = nd_table[0].netdev;
-
     s->nic = qemu_new_nic(&imx_eth_net_info, &s->conf,
                           object_get_typename(OBJECT(dev)),
                           DEVICE(dev)->id, s);
-- 
2.14.3

