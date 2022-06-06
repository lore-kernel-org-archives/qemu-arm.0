Received: by 2002:a19:ee12:0:0:0:0:0 with SMTP id g18csp1461116lfb;
        Mon, 6 Jun 2022 08:42:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwu5e9y9FfW10aC7wRKFX6Am5kDSJKrpkG2Kb9YEmS8wR9CuUgNPnX87oVK19olCRxvSr2w
X-Received: by 2002:a37:581:0:b0:6a6:c190:deb5 with SMTP id 123-20020a370581000000b006a6c190deb5mr2841136qkf.358.1654530145487;
        Mon, 06 Jun 2022 08:42:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654530145; cv=none;
        d=google.com; s=arc-20160816;
        b=QM5xPiOU/hegz4ESM6XJVH043VD1YtuQNYWn55YS3uq6jtUTUJEaCJ5h5Z3cQbWqfu
         YZpYBa62+xIGhMaSIn+bE1PyXrGbhDCOG9RkAZxgIwrtBjevgjlWCeb87MgJ5HpUasld
         V19jJs9+x9SNCEZbiEKq9/anliLt8EHU4YO2pUNHkmd+Fff5N5ctpnkhBPh+g056n+2B
         XvXhN5lUO5m5IWHgB7ldG3FlV+E9FlqtZanfDKmYIl7urPm2S2J+lzgj5ULZoAX38KLM
         xNO6M06C3mTNOiSczCjG46EUc9GffCHjzVtm8MOODsAJJArjB5qE1t532aEeuUnWXXY+
         BXUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=h7uXMAWf1854+mN+qbV/e1Id1Z0XeFV+Kl+LX9TDUb4=;
        b=KLhbicg+FqG9J+sTU3xZmPyLv8qYXbToBqrQg3AUx2Mv3t8BS0gfuihs8TzltmmrfV
         YTTBFaRgId0HLsACCj6ZAr+8poSeafuwdNHPw7P6exqLYj+2Fc3qp8iZg2QIsTbJLg1g
         tkPQwliHdlKqhz2jcxpg1eBR4kzH7xWadmrj+I1R4IqKP7guDT1tWCJuJIiQsfySAEwx
         4Hfpgx++JtxKEW9j64DP0XorYw+WTYUPpx6ZWV7nkcEQUn6nvCtZcP8SW4ivWqO379e8
         x1/psiCljr89YOYBJtARiIaA2hC4zV3jpkjaAEYS6grMEEN/Lcg9hJKtdFQRUBOhwRuA
         t2nA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d13-20020a05622a05cd00b002f917a19c05si8020040qtb.341.2022.06.06.08.42.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 Jun 2022 08:42:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:51414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nyEs3-00082R-VR
	for alex.bennee@linaro.org; Mon, 06 Jun 2022 11:42:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=gtQ3=WN=kaod.org=clg@ozlabs.org>)
 id 1nyELY-00064z-7r; Mon, 06 Jun 2022 11:08:50 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:46583)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=gtQ3=WN=kaod.org=clg@ozlabs.org>)
 id 1nyELW-000679-4x; Mon, 06 Jun 2022 11:08:47 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4LGxhV64csz4xZK;
 Tue,  7 Jun 2022 01:08:42 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4LGxhP3jpYz4xZY;
 Tue,  7 Jun 2022 01:08:37 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Joe Komlodi <komlodi@google.com>,
 Troy Lee <troy_lee@aspeedtech.com>, Jamin Lin <jamin_lin@aspeedtech.com>,
 Steven Lee <steven_lee@aspeedtech.com>,
 Klaus Jensen <k.jensen@samsung.com>, Peter Delevoryas <pdel@fb.com>,
 Corey Minyard <cminyard@mvista.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Damien Hedde <damien.hedde@greensocs.com>,
 Andrew Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH 09/21] test/avocado/machine_aspeed.py: Add tests using
 buildroot images
Date: Mon,  6 Jun 2022 17:07:20 +0200
Message-Id: <20220606150732.2282041-10-clg@kaod.org>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220606150732.2282041-1-clg@kaod.org>
References: <20220606150732.2282041-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=gtQ3=WN=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +tXU9QN6NHdP

Buildroot images are smaller than the OpenBMC images and faster to
run. Built from source using :

  http://patchwork.ozlabs.org/project/buildroot/list/?series=303465

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 tests/avocado/machine_aspeed.py | 52 +++++++++++++++++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/tests/avocado/machine_aspeed.py b/tests/avocado/machine_aspeed.py
index 89bfad307661..5374e7fad17a 100644
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
+                     'images/ast2500-evb/buildroot-2022.05-rc2/flash.img')
+        image_hash = ('ca1e507f493d7241d501764e315a2ba1087b9ce7e5732e84bfb6b901ed98ebdb')
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
+                     'images/ast2600-evb/buildroot-2022.05-rc2/flash.img')
+        image_hash = ('122639a468a127d011e6f280cf4e6fbd9ee1e8d27d21e9f115912d1c344cc671')
+        image_path = self.fetch_asset(image_url, asset_hash=image_hash,
+                                      algorithm='sha256')
+
+        self.do_test_arm_aspeed_buidroot_start(image_path, '0xf00')
+        self.do_test_arm_aspeed_buidroot_poweroff()
-- 
2.35.3

