Received: by 10.25.208.211 with SMTP id h202csp737103lfg;
        Thu, 18 Feb 2016 09:46:28 -0800 (PST)
X-Received: by 10.194.47.133 with SMTP id d5mr9430642wjn.87.1455817576109;
        Thu, 18 Feb 2016 09:46:16 -0800 (PST)
Return-Path: <eric.auger@linaro.org>
Received: from mail-wm0-x22c.google.com (mail-wm0-x22c.google.com. [2a00:1450:400c:c09::22c])
        by mx.google.com with ESMTPS id mn4si11885920wjc.49.2016.02.18.09.46.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 18 Feb 2016 09:46:16 -0800 (PST)
Received-SPF: pass (google.com: domain of eric.auger@linaro.org designates 2a00:1450:400c:c09::22c as permitted sender) client-ip=2a00:1450:400c:c09::22c;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of eric.auger@linaro.org designates 2a00:1450:400c:c09::22c as permitted sender) smtp.mailfrom=eric.auger@linaro.org;
       dkim=pass header.i=@linaro.org
Received: by mail-wm0-x22c.google.com with SMTP id g62so36773335wme.0
        for <alex.bennee@linaro.org>; Thu, 18 Feb 2016 09:46:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=+hgoi7lk5JE8yuGudR8QMBPqLwGzMQ6m4XeCvTw2G6A=;
        b=kRHfKp/5gDid90HHvmIdGhmp6lLwSQDQ4i3RrJ8TbIsEe/3CFsKM9J4ly20Y0iwVPl
         4tkIC+bHrEJaWD1rH0w8P67v5Ifxrlp9zJNJR+KDD01o90PlZW/LkKG9smsnHgB7ZOs7
         vCEE7gF+M1UCaD9E//CyQkZZbGHZb7zu8N9oU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=+hgoi7lk5JE8yuGudR8QMBPqLwGzMQ6m4XeCvTw2G6A=;
        b=GJVKngniXORPStwDk5teC25TZy5KTCNcGIup5l6Wg6DspEk4gNKDiJNaDrF0Ydo0cY
         aFhz56llUOCarJDCcPpUXa9RT3cC5VvOVE4PmhUVqqBKykhrxoj+qZTsyFs0W89sOnkG
         oyoE9WAOagqioo5vb/OigP1kGXG5jF8fx0U3CrUnJwH3NpRGF2TL5oPgNcnguy2HoyGP
         odoTJ8laZ9gxzvncUlrMJZ9p+1N9eTvna/tjT6TXebJ2aG5q22fWPAHoxgEd8RHVAJKj
         o1CkANHumYd/Bf+1F3LmHswyDc6N5OoH1+IRiUbMSaDUMSBx4umYYmxg/lMkxgtYSZy9
         8Fcg==
X-Gm-Message-State: AG10YOR7oLILChL5RTZRch3rT8OzDYqpdmFxCuh8cgY+kcvL1vQZcP1dv1po0ArADzhXHiNf3Qo=
X-Received: by 10.28.195.9 with SMTP id t9mr4856728wmf.9.1455817575890;
        Thu, 18 Feb 2016 09:46:15 -0800 (PST)
Return-Path: <eric.auger@linaro.org>
Received: from midway01-04-00.lavalab ([81.128.185.50])
        by smtp.gmail.com with ESMTPSA id ct2sm7592997wjb.46.2016.02.18.09.46.12
        (version=TLS1_1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Thu, 18 Feb 2016 09:46:13 -0800 (PST)
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
Subject: [PATCH v7 8/8] hw/arm/sysbus-fdt: remove qemu_fdt_setprop returned value check
Date: Thu, 18 Feb 2016 17:45:46 +0000
Message-Id: <1455817546-6564-9-git-send-email-eric.auger@linaro.org>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <1455817546-6564-1-git-send-email-eric.auger@linaro.org>
References: <1455817546-6564-1-git-send-email-eric.auger@linaro.org>
X-TUID: LH6dL6VNzmik

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
