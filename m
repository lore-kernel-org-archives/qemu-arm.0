Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F6D3D2D108
	for <qemu-arm@archiver.kernel.org>; Tue, 13 Jan 2026 14:01:22 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vfewx-0006kI-9R; Tue, 13 Jan 2026 09:00:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vfew5-00067q-PS
 for qemu-arm@nongnu.org; Tue, 13 Jan 2026 08:59:55 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vfew3-0000wz-J4
 for qemu-arm@nongnu.org; Tue, 13 Jan 2026 08:59:52 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-47ee0291921so2335035e9.3
 for <qemu-arm@nongnu.org>; Tue, 13 Jan 2026 05:59:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1768312789; x=1768917589; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ZJ1SgCOujNhPuSC3X0aTiI8c4qVh65QJa2DrhUMbkZA=;
 b=M0yWPQqx7cdzsR5iI3PlibJVsuzGl+s/KdB/nlWdiDkFb3XJhvpCndS10UiUDVCegE
 x8j+1jPam2c7Fo2ar52u9XhYRGUyhg546K+/bZnSl09PMvOCwzhMy6Jwx9Wj+qsM+71Z
 COvY9KjcMkTePSMtwRDNnttCnDpEaLrEP50iVWTUWLyqijkf4sSDOlXHwq1CbqglN0Gy
 cuAvfSDtuP1r8iGU2TRh+rf5wzds5RgsloDCdRS4+LJl6Bf+WY6NDsmkBUvWyQ2pGBsc
 Uokyvh4Vf0txDLRIGox7vq7w5lyQFIlGRaKbA5vMsUPgDB+X9Rw/2WKOIzU5ODqKmf5M
 3mkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768312789; x=1768917589;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZJ1SgCOujNhPuSC3X0aTiI8c4qVh65QJa2DrhUMbkZA=;
 b=sJPplnrq0gfyFYfb1P89td/gVuPO2DPheghW/LAycs5GIj08lg3gpGI6MZjIpuL8nq
 xSD8kqZAPqsTLPlPFaJTmnZR0L4nJW3bFj6sqb+EVKSULwV+7zSpmNjvYtw761G1306A
 m17zs0PwlpD+aHEw7upeXf+OlAr7/UhPpAhbf0m6DVQWefsitVPOo6BCysDXlGv3rwWy
 vFAnlKOamj9pouOX2iza5lIm7YTj8nP0RRZnhjRIkjeKRS/YOMhI43UDrw8UMazqgHm9
 ddz2PvYPSCz613rybmIagWEgGpVhoDpa+eySq1W4teYHHEC4ngHP+G5W+93asHswHo1G
 P8nQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUGARjjtQzA4ur8987J5+xrfGgdwYv52n1C27kWBCmeZXpAnnGj+aRHdqW9b8q1YlFXDrdzS+bY+Q==@nongnu.org
X-Gm-Message-State: AOJu0YymdPbCezd9/qrsOHyA/t+xl/2wsHAAd/TmGpHNo6ujnFQLNtMV
 q28VjnH4mEqPHCeKNkFDJNHZBCmq4sVGtSNZckJr2DuDy2ozms+LbbDpCwbHtiLU4BE=
X-Gm-Gg: AY/fxX7cUP7OHw+Mu2BA0smB1UgnaZGT+6beQxP2ddnL1qK6s8Pntdvcq2ql9oXcbeC
 viud7jY3QJg7Y4oyA30kvB81hFzs9K+CVKCqNCiA45+0g8t4F+avuX+1WVkuqCj2nLmnkteJ/1L
 11yCWjs8FSQFNNYE/Wo9CmsfivWisE8d1h8EtnywSJldWLtj6V1UDmSExnqGmJsCPUCD1hGzWut
 Q6uD7AUKhtrQ5cN2aFLztwwQL8dq0kAUgUXqwbRV6oXlhhdsuacJh8+2C+fruoGgYWiUT4y5D4+
 bOR6HU3x+su5vGSS2ZNF9ihen2pWY0LL5UNsnCi8PRi/3220lUbkW7J82NPYkQYfdFrfzZ5yFhB
 6HBtozSvQ2s5L15FT7qoDf0olFILA5Ge+9Jif9PwAJs9gPvrtL1rSic5hdR9TGwekIPQvIhMDE1
 XMO/79jNuo6AM=
X-Google-Smtp-Source: AGHT+IH8R9ff//fB9odDVGggAgk0NKnc8UovUO3TadWGQ6Qsy8Ppy870injZlQ20uilandi3+iWe6g==
X-Received: by 2002:a05:600c:83c9:b0:471:114e:5894 with SMTP id
 5b1f17b1804b1-47d84b3bc10mr234349795e9.25.1768312789022; 
 Tue, 13 Jan 2026 05:59:49 -0800 (PST)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47d7f653cd6sm429053545e9.9.2026.01.13.05.59.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jan 2026 05:59:48 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 773025F805;
 Tue, 13 Jan 2026 13:59:47 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
 Jamin Lin <jamin_lin@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Joel Stanley <joel@jms.id.au>, qemu-arm@nongnu.org (open list:ASPEED BMCs)
Subject: [PATCH v2] tests/functional: migrate aspeed_rainier image
Date: Tue, 13 Jan 2026 13:59:41 +0000
Message-ID: <20260113135941.3361163-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32a.google.com
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

Cedric has a host for the file which allows us to keep the name.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Cédric Le Goater <clg@kaod.org>

---
v2
  - host at kaod instead to keep filename
---
 tests/functional/arm/test_aspeed_rainier.py | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/tests/functional/arm/test_aspeed_rainier.py b/tests/functional/arm/test_aspeed_rainier.py
index 602d6194ac8..30827beca35 100755
--- a/tests/functional/arm/test_aspeed_rainier.py
+++ b/tests/functional/arm/test_aspeed_rainier.py
@@ -9,10 +9,8 @@
 
 class RainierMachine(AspeedTest):
 
-    ASSET_RAINIER_EMMC = Asset(
-        ('https://fileserver.linaro.org/s/B6pJTwWEkzSDi36/download/'
-         'mmc-p10bmc-20240617.qcow2'),
-        'd523fb478d2b84d5adc5658d08502bc64b1486955683814f89c6137518acd90b')
+    ASSET_RAINIER_EMMC = Asset('https://kaod.org/qemu/aspeed/rainier/mmc-p10bmc-20240617.qcow2',
+                               'd523fb478d2b84d5adc5658d08502bc64b1486955683814f89c6137518acd90b')
 
     def test_arm_aspeed_emmc_boot(self):
         self.set_machine('rainier-bmc')
-- 
2.47.3


