Received: by 2002:a05:7300:232a:b0:178:84eb:402c with SMTP id r42csp1648020dye;
        Sat, 28 Jun 2025 12:58:05 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXV+MrgFw87YVzZ8fs+Ib/ojQYh2TDS2fzfomledJl6Ng/VPUhmYSQZ0vvm/HYJSvXrLPA/lAnbnI6cdQ==@linaro.org
X-Received: by 2002:a05:620a:a101:b0:7d3:8d53:c509 with SMTP id af79cd13be357-7d443923426mr1138680985a.2.1751140685207;
        Sat, 28 Jun 2025 12:58:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751140685; cv=none;
        d=google.com; s=arc-20240605;
        b=BPzJDqZRE6XS7/L3Q8JZdoKhv8SGcIJ70Mgl9qzRELEVAKCPKK/7KEG7EA1kk2VZ8G
         0LogCVxXhFCCjDAxegWNulPm8TC2Zo5/J61CI37jMscsVimyaNGykkmpqJNDBLG0HBqL
         +y3ub097R6scjT5yCng581SB3pzdJawvZmhbi4cmEfN+HjnFhvfFnRR/Iy6umfq1N+A1
         FZ1UxfoiN5hDzxKUY/FktLRWDTevsmGiqFhh+qhT/djpL1ATsMRBz4ZJmFp2GDLTy7Ci
         QW2u1ihJQBrqlvsMMZQAZvtDTqDQFVEzVkUYtBGZvcTqmMpBqB2ZbS6lE9ECpuwAm5fq
         Y0FA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=lB7c3Kr8+0cTXK0lkJO2kLrKNcdVcOOBVGzv/SMQzE4=;
        fh=STQwm0cVv+MJgg335KGLQw4xLXMJcI3b4HTXpPOmOj4=;
        b=RWOfm/TX/YNb9QZS+F5a3VmJ8LWzN1o2hqdgnaBN3d5NNtulLSKR3CExBlaXxBJP+V
         n7XVHRYz6DwbHL7YbmAxEK74FAdxfjea5DZwnH2Bn/OhMbYuwmWcMGn9zRTKIp2U6Ue+
         w86TBRQ7gPxafBgkTNhPfvGIW3LfiLGe+9+CBAWW3R6RUwS3p63LkoIOHJOiO+WfLRzv
         GdxdzjWggBUUB93YTpztnPm041hBe5xEv7+1Td/0ClFQtBd72Mr13zFCumuJ9gMdZWeA
         KQ+n55erJxTZcYpl/l6r6WxOlxwYjJ1pzZM7NE+67yVpswfyskyLtW3RQkQi9+pd04dS
         imSQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cUsvY5s3;
       spf=pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=gustavo.romero@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <gustavo.romero@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id af79cd13be357-7d442e9c7c4sor368620685a.0.2025.06.28.12.58.05
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 28 Jun 2025 12:58:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cUsvY5s3;
       spf=pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=gustavo.romero@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751140685; x=1751745485; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lB7c3Kr8+0cTXK0lkJO2kLrKNcdVcOOBVGzv/SMQzE4=;
        b=cUsvY5s3QNEajg2+AeJso+4vPOIOrFXlWnNNBT6XXMt6PfKt08+gp91/k6TGowG7VC
         dNHrRfrLnwoRc4GcM4IX8klkFVaPjKCaCa8LO/tcKybihjAqknPn109PpJmf3XWi7Jbd
         bhtlScyha+Glm7W6HxIYMt7Iu7EcFRcD59QTRNxk6sgaomskQ275MUXEa/yn/rwm1QMs
         GSjM7s5VU4ODrRzKhjJ91nF4fsqGSQlD3odAERK9VZ3VTFcPsgcEeTez88YoQb8K1K7D
         0JvMpUrnTI8PHgCGUTQmtysSSrj6QAjPvfawtW5NhqI+uEukPtYMsg0VcX7W2X/FBqi/
         skjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751140685; x=1751745485;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lB7c3Kr8+0cTXK0lkJO2kLrKNcdVcOOBVGzv/SMQzE4=;
        b=Xbc1L5Pgk0b9+8Cc+sJtEp5NotcoPcaZDTEOj7Q3ZKPvhgWMBvRJfBe4DuVhRoSM52
         heB+yg2NCVkgCjmzGi462EIeXsEEICthmkMpndsJxs6zq8J2Rin/Ikr0rjCrRzCWd1jX
         U1hd2B7dxyv7NP8bW3enVswoE7eZVxo20vKbD69wSQ7m62mcGvj7nsxIXydaTWQIJsTv
         NCG3vTpGZWjaQaBfC/TLf26VLyEw5sbZXsQCXSm/lIfEb6NGSQQKjXTb2e6LyTTwhPtc
         NQdqSQtaxBxOzzKJ0CuUZCPABb3XeaF/q4BmqbISbdCwH2wIHxkbT3SeVUz/krfVQepI
         euIg==
X-Forwarded-Encrypted: i=1; AJvYcCX2M0zvA/+h/Qya53W8zis9aLqqB/rB9A2O+lVdwRE6X06SQ3gIrdfOjw76zYTKHp300TnGr5Ey0Tk0Hw==@linaro.org
X-Gm-Message-State: AOJu0YwXe1+gtx+YXMo4Ai+c2sRs0JRkxzEd90MCgG3AkXXBYxTfS68y
	TTEI4dHuOHP8NMNoG9QAKmoqyGkQGaeXDC8qqFW0YxgyswQpRq2UTutIsWv59pAUIvxMVg==
X-Gm-Gg: ASbGnct7ODlzYxL+kJalTZ7uksti3se+mfOQKLYRvu4LCVBv4GML65haChEEbxlgk+x
	UskQOekVIPJjUfZQfIm6uF9L+lja8vtGI0zcMu+wVZARjE/EwWG+U4PvxSJt4piJvW6OBvTTDtu
	6aHhz5xfTHv//xVIxnrHYz+/irdWOIDGtFWzIASHXtIZEPL+Kz1CCTc5toMspdtuzYLFjeL/byX
	VeghwGyicSifcV1mlv9Rwoi7ochMPQORV7RK4LF0YpbW0AaxHvtWxJCZ8e9OAralK4ZfRZjnC04
	34LhCqVc4Ov6z9mMBa4obTfB2SSZpj9kIFZ2HIq6CffVU4p6Sjw0Ifl/7oYE7TvR7Hg7TyK8eXR
	9tA==
X-Google-Smtp-Source: AGHT+IHnu3i6MW3fE35Bkn4EIlOIi/1uoVXmPZ+BBcRxKbR1IdEgKhrKFsVr1ba8qeD9LxLpJtKZgw==
X-Received: by 2002:a05:620a:410e:b0:7d4:492a:31fe with SMTP id af79cd13be357-7d4492a3caamr850917385a.52.1751140684680;
        Sat, 28 Jun 2025 12:58:04 -0700 (PDT)
Return-Path: <gustavo.romero@linaro.org>
Received: from gromero0.. ([186.215.58.88])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d443136907sm334395585a.14.2025.06.28.12.58.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Jun 2025 12:58:04 -0700 (PDT)
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
Subject: [PATCH v6 6/9] qtest/bios-tables-test: Add test for when ITS is off on aarch64
Date: Sat, 28 Jun 2025 19:57:19 +0000
Message-Id: <20250628195722.977078-7-gustavo.romero@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250628195722.977078-1-gustavo.romero@linaro.org>
References: <20250628195722.977078-1-gustavo.romero@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: x7mGiuVtlAWy

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
Reviewed-by: Eric Auger <eric.auger@redhat.com>
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
