Received: by 2002:a17:906:b756:b0:9b2:89ee:1eb8 with SMTP id fx22csp300757ejb;
        Tue, 10 Oct 2023 00:50:08 -0700 (PDT)
X-Received: by 2002:a17:906:20ce:b0:9ae:3210:22fd with SMTP id c14-20020a17090620ce00b009ae321022fdmr15781735ejc.48.1696924208547;
        Tue, 10 Oct 2023 00:50:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1696924208; cv=none;
        d=google.com; s=arc-20160816;
        b=kI63J9WeSCorB+HqWUtKvwIS1brp3HND0Ow050dL52G7gs/z49rRCnyI3TGnZc5fHe
         2EO+ulAJyMDr6+OtKv5C61URj3Et08B0UmlA5sqlETTOImLYVlBArQRX8vko2IWBlv39
         kAxTths4YYVvQSozSmtxBDDS2T5rNRSBVjXSP80Vl7Q7uNyHd+pe5+mmV3cXg63AYY0Z
         kqONqdM8INuQLfTijmC/NAcoFE5RfSTdRUm/OACl4EF7XTSqBuTJSYV4yekbztJjnw39
         3/d9RSZyBgg6LPLAljdRG9750VZSezySw2aw2WhSSPqizP+Ac1F2vfq+4X8so8+DjP50
         ckqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=FJhi36jVylnj85gu6IQc1ZcAE1kH76mXKOCIios85AY=;
        fh=TpX8mZMx73bNF6kTB9aHD08cppzHw2mnfb0SK6mZ09c=;
        b=Xe/ZpBVINfHMuU4pjgaKy8T+KTnONnXszlL5baGWrdzRqWC1P1xZDuxi8zTDX3T6KT
         BEotH0yZQmuG1zXXekp1KxjV7fiE7poEmRgKt7w9A9G8z+a08dxQghYHIjeCl5RGkt9u
         CYf9qurJxZ5iN40GNIClwjXrKyyN7iRUczkepgUz8TSuJeCsXyZIU87Pal7jVyqCyxZT
         vqlrKPZWpSsCRbIW9uBqjcpNkq56+KvRvnqJ3q/+Z9O//u0PcYlQ0/ShP/VZOY8D94r0
         m2SssLiFCHKSksYko+GQQ5zgbVKOVLFXFfbImLY9VNPjkjM7TO/EvjwqAYtEyMWibzCk
         wV3A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=f3w9URwj;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id z27-20020a17090674db00b009ba0a38f2a6sor1025221ejl.19.2023.10.10.00.50.08
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 10 Oct 2023 00:50:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=f3w9URwj;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696924208; x=1697529008; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FJhi36jVylnj85gu6IQc1ZcAE1kH76mXKOCIios85AY=;
        b=f3w9URwjwTDeLVqxc+gBE3bN1u0Taf1MDTYbU47TDr6Bai/us2GAY1GbDtlOSXpq5U
         wyFBrdqGLTfI3Ff3XvmyujHgER9WNnq9pBpbf1EGzZQDOiLAJyy/kuCOnpNb3nN4zmsg
         1s6czmEtxUicnQ4fzuLta0liSVYIkndMfSq4N48Wj0aQcPL4rk8kutG9/gvYawpLFmaR
         giWCnDaF2nIJo4JutVBGYzr1jGcP/LpnVlLY5l7uz0TmImqsquOiEye9UMBuH3WvMUl6
         Yoo/xXO68vynWdUMs457dq89U1TVyWVoOunPXsqF58qUuCQvcCd51tk/qIVEnYzFPgEg
         4HSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696924208; x=1697529008;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FJhi36jVylnj85gu6IQc1ZcAE1kH76mXKOCIios85AY=;
        b=Gf8UWlHsNLQnv2FdssZOBiF8KFTVCkovQK1z1NUVNLm1+GJl1/aJvChyVjKR5J31Qf
         eYY7ODagOAgP6qNoMy9GnY5WF9BEbYu7RigUT7ZfRF8jdbZu0qGvu+bnWfPpZP5LtXwe
         FPz1ixgcVpkMOHO0J5qzUw2o4pGWYS9e18Wu9RBNpbjBzuoPzhbDI9ZAsFGhwcTgi4BG
         OnRx+QobPKfigsoocdkJE1utQ9QLc7NOmX/L/L+CGgHdQMjdKCXEcR6EQqyNA8DkKV/B
         3eQRqOiBsWSU+RjIE5bamjbomYvIz6Hw3gUq2N9CgsypODbK1euFwDUXpMkqjn+o1Yey
         eRmA==
