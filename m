Received: by 2002:a17:505:8d87:b0:1be9:327d:8ee3 with SMTP id ri7csp1307494njc;
        Sun, 21 Jul 2024 01:15:39 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW504CLtJMpwogOe7PZ544T0DazLKwUhIFDw9eFLoBIqIX/NL8diVvL8Q55VMEhWduUattuHlH+p9I8sUbsZZvqE2OjfWet
X-Google-Smtp-Source: AGHT+IH48xga456AU6/GztbkLWTDJslweIxIlwDbLtRRZN+NG0hhJ5fuW9Kdct+Uz71J0WwS5ipj
X-Received: by 2002:a05:620a:4249:b0:79e:f8b7:5c73 with SMTP id af79cd13be357-7a1a13a8131mr469756285a.55.1721549739389;
        Sun, 21 Jul 2024 01:15:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721549739; cv=none;
        d=google.com; s=arc-20160816;
        b=LSqKcvJ9Gk7MBEFsQDOlX2D3ZiW5l1ngHCBodDXeCjDTalDwefw8CC8YNaH2mPRZy0
         siqY0+Z7Pxt4HduYw/d+Hs8fCtifD2ri+4G7Z51OY6Te3E5bB6HxzOSCAzeawZ6KJPYa
         K8kTyEveirBQDEwwrUNoHMzUh53PtnOn1+DWFAeJWtmq7HtoUapYj561nPY080gb9Yne
         8XcfxgclRfu/AhfKfyZDyFcL8sWPrP4oyqFaLuNW/MrkEUG7Tdq944M3RXruVp6C5Jdv
         u1qiHmJKr3W7I1zCeWe316NvxH1IatIAQVI0LTss0fKLm1HvCRJbOCsgI4zF3KzvpH94
         VwlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=FyuYIV7mzwdp5ClumAT0/DAmWSZkgSXnequbL6dRpCQ=;
        fh=LlOmBw4GbUlDF52fQ9hCMPVPTJOoo92XRnaOjjrcWE0=;
        b=b+1eoHKGSoPNuexmW3ZLrc3WL/VQKojV5liWudAIP7ooKQVJIMokRfzYKQOuJ8QCtZ
         7p0We33IBl6othc1EwrwJQqDfWmb+PWA12/+VUCFrBaG4yJJt+8tjZTGUDX8fyiMgKiW
         trTL4NSVn4M5oE5zWq4IvUZfddUCrvX1IpSov+JRDs9sOwdGT2yAuLerb+47/MTHX4fs
         IwQ1Rx7HBsZ/Nt4qOJLzTYBiLmDtHKGnXx9ovuN+J6OF2/np6wu4qvdpLUQCGPOxv/pP
         1nB7fkcUPW27Scrsyzbju5oGYgPQ7qoxqa45yOxuXM2b35on2k6R9FITOH4/ksqmfVa9
         MpUg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=EaQHj6qL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7a1990b33d9si537462885a.735.2024.07.21.01.15.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 21 Jul 2024 01:15:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=EaQHj6qL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sVRiV-0001LL-RM; Sun, 21 Jul 2024 04:14:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1sVRiB-0000pL-Fo
 for qemu-arm@nongnu.org; Sun, 21 Jul 2024 04:14:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1sVRi8-0001PJ-Ur
 for qemu-arm@nongnu.org; Sun, 21 Jul 2024 04:14:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1721549668;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FyuYIV7mzwdp5ClumAT0/DAmWSZkgSXnequbL6dRpCQ=;
 b=EaQHj6qLLtszVGaf12FpzkSfz/DguwDsBJL8mkAMTBUULEWBxfJktnGGtSsAIXy0a6jVzh
 vl7C5ld63/FNVTcPWQMhzPg45dSZbBhkiwLLnnFDFrslt5TbmVoUmEjyC3p+GnqidyJsNL
 i/1SkQGzv6wpbOlZ282cbQkuLjfozeI=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-634-70R7KSY5PpSo8VI-qRz5Ag-1; Sun,
 21 Jul 2024 04:14:21 -0400
