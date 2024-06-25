Received: by 2002:a17:505:2d08:b0:1be7:c013:c773 with SMTP id xy8csp699648njc;
        Tue, 25 Jun 2024 08:11:26 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVD3oGRIfOUkgdbW1DFEYzv4WOFanbpvOYjnvot1jWcP2XMfEqf7RWlWx3MaAlEMoQ1E5ei+fAVpLjEJPwz1GYA8RJeCiS7
X-Google-Smtp-Source: AGHT+IHJIZ4+cIraSlrZB0NUlEpxBliV4zgvr5KW8IfrKA0/KhpzjUE3E73qKrs1HPTgJrzWV4BN
X-Received: by 2002:a05:6122:202a:b0:4ed:12b:ec99 with SMTP id 71dfb90a1353d-4ef6d7d0b6fmr6664042e0c.3.1719328286277;
        Tue, 25 Jun 2024 08:11:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1719328286; cv=none;
        d=google.com; s=arc-20160816;
        b=OhMj9xwzQmziOcx4Kny4Uy/2uQE54Kppbs6qaba6p4ZwVVxgZk9mieL5tWhIhsQOYe
         54i5JyomTTGIFTTr3x24VIwe+H1DkV1oNo2UsQ9nq9duO9jOeGTfdzUkx8VGvQdxZbZP
         jm5G6AKeweihQdCouEWVZKEotosHvAeKbXI18xeaP5/AsWBzQMsV05VzQ2jtsTl/Utsf
         1Y+4p9RFusuulC6WG0E111H8Sp5LB4MhyeZXNmqX0O0NK/61G1YsSmmSWygDIAFBBG9G
         h7z6cK+VvagRff51wdpcD7XjX2NZi3TUHvwkzNaYp2URofkqfpwI9864GCmUrR2xof4R
         fIZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=6c1DsoTK4qkNqQ5UnD/HyJUGXiusN7arWuORYSBvEOQ=;
        fh=gZqsKo5EbTATTgC/MAbkS23yq5CRLeoEzofPwhlLI3c=;
        b=gc5VSVD0a0V5l2zhapRRMiBuJsNs8qV558ySNhzJClI9bV6N3ZDxVBMHGKV/q2ONl2
         iuz682NGbNvpLYg2jJfo0H6ea3uUFz95/Fx8dQ7jQuhQNw0CYbpCUSgtEvQ++XnbuUTD
         NVocY4Xmih1JHCH+FglJ/cRtWYoutTKa4K36K58kfMONhyK7OZwzE7sxVrJGlxQqr/JV
         ebVEpjkUiooJ1yAwKWzUqiv9b3mHrjfklGW5Mip3GTvS62vWFgGrFtYjVeziCBhZD7Ku
         kfg6iZHItxHk9hdkPUftsdL3X4YCQi0ZOgrbZWMJ4j7nSAguKo7V7vhqgMH5bFQY4fDq
         c+MQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=lFJF7FkC;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 71dfb90a1353d-4ef7671c362si654139e0c.232.2024.06.25.08.11.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Jun 2024 08:11:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=lFJF7FkC;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1sM7nQ-0001Rm-Pe; Tue, 25 Jun 2024 11:09:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1sM7nO-0001Py-RN
 for qemu-devel@nongnu.org; Tue, 25 Jun 2024 11:09:22 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1sM7nM-0006Tp-Af
 for qemu-devel@nongnu.org; Tue, 25 Jun 2024 11:09:22 -0400
Received: by mail-pf1-x42b.google.com with SMTP id
 d2e1a72fcca58-706683e5249so2490339b3a.2
 for <qemu-devel@nongnu.org>; Tue, 25 Jun 2024 08:09:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1719328158; x=1719932958; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6c1DsoTK4qkNqQ5UnD/HyJUGXiusN7arWuORYSBvEOQ=;
 b=lFJF7FkCcErSIQT8gcnoouBD+y6AI1q/ga+sjbAL3M6daihmx+hZQRQCXGVx2D3CzA
 zRJKVY4qUT7JXiB7mYuavIkmN3H4Xb/jlDIm6GKJCGerKiAnVLnaURAt9h9bM3bIu01z
 +iAPTC3lOj3RjPgwIsH2ug7t/NG34XoiYxiVSdeUf8YU1Wim7Yb2dWUiarw/oa2aOOFj
 zb8Kv+6FEDKqNnexdwzNhkNycCrTYe8Uo2ux788WPVsidhuBbLE5pvd2DZfUN9BBpBpp
 GXJWkVAZpT4IUcTP54WfCTfFhqkhgQgfauSTSo3DlIXB9Q8zuCP38uoXWR7JNZY2kubL
 bitQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719328158; x=1719932958;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6c1DsoTK4qkNqQ5UnD/HyJUGXiusN7arWuORYSBvEOQ=;
 b=aS4OZLMQT3FQJW5kiwYxetuuEfPEOY1yumDIqaSkh5JqPV5Ne5gMTG1vJadx4DbmiW
 zD4bRsIrDMcNftKI3bXnWQ+s1IAbbbNcBo8/Fg0BfRs9HyWxcrzXTKWR2mU5S9XL3zTF
 5wChT5Vb45ngPgc6646PgkC4gmFjkrMzphkdIam5esrBUnhhcO5ab0Eb/Vk07UXwZMzL
 7fSn8sAv+6XiHRY1jGM3n1wpbVy60iR24Uf2OlfHd6Hxy82MSNDMHVBOlFZW0dpDTSW4
 xENAK23JGpoRw9/Ng0Y5FSx0+67GIgnIv7YWJuSav5yGD3sqWIvh/QbtJ5FBLpY8NVc9
 gdyw==
X-Gm-Message-State: AOJu0Yx6Xb71CEWoBA6OOJ4ikusf7xPRZ1bSd1yWirMSfjhQn4XAd+CU
 lxxtgrmHeke2PXd1CfarM8rCv52yFEX3ic7n9VYwr8qeqSgKNLv619/w4rnGU7ubLKTxlfl7qTB
 Y
X-Received: by 2002:aa7:8d02:0:b0:706:62d9:a4f1 with SMTP id
 d2e1a72fcca58-706746b5ddemr7499131b3a.31.1719328157963; 
 Tue, 25 Jun 2024 08:09:17 -0700 (PDT)
Received: from sunil-pc.Dlink ([106.51.187.237])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-70681722219sm4142636b3a.73.2024.06.25.08.09.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jun 2024 08:09:17 -0700 (PDT)
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
Subject: [PATCH v4 05/16] qtest: bios-tables-test: Rename aarch64 tests with
 aarch64 in them
Date: Tue, 25 Jun 2024 20:38:28 +0530
Message-Id: <20240625150839.1358279-6-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240625150839.1358279-1-sunilvl@ventanamicro.com>
References: <20240625150839.1358279-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pf1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: TKb3UYIeH4zj

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

