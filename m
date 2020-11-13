Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp1227313lfb;
        Fri, 13 Nov 2020 02:19:00 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyJnmERDqgv6hLTGaby1F8GB1dtlmNrrak0XjybBRfHIAVadx0V0bUPgl+yuOugls52nw8S
X-Received: by 2002:a25:af8c:: with SMTP id g12mr2171701ybh.511.1605262740640;
        Fri, 13 Nov 2020 02:19:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1605262740; cv=none;
        d=google.com; s=arc-20160816;
        b=EdpowKwh+fqrE1okHi32C4t9rfeXrm6me7Zbsz7ZscAJ2Ex4U1461zhmOpsOdCF6PI
         Bky/weDHa5BAg+mT1tP2RqTF1xOhx3FdSvhL+SOXZv/Gd4W4WiFq+BpzxvjbNQy5wlji
         Q044noAgmY2J6Z3Eja7naFePu89GXfzRzWpLkSRWgVn/V2dwwYJhNooRr5eaWkD3c1H8
         UPSWDbKKBYH3jlPS32W0X2mNzH/yv1XxI2Y/6xc2j1q1e+krYAfi5oB3zsD21qcqjU3B
         zrSZMJVv9zVJA0EDcgko6t/B7rWa+qfhz7UzBIpxqSUMH1tdCRLBLI/O1HICMx+o7J04
         RuZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=Zj8uCGw/lLsWY1VaMBcE19NF6ARzqvQTW0RU0974Rno=;
        b=VjYpXgkknsskaBOgu4KFSWMnlf3I2kWGgf0lIjFQSP/56PbJcEcFYkeE3fTArZnOSl
         +am6+ni2J1Cu+jipYcrRG3ZdM/PNEFy2FmWWh9GWBMIcwRx9pgxdb6qN9pE/cIeRQfTP
         otybJLvH5897zz+W37AQSVO38cB0G3ywp9euyG/vKSqKZUIdAnAigf/IJIdOcnP7CW4d
         S9r1qgRcFw3+GeteDQxjY1lJU5/cHxFw2o632PA8TG6TeKFp6vhY+KtMNpLX8aRRvHhM
         J0ddnezhmT4inHbKnwd2eC0C3KqcrtvYrdOVFG5HenPMxurEAhlqk/exvac/19TsBw3q
         sgMw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=W4tTfZEP;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z6si8249141ybf.76.2020.11.13.02.19.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 13 Nov 2020 02:19:00 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=W4tTfZEP;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:53406 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kdWAW-0000tx-1o
	for alex.bennee@linaro.org; Fri, 13 Nov 2020 05:19:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kdW8n-0007kw-2Q
 for qemu-devel@nongnu.org; Fri, 13 Nov 2020 05:17:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37369)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kdW8k-0003oj-Jd
 for qemu-devel@nongnu.org; Fri, 13 Nov 2020 05:17:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605262629;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Zj8uCGw/lLsWY1VaMBcE19NF6ARzqvQTW0RU0974Rno=;
 b=W4tTfZEPb2hOzx9ddNlJmTK4AozvyosaSaKFywI3ST4rz7fbXFBnOtiyOMGuPswop8pfyl
 4QOaNAdx1BHPLJP7lhNstLwtZ1WXtQscJ//guPH3FS+koyxb4YePJga4fiWYNE1uxikrgn
 r3NMs9ApNLdp+WXhSxqrIazEiDHl2Xw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-153-TybmahXNPaGRDHmaM6YJcw-1; Fri, 13 Nov 2020 05:17:07 -0500
X-MC-Unique: TybmahXNPaGRDHmaM6YJcw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 494681882FBB;
 Fri, 13 Nov 2020 10:17:06 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A21AC5577C;
 Fri, 13 Nov 2020 10:17:05 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 002/122] arm: do not use ram_size global
Date: Fri, 13 Nov 2020 05:15:04 -0500
Message-Id: <20201113101704.1438368-2-pbonzini@redhat.com>
In-Reply-To: <20201113101704.1438368-1-pbonzini@redhat.com>
References: <20201113101704.1438368-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/12 08:00:44
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: XbuJHz2mT2/2

Use the machine properties instead.

Cc: qemu-ppc@nongnu.org
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/arm/aspeed.c         | 8 ++++----
 hw/display/pxa2xx_lcd.c | 5 +++--
 target/arm/arm-semi.c   | 3 ++-
 3 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index 0ef3f6b412..cc8ed6ec9c 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -295,7 +295,7 @@ static void aspeed_machine_init(MachineState *machine)
     /*
      * This will error out if isize is not supported by memory controller.
      */
