Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp4076995lfg;
        Mon, 1 Mar 2021 17:45:00 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyvCiMV2hHnPXy812+oMNIS8JuLoOdY8bXWfmKThAMoPWp4PeAXQF9cdirceKrvwo72jtDF
X-Received: by 2002:a4a:9bdc:: with SMTP id b28mr15025871ook.48.1614649499280;
        Mon, 01 Mar 2021 17:44:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614649499; cv=none;
        d=google.com; s=arc-20160816;
        b=fCPWLFJ4mC7H/IaDzZ8E3kfV2eb/Oz/1Fnq9sTU348rDoI13Da8ywEbs0sbXLwvQWp
         FEW8P5nnr70YaMDX0lnmNxnLO+bQU6IkZNzWFWVZmxxD/k4fnWGjbGw17GDwOUeohnbL
         TCNsH6ldlLiZdN8SpfHN7FWxavIuinFwzsHdU4g5ZSwMAt029nzlxVhxHuArMLBMm2r/
         uHs3ookOH4BofBplN5Q6BH7WtV6nnwzgCyDjnkZ4vi8dyRqP1vCO7N6RYWDgHjwgyvkS
         vviyN1pX0SMh/tzDTdwJIviftxC1uLrgDMC2rgELNb0CSshUoZWKPLUUwYrmmujRmiIp
         a9Vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature:dkim-signature;
        bh=AjcWu99zYWM3MFP7FCVoSIVRy3dP2O7AvMfoVzpMjzk=;
        b=ZXyOZQeMPVqlwqr9NvySfG2BStB3HGwGBJ82KugwYvI1Qh5K2JpkEPIW2YaMN/NsAD
         V5q+eom4m5tEtCmO7Irc/Gdmhv9fYHUVIf2+bLhPxb6QnK+JIhX6UW+xL6W9Bf+v0fLa
         jGWpmYGPl5I4KXIvpKp0wYEgQujix8Zhav4EOJxciHfePRBv+nuvCZ8s/vMzpzHDWMwq
         QQRv+cPO3GI3B4oEf9C5p/6pgvKNA6iIoy0VW7K9eLoXLSbthRUUlSe1tdI0MY9oQF09
         sH8kk6Ih619O18mVnBvkosgpghyQtEaSHkYMaOAOXimY17PRbORFyN+8gzKUVwMkAOpr
         KuhQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@aj.id.au header.s=fm2 header.b=uyJd9ph0;
       dkim=fail header.i=@messagingengine.com header.s=fm2 header.b=riEPRWoW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a6si16617359oiw.15.2021.03.01.17.44.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 01 Mar 2021 17:44:59 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@aj.id.au header.s=fm2 header.b=uyJd9ph0;
       dkim=fail header.i=@messagingengine.com header.s=fm2 header.b=riEPRWoW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:58464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lGu5p-0002cq-Ls
	for alex.bennee@linaro.org; Mon, 01 Mar 2021 20:44:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39304)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@aj.id.au>)
 id 1lGu4p-0002F5-4z; Mon, 01 Mar 2021 20:43:55 -0500
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:36211)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@aj.id.au>)
 id 1lGu4Y-000222-SY; Mon, 01 Mar 2021 20:43:53 -0500
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id D61C55C0088;
 Mon,  1 Mar 2021 20:43:37 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute7.internal (MEProxy); Mon, 01 Mar 2021 20:43:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-type:content-transfer-encoding; s=fm2; bh=
 AjcWu99zYWM3MFP7FCVoSIVRy3dP2O7AvMfoVzpMjzk=; b=uyJd9ph0vto5JLC5
 Xl736evEsi+0lP/DxHCPdfATYlIKl6rsaclUXZmzJzTqG4BBr+wPu3v7dlzkOJpr
 JWdDxI29yyDREmubySnrxKbKEJ/Sih3e+LR688d3/HfIhoVN8nvIOZ4pl/HzaQN4
 iZGi+2FRb4YYXfOn4Q6RNkVZESO4KY+G0Ii7FfwSP2hTzz7jvv8TgbDt8FZWFNT+
 rQMj4OSeVBwVQU2V07aUEV1mSlB9imS4aXs5hlweseL1M4CWphbaWqbFADoE0pgE
 8QyJzwui/bdmEeOnEN+WMmky7rbUn9x8rFXx5ArSyxIidUYvOhS5M43uUZY8WZLH
 edfuiA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=AjcWu99zYWM3MFP7FCVoSIVRy3dP2O7AvMfoVzpMj
 zk=; b=riEPRWoWwvw6Z20BWxy1au+NH9k0tvjAK4b3Oifd/4TBXgVkzHSZ5eUdI
 dImnUalqXVgN13maSoC3eQN9A41rcuf2LdraTn3H/e78ud3M01K2EiO41I2CUlVT
 V5vC/G8xVglebgFyg7GR90XhIAXZXY0WKN9tZoxu+N1l7ebzpmxYOAfZdjMH3zS6
 IJTiMT90/MGIiquUOuQesrH5lHWjqOS9hVDOGS3DYNKjdb5vttU/uMqjuYgHvlIe
 j0n2iOwSyisBridH4OQB+Ul2M+RfWdbnI/PHL5PamxoYGBAlO9CO7w/IHvUHDxxZ
 UMV2GhmXJPWfdLP9pqa6zF2QUqOag==
