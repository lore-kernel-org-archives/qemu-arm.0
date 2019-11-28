Received: by 2002:a19:6911:0:0:0:0:0 with SMTP id e17csp7131080lfc;
        Wed, 27 Nov 2019 21:45:46 -0800 (PST)
X-Google-Smtp-Source: APXvYqzxhXylwzaYyDRjKCe9eaD6cV+4SBff3qw+9cntCdBkYs6BbNm65Qh3JmP2hJne4l6t8jGe
X-Received: by 2002:a37:6706:: with SMTP id b6mr8297511qkc.461.1574919946795;
        Wed, 27 Nov 2019 21:45:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1574919946; cv=none;
        d=google.com; s=arc-20160816;
        b=0p15WeKQEIGbNexmlTOaaQ/YgMaGaDOF6uAOhX2oZ/Yx0WoNqkISfLo88qqJqCnvse
         nosb4IvI0h9DKCWOi4EKK7m3F5LWL9tPqgJzVUF60py0ygpwTi3cmDdNnLAQvl/dVBpa
         DEhFAn1NjAp+jO1NAt1dLhV4n046lyq1j/7GzsWrGA1f7PVHhAzurBoSn+jNGvzP7UHR
         f1w8fE5AsIow1jjCF9v+sQqFL+eVSeSaZCc1ju4EcCMevznCJmWoMRvUVCe3/sipT80q
         v3IB4/wDH9/5MRAyGD5u0mCHlpACswaNw0dUsrm4DxBF6Ip3vJLJByT1w0RGkYIlH1w4
         9FnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature:dkim-signature;
        bh=hIc79k55330sLqRdCwQIUBdcco3hdPjvxZSvpVOEKc8=;
        b=qkl/RiBHN8fvLdarOQoXkTUtjhQ4z75R/D5BpLePKHpvriDu1hmjR//jWmsnpCRneg
         goNJ0ZvE6JsCjXTIaOeB99m55JouD8weOtIbvWw/4FpADt6E/2Xkc02D0Sc+tysKQgTL
         IybFwiUjK6H9jxaU2A7lF2NYlVCh5a7rOC/sracvto4Cz5LgiAqW0IKlvV1JmB35TE71
         d5ygIZTG4zJWiUdczb6YXo8KtYoMw8C05qfiR6flqcsoscE6uAiT6H2vRQM5DdQ6NjeT
         pw8qP5d7be0XDQE7mvf7++8kDgCVu2FbHuGTYgDqqeFmm9gpZflzeN+vvyq1PJ1N7XYD
         Ms/w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@aj.id.au header.s=fm1 header.b=eA0+3v5+;
       dkim=fail header.i=@messagingengine.com header.s=fm1 header.b=UJz8gHZX;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k4si12850959qtg.76.2019.11.27.21.45.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 27 Nov 2019 21:45:46 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@aj.id.au header.s=fm1 header.b=eA0+3v5+;
       dkim=fail header.i=@messagingengine.com header.s=fm1 header.b=UJz8gHZX;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:45450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iaCcb-00071q-T0
	for alex.bennee@linaro.org; Thu, 28 Nov 2019 00:45:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48851)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <andrew@aj.id.au>) id 1iaCbD-0006sP-2j
 for qemu-devel@nongnu.org; Thu, 28 Nov 2019 00:44:20 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <andrew@aj.id.au>) id 1iaCbC-000219-3E
 for qemu-devel@nongnu.org; Thu, 28 Nov 2019 00:44:18 -0500
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:48381)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <andrew@aj.id.au>)
 id 1iaCbA-0001vq-0c; Thu, 28 Nov 2019 00:44:16 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id BCC242274C;
 Thu, 28 Nov 2019 00:44:15 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Thu, 28 Nov 2019 00:44:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=hIc79k55330sL
 qRdCwQIUBdcco3hdPjvxZSvpVOEKc8=; b=eA0+3v5+/zvBS2+vagzNxpbiYLaUC
 xuKavTEb0iBxdqxd11txssmI0eFOr6PRbfSnk6Ta3Z+DH0u/egTH3jnNXeji3pya
 dzw7Ox6cAr0Pys3xRt5q2zyLilOMl4vXMsTtlF9FsXKVjtBmCQ2zrswb3DdqxWFi
 ppXo+lNc1BTT3sXTriBNm6K/N6EtPa9nrh6jsBTyIjEsHFMbLsLsiybxpNWxapkX
 JV1ODtm1JuZKFlZ0LLcMZEcMyIKl++9eiZq/+MlGbUe6oRq9P1Fjg3vutN42kosl
 QFKXaXFEPlk9AX8SfRKMdS0TETki64yHm5EnHeS6TeTX6gTbwuOFP6q7Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=hIc79k55330sLqRdCwQIUBdcco3hdPjvxZSvpVOEKc8=; b=UJz8gHZX
 FJ/jRZKjz2VZSIBfjSghAlk8MYDHnQh0cuaVADzsMO/BwNdqXnX/qJe3DWpPz1HI
 VvaNON17PHueO65OMf/sFZWfB0MiLpmA3WisO56A4U/9r6kIZsX5tR8g5jjYD2aU
 vlTNY1xMQDnxeJlE+7FlV7m3HqmsPCTxGmr5CQp5oap6SKOyteGOC7qHD7SFQdGs
 tyRq/rxj4zIVqARmhHI+CraLmcs8e57YXviI3jLxRtv13mwFkN3dRbDCxLSxYKLD
 ihb2AJjp+IhbGbzawPWOCrbxgl1zr9bOfMHwJW/aFpYq7ZRqt0MpjOkfnNCWXYkx
 3m7SNjNCnUQGGA==
