Received: by 10.25.159.19 with SMTP id i19csp1973877lfe;
        Mon, 18 Jan 2016 07:17:14 -0800 (PST)
X-Received: by 10.28.148.82 with SMTP id w79mr14268506wmd.71.1453130228621;
        Mon, 18 Jan 2016 07:17:08 -0800 (PST)
Return-Path: <eric.auger@linaro.org>
Received: from mail-wm0-x235.google.com (mail-wm0-x235.google.com. [2a00:1450:400c:c09::235])
        by mx.google.com with ESMTPS id e4si24820665wjy.109.2016.01.18.07.17.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 18 Jan 2016 07:17:08 -0800 (PST)
Received-SPF: pass (google.com: domain of eric.auger@linaro.org designates 2a00:1450:400c:c09::235 as permitted sender) client-ip=2a00:1450:400c:c09::235;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of eric.auger@linaro.org designates 2a00:1450:400c:c09::235 as permitted sender) smtp.mailfrom=eric.auger@linaro.org;
       dkim=pass header.i=@linaro.org
Received: by mail-wm0-x235.google.com with SMTP id l65so103558175wmf.1
        for <alex.bennee@linaro.org>; Mon, 18 Jan 2016 07:17:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=w9i4gntVlpd3EjrhcBJCq1U5vmvCvufW/z/D1o6yY/g=;
        b=AGlxjRpoH9F4HBpIx+AuqSnVg3+4G1NsQWSx7eh6egTwfJfh9OXB//xwwV2b8aCgN/
         ZrgX1/7Lg2t1l9ilVFjX4FNStGD85yoo/NV0e7KFBeqUvMG7XDURSh7DLuTlRZB5TQ/5
         /byImCTP5kZQyVIMkBmCfFHDzSV87aZWZbG/Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=w9i4gntVlpd3EjrhcBJCq1U5vmvCvufW/z/D1o6yY/g=;
        b=IO9usxhHhR7Gbj1/+vLRk7hOLqTkE+HbuZnU5ZOo9QXoU45GCV97OCnWtWaYMcaHyC
         lSvwhRF9nxjZsgzqdyDsIBBe+wdM05zv+T/1op/w8ch0qgkij/UawLJW+IaNV5tOiyCL
         8JopWR1VTpLvKOD+s80AEvMAbBXAGnKx9wBdIefHdRV2YaPIyZHCtmnm+/VbxUip8+g0
         i3u+SP8/47zTI1GpiRPGkjetWpkftVx+VnZI9nUQsNvZL/LJowG6SJ6SkDtElzc+33xQ
         yzqE6HfvTA03ai0uH5zwGqCd+WaOE4moddWVPHEzTPh0THQzV3pQJwJahQeM1P8U7vEm
         XChg==
X-Gm-Message-State: AG10YOTgCeamZy6QtS69IkcTIJA106yRlbiWVKY/eF0ky9S6jbZkJHppvl+wZoGLQdvsAV0LW+w=
X-Received: by 10.28.186.87 with SMTP id k84mr13546237wmf.13.1453130228426;
        Mon, 18 Jan 2016 07:17:08 -0800 (PST)
Return-Path: <eric.auger@linaro.org>
Received: from new-host-9.home (LMontsouris-657-1-37-90.w80-11.abo.wanadoo.fr. [80.11.198.90])
        by smtp.gmail.com with ESMTPSA id o7sm24230067wjf.45.2016.01.18.07.17.06
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Mon, 18 Jan 2016 07:17:06 -0800 (PST)
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
Subject: [PATCH v5 8/8] hw/arm/sysbus-fdt: remove qemu_fdt_setprop returned value check
Date: Mon, 18 Jan 2016 15:16:44 +0000
Message-Id: <1453130204-655-9-git-send-email-eric.auger@linaro.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1453130204-655-1-git-send-email-eric.auger@linaro.org>
References: <1453130204-655-1-git-send-email-eric.auger@linaro.org>
X-TUID: PHt0ckcTYpX2

qemu_fdt_setprop self-asserts in case of error hence no need to check
the returned value.

Signed-off-by: Eric Auger <eric.auger@linaro.org>

---

v3 -> v4: fix returned value
---
 hw/arm/sysbus-fdt.c | 19 +++++--------------
 1 file changed, 5 insertions(+), 14 deletions(-)

diff --git a/hw/arm/sysbus-fdt.c b/hw/arm/sysbus-fdt.c
index bf6ec24..d179214 100644
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
