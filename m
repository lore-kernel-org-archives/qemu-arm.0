Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp1872036lft;
        Wed, 22 Jun 2022 02:56:03 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vnrEj03Uz8tTYsk1Sl/Tk9ztLh8uHSzMxi2eqIfGyTJTJKoytQPh3GDA8pQ0KdrCaiwVMb
X-Received: by 2002:a05:620a:127a:b0:6a6:bd98:5734 with SMTP id b26-20020a05620a127a00b006a6bd985734mr1583279qkl.338.1655891763151;
        Wed, 22 Jun 2022 02:56:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1655891763; cv=none;
        d=google.com; s=arc-20160816;
        b=vjejIJt4XLhiGm7Z0w9sJsyRZoQnrb4/AYS9riD3Rz5ZqN03UXD8jupk6UngEbMngI
         3MGoK9o3/wVMzTo+4ziBCrRhqos/+QCKYbtrMyGuEWPugDPJu6Q3m/rqNj/wdDppoOrB
         71N8dmmW8xdmjg71V3P7hca/tu+QBED6NJ+q72WYViFKrFpVAZiDhQdYuM0f2e34eXlM
         zGjDPPSn71EuHZhi6GzIEoh4CRJsk8Kbn6KeeDjmT+a4snM+0cvkUrKWo2Nfu9qCPMI0
         lnXK03iy8kffveP+soO/n0QW/NGjySERwdteoYXuQ+EBPghBMgZ6B73OUYKLua8+zCQX
         ibjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=et0Ley4TQjNkmkGZi5kA8IWPeUTGzbPd4aHxt0xgR40=;
        b=omoH1rWKPPezIGDyVRhj3sKM7/pssx8ojlUtzGSPTa049GRscHztws7p1zGvegcG1P
         Zc5mODGltNCPuSSDFcu4Jm/9nU7/seqJ9/bWllByM3yY8NEpdb0uyKuhQV12ZhSi2MEr
         unSrq6JQV+MGWoahzgJVXJVr2tN7NQaovFu5byxurhAoyUWOUVzISnmpJfYxh3nz4/d/
         KE+lCXcX4hDvyGb1l3nvah1qY9vzsKiCdJuMLbyKREcKlwmsNwlaAOeT4Se2driHYqcs
         KS0ycspDt/WxOm8H8MndYyRi9PlUdGzyB9gfVnXbLedyHb9P/gw6L/tj2m/MtHrViCyO
         /tgA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u5-20020a05620a430500b006a6a2169675si12784489qko.404.2022.06.22.02.56.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 22 Jun 2022 02:56:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:57960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o3x5e-0005hM-Im
	for alex.bennee@linaro.org; Wed, 22 Jun 2022 05:56:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39220)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=05Ho=W5=kaod.org=clg@ozlabs.org>)
 id 1o3x5J-0005gY-3W; Wed, 22 Jun 2022 05:55:41 -0400
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3]:52861
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=05Ho=W5=kaod.org=clg@ozlabs.org>)
 id 1o3x5G-0004kv-BS; Wed, 22 Jun 2022 05:55:40 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4LSdzn0TYCz4xZj;
 Wed, 22 Jun 2022 19:55:33 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4LSdzl22j8z4xD9;
 Wed, 22 Jun 2022 19:55:31 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PULL 03/19] test/avocado/machine_aspeed.py: Add tests using
 buildroot images
Date: Wed, 22 Jun 2022 11:55:04 +0200
Message-Id: <20220622095520.3683321-4-clg@kaod.org>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220622095520.3683321-1-clg@kaod.org>
References: <20220622095520.3683321-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=SRS0=05Ho=W5=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: btflzsxN9pBv

Buildroot images are smaller than the OpenBMC images and faster to
run. Built from source using :

  http://patchwork.ozlabs.org/project/buildroot/list/?series=303465

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 tests/avocado/machine_aspeed.py | 52 +++++++++++++++++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/tests/avocado/machine_aspeed.py b/tests/avocado/machine_aspeed.py
index 89bfad307661..31a0fb6cd865 100644
--- a/tests/avocado/machine_aspeed.py
+++ b/tests/avocado/machine_aspeed.py
@@ -5,8 +5,11 @@
 # This work is licensed under the terms of the GNU GPL, version 2 or
 # later.  See the COPYING file in the top-level directory.
 
+import time
+
 from avocado_qemu import QemuSystemTest
 from avocado_qemu import wait_for_console_pattern
+from avocado_qemu import exec_command
 from avocado_qemu import exec_command_and_wait_for_pattern
 from avocado.utils import archive
 
@@ -84,3 +87,52 @@ def test_arm_ast2500_romulus_openbmc_v2_9_0(self):
                                       algorithm='sha256')
 
         self.do_test_arm_aspeed(image_path)
+
+    def do_test_arm_aspeed_buidroot_start(self, image, cpu_id):
+        self.vm.set_console()
+        self.vm.add_args('-drive', 'file=' + image + ',if=mtd,format=raw',
+                         '-net', 'nic', '-net', 'user')
+        self.vm.launch()
+
+        self.wait_for_console_pattern('U-Boot 2019.04')
+        self.wait_for_console_pattern('## Loading kernel from FIT Image')
+        self.wait_for_console_pattern('Starting kernel ...')
+        self.wait_for_console_pattern('Booting Linux on physical CPU ' + cpu_id)
+        self.wait_for_console_pattern('lease of 10.0.2.15')
+        self.wait_for_console_pattern('Aspeed EVB')
+        exec_command(self, 'root')
+        time.sleep(0.1)
+
+    def do_test_arm_aspeed_buidroot_poweroff(self):
+        exec_command_and_wait_for_pattern(self, 'poweroff',
+                                          'reboot: System halted');
+
+    def test_arm_ast2500_evb_builroot(self):
+        """
+        :avocado: tags=arch:arm
+        :avocado: tags=machine:ast2500-evb
+        """
+
+        image_url = ('https://github.com/legoater/qemu-aspeed-boot/raw/master/'
+                     'images/ast2500-evb/buildroot-2022.05/flash.img')
+        image_hash = ('549db6e9d8cdaf4367af21c36385a68bb465779c18b5e37094fc7343decccd3f')
+        image_path = self.fetch_asset(image_url, asset_hash=image_hash,
+                                      algorithm='sha256')
+
+        self.do_test_arm_aspeed_buidroot_start(image_path, '0x0')
+        self.do_test_arm_aspeed_buidroot_poweroff()
+
+    def test_arm_ast2600_evb_builroot(self):
+        """
+        :avocado: tags=arch:arm
+        :avocado: tags=machine:ast2600-evb
+        """
+
+        image_url = ('https://github.com/legoater/qemu-aspeed-boot/raw/master/'
+                     'images/ast2600-evb/buildroot-2022.05/flash.img')
+        image_hash = ('6cc9e7d128fd4fa1fd01c883af67593cae8072c3239a0b8b6ace857f3538a92d')
+        image_path = self.fetch_asset(image_url, asset_hash=image_hash,
+                                      algorithm='sha256')
+
+        self.do_test_arm_aspeed_buidroot_start(image_path, '0xf00')
+        self.do_test_arm_aspeed_buidroot_poweroff()
-- 
2.35.3

