Received: by 2002:a17:505:2e08:b0:1bd8:8c49:4f6d with SMTP id ya8csp150559njc;
        Fri, 21 Jun 2024 05:01:04 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXRVOPc57WvdHcA0CmoGnKxu0J3/dWSga4ZLFlg4mYzkFWDh+M1hs7Nh3icj7Hna/73cw9L62xVqZkh8P+lrUNp6Qr4xbOS
X-Google-Smtp-Source: AGHT+IHte5YeD2ApLusai1SQFjUmYDXK/tU9lwL09YqByO+I+pUZMBEXhm/T6yOPv/8vqCYhbhnm
X-Received: by 2002:a05:620a:2552:b0:79a:2613:9b40 with SMTP id af79cd13be357-79bb3ebe6c9mr924772385a.50.1718971263845;
        Fri, 21 Jun 2024 05:01:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1718971263; cv=none;
        d=google.com; s=arc-20160816;
        b=KT7sOqLZZmfZRky8Rbd7pvHgun8SJY4ae6fODKnu3h7XXxA15hjwNeiGamKZn8zUjY
         EiT5w0GtDUe4WDdJgKHmtctPEfqjwB5G8jY0bLaZRYxzyiX/0V+G+FgstCQVrD7lnrAb
         EHsO2aD2jQI0g5yXX2J7WcZasJwZR4BsZjKn0F43DX2TjCC4ch7IbAcvc9UtWjtylIb+
         L+gVHX3+RIQg2NxyLo6LW22kIyjMLvFwtGLKBuwwVgV7hkg5r9cnuYAnWwejGeYUb+rH
         fZG4ZPj5j3APyOvYCMzY+t3v2XDWgSZpwPuLNx0MKQshGg5ynYZDmw25v4LsmjQLX/S0
         SC/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=6c1DsoTK4qkNqQ5UnD/HyJUGXiusN7arWuORYSBvEOQ=;
        fh=qZgpKIXxHy4yfaB1GWlKVvm8QHYKik6dfCsVknhcV9M=;
        b=xDGiHaPV0TFx0XtGQQEyroW6KFDuvkUh9vDPaXLrtKfCY3Cjvp2ye3IUel/SXlTQrM
         wA4vwJ6F1QXQcB6sqsB5+4314CzwHL9YFanV892F6kvjImilO92ONeVM9kLqwIa9iUOl
         S4RiwS6c51IMcfiWFQOgReZh0+IfS/xBxph2xdAQCSXdc+pqL+IgXxEcclY0JodIhwqn
         stx0jz3lliNDiVPpUjfUngBhRtdAu6gnR7SvIMeHgH++LxtG9+t7v0GWIUHEG079BRnk
         hvN7IR1M0wpLpD47MTvlFX3z111WBX2PgKfvGTQNOAM1wpZgwzN9Ahc96NxkErJek7o6
         27Lw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=OGfwxriM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-79bce9154aasi172286285a.372.2024.06.21.05.01.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 21 Jun 2024 05:01:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=OGfwxriM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sKcve-0004BJ-Bf; Fri, 21 Jun 2024 07:59:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1sKcvd-0004AZ-4m
 for qemu-arm@nongnu.org; Fri, 21 Jun 2024 07:59:41 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1sKcvb-00039q-BT
 for qemu-arm@nongnu.org; Fri, 21 Jun 2024 07:59:40 -0400
