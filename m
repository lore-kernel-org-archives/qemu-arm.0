Received: by 2002:a19:8c50:0:0:0:0:0 with SMTP id i16csp219529lfj;
        Wed, 15 Dec 2021 06:47:15 -0800 (PST)
X-Google-Smtp-Source: ABdhPJya1E0oGC8kC+NRnMd7weM+3dUVI9TJldvLUZN2nDTrYNZW61IAc3JUryxxT9VCzoI14rt7
X-Received: by 2002:a05:6638:210c:: with SMTP id n12mr5493314jaj.418.1639579635468;
        Wed, 15 Dec 2021 06:47:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1639579635; cv=none;
        d=google.com; s=arc-20160816;
        b=QGAoQ5VvrY6fVvFFRmBrwjS3y+Hq1Ate8WXmJy+4QiCFUd9srWBg0QtCY8DIz8xlX3
         QJHE2w3YURClrF68+VxLwRx1cWpTYgT/b8nIMNAImWHTWcDZdETHzk66TX9KixR2d5sx
         1PKyNkizvLzI9Oa0YZiG6vCcOgXPkW9J//W9enCs3yReEUMGkixCeCl9N7qQTudF6VSU
         mt+4TIMTLUgeuOdedu3VK2v5FKq2CgErwaKYRsQQ5ReR7rQl5jfCsTAlIGOAGIBavXPQ
         YAXqD5AFcJEqBEl5GdhKcayGBFIRMxyc0GtTXzss1Gs1PB8ffpxVFTNhXRLE8CS1iYqe
         Gtbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=mRSLaWC+Oup2rvxqHx/8wD94GwAom7TQtKrfJwTZHz4=;
        b=wX+6LyDlOSSuOMDXgbhOk8oxqz9QCQYVKCTssc6Pd6FswF8BNVCJTpphXKDlLO8243
         +xrjvRlbymthroMYmEajIOMh4MrxmOqKH2DONkz/Ryo5XV88mg+hiouJat3shZ/nsU+4
         Tv21phD+oW2k7GoD9MNvIVN65+GtdTd/vUThEoQehTVWBZXdYEh3sxNzMa2g3of11p24
         huLwtv3YPt6MYPyLs7CTZ0xgw9Hvgc3QS5f/kHnHji1jEPiQ9lix0rnqKUnTlZNrqHQw
         tNpHgIU/eGkMmzcLeC5FcEyi8qoLlSg9CX5kWUcXyMuI5yqH/XsjuHRnH3Khgt0AiusH
         Tb7g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=eSaBYnAg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h3si827895jav.170.2021.12.15.06.47.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 15 Dec 2021 06:47:15 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=eSaBYnAg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:50990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mxVYo-0001AX-RJ
	for alex.bennee@linaro.org; Wed, 15 Dec 2021 09:47:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mxUrk-0000zc-Pu
 for qemu-arm@nongnu.org; Wed, 15 Dec 2021 09:02:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54328)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mxUrZ-0001T6-K3
 for qemu-arm@nongnu.org; Wed, 15 Dec 2021 09:02:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639576953;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mRSLaWC+Oup2rvxqHx/8wD94GwAom7TQtKrfJwTZHz4=;
 b=eSaBYnAg5CvT5n+ptnTgf6RU2Y3rAcGonKc0KnwUFNsTJ68JtMYmaqgfoQc85TMCyqOphJ
 WSaQNxXT4Po90AEBg/ZKC2dWaPJkkplImlWCNTjmqEkn05g/ZC91vBTc0AQuT3IvuRGlEV
 W7jNfe4DmIbv6pSjIL2dSZ27vuGxzf8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-448-pK63H0XXNJiNicusmiBp8A-1; Wed, 15 Dec 2021 09:02:27 -0500
X-MC-Unique: pK63H0XXNJiNicusmiBp8A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 41E4580574C;
 Wed, 15 Dec 2021 14:02:26 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-2.ams2.redhat.com [10.36.112.2])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D4AED5E48C;
 Wed, 15 Dec 2021 14:02:25 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 7233F11380A9; Wed, 15 Dec 2021 15:02:22 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 12/13] hw/arm/aspeed: Replace drive_get_next() by drive_get()