X-Gm-Message-State: AOJu0Yz7qjiVAmxIO2GQLcJA9oNorutYKrkJIz5NebK6iNtbH1Xx5Qd9
	12BYT1Qj3qwzL4Pr2TBiXpupduGZ
X-Google-Smtp-Source: AGHT+IFVgI2xqatFWscv0PnIeGYbb4LpnbM0EIlDStGkK15CLtZCb/cUWX0GZO+Wy0qHg5G387NnoQ==
X-Received: by 2002:a17:907:7603:b0:9b2:b633:ada2 with SMTP id jx3-20020a170907760300b009b2b633ada2mr15704652ejc.36.1696924208060;
        Tue, 10 Oct 2023 00:50:08 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan (aif79-h01-176-172-113-148.dsl.sta.abo.bbox.fr. [176.172.113.148])
        by smtp.gmail.com with ESMTPSA id lr5-20020a170906fb8500b009adcb6c0f0esm8004696ejb.193.2023.10.10.00.50.06
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 10 Oct 2023 00:50:07 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	qemu-ppc@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	qemu-arm@nongnu.org,
	qemu-block@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Laurent Vivier <lvivier@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Igor Mammedov <imammedo@redhat.com>,
	Ani Sinha <anisinha@redhat.com>
Subject: [PATCH 2/4] tests/qtest: Use qtest_get_arch_bits()
Date: Tue, 10 Oct 2023 09:49:50 +0200
Message-ID: <20231010074952.79165-3-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231010074952.79165-1-philmd@linaro.org>
References: <20231010074952.79165-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: uOIMs5M4ku7Q

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 tests/qtest/arm-cpu-features.c | 49 ++++++++++++++++------------------
 tests/qtest/bios-tables-test.c | 16 +++++------
 2 files changed, 30 insertions(+), 35 deletions(-)

diff --git a/tests/qtest/arm-cpu-features.c b/tests/qtest/arm-cpu-features.c
index a8a4c668ad..b6c1b430c1 100644
--- a/tests/qtest/arm-cpu-features.c
+++ b/tests/qtest/arm-cpu-features.c
@@ -462,7 +462,7 @@ static void test_query_cpu_model_expansion(const void *data)
     assert_has_not_feature(qts, "max", "kvm-no-adjvtime");
     assert_has_not_feature(qts, "max", "kvm-steal-time");
 
