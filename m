Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp5181536ejb;
        Tue, 7 Feb 2023 02:09:13 -0800 (PST)
X-Google-Smtp-Source: AK7set+f5nB5BAZ5094IRFZng+YL/VkAxVnja9Eo3CHdRNjXIrPKg9UMmULM/wHRcmPohI46yuoZ
X-Received: by 2002:a05:6214:dc5:b0:537:b7da:fd9b with SMTP id 5-20020a0562140dc500b00537b7dafd9bmr3726644qvt.24.1675764553307;
        Tue, 07 Feb 2023 02:09:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675764553; cv=none;
        d=google.com; s=arc-20160816;
        b=fyN6r3mWN6Uj8F0ox7dxdZfv582IiWPHeXTRN6294pQBt2IFTXX9MGM4RgnKoRt5Rf
         S/YdPjfoFciJH2L0pvsV9Q2wHtSDWxL7TTciHy3DypeFQwuNSEgDij1K7g7ECBQwn2cV
         GWyK05UVt3RKjVICDGgqfsehssmkztZLiiGIbzZdgcqUsvvFSh9eZ9iUUEwNZJGboJ9Q
         oA41D6htDEC9e+VGnPGqcTvD9hGhUfPzNOO5NB3kSE4PuvB9pV6udWvH7Juz2tal5TTD
         Y1U7EaQBHBL1g+tBL/u9RQYarM7waZAuB3uZi17/jaF4ZqVVBc/y+6Mzo9eSeb7RGiQn
         t6YA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=R+YYW8sY6zxRHipN7wBC2ZRuOjnhpJKYPNGrqa02vhg=;
        b=uvbcHUZLRuS+veJtUjuSrKec5D6J5Qlz2YFkTT0ggYym4RF2Mt0L2F1hIn7kvsVdFy
         NGFNBfBqwwKQAQKASUhTf6mPCSlypzc3lt98l15LRbtxZSG8wZZAtU2NV9YVQY728KW7
         97wJCTl5llckc0mBQBsGyYh6w4/UO7ymIMcx+7etvbbV6UHOsLgO3tG6nBQrvIsSO4+w
         eYB2bI5g/5QIiP4xlZ552nEz6un0zUFal58g2vwKDzCxtCle4sgFPT7nqzeYmaVtEHGW
         IHgk0n/e4Op5iZN5YEx8oD44oGFe/nMwDtEBkl4WEgJwOHM/KnED6XyQTDTOpeDqFd/Z
         RMow==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n9-20020a0c9d49000000b005374d5a7e3asi3578303qvf.563.2023.02.07.02.09.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 07 Feb 2023 02:09:13 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPKuC-0000kG-RF; Tue, 07 Feb 2023 05:08:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=a43c=6D=kaod.org=clg@ozlabs.org>)
 id 1pPKtb-0000RK-97; Tue, 07 Feb 2023 05:08:20 -0500
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3]
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=a43c=6D=kaod.org=clg@ozlabs.org>)
 id 1pPKtZ-0002Nc-K6; Tue, 07 Feb 2023 05:08:15 -0500
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4P9zND3nCbz4xyf;
 Tue,  7 Feb 2023 21:08:12 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4P9zNB5RF3z4xGR;
 Tue,  7 Feb 2023 21:08:10 +1100 (AEDT)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Joel Stanley <joel@jms.id.au>
Subject: [PULL 08/25] tests/avocado/machine_aspeed.py: Mask systemd services
 to speed up SDK boot
Date: Tue,  7 Feb 2023 11:07:27 +0100
Message-Id: <20230207100744.698694-9-clg@kaod.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230207100744.698694-1-clg@kaod.org>
References: <20230207100744.698694-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=SRS0=a43c=6D=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 8GGiUz/fjBBZ

Reviewed-by: Joel Stanley <joel@jms.id.au>
Message-Id: <20230119123449.531826-8-clg@kaod.org>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 tests/avocado/machine_aspeed.py | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/tests/avocado/machine_aspeed.py b/tests/avocado/machine_aspeed.py
index 773b1ff3a9..1cab946727 100644
--- a/tests/avocado/machine_aspeed.py
+++ b/tests/avocado/machine_aspeed.py
@@ -183,7 +183,14 @@ def test_arm_ast2600_evb_buildroot(self):
 
 class AST2x00MachineSDK(QemuSystemTest):
 
-    EXTRA_BOOTARGS = ' quiet'
+    EXTRA_BOOTARGS = (
+        'quiet '
+        'systemd.mask=org.openbmc.HostIpmi.service '
+        'systemd.mask=xyz.openbmc_project.Chassis.Control.Power@0.service '
+        'systemd.mask=modprobe@fuse.service '
+        'systemd.mask=rngd.service '
+        'systemd.mask=obmc-console@ttyS2.service '
+    )
 
     # FIXME: Although these tests boot a whole distro they are still
     # slower than comparable machine models. There may be some
@@ -208,7 +215,7 @@ def do_test_arm_aspeed_sdk_start(self, image):
         interrupt_interactive_console_until_pattern(
             self, 'Hit any key to stop autoboot:', 'ast#')
         exec_command_and_wait_for_pattern(
-            self, 'setenv bootargs ${bootargs}' + self.EXTRA_BOOTARGS, 'ast#')
+            self, 'setenv bootargs ${bootargs} ' + self.EXTRA_BOOTARGS, 'ast#')
         exec_command_and_wait_for_pattern(
             self, 'boot', '## Loading kernel from FIT Image')
         self.wait_for_console_pattern('Starting kernel ...')
-- 
2.39.1

