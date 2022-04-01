Received: by 2002:a05:6512:e9d:0:0:0:0 with SMTP id bi29csp576201lfb;
        Thu, 31 Mar 2022 20:54:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz0i0E3jq88Htv3gLP+Rxt2Ni7InPvPPg58WrreUyiYXBY6m1H8dYRTlvLrwZp2H7IZ/0lb
X-Received: by 2002:a05:6214:2505:b0:441:8541:bc4d with SMTP id gf5-20020a056214250500b004418541bc4dmr6793170qvb.117.1648785271650;
        Thu, 31 Mar 2022 20:54:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1648785271; cv=none;
        d=google.com; s=arc-20160816;
        b=w/g7Qw0jS0VosRfQQzYoFW8bvXhVi4W0hq1P/ael+liL6u3+iREz1xiHCAQisaPygE
         hhOufvsqdDcTny54NgvZy6lpg6oikhwQIb1j+Un4mbR3Sgh4vBRYF39OS9/TwbFWIdr8
         qEYZtnavRVQ0t4aLG/MtdDe1l5r0zeFrBGDutnBr5eN5U7Xxk25erPViZIeziE1feGE9
         Z+MSKTHv3F7yTN2fn8CLwitPTl2xPn4HDdWpotdbHy2kH9YR+EeDQLeA/oIizABWP3LE
         v3WUuaYIkaD0AB/NuWIZW1fAZlluXGDj01I4k4YHNGV9BFJ9e0l8YI3mjIlTP/03/g2b
         ANJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=LZQ+YUcvmEXVpEUNL9jnNx1bm4uVCPmnOaCeLLeBXVg=;
        b=ebqUzlcfqYOYP+/W8JKKh5tiJ4/Nzj9b1RKXLtWd6fvFYvhGzHzZEiK2lmeXUSRh78
         lpRzX8e90I6m1tphSGtQdf+zGeia+ivpcBr3oQdkEDEC4JaSW3vlQTBGEybNXlzfR4Gj
         OElIOK2cEFQoSYHUYxbxUkRca3dTPdnk+NG+1O2KcBovLPV8CIMR45R2Tjmbhwod+0MK
         u0zQvodmg3WpaoyqoUSViT2BvPiFCz/d8PMbCnlYY3Yu8+HePJY05NN+XeJ7a7mGwPmp
         6Y7xjnseED0yTROJzpyh4lYDsm63bFnt7IGFk9GnK6ogP15h+REDY9iJoUjVV0UF6sMt
         S2Xg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z9-20020ac81009000000b002e1fbf3bed7si720678qti.200.2022.03.31.20.54.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 31 Mar 2022 20:54:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:48664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1na8Mp-0007oU-3W
	for alex.bennee@linaro.org; Thu, 31 Mar 2022 23:54:31 -0400
Received: from eggs.gnu.org ([209.51.188.92]:35918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1na8H4-0004J6-Sz; Thu, 31 Mar 2022 23:48:34 -0400
Received: from twspam01.aspeedtech.com ([211.20.114.71]:37362)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1na8H2-0000w5-Pb; Thu, 31 Mar 2022 23:48:34 -0400
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 2313ZuLX095964;
 Fri, 1 Apr 2022 11:35:56 +0800 (GMT-8)
 (envelope-from jamin_lin@aspeedtech.com)
Received: from localhost.localdomain (192.168.70.87) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 1 Apr
 2022 11:46:57 +0800
From: Jamin Lin <jamin_lin@aspeedtech.com>
To: Alistair Francis <alistair@alistair23.me>, Peter Maydell
 <peter.maydell@linaro.org>, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?=
 <clg@kaod.org>, Andrew Jeffery <andrew@aj.id.au>, Joel Stanley
 <joel@jms.id.au>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>, "Wainer dos
 Santos Moschetta" <wainersm@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 "open list:STM32F205" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
Subject: [PATCH v4 9/9] test/avocado/machine_aspeed.py: Add ast1030 test case
Date: Fri, 1 Apr 2022 11:46:51 +0800
Message-ID: <20220401034651.9066-10-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220401034651.9066-1-jamin_lin@aspeedtech.com>
References: <20220401034651.9066-1-jamin_lin@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [192.168.70.87]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 2313ZuLX095964
Received-SPF: pass client-ip=211.20.114.71;
 envelope-from=jamin_lin@aspeedtech.com; helo=twspam01.aspeedtech.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: jamin_lin@aspeedtech.com, troy_lee@aspeedtech.com,
 steven_lee@aspeedtech.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: It3AUQ0mQP5P

Add test case to test "ast1030-evb" machine with zephyr os

Signed-off-by: Troy Lee <troy_lee@aspeedtech.com>
Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
Signed-off-by: Steven Lee <steven_lee@aspeedtech.com>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
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