X-ME-Sender: <xms:r17fXcEK6hfiSG05qbjUHsIHjU_qonzIvxX6eJN13KwyoV1qVVN_4A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrudeiiedgkeekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomheptehnughrvgifucflvghffhgvrhihuceorghnughrvgifsegr
 jhdrihgurdgruheqnecukfhppedvtddvrdekuddrudekrdeftdenucfrrghrrghmpehmrg
 hilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruhenucevlhhushhtvghrufhiiigv
 pedu
X-ME-Proxy: <xmx:r17fXWuRVh5OBvRBCln-ZUM64hG8ECoLKNz8yNruvNRkesJjMO4PAw>
 <xmx:r17fXfbL3CUBX4GIrEgdfe4Sw0PFriQy1aT_3tmiwtY5aaA9B16K4Q>
 <xmx:r17fXWWSAN3imU6NXhFUh6M8Ei7iXLuEJsvuaOEgy5S8v998XsXfNw>
 <xmx:r17fXVq5HbS7887GKfFiPwnROYwlT5JjZmXxT7R75M5ZLBds6BsNXQ>
Received: from mistburn.au.ibm.com (bh02i525f01.au.ibm.com [202.81.18.30])
 by mail.messagingengine.com (Postfix) with ESMTPA id 634E08005B;
 Thu, 28 Nov 2019 00:44:13 -0500 (EST)
From: Andrew Jeffery <andrew@aj.id.au>
To: qemu-arm@nongnu.org
Subject: [PATCH 4/4] ast2600: Configure CNTFRQ at 1125MHz
Date: Thu, 28 Nov 2019 16:15:27 +1030
Message-Id: <20191128054527.25450-5-andrew@aj.id.au>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191128054527.25450-1-andrew@aj.id.au>
References: <20191128054527.25450-1-andrew@aj.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 66.111.4.26
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-devel@nongnu.org, peter.maydell@linaro.org, clg@kaod.org,
 joel@jms.id.au
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3sxy6Zg7IJ5c

This matches the configuration set by u-boot on the AST2600.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 hw/arm/aspeed_ast2600.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
index 931887ac681f..5aecc3b3caec 100644
--- a/hw/arm/aspeed_ast2600.c
+++ b/hw/arm/aspeed_ast2600.c
@@ -259,6 +259,9 @@ static void aspeed_soc_ast2600_realize(DeviceState *dev, Error **errp)
         object_property_set_int(OBJECT(&s->cpu[i]), aspeed_calc_affinity(i),
                                 "mp-affinity", &error_abort);
 
+        object_property_set_int(OBJECT(&s->cpu[i]), 1125000000, "cntfrq",
+                                &error_abort);
+
         /*
          * TODO: the secondary CPUs are started and a boot helper
          * is needed when using -kernel
-- 
2.20.1

