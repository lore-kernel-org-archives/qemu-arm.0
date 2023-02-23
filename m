Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp710294ejc;
        Thu, 23 Feb 2023 05:11:58 -0800 (PST)
X-Google-Smtp-Source: AK7set9C8rDZbikaaiVD6tKsVfp3M6t0iZWrZDAGoOORWo9p9YXlHz662o9kJ+oRFdG46JST420m
X-Received: by 2002:a5d:5608:0:b0:2bf:b199:c7ef with SMTP id l8-20020a5d5608000000b002bfb199c7efmr11123102wrv.12.1677157918291;
        Thu, 23 Feb 2023 05:11:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677157918; cv=none;
        d=google.com; s=arc-20160816;
        b=dDlFdZ4yii2coF8hpGMOOGtIJWJ2AyIimhHIt671QbDCQGD9B+lE7GxMrByjN/pIrH
         kC8/UwJiBpdEvjOHxO84h/LUl+VmbDKRVxvh9pcCqnaQJ3uShD9b9ad0WMuMrCtetsU3
         jA554Dfv+HAV8Her8hc68z80i6aOKOGplM7VCvijkbBP3b65pSChCicjwVXgOXS7v+h/
         hDHyyYTo3LhOiqU0i757cU5+cFaoJrNcufAa5glFIIfVNoJuH+OTXYRFCGjp8ppGaRCK
         plm/iyHXHuL6q7zzf62bDkFoKDbkETli9qMuHT6LB08rGjN/p7SsP0KyhrkiqgLNzljo
         9amQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:dkim-signature;
        bh=IZIy8Z3iGPcCgRkuMHF+6DkhbdLUaHXoLVg5l0Z77Vk=;
        b=VzGoZyQooqnL+GXIPNGlHtnxhvyJ9NfhN0vs1Ulf8OVBW5RnmE02lVzEjb9JRMI8MD
         tCr4dG7RH9jKQ6oX3q2m98dcn9NsPoQPn7elMx7nWGz9+JWa4pDwlRN7yTF2wVxr+pud
         U+pIYz+dcP5HYyZ75OfYXxc9WwWslYW9YR7adNThuyOSrq80GQiwjs81AJSSVOyOT4Pu
         nlujE8145PdTtq0JCrGH7Ty37mn+/zyFBWt6ReJn/dcs85o7aOhYR1kRYCmVerkyKOl7
         dWOfdV0LPQ+IVN287pBhF0MhYI8c2LSqybQDGmmOmCeC4X4J2Q8kmNbMeGfIH84lfwze
         Dt/g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b="lzPbStt/";
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519 header.b=mZlk7TzV;
       spf=pass (google.com: domain of farosas@suse.de designates 195.135.220.28 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out1.suse.de (smtp-out1.suse.de. [195.135.220.28])
        by mx.google.com with ESMTPS id u15-20020adfdd4f000000b002c4061f53efsi8266697wrm.860.2023.02.23.05.11.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Feb 2023 05:11:58 -0800 (PST)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 195.135.220.28 as permitted sender) client-ip=195.135.220.28;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b="lzPbStt/";
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519 header.b=mZlk7TzV;
       spf=pass (google.com: domain of farosas@suse.de designates 195.135.220.28 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id E595E33817;
	Thu, 23 Feb 2023 13:11:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1677157917; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IZIy8Z3iGPcCgRkuMHF+6DkhbdLUaHXoLVg5l0Z77Vk=;
	b=lzPbStt/VPiI/HPwSyX1NZavXSU0LLE4kepV81oyNrHF+mhXZwTmR1baa2osjEGxsEmU7b
	ftETgRTsxAXOmYcSX2fYQ4ipLoYjPZYmXIR4TbazyEyfu+dvkcV0rtYOn/9NHZWA9qhrg/
	3HCGaYnU98P3ilUVC6YrP8a2ukpls5M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1677157917;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IZIy8Z3iGPcCgRkuMHF+6DkhbdLUaHXoLVg5l0Z77Vk=;
	b=mZlk7TzV5f4IKE+ED2eaBUk8hNFtH0s3g7Qt1u5nMj0JR7bBsB60ztrkeTNqpako4EoMR+
	ESf2N8UZsw1G3XBw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 8173C139B5;
	Thu, 23 Feb 2023 13:11:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id uMOZEhlm92MLawAAMHmgww
	(envelope-from <farosas@suse.de>); Thu, 23 Feb 2023 13:11:53 +0000
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
Subject: [PATCH v7 20/20] tests/qtest: Fix tests when no KVM or TCG are present
Date: Thu, 23 Feb 2023 10:08:41 -0300
Message-Id: <20230223130841.25916-21-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230223130841.25916-1-farosas@suse.de>
References: <20230223130841.25916-1-farosas@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: e6fRsBydczhJ

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
