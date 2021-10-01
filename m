Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp1513897lfp;
        Fri, 1 Oct 2021 10:57:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxB3pcNmdBiWM1WeToNw8YCutATNMUBHPYE+jebULTQ/sK30VtYVW9PbRxSwAAv6Mh7vlfN
X-Received: by 2002:a37:e46:: with SMTP id 67mr11411934qko.272.1633111041125;
        Fri, 01 Oct 2021 10:57:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1633111041; cv=none;
        d=google.com; s=arc-20160816;
        b=v0P4TiIHGLLOgrgNfgRBor6mdlBKqDYgKRd4htKDa6Aqbvxroj2CYYfHq+KchDZhq7
         ccIgbWMMA6eutYAVkIjYU6AGOgUJYkAam6F4ftrfkOYxqQp1aNugmdf2x8rAgkrhv49p
         b8+MKEXAVsh7VMHfwf5e9caPtbZSmabJGTJpkXpSE6ijkHcGskpmb5Nia1xU6MajDrM2
         fBdVk09MwkbrpYOEZMkDTvTh03VGjIlsM/q+hrZjFj5RieLBKewrCQHhQlqphfKzkYmV
         5tYyG/ESk7dPXmkWxzwNRn8jbD5f9Bb+KyvBybv8+Si2f7JFZtILHtw8FkJQputm37cT
         ilAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=39Knl8lMnepL6kcVt9jhZefLZXbFTU/t5RlVQ8xkhKg=;
        b=bjWH4vdV+U+MGL73WUobQahA6LVhNz0AF+UAOXc4PK+JsJ54w+7mlFKpgcAIf+f20S
         4iiNgmJ2ivXr+aNFI7+0aB0PjkETvAN0ml+KOMCfDbyksdMbNfJFWWi95bgSn/zxkNmy
         Z5+TQemf/X95DjG0keg1lUjYe6ly8YyGZK90oqOtM4i7lYMkrobcBZ4NCUHlrWmgYegg
         /O9atQy0zFKenX0vqKrtfPaNmr4oJKGfsDMcTOYr0bMtkBAv707L8LmVdTkCGIZRgdIi
         0NHwyP0Nu6IgEYeYP1YH9gs41jD4hmXPL42C1fcgK7I1TrMnGyDq9q6SXPbgNPWTR3sN
         RjCg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=osDyd0R6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n15si4776546qkp.11.2021.10.01.10.57.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 01 Oct 2021 10:57:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=osDyd0R6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mWMme-0005rM-BY
	for alex.bennee@linaro.org; Fri, 01 Oct 2021 13:57:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mWMUM-0000aY-RW
 for qemu-arm@nongnu.org; Fri, 01 Oct 2021 13:38:28 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:38415)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mWMUI-0000nC-7b
 for qemu-arm@nongnu.org; Fri, 01 Oct 2021 13:38:24 -0400
Received: by mail-wr1-x435.google.com with SMTP id u18so16656487wrg.5
 for <qemu-arm@nongnu.org>; Fri, 01 Oct 2021 10:38:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=39Knl8lMnepL6kcVt9jhZefLZXbFTU/t5RlVQ8xkhKg=;
 b=osDyd0R6KgbdCpelgFoytLwm532Ov3WtmrWBS7gtdFfp+1o+h8w/RExiVQlqlQj34U
 GBjLiBEHt5r0QqprQa3SSLi+sYVALZf4VYVWNRA9mphAaahv9Av4ba3Uk2fivx6P4mFN
 vriMUK+Exp/tYQs64E6JhqHoF5fSRN9PZl3gBfZOe8JSnqSbn9kVlnhRfM8Mmgc4r7uC
 dZjdeeqZP6KS1talvEUWua+QX+8WyAKvXMtDT2phNKMaFCTrbn6AfVA4lzUxvDBVkIuu
 p0FtFxjFrobqK8ZsEAt6W+cj3KV54eyeM0q0ink/cdyPZUwuVhiUwzSn6pWuoV08OgsV
 VQSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=39Knl8lMnepL6kcVt9jhZefLZXbFTU/t5RlVQ8xkhKg=;
 b=Z4l3vChyR5euJHvV43hqoJU6w2Uznpsk1sjWFypC/WqBWpoKBGehuqrojWmKYK5taa
 Ffxn9VSz6VQ3PfR/1xtBjo3hv3E4ggTXrHNpSRnx8riOAVdG0VFXvljLHNENefe8oVFQ
 bAfDJTWeEpgXcJ/+6cQ0IBbaes1YMJuWgdg5qL2AdoHTycl8+FaTxIy3B5aVJEqyL3JN
 GnzwI7Mzlvag4MEifOvQwWQhxKFWBMdWpq02dobDLPzpM2Li8baNFYgAiHP03vunmUgH
 sS+4EglMQssZBX+abntuuxsnTcxB/79wlU/EEfAguzDNsDFl+fw+7S2UlAjbyVc+5g8A
 VGwA==
