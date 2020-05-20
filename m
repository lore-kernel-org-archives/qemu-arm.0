Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp573128lfb;
        Wed, 20 May 2020 06:20:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyk2tZwMoG0ae+k5fLIdvOTmS+VHFL51WD8cn3iiKYggW0KuAufY/iJjTBmtAdi3CoUErPD
X-Received: by 2002:ac8:71d5:: with SMTP id i21mr5422290qtp.249.1589980833180;
        Wed, 20 May 2020 06:20:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1589980833; cv=none;
        d=google.com; s=arc-20160816;
        b=owupPFfm74WdvmNMs/6TGa2DZ0eMsKuIejfXGuElpebN1bJ9PT5QguHkXzEcxhuBzU
         HDRXnP8ZuW6paamSVQYSqS3El16lFUpqlAl38p2cvjvOrAtCxt3gxT1g2diVPAS8c2XB
         YunPacJyTPh6r2qxUKZ/E70Gnblqp9GPrGOlOrau/m4zjKL8m65F66FEtQPhnDxiAaeH
         WBOQOACEos67iTBG5BIb0+v3IU/3743AEcKMiNHvxgBKouNykiODrjrfpdA3Jt6mkQic
         eoeuKuUKxQA5JIzrOz/LeAZ557ELt869RVERC8X4pnKP7/x9WGHBex3fxgUhTkdYd8bM
         pyNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:references:in-reply-to
         :message-id:date:subject:to:from:dkim-signature;
        bh=RWN5wmxMnkODqDehtEEUeaEitvVLGrAewLAcbu9aisk=;
        b=lpLeqVinlDHyP+cw21hLWfCN6copbQuaIEay30A2o3KiDvO29kwnyaCMTn8w67iQkq
         XBw8hqiBaNYAO1vPcGGsGyKcgVDUcEw4ooI9Rsk/Sz14XZADK4v1ixC4qEd5FDsbLbII
         l2RRvfq5ATytHubH/vhFZWpxufWcMH3NePX6/yNTS90tQk7JLqkDqSHOFbU3B7XLLpYB
         u2Y3WOey9eEN/afT36x5R48KORRn9DNzpjsaTK7uujFJC+d2g6+7qTx2q0FIgeGR+uFy
         i/jDqPkboPEXEOipAu4TdJaZFWMyMdfEtKpVISpEbJfi1krWc7LStapvsKyXfp4kFjur
         f7gA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=c8ueCYF2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c1si1681464qkm.252.2020.05.20.06.20.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 20 May 2020 06:20:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=c8ueCYF2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:54902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jbOe8-0001fh-9U
	for alex.bennee@linaro.org; Wed, 20 May 2020 09:20:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47604)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jbOdy-0001dz-Nt
 for qemu-arm@nongnu.org; Wed, 20 May 2020 09:20:22 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:38846
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jbOdx-00007v-79
 for qemu-arm@nongnu.org; Wed, 20 May 2020 09:20:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589980819;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:in-reply-to:in-reply-to:
 references:references; bh=RWN5wmxMnkODqDehtEEUeaEitvVLGrAewLAcbu9aisk=;
 b=c8ueCYF2XViB0axlI8s48nx56sQHQxDTw5+/7FEBcas5VchVjPx89Xc+taOlnFq95ZSIT2
 eJwkjMEfrovrFWfQ1Ttn60+fXE3QYIE7dVoQGPKAF1o+g0JYeE7NlWqgaFqrXrXY2fqLQ1
 9dCTJfA5ncsY/srsyys6J9M5OqFSiKY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-440-_4-0MF52MF2ZbOGiRkED8Q-1; Wed, 20 May 2020 09:20:16 -0400
X-MC-Unique: _4-0MF52MF2ZbOGiRkED8Q-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D00F41902EA0;
 Wed, 20 May 2020 13:20:14 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-113-50.ams2.redhat.com
 [10.36.113.50])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E2C705C1BE;
 Wed, 20 May 2020 13:20:04 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 9422C9DAD; Wed, 20 May 2020 15:20:03 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 01/22] microvm: name qboot binary qboot.bin
Date: Wed, 20 May 2020 15:19:42 +0200
Message-Id: <20200520132003.9492-2-kraxel@redhat.com>
In-Reply-To: <20200520132003.9492-1-kraxel@redhat.com>
References: <20200520132003.9492-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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
X-TUID: UiAfS/h7GqKF

qboot isn't a bios and shouldnt be named that way.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/i386/microvm.c                       |   4 ++--
 pc-bios/{bios-microvm.bin => qboot.bin} | Bin
 roms/Makefile                           |   6 +++---
 3 files changed, 5 insertions(+), 5 deletions(-)
 rename pc-bios/{bios-microvm.bin => qboot.bin} (100%)

diff --git a/hw/i386/microvm.c b/hw/i386/microvm.c
index 937db10ae6a5..867d3d652145 100644
--- a/hw/i386/microvm.c
+++ b/hw/i386/microvm.c
@@ -47,7 +47,7 @@
 #include "kvm_i386.h"
 #include "hw/xen/start_info.h"
 
-#define MICROVM_BIOS_FILENAME "bios-microvm.bin"
+#define MICROVM_QBOOT_FILENAME "qboot.bin"
 
 static void microvm_set_rtc(MicrovmMachineState *mms, ISADevice *s)
 {
@@ -158,7 +158,7 @@ static void microvm_devices_init(MicrovmMachineState *mms)
     }
 
     if (bios_name == NULL) {
-        bios_name = MICROVM_BIOS_FILENAME;
+        bios_name = MICROVM_QBOOT_FILENAME;
     }
     x86_bios_rom_init(get_system_memory(), true);
 }
diff --git a/pc-bios/bios-microvm.bin b/pc-bios/qboot.bin
similarity index 100%
rename from pc-bios/bios-microvm.bin
rename to pc-bios/qboot.bin
diff --git a/roms/Makefile b/roms/Makefile
index f9acf39954dc..d6d4948bfc31 100644
--- a/roms/Makefile
+++ b/roms/Makefile
@@ -68,7 +68,7 @@ default help:
 	@echo "  opensbi64-virt     -- update OpenSBI for 64-bit virt machine"
 	@echo "  opensbi32-sifive_u -- update OpenSBI for 32-bit sifive_u machine"
 	@echo "  opensbi64-sifive_u -- update OpenSBI for 64-bit sifive_u machine"
-	@echo "  bios-microvm       -- update bios-microvm.bin (qboot)"
+	@echo "  qboot              -- update qboot"
 	@echo "  clean              -- delete the files generated by the previous" \
 	                              "build targets"
 
@@ -194,9 +194,9 @@ opensbi64-sifive_u:
 		PLATFORM="sifive/fu540"
 	cp opensbi/build/platform/sifive/fu540/firmware/fw_jump.bin ../pc-bios/opensbi-riscv64-sifive_u-fw_jump.bin
 
-bios-microvm:
+qboot:
 	$(MAKE) -C qboot
-	cp qboot/bios.bin ../pc-bios/bios-microvm.bin
+	cp qboot/bios.bin ../pc-bios/qboot.bin
 
 clean:
 	rm -rf seabios/.config seabios/out seabios/builds
-- 
2.18.4

