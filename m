Received: by 2002:a17:906:faca:b0:92b:dcda:f23e with SMTP id lu10csp379044ejb;
        Mon, 13 Mar 2023 08:11:31 -0700 (PDT)
X-Google-Smtp-Source: AK7set+/xZF8cPHbHfRmBlrGn6Ph4ko74qMYCM/bkFnN140SMhkHyZIgo4ZDcC/SeZo3qEo68nUW
X-Received: by 2002:a05:600c:3c9e:b0:3e1:f8af:8772 with SMTP id bg30-20020a05600c3c9e00b003e1f8af8772mr10890874wmb.9.1678720291033;
        Mon, 13 Mar 2023 08:11:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1678720291; cv=none;
        d=google.com; s=arc-20160816;
        b=rPWJu3MJrS0d50py7EuztdndHq8TksHOkkMgkogplCbV4JPvCcXRV6UfoFBlno88bn
         PSvXJ6Jd3/3DWPI2uYmutD0eBbWnptG+HEEAgzgShuy9APHo8V0GMKKuMrq83U6WJjhS
         sl+CVV0p5VC/M5MXcIKbhlEkP68fz9UH6dC3kmV8PE7EdCC88En5LAfUmlvN6JWxHttq
         rsdTJNWNhJFwVlM4XcYlEEzWkJDMmIBmUz8Sih88hm1fAPjISQA0MdxwZQAf1uMqluss
         nya/bNH+lGihw7WDdK05S3jgQUpzg8pH5yrHbo9ECNqV4T6YT6k+Nfh2MNMlRRXtTWK+
         eNIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:dkim-signature;
        bh=ZCOAS0vQXowBIJe92VLBvZoxnirVxTpR/QiG8LHn7rk=;
        b=cmWDPIMsaSGLMguTLsdhAHULGlVf6xa+uN83zMp4gh2yLxFu3rk95NICRRwh9sErUn
         y/pXMCaEl227xZJMX4H6e8Xx6223P6uvrTGIdMbAeikQjVTTUjYeGl95Zxu70rEBOCgK
         H7fIj7d8IcDFb8jm3m26RGMcs1ODAxVg9mPoPW6HoTB6xbyZmM3VJN73Jg6d8wQ1cJ6l
         5TjA+oYMd0lMzqnh+lGu1vCvdWzVrC6ce2YKl9oKJWwjp3B4F9KUdrnCYrOxU9c+szEF
         gupGZ3Y5Y9Knxf74xwljPdk8RSuSbSP/PpbQctIpvS+M1aGsJxvYCoXmb/rzKlS34u/6
         uFcg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=rEaCfRHZ;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519;
       spf=pass (google.com: domain of farosas@suse.de designates 195.135.220.29 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out2.suse.de (smtp-out2.suse.de. [195.135.220.29])
        by mx.google.com with ESMTPS id m5-20020a05600c3b0500b003d96bdce176si190752wms.0.2023.03.13.08.11.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Mar 2023 08:11:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 195.135.220.29 as permitted sender) client-ip=195.135.220.29;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=rEaCfRHZ;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519;
       spf=pass (google.com: domain of farosas@suse.de designates 195.135.220.29 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 9F6001FE0A;
	Mon, 13 Mar 2023 15:11:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1678720290; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZCOAS0vQXowBIJe92VLBvZoxnirVxTpR/QiG8LHn7rk=;
	b=rEaCfRHZqz1KpN0O40OxVfshpsXN8sh8FxSdokAARdJ55gubmMpS3/m/AWtl0D5qVxeN5B
	a3wr+vamgANv3xPdUXGyde5vn7cdU5eLd3OW46qIs5pwSlDW8oJ8iZaZOD0k6HSfwzIPec
	Pp+YnNSqqMsgmBRWDdu9l4zsZabPKdE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1678720290;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZCOAS0vQXowBIJe92VLBvZoxnirVxTpR/QiG8LHn7rk=;
	b=bafirbJlk7VMg7u74r+PIMnTM9ZXUDqIAQgS1kg1JVC8X0prkYwmexZQI4j5dkkhmL+eJF
	+SQjJ0y65dc1EWCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2470713582;
	Mon, 13 Mar 2023 15:11:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id 4KCXNx49D2R1YwAAMHmgww
	(envelope-from <farosas@suse.de>); Mon, 13 Mar 2023 15:11:26 +0000
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
Subject: [PATCH v9 07/10] tests/avocado: Pass parameters to migration test
Date: Mon, 13 Mar 2023 12:10:55 -0300
Message-Id: <20230313151058.19645-8-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230313151058.19645-1-farosas@suse.de>
References: <20230313151058.19645-1-farosas@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 6jroOqAX7ALY

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
