Received: by 2002:a17:504:17c4:b0:1be9:327d:8ee3 with SMTP id o4csp2858745njd;
        Wed, 23 Apr 2025 00:26:05 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVujb87QPofrB/frV1Oe8KitxMwKu1fFCor8aqQgiwyA4b4KUW3sip/NYhwv2oUf01yUeKZp6Ku9DI3Mg==@linaro.org
X-Google-Smtp-Source: AGHT+IH12ufiVDxEkJo8DooX4+mJ75i+xHxWEwQDRgm+5hTgpO4czMwPcDruwtgYl9ugEhifA0xu
X-Received: by 2002:a05:6214:d8d:b0:6e8:8798:275d with SMTP id 6a1803df08f44-6f2c43a56d4mr295362396d6.0.1745393165729;
        Wed, 23 Apr 2025 00:26:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1745393165; cv=none;
        d=google.com; s=arc-20240605;
        b=dLor+YT0i+YJNtPx/P3ikLTNLGSxxlrs4ZMSeU6GmtCgWYp2cRX+lsHKbcyBNiT53P
         TfMZn/Dwx5F5v+xhMvYNLZwZjX+jX9vVeuZRZT6ZlCKitXyjff5pehuYe5BGnDzlDitn
         hiNkr7z1Ujy1LzA167qupfqMecmAdKeu25UIqvwV6w5Pc/QxO64umC/zPaPSFAykXk7D
         bQ3fSzV69ylmfmwD2fpAzZEK1XBEuaG7aKyN3mSMZuDfEePdxSUuft7p4Hj5sesArIIF
         cNY3bO33vq9u3udShnNs4zbL6P6/dt1jJsZavXfkn24262k/2XRfeJvCUizSon4rCKo7
         xEZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=UurvZ+3ga7HOUMpCIbLJRGgebjrsoxpcYABVcVgsFFc=;
        fh=mYa7DW7+LcAerod9KMiSdtH0/D1NqzuZXE0uoAi0+1E=;
        b=EveIAwirmJkdTc3GnvuLuzuKWne6rRwEPEb9EK+ptmLM0UeP+APtHVEl5+i1Zkjgwm
         7v1W7RkFUlZfhg7z+WWiJOXqEdCZG4KL7D087HZP1aZ7leeGiwdn2NUGwd/GYgBLFvlK
         SKa2UkqhlhAUICgvo/GeYwFVPzDwm/xEy8F0eEM2Od1gSEdPvjpDM2AnUrnq9aV/Z0XL
         HRsEcciVQayTNbIUPE4IePsfps+U2jB+5p2cyDDoPdqOZBBB9VQkpaKWxMHkH0vvOS1p
         /MMJivkGTVnJu0OCVOvR+64TFRFYkdgBN+fTZ9vTECiOCoyTlPsu3Ekisu+Hwz1vekzD
         7nVQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6f2c2c42d90si129046656d6.504.2025.04.23.00.26.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 23 Apr 2025 00:26:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1u7UTO-0002nW-PR; Wed, 23 Apr 2025 03:24:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1u7UTK-0002jZ-Fh; Wed, 23 Apr 2025 03:24:43 -0400
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1u7UTI-0001IR-NK; Wed, 23 Apr 2025 03:24:42 -0400
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
 <nabihestefan@google.com>, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?=
 <clg@redhat.com>
Subject: [PATCH v5 08/11] tests/functional/aspeed: Update test ASPEED SDK
 v09.06
Date: Wed, 23 Apr 2025 15:23:44 +0800
Message-ID: <20250423072350.541742-9-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250423072350.541742-1-jamin_lin@aspeedtech.com>
References: <20250423072350.541742-1-jamin_lin@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=211.20.114.72;
 envelope-from=jamin_lin@aspeedtech.com; helo=TWMBX01.aspeed.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
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
X-TUID: /d3KWdYHwbLU

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
Reviewed-by: Cédric Le Goater <clg@redhat.com>
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

