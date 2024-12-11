Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp3846025njb;
        Tue, 10 Dec 2024 22:35:10 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWEF8GVjvZF5SHgtDDEHzhZ8p5qyninYKcmKuc3fT7ZNVXyoMsnPassA3F4slEXIFbBbzgvzqrKevexGw==@linaro.org
X-Google-Smtp-Source: AGHT+IFCFNfvulK728WWwsW4QByG6oDhTGvMPKX9uBXCPGwKjbhT3VFkaFcTNUXZpkpn4KB/Dx2E
X-Received: by 2002:a05:622a:19a6:b0:467:517b:90ca with SMTP id d75a77b69052e-467895bff42mr25869751cf.21.1733898910532;
        Tue, 10 Dec 2024 22:35:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733898910; cv=none;
        d=google.com; s=arc-20240605;
        b=WeP/j6gmEWb5Y9ATXjZit8E734K5em8kxB1Fq7ugZsvpRfc0rYEVMxVqaCUIdGV/Lq
         NPWKS+T/1dz8nibLTz1PZcXJVscxQysQ6J0Safb3bkNPTUvW9vH/ppAAnTX2Rc2ZNUba
         ru4Kfe9wEEBhvhfFq9fGGZfoscBNOeYM1WxVI3aP0/Bcysz6MODAToOO6DliImjxI8Ei
         aaM/Xf5J/gCtSVwA5J1ZHiEM1b5pilpacKGS0evSQwGuwjGMG/IhR+265fJlwttRRR8t
         aKKTBHk8Tl2nyQM8+AnoetHJ3VFKgeQvA214qsmTqQ3kfl5Xp6UVDz3kerXaxzHX55sL
         hdXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=PMjjtn0nSgVnv5+8x5tJ9F4r/3B4cDi8Qv1yqJl8wuo=;
        fh=dCqPeOMyJN6b1xLXHrHk9Vfv4bvn90zVm2nOfsHEFC8=;
        b=Rn84+eZ2xQpkfRMtOP8jrntB70EcZVQaaqn3Fv7R7FcsFOOoTYllkjMSnHRe975vbC
         4zZM6ki2K+rhUTgQKpEq0Kv/hXIF7uYdhZEQnaN72qTnRlDk80zqfB7VobIqABOP985n
         PowHE+LN+3OlFhAqz6DFl17x1e+/LIPtDE10jo/9I2BNPxwYWu/ixv2ELCO8WtRNYcw2
         raDx9I3zEhSVmJMRqTu/LEoOciDLANqAolHZXiB377aFLSDO/4cMTnifdsUqDzuhXvib
         jy7xcTKkBHR2zealHGjXSfuXy8P0ngUdb07nqZlg219nF7BuNg9sZ/JBzr+43eX9pVhK
         7HIA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=aU7MawlG;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-46759b32e74si101481551cf.347.2024.12.10.22.35.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 10 Dec 2024 22:35:10 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=aU7MawlG;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tLGH6-0006QM-GW; Wed, 11 Dec 2024 01:32:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1tLGGB-0004k0-Pr
 for qemu-devel@nongnu.org; Wed, 11 Dec 2024 01:31:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1tLGG0-0008Th-Hb
 for qemu-devel@nongnu.org; Wed, 11 Dec 2024 01:31:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1733898694;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PMjjtn0nSgVnv5+8x5tJ9F4r/3B4cDi8Qv1yqJl8wuo=;
 b=aU7MawlG8DZqIhZm4sWAwAO1v9RXh+aMOrIwIvE0hTuF3ACiflkpMsb2fchB2nv9GG3zdb
 4bqUVpkBeHo42du/7I5aYoGGZX2XBjftt//4HVybLJsB3g+JGWzgcXHQInzBInehPqiEme
 21t7u+x4M7GUB/JgDqOlBJuWKGR4Oiw=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-571-vJJupC8INJ-Um_veMXapjA-1; Wed,
 11 Dec 2024 01:31:30 -0500
X-MC-Unique: vJJupC8INJ-Um_veMXapjA-1
X-Mimecast-MFC-AGG-ID: vJJupC8INJ-Um_veMXapjA
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 6023E1954ADD; Wed, 11 Dec 2024 06:31:29 +0000 (UTC)
Received: from corto.redhat.com (unknown [10.39.194.144])
 by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id F3F341956054; Wed, 11 Dec 2024 06:31:27 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>,
 Thomas Huth <thuth@redhat.com>
Subject: [PULL 10/24] tests/functional: Introduce a specific test for
 romulus-bmc machine
Date: Wed, 11 Dec 2024 07:30:44 +0100
Message-ID: <20241211063058.1222038-11-clg@redhat.com>
In-Reply-To: <20241211063058.1222038-1-clg@redhat.com>
References: <20241211063058.1222038-1-clg@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
Received-SPF: pass client-ip=170.10.129.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.52,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: KwR6No8nwUI/

