Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp415154ejc;
        Fri, 13 Jan 2023 06:07:50 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsgXVJ+cm4JgYFo9gJteZuJvE+s1iZKVRRdC5LtEuNWL+eZDKRJWd+QfjR1rDXyYJr73tb8
X-Received: by 2002:a05:600c:3b22:b0:3c6:e63e:814b with SMTP id m34-20020a05600c3b2200b003c6e63e814bmr57686772wms.2.1673618870011;
        Fri, 13 Jan 2023 06:07:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673618869; cv=none;
        d=google.com; s=arc-20160816;
        b=0CjMO26TVjYzC/vcAocxk3cOPXc/80JcasqgjwR5tas8oHARcTePte2Kc9Z1kEvC6C
         4NO3VqG/OxhyVNuw/z64dQcZV3KUjUsj5H0i2y/51+6QtD9KXGC4kq4OOAx/v45R1/if
         YcqnlSL1l6rSg6m2TtXXWXzHp+QkUsJvFIxFF6ugURpAA27YwfCJ8zrhFzIkaTuGb/ms
         tV0+KB4rAE/nNK44LZPRPxcS1KDkxTryTJZCylVR0ohDPVueonUXI9v9dbEYcJWpPEfx
         0TMb7hCh2SMlTBENC8hYqAjcC6xfRXuif5HBGa8kPsdl9+Ax+ncqab6CMwxfMNNHhZJE
         heQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:dkim-signature;
        bh=9ssIovT5K/V/p+0ZYlWssPZdHDeOwPRIwfvvL6OqWME=;
        b=vDRDWDvOtJSOCCRlgm17rIF1Qx23iQYjxAT//9F0cUmb4da0ff4v1tW53DsCNPK4z2
         Vqen4UWfq8x27MGC2l63B3CGfg53QHvGGFFhMgL4O4AphG+U3lDCBogyHzYnCWY55+LI
         79MR5QA6F3LankGOY1Zux70cmwMm21xdHDljTbanBpr7FiJxdyHg9QOf2WDPMyDV2wIc
         5ZTH/0jo9pI8q6sn1iBupXpbsI5DvyVgHfOEA5GZU7r28OJgX0lB0Pt1zRv26Vkiogwg
         /Hcjfy5LKMH3zQjCp9gx7dF0DtnjMYHAtz+MOFzlt1l8VRKunXfh3PTZrBOa5YbW7AYQ
         JaQg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=UiNiGvEy;
       dkim=neutral (no key) header.i=@suse.de;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1d as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out2.suse.de (smtp-out2.suse.de. [2001:67c:2178:6::1d])
        by mx.google.com with ESMTPS id q17-20020adfea11000000b0029b0c084865si15349907wrm.226.2023.01.13.06.07.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jan 2023 06:07:49 -0800 (PST)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1d as permitted sender) client-ip=2001:67c:2178:6::1d;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=UiNiGvEy;
       dkim=neutral (no key) header.i=@suse.de;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1d as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 7616A6069B;
	Fri, 13 Jan 2023 14:07:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1673618869; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9ssIovT5K/V/p+0ZYlWssPZdHDeOwPRIwfvvL6OqWME=;
	b=UiNiGvEyKbPYgtklAXXT3tZHaCDv4slV0M5pjmP0umLVCohRbfxldrGk10vk/PeTXNYJfl
	HZ6XVacwUcug5uO8Rw8k2DHPZGSeuKpYLj9sNcdZ639RFrA1mGFdQfzpEPV0so2gSA7C87
	1gGC0a8iax30DBod+mpwaTd/4Cp3rnQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1673618869;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9ssIovT5K/V/p+0ZYlWssPZdHDeOwPRIwfvvL6OqWME=;
	b=kOyWNch7XDPQEzSZP0/IjrmiGgfGpkpqd1pSRqQ5yBh8v1M/9Telp/mc5XXWjgfdeKiHOb
	K899689WUsU8mABA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 36DC11358A;
	Fri, 13 Jan 2023 14:07:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id aCmWALJlwWP8DQAAMHmgww
	(envelope-from <farosas@suse.de>); Fri, 13 Jan 2023 14:07:46 +0000
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
	Cleber Rosa <crosa@redhat.com>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Beraldo Leal <bleal@redhat.com>
Subject: [RFC PATCH v3 26/28] target/avocado: Pass parameters to migration test on aarch64
Date: Fri, 13 Jan 2023 11:04:17 -0300
Message-Id: <20230113140419.4013-27-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230113140419.4013-1-farosas@suse.de>
References: <20230113140419.4013-1-farosas@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: tUX8BCQq0mO4

The migration tests are currently broken for an aarch64 host because
the tests pass no 'machine' and 'cpu' options on the QEMU command
line. Most other architectures define a default value in QEMU for
these options, but arm does not.

Add these options to the test class in case the test is being executed
in an aarch64 host.

Signed-off-by: Fabiano Rosas <farosas@suse.de>
---
Don't we want to run migration tests for all the built targets? A
cleaner approach would be to just subclass Migration for each
archictecture like in boot_linux.py.
---
 tests/avocado/migration.py | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/tests/avocado/migration.py b/tests/avocado/migration.py
index 4b25680c50..f1c43622c0 100644
--- a/tests/avocado/migration.py
+++ b/tests/avocado/migration.py
@@ -11,6 +11,8 @@
 
 
 import tempfile
+import os
+
 from avocado_qemu import QemuSystemTest
 from avocado import skipUnless
 
@@ -26,6 +28,14 @@ class Migration(QemuSystemTest):
 
     timeout = 10
 
+    def setUp(self):
+        super().setUp()
+
+        arch = os.uname()[4]
+        if arch == 'aarch64':
+            self.machine = 'virt'
+            self.cpu = 'max'
+
     @staticmethod
     def migration_finished(vm):
         return vm.command('query-migrate')['status'] in ('completed', 'failed')
@@ -62,7 +72,6 @@ def _get_free_port(self):
             self.cancel('Failed to find a free port')
         return port
 
-
     def test_migration_with_tcp_localhost(self):
         dest_uri = 'tcp:localhost:%u' % self._get_free_port()
         self.do_migrate(dest_uri)
-- 
2.35.3
