Received: by 2002:a17:906:e92:b0:a3e:79c1:d636 with SMTP id p18csp230589ejf;
        Thu, 22 Feb 2024 14:24:27 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUKfuGy/mwQ/7EvT2YMYRlLOhbT8vwQGBW+a52Rg5mrfvclxd3t1A4OP2K5Yg82TRsVwy3I38m4wdzV+SyCCqtLohF1oH7l
X-Received: by 2002:a17:903:2447:b0:1dc:51ac:88f5 with SMTP id l7-20020a170903244700b001dc51ac88f5mr166799pls.65.1708640667342;
        Thu, 22 Feb 2024 14:24:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708640667; cv=none;
        d=google.com; s=arc-20160816;
        b=nusfMeKge2cU16nHabjwRIvmIvKjkoPa+M572X8SiSKeQlay67NHQcT24SjeuCbGbT
         21CLqgkV4hbsWtnSRbwppqHXhrr/clkibEcPTRfB+b86ZD8eMaBXd7yngWmDVG71PS5M
         nrDzefXptK4E7JawRWWl2W8DYXDdul2h8BusPrZaTxsIEu7ecY9SffkfUlN/3OWMdPuW
         VfN7tfTz60e3jxE7EwRT19WKOOCmm4GS32tpXwUAJDKm1g100QeTIdL5ywTQA/G0neq+
         C6Awawa8+3HfGNrfyFWL1Fqtsc4iNrF6KUU0Xcde0fJspJHBayp4vCHn4IBIoWTjpM7H
         o2rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=Q9UcYHsblrSFfrXQA46NbgNay0fShjw8qDCj70T3uHM=;
        fh=5WKTnSHlwExzq3/Yp/T9HE8H7SabaQMJE8PunEHTRPo=;
        b=vPCEYxWrPec5Dl0JHgaH5utVj3q8wB1WhZ8MmY4nTYcizc8u6QWlw7GJo+i34d8sCK
         eh5vK21J4Fb9ACutrIi48Ptw+Q9q4PAkIFX+EHzn5gIMnYlWCRxNjXfZhwx4gDRi1Xub
         nVX/nU3z2nkpk4evxigorQHV/CbF8TybGoQokpXCPiBXJJ1wroXY2PsiafNyql7C7VeO
         m6P05TKpvCcq26E0yswKBJ53GpyOC5dua4Lloq7P+L/9J4bJ6jp5Mn9ph7a19qcVjH9v
         zjdJ2kK4lsp6Pjbt0I6FfIzoMDe61DNjEks990XmepzB9vYFXLLquMOj5rmfrV0N4T2X
         H/Gw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NBwI6iiX;
       spf=pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=gustavo.romero@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <gustavo.romero@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id l17-20020a170902e2d100b001da34154363sor6305547plc.12.2024.02.22.14.24.27
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 22 Feb 2024 14:24:27 -0800 (PST)
Received-SPF: pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NBwI6iiX;
       spf=pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=gustavo.romero@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708640667; x=1709245467; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q9UcYHsblrSFfrXQA46NbgNay0fShjw8qDCj70T3uHM=;
        b=NBwI6iiXDgS24L52GpR4YNhi9JbVDd2NGXlNSTA9yk11854C/UVvS6Eij6Q7wwBtqm
         3LAiWOoyTDRIYCpgbo+1bgs6zzDgkVpHSvWQq6CZt7rteojB/3KAXrqtfolHibT15rPc
         pKKx7nufR6zahHZhMQ6z2h+RDeHruYHcDLdvkdiGt3qcqvnKr8/d6Vi91K1CQuwbsoZC
         zpP9KJXytwbeuFjJmiZcEBHcQzvvvi0SLaKjg1xc8xkshRdzY5Rh3vKJA6DyJbvEJsTC
         hi5bBJ3qd4sn/v5YgYfqq+1i9ImglMCPEhfAdnCojmq22XrkPQirSfmiLWKgNSU2XeZa
         1Hqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708640667; x=1709245467;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q9UcYHsblrSFfrXQA46NbgNay0fShjw8qDCj70T3uHM=;
        b=uiR0IBAcuKBXeDf838RqJzvwk0njb+/UOGQwV8YxqJTvZgpGlG6lXJDNN3zPWLhBRX
         XLqL48rEWjusYqSMd2LMXNVF46zxc/i8cR4g1cb/OlprUSmjaA4Dyj0df37A5k8vJp6L
         ULFzpmbFIRBKH5i7FOpuBVJfs6XYPu/RTkpjhi957MPU818YOPMxsW7/DJL3KHe73I4Y
         hxTo/eWAyCcDBdzEzLuOk7jUt/uzZL7GL0Mtf9oUYuC6e9RI+La60murrxhfocHRjZ1v
         jkEwyEfBxK+Z/jPSgvY4NiHmeNyY97jC+JLsETRGSBcxdnia4B6vR9HV6ebX+gE3b+zT
         2H4g==
