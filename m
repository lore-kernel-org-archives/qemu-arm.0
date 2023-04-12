Received: by 2002:a17:907:2c4d:b0:94e:1233:1117 with SMTP id hf13csp281282ejc;
        Wed, 12 Apr 2023 05:19:03 -0700 (PDT)
X-Google-Smtp-Source: AKy350b1bRfsLyVa0mYqD/gGeXwX0hiX2kHIeDpuB/jSVGdrJB6xa7RzqiJ6SojHxrw7Dkz6Vm2w
X-Received: by 2002:a05:600c:2108:b0:3f0:373d:780 with SMTP id u8-20020a05600c210800b003f0373d0780mr12897001wml.34.1681301942930;
        Wed, 12 Apr 2023 05:19:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1681301942; cv=none;
        d=google.com; s=arc-20160816;
        b=scjunRPnAVLaQNsL/eorYaEe1ZWvCqmDhwPF0aOpc1rRPf0ilS8qTCpQMxyTNu2B1+
         CkFrgw8ZvFAMHuLa+jsfGb8qEXTI8u4BCHdG6+1DZ/5jSeSRMjkvrBEJ6fvrKRr82aEn
         V9fHaPL1Mb8zfFFaVBBsQ3LNu0RO4cRIhevYENhWKHnQEGcp9AcpsLwC/y2O2oFIh9NE
         m63xxdPCZ9z/ADrB/v195q3953Id6fW5MFLcc1DBXBnzDWrLpUcuQ3hEmghg6oO1Tj7f
         08xYzHZYcE0QBaLt2Reviym2MqDohe6kpCpkfhOQVYCVxwh5WhJ2Eudojcp4+834oA7F
         EH5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:dkim-signature;
        bh=fd8TZ6HWDdVDQ805ayW8GaMGbGtR9iHco7DFaEXSKjw=;
        b=sRrLYza9qZcJC3Mov48B1jzJtWZi97C94FwFkWaQFDZu7pYvMhifF/WRrzCBH5/Zr3
         U1qrm9ag1MCoDLBXovuw/yw864kPXLLbFfo6ubu3dUHn+YiY8kp5FtMCKCk9h+lEyEoD
         0HR4/N9fTP6ALbGm0LEJDPPC4Q9uvHtPdDj1uIOSanjqhEkKPgJfZQlossyxoWyI80c2
         zbVyxdrPs7Jb4e23faCB8RY0E3QXeG62HCRA0nH1xrN2/MlQiU7UMMLxzWVGN/R31Upk
         XVCuLLTxc7dWuUKwvlFwpQILwsBwVoptEKmAQyX1tE/9MUfGeISUtNplj7S8ADY8JZAM
         AkSw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=Y+sNUDcs;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1d as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out2.suse.de (smtp-out2.suse.de. [2001:67c:2178:6::1d])
        by mx.google.com with ESMTPS id z9-20020a5d44c9000000b002efbab41faasi8042489wrr.57.2023.04.12.05.19.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Apr 2023 05:19:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1d as permitted sender) client-ip=2001:67c:2178:6::1d;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=Y+sNUDcs;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1d as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 9A00C1F891;
	Wed, 12 Apr 2023 12:19:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1681301942; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fd8TZ6HWDdVDQ805ayW8GaMGbGtR9iHco7DFaEXSKjw=;
	b=Y+sNUDcsv8xBnF/31A+EGRdMLsDxQcH1fY54O0Ietvxzu38OnRor6ahcMxiwLZ4adTQCGL
	IKufUikTEMZHwTlT2CYZSYbJ2Pkn7mbeFGo2G5lqgtkNbsoncxGv+cBZZcv3ckrYX0lq/o
	DZ0Tg7nISCVWg/gJuaJh53BVW1paq4I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1681301942;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fd8TZ6HWDdVDQ805ayW8GaMGbGtR9iHco7DFaEXSKjw=;
	b=4lrXhHQjf88mHU4ioeJusQIjjR1kuif6ZL6HPE7oRpRh1cDbp0a+CAvcwdsjWOry8vJES0
	4wSI8nt9MSVJB2Bg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 294E3132C7;
	Wed, 12 Apr 2023 12:18:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id EDv6N7GhNmSMUgAAMHmgww
	(envelope-from <farosas@suse.de>); Wed, 12 Apr 2023 12:18:57 +0000
From: Fabiano Rosas <farosas@suse.de>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Claudio Fontana <cfontana@suse.de>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Alexander Graf <agraf@csgraf.de>,
	Cornelia Huck <cohuck@redhat.com>,
	Juan Quintela <quintela@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Igor Mammedov <imammedo@redhat.com>,
	Ani Sinha <ani@anisinha.ca>,
	Thomas Huth <thuth@redhat.com>,
	Laurent Vivier <lvivier@redhat.com>
Subject: [PATCH v10 07/11] tests/qtest: Fix tests when no KVM or TCG are present
Date: Wed, 12 Apr 2023 09:18:25 -0300
Message-Id: <20230412121829.14452-8-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230412121829.14452-1-farosas@suse.de>
References: <20230412121829.14452-1-farosas@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: ho9GNIf+bCr1

It is possible to have a build with both TCG and KVM disabled due to
Xen requiring the i386 and x86_64 binaries to be present in an aarch64
host.

If we build with --disable-tcg on the aarch64 host, we will end-up
with a QEMU binary (x86) that does not support TCG nor KVM.

