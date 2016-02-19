Received: by 10.25.208.211 with SMTP id h202csp1150346lfg;
        Fri, 19 Feb 2016 05:17:46 -0800 (PST)
X-Received: by 10.194.184.234 with SMTP id ex10mr12558674wjc.8.1455887857458;
        Fri, 19 Feb 2016 05:17:37 -0800 (PST)
Return-Path: <eric.auger@linaro.org>
Received: from mail-wm0-x22f.google.com (mail-wm0-x22f.google.com. [2a00:1450:400c:c09::22f])
        by mx.google.com with ESMTPS id l63si12713222wmd.83.2016.02.19.05.17.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 19 Feb 2016 05:17:37 -0800 (PST)
Received-SPF: pass (google.com: domain of eric.auger@linaro.org designates 2a00:1450:400c:c09::22f as permitted sender) client-ip=2a00:1450:400c:c09::22f;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of eric.auger@linaro.org designates 2a00:1450:400c:c09::22f as permitted sender) smtp.mailfrom=eric.auger@linaro.org;
       dkim=pass header.i=@linaro.org
Received: by mail-wm0-x22f.google.com with SMTP id b205so67791855wmb.1
        for <alex.bennee@linaro.org>; Fri, 19 Feb 2016 05:17:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=+hgoi7lk5JE8yuGudR8QMBPqLwGzMQ6m4XeCvTw2G6A=;
        b=dk4k6AF0VFS1jEqwXK96Zynf7p4yWWkCKK9N9lwk4qNSktVC303ubZ/6GjFXKmE0j1
         ZnrpPkkLJ4zTTrgU2eCribUNREK+v2L/3JS44J/GqznT6/CGs4+Td8R7G5ONLPKD/5o6
         ohKQfx4YhBgAMAlkawbhB+InyUPFqlSnBt+hI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=+hgoi7lk5JE8yuGudR8QMBPqLwGzMQ6m4XeCvTw2G6A=;
        b=LvlO/TTt+G4tJNHw4/wrP1Vvx1OUFNHOZh5Jnwl17GbkOOqpOxsA0lvwaJmJSUW+ff
         RzRUdlFUOMcgYqjk4vooq2C49PSe0BYzHMU6nkE9C6fZbnATxPOHdunHGhRi/pR0YKfC
         YiHGMsz7wKXnUOdNX1wQaoA1vKta9T4BTV25IBA8Tznb/4gMTgu07Ttjc4yNH1ylNO7U
         IYfChmohum1E6w/oEXxwii5HR3YhoB0cvFWGJxBXRbj6VKG9+CGPsQ0OYUVyETgS04yW
         rZniDM+OA7IgQs6x2I/uo43ug6doUbxkW3RNHbwzCtN/ntmbcldMDSURxIDQENQZPSrO
         Ospw==
X-Gm-Message-State: AG10YORn3KhtKIc8RTsaVBGT9nmut4anaRx3YKzFhhN49IJlh5Lz17sBQbpfOHcbn6oD/htzP8E=
X-Received: by 10.28.158.198 with SMTP id h189mr8988357wme.74.1455887857186;
        Fri, 19 Feb 2016 05:17:37 -0800 (PST)
Return-Path: <eric.auger@linaro.org>
Received: from midway01-04-00.lavalab ([81.128.185.50])
        by smtp.gmail.com with ESMTPSA id bg1sm11229846wjc.27.2016.02.19.05.17.35
        (version=TLS1_1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Fri, 19 Feb 2016 05:17:35 -0800 (PST)
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
Subject: [PATCH v8 8/8] hw/arm/sysbus-fdt: remove qemu_fdt_setprop returned value check
Date: Fri, 19 Feb 2016 13:17:13 +0000
Message-Id: <1455887833-7306-9-git-send-email-eric.auger@linaro.org>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <1455887833-7306-1-git-send-email-eric.auger@linaro.org>
References: <1455887833-7306-1-git-send-email-eric.auger@linaro.org>
X-TUID: ElYxCpCdDoVU

qemu_fdt_setprop asserts in case of error hence no need to check
the returned value.

Signed-off-by: Eric Auger <eric.auger@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

---

v6 -> v7:
- add Peter's R-b

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
1.8.3.2
