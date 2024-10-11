Received: by 2002:a17:505:3501:b0:1be9:327d:8ee3 with SMTP id mc1csp392500njb;
        Fri, 11 Oct 2024 06:20:18 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWDUpsrK2KzvoKgvZEQmHpewr4WDNT/dwgHJjECrew86rbsjDRPlFA2dWVgrKyAW/vLwoy0VtsWUaPfbQ==@linaro.org
X-Google-Smtp-Source: AGHT+IHxSGtdAO5/5VuVA2XHpHYwLSs4Vye5sBE9+piJF0c4BtNmUwqTzTiszKN1latJy9k5W7VK
X-Received: by 2002:a25:e048:0:b0:e25:d517:c58a with SMTP id 3f1490d57ef6-e2919ffb5f9mr1464040276.56.1728652818399;
        Fri, 11 Oct 2024 06:20:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728652818; cv=none;
        d=google.com; s=arc-20240605;
        b=PZWCgR8WQefg6L2UIIuOZsyRJS1ypkFOLNlYoW2Vp3lZukyh3dHb2K/ZhpmtKfWhJN
         BbLVwjDai7FFztEySyQsgze25M/J6X/zx01gcsm19XlakPXJTscJy8MjqrdB7t8E+8X4
         d+znua0QSC3kMeY85x99hB/YuNOo2LyT77KpnEJO8eosnjmU9qvR7wbJelhZczwQTRjd
         gSz3W4caJWGdGaGdeNjMvCwQow5psXxpuG9Q+O/jc600F2jFxYE1q1qn6fra8dwako9a
         tMThfbM1SajXQGG3vST8xUsfJJZVd46vEeBNlI9pg4BmWi7bcMKt4uNFVflRCEcInGPB
         +v6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=j/Tvot+/MKUpHRoONIelj0oUwNzsJh42ipWPCh2ZAtI=;
        fh=yV7XiH9Iqz9ECmsY7O4iL5H1OqntXAXD46ZP2pth0HE=;
        b=Klg2XDPjQD6GslR5FX+lHiNnQ3u+CizjGsGVaak3vjPFUlODc0Qpw+bWhelLmUZiPT
         IS/Vq5J7cXPYiJWcRD9Mkpn2LiAC4X4NmIq0clEYE2M/LaYp0qKyCAb0NskMv6yBYL2V
         nw0mda54XHbyRf0oMK1xpGsx05mJBTZla8/tgwb/K/8XtmcUQJl1+sJIihicRLh6Rgzq
         G6DRwFJJYIVBO0/19TiSuqmlEilO/Tbnf9F6hfkgnuCxGX2le02oNDgXZzLa6r+J/tDt
         GasEBpsyW1LO0Vr7giYOZ82G2CED+0WlAk6XmRGef59AwQb2SFEv/tl18yyM/CFUdrbT
         SFBA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=URrCtnVA;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id d75a77b69052e-46042880a94si36758821cf.334.2024.10.11.06.20.18
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Oct 2024 06:20:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=URrCtnVA;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1728652818;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=j/Tvot+/MKUpHRoONIelj0oUwNzsJh42ipWPCh2ZAtI=;
	b=URrCtnVANFEb27Sf4VQVYcr2Ja0ulXVf5bTEKgW6qqcybuKemIBFnzRMiX+c177Vdq9cd9
	rneTIkrc20sfQuPiFtXwYPJtigivZea7E11jfijWh6Vcbh1XDKdcCpeL/Tkz1VW825FHcE
	1BKsruwgZI/96ANUTx5eBS+zQvv1LVc=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-140-kDUK8pKWPaK0yT9WBLq6kA-1; Fri,
 11 Oct 2024 09:20:15 -0400
X-MC-Unique: kDUK8pKWPaK0yT9WBLq6kA-1
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 64DBB19560AD;
	Fri, 11 Oct 2024 13:20:13 +0000 (UTC)
Received: from thuth-p1g4.redhat.com (unknown [10.39.193.77])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 98BDE1955E8F;
	Fri, 11 Oct 2024 13:20:10 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: Guenter Roeck <linux@roeck-us.net>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Magnus Damm <magnus.damm@gmail.com>,
	qemu-arm@nongnu.org,
	Thomas Huth <thuth@redhat.com>
Subject: [PATCH 04/17] tests/functional: Convert the Avocado sparc64 tuxrun test
Date: Fri, 11 Oct 2024 15:19:21 +0200
Message-ID: <20241011131937.377223-5-thuth@redhat.com>
In-Reply-To: <20241011131937.377223-1-thuth@redhat.com>
References: <20241011131937.377223-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-TUID: m9SP5LP11W5C

