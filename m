Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp3770554lfm;
        Tue, 30 Jun 2020 02:13:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwT8WZYSiP3sMcn0iD47dmlPrsmoTlDwDgD3k/9JrVbzPVRZbiLHPziFlMUVr0P/bNimVmo
X-Received: by 2002:a25:2d24:: with SMTP id t36mr32933953ybt.426.1593508435064;
        Tue, 30 Jun 2020 02:13:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593508435; cv=none;
        d=google.com; s=arc-20160816;
        b=FF/EPzQ/C14O4FnZQaebmRrLMq0ItlVPikPCZY/9cxGXlK2gHGQHTzazTdQzrd/dpj
         hNAC7qgwAcPPQpdJcmhqEeX0oOKElvRwR1vZBjbFoWcGH29m8oOo0eYYy7QqADkDhw/q
         3e4pNFVX42lvWU8K9ofK5LY/YYAxTJhxDWNYnoCSOKLK8XtnujQJf3hoOc3+sMORU1nY
         vW1HQ7cbRGsrksWY6KCVYFUb30wCvVHxvDcOe7rkBvA6pDe6S6oo7tHmiUdnLqoRgHv/
         F5asqGPKJewHKsgOJar1fXvI9ocPLPClsDkzC/yNZJvvQiePrbvROXLWA8lD2Am/qKG7
         GNVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=53fidIty5gELKAcDAWZemEXmoEjTJUOu2oihlQHa+rM=;
        b=N0qsu7DfT8Zki9oiobxjf1rJaH/RJ3Yo8V43mKjvz8BSpQD4wATPlZ74PhXc5WQfej
         Yck6CNrZIDlblrQP4OI+Z95Ci3ETPEsk7VxxGuV5jMAxMuQxaNKOvFLMvJbhM4avFa45
         pCWtx7BOzVOewyVKvik1HvngmYnWnDozeJwPoYshyQgwm4iagUFwnGQC6hayAChfjQDd
         wylOo3O/l/A+vVlrVPU4cJmJtVI0vCL9dJxkbd4yoqlHnVMWhb244lHz1XHwxMaepJeV
         v79l+/5qCKpLYfH1fIvv87dA+by/GsNkqtf7XBO5c86XQ4okeMZvfEFMSeLfzPWiGfO2
         DK+Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=TrAX0RNM;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 64si2177143ybt.471.2020.06.30.02.13.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 30 Jun 2020 02:13:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=TrAX0RNM;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:36112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jqCKw-00059v-EG
	for alex.bennee@linaro.org; Tue, 30 Jun 2020 05:13:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jqCBe-0002wM-En
 for qemu-devel@nongnu.org; Tue, 30 Jun 2020 05:04:19 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:39341
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jqCBQ-0002yE-2l
 for qemu-devel@nongnu.org; Tue, 30 Jun 2020 05:04:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593507843;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=53fidIty5gELKAcDAWZemEXmoEjTJUOu2oihlQHa+rM=;
 b=TrAX0RNMHzS2EgOoysd+QcYpPY6AC0U3+OgkCUEaAoRIUh2yah3Rh2K1lR9PPmU3ELEHdC
 /k3yfyewzG2X8OqSnnagkTwOzhawiyJIwUci/M6BnC75tInbTOHVbsytLwPBOvJY7KkAOz
 gL134cJsLfNW6PJmYQPTXVscz3fOHb0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-320-e8yK4GfEP-6-TBPKs0IPtQ-1; Tue, 30 Jun 2020 05:03:59 -0400
X-MC-Unique: e8yK4GfEP-6-TBPKs0IPtQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5C20E18A0724;
 Tue, 30 Jun 2020 09:03:58 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-121.ams2.redhat.com
 [10.36.112.121])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2B44D1A912;
 Tue, 30 Jun 2020 09:03:58 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 3245A1138483; Tue, 30 Jun 2020 11:03:52 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 23/26] aspeed: Fix realize error API violation
Date: Tue, 30 Jun 2020 11:03:48 +0200
Message-Id: <20200630090351.1247703-24-armbru@redhat.com>
In-Reply-To: <20200630090351.1247703-1-armbru@redhat.com>
References: <20200630090351.1247703-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/30 01:11:03
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: u0i750BxP+Vk

The Error ** argument must be NULL, &error_abort, &error_fatal, or a
pointer to a variable containing NULL.  Passing an argument of the
latter kind twice without clearing it in between is wrong: if the
first call sets an error, it no longer points to NULL for the second
call.

aspeed_soc_ast2600_realize() and aspeed_soc_realize() are wrong that
way: they pass &err to object_property_set_int() and
object_property_set_bool() without checking it, and then to
sysbus_realize().  Harmless, because the former can't actually fail
here.

Fix by passing &error_abort instead.

Cc: "Cédric Le Goater" <clg@kaod.org>
Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: Andrew Jeffery <andrew@aj.id.au>
Cc: Joel Stanley <joel@jms.id.au>
Cc: qemu-arm@nongnu.org
Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 hw/arm/aspeed_ast2600.c | 5 +++--
 hw/arm/aspeed_soc.c     | 5 +++--
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
index 4efac02e2b..59a7a1370b 100644
--- a/hw/arm/aspeed_ast2600.c
+++ b/hw/arm/aspeed_ast2600.c
@@ -383,7 +383,8 @@ static void aspeed_soc_ast2600_realize(DeviceState *dev, Error **errp)
     for (i = 0; i < sc->spis_num; i++) {
         object_property_set_link(OBJECT(&s->spi[i]), OBJECT(s->dram_mr),
                                  "dram", &error_abort);
-        object_property_set_int(OBJECT(&s->spi[i]), 1, "num-cs", &err);
+        object_property_set_int(OBJECT(&s->spi[i]), 1, "num-cs",
+                                &error_abort);
         sysbus_realize(SYS_BUS_DEVICE(&s->spi[i]), &err);
         if (err) {
             error_propagate(errp, err);
@@ -434,7 +435,7 @@ static void aspeed_soc_ast2600_realize(DeviceState *dev, Error **errp)
     /* Net */
     for (i = 0; i < sc->macs_num; i++) {
         object_property_set_bool(OBJECT(&s->ftgmac100[i]), true, "aspeed",
-                                 &err);
+                                 &error_abort);
         sysbus_realize(SYS_BUS_DEVICE(&s->ftgmac100[i]), &err);
         if (err) {
             error_propagate(errp, err);
diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
index 03b91bade6..311458aa76 100644
--- a/hw/arm/aspeed_soc.c
+++ b/hw/arm/aspeed_soc.c
@@ -333,7 +333,8 @@ static void aspeed_soc_realize(DeviceState *dev, Error **errp)
 
     /* SPI */
     for (i = 0; i < sc->spis_num; i++) {
-        object_property_set_int(OBJECT(&s->spi[i]), 1, "num-cs", &err);
+        object_property_set_int(OBJECT(&s->spi[i]), 1, "num-cs",
+                                &error_abort);
         sysbus_realize(SYS_BUS_DEVICE(&s->spi[i]), &err);
         if (err) {
             error_propagate(errp, err);
@@ -384,7 +385,7 @@ static void aspeed_soc_realize(DeviceState *dev, Error **errp)
     /* Net */
     for (i = 0; i < sc->macs_num; i++) {
         object_property_set_bool(OBJECT(&s->ftgmac100[i]), true, "aspeed",
-                                 &err);
+                                 &error_abort);
         sysbus_realize(SYS_BUS_DEVICE(&s->ftgmac100[i]), &err);
         if (err) {
             error_propagate(errp, err);
-- 
2.26.2

