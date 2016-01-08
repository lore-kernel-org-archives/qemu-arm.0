Received: by 10.25.134.130 with SMTP id i124csp325967lfd;
        Fri, 8 Jan 2016 01:32:33 -0800 (PST)
X-Received: by 10.28.6.213 with SMTP id 204mr21376850wmg.47.1452245553461;
        Fri, 08 Jan 2016 01:32:33 -0800 (PST)
Return-Path: <eric.auger@linaro.org>
Received: from mail-wm0-x22d.google.com (mail-wm0-x22d.google.com. [2a00:1450:400c:c09::22d])
        by mx.google.com with ESMTPS id e129si8609508wma.3.2016.01.08.01.32.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 08 Jan 2016 01:32:33 -0800 (PST)
Received-SPF: pass (google.com: domain of eric.auger@linaro.org designates 2a00:1450:400c:c09::22d as permitted sender) client-ip=2a00:1450:400c:c09::22d;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of eric.auger@linaro.org designates 2a00:1450:400c:c09::22d as permitted sender) smtp.mailfrom=eric.auger@linaro.org;
       dkim=pass header.i=@linaro.org
Received: by mail-wm0-x22d.google.com with SMTP id f206so127785539wmf.0
        for <alex.bennee@linaro.org>; Fri, 08 Jan 2016 01:32:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=Je1k+RDHgiSPVpLlwc1LQWfDWviy+oEEw80sQn5GOfQ=;
        b=PSVostTVTirOUBYAokZsLdb1RQH8EEHQR9FNuZ5XWe33SQggXyt+cY1C3tP1L/UOlq
         tgTTt7/h4fZTafpXT7GOHxdDjnQNZUevolPdMt12j+ybgqBQRdZml6Qr8zYA9xVq74mq
         XxTdSvubCTMgOpN+9ydxVEwxDWN60cdWuijLg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=Je1k+RDHgiSPVpLlwc1LQWfDWviy+oEEw80sQn5GOfQ=;
        b=eTLuMLGSfClj3lIXQQPniNokLaqtZI/iUpIMoAaFEQhvDWX6xTEaAkDNpG011tq79Z
         BOScg1Q0NvNY+yDOX+s5hORgdDtS+7na4oSi39UPtiteZ37qTiJuSvbyyHb708vK3FB1
         bo9VScp+sJxU1eJJSQXV1WlRm6N5KXjlRF0iTaBkwGyXSRA/ZbR8m989eWyGFoGp/BlY
         24L2zMUSpABMBNjSMqDFIwrCKIlwkKaafCBCbVzZuWPDfQlGCL/8uKHUceaDIj/pcxfD
         c08jmMZ/rLIOORxUHt5AbhQF3A9v9AdyLm98rqBIvBUuqqcTZs/PN8fQKT5p7VZSmIjr
         SSMw==
X-Gm-Message-State: ALoCoQkPEskXLc7Myv/2r5Tfa6Ih17wddrCmxdKaxCh9+k1J8pT8Ov05WboXrNT646crY5JuMFUbQCO3MnWJ9zCqhidKMG2mgQ==
X-Received: by 10.194.118.36 with SMTP id kj4mr114169359wjb.88.1452245553236;
        Fri, 08 Jan 2016 01:32:33 -0800 (PST)
Return-Path: <eric.auger@linaro.org>
Received: from new-host-8.home (LMontsouris-657-1-37-90.w80-11.abo.wanadoo.fr. [80.11.198.90])
        by smtp.gmail.com with ESMTPSA id av8sm30226968wjc.13.2016.01.08.01.32.30
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Fri, 08 Jan 2016 01:32:31 -0800 (PST)
From: Eric Auger <eric.auger@linaro.org>
To: eric.auger@st.com,
	eric.auger@linaro.org,
	qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	peter.maydell@linaro.org,
	david@gibson.dropbear.id.au,
	alex.williamson@redhat.com
Cc: alex.bennee@linaro.org,
	thuth@redhat.com,
	crosthwaitepeter@gmail.com,
	patches@linaro.org,
	christoffer.dall@linaro.org,
	pbonzini@redhat.com,
	b.reynal@virtualopensystems.com,
	suravee.suthikulpanit@amd.com,
	thomas.lendacky@amd.com
Subject: [PATCH v4 8/8] hw/arm/sysbus-fdt: remove qemu_fdt_setprop returned value check
Date: Fri,  8 Jan 2016 09:32:05 +0000
Message-Id: <1452245525-3886-9-git-send-email-eric.auger@linaro.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1452245525-3886-1-git-send-email-eric.auger@linaro.org>
References: <1452245525-3886-1-git-send-email-eric.auger@linaro.org>
X-TUID: LjqXjDVikC4U

qemu_fdt_setprop self-asserts in case of error hence no need to check
the returned value.

Signed-off-by: Eric Auger <eric.auger@linaro.org>

---

v3 -> v4: fix returned value
---
 hw/arm/sysbus-fdt.c | 19 +++++--------------
 1 file changed, 5 insertions(+), 14 deletions(-)

diff --git a/hw/arm/sysbus-fdt.c b/hw/arm/sysbus-fdt.c
index 75a4526..b511865 100644
--- a/hw/arm/sysbus-fdt.c
+++ b/hw/arm/sysbus-fdt.c
@@ -216,7 +216,7 @@ static int add_calxeda_midway_xgmac_fdt_node(SysBusDevice *sbdev, void *opaque)
     PlatformBusDevice *pbus = data->pbus;
     void *fdt = data->fdt;
     const char *parent_node = data->pbus_node_name;
-    int compat_str_len, i, ret = -1;
+    int compat_str_len, i;
     char *nodename;
     uint32_t *irq_attr, *reg_attr;
     uint64_t mmio_base, irq_number;
@@ -241,12 +241,8 @@ static int add_calxeda_midway_xgmac_fdt_node(SysBusDevice *sbdev, void *opaque)
         reg_attr[2 * i + 1] = cpu_to_be32(
                                 memory_region_size(&vdev->regions[i]->mem));
     }
-    ret = qemu_fdt_setprop(fdt, nodename, "reg", reg_attr,
-                           vbasedev->num_regions * 2 * sizeof(uint32_t));
-    if (ret) {
-        error_report("could not set reg property of node %s", nodename);
-        goto fail_reg;
-    }
+    qemu_fdt_setprop(fdt, nodename, "reg", reg_attr,
+                     vbasedev->num_regions * 2 * sizeof(uint32_t));
 
     irq_attr = g_new(uint32_t, vbasedev->num_irqs * 3);
     for (i = 0; i < vbasedev->num_irqs; i++) {
@@ -256,17 +252,12 @@ static int add_calxeda_midway_xgmac_fdt_node(SysBusDevice *sbdev, void *opaque)
         irq_attr[3 * i + 1] = cpu_to_be32(irq_number);
         irq_attr[3 * i + 2] = cpu_to_be32(GIC_FDT_IRQ_FLAGS_LEVEL_HI);
     }
-    ret = qemu_fdt_setprop(fdt, nodename, "interrupts",
+    qemu_fdt_setprop(fdt, nodename, "interrupts",
                      irq_attr, vbasedev->num_irqs * 3 * sizeof(uint32_t));
-    if (ret) {
-        error_report("could not set interrupts property of node %s",
-                     nodename);
-    }
     g_free(irq_attr);
-fail_reg:
     g_free(reg_attr);
     g_free(nodename);
-    return ret;
+    return 0;
 }
 
 
-- 
1.9.1
