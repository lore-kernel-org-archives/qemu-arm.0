Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1836033lfm;
        Thu, 2 Jul 2020 13:49:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwO4liuEt8Lifpn9+ZwO+8A1QPDLqK0UbICokcLdDWP4WFy6LmCsqBBJ4A4bW5Npif96+ie
X-Received: by 2002:a25:73d7:: with SMTP id o206mr46324194ybc.99.1593722972312;
        Thu, 02 Jul 2020 13:49:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593722972; cv=none;
        d=google.com; s=arc-20160816;
        b=RVk1ZabQ8ARYIsGm6ie05NdWDi5UUsUeb4FA9NWmyX2xORnI57gHDtZejFjNaQvikf
         OItPOJS2f5oTQhzi6w4yTkk9wZw7mFe4Hj7vauxxa56Tan4ZGT4XzN+XpLup3mM/nGh0
         cux6mfJJNKHyWIehpeVLFKTL2zFKj6E+84mjboGJqs4Em9QaF/iYmYdwPVR2JMMGEbBd
         PM0a4x9XMBxSeQMV5+5b0JITCFjACr8mDPEJkLYTItvpOxlSZir/atwTOwDf5ohKyPMF
         DAen0L7WaFTylBkmMHRn6u7VKGI5TwnU4NTzYh+/l6UllxgaArcLcZVqSeKawp+MPQuU
         UO+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:references:in-reply-to
         :message-id:date:subject:to:from:dkim-signature;
        bh=d/4SzrO51wLCoiHfnRNqtnLD968Kuwi1FHNsO/et+5g=;
        b=bPh1AKDJR7oSrA+MekShvRuQRISpAGfjPbGYIJCEBvCp20qD/L8hLi22HmjG5NVHTV
         GJ1SuEjT2FZIulrVHpvsiqj+69uJDFInXuFqIGdv4gWCyTWtwCnpm86xUrJot5baWVVn
         4vWdwO/SVFPv1/WqoALOzjEW4Im2Cp6qbaT9k98iglu2Is6ashIjPDcc/xqd9RWfUegq
         kRJ/8TQhymrcfXis7sDVzNUZtBg4mz1Okh5flfI7PRBwHqqjtkBgbON/V0CT7FXmxkKo
         p+N30KNf50hFpUTgrWs178mdBfbYafJVFtHYEcUcd9EriiyYuvbHht5BSxYGt2Rok3rz
         i3qg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=ApG6gQjj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v11si9669104ybm.450.2020.07.02.13.49.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 02 Jul 2020 13:49:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=ApG6gQjj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:58214 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jr69D-0004Do-GA
	for alex.bennee@linaro.org; Thu, 02 Jul 2020 16:49:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jr692-0004CF-Ru
 for qemu-arm@nongnu.org; Thu, 02 Jul 2020 16:49:20 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:46808
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jr690-0003X1-1g
 for qemu-arm@nongnu.org; Thu, 02 Jul 2020 16:49:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593722957;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:in-reply-to:in-reply-to:
 references:references; bh=d/4SzrO51wLCoiHfnRNqtnLD968Kuwi1FHNsO/et+5g=;
 b=ApG6gQjj/EKZfgn3m7MmdnanCqhTogtwg1U63FmC/dMZqG0zGDFV14Y3V0oY15UF2gy87k
 hLUEZ7OKuCY6QyVk4dn7zg47LZhpV6syOeutjW8yoYS8WLcqS9Jeok1GaHKmf+ZGzp8O8Z
 y2+cSCiZfj/fpXTyYaAcCQZf/EJmtPY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-291-wwrqCUHTP7Wol-GABUN_bg-1; Thu, 02 Jul 2020 16:49:13 -0400
X-MC-Unique: wwrqCUHTP7Wol-GABUN_bg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5395A800402;
 Thu,  2 Jul 2020 20:49:12 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-62.ams2.redhat.com
 [10.36.112.62])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B33DB5C1D0;
 Thu,  2 Jul 2020 20:49:05 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id C8E83204AE; Thu,  2 Jul 2020 22:48:59 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 01/21] microvm: name qboot binary qboot.rom
Date: Thu,  2 Jul 2020 22:48:39 +0200
Message-Id: <20200702204859.9876-2-kraxel@redhat.com>
In-Reply-To: <20200702204859.9876-1-kraxel@redhat.com>
References: <20200702204859.9876-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Received-SPF: pass client-ip=207.211.31.81; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/02 04:18:28
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
X-TUID: SMQEqEwmQ+T9

qboot isn't a bios and shouldnt be named that way.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/i386/microvm.c                       |   4 ++--
 pc-bios/{bios-microvm.bin => qboot.rom} | Bin
 roms/Makefile                           |   6 +++---
 3 files changed, 5 insertions(+), 5 deletions(-)
 rename pc-bios/{bios-microvm.bin => qboot.rom} (100%)

diff --git a/hw/i386/microvm.c b/hw/i386/microvm.c
index 5e931975a06d..1300c396947b 100644
--- a/hw/i386/microvm.c
+++ b/hw/i386/microvm.c
@@ -47,7 +47,7 @@
 #include "kvm_i386.h"
 #include "hw/xen/start_info.h"
 
-#define MICROVM_BIOS_FILENAME "bios-microvm.bin"
+#define MICROVM_QBOOT_FILENAME "qboot.rom"
 
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
diff --git a/pc-bios/bios-microvm.bin b/pc-bios/qboot.rom
similarity index 100%
rename from pc-bios/bios-microvm.bin
rename to pc-bios/qboot.rom
diff --git a/roms/Makefile b/roms/Makefile
index f9acf39954dc..b185c880541c 100644
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
+	cp qboot/bios.bin ../pc-bios/qboot.rom
 
 clean:
 	rm -rf seabios/.config seabios/out seabios/builds
-- 
2.18.4

