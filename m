Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp6480358wrp;
        Wed, 18 Sep 2019 06:18:11 -0700 (PDT)
X-Google-Smtp-Source: APXvYqy2WpMRcPdDbY0vPNsUDkUPQZ57GWfIVSOm04MGe/uhKgpQStCTtJtBCB9fkbV++p+FQmCe
X-Received: by 2002:a05:620a:1467:: with SMTP id j7mr3871214qkl.434.1568812691102;
        Wed, 18 Sep 2019 06:18:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1568812691; cv=none;
        d=google.com; s=arc-20160816;
        b=Tarp68W2SuePsP08Fdi3qieqgvfJUPHL6kUD6zXSoGWfMm4fSLObuxrupX94MJCqK3
         9ouC9huPyFmajWclrh52gXodCaES9Zaua0ET3vd5iOcX3bg7a9RvR31mz1yT2ITTdLy9
         ZSIQVCaRe057oV5TE7IYqICKtOhSrTbITCkZ5GuzGKk2uBABwq0uNn49cIG2ItSoldAH
         N8hRFxz6ZDNcT3vzbHdnJWO+Tl6sKFdvZkVWa9BezSs6vvMsWxazrk9S1u//UTdTkrEw
         UKTR9ikycEpEqkuaR867bSYsS7t0122ZoRWC+z/HoyGxSzQExaE8TcCSQKGeByOmmbNW
         6IIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:references
         :in-reply-to:message-id:date:to:from;
        bh=Bw5PURF4xRHGJe+HhTPvWyXy6aeb9/AXe7qpT1iBlw4=;
        b=oaninT9QSaURxGhbXCed8lso/lpuesSEMMdbOSh6rCmQTpos4ukRwElY+yryIkFulL
         ownqk5CPOI1AUaTMgl2HLWr+k/rIsxduPowfBmYQA+5AybTo+6c+h+OOnU/+SHDjWpZe
         gSO7QEysVfTAMIsynKMrGGfBrza1Oj74tkCv/f7VohinVhBVk8BQOVc/rybI50NYtS2c
         G5uM55yh5pAPDsqd7DKyUHbXdYvvlXrBiz1eowpP53MF3j0gwvT3mEXBUbQ5BzjRnGHH
         8Mv4Mfd9qUZxD4f/ZaQJzC6bNjxMTDEWAJUuEbOa2H/KhMgAyMOsrMueVgHBnQLZkS9l
         jedw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i24si4095366qkh.127.2019.09.18.06.18.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 18 Sep 2019 06:18:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:58936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iAZqT-000517-BC
	for alex.bennee@linaro.org; Wed, 18 Sep 2019 09:18:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58743)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1iAZh9-0004Sh-MW
 for qemu-arm@nongnu.org; Wed, 18 Sep 2019 09:08:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1iAZh8-0003Rl-Bp
 for qemu-arm@nongnu.org; Wed, 18 Sep 2019 09:08:31 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:2174 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1iAZh8-0003Ql-0Y; Wed, 18 Sep 2019 09:08:30 -0400
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 090A599A5E7BA1C8636A;
 Wed, 18 Sep 2019 21:08:28 +0800 (CST)
Received: from S00345302A-PC.china.huawei.com (10.202.227.237) by
 DGGEMS409-HUB.china.huawei.com (10.3.19.209) with Microsoft SMTP Server id
 14.3.439.0; Wed, 18 Sep 2019 21:08:16 +0800
From: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <eric.auger@redhat.com>,
 <imammedo@redhat.com>
Date: Wed, 18 Sep 2019 14:06:29 +0100
Message-ID: <20190918130633.4872-8-shameerali.kolothum.thodi@huawei.com>
X-Mailer: git-send-email 2.12.0.windows.1
In-Reply-To: <20190918130633.4872-1-shameerali.kolothum.thodi@huawei.com>
References: <20190918130633.4872-1-shameerali.kolothum.thodi@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.202.227.237]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 45.249.212.190
Subject: [Qemu-arm] [PATCH-for-4.2 v11 07/11] hw/arm: Factor out powerdown
 notifier from GPIO
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
Cc: peter.maydell@linaro.org, sameo@linux.intel.com, ard.biesheuvel@linaro.org,
 mst@redhat.com, linuxarm@huawei.com, xuwei5@hisilicon.com,
 shannon.zhaosl@gmail.com, sebastien.boeuf@intel.com, lersek@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6nKtiwom7Iyu

This is in preparation of using GED device for
system_powerdown event. Make the powerdown notifier
registration independent of create_gpio() fn.

Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
---
 hw/arm/virt.c         | 12 ++++--------
 include/hw/arm/virt.h |  1 +
 2 files changed, 5 insertions(+), 8 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index d221841c42..dbd8c18f36 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -797,10 +797,6 @@ static void virt_powerdown_req(Notifier *n, void *opaque)
     qemu_set_irq(qdev_get_gpio_in(gpio_key_dev, 0), 1);
 }
 
-static Notifier virt_system_powerdown_notifier = {
-    .notify = virt_powerdown_req
-};
-
 static void create_gpio(const VirtMachineState *vms, qemu_irq *pic)
 {
     char *nodename;
@@ -841,10 +837,6 @@ static void create_gpio(const VirtMachineState *vms, qemu_irq *pic)
                           KEY_POWER);
     qemu_fdt_setprop_cells(vms->fdt, "/gpio-keys/poweroff",
                            "gpios", phandle, 3, 0);
-
-    /* connect powerdown request */
-    qemu_register_powerdown_notifier(&virt_system_powerdown_notifier);
-
     g_free(nodename);
 }
 
@@ -1737,6 +1729,10 @@ static void machvirt_init(MachineState *machine)
         vms->acpi_dev = create_acpi_ged(vms, pic);
     }
 
+     /* connect powerdown request */
+     vms->powerdown_notifier.notify = virt_powerdown_req;
+     qemu_register_powerdown_notifier(&vms->powerdown_notifier);
+
     /* Create mmio transports, so the user can create virtio backends
      * (which will be automatically plugged in to the transports). If
      * no backend is created the transport will just sit harmlessly idle.
diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index 577ee49b4b..0b41083e9d 100644
--- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -137,6 +137,7 @@ typedef struct {
     int psci_conduit;
     hwaddr highest_gpa;
     DeviceState *acpi_dev;
+    Notifier powerdown_notifier;
 } VirtMachineState;
 
 #define VIRT_ECAM_ID(high) (high ? VIRT_HIGH_PCIE_ECAM : VIRT_PCIE_ECAM)
-- 
2.17.1


