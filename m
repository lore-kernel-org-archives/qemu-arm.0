Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp833239njb;
        Fri, 6 Dec 2024 05:12:28 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWQo2HHzcOasSSImaaFJEDIEDp4uiFPQ+JH3JCS31nPUOwyyhn4J06A9R8UrH4bV7AFkMewqI5DPznJ9g==@linaro.org
X-Google-Smtp-Source: AGHT+IFO6DA85yqMY1TXb1D5INoztO8vFTdxD65pEzPjtGqOOCEBbS82PDaSlPAeYmzw3kRh6GtR
X-Received: by 2002:a0c:e40b:0:b0:6d8:f005:b573 with SMTP id 6a1803df08f44-6d8f005bd50mr15195786d6.1.1733490748780;
        Fri, 06 Dec 2024 05:12:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733490748; cv=none;
        d=google.com; s=arc-20240605;
        b=fbf/I0d3hNMO2Z7KdD775YMU0ckQl62il6dUWPBglG6BCdLI0dewP58LLHJPragrpr
         NpghTzEy7cVe6I0diEiVBZIDbDbZwTsmUNJiXMcnGQHZvbC6PPkCEHVOHYDK8OUq/2Ly
         OH151A6PwLCCWUtEjFBhJeej+xneNx8S/wrfSeVUyuiW4jq6+0K0Nkv/BzBxavXXTAnf
         c2UohNvbpGS8ISAgX/6qPcCgXhNEZLIwWwRLRchWZV3HqiZEV8YCjPsX6wNVH0NWuzHN
         tfFfseISB+IOl5duxfDB5eWV/fqVV816oKZgiV5mTbeu/jxutDF9tHaoBINEp/ZNXhoY
         cFLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=ltopHPl4FJwLk1EyTLSPlsFmVlnaNjiR9PzEZvBjdcY=;
        fh=ei1e+zJiwKDD88dtLodzOeteNrdJ2/nETfnIpqjbrZ4=;
        b=OidL3ChojGeYXIMTUW4tKZCEzW/h3EhpIOvEnyOguYlD/K+XVgYopIzcq7fVjRjztW
         uFrB3be+r1svjV9lFRMbTVyapR6XLUsmww5cQ28Zp3LlJzVleTu2BsUCkzg1Kfn3WlvJ
         W1MHmrMe7F87RlNScEHD7bRt+TkareFh1oWPmvbEdOLjVNM/74JFZCx5C2RCD07t49t4
         H7d3HNLJy3WWe4RHr1XI06x120F861TPkVyb26uKRrgfGfHnaMQz+muMlxXgg7L7pfth
         c6ecnqUq9SaLe8r8GFAu5i7M1H85Zy+6+9+1qAt2PSl36n2xQaOhylDxw4Iy/z8jaaKp
         WZyA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=XhXj1Xst;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6d8e6e5d408si22747506d6.251.2024.12.06.05.12.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 06 Dec 2024 05:12:28 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=XhXj1Xst;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tJY7t-0003zy-Nh; Fri, 06 Dec 2024 08:12:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1tJY7s-0003zM-8F
 for qemu-arm@nongnu.org; Fri, 06 Dec 2024 08:12:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1tJY7q-00074K-Eh
 for qemu-arm@nongnu.org; Fri, 06 Dec 2024 08:12:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1733490725;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ltopHPl4FJwLk1EyTLSPlsFmVlnaNjiR9PzEZvBjdcY=;
 b=XhXj1XstOC/sMoQ/FoiOANou3nmXRhDSm/M/HdWU1q9wj8Q2BBAuBw2tPu9QI5M3qnvgBJ
 CKxqq3Yip87rJZYntysGaECVees6tvsTVH+i8B1SwsOr2uF2BWuYNirgX++jY3bszYDlKp
 Hc0epyaw79bMSjtR2OzrO9ShlDyGz0Y=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-341-yxRFsP1BM3Gy4sE7k3XrQA-1; Fri,
 06 Dec 2024 08:12:01 -0500
X-MC-Unique: yxRFsP1BM3Gy4sE7k3XrQA-1
X-Mimecast-MFC-AGG-ID: yxRFsP1BM3Gy4sE7k3XrQA
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 1A7191955E70; Fri,  6 Dec 2024 13:11:59 +0000 (UTC)
Received: from corto.redhat.com (unknown [10.39.192.16])
 by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id DD7F41955F3F; Fri,  6 Dec 2024 13:11:55 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
 Jamin Lin <jamin_lin@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Joel Stanley <joel@jms.id.au>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
Subject: [PATCH 3/7] tests/functional: Introduce a specific test for
 romulus-bmc machine
Date: Fri,  6 Dec 2024 14:11:28 +0100
Message-ID: <20241206131132.520911-4-clg@redhat.com>
In-Reply-To: <20241206131132.520911-1-clg@redhat.com>
References: <20241206131132.520911-1-clg@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
Received-SPF: pass client-ip=170.10.129.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.996,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: LqIo6FKJ92oB

This simply moves the romulus-bmc test to a new test file. No changes
in the test. The do_test_arm_aspeed routine is removed from the
test_arm_aspeed.py file because it is now unused.

Signed-off-by: Cédric Le Goater <clg@redhat.com>
---
 tests/functional/meson.build                |  2 ++
 tests/functional/test_arm_aspeed.py         | 26 ---------------------
 tests/functional/test_arm_aspeed_romulus.py | 24 +++++++++++++++++++
 3 files changed, 26 insertions(+), 26 deletions(-)
 create mode 100644 tests/functional/test_arm_aspeed_romulus.py

diff --git a/tests/functional/meson.build b/tests/functional/meson.build
index 3cd079f910a8..65eda5a394bc 100644
--- a/tests/functional/meson.build
+++ b/tests/functional/meson.build
@@ -20,6 +20,7 @@ test_timeouts = {
   'acpi_bits' : 420,
   'arm_aspeed_ast1030' : 10,
   'arm_aspeed_palmetto' : 120,
+  'arm_aspeed_romulus' : 120,
   'arm_aspeed' : 600,
   'arm_bpim2u' : 500,
   'arm_collie' : 180,
@@ -70,6 +71,7 @@ tests_arm_system_thorough = [
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
2.47.0

