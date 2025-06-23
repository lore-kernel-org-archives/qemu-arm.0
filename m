Received: by 2002:a05:7301:19ab:b0:175:694b:cb76 with SMTP id mc43csp2567264dyb;
        Mon, 23 Jun 2025 06:58:45 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWDzq9tHA/2+HGD0dyPn+rv99ax6V4Z08CoqwpS3CO25yUajbwCXhRccRs3iLFRorZqX63FfD0ETomk0g==@linaro.org
X-Received: by 2002:a05:6a20:7fa5:b0:1f3:3547:f21b with SMTP id adf61e73a8af0-220291c220fmr20328833637.5.1750687124828;
        Mon, 23 Jun 2025 06:58:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750687124; cv=none;
        d=google.com; s=arc-20240605;
        b=EA54oH5qNDBVyxyg4jNGMLeAAN7KaGkF9Khxyr9+O1sZtkDpVmjLfLSr7e4NUjj54S
         RixpQiqmrgvlshErQgkf+wmg9SBsxu+2D2ewp5cvF2UK5QPcAYAfYpkqbQsGcirkkxj2
         iIHytHcxaYOmDhI7O/f+zrWiCasn8I763AZM19LIuIsFfriAkkzsk4urhI1QG2hwRFw+
         NSwsUaaYf/x4ELq1g6K64FzBIX9G0ph916N5Dqfz+9gpA5R+KdoK/JrY9VNS7dYrl08I
         MXZdOn/0q7ZwT5R6ZbThrfotHdB0qR4KnNXGjYiMVKCBzmJ9shIjXBaqorkHjAI61ujk
         TBpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=ad2Ktqpr9QplRBLnhaKfV79oFe1du+hxPOeNvvhDj1A=;
        fh=+ff9bBaC9uPsQBIOm51PpULEMF54EWmXEflKRK+BTC0=;
        b=hEM8aFGMeGEsZVj0+SdXPjYYu0EX4I19Fpfsgmg3hh8VI049g4V1KgzEA1/5OWxQWT
         3Oi6LWoxqcWhpK3aFT1M2SEd35cCbRKteZflq/nP6XgxrCDq39LKbqgqKY+ai/dutYOy
         BEqX/k+qyhkQ0XtwOAFmXlvtQ9g+JjjLLTZPaLwe+dPL4DcmUDKylwpGuIAncu1l5Gt7
         9TGx/4yWYZlKTgxBz5k+mf53Xhc8q/ZO4wcthIyHkfw4/y2GshaArg39pDH8rb4nzO9i
         JnLRZjG5NhZLnYkqijSheLCgBMdNYbx2lVs0QT8mHi/5ZTBBBF1aQp0BQQhXcQdPLvOe
         lxAw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=smg40BUr;
       spf=pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=gustavo.romero@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <gustavo.romero@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-7490a4cd34esor3851961b3a.3.2025.06.23.06.58.44
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 23 Jun 2025 06:58:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=smg40BUr;
       spf=pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=gustavo.romero@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750687124; x=1751291924; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ad2Ktqpr9QplRBLnhaKfV79oFe1du+hxPOeNvvhDj1A=;
        b=smg40BUrXDIXK1724x3cqRZptAVLchJlP9udV2mBhreN+oKT9RuDzQdWP1q/1ZGUCu
         g8C6U+poyeBUcxoYdfGcxmLLvLTOpQrhuedxCYvVlOZ3fjer0FFOXWMI1PAAQlfEU6Xz
         zqoE2wCWDAjMgF08AYg64IW8M0Qg+xk/MjcuZKLSMv+wi37rw4te9mXjHnt/jbiTL7Vl
         aq/MyfmcTeItlftx9quCnv+WAGNmdnCU/JUntRfgAI7vuU+B3YH9wyo5N+VzBF5DEgtY
         ntCqnykIhZLvjlhTnz7jaWLYPmZZhV0D0ayDGp3Tf+sQlK7hLc+k8bKVO5gUCAnqFuMN
         l29w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750687124; x=1751291924;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ad2Ktqpr9QplRBLnhaKfV79oFe1du+hxPOeNvvhDj1A=;
        b=Gtd377+q4NToRvXqRF8pCMtytFVMososcbVlSE/H38yoR3/z4Q4sXjLb2CaH6FY/H4
         Eqgg57srDLbmtubrrtSk9fgGdIsCTz3ZmoMO14BCEDPRXegcI8x70iH+1xMhTWdeBalF
         IxxXmWAxN5KJ7G4F7sUz0CQ17yDSfcj/EzxpVz4RKSyjh6jMdnk0HtPtKzIORGANXHbv
         IUuU0RxEF46FeYYkYKI+6tvxXH+kRy5Vfk+Th1G+LeL6RbjZVdLv2XR9UxO94J1BSNj0
         pSiA9j3Fg4HkCgD/c67uaTrg7yvPcHL9tzyuH0SqQP3Knla3PdtdBZoWRWLWLJsr9yvw
         eVag==
