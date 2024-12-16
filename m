Received: by 2002:a17:505:57c2:b0:1be9:327d:8ee3 with SMTP id yd2csp2204945njb;
        Mon, 16 Dec 2024 06:19:01 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVD897DTJhbBNXbnzJqUlRnFD/tb5VeIcLZilIE83Qu7XppzTLLMRbROOYrtsReKS8KZ8n+w22moD/6/g==@linaro.org
X-Received: by 2002:a05:6a00:2d8d:b0:728:e25b:745 with SMTP id d2e1a72fcca58-7290c1b0f5amr16381328b3a.12.1734358741567;
        Mon, 16 Dec 2024 06:19:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1734358741; cv=none;
        d=google.com; s=arc-20240605;
        b=jeXDvzxt/s6SlgIEPV0SfRmNZlyS+RhClYxjajj0uLMcqSUV2oEKEGO13+8eLx3T4X
         R2vfyu91PYdmeSHhuEIGOI7/3GPH5bPOX+cijVT1F9UzjrpW80Q9DkeIZmAMJkRampyc
         NihDRzgLnuHT0Zin6znVL/JB2/hCiIHGnJ1htEjR+KFswBk3OgFLTFhGAQgiEjrJiRSb
         fl1uqeOqu4507QaitI84mbEZGWh2zSof6fxwDI5WniRw4QkVSMN4r68+WCV3p2SJjvnl
         z55N0aO8yKZf7J5gQCXX28cqvq1IS8GSQ6Enfi4FxxKia9gIneQtJrEVkcU75hEVWm1L
         OSYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=8/OmY2WmEI/8k66B1EkRdUwbupmt1vgrU/5PDZqVbRs=;
        fh=xX8d0f55Ulv23WwEx3hTCIh8UeLaSn23HtZlXSAOPqc=;
        b=PywukdZTuygguI0wFMxRbWCrl8/zEw83WklSo/0dnyTB166a/tj5GiJuYQeS1U/ltv
         /c9lF56GVu9ZlCtJ4ootKOZ7S24YuWizL6kLYp3cZLTvxnVA4yxvba6d7kSLX52HcAJO
         DXTkPJ8glHva3WKVi6NhOy9nkjs05sn9ItaemaISjIugf9o5PuP7dIUCOoQU1KaF/tNw
         93ZIZVFsf8w8sQawARqtBckjTzPK2+XiBYBQb33f4yUNZFmldSLkoamuPaZeOuONj5NT
         a68xsPI52Cl+gi0W10qusl+WAcupBeUAvD0LncJ6y7KvWmyDVvfPEEjid3Aa2ocPanWb
         dubw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cEcjixp2;
       spf=pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=gustavo.romero@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <gustavo.romero@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-72918bcef8fsor4920414b3a.11.2024.12.16.06.19.01
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 16 Dec 2024 06:19:01 -0800 (PST)
Received-SPF: pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cEcjixp2;
       spf=pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=gustavo.romero@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734358741; x=1734963541; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8/OmY2WmEI/8k66B1EkRdUwbupmt1vgrU/5PDZqVbRs=;
        b=cEcjixp2+U2SUAOUy/yRgBkwGVGM/EBdcvxfmhQGg7UFncU+ZruVP5tqVuDdsX04qD
         4QRCdUPl4fp1VpRreB4cmiSlG4g9WI30JJP3Q8aF9+22UCuPhbSJoYZVXQbB+KWzIciR
         JEnob85u7vbYeXBQSyjplN9GdgITm5QHlGMJcQ39hEuRJjHX6OLfMco3v72bc8nWbrzy
         LD/oogE1wqlcvaYGTWeUo04qbEcXevbuR09oRDagufqJ8ywsl4OqDq6iA3rn77gdZsk7
         iRRS3NcLbf70dF4Gw5OXmbi6TqwJs1syBNLl08jLaFse39bY7rfkVulb7NE5HLmq13Vs
         zS0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734358741; x=1734963541;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8/OmY2WmEI/8k66B1EkRdUwbupmt1vgrU/5PDZqVbRs=;
        b=EOdNCQ2sN7M1GBGrtPVW3sLHJsfFkTd6KQz2WfyJDsD2FYLc+wNDXxg5WdQ9h/8TUZ
         dsH52JxrKTads+nCUCroFkU6Fz9sdMnMfDywTVLEwSGGDTihMb84qwpHtIgH04GD3ds9
         Kyb4lqdajLs3VM+ZMdVJVNR2xc3TVtGjLSTtBD6+M8pB6p/yG5DK1LZ4LXFSYFlyotS+
         HmVvSDhpFcDIxaqG5zjNNJiSic6zbqw7pdWrlvjIE/bJYHBXt3v7vA6oUmxob+ZqCqUc
         n7HJ2P3LvyZc6WmTJXVszJW0cSaUNrNtf6FuWrmtjOWERDJRB9F7bTSaCqayVCzmN3iK
         PHQg==
X-Forwarded-Encrypted: i=1; AJvYcCXZOOPNNpM8Pg4kclknuGDoGZZTaZ5oez+lHMpV7tuezQ40OkgfGX2w8rjkO3HD9HNIMnmngsOiLPKMYA==@linaro.org
X-Gm-Message-State: AOJu0YzyLH2rxguUJsiFZpbL+FybW0Du9FQYIyRfRm16Stf1rkTu20+D
	uZahe54G/Nd12d1YzW2qAoSMGezGV2yqaJl7fhdtlguT51uMz3f7cS5I939pKz4AYQ==
