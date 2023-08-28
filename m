Received: by 2002:a17:907:76f8:b0:9a1:fa4e:495e with SMTP id kg24csp2861517ejc;
        Mon, 28 Aug 2023 02:01:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEUDCc68PNY6aAp9a/LL5sKBpmvHCY9yM2tphPRWixztNMOXI+frrI7o9XcaMPsIDoEz9vL
X-Received: by 2002:a0c:c247:0:b0:647:18f8:36eb with SMTP id w7-20020a0cc247000000b0064718f836ebmr35558347qvh.27.1693213301498;
        Mon, 28 Aug 2023 02:01:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1693213301; cv=none;
        d=google.com; s=arc-20160816;
        b=us/jooq6KUM8YlEBp26OMzA5pQ/MgTsYfRLg3fK0sWCQ8F8wbzU3bzx4T9lKyE1qp4
         yFi7gFDiCgVkZRMR2LjhkygrOt4/X9COLqXotHHhUW8muBPtshvjaTlHHv3vvvk0Ww7/
         L8UlHYSI/xDKEdBTJZvNzoPBvIADVAAONOkX9nn3W1g9Cg6Y/TY/Jzm7pdfVmZ7FgYX+
         dnBg2iD8gSUVnSthkV6A8cs0Mo6lN5+Voi+9sRwHgmQyBJeQ1ItY6Ld0rhU5dgxiiJxR
         m8lAWQdwKCCBo1U4pnBYSqH/RBvYSf9Fsv9eM90w58drzueVPcJSruhtXa7+ZpgOMKvt
         CfVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from;
        bh=aaGH28yiUBUIMO4+aOJy5c8C71JQpsiBHEvvNCuESRk=;
        fh=d4RmNI9fgM2+16SHaHAZOINZPaITjYl9Mn96OMI2zUY=;
        b=DgBy092qnRucJSYumbHb0noMhIbcaTs59dsqWBv3U33LjdpiOQzGwO3Z+HPhJJ7GjS
         Thxexp4kVYKeJt3UIJYPqK19Ytu9eT7DOveZUOv67q0pjcT6QwZJUqa4DHcabwaCMakC
         TRCqiGx6Ta2/jRItcWDmL1iw5cuHvaFVxJLrN5AGTrj1faNFM5ENY7WT318Ueh910ug0
         lC4EnpsfunjYI23H3nwdHgpGthNdaao94cMsqCxq3BA7QhaOBI9nwe3Ojf1hFQfNqs6P
         fwyeCXuBgLrImoZ+fRDTvGAXtxeiujiauqlD3t/+eFxnDeW8h+6ZtwGNSAk7Uv9ZctyI
         Uunw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u3-20020a0cdd03000000b0063cd7637668si4230340qvk.233.2023.08.28.02.01.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 28 Aug 2023 02:01:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qaY7i-0001vY-2L; Mon, 28 Aug 2023 05:01:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=DaUQ=EN=kaod.org=clg@ozlabs.org>)
 id 1qaY7g-0001tv-7R; Mon, 28 Aug 2023 05:01:24 -0400
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3]
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=DaUQ=EN=kaod.org=clg@ozlabs.org>)
 id 1qaY7c-0002qv-RB; Mon, 28 Aug 2023 05:01:23 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4RZ4Kl2j0rz4wxy;
 Mon, 28 Aug 2023 19:01:15 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4RZ4Kf4Lwmz4wxx;
 Mon, 28 Aug 2023 19:01:10 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 Hang Yu <francis_yuu@stu.pku.edu.cn>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH] tests/avocado/machine_aspeed.py: Update SDK images
Date: Mon, 28 Aug 2023 11:01:01 +0200
Message-ID: <20230828090101.74357-1-clg@kaod.org>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=SRS0=DaUQ=EN=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: d1RnNneetUBP

Switch to the latest v8.06 release which introduces interesting
changes for the AST2600 I2C and I3C models. Also take the AST2600 A2
images instead of the default since QEMU tries to model The AST2600 A3
SoC.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---

  Requires patches from Hang Yu [1]
  
  [1] https://lore.kernel.org/qemu-devel/20230812065230.8839-1-francis_yuu@stu.pku.edu.cn/


 tests/avocado/machine_aspeed.py | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/tests/avocado/machine_aspeed.py b/tests/avocado/machine_aspeed.py
index 724ee72c0208..90f1b7cb77a1 100644
--- a/tests/avocado/machine_aspeed.py
+++ b/tests/avocado/machine_aspeed.py
@@ -316,8 +316,8 @@ def test_arm_ast2500_evb_sdk(self):
         """
 
         image_url = ('https://github.com/AspeedTech-BMC/openbmc/releases/'
-                     'download/v08.01/ast2500-default-obmc.tar.gz')
-        image_hash = ('5375f82b4c43a79427909342a1e18b4e48bd663e38466862145d27bb358796fd')
+                     'download/v08.06/ast2500-default-obmc.tar.gz')
+        image_hash = ('e1755f3cadff69190438c688d52dd0f0d399b70a1e14b1d3d5540fc4851d38ca')
         image_path = self.fetch_asset(image_url, asset_hash=image_hash,
                                       algorithm='sha256')
         archive.extract(image_path, self.workdir)
@@ -334,8 +334,8 @@ def test_arm_ast2600_evb_sdk(self):
         """
 
         image_url = ('https://github.com/AspeedTech-BMC/openbmc/releases/'
-                     'download/v08.01/ast2600-default-obmc.tar.gz')
-        image_hash = ('f12ef15e8c1f03a214df3b91c814515c5e2b2f56119021398c1dbdd626817d15')
+                     'download/v08.06/ast2600-a2-obmc.tar.gz')
+        image_hash = ('9083506135f622d5e7351fcf7d4e1c7125cee5ba16141220c0ba88931f3681a4')
         image_path = self.fetch_asset(image_url, asset_hash=image_hash,
                                       algorithm='sha256')
         archive.extract(image_path, self.workdir)
@@ -345,8 +345,8 @@ def test_arm_ast2600_evb_sdk(self):
         self.vm.add_args('-device',
                          'ds1338,bus=aspeed.i2c.bus.5,address=0x32');
         self.do_test_arm_aspeed_sdk_start(
-            self.workdir + '/ast2600-default/image-bmc')
-        self.wait_for_console_pattern('nodistro.0 ast2600-default ttyS4')
+            self.workdir + '/ast2600-a2/image-bmc')
+        self.wait_for_console_pattern('nodistro.0 ast2600-a2 ttyS4')
 
         self.ssh_connect('root', '0penBmc', False)
         self.ssh_command('dmesg -c > /dev/null')
-- 
2.41.0

