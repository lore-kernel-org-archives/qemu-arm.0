Received: by 2002:a17:906:3119:b0:a04:79f0:9a0e with SMTP id 25csp533404ejx;
        Wed, 22 Nov 2023 10:31:49 -0800 (PST)
X-Received: by 2002:a05:6000:b88:b0:317:393f:8633 with SMTP id dl8-20020a0560000b8800b00317393f8633mr1858221wrb.58.1700677909552;
        Wed, 22 Nov 2023 10:31:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700677909; cv=none;
        d=google.com; s=arc-20160816;
        b=gGHemZtyiC3IsUbpt4boMufklLg8Gi/P6wNnFcPzaAVdRNGgCWC8sgBws2vl8RNXRV
         B/iQ103QNbSS8hwkYnivKR+JMXaGDhTPL4RLfJHW9+RgJyFvaBtFiXQi3z4ur1wmfV7X
         7kDZPXgoaIplEGn/b5s/D4U13V0/Lj903lX4/lHSifVURTdmHNthlWdZajQ22r4qkDcA
         1B7XoVpWjWVDoLE+kCG4nJLPprrpZfJ7TSNgyjM/ioGIeDK6QSMjR2IXbrNPsuujHmK0
         tTUFWMb6zd1ELWQMCV8zG45E30leYaWwrSdoq3PW34e54dyymS2z8dZm7dvKmtDS+YP9
         5i6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=G9IPEOr0rBXMMdMMcbayFM6zic8FKV6LVlnxUz4MJGo=;
        fh=aTzmneatFEDiKMS1saCdxZb39+p//OutFupiUjvLGTw=;
        b=Hn5SQ7KLoYVkOtjknHKv0XEuzfbBoa5GeUA9AsEWZuw/Ybhy6+oXfKtrzW9LX+4yRk
         X1LlBjXIP53qgOkoQT1Fiyx5VDshpC/YWQHloWGCU5m20TMy5M8b9t8mqJjptZlDk5zg
         U9AjKuMq9jspcg68cqbBJZjE1tkSCKfTwWYtzE6tyxwDqxWiL7ciQfEGm9dJ5BkfoDit
         2R5c8ETdzWlwLVD8oa4cq9gaMOQureCA77dMQgsYv9mU0SUAIK+X1TBlkku8syb2ApHM
         8r2LOM3dE5NgLSUAB8Iyp3VMkAdgh5E5wOs6FaiAWgfznyDxx8t8YratTLXDHZhtXsRy
         +Vdw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FOGceByS;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id p17-20020adf9d91000000b0032fb410ca34sor12896wre.1.2023.11.22.10.31.49
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 22 Nov 2023 10:31:49 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FOGceByS;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700677909; x=1701282709; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G9IPEOr0rBXMMdMMcbayFM6zic8FKV6LVlnxUz4MJGo=;
        b=FOGceBySEewZcZ29tYElV8LldFDnMgr2Ev3dd1nvIbBaeoC8PfCA90A9yYp1Q96PbP
         brn1gIrF5aiay5SKJWhN8l76OPNzF6DzXdnQHoqHugKVGRQDGREAmWogLpJ2/qb/bJ7J
         ONKoxiFH1Xfk2NBypAbbC/4SXMG2ufxzU6mlKUqFStdA855aKx8XpULGOM1fvlDs0lS8
         ceDWzLOV3CwEgj7s4aKDsDHuhHmYVS3AuavuH5ALsZNuxqi+9h7FPBSyGb6WcumZMk0h
         wj9PM9Sj8krk2jT5rAZ+BaDzmAh8k88U2H1l9Uc5maeuWA6klVyyahotx/XM1kiGtU7a
         +wOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700677909; x=1701282709;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G9IPEOr0rBXMMdMMcbayFM6zic8FKV6LVlnxUz4MJGo=;
        b=PlupiBskBsHB8EPMQyYd8FcVWoGsfLnHJRPcA0P/jRiaq3qBhPU7yB1+kBhzry6uhi
         KRMhh9KmZhu69cMbIHtaJt/1TIDEZoyqGAxY8NWqU3scEdXVUhzaOnKtuxBxPOUpFBJT
         o1vlbppBrxqMpQiazm4nKibSwCcMmeitUa0HZ72cna+eGY5m7K+QcmgwZGV65US3jWrK
         ztLCUsdu0HARkkbUAQq18ZBFDk2L5tgMZkhu0FtevllD5lQKT5hxv2SIWltyunGIZJr8
         xeqNRcC3A24hhYYB3RsqDeu+MdoCxHheCElQ2qyZ7obKKr3YNR19ghftxyGf8IFHQa4Y
         iN+g==
