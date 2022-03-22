Received: by 2002:a05:6512:e9d:0:0:0:0 with SMTP id bi29csp1219101lfb;
        Mon, 21 Mar 2022 19:57:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzxeZUxOBs3hbq62JiI5sPboZe4Q0cuKazIdnQmmgvqavhd3e/qRko0tVlkj5YoC1VGzFu9
X-Received: by 2002:a05:6214:d82:b0:440:efb8:cbb7 with SMTP id e2-20020a0562140d8200b00440efb8cbb7mr16461237qve.65.1647917843769;
        Mon, 21 Mar 2022 19:57:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1647917843; cv=none;
        d=google.com; s=arc-20160816;
        b=fHUqob6MZoTlie/l0ATNFkt91eYq40JvDpWjs2eXYm7XLdqezJVnXRo1wC4te19WwF
         ApVMTXiZyy89eqxTxRD49b9kvs4nGJefRwb7A8zCx3K+x8MC4UR6WgYu+0vDXUqXQO0E
         IHqH2hd1/70Wh0AlG2CIPkO3pARMwcVb2w5CMRi9j/mHV7cfEh8HWG0Rdx35metngyDW
         aZPHZnpwStGt846ZtrxFrs06fdHe2gj8xy7C6wsslNFqQ1sNPM/pqM7T6YOROO+WkZ8e
         XisaXyQnHl+mMjWlRr1AinKbVpmzdTLW84lWPIj5Teyuwq1mMK9gA17ErpQuM0d/+EXo
         TUvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:references
         :in-reply-to:message-id:date:subject:to:from;
        bh=4JGoL3Bel0N8lECuOpBiSzPvEpLOOLH5yTSv0zrvQrI=;
        b=J66IMvyKSjR4d3k5/I2BOBDOwu4MwmFiy2Ob1MsAV6looQVKYSY1QIhEaIWzEuZFbP
         F12KIsDOURJK19EbprT+3R8MSGChc51gn4hS+GaMabsX+Ef7Yqc0Lhlzf0f2OgCpPHXV
         RX0LflbZEfxvdiGJIJIN3h47pecPwRlAKjQDlcEjGBe0eHohf9tQZNA+Ar7wSgCyBepV
         hlNkQpq81WoR+9ObFz9l2zfS4XavPjaOY3kBRIMSet2cTUnquO+TfogJZcLZmKJ4Hrn7
         AbB8GBnZOS4P+BYMYBQZmDBQYz2l/gIEIjS+6RYTjYIo5bK8Fd4kptNl0BtoPz6s8Cs/
         VFlA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h15-20020a05620a244f00b0067e6731ab6asi2814888qkn.320.2022.03.21.19.57.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 21 Mar 2022 19:57:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:47480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nWUi3-0001Hj-A0
	for alex.bennee@linaro.org; Mon, 21 Mar 2022 22:57:23 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1nWUe7-0003mu-Vj; Mon, 21 Mar 2022 22:53:20 -0400
Received: from twspam01.aspeedtech.com ([211.20.114.71]:2991)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1nWUe5-0001xe-QB; Mon, 21 Mar 2022 22:53:19 -0400
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 22M2fXAY078453;
 Tue, 22 Mar 2022 10:41:33 +0800 (GMT-8)
 (envelope-from jamin_lin@aspeedtech.com)
Received: from localhost.localdomain (192.168.70.87) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 22 Mar
 2022 10:52:01 +0800
From: Jamin Lin <jamin_lin@aspeedtech.com>
To: Alistair Francis <alistair@alistair23.me>, Peter Maydell
 <peter.maydell@linaro.org>, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?=
 <clg@kaod.org>, Andrew Jeffery <andrew@aj.id.au>, Joel Stanley
 <joel@jms.id.au>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>, "Wainer dos
 Santos Moschetta" <wainersm@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 "open list:STM32F205" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
Subject: [PATCH v1 9/9] test/avocado/machine_aspeed.py: Add ast1030 test case
Date: Tue, 22 Mar 2022 10:51:54 +0800
Message-ID: <20220322025154.3989-10-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220322025154.3989-1-jamin_lin@aspeedtech.com>
References: <20220322025154.3989-1-jamin_lin@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [192.168.70.87]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 22M2fXAY078453
Received-SPF: pass client-ip=211.20.114.71;
 envelope-from=jamin_lin@aspeedtech.com; helo=twspam01.aspeedtech.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: jamin_lin@aspeedtech.com, troy_lee@aspeedtech.com,
 steven_lee@aspeedtech.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: GGwFnicBcwN+

Add test case to test "ast1030-evb" machine with zephyr os

Signed-off-by: Troy Lee <troy_lee@aspeedtech.com>
Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
Signed-off-by: Steven Lee <steven_lee@aspeedtech.com>
---
 tests/avocado/machine_aspeed.py | 36 +++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)
 create mode 100644 tests/avocado/machine_aspeed.py

diff --git a/tests/avocado/machine_aspeed.py b/tests/avocado/machine_aspeed.py
new file mode 100644
index 0000000000..33090af199
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
2.17.1

