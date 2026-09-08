Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B32AC79FA1
	for <qemu-arm@archiver.kernel.org>; Tue,  8 Sep 2026 09:53:49 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x3sUu-00048w-L1; Tue, 08 Sep 2026 05:52:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1x3sUs-00048J-1M
 for qemu-arm@nongnu.org; Tue, 08 Sep 2026 05:52:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1x3sUp-0002ac-Vw
 for qemu-arm@nongnu.org; Tue, 08 Sep 2026 05:52:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1788861126;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MJ3JKz6ii3UHXbYgbY5KF1obV3J6lMcORoFh8rbcuII=;
 b=HH74pO6Qj4wuabg4ZHry/lfVjWDni8KNXVSbJWbcueV3uDfq86u96MEkH3SpGyHT73YZ9Q
 CW8m87QZehWhwy+bKMfkNnTB8AV2Z/5YhZzLFhe/Utaz+3zbDqEBx2WpI9po10vA7lTiKg
 OH/qtjG3ujNchh7X4AGZzMOTSW7Feys=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-494-9gt2mv6xPFC60O0Fn2fRkA-1; Tue,
 08 Sep 2026 05:52:03 -0400
X-MC-Unique: 9gt2mv6xPFC60O0Fn2fRkA-1
X-Mimecast-MFC-AGG-ID: 9gt2mv6xPFC60O0Fn2fRkA_1788861122
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id E110D183F9F7; Tue,  8 Sep 2026 09:52:01 +0000 (UTC)
Received: from localhost (headnet04.pony-001.prod.iad2.dc.redhat.com
 [10.2.32.116])
 by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id BACF9180034F; Tue,  8 Sep 2026 09:52:00 +0000 (UTC)
From: =?utf-8?q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>
Date: Tue, 08 Sep 2026 13:51:50 +0400
Subject: [GIT PULL 01/10] tests/functional: replace HMP with QMP
MIME-Version: 1.0
Message-Id: <20260908-nohmp-v1-1-b19b693a5665@redhat.com>
References: <20260908-nohmp-v1-0-b19b693a5665@redhat.com>
In-Reply-To: <20260908-nohmp-v1-0-b19b693a5665@redhat.com>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, Thomas Huth <th.huth+qemu@posteo.eu>, 
 =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>, 
 Aurelien Jarno <aurelien@aurel32.net>, qemu-arm@nongnu.org
X-Developer-Signature: v=1; a=openpgp-sha256; l=4380;
 i=marcandre.lureau@redhat.com; h=from:subject:message-id;
 bh=Enc5oozE2GmO4F1KrQprCafEbYY2rlyNKpoQ+I9nrjg=;
 b=owEBbQKS/ZANAwAKAdro4Ql1lpzlAcsmYgBqn9q65/cFkBtLvO69Yg8nu/lijA7tsQImrG2nm
 hu3KAcNq4KJAjMEAAEKAB0WIQSHqb2TP4fGBtJ29i3a6OEJdZac5QUCap/augAKCRDa6OEJdZac
 5YpFD/9h28APPXvNBxBqTEk7jcaYZsNrrTNF2YGxpVGNBKFbw9wR4zdfUBg9JqLemmbqP7tB0Ht
 SEnlQkv1krFwEN0y84Ra3fbiE4+pFrIDE8YnB8J77Hl3ayRCOgjx8h2T6FyAIN4H0UQDHhZ+inZ
 YU/DZCPFU9wmJ1PTCx89TdK8MIILJrOD1K3mMOUArC3odwdykjSmNeCeIxftJzgRpCkxgsGgTKZ
 P0mdB6+uu8oQDHap51OHp6sDSGUUGtaiJ6Y9kKrD0ujTZiw7M2zbJI1uonZLZI1gUlESdjVeGn6
 tTzszCuWGpcdY51i1QGQ+Dio8dG9uSFVbdp5kI75Mq9BBqHg/ODFfzFaHamJYRBI7NC2fKKIvrY
 4E/kxB3B/QVDVQRlC/8MMEFTGHITMZFCPuSZ/eWZkLA0TE0z4S82JZQ2HoStFpQsJW/pno7cVaS
 WMYkwxrxkvCI4u3SXtmO632Ww++xEyy+L8pWuF2M2lwseVRQZgMkxO5R4Y3GnM5Vg1gIsXp2uO6
 JDdoJqw1CcHb+EQYOAcyaqHM4tfyvV0mH40i1t+91sWYMi5etL5YVDkrWLod80z4KAPbFxmsLuh
 C20u29o3J+U/vqDSioezuubJ1emPhfLt5P/FcjQzIraLLLls9ERmGY49nL19ZZWvDHn7lm5Js/U
 26tRnihjpMWV9gg==
