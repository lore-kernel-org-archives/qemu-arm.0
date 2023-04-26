Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp593630ejm;
        Wed, 26 Apr 2023 11:00:52 -0700 (PDT)
X-Google-Smtp-Source: AKy350bdIRsaIQC0YY03/nXXQmmwEO6IoYoKbzRgo3g0yBuXqt999cRjy2JpS/FZz3ef/xlvM4Tl
X-Received: by 2002:a1c:4c03:0:b0:3f2:549b:3efa with SMTP id z3-20020a1c4c03000000b003f2549b3efamr6214416wmf.9.1682532052153;
        Wed, 26 Apr 2023 11:00:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1682532052; cv=none;
        d=google.com; s=arc-20160816;
        b=t9aQsntUzOyIb/kKNSXn5cQ+lwHJrPxvPxIGW057Qn31x8TLG4mBrpqYuZck/mw0vz
         e7WcxG3ZuBK/63wbfl0AE/bcHWXoTX1Gad3GnD6VkB1O6ujWDDmYOAAAvAZVtuyJsao3
         d7neAHS73EkXKFwlag073Hw8fFORhc9nZqEtJ1KKdttrPKrZEkkjdkhxBbLhwMJY38qs
         T0+d9N4NO4P1Yi8cbdl3WJ/UtKQDe7vSBpteRQkLQ82p2XvJ6gTbo7TanONM6ZWA/2mp
         wqGGnVwbzw3tIhxzmps87RJ6sZbX626JaVJmQZz7e9wOEHvXRspSN+8Kb7eAm+s/dITY
         PUTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:dkim-signature;
        bh=ZCOAS0vQXowBIJe92VLBvZoxnirVxTpR/QiG8LHn7rk=;
        b=K/CEolFoyM5cLW2hkRu+5VpHg7dj+Nu1eGm03vZ427Yi4+Md59VObNwsLfzmrQZgb3
         /8m7b0RIyeVsn/PrOz1nUiyn2E3Pwgd9e+8WX7KTd+keIAyE5ojKtUQVYUTlnbRzcjQ3
         2QBe9pSKlvWq0+VQ8bPMBoaojD/je79HoBTxk7Z8+FPS3RFS03W8EkNO7PrOxQBw5cRA
         U7CVvujtlXccCGSeGmVMIVFQqU6NbFD9oMaotnVwZNAm2PKSyKd3rBpvPctwHEJOJ8fI
         mTXfl11lR1b3UIAUTfk7xi8fdnTgGHg7clbP7tqio8LoLqLT2EkVQckCrwq0TFcbcTix
         rOvg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=crxtJghZ;
       dkim=neutral (no key) header.i=@suse.de;
       spf=pass (google.com: domain of farosas@suse.de designates 195.135.220.28 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out1.suse.de (smtp-out1.suse.de. [195.135.220.28])
        by mx.google.com with ESMTPS id l25-20020a7bc459000000b003f1723abe3dsi10643704wmi.145.2023.04.26.11.00.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Apr 2023 11:00:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 195.135.220.28 as permitted sender) client-ip=195.135.220.28;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=crxtJghZ;
       dkim=neutral (no key) header.i=@suse.de;
       spf=pass (google.com: domain of farosas@suse.de designates 195.135.220.28 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id CD49821A14;
	Wed, 26 Apr 2023 18:00:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1682532051; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZCOAS0vQXowBIJe92VLBvZoxnirVxTpR/QiG8LHn7rk=;
	b=crxtJghZEVrdDTrNHVgHK3iCmfC/QNQ9jaTVHKFrD5f2PZhZlMkeHXMoaXa281mA/su7b8
	V57u83FFdwM3aqNMBiuTtm+0J2GLtG7W2NqI4q2PBnRCJ1m6+zvN2BOeNZWLRyGc469doZ
	q0GiPC+wrgm23EA8l0gcxlQl9rQd20o=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1682532051;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZCOAS0vQXowBIJe92VLBvZoxnirVxTpR/QiG8LHn7rk=;
	b=gfI30K3W7L2Oysb5HC9HxnzwDq4lwfUko18872hE3wsMFID99kTmVzBZFXBMYa0+DsQmYG
	60b98RlmbKLt0uAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4CF8A138F0;
	Wed, 26 Apr 2023 18:00:48 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id cAp2BdBmSWSoVQAAMHmgww
	(envelope-from <farosas@suse.de>); Wed, 26 Apr 2023 18:00:48 +0000
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
Subject: [PATCH v11 09/13] tests/avocado: Pass parameters to migration test
Date: Wed, 26 Apr 2023 15:00:09 -0300
Message-Id: <20230426180013.14814-10-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230426180013.14814-1-farosas@suse.de>
References: <20230426180013.14814-1-farosas@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 7W42HZFd2bsl

The migration tests are currently broken for an aarch64 host because
the tests pass no 'machine' and 'cpu' options on the QEMU command
line.

Add a separate class to each architecture so that we can specify
'machine' and 'cpu' options instead of relying on defaults.

Add a skip decorator to keep the current behavior of only running
migration tests when the qemu target matches the host architecture.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
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
