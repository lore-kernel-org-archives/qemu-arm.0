Received: by 2002:a17:504:17d6:b0:1be9:327d:8ee3 with SMTP id o22csp4185532njd;
        Thu, 3 Apr 2025 08:19:32 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV6VAnl0y5G0SkWC5DiohiU7aWO7jhsrXgbT/LjErVQCUblIltN+pxxZdTHh4KXLdaWVKHczWlFC6aC7A==@linaro.org
X-Received: by 2002:a05:600c:1e0f:b0:43b:c284:5bc2 with SMTP id 5b1f17b1804b1-43eb5b8f3bemr80973505e9.0.1743693572248;
        Thu, 03 Apr 2025 08:19:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1743693572; cv=none;
        d=google.com; s=arc-20240605;
        b=Ofpnz1skZPRMcLMKUxSx0FQluCcBOlVt97KVwHXthtxTk2ulhXUz9Izz6HAcJ51qNV
         d+UDb9ilbUR8TROazmD3HIpDC1DJn5lSKZsJspZUCQv5oZdloqu8XZ8REeuv+iruhKbU
         C+0vmm4FeWEGRANOdtXs1pHHvsx6gj0mmBDTXRScP43HK0DKnl3IYVtQ3nFaeqz9RaTp
         1SzEa5sBlWB3Dng/Bzh800Lt0Tebym+++ZFxjHiLho91LFuZgCIco9mbEI3Xm/wayqkd
         GgP2nOnxNqxD8BhZiEYPu3169C8ubsVuC+pcP/wqrr2hasHMEHZLqwrOOGsSCrah47AX
         2guA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=oEde1hNJ4ybKOdNMShnxkmNSbB2tItcMj9l8T50o98M=;
        fh=C7Xat8mPmhEb93vBfNeXSWIj1HaYjboumXjO38ZDFaw=;
        b=P7T/QcBl3JGKEzJGQI+RYCwDrxNoYwsIRtjdiELZ8JPuJwUJJdm6UOybFS8K03KGks
         jVT43ctjmC6h0ClRcmIqVESkGM+vdaajNtdAnHCKVmIHnP6ufBsxhXgEHOLMzH52F6CY
         PZeXxu7czx1NqRP8Iw/4bLNXUx10M0wtLtEXzUQcGkMkEOTRzMbkt3u33K1tpo7cxpGR
         yAVOOIVz9JNH4Q0zgTj1ICgIQ1qxPAXwwVV0RH+YfHnt2ssCch7ST3F9g5lNigIEZAd7
         ImRNKw6vCEFKV0PldilCw+JdqVoIg19yisnA213DB4xUIaiDskwZWL48IHmCwQI+hrS8
         MA4g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Gy9weAr8;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-39c3020e9a9sor637999f8f.8.2025.04.03.08.19.32
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 03 Apr 2025 08:19:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Gy9weAr8;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743693572; x=1744298372; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oEde1hNJ4ybKOdNMShnxkmNSbB2tItcMj9l8T50o98M=;
        b=Gy9weAr8lYKhWHOk3s8aA2KS5+2PWEZI7whGAoS0IQ+FIHUuXGzAqGHyxqXb8orD2L
         mq4Dw6Pphd2j065f23+OJLH5f90lSONfw41Zz5rE6RJUerj3G9gVa2Vu/HiWcDrXNs7w
         ShACMZHwe0Y4MEhQ5yp8MC86xSr/J4P9J6QF2O4J4iWs+yjTDdC+LCjDV/q6JVBqsLkw
         Jiol6nWEUATkovhPy94VRr8ngQMLX7xGwxHZGndqaRYhJT8rGENAMcszD1R3tGzwCXLm
         MDl5YIN/puiOt7Y/HWdHgD1OO1IxucD5DJO1t44wXTr728io7YgN0FSawvhqcH/dMEPt
         XHgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743693572; x=1744298372;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oEde1hNJ4ybKOdNMShnxkmNSbB2tItcMj9l8T50o98M=;
        b=SawapMzSVce2QrBsxu/yU8nL/rGyqSDq1YuB5bbSB62GfTv5Ok55Os/snf3FltmjUb
         YTAxvC8DhFpcrnahuG9MKBbV8kvI/fgWSXfAgOWSYMEHD1LwBRzqd1gxriNGZhdSILTd
         rMWfyMOor7ufljUOK4Xrl+piUTf+GwCiL5oR2U6z/pXj+mXccs/C+Wqh25otw4DxN2iK
         YGDjEPby20LnAaunWMpotMYS+Q5vAbexK0YK9c1c0Ir+GxDsN8B4Dur/Obx8UPYKdXxl
         dsuyHfa5cU9cshe9a9x5K3WfH782ri4HjKcwe5i1wypyK/H7C3SjPgB+MCyAYfb/tvuM
         vFEg==
