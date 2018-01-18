Received: by 10.28.153.193 with SMTP id b184csp2093wme;
        Thu, 18 Jan 2018 12:50:54 -0800 (PST)
X-Google-Smtp-Source: ACJfBouNLmM5OPbUqSXTzOPwrxhXezRUBMgSUIKJ21tBKfJ8PWw2AF9j9WN0j41+cX0z9rDqTx7e
X-Received: by 10.37.133.134 with SMTP id x6mr17136332ybk.283.1516308654296;
        Thu, 18 Jan 2018 12:50:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516308654; cv=none;
        d=google.com; s=arc-20160816;
        b=P8UrzE1pyYH3l3rrUwSFOp9x+PK2cGCnu8L7EMLFPY+J53oAboGMyDF/d2lBW1u5yG
         qdoWPYNAT2mvXqCQjCNthWzUvGzPAywl07GJSVFF+6SZnxqHgH0he4zruY+Empm58P1p
         oJA7Jedfm/XMtdNf4cozbglpEogjGNh1aca4Hi1++kbXMLzLIe3/Ei7zfaAkOXfjC985
         jZukiEZJgwnpR4XTAmiRVjLd5VvCbOaFz1f2bp05SCa7ugD23TVJaC3JMJw9LjrQpOvO
         nTCgIYTRmDr13b0R8cziZTbo85hT1K7MnY2ypYSENzbE513q/Bz7tmKNVwKYUIWD2JnP
         rOPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=vSz663hxt9kCgV2WJCKUifLEv6n3AWYNiInFUzwPrDE=;
        b=czNfoKKPYwESd8DsLKi5OapGnDN+Ow+a4AeqxlsLpS+/ruFzu9ykOhkfP8Ysu7NSl8
         5790YUyX6YiBwiibnOn9XC4EYHVIpRF5lNLwB2Qk/glYefee36YM1/Lz4Dc3J+y/LZm0
         AijwDmhwi4Ho/mZ8rlam4Fuie4NSWMAfbIAdW3xsmVafSZEuNjkIe/PDv5nmn3El5nR1
         gdvUk1SxhyVzJ8HT5In4bhwySicgVdjSUxUU3qT+lzuzMWyTSihZXP7L26fY73g+87WM
         iEU6knw1AaEoq2AwETExc3hnwKL2LKUBP6BH134E212XpWCMRyhb/rrPHMQiszNKi4Hm
         VDrw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=PUOqfWVU;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t13si270355ybl.631.2018.01.18.12.50.54
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 18 Jan 2018 12:50:54 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=PUOqfWVU;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:53910 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ecH9B-0008AE-KB
	for alex.bennee@linaro.org; Thu, 18 Jan 2018 15:50:53 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44976)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ecH04-0000XJ-30
	for qemu-devel@nongnu.org; Thu, 18 Jan 2018 15:41:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ecH03-0007VK-BW
	for qemu-devel@nongnu.org; Thu, 18 Jan 2018 15:41:28 -0500
