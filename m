Received: by 2002:a17:504:17d6:b0:1be9:327d:8ee3 with SMTP id o22csp4377091njd;
        Thu, 3 Apr 2025 13:40:58 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUPq2oGyJ0fDQP3I9ZW+r5uJTz6UDPLUB1aa6RajSwuPuDPat2gle0QXDReuBl+pfCIzv5U+03m7iG82w==@linaro.org
X-Received: by 2002:a05:600c:a0a:b0:43d:3df:42d8 with SMTP id 5b1f17b1804b1-43ecf842bd2mr4450875e9.6.1743712858743;
        Thu, 03 Apr 2025 13:40:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1743712858; cv=none;
        d=google.com; s=arc-20240605;
        b=NXevitDWr0NybigibGvfnq1o1mM1sZGDI1rUjzzDA53rPIArUY4L/8rwPj+Kfmmq/Z
         e4GT7FsvoWofcGFMW+UIN3AKdeR4/xXdw30mC+4MjIXVvN1WsPrbqE2u+TaogfLnBrES
         UdUOHBk1bQd/TenthiwIe46jmO4CKKNA2S88C8BFYY4pKa6/iwbaU+7wR+HXWNC3p113
         4/vtX9Vqa1eN4KdCXa9beWs66FL/DcKwVcQbAQCcU00EwEAHQ30tsj1H09d5lmg9lH6H
         eM14eXnoEv3itgnlS3RE0zHKBifjWzJv9vf2Qs3THMqnLiIz3ymtWXoGc0zHwIVxFCs1
         nMsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=877Ft8S2r+Y3e5owHO3tHYlDGhoIjLwtX0511Fk5+so=;
        fh=mklH/eU8isL5K+zR/lTB6xvaDiUeNZM0rxXNFoFVP4s=;
        b=dMyt5RH6msoxX8dlN4NQfbuj+56kYVW3vXLU1O5r+vTR7JX0bZHqMHFi4kLwSPCcmU
         7VvCpwXfPBexkM0zpL95kZKALjCXvObHnUfh7p4Xr88ZInVTD7m7u3zq4JxRXWsQKwj1
         zVPFsqcjPTgy1n+GC/MRb6ehBPOKicirR9rCX1W2XNKc52HsyfhZr9Z4LZu/18+U3DED
         zEAlXDqv3JgwoarhYIvD2YAjrAyMF3Vh8/KL2kCfHUHFS0FxSSeX/BJZmb8XMIkaAjlz
         GcbW0cLmK1jPgFhHVZixDnq10lfl4vvYYMUEuHsxrTw4r5elXhqO0uyPN2dtnCDdEaPw
         dULg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WBxiILXv;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-43ec2c6f89csor10411045e9.11.2025.04.03.13.40.58
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 03 Apr 2025 13:40:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WBxiILXv;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743712858; x=1744317658; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=877Ft8S2r+Y3e5owHO3tHYlDGhoIjLwtX0511Fk5+so=;
        b=WBxiILXv9Hl1h1hQQDBfZAnrC2E0witkt1Kof0zKMreyJWVz+Npw7yI16MyV0Nl0O2
         1YqKKD873kNoW+z63BS3qf1eOJNNIhoZmrnQ/RxqCi7HrhMX97asWYW/zPeLRbZQR0KP
         RRF+PYiZozMtYneF8eWWIr14S5DdOWuwvXVTJ/6DLoUuAPwDG3HqE+k5H8DP33wqr/I3
         JL+WlN2RCb+1m3PpgfGeQ50Qqq9TCN0e1TjtbqcGJEzupsmN88LaUQBJ/EqtgEYlTmcT
         RDDDduvH4qU3JQj9qyTFRC51eKmlhTyHhbeuUvM8XDH7bWyjzxrFda3wj3ibcHIofhOe
         pQkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743712858; x=1744317658;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=877Ft8S2r+Y3e5owHO3tHYlDGhoIjLwtX0511Fk5+so=;
        b=U7eCorxxzPt7MwqgqQ/HyJ+UlWa2do8VDUg1+935l0bzQjYAM+C/cyOzR58DAPKULu
         S+NM291VWtxIUkBGJPGiAeDUgcT4zmSBtl/hBiJ7eBOxb7C0Ch1sKPFlE5WMSHs8GjE7
         FZFcnBCFmxJQfJ1AKbsqTvkyoESIXjGVB2BJodIE9WFWn9kZRz99hhcEhKCA0Nlqy/ZC
         QBGME5wQOVZYR4i26RZDLJGvwljylfthSV0Uof7gdPWqlX0Typk1SkJhwdh7O5Zqu8sJ
         2eGm9Yga2vD/Vzww6ApZ4lswJnzBZIj0sbwakSJnIAOciWyWu9I3kISz6NgGW1z7Z2Yv
         jacQ==
X-Forwarded-Encrypted: i=1; AJvYcCWprpVs+9MtvLfyltWzpP5OXGYti4q/crGjYInhbaG8pBMKe/wVU9DbJbFHqi4IDnrF5JnJCSyX/+RPLQ==@linaro.org
X-Gm-Message-State: AOJu0YzrTqhMqkGrboJqGzPNGENLd+Lmvxn72skzqqmlifcmFfCfhrVK
	pHI5M2n6o/WHUG/21TxvDL/uCI8FmqHsM80NG25Yo85/cUQL8+fRQNt4pi8ULIFbgw==
X-Gm-Gg: ASbGnctA2cvUXrG9MF7FwdHZsgx22BZUflxEl2cLJ/2KumaZFByuayVY+r5FfBt4woN
	l8P7YUwc27Axb81s2GY2Aj6kAtoT4aN+srcfx4M1nz5V3RaWQGqrUulCDQMyNaxplNQcR8CSDSR
	vitzXTICyDav0ROou4ohmJrFvnKBF8OHRgALPIpYAmKupNKMpG6TxsG1KrSoaEoV23m/8sXlNG2
	j9lJrnMxooovhmq9LPcYnEePbXzvwNRZNxqOAitU8XXP+a3mP9xZDQvWHncpWRBV0YD4gar7Wqi
	VvqBxyB1OnQusjuFRtPzBFPqxbksg1vtf6ol+UY8upnawxNalJcxOCKjkX+Vq6XLw264j+zP9DB
	/3Y3jYD42XADr8GouiPYcmkO8
X-Google-Smtp-Source: AGHT+IGfjUcJG9Fw7vR54jYQJL9/ZtCgzSobq42OEOH5Ba74HI3rkv7ic03mtQjOW5kojYSeYFTrzA==
X-Received: by 2002:a05:600c:4e05:b0:43c:f8fe:dd82 with SMTP id 5b1f17b1804b1-43ecf90b278mr5431455e9.18.1743712858208;
        Thu, 03 Apr 2025 13:40:58 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c30096ecasm2751545f8f.18.2025.04.03.13.40.57
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 03 Apr 2025 13:40:57 -0700 (PDT)
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
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH-for-10.1 v3 5/9] qtest/bios-tables-test: Add test for -M virt,its=off
Date: Thu,  3 Apr 2025 22:40:25 +0200
Message-ID: <20250403204029.47958-6-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250403204029.47958-1-philmd@linaro.org>
References: <20250403204029.47958-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: ZnsmEj33vY+E

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