-    if (g_str_equal(qtest_get_arch(), "aarch64")) {
+    if (qtest_get_arch_bits() == 64) {
         assert_has_feature_enabled(qts, "max", "aarch64");
         assert_has_feature_enabled(qts, "max", "sve");
         assert_has_feature_enabled(qts, "max", "sve128");
@@ -507,7 +507,7 @@ static void test_query_cpu_model_expansion_kvm(const void *data)
     assert_set_feature(qts, "host", "kvm-no-adjvtime", true);
     assert_set_feature(qts, "host", "kvm-no-adjvtime", false);
 
-    if (g_str_equal(qtest_get_arch(), "aarch64")) {
+    if (qtest_get_arch_bits() == 64) {
         bool kvm_supports_steal_time;
         bool kvm_supports_sve;
         char max_name[8], name[8];
@@ -636,34 +636,31 @@ int main(int argc, char **argv)
                             NULL, test_query_cpu_model_expansion);
     }
 
-    if (!g_str_equal(qtest_get_arch(), "aarch64")) {
-        goto out;
-    }
-
-    /*
-     * For now we only run KVM specific tests with AArch64 QEMU in
-     * order avoid attempting to run an AArch32 QEMU with KVM on
-     * AArch64 hosts. That won't work and isn't easy to detect.
-     */
-    if (qtest_has_accel("kvm")) {
+    if (qtest_get_arch_bits() == 64) {
         /*
-         * This tests target the 'host' CPU type, so register it only if
-         * KVM is available.
+         * For now we only run KVM specific tests with AArch64 QEMU in
+         * order avoid attempting to run an AArch32 QEMU with KVM on
+         * AArch64 hosts. That won't work and isn't easy to detect.
          */
-        qtest_add_data_func("/arm/kvm/query-cpu-model-expansion",
-                            NULL, test_query_cpu_model_expansion_kvm);
+        if (qtest_has_accel("kvm")) {
+            /*
+             * This tests target the 'host' CPU type, so register it only if
+             * KVM is available.
+             */
+            qtest_add_data_func("/arm/kvm/query-cpu-model-expansion",
+                                NULL, test_query_cpu_model_expansion_kvm);
 
-        qtest_add_data_func("/arm/kvm/query-cpu-model-expansion/sve-off",
-                            NULL, sve_tests_sve_off_kvm);
+            qtest_add_data_func("/arm/kvm/query-cpu-model-expansion/sve-off",
+                                NULL, sve_tests_sve_off_kvm);
+        }
+
+        if (qtest_has_accel("tcg")) {
+            qtest_add_data_func("/arm/max/query-cpu-model-expansion/sve-max-vq-8",
+                                NULL, sve_tests_sve_max_vq_8);
+            qtest_add_data_func("/arm/max/query-cpu-model-expansion/sve-off",
+                                NULL, sve_tests_sve_off);
+        }
     }
 
-    if (qtest_has_accel("tcg")) {
-        qtest_add_data_func("/arm/max/query-cpu-model-expansion/sve-max-vq-8",
-                            NULL, sve_tests_sve_max_vq_8);
-        qtest_add_data_func("/arm/max/query-cpu-model-expansion/sve-off",
-                            NULL, sve_tests_sve_off);
-    }
-
-out:
     return g_test_run();
 }
diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
index f8e03dfd46..7e708d78b3 100644
--- a/tests/qtest/bios-tables-test.c
+++ b/tests/qtest/bios-tables-test.c
@@ -2089,7 +2089,7 @@ int main(int argc, char *argv[])
             qtest_add_func("acpi/piix4/nohpet", test_acpi_piix4_tcg_nohpet);
 
             /* i386 does not support memory hotplug */
-            if (strcmp(arch, "i386")) {
+            if (qtest_get_arch_bits() == 64) {
                 qtest_add_func("acpi/piix4/memhp", test_acpi_piix4_tcg_memhp);
                 qtest_add_func("acpi/piix4/dimmpxm",
                                test_acpi_piix4_tcg_dimm_pxm);
@@ -2127,7 +2127,7 @@ int main(int argc, char *argv[])
                            test_acpi_q35_tcg_acpi_hmat_noinitiator);
 
             /* i386 does not support memory hotplug */
-            if (strcmp(arch, "i386")) {
+            if (qtest_get_arch_bits() == 64) {
                 qtest_add_func("acpi/q35/memhp", test_acpi_q35_tcg_memhp);
                 qtest_add_func("acpi/q35/dimmpxm", test_acpi_q35_tcg_dimm_pxm);
                 qtest_add_func("acpi/q35/acpihmat",
@@ -2164,15 +2164,13 @@ int main(int argc, char *argv[])
                            test_acpi_microvm_ioapic2_tcg);
             qtest_add_func("acpi/microvm/oem-fields",
                            test_acpi_microvm_oem_fields);
-            if (has_tcg) {
-                if (strcmp(arch, "x86_64") == 0) {
-                    qtest_add_func("acpi/microvm/pcie",
-                                   test_acpi_microvm_pcie_tcg);
+            if (has_tcg && qtest_get_arch_bits() == 64) {
+                qtest_add_func("acpi/microvm/pcie",
+                               test_acpi_microvm_pcie_tcg);
 #ifdef CONFIG_POSIX
-                    qtest_add_func("acpi/microvm/acpierst",
-                                   test_acpi_microvm_acpi_erst);
+                qtest_add_func("acpi/microvm/acpierst",
+                               test_acpi_microvm_acpi_erst);
 #endif
-                }
             }
         }
     } else if (strcmp(arch, "aarch64") == 0) {
-- 
2.41.0
