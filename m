Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp443304wrp;
        Wed, 4 Sep 2019 02:02:37 -0700 (PDT)
X-Google-Smtp-Source: APXvYqw0ZjXWB0uIFfSYaWkFfwe4MfaSve1pm9QjACdC0ufhNnH9tBtJnHcqB4kWmEOZX5ejj8wZ
X-Received: by 2002:a37:916:: with SMTP id 22mr20225417qkj.45.1567587757719;
        Wed, 04 Sep 2019 02:02:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1567587757; cv=none;
        d=google.com; s=arc-20160816;
        b=YIDGfGZHf3b20TmRyMEUi6URn3xuQod+vhuFpS0dZn1fjY4Eb0MfrYUuPIHnMxz9kM
         VCPNxKc4Mz56z4jLckbvulMCBL+I0Ka65UKwQvz0ETsVo+3MHYL0PXJlvrrYKEZujHHY
         MMY/3Pg6/ntNczzgPKQyYoVtcebtkL5vt8DRzjwMWdlneAdAV/SizL8rc0g8e6d3qyJR
         OsKwXqszBr6Ke1/eTvk26D1gw4PN25aQOmfwk8KMu2LoOA5Lf8Ce6qKy5wv5FP0vc+7Y
         /W6VZ0mmiq3nVAr9w5U10uOrb/qieqaa/R20B10mULkMQ2pbKJmmzctGFQOnWJ4sHD5b
         wjQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:references
         :in-reply-to:message-id:date:to:from;
        bh=d+Y28knmJAqtHdG2lLlZJCXNKp7pRY9ulmhT4Mwhfoc=;
        b=jJ2lDNetVGrnJD2OQaAvSank3s8/ogRGJJkEMAKHjYpQph94bZeY2r/TLF9WE2Outx
         ucDpzl0JFmex6dwz9a0tS4dqTyLFuuTvhcx6T3T3vqUq76FGdYMxY5vVuTsPsh0uWJLW
         oSuuXynqdCh+8Vch2+XRlmHQWEQP9SLDVxKdOAtJ/pqxSK/M2AcxOzQXO6IwXowhRlbo
         Spx47OsWzjSKhOX4RAzLeZ5Xswr7bkKHqGf8ql+pe8Td56FiRJRw0+wlAJ5aZ+2gFEXA
         J1fVa8H0lvtjVG3/yjjQsO+mSY57RzPlP/3Hjf9YIX6lykJspRHvxIIULenPCssAZRZ8
         fl/Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e12si3994271qvh.4.2019.09.04.02.02.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 04 Sep 2019 02:02:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:54758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i5RBU-0003Kr-0f
	for alex.bennee@linaro.org; Wed, 04 Sep 2019 05:02:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38594)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1i5R74-0007M7-EU
 for qemu-arm@nongnu.org; Wed, 04 Sep 2019 04:58:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1i5R73-0007EU-7N
 for qemu-arm@nongnu.org; Wed, 04 Sep 2019 04:58:02 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:2259 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1i5R72-0007Dh-SF; Wed, 04 Sep 2019 04:58:01 -0400
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 00B234839B1CCFF82788;
 Wed,  4 Sep 2019 16:57:59 +0800 (CST)
Received: from S00345302A-PC.china.huawei.com (10.202.227.237) by
 DGGEMS411-HUB.china.huawei.com (10.3.19.211) with Microsoft SMTP Server id
 14.3.439.0; Wed, 4 Sep 2019 16:57:50 +0800
From: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <eric.auger@redhat.com>,
 <imammedo@redhat.com>
Date: Wed, 4 Sep 2019 09:56:25 +0100
Message-ID: <20190904085629.13872-8-shameerali.kolothum.thodi@huawei.com>
X-Mailer: git-send-email 2.12.0.windows.1
In-Reply-To: <20190904085629.13872-1-shameerali.kolothum.thodi@huawei.com>
References: <20190904085629.13872-1-shameerali.kolothum.thodi@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.202.227.237]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 45.249.212.191
Subject: [Qemu-arm] [PATCH-for-4.2 v10 07/11] hw/arm: Factor out powerdown
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
 linuxarm@huawei.com, xuwei5@hisilicon.com, shannon.zhaosl@gmail.com,
 sebastien.boeuf@intel.com, lersek@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: xb7DK35EMLEe

This is in preparation of using GED device for
system_powerdown event. Make the powerdown notifier
registration independent of create_gpio() fn.

Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
---
 hw/arm/virt.c         | 12 ++++--------
 include/hw/arm/virt.h |  1 +
 2 files changed, 5 insertions(+), 8 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 95accc28f1..89ee37d7de 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -791,10 +791,6 @@ static void virt_powerdown_req(Notifier *n, void *opaque)
     qemu_set_irq(qdev_get_gpio_in(gpio_key_dev, 0), 1);
 }
 
-static Notifier virt_system_powerdown_notifier = {
-    .notify = virt_powerdown_req
-};
-
 static void create_gpio(const VirtMachineState *vms, qemu_irq *pic)
 {
     char *nodename;
@@ -835,10 +831,6 @@ static void create_gpio(const VirtMachineState *vms, qemu_irq *pic)
                           KEY_POWER);
     qemu_fdt_setprop_cells(vms->fdt, "/gpio-keys/poweroff",
                            "gpios", phandle, 3, 0);
-
-    /* connect powerdown request */
-    qemu_register_powerdown_notifier(&virt_system_powerdown_notifier);
-
     g_free(nodename);
 }
 
@@ -1730,6 +1722,10 @@ static void machvirt_init(MachineState *machine)
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


