Received: by 2002:a17:504:6810:b0:1be9:327d:8ee3 with SMTP id f16csp1387614njm;
        Thu, 6 Mar 2025 02:42:26 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCW81WJfFXGcdiKcKMHPEnzqDABjvvHgb3SfOQNzz71yHgnvisvNv0MakwWRKwoDB46AJpdiW73dE7G+wg==@linaro.org
X-Google-Smtp-Source: AGHT+IHrSwz9btNwS9EP9VWL3xgoyJbdMgZ22Em983Sc/DtFliB1kKn57tplEOng50/LwfT1XDLQ
X-Received: by 2002:ac8:5785:0:b0:474:fb0a:63d2 with SMTP id d75a77b69052e-4750b442f0emr91939291cf.16.1741257746424;
        Thu, 06 Mar 2025 02:42:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1741257746; cv=none;
        d=google.com; s=arc-20240605;
        b=cAV/50t3vzKCgh2tpvUc6pCYsJ4t3zmFDC2uErEyWGdesnOKDvUE2NwT5MbFr7Nway
         tGfkoJsm+QbhmzAFSNZTpBCwkEc9VIhqsy8KXNYYDGff7wGQ/ohvVDKv0GkCPXvynVoA
         nTJwDseoNI4rV06x1HNN/tR4m/mTK3P6HUUtVfbRB6wJOUewT1kesFY6LvrbjQOnjgEI
         deLqktJKH6/oLlzV06oxDqQYE4kV9IOdAMXb3tbJ/snpOT1pMDVRf3OYdd3qZtTwGdoL
         QfMno+Hn7GbIbrk1gNRQihF6Zvh9zk/94882af9cmf4MiBEMilauxcUuknaimwesBNGn
         3U8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=kpraKeDF3k1nQhaKJdP2AhCDtlCBpaAPMrhFHQ4neyg=;
        fh=3cFqTtzBuOtpuAUHgGIZLk2EDwH0HGw77jNYFWHrQKI=;
        b=Pp7Qn9Mkomi9HMPQJ7cxf6g6uYAzwdF+98d3F4Cmo4vLeD/9vsNPHiSczmJFJxAGwL
         eGuSecYMbKR2MwMlwKTBFargr5GZj7l8FiKsizovmy4nTf++jRXpvN6QXT3/p2IU1uNO
         MbPJ6X39apRO4jng31gA00NxPhNubJXZTOaj4ph98QImFxc89lYYruYYljsJxl2x0GqC
         2r98mJlEz3Rxq4rbO9kcg4ta7AC+UxX4ixbXkfIdeZvH1CdjhQub8JC43e69Ja+tFFOq
         1i9BEV89w+KzVhGhXc2OC87qjfasF+Ju13U5RGojoXoFDLkCovA1qb4BYECqgyn7VGNc
         JDVw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4751daf8d16si9465241cf.237.2025.03.06.02.42.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Mar 2025 02:42:26 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tq8gF-0001tr-SA; Thu, 06 Mar 2025 05:42:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1tq8fN-0000Tm-1q; Thu, 06 Mar 2025 05:41:25 -0500
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1tq8fL-0000om-7h; Thu, 06 Mar 2025 05:41:24 -0500
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Thu, 6 Mar
 2025 18:38:56 +0800
Received: from mail.aspeedtech.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Thu, 6 Mar 2025 18:38:56 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
Subject: [PATCH v5 27/29] tests/functional/aspeed: Update test ASPEED SDK
 v09.05
Date: Thu, 6 Mar 2025 18:38:35 +0800
Message-ID: <20250306103846.429221-28-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250306103846.429221-1-jamin_lin@aspeedtech.com>
References: <20250306103846.429221-1-jamin_lin@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
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
X-TUID: Y1y2sKCA7bY6

In ASPEED SDK v09.05, the naming convention for pre-built images has been
updated. The pre-built image for AST2700 A0 has been renamed to
ast2700-a0-default, while ast2700-default is now used for AST2700 A1.

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
Reviewed-by: Cédric Le Goater <clg@redhat.com>
---
 tests/functional/test_aarch64_aspeed.py | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/tests/functional/test_aarch64_aspeed.py b/tests/functional/test_aarch64_aspeed.py
index 07b0c7c1fd..8df6a97a28 100755
--- a/tests/functional/test_aarch64_aspeed.py
+++ b/tests/functional/test_aarch64_aspeed.py
@@ -27,9 +27,9 @@ def do_test_aarch64_aspeed_sdk_start(self, image):
         wait_for_console_pattern(self, '## Loading kernel from FIT Image')
         wait_for_console_pattern(self, 'Starting kernel ...')
 
-    ASSET_SDK_V903_AST2700 = Asset(
-            'https://github.com/AspeedTech-BMC/openbmc/releases/download/v09.03/ast2700-default-obmc.tar.gz',
-            '91225f50d255e2905ba8d8e0c80b71b9d157c3609770c7a740cd786370d85a77')
+    ASSET_SDK_V905_AST2700 = Asset(
+            'https://github.com/AspeedTech-BMC/openbmc/releases/download/v09.05/ast2700-a0-default-obmc.tar.gz',
+            'cfbbd1cce72f2a3b73b9080c41eecdadebb7077fba4f7806d72ac99f3e84b74a')
 
     def start_ast2700_test(self, name):
         num_cpu = 4
@@ -89,11 +89,11 @@ def start_ast2700_test(self, name):
         exec_command_and_wait_for_pattern(self,
             'cat /sys/bus/i2c/devices/1-004d/hwmon/hwmon*/temp1_input', '18000')
 
-    def test_aarch64_ast2700_evb_sdk_v09_03(self):
+    def test_aarch64_ast2700_evb_sdk_v09_05(self):
         self.set_machine('ast2700-evb')
 
-        self.archive_extract(self.ASSET_SDK_V903_AST2700)
-        self.start_ast2700_test('ast2700-default')
+        self.archive_extract(self.ASSET_SDK_V905_AST2700)
+        self.start_ast2700_test('ast2700-a0-default')
 
 
 if __name__ == '__main__':
-- 
2.43.0