Skip tests that crash or hang in the above scenario. Do not include
any test cases if TCG and KVM are missing.

Make sure that calls to qtest_has_accel are placed after g_test_init
in similar fashion to commit ae4b01b349 ("tests: Ensure TAP version is
printed before other messages") to avoid TAP parsing errors.

Signed-off-by: Fabiano Rosas <farosas@suse.de>
Reviewed-by: Juan Quintela <quintela@redhat.com>
---
 tests/qtest/bios-tables-test.c | 11 +++++++++--
 tests/qtest/boot-serial-test.c |  5 +++++
 tests/qtest/migration-test.c   |  9 ++++++++-
 tests/qtest/pxe-test.c         |  8 +++++++-
 tests/qtest/vmgenid-test.c     |  9 +++++++--
 5 files changed, 36 insertions(+), 6 deletions(-)

diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
index 8733589437..9c3642717d 100644
--- a/tests/qtest/bios-tables-test.c
+++ b/tests/qtest/bios-tables-test.c
@@ -2082,8 +2082,7 @@ static void test_acpi_virt_oem_fields(void)
 int main(int argc, char *argv[])
 {
     const char *arch = qtest_get_arch();
-    const bool has_kvm = qtest_has_accel("kvm");
-    const bool has_tcg = qtest_has_accel("tcg");
+    bool has_kvm, has_tcg;
     char *v_env = getenv("V");
     int ret;
 
@@ -2093,6 +2092,14 @@ int main(int argc, char *argv[])
 
     g_test_init(&argc, &argv, NULL);
 
+    has_kvm = qtest_has_accel("kvm");
+    has_tcg = qtest_has_accel("tcg");
+
+    if (!has_tcg && !has_kvm) {
+        g_test_skip("No accelerator available");
+        return 0;
+    }
+
     if (strcmp(arch, "i386") == 0 || strcmp(arch, "x86_64") == 0) {
         ret = boot_sector_init(disk);
         if (ret) {
diff --git a/tests/qtest/boot-serial-test.c b/tests/qtest/boot-serial-test.c
index 3aef3a97a9..28bab3d5e4 100644
--- a/tests/qtest/boot-serial-test.c
+++ b/tests/qtest/boot-serial-test.c
@@ -287,6 +287,11 @@ int main(int argc, char *argv[])
 
     g_test_init(&argc, &argv, NULL);
 
+    if (!qtest_has_accel("tcg") && !qtest_has_accel("kvm")) {
+        g_test_skip("No accelerator available");
+        return 0;
+    }
+
     for (i = 0; tests[i].arch != NULL; i++) {
         if (g_str_equal(arch, tests[i].arch) &&
             qtest_has_machine(tests[i].machine)) {
diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
index 3b615b0da9..24deb2d432 100644
--- a/tests/qtest/migration-test.c
+++ b/tests/qtest/migration-test.c
@@ -2462,7 +2462,7 @@ static bool kvm_dirty_ring_supported(void)
 
 int main(int argc, char **argv)
 {
-    bool has_kvm;
+    bool has_kvm, has_tcg;
     bool has_uffd;
     const char *arch;
     g_autoptr(GError) err = NULL;
@@ -2471,6 +2471,13 @@ int main(int argc, char **argv)
     g_test_init(&argc, &argv, NULL);
 
     has_kvm = qtest_has_accel("kvm");
+    has_tcg = qtest_has_accel("tcg");
+
+    if (!has_tcg && !has_kvm) {
+        g_test_skip("No accelerator available");
+        return 0;
+    }
+
     has_uffd = ufd_version_check();
     arch = qtest_get_arch();
 
diff --git a/tests/qtest/pxe-test.c b/tests/qtest/pxe-test.c
index 62b6eef464..5813adcf56 100644
--- a/tests/qtest/pxe-test.c
+++ b/tests/qtest/pxe-test.c
@@ -131,11 +131,17 @@ int main(int argc, char *argv[])
     int ret;
     const char *arch = qtest_get_arch();
 
+    g_test_init(&argc, &argv, NULL);
+
+    if (!qtest_has_accel("tcg") && !qtest_has_accel("kvm")) {
+        g_test_skip("No accelerator available");
+        return 0;
+    }
+
     ret = boot_sector_init(disk);
     if(ret)
         return ret;
 
-    g_test_init(&argc, &argv, NULL);
 
     if (strcmp(arch, "i386") == 0 || strcmp(arch, "x86_64") == 0) {
         test_batch(x86_tests, false);
diff --git a/tests/qtest/vmgenid-test.c b/tests/qtest/vmgenid-test.c
index efba76e716..a597cde707 100644
--- a/tests/qtest/vmgenid-test.c
+++ b/tests/qtest/vmgenid-test.c
@@ -165,13 +165,18 @@ int main(int argc, char **argv)
 {
     int ret;
 
+    g_test_init(&argc, &argv, NULL);
+
+    if (!qtest_has_accel("tcg") && !qtest_has_accel("kvm")) {
+        g_test_skip("No accelerator available");
+        return 0;
+    }
+
     ret = boot_sector_init(disk);
     if (ret) {
         return ret;
     }
 
-    g_test_init(&argc, &argv, NULL);
-
     qtest_add_func("/vmgenid/vmgenid/set-guid",
                    vmgenid_set_guid_test);
     qtest_add_func("/vmgenid/vmgenid/set-guid-auto",
-- 
2.35.3
