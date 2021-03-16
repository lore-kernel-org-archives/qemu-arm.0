Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp4793950lfg;
        Tue, 16 Mar 2021 10:56:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz2rhG0INABjrFPHpY15RCtrurWgfRWwa/tlzvLCxbdY/BRAodOrFOe310f3g5//LynVlqK
X-Received: by 2002:ac8:73c1:: with SMTP id v1mr105758qtp.174.1615917367388;
        Tue, 16 Mar 2021 10:56:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1615917367; cv=none;
        d=google.com; s=arc-20160816;
        b=ZEMX0yl00S2Nv6NNTTmMq+FuZAkNuNKLx9BxxFmW3QPLI8Cuk2GyHtwCkiFLoOhvDk
         jeK783otXwwJB1RZSlaimH9AmnEt73+UOw6/1fRHFVUHJDYZebGMdmr/wG75EQ93eWJB
         QZsfWPfzlPFNFZiVxEdWUN/zqyBdL0UY9gl6V5zfd4eMFtwhRf3zrWOQ0qs3NyXaiUQV
         ZRw2+0XAnKe50pcsThObZTnrSYtHNi19yGiDtKQ5LBCrN9NpE4yP77paLYU5PFmrBc3f
         ahhv7ekX1r5wxEfful4V16UEyih6oWJ/I8JsoOJGSM71URYakSHFlHTsTMZoZbaE+Er7
         IIfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=K8BJo/26emKOzTViZLjTILM8WZDfyElz+uQ2fAjq3CA=;
        b=EpkleNzq31lRuGM6AqAl/ZjOYLVLGt7sQD6DTqCm81boWFwYxY2eErJDMV6VFQeOti
         wqEEkGIG4Aq8e/L3Nn0Ps5hWX2rF4qZCbenbbq7O9ydn4u9+oNIJB+3P8aPeYqXyXpef
         bmYdyD6NYjp4s/vAgizgFigWFs0O0W461GAtoh06A+omC9SC3IsVF0Tm+1x7KMphtQ08
         t/BJhAhxC3H73hDO+z4KdjwT+cIXMY5XhYnB4exsT5eUz4wUdxMUMalPUotkflBZ3Wlt
         ZcyM4L1EX6SvE2yDVWhQdFXBJAB4QkmRWraH1axHNhC9g+AYt0zuVtM+qQb8U/okDHH+
         q8PQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=OvtSC5TL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l30si10466501qtn.105.2021.03.16.10.56.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 16 Mar 2021 10:56:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=OvtSC5TL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:41978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lMDvK-0003nP-Fl
	for alex.bennee@linaro.org; Tue, 16 Mar 2021 13:56:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56650)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lMDRS-00005s-Tt
 for qemu-arm@nongnu.org; Tue, 16 Mar 2021 13:25:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33356)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lMDRQ-0002tR-6x
 for qemu-arm@nongnu.org; Tue, 16 Mar 2021 13:25:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615915511;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=K8BJo/26emKOzTViZLjTILM8WZDfyElz+uQ2fAjq3CA=;
 b=OvtSC5TLQ/QW2sXun63/kpJhqr3LduJKXddY7RuRzqqD+iiOYaek0dDWCE08cwHm9wajcO
 lOECS98wFoL/Zn1nEGffLNTy9ZCB6lHGwPAcO9mF6x6a8WGV3s5MXuJu8KXnI6tzaM1eDG
 MKxptUm9sgFrhEoueHOuap6EsV7tjqE=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-137-Rd6IddE1OyWDtxzrXuiCrg-1; Tue, 16 Mar 2021 13:25:09 -0400
X-MC-Unique: Rd6IddE1OyWDtxzrXuiCrg-1
Received: by mail-wr1-f72.google.com with SMTP id 75so16888596wrl.3
 for <qemu-arm@nongnu.org>; Tue, 16 Mar 2021 10:25:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=K8BJo/26emKOzTViZLjTILM8WZDfyElz+uQ2fAjq3CA=;
 b=ahk8igets9nz71ruhASbyujUXdJKDQnXfIVOfsqpAh5fpYni/xO1azdS5iAG/ym+7J
 XLxeCof2OhRwzxoGlNdmM9chuT8Jm8plg0U/NlKq6gKd1M4mtha0p42hdC1pRMd8FIvG
 opR33Cg1rRtC5kVUUhb4DQwyJZKNR0WEAEOHT7i/SLPGB75AvlDnesDydHd9Ze1C2dpU
 W/bkymdbyt9WcUHiYK8BT6UU/9Xci1vHmmLqVZZT/FIYHXQDmddtLJ7KIvzEZlHda5YW
 aY+dE56UZV1dJM8pGXPz9iSevHQ8844ckTP+FF6bPonL3D+kENZx3aQMgyet51NRkJgz
 OeQA==
