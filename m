Received: by 2002:a17:504:14cd:b0:1be9:327d:8ee3 with SMTP id g13csp3087872njc;
        Tue, 15 Apr 2025 20:44:53 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWNeCy5TjQUgO/gkSfCi3s3FXRjHZKn62zT5d/KrLMXZwGwjDRBFYNXJojZSVjzrYi3MeqtSkzO1HCwXA==@linaro.org
X-Google-Smtp-Source: AGHT+IGolBXDoSFPIGzITKgjHKO3SuBziWzCdx2uwi3rSjVsfBQeDDN7pDbEGXXdoZB9ztoFcOSu
X-Received: by 2002:a05:622a:18aa:b0:476:8412:9275 with SMTP id d75a77b69052e-47ad81149b5mr1611241cf.35.1744775092966;
        Tue, 15 Apr 2025 20:44:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1744775092; cv=none;
        d=google.com; s=arc-20240605;
        b=I0vIv11pWRsLvzm9Lsq90sS6VD8zsm7OmOwPRjO5hoRfyIQXcgwikgmIa5bp1CT0he
         2tgsX8+qZ5OJ76c1Ul/BNDCbTNnYERKXZl7C1WzxEcSnq+RW44XZ5d2VLFjWp4fo0xrt
         JquR/o7kWRzZNREdMRZmMoUOQJk5ZNv7WC+Ez19wdWmG0uIVCr97OA89ABjOWUEHRCbo
         7FZvg3gsfiou/QbFpZ/zUNL7IgF7z6OxoaBjS3S1hPTpUpWvtTjKuVI7MJc8t1G4O2Gv
         wGSvqHgrBwG9H1IpF/8M4nnuYfOorPuEbYHV8yocO4ZC4LqcY0PmY3Yf3yZpT+sU+DDj
         Dn8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=b2893tpTguCSmYgE/AO2JikNoNcbceiUgU739H7LDQk=;
        fh=9slMQvAVAaDbZF94sUZsatNqTIKawFKtbOHuc7HAk0w=;
        b=JUvCGFm72Okp/Hi27lX9IovBSfhRUAFlHQVZszdYTM3bt7ihMrWRP4zFD+qSaCqaIa
         z+XXLCdgnzYmhVuRtJ+iOonx1kELtdE7/Ib/8eOCEF7NQRJUouRY6Qf6xNb8RWNayP2g
         0PEiFGwDBCt4K1YqMdMAOANgntg3e8VD2f2ucGtWrw16DEpqcf/fIB9PcDkkzA3tcskP
         VGQgi5e0PhJbIc2M3Z/JJxIO3aCJZ8pIDJTeWAbzKUw5pqd8GWUG5ue9FQcD/BwL1zPl
         9EKl3PaPm6TpfE0MkMIHU7WEllMijEg7hbEFrJLl4qpSUEXfDsVFiUCjjzquQ4llR9jy
         mwoA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4796edd6df0si126480651cf.428.2025.04.15.20.44.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 15 Apr 2025 20:44:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1u4thJ-0001xY-FB; Tue, 15 Apr 2025 23:44:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1u4thG-0001wN-Pl; Tue, 15 Apr 2025 23:44:22 -0400
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1u4thE-0006uD-MP; Tue, 15 Apr 2025 23:44:22 -0400
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Wed, 16 Apr
 2025 11:43:30 +0800
Received: from mail.aspeedtech.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Wed, 16 Apr 2025 11:43:30 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>,
 <nabihestefan@google.com>
Subject: [PATCH v3 08/10] tests/functional/aspeed: Update test ASPEED SDK
 v09.06
Date: Wed, 16 Apr 2025 11:43:23 +0800
Message-ID: <20250416034327.315714-9-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250416034327.315714-1-jamin_lin@aspeedtech.com>
References: <20250416034327.315714-1-jamin_lin@aspeedtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: pass client-ip=211.20.114.72;
 envelope-from=jamin_lin@aspeedtech.com; helo=TWMBX01.aspeed.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_FAIL=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-to:  Jamin Lin <jamin_lin@aspeedtech.com>
From:  Jamin Lin via <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: Y3hHwDdajjtq

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
---
 tests/functional/test_aarch64_aspeed.py | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/tests/functional/test_aarch64_aspeed.py b/tests/functional/test_aarch64_aspeed.py
index 441f7f3919..337d701917 100755
--- a/tests/functional/test_aarch64_aspeed.py
+++ b/tests/functional/test_aarch64_aspeed.py
@@ -29,13 +29,13 @@ def do_test_aarch64_aspeed_sdk_start(self, image):
         wait_for_console_pattern(self, '## Loading kernel from FIT Image')
         wait_for_console_pattern(self, 'Starting kernel ...')
 
-    ASSET_SDK_V905_AST2700 = Asset(
-            'https://github.com/AspeedTech-BMC/openbmc/releases/download/v09.05/ast2700-a0-default-obmc.tar.gz',
-            'cfbbd1cce72f2a3b73b9080c41eecdadebb7077fba4f7806d72ac99f3e84b74a')
+    ASSET_SDK_V906_AST2700 = Asset(
+            'https://github.com/AspeedTech-BMC/openbmc/releases/download/v09.06/ast2700-a0-default-obmc.tar.gz',
+            '7247b6f19dbfb700686f8d9f723ac23f3eb229226c0589cb9b06b80d1b61f3cb')
 
-    ASSET_SDK_V905_AST2700A1 = Asset(
-            'https://github.com/AspeedTech-BMC/openbmc/releases/download/v09.05/ast2700-default-obmc.tar.gz',
-            'c1f4496aec06743c812a6e9a1a18d032f34d62f3ddb6956e924fef62aa2046a5')
+    ASSET_SDK_V906_AST2700A1 = Asset(
+            'https://github.com/AspeedTech-BMC/openbmc/releases/download/v09.06/ast2700-default-obmc.tar.gz',
+            'f1d53e0be8a404ecce3e105f72bc50fa4e090ad13160ffa91b10a6e0233a9dc6')
 
     def do_ast2700_i2c_test(self):
         exec_command_and_wait_for_pattern(self,
@@ -94,17 +94,17 @@ def start_ast2700_test(self, name):
         exec_command_and_wait_for_pattern(self, 'root', 'Password:')
         exec_command_and_wait_for_pattern(self, '0penBmc', f'root@{name}:~#')
 
-    def test_aarch64_ast2700_evb_sdk_v09_05(self):
+    def test_aarch64_ast2700_evb_sdk_v09_06(self):
         self.set_machine('ast2700-evb')
 
-        self.archive_extract(self.ASSET_SDK_V905_AST2700)
+        self.archive_extract(self.ASSET_SDK_V906_AST2700)
         self.start_ast2700_test('ast2700-a0-default')
         self.do_ast2700_i2c_test()
 
-    def test_aarch64_ast2700a1_evb_sdk_v09_05(self):
+    def test_aarch64_ast2700a1_evb_sdk_v09_06(self):
         self.set_machine('ast2700a1-evb')
 
-        self.archive_extract(self.ASSET_SDK_V905_AST2700A1)
+        self.archive_extract(self.ASSET_SDK_V906_AST2700A1)
         self.start_ast2700_test('ast2700-default')
         self.do_ast2700_i2c_test()
 
-- 
2.43.0

