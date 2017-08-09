Received: by 10.25.221.202 with SMTP id w71csp504235lfi;
        Tue, 8 Aug 2017 23:29:30 -0700 (PDT)
X-Received: by 10.55.165.205 with SMTP id o196mr8141109qke.117.1502260170871;
        Tue, 08 Aug 2017 23:29:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1502260170; cv=none;
        d=google.com; s=arc-20160816;
        b=PVbtK/HMeUMYowiYAmVBskNHky+vJv11P7e8IZ4YFqvHts03npsFD9VYKlnnWg38aj
         cVOmDZFay0zmdZPzfiHD30YfISpY4Hm146hxdoZn+Q5uWCUEHa2kiv0lixHffkWsErOC
         Kb0oh6EHqQBnj7bbwgILrpOTXeLjqGWY8GKJehUQ9RSKFjyYPvGgmmvKdUAyf6kWQaOk
         I/5pMbe9fPicOtAXUQSa3VBSivfHhC1pm+9DZ9tHDPUC25ovTXK7uOCb2/nwK3SlH0rH
         8HXc+VvCSgUE3DJIYL1Xvh+F6M/Miyf8sEyzqHkhPQ6x6okGAGNmUbGKt/aS/TD4+2+U
         6KAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:dkim-signature
         :arc-authentication-results;
        bh=uzkJPqWJqx0LJSLGO2T7w8trESySPWwGjTeWE+nE2Eg=;
        b=ueFrk9XwSa1v9Gy6/JRrnRgLYRij/q8KWsMRoGE16v6RDsgZwVIHV6bQIC9gfLOddY
         Sqc8/gEAqpnQ/sVqiqLhfEmrQXimdHuXs4pQU3GmB0J8sUOvAxDgMzq21wX+vsSklyFi
         ZVHahkUoaSvc0pOpEqC/R7Yk0cqW8MPzTJOtNkA74IUNX5fBN5xFHKGviSSqXaPSY+oC
         vJYh1D72o2tO56y5yWuqxjciBmJf4riVlOS9QegTcBWBrtV4JB5sJROsIodcaCiMUtJS
         1Vq+H7AKo4l0hkFDrq/ncnsQxaudYdoiico5Kw58741Co8PFTE6FTDbXXU/qtDXro/Pz
         6FWw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@aj.id.au header.s=fm1 header.b=Z3fGJ84X;
       dkim=fail header.i=@messagingengine.com header.s=fm1 header.b=iJsVEs2r;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f7si2418590qkc.264.2017.08.08.23.29.30
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 08 Aug 2017 23:29:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@aj.id.au header.s=fm1 header.b=Z3fGJ84X;
       dkim=fail header.i=@messagingengine.com header.s=fm1 header.b=iJsVEs2r;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:45875 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dfKUi-0006Ba-A6
	for alex.bennee@linaro.org; Wed, 09 Aug 2017 02:29:28 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37040)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew@aj.id.au>) id 1dfKUT-00063B-Hf
	for qemu-arm@nongnu.org; Wed, 09 Aug 2017 02:29:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew@aj.id.au>) id 1dfKUS-00074h-H8
	for qemu-arm@nongnu.org; Wed, 09 Aug 2017 02:29:13 -0400
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:49147)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <andrew@aj.id.au>)
	id 1dfKUS-00074M-Dz; Wed, 09 Aug 2017 02:29:12 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id 207D021D8A;
	Wed,  9 Aug 2017 02:29:12 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
	by compute4.internal (MEProxy); Wed, 09 Aug 2017 02:29:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
	:date:from:in-reply-to:message-id:references:subject:to
	:x-me-sender:x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=uzkJPq
	WJqx0LJSLGO2T7w8trESySPWwGjTeWE+nE2Eg=; b=Z3fGJ84XiHQ9ztY+/5eKGK
	HLjluhtRR6G0dIyhaGPmqRz2fzHlAGtuH2ywgUZTftnSJvI3TLOFWhHAvbDEdRQ1
	C7u1RUPXid4BL9qf+/0OAlEvSBJ34Hx4EKwpQQ1Cghkk6wXrM0UWupJeaxkbiyOM
	HIrK5x2ia5Dgb9UzOLlN4oPEVSiIdxxvAS9fhLbNiLpka/xQNkt7BPIYx8TRpcEh
	ECUF0Et91oXRIBouzxf+2nw+kD03vUToBA7446/ccHE7wixhrfITqdEXj5zr9Prm
	svQCuxYxz2fSHtZJEeeDXsAgoaYeJ60/HKiPrhVM9p1bESnyZwYCmIpGUP6op/Aw
	==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:date:from:in-reply-to:message-id
	:references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
	:x-sasl-enc; s=fm1; bh=uzkJPqWJqx0LJSLGO2T7w8trESySPWwGjTeWE+nE2
	Eg=; b=iJsVEs2rNkve9hzB53n83/540vLaOjuIIUJpievNU+ogWoVFnz2nrcZb6
	pLSrhkKTgwt1ninRqinv/EocardHS9JkXyTkXoqlJQzZw1eZc2/D5RnYzcd6ngvv
	xwg7Yh/H21ZSDg1h7T2ksNLKOzTUJerkSsD8o32/Z0Mvo63dwJua1ZPkntnzsiIV
	WJPojo3cfjuQgE+bm5yWWLtohFfdbZqM1AyzpFQ7nSCk6OOIsdq5UbE3uaFz6dt4
	ZTiND/XpehKk+/cqIWyuKYZjYR6TS0JPp/ptRTTRnEG+puPf2cT/sD/O6Xrch/Rl
	sWoS/68Tu/Z27DBm8/RfUwZ/F3e6A==
