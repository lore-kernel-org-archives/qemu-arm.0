Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp3117451lfq;
        Tue, 15 Sep 2020 05:19:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzNbuk9rUgdP3/RLn0zI1xPvbxhJngJ2Ki2v1r1c5U/e6rEnho8lpCl9Kf7It77I8dDPOMG
X-Received: by 2002:a25:7c01:: with SMTP id x1mr26216505ybc.357.1600172351121;
        Tue, 15 Sep 2020 05:19:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1600172351; cv=none;
        d=google.com; s=arc-20160816;
        b=kAoNvsqRIi3HfzfpqPHeOiq/Z9Ym7KEpMRXIjFTkiGuoag1S6J29d5moDUnn4tss8d
         Av4NPIrzZT7SPgMwGuBRM5zBbDUqi5SMw+XNxu3H/W6/MvhhftZIW5d4aHr6qNs28WTW
         J53ZG3mw+XfTd5C9yp4fbbb/QtPgMXH3ocqLrcFGRMRCFxTAsDsul/ZueiHyy5AfirNK
         APldVxFokly2wnkxq/jvRgqdcMbNgfGLtqJNttYv0CeQth1UZYpGdKCI4sAT0NaM+wux
         JKUJqG0mpi0hfvArIE0fPygAm38exxFnMAx5a7POzKmAcP283pE4HAZnFseEHrYILjMx
         dPoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=Ez8X20yMKZ1Cq2GL11ZvFDsENdgPKR1yxt/3fZFNv4A=;
        b=u3voLTQfGEENUqGZfMs3TGfw1sM167LJltUiavtoZnVonrTG20pYxEqVCmrrTiBUSp
         Nmuh6C2CHej6YD7Ag18S1N5GmL8J7qxw9GitYLp2CpDFuovcla32R31c68JjoX/EUnPf
         i3DbyFdqc712P7VJJ2V2tDcxzZ/R0KinEsp6Ha9JepMvpPg+3yqYZJvGHRKLvbs1OwXy
         4SqWveSutW9VoDUWzqWFnH11wzoH3iN8r+oDo2/6BKrxYkjkV062ymXcdPzRCPdTWvEP
         nEKP4YoKD1WErRAXAhs4J2XtVDfaxRZ9Lm8NbzNRAU6SBlTK9Jc9/jlptaRSgj2MrvYD
         PtLQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=D2MRCXAm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n203si3078478ybc.67.2020.09.15.05.19.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 15 Sep 2020 05:19:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=D2MRCXAm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:53230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kI9vS-0005Rl-DV
	for alex.bennee@linaro.org; Tue, 15 Sep 2020 08:19:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kI9nH-0004pH-7U
 for qemu-arm@nongnu.org; Tue, 15 Sep 2020 08:10:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22669)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kI9nB-0007gL-57
 for qemu-arm@nongnu.org; Tue, 15 Sep 2020 08:10:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600171831;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ez8X20yMKZ1Cq2GL11ZvFDsENdgPKR1yxt/3fZFNv4A=;
 b=D2MRCXAmNll6MI0cwBypGRt2csjU8C8bJzGHFPbXVK6/Ic7KJfGqYVlGrRcPxLIH6K/p/Q
 QKlcGOq1FLKLb6TOr29J4fEkWEOd80NuandAmCSGGFDDAprw2StoWKXDSSaVgLHw+Q0RIv
 GDj7frClr9ma2kV742aUjsOQpoBb+gM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-557-7hCm5GiPOii8dTzFI33siA-1; Tue, 15 Sep 2020 08:09:23 -0400
X-MC-Unique: 7hCm5GiPOii8dTzFI33siA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8B977640A0;
 Tue, 15 Sep 2020 12:09:22 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-85.ams2.redhat.com
 [10.36.112.85])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 60A555DE4A;
 Tue, 15 Sep 2020 12:09:10 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 889DF31FC8; Tue, 15 Sep 2020 14:09:09 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 02/21] seabios: add microvm config, update build rules
Date: Tue, 15 Sep 2020 14:08:50 +0200
Message-Id: <20200915120909.20838-3-kraxel@redhat.com>
In-Reply-To: <20200915120909.20838-1-kraxel@redhat.com>
References: <20200915120909.20838-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/15 02:10:32
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.999,
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
X-TUID: 4RYkAYPslGsv

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Reviewed-by: Sergio Lopez <slp@redhat.com>
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