X-MC-Unique: 70R7KSY5PpSo8VI-qRz5Ag-1
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 5172C19560A3; Sun, 21 Jul 2024 08:14:20 +0000 (UTC)
Received: from corto.redhat.com (unknown [10.39.192.37])
 by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 62B561955D47; Sun, 21 Jul 2024 08:14:18 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 06/15] aspeed: Tune eMMC device properties to reflect HW
 strapping
Date: Sun, 21 Jul 2024 10:13:52 +0200
Message-ID: <20240721081401.425588-7-clg@redhat.com>
In-Reply-To: <20240721081401.425588-1-clg@redhat.com>
References: <20240721081401.425588-1-clg@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
Received-SPF: pass client-ip=170.10.133.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: P+spmIDGoKJu

From: Cédric Le Goater <clg@kaod.org>

When the boot-from-eMMC HW strapping bit is set, use the 'boot-config'
property to set the boot config register to boot from the first boot
area partition of the eMMC device. Also set the boot partition size
of the device.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
Reviewed-by: Andrew Jeffery <andrew@codeconstruct.com.au>
Tested-by: Andrew Jeffery <andrew@codeconstruct.com.au>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Tested-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/aspeed.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index 756deb91efd1..bc4ca1754213 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -327,7 +327,8 @@ void aspeed_board_init_flashes(AspeedSMCState *s, const char *flashtype,
     }
 }
 
-static void sdhci_attach_drive(SDHCIState *sdhci, DriveInfo *dinfo, bool emmc)
+static void sdhci_attach_drive(SDHCIState *sdhci, DriveInfo *dinfo, bool emmc,
+                               bool boot_emmc)
 {
         DeviceState *card;
 
@@ -335,6 +336,11 @@ static void sdhci_attach_drive(SDHCIState *sdhci, DriveInfo *dinfo, bool emmc)
             return;
         }
         card = qdev_new(emmc ? TYPE_EMMC : TYPE_SD_CARD);
+        if (emmc) {
+            qdev_prop_set_uint64(card, "boot-partition-size", 1 * MiB);
+            qdev_prop_set_uint8(card, "boot-config",
+                                boot_emmc ? 0x1 << 3 : 0x0);
+        }
         qdev_prop_set_drive_err(card, "drive", blk_by_legacy_dinfo(dinfo),
                                 &error_fatal);
         qdev_realize_and_unref(card,
@@ -365,6 +371,7 @@ static void aspeed_machine_init(MachineState *machine)
     AspeedSoCClass *sc;
     int i;
     DriveInfo *emmc0 = NULL;
+    bool boot_emmc;
 
     bmc->soc = ASPEED_SOC(object_new(amc->soc_name));
     object_property_add_child(OBJECT(machine), "soc", OBJECT(bmc->soc));
@@ -437,19 +444,21 @@ static void aspeed_machine_init(MachineState *machine)
 
     for (i = 0; i < bmc->soc->sdhci.num_slots; i++) {
         sdhci_attach_drive(&bmc->soc->sdhci.slots[i],
-                           drive_get(IF_SD, 0, i), false);
+                           drive_get(IF_SD, 0, i), false, false);
     }
 
+    boot_emmc = sc->boot_from_emmc(bmc->soc);
+
     if (bmc->soc->emmc.num_slots) {
         emmc0 = drive_get(IF_SD, 0, bmc->soc->sdhci.num_slots);
-        sdhci_attach_drive(&bmc->soc->emmc.slots[0], emmc0, true);
+        sdhci_attach_drive(&bmc->soc->emmc.slots[0], emmc0, true, boot_emmc);
     }
 
     if (!bmc->mmio_exec) {
         DeviceState *dev = ssi_get_cs(bmc->soc->fmc.spi, 0);
         BlockBackend *fmc0 = dev ? m25p80_get_blk(dev) : NULL;
 
-        if (fmc0) {
+        if (fmc0 && !boot_emmc) {
             uint64_t rom_size = memory_region_size(&bmc->soc->spi_boot);
             aspeed_install_boot_rom(bmc, fmc0, rom_size);
         } else if (emmc0) {
-- 
2.45.2

