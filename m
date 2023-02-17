Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp129126ejb;
        Fri, 17 Feb 2023 12:15:39 -0800 (PST)
X-Google-Smtp-Source: AK7set+AevpmZNN7voAVojA7lFP9XtsWB4g0KApzjMSHjzyYxs/R7FrPeLwDuWfM5NZXjZmvEj7J
X-Received: by 2002:a5d:5012:0:b0:2c5:5878:e5a6 with SMTP id e18-20020a5d5012000000b002c55878e5a6mr8653257wrt.61.1676664939785;
        Fri, 17 Feb 2023 12:15:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676664939; cv=none;
        d=google.com; s=arc-20160816;
        b=bTCIkFaekhOmEeasLl6wtsaWnQX4Isr15JuGwxWVbwKSZfJsmTThWvdK/z40EjVwo6
         zWBKww3THRCt0y+KD9PkdUnSOnsoTgvcsZ/4xB8IM0dmUab2NTobUQCFDwaRts2BGBBP
         IpxZ+IxFoDuyh4tkokuZNKI4id2c1h2/ANSuNv8HH7OVOEYp2vfImG5yZ45HKdn0sr3V
         7obi4rcg+jJDvlL5FLdteS2gqntkK0NglaC5mkOZgJMqZes1s8Z15F2kfpWPejA/IM0H
         k9Ec1wDT8j0iRpMxNX7o2qSNqRluuQCwqnVbBoTVBFtttfMCXOAU2twitHw+UJwshfn0
         1TZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:dkim-signature;
        bh=IZIy8Z3iGPcCgRkuMHF+6DkhbdLUaHXoLVg5l0Z77Vk=;
        b=aCKnh8Iqdx8Ad/m465SSsuTMPjWDZ4zzBPMYeF0GHgHKeO1iDb/N7U5I7btpHphdUN
         FuJzze+QEasWjb0AmTbni7pbowFYorXheQk6NU+MKpG7/PymLKf6Y7dSPNZZCuRvFhIB
         zac+TNeGvfqUjy7pHVW9j5yBQhuayXNYj5F8fGZtRisBLNCCM2JlD9YAYGMXyme5BurH
         YYAe5ZB2iwKSTPoUbZucYi+6zecGfkdw8FAxOYz9BXg16Zl7Jy4kcvfW0TWPL9zwFolS
         JzK2sXYaa7c81iNcuiBzVnl7OjAAmNDLAhJDdrlyjyGGfkV15Ao/QrElH2TK0hTpFbut
         pNoA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b="o3/db6s7";
       dkim=neutral (no key) header.i=@suse.de;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1c as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out1.suse.de (smtp-out1.suse.de. [2001:67c:2178:6::1c])
        by mx.google.com with ESMTPS id j3-20020adff003000000b002c553335a09si5838902wro.1026.2023.02.17.12.15.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Feb 2023 12:15:39 -0800 (PST)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1c as permitted sender) client-ip=2001:67c:2178:6::1c;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b="o3/db6s7";
       dkim=neutral (no key) header.i=@suse.de;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1c as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 5FB7E21B85;
	Fri, 17 Feb 2023 20:15:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1676664939; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IZIy8Z3iGPcCgRkuMHF+6DkhbdLUaHXoLVg5l0Z77Vk=;
	b=o3/db6s78brkhwLwQxg4nwW6bHaUHHmrW9pigJI/BpA3gWn6hCYTNRpR9QBW2jp5eR1d8T
	T4ss9hq2SayiQWscmDC/t3aiR0D0/esNYj3H0L8bZJKj1xGwr3e+IxvQS46bUIYkN+Ac++
	xaBFQdjC+MzlwKW581f/eYvWcI3XkjE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1676664939;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IZIy8Z3iGPcCgRkuMHF+6DkhbdLUaHXoLVg5l0Z77Vk=;
	b=YLNGxPgTlzYUZQsxHY7zIfiIY+p4i0vZ0lZf/Mfk3AMYXn8UAA0T71kWlJ72VZpqO8vECk
	0GY9yS3bxbNlkiBw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id F365F138E3;
	Fri, 17 Feb 2023 20:15:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id SK1ZLmbg72MwIAAAMHmgww
	(envelope-from <farosas@suse.de>); Fri, 17 Feb 2023 20:15:34 +0000
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
	"Michael S. Tsirkin" <mst@redhat.com>,
	Igor Mammedov <imammedo@redhat.com>,
	Ani Sinha <ani@anisinha.ca>,
	Thomas Huth <thuth@redhat.com>,
	Laurent Vivier <lvivier@redhat.com>,
	Juan Quintela <quintela@redhat.com>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: [PATCH v6 29/29] tests/qtest: Fix tests when no KVM or TCG are present
