Received: by 10.25.221.202 with SMTP id w71csp507302lfi;
        Tue, 8 Aug 2017 23:32:53 -0700 (PDT)
X-Received: by 10.200.34.173 with SMTP id f42mr9469868qta.150.1502260373514;
        Tue, 08 Aug 2017 23:32:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1502260373; cv=none;
        d=google.com; s=arc-20160816;
        b=xYYVvmSI8pwx7OsU8b3VOOZbLGcCB3UE+Ml+4RXEZClyDXDJSC78KpLZSOuMPBw+i1
         aXDwvcYlmEStdz1y8IxzTL+NX0GbNLOk8EPeFP9qDA+cB/MuAqCo2+VOrkmRxcq3rf4V
         XG4QE/nF9KZBIWlXMrSIr58f+4fST2EXQulKSIUpJoqvteUcQomlkCzemM+6wBFLehZ8
         iHJ1ZdnmRzJFZFxwjFiOJGPSCP8xCw0GWKwMYxjegfsTKBrAEzdSP3yBAjEUTGyKKZAz
         tBpv7bsTZVnCrCisysPF75KJuZLcuRFX2Eerqxb9RdSOxf9joB4HZhMg6hTT4dWdDbVd
         R7AA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:dkim-signature
         :arc-authentication-results;
        bh=uzkJPqWJqx0LJSLGO2T7w8trESySPWwGjTeWE+nE2Eg=;
        b=D2Q6p82DAhIzH8Ann5K+BJWe6PLsKpC1ZdrvI0cJktUwX4jN1EW7IkhCRUdL37T4E+
         HawQHT4mHjq0vHJPlfIePJ/HMhRdCjCTeBDQGAmGhU/DKbWicsRcxDwr8/spaztJz173
         GIfIjriq8qAUyY0a6mT0VGq6HwlWH7D18mQCu/JE77PYvLyFYbQsLmYDfl9xLJS6P+ni
         A0Ay+DKLdHcZ1xhawDsoFCHjDfJvlY3zh7CfhiuDV2SEbzGFVLUnbGh80vSboIzOrkEF
         Vsk1mqL6kea1awID1y4HxwOW3s7C/l8HioGbsc6aCRxCRtnerAoKgdBxlGKYH6wc+seD
         A23A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@aj.id.au header.s=fm1 header.b=Xb6mpwXI;
       dkim=fail header.i=@messagingengine.com header.s=fm1 header.b=o+NmTlux;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c128si2383047qkb.54.2017.08.08.23.32.52
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 08 Aug 2017 23:32:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@aj.id.au header.s=fm1 header.b=Xb6mpwXI;
       dkim=fail header.i=@messagingengine.com header.s=fm1 header.b=o+NmTlux;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:45890 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dfKXz-0008P0-32
	for alex.bennee@linaro.org; Wed, 09 Aug 2017 02:32:51 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37103)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew@aj.id.au>) id 1dfKUX-00066d-LS
	for qemu-arm@nongnu.org; Wed, 09 Aug 2017 02:29:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew@aj.id.au>) id 1dfKUW-00078k-Ke
	for qemu-arm@nongnu.org; Wed, 09 Aug 2017 02:29:17 -0400
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:37551)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <andrew@aj.id.au>)
	id 1dfKUW-00078O-Hi; Wed, 09 Aug 2017 02:29:16 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id 33E8021D94;
	Wed,  9 Aug 2017 02:29:16 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
	by compute4.internal (MEProxy); Wed, 09 Aug 2017 02:29:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
	:date:from:in-reply-to:message-id:references:subject:to
	:x-me-sender:x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=uzkJPq
	WJqx0LJSLGO2T7w8trESySPWwGjTeWE+nE2Eg=; b=Xb6mpwXIPKUtOUan33+fYL
	L/SDOpXbz/zkzMyv5CW17cRox7fvXWCGgw54ZF9BYcwiZmq+VVhp7Y0sK901pUDq
	DjNZfccf0n8N+EyR0rP1QxDd/B+iXd3DKpIbHSOQxWCK5EqtuIhLB9xbmRDE2fzz
	FI+s75/vFu0TH30ruJWXQcR8WKwH3Dl9KnWtxj+WcrS2qm72c1NxB9hm94F1TK2l
	vp6yJVYzyhUEYd+yyBAjtQNKUXhv6/LwO4pRLVrLUJm8vmXPDPcSJSglIqjSy74G
	aAp5QNmwsWC1QXKYhI+iZuG/yJHIryVRYjSeg8YC0F2RKAXe62sOYKX7PAgBGuLA
	==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:date:from:in-reply-to:message-id
	:references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
	:x-sasl-enc; s=fm1; bh=uzkJPqWJqx0LJSLGO2T7w8trESySPWwGjTeWE+nE2
	Eg=; b=o+NmTluxJduFUK2GS50lpjwEg3qbwsvUd2YUCfeBFK49wZjo3kgmY0M6e
	y/zQocURtsJVYiDV/D1TbOiRGAhcQvOi6NXP72dXckEgxHyEsf/F3pSxk31PzLtp
	dJf681C8GrmVj7WqMh4vMOZpTYVpA7WcGWRKXWB1yZxvYuVPdGkL6N28zB2Vwfd4
	cNnfhZfbqH1BoybIphGp/qoGFxZdd4WR5nkqf6vwEUAryeO35hvAvxjp9WtMMERs
	SD0w9Af4f6Z9bDk7CMbzICWJLjYEkhVssCIxmXBeBolYdGyD4hoKicgx2YugzPhu
	+9HQYBPB2Kv9ewIKN3pzGTkxtbUTQ==
X-ME-Sender: <xms:vKuKWXOGSjow1uMPkMzE13VR68sYcDAfDYD-TxboXCNonYNDSAfkFA>
X-Sasl-enc: RVCtiwK1GOosjdI/Fu7vDvXKZ2dhAy+/pq7OHJNhdLpb 1502260155
Received: from keelia.au.ibm.com (unknown [203.0.153.9])
	by mail.messagingengine.com (Postfix) with ESMTPA id 87B997E4EA;
	Wed,  9 Aug 2017 02:29:12 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: qemu-arm@nongnu.org
Date: Wed,  9 Aug 2017 15:58:28 +0930
Message-Id: <20170809062828.3673-4-andrew@aj.id.au>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170809062828.3673-1-andrew@aj.id.au>
References: <20170809062828.3673-1-andrew@aj.id.au>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.111.4.25
Subject: [Qemu-arm] [PATCH for 2.11 v2 2/2] aspeed_soc: Propagate
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
	f4bug@amsat.org, qemu-devel@nongnu.org, joel@jms.id.au, clg@kaod.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: okJ3JslnmYBU

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

