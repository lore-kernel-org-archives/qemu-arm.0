Received: by 10.25.159.19 with SMTP id i19csp69240lfe;
        Mon, 1 Feb 2016 05:52:27 -0800 (PST)
X-Received: by 10.194.95.136 with SMTP id dk8mr24352686wjb.96.1454334747424;
        Mon, 01 Feb 2016 05:52:27 -0800 (PST)
Return-Path: <eric.auger@linaro.org>
Received: from mail-wm0-x229.google.com (mail-wm0-x229.google.com. [2a00:1450:400c:c09::229])
        by mx.google.com with ESMTPS id 18si15119865wmw.10.2016.02.01.05.52.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 01 Feb 2016 05:52:27 -0800 (PST)
Received-SPF: pass (google.com: domain of eric.auger@linaro.org designates 2a00:1450:400c:c09::229 as permitted sender) client-ip=2a00:1450:400c:c09::229;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of eric.auger@linaro.org designates 2a00:1450:400c:c09::229 as permitted sender) smtp.mailfrom=eric.auger@linaro.org;
       dkim=pass header.i=@linaro.org
Received: by mail-wm0-x229.google.com with SMTP id p63so72147772wmp.1
        for <alex.bennee@linaro.org>; Mon, 01 Feb 2016 05:52:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=OXKI0DfZp+6+J3Yr4e4iH/0iviECzB/cR0EoQOCcIuo=;
        b=jhtJKrDPwf1iB5utwQDSBYYTq53P5+vMZ48L3+TQgkmDs3NELB5LRidwh+c6SO9oJH
         fZTAsnn++lCb1eZ3c23Ksfn88511wVwrCgEbeoSjd7vp8CqVFqanUgjxp97YG6zlGmrJ
         kZMZ1G38yluTyjycdMLb/4y3462U2D5w7m3mA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=OXKI0DfZp+6+J3Yr4e4iH/0iviECzB/cR0EoQOCcIuo=;
        b=LM4V6UTLCec6BuZDCLSooGRiQNaK3vjVMlG7mD2JeVtkGu4Zb0PDhHeeoOiA8xL6RD
         T3akrTbBrEDifHhw7xJ1jEeVMWGKxTt6TtnYBFrw0+VhqPHI87rBjrIlKHBPJNLiU2aU
         kJxZWg75GaaYYS5yFF1/6e84awL0bGwpfS/RPQcLrGPxFQgECGq7rqALxFIi0AHHvA6k
         POXA8zXIvbKlpo1Y5B9h2PpYXb4qVhbn8LSRtI1/eY8ycT7fziQYBuoaAC4Ts4ji5ZrQ
         OtPT60voKabhzczQU1I79CHu0DU8Sn46FxiH1HFkSfhXxOvJzzpI7SJ57zsbeoIFEbLI
         Lfdw==
X-Gm-Message-State: AG10YOTlsYCH+cAJm5dacGUt55ust/cHkAgH8qbyaKj2IGaBk90CkA+YfAo166pU5aKZw4DmWws=
X-Received: by 10.28.111.91 with SMTP id k88mr11178000wmc.86.1454334747245;
        Mon, 01 Feb 2016 05:52:27 -0800 (PST)
Return-Path: <eric.auger@linaro.org>
Received: from new-host-13.home (LMontsouris-657-1-37-90.w80-11.abo.wanadoo.fr. [80.11.198.90])
        by smtp.gmail.com with ESMTPSA id lw7sm7925488wjb.19.2016.02.01.05.52.24
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Mon, 01 Feb 2016 05:52:25 -0800 (PST)
From: Eric Auger <eric.auger@linaro.org>
To: eric.auger@st.com,
	eric.auger@linaro.org,
	qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	peter.maydell@linaro.org,
	alex.williamson@redhat.com,
	david@gibson.dropbear.id.au
Cc: christoffer.dall@linaro.org,
	suravee.suthikulpanit@amd.com,
	alex.bennee@linaro.org,
	thuth@redhat.com,
	crosthwaitepeter@gmail.com,
	patches@linaro.org,
	pbonzini@redhat.com,
	b.reynal@virtualopensystems.com,
	thomas.lendacky@amd.com
Subject: [PATCH v6 8/8] hw/arm/sysbus-fdt: remove qemu_fdt_setprop returned value check
Date: Mon,  1 Feb 2016 13:51:52 +0000
Message-Id: <1454334712-12360-9-git-send-email-eric.auger@linaro.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1454334712-12360-1-git-send-email-eric.auger@linaro.org>
References: <1454334712-12360-1-git-send-email-eric.auger@linaro.org>
X-TUID: QZ3vU+pectBQ

qemu_fdt_setprop asserts in case of error hence no need to check
the returned value.

Signed-off-by: Eric Auger <eric.auger@linaro.org>

---

v3 -> v4: fix returned value
---
 hw/arm/sysbus-fdt.c | 19 +++++--------------
 1 file changed, 5 insertions(+), 14 deletions(-)

diff --git a/hw/arm/sysbus-fdt.c b/hw/arm/sysbus-fdt.c
index 9920388..04afeae 100644
--- a/hw/arm/sysbus-fdt.c
+++ b/hw/arm/sysbus-fdt.c
@@ -217,7 +217,7 @@ static int add_calxeda_midway_xgmac_fdt_node(SysBusDevice *sbdev, void *opaque)
     PlatformBusDevice *pbus = data->pbus;
     void *fdt = data->fdt;
     const char *parent_node = data->pbus_node_name;
-    int compat_str_len, i, ret = -1;
+    int compat_str_len, i;
     char *nodename;
     uint32_t *irq_attr, *reg_attr;
     uint64_t mmio_base, irq_number;
@@ -242,12 +242,8 @@ static int add_calxeda_midway_xgmac_fdt_node(SysBusDevice *sbdev, void *opaque)
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
@@ -257,17 +253,12 @@ static int add_calxeda_midway_xgmac_fdt_node(SysBusDevice *sbdev, void *opaque)
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
 
 /* AMD xgbe properties whose values are copied/pasted from host */
-- 
1.9.1
