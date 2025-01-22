Received: by 2002:a17:505:840b:b0:1be9:327d:8ee3 with SMTP id lq11csp654948njc;
        Wed, 22 Jan 2025 01:31:13 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWdFKuWBqkwShnghLmszG6pdDn0gD3GwBXx+j4pfHD43qf7HUIDj3UtfzkWMmJ/vsajRerFTvOdQKKI5A==@linaro.org
X-Received: by 2002:a05:600c:154a:b0:434:ffb2:f9cf with SMTP id 5b1f17b1804b1-438919067ecmr180231795e9.14.1737538272746;
        Wed, 22 Jan 2025 01:31:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737538272; cv=none;
        d=google.com; s=arc-20240605;
        b=Jc+PNZJoOZ0S1WGD14ggWO8hvktMAffl6CJg8ozOWofbkvWO8IfT0002HFSA3rGf9j
         WPFdObKyPLPr9veR+eRPtLAgWHfN7mzmmahDjU7M0XNTU3tziuJxdS2xNLztE9TasHWr
         anbOORsV77NQS9DX72uAfmJlcL0mQKsz+2GRKOrxE1LBfV2pJG8s2ii/9x967WKSO1zX
         6OVgWQSib9yXJLTP+rxpYgg7s+O14VqSunEkJ+bUje/fyr/k2bRDNAgcq6en5g9xXgjF
         3td7Xj+s829Z8dLZlQNFXmaxvP4J2EmQ/WVfSthaKPOfgeyIlFZ7V7byxRE8p+FEgI2W
         q2CQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=XAK8+ZcQI8PZXdkgjSlPlEy1wFV5KzZpV4Si9c0ft5M=;
        fh=K7eRoitXhLxVrxp5sBEmJ1p+j5ZkNJm/TcJAZRgyAZA=;
        b=CtwxARoE2HGTDoOX7I74sMIOwgFctvJcvMjrocxmmbIL7ppC09cVJg8w2MCZwlIjNR
         07JAJCrojQHE4qBWTExG5+aek44ji00/YQYZwalttlE4qI36pcKe+4pd0Wgly+6TMx2q
         N2tPstAdmkrg7YHBtmFPhnvkd3sIn1JVkY9vkBoCyKhykWhXDWoZO6blSUxvCgF84GDU
         E4F1sTkQXismDwjRhb3etHyifyb3WwJy9zfbRhxdoJQNwQM3SGZ5m0WcNl05E60kyWUH
         D4RYYw3/n+vzN/bRnzH7uAz7MLsQ2EGz3TtYHOjGak70j+Tk0QgLDnP2Vhixx13VE3Bz
         nmkw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VyL1TPY5;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-38c1d1ada5esor251856f8f.5.2025.01.22.01.31.12
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 22 Jan 2025 01:31:12 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VyL1TPY5;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737538272; x=1738143072; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XAK8+ZcQI8PZXdkgjSlPlEy1wFV5KzZpV4Si9c0ft5M=;
        b=VyL1TPY5DZbAdUSzy4KeJwOjrgOKLJaIDp8xLZdWs+zGPXqtwbWGj5SO6dJRmu6/73
         YWx6xLL8Cu6+39XXtSKkR64EV08LLrxzSLttBc/BGGp7R3jzX8V9ihUs+8MKYY8pANRH
         kjeC81Xg22yTQatmcL27C5VqfpRndiYF9sSreXHKB5Tg1UJropfgo08C+eSKztRyN6iO
         KwyW5KUeqzYRAVDq7dpymIR3rzNNz2zSEMklCdA9HoBv7kdOF6wI17BR+9QKRQq4eyz8
         oWCFoCWNcN4rwE9onShlf0MI4eiTHl/GpNsZ7PlLqCovevIGvfy1nyug89m1b7cgQryA
         /uKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737538272; x=1738143072;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XAK8+ZcQI8PZXdkgjSlPlEy1wFV5KzZpV4Si9c0ft5M=;
        b=D+ZcQzPWtBZZKtSrMUQE/PCzchmsjRJUHmPpA4qetZhQix3ZmfRSnZfLGm96C5E7mE
         niG18Cy+EDi65eHKewOAVBCtDrDFC+1Zgq8NjQQXJ8sAkkhoNZn94llf/0Ug+yMbGEvf
         w2p676i9Q7HNa7LXqSkCtVrEQEDrG8IOzWZGjX5Z1GUXwLn6L8fJDhA9d26+KjA4BXzd
         u4sKaMKJVTAqTztc0GIsUpKrQnmzvG7wWRZ4pXlnt4NyvMwH0bvSrLNgcSsj00aKVBoA
         bFKBfasV0J2wKwXHpb5k0f5MJ4fY4b9mLhkuXNqpJ5EiBDKXQZfdnmFPUhC4xrOlTxD5
         Zezg==
