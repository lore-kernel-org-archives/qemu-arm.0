Received: by 2002:a17:504:17d6:b0:1be9:327d:8ee3 with SMTP id o22csp4376965njd;
        Thu, 3 Apr 2025 13:40:43 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV3474ZvRR54pUvMrvex33jMxknq5xMFX5OvNr5yYXSOewvYjJq2Ps8Xy/G7jUqeSEDjhU6PPe1eoVjMA==@linaro.org
X-Received: by 2002:a05:6000:1787:b0:39c:1f0a:ee0 with SMTP id ffacd0b85a97d-39cb3575da2mr680354f8f.2.1743712843005;
        Thu, 03 Apr 2025 13:40:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1743712842; cv=none;
        d=google.com; s=arc-20240605;
        b=FenWir67b1yIZijPdRtjKXuXNrjK8gD7dsEh0EwW6+z5IgGyEW1cQZHFaZ21mX4bcP
         l+SgNgOhtmA2W5sJwrPP8IzN0S7HjoXX3w9hTmdbzBBYfr/zmj7V7eBWWynCJbfKFMM7
         TVhFa9mRwrPnXnGNEF+QB9yHZGt+yQDHCOpFc929tZ5SAKfcd3y74WJkTv8wbGsj+D//
         dO9W2mUKpzACBfatF/1zMs3IVTJlIrTHSqiuroOVfT1uM8aKRNlF2AS4YRIHBLxhcIj8
         3KQrfeiwDkFaT5enJo+V6zUQTO0b0dHfPSGooqn+EVQcfFThXF+maH+Uh9i7kkBElknd
         x15g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=91qw8dB7Eg7Eq+MHz4XIrej88B1FVRM9ctS9zjgiZGk=;
        fh=jmpLWMsKwYMKPoiqL8ipl/sJVkdAhATG+tT+DAFndaw=;
        b=i5mBQMhiPVKZinU5RPZiuxSXW8KWSkWHfQeOaDoNGPm64HfWMC3zdBrB7MGHOUPh/k
         bXB7DC35wydDbVQrK6N3hKQOmXT80gLIJZ59XvMtISf8YT0fTzPrxjGWJPuxyi0s/oDu
         TUZkscXZOWDxMI4jYodkmtz6VaTkgmwLBRPmfiHglRYxPcs19RcW/W9i0nl6phn/oRSK
         UPhHE1kTJMZBoxRqTHMpmqKMDE58/N+VfBVbiZJhVJutBuartcXXv27m9CEDiCuMrmoi
         r+EtVBqh7hgmE0qgqeTZ2/KgAv1Om12LtCKb0QXELKB3ULkQJAO5PY8ScM0yMenZUZdR
         cTgQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Z54FoROK;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-39c3009677esor774900f8f.2.2025.04.03.13.40.42
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 03 Apr 2025 13:40:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Z54FoROK;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743712842; x=1744317642; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=91qw8dB7Eg7Eq+MHz4XIrej88B1FVRM9ctS9zjgiZGk=;
        b=Z54FoROKX6E3ufmir9HF/Fm+poltuPd3xaB4w6hcNbm2XBnk217GgPFqmRCVs8NPlC
         /Ojo9Ryt90YmeXIYKqaQXqsjehZ+npKtKfnMsqrje15VtOIEREfkJ6+vMylw4xPkVqO1
         Uz91NZlLgwxDK/Uux53eZZ3JzC5b3crRuts4XNbwsWMWTQZHnY26YhWTgPCVh8dCCeIw
         egMdVA7DTKWz+ic0whU4fH5UHFSKysiQA/vlvnQ0surPreOBwzZ2HF0o10RAA3O0kmgV
         XcKV+gAmzToVtuR12Qu7HDuAxaJvdYNHq48p3glhu3zPnTSLLj1ATesNk7GMsVguIjTE
         EkGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743712842; x=1744317642;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=91qw8dB7Eg7Eq+MHz4XIrej88B1FVRM9ctS9zjgiZGk=;
        b=VToQSsqxUQ+DBQs9AsdHU+9S6d8pShnqmTa9nl+tFroc7pymsayKVsoHvMVCLg2bPJ
         k+FYmkeC9Rcy+VuX9DgN0rEyHh2oG2MHni/8OOGMBbRzr9/p4nlyipJOasC9pjuWZWxr
         EjdD8YElLTt5BiQ7K3Xahf1FTER6LZLrvYqSP7uqH0B9btTqC6GqKk3icvqzxnuVK/LV
         BlTNzfdNQFsdTRA+GdhOic/wbgnz/XFrUyTApYewXxGunvAxBqdcR6LE9VcUHRZXANv0
         7U0qEfrlJnBS19DggMknOdxJglW403hmCkOoO65SOmxJT+cK9GiIDOgwwzBU7LoMsxMY
         wOaw==