Received: by mail-pl1-x62f.google.com with SMTP id
 d9443c01a7336-1f9fb3ca81bso1343065ad.3
 for <qemu-arm@nongnu.org>; Fri, 21 Jun 2024 04:59:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1718971178; x=1719575978; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6c1DsoTK4qkNqQ5UnD/HyJUGXiusN7arWuORYSBvEOQ=;
 b=OGfwxriMheDrfECbuCGB1tmX82ez0Ta9m+gi3erHVbVWL7BQ1vQGt5JdNthCoLFq2x
 0zkK4SGSWayjsJLaHnqlx6S27J6Qn3soU27XW1OPtHTmfKh2/lFh5WM1GfKfjMMyMCha
 VDM28DLyTEyV6GKRx6eFZ9Tlyw3KgbgcT0nT9wEd6uovMcw4ny/JMG33PbCNeMX+Aahg
 nOF+GBOCdAUR5GExY1CshL+bvP75eoPPpXSL7a6gpjRVlrsStu2zNwuHuWk9hg1sPmPZ
 Ryq7F5krnqgYtzT9TKZ+xLi+0LAUqG6HuG7yxWWdjrkUgH3OtPzqB0k4ISlL2JUbWbWD
 GJSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718971178; x=1719575978;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6c1DsoTK4qkNqQ5UnD/HyJUGXiusN7arWuORYSBvEOQ=;
 b=TEA3xklzqBB0NHFT3ic2Gn9EEyqxOpakg0Y/HH45eKtbSW3S+3GH1MKc9YkSgG11Rg
 bZoeXo5vQzOJrhkK+SUNFg3WBV694MOTrBd0xjXsWN5lM4xyMDimNIII09hey5bpwcpW
 ek/wwg2i3jl9wGNft0cyjSYbdXNRipvL8SLmONnzDBhvp2wM6mwzF1x8iN9VrTnTeqTO
 82iTIwr7/linSfrOEOnjbvlK5SpYBr0aRC04vCdJ+2PEUhD1sNCytRsnVk6h0F3AKSKD
 NLjVcoNgOckgfkL856Ryk6Ib5um6y+5hhdr3mEQn0HBuG5KlAFLc3rAF6y0unYIrQb7Y
 NIdg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUhQyZew9thztd47OVmmWLWiZJ+BKEQIyry8F3JfBYsQ1XT27BUa+V6QbR+B+X4S0u2nECOa9wEUtrWde7vd3oMJy/a
X-Gm-Message-State: AOJu0YxcaRX3nlvmlC/Ue9LkVH9nzSGXWmFA6zFDE08J8RRslbDffCZO
 7kXwlRpCAxY8CpoKHkK0dRv9oWhon96B5MgvizOdjvvDd2dlk5zbr5xtkW05P7Y=
X-Received: by 2002:a17:902:da84:b0:1f6:7f45:4d37 with SMTP id
 d9443c01a7336-1f9aa67eff5mr89629415ad.66.1718971177494; 
 Fri, 21 Jun 2024 04:59:37 -0700 (PDT)
Received: from sunil-pc.Dlink ([106.51.187.237])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1f9ebbb606dsm12422995ad.270.2024.06.21.04.59.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Jun 2024 04:59:37 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <anisinha@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Sia Jee Heng <jeeheng.sia@starfivetech.com>,
 Alistair Francis <alistair23@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bmeng.cn@gmail.com>,
 Weiwei Li <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Sunil V L <sunilvl@ventanamicro.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v3 04/15] qtest: bios-tables-test: Rename aarch64 tests with
 aarch64 in them
Date: Fri, 21 Jun 2024 17:28:55 +0530
Message-Id: <20240621115906.1049832-5-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240621115906.1049832-1-sunilvl@ventanamicro.com>
References: <20240621115906.1049832-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pl1-x62f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: sEF04JNAr1lt

Existing AARCH64 virt test functions do not have AARCH64 in their name.
To add RISC-V virt related test cases, better to rename existing
functions to indicate they are ARM only.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
---
 tests/qtest/bios-tables-test.c | 35 ++++++++++++++++++----------------
 1 file changed, 19 insertions(+), 16 deletions(-)

diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
index d1ff4db7a2..c4a4d1c7bf 100644
--- a/tests/qtest/bios-tables-test.c
+++ b/tests/qtest/bios-tables-test.c
@@ -1570,7 +1570,7 @@ static void test_acpi_piix4_tcg_dimm_pxm(void)
     test_acpi_tcg_dimm_pxm(MACHINE_PC);
 }
 
