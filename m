Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp3317463ejc;
        Tue, 10 Jan 2023 08:45:38 -0800 (PST)
X-Received: by 2002:adf:e843:0:b0:2bc:7e19:5308 with SMTP id d3-20020adfe843000000b002bc7e195308mr4656344wrn.31.1673369138338;
        Tue, 10 Jan 2023 08:45:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673369138; cv=none;
        d=google.com; s=arc-20160816;
        b=Zinu6u0IJyclERd3X28PTz5iIimqsEdIptGnNXpekFT6JBGvTkLsyh/eInfN/Vbm9v
         lX3VSxCrkGKZHvaXpD/hAc3PAgpFv9feFL1Zq8bx+4om4KJZBSTbceV4eG3jJZLnKjRK
         ljVGSDHruXueVG3p6/IemqwQBl5zKz4l2OwC0ROC0MRfWGynI8sK4Viat2FRbCcAICN7
         7Db+r3yod2JSjCz7l1oJP9pJKDKBaQULUsCe8NS2aatNFaOLEpOBeQ1UzSJZRR1CYUbF
         qtXx+DeUUg7tZKJgreTH/LucCaJVmV9MncFjYjfULkvF7nE823j17TQPCLkIcS6GjWCx
         KGkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=VDhBbDUvfr9IaXWyqrMyPKAYIRrU4/62+8mx1MvW5Dg=;
        b=jWfoeycPJAsk679vNmmLjXw8yercL3Lce220U04+gfS1vRo1zqZ2GMM9B2AMADtJ8v
         KEfKCuFq9WyGtEbnROeRDBFzju6bQ+HWrvCjd48QS1qSflcMKpNt8ytmnQUv6/SSIs5H
         sG/GAjbwDrdN9+wEAO+Fi9+46IDaNpsXQM8APr2oy6I7rTuMmBwsS859qFHSEQVItRFj
         jJNWOm8j6Zjbuot6QX8ZnA68hzRnd7ijdmteViGRUYJtbUWjdkmh6632KKxewrr1smFN
         v9PFs4ESfcUAjKA7WSUh0l0nzGC+aw/5N6kGPFePq8rHc3CI8wBB/o+lYGtDnOx9o/5F
         9gyQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=h5ghSeIk;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id j14-20020adfa54e000000b002bb6d787c00sor3672369wrb.65.2023.01.10.08.45.38
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 10 Jan 2023 08:45:38 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=h5ghSeIk;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VDhBbDUvfr9IaXWyqrMyPKAYIRrU4/62+8mx1MvW5Dg=;
        b=h5ghSeIkmu+Ye2Dj43VyqY4x+RMV92wph0vMdxitPFuMhgdkDOfEGvRusKSFr1n+b3
         Xp9Jum13WMj9R9dqdalxZA46jZBGDJ32SLuhGKpTh8bP2/5DXsENooFBmws91lL5Oc7R
         LpZlYxUMeXY6RtX6SnX22GEbBEho/GgFtUyafSX6thDF/T40DVQjFS758BphU1Uje9vf
         y9UtQ0nnJ2AsaroOKVuVOZEF3UnV7NUlbN3esJrSg1qE3BgIDDTtP1h3fZWaF0veu14P
         ZVgQwjT7Ef7y17nWe1E3DkIFmWv9OflFbhBV8IEHX4CBjiQQOHjEJ4bud4kC/OXmRlpO
         y3Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VDhBbDUvfr9IaXWyqrMyPKAYIRrU4/62+8mx1MvW5Dg=;
        b=VBRK1MhdHUEf4a9dIL99ia9dJyadZvpSZ930D5ZYnSkj5Q7yuIxDm9FaHMrLnjbboe
         U6Y8m8PdoMsxQxf9fVCJ3G5qyvMfab9Eimm8N3S4RSrzd2SJlJ3ZLWLHV5IjwmDvkap7
         g75f9fjVuRPv7tNfkUoPKyP9AZxXeIeMCuZl0fj4qTlEy2aZaijbU/v9VKK+oLXHt7Hc
         jFCtBnS6S1eCS+Ev1ak39V4RybCSbQAkSqgi/KdfxXii5Pj1vsqwcUwe8W5qDzNkFkd4
         uDTmZG2cY6lhs7pFSi+f/OrSr29vQ1VvDg7hFHQAob7K8+gr2/URntqWMDJa2ZQ7VGPH
         2x9Q==