X-Forwarded-Encrypted: i=1; AJvYcCXd8tQs61xqI7vHbfjfM3f3naTWhiOWniLiB2Cl2Soa28Nm5sB3sXBP64fT8T1h9+BMNq3BbXoKuuzNjg==@linaro.org
X-Gm-Message-State: AOJu0YzO0iuG4QebgI/3UhIrxeT4SyRKfFm25lpvVnegPV3tsFKzcSX3
	AittsCD/7HkkP9xwZZVlbVnfl2l+7uW5ICP4y6SS1LAYQeLfMRORkrqdjCKxPqODSg==
X-Gm-Gg: ASbGnctBIc6rHjIXgbuA1lEuu2ybrYRJNDTzFegBrnWG5GW5ynUqt3Lv2M6BdMBSO6+
	MFNsMKHg+hSeVv8RPMqFs3xXcwlAPLtwM4EL7h1/8IM3SHvzqH2nBqnrxABOZsh2SatJVXxPvnI
	dLVTYOD+uf1k1yFLwxjVJSuBbAw5nP/AQyII7GD1/IPRN2Ay/eOT+/ZsVF339BIoGePTo3hwTjF
	gga6PX2AaQ8NrPUoE9Q78EGEawmtvzNrQ/0hd9BGiofJiOghm0+oxDkaB1gxlsiTVhwuXTMfpVa
	hbH2dnsRE3ww8kKFBb7qmfqQoU2en/QG7X34fEIhu4rIFZTWSdHos39rMPDoI7gDe7SeLFmqsNR
	PqRq+R42EXVYxYkycUGJZ77ykJlKGHW0+wM8=
X-Google-Smtp-Source: AGHT+IF0VB25+QWZbsznnQinFc032J8n9BsALOb34HjpL7ukA/Tx7TYioKqQiRbt6yig2CP+o+N8Tg==
X-Received: by 2002:a05:6000:188f:b0:391:3915:cfea with SMTP id ffacd0b85a97d-39cba93329amr612537f8f.38.1743712842401;
        Thu, 03 Apr 2025 13:40:42 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec1663053sm30876275e9.15.2025.04.03.13.40.40
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 03 Apr 2025 13:40:41 -0700 (PDT)
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
Subject: [PATCH-for-10.1 v3 2/9] hw/intc/gicv3_its: Do not check its_class_name() for NULL
Date: Thu,  3 Apr 2025 22:40:22 +0200
Message-ID: <20250403204029.47958-3-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250403204029.47958-1-philmd@linaro.org>
References: <20250403204029.47958-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: tDo9Ytd0+HmY

Since commit cc5e719e2c8 ("kvm: require KVM_CAP_SIGNAL_MSI"),
its_class_name() single implementation doesn't return NULL
anymore. Update the prototype docstring, and remove the
pointless checks.

Reported-by: Gustavo Romero <gustavo.romero@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/hw/intc/arm_gicv3_its_common.h | 2 +-
 hw/arm/virt-acpi-build.c               | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/hw/intc/arm_gicv3_its_common.h b/include/hw/intc/arm_gicv3_its_common.h
index 7dc712b38d2..3c7b543b018 100644
--- a/include/hw/intc/arm_gicv3_its_common.h
+++ b/include/hw/intc/arm_gicv3_its_common.h
@@ -128,7 +128,7 @@ struct GICv3ITSCommonClass {
  * Return the ITS class name to use depending on whether KVM acceleration
  * and KVM CAP_SIGNAL_MSI are supported
  *
- * Returns: class name to use or NULL
+ * Returns: class name to use
  */
 const char *its_class_name(void);
 
diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 3ac8f8e1786..9b7fc99f170 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -741,7 +741,7 @@ build_madt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
                                           memmap[VIRT_HIGH_GIC_REDIST2].size);
         }
 
-        if (its_class_name() && !vmc->no_its) {
+        if (!vmc->no_its) {
             /*
              * ACPI spec, Revision 6.0 Errata A
              * (original 6.0 definition has invalid Length)
@@ -973,7 +973,7 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
                           vms->oem_table_id);
     }
 
-    if (its_class_name() && !vmc->no_its) {
+    if (!vmc->no_its) {
         acpi_add_table(table_offsets, tables_blob);
         build_iort(tables_blob, tables->linker, vms);
     }
-- 
2.47.1
