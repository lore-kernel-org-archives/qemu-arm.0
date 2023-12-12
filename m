Received: by 2002:a17:906:535b:b0:a20:43fc:1f40 with SMTP id j27csp1026416ejo;
        Tue, 12 Dec 2023 08:32:14 -0800 (PST)
X-Received: by 2002:a7b:ca4a:0:b0:40c:3cc0:8612 with SMTP id m10-20020a7bca4a000000b0040c3cc08612mr3073524wml.94.1702398733955;
        Tue, 12 Dec 2023 08:32:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702398733; cv=none;
        d=google.com; s=arc-20160816;
        b=snMEgFe6Nm4/mKbKzJAFnoiUTr0Riv4FcGTEI6oWGSZNrnG/PmL54JyRnoCcQ4UnIj
         fLzDJ9XPUpiCfDNcNICHQPGwAHn8gEj28t6LVP5r9qBiaDANwtiFn8pNZr1dyMNO/7CN
         yOSd9NR04R5SLgvuuIPFsi6ygLt4Pa48jq7hyviQIJ5zEbBbn6W0nKsMFaoAhqx6UHut
         eu4ydSXn1cDPjsoP1cxx5/Fu4wLp8OPTMAFIYifpfuzbWzUrriiHqeeTxitaIEo9YohL
         h+XE00LD7A/Q6OMc5l2PDLPT0Uo4FFIn+BmNTFXp33/1Bf7fNEbJyGolwT7lqZZXHqPq
         nuFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=LPUJ99e93udkPbt97Gx+2JACKyskq6RNq0t/1l6oyqU=;
        fh=CkupYgn1Qmdh7jizui9HJgGegpqbRR5NXz1VyjRE1Hs=;
        b=LKluM5LNRndVt0AZ/H5p71d/sOp7eXR9+Vr5pM9q0kOnl7xtX27xt3Kf825utc489J
         +aMZpfH0LFm3Yl2iCEAmzkJKFaTWZL/HZWG32MfPb0LhonwWmCP6RyGsHSWvRUblnZIN
         msVtfBBAZ1E8PTRYEF5E6G2wRV6vGta/V85PXfMCOHo/d77BRSb6B16v/DjdcmdtrnZs
         G8KwXcVyuvYdwlydsgzoCa+eq8thOjOqXTz3W5h4AVEKuAS7vuG/M8jEN0cjFqCEVWMD
         n7J0Skkc9r7/+syXdBXcMWtfIkhCkrs0tw170THwZ/hAC98dz9mey16+eMnopz8HTLB0
         HvtA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="GDy/GpHZ";
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id l17-20020adfe9d1000000b0033630b7e5efsor422081wrn.1.2023.12.12.08.32.13
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 12 Dec 2023 08:32:13 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="GDy/GpHZ";
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702398733; x=1703003533; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LPUJ99e93udkPbt97Gx+2JACKyskq6RNq0t/1l6oyqU=;
        b=GDy/GpHZBtupnM1POzND01Z/76CoJ5gOe8+/SMRqyFKIRtoN+4LnY8Kf3TkScyhndu
         F+0fOMI1ZVdGkAv8XiX+6BqbFaaYpwJvHy2Ftg87GW+zTqE8ubjwDjS9/SufsaRRfopy
         0HAwWOiod8OIpo32Zk0uvrHbfMpddHL+H37e1f4U381jh3v2UCdRkqecvUUfKB512JhV
         d5Wikoip/HeRFHI8nWYFZ95UoPfWGZfFmuo6SEORalo/QpL7qyRJvjNcI9kawLFzU6bP
         iF7f4ARIgHiuWiD/Ga3I6ss3HiN0eqruIboCJM2yNRs1A4g716ZjwT5LD9mFemf+BupA
         lgSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702398733; x=1703003533;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LPUJ99e93udkPbt97Gx+2JACKyskq6RNq0t/1l6oyqU=;
        b=BlEddhgYJsLxfH4vWSb+W4ikdS9cil7zPHJABES0iF1KYd6xzxOf5svjTFOb1TuhCd
         2Gv66ZLdN0bXInqpqu9O5abc+99ZevnS3VzsShAGdQcSY0DnqSjh7pZMH3+gyGrsqjG9
         +9rI7lm3R8PsPNZrQ2VG/dNubarlHQZyH9CGbYUgzWvotoYcqRuAumgOb8hwYHZo/1Nq
         GUDLixmzIkUAdvqbM2oZqqohGB3CDyC7Su2RkTch4duY1Ma5NNSwxEy/6TY8MgyR0m2g
         vwloqnpqrUqKNWsNVcByE3tot6AWLvC/JtjkjtGFJfMwupiR5PjLfcqHzUDH3xrYpzU4
         LxKA==
X-Gm-Message-State: AOJu0YyKS/tL4VA1uDiZMyP3GsNHhgqKi9m+1XDbeYKhBykkD7mm0Jt5
	U2XEtZSWxVdUa8hMXuR/2Xn7mWMB
