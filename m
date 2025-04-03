Received: by 2002:a17:504:17d6:b0:1be9:327d:8ee3 with SMTP id o22csp4377048njd;
        Thu, 3 Apr 2025 13:40:53 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXKyz01njveHYDglcY9CcMxOMQ743xMS8h2vFla9ayIYvZAnGQdSF/cOYaLSGjXJaXdZ5wKnDrEImIIxA==@linaro.org
X-Received: by 2002:a05:600c:34c3:b0:43e:b027:479a with SMTP id 5b1f17b1804b1-43ecf8eb71emr5342065e9.16.1743712853763;
        Thu, 03 Apr 2025 13:40:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1743712853; cv=none;
        d=google.com; s=arc-20240605;
        b=OtLOGw4NbmhQxoAj99y1ugoWyzOYeEKFXxX8DT3RtGTfNfRU/JojMr6KH/z5ttR/+T
         M7QQCtzPYkgVYqPxGAz+A8Su8U67znz56XxBHKJy7g1W8Gv8zbMbCuyrnpA0WppZDOHE
         sbYYCrvi4edUYwWKMCmQTn1hc45c9AV+j4XyEtOrWJom5aO5BWHew7kemIMddT1KDZNE
         i+LlrYDSp1RsLai6GMc7xhfRzxDO3Ew9SP+vozECBn4EP2Ef+dckte0DDAZJFAprurCh
         b16WPwfVbgjqCow91KwMYiYRKH58uJME85P5YpDnpYo+VPutPr1aJpCcjlahRRDMsTwc
         yU8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=wgBNy0vxL5goVE1RO7+eU01X51ted55h8TOUfbLYmNA=;
        fh=KXRxqFrIllwTnxjlP8gxJugkFn37wNuVfXnnoxfg5uI=;
        b=E9u0jj/oSMkyRMUKWLh8euSTNi3aaEJ99irvsa0OPpVQF1coEONXI+sbQHpK2N6otw
         Qp8kFV0RN7rX1ScWzU01eMwmG52SVc0hoRqJHbAIk6YHm699SlgCBkYeFL+13KcxuMhR
         BaidwTizVpVGESRrD7iqgNXZhZCF/2udxhqXhcHJhvpMelzYDfcVpb7Dz6YeDTRaQppU
         gg9BkKce5K271db8qh4Qc7Hx24/lyjjMR3/bXkqI8r+/nJm/oxzuDmoscjWaxa3XooCc
         xrcKfxaKQvf/bXP3snal1vUwKZ+doOYlJsbB8yzlDYn3Bbxi476x87xNWVGbZlGjGACg
         0mDQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uP06UPjs;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-39c301a0433sor854385f8f.3.2025.04.03.13.40.53
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 03 Apr 2025 13:40:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uP06UPjs;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743712853; x=1744317653; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wgBNy0vxL5goVE1RO7+eU01X51ted55h8TOUfbLYmNA=;
        b=uP06UPjsc6k68f2zDWBJx44Qmjc8dtMn79eJd4Y8DKoVIfC3EnMTtQmRrc7obV0lEl
         s6tpeIee3lUVhM4WQkOaxgxtXnKnwPHCOtHCSt4ilkOSTELYNFOAbEEglVZQLTYdk4Qb
         D12VbH9E3XasEazf3VUSGrykF1Rlep0J/AXXyDdJTZCvFyJ0DsXejKqtNwvDgIRwPCH7
         U6WLQE/4+LubjxpUxoxKP+6O74NA6vh9Myvq1Ntg4FnsX5LLuwhBoxEbm/j+LVL3hIWm
         7xO99opKQY1dd1Y6no5TH77feeX17XNqzODfsb9HVLIhr6mlEFgXDzV3+zJBc2uQ3muV
         ADRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743712853; x=1744317653;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wgBNy0vxL5goVE1RO7+eU01X51ted55h8TOUfbLYmNA=;
        b=KCskn/BPUGmzycqAoLfcB3t2rjZKqw59FkJcvfArscobeV84q0XZcCyuSpro74WOlC
         JGqhpFnpNhDhVk7sngsLRnkbbtkX6uy/S9bUwvDfO/AUdb0r2qJ9wgO6VCIvsFr15OvA
         AEwhnQwzldGOakpgiRHFaNuE64KtFKGdsZ82NdnuWlfKyyPtWz/m2RYUwADyluBZD8DQ
         nxFZJKkBN+hW89se+HUEb4b3lcW6MFykcYRJ78Srr+OzIypUuJzyqVNkO12TExStUsKR
         szE/pc4cvYyUsOKTsASNmNlZdfHXDaay4Qh63Xk92SH75sq1uGiZf/bXOu56eIG5R03e
         cinw==
