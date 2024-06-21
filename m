Received: by 2002:a17:505:2e08:b0:1bd8:8c49:4f6d with SMTP id ya8csp150319njc;
        Fri, 21 Jun 2024 05:00:15 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWCXc3lDNU41efePlK/xwJe+sv+CBNk4MwZm/3MLyF0yTf1+zvEVOLJaxxecUxOAL30sjgmlK96BhMJluvlvqIjzdWRPWEi
X-Google-Smtp-Source: AGHT+IHv/XhsrR3cQ0fkD5067s7Hf2ECw/M+VGzBPY8Th9WdijCtm+oe/w6ri/IBVPRFZ2pe/jxJ
X-Received: by 2002:a05:620a:4614:b0:793:1a75:177e with SMTP id af79cd13be357-79bb3ed48b2mr910107085a.50.1718971215387;
        Fri, 21 Jun 2024 05:00:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1718971215; cv=none;
        d=google.com; s=arc-20160816;
        b=aM4OFchX7xOPEMgZ33L0vN5gH6TKX7W4bTjfnaOjVi3ux7vFtoEEyv2FvYlzfpOg7G
         VZKzgrUHVyVewf0SNdpcG0fF8Unu/FYZoLzg7p67FNqqlRx6NLj4T5lS6TiZMl1Xga5Z
         xgwYP6nez+8pCN7Kj46yTLG5omyNCtLVQZSJmrg/RzBgtAEF4I846PpWsFIBPZvVdq8W
         mcFTFG+lUkFTOnjdoQu51hTqDfznlwZo1QDrdWkERlepBWJgaR/gwrhciaWEHrg26jG8
         QMoRSAXu1mBoIJu10MyWMnJpAmqAS9tAPCus8Efny5lj4PBoNe5imTPIeLl670vWbvp3
         tk9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=P26r6Q3Zju+dgPdoMaqvuupr7DXX92QUOkTzUVXMtQE=;
        fh=Loxs9jf4utClDuwHOqFyoDBvxRZECJZ6Cb9UnH43IsU=;
        b=Hnh6lLulhvqoheTgGQh+l7+EeY2mfTH4hMffGJgQ0dfXwkmc+01UemPwMnOQrj+KE3
         owWoCuaYkHN5NlZtF3msUUUuA998W1u4PQIKeyeo03hJw/4seYKGjAiYUUa0ScLbkIqf
         MZ1hao/qYzv0NkdvhNx2695OzTEPJTKcm2h0tOaEQqm64pNgokeO0T/hRh5G55uwdt+m
         LU004qrf5Q6mGrPYeatO2tduwhnn4+QonPRKQsvYSGHxcy6U2fT7SgMUWumI34ramcij
         +8mjuEQD56utaChSOovJr72vI6A1EyDHVUGV32TNAilZohWVQpbXWxJAtJz6C47lxr7J
         DdtA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=lwh0FFBw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-79bce95c888si162738385a.708.2024.06.21.05.00.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 21 Jun 2024 05:00:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=lwh0FFBw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sKcvp-0004F5-VK; Fri, 21 Jun 2024 07:59:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1sKcvn-0004EZ-Pt
 for qemu-arm@nongnu.org; Fri, 21 Jun 2024 07:59:52 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1sKcvm-0003BK-8R
 for qemu-arm@nongnu.org; Fri, 21 Jun 2024 07:59:51 -0400
Received: by mail-pl1-x630.google.com with SMTP id
 d9443c01a7336-1f44b5b9de6so15735175ad.3
 for <qemu-arm@nongnu.org>; Fri, 21 Jun 2024 04:59:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1718971188; x=1719575988; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=P26r6Q3Zju+dgPdoMaqvuupr7DXX92QUOkTzUVXMtQE=;
 b=lwh0FFBwUsTxFoaAnmJCcw+W5ewrzdK0meMUgLqItOwLHkhrSwVCQOI7O/7zYCtseF
 +hyCEyeZZ+k9F1ajC39WgL8384SSQ2w9VVrCbtlAdDoLpK+GtDubxZG8cIhKWHriyudI
 94C0AVcy0RY8rDjs3r7/jsTpSEywDNjEORy51oZejX4t2OaZwnncjlLTU39IV4Y6pEoH
 qhK7VNJae5uj6wXFP2ECDCV2bNa6NqzTdRu7glnWkTg1wrtfbsUjy/Y0hXurHhHosRDD
 YPfLtzGslGd9Mr/XOVVFCkCavnGq+j69Hy9LdT+jXwqQNiVHYyZNJSZs93z/qUoWPmXx
 aO8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718971188; x=1719575988;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=P26r6Q3Zju+dgPdoMaqvuupr7DXX92QUOkTzUVXMtQE=;
 b=osmF82jBgLdnAlhmNXtGYDVktJPzEuUdrlMU/VAyxhxaO0Wmm62eZbk4eblrEfQQ9s
 LoH3Ci58rM+4dWXLEGcYL2UGZje0oRa//y9gz+Dl/6a9PCoqrzsJWlQH71Se5FvekbT+
 ehraxV/PwzsNF2VuBXcMvaq92mr4XOe+vILOkwVl88XwbZRXNYCJEObB5L4t9gcCxmZF
 kligT8dsSeVvNJVF1eZ4Bn11Q4zRZsPkcNKsc7oSj+0EBDMW2+QmN0iXsqTFUp5FN3il
 cZ7tNSeAF2S5UdmjUnvFtI2p9duigPOjTAyZk6A3pH0pazw52QBkNJr1FzCQvBcJ088H
 jMtg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUY5q2AaKOcZAmbpidccQ6rXYAFlchFtw+CgNi869VFjf6RFqQPOjajGeAws816tMctU6hSGOE3n1GEndiUAHFs0fWB