This simply moves the romulus-bmc test to a new test file. No changes
in the test. The do_test_arm_aspeed routine is removed from the
test_arm_aspeed.py file because it is now unused.

Reviewed-by: Thomas Huth <thuth@redhat.com>
Link: https://lore.kernel.org/r/20241206131132.520911-4-clg@redhat.com
Signed-off-by: Cédric Le Goater <clg@redhat.com>
---
 tests/functional/meson.build                |  2 ++
 tests/functional/test_arm_aspeed.py         | 26 ---------------------
 tests/functional/test_arm_aspeed_romulus.py | 24 +++++++++++++++++++
 3 files changed, 26 insertions(+), 26 deletions(-)
 create mode 100644 tests/functional/test_arm_aspeed_romulus.py

diff --git a/tests/functional/meson.build b/tests/functional/meson.build
index 4752dca9d66c..e9ec5af0f1e4 100644
--- a/tests/functional/meson.build
+++ b/tests/functional/meson.build
@@ -19,6 +19,7 @@ test_timeouts = {
   'aarch64_virt' : 720,
   'acpi_bits' : 420,
   'arm_aspeed_palmetto' : 120,
+  'arm_aspeed_romulus' : 120,
   'arm_aspeed' : 600,
   'arm_bpim2u' : 500,
   'arm_collie' : 180,
@@ -69,6 +70,7 @@ tests_arm_system_thorough = [
   'arm_aspeed',
   'arm_aspeed_ast1030',
   'arm_aspeed_palmetto',
+  'arm_aspeed_romulus',
   'arm_bpim2u',
   'arm_canona1100',
   'arm_collie',
diff --git a/tests/functional/test_arm_aspeed.py b/tests/functional/test_arm_aspeed.py
index 48a229608ef6..bdc000a00a32 100755
--- a/tests/functional/test_arm_aspeed.py
+++ b/tests/functional/test_arm_aspeed.py
@@ -21,32 +21,6 @@
 
 class AST2x00Machine(LinuxKernelTest):
 
-    def do_test_arm_aspeed(self, machine, image):
-        self.set_machine(machine)
-        self.vm.set_console()
-        self.vm.add_args('-drive', 'file=' + image + ',if=mtd,format=raw',
-                         '-net', 'nic', '-snapshot')
-        self.vm.launch()
-
-        self.wait_for_console_pattern("U-Boot 2016.07")
-        self.wait_for_console_pattern("## Loading kernel from FIT Image at 20080000")
-        self.wait_for_console_pattern("Starting kernel ...")
-        self.wait_for_console_pattern("Booting Linux on physical CPU 0x0")
-        self.wait_for_console_pattern(
-                "aspeed-smc 1e620000.spi: read control register: 203b0641")
-        self.wait_for_console_pattern("ftgmac100 1e660000.ethernet eth0: irq ")
-        self.wait_for_console_pattern("systemd[1]: Set hostname to")
-
-    ASSET_ROMULUS_FLASH = Asset(
-        ('https://github.com/openbmc/openbmc/releases/download/2.9.0/'
-         'obmc-phosphor-image-romulus.static.mtd'),
-        '820341076803f1955bc31e647a512c79f9add4f5233d0697678bab4604c7bb25')
-
-    def test_arm_ast2500_romulus_openbmc_v2_9_0(self):
-        image_path = self.ASSET_ROMULUS_FLASH.fetch()
-
-        self.do_test_arm_aspeed('romulus-bmc', image_path)
-
     def do_test_arm_aspeed_buildroot_start(self, image, cpu_id, pattern='Aspeed EVB'):
         self.require_netdev('user')
         self.vm.set_console()
diff --git a/tests/functional/test_arm_aspeed_romulus.py b/tests/functional/test_arm_aspeed_romulus.py
new file mode 100644
index 000000000000..747b616201ce
--- /dev/null
+++ b/tests/functional/test_arm_aspeed_romulus.py
@@ -0,0 +1,24 @@
+#!/usr/bin/env python3
+#
+# Functional test that boots the ASPEED machines
+#
+# SPDX-License-Identifier: GPL-2.0-or-later
+
+from qemu_test import Asset
+from aspeed import AspeedTest
+
+class RomulusMachine(AspeedTest):
+
+    ASSET_ROMULUS_FLASH = Asset(
+        ('https://github.com/openbmc/openbmc/releases/download/2.9.0/'
+         'obmc-phosphor-image-romulus.static.mtd'),
+        '820341076803f1955bc31e647a512c79f9add4f5233d0697678bab4604c7bb25')
+
+    def test_arm_ast2500_romulus_openbmc_v2_9_0(self):
+        image_path = self.ASSET_ROMULUS_FLASH.fetch()
+
+        self.do_test_arm_aspeed('romulus-bmc', image_path)
+
+
+if __name__ == '__main__':
+    AspeedTest.main()
-- 
2.47.1

