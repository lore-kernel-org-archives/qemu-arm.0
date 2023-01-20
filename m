Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp1303507ejc;
        Fri, 20 Jan 2023 10:50:59 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtleZqz9tYUDQ/qNn2/JB2KcRv1LWYHiBFgfBPuEnayH3kSW/jVNOVrU7W1ZmlLhy4fpmsf
X-Received: by 2002:a5d:66d1:0:b0:2be:3538:2ef2 with SMTP id k17-20020a5d66d1000000b002be35382ef2mr8087256wrw.45.1674240659617;
        Fri, 20 Jan 2023 10:50:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674240659; cv=none;
        d=google.com; s=arc-20160816;
        b=Vx3ozJ9puGClwvIiDpMMkuUGwOf052kzKSC17rOIyDKIS3e04ND5I15qocITTJOpFX
         2RO/OTdYQy3U/u6eRoJUMi6itwjAyjN8MFcqRwmZZ5AdS4Ogfc5+bj1Eea+ZG2NTJss4
         du4yCAbLAKZSjThtrEfvYSe3yoK356lyKI60ABxFP3QUGCa8RDvhfzJzLZLEPFNdHmBj
         dx6PqFFQpNFzR4GKMX3Asdp7FezxNjbt0GjWu4fVC/81upLeqPfDZ/omTAWfWRfwA582
         OWWRZ2vtG0koboIq3wqc2pKhhCPqqKeuaPU9OVWHVefgEem2iHKON9ix2twOT+eWd92V
         OPBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:dkim-signature;
        bh=P/rV0PJIOUZCnnLBP0TDoGgeA0dRFVlBjTTK1Nu2RhU=;
        b=YO21/YgbILgkjk+a0S5NrOTXQ8sW7GLnPiokaQfmPCbNgjwF0QVBgvO4+tivTDdmS2
         ZRZSlwAHlXnzrzKkn6NrTFgCp/QAMubz5ftRWc5EdUrI23IADcCzPFAzX7aCIEZErDSn
         UsRQo/zXpDc8CUVrKgfnM+nX0iwqqvLQMaEuYA+rnqMQtFE1fLJ8zFbLenC93EbllBQg
         koNZwwExWrRaWgBXC3/BE7srqhxnj+OxTuP2j7NMYmNLOg5nqXc2xQ80zUC5gx6LGGfQ
         CxV76uy7kNbqaAD3PTpj5NS33TdZKJ+oLbpAG7BR9mc3vehzkVYqt6cSdFw/20wZfGwB
         ty4A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=QIiaWelZ;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1c as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out1.suse.de (smtp-out1.suse.de. [2001:67c:2178:6::1c])
        by mx.google.com with ESMTPS id o1-20020a05600002c100b002bbdbdcadc9si40535584wry.350.2023.01.20.10.50.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jan 2023 10:50:59 -0800 (PST)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1c as permitted sender) client-ip=2001:67c:2178:6::1c;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=QIiaWelZ;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1c as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 4175A337C7;
	Fri, 20 Jan 2023 18:50:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1674240659; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=P/rV0PJIOUZCnnLBP0TDoGgeA0dRFVlBjTTK1Nu2RhU=;
	b=QIiaWelZepFLC+oDa3xMb1lXmxI8n9KbF0VqKqpi0kpml7hCGh6cV2S2sTLHAody4wWIub
	cUbw8WKLykysYyvh8JPcRJrOdeLhYQa1SdsKxF0HB3uI/8CqBi7zghqbkgrZuo8lotyjN8
	ip22jczp7nYzV23gsXg/5ZsmH9LdJCw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1674240659;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=P/rV0PJIOUZCnnLBP0TDoGgeA0dRFVlBjTTK1Nu2RhU=;
	b=3pxGQ4pOCEWc3N0Tmnsvc/otsKwKE3paxOEjohyWyxvwGvJ2lCk38mM9eD1WqWHCUFXX5d
	D+tsOeYu9ZKdGXDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 71E111390C;
	Fri, 20 Jan 2023 18:50:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id YIS9DY/iymNSbQAAMHmgww
	(envelope-from <farosas@suse.de>); Fri, 20 Jan 2023 18:50:55 +0000
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
Subject: [RFC PATCH v5 7/9] target/avocado: Pass parameters to migration test on aarch64
Date: Fri, 20 Jan 2023 15:48:23 -0300
Message-Id: <20230120184825.31626-8-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230120184825.31626-1-farosas@suse.de>
References: <20230120184825.31626-1-farosas@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: HU9qM/aFimKe

The migration tests are currently broken for an aarch64 host because
the tests pass no 'machine' and 'cpu' options on the QEMU command
line. Most other architectures define a default value in QEMU for
these options, but arm does not.

Add these options to the test class in case the test is being executed
in an aarch64 host.

Signed-off-by: Fabiano Rosas <farosas@suse.de>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 tests/avocado/migration.py | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/tests/avocado/migration.py b/tests/avocado/migration.py
index 4b25680c50..ffd3db0f35 100644
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
-- 
2.35.3