Move the test to a new file so that it can be run via
qemu-system-sparc64 in the functional framework.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 MAINTAINERS                             |  1 +
 tests/avocado/tuxrun_baselines.py       | 16 ------------
 tests/functional/meson.build            |  1 +
 tests/functional/test_sparc64_tuxrun.py | 34 +++++++++++++++++++++++++
 4 files changed, 36 insertions(+), 16 deletions(-)
 create mode 100755 tests/functional/test_sparc64_tuxrun.py

diff --git a/MAINTAINERS b/MAINTAINERS
index ab9da679f5..5493623050 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1656,6 +1656,7 @@ F: hw/pci-bridge/simba.c
 F: include/hw/pci-bridge/simba.h
 F: pc-bios/openbios-sparc64
 F: tests/functional/test_sparc64_sun4u.py
+F: tests/functional/test_sparc64_tuxrun.py
 
 Sun4v
 M: Artyom Tarasenko <atar4qemu@gmail.com>
diff --git a/tests/avocado/tuxrun_baselines.py b/tests/avocado/tuxrun_baselines.py
index dffa4f6339..dc32735c3f 100644
--- a/tests/avocado/tuxrun_baselines.py
+++ b/tests/avocado/tuxrun_baselines.py
@@ -462,22 +462,6 @@ def test_sh4(self):
         exec_command_and_wait_for_pattern(self, 'halt',
                                           "reboot: System halted")
 
-    def test_sparc64(self):
-        """
-        :avocado: tags=arch:sparc64
-        :avocado: tags=tuxboot:sparc64
-        :avocado: tags=image:vmlinux
-        :avocado: tags=root:sda
-        :avocado: tags=shutdown:nowait
-        """
-
-        sums = { "rootfs.ext4.zst" :
-                 "ad2f1dc436ab51583543d25d2c210cab478645d47078d30d129a66ab0e281d76",
-                 "vmlinux" :
-                 "e34313e4325ff21deaa3d38a502aa09a373ef62b9bd4d7f8f29388b688225c55" }
-
-        self.common_tuxrun(csums=sums, drive="driver=ide-hd,bus=ide.0,unit=0")
-
     def test_x86_64(self):
         """
         :avocado: tags=arch:x86_64
diff --git a/tests/functional/meson.build b/tests/functional/meson.build
index 222bfbcc62..d598f43289 100644
--- a/tests/functional/meson.build
+++ b/tests/functional/meson.build
@@ -142,6 +142,7 @@ tests_sparc_system_thorough = [
 
 tests_sparc64_system_thorough = [
   'sparc64_sun4u',
+  'sparc64_tuxrun',
 ]
 
 tests_x86_64_system_quick = [
diff --git a/tests/functional/test_sparc64_tuxrun.py b/tests/functional/test_sparc64_tuxrun.py
new file mode 100755
index 0000000000..1c2c005630
--- /dev/null
+++ b/tests/functional/test_sparc64_tuxrun.py
@@ -0,0 +1,34 @@
+#!/usr/bin/env python3
+#
+# Functional test that boots known good tuxboot images the same way
+# that tuxrun (www.tuxrun.org) does. This tool is used by things like
+# the LKFT project to run regression tests on kernels.
+#
+# Copyright (c) 2023 Linaro Ltd.
+#
+# Author:
+#  Alex Bennée <alex.bennee@linaro.org>
+#
+# SPDX-License-Identifier: GPL-2.0-or-later
+
+from qemu_test import Asset
+from qemu_test.tuxruntest import TuxRunBaselineTest
+
+class TuxRunSparc64Test(TuxRunBaselineTest):
+
+    ASSET_SPARC64_KERNEL = Asset(
+        'https://storage.tuxboot.com/20230331/sparc64/vmlinux',
+        'e34313e4325ff21deaa3d38a502aa09a373ef62b9bd4d7f8f29388b688225c55')
+    ASSET_SPARC64_ROOTFS = Asset(
+        'https://storage.tuxboot.com/20230331/sparc64/rootfs.ext4.zst',
+        'ad2f1dc436ab51583543d25d2c210cab478645d47078d30d129a66ab0e281d76')
+
+    def test_sparc64(self):
+        self.root='sda'
+        self.wait_for_shutdown=False
+        self.common_tuxrun(kernel_asset=self.ASSET_SPARC64_KERNEL,
+                           rootfs_asset=self.ASSET_SPARC64_ROOTFS,
+                           drive="driver=ide-hd,bus=ide.0,unit=0")
+
+if __name__ == '__main__':
+    TuxRunBaselineTest.main()
-- 
2.46.1
