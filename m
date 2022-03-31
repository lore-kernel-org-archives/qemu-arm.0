Received: by 2002:a05:6512:e9d:0:0:0:0 with SMTP id bi29csp1615912lfb;
        Thu, 31 Mar 2022 01:27:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwnjiC5gEOi/61h6j178cXiwQ+DIkOvoFivrD6a4Z/DFFvqaOuhwawjbpSQNm7MInXeIox7
X-Received: by 2002:ac8:4e48:0:b0:2e1:ce40:3d81 with SMTP id e8-20020ac84e48000000b002e1ce403d81mr3292405qtw.78.1648715225943;
        Thu, 31 Mar 2022 01:27:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1648715225; cv=none;
        d=google.com; s=arc-20160816;
        b=ffGs2O01Rc8blKhjtnH5Q2U6VKRRJjizcJFxQfSzzE3MqgTKkbXPWGzwYYfCYOMzSH
         0Yr5YVy1o71dLKhmtChPXvVrwpdVDhr0Gcnn9Vc1NA6GU+sCmvJ8ZWrvS1vlCQnHPycy
         qp48szDJnxKUMdH31qgrcbAyPQ1kM4nbhDvxcPDVVFHKn0SThIS9VheXqg9cyvgt3Se/
         jT7NpgHWOfFO88Exb1jYuh0ZRaYJvrn8KrD+jbURIWdwg0V7MX20QD1/PeuwQ7YDRefQ
         SK2SUfQPmrzoJPgs1nhhk45WE34Rl5Mjr5Z+5o5/ovLNtH6Cx1MV2ohSVGBQ75m0+fj6
         8cXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=LZQ+YUcvmEXVpEUNL9jnNx1bm4uVCPmnOaCeLLeBXVg=;
        b=S9QP9AfJUyrJbEz0QszTc6lZ9JEM51cNWueW01cuK66YBkAZoV+2mjHvkxd7P4UpYa
         OBEkvLhsAMOk43w+peEcBG5OWYmPWhMsxR5a4WIUZX23BAmY0SyUEF0quXZZMoEJjgHY
         oTD+PY/mbBy/pzbqft2bC82YTPVvh8o3AxHpJ6Nco+UVTGcaDMyJB7qYzb60OimrqAoY
         Ju+GPBxLYVssKkeZox0WSBKPa7PQ3WhL9LiLfOOq2+drxnY++LlEsRiHhUhkgUpdxoVr
         9WsG+NEe7tsF/fFqxleNXw/+yHRJxFQi0aklmz57pwQzi8TM35lpY8znlo8GARCAQkrZ
         pz4A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ay17-20020a056214049100b00440e46a7d04si12447235qvb.418.2022.03.31.01.27.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 31 Mar 2022 01:27:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:38202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nZq93-0002vt-Cc
	for alex.bennee@linaro.org; Thu, 31 Mar 2022 04:27:05 -0400
Received: from eggs.gnu.org ([209.51.188.92]:57298)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1nZpzU-0002CO-7o; Thu, 31 Mar 2022 04:17:12 -0400
Received: from twspam01.aspeedtech.com ([211.20.114.71]:38843)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1nZpzR-00017T-0D; Thu, 31 Mar 2022 04:17:11 -0400
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 22V84u4A054265;
 Thu, 31 Mar 2022 16:04:56 +0800 (GMT-8)
 (envelope-from jamin_lin@aspeedtech.com)
Received: from localhost.localdomain (192.168.70.87) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 31 Mar
 2022 16:15:53 +0800
From: Jamin Lin <jamin_lin@aspeedtech.com>
To: Alistair Francis <alistair@alistair23.me>, Peter Maydell
 <peter.maydell@linaro.org>, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?=
 <clg@kaod.org>, Andrew Jeffery <andrew@aj.id.au>, Joel Stanley
 <joel@jms.id.au>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>, "Wainer dos
 Santos Moschetta" <wainersm@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 "open list:STM32F205" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
Subject: [PATCH v2 9/9] test/avocado/machine_aspeed.py: Add ast1030 test case
Date: Thu, 31 Mar 2022 16:15:45 +0800
Message-ID: <20220331081545.7140-10-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220331081545.7140-1-jamin_lin@aspeedtech.com>
References: <20220331081545.7140-1-jamin_lin@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [192.168.70.87]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 22V84u4A054265
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
X-TUID: 3FGxaJOnl9zs

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

