Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp3144355lfg;
        Sun, 28 Feb 2021 17:07:44 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzoFQEu3FnOa2oyXz6+bFJXckhMTx/h2rjaBuWbSZ7jnGn0OjMwQtQnxkxK6YEFOGYDSai4
X-Received: by 2002:a67:c787:: with SMTP id t7mr7273969vsk.48.1614560863992;
        Sun, 28 Feb 2021 17:07:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614560863; cv=none;
        d=google.com; s=arc-20160816;
        b=S3MAoakFUhLjVVj786WsOMoIhCv3HioKlZrf0LxM6Uus8EleoJNFhThdA0qpv8aBAJ
         DfWBhbRZoRPEjw/jpFNSWFFeLmEF0nOIXGfgsi5d8e6YAOrGUEJdkZ946ib0VMoTrkW5
         EekPHd4nsxW/b9PRCAPH4XY7nuoxf+jQd+soqJabPcWX5fSc12HjljI9v7uMcoZ1IIrf
         lGTdWHUDSObOFFEkf1eRQzgZn7N1G9G7hwio7qNJxjwbhnpvKGnl+Cz1S5Fqqx8BcInb
         1/ykMU+BjJ3RGl9l7+fKt3lgrcnEu/dkipoDr0r95TWur+1VBNYRhLdbym4VmFKFQ8cm
         NKMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature:dkim-signature;
        bh=vQM2m20CPhZZ2uwDmgCbR86DApctoswo2QcAvJu7x+o=;
        b=CWC4u2LRqjp9JQckN6f7IHmb//c7/JkF7BmxVfntYygv/HVj3BJGxPhnmPLLFM5Pb/
         TyvcSkDl+CpSsGfAxBHHzY1WcAd7JuB5pEHT+H9+9Ww6Il/2tYtcoa6ClXQnLoKZuWYj
         DPwN5aA2jN1khLY4yPhX9oQX7G969silVo8VF1FXSVn9WSOqCAwiOZ61r4fyAhNK1BO5
         3LWVvezFSg1YaGYHuC+POCW2XvT/pxYJHetZrwWkEttqMCYw3pcKKZzIUj7bewSMlmtX
         e3v0qG5v6eT+wPsNehpfTfx6BtUff/AwjGijwrLx2klARhtEoizqRfyQZbXD6SBaiI6j
         hAsg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@aj.id.au header.s=fm2 header.b=QBPluBm6;
       dkim=fail header.i=@messagingengine.com header.s=fm2 header.b=cs9gn4BS;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n19si2602114vso.411.2021.02.28.17.07.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 28 Feb 2021 17:07:43 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@aj.id.au header.s=fm2 header.b=QBPluBm6;
       dkim=fail header.i=@messagingengine.com header.s=fm2 header.b=cs9gn4BS;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:52694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lGX2F-0000VR-8D
	for alex.bennee@linaro.org; Sun, 28 Feb 2021 20:07:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:32968)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@aj.id.au>)
 id 1lGX1A-0000T7-OA; Sun, 28 Feb 2021 20:06:36 -0500
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:54119)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@aj.id.au>)
 id 1lGX18-0001iy-Nn; Sun, 28 Feb 2021 20:06:36 -0500
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id CD6D95C008E;
 Sun, 28 Feb 2021 20:06:31 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Sun, 28 Feb 2021 20:06:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=vQM2m20CPhZZ2
 uwDmgCbR86DApctoswo2QcAvJu7x+o=; b=QBPluBm6JKvlxhteuQq1C5YdjMt4l
 Vxw5UHZXZNEkboOx6nQx5aqYxsTTEaUd3yu4xAKmqhJhDQlVQ0T+1lZWprsYrhWv
 B0321LaF4lEAxxMBJ/bU5T2wRATLyc/xE+wO7irVnfp4kIuPwll0CFINE+7GLfRl
 08+7EfUz3ezjVWTiV6AhMoXp06RL5VRp7390r4me1w7SVhUUHIYDwe/woFg78As2
 FmomJ5FJiKt98YFFYAkKCTM8wQCFMHq//BGFVlKAlW4XzuQaFiIpUgnIpnZAMKCR
 VGOPKs+7c+6IBWYFWSxlEnWXfKiHj+1MkIIBL3ICjMe/lrL0gOyxxbcSg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=vQM2m20CPhZZ2uwDmgCbR86DApctoswo2QcAvJu7x+o=; b=cs9gn4BS
 1VzA04lVlGkWzbECdvHYHPNFsrc1aiaqdS5iMTargUUPPh50c+1n6sAN2ZsKVPFw
 8GuO1NZ9GaMNh7OOq8BXkE/lYITfXxs2Ph3P9Jvurb7Drgzz6vQKVkaPoNO/tvXQ
 Ton+IozMTPiMJcjahVAseirCQ0m3FhQMLQckIHb+8jpv8vdisvh3WhV+be+HxgK7
 7zy2uvSWH8H7n6lLuwEdKuTS49P8VgcRAVhSCCDIvmswS1tE+coBJpJu5m+eggcf
 Foh7Q391qYTKOYubF8NMSlxpxBfbdqv6IlAfa9rtGvWwU0LagSimmMJWIp89tFxT
 f0m/b5dqZB4WiQ==
