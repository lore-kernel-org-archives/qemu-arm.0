Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp709921ejc;
        Thu, 23 Feb 2023 05:11:39 -0800 (PST)
X-Google-Smtp-Source: AK7set96XXxDfzRXrTgCU+OvHrOWnMIMe1phL5uZPbWj4Ud+ok6oTFvZTQoQBwMPIVAZuzMqQfgs
X-Received: by 2002:a05:600c:3420:b0:3e2:153e:6940 with SMTP id y32-20020a05600c342000b003e2153e6940mr9678842wmp.3.1677157898901;
        Thu, 23 Feb 2023 05:11:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677157898; cv=none;
        d=google.com; s=arc-20160816;
        b=j8HBda+8NuL5Q3y1Snu0cQnccQGgDLhxXYITsej+lAzETVvfUWdOQ+4fMGgwCMS0q1
         mdA7sX2msuNPEaeicVhVUihdDejz0ZzyoSPknP5TtlzMKreqWScyWtf/VmV1ZGvZx0JV
         X4NQdgEuRMW1nFFxRn1JSDP4UieqkhjpsR1UJGC6SmF0m2NBkeAGU8Y6eDjSw4yeiaQK
         fg2nc500vIHvrxfiK6KBhWpRVYIpwSP2IpIMj5EoXBSC44ZX45MNe20P2atzzxPFAfAc
         WMy3qggxHlkq9K+IyA5jk7QCHUnCFYcFPar102cQPiwuUr34A277Dboqmp/bzRguLVeD
         JJiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:dkim-signature;
        bh=p5YrNMxmCSXKAAgShoRgMvoDqaxZU1WpdCJ0XHKi6qI=;
        b=tPBmpGANFLN91DEjZPFb6pD+XrMr97C9Yt2j8LAuCJjmICo4DpCFIPeZ8Dc9KpizyG
         cjlZ5wgMNsCAKC/LYebnd1EU+DcZ1os50KkX5NElsLZPUzc0azKErX5NCl2yFsCKb8pb
         vQN5elVIB43TNXkcQ7DjSkVKPFal646U70bjZwULfihjqY1TFkh/XyL/RfB9QFGihH2s
         9drXfwO9YSQRaPQYvq+ZshaHsGHv+GPAW5Au5y/vFmkQLphUgRoGVfHuCafKjaZYxyMC
         MyEIS4fJixjXCbtD1F3vRpVcSFJz6Cob72Haz+M9VGiCmm7QhyBvxBrxBZbh5mH4rrYY
         81sg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=XmTVHxU9;
       dkim=neutral (no key) header.i=@suse.de;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1d as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out2.suse.de (smtp-out2.suse.de. [2001:67c:2178:6::1d])
        by mx.google.com with ESMTPS id r7-20020a05600c458700b003d094ec902csi11079945wmo.168.2023.02.23.05.11.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Feb 2023 05:11:38 -0800 (PST)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1d as permitted sender) client-ip=2001:67c:2178:6::1d;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=XmTVHxU9;
       dkim=neutral (no key) header.i=@suse.de;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1d as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 69DE3204AC;
	Thu, 23 Feb 2023 13:11:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1677157898; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=p5YrNMxmCSXKAAgShoRgMvoDqaxZU1WpdCJ0XHKi6qI=;
	b=XmTVHxU9Ll2zu62kwUwXVQ4QeqjA6NlcifSxLjOFQVhRp3S+uQc1/j/n6J4j+nSEi6+FVJ
	NgcdASj6OpMwKkC9U2AdcRncssbfBo0Pw94NPQafLMM99JJ7GUAur7qeqUJddRIKfTLi4s
	Z6zAl3XP28QSHXmw8A9DOeImgEtUFuU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1677157898;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=p5YrNMxmCSXKAAgShoRgMvoDqaxZU1WpdCJ0XHKi6qI=;
	b=q401h5BDNm9iKKSoQaMzWkStIdk+wEgJBf05UpFCIivTSWhTQbccaR8BnkI9nsys0Attam
	UxicN9ycA8//BvBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id DB78E139B5;
	Thu, 23 Feb 2023 13:11:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id CIynKAZm92MLawAAMHmgww
	(envelope-from <farosas@suse.de>); Thu, 23 Feb 2023 13:11:34 +0000
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
Subject: [PATCH v7 15/20] tests/avocado: Pass parameters to migration test
Date: Thu, 23 Feb 2023 10:08:36 -0300
Message-Id: <20230223130841.25916-16-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230223130841.25916-1-farosas@suse.de>
References: <20230223130841.25916-1-farosas@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: 8RyDL9uYoJtY

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
