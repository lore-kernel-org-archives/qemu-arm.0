Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E204D2D0E3
	for <qemu-arm@archiver.kernel.org>; Tue, 13 Jan 2026 12:03:27 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vfcwI-0003vX-Jk; Tue, 13 Jan 2026 06:52:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vfcwA-0003tn-G4
 for qemu-arm@nongnu.org; Tue, 13 Jan 2026 06:51:51 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vfcw8-0005h2-VG
 for qemu-arm@nongnu.org; Tue, 13 Jan 2026 06:51:50 -0500
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-47d63594f7eso44752435e9.0
 for <qemu-arm@nongnu.org>; Tue, 13 Jan 2026 03:51:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1768305107; x=1768909907; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=IxMuWm7xQKjAl4Pj3jxQYVv7ZjOfvdG6QHv6xK0z5aE=;
 b=o3aBxbHUs8HXLERg9HMP+2qK4VFeB8wY1IudYvDaz++V2THleTBVFSiWbHKSoEMckk
 9FPDc4XYgMCZp8MsFusFIEka15PQFhgG6FtGi5Qpa6FNHegpJtfguhJAejyu4C/ty9JR
 eTHtujIh97AsOg+O3aUPTvk79JmuNhheAx+fEvvDRcWtuxD0hfjEKQX2MfU9FIfWoi+z
 0IV75NfkSYTnvNSv0JZbQsL9JYmk4mekK9TjzU5ljXGk/ltxp4y0CyXJBL1i1pmtTdH/
 USqFRzzwSE8wb+eCb15Uq1kf6ur3YD1Hd0qDhS/jfQt5bm7lZY+Cr/dfy9+X10NCVQ1P
 ZzNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768305107; x=1768909907;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IxMuWm7xQKjAl4Pj3jxQYVv7ZjOfvdG6QHv6xK0z5aE=;
 b=JGIFbu2IUIB4RW+zgJ2uSTg4ho4qsHs3yvTAkztYAIfndu6s6oj5B821uJOW87T38A
 0ZM7fZW+vIbrC2A94JvJ8TqwV65dfWD7Rc9NA11E7sMGK9J0jK/Y5Mg7zZEhipzcEnF+
 v/2UZqX8HrDSJ/T9zvpzGT4v2RqrdflW5UZBoJF3Z/HJ1Z6DLZQUiGKeMg+yJfT0e6WD
 pSDxwgwZtOnR7U8RbAtvB6Y57kfTRO0ACVo+gxMj0DyxaAeYMqxe6nNVKDKUpHYxmvT3
 PeKJznrgeHZ4CvD9SxJSX/Wz61pK7QwLlWn0OEOpPaXTAKds8bFD1QrK86DaenNNknjo
 j/mg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUY3BCKfuP9H5yYC/aX/ljKHXhusKeuVt2Dz4XQN0VX4MmDx2Y37DQKFjhzApySTFvdDqVcX+05aw==@nongnu.org
X-Gm-Message-State: AOJu0YxptciHlCZMLLaPKEYBHq6BfKC5ANmNriwhJExvKqtqpEXZhTLy
 BBNbVk8xeXNfDlFtZ8dVwEaofk/4Q244xxbL6WKUjzNbM7mtAImys7fOyqhtjX29cwY=
X-Gm-Gg: AY/fxX6Zvnyjo1t59ME3V5EkQxLIRFYZEFvIAoV2R8UoX0ephtUMTaWONHtS2hAkuiD
 HD/0CDcLKEBJrG9nK2aeXdIKLNw/kOPY/gqCIPgeLrhdh4V1t379GBarQPy3ZDySp8ONIN8JCgF
 AvzSylCYY1ryGejy8nokdb/Rgrwt6NfWrDz5P8AC+Ly3VS4c/LDhSY/iQNdLEl7qP6QYahZRdwD
 d5/TXjgka83bOj46AY1HZ8K/BWTfvUnIxgQeEXo5jNokQJLwtciwp6B+0E7Q6Ikq6zzc46s07TX
 Nl5/CZAK7qdUeC1cwFXaGouR+zOcbz1qxmXyIKsOy1wk5AY94Tt2Qlkt+On55NbJdCzDe9fLwqJ
 eW+BxE11Sh1HmBhKkyKKaYWsWJvyzwFksn/RDKmzv2V/BJi+d2GNeraxJH7oQyITE54Vg4QahoB
 dWHmEv34XPlP4=
X-Google-Smtp-Source: AGHT+IEdefbkAp+AV8nKuaVOJwcYStRCAQGUMrTome1AngMpQKdXqE1/UthnyfU7ixCQ9gudgLJb2g==
X-Received: by 2002:a05:600c:5306:b0:477:7b16:5f88 with SMTP id
 5b1f17b1804b1-47d84b0a992mr192540685e9.6.1768305106655; 
 Tue, 13 Jan 2026 03:51:46 -0800 (PST)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-432bd5df96asm42982732f8f.28.2026.01.13.03.51.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jan 2026 03:51:46 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 219585F80E;
 Tue, 13 Jan 2026 11:51:45 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
 Jamin Lin <jamin_lin@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Joel Stanley <joel@jms.id.au>, qemu-arm@nongnu.org (open list:ASPEED BMCs)
Subject: [PATCH] tests/functional: migrate aspeed_rainier image
Date: Tue, 13 Jan 2026 11:51:37 +0000
Message-ID: <20260113115138.3171479-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

fileserver.linaro.org is going away, migrate to the new share server.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/functional/arm/test_aspeed_rainier.py | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/tests/functional/arm/test_aspeed_rainier.py b/tests/functional/arm/test_aspeed_rainier.py
index 602d6194ac8..025e5751dc7 100755
--- a/tests/functional/arm/test_aspeed_rainier.py
+++ b/tests/functional/arm/test_aspeed_rainier.py
@@ -9,10 +9,8 @@
 
 class RainierMachine(AspeedTest):
 
-    ASSET_RAINIER_EMMC = Asset(
-        ('https://fileserver.linaro.org/s/B6pJTwWEkzSDi36/download/'
-         'mmc-p10bmc-20240617.qcow2'),
-        'd523fb478d2b84d5adc5658d08502bc64b1486955683814f89c6137518acd90b')
+    ASSET_RAINIER_EMMC = Asset('https://share.linaro.org/downloadFile?id=PaCHfyerwpSr0CV',
+                               'd523fb478d2b84d5adc5658d08502bc64b1486955683814f89c6137518acd90b')
 
     def test_arm_aspeed_emmc_boot(self):
         self.set_machine('rainier-bmc')
-- 
2.47.3


