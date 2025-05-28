Received: by 2002:a17:505:a38d:b0:1be9:327d:8ee3 with SMTP id rs13csp5392470njc;
        Wed, 28 May 2025 03:58:55 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCV0NMKXM604hJBcDWggjDljEFc9GKBdqLXJ6+zdyvVLZsP6SThONOFpRgE/UJvrm6PuqtKR9Cfd93Ds4Q==@linaro.org
X-Google-Smtp-Source: AGHT+IEDnoEGKt6YXe4A7L/FklXSy0tPVcDdXCwVQ/A29Ww1w4GHad3qcCd4qCTPsFplhX1+uP5L
X-Received: by 2002:a05:620a:44c6:b0:7cc:fef2:51b9 with SMTP id af79cd13be357-7ceecc4597fmr2500036285a.52.1748429935278;
        Wed, 28 May 2025 03:58:55 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1748429935; cv=pass;
        d=google.com; s=arc-20240605;
        b=HRzb/1nH3AI56Ub6zMtk3it5ZaQ+R8tQmlzE+Tv+CpmdVzqEiutaExlyMuNJkfyDtR
         E3WNVz6UmbSsZIKWO/EphDjWiTFnHZC+5dPZdNUb+VANLUZLN2gQNMio79d4Bo9o2K74
         8CpxqaldBckcVrOXCdzZrf9c2TalqrteR1nOpafbUiXdzIIsqGnZfyKFlXyj5VNPf6DO
         L6vKfNg8xauZEtO6PVSvP1/ogwvSBGv+0My9A+ltSIm3w2x66PunfsaclPCYtTOaAerv
         NMfBaujoXAbB7WuFaXoPJnUF7Hov4kYUs49Hlnx16HoYWj/Piirih10EZspu+R1AwcMA
         hRGA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=lkf4l1yBoJd5nVO2DdqP/p99kdIBVO4AMESrAq6NwTE=;
        fh=9Ao6jpMk2Jd0hXa5Ydg+eCtDk8miDbM2r+QXkjtqA5E=;
        b=Ut0GHxB3i9ixJjWxGaXZ5qDG71Rp9VUZODVLS28AqZA6CCSp4mVr2ZfQ/o713Yu490
         IYmokWmVTdjXO9rjTlr1Df1TlyYDfcTCtQ457om5tYQEH94kiOFRczunoigBlLWUlBTo
         3tAZ00eBmxDyS23iv+EqR1YVCs4ezfC/DXSTLiPb2tMybgvGW8XYTWW3GAdmgiPKzZ17
         FhGBsmtPkfe0Z8KNHS5VJ1rrhLToUxbdsZfO0rAMM6PvzEiogZI+tdtNidNQJOJPnq2b
         FOMtRgRBmFfYy0gapuvwSLJ2brpxDvaI88dCuCsPvDkzMyoW7LHgyOJX/pXbocDGWG0D
         h7Rg==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@linux.beauty header.s=zmail header.b=Mis9jwJX;
       arc=pass (i=1 spf=pass spfdomain=linux.beauty dkim=pass dkdomain=linux.beauty dmarc=pass fromdomain=linux.beauty>);
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7cfc5d415ccsi107936285a.303.2025.05.28.03.58.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 28 May 2025 03:58:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linux.beauty header.s=zmail header.b=Mis9jwJX;
       arc=pass (i=1 spf=pass spfdomain=linux.beauty dkim=pass dkdomain=linux.beauty dmarc=pass fromdomain=linux.beauty>);
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uKEUh-0007wh-Po; Wed, 28 May 2025 06:58:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <me@linux.beauty>)
 id 1uKEUf-0007uh-SZ; Wed, 28 May 2025 06:58:45 -0400