X-Gm-Message-State: AOAM532ZV5uNzcU7oxAtMRn+SjYDFvc04A/fF/j3ylF7M4Rxt9QMtyJT
 49Dmeer0+0ngWIVomJRtac6AUIaPbn3KHi8+zFBph90cZiNuu+0X2hmlWSveOByR17n06Ag00oo
 lQItkXWPPDNKo
X-Received: by 2002:a5d:4e52:: with SMTP id r18mr143098wrt.28.1615915508141;
 Tue, 16 Mar 2021 10:25:08 -0700 (PDT)
X-Received: by 2002:a5d:4e52:: with SMTP id r18mr143074wrt.28.1615915507993;
 Tue, 16 Mar 2021 10:25:07 -0700 (PDT)
Received: from localhost.localdomain (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id p17sm34574wmq.47.2021.03.16.10.25.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Mar 2021 10:25:07 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 3/4] qtest/bios-tables-test: Make test build-independent
 from accelerator
Date: Tue, 16 Mar 2021 18:24:48 +0100
Message-Id: <20210316172449.3148634-4-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210316172449.3148634-1-philmd@redhat.com>
References: <20210316172449.3148634-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Andrew Jones <drjones@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-arm@nongnu.org, Claudio Fontana <cfontana@suse.de>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: bSOyXyZ5KmN2

Now than we can probe if the TCG accelerator is available
at runtime with a QMP command, do it once at the beginning
and only register the tests we can run.
We can then replace the #ifdef'ry by an assertion.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
v2: use global tcg_accel_available, call qtest_has_accel() once
---
 tests/qtest/bios-tables-test.c | 99 ++++++++++++++++++----------------
 1 file changed, 52 insertions(+), 47 deletions(-)

diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
index e020c83d2a5..52587aeb6b1 100644
--- a/tests/qtest/bios-tables-test.c
+++ b/tests/qtest/bios-tables-test.c
@@ -97,6 +97,7 @@ typedef struct {
     QTestState *qts;
 } test_data;
 
+static bool tcg_accel_available;
 static char disk[] = "tests/acpi-test-disk-XXXXXX";
 static const char *data_dir = "tests/data/acpi";
 #ifdef CONFIG_IASL
@@ -718,15 +719,11 @@ static void test_acpi_one(const char *params, test_data *data)
     char *args;
     bool use_uefi = data->uefi_fl1 && data->uefi_fl2;
 
-#ifndef CONFIG_TCG
-    if (data->tcg_only) {
-        g_test_skip("TCG disabled, skipping ACPI tcg_only test");
-        return;
-    }
-#endif /* CONFIG_TCG */
+    assert(!data->tcg_only || tcg_accel_available);
 
     args = test_acpi_create_args(data, params, use_uefi);
     data->qts = qtest_init(args);
