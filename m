Received: by 2002:a17:505:2d08:b0:1be7:c013:c773 with SMTP id xy8csp699524njc;
        Tue, 25 Jun 2024 08:11:05 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXe6SnUdz9Ou5Xs8i+4k+1cVER1VELPFdmtbWt2X1uRz+wX+yQKJ0MJyuqcfhaAv85mJcdkuJ7px16miYz8JHWdOp5oc6uU
X-Google-Smtp-Source: AGHT+IH+YU20J/4S1dUECP8nhH/3ktdHvxvaMXxq3ZhuIrs0NqqLA2pj36OrbFuRzaPYBLO9UDtv
X-Received: by 2002:a0c:8d84:0:b0:6b2:d007:886e with SMTP id 6a1803df08f44-6b540acfbb8mr76951546d6.54.1719328265110;
        Tue, 25 Jun 2024 08:11:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1719328265; cv=none;
        d=google.com; s=arc-20160816;
        b=NwCtG3zJmfJTj6Sj+C7XCjz05QnG7/J8HF2TqqTbwuEBGf6bTwr2816K6wTAw0j2ls
         9B8FujOtK7FX/S3lLWyEDDIy3RFMah54NCXTAqyBHbs1A8wLMaaKcan5aBJs8mJtv0Ff
         WQ2EYgVMZGZluxw9E4+gNEK4ZH4dHBUSO0FjslBdrqqCltFC5x9DCGAtPUJlhRjsasHY
         r7b5d1PTXg0RLXtveTEWhGkKmYJPyTUM8wX9+kgEZMI212v53oEQt24HOXbXVPnghHxX
         bcTh7dGwshxDNejRk6fJoPBZYkHHoW1F61jlSKQEigY8YWTXvVNzjhiLZmrL8CY/ZR1Z
         asIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=ekscQEnP3gpmZV2Wq3Q1zFJVqJpw78Y8pmFq27S2T54=;
        fh=gZqsKo5EbTATTgC/MAbkS23yq5CRLeoEzofPwhlLI3c=;
        b=vVRzAg8XTil9+JxTQvLNaHJB5e+q4XVTBKXBslcR6fWI8dwcqcZ2/roVAYZDbslkbx
         8O3vFbdfBz1lsnyGxQTrkrmcv/AJ+mhjXYANQkZ0ZfwnBgXQ/2N+MPPohFfQJNhptjug
         IyFR9zy/szG9I2WlWG+r2PeSziMwK5P8rdlQNBEZFIgV7pG4qdg6avl6adWapqKrSB3j
         qfvCCsZKFxHrQ1p23VBtw0/Wp9GRgNp61Lx9qfONkwYi11qEPJvdx8W+2y9cCsebzPQr
         kG10G1scBdTRXCJVSmtc/+Q0G8Ts5HTve/waCJg6L8Y6+YZPC8Ch4oV7CwhtdqSxXH2N
         RJvg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=awpOqezg;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6b51eceb875si109320846d6.45.2024.06.25.08.11.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Jun 2024 08:11:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=awpOqezg;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1sM7oO-0002zD-68; Tue, 25 Jun 2024 11:10:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1sM7oM-0002xs-Nz
 for qemu-devel@nongnu.org; Tue, 25 Jun 2024 11:10:22 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1sM7oK-0006pu-7U
 for qemu-devel@nongnu.org; Tue, 25 Jun 2024 11:10:22 -0400
