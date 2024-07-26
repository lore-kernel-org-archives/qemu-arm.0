Received: by 2002:a17:504:5965:b0:1be9:327d:8ee3 with SMTP id xe5csp474906njb;
        Fri, 26 Jul 2024 06:45:13 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV0UJ2JDSTPRHBbK2PbJnQhr6cVOBRiLlDgNHAxrsX/BeKFAMthikqdVS5zguAPpQQ4Mzii5647UYv4v53py+e7ZgmwyJae
X-Google-Smtp-Source: AGHT+IHA5X3z++Sc0ZvT6HqQlHjAh5/BD5jKmw4SEcXjJfAeQ1j2dt9QuGG86DM075La9Kpzm4XI
X-Received: by 2002:a67:e707:0:b0:493:b9ae:31ea with SMTP id ada2fe7eead31-493d640ddfdmr8059657137.6.1722001513626;
        Fri, 26 Jul 2024 06:45:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1722001513; cv=none;
        d=google.com; s=arc-20160816;
        b=E6b6mZwXw30aQnw97nl2txoIOK9NXfN/vUtU0l7BSOGp063RKuZtuprJMIns6nedeJ
         rrTLQYWjaC7yKCujvXbmp2JdDBYCrb+d4Ma/ok9r6ljvuBR2gwflFKa1M/O7jG5+n1bc
         s0sJSDNiUnrG2BljgWJQUkFCcDp0fXDXbvfLH3vXSHk3rjHJkoSuKJi/3/4VhxCOUIxk
         AwHlzbwMddGxGtoqeBYSamRZ6FXWQyznuY/YhrWP0mxP2HaEeBw6WAj+vHDhYgPLD+1I
         g3t5lmi5B4i7OXll9gpKUYXiwFs4oebUEYGvy/Jdab0Z1cQWXVND9UN5ckvrztQU0feP
         I5/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=osLPoiTFxmzb7yDc5D1S/zDpmyUMFotz0CS6WEgfGpM=;
        fh=+JUQlqeb+WOWoY8tr4tplfLgDiP2lWYvcRFLGxWHojE=;
        b=G6X19+LGpqHzIEwmcp9e8MnwIVQQONsDwEEimfgFMuc8LG/IOkvt4WOxchzZfiML9T
         N/3GXMOQYFvyOSKU7CyUP2hj138whEv+NazOvtmCasHQqMsRCYe7pJVsPY7mft01XmYC
         ThgbUVHrCRwO0mcposCSA7/mc9sNGlzkR2w/nz6AbxwGLUftnnYSPLCyV5PSzXnYbG+F
         DEZAra++PEcpD8XdfexP9Gy76ZKPU7grEiQd0NdESgzX+pmvLxsHSPIeMGBpTkYEsGH3
         CW1YQHURks7l5dEC9mLcbxRzoHs6z5kZGxmmjFeLyMhFjUO16RDEsF3YIPW1hdAEnSWa
         UMRg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=MhSIloFq;
       spf=pass (google.com: domain of crosa@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=crosa@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <crosa@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id d75a77b69052e-44fe813719bsi38884431cf.144.2024.07.26.06.45.13
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jul 2024 06:45:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of crosa@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=MhSIloFq;
       spf=pass (google.com: domain of crosa@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=crosa@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1722001513;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=osLPoiTFxmzb7yDc5D1S/zDpmyUMFotz0CS6WEgfGpM=;
	b=MhSIloFqSdD/NR7nz1fRdAkNUew1ORl5NKEVl3JF3lz4bpw8F2LR7MUsbXD3cjp+E3cWPv
	uonrdWaVIGV/h+F0jbyvi3Vouo1LU+c+7vVbHad6UDC3sBvK6m4l2oHjwLmRE1rf4MQfLe
	RDgwSySWlmRGCgEdMz0oyfWnc4iXtSQ=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-149-3RQj_R13N2mlf7KIO6P6CQ-1; Fri,
 26 Jul 2024 09:45:10 -0400
X-MC-Unique: 3RQj_R13N2mlf7KIO6P6CQ-1
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 04B251944A95;
	Fri, 26 Jul 2024 13:45:08 +0000 (UTC)
Received: from p1.localdomain.com (unknown [10.22.17.77])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 4B9EB1955D45;
	Fri, 26 Jul 2024 13:45:03 +0000 (UTC)
From: Cleber Rosa <crosa@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Thomas Huth <thuth@redhat.com>,
	Beraldo Leal <bleal@redhat.com>,
	Sriram Yagnaraman <sriram.yagnaraman@ericsson.com>,
	David Woodhouse <dwmw2@infradead.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Leif Lindholm <quic_llindhol@quicinc.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	kvm@vger.kernel.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	qemu-arm@nongnu.org,
	Radoslaw Biernacki <rad@semihalf.com>,
	Cleber Rosa <crosa@redhat.com>,
	Paul Durrant <paul@xen.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH 04/13] tests/avocado: add cdrom permission related tests
Date: Fri, 26 Jul 2024 09:44:29 -0400
Message-ID: <20240726134438.14720-5-crosa@redhat.com>
In-Reply-To: <20240726134438.14720-1-crosa@redhat.com>
References: <20240726134438.14720-1-crosa@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
X-TUID: ZwdySBauAPHD

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