X-Forwarded-Encrypted: i=1; AJvYcCUMdkQA5KZBEE8V4pu/rcTqxVc1lECCtUHcYl66u6hdbvFEYXdDUdChCJzmi4cvcSH2bC6aR4c3QuDixR3FqPL60/loVg+C
X-Gm-Message-State: AOJu0YznokTkJbLiyyEoverkKAkPiMk6HRhNCqQ/wa3FGYTVvnfysgaP
	EL8Myzy8+LgFFUjd/XKYTLNFtwyDiAgY9p/sIjK4slKfjw4A6eMYo6c9TwJJ1tIBlQ==
X-Google-Smtp-Source: AGHT+IF6WHTLqjO8wD41svY+GPvvNrqoH+RkTQt4RKYpbj+vqdRJvLt2zAavEvaGPZyYCG776QzMuA==
X-Received: by 2002:a17:902:7895:b0:1dc:139:8488 with SMTP id q21-20020a170902789500b001dc01398488mr199012pll.5.1708640666890;
        Thu, 22 Feb 2024 14:24:26 -0800 (PST)
Return-Path: <gustavo.romero@linaro.org>
Received: from amd.. ([2804:7f0:b400:285a:3e7c:3fff:fe7a:e83b])
        by smtp.gmail.com with ESMTPSA id ji7-20020a170903324700b001d7057c2fbasm10457210plb.100.2024.02.22.14.24.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Feb 2024 14:24:26 -0800 (PST)
From: Gustavo Romero <gustavo.romero@linaro.org>
To: qemu-devel@nongnu.org,
	philmd@linaro.org
Cc: thuth@redhat.com,
	lvivier@redhat.com,
	qemu-arm@nongnu.org,
	alex.bennee@linaro.org,
	pbonzini@redhat.com,
	anton.kochkov@proton.me,
	richard.henderson@linaro.org,
	peter.maydell@linaro.org,
	gustavo.romero@linaro.org
Subject: [PATCH 3/6] hw/arm: Allow some machines to use the ivshmem-flat device
Date: Thu, 22 Feb 2024 22:22:15 +0000
Message-Id: <20240222222218.2261956-4-gustavo.romero@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240222222218.2261956-1-gustavo.romero@linaro.org>
References: <20240222222218.2261956-1-gustavo.romero@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: MjnYDkU0LEGS

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
index a2f998bf9e..e25858f232 100644
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
index 0af1943697..6c0917f3b2 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -84,6 +84,7 @@
 #include "hw/virtio/virtio-iommu.h"
 #include "hw/char/pl011.h"
 #include "qemu/guest-random.h"
+#include "hw/misc/ivshmem-flat.h"
 
 #define DEFINE_VIRT_MACHINE_LATEST(major, minor, latest) \
     static void virt_##major##_##minor##_class_init(ObjectClass *oc, \
@@ -2973,6 +2974,7 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
     machine_class_allow_dynamic_sysbus_dev(mc, TYPE_VFIO_AMD_XGBE);
     machine_class_allow_dynamic_sysbus_dev(mc, TYPE_RAMFB_DEVICE);
     machine_class_allow_dynamic_sysbus_dev(mc, TYPE_VFIO_PLATFORM);
+    machine_class_allow_dynamic_sysbus_dev(mc, TYPE_IVSHMEM_FLAT);
 #ifdef CONFIG_TPM
     machine_class_allow_dynamic_sysbus_dev(mc, TYPE_TPM_TIS_SYSBUS);
 #endif
-- 
2.34.1
