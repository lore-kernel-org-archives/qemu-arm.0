Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp573473lfb;
        Wed, 20 May 2020 06:20:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz65i8X75zrIawW7uXbGn3RxrspuAay46RLqeSpZZkJyBGbowR7P+UFsMo3ACX1B3qfyZHi
X-Received: by 2002:a37:797:: with SMTP id 145mr1435732qkh.8.1589980855953;
        Wed, 20 May 2020 06:20:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1589980855; cv=none;
        d=google.com; s=arc-20160816;
        b=DfVyE9qwFY3ENrr5KqIjWQpvNjBRxCkgl4GnIJdD/V5aqaQUL0VKcb84mYTBtd1oxN
         pIMB4LEHO6XJC2sLwlggf93ZnlmMejaAXZTWAofrwiB6bD32VXV7aAX+tduRmewf667K
         umC2dMaF0TWWFuyEYG319HhYqrZyunEyydDsaqFTB/LrClYvBycebf4DTckZ8NooDbfo
         J/4MwfRt8u3ymFMfIYTf9DcoPU4Qwud+47oItM6mdRwMXJi177UhWxcKOBkTZZ0Ki1Np
         pw25xKBQA/0gtU+27rwiY63SQqiYaEuaSr+rx6lWVa7MSTju01XwvHXY0brptROXROpD
         5Njg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:references:in-reply-to
         :message-id:date:subject:to:from:dkim-signature;
        bh=MzZODsBz007pRLcd54leFfF+Mh0RbKq9+V9Rg9SxbkY=;
        b=cqzkruWl49qw+GU8/q+/YWxZTcgJ4yjUTKFdn6dmWtXU0IEhDp18M3iLVHwtDr14h4
         1gzYV9sLb668EOsa4RatHCEnSi+QwR0mneRsannGoubbFsl4k13Ah5SP4AZkBlIXs7ZW
         1MJuPp/zNNuUoBOy560ZiEAD3SoviTIDXaF7qo2s1f1+RWWEdGTDnAm4fwAhuTaD2/S9
         EMq3prbV44U7vgxDtT2NUnA82TxPCxY+N0mrNJch0BZogST4ZdzJOOll/hl30avpkoKd
         zIfsf+v0Ixb8eKCNV929mxBqlhdfMaHfkwo4b5dm7k/3PwmfrYOmHRGJQYmObxl31VX6
         9Nag==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=KmzGLvI3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x40si1541470qtk.356.2020.05.20.06.20.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 20 May 2020 06:20:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=KmzGLvI3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:55746 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jbOeV-00027W-7S
	for alex.bennee@linaro.org; Wed, 20 May 2020 09:20:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jbOdy-0001eT-T3
 for qemu-arm@nongnu.org; Wed, 20 May 2020 09:20:22 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:33573
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jbOdx-00008a-G5
 for qemu-arm@nongnu.org; Wed, 20 May 2020 09:20:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589980820;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:in-reply-to:in-reply-to:
 references:references; bh=MzZODsBz007pRLcd54leFfF+Mh0RbKq9+V9Rg9SxbkY=;
 b=KmzGLvI3EQ53L+QHD/g+P35qsN+Fg2JtGhdOJbboZ72umEGP22lsxMtixM9nOGjkNOjkSH
 rHydPzofaoOiTCY97gRt7qgKdAtGpOvp+svKZe8HvB+JgcDtBbbuGMUmF8FK2PEjr24XU4
 wLX1K0Fz1x81Y6S1+viQEUakxkDivm8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-54-0xj23SLuOHSRLVNCn_danQ-1; Wed, 20 May 2020 09:20:18 -0400
X-MC-Unique: 0xj23SLuOHSRLVNCn_danQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 872DA8015D1;
 Wed, 20 May 2020 13:20:17 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-113-50.ams2.redhat.com
 [10.36.113.50])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E5BDF6AD0F;
 Wed, 20 May 2020 13:20:09 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id A865E9DAF; Wed, 20 May 2020 15:20:03 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 03/22] [testing] seabios: update config & build rules
Date: Wed, 20 May 2020 15:19:44 +0200
Message-Id: <20200520132003.9492-4-kraxel@redhat.com>
In-Reply-To: <20200520132003.9492-1-kraxel@redhat.com>
References: <20200520132003.9492-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Received-SPF: pass client-ip=205.139.110.61; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/20 02:22:41
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Shannon Zhao <shannon.zhaosl@gmail.com>,
 qemu-arm@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 17WptY8ugBhM

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 roms/Makefile               |  5 ++++-
 roms/config.seabios-128k    |  3 +++
 roms/config.seabios-microvm | 26 ++++++++++++++++++++++++++
 3 files changed, 33 insertions(+), 1 deletion(-)
 create mode 100644 roms/config.seabios-microvm

diff --git a/roms/Makefile b/roms/Makefile
index d6d4948bfc31..f7cdad027374 100644
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
 
diff --git a/roms/config.seabios-128k b/roms/config.seabios-128k
index c43912bf9de4..d18c802c46e9 100644
--- a/roms/config.seabios-128k
+++ b/roms/config.seabios-128k
@@ -11,8 +11,11 @@ CONFIG_USB_UAS=n
 CONFIG_SDCARD=n
 CONFIG_TCGBIOS=n
 CONFIG_MPT_SCSI=n
+CONFIG_ESP_SCSI=n
+CONFIG_MEGASAS=n
 CONFIG_PVSCSI=n
 CONFIG_NVME=n
 CONFIG_USE_SMM=n
 CONFIG_VGAHOOKS=n
 CONFIG_HOST_BIOS_GEOMETRY=n
+CONFIG_ACPI_PARSE=n
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