X-Developer-Key: i=marcandre.lureau@redhat.com; a=openpgp;
 fpr=87A9BD933F87C606D276F62DDAE8E10975969CE5
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-Mimecast-MFC-PROC-ID: RAUDCieEeVewKtFy-gkg4JnZ7crHtXhedeJxW3YRMu4_1788861122
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Replace HMP with QMP equivalent.

Reviewed-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 tests/functional/arm/test_integratorcp.py | 13 ++++++++-----
 tests/functional/m68k/test_nextcube.py    | 11 +++++++----
 tests/functional/mips64el/test_malta.py   | 13 ++++++++-----
 3 files changed, 23 insertions(+), 14 deletions(-)

diff --git a/tests/functional/arm/test_integratorcp.py b/tests/functional/arm/test_integratorcp.py
index 23ae919359d5..b79e81393547 100755
--- a/tests/functional/arm/test_integratorcp.py
+++ b/tests/functional/arm/test_integratorcp.py
@@ -14,6 +14,7 @@
 
 import logging
 
+from qemu.qmp.qmp_client import ExecuteError
 from qemu_test import QemuSystemTest, Asset
 from qemu_test import wait_for_console_pattern
 from qemu_test import skipIfMissingImports, skipUntrustedTest
@@ -72,11 +73,13 @@ def test_framebuffer_tux_logo(self):
         self.boot_integratorcp()
         framebuffer_ready = 'Console: switching to colour frame buffer device'
         wait_for_console_pattern(self, framebuffer_ready)
-        self.vm.cmd('human-monitor-command', command_line='stop')
-        res = self.vm.cmd('human-monitor-command',
-                          command_line='screendump %s' % screendump_path)
-        if 'unknown command' in res:
-            self.skipTest('screendump not available')
+        self.vm.cmd('stop')
+        try:
+            self.vm.cmd('screendump', filename=screendump_path)
+        except ExecuteError as e:
+            if e.error_class == 'CommandNotFound':
+                self.skipTest('screendump command not found')
+            raise
 
         cpu_count = 1
         match_threshold = 0.92
diff --git a/tests/functional/m68k/test_nextcube.py b/tests/functional/m68k/test_nextcube.py
index d917cf5424fe..f3d92034b127 100755
--- a/tests/functional/m68k/test_nextcube.py
+++ b/tests/functional/m68k/test_nextcube.py
@@ -9,6 +9,7 @@
 
 import time
 
+from qemu.qmp.qmp_client import ExecuteError
 from qemu_test import QemuSystemTest, Asset
 from qemu_test import skipIfMissingImports, skipIfMissingCommands
 from qemu_test.tesseract import tesseract_ocr
@@ -39,10 +40,12 @@ def check_bootrom_framebuffer(self, screenshot_path):
                 break
             time.sleep(0.1)
 
-        res = self.vm.cmd('human-monitor-command',
-                          command_line=f"screendump {screenshot_path}")
-        if 'unknown command' in res:
-            self.skipTest('screendump not available')
+        try:
+            self.vm.cmd('screendump', filename=screenshot_path)
+        except ExecuteError as e:
+            if e.error_class == 'CommandNotFound':
+                self.skipTest('screendump command not found')
+            raise
 
     @skipIfMissingImports("PIL")
     def test_bootrom_framebuffer_size(self):
diff --git a/tests/functional/mips64el/test_malta.py b/tests/functional/mips64el/test_malta.py
index 163bbaf5ca36..4544f950d96e 100755
--- a/tests/functional/mips64el/test_malta.py
+++ b/tests/functional/mips64el/test_malta.py
@@ -11,6 +11,7 @@
 
 import os
 
+from qemu.qmp.qmp_client import ExecuteError
 from qemu_test import LinuxKernelTest, Asset
 from qemu_test import exec_command_and_wait_for_pattern
 from qemu_test import skipIfMissingImports, skipFlakyTest, skipUntrustedTest
@@ -154,11 +155,13 @@ def do_test_i6400_framebuffer_logo(self, cpu_cores_count):
         self.vm.launch()
         framebuffer_ready = 'Console: switching to colour frame buffer device'
         self.wait_for_console_pattern(framebuffer_ready)
-        self.vm.cmd('human-monitor-command', command_line='stop')
-        res = self.vm.cmd('human-monitor-command',
-                          command_line=f'screendump {screendump_path}')
-        if 'unknown command' in res:
-            self.skipTest('screendump not available')
+        self.vm.cmd('stop')
+        try:
+            self.vm.cmd('screendump', filename=screendump_path)
+        except ExecuteError as e:
+            if e.error_class == 'CommandNotFound':
+                self.skipTest('screendump command not found')
+            raise
 
         match_threshold = 0.95
         screendump_bgr = cv2.imread(screendump_path, cv2.IMREAD_COLOR)

-- 
2.55.0.543.g5ebe2ebe4ea8


