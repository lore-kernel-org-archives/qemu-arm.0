Received: by 2002:a17:505:840c:b0:1be9:327d:8ee3 with SMTP id lq12csp729071njc;
        Wed, 12 Mar 2025 22:47:22 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVeZuh1ar9dnxV2ZGO5eIB502PXd6US9ZWi8yJ+ypwXfvXnpESEV4RWC0jHvhn3VYz7+M4OGQ2HEVaWmA==@linaro.org
X-Google-Smtp-Source: AGHT+IGO1BlN+COZWEqtncoF7X+8SgHpgY6ERtiQt3h3rfJ/h+1HwPcqgcOCmcigEdZSyDtA5Dfu
X-Received: by 2002:ac8:7d03:0:b0:476:91f1:9e5 with SMTP id d75a77b69052e-47691f10b54mr215539411cf.50.1741844841791;
        Wed, 12 Mar 2025 22:47:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1741844841; cv=none;
        d=google.com; s=arc-20240605;
        b=ajiQ0PpCM7HL/Sm0Qpb46kNssUgdmX5JoDuA6gZDgQuG7zkyig4b3lUlqziK4bYkr0
         SG4A5cKiiYaQUUvQVUfQiJcSJv8LUpVpFLspO+iO5n0ruVeJ5iGCuEEqZvMF6/QcFz++
         ueD1yRXlkMmrXQWYTL7yoPs7J0cYPbXxa3Uyfx24efVTkuEz1kEyDl6qiLOqQio95bBP
         YBFCL0yfrRZlhhZ2iFsfknfwHAZLCcpUyO/AB42Fs2CuELk3q6JqRGwcb123DEpF42iN
         I3PGHSXCcJNphaah9F18YGBMu3ccf5AdrRnLRNJdK1nXELZ12C3J/i1lDaEtCNzHiX/Z
         UzRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=dvAKwO7R5+IuTjYLFKzgRi/88zsZM9AC6bw+utUV2dM=;
        fh=NwMdySSevMv+4zB5gT5UiU9uLqpwDS+7odbjbNLg6yI=;
        b=EyV6FXqovZfMvFrAvINCW9exan9mLmy4L+/V5dXf/razvjp2v8+LAjPRSLrOpPN6Kt
         gekPF2PaOTfiUM+KzriSGYm81z0BRFxctldlW3jzwmM8ZXjUKOV6MXla6NSfpq8pEuzD
         dx1jorlF6NbfBAV77s3TguBs684rkDEeOtRbZ6vuK9mJrnjDHlMaO7XQvF/K3WfQhKv/
         sHSQP8eQDrTY7OI8DkljZss4TEU9EC3WBssfEUzJWU92q+pu+YPQIuKxcwziw+xfNWaR
         J62JCHRqpDc3NeDEvx9rE2P18kYchxr9sUJFdnvgH9KxgGRBLOK+XmfKiAJJrc/V4tiC
         F/Iw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-476bb880ea3si8573401cf.647.2025.03.12.22.47.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 12 Mar 2025 22:47:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tsbOw-00059e-Bq; Thu, 13 Mar 2025 01:46:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven_lee@aspeedtech.com>)
 id 1tsbOg-0004wZ-Mc; Thu, 13 Mar 2025 01:46:23 -0400
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven_lee@aspeedtech.com>)
 id 1tsbOe-0005Ve-Uq; Thu, 13 Mar 2025 01:46:22 -0400
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Thu, 13 Mar
 2025 13:40:24 +0800
Received: from mail.aspeedtech.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Thu, 13 Mar 2025 13:40:24 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Troy Lee <leetroy@gmail.com>, Jamin Lin
 <jamin_lin@aspeedtech.com>, Andrew Jeffery <andrew@codeconstruct.com.au>,
 Joel Stanley <joel@jms.id.au>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>, 
 "open list:All patches CC here" <qemu-devel@nongnu.org>
CC: <troy_lee@aspeedtech.com>, <yunlin.tang@aspeedtech.com>
Subject: [PATCH 12/13] tests/function/aspeed: Add functional test for
 AST2700FC A1
Date: Thu, 13 Mar 2025 13:40:16 +0800
Message-ID: <20250313054020.2583556-13-steven_lee@aspeedtech.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250313054020.2583556-1-steven_lee@aspeedtech.com>
References: <20250313054020.2583556-1-steven_lee@aspeedtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: pass client-ip=211.20.114.72;
 envelope-from=steven_lee@aspeedtech.com; helo=TWMBX01.aspeed.com
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
Reply-to:  Steven Lee <steven_lee@aspeedtech.com>
From:  Steven Lee via <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: wcKIAVf4qEtp

