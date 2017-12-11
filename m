Received: by 10.223.159.74 with SMTP id f10csp3052700wrg;
        Mon, 11 Dec 2017 13:31:17 -0800 (PST)
X-Google-Smtp-Source: ACJfBouSBuwj2AqOcKbXEDE6q/49/q6XFYnJ1ofDRfRooZFUTh/vfgIqalpzoVFW6hvj0n+fnxuL
X-Received: by 10.129.105.196 with SMTP id e187mr1335800ywc.217.1513027877292;
        Mon, 11 Dec 2017 13:31:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1513027877; cv=none;
        d=google.com; s=arc-20160816;
        b=A1MwPPgVxQBFt4rHa6YzECP8PpyRCFDxVAeBU4qCQUSuUM4n7hTMb78mYwYiqPpPln
         WVpS9QV4+TqQQaL9oEmVrxciVlo3kDydlZws22Nkm6FCUtezvjUV3Y9Ev9jongRPFGVt
         Rx8vOYPYb7+CZF3Aw2iWB6n1u4PAQ4RiSEfJhKWn3O9ZE5D0taM+PTsRr0akfQ9zc0+C
         3txqj9slSRAD0D7p+vF+AXApojSJOXFVYgfdtxwObgeOwjoJbUaVsyMksP1xYfvYs9MH
         iM+7zCbpoCXCAZAaMsjq6cNrsLtLDiQhJK51yOpJyYQfb9K866OvxB6USV1BSSnMJnAq
         mPOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=Xduqlof8RSbyi8r9qMPGqSAd4q4+/VM3I7uumoz45oU=;
        b=Jk1pzyHR5KS/rV0CUP2etLCutBBQiIlvCEpdMnQYYQRErnOu5JC5fh5QlpFhZPNz0n
         LXh9gTlwJWbBoqcozCi9kW6B9B3PjQRqo6orljYMwywUUGKxum2R1XpjELrTU1LlHO4f
         /UYl84NUWsfKJ8x4Zm87l3AHQKpva7BCkK+KH0UqCQ40VpeJSgl74pfCFz5U2wt0uu3E
         ff828VHq2yGpj0XJSXvHjZL20h5ooX1UaaF/VpcKN1jJiRR9GoNxMHkAyEd88QWLTrws
         h17fqj0pDTaG3O5QgTw1ch/mmmksNCWQweO4D8oKJ9fYp6ycSB+M/9unMHSW2aluH7VK
         u/Ng==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=cpPMAJab;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d8si623358ybl.385.2017.12.11.13.31.17
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 11 Dec 2017 13:31:17 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=cpPMAJab;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:55529 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eOVfQ-0000is-II
	for alex.bennee@linaro.org; Mon, 11 Dec 2017 16:31:16 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35672)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1eOVf4-0000iM-Sq
	for qemu-arm@nongnu.org; Mon, 11 Dec 2017 16:30:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1eOVf0-0003vi-JP
	for qemu-arm@nongnu.org; Mon, 11 Dec 2017 16:30:54 -0500
Received: from mail-pf0-x241.google.com ([2607:f8b0:400e:c00::241]:46971)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <andrew.smirnov@gmail.com>)
	id 1eOVf0-0003tU-D8; Mon, 11 Dec 2017 16:30:50 -0500
Received: by mail-pf0-x241.google.com with SMTP id c204so12521900pfc.13;
	Mon, 11 Dec 2017 13:30:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=Xduqlof8RSbyi8r9qMPGqSAd4q4+/VM3I7uumoz45oU=;
	b=cpPMAJab7BPehdAYfFkhca72CDGLiPBPwi//I23/vgCkf1BVn42Zp+I3d1ltHdFp3X
	k6CQ+6BaIgj3gtN+kSUWel9yXo4WK3JLn4DZe53KLsKSndQTFL8br8B/cWjbrUmrbv8w
	IX0zLf47Faxc4EE8rOtZ50VDy8dZF+Va9Lamn5r8v082TK4fRDdnu+7Z/fVOjmmBGxSK
	HBudFEkenmPKKm68duEsSZwrUTwjRhBhiXvnG/SYxZbDuXwXTX2PRH1KFRFED7Ojb9bM
	qnKjkLwbmevbIuKg8mOnUNySVu6kSGsnU6lykf/EZ4HvqgStBKNO9eUqeByOLFbimVz3
	EJ8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=Xduqlof8RSbyi8r9qMPGqSAd4q4+/VM3I7uumoz45oU=;
	b=nY02eEZE2KZlH/FC7D9EtJz+PooscHDmMcWS4kThgiELNwJe3v5y5e6h43JvqaYtZE
	BshIEXtokoiwF3iUZcDsvad3OjkAhuOGrNgN6Bh5kUnv7IDZ9V3FANGSpOseOXhuDgFX
	7SivUoNaNZcfteILzpiaYqINu9lHRvyHJWgMk4+Dnvu6P470B7YbJgG83uqVYeNmYcnq
	ovB2inL5ZB3srmIErBJdh4NIRisOKtF5H8auA4OS0646DPWEEVQltQJ3DKro44svhqDO
	ByWzkf1L/Z3toSim+RTt6Y7NruJxSYp+tXTwN/DoIPqba8Tfo1WtNb+0Wu0wlj38XBSm
	ZDHw==
X-Gm-Message-State: AKGB3mL+13lVwyjmSN2vF+OLbnvWkK98aAhW5/Ke9IGzhMAq/DPJC4hF
	DE+EVJxYVi22MM8aU2X13yYe1TyZ
X-Received: by 10.159.197.67 with SMTP id d3mr1625597plo.409.1513027848643;
	Mon, 11 Dec 2017 13:30:48 -0800 (PST)
Received: from squirtle.westlake.spaceflightindustries.com ([173.226.206.194])
	by smtp.gmail.com with ESMTPSA id
	q10sm25359690pgc.84.2017.12.11.13.30.47
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 11 Dec 2017 13:30:48 -0800 (PST)
From: Andrey Smirnov <andrew.smirnov@gmail.com>
To: qemu-arm@nongnu.org
Date: Mon, 11 Dec 2017 13:29:55 -0800
Message-Id: <20171211213007.7353-2-andrew.smirnov@gmail.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20171211213007.7353-1-andrew.smirnov@gmail.com>
References: <20171211213007.7353-1-andrew.smirnov@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::241
Subject: [Qemu-arm] [PATCH 01/13] imx_fec: Do not link to netdev
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
X-TUID: lBeoFEgPJecv

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