X-Gm-Message-State: AOJu0YzHubIjtzMPI53fkWyGzIrPU/2R7bBodz6xDWBv+mons8urCcEz
	wYXLEZTgbd/JVCii1Ut3vzkBzKpv
X-Google-Smtp-Source: AGHT+IH5oUX5HGY8Tyq5COBq6B13fWkNiw9fUgbBMXCor3h0U1nUKnPUvYvsxmr+d4l3j0e+BaAyXw==
X-Received: by 2002:a5d:6c6d:0:b0:332:ca1a:a824 with SMTP id r13-20020a5d6c6d000000b00332ca1aa824mr3142903wrz.11.1700677909262;
        Wed, 22 Nov 2023 10:31:49 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan (pas38-h02-176-184-5-64.dsl.sta.abo.bbox.fr. [176.184.5.64])
        by smtp.gmail.com with ESMTPSA id d11-20020adfa40b000000b003232380ffd7sm38237wra.102.2023.11.22.10.31.48
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 22 Nov 2023 10:31:48 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Eduardo Habkost <eduardo@habkost.net>,
	Peter Maydell <peter.maydell@linaro.org>,
	Thomas Huth <thuth@redhat.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [RFC PATCH-for-9.0 11/11] hw/intc/meson: Simplify how arm_gicv3_kvm.o objects are built
Date: Wed, 22 Nov 2023 19:30:47 +0100
Message-ID: <20231122183048.17150-12-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231122183048.17150-1-philmd@linaro.org>
References: <20231122183048.17150-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: HXI2YnxBaAgx

Use the target_aarch64_available() to build the ARM_GIC_KVM types
regardless the ARM/AARCH64 targets are selected, but restrict its
registration to TARGET_AARCH64 presence at runtime.

This will help to have a single binary running both ARM/Aarch64.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/intc/arm_gicv3_its_kvm.c | 1 +
 hw/intc/arm_gicv3_kvm.c     | 1 +
 hw/intc/meson.build         | 6 ++++--
 3 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/hw/intc/arm_gicv3_its_kvm.c b/hw/intc/arm_gicv3_its_kvm.c
index f7df602cff..b3063c4cd7 100644
--- a/hw/intc/arm_gicv3_its_kvm.c
+++ b/hw/intc/arm_gicv3_its_kvm.c
@@ -261,6 +261,7 @@ static const TypeInfo kvm_arm_its_info = {
     .instance_size = sizeof(GICv3ITSState),
     .class_init = kvm_arm_its_class_init,
     .class_size = sizeof(KVMARMITSClass),
+    .can_register = target_aarch64_available,
 };
 
 static void kvm_arm_its_register_types(void)
diff --git a/hw/intc/arm_gicv3_kvm.c b/hw/intc/arm_gicv3_kvm.c
index 77eb37e131..33321dee5d 100644
--- a/hw/intc/arm_gicv3_kvm.c
+++ b/hw/intc/arm_gicv3_kvm.c
@@ -909,6 +909,7 @@ static const TypeInfo kvm_arm_gicv3_info = {
     .instance_size = sizeof(GICv3State),
     .class_init = kvm_arm_gicv3_class_init,
     .class_size = sizeof(KVMARMGICv3Class),
+    .can_register = target_aarch64_available,
 };
 
 static void kvm_arm_gicv3_register_types(void)
diff --git a/hw/intc/meson.build b/hw/intc/meson.build
index ed355941d1..d45eb76f36 100644
--- a/hw/intc/meson.build
+++ b/hw/intc/meson.build
@@ -40,8 +40,10 @@ endif
 specific_ss.add(when: 'CONFIG_APIC', if_true: files('apic.c', 'apic_common.c'))
 specific_ss.add(when: 'CONFIG_ARM_GIC', if_true: files('arm_gicv3_cpuif_common.c'))
 specific_ss.add(when: 'CONFIG_ARM_GICV3_TCG', if_true: files('arm_gicv3_cpuif.c'))
-specific_ss.add(when: 'CONFIG_ARM_GIC_KVM', if_true: files('arm_gic_kvm.c'))
-specific_ss.add(when: ['CONFIG_ARM_GIC_KVM', 'TARGET_AARCH64'], if_true: files('arm_gicv3_kvm.c', 'arm_gicv3_its_kvm.c'))
+specific_ss.add(when: 'CONFIG_ARM_GIC_KVM', if_true: files(
+  'arm_gic_kvm.c',
+  'arm_gicv3_kvm.c',
+  'arm_gicv3_its_kvm.c'))
 specific_ss.add(when: 'CONFIG_ARM_V7M', if_true: files('armv7m_nvic.c'))
 specific_ss.add(when: 'CONFIG_GRLIB', if_true: files('grlib_irqmp.c'))
 specific_ss.add(when: 'CONFIG_IOAPIC', if_true: files('ioapic.c'))
-- 
2.41.0
