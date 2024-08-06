Received: by 2002:a17:505:1e8b:b0:1be9:327d:8ee3 with SMTP id mw11csp1302794njb;
        Tue, 6 Aug 2024 10:32:23 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV5JwlpVZyTLrlLgLJ6Fb2Y1qlQYYS+I/ejd52Iebhwt2GgGab13fl2UsHwpv3HqI8W8OjNvEEJJ4ycjCcsEE4WiztbPT6l
X-Google-Smtp-Source: AGHT+IEdkp7E9ZFSPjUmk9POCwLdrvFsxC7fgCahxdkG6fZZC7Ktr5L8VTC6kcu7XFbUIHpxZ7Qd
X-Received: by 2002:a05:6214:3c88:b0:6b5:6138:1a54 with SMTP id 6a1803df08f44-6bb984ae443mr163041726d6.56.1722965543743;
        Tue, 06 Aug 2024 10:32:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1722965543; cv=none;
        d=google.com; s=arc-20160816;
        b=YhUyDQcLSK7mIoktc5V2ofWzvwaQsgXTsrX0UlsrIgl0GgTLQIu9rw45IekRcdCcxh
         kttLlBKaC22G7FhH9EG1d8fXTswVnUAhppvstGeLw0vj118gFZAXOgeCajj4qJcISGMF
         B+sd2h0xjswgsBJNwAhwhEfmjxrKKlaPGjKwuMtl6ZOTxyhBt9GdjaSfp2H/wkAZWSZd
         sFLDMJmrHHxQCyRgBCMtRs7Nf42ZBHnv7h14sJfItZF3I9GDt1I59I2na43pskY30XbT
         ModdhHWMbepF/m6wWihMx4FVZfnCQa4sEk/1NU8umtSmr5Ys3RztvP6OwMIEUrU4sSPf
         +X8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=nbyiJBKV1667Kt+ZajabFyIsW7lZeMVEfNzrj1/3epM=;
        fh=pOdCxWa9rQJU0vaikvZDwOcgRIEwREE3jBY9GdQlMoI=;
        b=TAeiKaX+poCzhTw+OsARbq/XXSuHa80S6YrStrkuDAJz/A4H0+K7BjyjDixJ6HXB2C
         C56cOwgra1cfMLlvXhC1R/oEOcHe4fWzdTU1E0lUA98Svst2JMm//VThNAlQ5vVhGwbN
         qLn3jS3AaEU7v6TFWTimEwjv8TXAKS7U00vL7jYGXZtKZQYcAIoJEs+zOMSdV4jfkN5Q
         dkVhmXCpzPI08fPh9ltUkjAouddV3jfCxOJKOnmBfi2cHxrucoxsUksIsTQYuoXYLxYG
         oietk1efVhrWD48GE/OqrtphtYOexQHSWeIp8xatfW+cp+Qm354/17O9etyMhu4UkECo
         4+Wg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ejiWdDSw;
       spf=pass (google.com: domain of crosa@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=crosa@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <crosa@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id 6a1803df08f44-6bb9c8dfd2asi122454766d6.590.2024.08.06.10.32.23
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Aug 2024 10:32:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of crosa@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ejiWdDSw;
       spf=pass (google.com: domain of crosa@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=crosa@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1722965543;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nbyiJBKV1667Kt+ZajabFyIsW7lZeMVEfNzrj1/3epM=;
	b=ejiWdDSwnJhwrh0i792dck0wDPrjbeCPnQWT9CMn0L+t7TQK7THhbx2FkX97OfKnuaysx+
	dXAielpHoWBnflDajlMzDp0IhG/VklqwRajH2JX+5agrYnlJG/yaXjmci7VR1Qh4H4Ye1c
	gNWJ5MnJFoNPXRIGUFdcRS6vFgOI74o=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-553-S8N2O7wLOCCk9w6DrMGlUA-1; Tue,
 06 Aug 2024 13:32:18 -0400
X-MC-Unique: S8N2O7wLOCCk9w6DrMGlUA-1
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id E086C1955D53;
	Tue,  6 Aug 2024 17:32:13 +0000 (UTC)
Received: from p1.localdomain.com (unknown [10.39.192.15])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id BE04C19560AE;
	Tue,  6 Aug 2024 17:32:04 +0000 (UTC)
From: Cleber Rosa <crosa@redhat.com>
To: qemu-devel@nongnu.org
Cc: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
	Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
	Radoslaw Biernacki <rad@semihalf.com>,
	Troy Lee <leetroy@gmail.com>,
	Akihiko Odaki <akihiko.odaki@daynix.com>,
	Beraldo Leal <bleal@redhat.com>,
	kvm@vger.kernel.org,
	Joel Stanley <joel@jms.id.au>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Sriram Yagnaraman <sriram.yagnaraman@ericsson.com>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Paul Durrant <paul@xen.org>,
	Eric Auger <eric.auger@redhat.com>,
	David Woodhouse <dwmw2@infradead.org>,
	qemu-arm@nongnu.org,
	Cleber Rosa <crosa@redhat.com>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Jamin Lin <jamin_lin@aspeedtech.com>,
	Steven Lee <steven_lee@aspeedtech.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Leif Lindholm <quic_llindhol@quicinc.com>
Subject: [PATCH v2 3/9] tests/avocado: add cdrom permission related tests
Date: Tue,  6 Aug 2024 13:31:13 -0400
Message-ID: <20240806173119.582857-4-crosa@redhat.com>
In-Reply-To: <20240806173119.582857-1-crosa@redhat.com>
References: <20240806173119.582857-1-crosa@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-TUID: eSRI51T9WTNY

The "media=cdrom" parameter is also used on some Avocado tests as a
way to protect files from being written.  The tests here bring a more
fundamental check that this behavior can be trusted.

Signed-off-by: Cleber Rosa <crosa@redhat.com>
---
 tests/avocado/cdrom.py | 41 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)
 create mode 100644 tests/avocado/cdrom.py

diff --git a/tests/avocado/cdrom.py b/tests/avocado/cdrom.py
new file mode 100644
index 0000000000..c9aa5d69cb
--- /dev/null
+++ b/tests/avocado/cdrom.py
@@ -0,0 +1,41 @@
+# Simple functional tests for cdrom devices
+#
+# Copyright (c) 2023 Red Hat, Inc.
+#
+# Author:
+#  Cleber Rosa <crosa@redhat.com>
+#
+# This work is licensed under the terms of the GNU GPL, version 2 or
+# later.  See the COPYING file in the top-level directory.
+
+import os
+
+from avocado.utils.iso9660 import iso9660
+from avocado_qemu import QemuSystemTest
+
+
+class Cdrom(QemuSystemTest):
+    """
+    :avocado: tags=block,cdrom,quick
+    :avocado: tags=machine:none
+    """
+    def setUp(self):
+        super().setUp()
+        self.iso_path = os.path.join(self.workdir, "cdrom.iso")
+        iso = iso9660(self.iso_path)
+        iso.create()
+        iso.close()
+
+    def test_plain_iso_rw(self):
+        self.vm.add_args('-drive', f'file={self.iso_path}')
+        self.vm.launch()
+        query_block_result = self.vm.qmp('query-block')['return']
+        self.assertEqual(len(query_block_result), 1)
+        self.assertFalse(query_block_result[0]["inserted"]["ro"])
+
+    def test_media_cdrom_ro(self):
+        self.vm.add_args('-drive', f'file={self.iso_path},media=cdrom')
+        self.vm.launch()
+        query_block_result = self.vm.qmp('query-block')['return']
+        self.assertEqual(len(query_block_result), 1)
+        self.assertTrue(query_block_result[0]["inserted"]["ro"])
-- 
2.45.2