X-Forwarded-Encrypted: i=1; AJvYcCX6sWPZ/w9vO/xu8XoW/qesm19yD0GV20S3iroK915EY3i3YYdrwlBXB5OlskV4QhUXAsv+sCkC2u0f4g==@linaro.org
X-Gm-Message-State: AOJu0Yy44s+ypgUKYhrNeyqwsk5mSDbFPcFsqY/bPAuZSJaOt0M4az7G
	jkjRrvOFkGk2QAMt+MnWyum7f1Z8Qc07XJIy1es08j9Xa1lfwk/1zQzSW2zpFSDsew==
X-Gm-Gg: ASbGncu+vf5AjztONdILdTO6uXRaz9t3nlWaOz0AZrff3QFh7CG2DexdOkUoSapkcbQ
	HAsN9bbFpSC0Ooj0AaSFNKXs7Y6Jny3hRPgSYJEBqCrmHfmI5GfAwOjlygAjXN0KdSSMalvt/aN
	3HFVBR911DiFO3RrwGG5kS0Pe7mItb2xxybl+Zgy3jqc9YI1Df9F1HLDrFZJeBD70LM+qo6gjBd
	HNsl0/F7N9JakBZFZHClN/thVH0rQyfyhDCY1NwyFA4rW2w/RCkaaX0FRS+Lh4dZH7acNAGPjUH
	aZlt4kwnols8E9zpSozbFuloIumE9eNgIQEsIHJT/JnxU7B74X+Ym5fU1Yl/Og+kAMqdHyzJsgZ
	gSNeBjibymWXXDHwW5ur1P3//
X-Google-Smtp-Source: AGHT+IH4lgvNsUHnBXhJTwhPZ6ES/eca2Luz/7MBxFtwM/gfjOqkPfYWg5DMg91sjnjMgnPylkv8YA==
X-Received: by 2002:a5d:6dab:0:b0:391:31c8:ba59 with SMTP id ffacd0b85a97d-39cb357afeamr595947f8f.4.1743712853197;
        Thu, 03 Apr 2025 13:40:53 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c3020d92dsm2701086f8f.71.2025.04.03.13.40.52
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 03 Apr 2025 13:40:52 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Andrew Jones <ajones@ventanamicro.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	qemu-arm@nongnu.org,
	Udo Steinberg <udo@hypervisor.org>,
	Shannon Zhao <shannon.zhaosl@gmail.com>,
	Gustavo Romero <gustavo.romero@linaro.org>,
	Igor Mammedov <imammedo@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Ani Sinha <anisinha@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH-for-10.1 v3 4/9] hw/arm/virt-acpi: Factor its_enabled() helper out
Date: Thu,  3 Apr 2025 22:40:24 +0200
Message-ID: <20250403204029.47958-5-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250403204029.47958-1-philmd@linaro.org>
References: <20250403204029.47958-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: FQPSOxmoIBGo

GIC ITS is checked for the MADT and IORT tables.
Factor the checks out to the its_enabled() helper.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Gustavo Romero <gustavo.romero@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
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