X-Gm-Message-State: AOAM5311vvZ6qxX+idKfPAZjFpCYcnnuczB5rrAKdpfrA2O5/8XCdWiS
 /X0f1sV8SOhOYTnx/j34sa4Q+w==
X-Received: by 2002:a05:6000:228:: with SMTP id
 l8mr13914848wrz.413.1633109900241; 
 Fri, 01 Oct 2021 10:38:20 -0700 (PDT)
Received: from localhost.localdomain
 (cpc92880-cmbg19-2-0-cust679.5-4.cable.virginm.net. [82.27.106.168])
 by smtp.gmail.com with ESMTPSA id k9sm6186592wrz.22.2021.10.01.10.38.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Oct 2021 10:38:19 -0700 (PDT)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: eric.auger@redhat.com,
	imammedo@redhat.com
Subject: [PATCH v4 09/11] tests/acpi: add test cases for VIOT
Date: Fri,  1 Oct 2021 18:33:57 +0100
Message-Id: <20211001173358.863017-10-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211001173358.863017-1-jean-philippe@linaro.org>
References: <20211001173358.863017-1-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=jean-philippe@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, ehabkost@redhat.com, mst@redhat.com,
 richard.henderson@linaro.org, qemu-devel@nongnu.org, shannon.zhaosl@gmail.com,
 Jean-Philippe Brucker <jean-philippe@linaro.org>, qemu-arm@nongnu.org,
 marcel.apfelbaum@gmail.com, ani@anisinha.ca, pbonzini@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: czyZdwsETfqI

Add two test cases for VIOT, one on the q35 machine and the other on
virt. To test complex topologies the q35 test has two PCIe buses that
bypass the IOMMU (and are therefore not described by VIOT), and two
buses that are translated by virtio-iommu.

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 tests/qtest/bios-tables-test.c | 38 ++++++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
index 4f11d03055..b6cb383bd9 100644
--- a/tests/qtest/bios-tables-test.c
+++ b/tests/qtest/bios-tables-test.c
@@ -1403,6 +1403,42 @@ static void test_acpi_virt_tcg(void)
     free_test_data(&data);
 }
 
+static void test_acpi_q35_viot(void)
+{
+    test_data data = {
+        .machine = MACHINE_Q35,
+        .variant = ".viot",
+    };
+
+    /*
+     * To keep things interesting, two buses bypass the IOMMU.
+     * VIOT should only describes the other two buses.
+     */
+    test_acpi_one("-machine default_bus_bypass_iommu=on "
+                  "-device virtio-iommu "
+                  "-device pxb-pcie,bus_nr=0x10,id=pcie.100,bus=pcie.0 "
+                  "-device pxb-pcie,bus_nr=0x20,id=pcie.200,bus=pcie.0,bypass_iommu=on "
+                  "-device pxb-pcie,bus_nr=0x30,id=pcie.300,bus=pcie.0",
+                  &data);
+    free_test_data(&data);
+}
+
+static void test_acpi_virt_viot(void)
+{
+    test_data data = {
+        .machine = "virt",
+        .uefi_fl1 = "pc-bios/edk2-aarch64-code.fd",
+        .uefi_fl2 = "pc-bios/edk2-arm-vars.fd",
+        .cd = "tests/data/uefi-boot-images/bios-tables-test.aarch64.iso.qcow2",
+        .ram_start = 0x40000000ULL,
+        .scan_len = 128ULL * 1024 * 1024,
+    };
+
+    test_acpi_one("-cpu cortex-a57 "
+                  "-device virtio-iommu", &data);
+    free_test_data(&data);
+}
+
 static void test_oem_fields(test_data *data)
 {
     int i;
@@ -1567,12 +1603,14 @@ int main(int argc, char *argv[])
         if (strcmp(arch, "x86_64") == 0) {
             qtest_add_func("acpi/microvm/pcie", test_acpi_microvm_pcie_tcg);
         }
+        qtest_add_func("acpi/q35/viot", test_acpi_q35_viot);
     } else if (strcmp(arch, "aarch64") == 0) {
         qtest_add_func("acpi/virt", test_acpi_virt_tcg);
         qtest_add_func("acpi/virt/numamem", test_acpi_virt_tcg_numamem);
         qtest_add_func("acpi/virt/memhp", test_acpi_virt_tcg_memhp);
         qtest_add_func("acpi/virt/pxb", test_acpi_virt_tcg_pxb);
         qtest_add_func("acpi/virt/oem-fields", test_acpi_oem_fields_virt);
+        qtest_add_func("acpi/virt/viot", test_acpi_virt_viot);
     }
     ret = g_test_run();
     boot_sector_cleanup(disk);
-- 
2.33.0

