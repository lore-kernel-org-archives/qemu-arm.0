Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp6100052ejc;
        Tue, 28 Feb 2023 11:29:07 -0800 (PST)
X-Google-Smtp-Source: AK7set8yUosfF7nV/Yr4juHGhA3DKBZu3+nWmZFECwGV0zlcS6AnWro8TMcFqRFfpIPjY+Cwne2A
X-Received: by 2002:a5d:6844:0:b0:2c7:a39:6e2d with SMTP id o4-20020a5d6844000000b002c70a396e2dmr2732851wrw.67.1677612547682;
        Tue, 28 Feb 2023 11:29:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677612547; cv=none;
        d=google.com; s=arc-20160816;
        b=qGPPbeMDOYuE0AqS4pBdIUv9vYc/xIXD/WwIWuGiNXjRxvSXhyWAFSZ+IWmHY0+CnP
         LCoSfA0k0L53s3wZA15iCMvi4Tu6dU7jQBmkKGhTYbFOfQE6oib+4mjQzLw3NgQl0PUJ
         sJ7hH+fzpIMbvI8DoSUHvhKyrz3bdDFFd7YMgcCNLgalfcnAHvvef5JbhuyOdyLZNtoA
         r3VS18aNdOe4JOm3T/doeRKTCQOVfEzAxwXCxgKNci9GJmBGV9vEwtJ91LZqInvyvFnG
         8OcstUahFwDIW81zMrjIJuig/RiAQUhFBFUWN3O3j0zjUGKTtUpg0PL/MJ0m+WVxQvr4
         euCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:dkim-signature;
        bh=IZIy8Z3iGPcCgRkuMHF+6DkhbdLUaHXoLVg5l0Z77Vk=;
        b=GCUcpEqZO9gDsupG6dD04LFpLM+67ijm8qQXanFhVFK0Jzx+Hq2b4UIhm+RJnKasNf
         jt4Yy7REQY+4q/qSyY5cAjgKeBPLtC5ubPm747qms9hBJ84/3bNNauSmi3zP05RXym8+
         LCTsND93Ykq+C93ZIKtv6a5nO+bRSt3U4bLxxNjzVQhmhSLaaXub5SGlwZ552JCV3nM8
         OQ5Bohjb/ZpZTpy7F3sqnnNnjplcvRpPoZQmue3LhSNIijtDPQtFif/QDOFSwt88jN39
         fv4dEtb2M3kyHAxTtBsC2C1eAGXSbp6+dijnMgDE15AS/amp9SOqULIVpo8adN08Ij5o
         FB3Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=MmI+AY9V;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519 header.b=4jsoDVNm;
       spf=pass (google.com: domain of farosas@suse.de designates 195.135.220.29 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out2.suse.de (smtp-out2.suse.de. [195.135.220.29])
        by mx.google.com with ESMTPS id g16-20020a5d46d0000000b002c54d18e8f9si9998096wrs.88.2023.02.28.11.29.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Feb 2023 11:29:07 -0800 (PST)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 195.135.220.29 as permitted sender) client-ip=195.135.220.29;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=MmI+AY9V;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519 header.b=4jsoDVNm;
       spf=pass (google.com: domain of farosas@suse.de designates 195.135.220.29 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 4EBB91FDEF;
	Tue, 28 Feb 2023 19:29:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1677612547; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IZIy8Z3iGPcCgRkuMHF+6DkhbdLUaHXoLVg5l0Z77Vk=;
	b=MmI+AY9VDxZ6HRaquiMo1c9BiUqGUyX1/xOVubGxdfpXHbTbfPtzstZhpT8ozG5oUAJMYa
	nNU/epdC9iKrqbZraQnd1rODT+Rue3PDFWwzC0ksyYOmXvMTb8JZ7HjBCKdEwwYQsk8W16
	whYcIN/dZoNHtkJKU8Zi1w0tWYv8xAI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1677612547;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IZIy8Z3iGPcCgRkuMHF+6DkhbdLUaHXoLVg5l0Z77Vk=;
	b=4jsoDVNmNAhzQlQoGcwt/2F5hTZQGNsn505ZYYON9ASM9x6HF5L75J+fLso5TJSCFcaety
	kUhamn91KDUJHUBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D7C661333C;
	Tue, 28 Feb 2023 19:29:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id GGeQJ/5V/mNBagAAMHmgww
	(envelope-from <farosas@suse.de>); Tue, 28 Feb 2023 19:29:02 +0000
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
Subject: [PATCH RESEND v7 9/9] tests/qtest: Fix tests when no KVM or TCG are present
Date: Tue, 28 Feb 2023 16:26:28 -0300
Message-Id: <20230228192628.26140-10-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230228192628.26140-1-farosas@suse.de>
References: <20230228192628.26140-1-farosas@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: dD6BMT73vT59

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