-static void test_acpi_virt_tcg_memhp(void)
+static void test_acpi_aarch64_virt_tcg_memhp(void)
 {
     test_data data = {
         .machine = "virt",
@@ -1663,7 +1663,7 @@ static void test_acpi_microvm_ioapic2_tcg(void)
     free_test_data(&data);
 }
 
-static void test_acpi_virt_tcg_numamem(void)
+static void test_acpi_aarch64_virt_tcg_numamem(void)
 {
     test_data data = {
         .machine = "virt",
@@ -1685,7 +1685,7 @@ static void test_acpi_virt_tcg_numamem(void)
 
 }
 
-static void test_acpi_virt_tcg_pxb(void)
+static void test_acpi_aarch64_virt_tcg_pxb(void)
 {
     test_data data = {
         .machine = "virt",
@@ -1758,7 +1758,7 @@ static void test_acpi_piix4_tcg_acpi_hmat(void)
     test_acpi_tcg_acpi_hmat(MACHINE_PC);
 }
 
-static void test_acpi_virt_tcg_acpi_hmat(void)
+static void test_acpi_aarch64_virt_tcg_acpi_hmat(void)
 {
     test_data data = {
         .machine = "virt",
@@ -1914,7 +1914,7 @@ static void test_acpi_microvm_acpi_erst(void)
 }
 #endif /* CONFIG_POSIX */
 
-static void test_acpi_virt_tcg(void)
+static void test_acpi_aarch64_virt_tcg(void)
 {
     test_data data = {
         .machine = "virt",
@@ -1933,7 +1933,7 @@ static void test_acpi_virt_tcg(void)
     free_test_data(&data);
 }
 
-static void test_acpi_virt_tcg_topology(void)
+static void test_acpi_aarch64_virt_tcg_topology(void)
 {
     test_data data = {
         .machine = "virt",
@@ -2016,7 +2016,7 @@ static void test_acpi_q35_cxl(void)
 }
 #endif /* CONFIG_POSIX */
 
-static void test_acpi_virt_viot(void)
+static void test_acpi_aarch64_virt_viot(void)
 {
     test_data data = {
         .machine = "virt",
@@ -2192,7 +2192,7 @@ static void test_acpi_microvm_oem_fields(void)
     g_free(args);
 }
 
-static void test_acpi_virt_oem_fields(void)
+static void test_acpi_aarch64_virt_oem_fields(void)
 {
     test_data data = {
         .machine = "virt",
@@ -2364,16 +2364,19 @@ int main(int argc, char *argv[])
         }
     } else if (strcmp(arch, "aarch64") == 0) {
         if (has_tcg && qtest_has_device("virtio-blk-pci")) {
-            qtest_add_func("acpi/virt", test_acpi_virt_tcg);
+            qtest_add_func("acpi/virt", test_acpi_aarch64_virt_tcg);
             qtest_add_func("acpi/virt/acpihmatvirt",
-                            test_acpi_virt_tcg_acpi_hmat);
-            qtest_add_func("acpi/virt/topology", test_acpi_virt_tcg_topology);
-            qtest_add_func("acpi/virt/numamem", test_acpi_virt_tcg_numamem);
-            qtest_add_func("acpi/virt/memhp", test_acpi_virt_tcg_memhp);
-            qtest_add_func("acpi/virt/pxb", test_acpi_virt_tcg_pxb);
-            qtest_add_func("acpi/virt/oem-fields", test_acpi_virt_oem_fields);
+                           test_acpi_aarch64_virt_tcg_acpi_hmat);
+            qtest_add_func("acpi/virt/topology",
+                           test_acpi_aarch64_virt_tcg_topology);
+            qtest_add_func("acpi/virt/numamem",
+                           test_acpi_aarch64_virt_tcg_numamem);
+            qtest_add_func("acpi/virt/memhp", test_acpi_aarch64_virt_tcg_memhp);
+            qtest_add_func("acpi/virt/pxb", test_acpi_aarch64_virt_tcg_pxb);
+            qtest_add_func("acpi/virt/oem-fields",
+                           test_acpi_aarch64_virt_oem_fields);
             if (qtest_has_device("virtio-iommu-pci")) {
-                qtest_add_func("acpi/virt/viot", test_acpi_virt_viot);
+                qtest_add_func("acpi/virt/viot", test_acpi_aarch64_virt_viot);
             }
         }
     }
-- 
2.40.1

