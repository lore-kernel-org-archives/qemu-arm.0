Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp913664lfm;
        Tue, 7 Jul 2020 05:59:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzq5SOcswdQGbxZVZewvylTdKHSlXiFQN7GboFe6sKxOV5cwJbhITSHsEe5Em3tZawZOD7I
X-Received: by 2002:a5b:942:: with SMTP id x2mr88019403ybq.273.1594126797926;
        Tue, 07 Jul 2020 05:59:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1594126797; cv=none;
        d=google.com; s=arc-20160816;
        b=kUKNAPH2Em4k5NE9CJwj9ARtzM2k12KITLtAG28W14YUl+gy363x5pQBETOSHiLCpp
         x+O1OwMK2W5K30ftaPPkbP73zcaQXTZMZQPxm8pY1cZJ0BWg7o2XWLzTyjVPcyh7F4HN
         Q0NpvK37MX0ufXNj9OVeVqBh6rA0wZZfQODadfeB/5b8yBLfhhZ5cKImE2dTphjbQfY2
         ftzRdHwaxxAXtA+hmmkh7WN1MX4Ga74ZNNCm2/4OAlpG//V/H9DsMH9v6z2UCs0ofDc2
         hZRoTtY5xSwL/F6oG5uwJfjS+QZIwGWyb6i9StO8NcEsQ0AOzFMGoT4KHWF/Ca2e4TbM
         Xy/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:references:in-reply-to
         :message-id:date:subject:to:from:dkim-signature;
        bh=Wy2GQheDSeuYedKPtPUZiomVVNMUQqvM47ukFGtvX+g=;
        b=T2qAauQMYiPPcRWILFh8qvH0WkaaWTUB1ZkQySIWRuJXEWP1zKg5Ol70meRumPeTxx
         ZWErWOShCI52LhIT8Nc2Cr4t3vwpRh5ZjT4dxqJF9YFT5jaa1qoTNbpbBFPM7jwrsHRI
         h+9n3tQgz3twMCetrEAQLamxXHcTXIeSPoAPKnsYHkVln4SCPmKk8ZPJSm8aj1hLKh4k
         Y2I8ClP4byhJtn2gTLQfrR+IhESayBJb6rubqo4XOtFViHh3E0MT+ZPrx1C4EkX4cUOT
         PgfLvtJ63hHTNzcny+rTlBeuLR+ga9Dv0TL6uS/5kBZ8YtsR6JZBx0wCnXfwKuamdc6o
         RRzQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=QxDLqD9S;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p3si22200926ybl.18.2020.07.07.05.59.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 07 Jul 2020 05:59:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=QxDLqD9S;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:44662 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jsnCW-0007nO-UW
	for alex.bennee@linaro.org; Tue, 07 Jul 2020 08:59:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jsn7A-0007Y6-Hb
 for qemu-devel@nongnu.org; Tue, 07 Jul 2020 08:54:24 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:38089
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jsn78-0004m3-Ny
 for qemu-devel@nongnu.org; Tue, 07 Jul 2020 08:54:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594126461;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:in-reply-to:in-reply-to:
 references:references; bh=Wy2GQheDSeuYedKPtPUZiomVVNMUQqvM47ukFGtvX+g=;
 b=QxDLqD9SUYLvMIT6p4uDps841hUHpU45jwBgMfPhNQXHQV1FV4PZRN+yfxXbdtPpD8rSqX
 XqjVzvqpUHh6OYvgshDE9W8NZHDpC67NpspmfvUjh9c3Yj541o+Qh0p46mHhKwSPLYBB5l
 7D1OUth4Q8XPlzOY6kAIX1JZEMQcHuY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-171-bcEJzuvKMsO4NRzBJU5x2g-1; Tue, 07 Jul 2020 08:54:20 -0400
X-MC-Unique: bcEJzuvKMsO4NRzBJU5x2g-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 811533476D;
 Tue,  7 Jul 2020 12:54:18 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-200.ams2.redhat.com
 [10.36.112.200])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BD17079248;
 Tue,  7 Jul 2020 12:53:57 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 00E9531F14; Tue,  7 Jul 2020 14:53:57 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 02/20] seabios: add microvm config, update build rules
Date: Tue,  7 Jul 2020 14:53:38 +0200
Message-Id: <20200707125356.32450-3-kraxel@redhat.com>
In-Reply-To: <20200707125356.32450-1-kraxel@redhat.com>
References: <20200707125356.32450-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Received-SPF: pass client-ip=207.211.31.120; envelope-from=kraxel@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/07 00:46:09
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Shannon Zhao <shannon.zhaosl@gmail.com>,
 qemu-arm@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: WrMOKORmC2Du

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

