Received: by 2002:a17:505:840b:b0:1be9:327d:8ee3 with SMTP id lq11csp24457njc;
        Tue, 21 Jan 2025 03:41:31 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVOGcDfcGWAmePZzPuLm6cVs2TmKq3Mhf/T9xRRol6BOn+3NU3uAQTGfTqjj1Q+0Ci84ubcwANyO0wfNg==@linaro.org
X-Received: by 2002:a05:600c:8712:b0:434:a802:e9a6 with SMTP id 5b1f17b1804b1-438913ce0b7mr165639385e9.7.1737459690921;
        Tue, 21 Jan 2025 03:41:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737459690; cv=none;
        d=google.com; s=arc-20240605;
        b=GAew5t9mfkK8Qh78uOXHZ6elmTdBAb2ltobfFdZDLxSDFizbPCiPhpYUIFaCarRJKf
         /WTouFGDfs3IZFefvU4IXIotErWKzPMZHRkLu39e1cMAKswwF8fuO5BM84NAj28UMftB
         Zrq9H32m6PJdPNRDVTGMLkZpVKMQOq+GL1EXhDdCrhDatisZ/5P1Ul5OlxB+WElNnsHf
         lfVFVbP+UAmn0OqQutGQm1bD4p1Jep6ZLcpbmUB/TsTHdJkdNzAl2gEbe2nbP6nyOsEa
         KVF+IVolGfxNkcXkGr7g28oXnP+vpBcWFhNAx2Ctvisi18spzYMSqTQQgxcdpmrLi+Yf
         3FJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=DeYTxKfeYGnuCZs4uhCLhCH6gP528hwEuAlYwVcOULg=;
        fh=4/kLesX7gzPcpYlcipH6mbTmwT5jQLkvHmFfEmi24Mc=;
        b=CLyPslI/WNW0Uji1GJzd3XORamTa19R0Odwo7hoDzQrKHlNxXta8sH5srX+8XpsHj6
         dM6Zr3pddjaBF62SWRkfF+0Hwbp1XGq/zgP8Bs4UkTKx3JgQFpe5MLbnoV50W/FFTRvn
         UidrbSpxL3fja+PI1ocWItwYGgxVuVV9QBmhwy2lewCzKxBUXNrfcr87zBwkPxmcsV1W
         vuw91VzwdBrFBoi9Oyr+aUopeBjvRC9QHiEMDF7+J+KPzMFS0d0+APi33S+viABPOF5m
         PuB3X0lL0veetgCaN3adcx6aeoZ3zpA19gWe6a+wiskUzuHtSECmkqcdzyORZoVHajkx
         NatA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=a8wX8S+7;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-43890406b86sor45592425e9.2.2025.01.21.03.41.30
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 21 Jan 2025 03:41:30 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=a8wX8S+7;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737459690; x=1738064490; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DeYTxKfeYGnuCZs4uhCLhCH6gP528hwEuAlYwVcOULg=;
        b=a8wX8S+7J1oTxz727ESRNX982uiPf48iI+MY9cSWeBbb8L6HAUYeNOPVoMtJCYz6vf
         ElYgcaOIhsi0Rb9DVKP/qrGphQdTiQ705yhVcHd6Gd+Ce83Xw8rDSGzc+kpDa+kxPOyU
         GwgCxJ4bCX5fqQHMiR13zrLnBUNFN4jCCeabJvaOLwDCzZLJWBevQ6VzNyzS3e88uRxe
         4PCI18z789+URpmuQT6ZxTJYh3wu5aLmZiLsuQD4eF70RcDTV3oVo2J6s3pKJfUCTpX7
         5pq4HmSjSZXvjJrS68BT19dibpjcbrUYZBqiIm6RH5aRCLYUbq1Lhr1k2R+56ciKBAUf
         jCRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737459690; x=1738064490;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DeYTxKfeYGnuCZs4uhCLhCH6gP528hwEuAlYwVcOULg=;
        b=gcmuM16KwY+vy17YlBCQfSQy7UbUrnEw65GIjVqpG8EaFZmx8sfUYlhSVU2BwnbE6y
         VkIm4NzCNsYfPXIFVopBIj3A/lpesqo/xC4VL8aHYO7KEgXb+IORwQ1+2liQjTueSmJd
         1alKd9+C0TlAcgdS8zqgenZj+GGoC43qDlc1o/2lTYdCIvOUgoqMIFPfrf3ZaWZ3Jg6u
         TzvGigMdnvzSEc4+04Z6+BIySBHDC9uwf7mkvVEJJCOfOssNLidaA+X5ELlSeSVKDoF1
         veznuPYXZ5dmL7D59HM5pXF0aWiyso8ZVLXpClowjCpfUNkf0v8r48zfWS2rSZNYE/f4
         t5og==
X-Forwarded-Encrypted: i=1; AJvYcCWRVTGjdIXHzWeaEDhJujTlU5tKOh63NUqNZbe9YlbMxcRS7WPEVK3fsZENlDE0b90iLdM8hE7FmnTebQ==@linaro.org
X-Gm-Message-State: AOJu0YzY1fqyXCGXaJM8OzMd1QKnrrhGirL/s24x9vrF8z7n0S7scnZ5
	iBdvTjLPi0hH6G8/BN3O0Myi9Io6x7BXplLwUnh+SR5jHqBWuNJWIhfGPDfBuUZjCPHL7lykBLI
	6NGNiTg==
X-Gm-Gg: ASbGncsOeexgEXxiRRfutGOJM/GkGEsSsVv4YnFQoRsgGkizJe9btmXTs2bZjrzvGwV
	rl14QfiZ3AFMuizqfp97g4/UsofLorufmUt5vusH7/m+kmneSN1s9JOUesvg6lnDohrjtYwTJmS
	FP8xi0bAWEzRPZRQzYc54M4RwR8azPynwZyOmYi67T6YDOjpWb90EPLQ1z0Vo36DqG/1y6cxXxx
	1LFEIJlOfCcuDAzQ5Vi/Q14MlFrwsPLv2GIVR2RCPO+IgoxK9Ulu84P1z6yX3oqpYmUfWty2NT+
	ZIg/eC3fW+MKVxhEOPm7Mghvg/CWE3g7ziBRGt9mFOnj
X-Google-Smtp-Source: AGHT+IFYePQ7W9qEBZjkBoTzSbXA4iRi/jfN3vePvpN5KZLxmU/7I4ErTsDfpMpd1xt0kQIOxaZvCg==
X-Received: by 2002:a05:600c:6c95:b0:438:a1f5:3e41 with SMTP id 5b1f17b1804b1-438a1f53fa6mr113851535e9.12.1737459690343;
        Tue, 21 Jan 2025 03:41:30 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-437c75290a2sm238291245e9.29.2025.01.21.03.41.29
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 21 Jan 2025 03:41:29 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 07/11] hw/acpi: Prefer cached CpuClass over CPU_GET_CLASS() macro
Date: Tue, 21 Jan 2025 12:40:52 +0100
Message-ID: <20250121114056.53949-8-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250121114056.53949-1-philmd@linaro.org>
References: <20250121114056.53949-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: j5cjytfqMsJ6

CpuState caches its CPUClass since commit 6fbdff87062
("cpu: cache CPUClass in CPUState for hot code paths"),
use it.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
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