Received: by mail-pf1-x42b.google.com with SMTP id
 d2e1a72fcca58-7024d571d8eso4418567b3a.0
 for <qemu-devel@nongnu.org>; Tue, 25 Jun 2024 08:10:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1719328218; x=1719933018; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ekscQEnP3gpmZV2Wq3Q1zFJVqJpw78Y8pmFq27S2T54=;
 b=awpOqezgpP9C9R3PB+cs8eaDvoyds3/lgeiybcTDwX5G0p5djX7pz6msw0TdvbAbzz
 8qpJWTvAlwIE5jPZxAKovHrt40SyCh1y05Hl6tHf/fReufjXiUI9smSruOJbMQJFnwlv
 q6tXwk5gAB5E2jeiOrx1ZdYyZ2JFgNjIqfWaBwGyd/wUnw0rI74EiOuXNzMyFB8pnePG
 V5hWzuHEplpyqVcOb81cH3Ka0yYBjeHWW4dV5VeeIc5bQQ9TMtwLOsS+PDVMMm/nePs0
 c7p89Z4ZAzludJljhLeQKLdwvh2CUemO0twHL65qOmMRJsnyf+OtWpo+BE0HZC3lLC5f
 ObrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719328218; x=1719933018;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ekscQEnP3gpmZV2Wq3Q1zFJVqJpw78Y8pmFq27S2T54=;
 b=Z0rRE5CzADA4tyr4GqimRMjzscvwC6Cg9mwyh2WOhcWh3rzqkNQJEVmMFPhNo/xGgJ
 28A7faPO+JH9+3VaxZqA4xe3RfDWURLODy6wol5KVWCpJbiA7jZJjMGBrb5P93RbCSSP
 c7kMfqpr30tZ5IWAcwcT1uFfHTI+bP5rCJcwMTa1y4n2kgAn46tsKBXJ8bnG6AFDBlhP
 xwCoI6KPFupdVj7qGxTnpgRnNYWG+2ctHz2WFoEq4A9cZvywsTW1mskw6KXugxQK09E/
 6+q46mVUEzvk+Nk5ZYvD1t+/9z9isvvlHX6RRFyIXzy/5Hkn3G7PmChKW4HTyswFeDxP
 Qzww==
X-Gm-Message-State: AOJu0Ywvmzpdm9zp+0hWsNbpk+Lqqk8aX/xFox0GyYabsuIIaYv9dN4o
 27lPc7x0bx6ElQC4P3feX+odZy/uZWSER58PtbQtA6tYTd7xfyTtvxUgflUzgt7r3wpQaKx0YR8
 4
X-Received: by 2002:a05:6a00:2d9b:b0:6ed:cd4c:cc1a with SMTP id
 d2e1a72fcca58-706745be4bamr9530589b3a.8.1719328218235; 
 Tue, 25 Jun 2024 08:10:18 -0700 (PDT)
Received: from sunil-pc.Dlink ([106.51.187.237])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-70681722219sm4142636b3a.73.2024.06.25.08.10.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jun 2024 08:10:17 -0700 (PDT)
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
Subject: [PATCH v4 15/16] tests/qtest/bios-tables-test.c: Enable basic testing
 for RISC-V
Date: Tue, 25 Jun 2024 20:38:38 +0530
Message-Id: <20240625150839.1358279-16-sunilvl@ventanamicro.com>
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
X-TUID: yi4gzUQVagFu

Add basic ACPI table test case for RISC-V.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
---
 tests/qtest/bios-tables-test.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
index f4c4704bab..0f9c654e96 100644
--- a/tests/qtest/bios-tables-test.c
+++ b/tests/qtest/bios-tables-test.c
@@ -1977,6 +1977,28 @@ static void test_acpi_microvm_acpi_erst(void)
 }
 #endif /* CONFIG_POSIX */
 
+static void test_acpi_riscv64_virt_tcg(void)
+{
+    test_data data = {
+        .machine = "virt",
+        .arch = "riscv64",
+        .tcg_only = true,
+        .uefi_fl1 = "pc-bios/edk2-riscv-code.fd",
+        .uefi_fl2 = "pc-bios/edk2-riscv-vars.fd",
+        .cd = "tests/data/uefi-boot-images/bios-tables-test.riscv64.iso.qcow2",
+        .ram_start = 0x80000000ULL,
+        .scan_len = 128ULL * 1024 * 1024,
+    };
+
+    /*
+     * RHCT will have ISA string encoded. To reduce the effort
+     * of updating expected AML file for any new default ISA extension,
+     * use the profile rva22s64.
+     */
+    test_acpi_one("-cpu rva22s64 ", &data);
+    free_test_data(&data);
+}
+
 static void test_acpi_aarch64_virt_tcg(void)
 {
     test_data data = {
@@ -2455,6 +2477,10 @@ int main(int argc, char *argv[])
                 qtest_add_func("acpi/virt/viot", test_acpi_aarch64_virt_viot);
             }
         }
+    } else if (strcmp(arch, "riscv64") == 0) {
+        if (has_tcg && qtest_has_device("virtio-blk-pci")) {
+            qtest_add_func("acpi/virt", test_acpi_riscv64_virt_tcg);
+        }
     }
     ret = g_test_run();
     boot_sector_cleanup(disk);
-- 
2.40.1