X-Forwarded-Encrypted: i=1; AJvYcCXi4szscxglKLYyErtlez2dERuTdsR3ovpLMJD5yx6DWtKhl9UxjrrcG9lI9TC4iZKyVwoZKOTVnQorFQ==@linaro.org
X-Gm-Message-State: AOJu0YxVhWINDpiFXIj7KHpzbs0zj5sJTjCkMRwWZ0GobgOTPrvvb+6L
	dt8JyrLegGAlrBObooynof+08H1Tesvnd9oJ2+hBAUdjLfy+umGiVY+Bcj/relR8Fg==
X-Gm-Gg: ASbGncsK8y70Wt1V9DoBRWWPQRiUaulziIvU4zn3wDzzjOWPHUrQRDFoO061TDPtWJc
	yNVCpNPmaKjwAAQXPCwZyrUOfU7VxWgeINJYQdQBdaChP4tWJBPUuxrISUFEAPZIP+muzW5ulu5
	9bELcALpSKonedn6O63/UCyBb6kt/hO7bVSfAvoZQbM/OXYOInzLQZPbQW6gfRAGbB50uECGPmf
	vHDiUdFnR0CkxAs/W+b1W9TG8aZap1lWv0Bj1F1FzlB3Xmbrgbx4FSrj6MIfJYSRHwKK1gmPhK+
	JIOeoM4KPK3HK/q7/awxVTrczJC7lAGdDU4CitlK5U06
X-Google-Smtp-Source: AGHT+IFai9mD8GltFAw7gxPrREpzrvJjo+UMSvD2ijZjgbzRv5dMrin2AUgKp4k7hnSrJKSzVAnRdw==
X-Received: by 2002:a5d:64e6:0:b0:381:ed32:d604 with SMTP id ffacd0b85a97d-38bf5ad3a71mr16765849f8f.10.1737538271919;
        Wed, 22 Jan 2025 01:31:11 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38bf322a414sm15660432f8f.47.2025.01.22.01.31.11
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 22 Jan 2025 01:31:11 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 09/10] hw/acpi: Prefer cached CpuClass over CPU_GET_CLASS() macro
Date: Wed, 22 Jan 2025 10:30:27 +0100
Message-ID: <20250122093028.52416-10-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250122093028.52416-1-philmd@linaro.org>
References: <20250122093028.52416-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: cp3PkzRiCptZ

CpuState caches its CPUClass since commit 6fbdff87062
("cpu: cache CPUClass in CPUState for hot code paths"),
use it.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 hw/acpi/cpu.c         | 4 ++--
 hw/acpi/cpu_hotplug.c | 3 +--
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/hw/acpi/cpu.c b/hw/acpi/cpu.c
index f70a2c045e1..6f1ae79edbf 100644
--- a/hw/acpi/cpu.c
+++ b/hw/acpi/cpu.c
@@ -235,8 +235,8 @@ void cpu_hotplug_hw_init(MemoryRegion *as, Object *owner,
 
 static AcpiCpuStatus *get_cpu_status(CPUHotplugState *cpu_st, DeviceState *dev)
 {
-    CPUClass *k = CPU_GET_CLASS(dev);
-    uint64_t cpu_arch_id = k->get_arch_id(CPU(dev));
+    CPUState *cpu = CPU(dev);
+    uint64_t cpu_arch_id = cpu->cc->get_arch_id(cpu);
     int i;
 
     for (i = 0; i < cpu_st->dev_count; i++) {
diff --git a/hw/acpi/cpu_hotplug.c b/hw/acpi/cpu_hotplug.c
index 83b8bc5deb8..aa0e1e3efa5 100644
--- a/hw/acpi/cpu_hotplug.c
+++ b/hw/acpi/cpu_hotplug.c
@@ -62,10 +62,9 @@ static const MemoryRegionOps AcpiCpuHotplug_ops = {
 static void acpi_set_cpu_present_bit(AcpiCpuHotplug *g, CPUState *cpu,
                                      bool *swtchd_to_modern)
 {
-    CPUClass *k = CPU_GET_CLASS(cpu);
     int64_t cpu_id;
 
-    cpu_id = k->get_arch_id(cpu);
+    cpu_id = cpu->cc->get_arch_id(cpu);
     if ((cpu_id / 8) >= ACPI_GPE_PROC_LEN) {
         object_property_set_bool(g->device, "cpu-hotplug-legacy", false,
                                  &error_abort);
-- 
2.47.1