X-ME-Sender: <xms:SJg9YCF14RXyJ0zrh2nWYysI_mW6_r0BPaFlXcg4g4QSWa9lmHz7_A>
 <xme:SJg9YM83O1Qepcq65FwidOeYLUDaycr4pdkd5IzPFZ3u_14lEIEzxoQURRx_fDvsy
 vX6kcDPIY6LQW9d7g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrleelgdefjecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfgggtgfesthekre
 dtredtjeenucfhrhhomheptehnughrvgifucflvghffhgvrhihuceorghnughrvgifsegr
 jhdrihgurdgruheqnecuggftrfgrthhtvghrnheptefhvdethedtgffgvefftedvkeelvd
 fhvddtjeeukeevvdekjefgtdeifeelgfegnecukfhppedugedrvddrledurdefjeenucev
 lhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgurhgvfi
 esrghjrdhiugdrrghu
X-ME-Proxy: <xmx:SJg9YMK0ALjCl0egd6yjiern_euHcKbgQhhedMZrumOc87PNIp8arA>
 <xmx:SJg9YPZKCQ5u4pQ3ZnIrK8cAAIxAaURaHOyqfKwrvKBYF-aZBWCObA>
 <xmx:SJg9YGJy4KrKfKbdBdJJdIX9JhzhPRJr5HwzHyV2ULIfXMliL7oMpQ>
 <xmx:SZg9YMAXyMiXoUHVnoaHXp9RhcZ2ALDxFc9iEHFfMNjOjaMAwQA_1Q>
Received: from localhost.localdomain
 (ppp14-2-91-37.adl-apt-pir-bras31.tpg.internode.on.net [14.2.91.37])
 by mail.messagingengine.com (Postfix) with ESMTPA id 9C91B240065;
 Mon,  1 Mar 2021 20:43:33 -0500 (EST)
From: Andrew Jeffery <andrew@aj.id.au>
To: qemu-arm@nongnu.org
Subject: [PATCH v3 2/5] hw/arm: ast2600: Set AST2600_MAX_IRQ to value from
 datasheet
Date: Tue,  2 Mar 2021 12:13:14 +1030
Message-Id: <20210302014317.915120-3-andrew@aj.id.au>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210302014317.915120-1-andrew@aj.id.au>
References: <20210302014317.915120-1-andrew@aj.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.29; envelope-from=andrew@aj.id.au;
 helo=out5-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, ryan_chen@aspeedtech.com, minyard@acm.org,
 qemu-devel@nongnu.org, f4bug@amsat.org, clg@kaod.org, joel@jms.id.au
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6s8jEczQq5UE

The datasheet says we have 197 IRQs allocated, and we need more than 128
to describe IRQs from LPC devices. Raise the value now to allow
modelling of the LPC devices.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
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