+
     test_acpi_load_tables(data, use_uefi);
 
     if (getenv(ACPI_REBUILD_EXPECTED_AML)) {
@@ -1504,6 +1501,8 @@ int main(int argc, char *argv[])
     const char *arch = qtest_get_arch();
     int ret;
 
+    tcg_accel_available = qtest_has_accel("tcg");
+
     g_test_init(&argc, &argv, NULL);
 
     if (strcmp(arch, "i386") == 0 || strcmp(arch, "x86_64") == 0) {
@@ -1512,56 +1511,62 @@ int main(int argc, char *argv[])
             return ret;
         }
         qtest_add_func("acpi/q35/oem-fields", test_acpi_oem_fields_q35);
-        qtest_add_func("acpi/q35/tpm-tis", test_acpi_q35_tcg_tpm_tis);
-        qtest_add_func("acpi/piix4", test_acpi_piix4_tcg);
         qtest_add_func("acpi/oem-fields", test_acpi_oem_fields_pc);
-        qtest_add_func("acpi/piix4/bridge", test_acpi_piix4_tcg_bridge);
+        qtest_add_func("acpi/microvm/oem-fields", test_acpi_oem_fields_microvm);
         qtest_add_func("acpi/piix4/pci-hotplug/no_root_hotplug",
                        test_acpi_piix4_no_root_hotplug);
         qtest_add_func("acpi/piix4/pci-hotplug/no_bridge_hotplug",
                        test_acpi_piix4_no_bridge_hotplug);
         qtest_add_func("acpi/piix4/pci-hotplug/off",
                        test_acpi_piix4_no_acpi_pci_hotplug);
-        qtest_add_func("acpi/q35", test_acpi_q35_tcg);
-        qtest_add_func("acpi/q35/bridge", test_acpi_q35_tcg_bridge);
-        qtest_add_func("acpi/q35/mmio64", test_acpi_q35_tcg_mmio64);
-        qtest_add_func("acpi/piix4/ipmi", test_acpi_piix4_tcg_ipmi);
-        qtest_add_func("acpi/q35/ipmi", test_acpi_q35_tcg_ipmi);
-        qtest_add_func("acpi/piix4/cpuhp", test_acpi_piix4_tcg_cphp);
-        qtest_add_func("acpi/q35/cpuhp", test_acpi_q35_tcg_cphp);
-        qtest_add_func("acpi/piix4/memhp", test_acpi_piix4_tcg_memhp);
-        qtest_add_func("acpi/q35/memhp", test_acpi_q35_tcg_memhp);
-        qtest_add_func("acpi/piix4/numamem", test_acpi_piix4_tcg_numamem);
-        qtest_add_func("acpi/q35/numamem", test_acpi_q35_tcg_numamem);
-        qtest_add_func("acpi/piix4/nosmm", test_acpi_piix4_tcg_nosmm);
-        qtest_add_func("acpi/piix4/smm-compat",
-                       test_acpi_piix4_tcg_smm_compat);
-        qtest_add_func("acpi/piix4/smm-compat-nosmm",
-                       test_acpi_piix4_tcg_smm_compat_nosmm);
-        qtest_add_func("acpi/piix4/nohpet", test_acpi_piix4_tcg_nohpet);
-        qtest_add_func("acpi/q35/nosmm", test_acpi_q35_tcg_nosmm);
-        qtest_add_func("acpi/q35/smm-compat",
-                       test_acpi_q35_tcg_smm_compat);
-        qtest_add_func("acpi/q35/smm-compat-nosmm",
-                       test_acpi_q35_tcg_smm_compat_nosmm);
-        qtest_add_func("acpi/q35/nohpet", test_acpi_q35_tcg_nohpet);
-        qtest_add_func("acpi/piix4/dimmpxm", test_acpi_piix4_tcg_dimm_pxm);
-        qtest_add_func("acpi/q35/dimmpxm", test_acpi_q35_tcg_dimm_pxm);
-        qtest_add_func("acpi/piix4/acpihmat", test_acpi_piix4_tcg_acpi_hmat);
-        qtest_add_func("acpi/q35/acpihmat", test_acpi_q35_tcg_acpi_hmat);
-        qtest_add_func("acpi/microvm", test_acpi_microvm_tcg);
-        qtest_add_func("acpi/microvm/usb", test_acpi_microvm_usb_tcg);
-        qtest_add_func("acpi/microvm/rtc", test_acpi_microvm_rtc_tcg);
-        qtest_add_func("acpi/microvm/ioapic2", test_acpi_microvm_ioapic2_tcg);
-        qtest_add_func("acpi/microvm/oem-fields", test_acpi_oem_fields_microvm);
-        if (strcmp(arch, "x86_64") == 0) {
-            qtest_add_func("acpi/microvm/pcie", test_acpi_microvm_pcie_tcg);
+        if (tcg_accel_available) {
+            qtest_add_func("acpi/q35/tpm-tis", test_acpi_q35_tcg_tpm_tis);
+            qtest_add_func("acpi/piix4", test_acpi_piix4_tcg);
+            qtest_add_func("acpi/piix4/bridge", test_acpi_piix4_tcg_bridge);
+            qtest_add_func("acpi/q35", test_acpi_q35_tcg);
+            qtest_add_func("acpi/q35/bridge", test_acpi_q35_tcg_bridge);
+            qtest_add_func("acpi/q35/mmio64", test_acpi_q35_tcg_mmio64);
+            qtest_add_func("acpi/piix4/ipmi", test_acpi_piix4_tcg_ipmi);
+            qtest_add_func("acpi/q35/ipmi", test_acpi_q35_tcg_ipmi);
+            qtest_add_func("acpi/piix4/cpuhp", test_acpi_piix4_tcg_cphp);
+            qtest_add_func("acpi/q35/cpuhp", test_acpi_q35_tcg_cphp);
+            qtest_add_func("acpi/piix4/memhp", test_acpi_piix4_tcg_memhp);
+            qtest_add_func("acpi/q35/memhp", test_acpi_q35_tcg_memhp);
+            qtest_add_func("acpi/piix4/numamem", test_acpi_piix4_tcg_numamem);
+            qtest_add_func("acpi/q35/numamem", test_acpi_q35_tcg_numamem);
+            qtest_add_func("acpi/piix4/nosmm", test_acpi_piix4_tcg_nosmm);
+            qtest_add_func("acpi/piix4/smm-compat",
+                           test_acpi_piix4_tcg_smm_compat);
+            qtest_add_func("acpi/piix4/smm-compat-nosmm",
+                           test_acpi_piix4_tcg_smm_compat_nosmm);
+            qtest_add_func("acpi/piix4/nohpet", test_acpi_piix4_tcg_nohpet);
+            qtest_add_func("acpi/q35/nosmm", test_acpi_q35_tcg_nosmm);
+            qtest_add_func("acpi/q35/smm-compat",
+                           test_acpi_q35_tcg_smm_compat);
+            qtest_add_func("acpi/q35/smm-compat-nosmm",
+                           test_acpi_q35_tcg_smm_compat_nosmm);
+            qtest_add_func("acpi/q35/nohpet", test_acpi_q35_tcg_nohpet);
+            qtest_add_func("acpi/piix4/dimmpxm", test_acpi_piix4_tcg_dimm_pxm);
+            qtest_add_func("acpi/q35/dimmpxm", test_acpi_q35_tcg_dimm_pxm);
+            qtest_add_func("acpi/piix4/acpihmat",
+                           test_acpi_piix4_tcg_acpi_hmat);
+            qtest_add_func("acpi/q35/acpihmat", test_acpi_q35_tcg_acpi_hmat);
+            qtest_add_func("acpi/microvm", test_acpi_microvm_tcg);
+            qtest_add_func("acpi/microvm/usb", test_acpi_microvm_usb_tcg);
+            qtest_add_func("acpi/microvm/rtc", test_acpi_microvm_rtc_tcg);
+            qtest_add_func("acpi/microvm/ioapic2",
+                           test_acpi_microvm_ioapic2_tcg);
+            if (strcmp(arch, "x86_64") == 0) {
+                qtest_add_func("acpi/microvm/pcie", test_acpi_microvm_pcie_tcg);
+            }
         }
     } else if (strcmp(arch, "aarch64") == 0) {
-        qtest_add_func("acpi/virt", test_acpi_virt_tcg);
-        qtest_add_func("acpi/virt/numamem", test_acpi_virt_tcg_numamem);
-        qtest_add_func("acpi/virt/memhp", test_acpi_virt_tcg_memhp);
-        qtest_add_func("acpi/virt/pxb", test_acpi_virt_tcg_pxb);
+        if (tcg_accel_available) {
+            qtest_add_func("acpi/virt", test_acpi_virt_tcg);
+            qtest_add_func("acpi/virt/numamem", test_acpi_virt_tcg_numamem);
+            qtest_add_func("acpi/virt/memhp", test_acpi_virt_tcg_memhp);
+            qtest_add_func("acpi/virt/pxb", test_acpi_virt_tcg_pxb);
+        }
         qtest_add_func("acpi/virt/oem-fields", test_acpi_oem_fields_virt);
     }
     ret = g_test_run();
-- 
2.26.2

