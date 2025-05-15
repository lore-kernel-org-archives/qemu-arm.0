Received: by 2002:a17:505:bc8:b0:1be9:327d:8ee3 with SMTP id pe8csp1824392njb;
        Thu, 15 May 2025 05:44:03 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCWDmS7RiHbTTSohes8qW7UGt44/NOfKFPAKLGXjapSyamfu+Y/aWRlJhY2e3MgsE0rVdhaHuQOo7idOww==@linaro.org
X-Google-Smtp-Source: AGHT+IFeGE7GGa+An6IPaXRcuxuUUkJO0X7WypOrFtp7TQ65Nos4bAoh5dZ5uSf+GPyzMnPo9Ss5
X-Received: by 2002:a05:6214:27e2:b0:6e6:684f:7f78 with SMTP id 6a1803df08f44-6f896dfc2c7mr106657406d6.3.1747313043600;
        Thu, 15 May 2025 05:44:03 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1747313043; cv=pass;
        d=google.com; s=arc-20240605;
        b=DAiAhxs4QEWMLeLr1UWav7WmikgIMNcz5iN17EbKiMLOxfOCYsvyc2JSsGx7aDkGRA
         QLwqFl7XxYbAN5a7CreXF/82l1sR72VlmgbgU5Lpy0eqDfilg9RCcxxipVDjPcIm8+P7
         7J+Ve996cjlET1uteCtIN1dUIJIe7z7tJ21XDH6LHWh76NJ2AQtTIIRM4mJtpbAg6RRI
         8b1FukP9DGSZRlsSEw+Gj3TOmEO72xxTaDz4rRFNVS5M8l9ARyreJORuEekPhp2EB+XF
         JJ9Ga7PfV9RFM2oVUN2XL5Jw+ok2D5EnkbMEwYgh/LdP4n2DrWR6RBw0th4RfpEPazBy
         cgTw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:user-agent
         :references:in-reply-to:subject:to:from:message-id:date
         :dkim-signature;
        bh=/stvQ7CKfZG2qrLmD8V83vEdkR/vmhNKv8wtTQoJZjI=;
        fh=alEL13DYEITECSbbUHMbidm18Box6cS8s897e13CZyg=;
        b=N9BC5l/3FTKgCoyvK4qZk7AYlmDRdW+Rh0M/f8BkkmNIJiqFQ55EsWenS6JmVS54zF
         4Agsg7ErsDRvjPEuxEKFjgcOQgzT1+mdwwuSJ/dZDKBXcCPlRQ05Spg02dBuVL5hUERh
         VHsyfzySwGfEq7rZBp5AGUdFjUsDAPL5rM9h/xY7ZF5BximxAU2i8jWDQrYUphOHE3sk
         ZrxTw2wTkmXPpQEd2mvBX9XQUoB5dElsVN65/PpeQkqU/102W3KQZzZHVUP93tsqoY0O
         RsOf1qh1sfdQi665vVJW3ZL5wZHiib52SuU3T1lA+2DEuQZfSe8mIG4CSE0wS0jb5iTc
         +miA==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@linux.beauty header.s=zmail header.b=l97EEIr6;
       arc=pass (i=1 spf=pass spfdomain=linux.beauty dkim=pass dkdomain=linux.beauty dmarc=pass fromdomain=linux.beauty>);
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6f6e39e7127si157971636d6.86.2025.05.15.05.44.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 15 May 2025 05:44:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linux.beauty header.s=zmail header.b=l97EEIr6;
       arc=pass (i=1 spf=pass spfdomain=linux.beauty dkim=pass dkdomain=linux.beauty dmarc=pass fromdomain=linux.beauty>);
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uFXwO-00056n-1B; Thu, 15 May 2025 08:44:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <me@linux.beauty>)
 id 1uFXwH-0004xe-Ec; Thu, 15 May 2025 08:43:56 -0400
