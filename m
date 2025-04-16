Received: by 2002:a17:504:14cd:b0:1be9:327d:8ee3 with SMTP id g13csp3087911njc;
        Tue, 15 Apr 2025 20:45:04 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXYegGjU2rvCOT+gwRdnrFKfX6+YGkKgcMEweP7bdUDqpna4GWGbZ6uBAbMPLGtfJZvk9xK4w4YPcG2LQ==@linaro.org
X-Google-Smtp-Source: AGHT+IGpR6Py+Rtkgx5oa5pWALK5BqWat7CnAfp9ezaCaGJ8Jb14ij/zVJVoPpLvF+BN4yBW+6us
X-Received: by 2002:a05:6214:2a4f:b0:6e8:fac2:2e95 with SMTP id 6a1803df08f44-6f2b2f421admr3948936d6.11.1744775104005;
        Tue, 15 Apr 2025 20:45:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1744775103; cv=none;
        d=google.com; s=arc-20240605;
        b=Yt8gpTzM3ZqVe2Nh4LaeQzwcOkYg3p1c4e0X3QaEuRS4OxWeKQGTLOy9kRfhG0GwJQ
         eVFAiiRma5/Mfxpjo2p8CWLZGX9Jfm0Diuxhu9BZpVjL5YTE+/Hstem1GgjR7i3w1UYI
         u39ayTPselIpG0QElTQMeQZ6xEfITiWa+OACuhVHYsZS7iYYDStLf4CqzSYkw9F1nf+z
         VIqsFohJlbWzSYY7tT3i/RYW6Yt/cATZwFs1PpItB78PpOv+5glJm2GGUFPa608zE0Hr
         1O+taRV/dM4KG8bE3hZvB4Am4LAdT0gaMSFwd1qTp8xWRzrtbwXUaz/a0q3hdkqJzfMz
         FDCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=Am4gEmBaEvo/cqm32zmKRmD6TCLbQQRLfMAaxVkpX88=;
        fh=9slMQvAVAaDbZF94sUZsatNqTIKawFKtbOHuc7HAk0w=;
        b=CqevQZ9+2hOIK30+aI5O/is+aIPqFSFVRfU+glsBoWT8xDegVXcgVi7KgfDYkbOThu
         gBcITZJiqZ6QoCBWygdaNitlLiAPqAYl9WYhCMmJwuqT32oaKdiCn1V18YiAhvaSmzvP
         TxPqIG2O+1KMXGeFbCvy7CyVxIsiDDFoTnTaUt+rjuFGosKY7DKifpp73h02+mwB5OMt
         4VQyIxxnqY3yo7c/sBD3uagUGEvlB5weZN+TdCAZ0nvj3TayIaZE87wbgLzas8SaXfBx
         C+3qH6BzfL2lnw5+Sm7oIAkQI6VZZoAfcdk3kAcPJZnXIbTOafUQwYpfOuAc/Di6Datp
         kgVQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6f0dea0a3ddsi143959976d6.397.2025.04.15.20.45.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 15 Apr 2025 20:45:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1u4thc-0002HS-FU; Tue, 15 Apr 2025 23:44:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1u4thK-000238-PS; Tue, 15 Apr 2025 23:44:28 -0400
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1u4thI-0006uD-FJ; Tue, 15 Apr 2025 23:44:25 -0400
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
Subject: [PATCH v3 09/10] tests/functional/aspeed: Add to test vbootrom for
 AST2700
Date: Wed, 16 Apr 2025 11:43:24 +0800
Message-ID: <20250416034327.315714-10-jamin_lin@aspeedtech.com>
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
X-TUID: ctUhh0NOVIMi

Add the AST2700 functional test to boot using the vbootrom image
instead of manually loading boot components with -device loader.
The boot ROM binary is now passed via the
-bios option, using the image located in pc-bios/ast27x0_bootrom.bin.

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
---
 tests/functional/test_aarch64_aspeed.py | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/tests/functional/test_aarch64_aspeed.py b/tests/functional/test_aarch64_aspeed.py
index 337d701917..85789c1b1d 100755
--- a/tests/functional/test_aarch64_aspeed.py
+++ b/tests/functional/test_aarch64_aspeed.py
@@ -94,6 +94,14 @@ def start_ast2700_test(self, name):
         exec_command_and_wait_for_pattern(self, 'root', 'Password:')
         exec_command_and_wait_for_pattern(self, '0penBmc', f'root@{name}:~#')
 
+    def start_ast2700_test_vbootrom(self, name):
+        self.vm.add_args('-bios', 'ast27x0_bootrom.bin')
+        self.do_test_aarch64_aspeed_sdk_start(
+                self.scratch_file(name, 'image-bmc'))
+        wait_for_console_pattern(self, f'{name} login:')
+        exec_command_and_wait_for_pattern(self, 'root', 'Password:')
+        exec_command_and_wait_for_pattern(self, '0penBmc', f'root@{name}:~#')
+
     def test_aarch64_ast2700_evb_sdk_v09_06(self):
         self.set_machine('ast2700-evb')
 
@@ -108,5 +116,12 @@ def test_aarch64_ast2700a1_evb_sdk_v09_06(self):
         self.start_ast2700_test('ast2700-default')
         self.do_ast2700_i2c_test()
 
+    def test_aarch64_ast2700a1_evb_sdk_vboottom_v09_06(self):
+        self.set_machine('ast2700a1-evb')
+
+        self.archive_extract(self.ASSET_SDK_V906_AST2700A1)
+        self.start_ast2700_test_vbootrom('ast2700-default')
+        self.do_ast2700_i2c_test()
+
 if __name__ == '__main__':
     QemuSystemTest.main()
-- 
2.43.0

