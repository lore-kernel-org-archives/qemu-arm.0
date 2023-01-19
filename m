Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp296202ejc;
        Thu, 19 Jan 2023 04:36:00 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtiap3XwDIpw4zxNXGTc57NsEYpkrdo0j/n2s0k8fyga1h3r4xXvkyb1kiUVLcYTfn3ji+T
X-Received: by 2002:ac8:4c90:0:b0:3ad:202f:8797 with SMTP id j16-20020ac84c90000000b003ad202f8797mr14423004qtv.9.1674131760619;
        Thu, 19 Jan 2023 04:36:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674131760; cv=none;
        d=google.com; s=arc-20160816;
        b=0ibSC/U9CPAlx8Yy5UhdtRycvXfog1WjDfe6WOmZzbx0tiG2B8MknKlYdnRYKH7Pvj
         qU6d5qQTPXEsdcLwDV1t66zQYDaR4k9W3XpwwAD8DmUM9ggZXpAGFQzapOpGbqIRYl+9
         MaCkWE/FOeyxe51rv9Y8J9LnfZhH4ij53TJ9mMogYK6B0U24KMUvizd5lQYOYs8MLJI7
         uQCqyR6dbFh2y++7159ptimWgmBB2uwrOE+Fncgd5qQHjNKbqF1vrnnWEmcSXip/12Yz
         2DhZtUOKaSxKnNyMmRy/f7z92ec00fSfAXbz5dqAFZoc/HJBMROE+NLGSRI0Nl3yYiRH
         kb1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=taYMhIytnY+asdyLasBIQqJ6j1F35TNpHIFThih/wGk=;
        b=VhpsJnmwa+JMIxS9Rykyumhe/UGrfecyP7X3Z9Ag8c4/lHNNtU++MtlU0/ZRFrYgy4
         1vuHE2Q7y6yK66IeaFoggc2ajnwj8kzCOHpUh8tZCgpXZBavOgqEnuIwOFU9BAvIXaI/
         PFy6BI1V0/4V3smS8avEgEeXH+dTlLC2F/ZIA8/0RyoidSW08RBTA5talSpXZef6S4Y8
         F5C0Xk8mPTGeImlXY55U1iq1fAgjEEpVUTbxaS4zN2rGw6L+l10XX/VpM0B3ebivnO6Q
         xO7cl1aH4Ky38xeaOO1BptEUEeuze0ksraRRSynJq83uOq0y5ebV8LrM+tdRQsKth67U
         Jk9A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v5-20020a05622a188500b0039d03667938si2908791qtc.436.2023.01.19.04.36.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Jan 2023 04:36:00 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pIU8h-0006Nm-MF; Thu, 19 Jan 2023 07:35:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=w1SB=5Q=kaod.org=clg@ozlabs.org>)
 id 1pIU8c-0006L7-3N; Thu, 19 Jan 2023 07:35:26 -0500
Received: from gandalf.ozlabs.org ([150.107.74.76])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=w1SB=5Q=kaod.org=clg@ozlabs.org>)
 id 1pIU8a-0007WU-HL; Thu, 19 Jan 2023 07:35:25 -0500
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4NyMXq4Cfcz4xZj;
 Thu, 19 Jan 2023 23:35:23 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4NyMXn5kJWz4xN1;
 Thu, 19 Jan 2023 23:35:21 +1100 (AEDT)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH 07/25] tests/avocado/machine_aspeed.py: Mask systemd services
 to speed up SDK boot
Date: Thu, 19 Jan 2023 13:34:31 +0100
Message-Id: <20230119123449.531826-8-clg@kaod.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230119123449.531826-1-clg@kaod.org>
References: <20230119123449.531826-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=w1SB=5Q=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-TUID: JUqiHzPLws66

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
2.39.0

