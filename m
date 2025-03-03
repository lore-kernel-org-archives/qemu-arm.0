Received: by 2002:a17:504:76a5:b0:1be9:327d:8ee3 with SMTP id sy5csp2505293njb;
        Mon, 3 Mar 2025 02:00:29 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVWXPVnOrQx2Az1yffLAf7wFxp8Q3laS1Cxdb6AVjMG5nvDUy3Q40ly9zovNZJ8GXvINfyIx685RztenA==@linaro.org
X-Google-Smtp-Source: AGHT+IHOpe5y5t2P8MVMLTcUKLFERYU1TLPYTUPiOqMn5XV3a2txJPSoqTGBl5q7Hic47zEAr3R7
X-Received: by 2002:a05:620a:3908:b0:7c0:b0e5:96e with SMTP id af79cd13be357-7c39c65cademr1756494385a.46.1740996029654;
        Mon, 03 Mar 2025 02:00:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1740996029; cv=none;
        d=google.com; s=arc-20240605;
        b=h+zrZj2zHQSG978kDXam9NSlkTjviP4/DU3I1s7oElEDGn6ZAYsgk8AxI14ocPkUmj
         wCeLYlL8KJf8nK0YYqngDiMClgShtDqiQaWG7G0etA8WOdjmMHPMBHCuH6UBp7XzjWxd
         DIGdSw4c7mBAxw37NzsPb3PMVJNtvm8MbutVVbNr8BSJV0QzL/rsjn3JXdL2QtfJ4pjn
         FiYACR6NcPLq9X87RoF5mJ8c9LpljKcmkexacGKbKouQgfctZF7XT3Szy55EfXlgOx5r
         Id+XUp7iUcnMt6sSoMTA+0zxmhJR/G3Weh1XBOxf7c2z7RbBIrqkZ1+S0sH6zfX33e0r
         F+xA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=VrTPLFqd7p16EyZjpcenz1mVAqCxFUwkITLwDGZVxZw=;
        fh=08d/IJI4U+AnOjHRYBcV+/5HqY2oyeWSX1NtojG11zk=;
        b=bVGAQqALbHf4yKkcDZFpnXjchGIpjYzuVG+OjVkkMRAIaUebIVq2H1HDyeJTYWJU8V
         6FY081ukhvS4ppx2/NJ7vcSfcKeqGUL43oehi2eMzF0Scx2rmO3HxernogjEjJpAnVnk
         /qppL6PcUHMFJ1DJTSxDmooLmUPtZXs9RT2W1grGQxc9+P5dJJXmE6VFR6MDqu94M1/2
         BQuM+23BGlvMHTH+Su4OEINDFSUWGg9Z83GbwWOQ4ycCLkeSA8wxtQ5WbqjZ9uQXFBgJ
         8HJuQx9dTRDqYR7kLvlMc/TdR7gYUsZe8Rz3A9scRP6CzvfNGQnJlRADlxFmxwjiscRW
         Jihw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c378db2a35si857063685a.606.2025.03.03.02.00.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 03 Mar 2025 02:00:29 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tp2Z6-0007ke-4n; Mon, 03 Mar 2025 04:58:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1tp2Xb-0001g9-VU; Mon, 03 Mar 2025 04:56:52 -0500
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1tp2Xa-0001zJ-A9; Mon, 03 Mar 2025 04:56:51 -0500
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Mon, 3 Mar
 2025 17:55:06 +0800
Received: from mail.aspeedtech.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Mon, 3 Mar 2025 17:55:06 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>
Subject: [PATCH v4 22/23] tests/functional/aspeed: Add test case for AST2700 A1
Date: Mon, 3 Mar 2025 17:54:50 +0800
Message-ID: <20250303095457.2337631-23-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250303095457.2337631-1-jamin_lin@aspeedtech.com>
References: <20250303095457.2337631-1-jamin_lin@aspeedtech.com>
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
X-TUID: gjdEe8QWH+Fj

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
---
 tests/functional/test_aarch64_aspeed.py | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/tests/functional/test_aarch64_aspeed.py b/tests/functional/test_aarch64_aspeed.py
index 8df6a97a28..c25c966278 100755
--- a/tests/functional/test_aarch64_aspeed.py
+++ b/tests/functional/test_aarch64_aspeed.py
@@ -31,6 +31,10 @@ def do_test_aarch64_aspeed_sdk_start(self, image):
             'https://github.com/AspeedTech-BMC/openbmc/releases/download/v09.05/ast2700-a0-default-obmc.tar.gz',
             'cfbbd1cce72f2a3b73b9080c41eecdadebb7077fba4f7806d72ac99f3e84b74a')
 
+    ASSET_SDK_V905_AST2700A1 = Asset(
+            'https://github.com/AspeedTech-BMC/openbmc/releases/download/v09.05/ast2700-default-obmc.tar.gz',
+            'c1f4496aec06743c812a6e9a1a18d032f34d62f3ddb6956e924fef62aa2046a5')
+
     def start_ast2700_test(self, name):
         num_cpu = 4
         uboot_size = os.path.getsize(self.scratch_file(name,
@@ -95,6 +99,12 @@ def test_aarch64_ast2700_evb_sdk_v09_05(self):
         self.archive_extract(self.ASSET_SDK_V905_AST2700)
         self.start_ast2700_test('ast2700-a0-default')
 
+    def test_aarch64_ast2700a1_evb_sdk_v09_05(self):
+        self.set_machine('ast2700a1-evb')
+
+        self.archive_extract(self.ASSET_SDK_V905_AST2700A1)
+        self.start_ast2700_test('ast2700-default')
+
 
 if __name__ == '__main__':
     QemuSystemTest.main()
-- 
2.34.1

