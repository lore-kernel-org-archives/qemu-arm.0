Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp3830879lfp;
        Mon, 27 Jan 2020 06:41:44 -0800 (PST)
X-Google-Smtp-Source: APXvYqxqn2QKdpmfQSlPGQ4LBNrQlcXG4R52WtRnGTEoVPYMKkSUUJZ0lqV+Yn+7MYC9s5DTe+aQ
X-Received: by 2002:a17:906:7806:: with SMTP id u6mr14071046ejm.200.1580136104746;
        Mon, 27 Jan 2020 06:41:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580136104; cv=none;
        d=google.com; s=arc-20160816;
        b=OhWcqyXst3qlmbPJnKBoZfU5diPL3NvJM7RQq8VyTpcpbfzbOQR3pPe8ltkRvMOOX1
         ysGTrB+HOZhkIIfFu52AaaT4IsHZxy7uo27l0MgrH6kD+OnzIDwqcg5QWqlq29oYNoMf
         xu2NnIcVvGCXEgrNfPLfpvaPSviVQXC3yzTGHShHyqEHuko21E3vVLbmCw41jIE8FIOq
         aSyxBYD3OnN5wp9xFFdhNNwimKJ3fQmAFfqFAh1okwFX9cmsobiNtc2ybRlvm7IPjZAh
         tQPnCkeqxN0drd49Mox+nNqscK69u4cXIwUSidaEm8c0aEt89KQyUjiKioKZ7XvsqEGE
         rIeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:message-id:date:subject:cc:to:from
         :dkim-signature;
        bh=jxMld//p9nIoSEIK1/s/JmrCXmNJEodd+FZJ21SJ4XI=;
        b=ZKRwnevgANdPSDZatNzS7uCyXfmGmxPMYJIUxJsNKsp+dx6Kg0c6m05B49CcmLujPT
         OXM8HqN3hNg2RsWRjUoJIKVWxAnmlvRQz7k0F7rmkwJheBWyBCrxorumTP+vwQDBm/2Q
         qCfctm5VzvLdK/eYWtoWefFL0SFuqO3Q1vaWO6lDtOwvooam73QNY7duonkS+oDg2Rqh
         v7mTQEqaOYnUcSizNJVb8E1ftcL0Kosj5Qss3PDPS1wPo5zZ01YpIn7/RqcTEQWK7OIf
         DLvnV5+ptlg3m9x0dyQjHquH4EYhjjGwxN2yDMe8jkxlsYRCELPAu94FL7nm/aQGl+bp
         IKiw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=frZv65WA;
       spf=pass (google.com: domain of thuth@redhat.com designates 207.211.31.120 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [207.211.31.120])
        by mx.google.com with ESMTPS id g3si7956163edu.96.2020.01.27.06.41.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 27 Jan 2020 06:41:44 -0800 (PST)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 207.211.31.120 as permitted sender) client-ip=207.211.31.120;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=frZv65WA;
       spf=pass (google.com: domain of thuth@redhat.com designates 207.211.31.120 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1580136103;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=jxMld//p9nIoSEIK1/s/JmrCXmNJEodd+FZJ21SJ4XI=;
	b=frZv65WAyAcL/uHFGuEfBGAKmHURKedfa89BOnqc/nwT9u/xCQsF+vxUuweNIfEgaw2VZA
	Kl1/Dg46ifRQH7yIZE2g1hqinzs6iqlkAsNm+C/SQbkwVvEhhZvwosXci9NfU2OzKcLSr/
	KMysrTZRh4IUzLxpv7ixUi7EaTI3rIM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-317-c9gyecCIPpax7YppQWCKfw-1; Mon, 27 Jan 2020 09:41:38 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 486F818FF663;
	Mon, 27 Jan 2020 14:41:37 +0000 (UTC)
Received: from thuth.com (ovpn-117-94.ams2.redhat.com [10.36.117.94])
	by smtp.corp.redhat.com (Postfix) with ESMTP id CCDB460BF4;
	Mon, 27 Jan 2020 14:41:31 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Cc: Cleber Rosa <crosa@redhat.com>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Antony Pavlov <antonynpavlov@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org
Subject: [PATCH] tests/acceptance: Add a test for the canon-a1100 machine
Date: Mon, 27 Jan 2020 15:41:26 +0100
Message-Id: <20200127144126.15515-1-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: c9gyecCIPpax7YppQWCKfw-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-TUID: gUgXAhUG6CdQ

The canon-a1100 machine can be used with the Barebox firmware. The
QEMU Advent Calendar 2018 features a pre-compiled image which we
can use for testing.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/acceptance/machine_arm_canon-a1100.py | 33 +++++++++++++++++++++
 1 file changed, 33 insertions(+)
 create mode 100644 tests/acceptance/machine_arm_canon-a1100.py

diff --git a/tests/acceptance/machine_arm_canon-a1100.py b/tests/acceptance=
/machine_arm_canon-a1100.py
new file mode 100644
index 0000000000..3888168451
--- /dev/null
+++ b/tests/acceptance/machine_arm_canon-a1100.py
@@ -0,0 +1,33 @@
+# Functional test that boots the canon-a1100 machine with firmware
+#
+# Copyright (c) 2020 Red Hat, Inc.
+#
+# Author:
+#  Thomas Huth <thuth@redhat.com>
+#
+# This work is licensed under the terms of the GNU GPL, version 2 or
+# later.  See the COPYING file in the top-level directory.
+
+from avocado_qemu import Test
+from avocado_qemu import wait_for_console_pattern
+from avocado.utils import archive
+
+class CanonA1100Machine(Test):
+
+    timeout =3D 90
+
+    def test_arm_canona1100(self):
+        """
+        :avocado: tags=3Darch:arm
+        :avocado: tags=3Dmachine:canon-a1100
+        """
+        tar_url =3D ('https://www.qemu-advent-calendar.org'
+                   '/2018/download/day18.tar.xz')
+        tar_hash =3D '068b5fc4242b29381acee94713509f8a876e9db6'
+        file_path =3D self.fetch_asset(tar_url, asset_hash=3Dtar_hash)
+        archive.extract(file_path, self.workdir)
+        self.vm.set_console()
+        self.vm.add_args('-bios',
+                         self.workdir + '/day18/barebox.canon-a1100.bin')
+        self.vm.launch()
+        wait_for_console_pattern(self, 'running /env/bin/init')
--=20
2.18.1