-    object_property_set_uint(OBJECT(&bmc->soc), "ram-size", ram_size,
+    object_property_set_uint(OBJECT(&bmc->soc), "ram-size", machine->ram_size,
                              &error_fatal);
 
     for (i = 0; i < sc->macs_num; i++) {
@@ -332,8 +332,8 @@ static void aspeed_machine_init(MachineState *machine)
     max_ram_size = object_property_get_uint(OBJECT(&bmc->soc), "max-ram-size",
                                             &error_abort);
     memory_region_init_io(&bmc->max_ram, NULL, &max_ram_ops, NULL,
-                          "max_ram", max_ram_size  - ram_size);
-    memory_region_add_subregion(&bmc->ram_container, ram_size, &bmc->max_ram);
+                          "max_ram", max_ram_size  - machine->ram_size);
+    memory_region_add_subregion(&bmc->ram_container, machine->ram_size, &bmc->max_ram);
 
     aspeed_board_init_flashes(&bmc->soc.fmc, bmc->fmc_model ?
                               bmc->fmc_model : amc->fmc_model);
@@ -378,7 +378,7 @@ static void aspeed_machine_init(MachineState *machine)
         aspeed_board_binfo.smp_loader_start = AST_SMP_MBOX_CODE;
     }
 
-    aspeed_board_binfo.ram_size = ram_size;
+    aspeed_board_binfo.ram_size = machine->ram_size;
     aspeed_board_binfo.loader_start = sc->memmap[ASPEED_DEV_SDRAM];
     aspeed_board_binfo.nb_cpus = sc->num_cpus;
 
diff --git a/hw/display/pxa2xx_lcd.c b/hw/display/pxa2xx_lcd.c
index ff90104b80..dfff994962 100644
--- a/hw/display/pxa2xx_lcd.c
+++ b/hw/display/pxa2xx_lcd.c
@@ -17,6 +17,7 @@
 #include "ui/console.h"
 #include "hw/arm/pxa.h"
 #include "ui/pixel_ops.h"
+#include "hw/boards.h"
 /* FIXME: For graphic_rotate. Should probably be done in common code.  */
 #include "sysemu/sysemu.h"
 #include "framebuffer.h"
@@ -305,7 +306,7 @@ static void pxa2xx_descriptor_load(PXA2xxLCDState *s)
             descptr = s->dma_ch[i].descriptor;
 
         if (!((descptr >= PXA2XX_SDRAM_BASE && descptr +
-                 sizeof(desc) <= PXA2XX_SDRAM_BASE + ram_size) ||
+                 sizeof(desc) <= PXA2XX_SDRAM_BASE + current_machine->ram_size) ||
                 (descptr >= PXA2XX_INTERNAL_BASE && descptr + sizeof(desc) <=
                  PXA2XX_INTERNAL_BASE + PXA2XX_INTERNAL_SIZE))) {
             continue;
@@ -850,7 +851,7 @@ static void pxa2xx_update_display(void *opaque)
             }
             fbptr = s->dma_ch[ch].source;
             if (!((fbptr >= PXA2XX_SDRAM_BASE &&
-                     fbptr <= PXA2XX_SDRAM_BASE + ram_size) ||
+                     fbptr <= PXA2XX_SDRAM_BASE + current_machine->ram_size) ||
                     (fbptr >= PXA2XX_INTERNAL_BASE &&
                      fbptr <= PXA2XX_INTERNAL_BASE + PXA2XX_INTERNAL_SIZE))) {
                 pxa2xx_dma_ber_set(s, ch);
diff --git a/target/arm/arm-semi.c b/target/arm/arm-semi.c
index c1df664f7e..8a5cd49df5 100644
--- a/target/arm/arm-semi.c
+++ b/target/arm/arm-semi.c
@@ -36,6 +36,7 @@
 #else
 #include "exec/gdbstub.h"
 #include "qemu/cutils.h"
+#include "hw/boards.h"
 #endif
 
 #define TARGET_SYS_OPEN        0x01
@@ -1044,7 +1045,7 @@ target_ulong do_arm_semihosting(CPUARMState *env)
             retvals[2] = ts->stack_base;
             retvals[3] = 0; /* Stack limit.  */
 #else
-            limit = ram_size;
+            limit = current_machine->ram_size;
             /* TODO: Make this use the limit of the loaded application.  */
             retvals[0] = limit / 2;
             retvals[1] = limit;
-- 
2.26.2

