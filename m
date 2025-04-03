Received: by 2002:a17:504:17d6:b0:1be9:327d:8ee3 with SMTP id o22csp4185617njd;
        Thu, 3 Apr 2025 08:19:38 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU9ndNAmLWRi9ytGwRI/WPrfLrLCAcPjXydozKE7q3DTJnZbIiQJM0TvR3Oh7fVStnqZaiCUakAxn5ZTQ==@linaro.org
X-Received: by 2002:a05:6000:2210:b0:385:fd07:8616 with SMTP id ffacd0b85a97d-39c2958540fmr6488886f8f.0.1743693578443;
        Thu, 03 Apr 2025 08:19:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1743693578; cv=none;
        d=google.com; s=arc-20240605;
        b=lBPtV2OVMqr2zaXVEwimp4vHSzUpS3sfEttTgNnu8k575IXOBOxU8YEUl8tOxFIY6z
         4Dda8rsIbmzLaUI9lLX7708UTzvEtiRYfd0uTP0g5nETKlqyT3C1zf1AEGBWjv3ZDXF3
         eHlMKf2km1QqRFnr5InW7grDi4qq0ssFb4by5pNbjw/JxmaDsGS3Ez7K0UTVIFwvFGLP
         GmTsc0Y8nVQ8ZruIBb8sv8PHABQ45TFmMGc7kSNSA7H44n6sExzFwaEF1ZvP+FaEH8aa
         /Rnfa2cY4IfrKZH+Qdc0pnyHY04faVO19MK2wJGGef/lumHWCliUGzKy9mit/rwes8ph
         7+WQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=877Ft8S2r+Y3e5owHO3tHYlDGhoIjLwtX0511Fk5+so=;
        fh=8LZ+y56RUVT7sAl+hBb0xDAhnMqZqjLGSMn8VfZRvfA=;
        b=dd8i/xDHOAMGJ/pgRj4vGh04PMm4j0cmS6KEC0nnRkWTHqMBNW7of0h2DqnhHdyo6P
         zXKuHLhVbHdIruePbPdftw9OSWFTYL7tM+QSMBS/ab4BQmBcQba4IOFVC9t/0WrTvhuA
         s8iJOfdKrxLJ83ygORLNjU5LKcwNk7FhqjO7hZcSfyJCOsg2xOFG44eHX0/7agC/uHyF
         95t7Pq4iKOHX0SMJgRc+03CCw3HGMqkRACPboWg7q9xzxRvERioJle9EJRxkleywzniL
         A46X4t6k2Gy2LZQUvm9Wo/PmfcreYp8BnOZNLHolULKb9Y5vCdicv/8vloND9sR+fqle
         Re8g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gywMQGrB;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-43ec217cc93sor8691765e9.1.2025.04.03.08.19.38
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 03 Apr 2025 08:19:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gywMQGrB;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743693578; x=1744298378; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=877Ft8S2r+Y3e5owHO3tHYlDGhoIjLwtX0511Fk5+so=;
        b=gywMQGrBwajsN9FEhkeaY9kgXuolmlJ3lEUBnaWC4VDRWyThYMrN+iFag+8gHKpS89
         QfNDlsHGFp8NdnqhVoWCWLVgMYMzTnxmy+a7mYD7RWjNFUGAOYPb6u2lylsJfO6xPEKV
         7G4nlqLBx5YYYoPeXebvkRI+P0htkr8gsS3fF5znds18fV3xEsvIhI8c5JDLI0bFD4eg
         QrYRuhJkfWrnakMOMqGme2cf8xVvSV46AhlsiztVbXh508qcIZL+K8nCJgBhz1khvF2u
         T2KWW2J9Yd9LLdPCaMgfG6L6xSV7+tDqoHAhIfRf6oEvZbNWjafD+qhwcU3t81zWZA+c
         j+qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743693578; x=1744298378;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=877Ft8S2r+Y3e5owHO3tHYlDGhoIjLwtX0511Fk5+so=;
        b=sxSMCIwO2ig7kG9hNaJlh2qoSEab7qcuaYQUJk/2kY5I9Wy7pnNlR5c5EtUrnZlRMH
         VFaah+21s4sT/GhjPZnE0M3g+caLFtD3xqY/9wVE6X/r4UdTAtm7rVufDdjm2Zb3gZH8
         PxRDWNJ8rPg7qM5mLY7p4lcFl7cDgBpgnnBoQdesIs24grENuTuDWV5oNNsxwPS8hxjA
         LLoetNga0n5Q61+uqeONnGZEpOKII3gd9trNh0jSBGK2WemNf5qWYxUZ5u+Fj+ut2Het
         eLQMOhLd8eOEwSomTgXp0wE9yAVcOiSsA+XsEmGHHO/vqyRJ6Qaelv+W0tbAIWVI6xbJ
         jacw==