X-Gm-Gg: ASbGncs/uvuAYiXH2QAwPGzOI/zMV0qfkqPRGpEy3CZvJncl267ggPNY5xGuPRZrQSx
	RkaDULvUlZfTYzMeNcLq2OEPeeJaOc9AVsS2T6aRwF2rkrUBiJr9dViqk1vNY3ZB6Rr7UbP84+P
	8gV1t0r7G/Uc4HINvAeV2zE/IPTxbGLPQx+6r2iUpoJDYq/chu7daiEZM1fhbHuIPkrgFGKz9So
	mv/mw9C+Ap8cuOSMctj/JKxTzFzHTRVkzBMh0rs03nNYfWqqRvXGS4OBmTYYq8=
X-Google-Smtp-Source: AGHT+IH8Ss/6++oAQmRN8qAGHaA5iFNyL5h0hloSUikXyFjN1vvwmQ3SCZEY7ZkOct5GmNvhiqvt3Q==
X-Received: by 2002:a05:6a20:7285:b0:1e0:c50c:9842 with SMTP id adf61e73a8af0-1e1dfdda805mr26287311637.31.1734358741211;
        Mon, 16 Dec 2024 06:19:01 -0800 (PST)
Return-Path: <gustavo.romero@linaro.org>
Received: from gromero0.. ([177.189.100.90])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72918bad8acsm4948815b3a.146.2024.12.16.06.18.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Dec 2024 06:19:00 -0800 (PST)
From: Gustavo Romero <gustavo.romero@linaro.org>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	philmd@linaro.org,
	alex.bennee@linaro.org,
	thuth@redhat.com,
	armbru@redhat.com
Cc: gustavo.romero@linaro.org
Subject: [PATCH v3 3/7] hw/arm: Allow some machines to use the ivshmem-flat device
Date: Mon, 16 Dec 2024 14:18:14 +0000
Message-Id: <20241216141818.111255-4-gustavo.romero@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241216141818.111255-1-gustavo.romero@linaro.org>
References: <20241216141818.111255-1-gustavo.romero@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: g5THeyaSEwPQ

Allow Arm machine lm3s6965evb and the mps2 ones, like the mps2-an385, to
use the ivshmem-flat device.

Message-ID: <20231127052024.435743-2-gustavo.romero@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>
---
 hw/arm/mps2.c      | 3 +++
 hw/arm/stellaris.c | 3 +++
 hw/arm/virt.c      | 2 ++
 3 files changed, 8 insertions(+)

diff --git a/hw/arm/mps2.c b/hw/arm/mps2.c
index 50919ee46d..fe158dfbc0 100644
--- a/hw/arm/mps2.c
+++ b/hw/arm/mps2.c
@@ -42,6 +42,7 @@
 #include "hw/timer/cmsdk-apb-dualtimer.h"
 #include "hw/misc/mps2-scc.h"
 #include "hw/misc/mps2-fpgaio.h"
+#include "hw/misc/ivshmem-flat.h"
 #include "hw/ssi/pl022.h"
 #include "hw/i2c/arm_sbcon_i2c.h"
 #include "hw/net/lan9118.h"
@@ -472,6 +473,8 @@ static void mps2_class_init(ObjectClass *oc, void *data)
     mc->max_cpus = 1;
     mc->default_ram_size = 16 * MiB;
     mc->default_ram_id = "mps.ram";
+
+    machine_class_allow_dynamic_sysbus_dev(mc, TYPE_IVSHMEM_FLAT);
 }
 
 static void mps2_an385_class_init(ObjectClass *oc, void *data)
diff --git a/hw/arm/stellaris.c b/hw/arm/stellaris.c
index 376746251e..6725d83f1b 100644
--- a/hw/arm/stellaris.c
+++ b/hw/arm/stellaris.c
@@ -28,6 +28,7 @@
 #include "hw/watchdog/cmsdk-apb-watchdog.h"
 #include "migration/vmstate.h"
 #include "hw/misc/unimp.h"
+#include "hw/misc/ivshmem-flat.h"
 #include "hw/timer/stellaris-gptm.h"
 #include "hw/qdev-clock.h"
 #include "qom/object.h"
@@ -1404,6 +1405,8 @@ static void lm3s6965evb_class_init(ObjectClass *oc, void *data)
     mc->init = lm3s6965evb_init;
     mc->ignore_memory_transaction_failures = true;
     mc->default_cpu_type = ARM_CPU_TYPE_NAME("cortex-m3");
+
+    machine_class_allow_dynamic_sysbus_dev(mc, TYPE_IVSHMEM_FLAT);
 }
 
 static const TypeInfo lm3s6965evb_type = {
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 333eaf67ea..67a4d3b838 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -85,6 +85,7 @@
 #include "hw/virtio/virtio-iommu.h"
 #include "hw/char/pl011.h"
 #include "qemu/guest-random.h"
+#include "hw/misc/ivshmem-flat.h"
 
 static GlobalProperty arm_virt_compat[] = {
     { TYPE_VIRTIO_IOMMU_PCI, "aw-bits", "48" },
@@ -3120,6 +3121,7 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
     machine_class_allow_dynamic_sysbus_dev(mc, TYPE_VFIO_AMD_XGBE);
     machine_class_allow_dynamic_sysbus_dev(mc, TYPE_RAMFB_DEVICE);
     machine_class_allow_dynamic_sysbus_dev(mc, TYPE_VFIO_PLATFORM);
+    machine_class_allow_dynamic_sysbus_dev(mc, TYPE_IVSHMEM_FLAT);
 #ifdef CONFIG_TPM
     machine_class_allow_dynamic_sysbus_dev(mc, TYPE_TPM_TIS_SYSBUS);
 #endif
-- 
2.34.1