X-Gm-Message-State: AOJu0YwIAQhyGIhRxQchkRlPpWmFCmEbXjoRmDvb4LoNVM8waqptmjU4
 RBBQgW4JqQEjBPTSta/X0M87ky6hUycCObKhJPfCb3C8Qb3MG47okFrlnsXMKfw=
X-Received: by 2002:a17:902:f68d:b0:1f9:ada4:5907 with SMTP id
 d9443c01a7336-1f9ada45eccmr73626535ad.36.1718971188588; 
 Fri, 21 Jun 2024 04:59:48 -0700 (PDT)
Received: from sunil-pc.Dlink ([106.51.187.237])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1f9ebbb606dsm12422995ad.270.2024.06.21.04.59.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Jun 2024 04:59:48 -0700 (PDT)
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
 Sunil V L <sunilvl@ventanamicro.com>
Subject: [PATCH v3 06/15] tests/qtest/bios-tables-test.c: Set "arch" for
 aarch64 tests
Date: Fri, 21 Jun 2024 17:28:57 +0530
Message-Id: <20240621115906.1049832-7-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240621115906.1049832-1-sunilvl@ventanamicro.com>
References: <20240621115906.1049832-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pl1-x630.google.com
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
X-TUID: Zf2+cvzSbt7W

To search for expected AML files under ${arch}/${machine} path, set this
field for AARCH64 related test cases.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
---
 tests/qtest/bios-tables-test.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
index 29c52952f4..007c281c9a 100644
--- a/tests/qtest/bios-tables-test.c
+++ b/tests/qtest/bios-tables-test.c
@@ -1591,6 +1591,7 @@ static void test_acpi_aarch64_virt_tcg_memhp(void)
 {
     test_data data = {
         .machine = "virt",
+        .arch = "aarch64",
         .tcg_only = true,
         .uefi_fl1 = "pc-bios/edk2-aarch64-code.fd",
         .uefi_fl2 = "pc-bios/edk2-arm-vars.fd",
@@ -1684,6 +1685,7 @@ static void test_acpi_aarch64_virt_tcg_numamem(void)
 {
     test_data data = {
         .machine = "virt",
+        .arch = "aarch64",
         .tcg_only = true,
         .uefi_fl1 = "pc-bios/edk2-aarch64-code.fd",
         .uefi_fl2 = "pc-bios/edk2-arm-vars.fd",
@@ -1706,6 +1708,7 @@ static void test_acpi_aarch64_virt_tcg_pxb(void)
 {
     test_data data = {
         .machine = "virt",
+        .arch = "aarch64",
         .tcg_only = true,
         .uefi_fl1 = "pc-bios/edk2-aarch64-code.fd",
         .uefi_fl2 = "pc-bios/edk2-arm-vars.fd",
@@ -1779,6 +1782,7 @@ static void test_acpi_aarch64_virt_tcg_acpi_hmat(void)
 {
     test_data data = {
         .machine = "virt",
+        .arch = "aarch64",
         .tcg_only = true,
         .uefi_fl1 = "pc-bios/edk2-aarch64-code.fd",
         .uefi_fl2 = "pc-bios/edk2-arm-vars.fd",
@@ -1935,6 +1939,7 @@ static void test_acpi_aarch64_virt_tcg(void)
 {
     test_data data = {
         .machine = "virt",
+        .arch = "aarch64",
         .tcg_only = true,
         .uefi_fl1 = "pc-bios/edk2-aarch64-code.fd",
         .uefi_fl2 = "pc-bios/edk2-arm-vars.fd",
@@ -1954,6 +1959,7 @@ static void test_acpi_aarch64_virt_tcg_topology(void)
 {
     test_data data = {
         .machine = "virt",
+        .arch = "aarch64",
         .variant = ".topology",
         .tcg_only = true,
         .uefi_fl1 = "pc-bios/edk2-aarch64-code.fd",
@@ -2037,6 +2043,7 @@ static void test_acpi_aarch64_virt_viot(void)
 {
     test_data data = {
         .machine = "virt",
+        .arch = "aarch64",
         .tcg_only = true,
         .uefi_fl1 = "pc-bios/edk2-aarch64-code.fd",
         .uefi_fl2 = "pc-bios/edk2-arm-vars.fd",
@@ -2213,6 +2220,7 @@ static void test_acpi_aarch64_virt_oem_fields(void)
 {
     test_data data = {
         .machine = "virt",
+        .arch = "aarch64",
         .tcg_only = true,
         .uefi_fl1 = "pc-bios/edk2-aarch64-code.fd",
         .uefi_fl2 = "pc-bios/edk2-arm-vars.fd",
-- 
2.40.1

