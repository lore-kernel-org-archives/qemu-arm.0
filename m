Received: by 2002:a17:906:6951:b0:a28:f940:7a27 with SMTP id c17csp553260ejs;
        Tue, 9 Jan 2024 10:10:38 -0800 (PST)
X-Received: by 2002:a7b:cd0c:0:b0:40e:4c1d:d117 with SMTP id f12-20020a7bcd0c000000b0040e4c1dd117mr680427wmj.184.1704823838607;
        Tue, 09 Jan 2024 10:10:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704823838; cv=none;
        d=google.com; s=arc-20160816;
        b=0zp3Vzzg5AK5uh8JHXG7ydUkSvjcJaRShl+iDe6UMaNQxWParTH9Uq6BOq+Hb+rDHZ
         q/jJ7wC1hDMffS212wa5YjtRy6yXuvwtZi5O73u2vNwub/WHY1B0d72BYuZwjgBt2mrS
         A35ViGuK4RSPWVYlFKbN8lBVfmrMuOyLT2NHQoEfVza5AuNg3HYR9d8Izz8a9Npom1fy
         yVZA1HLyqvLeR9c4MxYO0Bn2eW9+5K8nqdFcbDTLjXMZIk09xvPja5Vp1Qq9RqPc16Ry
         kgmSFIJhv6yHHjVz7OXXzoGVrnNO2SLU3ppYxoXhipzi9qhQtZT4Z06h17UNglQ/C+x6
         0HYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=ZzKRv8rSt0g4enhYH8TEbkEK8L7Z/ollqT46K3u21b8=;
        fh=v69mdd+nxs/0WeTIWzLZOPCx0ynE2o0vtvId2fSwkBY=;
        b=x8qrxpn4IRlv9qIh8ZUv92VqHHp7vw8PZrsxdJxAGj2RwYzFtQHgNFnVl5+vGcyrjF
         jFZGcL25u/xm1qN4iAz/c9kW+Jg+FlJpWkBJsI1LP2fVPUXOo/uXgM6MhALMqe3Vht68
         Ew5hA4wMsJpfC31Y1sptbj6GmnIjxjbk3lkr0FqF04/1s0vBozS/nUzfL8uxdFnSFGAD
         8PkqEqit/nFONZp3I4aRZTYUfUyk/+57vXWfkFVPo89r9Z8tJfjXVocyNDUyimoNkaaZ
         RThJIFVeOUCXXgoP2d9YbYW9sELxQm2q3kMzMzAWgzJHODirW6VzH0SICmW4EV3X2Apy
         nPcg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=i2qFDMFT;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id o31-20020a05600c511f00b0040e53f70251sor123512wms.2.2024.01.09.10.10.38
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 09 Jan 2024 10:10:38 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=i2qFDMFT;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704823838; x=1705428638; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZzKRv8rSt0g4enhYH8TEbkEK8L7Z/ollqT46K3u21b8=;
        b=i2qFDMFTGc3mULxUQ60hgiBTcA5FOWB7LNAzphBuOohPe42uj8Cp9ADXrwpcIukVS8
         wLWIXtQmUK7SqC8NiEhSGtB5ENoUv8TrzPGPyJlhUwPCC4NbW13UnNF2vRvz8sLkeBQm
         RbSBCcHX4PwD903QHmbu8YKuJnIFAIrxvkxUkDc1RkETjaPkdakeE9IwiA+W0Dyo93mZ
         eM8qk6e9QYs+Hcq7kiJ3B+1IzRmqjc3GFjcc+TSvTW2QVgYZNTtum1k4uhR02WMxSNJL
         6E8rYNFhZ/Gi/AqPawITbblj2UDtTPGm9yphFwETaNIy/Je3YbCV0FMaup+38wLOUEX5
         NS2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704823838; x=1705428638;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZzKRv8rSt0g4enhYH8TEbkEK8L7Z/ollqT46K3u21b8=;
        b=SKzLNtLAbWjsMBEwwnuaIC5ASW4OueDwhkrUTvemFbDWXMnnzAXq9/hJOBHfc81bv6
         nhD+6ciZugZFR5D1VAPcowOU4ObFqFKIBF9sjfd6DfxSLk/Z/kla9u3jiJL2vxq/o8Ae
         1qaJLukm8/7syiiP+mJgdqYPAnFCrcGqCDJP/dKsPGHOLjOibZU1SFZBXJuL9tPV/VlE
         LY2Re75dSfCmjCwJ7ek3XJRg7sJjS3Ms9uTZyAHI42oNhkgg/MJ1l0d1o5tfb8KDxP+O
         QqKjy31tVYb+q9On/Pg4oWlRYmpyaoQTMHGEGuKyakxKSJ2h5uCjb2LjaABC8yYPDYeP
         bWXg==
