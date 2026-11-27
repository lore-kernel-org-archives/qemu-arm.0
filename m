Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62421606A31C
	for <qemu-arm@archiver.kernel.org>; Fri, 27 Nov 2026 04:08:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=spacecubics-com.20260707.gappssmtp.com header.i=@spacecubics-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=IpgL6uiU
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xWnEm-0002NH-Rv; Thu, 26 Nov 2026 23:07:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <maxz@spacecubics.com>)
 id 1xWlTb-0001qL-0g
 for qemu-arm@nongnu.org; Thu, 26 Nov 2026 21:14:16 -0500
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <maxz@spacecubics.com>)
 id 1xWlTZ-0001IA-1f
 for qemu-arm@nongnu.org; Thu, 26 Nov 2026 21:14:14 -0500
Received: by mail-pg1-x531.google.com with SMTP id
 41be03b00d2f7-cde0daf3a2aso3279771a12.3
 for <qemu-arm@nongnu.org>; Thu, 26 Nov 2026 18:14:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=spacecubics-com.20260707.gappssmtp.com; s=20260707; t=1795745652;
 x=1796350452; darn=nongnu.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=5aDdp7tVxVsin29xlNHo3SxIMh3/Gnj6XKXn/kVM3sI=;
 b=IpgL6uiUR0/JeRGTZpMi/Qik7sOaOR55T47eWHN2fNOwWZ4PSCT33wL9dL/YYnge/v
 Cinv3THnEcuU+8PIUE+h7PI9WkB7301J9LKU6XiVCIl1/gvYA48K2dJjCHYuYQOkSfZN
 XfdPTsd5YLnEH7llvdZigByF5QVtkGRJnHbAjEz7kwzNWFwn8ZEOPeT6FlXb4Jy3f+34
 x+zJdwfPkK5bQ6GHxxP6T//ySonG1CQKL9E/Lo9j34Zwxuyd+thumjRfL1unnJBAFWMt
 dZzrzhOib5pfT68gSlzXpEJpasDf8gz9jMOet8bZYsCvvOegD2GECesm4O5uI2Ho410v
 iPYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795745652; x=1796350452;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=5aDdp7tVxVsin29xlNHo3SxIMh3/Gnj6XKXn/kVM3sI=;
 b=ANKJGZPd6jlb6VdignGZdSv4Tm9JFV866mElgtdigBSzPw+ImWar+RpbcQmY87aCw5
 S9ubIqTZX/WUVlCprKvIi0CH+Rhsmxz1eL5b7CYypF91OXmxFLvL9sNe14Nw40TW079v
 29hNwl7ldTGn04C6JLfjkXCwnDj/ey4TvXaO3b3d48U7bOCroC1XCNpO0G/kGLr6hJ0O
 o/PeeKffVh9v8re81Kbu3o40nHxH6/OidGXEBqm9H3rF+hIvOVskvaSp9gdRlHi5ebZX
 h3/lkF7EvFqOE0x3OW2LfHaTZ0jjDt/Y6rfW5s/riSjxkf0BevYqaiuKysehQSe6SclY
 u5qg==
X-Forwarded-Encrypted: i=1;
 AL+hErEppa7VSBF1NF9RQC8aTHOg+usxEC9ooGRX4QnxbLtKL+b96ahxheA8SF4HZSqTR0VDM68NhNz5vQ==@nongnu.org
X-Gm-Message-State: APuU4Z9uXQyPjZAAB3Bcg79OWRmE5ohH05o+TQWt7YdSJ3+LayUqpW3v
 Z7jTOkxcq8uT5R6pAWpbHKMZ6RlPxgzb58YJNuwjY+m8dGnQMqrn2LqdWW/YjMc45juXDJH/27r
 4hKLsG4o=
X-Gm-Gg: AZFdTZfWKeiYDoRI+YBlfwnGvXi69prxeLA70BpQlpUCmndwCoYMqXzHPuH35He8Qkq
 AkV509oDsJ6WS9HymiiQwaG39OIEa616VVNm1hmpz/PYpktUZKXuet50BShX0ULA6bzkZJqvbTO
 g8zssL6ETfX0NNdS8T49scbsp2a0tCXzOiQdb1Gjsp22crPotz73TpRcG1mGvAKCNqWsdkuNS9f
 a6vnnEZghiGcAr1QVXfUK19YNC//2r816CFHid+ZWmo5G+7sjNPFJEJ7pRnUzvNMEK6d9uhmc5c
 wrrMSLjzTUPwISWIr9mFVv4E0/SxCtFFB0TYshknR0JdTxsPMzpkoU6E7LsfHt7viNqJSD3ldy0
 aBWi+o8ynZJP59Ci9cCK2d6TQ0v+SPYJXlUGVrP+gSF2vGptryPEaVJsZdXls/TtCH73eXClK9b
 bQqSVyMoZfPRtCdY/nzNMLQEmNZMu0pGMtGR0TGWt9wGVhiViQLDNjEUuJGbkSeMUv0uXldaEKm
 de42BULmEM45C4RjEsz1M3ZmUwurSMlfOH2anLou3iSERemu5TxAO1Py+hA6LQ9VhYQpHNo53rt
 WpfXWfb63keJaBYvk2TTlnDqMwwe/uB5HpmZWrENCDxjvSyGBRmRKzKWnkigkwsyqQ==
