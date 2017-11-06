Received: by 10.223.150.237 with SMTP id u100csp2783412wrb;
        Mon, 6 Nov 2017 07:48:45 -0800 (PST)
X-Google-Smtp-Source: ABhQp+RzXhaKzxLmOPRDLCf1x9WQ9QrLmLm0Q9cs0OkIPZbsh5LFVAa7mBn0pI80QtQf253xBhAb
X-Received: by 10.37.28.65 with SMTP id c62mr10248750ybc.301.1509983325581;
        Mon, 06 Nov 2017 07:48:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1509983325; cv=none;
        d=google.com; s=arc-20160816;
        b=TjitqUyn78XE7xSlng1jNlz9ZTSNOi9qO3gh8tc7x1RstDPVW7Ve4VrpKwHXy1G/xU
         PHGQAhXnDw6Aqgyn7TbSM7PDiBvPrP4JZs6udekoM12YctMFwSz82rZOAEF5cKvAXDAn
         /rS48lAbc6AIi0iz6S5ufUtDk8qSHw10nOO4wTIpnujPUs8JG7W//vPH/BVx8ZBE0X7G
         d8/DlwBRhKulzZZ8gy29p34O3PApDfSmOpqBDRWKmNp8zLbfuc+mjdK0uajLhHPQfjwY
         dZ+Jb00QPoEq/OPo0q1l6M8EONODb+e16XtfPGuKiRoGcADqTccF2OuOuBXKhv9dmdYY
         zSTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=ns/VTSSJDM8QxFDFgYy70kNSnTqY+1rSy92OOo54vl8=;
        b=oPqwqjAWSO9YacLCiospJvxMDN85kEM7JihneRtkytMCBv0ZCPkrHuP1iCOkNdmPxp
         licIUurN8LMwdJEFcGZ/ELJsLUd16dhxU8vPZenowpqupXdLmcS8LrCWGhP3ZUMS6QEC
         X7hU41iX0QL3KO73rwd/yEpX6y9HjRDnSmL/6t1cc2hnKFuZ5k1K/mpx5qIZUcK8/y21
         imlExSL3qihJbTaZ7HEMETwx54wBSXGvNjlt3tNSB/rK8TJV7BdsdW/4JkQrp8795/GH
         n3Bv8i1d/Y0nkeMrJQz34ShpUwzli4GetRFU9TJZO2PB554xKDy0J4mSCYRbMlTPEwCd
         ktCA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=KwI57nCN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 203si861097ywr.412.2017.11.06.07.48.45
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 06 Nov 2017 07:48:45 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=KwI57nCN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:48757 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eBjdl-00071K-11
	for alex.bennee@linaro.org; Mon, 06 Nov 2017 10:48:45 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33275)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1eBjdZ-00070h-G3
	for qemu-arm@nongnu.org; Mon, 06 Nov 2017 10:48:34 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1eBjdW-0000Lu-Cg
	for qemu-arm@nongnu.org; Mon, 06 Nov 2017 10:48:33 -0500
Received: from mail-pg0-x243.google.com ([2607:f8b0:400e:c05::243]:44211)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <andrew.smirnov@gmail.com>)
	id 1eBjdW-0000Lf-70; Mon, 06 Nov 2017 10:48:30 -0500
Received: by mail-pg0-x243.google.com with SMTP id j3so8524898pga.1;
	Mon, 06 Nov 2017 07:48:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=ns/VTSSJDM8QxFDFgYy70kNSnTqY+1rSy92OOo54vl8=;
	b=KwI57nCN6UlDYzOsOJmOk7Xbqu4beG9kUX0qXYA56VNYa72S7YrJNKacsuqk4nzvuY
	EQjiOlQ/+nRtSNr6QnAs73xOq4FL6desXXHXnTtbH58ZEsoeRkuIAlb4/VYYry4qBQjW
	TrvU8ItWPn0VrXvo27kZ6WItQSLzjW2SpPdokXcR/oCWBtIzJ1gh+aWaPZMcJZFYgdxK
	7keqm1+kZ8bwgowviglJ4DV4qUTEh0uAmWvITm602qS1PIdsN3mr1Oyweiq3ZEqkdJjC
	Cj/UChkZjPGzhRk6aZf16P6J8zN1t1q7+01hO4o+vNRepKhPyLFw2bKM0bMNbDyyZBOK
	4zhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=ns/VTSSJDM8QxFDFgYy70kNSnTqY+1rSy92OOo54vl8=;
	b=R0Ogw3NGldveboX+M40/6VkfvRzbH6lb2+w3y/PHmXD1JrfDewg/BEXwO13aAqqt2Q
	de7FTM1UhSF7i6M8QdndtMV0/DcJ6IlTRfwsiUoRcT4+4ASQ6wSkpE088/bjFcCnwcpq
	dZPXwjx/b+GFnW/SVGTtuaeE2dsUqIyLG1HPybFw1RmHdzbmGJH8fp751S9BRZ8iZ+hS
	GdjaMEV6trhJ/Zt2b4GZwHuVezMNxWYgYpospdSpb61EO4lq2YtxOPCpJNyZs2UFzssZ
	TEbVxhrY5X60wnQcmDX5Jj7yMcisxmbw1CgX1DrFIELA12hpNhVDpLOzWnqUdvX5+7bq
	vaJg==
X-Gm-Message-State: AMCzsaWTt4XUT5nh9VJrpV4bd2EsEJCUBO+8o2zTDM2NB4k/LELZYw/G
	NGN7XU9hjXWjAXYdoxZH3orwxWzBgk8=
X-Received: by 10.98.158.211 with SMTP id f80mr17037515pfk.156.1509983308836; 
	Mon, 06 Nov 2017 07:48:28 -0800 (PST)
Received: from squirtle.lan (c-24-22-235-96.hsd1.wa.comcast.net.
	[24.22.235.96]) by smtp.gmail.com with ESMTPSA id
	x1sm22719590pfh.113.2017.11.06.07.48.27
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 06 Nov 2017 07:48:28 -0800 (PST)
From: Andrey Smirnov <andrew.smirnov@gmail.com>
To: qemu-arm@nongnu.org
Date: Mon,  6 Nov 2017 07:47:44 -0800
Message-Id: <20171106154813.19936-2-andrew.smirnov@gmail.com>
X-Mailer: git-send-email 2.13.6
In-Reply-To: <20171106154813.19936-1-andrew.smirnov@gmail.com>
References: <20171106154813.19936-1-andrew.smirnov@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::243
Subject: [Qemu-arm] [PATCH v3 01/30] imx_fec: Do not link to netdev
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
X-TUID: BCjJmQC+pgvJ

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
2.13.6