Received: from sender3-op-o15.zoho.com ([136.143.184.15])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <me@linux.beauty>)
 id 1uFXwE-0007kp-Ji; Thu, 15 May 2025 08:43:52 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1747312995; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=QvC8qCi7ldfxJsqEMvs7vmTY+6y9zUqKSn5CAOdPg8OjYBgGtmg14CqUM7lXk35xbxUu5kusPzkWyyhQnRrHCDM9TI6M0ZzEqYxj8OrZo3Fsahimk8H2yXIB/E11aqt0oYib7nWvi8lz0WeNwFpS51l4MEDwC1qFQ3WOF2rMVEY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1747312995;
 h=Content-Type:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To:Cc;
 bh=/stvQ7CKfZG2qrLmD8V83vEdkR/vmhNKv8wtTQoJZjI=; 
 b=Fflgg5gm6BweCaA0JbiGxOGmdiNdraJS37Q8yLdBXhI2NfCR3xs3IbyT6GFdd+sdT+YbIcbQp35s8E1ZMKGWj+GuBTZ37+ZTssrYURoZHUgjIMrJ2jKLJqtwGNXdLTLxpIcNwvPdd4Co6YAJIic83NoemJ9CYz0hx1JBI3vz/ds=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=linux.beauty;
 spf=pass  smtp.mailfrom=me@linux.beauty;
 dmarc=pass header.from=<me@linux.beauty>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1747312995; 
 s=zmail; d=linux.beauty; i=me@linux.beauty;
 h=Date:Date:Message-ID:From:From:To:To:Subject:Subject:In-Reply-To:References:MIME-Version:Content-Type:Message-Id:Reply-To:Cc;
 bh=/stvQ7CKfZG2qrLmD8V83vEdkR/vmhNKv8wtTQoJZjI=;
 b=l97EEIr6wqUclFNMFEyQLrd+k02jzscCjPaIn3ktf8Kn8NIM6L+2BIfVnNTFHYAh
 mDKeKAJZNjHTEw/o2IqCajKX93GDsC9l+JE0g7QM+Ud47eyU4FmlzrgbT4bGMR+Bv1D
 8ZRVn63qq2UzZVt0199VXqFnCcGzWX0Y8ELpEFno=
Received: by mx.zohomail.com with SMTPS id 1747312993212148.3516867271594;
 Thu, 15 May 2025 05:43:13 -0700 (PDT)
Date: Thu, 15 May 2025 20:43:07 +0800
Message-ID: <87ikm2rqn8.wl-me@linux.beauty>
From: Li Chen <me@linux.beauty>
To: "Peter Maydell" <peter.maydell@linaro.org>,	"Shannon Zhao"
 <shannon.zhaosl@gmail.com>,	"Michael S. Tsirkin" <mst@redhat.com>,
 "Igor Mammedov" <imammedo@redhat.com>,	"Ani Sinha" <anisinha@redhat.com>,
 "Eduardo Habkost" <eduardo@habkost.net>,	"Marcel Apfelbaum"
 <marcel.apfelbaum@gmail.com>,	=?ISO-8859-1?Q?=22Philippe_Mathieu-Daud=E9?=
 =?ISO-8859-1?Q?=22?= <philmd@linaro.org>,	"Yanan Wang"
 <wangyanan55@huawei.com>,	"Zhao Liu" <zhao1.liu@intel.com>,	"Song Gao"
 <gaosong@loongson.cn>,	"Jiaxun Yang" <jiaxun.yang@flygoat.com>,	"Sunil V L"
 <sunilvl@ventanamicro.com>,	"Palmer Dabbelt" <palmer@dabbelt.com>,
 "Alistair Francis" <alistair.francis@wdc.com>,	"Weiwei Li"
 <liwei1518@gmail.com>,	"qemu-arm" <qemu-arm@nongnu.org>,	"qemu-devel"
 <qemu-devel@nongnu.org>,	"qemu-riscv" <qemu-riscv@nongnu.org>
Subject: [PATCH V3 3/4] tests/qtest/bios-tables-test: Add test for disabling
 SPCR on RISC-V
In-Reply-To: <87msberqzi.wl-me@linux.beauty>
References: <87msberqzi.wl-me@linux.beauty>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) SEMI-EPG/1.14.7 (Harue)
 FLIM-LB/1.14.9 (=?ISO-8859-4?Q?Goj=F2?=) APEL-LB/10.8 EasyPG/1.0.0
 Emacs/30.1 (x86_64-pc-linux-gnu) MULE/6.0 (HANACHIRUSATO)
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-ZohoMailClient: External
Received-SPF: pass client-ip=136.143.184.15; envelope-from=me@linux.beauty;
 helo=sender3-op-o15.zoho.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-TUID: b9N7vA4gEB/I

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