X-Forwarded-Encrypted: i=1; AJvYcCXDibngSzgVzVXj4iSINNa9QhuBLvIP92r1SffbFimarDhmBnTP6GuNfCAgtiO53tg38tgb3sOScTpVzA==@linaro.org
X-Gm-Message-State: AOJu0YwZYHrYWKmSBRJdRYe/MmyRDmoHfZJoQV1ampIFpRc7NQXkhM+h
	l1mrf25k6uq5VBBDH9d7vqxr//6bsM60CC0I1rkjGsoN0a8zUfR/0GcXB8JUNpf7PQ==
X-Gm-Gg: ASbGncuD4jrlHP3H+Ye24yi4KDbqBRUgUXBlx3gV9FkDkTdKckCxiJiCwc++eKpgtp3
	WlZnEBwTGBv31uoUJOXHajKgd5gjIow5KIQA7HuSMgR2NY0f7rVo6WhZRR87gKF7+WfbSja7mbb
	oGEkOWLGPkiUyWcK4mZlNh7FRVy5ygh5ZCpyHlotsyHG4bJCUsxPgT010rb0CGpK6/U93YWG+Wq
	xcS64Acm24zT2K5BXw7+/0zNFc5XUPBgMhKd4G5tbrf/G8MNgv4WufNYKn4bHZjlde5TGapZFNI
	IAxeBMVmI8MOSCprQvuRNGb1kybCSWkIoNAkzY+GEcrTn0JsKx3NAaJON1qYjJgBBOKjLKjg8+P
	W3GmBFZ79YVdJ0couiu0=
X-Google-Smtp-Source: AGHT+IGHak1E3ibrDVZ9cscoOWpyVwW1ZMFS7IyXWRHqtfLC3ggjOh+OvJZg5UyqHqPgNcMeL0Xf/A==
X-Received: by 2002:a5d:6dad:0:b0:38d:e304:7470 with SMTP id ffacd0b85a97d-39c297675dbmr5712414f8f.25.1743693571608;
        Thu, 03 Apr 2025 08:19:31 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (145.171.88.92.rev.sfr.net. [92.88.171.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c30227e3bsm2042053f8f.100.2025.04.03.08.19.29
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 03 Apr 2025 08:19:30 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Gustavo Romero <gustavo.romero@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Laurent Vivier <lvivier@redhat.com>,
	Ani Sinha <anisinha@redhat.com>,
	Udo Steinberg <udo@hypervisor.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	Igor Mammedov <imammedo@redhat.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Fabiano Rosas <farosas@suse.de>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Shannon Zhao <shannon.zhaosl@gmail.com>
Subject: [PATCH-for-10.0? v2 09/14] hw/arm/virt-acpi: Factor its_enabled() helper out
Date: Thu,  3 Apr 2025 17:18:24 +0200
Message-ID: <20250403151829.44858-10-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250403151829.44858-1-philmd@linaro.org>
References: <20250403151829.44858-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: mmhEUNWvuayA

GIC ITS is checked for the MADT and IORT tables.
Factor the checks out to the its_enabled() helper.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Gustavo Romero <gustavo.romero@linaro.org>
---
 hw/arm/virt-acpi-build.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 9b7fc99f170..1c389ef5cdb 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -208,6 +208,13 @@ static void acpi_dsdt_add_tpm(Aml *scope, VirtMachineState *vms)
 #define ROOT_COMPLEX_ENTRY_SIZE 36
 #define IORT_NODE_OFFSET 48
 
+static bool its_enabled(VirtMachineState *vms)
+{
+    VirtMachineClass *vmc = VIRT_MACHINE_GET_CLASS(vms);
+
+    return !vmc->no_its;
+}
+
 /*
  * Append an ID mapping entry as described by "Table 4 ID mapping format" in
  * "IO Remapping Table System Software on ARM Platforms", Chapter 3.
@@ -670,7 +677,6 @@ static void
 build_madt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
 {
     int i;
-    VirtMachineClass *vmc = VIRT_MACHINE_GET_CLASS(vms);
     const MemMapEntry *memmap = vms->memmap;
     AcpiTable table = { .sig = "APIC", .rev = 4, .oem_id = vms->oem_id,
                         .oem_table_id = vms->oem_table_id };
@@ -741,7 +747,7 @@ build_madt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
                                           memmap[VIRT_HIGH_GIC_REDIST2].size);
         }
 
-        if (!vmc->no_its) {
+        if (its_enabled(vms)) {
             /*
              * ACPI spec, Revision 6.0 Errata A
              * (original 6.0 definition has invalid Length)
@@ -973,7 +979,7 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
                           vms->oem_table_id);
     }
 
-    if (!vmc->no_its) {
+    if (its_enabled(vms)) {
         acpi_add_table(table_offsets, tables_blob);
         build_iort(tables_blob, tables->linker, vms);
     }
-- 
2.47.1
