Received: by 2002:a17:504:17c4:b0:1be9:327d:8ee3 with SMTP id o4csp3532685njd;
        Thu, 24 Apr 2025 00:52:17 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU0dmDy0AQmcq/rIF1HZ8M73RcQmJdpK1CKkLt+SB0+5FWvLm2272Ab41Jk5rtdIDEzFuhw99LYUJFAfg==@linaro.org
X-Google-Smtp-Source: AGHT+IFfKSVXmElWuCeed1taqDRkrOpIkFdMGFS9SU+pOC0cVjKhiIbjHIqFZ7m4sjCVlK1vw9MP
X-Received: by 2002:ac8:7f09:0:b0:476:fdf9:9707 with SMTP id d75a77b69052e-47eb33a673bmr21365551cf.31.1745481137528;
        Thu, 24 Apr 2025 00:52:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1745481137; cv=none;
        d=google.com; s=arc-20240605;
        b=AkNANEFvLU8pP9S3vFFJEVoKtu+im2yzHO5FMyp0xKXlZ+Z2IKKhGz260zdF+j7KjP
         srDDmdrcYcUhvTN3+lv/QewWL62WJvlUc2dm93FUlf0vnew10adJYR6faRYseBDHpYvS
         DCOcQxPOJ0ZlbE80E1LwfGfX6sLHQn/mh4dvrLjbad2AjRLdfqZpEBLO1xsP5T/e5VO/
         SapDCbxty5n9q6ZBjTeqGFg84N1R8lQyfBACwTioi7zOFBWTMEYHuNeK9QKM1eNg8Dpi
         yMeqx5G3Us50n/eDcX1odFnCVfKJKwJYmT/ZvDTSP7zHfYjxl1zP609foeyazQV5lMx4
         1eJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=I/ou6T8cCOzr4E4BA05KZmX7wWvWYpm4pa1S4uvZADo=;
        fh=mYa7DW7+LcAerod9KMiSdtH0/D1NqzuZXE0uoAi0+1E=;
        b=FnvEAAyZ3wSzuJeQmAGriVEWJ4TUtQ0iMpZWDfSbXjsSM8TDtal3xZpd/ZenOuBXaR
         b3sPPV2GRGjqKSeQukE6Bp6OxKLCgHGY9JyGgrpHMJsrxWgGbnksvlA1C8wyBgUTzBqc
         V6L5+PIg6bU9RSCkQ+xM8szhvFUVxVd91tGDX0JhwFR7ou4SkRhvm5YWRakj1zk0ow7G
         2kbIXrwZgFkWzE0Vp98amXv9hW5Pb7nDE0Ki/zzauNo888sGBgT1GiAFZZ5lDv/SJnvq
         SjeOKy1KaN0Zo7CaI6uB3fOnDZveJNYTjEWK88sfesWZ7C+W2/6ylTv6xPlq83+t4RLS
         B8Ag==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-47e9f2ca778si11862941cf.94.2025.04.24.00.52.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 24 Apr 2025 00:52:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1u7rNK-0001Nc-Bl; Thu, 24 Apr 2025 03:52:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1u7rNJ-0001NJ-Cv; Thu, 24 Apr 2025 03:52:01 -0400
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1u7rNH-0006ez-QK; Thu, 24 Apr 2025 03:52:01 -0400
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Thu, 24 Apr
 2025 15:51:37 +0800
Received: from mail.aspeedtech.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Thu, 24 Apr 2025 15:51:37 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>,
 <nabihestefan@google.com>, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?=
 <clg@redhat.com>
Subject: [PATCH v6 4/6] tests/functional/aspeed: Add to test vbootrom for
 AST2700
Date: Thu, 24 Apr 2025 15:51:32 +0800
Message-ID: <20250424075135.3715128-5-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250424075135.3715128-1-jamin_lin@aspeedtech.com>
References: <20250424075135.3715128-1-jamin_lin@aspeedtech.com>
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
X-TUID: xZ+zaRpQUstz

Add the AST2700 functional test to boot using the vbootrom image
instead of manually loading boot components with -device loader.
The boot ROM binary is now passed via the
-bios option, using the image located in pc-bios/ast27x0_bootrom.bin.

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
Reviewed-by: Cédric Le Goater <clg@redhat.com>
---
 tests/functional/test_aarch64_aspeed.py | 26 +++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/tests/functional/test_aarch64_aspeed.py b/tests/functional/test_aarch64_aspeed.py
index 2f04655b60..34ddfa852c 100755
--- a/tests/functional/test_aarch64_aspeed.py
+++ b/tests/functional/test_aarch64_aspeed.py
@@ -25,6 +25,18 @@ def do_test_aarch64_aspeed_sdk_start(self, image):
 
         self.vm.launch()
 
+    def verify_vbootrom_firmware_flow(self):
+        wait_for_console_pattern(self, 'Found valid FIT image')
+        wait_for_console_pattern(self, '[uboot] loading')
+        wait_for_console_pattern(self, 'done')
+        wait_for_console_pattern(self, '[fdt] loading')
+        wait_for_console_pattern(self, 'done')
+        wait_for_console_pattern(self, '[tee] loading')
+        wait_for_console_pattern(self, 'done')
+        wait_for_console_pattern(self, '[atf] loading')
+        wait_for_console_pattern(self, 'done')
+        wait_for_console_pattern(self, 'Jumping to BL31 (Trusted Firmware-A)')
+
     def verify_openbmc_boot_and_login(self, name):
         wait_for_console_pattern(self, 'U-Boot 2023.10')
         wait_for_console_pattern(self, '## Loading kernel from FIT Image')
@@ -94,6 +106,11 @@ def start_ast2700_test(self, name):
         self.do_test_aarch64_aspeed_sdk_start(
             self.scratch_file(name, 'image-bmc'))
 
+    def start_ast2700_test_vbootrom(self, name):
+        self.vm.add_args('-bios', 'ast27x0_bootrom.bin')
+        self.do_test_aarch64_aspeed_sdk_start(
+                self.scratch_file(name, 'image-bmc'))
+
     def test_aarch64_ast2700_evb_sdk_v09_06(self):
         self.set_machine('ast2700-evb')
 
@@ -110,5 +127,14 @@ def test_aarch64_ast2700a1_evb_sdk_v09_06(self):
         self.verify_openbmc_boot_and_login('ast2700-default')
         self.do_ast2700_i2c_test()
 
+    def test_aarch64_ast2700a1_evb_sdk_vbootrom_v09_06(self):
+        self.set_machine('ast2700a1-evb')
+
+        self.archive_extract(self.ASSET_SDK_V906_AST2700A1)
+        self.start_ast2700_test_vbootrom('ast2700-default')
+        self.verify_vbootrom_firmware_flow()
+        self.verify_openbmc_boot_and_login('ast2700-default')
+        self.do_ast2700_i2c_test()
+
 if __name__ == '__main__':
     QemuSystemTest.main()
-- 
2.43.0

