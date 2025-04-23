Received: by 2002:a17:504:17c4:b0:1be9:327d:8ee3 with SMTP id o4csp2750374njd;
        Tue, 22 Apr 2025 18:41:38 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUm07tBn31VtYgMsbDewY+CH3vkjpNyl704vp/WCv6NfxiCpZYvcBxd4nm5EnhABdihwH5WBeAL7vpFxg==@linaro.org
X-Google-Smtp-Source: AGHT+IEeRmgdJK8XcMJojjTpvkhpenBY6OgA1FAcWJnkdY6XjXt1bZsC+kqEEotEGOl8CjxIsE8L
X-Received: by 2002:a05:622a:1349:b0:476:8917:5efe with SMTP id d75a77b69052e-47aec4a117emr290308121cf.42.1745372498093;
        Tue, 22 Apr 2025 18:41:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1745372498; cv=none;
        d=google.com; s=arc-20240605;
        b=QT2x0h1HgL2aZvmABbYuJVSnfgYo8clK2VlIA5LcjTlJZCsdms7Tr4jL0E1N/bKgxh
         Vg58EalPx3zSY4poLsM50d//ZhJ11D6DQatIgt1C1ZzPbZE/3gihtxROdVOzWUjVkKaj
         +DsrkiJ0Qe/i0Zrv3Epd2VfSuhjXvWjPNY/5dNiBBSmATreng4a1kNwkU3UNTMyLPFb0
         2ZbG5BtRLeLQT4QhedpVOgsMplD/yQjTThguKxk02BSdHStUN0aq2l+ZZLIIgDOGhtvA
         GqTzDA6kY15EicgPffxZjqHWKQGSh9xHS1npNscJgti4D6j0WsWl/eBC+NfVElnBVWxg
         lTwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=/w93C7PhJliCvxxcnqVYyMteXQVwb0zb7aLtRoq82QU=;
        fh=Gb4TIc8MExyZGNjx5T60USxFFuCM6mshEZ2Ta2WMSD4=;
        b=lzKI4P+M4MaGhJVcc9XPGSULcgfMH+J71/NnkoCVRDqx48WSZpCSVFBlRYk42aC0Ef
         OBmGcgXNu8VBVNgcAxh5AXe85WzWGlqHlswU8HwCH9xtOOpk9uc76nLdKW3eDdn+vLhT
         Ywat+zLp2+aroqcx3BGrhR7Huft9sDiRhoOKEDwJdRO1p4AapsIvXj3cymLBVnKuBXOe
         CeH7yZ3azGvOZHU4d1R+AM1+7u+GTCrZvxsl5PqswPWxQ8tbp/IgbYBBmDeBFFu6c4wF
         B1Rs7TBu9J2d5ybls4aUVc2dVcGGab953hVh/88owEWDMu4QVCWURQlf41fe4+e3dP7c
         KZGQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-47ae9c11e5esi127528171cf.83.2025.04.22.18.41.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 22 Apr 2025 18:41:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1u7P6Q-0007wn-2P; Tue, 22 Apr 2025 21:40:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1u7P6O-0007tC-Or; Tue, 22 Apr 2025 21:40:40 -0400
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1u7P6L-0004FX-UJ; Tue, 22 Apr 2025 21:40:40 -0400
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Wed, 23 Apr
 2025 09:40:08 +0800
Received: from mail.aspeedtech.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Wed, 23 Apr 2025 09:40:08 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>
Subject: [PATCH v2 3/3] tests/functional/aspeed: Update test ASPEED SDK v03.00
 for AST1030
Date: Wed, 23 Apr 2025 09:40:07 +0800
Message-ID: <20250423014008.147542-4-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250423014008.147542-1-jamin_lin@aspeedtech.com>
References: <20250423014008.147542-1-jamin_lin@aspeedtech.com>
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
X-TUID: QekYxnXzQ5HA

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
---
 tests/functional/test_arm_aspeed_ast1030.py | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/tests/functional/test_arm_aspeed_ast1030.py b/tests/functional/test_arm_aspeed_ast1030.py
index d45d9f7c1c..77037f0179 100755
--- a/tests/functional/test_arm_aspeed_ast1030.py
+++ b/tests/functional/test_arm_aspeed_ast1030.py
@@ -12,17 +12,17 @@
 
 class AST1030Machine(LinuxKernelTest):
 
-    ASSET_ZEPHYR_1_04 = Asset(
+    ASSET_ZEPHYR_3_00 = Asset(
         ('https://github.com/AspeedTech-BMC'
-         '/zephyr/releases/download/v00.01.04/ast1030-evb-demo.zip'),
-        '4ac6210adcbc61294927918707c6762483fd844dde5e07f3ba834ad1f91434d3')
+         '/zephyr/releases/download/v00.03.00/ast1030-evb-demo.zip'),
+        '37fe3ecd4a1b9d620971a15b96492a81093435396eeac69b6f3e384262ff555f')
 
-    def test_ast1030_zephyros_1_04(self):
+    def test_ast1030_zephyros_3_00(self):
         self.set_machine('ast1030-evb')
 
         kernel_name = "ast1030-evb-demo/zephyr.elf"
         kernel_file = self.archive_extract(
-            self.ASSET_ZEPHYR_1_04, member=kernel_name)
+            self.ASSET_ZEPHYR_3_00, member=kernel_name)
 
         self.vm.set_console()
         self.vm.add_args('-kernel', kernel_file, '-nographic')
-- 
2.43.0

