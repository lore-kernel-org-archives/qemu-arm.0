Received: by 2002:a17:504:17c4:b0:1be9:327d:8ee3 with SMTP id o4csp2750341njd;
        Tue, 22 Apr 2025 18:41:30 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCULpVYgn3wVNgzGxJaU6v6//wGyt4p32yAk8tE3h3J10R8wyow0Qbwp9hAd8ik1FDzNHi2ztRdijrc9Ww==@linaro.org
X-Google-Smtp-Source: AGHT+IGflbyzHHtUtF76fVI1kf+Gbj1q+6+OV63BJ0hvQK0+30hXGf0h/UmnmUWQ19K1LYj7TvqJ
X-Received: by 2002:a05:620a:410b:b0:7c7:97ff:ca42 with SMTP id af79cd13be357-7c928009256mr2842816485a.41.1745372490189;
        Tue, 22 Apr 2025 18:41:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1745372490; cv=none;
        d=google.com; s=arc-20240605;
        b=VEUGik0iWiIqWik1vv2ATwcMv0MrI+UoHiN5YikaQTIQ0sRdzW/e9qiE69Hummgp2o
         678jQ7mAxPJY/+jsXqTCGtOIELD6DomFLyJv7j0qULiA8CE9mhRN6mfohUGhiYWVbFF5
         b/7r6bMy8yhC9kIpHPM1az3GJE3F8WwNvZfeHGMvJPnz5ScM1luB5rzpB5pNgjW9Twvu
         LO1URxP18R6Q3yta9172HXEgg5O3tty8BY0NWhFTe+jNiOVZHHI7jWOrpH7tF2hJquIG
         V8pFkPBqvnHW+JlGZfM0zSUHBuStrWipIpOZa4XDFB3+WjyvleiLECLd0H/Pztbb8tcr
         pkXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=93GxKyCee94ubkfETPiikmFxpS6LW/goDvh4M6sLjJQ=;
        fh=no4a9QA/0zeIocEYrBrieE6XYIGB9KPekpO3W6wNjNE=;
        b=SDnTFz29schQi+dRBsMyyT8dO2cnBIq0Ru1f5a3usQPhQa2qGDCfAZ8llREU5CpC8t
         oJSYH8e3RNMGlS59kQZa/3eD8uoksFfPDNHWZrB4d2OTXVMQt05+Kx4zO07uGiUfc2er
         LVXQzlaYjcUJCmYHnvWZ8m4ScqG5ABPxgqWkdro6k1P/ZaXNnr46vP3JCj7yint6Oc6F
         vo2t/rolbKYuxV01MhqY67hgYbK8fcPpxmBSBw/FopLMAnm8C7hycYGbOo9Yd0W7IjxA
         xdeyHaniCPEC68nhwx9JCrgdlmqaTCC+SW6eNBMERXCynhzSccSshAySdBU5RVlP2viH
         G6Yw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c925ba3707si1205975385a.347.2025.04.22.18.41.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 22 Apr 2025 18:41:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1u7P6K-0007gz-Qq; Tue, 22 Apr 2025 21:40:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1u7P6I-0007aL-PV; Tue, 22 Apr 2025 21:40:34 -0400
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1u7P6F-0004FX-PA; Tue, 22 Apr 2025 21:40:34 -0400
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
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
Subject: [PATCH v2 2/3] tests/functional/aspeed: Update test ASPEED SDK v09.06
 for AST2600
Date: Wed, 23 Apr 2025 09:40:06 +0800
Message-ID: <20250423014008.147542-3-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250423014008.147542-1-jamin_lin@aspeedtech.com>
References: <20250423014008.147542-1-jamin_lin@aspeedtech.com>
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
X-TUID: 11Kx5UrDS0xP

Update test for AST2600 production revision A3.

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
Reviewed-by: Cédric Le Goater <clg@redhat.com>
---
 tests/functional/test_arm_aspeed_ast2600.py | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/tests/functional/test_arm_aspeed_ast2600.py b/tests/functional/test_arm_aspeed_ast2600.py
index 6ae4ed636a..c30397f60d 100755
--- a/tests/functional/test_arm_aspeed_ast2600.py
+++ b/tests/functional/test_arm_aspeed_ast2600.py
@@ -97,26 +97,27 @@ def test_arm_ast2600_evb_buildroot_tpm(self):
 
         self.do_test_arm_aspeed_buildroot_poweroff()
 
-    ASSET_SDK_V806_AST2600_A2 = Asset(
-        'https://github.com/AspeedTech-BMC/openbmc/releases/download/v08.06/ast2600-a2-obmc.tar.gz',
-        '9083506135f622d5e7351fcf7d4e1c7125cee5ba16141220c0ba88931f3681a4')
+    ASSET_SDK_V906_AST2600 = Asset(
+        'https://github.com/AspeedTech-BMC/openbmc/releases/download/v09.06/ast2600-default-obmc.tar.gz',
+        '768d76e247896ad78c154b9cff4f766da2ce65f217d620b286a4a03a8a4f68f5')
 
     def test_arm_ast2600_evb_sdk(self):
         self.set_machine('ast2600-evb')
 
-        self.archive_extract(self.ASSET_SDK_V806_AST2600_A2)
+        self.archive_extract(self.ASSET_SDK_V906_AST2600)
 
         self.vm.add_args('-device',
             'tmp105,bus=aspeed.i2c.bus.5,address=0x4d,id=tmp-test');
         self.vm.add_args('-device',
             'ds1338,bus=aspeed.i2c.bus.5,address=0x32');
         self.do_test_arm_aspeed_sdk_start(
-            self.scratch_file("ast2600-a2", "image-bmc"))
+            self.scratch_file("ast2600-default", "image-bmc"))
 
-        self.wait_for_console_pattern('ast2600-a2 login:')
+        self.wait_for_console_pattern('ast2600-default login:')
 
         exec_command_and_wait_for_pattern(self, 'root', 'Password:')
-        exec_command_and_wait_for_pattern(self, '0penBmc', 'root@ast2600-a2:~#')
+        exec_command_and_wait_for_pattern(self, '0penBmc',
+                                          'root@ast2600-default:~#')
 
         exec_command_and_wait_for_pattern(self,
             'echo lm75 0x4d > /sys/class/i2c-dev/i2c-5/device/new_device',
-- 
2.43.0

