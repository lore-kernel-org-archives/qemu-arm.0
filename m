Received: by 2002:a17:505:2e08:b0:1bd8:8c49:4f6d with SMTP id ya8csp151179njc;
        Fri, 21 Jun 2024 05:02:48 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW8wdAecUN5b41lO7GKk0dpM8qJJeBJKqebLBwGMhgMsmd3IwYvmmu0goam8MlkiMnJDK9u7xyP9HV4jrQbvltVELE0H0ct
X-Google-Smtp-Source: AGHT+IFp6pfz+rjG5FgqSExB2C/RWchIsJ33Ep1OPbmASCneRLdcEYU4M+8D0FTmZQ7LOoIPIhaL
X-Received: by 2002:ac8:7d91:0:b0:440:e9b1:27e with SMTP id d75a77b69052e-444a7a88034mr81566231cf.62.1718971367954;
        Fri, 21 Jun 2024 05:02:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1718971367; cv=none;
        d=google.com; s=arc-20160816;
        b=O85bbtfwR2qLwhWDGEAePKYFMAYkYLItKlfl4RhHuuT1beXq0gkkONnHkzw1BN9bO0
         DG9+yDgK9yJ+bsD/SPe900qieBk38Gz3BOJPu251xcwsSW9ktTpBVWQjx4GiUU+f0f/o
         W8vAjCc8XaXJkcbLp5ce5CR1H0gojHXegJT+k4KS8ggtFd+0UXG4/Ty1IB4WE6TzbOUh
         OnFb5y45+d6M9ZVbH44sbYzqS1iSyI6HRtroIukHQhPZKBbJySpup/LzH9k1dO7jBK3o
         Ahog6bPjrnuJEtVhzv15oA0beuehB5a/9n73xVDtuhVEjoNvJLlT26loxXBC+KMAFIxO
         Xr+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=dVxhK0fB9Ra8wY3dlUrFv+CNs7d3zccuzBsOAkhusgw=;
        fh=gZqsKo5EbTATTgC/MAbkS23yq5CRLeoEzofPwhlLI3c=;
        b=bdVtfzqCFK5WYQqEQIL1ZEsJx+BNb8xnhWw6xUqYto0Zj+5ayekY0NdvVj0+4c5ii1
         XrdhMRm4sptjRytBlX/JeZPzi8s2Vahc5R4tK0o3QngQurYlExmb1yjEDPKBkTpEbSWc
         lIYaDXepFFS+EJQWUl2PPFoz7kfpiZUToYzJlru89KPZDTuNtYsQgqgF5+ttrM/4rqCb
         VJS/B5cNiy37F481mycahFSQRG8aMXaNvIaozYn1IVkt8zifOrCqUn7ugpSJTr9iUHF2
         OrMNMSRn3f7bae6lQoZkO+8SEo3dKAd8k/M12vQeHSa1FeXiBrUYkfdYCP7aaNfPSpjy
         ybBg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=gHwdUQVq;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-444c4fc7af9si12346161cf.251.2024.06.21.05.02.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 21 Jun 2024 05:02:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=gHwdUQVq;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1sKcwx-0006VV-A7; Fri, 21 Jun 2024 08:01:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1sKcwc-0005uW-AK
 for qemu-devel@nongnu.org; Fri, 21 Jun 2024 08:00:46 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1sKcwa-0003jS-Kq
 for qemu-devel@nongnu.org; Fri, 21 Jun 2024 08:00:42 -0400
Received: by mail-pl1-x633.google.com with SMTP id
 d9443c01a7336-1f4c7b022f8so17201875ad.1
 for <qemu-devel@nongnu.org>; Fri, 21 Jun 2024 05:00:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1718971237; x=1719576037; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dVxhK0fB9Ra8wY3dlUrFv+CNs7d3zccuzBsOAkhusgw=;
 b=gHwdUQVq4wAZFxx+76kvdVUno0w8d4QnL21m0l0jOS56hHwfTG44qCzmbyz16no/fa
 7iZHsCYwsh1bQQPTNPLVbgi8EgCh0nWICE0phMA/8g1s2I6MZX3CQ6zGntCi7lbuTGgT
 WCNx0XgXiEkWhNOVfvMpGCkPYwxzYewcei0VfmdcLftlbO3T1NnZy337lXjDEEhS9jiA
 NJsnbZwDp3QerAqSg6NqT283OJwwPd/JM1egZ7tws6kwdzJCRTFoG8gwEH59m10U4K5W
 4dtgZzinWsWKVJdBySa+AMCIPSg5FYo2xVG4xc7i2w7j0UH/to7Dlx9c4pNW+LSdcGx7
 Y5Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718971237; x=1719576037;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dVxhK0fB9Ra8wY3dlUrFv+CNs7d3zccuzBsOAkhusgw=;
 b=LUjIfUxVzB54sW8M/wV/h8Rk3HQhJbMg42lR875gKfuhn7ZNUtqoiZoPs5WQenzuRD
 42u8+15XTPil2DkouVT9mahwG5tpbCTPw3tpfk+8neE4xf40/zzh+e2aSjTvFvWHF8sz
 NyOvcXWKn8hpaEgkFUx+TuGze9Z6iuC0tmfs/BY89djbO8HbU7yuRy7IactlI9jkmwQZ
 /MBwSZ9dz+SqvFIZncW1XVChyIyvv0j479xxOabFYxz0mCkiAXlJMjDvhfOyZ/PG6vy6
 Go/ahWJjmHWQhRZrBqqdZQOZdcZr9P+ItWkRiPe7xDRMIpPLeERkAHajJvc0r023Sw7l
 6h2Q==
X-Gm-Message-State: AOJu0YwaS6Gqt5ZFD1imeS9YhRGw9dfMurPVY/0E/CmKAtYexxZYaCSO
 WuJ5o3h+7II7GkquIGRt8TeuQFxn+uoRYu8NzZe0Cy/+Czt3fPTDXf8ZYvgLucc6+/seJ+ju0y/
 3
X-Received: by 2002:a17:902:d4c3:b0:1f7:174e:354d with SMTP id
 d9443c01a7336-1f9aa4632b3mr100256995ad.48.1718971235080; 
 Fri, 21 Jun 2024 05:00:35 -0700 (PDT)
Received: from sunil-pc.Dlink ([106.51.187.237])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1f9ebbb606dsm12422995ad.270.2024.06.21.05.00.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Jun 2024 05:00:34 -0700 (PDT)
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
Subject: [PATCH v3 14/15] tests/qtest/bios-tables-test.c: Enable basic testing
 for RISC-V
Date: Fri, 21 Jun 2024 17:29:05 +0530
Message-Id: <20240621115906.1049832-15-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240621115906.1049832-1-sunilvl@ventanamicro.com>
References: <20240621115906.1049832-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pl1-x633.google.com
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
X-TUID: DZseRXCIFLbr

Add basic ACPI table test case for RISC-V.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
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

