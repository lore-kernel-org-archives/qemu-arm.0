Received: by 2002:ac2:5544:0:0:0:0:0 with SMTP id l4csp1547924lfk;
        Fri, 10 Dec 2021 09:07:25 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxLxRews/j4AqNQf3IgmLmkiRG53dpMDzPBZK3k5FlrCPwQ/W1HUanjcXgKos19PwlFkmLa
X-Received: by 2002:ad4:57b1:: with SMTP id g17mr25848132qvx.56.1639156045698;
        Fri, 10 Dec 2021 09:07:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1639156045; cv=none;
        d=google.com; s=arc-20160816;
        b=LDjIfjO/1v5lBCyYm9B47cIL6EfVlVucuJlyuvmRMSbTujPXZp4CRLiMR5Xhkui7Hf
         krpbzfwihxOjSItdXXPa3bVL8dgUNzGBSkJu8qS7qccfOoThrQu1JGWZv8h3VNdfGjPJ
         EIFi0hw52nOFbl9p7G+HjdXMrF7X6ytueprpbX7heGSNCY2X3faCQbOj7flpSMFSRFnT
         03F8Q6R1meKVLu0GD5wxfPoCHmO+O6G6thInadmXKbI9BLYe+vTg/MOjWLgBmltncolC
         rgGmVSwrWJO7IlcssuNMlZKOmCHcJi3YU/dglSwWWtP6aYIkmZEfRb3UfbeN+/LU1REK
         MwIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=VfJIAuyEAhLwuhBoYyQnuJQHssBC+STA/z+67u7l1ew=;
        b=CLFOezmqqn5Ah+9WUqc4IWPtA1p/ISA9r+razIgOV66uoCN2xfQ6tNvhWO5x7DKNtF
         ddKzrcGo5C/oOJ1Uwo/gOojSyLi+S4WM3ua8F3YaYChe1VOo4f96nV3F5q/py6Pm8KB3
         xvkEjZqMRG0LGLwYH7+1QhrvveEqyPiYqcKENcGdE9Jo76Yu9yt11w6xkFLFdWrjeuWj
         9yq60g1fpxvQQKGkS1CNEa7AdG7JyWwwmrgUKvafu17saxKpPZgKSsXeARyOTU6/xfPi
         eOm40JxBWA9NRCUI1cN9eng0X14+nyUJUA/qIAoTAyVM4q8/9jPgJR7zC0VVgiGjI/CC
         mGJA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="vG1/pRcx";
       spf=none (google.com: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org does not designate permitted sender hosts) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id gs13si4022117qvb.323.2021.12.10.09.07.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 10 Dec 2021 09:07:25 -0800 (PST)
Received-SPF: none (google.com: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org does not designate permitted sender hosts) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="vG1/pRcx";
       spf=none (google.com: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org does not designate permitted sender hosts) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mvjMj-0006dw-3M
	for alex.bennee@linaro.org; Fri, 10 Dec 2021 12:07:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mvjLU-0005sa-Kj
 for qemu-arm@nongnu.org; Fri, 10 Dec 2021 12:06:11 -0500