X-Gm-Message-State: AFqh2kpvrev+r0T3FNXzfWKNBcEiAAgldltQxBRxjxcMMzn5FKtalbwe
	Kp/uzr/riwpc18lQgePCEhSLvsuw80b2mlD1Tkg=
X-Google-Smtp-Source: AMrXdXv1NJACiTDLrDeHwqpg8qM0Juf4qN1oCq6lqp2pvE9o1OpLPPwlOOPj+jqt8J3baEhqCE/C9Q==
X-Received: by 2002:a05:6000:18ca:b0:244:48b3:d138 with SMTP id w10-20020a05600018ca00b0024448b3d138mr39991201wrq.54.1673369138135;
        Tue, 10 Jan 2023 08:45:38 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain ([81.0.6.76])
        by smtp.gmail.com with ESMTPSA id w4-20020a5d4b44000000b002366dd0e030sm11505812wrs.68.2023.01.10.08.45.36
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 10 Jan 2023 08:45:37 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: ale@rev.ng,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	Thomas Huth <thuth@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Niek Linnenbank <nieklinnenbank@gmail.com>,
	Jean-Christophe Dubois <jcd@tribudubois.net>,
	Antonio Caggiano <antonio.caggiano@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Antony Pavlov <antonynpavlov@gmail.com>,
	Jan Kiszka <jan.kiszka@web.de>,
	Beniamino Galvani <b.galvani@gmail.com>
Subject: [PATCH 16/18] hw/arm/fsl-imx7: Replace object_initialize(ARMCPU) by object_new()
Date: Tue, 10 Jan 2023 17:44:04 +0100
Message-Id: <20230110164406.94366-17-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230110164406.94366-1-philmd@linaro.org>
References: <20230110164406.94366-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 3FJR2GiDyThM

Replace the ARMCPU field in FslIMX7State by a reference to
an allocated ARMCPU. Instead of initializing the field with
object_initialize(), allocate it with object_new().

As we don't access ARMCPU internal fields or size, we can
move from arm_ss[] to the more generic softmmu_ss[] the followin
units:

 - fsl-imx7.c
 - mcimx7d-sabre.c

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/fsl-imx7.c         | 6 +++---
 hw/arm/mcimx7d-sabre.c    | 2 +-
 hw/arm/meson.build        | 2 +-
 include/hw/arm/fsl-imx7.h | 4 ++--
 4 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/hw/arm/fsl-imx7.c b/hw/arm/fsl-imx7.c
index 6115677d43..634ed299cc 100644
--- a/hw/arm/fsl-imx7.c
+++ b/hw/arm/fsl-imx7.c
@@ -38,8 +38,8 @@ static void fsl_imx7_init(Object *obj)
 
     for (i = 0; i < MIN(ms->smp.cpus, FSL_IMX7_NUM_CPUS); i++) {
         snprintf(name, NAME_SIZE, "cpu%d", i);
-        object_initialize_child(obj, name, &s->cpu[i],
-                                ARM_CPU_TYPE_NAME("cortex-a7"));
+        s->cpu[i] = ARM_CPU(object_new(ARM_CPU_TYPE_NAME("cortex-a7")));
+        object_property_add_child(obj, name, OBJECT(s->cpu[i]));
     }
 
     /*
@@ -157,7 +157,7 @@ static void fsl_imx7_realize(DeviceState *dev, Error **errp)
     }
 
     for (i = 0; i < smp_cpus; i++) {
-        o = OBJECT(&s->cpu[i]);
+        o = OBJECT(s->cpu[i]);
 
         /* On uniprocessor, the CBAR is set to 0 */
         if (smp_cpus > 1) {
diff --git a/hw/arm/mcimx7d-sabre.c b/hw/arm/mcimx7d-sabre.c
index 6182b15f19..ad46bf79c6 100644
--- a/hw/arm/mcimx7d-sabre.c
+++ b/hw/arm/mcimx7d-sabre.c
@@ -61,7 +61,7 @@ static void mcimx7d_sabre_init(MachineState *machine)
     }
 
     if (!qtest_enabled()) {
-        arm_load_kernel(&s->cpu[0], machine, &boot_info);
+        arm_load_kernel(s->cpu[0], machine, &boot_info);
     }
 }
 
