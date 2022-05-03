Received: by 2002:a19:3859:0:0:0:0:0 with SMTP id d25csp1229763lfj;
        Tue, 3 May 2022 00:11:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwW4hhX0Ef3FDwoaC/RczDFsgr9ryBjIlGOH9UmTHb7lbxD+si908oFQUMhbiBUhyPn8hx+
X-Received: by 2002:ad4:4345:0:b0:456:915e:9bcc with SMTP id q5-20020ad44345000000b00456915e9bccmr12329217qvs.109.1651561891104;
        Tue, 03 May 2022 00:11:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1651561891; cv=none;
        d=google.com; s=arc-20160816;
        b=QVJMMpdsS8VwIUMJF1xwyjYxJLMolTa80Rew41gWOrSd14de6+fqaNqmNtshRnyqzD
         24eM1qq4pv+m6C2bCOJl/AaGabNfoRflE2TKL9J0ruc/mIiiFGae2QmrWtWe+MaYcF2V
         PsUo7JUb0LRLSTjAtYFO7OUC/9Eci2N0epLvlrNl9qGjubB0he26vu82YeXxcjp268o7
         gcCjgCBEPu3nUFK1+aSzQ6zGK/QwYfASVkodUQr7AS1JNGIGFTaCN4T3LzPHOhxvZjUi
         VNlemUzOZWwFn70iuVHELy/fXIvKervpsFXJHt8WrJc0+o6AhdsafNk4xPNTqZY2T+re
         99Qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=lsSGOhHISTgdT9RI6jvzvZMTAAnY6Ld3qjJHie/FwX4=;
        b=eR/kqGkV+o7NWqQ3lNtUvGKT1cQUkSoJjp06OhVaVH+GK94ODGx/2q+ob//AvEbIeW
         UHn3DPBwJ94fjBY8iiL4Y9ppPS5jA12I/Uy8Sb5oWY/WKIHDXOr+um7nFlh/0Ry5RCjh
         iLZ6VfGNIZBGOy2hi51saZNkKtKRiGWVkqVDN4/VJuwMwvA12pFOVTWOi1it8bg/JPH8
         UMTyC0WbJAYq3dtckvrt41SvlKe3fKYgryH/n9PABa/tJvSFem6OWApIml9pr8k/q3dL
         EUKH1dDBHUeGv6wXaPFN6U8+CchPRFXUpIyyt8VGpBZUsgmB3gRReVG0gjGJ5v2hHWed
         kB+g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h10-20020ac8584a000000b002f3695727fbsi7959462qth.728.2022.05.03.00.11.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 03 May 2022 00:11:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:52326 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nlmh0-0003WK-I3
	for alex.bennee@linaro.org; Tue, 03 May 2022 03:11:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49146)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=XF6a=VL=kaod.org=clg@ozlabs.org>)
 id 1nlmVQ-0003Ou-5Y; Tue, 03 May 2022 02:59:36 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:39725)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=XF6a=VL=kaod.org=clg@ozlabs.org>)
 id 1nlmVO-0007Vr-BL; Tue, 03 May 2022 02:59:31 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4KsrRg6nb5z4xXh;
 Tue,  3 May 2022 16:59:27 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4KsrRd4kbdz4yST;
 Tue,  3 May 2022 16:59:25 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Jamin Lin <jamin_lin@aspeedtech.com>, Troy Lee <troy_lee@aspeedtech.com>,
 Steven Lee <steven_lee@aspeedtech.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PULL 13/19] test/avocado/machine_aspeed.py: Add ast1030 test case
Date: Tue,  3 May 2022 08:58:42 +0200
Message-Id: <20220503065848.125215-14-clg@kaod.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220503065848.125215-1-clg@kaod.org>
References: <20220503065848.125215-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=XF6a=VL=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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
X-TUID: fU1P9sl4y3M3

From: Jamin Lin <jamin_lin@aspeedtech.com>

Add test case to test "ast1030-evb" machine with zephyr os

Signed-off-by: Troy Lee <troy_lee@aspeedtech.com>
Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
Signed-off-by: Steven Lee <steven_lee@aspeedtech.com>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Message-Id: <20220401083850.15266-10-jamin_lin@aspeedtech.com>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 tests/avocado/machine_aspeed.py | 36 +++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)
 create mode 100644 tests/avocado/machine_aspeed.py

diff --git a/tests/avocado/machine_aspeed.py b/tests/avocado/machine_aspeed.py
new file mode 100644
index 000000000000..33090af19940
--- /dev/null
+++ b/tests/avocado/machine_aspeed.py
@@ -0,0 +1,36 @@
+# Functional test that boots the ASPEED SoCs with firmware
+#
+# Copyright (C) 2022 ASPEED Technology Inc
+#
+# This work is licensed under the terms of the GNU GPL, version 2 or
+# later.  See the COPYING file in the top-level directory.
+
+from avocado_qemu import QemuSystemTest
+from avocado_qemu import wait_for_console_pattern
+from avocado_qemu import exec_command_and_wait_for_pattern
+from avocado.utils import archive
+
+
+class AST1030Machine(QemuSystemTest):
+    """Boots the zephyr os and checks that the console is operational"""
+
+    timeout = 10
+
+    def test_ast1030_zephyros(self):
+        """
+        :avocado: tags=arch:arm
+        :avocado: tags=machine:ast1030-evb
+        """
+        tar_url = ('https://github.com/AspeedTech-BMC'
+                   '/zephyr/releases/download/v00.01.04/ast1030-evb-demo.zip')
+        tar_hash = '4c6a8ce3a8ba76ef1a65dae419ae3409343c4b20'
+        tar_path = self.fetch_asset(tar_url, asset_hash=tar_hash)
+        archive.extract(tar_path, self.workdir)
+        kernel_file = self.workdir + "/ast1030-evb-demo/zephyr.elf"
+        self.vm.set_console()
+        self.vm.add_args('-kernel', kernel_file,
+                         '-nographic')
+        self.vm.launch()
+        wait_for_console_pattern(self, "Booting Zephyr OS")
+        exec_command_and_wait_for_pattern(self, "help",
+                                          "Available commands")
-- 
2.35.1

