Received: by 10.182.158.201 with SMTP id ww9csp9918obb;
        Wed, 6 Jan 2016 07:13:42 -0800 (PST)
X-Received: by 10.194.123.8 with SMTP id lw8mr107897134wjb.72.1452093222613;
        Wed, 06 Jan 2016 07:13:42 -0800 (PST)
Return-Path: <eric.auger@linaro.org>
Received: from mail-wm0-x236.google.com (mail-wm0-x236.google.com. [2a00:1450:400c:c09::236])
        by mx.google.com with ESMTPS id fa10si85677713wjd.246.2016.01.06.07.13.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 06 Jan 2016 07:13:42 -0800 (PST)
Received-SPF: pass (google.com: domain of eric.auger@linaro.org designates 2a00:1450:400c:c09::236 as permitted sender) client-ip=2a00:1450:400c:c09::236;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of eric.auger@linaro.org designates 2a00:1450:400c:c09::236 as permitted sender) smtp.mailfrom=eric.auger@linaro.org;
       dkim=pass header.i=@linaro.org
Received: by mail-wm0-x236.google.com with SMTP id u188so63742622wmu.1
        for <alex.bennee@linaro.org>; Wed, 06 Jan 2016 07:13:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=K4npePiVlp7IzNuisXe138R97OdL6p9BCocSVzFXEkU=;
        b=bE+ptA30HkwursS2i8+4MJOgjK4LHiC5lugBGDP0cbHDFOkKj00ANyl/yL43TQA4DC
         q8s/acJKznTpQe+ckBjn9ByOKAKcCmuydqY3onMB9cjQwkxIgesPSz1cxE4o6KAMoIxi
         mTDliqj5JK39xvdFi48YMU7l0wvw0C4t06zmE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=K4npePiVlp7IzNuisXe138R97OdL6p9BCocSVzFXEkU=;
        b=BguBUi5f5DNhakJYhHf7m5tAtdoG8vfPZn1UbpZXkiKk1eV4TmYKukqEOdVfaEvH0z
         7/hOxeXilYrpPvdagp/1SXgq2EQFdMl/UxZhYt9NZYwfTEQ1ZzhDAzrMvAV+3+bHvBC3
         mHLSY4sO8M9O+i1YtxarEWZGhb2dNma2HnviOiOuTeV0YB3uBd69JWqIbf2W7JFYhPI2
         U5Twyw10q3fPIbru0BG1WHRLQkf+rOLXWaOizDQ0YZND9Kl6jzJc2MLrElIpbUoei2FW
         +C4DuXZGFuoewELPf/dRq0gYeuP/+VTiGzyPsbUO5tFm6Tllme8VjdOfNOp1j2u7dgFP
         9FhA==
X-Gm-Message-State: ALoCoQne6iYDctrtyyqDZNpbD1nfoFeIKoTbNVeAmAnSmUe/RAI85zd+airTEzcOKlECR6xq/8pHTpJVZN57ZE9uOKvwjo5r5w==
X-Received: by 10.28.224.212 with SMTP id x203mr11016219wmg.29.1452093222353;
        Wed, 06 Jan 2016 07:13:42 -0800 (PST)
Return-Path: <eric.auger@linaro.org>
Received: from new-host-6.home (LMontsouris-657-1-37-90.w80-11.abo.wanadoo.fr. [80.11.198.90])
        by smtp.gmail.com with ESMTPSA id df10sm81858826wjb.44.2016.01.06.07.13.40
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Wed, 06 Jan 2016 07:13:41 -0800 (PST)
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
Subject: [PATCH v2 7/7] hw/arm/sysbus-fdt: remove qemu_fdt_setprop returned value check
Date: Wed,  6 Jan 2016 15:13:25 +0000
Message-Id: <1452093205-30167-8-git-send-email-eric.auger@linaro.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1452093205-30167-1-git-send-email-eric.auger@linaro.org>
References: <1452093205-30167-1-git-send-email-eric.auger@linaro.org>
X-TUID: E3xGFeUUPn1G

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
