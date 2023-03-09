Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp1122214ejc;
        Thu, 9 Mar 2023 12:15:09 -0800 (PST)
X-Google-Smtp-Source: AK7set8QvHCEh5Y7lPkllDfhHtUO/9lk7d1fopnsewKEZOwSlYuDGsx1NBTye3OWPmgtIGtjElAp
X-Received: by 2002:adf:e5c3:0:b0:2c5:4659:3e76 with SMTP id a3-20020adfe5c3000000b002c546593e76mr16408692wrn.18.1678392909782;
        Thu, 09 Mar 2023 12:15:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1678392909; cv=none;
        d=google.com; s=arc-20160816;
        b=AQnYBQU+z5v+/hvDneA8DDN/AF/EC6G/QAN5sF1uwo0K+E2EphpGmy+oaFT+iYI8lO
         5Te0i1v0m1tqI6BqYq/VzjalT+FRpzItZB48IcPURV85lwYwAuK6u078RVX1lmFWlfLo
         Va80mTxaMfJwvImc+KUHAjOn6axlItnQw53aapwtryrc036OgwejWzTANyQcZ9doBHu3
         5g0YoDLI2GMDuxdaqI/OlIFDCK9HQIbY9deNbslzwiS5OngMuonvNw7Z01BSDgdHGLBE
         n/Ty8qUdyu+uDrMIakmYn78cDStHw6ePxJyVVx0oCPUrlSJp74IrHG/4TECGMsO/sknX
         gU6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:dkim-signature;
        bh=nd8VaW1irxQb3bqzXlXlLymmUu5RWg8W4Szo9bph6gI=;
        b=RxIjaZoQpXd/K7vDvFgBOBINO6i3Mr1KMh2oIV3REQAKncakzlKeBKyftPxGgbtNGp
         zBcqIrJHQy8t4PdTnBZVRe7d4VoQHRM9bJfeaCCDYgE80T++i7+SsWqN30zWFDiFSHfk
         UfeVehQIUB+veenl1seCYgO86OkXyC3b6q8ST4NU4PiQ1NZGvzsJFfmPiCAQed6F5Gma
         9vffmh7hMw2rAA6FqIKu3iIxOu358ONpgOeXgfTjmBDlgxBV73NykMtDz/KGvwZdhmAj
         bavmK9oGF2cIaSmNuyinsqwhOeq1TCNyaFhzcDb2DmhtQRiwTSLLiVihg+RYA2ngJdGZ
         zj8w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=NoI5im4f;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519 header.b=11pG4uhz;
       spf=pass (google.com: domain of farosas@suse.de designates 195.135.220.28 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out1.suse.de (smtp-out1.suse.de. [195.135.220.28])
        by mx.google.com with ESMTPS id m2-20020adffa02000000b002bdea63db39si279848wrr.834.2023.03.09.12.15.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Mar 2023 12:15:09 -0800 (PST)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 195.135.220.28 as permitted sender) client-ip=195.135.220.28;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=NoI5im4f;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519 header.b=11pG4uhz;
       spf=pass (google.com: domain of farosas@suse.de designates 195.135.220.28 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 641B7223D2;
	Thu,  9 Mar 2023 20:15:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1678392909; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nd8VaW1irxQb3bqzXlXlLymmUu5RWg8W4Szo9bph6gI=;
	b=NoI5im4fE5OSM4b3yCy2rUm8b5WQWGWd4nQ9IZDjedeLyqyJYh4bMuzUyprNvGUBl6UTWJ
	LfI4ftOXkMAwJY9fuCROvpLUB6oVwlZUCfWA8SSIHxQ1pIQeFLtDVwQGiSbjSe1gY5n9IT
	ncRrVxrpOJYfpZYbLdyG+E4DA346GX4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1678392909;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nd8VaW1irxQb3bqzXlXlLymmUu5RWg8W4Szo9bph6gI=;
	b=11pG4uhzUYiWwq+HZkxQ5LupO3yw9iwVqSpZUBT40qZ1iap7N3oWCUPRnqGHOnXnvuBHL5
	pb6gO4MttWLo/1DA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E4FD01391B;
	Thu,  9 Mar 2023 20:15:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id UNDhKkg+CmTUZwAAMHmgww
	(envelope-from <farosas@suse.de>); Thu, 09 Mar 2023 20:15:04 +0000
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
Subject: [PATCH v8 08/11] tests/qtest: Fix tests when no KVM or TCG are present
Date: Thu,  9 Mar 2023 17:14:31 -0300
Message-Id: <20230309201434.10831-9-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230309201434.10831-1-farosas@suse.de>
References: <20230309201434.10831-1-farosas@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: U168HOeiwgob

It is possible to have a build with both TCG and KVM disabled due to
Xen requiring the i386 and x86_64 binaries to be present in an aarch64
host.

If we build with --disable-tcg on the aarch64 host, we will end-up
with a QEMU binary (x86) that does not support TCG nor KVM.

Fix tests that crash or hang in the above scenario. Do not include any
test cases if TCG and KVM are missing.

Make sure that calls to qtest_has_accel are placed after g_test_init
in similar fashion to commit ae4b01b349 ("tests: Ensure TAP version is
printed before other messages") to avoid TAP parsing errors.

Signed-off-by: Fabiano Rosas <farosas@suse.de>
Reviewed-by: Juan Quintela <quintela@redhat.com>
---
This currently affects Arm, but will also affect x86 after the xenpvh
series gets merged. This patch fixes both scenarios.
---
 tests/qtest/bios-tables-test.c | 10 ++++++++--
 tests/qtest/boot-serial-test.c | 10 ++++++++++
 tests/qtest/migration-test.c   |  9 ++++++++-
 tests/qtest/pxe-test.c         |  7 ++++++-
 tests/qtest/vmgenid-test.c     |  8 ++++++--
 5 files changed, 38 insertions(+), 6 deletions(-)

diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
index d29a4e47af..5cbad2f29f 100644
--- a/tests/qtest/bios-tables-test.c
+++ b/tests/qtest/bios-tables-test.c
@@ -2109,8 +2109,7 @@ static void test_acpi_virt_oem_fields(void)
 int main(int argc, char *argv[])
 {
     const char *arch = qtest_get_arch();
-    const bool has_kvm = qtest_has_accel("kvm");
-    const bool has_tcg = qtest_has_accel("tcg");
+    bool has_kvm, has_tcg;
     char *v_env = getenv("V");
     int ret;
 
@@ -2120,6 +2119,13 @@ int main(int argc, char *argv[])
 
     g_test_init(&argc, &argv, NULL);
 
+    has_kvm = qtest_has_accel("kvm");
+    has_tcg = qtest_has_accel("tcg");
+
+    if (!has_tcg && !has_kvm) {
+        return 0;
+    }
+
     if (strcmp(arch, "i386") == 0 || strcmp(arch, "x86_64") == 0) {
         ret = boot_sector_init(disk);
         if (ret) {
diff --git a/tests/qtest/boot-serial-test.c b/tests/qtest/boot-serial-test.c
index 3aef3a97a9..406b4421cc 100644
--- a/tests/qtest/boot-serial-test.c
+++ b/tests/qtest/boot-serial-test.c
@@ -17,6 +17,9 @@
 #include "libqtest.h"
 #include "libqos/libqos-spapr.h"
 
+static bool has_tcg;
+static bool has_kvm;
+
 static const uint8_t bios_avr[] = {
     0x88, 0xe0,             /* ldi r24, 0x08   */
     0x80, 0x93, 0xc1, 0x00, /* sts 0x00C1, r24 ; Enable tx */
@@ -287,6 +290,13 @@ int main(int argc, char *argv[])
 
     g_test_init(&argc, &argv, NULL);
 
+    has_tcg = qtest_has_accel("tcg");
+    has_kvm = qtest_has_accel("kvm");
+
+    if (!has_tcg && !has_kvm) {
+        return 0;
+    }
+
     for (i = 0; tests[i].arch != NULL; i++) {
         if (g_str_equal(arch, tests[i].arch) &&
             qtest_has_machine(tests[i].machine)) {
diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
index d4ab3934ed..7eedee7b2d 100644
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
@@ -2467,6 +2467,13 @@ int main(int argc, char **argv)
 
     g_test_init(&argc, &argv, NULL);
 
+    has_kvm = qtest_has_accel("kvm");
+    has_tcg = qtest_has_accel("tcg");
+
+    if (!has_tcg && !has_kvm) {
+        return 0;
+    }
+
     /*
      * On ppc64, the test only works with kvm-hv, but not with kvm-pr and TCG
      * is touchy due to race conditions on dirty bits (especially on PPC for
diff --git a/tests/qtest/pxe-test.c b/tests/qtest/pxe-test.c
index 62b6eef464..935b661dac 100644
--- a/tests/qtest/pxe-test.c
+++ b/tests/qtest/pxe-test.c
@@ -131,11 +131,16 @@ int main(int argc, char *argv[])
     int ret;
     const char *arch = qtest_get_arch();
 
+    g_test_init(&argc, &argv, NULL);
+
+    if (!qtest_has_accel("tcg") && !qtest_has_accel("kvm")) {
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
index efba76e716..9eb6371ae8 100644
--- a/tests/qtest/vmgenid-test.c
+++ b/tests/qtest/vmgenid-test.c
@@ -165,13 +165,17 @@ int main(int argc, char **argv)
 {
     int ret;
 
+    g_test_init(&argc, &argv, NULL);
+
+    if (!qtest_has_accel("tcg") && !qtest_has_accel("kvm")) {
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
