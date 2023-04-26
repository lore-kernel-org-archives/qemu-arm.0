Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp593583ejm;
        Wed, 26 Apr 2023 11:00:48 -0700 (PDT)
X-Google-Smtp-Source: AKy350Y4tKTCj1iqRavO2GYqlHSoA8CMZWaNYEMBTYyYgrLT0BjzBamXopOn7F+4gWW8p0FD+9vc
X-Received: by 2002:adf:ce83:0:b0:2c5:5d21:7d4c with SMTP id r3-20020adfce83000000b002c55d217d4cmr15590067wrn.43.1682532048171;
        Wed, 26 Apr 2023 11:00:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1682532048; cv=none;
        d=google.com; s=arc-20160816;
        b=DjlTnZiEJEoUbnf9Vll5+3+3aDSaJNU9Xt0EKvBq4ZTTPpppqB/4EcwUvyr/aV5w2r
         Rd/ITyWMeV8J0cBOgk7r0viDeUhz5bZKuyeIg5lRT760RNTFUTjjd5wOeGoWQJpL0pju
         ZBV3W7IcF4VIo4efYYucRGblJqv+0AZnPzK4hhowkPDESW0RGlO1LV4o5Nqy/iWTcwXR
         IRzEUQ/EmBJo/zasaFA7tkB7MxlYtXpKtzLu656TNI1jciaVCumIOv/Kx3oARwWse0lk
         LUHUeIClVWh3rDkaD66JwTvuvfyYN7Q1B3LYPyOwaDmEBL6cHfgQ+j4ko6uCqnVYn3W3
         NXQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:dkim-signature;
        bh=4k8mFSrbfU/mGnU4/E2T4cc9ibafX5N/loExrv+GbS8=;
        b=QmoIdTW7QAwHuvtySKeqTWYePrxyjk/CFYxtgp5g68ks6X9QvxD9o51GlJ9+THEd0K
         5OVQzS2FYgOAsDvISp7PgnSbRGU69vSyCUf/K6yNnA1MqqYfdaJE4DsFk7uK+KfaJLvY
         GZiwC0o0UCRJv0w+c6hVJAFs0yml3r3cgqO6UWMLplWpNQsCPG3KG8rYiWAG0WwMqL9w
         EhI6HQGXM6Lz7xkIhWJPYHpv+YRjo8Kl/BRZA5E1Upmv09YaOB9g/9ROjy3UeWUR0Uwe
         G6zLVkQuRwjpKP2QPIEjfodJppZZ0hOW3F/WlDwMazY8H79xa+794xl2o+I7Ak890tlY
         6W6Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=GP5VZdOW;
       dkim=neutral (no key) header.i=@suse.de;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1c as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out1.suse.de (smtp-out1.suse.de. [2001:67c:2178:6::1c])
        by mx.google.com with ESMTPS id n10-20020a5d51ca000000b002f3ea9b7ad8si10026127wrv.679.2023.04.26.11.00.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Apr 2023 11:00:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1c as permitted sender) client-ip=2001:67c:2178:6::1c;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=GP5VZdOW;
       dkim=neutral (no key) header.i=@suse.de;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1c as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id D10D2219ED;
	Wed, 26 Apr 2023 18:00:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1682532047; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4k8mFSrbfU/mGnU4/E2T4cc9ibafX5N/loExrv+GbS8=;
	b=GP5VZdOWh6WjDiFZiGyrbIlWnUZneFu4D5BZKZJB//4e73qUR2WO7SoDB7a50q5kBdJKBE
	GH5f4WIqw2Nbdn47K8Lw+2NuAV0V6pv4NnTQysQfcPbuzjBfTKg8N8dMFWtDeQBxM49qVs
	oLR26GOhtEufPUd2eS8lI/6W0DfJM9Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1682532047;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4k8mFSrbfU/mGnU4/E2T4cc9ibafX5N/loExrv+GbS8=;
	b=3v1GZRtxxSPE0fWpWwBUWMXthJO/rhKYD3hdgqYz1b2gidhVRzYVQqcFUWjwEg+7T1mdGd
	cnWR3yIpnXJEJxCw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A1C88138F0;
	Wed, 26 Apr 2023 18:00:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id iAWKGstmSWSoVQAAMHmgww
	(envelope-from <farosas@suse.de>); Wed, 26 Apr 2023 18:00:43 +0000
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
	Thomas Huth <thuth@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Igor Mammedov <imammedo@redhat.com>,
	Ani Sinha <anisinha@redhat.com>,
	Laurent Vivier <lvivier@redhat.com>
