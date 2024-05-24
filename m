Received: by 2002:a05:7022:4391:b0:7c:9548:a19d with SMTP id bo17csp996648dlb;
        Thu, 23 May 2024 23:15:19 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXcXsGmks6e5z+fcxZispzM+Uc3VQ72xHasvFxKpyWAIWE2dZorcSLuCK75r1UbArpTesdwDBG4WgUu0gPWUwxIddo+Y9lH
X-Google-Smtp-Source: AGHT+IH9Vk5M2AA97Wbh2dE6QKy432UJDBZ0dGyWb+rI0Vbx42yGtWEMM3Jpf6TNpBMYp7YvM+fd
X-Received: by 2002:a05:6214:4383:b0:6ab:5b6d:f267 with SMTP id 6a1803df08f44-6abcd14f08amr11931376d6.62.1716531319420;
        Thu, 23 May 2024 23:15:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1716531319; cv=none;
        d=google.com; s=arc-20160816;
        b=USKSU11p+jZ9jzj9zjz+OQ7RaQ+arcxy2rYDS1xAIrK0axWCY5kfQWaM/mawgHP7a8
         U1h2ObF9K/muLdujdIynhx70D9GeaDqoZpNN3yI+LadrXkRUasU9dKPVhFd2mY6XB2G1
         0Oj6D+8B5ekodM53BG9LmW/JcaNDUt3GSy4FBgRB264PPEb6c4H7f03JVfRMK3Uw4rqD
         wiD/rkcakcEWWebft6uyV1AgYqEb00HW0upC7yBL+E3i5hY4T3N1J/NYF+8g3Sp+xmLt
         DRmI2/NoE/HoVVA/TEcDr/udMrkjZDy+1kL+4cWt9z3QuUhhdA7KmaN4BbXI2eUDxHbQ
         z7+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=z1Eqcr/d3uZfCa8qj91JJAFXeTkvWdNBVBE+rMqWilI=;
        fh=tVP6prXqKg8zre+X1pzvc/sYfTiLP0d87H/qbzmyRDc=;
        b=Xhes3pkNp+JVUMFIRjWGGzm5yVt1i0VdLeLv2J0f422hFY1D3eV1HslSN0IOG1NsZ7
         MsHwXE54kgCD7idH3FZLVOjle4YClpXgBIXebT7NFNSWtYzDiOyhnWcfhxLOeplcWlcN
         M4TzPka0QuFuADTneDeMeEU3XoHSReY4GLuPXk9FBl/wt8V/zNik9WDBJOKvOkxOIF87
         9DA7Wt92d0QvN+tNj2mU5eeHJtFpvISr9WFnDsba5t+N/eYn/hr4fOEgid5RIjLfBYQm
         +hcFdK/Oq8MPszJBW1/0LCPtCcP2xAUKr2Dw/GiA41MyuQk2gWTJwsDV7OOQ0CT8OSxp
         uE5A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=D1TAHvcH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6ac06f500casi9574696d6.93.2024.05.23.23.15.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 May 2024 23:15:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=D1TAHvcH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sAOCf-0002Ac-Nv; Fri, 24 May 2024 02:14:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1sAOCd-00027w-0o
 for qemu-arm@nongnu.org; Fri, 24 May 2024 02:14:55 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1sAOCa-0001Dp-5h
 for qemu-arm@nongnu.org; Fri, 24 May 2024 02:14:53 -0400
Received: by mail-pg1-x530.google.com with SMTP id
 41be03b00d2f7-662aeb8d157so2747503a12.1
 for <qemu-arm@nongnu.org>; Thu, 23 May 2024 23:14:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1716531290; x=1717136090; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=z1Eqcr/d3uZfCa8qj91JJAFXeTkvWdNBVBE+rMqWilI=;
 b=D1TAHvcHqoOCZvsSFAPM3WU25rCsH3phQMgdWg4uKzvxV6Rraw/pGjScA/lbjNw2x9
 i+MEVFq+Ra/MZdUPldUDLj7nqE4JlVnwXUY69fUWM7L711IG+pok9A/4n3WAxM86SkUk
 /YCW0aucCaQMlGu4qxXxKShoroqeqPCW6aENSZxdIB5Y9Z7WytC+dj1+sUVACszj25fk
 LlNbM5HXpMyrBFZlJdcsxa4NLswGMFdOFWO52/0yAph1p8hXWbwj4j+1bRqjS+bs/UUC
 UmAmyKq3HinaTVInzvwSPMH7O+GxqxzfFrOqkihYMoiiA/hnKsmNPL4amOcupLkMI3Ri
 uXEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716531290; x=1717136090;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=z1Eqcr/d3uZfCa8qj91JJAFXeTkvWdNBVBE+rMqWilI=;
 b=ggabuaCQua90dgj3YHldPdCDpgDokV+84/PoAjGWGwe4K9wN89G1RLFWsPNNN+GV/M
 e0q2mXFRIvNHtBxQh8BsoIcxvzXI32rC/lZwnPxez6XUhYiIBKT1q60G0jpYBDJNa5nf
 LSwsgv+fpWr9YHFz/LjT/t6LZWhFkgxHaHfGkwLVvrNq/b3s+tfndwZLo2q+Vhb3My+A
 LYcb7oPHyWM7reypcCuELeJbD/z6czsT3wk+VTNlbyTZM/OoZ9Vg2j7f05buitvEi4+N
 0wtUMuyUTcNhF5tWWzR+XXePQsdjjAfh3qmUfO4bbZRD8cN6hOPlvw74earvn0cD1Eqs
 xF3Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWXGlXGA570ng+YidFZ4Qz+cACM6sFQdblWbPHmWZHiOLWBBm8x1L4pbher71cONmQSekNeAn80CVLhPuub8d6PvJTp
X-Gm-Message-State: AOJu0Yz5RpPbMBabl3ZeWauJGzo28p9S0ugJjeyygHWTLFCRqTLwu1tS
 EWqs0aWFu2aYqASpXghDvjzHsjqN6bKUjK+a7LX5C88w7xf1juWkiz/Cgsl0T5U=
X-Received: by 2002:a05:6a20:6a1f:b0:1b1:e7de:4d39 with SMTP id
 adf61e73a8af0-1b212d054b5mr1854250637.16.1716531289669; 
 Thu, 23 May 2024 23:14:49 -0700 (PDT)
Received: from sunil-pc.Dlink ([106.51.188.31])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-6f8fcbea487sm516106b3a.107.2024.05.23.23.14.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 May 2024 23:14:49 -0700 (PDT)
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
 Alistair Francis <alistair23@gmail.com>,
 Sia Jee Heng <jeeheng.sia@starfivetech.com>,
 Haibo1 Xu <haibo1.xu@intel.com>, Anup Patel <apatel@ventanamicro.com>,
 Andrew Jones <ajones@ventanamicro.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bmeng.cn@gmail.com>,
 Weiwei Li <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Sunil V L <sunilvl@ventanamicro.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v2 04/12] qtest: bios-tables-test: Rename aarch64 tests with
 aarch64 in them
Date: Fri, 24 May 2024 11:44:03 +0530
Message-Id: <20240524061411.341599-5-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240524061411.341599-1-sunilvl@ventanamicro.com>
References: <20240524061411.341599-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pg1-x530.google.com
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
X-TUID: jXMayQ38qcS3

Existing AARCH64 virt test functions do not have AARCH64 in their name.
To add RISC-V virt related test cases, better to rename existing
functions to indicate they are ARM only.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
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

