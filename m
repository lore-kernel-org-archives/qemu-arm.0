Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp3782399lfg;
        Mon, 15 Mar 2021 09:54:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJypsutAatRw+8HMry4LqrLy7zu+5jqVbHR+9pFr+l76diMVdXpnWdVyRLreTFBMaBLetHkQ
X-Received: by 2002:a05:6e02:1d11:: with SMTP id i17mr381213ila.145.1615827271536;
        Mon, 15 Mar 2021 09:54:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1615827271; cv=none;
        d=google.com; s=arc-20160816;
        b=OkH2Cy6QBweuzhNR/phpbWkqaBDLCQdpsJcgIqIXcGvZPnw9XvhoUximpYFNHx8Ro1
         8KOKUQPjFEf37PRbWCteozUQ4j6wvmll2Hn99m2Epgo3e3W34ZecdHljzzJchyYIspOj
         JwF75rQ7jreJhuRMzJBgg5ZYFfdIneYywg30nViZmog+gkqP/1G1uFoBDhK9L8mmiImZ
         Pzra1VmkKZWmbnMRoOeX3o57FGtGXy3O5yLKdn3bjZRBjrjMem4gVmuMjInuHUO0DMx6
         Xp0C/viank6iUfxWxPeko/QNg1xbxRLuhoBa8FA3uHw1eDV2r4sdqjw1ZojAJAgldS8u
         tydA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=dDFLsvyLe8lLl4nZKmWov7o0SG/Q1sJrDdZtdR5zH+8=;
        b=TEIglZRMgCjzv9TnTRA3W2Q/dQouuOZwO8IWvPREw4jFolZKzZirlZYsfu4clLH/nB
         EJq5UERQEsaqUXcp7+dzx7q37nNyYk0ANsPt2/nS3sfvkcZpj9sHol5VxeT7jcKyoa+U
         bg9HaV5tMVUEyR33YMrezWbgm3T/lnpJnmOCHBa5S/f/ZpWeoRcE8AKl+LaEfs97lB8C
         gDLb2B0R7L70rVmNR4XhdaEMWt/zOHTRJuC7MDnzPd/pjPdnj0O2HQYUK3k6MbAKvnyd
         Wopm3iUpjdKnQP4exJ+NZlOLO4amrGJy8uHPTpR7+CKA/W3NhyY+paR1/X66qZqXEa4H
         QHYw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="CP/+WwYe";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r4si11125666ilo.48.2021.03.15.09.54.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 15 Mar 2021 09:54:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="CP/+WwYe";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lLqUA-0001Uk-RX
	for alex.bennee@linaro.org; Mon, 15 Mar 2021 12:54:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37998)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1lLqPd-0007kt-G9
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 12:49:49 -0400
Received: from mail-qv1-xf33.google.com ([2607:f8b0:4864:20::f33]:37734)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1lLqPR-0005Ab-Jb
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 12:49:49 -0400
Received: by mail-qv1-xf33.google.com with SMTP id l15so8090144qvl.4
 for <qemu-devel@nongnu.org>; Mon, 15 Mar 2021 09:49:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dDFLsvyLe8lLl4nZKmWov7o0SG/Q1sJrDdZtdR5zH+8=;
 b=CP/+WwYeQX/X0c668idi6tDF2vgLdyLhUpSiz+w+hlqBjmplziolaaRIwvaCvT89sV
 Cw9zQyMw3p8Y+aS3QcIMfsj12FkQGkjL20sKma62E8mu+zFngSuxcTATaNlKkEiLFflh
 ExXztm4q5Ms51j6Da87WOs8WSajHy1crhzvtuAHM5N8I1yBOR/YZ0jFnaG6My2Km4VwP
 3fMjdtImlBlJFU6ZPxTk4IHodKK+YbXdGZ6+NJCKruguKhZJR4XRhHDR15/fs0wqYgbV
 bEwr0ojS7LF+uU8nrRiaqh+Lw4efPedinAhyexZHOIXSjhwPzzZgEHq15A6q7Qvo6413
 KvUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dDFLsvyLe8lLl4nZKmWov7o0SG/Q1sJrDdZtdR5zH+8=;
 b=cp/dfc1t0IOaaYr9IwUU0xnnKAA8JIrzRg7ACmsTdPtIbGDYn4lBB0ep4iXH5Tb5oP
 0md+y/37DP7u7FMODFsIa+f1zetHoQygaNIXZu2VhNTciF3UNgaIK013waYANw8R9lzh
 jAMfSOH3dW+fo0FRcukdH0xB+HeA/5MMz4wBQonX1PhiwppxCJT3U67EUy+KhvWbNZpY
 VV8lPN+phAxBZ1c6BjTTneoxJVK3ndMOqLtJJDwV+gqf9oO8I1aV7pbYjYzwUXdnKOd2
 ac3ty+y4+tUNpEQA/75IWxHS5/MN+h7tCpRInXb8flqwNPMPZL9LHn482q9VZMS+X5Oo
 QIoQ==
X-Gm-Message-State: AOAM531QECoveOS4ZeSOpeoaO5QbSArCcT8h9l9sfdkmxltMpT2MuH8c
 3psMeFnTc5DNguErvzIpLm5G+g==
X-Received: by 2002:ad4:5d47:: with SMTP id jk7mr5528848qvb.38.1615826973539; 
 Mon, 15 Mar 2021 09:49:33 -0700 (PDT)