Received: from mail-qt0-x243.google.com ([2607:f8b0:400d:c0d::243]:39369)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ecH03-0007V9-6O; Thu, 18 Jan 2018 15:41:27 -0500
Received: by mail-qt0-x243.google.com with SMTP id f4so12714267qtj.6;
	Thu, 18 Jan 2018 12:41:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=vSz663hxt9kCgV2WJCKUifLEv6n3AWYNiInFUzwPrDE=;
	b=PUOqfWVU5sTxwLcbF0Zq9oVJzZQ48fbSJZR3n9u92RfUASwtM4uETT5ZGL9cwlNpfg
	ROveU3vjhQQ/+riLEKicY5mmoK6VM1IfWqyEcnIiqtNAXg1CNmwdf7iDnV8ipt0TFtvC
	m7Ohv88OImDdVsklpAZ1/y4E/5jmAUOR6ak9DsrNzRg1A0HPnWGM/ZeCiOqpVWuW5D4u
	vqC7WFKDxxCqJzXo8kpf2awQcoedHh/j7PYxzKfCJT3Wo6g+s5rsgppxRxjiUjtH03WN
	6KIiR3OiAflI8LlYJD/VHbzs305n4S0dUgWNe9DR5q2FKlj3H9FqnWVd9rgO7aq+V9W6
	F95w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=vSz663hxt9kCgV2WJCKUifLEv6n3AWYNiInFUzwPrDE=;
	b=e42Gse3aNYo88s/q+aXEfy12JOMDFTO7F0DqIL4jLjXPL8MTk7RLTLyakPe6D7pSKg
	dgRN4/HnGnIc7jCYD/PwyzSAfQPecIjUknN93CzYrx/So9Tn1rX1fUoRvOGRfspi2/J5
	VUa9nNp446B31qpVowfbgBKBxxvgvITD2DDKbjfXaZeIOlr7nDS42MGPANEc3gf2E/bO
	QJsU49I+GQmqAiJ7xsgbhyQotRPCj94hb0DnAU0AAPkLIOIcN318UDbt1627iYXrM+o5
	jAT2PVgxI7ktCIP2z4tqgGtmxWqjMq+kmwJ4Bb/pl8b+D2JY+NpB3QxcxRHydOqWGM5m
	B7vg==
X-Gm-Message-State: AKwxytfvVL1nkgXw5YDTdC7PWUGUSe0Wvu2XqIrbLkBKbd6VBdE5QFeL
	ebmE3l0vUXLj9WU26k8ze8c=
X-Received: by 10.237.40.97 with SMTP id r88mr26108637qtd.233.1516308086696;
	Thu, 18 Jan 2018 12:41:26 -0800 (PST)
Received: from x1.local ([138.117.48.219])
	by smtp.gmail.com with ESMTPSA id 24sm5484621qkv.64.2018.01.18.12.41.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 18 Jan 2018 12:41:26 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Alistair Francis <alistair.francis@xilinx.com>,
	Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 18 Jan 2018 17:40:49 -0300
Message-Id: <20180118204058.5768-6-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20180118204058.5768-1-f4bug@amsat.org>
References: <20180118204058.5768-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::243
Subject: [Qemu-devel] [PATCH v7 05/14] hw/arm/fsl-imx6: implement SDHCI Spec
 v3
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
Cc: "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
	Prasad J Pandit <pjp@fedoraproject.org>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, Sai Pavan Boddu <saipava@xilinx.com>,
	"open list:ARM" <qemu-arm@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: PzL/jenUDjeU

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/arm/fsl-imx6.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/hw/arm/fsl-imx6.c b/hw/arm/fsl-imx6.c
index b0d4088290..e7d13d54e6 100644
--- a/hw/arm/fsl-imx6.c
+++ b/hw/arm/fsl-imx6.c
@@ -348,6 +348,19 @@ static void fsl_imx6_realize(DeviceState *dev, Error **errp)
             { FSL_IMX6_uSDHC4_ADDR, FSL_IMX6_uSDHC4_IRQ },
         };
 
+        /* UHS-I SDIO3.0 SDR104 1.8V ADMA */
+        object_property_set_uint(OBJECT(&s->esdhc[i]), 3, "sd-spec-version",
+                                 &err);
+        object_property_set_uint(OBJECT(&s->esdhc[i]), 52, "timeout-freq",
+                                 &err);
+        object_property_set_uint(OBJECT(&s->esdhc[i]), 52, "max-frequency",
+                                 &err);
+        object_property_set_bool(OBJECT(&s->esdhc[i]), true, "adma1", &err);
+        object_property_set_bool(OBJECT(&s->esdhc[i]), true, "1v8", &err);
+        if (err) {
+            error_propagate(errp, err);
+            return;
+        }
         object_property_set_bool(OBJECT(&s->esdhc[i]), true, "realized", &err);
         if (err) {
             error_propagate(errp, err);
-- 
2.15.1

