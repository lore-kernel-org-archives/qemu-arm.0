Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp2533601lfc;
        Fri, 5 Jun 2020 08:05:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxsH6QoKmmRT6hi5RTQrFhBLUva+3DZUCZsAaMCnt9Hah3iEYvlaOcLivvSB9uqeECuFbur
X-Received: by 2002:a25:b94b:: with SMTP id s11mr16237215ybm.247.1591369500034;
        Fri, 05 Jun 2020 08:05:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591369500; cv=none;
        d=google.com; s=arc-20160816;
        b=VI3GVKS3/uNgAnERgh9aUi14OScF1QzUJIEWgAef5XeI3ex/HjG9Jh8dYqP9PdcxyS
         cBoVCGocaPf8Hdlc1O1NrC2T6Svtj80BYEFqWWqJ79VKJkT57VOH0sVqWKRrErtYdER6
         dtGzl1p65VGRbnA7a5bUkypd5Qm+/gKQE3YaGpFHk+IzfWLwJW5hmz2k9QRe3y4EX+dI
         gWHIb/s6N+vnaDPO/4jJu0lsV3hrNAeW9OGb9hOyImcJ7O0M/Nk8nKzYO3zEkyksLpyd
         zhU1P2z9NtkDeY9BBaoev8HRcu6i1el89b0WIn8eWC5r1qEmSPQu5AwHxIUWSPv8NBIP
         vtsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=AzhrAmxId462PdyhY2syxA6JuMnzZ6hiX4wRnJCQSQw=;
        b=nbuWh14gwtQ0pJOSXsDC72TYnvWbfLXIOCUYfAUnJURUcrUH0XawiyGqJ9l9UDoj8+
         O6BmZ/tjXk6KvIbW/+tR5Jjb52WyO12hvYFy64tQh/kFXNVCVXPs07rAyO6Cr6R8ko0I
         apsejI7YkMSDFdwxhjchlRydx6Gj1ZnJSUvpX/2PqLEPKMWrH+lQtlH396xWveLRu8ua
         4hjQYaTKKBeYHI8x2rBGfTP0nK/cannDllFIprrKjRKYhaKkIGk/c5tKRn9LEXCpAxIg
         ql805TipUJgARkVBC37oXl7G57JyN+Xq22v8ILjfsWLzNTLL51CVgPy6C9NEqWAP0dSk
         bAhQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=cbEJngtW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l187si6994019ybc.192.2020.06.05.08.04.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 05 Jun 2020 08:05:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=cbEJngtW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:60214 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jhDtz-0007v8-C4
	for alex.bennee@linaro.org; Fri, 05 Jun 2020 11:04:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jhDlu-0003yR-DZ
 for qemu-arm@nongnu.org; Fri, 05 Jun 2020 10:56:38 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:38824
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jhDlp-0007UX-Ux
 for qemu-arm@nongnu.org; Fri, 05 Jun 2020 10:56:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591368993;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AzhrAmxId462PdyhY2syxA6JuMnzZ6hiX4wRnJCQSQw=;
 b=cbEJngtWy5udNjYxXv82u68TSgjEP5hAhLXjsx6nKmi3ngfQEfopZb+MXCbnMjje3moNdI
 hHRqGw+wbFgHxauIP7ImIVrr5FlMQMTwCb8dgWOlObCbYUVhnWmAc3SatpjWVHOFeOI/37
 SVqJX8SxJcQVlRKkSRIU2aixu6IULS0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-68-hBtmRqtEMyi_skwdecp0BQ-1; Fri, 05 Jun 2020 10:56:31 -0400
X-MC-Unique: hBtmRqtEMyi_skwdecp0BQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CB5EE19200C1;
 Fri,  5 Jun 2020 14:56:29 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-121.ams2.redhat.com
 [10.36.112.121])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0F79060C1D;
 Fri,  5 Jun 2020 14:56:29 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id D62C51138465; Fri,  5 Jun 2020 16:56:25 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 14/16] arm/aspeed: Drop aspeed_board_init_flashes() parameter
 @errp
Date: Fri,  5 Jun 2020 16:56:23 +0200
Message-Id: <20200605145625.2920920-15-armbru@redhat.com>
In-Reply-To: <20200605145625.2920920-1-armbru@redhat.com>
References: <20200605145625.2920920-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=armbru@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/05 03:27:26
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: kwolf@redhat.com, Peter Maydell <peter.maydell@linaro.org>,
 berrange@redhat.com, ehabkost@redhat.com, qemu-block@nongnu.org,
 Andrew Jeffery <andrew@aj.id.au>, mreitz@redhat.com, qemu-arm@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, pbonzini@redhat.com,
 jsnow@redhat.com, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 09OT+4a2xTFj

We always pass &error_abort.  Drop the parameter, use &error_abort
directly.

Cc: Cédric Le Goater <clg@kaod.org>
Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: Andrew Jeffery <andrew@aj.id.au>
Cc: Joel Stanley <joel@jms.id.au>
Cc: qemu-arm@nongnu.org
Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 hw/arm/aspeed.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index 5ffaf86b86..4ce6ca0ef5 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -215,8 +215,8 @@ static void write_boot_rom(DriveInfo *dinfo, hwaddr addr, size_t rom_size,
     g_free(storage);
 }
 
-static void aspeed_board_init_flashes(AspeedSMCState *s, const char *flashtype,
-                                      Error **errp)
+static void aspeed_board_init_flashes(AspeedSMCState *s,
+                                      const char *flashtype)
 {
     int i ;
 
@@ -227,8 +227,8 @@ static void aspeed_board_init_flashes(AspeedSMCState *s, const char *flashtype,
 
         fl->flash = qdev_new(flashtype);
         if (dinfo) {
-            qdev_prop_set_drive_err(fl->flash, "drive",
-                                    blk_by_legacy_dinfo(dinfo), errp);
+            qdev_prop_set_drive(fl->flash, "drive",
+                                blk_by_legacy_dinfo(dinfo));
         }
         qdev_realize_and_unref(fl->flash, BUS(s->spi), &error_fatal);
 
@@ -314,8 +314,8 @@ static void aspeed_machine_init(MachineState *machine)
                           "max_ram", max_ram_size  - ram_size);
     memory_region_add_subregion(&bmc->ram_container, ram_size, &bmc->max_ram);
 
-    aspeed_board_init_flashes(&bmc->soc.fmc, amc->fmc_model, &error_abort);
-    aspeed_board_init_flashes(&bmc->soc.spi[0], amc->spi_model, &error_abort);
+    aspeed_board_init_flashes(&bmc->soc.fmc, amc->fmc_model);
+    aspeed_board_init_flashes(&bmc->soc.spi[0], amc->spi_model);
 
     /* Install first FMC flash content as a boot rom. */
     if (drive0) {
-- 
2.26.2

