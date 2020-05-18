Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp2705802lfb;
        Sun, 17 May 2020 22:10:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxuob4k9l2zU2J4WEU+lCBz0fHrhSsUGPceAwq5B1p16aSRzJv2CZrg+/jyn7cbZpg/ylVy
X-Received: by 2002:ac8:4d5b:: with SMTP id x27mr14947946qtv.195.1589778605860;
        Sun, 17 May 2020 22:10:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1589778605; cv=none;
        d=google.com; s=arc-20160816;
        b=JtNDgBYnrVdmHH7Me8ho31i/DIHm85PALQd+oWnodP2XDVIkGXLJuF/X0izgW9E7cE
         1+RxX7PWmBSf7cFo67UBG+JjKMcg370J/jHRR33dT7OO/10+1sVBPe7paslqFgf2brzx
         9CcY8eMdNSixGTpOC8dAb9NkLTKUkYMHuf8hGKx0N+kQNptdyEFaH/0rsDO2hlr6SKpB
         3fUrXnoneVQeomvOHAOEQOrfrMUh3fEdwiyO8dryEhQfB+oO5pA0P+leowEfK157Opvq
         8giVhjWl0pgpzHgksKKS/liG2jKBRiluo/mPT/1zR+5bV3xhZN1VCOLk5hNevS06J14j
         x7aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=OAi9EUCPLhJvfOSGj2kGGrtspMXz0+eDeEMBqbWPO+k=;
        b=kMBNbIsSK/q1znZ+T1VtKKz6rdm/i6KYA7VB2aRY2Nrq1CyKk57C+p0TQp7AzXqJ6r
         OneoMFFEzmA4pZYSry/lllQrqiTafJOWmuf5VOBld/OOfFfmNW8NEm+gJVsb0S9GYt2R
         h+i5eYuY82lT3r8T/FAxBdu/DdCQaFgIsDQvO91nenENzN3XLPpzEF13jzF9MOB6WWns
         TYxAud9wISk4wHim5mwvws3tlFd4hCQIZBkRdtSRvP9oVioSA5eD0SXJ0jl9VMe4gbnC
         J0lCdkym2BcOcYoPY3b74MjBeeDFYUW2xdLUybyKDVczZqLZEMbrfF0DoHP5dQ13lbZG
         fTSw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=KJYf5mbJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b25si5115182qtr.269.2020.05.17.22.10.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 17 May 2020 22:10:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=KJYf5mbJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:34346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jaY2P-0003OH-0b
	for alex.bennee@linaro.org; Mon, 18 May 2020 01:10:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jaXwy-0000QK-JU
 for qemu-arm@nongnu.org; Mon, 18 May 2020 01:04:28 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:54313
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jaXwx-0004Pe-QB
 for qemu-arm@nongnu.org; Mon, 18 May 2020 01:04:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589778267;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OAi9EUCPLhJvfOSGj2kGGrtspMXz0+eDeEMBqbWPO+k=;
 b=KJYf5mbJqG/voQ/hzyyXtILh6jrGPVMOpyXAF1IA0UMQ6C9PZwAEgxOrF0fD56RVrtDe1r
 BeLnkIuQp7QvrnsTtQ80Z/FWgkIVgXXjGNJDA6l7oZ/HuW7cIpdb54FtoudzthRYMIablI
 a7Ph7ZYR4V48ou7LtVQNtcwX+6Ry/JM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-212-oqoSJTA2NSqhwhsZv4yYsA-1; Mon, 18 May 2020 01:04:13 -0400
X-MC-Unique: oqoSJTA2NSqhwhsZv4yYsA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7FC79EC1A2;
 Mon, 18 May 2020 05:04:11 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-32.ams2.redhat.com
 [10.36.112.32])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 333796298C;
 Mon, 18 May 2020 05:04:11 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 2515911358C1; Mon, 18 May 2020 07:04:08 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 05/24] aspeed: Don't create unwanted "cortex-a7-arm-cpu"
 devices
Date: Mon, 18 May 2020 07:03:49 +0200
Message-Id: <20200518050408.4579-6-armbru@redhat.com>
In-Reply-To: <20200518050408.4579-1-armbru@redhat.com>
References: <20200518050408.4579-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=armbru@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/17 22:51:00
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Peter Maydell <peter.maydell@linaro.org>, berrange@redhat.com,
 ehabkost@redhat.com, Andrew Jeffery <andrew@aj.id.au>, qemu-arm@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, pbonzini@redhat.com,
 Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: dvWXquEKG9dp

The number of CPUs is controlled by property "num-cpus".
aspeed_soc_ast2600_init() creates the maximum supported number.
aspeed_soc_ast2600_realize() realizes only the wanted number.  Works,
although it leaves unrealized devices hanging around in the QOM
composition tree.  Affects machines ast2600-evb and tacoma-bmc.

Make the init functions create only the wanted ones.  Visible in "info
qom-tree"; here's the change for ast2600-evb:

     /machine (ast2600-evb-machine)
       [...]
       /soc (ast2600-a1)
         [...]
         /cpu[0] (cortex-a7-arm-cpu)
           /unnamed-gpio-in[0] (irq)
           /unnamed-gpio-in[1] (irq)
           /unnamed-gpio-in[2] (irq)
           /unnamed-gpio-in[3] (irq)
    -    /cpu[1] (cortex-a7-arm-cpu)
    -      /unnamed-gpio-in[0] (irq)
    -      /unnamed-gpio-in[1] (irq)
    -      /unnamed-gpio-in[2] (irq)
    -      /unnamed-gpio-in[3] (irq)
         /ehci[0] (platform-ehci-usb)

Cc: "Cédric Le Goater" <clg@kaod.org>
Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: Andrew Jeffery <andrew@aj.id.au>
Cc: Joel Stanley <joel@jms.id.au>
Cc: qemu-arm@nongnu.org
Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 hw/arm/aspeed_ast2600.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
index 0a6a77dd54..6ffa587a7f 100644
--- a/hw/arm/aspeed_ast2600.c
+++ b/hw/arm/aspeed_ast2600.c
@@ -287,6 +287,9 @@ static void aspeed_soc_ast2600_realize(DeviceState *dev, Error **errp)
             return;
         }
     }
+    for (; i < sc->num_cpus; i++) {
+        object_unparent(OBJECT(&s->cpu[i]));
+    }
 
     /* A7MPCORE */
     object_property_set_int(OBJECT(&s->a7mpcore), s->num_cpus, "num-cpu",
-- 
2.21.1