Add functional test for AST2700a1-fc machine.

Signed-off-by: Steven Lee <steven_lee@aspeedtech.com>
Change-Id: I87584164b2632c58d2e051fd92d9e280347bcf19
---
 tests/functional/test_aarch64_ast2700fc.py | 38 +++++++++++++++++-----
 1 file changed, 30 insertions(+), 8 deletions(-)

diff --git a/tests/functional/test_aarch64_ast2700fc.py b/tests/functional/test_aarch64_ast2700fc.py
index 243b74d77e..b54346a57f 100755
--- a/tests/functional/test_aarch64_ast2700fc.py
+++ b/tests/functional/test_aarch64_ast2700fc.py
@@ -14,6 +14,9 @@
 
 
 class AST2700fcMachineSDK(QemuSystemTest):
+    ASSET_SDK_V905_AST2700 = Asset(
+            'https://github.com/AspeedTech-BMC/openbmc/releases/download/v09.05/ast2700-default-obmc.tar.gz',
+            'c1f4496aec06743c812a6e9a1a18d032f34d62f3ddb6956e924fef62aa2046a5')
     ASSET_SDK_V905_AST2700_A0 = Asset(
             'https://github.com/AspeedTech-BMC/openbmc/releases/download/v09.05/ast2700-a0-default-obmc.tar.gz',
             'cfbbd1cce72f2a3b73b9080c41eecdadebb7077fba4f7806d72ac99f3e84b74a')
@@ -81,10 +84,16 @@ def start_ast2700fc_test(self, name):
             self.vm.add_args('-device',
                              f'loader,addr=0x430000000,cpu-num={i}')
 
-        load_elf_list = {
-            'ssp': self.scratch_file('ast2700-a0-ssp-tsp', 'ast2700-ssp.elf'),
-            'tsp': self.scratch_file('ast2700-a0-ssp-tsp', 'ast2700-tsp.elf')
-        }
+        if name == 'ast2700-a0-default':
+            load_elf_list = {
+                'ssp': self.scratch_file('ast2700-a0-ssp-tsp', 'ast2700-ssp.elf'),
+                'tsp': self.scratch_file('ast2700-a0-ssp-tsp', 'ast2700-tsp.elf')
+            }
+        else:
+            load_elf_list = {
+                'ssp': self.scratch_file(name, 'ast2700-ssp.elf'),
+                'tsp': self.scratch_file(name, 'ast2700-tsp.elf')
+            }
 
         for cpu_num, key in enumerate(load_elf_list, start=4):
             file = load_elf_list[key]
@@ -119,14 +128,27 @@ def start_ast2700fc_test(self, name):
         exec_command_and_wait_for_pattern(self, '\012', 'ssp:~$')
         exec_command_and_wait_for_pattern(self, 'version',
                                           'Zephyr version 3.7.1')
-        exec_command_and_wait_for_pattern(self, 'md 72c02000 1',
-                                          '[72c02000] 06000103')
+        if name == 'ast2700-a0-default':
+            exec_command_and_wait_for_pattern(self, 'md 72c02000 1',
+                                              '[72c02000] 06000103')
+        else:
+            exec_command_and_wait_for_pattern(self, 'md 72c02000 1',
+                                              '[72c02000] 06010103')
         self.do_test_aarch64_ast2700fc_tsp_start()
         exec_command_and_wait_for_pattern(self, '\012', 'tsp:~$')
         exec_command_and_wait_for_pattern(self, 'version',
                                           'Zephyr version 3.7.1')
-        exec_command_and_wait_for_pattern(self, 'md 72c02000 1',
-                                          '[72c02000] 06000103')
+        if name == 'ast2700-a0-default':
+            exec_command_and_wait_for_pattern(self, 'md 72c02000 1',
+                                              '[72c02000] 06000103')
+        else:
+            exec_command_and_wait_for_pattern(self, 'md 72c02000 1',
+                                              '[72c02000] 06010103')
+
+    def test_aarch64_ast2700fc_sdk_v09_05(self):
+        self.set_machine('ast2700fc-a1')
+        self.archive_extract(self.ASSET_SDK_V905_AST2700)
+        self.start_ast2700fc_test('ast2700-default')
 
     def test_aarch64_ast2700fc_a0_sdk_v09_05(self):
         self.set_machine('ast2700fc-a0')
-- 
2.34.1

