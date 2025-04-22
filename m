Received: by 2002:a17:504:17c4:b0:1be9:327d:8ee3 with SMTP id o4csp2337820njd;
        Tue, 22 Apr 2025 06:07:42 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCXBsg5e/V7LHV1UVBXcLCPbQPcKkEEWRb+mUxNtvyNxznGe2ZdyYaez8m5+KWuNvcVp442ousZj0N1LRg==@linaro.org
X-Google-Smtp-Source: AGHT+IEbG3ClS0X8WxP/nX2RTd4D1L3M4Rz437wVvFCyEDML9WhdWklp6QpCw0Rj5juzxt+buQiJ
X-Received: by 2002:a05:6102:3b04:b0:4c4:e018:326f with SMTP id ada2fe7eead31-4cb800d894bmr8176595137.10.1745327262143;
        Tue, 22 Apr 2025 06:07:42 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1745327262; cv=pass;
        d=google.com; s=arc-20240605;
        b=EP2unvt/hm1uN57iry5Wg0aIEUyvOng10tZlvJZaU3fn4a2Lbje2SYhMBMwbo5FmTu
         zQMkE8F48QBqjCaK3xtPq5dCm0fbbyJcygYw8R7/GX/qKXZGjQR6Yo0xfq52EDfYkGe0
         bdFzYygada6etwygmb2X7wVafqmHXmw2JKtGFo+tc2HYt/4z/kdDwNiXHPnGPhVxQax8
         6TqVP5IocqJGJWx0cneTY1Y/RGVbDXCqVvjPLgnQjv9IW4hhmJJJcaPp8vCdHPDjFPq4
         w6wynelXy5KycWXKt+Thju+x+T5cf1mCWSb4ZJbpu3ymvLndE2xcqrvX9ksEnYx3wfjK
         fLtw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:user-agent:importance
         :content-transfer-encoding:mime-version:subject:references
         :in-reply-to:message-id:to:from:date:dkim-signature;
        bh=/stvQ7CKfZG2qrLmD8V83vEdkR/vmhNKv8wtTQoJZjI=;
        fh=zS+g9qlHM+oh7KP+PULwazHl5s8pe7BvC50BXmrEVa4=;
        b=Zwgr7RDdQu0Rh9v1gkj8SIO4W6AagpBBVvquNXIEcYBe5DNANEdHRpqjyuigP9t6is
         NvRKwQgqDXj8MieW0Zhs4j/ve51ytUUMsexnsmWkG0kVqnZqtg95CITQ9+wMsP59y7Yr
         kA8EuU9lRPS+mVy+xkJz/sNFr2gwYExoLhhHnCFc4qHPcKfv1xjteM8bOCnydz2v4Mq8
         vdETTRDbQyhG1Ls55yYwzcHbX05OzE/Xs6ejNv40NQ6R1FYq+fSd1fdsVo1MCXSQZmW/
         Q5Od8benFQ2npab2wbfeuqFwMl+YLQbEADy79nsZ3kbvuqFuWPoJybXBktWJ035WeUGO
         F1fA==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@linux.beauty header.s=zmail header.b=VR0VB6fD;
       arc=pass (i=1 spf=pass spfdomain=linux.beauty dkim=pass dkdomain=linux.beauty dmarc=pass fromdomain=linux.beauty>);
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-4cb7dfb8161si2323169137.469.2025.04.22.06.07.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 22 Apr 2025 06:07:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linux.beauty header.s=zmail header.b=VR0VB6fD;
       arc=pass (i=1 spf=pass spfdomain=linux.beauty dkim=pass dkdomain=linux.beauty dmarc=pass fromdomain=linux.beauty>);
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1u7DLQ-0003ys-Dq; Tue, 22 Apr 2025 09:07:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <me@linux.beauty>)
 id 1u7CPi-0000SK-7f; Tue, 22 Apr 2025 08:07:46 -0400
