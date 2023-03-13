Received: by 2002:a17:906:faca:b0:92b:dcda:f23e with SMTP id lu10csp378961ejb;
        Mon, 13 Mar 2023 08:11:27 -0700 (PDT)
X-Google-Smtp-Source: AK7set9PqgLQVg0k+rgp/SSMem2tdaBB5uqGVDF+INTuXWD3Y+UITzR2uZDhhkSKcixhnz0JoKwU
X-Received: by 2002:a05:600c:384f:b0:3eb:2b79:a40 with SMTP id s15-20020a05600c384f00b003eb2b790a40mr10790017wmr.20.1678720287013;
        Mon, 13 Mar 2023 08:11:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1678720287; cv=none;
        d=google.com; s=arc-20160816;
        b=qzr65khus1D0z7PtwZ+aTIZzDxhKtxEgXXYayXmVVhoLkp14lhS7iAZqw8vUhdBN0G
         zgMpR/NIBXo48F23snlLI2E8zkLGPF5i0MfJnHHRcBhcmj2o7qecKb0YmbY3a4o5u6SA
         nhh547XsONV/AbAMfvDG+//9AC2Sf/1ZisIG2/Ixvxrs+PtHl6yUDZYYvtnlVbHScyM+
         3Rps7wsqilSiNB3FEsGYz+5EtzKNEoTd4EfM1wNpPJOofVVPUemOMYN39rEU6fsjZldz
         DbbL0tvhj7cr7jvvlq4vQFUYkRO4dsN+yIHeJjubRczjjYUhR7rApNYy+IBTOrDGWnZo
         hf0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:dkim-signature;
        bh=2c86UeFI5T202M1tHwei5hS8KjfbDU7y+PlNk4ESHNk=;
        b=SAUUYbwLl3wufvBpjgr45XFQxu6PV40ZVjqI3kMIMUDlOslTygIG22Q72rPFRpkPPM
         G9AYnSK2SB4ijYZhioFVPAlerCXZPB8ndVnS5COkrqThtiSoI5r8HkJNcenErh8Xhwed
         di/T09F8FfFeeAAgtRr+wo/f8bHsHBCg72EMQzrBzA6povHGRBJjlkOmHKcSx/ePjLVS
         4w4BtwTcXJmFnNmE6sI2xxTsOO1XT/aOL2/MDRSudDIF5B8vvCL61NYJbBII1zRj/dcH
         qZ248+ggeWy7i+Z3zAAlIgUuXEghr9jcXtfQyF49sb8D5nKp1Jcm6ODSNlcreT8Ft1t0
         jNaQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=IibIn4Sv;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519;
       spf=pass (google.com: domain of farosas@suse.de designates 195.135.220.29 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out2.suse.de (smtp-out2.suse.de. [195.135.220.29])
        by mx.google.com with ESMTPS id p11-20020adfce0b000000b002ce9f0e4a90si6103516wrn.1016.2023.03.13.08.11.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Mar 2023 08:11:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 195.135.220.29 as permitted sender) client-ip=195.135.220.29;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=IibIn4Sv;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519;
       spf=pass (google.com: domain of farosas@suse.de designates 195.135.220.29 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id A96281FE0D;
	Mon, 13 Mar 2023 15:11:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1678720286; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2c86UeFI5T202M1tHwei5hS8KjfbDU7y+PlNk4ESHNk=;
	b=IibIn4Svz3w5gx9xS2zWpN0iwOPEfjR6lrUmS6V33W4eSoHyux6g34LGaRe49fj84KHThj
	fvXJ5CXLBcTJ1Q7o/FvYqD7C72fM7Tl2Dvb2FjM9NG/zFgyf7I28GBz7N0bKqjPHMnL9gS
	+0ZDi9L6bM94ImupTwRr5O834o70/L0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1678720286;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2c86UeFI5T202M1tHwei5hS8KjfbDU7y+PlNk4ESHNk=;
	b=RzjHjj8OWG1/egyyMrUJOkvdDy366hBiSVY9vfekB9XJJx0/GQ4mbNQ/0bEMWc8UcNL49B
	PdIlG6DUNzfltKCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 44E2A13582;
	Mon, 13 Mar 2023 15:11:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id cCeSAxo9D2R1YwAAMHmgww
	(envelope-from <farosas@suse.de>); Mon, 13 Mar 2023 15:11:22 +0000
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
	Laurent Vivier <lvivier@redhat.com>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: [PATCH v9 06/10] tests/qtest: Fix tests when no KVM or TCG are present
Date: Mon, 13 Mar 2023 12:10:54 -0300
Message-Id: <20230313151058.19645-7-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230313151058.19645-1-farosas@suse.de>
References: <20230313151058.19645-1-farosas@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: 7UsD7S/U7W6r

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
 tests/qtest/migration-test.c   | 10 +++++++++-
 tests/qtest/pxe-test.c         |  8 +++++++-
 tests/qtest/vmgenid-test.c     |  9 +++++++--
 5 files changed, 37 insertions(+), 6 deletions(-)

diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
index 76d5100911..2315adc70c 100644
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
index d4ab3934ed..5e4d562f0b 100644
--- a/tests/qtest/migration-test.c
+++ b/tests/qtest/migration-test.c
@@ -2459,7 +2459,7 @@ static bool kvm_dirty_ring_supported(void)
 
 int main(int argc, char **argv)
 {
-    const bool has_kvm = qtest_has_accel("kvm");
+    bool has_kvm, has_tcg;
     const bool has_uffd = ufd_version_check();
     const char *arch = qtest_get_arch();
     g_autoptr(GError) err = NULL;
@@ -2467,6 +2467,14 @@ int main(int argc, char **argv)
 
     g_test_init(&argc, &argv, NULL);
 
+    has_kvm = qtest_has_accel("kvm");
+    has_tcg = qtest_has_accel("tcg");
+
+    if (!has_tcg && !has_kvm) {
+        g_test_skip("No accelerator available");
+        return 0;
+    }
+
     /*
      * On ppc64, the test only works with kvm-hv, but not with kvm-pr and TCG
      * is touchy due to race conditions on dirty bits (especially on PPC for
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