Received: from sender4-op-o15.zoho.com ([136.143.188.15])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <me@linux.beauty>)
 id 1uKEUe-0007yk-A9; Wed, 28 May 2025 06:58:45 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1748429680; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=ftuedtoybYZ8A0dkGnWFsFslUyZ+nRyCHbU44fSAZGblWV6u26+5VFGMCgkLw7VVFO7EcAij4WpjM6EJnTopvWDpnCfxA+EE2dHjU0uPSuDDCffJI9g+xsp26SYL1gG/FkoxLOaU9ecm1AtkAj6str6zcqLwJSccbgLdX17UTBI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1748429680;
 h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=lkf4l1yBoJd5nVO2DdqP/p99kdIBVO4AMESrAq6NwTE=; 
 b=Kte4WNm94+tAArIEGVuNI2MDPNixfig8KT1VfV5UDgi6dIt0CZs/JawhVWzenfheVQG69Kwtxt7fdH/jmQQYJm61RFvZTBqSwudbZ6S9v/rSxkrVgzbvlhsj15lw1Bzk37elalsiT3vz4BHHz5hW4Xf1E1gHpGn0z+GfxDQyTNA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=linux.beauty;
 spf=pass  smtp.mailfrom=me@linux.beauty;
 dmarc=pass header.from=<me@linux.beauty>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1748429680; 
 s=zmail; d=linux.beauty; i=me@linux.beauty;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=lkf4l1yBoJd5nVO2DdqP/p99kdIBVO4AMESrAq6NwTE=;
 b=Mis9jwJX9quXNW4b3ALMLXlTPuWASYRf1yc/oJSjCmF/dthoWwFLgyRywKBrzHVt
 uTtVXEskn2Emgu9CVMcJLdX6GJnVklK+HtkBAW1P2QKYROBzf68CVq3/Js2bruMQi4H
 rv7DFtR7kmrzYB5SJV+ZZgbKUTn8IWA4XJ0fZJyA=
Received: by mx.zohomail.com with SMTPS id 1748429678830603.4858246647274;
 Wed, 28 May 2025 03:54:38 -0700 (PDT)
From: Li Chen <me@linux.beauty>
To: "Peter Maydell" <peter.maydell@linaro.org>,
 "Shannon Zhao" <shannon.zhaosl@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 "Igor Mammedov" <imammedo@redhat.com>, "Ani Sinha" <anisinha@redhat.com>,
 "Eduardo Habkost" <eduardo@habkost.net>,
 "Marcel Apfelbaum" <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 "Yanan Wang" <wangyanan55@huawei.com>, "Zhao Liu" <zhao1.liu@intel.com>,
 "Song Gao" <gaosong@loongson.cn>, "Jiaxun Yang" <jiaxun.yang@flygoat.com>,
 "Sunil V L" <sunilvl@ventanamicro.com>,
 "Palmer Dabbelt" <palmer@dabbelt.com>,
 "Alistair Francis" <alistair.francis@wdc.com>,
 "Weiwei Li" <liwei1518@gmail.com>, "qemu-arm" <qemu-arm@nongnu.org>,
 "qemu-devel" <qemu-devel@nongnu.org>, "qemu-riscv" <qemu-riscv@nongnu.org>
Cc: Li Chen <chenl311@chinatelecom.cn>
Subject: [PATCH REPOST v4 3/4] tests/qtest/bios-tables-test: Add test for
 disabling SPCR on RISC-V
Date: Wed, 28 May 2025 18:53:37 +0800
Message-ID: <20250528105404.457729-4-me@linux.beauty>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250528105404.457729-1-me@linux.beauty>
References: <20250528105404.457729-1-me@linux.beauty>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
Received-SPF: pass client-ip=136.143.188.15; envelope-from=me@linux.beauty;
 helo=sender4-op-o15.zoho.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: PA3pNE07isWC

From: Li Chen <chenl311@chinatelecom.cn>

Add ACPI SPCR table test case for RISC-V when SPCR was off.

Signed-off-by: Li Chen <chenl311@chinatelecom.cn>
Reviewed-by: Sunil V L <sunilvl@ventanamicro.com>
---

Notes:
    Changes since v3: Add Reviewed-by from Sunil V L <sunilvl@ventanamicro.com>

 tests/qtest/bios-tables-test.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
index d2a1aa7fb3..44de152a36 100644
--- a/tests/qtest/bios-tables-test.c
+++ b/tests/qtest/bios-tables-test.c
@@ -1807,6 +1807,26 @@ static void test_acpi_aarch64_virt_tcg_acpi_spcr(void)
                   " -machine spcr=off", &data);
     free_test_data(&data);
 }
+
+static void test_acpi_riscv_virt_tcg_acpi_spcr(void)
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
+        .variant = ".acpispcr",
+    };
+
+    test_acpi_one("-cpu rva22s64 "
+                  "-machine spcr=off", &data);
+    free_test_data(&data);
+}
+
 static void test_acpi_tcg_acpi_hmat(const char *machine, const char *arch)
 {
     test_data data = {};
@@ -2612,6 +2632,8 @@ int main(int argc, char *argv[])
             qtest_add_func("acpi/virt", test_acpi_riscv64_virt_tcg);
             qtest_add_func("acpi/virt/numamem",
                            test_acpi_riscv64_virt_tcg_numamem);
+            qtest_add_func("acpi/virt/acpispcr",
+                           test_acpi_riscv_virt_tcg_acpi_spcr);
         }
     }
     ret = g_test_run();
-- 
2.49.0

