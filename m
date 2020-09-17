Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp602469lfq;
        Thu, 17 Sep 2020 06:54:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyB283wIumRFrEeDsd6U1M/sFUhRQL7cSlHUJY9zSDs429/QvxO2eMpCiKfHBvGfr/7D5md
X-Received: by 2002:a5b:5ce:: with SMTP id w14mr20579008ybp.83.1600350861265;
        Thu, 17 Sep 2020 06:54:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1600350861; cv=none;
        d=google.com; s=arc-20160816;
        b=ff0CM7Ax0iKtcziTMaj/ElN5ujGYFs0pcl8oyBQW2coR/5iOwuppZXGkX5w/PUneJ6
         nzjwn/vo7OPNGQhmXACtzaaR5L0GrOmTABzgE5d2yyji6iQ3PiN6uyAQGQIgGOA2J9mz
         +IY77bcC+D5PGJYIKkDznYDEP13RPSQAUlTPwaRTSJfd3GvGGpuIbvJqP8wAP6sMDLkR
         VanbQUTp2WNBmpmMjBuxLt07VT0Yo9/mNNdtyk0812284uLZcKDGnvb/hYIjs+S3J9Sq
         +9rcKRYJKK2JY9HyZg5n+70XZ1tg0EMWxuZzokoon3dPr3ixH9WRA+XR/8/onH29uChb
         2usA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=ZLD+Sit25/qmgfx5038iz6MD+ijxOcduhMfIIhwKx9Y=;
        b=wRMGS2ZcdGNgyNHUEvCincNgFdCFQYB2nItO8HgPEiWQPVeQWexAilyL3hkXYRrh3b
         fJSQMqTC8ziHPnK4C//jN4fO+nBeeoIrsOyg+v1dxQQuoK+7UBNHmnTtEirwxMKLMd9L
         9oW9sQ1nDsLhMgHE/YXy+9JWWoOKBFgNotnTEeWHpZtRKJfKq7RXzeZUWNM6glhzJQ+v
         AxAXP8ZkJXhTAxCLAZOlTsNyZh8Mvrwh/2T52mFuIJPOX5BEiTkZwAu197BbhJ2i6llT
         TTVoQ1r1uxHGGHf4nAXcwzqbF6ryQNqeDWyqzbn7unrdvr78AninuSQ6n+7j7ijFLg4R
         OJOQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=PplR3ydt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i202si7051226yba.271.2020.09.17.06.54.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 17 Sep 2020 06:54:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=PplR3ydt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:59364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kIuMe-0000OF-Ha
	for alex.bennee@linaro.org; Thu, 17 Sep 2020 09:54:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kIuM4-0008IU-0C
 for qemu-arm@nongnu.org; Thu, 17 Sep 2020 09:53:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:23680)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kIuLz-00082g-NC
 for qemu-arm@nongnu.org; Thu, 17 Sep 2020 09:53:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600350818;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZLD+Sit25/qmgfx5038iz6MD+ijxOcduhMfIIhwKx9Y=;
 b=PplR3ydt5guHVyTdKoyaelPQ0pCF3HWmRtkoKcO9dIRwytve+li5ABe3xAh2l/Hj/a5Req
 /cHwS4g5ayjAmlSUS/8d7pAueFsa9/A+mWuy0mjGx+hr9cmd1K4JQglZRPEjEGGeDSZbuN
 r4ayi7RtyFA4vwacJgVJqQkrK+embkA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-18-PU9re5w9NLy6BLSD8YvVGQ-1; Thu, 17 Sep 2020 09:53:35 -0400
X-MC-Unique: PU9re5w9NLy6BLSD8YvVGQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7F2CB80732A;
 Thu, 17 Sep 2020 13:53:33 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-85.ams2.redhat.com
 [10.36.112.85])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B12DE5DE51;
 Thu, 17 Sep 2020 13:53:24 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 9F9DF9CBC; Thu, 17 Sep 2020 15:53:23 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 02/21] seabios: add microvm config, update build rules
Date: Thu, 17 Sep 2020 15:53:04 +0200
Message-Id: <20200917135323.18022-3-kraxel@redhat.com>
In-Reply-To: <20200917135323.18022-1-kraxel@redhat.com>
References: <20200917135323.18022-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/16 20:51:18
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.997,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: l3MCI0idPCQH

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Reviewed-by: Sergio Lopez <slp@redhat.com>
Message-id: 20200915120909.20838-3-kraxel@redhat.com
---
 roms/Makefile               |  5 ++++-
 roms/config.seabios-microvm | 26 ++++++++++++++++++++++++++
 2 files changed, 30 insertions(+), 1 deletion(-)
 create mode 100644 roms/config.seabios-microvm

diff --git a/roms/Makefile b/roms/Makefile
index 1395a46695be..1489d47350f2 100644
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
2.27.0

