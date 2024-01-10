Received: by 2002:a17:906:6951:b0:a28:f940:7a27 with SMTP id c17csp1258911ejs;
        Wed, 10 Jan 2024 11:54:37 -0800 (PST)
X-Received: by 2002:a05:600c:491d:b0:40e:47db:9a3b with SMTP id f29-20020a05600c491d00b0040e47db9a3bmr864907wmp.75.1704916476879;
        Wed, 10 Jan 2024 11:54:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704916476; cv=none;
        d=google.com; s=arc-20160816;
        b=X2DyqdAmJluvPGZE4RcttMdEybRIFBqWLe70K+LMVVeN8mBx7a9b9BeaGfhz1Egb4O
         X3omxYYoQkzhWCShdYvj1b5S/v4suPn7QHCEP1y8osfSrWKwwx8ucife1ji+Y1RAQ6wF
         WQOtzDgPuxhRp+lGDstPI61kHTg4N5qjqaQ7iw1pfh/bBRoAOQMoCqKWEBRD0ah2gBxL
         f3cynaaxl02nBFOtq19okKSHNNWa4h+PH+m/1k7637SRRDvNcucIwxoth1F1Su9bU3ZE
         f5eyCKev4WkqCR7F52JNZFYqlKaBTsSCV00f7Ra7Nx7jqgqvoTzHrtAl+Pa8smjIuIEe
         jmoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=2aLkQ6Ut0DrpuWjeMaf8bgkuaiZex3z3XI0gOydKSEI=;
        fh=0Bn9ysFO5uhdOoEvdDNDnkwY7yFMuDt2XLw3k0zcWt8=;
        b=JREnzAYT+zRDiciRG0vAeHiAwwjp5dLDXCk/wQ0VcTytk73C1K0ycs2bAlJE+c1W5d
         aCoYzc6wPsm8I7n/GMVVXUO0iH+EJcDyAF2lNFOnZ8CI5aHyGARNSR2QnZFQk0mpiGNm
         MbqR0YyAvBiXVhDmsNLmu29M05hq36q2/0NSS9NjWyHn1LWsdNI/esgvI9fwChJroI16
         C69FhZpgrFKz4/pLCJYlJrahyutRIDUAR4YADsjE53dBrGZs+DAAn0e2/BjXh5LnM7XZ
         oc9kDxDbC46O3iIU1510z6GuOc26Iyaq0zmm63gB0ZCLSlEQ+8vGlKAnt0cVuYHOpTNt
         xnPA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tO04rvUu;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id l23-20020a05600c1d1700b0040e47865b5dsor363458wms.4.2024.01.10.11.54.36
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 10 Jan 2024 11:54:36 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tO04rvUu;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704916476; x=1705521276; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2aLkQ6Ut0DrpuWjeMaf8bgkuaiZex3z3XI0gOydKSEI=;
        b=tO04rvUuohwqFGDvwisTEZNV0mG87Uxhlmm70t3fYLJREH3qQZ/s4Jd26wtybpAdnc
         5xG4XsGKGlYVeESYK0uEm6Crobvgwia0GxDt13TXAQsj+DRVX2CY/aG+lXOcOoeKoV06
         H5FB4AAwVhs/zs3ysDsF+sdT/kVzQKhrBAqPldlzcdosgmO5s3tTTNreGOnvj10aipdp
         IXaHqJ6Fk19b6MqVWYG2d/Ak/KLZA63uTNomG+5lmE4C6dfZpvSKy8y9q7zxDj96CGdd
         rytKm7rkSJ4wj7386RC9x77Dc5+C8ze5JHK65YjWOnPlLioShFXiNVs1AniCboy6IL2O
         TOsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704916476; x=1705521276;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2aLkQ6Ut0DrpuWjeMaf8bgkuaiZex3z3XI0gOydKSEI=;
        b=GJ3L9GmDR7IfxZK6kKCCL8HMkZi/7xAhN2UsBjaxNwqdflPmdpqM1zmLUXQDWA91fM
         UM5hq7Pi2T/DRKiooOx8o63DZsJ8siC5XMzkRUXXtyj/WhFu+CcUHleb0cXMjHsXMoHe
         ZALtWhH4tpdIRnlwyJaC9eQqSk6lQJlP+FDW3erHPWqBDy2V/7HZAcHLWeUFxTEzIMPU
         UBELNm694gz5CfV6oDSOj78JlLsU7zkPDYKIbuJyM+Z8NqRoQn6gnWnddHKWG6d3dzSF
         pQzpBsxQ/GAOFB6DEpxkwTFvF/hBsggITHgOW31NwP7hiVMnDqQEh1h9yy8MdVpB/Evn
         sGiQ==
