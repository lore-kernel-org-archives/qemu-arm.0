Received: by 2002:a17:504:5d2c:b0:1be9:327d:8ee3 with SMTP id et12csp1851593njc;
        Mon, 16 Jun 2025 06:20:27 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVXPrvfUechV0nmLlIn8qJNqJFQKs/3NkuMSJP/uD2HJW0sPMMMrctNeoR0PpdL319WD/UIBMfBJ0gFJA==@linaro.org
X-Received: by 2002:a17:90b:1dcd:b0:312:f263:954a with SMTP id 98e67ed59e1d1-313f1c7d8c9mr13583910a91.5.1750080027543;
        Mon, 16 Jun 2025 06:20:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750080027; cv=none;
        d=google.com; s=arc-20240605;
        b=DwtEuTPcTSr6LvY6rhNi+oYFjb3JJQOAGh5G+/oXVer2BE4zIrTnDOgR+x+28mUPrF
         ueJza61XsmaDlxGY2G5cJbmNdsQ8GyT/8nCU4Os3VEjM8iIMKkdstIkYs1Mwq99UZhex
         5d1+NaTO8kS5JK8S9aUwOymoO2fOhtipg6V1Dvh2vHbtOmshFXRGm24WL3pYUOJAXNeI
         EuT7knt+oRy03puk02x/ZN73d4HnOxWukmdktk/KZ216g924hHqd88Bct6CW6JPkMeoz
         k8/DaWzKzFu450vPz/VbTDVPCRkz3hHDWRBsSGzCq0a8oQiGbf6H3C6owOK3/HCRRhGg
         PaWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=pb22C6xJcHTC7zCwmUSNjwxICkvjIFLQmQAAl9DeMUI=;
        fh=Y0ci8STzmEroOdcZgfPZ9TOT1KYm6xV/y9xPvGZzpFM=;
        b=iRPfjx4C1xI7tLbeXDS0YMwAu5DnVhrQ8ImgBlNX03hMYGBgxY5hdavNLFUyNtJb++
         qsCLpy9/TuWZZKC52f/Q0StLGBGsn2UtIZJmwHwEx7IkdBfSGoUSus7R7ksJlDfbMLsS
         u5Uqq60cXFprVvKJj9RiVut9+rpz7gFlU49W6hb9qo70bTODsZXNqCyl5+r+w6JYabHM
         nNj67qIkKR8deevrdrnCaXns//E3nWsx/pSPVgBhQdLBjSyaJxsHsaCPr5qA40QjMoh8
         Ewrt2KllsXnnUtq/mkND+1uYNfrrwP3B8eDHfIoqIFBJcOvKDZ/k0oUjeI6QblD3pl/m
         k3jA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SxwNLS9Y;
       spf=pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=gustavo.romero@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <gustavo.romero@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-23660207dbbsor37794555ad.0.2025.06.16.06.20.27
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 16 Jun 2025 06:20:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SxwNLS9Y;
       spf=pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=gustavo.romero@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750080027; x=1750684827; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pb22C6xJcHTC7zCwmUSNjwxICkvjIFLQmQAAl9DeMUI=;
        b=SxwNLS9YrgEfx4+4zwlE+d0NM2vr+yw+tPhsRbIvOcb4xBlfQjPwT2kNF1JB7ayGtw
         gpsTXaq1ifL/NRkth6PLWoSwHc0olz1lHSSz2DgRgTsH+pffvVZMNYM2JA2caY4zoH9s
         RT48anZIOXaVcDWNUjv2MqNsCm/vyOneACah70ptECCh3kIeWL/thaFgUfoBc/rdJlFc
         g002mbriR91jhgg0AA7WgPi+AtitpjIa46E98Zci60GqLpiPnmzqRiiPhPXFp9tevJBN
         728HyuXov8OsPhhEEFDuViEQE/1u/xnGQmW+NIVf0M7uMydX/081UU7n5PWEiwV8Qpo6
         kWtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750080027; x=1750684827;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pb22C6xJcHTC7zCwmUSNjwxICkvjIFLQmQAAl9DeMUI=;
        b=BH2lqYz0TBYCwTKhnBtpjnjpuGHo+sq7pU23U6wYcq0yuSEDhR7UgWAMtuOe9RUCN+
         huhXQcG43snEUXKYCIkIb2smjmvfbXcO7WcdYx0mRI7R8OjP550d8bsyb3E1opwZvDzc
         TsvU6/qFkzBo6hFKEWfdXfgZp5OzXlxk4OnhdPooI9vgyuIA9AOgc8zQu8BbL3EzL8aE
         lG+eTzVIgqfdjvSMMKy2UpAuptg8DICeq6XTJ2KugiEVJ6qvODmg7GIBQKKyYfkRlwkT
         kluCtkQNzxoF9ek3ZFhg6RjtIbcvFFMXi/y/qf4SRWhLEg7SBU5iTRTAGDC4Agwp0a9v
         1Adw==
X-Forwarded-Encrypted: i=1; AJvYcCVuN3VBTLhvsQj0ObTvn9M1+0H3bt1p8umOnCmGT5xXXj4VFfGevvcu5tcvVMOS724oAkXYY5EGWf2wdA==@linaro.org
X-Gm-Message-State: AOJu0YySkwmivpxL0bHT+bQPh+6a1Q/v6iFZDRFoVrdQ2oMcBFhjIQEI
	RcgVNb/X6wr3bP39RMdxEt259DYXiXOGkU/B+xvtWu6puA7eDLqGVWEpvStbiw8NXEcsuA==
