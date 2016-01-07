Received: by 10.182.158.201 with SMTP id ww9csp659512obb;
        Thu, 7 Jan 2016 07:50:49 -0800 (PST)
X-Received: by 10.194.203.137 with SMTP id kq9mr68770560wjc.129.1452181840749;
        Thu, 07 Jan 2016 07:50:40 -0800 (PST)
Return-Path: <eric.auger@linaro.org>
Received: from mail-wm0-x22c.google.com (mail-wm0-x22c.google.com. [2a00:1450:400c:c09::22c])
        by mx.google.com with ESMTPS id e78si20633582wmc.63.2016.01.07.07.50.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 07 Jan 2016 07:50:40 -0800 (PST)
Received-SPF: pass (google.com: domain of eric.auger@linaro.org designates 2a00:1450:400c:c09::22c as permitted sender) client-ip=2a00:1450:400c:c09::22c;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of eric.auger@linaro.org designates 2a00:1450:400c:c09::22c as permitted sender) smtp.mailfrom=eric.auger@linaro.org;
       dkim=pass header.i=@linaro.org
Received: by mail-wm0-x22c.google.com with SMTP id f206so102505244wmf.0
        for <alex.bennee@linaro.org>; Thu, 07 Jan 2016 07:50:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=K4npePiVlp7IzNuisXe138R97OdL6p9BCocSVzFXEkU=;
        b=VdojnZZ24MmUFXsjiibwhRqnPO0wtXkJlJ5PcOeI4fvBIXl8mnSYtvWPBuTebgnQtS
         LmmQvNhracYjcC36s43EiFyXLOA747SgcfI4Ia3m0bbnkNbVpX9revezxNEZNOjnw5+t
         QIicnylDouTt+qxuejCQ74YBA4zlM8lRWqpHo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=K4npePiVlp7IzNuisXe138R97OdL6p9BCocSVzFXEkU=;
        b=IlKe4A/wjbxAQ7fIqeFke7T7+09t9LjC0Xyr44yJOnK4fkPxbEQnOT+eowOQuJwlgG
         HQrJAnAYglzXj0odiCnlekbMcwBCQRPq21Ki82bpkdouMHGzE93InfsyB4aqCLAnnWWG
         Fnnzhv6VIcL6DT/SEN7we/Y3Fj0VFY5HK3ZxXDAp9ZZE8pnD2r7MngZGjdRuyDUzfoXN
         tyK5ayw4/Cnfi8UDtjKS+oHizq4C8xLRJ8bNnZSVRZnyhPkMKEP0lrlo/enLG96tQWbu
         vx/57H96zgpnJ7n9Ck5V1tSD4SBADRASy5W7Mkw3BOkHbjrG2NtdSRw+lGhjyQ5oLXf9
         hO/Q==
X-Gm-Message-State: ALoCoQmS1Dd2SPIOGJFrIsSed/uWTPR/eEYO6ikHOZ+qol/XcSzmX5TjXw2Yb4AQFMEV6T3fH/Hax+TQ3vA2CYYyZcd2bJWFJg==
X-Received: by 10.194.93.102 with SMTP id ct6mr102733815wjb.157.1452181840485;
        Thu, 07 Jan 2016 07:50:40 -0800 (PST)
Return-Path: <eric.auger@linaro.org>
Received: from new-host-8.home (LMontsouris-657-1-37-90.w80-11.abo.wanadoo.fr. [80.11.198.90])
        by smtp.gmail.com with ESMTPSA id e198sm14267576wmd.0.2016.01.07.07.50.38
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Thu, 07 Jan 2016 07:50:38 -0800 (PST)
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
Subject: [PATCH v3 8/8] hw/arm/sysbus-fdt: remove qemu_fdt_setprop returned value check
Date: Thu,  7 Jan 2016 15:50:15 +0000
Message-Id: <1452181815-1948-9-git-send-email-eric.auger@linaro.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1452181815-1948-1-git-send-email-eric.auger@linaro.org>
References: <1452181815-1948-1-git-send-email-eric.auger@linaro.org>
X-TUID: LYzMiJt4Skyi

qemu_fdt_setprop self-exists in case of error hence no need to check
the returned value.

Signed-off-by: Eric Auger <eric.auger@linaro.org>
---
 hw/arm/sysbus-fdt.c | 15 +++------------
 1 file changed, 3 insertions(+), 12 deletions(-)

diff --git a/hw/arm/sysbus-fdt.c b/hw/arm/sysbus-fdt.c
index 66fa766..68d7e53 100644
--- a/hw/arm/sysbus-fdt.c
+++ b/hw/arm/sysbus-fdt.c
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
@@ -256,14 +252,9 @@ static int add_calxeda_midway_xgmac_fdt_node(SysBusDevice *sbdev, void *opaque)
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
     return ret;
-- 
1.9.1
