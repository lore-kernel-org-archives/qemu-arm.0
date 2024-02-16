Received: by 2002:a17:906:d9da:b0:a3d:1c09:7d3d with SMTP id qk26csp1273780ejb;
        Fri, 16 Feb 2024 06:45:18 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUR1WU94sdxiZCh+unMPCdUgo5vgqgfloxSJrm5tbhCAsM45SUHdWnTuUs2kig1NNNKS33BT0J3uSCPCBefpXUzSET71u2d
X-Received: by 2002:a17:906:851:b0:a3d:80d7:d1e3 with SMTP id f17-20020a170906085100b00a3d80d7d1e3mr3340996ejd.77.1708094718652;
        Fri, 16 Feb 2024 06:45:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708094718; cv=none;
        d=google.com; s=arc-20160816;
        b=ju6Xtaz8qsWqiQFbZ2EZRJtLx3jOvzIMQdBjSjlgEOLe//M7Ncyevz7/Ogpwq9H61C
         5TiHF/9t4m1GjS4qsQ4/pzQ+81q7IX0uEr3NF/QAWmhLvMtu1PPJunCELGdLSdVC3GLv
         0aRiRwwW0PQsPTl4bUSe/TUpvUv1qd0tD5XfByDY1qC/wY7adnxHji7rH6XKXb//8eRr
         B3FH3FvVgr6TtPBxNnpzgICQtP7DdjJ1yENPiIwm1EMt93y1rAD8z6OPyebArLxrE0mG
         A0Hp7u4sGe41PYuoglzDOBVz+LBPgBt3xvfuqo2pzV3Ikh96OcrJAdI3Bm8dkH6IL8aY
         LDJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=oXng8oGwwqDt/PMjq6VF0UcwHwIEk/qMcV0UYux3zN8=;
        fh=YOvKlH9lZJe7FlniZZGKKD3yYUpW7gloSz60sBhsHug=;
        b=le1FOSRdg88SJ7nQGbUKxZmbF7S6Ew2PKCBKEs+Q+fHdFjz/eaBE2wijiDvKhzWht7
         MtxXxzqC1Cdd32RwBNfM7/F8l2pyDSzSQ0EMS344xgjOw/zn6Fe+XJRqlme8/oDZirm/
         IyklMGVGpGdnY6x46sAkwLox6Y8aZgx3fCjsFAT8CuIxTlozImDqO/PaSjAKjkVuI2e6
         Q+NSpJaEG7f9H3JBhqbYmo/1W1j6372W5A320884G4QMuYExP3WRszpPQ5JiGND5RwZ7
         vdB98prDpGb7i8Thjf/NRSjxVoQfejU6aJMowu5QoT0ei5zywqhKgAtrYa4tfLQDlgZv
         /QAg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zwkNoDwr;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id q12-20020a170906b28c00b00a3db6cab989sor3830ejz.18.2024.02.16.06.45.18
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 16 Feb 2024 06:45:18 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zwkNoDwr;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708094718; x=1708699518; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oXng8oGwwqDt/PMjq6VF0UcwHwIEk/qMcV0UYux3zN8=;
        b=zwkNoDwrbAxAujitcz6YTSg1KiV6VKIM4/gvt27oRX0HQmEeIylvamFpvFwI8E6CzM
         p7K7b5SGO+l+POa53rJ1Qg+Awr9gXYyfMCSfZ1vqru8UCB5Y6SVFuH5thOMv1x4YdIF1
         0abWsu+Mw6I0qUrQupnVbjpu4kN8kRMhu9yTmSaHmlVVU48Y0c8AaHbAxJXpJsKo6mhi
         V8mi23veAotK5NsOGW3etMyV4sAg9mY1ZqoYDrVEQV7QUg2qndODdrIPCSeRrLiaY7xV
         PRnf4P4Pe7Epr5vym2iEUVqC9R7CXrSUEXzdFMq3HunjR3eKPFCpVXNblQWiq0NgiC60
         vVXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708094718; x=1708699518;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oXng8oGwwqDt/PMjq6VF0UcwHwIEk/qMcV0UYux3zN8=;
        b=GWDhqn38OSUQSaFWFsxaupZC7oEN9NGDz/uaM42jO7YJsoXPQB21OZn3b/7Q+5GFkY
         ThT/U2ATGZkDQq3Q6vwCS5V2ADBLMClfXn850Rp++pH99B6xgtfV95Y6RP2SMsKwcUdj
         3T9R+cqwcnlahOsOnUIx/8fey8ysvhMnii+rHcwf05JoDuENGgfTlNcHonNfdziFQFec
         10qDdMxNkHIA3JBW/ph8oWjHL/RAtkOhrXzJg6oo++5vRj7BMYsUSrAqXe56mSBWjBkZ
         ZDmGPrI3l9PyZBZkwm0LQyHzTYsS3GRZPUfOoLx5IH8SlWO8sHYwdrvSWcN8/HZywqmY
         eoKg==
X-Forwarded-Encrypted: i=1; AJvYcCWejY0cdTobER2UiIuwiJvZHciECxeUDVx0NWgGoi3vLlSgjk5kOp89zomQH7Ivvx5Lnd8EHUWy0sHdn6XVyMLVsJOTTgpY
X-Gm-Message-State: AOJu0YyWqHvqNeRrDhRDZGvEhHwlrHXd6y995rxBUFPNWPQdXaeTlPMz
	NM2YuFZzR8gmw/Sd6cIlZJ1CCWNoGDeHHHct/DBcwPps4+U0XcCJZCazXrC3vjD5KQ==
X-Google-Smtp-Source: AGHT+IGK5WYs6Evb0lMuBrJCBdo55QSC3BU2SAY6VBsZUT1RxpdpqKP5TMf2j23bsg++TMfnX3YhIA==
X-Received: by 2002:a17:906:a1d4:b0:a3b:eaa3:ecc4 with SMTP id bx20-20020a170906a1d400b00a3beaa3ecc4mr3985642ejb.60.1708094718406;
        Fri, 16 Feb 2024 06:45:18 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan ([176.187.210.246])
        by smtp.gmail.com with ESMTPSA id th8-20020a1709078e0800b00a3d120e311asm1601054ejc.117.2024.02.16.06.45.16
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 16 Feb 2024 06:45:17 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org,
	Gustavo Romero <gustavo.romero@linaro.org>
Cc: Thomas Huth <thuth@redhat.com>,
	Laurent Vivier <lvivier@redhat.com>,
	qemu-arm@nongnu.org,
	alex.bennee@linaro.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	Anton Kochkov <anton.kochkov@proton.me>,
	richard.henderson@linaro.org,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 3/6] hw/arm: Allow some machines to use the ivshmem-flat device
Date: Fri, 16 Feb 2024 15:44:53 +0100
Message-ID: <20240216144456.34992-4-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240216144456.34992-1-philmd@linaro.org>
References: <20240216144456.34992-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: bzoxI84Decos

From: Gustavo Romero <gustavo.romero@linaro.org>

Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>
Message-ID: <20231127052024.435743-2-gustavo.romero@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
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
2.41.0
