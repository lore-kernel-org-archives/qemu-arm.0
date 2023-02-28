Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp6099848ejc;
        Tue, 28 Feb 2023 11:28:52 -0800 (PST)
X-Google-Smtp-Source: AK7set9rzas9PRJY5zuK0qop3UgQD6nrOkfrD94rOt8xHQt/Nrb3jHD/YIjq+FA5XdDJqW+TJBQC
X-Received: by 2002:a05:600c:3b99:b0:3ea:fc95:7bf with SMTP id n25-20020a05600c3b9900b003eafc9507bfmr2846293wms.30.1677612532182;
        Tue, 28 Feb 2023 11:28:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677612532; cv=none;
        d=google.com; s=arc-20160816;
        b=cn9ZCuS+VDFwdQLyKYC5Jh7SprAwuc481fvOy8R9lHGwIBH+XE/f7K2bYVnuCrCQTO
         Yi7UzQMNSXq1Ep9eCui9xQJfPeMFi2UMEXJ8HuTzliH2vO58T1TVhxD9/YM5az69rfgf
         OnaoWq5IgUJ6GhHu2LPVtEOVWyGDfRbp4Vi9dXYYAN1MOcX69bZ79f6eslyvcoNV+N2F
         kiGapwZhDdSHx8t+2IoUsuGcqweS6sTk6n87i24HdcmZlUI5rCnLSCVZqBnOkMvo39D4
         X1ViYos0LyuGoNaLydP1An4Ox84F4xb1QyYj0QdcmeN5Ykw1a8eYYTqUPmR/7RqizKOe
         aOqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:dkim-signature;
        bh=p5YrNMxmCSXKAAgShoRgMvoDqaxZU1WpdCJ0XHKi6qI=;
        b=c4CdEb+3alHl7OmdzVm657h/MMjRGnfpmOdpCdPUYUbV/I12pQLY2qHL0HkL7QhRGA
         /06hkD5Dnwq0kFFchmah99s/WYWyyWWrSJUfN8BHevBpHdU2LsKEom/XMILlc7KYwZt4
         BONdA92UyvMtkEnLwPBBuxE9fwpc+YRneTKC03paOsyoSD9rF0Rsa5a401XIyg0OFBsl
         VfNj//e7qPaSRTBVzXFx7MBafISlq+5z6ekPXsaKZkLgPpIdo+uodAkubaXJu1RXWVeR
         YbOCqif1iUd86FDPN3yiPaqNPzGF4+IVZXVTiNqueMuY8EO/CKE0r2e0XR13z040/V1m
         kLuA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=lAOrKPgp;
       dkim=neutral (no key) header.i=@suse.de;
       spf=pass (google.com: domain of farosas@suse.de designates 195.135.220.28 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out1.suse.de (smtp-out1.suse.de. [195.135.220.28])
        by mx.google.com with ESMTPS id fm18-20020a05600c0c1200b003e2091c7cd3si13253398wmb.10.2023.02.28.11.28.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Feb 2023 11:28:52 -0800 (PST)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 195.135.220.28 as permitted sender) client-ip=195.135.220.28;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=lAOrKPgp;
       dkim=neutral (no key) header.i=@suse.de;
       spf=pass (google.com: domain of farosas@suse.de designates 195.135.220.28 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id C9B6B21A7D;
	Tue, 28 Feb 2023 19:28:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1677612531; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=p5YrNMxmCSXKAAgShoRgMvoDqaxZU1WpdCJ0XHKi6qI=;
	b=lAOrKPgpZIuEHO31wiToHn7f9s5GiWrRR3ZHxjTd0opX4ImlJSwy2krNKbP0ht0QMv0YaX
	ozR43HewgcB4U9wDmGsFzsxYH3X0HzzzkUzlLCxWpxGHBRFcJgylVDJKL28ajcc6caySmo
	+VrOimv49F/v0g7KhQ5Be4mIM3Sunjo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1677612531;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=p5YrNMxmCSXKAAgShoRgMvoDqaxZU1WpdCJ0XHKi6qI=;
	b=A9DWuYJzZzoGAB9eFtKoGgGcbyvKs8SC/jLffZQBq3K40yxhYyWeegQ4QPOGyHwGi0XjjP
	DNHnSl7u/15enUDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3EDF31333C;
	Tue, 28 Feb 2023 19:28:48 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id OJF6AvBV/mNBagAAMHmgww
	(envelope-from <farosas@suse.de>); Tue, 28 Feb 2023 19:28:48 +0000
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
	Cleber Rosa <crosa@redhat.com>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Beraldo Leal <bleal@redhat.com>
Subject: [PATCH RESEND v7 5/9] tests/avocado: Pass parameters to migration test
Date: Tue, 28 Feb 2023 16:26:24 -0300
Message-Id: <20230228192628.26140-6-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230228192628.26140-1-farosas@suse.de>
References: <20230228192628.26140-1-farosas@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: hjgtKjLWUm76

The migration tests are currently broken for an aarch64 host because
the tests pass no 'machine' and 'cpu' options on the QEMU command
line.

Add a separate class to each architecture so that we can specify
'machine' and 'cpu' options instead of relying on defaults.

Add a skip decorator to keep the current behavior of only running
migration tests when the qemu target matches the host architecture.

Signed-off-by: Fabiano Rosas <farosas@suse.de>
---
 tests/avocado/migration.py | 83 +++++++++++++++++++++++++++++++++++---
 1 file changed, 78 insertions(+), 5 deletions(-)

diff --git a/tests/avocado/migration.py b/tests/avocado/migration.py
index 4b25680c50..8b2ec0e3c4 100644
--- a/tests/avocado/migration.py
+++ b/tests/avocado/migration.py
@@ -11,6 +11,8 @@
 
 
 import tempfile
+import os
+
 from avocado_qemu import QemuSystemTest
 from avocado import skipUnless
 
@@ -19,7 +21,7 @@
 from avocado.utils.path import find_command
 
 
-class Migration(QemuSystemTest):
+class MigrationTest(QemuSystemTest):
     """
     :avocado: tags=migration
     """
@@ -62,20 +64,91 @@ def _get_free_port(self):
             self.cancel('Failed to find a free port')
         return port
 
-
-    def test_migration_with_tcp_localhost(self):
+    def migration_with_tcp_localhost(self):
         dest_uri = 'tcp:localhost:%u' % self._get_free_port()
         self.do_migrate(dest_uri)
 
-    def test_migration_with_unix(self):
+    def migration_with_unix(self):
         with tempfile.TemporaryDirectory(prefix='socket_') as socket_path:
             dest_uri = 'unix:%s/qemu-test.sock' % socket_path
             self.do_migrate(dest_uri)
 
     @skipUnless(find_command('nc', default=False), "'nc' command not found")
-    def test_migration_with_exec(self):
+    def migration_with_exec(self):
         """The test works for both netcat-traditional and netcat-openbsd packages."""
         free_port = self._get_free_port()
         dest_uri = 'exec:nc -l localhost %u' % free_port
         src_uri = 'exec:nc localhost %u' % free_port
         self.do_migrate(dest_uri, src_uri)
+
+
+@skipUnless('aarch64' in os.uname()[4], "host != target")
+class Aarch64(MigrationTest):
+    """
+    :avocado: tags=arch:aarch64
+    :avocado: tags=machine:virt
+    :avocado: tags=cpu:max
+    """
+
+    def test_migration_with_tcp_localhost(self):
+        self.migration_with_tcp_localhost()
+
+    def test_migration_with_unix(self):
+        self.migration_with_unix()
+
+    def test_migration_with_exec(self):
+        self.migration_with_exec()
+
+
+@skipUnless('x86_64' in os.uname()[4], "host != target")
+class X86_64(MigrationTest):
+    """
+    :avocado: tags=arch:x86_64
+    :avocado: tags=machine:pc
+    :avocado: tags=cpu:qemu64
+    """
+
+    def test_migration_with_tcp_localhost(self):
+        self.migration_with_tcp_localhost()
+
+    def test_migration_with_unix(self):
+        self.migration_with_unix()
+
+    def test_migration_with_exec(self):
+        self.migration_with_exec()
+
+
+@skipUnless('ppc64le' in os.uname()[4], "host != target")
+class PPC64(MigrationTest):
+    """
+    :avocado: tags=arch:ppc64
+    :avocado: tags=machine:pseries
+    :avocado: tags=cpu:power9_v2.0
+    """
+
+    def test_migration_with_tcp_localhost(self):
+        self.migration_with_tcp_localhost()
+
+    def test_migration_with_unix(self):
+        self.migration_with_unix()
+
+    def test_migration_with_exec(self):
+        self.migration_with_exec()
+
+
+@skipUnless('s390x' in os.uname()[4], "host != target")
+class S390X(MigrationTest):
+    """
+    :avocado: tags=arch:s390x
+    :avocado: tags=machine:s390-ccw-virtio
+    :avocado: tags=cpu:qemu
+    """
+
+    def test_migration_with_tcp_localhost(self):
+        self.migration_with_tcp_localhost()
+
+    def test_migration_with_unix(self):
+        self.migration_with_unix()
+
+    def test_migration_with_exec(self):
+        self.migration_with_exec()
-- 
2.35.3