X-Forwarded-Encrypted: i=1; AJvYcCVxnDcYjP+lusqRFbzkjuDy1zB7ZVnKrEvPXPtLhjhU4vumMKv8fD+XW+b5AlKod9/huFLEHRByahF5Gw==@linaro.org
X-Gm-Message-State: AOJu0YxozxzHMy/Jz6fxbumrBG/IQY2/UrSjAbRvv+ulhgUlQugPFN66
	8hVtYHD1kI8zvmZBMT5HCANF5yTq+jLtaDQ+oz/zQsWr/dITckBvvYqb1SIme1r2z2ruww==
X-Gm-Gg: ASbGncs6VK0iB7psE/youBHbqaWUZO7jwbDun9tLaT76YBL2EePVPvKFFsps/bWops2
	ZSbTfUBn25pVsBNsRnPz9ivIx2K3mPV3ADzTZqbetKDWm3PDJc5EzbVsPF1uSVNLbIEvNIBNmtX
	N6hM+N+EbPw6Tlr8Td93aFfhlqNzEQiXF1H06awZq1T2gjuFJZYeXRYW/zMiLbVtQHL1VwOmPR0
	tAqVY6y7tPYK0a328TfEhvoeESbEyHN89dPTBMj2SmLT6KlEgGG8edHCe2bgTrYQXDH7u/WGfG7
	q8KdepReZAzbIeoybacd0mVSsFh72ULeWKd51hO7hMUKWxwWQ83a+qCYvgssqvtgYug=
X-Google-Smtp-Source: AGHT+IE+A2RXkl1fsGxBWrMkhEYdvlQZUcrsUy1N77xAoHF9Tti6WGIFDvE++UYLoNNJyoOBrxVgQg==
X-Received: by 2002:a05:6a20:a106:b0:21c:fa68:9da6 with SMTP id adf61e73a8af0-220291cdb15mr18609786637.8.1750687124354;
        Mon, 23 Jun 2025 06:58:44 -0700 (PDT)
Return-Path: <gustavo.romero@linaro.org>
Received: from gromero0.. ([186.215.58.88])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b31f119eb64sm8063490a12.31.2025.06.23.06.58.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 06:58:43 -0700 (PDT)
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
Subject: [PATCH v5 6/9] qtest/bios-tables-test: Add test for when ITS is off on aarch64
Date: Mon, 23 Jun 2025 13:57:46 +0000
Message-Id: <20250623135749.691137-7-gustavo.romero@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250623135749.691137-1-gustavo.romero@linaro.org>
References: <20250623135749.691137-1-gustavo.romero@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: AlYq/rkIziEP

From: Philippe Mathieu-Daudé <philmd@linaro.org>

Arm64 GIC ITS (Interrupt Translation Service) is an optional piece of
hardware introduced in GICv3 and, being optional, it can be disabled
in QEMU aarch64 VMs that support it using machine option "its=off",
like, for instance: "-M virt,its=off".

In ACPI, the ITS is advertised, if present, in the MADT (aka APIC)
table, while the ID mappings from the Root Complex (RC) and from the
SMMU nodes to the ITS Group nodes are described in the IORT table.

This new test verifies that when the "its=off" option is passed to the
machine the ITS-related data is correctly pruned from the ACPI tables.

The new blobs for this test will be added in a following commit.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>
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
index 0b2bdf9d0d..4dbc07ec5e 100644
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
+        .variant = ".its_off",
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
