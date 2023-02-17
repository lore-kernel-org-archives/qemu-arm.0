Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp128758ejb;
        Fri, 17 Feb 2023 12:15:20 -0800 (PST)
X-Google-Smtp-Source: AK7set9HbnGLjpI2DLIMAc1Uu/xshK2uyB9oybtBqrRb4q59URYkNe4UU6BM3qN4Cpn+fns2S1X0
X-Received: by 2002:a05:600c:1c07:b0:3df:9858:c033 with SMTP id j7-20020a05600c1c0700b003df9858c033mr5971203wms.8.1676664920167;
        Fri, 17 Feb 2023 12:15:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676664920; cv=none;
        d=google.com; s=arc-20160816;
        b=yLe7u/vTtNgKZ6DSnvqF6y35SFav263HpVDNRXe8YtZAUaAPXJQQ/7qBJCm4KAHVlF
         y9uG4xTQWUltspmfw0BJ2L4WkKFxxJnyJUtDF/Dln9CbexT8s3U09xwcmGTH1BI4J3la
         6ojNHYAHZbTwUe45lM3at6gohaAnBAryhx0kaQN6k5/QyQGExJD36TbGd8oHjcOjnXto
         jzniUIHXDiLUqsjEkRD13AOxfZEAXP7tx2Ntv4JhybmnERhlprAe1AFrmCfho1Lc9Arw
         sNxjydhX7lGacjjzwy/o6Af2y/gf2CnOP/AmFgc/FA+f6UIwpq2FzQCdP2MJk4fbmCzn
         vlPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:dkim-signature;
        bh=p5YrNMxmCSXKAAgShoRgMvoDqaxZU1WpdCJ0XHKi6qI=;
        b=xJ/usEmnIuiFYF6cfOMeZPL/8VdcnzggUAomWKi0z1jsTku9uF9V6w9KEPO1QYy8tB
         sshERzOSAtLqJ0YxHibBdtp7l232MfF+hEWXjJ7vLIvPB716aNj6HRIRXiJok95dKkpS
         GfQ4U+U+t095OBqdLFtLzJVmJyDoRalknZoSpVWpYecXkszQwqh6jP6BKtkcpeC3Ruwz
         MiDYEtU2DusNK/GQ6nVmj4O0RBJpxkbqfxDiJLtL2esKZQ3CyZZKgqL3+AZp0ayimGHg
         1bFiOK0WEKjQ4FSIsjqzlzulnmkiCuHib00kq7+PT1SP3zrwNwuEZr90FYqu+FANF9LM
         7RjA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=idZD08U8;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519 header.b=zAG1Wxqh;
       spf=pass (google.com: domain of farosas@suse.de designates 195.135.220.29 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out2.suse.de (smtp-out2.suse.de. [195.135.220.29])
        by mx.google.com with ESMTPS id v17-20020a05600c4d9100b003e204158ac3si4435303wmp.20.2023.02.17.12.15.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Feb 2023 12:15:20 -0800 (PST)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 195.135.220.29 as permitted sender) client-ip=195.135.220.29;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=idZD08U8;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519 header.b=zAG1Wxqh;
       spf=pass (google.com: domain of farosas@suse.de designates 195.135.220.29 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id C388620FB9;
	Fri, 17 Feb 2023 20:15:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1676664919; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=p5YrNMxmCSXKAAgShoRgMvoDqaxZU1WpdCJ0XHKi6qI=;
	b=idZD08U87d+RXAtL+pcymFfJ+WM7CoClXvknAJkXrhaUzx9cVh0uas9+m3oTv/S2ADq3JT
	Y/L3IL3AQOidJOv4gC92vsm5Wv0S9bUeoP95IpqkBGHE1nRjkg0NMDpbx4b54VrcJPEV5C
	tzORplNao0K18v/vhXEsr5zR6Cqf7K4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1676664919;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=p5YrNMxmCSXKAAgShoRgMvoDqaxZU1WpdCJ0XHKi6qI=;
	b=zAG1WxqhD9jVdq47+6IrP4RsEyoy8VGB6uBhsPbYYtxZrYd/l8HTJwL+UMG6hcCFe88gqR
	QY3UDjby/wutGKDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3518F138E3;
	Fri, 17 Feb 2023 20:15:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id wJ+HO1Pg72MwIAAAMHmgww
	(envelope-from <farosas@suse.de>); Fri, 17 Feb 2023 20:15:15 +0000
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
Subject: [PATCH v6 24/29] target/avocado: Pass parameters to migration test
Date: Fri, 17 Feb 2023 17:11:45 -0300
Message-Id: <20230217201150.22032-25-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230217201150.22032-1-farosas@suse.de>
References: <20230217201150.22032-1-farosas@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: FxQk/qTKSw1V

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
