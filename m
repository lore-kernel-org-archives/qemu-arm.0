Received: by 2002:a17:504:749a:b0:1be9:327d:8ee3 with SMTP id a26csp511877njk;
        Wed, 16 Apr 2025 20:14:28 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV1OQsl1eJy6zRk96VZAjo/7mjS0oh58g07TEwOd/g/glFdneC83S9Hhs5tkInC8ZfQ28vVpMbWBQFy+w==@linaro.org
X-Google-Smtp-Source: AGHT+IHuDcYKv0bDVyCJSJ7WGP8ZFJK/E97SGy77mSDsolRuA4MIDWeiHxq4zWpKjsn0U3a28U7d
X-Received: by 2002:a05:620a:f10:b0:7c5:79c6:645d with SMTP id af79cd13be357-7c918fcab3fmr554164385a.11.1744859668262;
        Wed, 16 Apr 2025 20:14:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1744859668; cv=none;
        d=google.com; s=arc-20240605;
        b=U28QXOE8MFSKCWf5ZuKUoRBxmwgNxBPJQ5Tm1xqJ/ove4tr3RHRI3JuJ96j797C0uO
         k7s+gSLtxHecNWBkJ7DkMJdfeWbxg6uwAcY5FaE2QqBK5vP+ugL3RfJckm3Pmn9dlg8c
         +qDRnu1PHqhDkGdbYA1ftbt77cXQPvtKb1l8+VF/cWAm0enjEBwjIt2hhAn8PSsamq6j
         JmtP/Xdv4myDvGlENi/qk4HqaJTTKXVNKNc+2S5CUxR2k22OUnEOVwK5LYNvlhYTCRil
         vXBsYQd6c7RHQ92ynyQ1EEFfNwUcCHmgWlSh5Tp5+LyTu54jvrzvBXZ26mcwujtQKdpL
         vZYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=b2893tpTguCSmYgE/AO2JikNoNcbceiUgU739H7LDQk=;
        fh=9slMQvAVAaDbZF94sUZsatNqTIKawFKtbOHuc7HAk0w=;
        b=h64G4QfIp+EzHcgu2MfJTLQ7Pa+SosSeHRvZPsSOr6HwKaDyT3pTPaF1b7ttjNggxC
         mpimyWrpWTs5fDLT4JAq1Nl2D4K4ujm2Clh15QP6TvTHf8lzdM97PDbVA6YKKoMIIDfM
         VvL+X0adXX/DSV7fizxRd95OExEjjK7QPDWfpZ9RqJlT0BxLF7woY8NsGk2zMFTGWTR6
         bQs4tIvoLrCiChub+iK5Vi4L9FIrDxdpKOBOfJqROJbjOD91ilZeSFAXI4X+V0z52FTA
         L4lRROGWPFcz7syXIuGv8jS8at531cLNf4Z9vLoZXNE3aCA5w0DXaiOBgnG8WV0fViZT
         AIBw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c7a8a1d668si1433259185a.502.2025.04.16.20.14.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 16 Apr 2025 20:14:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1u5FgE-0001GA-4G; Wed, 16 Apr 2025 23:12:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1u5Fg9-00018L-UX; Wed, 16 Apr 2025 23:12:42 -0400
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1u5Fg4-0000cO-Ik; Wed, 16 Apr 2025 23:12:41 -0400
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Thu, 17 Apr
 2025 11:12:12 +0800
Received: from mail.aspeedtech.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Thu, 17 Apr 2025 11:12:12 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>,
 <nabihestefan@google.com>
Subject: [PATCH v4 08/10] tests/functional/aspeed: Update test ASPEED SDK
 v09.06
Date: Thu, 17 Apr 2025 11:12:05 +0800
Message-ID: <20250417031209.2647703-9-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250417031209.2647703-1-jamin_lin@aspeedtech.com>
References: <20250417031209.2647703-1-jamin_lin@aspeedtech.com>
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
Reply-to:  Jamin Lin <jamin_lin@aspeedtech.com>
From:  Jamin Lin via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: FeWdMhWqJVgi

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