X-ME-Sender: <xms:uKuKWY55tpb9ojl5zO6sFXAYH6HDHsWW3s8HwQNnXPk4IXSaWODRtw>
X-Sasl-enc: tTMzAZynhKDKbaPvkMIe+Qk0KQeNohPjhIulxVqiyMr+ 1502260150
Received: from keelia.au.ibm.com (unknown [203.0.153.9])
	by mail.messagingengine.com (Postfix) with ESMTPA id 7A4BF7E4EA;
	Wed,  9 Aug 2017 02:29:08 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: qemu-arm@nongnu.org
Date: Wed,  9 Aug 2017 15:58:27 +0930
Message-Id: <20170809062828.3673-3-andrew@aj.id.au>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170809062828.3673-1-andrew@aj.id.au>
References: <20170809062828.3673-1-andrew@aj.id.au>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.111.4.25
Subject: [Qemu-arm] [PATCH for 2.11 v2 2/2] ARM: aspeed_soc: Propagate
 silicon-rev to watchdog
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
Cc: peter.maydell@linaro.org, ryan_chen@aspeedtech.com,
	Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org,
	qemu-devel@nongnu.org, f4bug@amsat.org, joel@jms.id.au, clg@kaod.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ckueBNDFb/NY

This is required to configure differences in behaviour between the
AST2400 and AST2500 watchdog IPs.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 hw/arm/aspeed_soc.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
index 3034849c80bf..79804e1ee652 100644
--- a/hw/arm/aspeed_soc.c
+++ b/hw/arm/aspeed_soc.c
@@ -183,6 +183,8 @@ static void aspeed_soc_init(Object *obj)
         object_initialize(&s->wdt[i], sizeof(s->wdt[i]), TYPE_ASPEED_WDT);
         object_property_add_child(obj, "wdt[*]", OBJECT(&s->wdt[i]), NULL);
         qdev_set_parent_bus(DEVICE(&s->wdt[i]), sysbus_get_default());
+        qdev_prop_set_uint32(DEVICE(&s->wdt[i]), "silicon-rev",
+                                    sc->info->silicon_rev);
     }
 
     object_initialize(&s->ftgmac100, sizeof(s->ftgmac100), TYPE_FTGMAC100);
-- 
2.11.0