Subject: [PATCH v11 08/13] tests/qtest: Fix tests when no KVM or TCG are present
Date: Wed, 26 Apr 2023 15:00:08 -0300
Message-Id: <20230426180013.14814-9-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230426180013.14814-1-farosas@suse.de>
References: <20230426180013.14814-1-farosas@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: ftZMjhsRV7qT

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

Reviewed-by: Juan Quintela <quintela@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Fabiano Rosas <farosas@suse.de>
---
 tests/qtest/bios-tables-test.c | 11 +++++++++--
 tests/qtest/boot-serial-test.c |  5 +++++
 tests/qtest/migration-test.c   |  9 ++++++++-
 tests/qtest/pxe-test.c         |  8 +++++++-
 tests/qtest/vmgenid-test.c     |  9 +++++++--
 5 files changed, 36 insertions(+), 6 deletions(-)

diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
index 464f87382e..7fd88b0e9c 100644
--- a/tests/qtest/bios-tables-test.c
+++ b/tests/qtest/bios-tables-test.c
@@ -2045,8 +2045,7 @@ static void test_acpi_virt_oem_fields(void)
 int main(int argc, char *argv[])
 {
     const char *arch = qtest_get_arch();
-    const bool has_kvm = qtest_has_accel("kvm");
-    const bool has_tcg = qtest_has_accel("tcg");
+    bool has_kvm, has_tcg;
     char *v_env = getenv("V");
     int ret;
 
@@ -2056,6 +2055,14 @@ int main(int argc, char *argv[])
 
     g_test_init(&argc, &argv, NULL);
 
+    has_kvm = qtest_has_accel("kvm");
+    has_tcg = qtest_has_accel("tcg");
+
+    if (!has_tcg && !has_kvm) {
+        g_test_skip("No KVM or TCG accelerator available");
+        return 0;
+    }
+
     if (strcmp(arch, "i386") == 0 || strcmp(arch, "x86_64") == 0) {
         ret = boot_sector_init(disk);
         if (ret) {
diff --git a/tests/qtest/boot-serial-test.c b/tests/qtest/boot-serial-test.c
index 3aef3a97a9..6dd06aeaf4 100644
--- a/tests/qtest/boot-serial-test.c
+++ b/tests/qtest/boot-serial-test.c
@@ -287,6 +287,11 @@ int main(int argc, char *argv[])
 
     g_test_init(&argc, &argv, NULL);
 
+    if (!qtest_has_accel("tcg") && !qtest_has_accel("kvm")) {
+        g_test_skip("No KVM or TCG accelerator available");
+        return 0;
+    }
+
     for (i = 0; tests[i].arch != NULL; i++) {
         if (g_str_equal(arch, tests[i].arch) &&
             qtest_has_machine(tests[i].machine)) {
diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
index 60dd53d3ec..be73ec3c06 100644
--- a/tests/qtest/migration-test.c
+++ b/tests/qtest/migration-test.c
@@ -2477,7 +2477,7 @@ static bool kvm_dirty_ring_supported(void)
 
 int main(int argc, char **argv)
 {
-    bool has_kvm;
+    bool has_kvm, has_tcg;
     bool has_uffd;
     const char *arch;
     g_autoptr(GError) err = NULL;
@@ -2486,6 +2486,13 @@ int main(int argc, char **argv)
     g_test_init(&argc, &argv, NULL);
 
     has_kvm = qtest_has_accel("kvm");
+    has_tcg = qtest_has_accel("tcg");
+
+    if (!has_tcg && !has_kvm) {
+        g_test_skip("No KVM or TCG accelerator available");
+        return 0;
+    }
+
     has_uffd = ufd_version_check();
     arch = qtest_get_arch();
 
diff --git a/tests/qtest/pxe-test.c b/tests/qtest/pxe-test.c
index 62b6eef464..e4b48225a5 100644
--- a/tests/qtest/pxe-test.c
+++ b/tests/qtest/pxe-test.c
@@ -131,11 +131,17 @@ int main(int argc, char *argv[])
     int ret;
     const char *arch = qtest_get_arch();
 
+    g_test_init(&argc, &argv, NULL);
+
+    if (!qtest_has_accel("tcg") && !qtest_has_accel("kvm")) {
+        g_test_skip("No KVM or TCG accelerator available");
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
index efba76e716..324db08c7a 100644
--- a/tests/qtest/vmgenid-test.c
+++ b/tests/qtest/vmgenid-test.c
@@ -165,13 +165,18 @@ int main(int argc, char **argv)
 {
     int ret;
 
+    g_test_init(&argc, &argv, NULL);
+
+    if (!qtest_has_accel("tcg") && !qtest_has_accel("kvm")) {
+        g_test_skip("No KVM or TCG accelerator available");
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
