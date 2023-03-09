Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp1122287ejc;
        Thu, 9 Mar 2023 12:15:13 -0800 (PST)
X-Google-Smtp-Source: AK7set9/uaExGWS9RRl4pOZ7MqD8yPk3iCbNqqlCUnEW12LInsuqGZ+Z2b3FtpbhmLLreOseCha1
X-Received: by 2002:a05:600c:190c:b0:3ea:c110:55ba with SMTP id j12-20020a05600c190c00b003eac11055bamr469567wmq.18.1678392913848;
        Thu, 09 Mar 2023 12:15:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1678392913; cv=none;
        d=google.com; s=arc-20160816;
        b=hDzcmgIXQHTDG9khGFtYvIKxnCx4TxIWnLlloNA6rmEeBiFdezbJStFwnz79f44s+b
         qfvAO1UOjTbDtrOQJP0q9cyY3nY5OLWsnaJd4K4L7DUbVNwTqHWb3WLvP/foYGmtJh+L
         RrQOQUwI5o8IuHSeGm0TZuC6zQD4gFVsxPf3A+5f3RYntUIbqlPUxb9vXEs3OAgP/Cur
         YDt+QB9n97CAKZ3AwXr09Ia8Pa1vD0akCX9DdQtPTAAw5Sc5BM7Bavm0rmm+A6H9r933
         x07/qvI8V19KmepJe7z80KT5+6ZajfWneEEi33XgttQL2clWdA5+ktWI82SaAKP62Z5D
         58Yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:dkim-signature;
        bh=p5YrNMxmCSXKAAgShoRgMvoDqaxZU1WpdCJ0XHKi6qI=;
        b=jhk4+x13WULVIvq70cQigDydYtUWCMgy6Olyq2E0nQGfr6f0SV65r8/DklZMu+PD4G
         hoas3P/KBN3Qh8HpmibGP9+DhX1Sss0NAzENteBDkeNN3TokAePXyhOanZV6Rq5BmwQJ
         UhLjCVT6CTGUZEwbqG0BYJC+hvs7xJaSmXDrAMdL7TQ4ZTePwOPZZoCYwrtOAbmxIK3+
         NNCEc2SS7+cB9QrKM8dHs5G4rSm4p1iaQ93hWv8DVjP9RHhR++MX+90l1a2cOAEq5guQ
         TWEOgtYBNiDgBXmxXKv+JmpD6tpwl18e96uEeqKQwO0u6gPvYGH0n24SwrVayJc633Db
         xaIA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=uhenQ2YD;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1d as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out2.suse.de (smtp-out2.suse.de. [2001:67c:2178:6::1d])
        by mx.google.com with ESMTPS id ay16-20020a05600c1e1000b003da0d302eb6si681457wmb.27.2023.03.09.12.15.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Mar 2023 12:15:13 -0800 (PST)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1d as permitted sender) client-ip=2001:67c:2178:6::1d;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=uhenQ2YD;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1d as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 75AF7202A3;
	Thu,  9 Mar 2023 20:15:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1678392913; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=p5YrNMxmCSXKAAgShoRgMvoDqaxZU1WpdCJ0XHKi6qI=;
	b=uhenQ2YDm2K6R72W2//4a0tPwsnyGWfQB3TLK8idO6rvh1jKMtyZ6ZKFRdxkqeB5gXYNRe
	QKHBmJ/1UeEwVzN/XhLqvpTAgdoMp0f1tCc+69B29Aoq9e7qAXqU/boRovsgyl+E5xc+77
	JQ2oVvmy6mWjIsw3x0mbl7r+prveIoE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1678392913;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=p5YrNMxmCSXKAAgShoRgMvoDqaxZU1WpdCJ0XHKi6qI=;
	b=vPDfMsZLDTXehPjivClesGfQv5OHi1qo2O8Zrn8QjDihjLCIdAkmjIeYD4tcf0ga8GdFof
	fqBtIHDB9o+vrJDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D164C1391B;
	Thu,  9 Mar 2023 20:15:09 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id cPoFJk0+CmTUZwAAMHmgww
	(envelope-from <farosas@suse.de>); Thu, 09 Mar 2023 20:15:09 +0000
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
Subject: [PATCH v8 09/11] tests/avocado: Pass parameters to migration test
Date: Thu,  9 Mar 2023 17:14:32 -0300
Message-Id: <20230309201434.10831-10-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230309201434.10831-1-farosas@suse.de>
References: <20230309201434.10831-1-farosas@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: 3mdvyLGGYxoN

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