X-Gm-Gg: ASbGncue3zZ+zdEkHNQGrCiJB5fbXGlPxtDjiUyWPeUzhi3wPbBNJJrTZtZRJSnFyOy
	kcScybR/cUf0CDclLn6WMiCvadKwaIC89wkL/NfMmoSdm1wYKWIebrTvX9zwgT4EJAT/vy+txu7
	yJxdToWt02MyQ3IzpfkfdqLKukRpUg27CY0If7kiYVmi/Om1Za/jQZCk3WCUhkF3P6+MpP6A9ka
	CfV70WnKEJCJ/6gNkRIATjQkR2OGiLlLkCne2oZDQjC3gCkp6cFHYgJOOoV3g7MWJ3y7SivtcBP
	77gmHI68Vs3J2oxhXwAUzTpdDFuxdW5gMaQS7k5EUu169i/5qCCKtWZ6fuoLytBbx74=
X-Google-Smtp-Source: AGHT+IFCStmfOmsnPdmEaxuUS6wfRTCeQyHwuBgp4aOVsXWxixMkPmB2dOR2f62POR4NWL5VIkKCfw==
X-Received: by 2002:a17:902:ec8b:b0:224:26fd:82e5 with SMTP id d9443c01a7336-2366b16e7d6mr133455025ad.48.1750080027034;
        Mon, 16 Jun 2025 06:20:27 -0700 (PDT)
Return-Path: <gustavo.romero@linaro.org>
Received: from gromero0.. ([186.215.60.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365de781dfsm60848405ad.131.2025.06.16.06.20.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 06:20:26 -0700 (PDT)
From: Gustavo Romero <gustavo.romero@linaro.org>
To: qemu-devel@nongnu.org,
	eric.auger@redhat.com,
	philmd@linaro.org,
	mst@redhat.com
Cc: qemu-arm@nongnu.org,
	alex.bennee@linaro.org,
	gustavo.romero@linaro.org,
	udo@hypervisor.org,
	ajones@ventanamicro.com,
	peter.maydell@linaro.org,
	imammedo@redhat.com,
	anisinha@redhat.com
Subject: [PATCH v4 5/8] qtest/bios-tables-test: Add test for when ITS is off on aarch64
Date: Mon, 16 Jun 2025 13:18:21 +0000
Message-Id: <20250616131824.425315-6-gustavo.romero@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250616131824.425315-1-gustavo.romero@linaro.org>
References: <20250616131824.425315-1-gustavo.romero@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: ls0W3yU7wFfk

From: Philippe Mathieu-Daudé <philmd@linaro.org>

Arm64 GIC ITS (Interrupt Translation Service) is an optional piece of
hardware introduced in GICv3 and, being optional, it can be disabled
in QEMU aarch64 VMs that support it using machine option "its=off",
like, for instance: "-M virt,its=off".

In ACPI, the ITS is advertised, if present, in the MADT (aka APIC)
table and the remappings from the Root Complex (RC) and from the SMMU
nodes to the ITS Group nodes are described in the IORT table.

This new test verifies that when the "its=off" option is passed to the
machine the ITS-related data is correctly pruned from the ACPI tables.

The new blobs for this test will be added in a following commit.

Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 tests/qtest/bios-tables-test-allowed-diff.h |  2 ++
 tests/qtest/bios-tables-test.c              | 21 +++++++++++++++++++++
 2 files changed, 23 insertions(+)

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index dfb8523c8b..a88198d5c2 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1 +1,3 @@
 /* List of comma-separated changed AML files to ignore */
+"tests/data/acpi/aarch64/virt/APIC.its_off",
+"tests/data/acpi/aarch64/virt/IORT.its_off",
diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
index 0b2bdf9d0d..4201ec1131 100644
--- a/tests/qtest/bios-tables-test.c
+++ b/tests/qtest/bios-tables-test.c
@@ -2146,6 +2146,25 @@ static void test_acpi_aarch64_virt_tcg_topology(void)
     free_test_data(&data);
 }
 
+static void test_acpi_aarch64_virt_tcg_its_off(void)
+{
+    test_data data = {
+        .machine = "virt",
+        .arch = "aarch64",
+        .variant =".its_off",
+        .tcg_only = true,
+        .uefi_fl1 = "pc-bios/edk2-aarch64-code.fd",
+        .uefi_fl2 = "pc-bios/edk2-arm-vars.fd",
+        .cd = "tests/data/uefi-boot-images/bios-tables-test.aarch64.iso.qcow2",
+        .ram_start = 0x40000000ULL,
+        .scan_len = 128ULL * 1024 * 1024,
+    };
+
+    test_acpi_one("-cpu cortex-a57 "
+                  "-M gic-version=3,iommu=smmuv3,its=off", &data);
+    free_test_data(&data);
+}
+
 static void test_acpi_q35_viot(void)
 {
     test_data data = {
@@ -2577,6 +2596,8 @@ int main(int argc, char *argv[])
                            test_acpi_aarch64_virt_tcg_acpi_hmat);
             qtest_add_func("acpi/virt/topology",
                            test_acpi_aarch64_virt_tcg_topology);
+            qtest_add_func("acpi/virt/its_off",
+                           test_acpi_aarch64_virt_tcg_its_off);
             qtest_add_func("acpi/virt/numamem",
                            test_acpi_aarch64_virt_tcg_numamem);
             qtest_add_func("acpi/virt/memhp", test_acpi_aarch64_virt_tcg_memhp);
-- 
2.34.1