Date: Wed, 15 Dec 2021 15:02:21 +0100
Message-Id: <20211215140222.769652-13-armbru@redhat.com>
In-Reply-To: <20211215140222.769652-1-armbru@redhat.com>
References: <20211215140222.769652-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 richard.henderson@linaro.org, qemu-arm@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: WRAS6iW619p/

drive_get_next() is basically a bad idea.  It returns the "next" block
backend of a certain interface type.  "Next" means bus=0,unit=N, where
subsequent calls count N up from zero, per interface type.

This lets you define unit numbers implicitly by execution order.  If the
order changes, or new calls appear "in the middle", unit numbers change.
ABI break.  Hard to spot in review.

The aspeed machines connects backends with drive_get_next() in several
counting loops, one of them in a helper function, and a conditional.
Change it to use drive_get() directly.  This makes the unit numbers
explicit in the code.

Cc: "Cédric Le Goater" <clg@kaod.org>
Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: Andrew Jeffery <andrew@aj.id.au>
Cc: Joel Stanley <joel@jms.id.au>
Cc: qemu-arm@nongnu.org
Signed-off-by: Markus Armbruster <armbru@redhat.com>
Message-Id: <20211117163409.3587705-13-armbru@redhat.com>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
---
 hw/arm/aspeed.c | 21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index a77f46b3ad..cf20ae0db5 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -284,12 +284,13 @@ static void write_boot_rom(DriveInfo *dinfo, hwaddr addr, size_t rom_size,
 }
 
 static void aspeed_board_init_flashes(AspeedSMCState *s,
-                                      const char *flashtype)
+                                      const char *flashtype,
+                                      int unit0)
 {
     int i ;
 
     for (i = 0; i < s->num_cs; ++i) {
-        DriveInfo *dinfo = drive_get_next(IF_MTD);
+        DriveInfo *dinfo = drive_get(IF_MTD, 0, unit0 + i);
         qemu_irq cs_line;
         DeviceState *dev;
 
@@ -382,10 +383,12 @@ static void aspeed_machine_init(MachineState *machine)
                           "max_ram", max_ram_size  - machine->ram_size);
     memory_region_add_subregion(&bmc->ram_container, machine->ram_size, &bmc->max_ram);
 
-    aspeed_board_init_flashes(&bmc->soc.fmc, bmc->fmc_model ?
-                              bmc->fmc_model : amc->fmc_model);
-    aspeed_board_init_flashes(&bmc->soc.spi[0], bmc->spi_model ?
-                              bmc->spi_model : amc->spi_model);
+    aspeed_board_init_flashes(&bmc->soc.fmc,
+                              bmc->fmc_model ? bmc->fmc_model : amc->fmc_model,
+                              0);
+    aspeed_board_init_flashes(&bmc->soc.spi[0],
+                              bmc->spi_model ? bmc->spi_model : amc->spi_model,
+                              bmc->soc.fmc.num_cs);
 
     /* Install first FMC flash content as a boot rom. */
     if (drive0) {
@@ -435,11 +438,13 @@ static void aspeed_machine_init(MachineState *machine)
     }
 
     for (i = 0; i < bmc->soc.sdhci.num_slots; i++) {
-        sdhci_attach_drive(&bmc->soc.sdhci.slots[i], drive_get_next(IF_SD));
+        sdhci_attach_drive(&bmc->soc.sdhci.slots[i],
+                           drive_get(IF_SD, 0, i));
     }
 
     if (bmc->soc.emmc.num_slots) {
-        sdhci_attach_drive(&bmc->soc.emmc.slots[0], drive_get_next(IF_SD));
+        sdhci_attach_drive(&bmc->soc.emmc.slots[0],
+                           drive_get(IF_SD, 0, bmc->soc.sdhci.num_slots));
     }
 
     arm_load_kernel(ARM_CPU(first_cpu), machine, &aspeed_board_binfo);
-- 
2.31.1

