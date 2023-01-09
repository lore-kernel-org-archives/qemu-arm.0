Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp2663811ejc;
        Mon, 9 Jan 2023 14:43:25 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvMvAK5SJU4Q8LzLT8xJMwn6PWmpqJigJkIAvtDVPXETLlZbW1sNP+FowAGfSPlS8QWEB69
X-Received: by 2002:a5d:5a19:0:b0:242:2088:1546 with SMTP id bq25-20020a5d5a19000000b0024220881546mr55744585wrb.61.1673304205764;
        Mon, 09 Jan 2023 14:43:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673304205; cv=none;
        d=google.com; s=arc-20160816;
        b=pQZi76Z7UqhllewsZavuVQooxb73HJGrfY29DG6DC8h9VAO3yyuN+2mqzhAnPev9UT
         w5mYTQQ1rx72h+kjOMpG1Zjam3qSG0RAgJtQuT0v66Xud1Pv1pBCuZQzecQEPEgDJ94q
         TckBDgYPmMdLW+fFsWdBuPiq6QhrJ3/e08OXhS6E2t1lHSDAD2ANQLqGHs9yflThud03
         FRcyf+5vdjzF7iePVt5CrhUaomPW7I70TND0PQ2sAfK9gnv4Oa1L5hHWs5f5dau5DxRX
         BPcEm9oGVrgl+ALSJLPW/LetUJvbdbXCBK2dXmMG0Gvcs7Mwb0kG5G6c6Ej2NpCCzNzN
         gveA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:dkim-signature;
        bh=Z0zsUVLNnlB8or8gHrZOqCwKbl6RppYxTr0hODbbSNU=;
        b=Ttu3ULpl7wGJ630R+JJH0Pwa85KuMo413B9NOh909ANoOwBFLg/ASoaDTEXjd1dmjD
         iYlvWXF+PKnD4y+mI4yM/xJyt77V7UUfIpiWnMOC2pdGv3QeknvBEV2ruBvYRwQQ+tFW
         Erw0+GwYSWIx8I+0Lhv50VBexxJjvIu86xYwhuDmYb41MiorvkIBwfLXzVFSzlntydec
         9mR1UPAflwt1a7VcGA5yy2hP6MDN9Q2ovD9lEmn+Qcs6ifRSvE+wwFuzBjFX7IctLqRB
         Hy8/BCgqPpwxnMqfbCGgW70iBSHPu+ERPD04g82GdBIX8uxvAQBqdI9kxllfg24DdTnC
         0Tww==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=QN11WXbe;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519 header.b=i4yiXorH;
       spf=pass (google.com: domain of farosas@suse.de designates 195.135.220.28 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out1.suse.de (smtp-out1.suse.de. [195.135.220.28])
        by mx.google.com with ESMTPS id t15-20020adfe10f000000b00250779a7396si7246338wrz.231.2023.01.09.14.43.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jan 2023 14:43:25 -0800 (PST)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 195.135.220.28 as permitted sender) client-ip=195.135.220.28;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=QN11WXbe;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519 header.b=i4yiXorH;
       spf=pass (google.com: domain of farosas@suse.de designates 195.135.220.28 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 337A84D34C;
	Mon,  9 Jan 2023 22:43:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1673304205; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Z0zsUVLNnlB8or8gHrZOqCwKbl6RppYxTr0hODbbSNU=;
	b=QN11WXbehq8DvzbITK6TE43f10xs0AaqUwKIgQtV4/Wf4TXJoHJYIvJMO3f/644st/ilG0
	af/JHdlhuC2zhZEuMLcP7HGfH9zZsn22lVgX1M+Yq93fD00+m6du+PtFWOsTcyhx9TEpTv
	WGBQ9jmKn+tF+Hb6GjHJE3wXQuB2OpM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1673304205;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Z0zsUVLNnlB8or8gHrZOqCwKbl6RppYxTr0hODbbSNU=;
	b=i4yiXorHjL+9WdfuVS78ueF6TGVDIlbVmQzGRgKUpjrWv6RU7xMPs7pDa+nXeCeTtTu17n
	hxrIbCTuI1zPmYCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2AE8513583;
	Mon,  9 Jan 2023 22:43:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id 0OdPOYmYvGMdIQAAMHmgww
	(envelope-from <farosas@suse.de>); Mon, 09 Jan 2023 22:43:21 +0000
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
	Thomas Huth <thuth@redhat.com>,
	Laurent Vivier <lvivier@redhat.com>
Subject: [RFC PATCH v2 15/19] tests: device-introspect-test: cope with ARM TCG-only devices
Date: Mon,  9 Jan 2023 19:42:28 -0300
Message-Id: <20230109224232.11661-16-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230109224232.11661-1-farosas@suse.de>
References: <20230109224232.11661-1-farosas@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: VeRIVjLeebWF

From: Claudio Fontana <cfontana@suse.de>

Skip the test_device_intro_concrete for now for ARM KVM-only build,
as on ARM we currently build devices for ARM that are not
compatible with a KVM-only build.

We can remove this workaround when we fix this in KConfig etc,
and we only list and build machines that are compatible with KVM
for KVM-only builds.

Alternative implementation provided by Alex.

Suggested-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Claudio Fontana <cfontana@suse.de>
Signed-off-by: Fabiano Rosas <farosas@suse.de>
Cc: Thomas Huth <thuth@redhat.com>
Cc: Laurent Vivier <lvivier@redhat.com>
---
 tests/qtest/device-introspect-test.c | 32 +++++++++++++++++++++++-----
 1 file changed, 27 insertions(+), 5 deletions(-)

diff --git a/tests/qtest/device-introspect-test.c b/tests/qtest/device-introspect-test.c
index 5b0ffe43f5..f89df87f74 100644
--- a/tests/qtest/device-introspect-test.c
+++ b/tests/qtest/device-introspect-test.c
@@ -304,6 +304,24 @@ static void test_abstract_interfaces(void)
     qtest_quit(qts);
 }
 
+/*
+ * XXX currently we build also boards for ARM that are incompatible with KVM.
+ * We therefore need to check this explicitly, and only test virt for kvm-only
+ * arm builds.
+ * After we do the work of Kconfig etc to ensure that only KVM-compatible boards
+ * are built for the kvm-only build, we could remove this.
+ */
+static bool skip_machine_tests(void)
+{
+#ifndef CONFIG_TCG
+    const char *arch = qtest_get_arch();
+    if (strcmp(arch, "arm") == 0 || strcmp(arch, "aarch64") == 0) {
+        return true;
+    }
+#endif /* !CONFIG_TCG */
+    return false;
+}
+
 static void add_machine_test_case(const char *mname)
 {
     char *path, *args;
@@ -328,11 +346,15 @@ int main(int argc, char **argv)
     qtest_add_func("device/introspect/none", test_device_intro_none);
     qtest_add_func("device/introspect/abstract", test_device_intro_abstract);
     qtest_add_func("device/introspect/abstract-interfaces", test_abstract_interfaces);
-    if (g_test_quick()) {
-        qtest_add_data_func("device/introspect/concrete/defaults/none",
-                            g_strdup(common_args), test_device_intro_concrete);
-    } else {
-        qtest_cb_for_every_machine(add_machine_test_case, true);
+
+    if (!skip_machine_tests()) {
+        if (g_test_quick()) {
+            qtest_add_data_func("device/introspect/concrete/defaults/none",
+                                g_strdup(common_args),
+                                test_device_intro_concrete);
+        } else {
+            qtest_cb_for_every_machine(add_machine_test_case, true);
+        }
     }
 
     return g_test_run();
-- 
2.35.3