Received: from sender4-op-o12.zoho.com ([136.143.188.12])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <me@linux.beauty>)
 id 1u7CPe-0002sD-1m; Tue, 22 Apr 2025 08:07:44 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1745323641; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=fmFbhfJyfECqQmrJkiLYGUNQb0nQlMks/6J04uHDP3zA32Xs1un+ZH7kh9sFwZng6Joj06shogwSh9S4lYnWFR0OCeSzEljnuqpAMP4QxPMg1yrC8ImmQy4RqYGXb47UqNAA4ZSd6lurblvRx46F1vzMHcZtjP7cCc1ZJGTCXl8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1745323641;
 h=Content-Type:Content-Transfer-Encoding:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To:Cc;
 bh=/stvQ7CKfZG2qrLmD8V83vEdkR/vmhNKv8wtTQoJZjI=; 
 b=j1PSDk2B9mOBMgTROQTmcR0vOzLXUnSjHhq6fXBNycUdbPfjOy0LvNz3nTgdV+DGEAoUWmTGD4wE22BRPMYwcVgKozYYoGtpHDbVuXVLtMFN1KO8KCKcDrCGy0c+dY9eElLfAgTBvwrjrThpX4hNi5DpN1DiXbvhA12BQ3mOM8Y=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=linux.beauty;
 spf=pass  smtp.mailfrom=me@linux.beauty;
 dmarc=pass header.from=<me@linux.beauty>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1745323641; 
 s=zmail; d=linux.beauty; i=me@linux.beauty;
 h=Date:Date:From:From:To:To:Message-ID:In-Reply-To:References:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To:Cc;
 bh=/stvQ7CKfZG2qrLmD8V83vEdkR/vmhNKv8wtTQoJZjI=;
 b=VR0VB6fDB+WPlN3KrTa9j/E/a4iZBWcyyJmFkjYhZTx7qqriqOxYgYT8BISpFf4C
 XWnDqmR0QThRym3BUNuTniFzZoftxW9eId6Ju0tgv0mOpKAFMD/TJfmRSuf2PjG+Hfa
 vVjMMCaAnIlXr05rC3hEOnnUqigDZaEOBWEhXA4g=
Received: from mail.zoho.com by mx.zohomail.com
 with SMTP id 1745323639301266.73560620235014;
 Tue, 22 Apr 2025 05:07:19 -0700 (PDT)
Date: Tue, 22 Apr 2025 20:07:19 +0800
From: Li Chen <me@linux.beauty>
To: "Peter Maydell" <peter.maydell@linaro.org>,
 "Shannon Zhao" <shannon.zhaosl@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 "Igor Mammedov" <imammedo@redhat.com>, "Ani Sinha" <anisinha@redhat.com>,
 "Eduardo Habkost" <eduardo@habkost.net>,
 "Marcel Apfelbaum" <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?=22Philippe_Mathieu-Daud=C3=A9=22?= <philmd@linaro.org>,
 "Yanan Wang" <wangyanan55@huawei.com>,
 "Zhao Liu" <zhao1.liu@intel.com>, "Song Gao" <gaosong@loongson.cn>,
 "Jiaxun Yang" <jiaxun.yang@flygoat.com>,
 "Sunil V L" <sunilvl@ventanamicro.com>,
 "Palmer Dabbelt" <palmer@dabbelt.com>,
 "Alistair Francis" <alistair.francis@wdc.com>,
 "Weiwei Li" <liwei1518@gmail.com>, "qemu-arm" <qemu-arm@nongnu.org>,
 "qemu-devel" <qemu-devel@nongnu.org>, "qemu-riscv" <qemu-riscv@nongnu.org>
Message-ID: <1965d6541ea.102a06ad4912575.3151797857612362065@linux.beauty>
In-Reply-To: <1965d621e25.fafa759e911037.825810937022699867@linux.beauty>
References: <1965d621e25.fafa759e911037.825810937022699867@linux.beauty>
Subject: [PATCH V2 3/3] tests/qtest/bios-tables-test: Add test for disabling
 SPCR on RISC-V
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Importance: Medium
User-Agent: Zoho Mail
X-Mailer: Zoho Mail
Received-SPF: pass client-ip=136.143.188.12; envelope-from=me@linux.beauty;
 helo=sender4-op-o12.zoho.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 22 Apr 2025 09:07:19 -0400
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
X-TUID: 9IpaQIHG+ngW

From: Li Chen <chenl311@chinatelecom.cn>

Add ACPI SPCR table test case for RISC-V when SPCR was off.

Signed-off-by: Li Chen <chenl311@chinatelecom.cn>
---
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