X-Google-Smtp-Source: AGHT+IEps7EKdkb5++jvaAQDg+UtZgye8JE+a9Lp+BPfBbHaJAf6QR1LQY67ntXlsyC85fmm0qc8CA==
X-Received: by 2002:adf:ffc8:0:b0:336:3555:346d with SMTP id x8-20020adfffc8000000b003363555346dmr608972wrs.13.1702398733539;
        Tue, 12 Dec 2023 08:32:13 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan ([176.176.175.193])
        by smtp.gmail.com with ESMTPSA id b12-20020adff90c000000b00333359b522dsm11213469wrr.77.2023.12.12.08.32.11
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 12 Dec 2023 08:32:13 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	Tyrone Ting <kfting@nuvoton.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
	Eduardo Habkost <eduardo@habkost.net>,
	Joel Stanley <joel@jms.id.au>,
	Alistair Francis <alistair@alistair23.me>,
	Anton Johansson <anjo@rev.ng>,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Hao Wu <wuhaotsh@google.com>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Jean-Christophe Dubois <jcd@tribudubois.net>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Rob Herring <robh@kernel.org>,
	qemu-arm@nongnu.org,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 21/33] hw/cpu/arm: Create CPUs once in MPCore parent
Date: Tue, 12 Dec 2023 17:29:21 +0100
Message-ID: <20231212162935.42910-22-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231212162935.42910-1-philmd@linaro.org>
References: <20231212162935.42910-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: F4DQbM1OR6Cy

Add support for creating the MPCore CPU cluster in the
abstract TYPE_CORTEX_MPCORE_PRIV parent realize() handler.

Only do so if the 'cpu-type' property is set, so current
behavior is not modified. Boards will be converted by
setting this property.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/cpu/cortex_mpcore.h | 12 +++++
 hw/cpu/cortex_mpcore.c         | 88 ++++++++++++++++++++++++++++++++++
 2 files changed, 100 insertions(+)

diff --git a/include/hw/cpu/cortex_mpcore.h b/include/hw/cpu/cortex_mpcore.h
index 4e1aa9f7f7..9a4fc2404e 100644
--- a/include/hw/cpu/cortex_mpcore.h
+++ b/include/hw/cpu/cortex_mpcore.h
@@ -16,6 +16,7 @@
 #include "hw/misc/a9scu.h"
 #include "hw/timer/a9gtimer.h"
 #include "hw/timer/arm_mptimer.h"
+#include "target/arm/cpu-qom.h"
 
 /*
  * This is a model of the Arm Cortex-A MPCore family of hardware.
@@ -93,13 +94,24 @@ struct CortexMPPrivState {
     SysBusDevice parent_obj;
 
     MemoryRegion container;
+    ARMCPU *cpu[4];
     GICState gic;
 
     /* Properties */
+    uint8_t cluster_id;
     uint32_t num_cores;
 
+    char *cpu_type;
     bool cpu_has_el3;
     bool cpu_has_el2;
+    bool cpu_has_vfp_d32;
+    bool cpu_has_neon;
+    uint64_t cpu_freq_hz;
+    uint64_t cpu_midr;
+    uint32_t cpu_psci_conduit;
+    uint64_t cpu_reset_cbar;
+    bool cpu_reset_hivecs;
+    MemoryRegion *cpu_memory;
 
     uint32_t gic_spi_num;
 };
diff --git a/hw/cpu/cortex_mpcore.c b/hw/cpu/cortex_mpcore.c
index 75324268fa..65309636d7 100644
--- a/hw/cpu/cortex_mpcore.c
+++ b/hw/cpu/cortex_mpcore.c
@@ -12,6 +12,7 @@
 #include "hw/cpu/cortex_mpcore.h"
 #include "hw/irq.h"
 #include "sysemu/kvm.h"
+#include "target/arm/cpu.h"
 
 static void cortex_mpcore_priv_set_irq(void *opaque, int irq, int level)
 {
@@ -50,6 +51,12 @@ static void cortex_mpcore_priv_realize(DeviceState *dev, Error **errp)
         return;
     }
 