diff --git a/hw/arm/meson.build b/hw/arm/meson.build
index b244db5962..53ce301cbe 100644
--- a/hw/arm/meson.build
+++ b/hw/arm/meson.build
@@ -27,7 +27,6 @@ arm_ss.add(when: 'CONFIG_ASPEED_SOC', if_true: files(
   'aspeed_ast2600.c',
   'aspeed_ast10x0.c',
   'fby35.c'))
-arm_ss.add(when: 'CONFIG_FSL_IMX7', if_true: files('fsl-imx7.c', 'mcimx7d-sabre.c'))
 arm_ss.add(when: 'CONFIG_ARM_SMMUV3', if_true: files('smmuv3.c'))
 arm_ss.add(when: 'CONFIG_FSL_IMX6UL', if_true: files('fsl-imx6ul.c', 'mcimx6ul-evk.c'))
 
@@ -41,6 +40,7 @@ softmmu_ss.add(when: 'CONFIG_EMCRAFT_SF2', if_true: files('msf2-som.c'))
 softmmu_ss.add(when: 'CONFIG_EXYNOS4', if_true: files('exynos4_boards.c'))
 softmmu_ss.add(when: 'CONFIG_FSL_IMX25', if_true: files('fsl-imx25.c', 'imx25_pdk.c'))
 softmmu_ss.add(when: 'CONFIG_FSL_IMX31', if_true: files('fsl-imx31.c', 'kzm.c'))
+softmmu_ss.add(when: 'CONFIG_FSL_IMX7', if_true: files('fsl-imx7.c', 'mcimx7d-sabre.c'))
 softmmu_ss.add(when: 'CONFIG_GUMSTIX', if_true: files('gumstix.c'))
 softmmu_ss.add(when: 'CONFIG_HIGHBANK', if_true: files('highbank.c'))
 softmmu_ss.add(when: 'CONFIG_INTEGRATOR', if_true: files('integratorcp.c'))
diff --git a/include/hw/arm/fsl-imx7.h b/include/hw/arm/fsl-imx7.h
index ed8c1ec813..97c9731db3 100644
--- a/include/hw/arm/fsl-imx7.h
+++ b/include/hw/arm/fsl-imx7.h
@@ -38,7 +38,7 @@
 #include "hw/net/imx_fec.h"
 #include "hw/pci-host/designware.h"
 #include "hw/usb/chipidea.h"
-#include "target/arm/cpu.h"
+#include "hw/arm/cpu.h"
 #include "qom/object.h"
 
 #define TYPE_FSL_IMX7 "fsl-imx7"
@@ -65,7 +65,7 @@ struct FslIMX7State {
     DeviceState    parent_obj;
 
     /*< public >*/
-    ARMCPU             cpu[FSL_IMX7_NUM_CPUS];
+    ARMCPU             *cpu[FSL_IMX7_NUM_CPUS];
     A15MPPrivState     a7mpcore;
     IMXGPTState        gpt[FSL_IMX7_NUM_GPTS];
     IMXGPIOState       gpio[FSL_IMX7_NUM_GPIOS];
-- 
2.38.1
