Received: by 10.223.161.27 with SMTP id o27csp229614wro;
        Mon, 23 Oct 2017 13:11:35 -0700 (PDT)
X-Received: by 10.129.178.3 with SMTP id q3mr9272648ywh.257.1508789495612;
        Mon, 23 Oct 2017 13:11:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1508789495; cv=none;
        d=google.com; s=arc-20160816;
        b=oq2P/6uOKiaJwBaTGp9mTJxOmIgq5IJMZ98G/s1H/YLeQbUYix33HI05V5bEiijeX2
         X4PaUhOEBweHzCDKJ8AgiyxsCxU1H/OByDvXnAqxCXlewPyt+IE9D6TxMJ8RE3q8x2aX
         T/mXE+jEm9XRX0cX+WF6xdZ1c+DDHeyimjcH84hmCQjVNvVxUjlXuJ4TiT8cacjIyrsY
         3VHA7vVR+7sQZG83JIckYJKdN3qfVBN6kmpYGZWA4wQAdsqvicu34pMhS0Eu9jUlvQlf
         +E6c8csWfaa3vbjNp+gYpvin80/MLQWKHvC7sW9WNjZZSjhqZ8jgFZ5tOXyII5z43Z4d
         q60w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=ct2ZJk0A9rN8ofw6AzCbtpKLE3HqyItSlHs4nOD0zaw=;
        b=As4wTjDyfezoGGsEx/PuwDu9jvuFjIK+kfEDMKOhuWLEJEu4kRQl5+KXs0oC3aqvVm
         ik3SpWZcxWDXLTGCJmGkkYdvTmv3ZIHWxej7lk6+rn58UoU/kkqzz29/kRDU+VLZl2RL
         iQnjRAYfqSq/L+fzezBck1t1MsT/lwLSdkhwub6bjddKEmD4BwgmvWmejw22+7q+1PPl
         EL+vIsbcOvnu3o7iN/Fsrh1fUSJup7N4mrHx4aGwsUbAVLd3Y3sm6ay9LtZHQE0xu4Rt
         jSqy84D4iILt1uu7ecwKtI3GkgBUTkBJ4UXeGpw4d6rB6oRVbFZD6ITAMNNfUoqJTUTv
         BMFQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=QMsE0Ufk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a3si666536ybn.771.2017.10.23.13.11.35
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 23 Oct 2017 13:11:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=QMsE0Ufk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:40368 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e6j4R-00007c-1g
	for alex.bennee@linaro.org; Mon, 23 Oct 2017 16:11:35 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46022)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1e6j4B-00007L-Ve
	for qemu-arm@nongnu.org; Mon, 23 Oct 2017 16:11:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1e6j49-0002Pw-CD
	for qemu-arm@nongnu.org; Mon, 23 Oct 2017 16:11:19 -0400
Received: from mail-pg0-x241.google.com ([2607:f8b0:400e:c05::241]:44180)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <andrew.smirnov@gmail.com>)
	id 1e6j49-0002PZ-6q; Mon, 23 Oct 2017 16:11:17 -0400
Received: by mail-pg0-x241.google.com with SMTP id j3so12638186pga.1;
	Mon, 23 Oct 2017 13:11:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=ct2ZJk0A9rN8ofw6AzCbtpKLE3HqyItSlHs4nOD0zaw=;
	b=QMsE0UfkAVks8Jv1hZM2Y2hDop5NzC51+MSmyMaAVxe2XFIlGrVOWHfnIi0q6UZJgy
	9DVoMzxaqJVPZj7UtjDtFXgm02Pzlwi4nTvweRXwiqVWRudKu6mgJTerccaYN0qBMdFs
	ITr+hJEGtoMvPv2xvGea2+icf7vfZM0H+n72vMV4JEgRY3VKULiaiwKcPNYNRA5uimq7
	elXUVOwrN3XUvY1PD6RqOtWWLjTb3eBkF3LVGRhKo43XCwv70y7IPLYdZAvc3xzMDU9h
	k6gLkB8EhX15PCH9OQmiNegEGyPngy5VaMdDXvJNaibaUy6cmOAiyuxZ0CblMg090/3f
	cDvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=ct2ZJk0A9rN8ofw6AzCbtpKLE3HqyItSlHs4nOD0zaw=;
	b=MFT3/Z/AF6kN7hC2jCxWqvu27Jw38bB0BkedsWHrCz1bWA9AyTuX2+cI0CMilp7Div
	2jUtqYYmLQGL/Qwg9hX+kxRHxSRNguoSVn2hzkTjrMhX70ap3xz4eu6aHos+1rXV3FUV
	NrIjYIW3GK38IO86g5+X6f0Q0qaJJU992JvGQQe/uvrzOipeHxKvKu9fTghcRlBS86lu
	nLXlZ1/LoedKVEP5156i2eTKit/i7jZqFYxWOWNErXGtFLtRip/JZAEJxykXflImun3Z
	oe8Gydz1w/1tAtWU1AQTMVYjAcwIhl96eE459METGe8ElfzPS3O7DJly4I2gzq/fetsb
	rEdQ==
X-Gm-Message-State: AMCzsaV6UNBwofNWVeO4X3o+KTnqkvnwT96MTIP+bthYRye3d93wYNxr
	n+/3LdHUJsHJDgDEU28Ka9CndXid
X-Google-Smtp-Source: ABhQp+S4KOjdqt7SJYejAjA6kq5/LakG3FOJdc8Pp9SGOhFl7m+a5tr/Nuf4A9CZIMs3NCYgHiSXoQ==
X-Received: by 10.84.248.133 with SMTP id q5mr11025471pll.419.1508789476055;
	Mon, 23 Oct 2017 13:11:16 -0700 (PDT)
Received: from squirtle.westlake.spaceflightindustries.com ([173.226.206.194])
	by smtp.gmail.com with ESMTPSA id
	j1sm15181623pfj.108.2017.10.23.13.11.14
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 23 Oct 2017 13:11:15 -0700 (PDT)
From: Andrey Smirnov <andrew.smirnov@gmail.com>
To: qemu-arm@nongnu.org
Date: Mon, 23 Oct 2017 13:10:29 -0700
Message-Id: <20171023201055.21973-2-andrew.smirnov@gmail.com>
X-Mailer: git-send-email 2.13.5
In-Reply-To: <20171023201055.21973-1-andrew.smirnov@gmail.com>
References: <20171023201055.21973-1-andrew.smirnov@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::241
Subject: [Qemu-arm] [PATCH v2 01/27] imx_fec: Do not link to netdev
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
X-TUID: x240rWnzFquz

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
2.13.5