X-ME-Sender: <xms:Fz48YCA4CIRo3dKUBpueXsqf01ONRpc5LorVk6sIKCp93p3CZY4WPQ>
 <xme:Fz48YMjBYl9VqIIUH9IrOqOdlrd4R0ETKJjwWUu7GE-Y3qTopau25dRoKBNos7xDF
 KBTZZWfUwRB0TRz9w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrleejgdefvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtkeertd
 ertddtnecuhfhrohhmpeetnhgurhgvficulfgvfhhfvghrhicuoegrnhgurhgvfiesrghj
 rdhiugdrrghuqeenucggtffrrghtthgvrhhnpeejgfdvveehteekveeggeellefgleette
 ejffelffdvudduveeiffegteelvefhteenucfkphepudegrddvrdeluddrfeejnecuvehl
 uhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghnughrvgifse
 grjhdrihgurdgruh
X-ME-Proxy: <xmx:Fz48YFmK5mKMGqPy-ccIBoisAVwbAmFZmx2LBiT8bQXIdmUkX25HqA>
 <xmx:Fz48YAxKZDli-3khlpeGKoTHpwt_HQnexs2i0-A6t5Dt6tC1eDEmiw>
 <xmx:Fz48YHQTjnHSeR-Gv4jcLYYAV1nKLqTFiHSjcOyfRBbQuofXuJQTvQ>
 <xmx:Fz48YIJdk0QwdoVk6ArBSl1sc-HiIZBPhPIHKB9FD_ieOmxs66G-KQ>
Received: from localhost.localdomain
 (ppp14-2-91-37.adl-apt-pir-bras31.tpg.internode.on.net [14.2.91.37])
 by mail.messagingengine.com (Postfix) with ESMTPA id 8B1D5240057;
 Sun, 28 Feb 2021 20:06:28 -0500 (EST)
From: Andrew Jeffery <andrew@aj.id.au>
To: qemu-arm@nongnu.org
Subject: [PATCH v2 2/5] hw/arm: ast2600: Set AST2600_MAX_IRQ to value from
 datasheet
Date: Mon,  1 Mar 2021 11:36:07 +1030
Message-Id: <20210301010610.355702-3-andrew@aj.id.au>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210301010610.355702-1-andrew@aj.id.au>
References: <20210301010610.355702-1-andrew@aj.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.26; envelope-from=andrew@aj.id.au;
 helo=out2-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: peter.maydell@linaro.org, ryan_chen@aspeedtech.com, minyard@acm.org,
 qemu-devel@nongnu.org, f4bug@amsat.org, clg@kaod.org, joel@jms.id.au
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: dtCwY1btLu9J

The datasheet says we have 197 IRQs allocated, and we need more than 128
to describe IRQs from LPC devices. Raise the value now to allow
modelling of the LPC devices.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 hw/arm/aspeed_ast2600.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
index bc0eeb058b24..22fcb5b0edbe 100644
--- a/hw/arm/aspeed_ast2600.c
+++ b/hw/arm/aspeed_ast2600.c
@@ -65,7 +65,7 @@ static const hwaddr aspeed_soc_ast2600_memmap[] = {
 
 #define ASPEED_A7MPCORE_ADDR 0x40460000
 
-#define AST2600_MAX_IRQ 128
+#define AST2600_MAX_IRQ 197
 
 /* Shared Peripheral Interrupt values below are offset by -32 from datasheet */
 static const int aspeed_soc_ast2600_irqmap[] = {
-- 
2.27.0