Received: from localhost.localdomain
 (bras-base-stsvon1503w-grc-23-174-92-28-187.dsl.bell.ca. [174.92.28.187])
 by smtp.googlemail.com with ESMTPSA id s6sm1824824qke.44.2021.03.15.09.49.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Mar 2021 09:49:33 -0700 (PDT)
From: Shashi Mallela <shashi.mallela@linaro.org>
To: peter.maydell@linaro.org,
	leif@nuviainc.com,
	rad@semihalf.com
Subject: [PATCH 2/2] hw/arm/sbsa-ref: add ITS support in SBSA GIC
Date: Mon, 15 Mar 2021 12:49:31 -0400
Message-Id: <20210315164931.23477-2-shashi.mallela@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210315164931.23477-1-shashi.mallela@linaro.org>
References: <20210315164931.23477-1-shashi.mallela@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f33;
 envelope-from=shashi.mallela@linaro.org; helo=mail-qv1-xf33.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: KOO/n79IJL17

Included creation of ITS as part of SBSA platform GIC
initialization.

Signed-off-by: Shashi Mallela <shashi.mallela@linaro.org>
---
 hw/arm/sbsa-ref.c | 26 +++++++++++++++++++++++---
 1 file changed, 23 insertions(+), 3 deletions(-)

diff --git a/hw/arm/sbsa-ref.c b/hw/arm/sbsa-ref.c
index 88dfb2284c..d05cbcae48 100644
--- a/hw/arm/sbsa-ref.c
+++ b/hw/arm/sbsa-ref.c
@@ -35,7 +35,7 @@
 #include "hw/boards.h"
 #include "hw/ide/internal.h"
 #include "hw/ide/ahci_internal.h"
-#include "hw/intc/arm_gicv3_common.h"
+#include "hw/intc/arm_gicv3_its_common.h"
 #include "hw/loader.h"
 #include "hw/pci-host/gpex.h"
 #include "hw/qdev-properties.h"
@@ -65,6 +65,7 @@ enum {
     SBSA_CPUPERIPHS,
     SBSA_GIC_DIST,
     SBSA_GIC_REDIST,
+    SBSA_GIC_ITS,
     SBSA_SECURE_EC,
     SBSA_GWDT,
     SBSA_GWDT_REFRESH,
@@ -108,6 +109,7 @@ static const MemMapEntry sbsa_ref_memmap[] = {
     [SBSA_CPUPERIPHS] =         { 0x40000000, 0x00040000 },
     [SBSA_GIC_DIST] =           { 0x40060000, 0x00010000 },
     [SBSA_GIC_REDIST] =         { 0x40080000, 0x04000000 },
+    [SBSA_GIC_ITS] =            { 0x44090000, 0x00020000 },
     [SBSA_SECURE_EC] =          { 0x50000000, 0x00001000 },
     [SBSA_GWDT_REFRESH] =       { 0x50010000, 0x00001000 },
     [SBSA_GWDT_CONTROL] =       { 0x50011000, 0x00001000 },
@@ -378,7 +380,20 @@ static void create_secure_ram(SBSAMachineState *sms,
     memory_region_add_subregion(secure_sysmem, base, secram);
 }
 
-static void create_gic(SBSAMachineState *sms)
+static void create_its(SBSAMachineState *sms)
+{
+    DeviceState *dev;
+
+    dev = qdev_new(TYPE_ARM_GICV3_ITS);
+    SysBusDevice *s = SYS_BUS_DEVICE(dev);
+
+    object_property_set_link(OBJECT(dev), "parent-gicv3", OBJECT(sms->gic),
+                             &error_abort);
+    sysbus_realize_and_unref(s, &error_fatal);
+    sysbus_mmio_map(s, 0, sbsa_ref_memmap[SBSA_GIC_ITS].base);
+}
+
+static void create_gic(SBSAMachineState *sms, MemoryRegion *mem)
 {
     unsigned int smp_cpus = MACHINE(sms)->smp.cpus;
     SysBusDevice *gicbusdev;
@@ -405,6 +420,10 @@ static void create_gic(SBSAMachineState *sms)
     qdev_prop_set_uint32(sms->gic, "len-redist-region-count", 1);
     qdev_prop_set_uint32(sms->gic, "redist-region-count[0]", redist0_count);
 
+    object_property_set_link(OBJECT(sms->gic), "sysmem", OBJECT(mem),
+                                 &error_fatal);
+    qdev_prop_set_bit(sms->gic, "has-lpi", true);
+
     gicbusdev = SYS_BUS_DEVICE(sms->gic);
     sysbus_realize_and_unref(gicbusdev, &error_fatal);
     sysbus_mmio_map(gicbusdev, 0, sbsa_ref_memmap[SBSA_GIC_DIST].base);
@@ -451,6 +470,7 @@ static void create_gic(SBSAMachineState *sms)
         sysbus_connect_irq(gicbusdev, i + 3 * smp_cpus,
                            qdev_get_gpio_in(cpudev, ARM_CPU_VFIQ));
     }
+    create_its(sms);
 }
 
 static void create_uart(const SBSAMachineState *sms, int uart,
@@ -763,7 +783,7 @@ static void sbsa_ref_init(MachineState *machine)
 
     create_secure_ram(sms, secure_sysmem);
 
-    create_gic(sms);
+    create_gic(sms, sysmem);
 
     create_uart(sms, SBSA_UART, sysmem, serial_hd(0));
     create_uart(sms, SBSA_SECURE_UART, secure_sysmem, serial_hd(1));
-- 
2.27.0