X-Received: by 2002:a17:90b:3b8f:b0:3b3:b36e:8c3d with SMTP id
 98e67ed59e1d1-3b41cb466f4mr20517311a91.62.1795745651737; 
 Thu, 26 Nov 2026 18:14:11 -0800 (PST)
Received: from [127.0.0.2] (182-166-200-88f1.hyg1.eonet.ne.jp.
 [182.166.200.88]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3b53479b149sm1368372a91.6.2026.11.26.18.14.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Nov 2026 18:14:11 -0800 (PST)
From: Maximilian Zimmermann <maxz@spacecubics.com>
Date: Fri, 27 Nov 2026 11:13:36 +0900
Subject: [PATCH 3/3] tests/functional/arm: Add SC-OBC Module A1 test
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261127-add-scobc-a1-board-v1-3-b572280dcde1@spacecubics.com>
References: <20261127-add-scobc-a1-board-v1-0-b572280dcde1@spacecubics.com>
In-Reply-To: <20261127-add-scobc-a1-board-v1-0-b572280dcde1@spacecubics.com>
To: qemu-devel@nongnu.org
Cc: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, 
 Peter Maydell <peter.maydell@linaro.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org, 
 Maximilian Zimmermann <maxz@spacecubics.com>
X-Mailer: b4 0.15.2
Received-SPF: none client-ip=2607:f8b0:4864:20::531;
 envelope-from=maxz@spacecubics.com; helo=mail-pg1-x531.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 26 Nov 2026 23:06:53 -0500
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add a functional test for the scobc-a1 machine, so that regressions in
the board or its console UART are caught.

The test boots the Zephyr v4.5.0 hello_world sample built for the
scobc_a1 board directly into HRMEM and waits for the boot banner and the
greeting on the console UART.

Signed-off-by: Maximilian Zimmermann <maxz@spacecubics.com>
---
 MAINTAINERS                           |  1 +
 tests/functional/arm/meson.build      |  1 +
 tests/functional/arm/test_scobc_a1.py | 30 ++++++++++++++++++++++++++++++
 3 files changed, 32 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index bc02f6e1be..3bea382cf4 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1104,6 +1104,7 @@ L: qemu-arm@nongnu.org
 S: Maintained
 F: hw/arm/scobc_a1.c
 F: docs/system/arm/scobc-a1.rst
+F: tests/functional/arm/test_scobc_a1.py
 
 Stellaris
 M: Peter Maydell <peter.maydell@linaro.org>
diff --git a/tests/functional/arm/meson.build b/tests/functional/arm/meson.build
index 72c7afc84a..88e567e90e 100644
--- a/tests/functional/arm/meson.build
+++ b/tests/functional/arm/meson.build
@@ -70,6 +70,7 @@ tests_arm_system_thorough = [
   'realview',
   'replay',
   'sabrelite',
+  'scobc_a1',
   'smdkc210',
   'stellaris',
   'sx1',
diff --git a/tests/functional/arm/test_scobc_a1.py b/tests/functional/arm/test_scobc_a1.py
new file mode 100755
index 0000000000..41d18cfef0
--- /dev/null
+++ b/tests/functional/arm/test_scobc_a1.py
@@ -0,0 +1,30 @@
+#!/usr/bin/env python3
+#
+# Functional test that boots Zephyr on the Space Cubics SC-OBC Module A1
+#
+# Copyright (c) 2026 Space Cubics Inc.
+#
+# SPDX-License-Identifier: GPL-2.0-or-later
+
+from qemu_test import QemuSystemTest, Asset, wait_for_console_pattern
+
+
+class ScobcA1Machine(QemuSystemTest):
+
+    ASSET_HELLO_WORLD = Asset(
+        'https://downloads.spacecubics.com/development/scobc-a1/qemu/'
+        'zephyr-v4.5.0-hello_world.elf',
+        '1578aebe742e4b3fc10af22994de4cd7feda3b54be19486a2efe42c099734c60')
+
+    def test_scobc_a1_hello_world(self):
+        self.set_machine('scobc-a1')
+        kernel_path = self.ASSET_HELLO_WORLD.fetch()
+        self.vm.set_console()
+        self.vm.add_args('-kernel', kernel_path)
+        self.vm.launch()
+        wait_for_console_pattern(self, '*** Booting Zephyr OS build v4.5.0 ***')
+        wait_for_console_pattern(self, 'Hello World! scobc_a1')
+
+
+if __name__ == '__main__':
+    QemuSystemTest.main()

-- 
2.55.0


