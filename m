Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1837795lfm;
        Thu, 2 Jul 2020 13:52:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyYAEOmfscb9e8ZGM54cftuGrHJ9eo+yE0SB+AnEBay5uMFzhYwklBchGJ8SbgpedqaUy0q
X-Received: by 2002:a25:1843:: with SMTP id 64mr48085950yby.89.1593723136909;
        Thu, 02 Jul 2020 13:52:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593723136; cv=none;
        d=google.com; s=arc-20160816;
        b=X6v6gHPL+3hmDBtWn6szJ1R/7OPGeFQBeQiOR/iC3NT5KI2+RuLHm5DL2qbVmiNovS
         6wgg6JjeqPI7kQPTE0AJA9MlPVua2T0dikB+uJMlzrG9LstAq6CMF9GRDOaW7RJ4P4pX
         UD0aBEioDtmQbLd+Mo5xsnIWapmSGvkNR4avp55S7S6b96WLhH33LRjcqycft7yFwTOp
         1B3zmJWK2CxQsvuQq2ZU7+8yQCXDNW/1SfodwVyCV6z7/a2JYao9Bvqk4Q0Gt5suoZOh
         wkzJBMDwULdvzvXhB3ZZR0hwEhHJ+tfE+m39NDmV8FDcy1tLCsuFNkvjggxLZz8x/+3u
         ez6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:references:in-reply-to
         :message-id:date:subject:to:from:dkim-signature;
        bh=Wy2GQheDSeuYedKPtPUZiomVVNMUQqvM47ukFGtvX+g=;
        b=n81ZBLF7D3fSmAdW98bjMsoIaZPuRui15EguZet1mCSSd0rM5tJPSleNSP4IZps6Qj
         rkQINE+Xbk7VOothJ4mjcwIKwHSnesnLUxJRYhrTyVbCz3pCJ9zga6a2m/QaP9Jbsb+l
         lGnX2fbHE84m0AEwEIapH24XxqQ5O703mxCu8LvH59e1czLGxhLP9IWREDqDjOxZSNaP
         ipLsX5YJV2N2WxI+vOsKPQi8SutoaeR82ipsSC4VWgntJzEbrU1E5TmR3Ft6zbBFMlJR
         J2KhKpNWHoWN47xJy9ob6qE2E2E3+BbdPokitcZzxAKwGO+SiQpOgrsSNNA+BPMn0yWS
         QCJA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=a7gmJrXS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g4si9583066ybh.219.2020.07.02.13.52.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 02 Jul 2020 13:52:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=a7gmJrXS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:40932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jr6Bs-0000ma-9Z
	for alex.bennee@linaro.org; Thu, 02 Jul 2020 16:52:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54550)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jr694-0004E7-8p
 for qemu-arm@nongnu.org; Thu, 02 Jul 2020 16:49:22 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:57361
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jr691-0003Wp-7C
 for qemu-arm@nongnu.org; Thu, 02 Jul 2020 16:49:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593722955;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:in-reply-to:in-reply-to:
 references:references; bh=Wy2GQheDSeuYedKPtPUZiomVVNMUQqvM47ukFGtvX+g=;
 b=a7gmJrXS9XlgDAFvWEvnMljDrzDROHWDD3PQ34VFuwo87vzG9iCzfZI004hTvLzA5AvgbR
 UF/NoXypXnCUtyJHT/BLqr7ZzB/AazzyXJcYLgZq6Et6li8m9eU+z/R7ef+XNRQCLUCg9M
 v8doGV7cn1Tc7/YED/8Vr2ulFjjc8yM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-316-YZ0pdNNsO3KBqDbmDAFMtw-1; Thu, 02 Jul 2020 16:49:12 -0400
X-MC-Unique: YZ0pdNNsO3KBqDbmDAFMtw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F1183BFC0;
 Thu,  2 Jul 2020 20:49:10 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-62.ams2.redhat.com
 [10.36.112.62])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 21537610B0;
 Thu,  2 Jul 2020 20:49:02 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id D36E231E58; Thu,  2 Jul 2020 22:48:59 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 02/21] seabios: add microvm config, update build rules
Date: Thu,  2 Jul 2020 22:48:40 +0200
Message-Id: <20200702204859.9876-3-kraxel@redhat.com>
In-Reply-To: <20200702204859.9876-1-kraxel@redhat.com>
References: <20200702204859.9876-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Received-SPF: pass client-ip=205.139.110.61; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/02 03:42:59
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Shannon Zhao <shannon.zhaosl@gmail.com>,
 qemu-arm@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Q4CvuyrD93V9

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 roms/Makefile               |  5 ++++-
 roms/config.seabios-microvm | 26 ++++++++++++++++++++++++++
 2 files changed, 30 insertions(+), 1 deletion(-)
 create mode 100644 roms/config.seabios-microvm

diff --git a/roms/Makefile b/roms/Makefile
index b185c880541c..1a9d14674464 100644
--- a/roms/Makefile
+++ b/roms/Makefile
@@ -72,9 +72,12 @@ default help:
 	@echo "  clean              -- delete the files generated by the previous" \
 	                              "build targets"
 
-bios: build-seabios-config-seabios-128k build-seabios-config-seabios-256k
+bios: build-seabios-config-seabios-128k \
+		build-seabios-config-seabios-256k \
+		build-seabios-config-seabios-microvm
 	cp seabios/builds/seabios-128k/bios.bin ../pc-bios/bios.bin
 	cp seabios/builds/seabios-256k/bios.bin ../pc-bios/bios-256k.bin
+	cp seabios/builds/seabios-microvm/bios.bin ../pc-bios/bios-microvm.bin
 
 vgabios seavgabios: $(patsubst %,seavgabios-%,$(vgabios_variants))
 
diff --git a/roms/config.seabios-microvm b/roms/config.seabios-microvm
new file mode 100644
index 000000000000..a253e2edc6ec
--- /dev/null
+++ b/roms/config.seabios-microvm
@@ -0,0 +1,26 @@
+CONFIG_QEMU=y
+CONFIG_QEMU_HARDWARE=y
+CONFIG_PERMIT_UNALIGNED_PCIROM=y
+CONFIG_ROM_SIZE=128
+CONFIG_XEN=n
+CONFIG_BOOTSPLASH=n
+CONFIG_ATA=n
+CONFIG_AHCI=n
+CONFIG_SDCARD=n
+CONFIG_PVSCSI=n
+CONFIG_ESP_SCSI=n
+CONFIG_LSI_SCSI=n
+CONFIG_MEGASAS=n
+CONFIG_MPT_SCSI=n
+CONFIG_FLOPPY=n
+CONFIG_FLASH_FLOPPY=n
+CONFIG_NVME=n
+CONFIG_PS2PORT=n
+CONFIG_USB=n
+CONFIG_LPT=n
+CONFIG_RTC_TIMER=n
+CONFIG_USE_SMM=n
+CONFIG_PMTIMER=n
+CONFIG_TCGBIOS=n
+CONFIG_HARDWARE_IRQ=n
+CONFIG_ACPI_PARSE=y
-- 
2.18.4