+    if (s->num_cores > ARRAY_SIZE(s->cpu)) {
+        error_setg(errp,
+                   "At most %zu CPU cores are supported", ARRAY_SIZE(s->cpu));
+        return;
+    }
+
     qdev_prop_set_uint32(gicdev, "num-cpu", s->num_cores);
     qdev_prop_set_uint32(gicdev, "num-irq", s->gic_spi_num);
     if (k->gic_priority_bits) {
@@ -75,14 +82,95 @@ static void cortex_mpcore_priv_realize(DeviceState *dev, Error **errp)
 
     /* Pass through inbound GPIO lines to the GIC */
     qdev_init_gpio_in(dev, cortex_mpcore_priv_set_irq, s->gic_spi_num - 32);
+
+
+    /* CPU */
+    if (!s->cpu_type) {
+        return;
+    }
+    for (int i = 0; i < s->num_cores; i++) {
+        Object *cpuobj;
+
+        cpuobj = object_new(s->cpu_type);
+        object_property_add_child(OBJECT(dev), "cpu[*]", OBJECT(cpuobj));
+        object_unref(cpuobj);
+        s->cpu[i] = ARM_CPU(cpuobj);
+
+        object_property_set_bool(cpuobj, "neon", s->cpu_has_neon,
+                                &error_abort);
+        object_property_set_bool(cpuobj, "vfp-d32", s->cpu_has_vfp_d32,
+                                &error_abort);
+        if (object_property_find(cpuobj, "has_el3")) {
+            object_property_set_bool(cpuobj, "has_el3", s->cpu_has_el3,
+                                     &error_abort);
+        }
+        if (object_property_find(cpuobj, "has_el2")) {
+            object_property_set_bool(cpuobj, "has_el2", s->cpu_has_el2,
+                                     &error_abort);
+        }
+        if (s->cpu_freq_hz) {
+            object_property_set_int(cpuobj, "cntfrq", s->cpu_freq_hz,
+                                    &error_abort);
+        }
+        object_property_set_int(cpuobj, "midr", s->cpu_midr, &error_abort);
+        object_property_set_bool(cpuobj, "reset-hivecs", s->cpu_reset_hivecs,
+                                 &error_abort);
+        if (s->num_cores == 1) {
+            /* On uniprocessor, the CBAR is set to 0 */
+        } else if (object_property_find(cpuobj, "reset-cbar")) {
+            object_property_set_int(cpuobj, "reset-cbar",
+                                    s->cpu_reset_cbar, &error_abort);
+        }
+        if (i > 0) {
+            /*
+             * Secondary CPUs start in powered-down state (and can be
+             * powered up via the SRC system reset controller)
+             */
+            object_property_set_bool(cpuobj, "start-powered-off", true,
+                                     &error_abort);
+        }
+        if (s->cluster_id) {
+            object_property_set_int(cpuobj, "mp-affinity",
+                                    (s->cluster_id << ARM_AFF1_SHIFT) | i,
+                                    &error_abort);
+        } else {
+            object_property_set_int(cpuobj, "mp-affinity",
+                                    arm_cpu_mp_affinity(i, s->num_cores),
+                                    &error_abort);
+        }
+        object_property_set_int(cpuobj, "psci-conduit",
+                                s->cpu_psci_conduit, &error_abort);
+        if (s->cpu_memory) {
+            object_property_set_link(cpuobj, "memory",
+                                     OBJECT(s->cpu_memory), &error_abort);
+        }
+
+        if (!qdev_realize(DEVICE(s->cpu[i]), NULL, errp)) {
+            return;
+        }
+    }
 }
 
 static Property cortex_mpcore_priv_properties[] = {
+    DEFINE_PROP_UINT8("cluster-id", CortexMPPrivState, cluster_id, 0),
     DEFINE_PROP_UINT32("num-cores", CortexMPPrivState, num_cores, 1),
     DEFINE_PROP_UINT32("num-cpu", CortexMPPrivState, num_cores, 1), /* alias */
 
+    DEFINE_PROP_STRING("cpu-type", CortexMPPrivState, cpu_type),
     DEFINE_PROP_BOOL("cpu-has-el3", CortexMPPrivState, cpu_has_el3, true),
     DEFINE_PROP_BOOL("cpu-has-el2", CortexMPPrivState, cpu_has_el2, false),
+    DEFINE_PROP_BOOL("cpu-has-vfp-d32", CortexMPPrivState, cpu_has_vfp_d32,
+                     true),
+    DEFINE_PROP_BOOL("cpu-has-neon", CortexMPPrivState, cpu_has_neon, true),
+    DEFINE_PROP_UINT64("cpu-freq-hz", CortexMPPrivState, cpu_freq_hz, 0),
+    DEFINE_PROP_UINT64("cpu-midr", CortexMPPrivState, cpu_midr, 0),
+    DEFINE_PROP_UINT32("cpu-psci-conduit", CortexMPPrivState, cpu_psci_conduit,
+                       QEMU_PSCI_CONDUIT_DISABLED),
+    DEFINE_PROP_UINT64("cpu-reset-cbar", CortexMPPrivState, cpu_reset_cbar, 0),
+    DEFINE_PROP_BOOL("cpu-reset-hivecs", CortexMPPrivState, cpu_reset_hivecs,
+                     false),
+    DEFINE_PROP_LINK("cpu-memory", CortexMPPrivState, cpu_memory,
+                     TYPE_MEMORY_REGION, MemoryRegion *),
 
     DEFINE_PROP_UINT32("gic-spi-num", CortexMPPrivState, gic_spi_num, 0),
     DEFINE_PROP_UINT32("num-irq", CortexMPPrivState, gic_spi_num, 0), /* alias */
-- 
2.41.0
