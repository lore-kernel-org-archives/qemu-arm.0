Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp417088lfc;
        Thu, 28 May 2020 04:05:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw335DjYfo8zIXl5FylI9p9oVkTU6P7NNMMHnSWKI9FZFiaR4Fp3yZ6IwaFBVgzlZpl0U7d
X-Received: by 2002:a05:620a:54b:: with SMTP id o11mr2260685qko.222.1590663919750;
        Thu, 28 May 2020 04:05:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1590663919; cv=none;
        d=google.com; s=arc-20160816;
        b=g5E6DCn6WDu4N8y9L1NWEE+3yHcQBonXscC0aPU/KAZ85M6yNYfB6UZvWcn/AFcmQJ
         7NmhFhmr7+7yTGdbXDOJ4LGq8MkOy7Kb8WBWjYjdqsKTlUDUmZdXw5ZLj1yFFAwizP9g
         BBFPe0bgVWJYjw904WFL5Z4MQseJAtO4SfBFqCCHANE3T6ypWAdEasiUhqj18zKr+1MI
         vU5J6UK+5xIjx6hns3Rabt9JVxjmg1Y6CYPJZXHMmT1cJAI90LdrUfvueFCma6eeKx18
         p77HazdkZrv6z2WRIgq2h71RPmJy5bwMnHZhK0dU3HZlLrPX16j+K5XpjJzoYq1JPmHH
         2fig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=2E4+O8kSZsRLRCJx59FBHd9L5O/+DjWOjDBKmC0wQ4s=;
        b=rn3owCUwR3tg40zr+wCSCP8t8BmnKcYcXDL8sJTB0rjqwTwWqRHJ9+DkpDdBFr0y9d
         HchbwXDFrwwy6q3iBuEqv4gexIR0dua2lQExSY6QLU/zYbEf4nAQ3cyXUQxmoDXYpeNy
         CtxAWSqptSPn0NguoySdTqSbT8rvAUMJX2R4gqUyE/5BaSagLg2ui8DeMC1yc8Hu/MLK
         odgJsWT3su5gIy7jhwoF1VUbjhzQJAoF2a/Wtha+XzuTGY9uGSEfNfKxDhTdBL2Efpvr
         BpAdztKCmwkByiQ4MXBa0uXzpuxv111sU4Je8xT49dcjTEp5XtSxFYSN6hPaKbTOQwse
         MKxw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=NOjxLW28;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j16si400153qtv.304.2020.05.28.04.05.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 28 May 2020 04:05:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=NOjxLW28;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:55508 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jeGLf-0005h8-3J
	for alex.bennee@linaro.org; Thu, 28 May 2020 07:05:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49746)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jeGLE-0005fm-J3
 for qemu-arm@nongnu.org; Thu, 28 May 2020 07:04:52 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:57606
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jeGLC-0006by-CW
 for qemu-arm@nongnu.org; Thu, 28 May 2020 07:04:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1590663889;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2E4+O8kSZsRLRCJx59FBHd9L5O/+DjWOjDBKmC0wQ4s=;
 b=NOjxLW2828dTwxUWWs1UzomudIQJfPiS0tQjDn1j1zmfj5bu96J7sf1khBCdaSH097K1vF
 w9Kccv+yJVnl7/ejiVXa/am2HNVHHtufMbJgRs1uZe890c6IKI72X0WKkVXNiOMxB9dKaY
 mJ+OFCU3YX+AcrKav15W5vF0bKWcMoU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-434-oUKh0RJsOMic5Oqf_14szA-1; Thu, 28 May 2020 07:04:47 -0400
X-MC-Unique: oUKh0RJsOMic5Oqf_14szA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6B42A1005510;
 Thu, 28 May 2020 11:04:46 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-32.ams2.redhat.com
 [10.36.112.32])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 38E3E5C1B0;
 Thu, 28 May 2020 11:04:46 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id BEEE211385E2; Thu, 28 May 2020 13:04:44 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 03/24] sd/pxa2xx_mmci: Fix to realize "pxa2xx-mmci" device
Date: Thu, 28 May 2020 13:04:23 +0200
Message-Id: <20200528110444.20456-4-armbru@redhat.com>
In-Reply-To: <20200528110444.20456-1-armbru@redhat.com>
References: <20200528110444.20456-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/28 06:31:20
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_PASS=-0.001,
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
 ehabkost@redhat.com, qemu-arm@nongnu.org, pbonzini@redhat.com,
 Andrzej Zaborowski <balrogg@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: wOEryn+Af3Rz

pxa2xx_mmci_init() creates a "pxa2xx-mmci" device, but neglects to
realize it.  Affects machines akita, borzoi, connex, mainstone, spitz,
terrier, tosa, verdex, and z2.

In theory, a device becomes real only on realize.  In practice, the
transition from unreal to real is a fuzzy one.  The work to make a
device real can be spread between realize methods (fine),
instance_init methods (wrong), and board code wiring up the device
(fine as long as it effectively happens on realize).  Depending on
what exactly is done where, a device can work even when we neglect
to realize it.

This one appears to work.  Nevertheless, it's a clear misuse of the
interface.  Even when it works today (more or less by chance), it can
break tomorrow.

Fix by realizing it right away.  Visible in "info qom-tree"; here's
the change for akita:

     /machine (akita-machine)
       [...]
       /unattached (container)
         [...]
    +    /device[5] (pxa2xx-mmci)
    +      /pxa2xx-mmci[0] (qemu:memory-region)
    +      /sd-bus (pxa2xx-mmci-bus)
         [rest of device[*] renumbered...]

Fixes: 7a9468c92517e19037bfe2272f64f5dadaf9db15
Cc: Andrzej Zaborowski <balrogg@gmail.com>
Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org
Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/sd/pxa2xx_mmci.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/sd/pxa2xx_mmci.c b/hw/sd/pxa2xx_mmci.c
index f9c50ddda5..c32df1b8f9 100644
--- a/hw/sd/pxa2xx_mmci.c
+++ b/hw/sd/pxa2xx_mmci.c
@@ -492,6 +492,7 @@ PXA2xxMMCIState *pxa2xx_mmci_init(MemoryRegion *sysmem,
     sysbus_connect_irq(sbd, 0, irq);
     qdev_connect_gpio_out_named(dev, "rx-dma", 0, rx_dma);
     qdev_connect_gpio_out_named(dev, "tx-dma", 0, tx_dma);
+    qdev_init_nofail(dev);
 
     /* Create and plug in the sd card */
     carddev = qdev_create(qdev_get_child_bus(dev, "sd-bus"), TYPE_SD_CARD);
-- 
2.21.3