X-Gm-Message-State: AOJu0Yyw4xhjGBzEsUOQnL5mQKJGpWSHq0YBWgQL9n2Yi1L2Ur2j1eF7
	L5SXxXMMWr0+t6p6g0Z20VBMPLlSYz7e1Tox
X-Google-Smtp-Source: AGHT+IFKUbzd4ecP28gaTWgAI0jnNxOVp9oueGbDldM4JPQ5uZIegpdTaJtARzMAyFP4nZRer9jpnQ==
X-Received: by 2002:a05:600c:500e:b0:40e:47c2:1b5a with SMTP id n14-20020a05600c500e00b0040e47c21b5amr860534wmr.4.1704916476525;
        Wed, 10 Jan 2024 11:54:36 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan (vau06-h02-176-184-43-236.dsl.sta.abo.bbox.fr. [176.184.43.236])
        by smtp.gmail.com with ESMTPSA id fc19-20020a05600c525300b0040d839e7bb3sm3267484wmb.19.2024.01.10.11.54.34
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 10 Jan 2024 11:54:36 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
	qemu-arm@nongnu.org,
	Kevin Wolf <kwolf@redhat.com>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Radoslaw Biernacki <rad@semihalf.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Leif Lindholm <quic_llindhol@quicinc.com>,
	Rob Herring <robh@kernel.org>,
	Markus Armbruster <armbru@redhat.com>,
	Alistair Francis <alistair@alistair23.me>,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v3 09/14] hw/arm: Prefer arm_feature(EL2) over object_property_find(has_el2)
Date: Wed, 10 Jan 2024 20:53:23 +0100
Message-ID: <20240110195329.3995-10-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240110195329.3995-1-philmd@linaro.org>
References: <20240110195329.3995-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: X8UqNKdwTPI6

The "has_el2" property is added to ARMCPU when the
ARM_FEATURE_EL2 feature is available. Rather than
checking whether the QOM property is present, directly
check the feature.

Suggested-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/vexpress.c  | 3 ++-
 hw/arm/virt.c      | 2 +-
 hw/cpu/a15mpcore.c | 9 ++++++---
 3 files changed, 9 insertions(+), 5 deletions(-)

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
index afe3897901..7e456375e3 100644
--- a/hw/cpu/a15mpcore.c
+++ b/hw/cpu/a15mpcore.c
@@ -74,9 +74,12 @@ static void a15mp_priv_realize(DeviceState *dev, Error **errp)
                                                        &error_abort));
         }
         /* Similarly for virtualization support */
-        has_el2 = object_property_find(cpuobj, "has_el2") &&
-            object_property_get_bool(cpuobj, "has_el2", &error_abort);
-        qdev_prop_set_bit(gicdev, "has-virtualization-extensions", has_el2);
+        has_el2 = arm_feature(cpu_env(cpu), ARM_FEATURE_EL2);
+        if (has_el2) {
+            qdev_prop_set_bit(gicdev, "has-virtualization-extensions",
+                              object_property_get_bool(cpuobj, "has_el2",
+                                                       &error_abort));
+        }
     }
 
     if (!sysbus_realize(SYS_BUS_DEVICE(&s->gic), errp)) {
-- 
2.41.0