Date: Fri, 17 Feb 2023 17:11:50 -0300
Message-Id: <20230217201150.22032-30-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230217201150.22032-1-farosas@suse.de>
References: <20230217201150.22032-1-farosas@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: oC5U5IcrxTew

It is possible to have a build with both TCG and KVM disabled due to
Xen requiring the i386 and x86_64 binaries to be present in an aarch64
host.

If we build with --disable-tcg on the aarch64 host, we will end-up
with a QEMU binary (x86) that does not support TCG nor KVM.

Fix tests that crash or hang in the above scenario. Do not include any
test cases if TCG and KVM are missing.

Signed-off-by: Fabiano Rosas <farosas@suse.de>
---
This currently affects Arm, but will also affect x86 after the xenpvh
series gets merged. This patch fixes both scenarios.
---
 tests/qtest/bios-tables-test.c |  4 ++++
 tests/qtest/boot-serial-test.c | 10 ++++++++++
 tests/qtest/migration-test.c   |  5 +++++
 tests/qtest/pxe-test.c         |  6 ++++++
 tests/qtest/vmgenid-test.c     |  6 ++++++
 5 files changed, 31 insertions(+)

diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
index d29a4e47af..f6c2a010d2 100644
--- a/tests/qtest/bios-tables-test.c
+++ b/tests/qtest/bios-tables-test.c
@@ -2114,6 +2114,10 @@ int main(int argc, char *argv[])
     char *v_env = getenv("V");
     int ret;
 
+    if (!has_tcg && !has_kvm) {
+        return 0;
+    }
+
     if (v_env) {
         verbosity_level = atoi(v_env);
     }
diff --git a/tests/qtest/boot-serial-test.c b/tests/qtest/boot-serial-test.c
index 3aef3a97a9..45490f5931 100644
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
@@ -285,6 +288,13 @@ int main(int argc, char *argv[])
     const char *arch = qtest_get_arch();
     int i;
 
+    has_tcg = qtest_has_accel("tcg");
+    has_kvm = qtest_has_accel("kvm");
+
+    if (!has_tcg && !has_kvm) {
+        return 0;
+    }
+
     g_test_init(&argc, &argv, NULL);
 
     for (i = 0; tests[i].arch != NULL; i++) {
diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
index 109bc8e7b1..a6e3ca9f7d 100644
--- a/tests/qtest/migration-test.c
+++ b/tests/qtest/migration-test.c
@@ -2460,11 +2460,16 @@ static bool kvm_dirty_ring_supported(void)
 int main(int argc, char **argv)
 {
     const bool has_kvm = qtest_has_accel("kvm");
+    const bool has_tcg = qtest_has_accel("tcg");
     const bool has_uffd = ufd_version_check();
     const char *arch = qtest_get_arch();
     g_autoptr(GError) err = NULL;
     int ret;
 
+    if (!has_tcg && !has_kvm) {
+        return 0;
+    }
+
     g_test_init(&argc, &argv, NULL);
 
     /*
diff --git a/tests/qtest/pxe-test.c b/tests/qtest/pxe-test.c
index 62b6eef464..05575f7687 100644
--- a/tests/qtest/pxe-test.c
+++ b/tests/qtest/pxe-test.c
@@ -130,6 +130,12 @@ int main(int argc, char *argv[])
 {
     int ret;
     const char *arch = qtest_get_arch();
+    bool has_tcg = qtest_has_accel("tcg");
+    bool has_kvm = qtest_has_accel("kvm");
+
+    if (!has_tcg && !has_kvm) {
+        return 0;
+    }
 
     ret = boot_sector_init(disk);
     if(ret)
diff --git a/tests/qtest/vmgenid-test.c b/tests/qtest/vmgenid-test.c
index efba76e716..8045d3d706 100644
--- a/tests/qtest/vmgenid-test.c
+++ b/tests/qtest/vmgenid-test.c
@@ -164,6 +164,12 @@ static void vmgenid_query_monitor_test(void)
 int main(int argc, char **argv)
 {
     int ret;
+    bool has_tcg = qtest_has_accel("tcg");
+    bool has_kvm = qtest_has_accel("kvm");
+
+    if (!has_tcg && !has_kvm) {
+        return 0;
+    }
 
     ret = boot_sector_init(disk);
     if (ret) {
-- 
2.35.3