X-Gm-Message-State: AOJu0YyWR/tdlOOrT7CTQKIf7LWLY94bjzZXTm8tdV758FKdoh/ZOWaP
	OwWVKYd/1AsQUz+Kob+ximnHBzUuIbbESjL5
X-Google-Smtp-Source: AGHT+IH/3kbQYMH94lAPMzxFc6qC/itYnaoRJaclfEFfMxujnUkK+tg1K29wr/U1N6iYR3akTCtTTg==
X-Received: by 2002:a05:600c:298c:b0:40d:5aea:c89b with SMTP id r12-20020a05600c298c00b0040d5aeac89bmr648301wmd.64.1704823838301;
        Tue, 09 Jan 2024 10:10:38 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan (rsa59-h02-176-184-32-47.dsl.sta.abo.bbox.fr. [176.184.32.47])
        by smtp.gmail.com with ESMTPSA id t6-20020a05600c198600b0040e4a7a7ca3sm4385674wmq.43.2024.01.09.10.10.36
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 09 Jan 2024 10:10:37 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Leif Lindholm <quic_llindhol@quicinc.com>,
	Radoslaw Biernacki <rad@semihalf.com>,
	Kevin Wolf <kwolf@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Alistair Francis <alistair@alistair23.me>,
	Peter Maydell <peter.maydell@linaro.org>,
	Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 10/14] hw/arm: Prefer arm_feature(EL2) over object_property_find(has_el2)
Date: Tue,  9 Jan 2024 19:09:25 +0100
Message-ID: <20240109180930.90793-11-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240109180930.90793-1-philmd@linaro.org>
References: <20240109180930.90793-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: eXfD8bFkfTrl

The "has_el2" property is added to ARMCPU when the
ARM_FEATURE_EL2 feature is available. Rather than
checking whether the QOM property is present, directly
check the feature.

Suggested-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/vexpress.c  | 3 ++-
 hw/arm/virt.c      | 2 +-
 hw/cpu/a15mpcore.c | 6 ++++--
 3 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/hw/arm/vexpress.c b/hw/arm/vexpress.c
index fd981f4c33..753a645c05 100644
--- a/hw/arm/vexpress.c
+++ b/hw/arm/vexpress.c
@@ -218,12 +218,13 @@ static void init_cpus(MachineState *ms, const char *cpu_type,
     /* Create the actual CPUs */
     for (n = 0; n < smp_cpus; n++) {
         Object *cpuobj = object_new(cpu_type);
+        ARMCPU *cpu = ARM_CPU(cpuobj);
 
         if (!secure) {
             object_property_set_bool(cpuobj, "has_el3", false, NULL);
         }
         if (!virt) {
-            if (object_property_find(cpuobj, "has_el2")) {
+            if (arm_feature(&cpu->env, ARM_FEATURE_EL2)) {
                 object_property_set_bool(cpuobj, "has_el2", false, NULL);
             }
         }
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 2793121cb4..35eb01a3dc 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -2146,7 +2146,7 @@ static void machvirt_init(MachineState *machine)
             object_property_set_bool(cpuobj, "has_el3", false, NULL);
         }
 
-        if (!vms->virt && object_property_find(cpuobj, "has_el2")) {
+        if (!vms->virt &&  arm_feature(cpu_env(cs), ARM_FEATURE_EL2)) {
             object_property_set_bool(cpuobj, "has_el2", false, NULL);
         }
 
diff --git a/hw/cpu/a15mpcore.c b/hw/cpu/a15mpcore.c
index cebfe142cf..1fa079b3b8 100644
--- a/hw/cpu/a15mpcore.c
+++ b/hw/cpu/a15mpcore.c
@@ -73,9 +73,11 @@ static void a15mp_priv_realize(DeviceState *dev, Error **errp)
             qdev_prop_set_bit(gicdev, "has-security-extensions", true);
         }
         /* Similarly for virtualization support */
-        has_el2 = object_property_find(cpuobj, "has_el2") &&
+        has_el2 = arm_feature(cpu_env(cpu), ARM_FEATURE_EL2);
+        if (has_el2) {
             object_property_get_bool(cpuobj, "has_el2", &error_abort);
-        qdev_prop_set_bit(gicdev, "has-virtualization-extensions", has_el2);
+            qdev_prop_set_bit(gicdev, "has-virtualization-extensions", true);
+        }
     }
 
     if (!sysbus_realize(SYS_BUS_DEVICE(&s->gic), errp)) {
-- 
2.41.0