Received: from [2a00:1450:4864:20::52d] (port=42749
 helo=mail-ed1-x52d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mvjLR-0006Tr-Tw
 for qemu-arm@nongnu.org; Fri, 10 Dec 2021 12:06:08 -0500
Received: by mail-ed1-x52d.google.com with SMTP id r11so31360208edd.9
 for <qemu-arm@nongnu.org>; Fri, 10 Dec 2021 09:06:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VfJIAuyEAhLwuhBoYyQnuJQHssBC+STA/z+67u7l1ew=;
 b=vG1/pRcxwFgH8IKCp1EQY2wshzOxXgNabtdOVxRNHdsHvuCSOWtHAQ704k+JbXUmO6
 tmi6X9F1AdqAolibGQ52xfWFGO4eYxnEpKJY8RyMXkl5O9o5K62oOtWcntom//Bmjys5
 Mn6UOUBLPzvBgCljswxpXvafy92pJjZm47FPsrn0aH6EvHPY5LY/LIWGMBS87lPd4iUJ
 3OSQZ0izGM96574n6WDBPJvz57wSmzP4QVimAD7Cr8NF5txA6z7K2vESfzhqnmqEyCdW
 Fns4iN5DiB3twBXvuQK79p/z8XFIWEc4hlJFNtGvAsnTPicdHrUfZ3o/x+W+O+aZ6dpk
 YkPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VfJIAuyEAhLwuhBoYyQnuJQHssBC+STA/z+67u7l1ew=;
 b=BdJTAdCXvdvxEig4ut6VxxELMvz9PTSyu2Mrmp+5Pa4NR5S1HRzGTerStwQ8s2xGqf
 MtDCtDk3uqX6LNzcCtZLotSz1/sUgTF+DRG0aLFVS4DtpoQ5nMXrS7jaWX7qNDPhFQ38
 pkcGDzZYPbojaV5BjVNTd7YoDVIOuNw3ww68yL6kjqa5/MVjFSUh4tCjQvLDkYim+PjJ
 287Z93+BjrdPAl7FL6iTt8KSyL5m1SnORPbHqcCiEdEaHhpFer6esmHoU6saxhFCDm59
 i5eMrRjds1LN6k3Me8HyIBgKlqQY8y/zIvIW94VWkK4zID9VN3ekagxUG9qNoCWE2MVJ
 JWFQ==
X-Gm-Message-State: AOAM530gOg/W91QrkCiwpaCs/RqNsO7EKIDMJfZIn1DrR/CIDjw33T/E
 wcuAy3g7yuoZG3mTpNi47KsP/w==
X-Received: by 2002:a17:907:94ce:: with SMTP id
 dn14mr25764618ejc.85.1639155961350; 
 Fri, 10 Dec 2021 09:06:01 -0800 (PST)
Received: from localhost.localdomain
 (cpc92880-cmbg19-2-0-cust679.5-4.cable.virginm.net. [82.27.106.168])
 by smtp.gmail.com with ESMTPSA id x7sm1860661edd.28.2021.12.10.09.06.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Dec 2021 09:06:00 -0800 (PST)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: mst@redhat.com, imammedo@redhat.com, peter.maydell@linaro.org,
 shannon.zhaosl@gmail.com
Subject: [PATCH v7 6/8] tests/acpi: add test case for VIOT
Date: Fri, 10 Dec 2021 17:04:14 +0000
Message-Id: <20211210170415.583179-7-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211210170415.583179-1-jean-philippe@linaro.org>
References: <20211210170415.583179-1-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::52d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=jean-philippe@linaro.org; helo=mail-ed1-x52d.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: ani@anisinha.ca, eric.auger@redhat.com, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, Jean-Philippe Brucker <jean-philippe@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +QqBDknms/4I

Add two test cases for VIOT, one on the q35 machine and the other on
virt. To test complex topologies the q35 test has two PCIe buses that
bypass the IOMMU (and are therefore not described by VIOT), and two
buses that are translated by virtio-iommu.

Reviewed-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 tests/qtest/bios-tables-test.c | 38 ++++++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
index 258874167e..58df53b15b 100644
--- a/tests/qtest/bios-tables-test.c
+++ b/tests/qtest/bios-tables-test.c
@@ -1465,6 +1465,42 @@ static void test_acpi_virt_tcg(void)
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
+                  "-device virtio-iommu-pci "
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
+                  "-device virtio-iommu-pci", &data);
+    free_test_data(&data);
+}
+
 static void test_oem_fields(test_data *data)
 {
     int i;
@@ -1639,6 +1675,7 @@ int main(int argc, char *argv[])
             qtest_add_func("acpi/q35/kvm/xapic", test_acpi_q35_kvm_xapic);
             qtest_add_func("acpi/q35/kvm/dmar", test_acpi_q35_kvm_dmar);
         }
+        qtest_add_func("acpi/q35/viot", test_acpi_q35_viot);
     } else if (strcmp(arch, "aarch64") == 0) {
         if (has_tcg) {
             qtest_add_func("acpi/virt", test_acpi_virt_tcg);
@@ -1646,6 +1683,7 @@ int main(int argc, char *argv[])
             qtest_add_func("acpi/virt/memhp", test_acpi_virt_tcg_memhp);
             qtest_add_func("acpi/virt/pxb", test_acpi_virt_tcg_pxb);
             qtest_add_func("acpi/virt/oem-fields", test_acpi_oem_fields_virt);
+            qtest_add_func("acpi/virt/viot", test_acpi_virt_viot);
         }
     }
     ret = g_test_run();
-- 
2.34.1

