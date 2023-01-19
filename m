Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp345930ejc;
        Thu, 19 Jan 2023 05:57:22 -0800 (PST)
X-Google-Smtp-Source: AMrXdXu6W7TqV+sifZ/SVoZQE0Dk+5IBcDRaLk3LYjvOFvfiysRrioY9JK89j+a4XyFbAibY9zrg
X-Received: by 2002:a17:906:2c1b:b0:870:bc81:632e with SMTP id e27-20020a1709062c1b00b00870bc81632emr7184974ejh.44.1674136641937;
        Thu, 19 Jan 2023 05:57:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674136641; cv=none;
        d=google.com; s=arc-20160816;
        b=QOh+n1S1FP0+aR58NZzUPzUtyy8Acg6Yrv4KymV27eXU/8TPFnh1OkIt6fHzf/+j+q
         00NsfpWeLG8vo38fQEZzhkJRfrnnLaUFq+0wE0NAUn81Gf4+YIiFlCRKWr/Xz33P95gU
         ubLmYQwocla+LnUHNLsLX9ptuH3iqikrWnaazb/PFxnADUAAe9V42Vfta051/yGXVY1r
         hH/lNWcKK26fCpbhdqSEpFZdP4tRq2bbxJxBzk6S2EaS/W2gvIlupdN/yVoPka6amXEm
         ayKeM7txO/zCX3tjbUEoXHPdnpmuHohdm6idNWxE6zibBjqMV8jnB1LhsVMwvCxxoFMw
         rZqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:dkim-signature;
        bh=9ssIovT5K/V/p+0ZYlWssPZdHDeOwPRIwfvvL6OqWME=;
        b=R6Haf6GWJTB7ewSO9cijuuMqE+HSRoCRCYtDTRdmlG3XyWmTNR37nvzuljcnNlK1it
         PHbQfc9eJ9cldCiW/2TDyhmxzQFIIOEv1/pvcpI7UE+VWLchEEIcFPV+hKTKGG7zJ8ty
         HFOXC/askzsySI6CV8vP42susCel63+Zt0Jy8EH9ggWuUQZnW+hPkzSnvjYTAPRMRu++
         TqQQjQekaaiVZVzVZEMSRM5a+QEWWK9uVwUIW/okzvTsbckZagujvu6RKLMhvG2qZ0xm
         PD254L+7qUoK/6053k61s7sTuSAp7aaVzykfwpCRCQ+ElEwoBPEnQfNbKdOkOjZ/+L/3
         PNCQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=cDsylV+n;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519;
       spf=pass (google.com: domain of farosas@suse.de designates 195.135.220.29 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out2.suse.de (smtp-out2.suse.de. [195.135.220.29])
        by mx.google.com with ESMTPS id gn41-20020a1709070d2900b0086f0864592dsi16511579ejc.321.2023.01.19.05.57.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jan 2023 05:57:21 -0800 (PST)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 195.135.220.29 as permitted sender) client-ip=195.135.220.29;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=cDsylV+n;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519;
       spf=pass (google.com: domain of farosas@suse.de designates 195.135.220.29 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 8F74C5CE73;
	Thu, 19 Jan 2023 13:57:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1674136641; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9ssIovT5K/V/p+0ZYlWssPZdHDeOwPRIwfvvL6OqWME=;
	b=cDsylV+noth70jWTPFQIiYYcTBbVoiPzRR/MIxb761PrbSeAm8xTUzjVuBKY+qJabDBJjY
	F+L2odGvl6g9WObmGdoZuAGktdKrDn8gQtzsMm42TkMFPLPA3BSy50yR6DAo7/p3BGI9kd
	EdQqPVcOFmAEzYrcx2AHhj3QUlGCm24=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1674136641;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9ssIovT5K/V/p+0ZYlWssPZdHDeOwPRIwfvvL6OqWME=;
	b=xFER7pINKsIp67uZXj8mf67F24VKh3YreLp71hgMaGazvheKDyzUeaL/DTLNN/802tm590
	6VqtrlI8PnGVSAAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id CB791134F5;
	Thu, 19 Jan 2023 13:57:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id CALcIz1MyWOCFAAAMHmgww
	(envelope-from <farosas@suse.de>); Thu, 19 Jan 2023 13:57:17 +0000
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
Subject: [RFC PATCH v4 13/15] target/avocado: Pass parameters to migration test on aarch64
Date: Thu, 19 Jan 2023 10:54:22 -0300
Message-Id: <20230119135424.5417-14-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230119135424.5417-1-farosas@suse.de>
References: <20230119135424.5417-1-farosas@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: poqqH3k2z2kv

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
