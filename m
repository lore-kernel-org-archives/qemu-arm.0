Received: by 2002:a17:504:17c4:b0:1be9:327d:8ee3 with SMTP id o4csp2858812njd;
        Wed, 23 Apr 2025 00:26:15 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXv7zQbDb1jVCVXDgvN1B2oZztvkose5RUciX1lB5SDicF5H33Y1eGzBw7US3aJ0IqnktN963cVGhtJLw==@linaro.org
X-Google-Smtp-Source: AGHT+IFDQqVnByBgafMDHm98EUQ1W9pM0yzYyU1agxIsIcA14cKeeDDU/d5rxJ6Yex4JizOVjiJa
X-Received: by 2002:a05:622a:110e:b0:476:7f5c:e302 with SMTP id d75a77b69052e-47aec39a534mr311207851cf.11.1745393175708;
        Wed, 23 Apr 2025 00:26:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1745393175; cv=none;
        d=google.com; s=arc-20240605;
        b=Zd0YA4EKvMIHm2rkg63++yVEnv8J2tlYCaD8/T8YMhyI7ScesSX94+TR1yTCWTtbnh
         bMMrkeiwQZK+c9GSUF/AoZ5qJjdaVoQQsun+TJEd1iIm/OpZIXxLs/aJ5xlclL5Q/GtU
         NYNP1AAGT9or1ZmCQCGvP/P/vmLXp5qbjXaPpGr/dG1FjTDYVCs9o19FebhYOMVOfkqe
         //zFslD5EyeVHyqlAx89Zmt4GiJhsTKVZoEUTUduuHqT6EnwdCaEOotf5lO15bujN0Nr
         AH9STJDt9N3niHYvclccDgaceAYhyAvi3so2OoGKJ1ExYXL5+SCPX6eLtbm0KxUzn8qS
         HMJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=vg1PVUZvkgQ+E8ppw9P+TluQKsYTAIqvkdCryZl7Iyo=;
        fh=9slMQvAVAaDbZF94sUZsatNqTIKawFKtbOHuc7HAk0w=;
        b=R/q8iIY+xQaWfQd6mbIxubX2+jNUh3KyBo1b5wNePInU1ybXSQxbv0EZZgEDFPYopn
         rOmi6Xxrx7WQb5VJwVDP1UmPuDhpKflrx03+8vk0W3LhsYexAfKd7Sq+7RSUp6WkBsv2
         ZikRLd2+x07jF0Im5uI0KEXCgRqtOywpO0i/5ujCeg5eZsH2Jaw+BMiqXys55LhgZ+y2
         6qtu+iimhjaw6QUc52KjEWUfYDepqUdWzGTRGRBEa7wGOb6vryZKuXtlhUT/a1/7kAo2
         ullvi3S+itWQsfW3HCK5x1VlHphs9xh/TJ6ljpQIXiM6owdqzsjMabIruXzuBYa62qrG
         sbqA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-47ae9cd2bfcsi133678441cf.479.2025.04.23.00.26.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 23 Apr 2025 00:26:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1u7UTT-0002rJ-So; Wed, 23 Apr 2025 03:24:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1u7UTN-0002nZ-Em; Wed, 23 Apr 2025 03:24:46 -0400
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1u7UTL-0001IR-7o; Wed, 23 Apr 2025 03:24:44 -0400
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Wed, 23 Apr
 2025 15:23:53 +0800
Received: from mail.aspeedtech.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Wed, 23 Apr 2025 15:23:53 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>,
 <nabihestefan@google.com>
Subject: [PATCH v5 09/11] tests/functional/aspeed: extract boot and login
 sequence into helper function
Date: Wed, 23 Apr 2025 15:23:45 +0800
Message-ID: <20250423072350.541742-10-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250423072350.541742-1-jamin_lin@aspeedtech.com>
References: <20250423072350.541742-1-jamin_lin@aspeedtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: pass client-ip=211.20.114.72;
 envelope-from=jamin_lin@aspeedtech.com; helo=TWMBX01.aspeed.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
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
X-TUID: sxYAsktSAaB1

Extracted repeated boot and login steps into a new helper function.
No change in functional behavior.

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
---
 tests/functional/test_aarch64_aspeed.py | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/tests/functional/test_aarch64_aspeed.py b/tests/functional/test_aarch64_aspeed.py
index 337d701917..2f04655b60 100755
--- a/tests/functional/test_aarch64_aspeed.py
+++ b/tests/functional/test_aarch64_aspeed.py
@@ -25,10 +25,15 @@ def do_test_aarch64_aspeed_sdk_start(self, image):
 
         self.vm.launch()
 
+    def verify_openbmc_boot_and_login(self, name):
         wait_for_console_pattern(self, 'U-Boot 2023.10')
         wait_for_console_pattern(self, '## Loading kernel from FIT Image')
         wait_for_console_pattern(self, 'Starting kernel ...')
 
+        wait_for_console_pattern(self, f'{name} login:')
+        exec_command_and_wait_for_pattern(self, 'root', 'Password:')
+        exec_command_and_wait_for_pattern(self, '0penBmc', f'root@{name}:~#')
+
     ASSET_SDK_V906_AST2700 = Asset(
             'https://github.com/AspeedTech-BMC/openbmc/releases/download/v09.06/ast2700-a0-default-obmc.tar.gz',
             '7247b6f19dbfb700686f8d9f723ac23f3eb229226c0589cb9b06b80d1b61f3cb')
@@ -89,16 +94,12 @@ def start_ast2700_test(self, name):
         self.do_test_aarch64_aspeed_sdk_start(
             self.scratch_file(name, 'image-bmc'))
 
-        wait_for_console_pattern(self, f'{name} login:')
-
-        exec_command_and_wait_for_pattern(self, 'root', 'Password:')
-        exec_command_and_wait_for_pattern(self, '0penBmc', f'root@{name}:~#')
-
     def test_aarch64_ast2700_evb_sdk_v09_06(self):
         self.set_machine('ast2700-evb')
 
         self.archive_extract(self.ASSET_SDK_V906_AST2700)
         self.start_ast2700_test('ast2700-a0-default')
+        self.verify_openbmc_boot_and_login('ast2700-a0-default')
         self.do_ast2700_i2c_test()
 
     def test_aarch64_ast2700a1_evb_sdk_v09_06(self):
@@ -106,6 +107,7 @@ def test_aarch64_ast2700a1_evb_sdk_v09_06(self):
 
         self.archive_extract(self.ASSET_SDK_V906_AST2700A1)
         self.start_ast2700_test('ast2700-default')
+        self.verify_openbmc_boot_and_login('ast2700-default')
         self.do_ast2700_i2c_test()
 
 if __name__ == '__main__':
-- 
2.43.0

