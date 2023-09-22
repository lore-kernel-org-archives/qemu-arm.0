Received: by 2002:a17:906:5293:b0:9ae:5796:d6c1 with SMTP id c19csp1417750ejm;
        Fri, 22 Sep 2023 09:00:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGDqZwVs/ZkI8sGgjrXC2CnctL9ATmv4RJVAFCBWS95l9wHz5kO1KrKFKS9YTMFIJwXWhz1
X-Received: by 2002:a67:ad03:0:b0:452:5798:64bd with SMTP id t3-20020a67ad03000000b00452579864bdmr7950075vsl.35.1695398442012;
        Fri, 22 Sep 2023 09:00:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1695398441; cv=none;
        d=google.com; s=arc-20160816;
        b=Yb0qWcTjY0b/M/iYazIvpmbse896rj3kKxarw2EDj6wq+d1LSVXpiibuHq0JBbEn0Z
         FDCn6Cg7ocvPbP1sJtgyMSJX2AHm/cBWFy0TOnzFp5cgxaDskspMdTyHhN4upzWQS4o5
         Vr4CzHm4pfD0LCx2RxZuv2QN+Hfnjzee27DymhcyUbXW5fX8+6PTXW8TKQ9ul41UjzeT
         /qgnV10P9fwgvZDZ3c6YIXYoRdy1FUSu1bauWF4VSAcw2sj7T5E7toAp+AO/1IqjCmqX
         mXT9YcdeVLYozSZkLfKUJSv+ZacJ+DleU8qeNxCe+7mHqT9S3zFzuaCPkFEmKc5nZa5E
         iXAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=RIosMMXfbYPfhuK2H2W98PZ0pui/wf1LRZVC6X+GMJ0=;
        fh=S2APpbBrpM+VqLE1Vn55XwNx8S+N0ykq53OdZwk4Avo=;
        b=jSuMDX5qSL/ZYSdSdMNuCYEpMUOKDyUJk6xSshcdTh3ysEBeqqlrvDY9fAQhrvo6X3
         t8rTD2LaTLxXV4ODNEgAsp3MoRoUFrzLOxxwxpevGVnEoloLmzoSTjKDyf4ECG+JRF6a
         flGRAhYVD5k+x91E+7EepFei92sqWPbaNo7b7sU5AO2JtwNE5Vz7lVZH4Zk7GPr/7T7V
         Yy13J7VvKgyrAkxXJm+5SQIpKDt6Rw3yMbm+sy5Ny3apNhDeCB26H0WEHyjNbw2ovKpv
         5WVeU7sP7Qs5l9SIDMwLhqL/bXbQ8rse8/nKqdLLPR679AfpOsyEPVXkUMNHxMpuAxYe
         6CHA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h8-20020a9f3f08000000b007a875d2173bsi400186uaj.153.2023.09.22.09.00.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 22 Sep 2023 09:00:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qjiZH-0001Do-Qx; Fri, 22 Sep 2023 11:59:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=/LOp=FG=kaod.org=clg@ozlabs.org>)
 id 1qjiZE-0001Ab-C6; Fri, 22 Sep 2023 11:59:44 -0400
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3]
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=/LOp=FG=kaod.org=clg@ozlabs.org>)
 id 1qjiZC-00063y-QV; Fri, 22 Sep 2023 11:59:44 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4RscR00zZ5z4x3G;
 Sat, 23 Sep 2023 01:59:40 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4RscQy0rdYz4x09;
 Sat, 23 Sep 2023 01:59:37 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH 3/4] aspeed/i3c: Rename variable shadowing a local
Date: Fri, 22 Sep 2023 17:59:23 +0200
Message-ID: <20230922155924.1172019-4-clg@kaod.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230922155924.1172019-1-clg@kaod.org>
References: <20230922155924.1172019-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=SRS0=/LOp=FG=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: WmeLqaWLNjHG

to fix warning :

  ../hw/i3c/aspeed_i3c.c: In function ‘aspeed_i3c_realize’:
  ../hw/i3c/aspeed_i3c.c:1959:17: warning: declaration of ‘dev’ shadows a parameter [-Wshadow=local]
   1959 |         Object *dev = OBJECT(&s->devices[i]);
        |                 ^~~
  ../hw/i3c/aspeed_i3c.c:1942:45: note: shadowed declaration is here
   1942 | static void aspeed_i3c_realize(DeviceState *dev, Error **errp)
        |                                ~~~~~~~~~~~~~^~~

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/misc/aspeed_i3c.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/misc/aspeed_i3c.c b/hw/misc/aspeed_i3c.c
index f54f5da522b3..d1ff61767167 100644
--- a/hw/misc/aspeed_i3c.c
+++ b/hw/misc/aspeed_i3c.c
@@ -296,13 +296,13 @@ static void aspeed_i3c_realize(DeviceState *dev, Error **errp)
     memory_region_add_subregion(&s->iomem_container, 0x0, &s->iomem);
 
     for (i = 0; i < ASPEED_I3C_NR_DEVICES; ++i) {
-        Object *dev = OBJECT(&s->devices[i]);
+        Object *i3c_dev = OBJECT(&s->devices[i]);
 
-        if (!object_property_set_uint(dev, "device-id", i, errp)) {
+        if (!object_property_set_uint(i3c_dev, "device-id", i, errp)) {
             return;
         }
 
-        if (!sysbus_realize(SYS_BUS_DEVICE(dev), errp)) {
+        if (!sysbus_realize(SYS_BUS_DEVICE(i3c_dev), errp)) {
             return;
         }
 
-- 
2.41.0