X-Forwarded-Encrypted: i=1; AJvYcCXdn2x7PZHIWA+pm3d9svGVUBrTemFr3yboin/bHJGbI+TRt29IE6g647QTRPk+qkYk8Y+DkmFvVgae1Q==@linaro.org
X-Gm-Message-State: AOJu0YywD6aYaNOCg1nbVczgHF1GbqJWJe4JSPZheB+2b2W3SQHE7iyi
	gorNn2m+DExaQBNNEZkhKC3FPnUYuZz4F3JR5lcyLxVn+8EEnKiBCXdN74AuAjydeA==
X-Gm-Gg: ASbGncvI/UL6OXG4lYxSBv97ob7PITMZluG60+9wcSuNl3IiR0gKafqYohpF9Enptdv
	9Cclzjav3FzCuMFKw1bCRSFOmhC/KapWeTDt9CfQqYiPjLsogtBG6IL2uqcDiMevQtfzXYBC40b
	Kgy5r590OhP38Uv+KSEVI6fyzm4ESC7z6BsIoVI/pevB7OVsdJ//FqZd7Q3GdQCjOzonI2gdSt9
	bkS/et+Qw3nPqWolgvsb94rAo0r6Eo0n5+jE2mpoLuxxHh5Uz5gXArINI2wS5Hx/HGYhaScU24c
	pcTiN9v0t71JFQyfDCPqoq71WrL4dS4+R4FXarqA1rcn5geRzwU0xzubin8qLs+j9Pog9KKFLlu
	RWykh4dE4t1IDwWySXwU=
X-Google-Smtp-Source: AGHT+IGDUdyJ7Y8Jlqpb4UolknqM0gQl0QwhPEtcpspj4SROqYp5bu7UpbwJqlHMRdCbPezOjVIzzg==
X-Received: by 2002:a05:600c:4f85:b0:43c:e7a7:aea0 with SMTP id 5b1f17b1804b1-43eb5c95ab8mr67541505e9.26.1743693577813;
        Thu, 03 Apr 2025 08:19:37 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (145.171.88.92.rev.sfr.net. [92.88.171.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec1663053sm24538415e9.15.2025.04.03.08.19.35
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 03 Apr 2025 08:19:37 -0700 (PDT)
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
Subject: [PATCH-for-10.0? v2 10/14] qtest/bios-tables-test: Add test for -M virt,its=off
Date: Thu,  3 Apr 2025 17:18:25 +0200
Message-ID: <20250403151829.44858-11-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250403151829.44858-1-philmd@linaro.org>
References: <20250403151829.44858-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: VBAnq5zS7kaN

Add the use case reported as issue #2886 [*]. The test
passes while it shouldn't. We are going to fix that in
the following commits.

[*] https://gitlab.com/qemu-project/qemu/-/issues/2886

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 tests/qtest/bios-tables-test.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
index 0a333ec4353..baaf199e01c 100644
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
+        .tcg_only = true,
+        .uefi_fl1 = "pc-bios/edk2-aarch64-code.fd",
+        .uefi_fl2 = "pc-bios/edk2-arm-vars.fd",
+        .cd = "tests/data/uefi-boot-images/bios-tables-test.aarch64.iso.qcow2",
+        .ram_start = 0x40000000ULL,
+        .scan_len = 128ULL * 1024 * 1024,
+    };
+
+    test_acpi_one("-cpu cortex-a57 "
+                  "-M virtualization=on,secure=off "
+                  "-M gic-version=max,its=off,iommu=smmuv3", &data);
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
2.47.1
