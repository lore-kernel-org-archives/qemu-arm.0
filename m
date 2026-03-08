Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1441AEA8541
	for <qemu-arm@archiver.kernel.org>; Sun,  8 Mar 2026 20:36:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vzKqY-0007Db-Ep; Sun, 08 Mar 2026 16:35:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1vzKqX-0007CN-EQ
 for qemu-arm@nongnu.org; Sun, 08 Mar 2026 16:35:29 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1vzKqV-00044A-R6
 for qemu-arm@nongnu.org; Sun, 08 Mar 2026 16:35:29 -0400
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-439b7c2788dso5326662f8f.1
 for <qemu-arm@nongnu.org>; Sun, 08 Mar 2026 13:35:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1773002126; x=1773606926; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=62gCgQG/SMP3y4B1tt6fRNn10YsHIOVvwcEBSzKHvaM=;
 b=H9CiWwTdI0ffNqa7x2o8w1HDo1bvXZaYuWr2YtskW3si4xmZMKfcqRZqhqt+w2RXup
 oV04fMrfalejFYFdQn0QfHuMHvlLvjmgSIlqaaxj+K+cLJ8ytq1yy3TM96hFmdm02G+e
 raBrF4AKlJn9k/fGN70YOTrEvS/u9NH/pcrr2uYi+AawJ4r3gfD6GRe9dcdQgQF1+6AV
 EytrcLbS2dyMhBTqv2SCG68PEaYAWB575YXKeba8Pj+909zi2E25Zq7vjunvb2KX5XGa
 gCCX3QZcqYASBblXgNtm6sZ+PpW5+k1OagDutm6aFINm57S3L3Yv8R645czJXC0kG7tb
 boxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1773002126; x=1773606926;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=62gCgQG/SMP3y4B1tt6fRNn10YsHIOVvwcEBSzKHvaM=;
 b=SSU9ITED9OtxjccAKIyET815ObzCiRQjtJH3Fo8dlVKLQBw3YWTv7Q0tR0Q7suQMf9
 OKUF3w8TJVvjFkkYQ1VQoGplmhpwJk8Y1NZdGFNOXXjcIdqEiKaWD3jo59QRb6d4jDgb
 0RctUryyslVfgnMlK7NGsTDHgDmq+UJLI4rWYoyPtnMfpxokFUr4qpVwrDOSbgUJ29e0
 /HBK6e6HgXwlvPb0n6Ejkoh9E5FOUAcJympeFi/JgJ52pMhiOL2h8AOWk2SbOPDYPZOI
 RHMKhi8N86httQ50teHG/I7DLeD102JFuZFqx8Y72121MJIgoW5FOELLp0xTiFt8YLQ+
 oZOg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVktbJxhdb79Od0AhlPeLyButPBDINBKowy8oN9i4peHQVBGFfxKkbLUfh7nCld9nglO/jOZGOwog==@nongnu.org
X-Gm-Message-State: AOJu0Yxv4GDUlg36NNZM6JoESzfVOl8X1XtkZGzLoQrHtTrHs8xbg0Qb
 e7/CsU1ZTWadYgtJ+ccAP/Z8WWamP2y43QoNLAbFDYkNZVawr4ZY9Osg
X-Gm-Gg: ATEYQzxJfMzkJIrLTxa4C6lphqFOeKEK6lQR8rY8WJ2FZghQ8fzJE38cKh4l1Njv450
 KTaOgGZCYzwiqtZU4xKhKz2hQY4ZfnmUa6x3aLfSAL3ntdSYyb+WuXHdUJE1Yl9yDURWysUcd/c
 JmEvBJD+Cebxkta9HCO3XKONyURZMCi7jH8boIQCy2fYn+aovElkXFGDhLymd9yByCrLazeUpeo
 +B5oI2EHrk1cZb4l+WfDT/v1V/t/I1yjQCNVJcDibfWrZdkNaxy51X+HBlysJKxAEDbP0+QGu/m
 mMCIFn5YbJeJcMTWTO3O4vpc2Rf9qoJR0D/6/Cx0k1qTPs9KISpoaGnG54xFLMT0v1IINECYXs7
 Cm2ZGoWnvU8KpVENcTRhZZfCcaOVYDtAhOhxHRF8ytab7oLN090CK+/vI7iL1pxJgk3ihvGmqqs
 /R8xjvxv+Pj1sSYG9GYK8gGsJK8/vxYUAAt+RrYIBrMfigmSGOXVLxyt+k4w6mCY06SsIGnOCFi
 NefY7mH/S91Cx+PskgnhuopL3Zj/suPTqf3jmnbJA==
X-Received: by 2002:a05:6000:258a:b0:439:b666:6cab with SMTP id
 ffacd0b85a97d-439da679715mr15229730f8f.40.1773002126096; 
 Sun, 08 Mar 2026 13:35:26 -0700 (PDT)
Received: from Provence
 (dynamic-2a02-3100-25c6-8f00-0219-99ff-feb2-2458.310.pool.telefonica.de.
 [2a02:3100:25c6:8f00:219:99ff:feb2:2458])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-439dae2bdf8sm20995508f8f.25.2026.03.08.13.35.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Mar 2026 13:35:25 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Eduardo Habkost <eduardo@habkost.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, qemu-trivial@nongnu.org,
 qemu-arm@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Bernhard Beschow <shentey@gmail.com>,
 Gaurav Sharma <gaurav.sharma_7@nxp.com>
Subject: [PATCH 1/5] hw/arm/fsl-imx8mp: Do not create redundant unimplemented
 devices
Date: Sun,  8 Mar 2026 21:35:12 +0100
Message-ID: <20260308203516.160103-2-shentey@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260308203516.160103-1-shentey@gmail.com>
References: <20260308203516.160103-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=shentey@gmail.com; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

The GPT devices are implemented. No need to create redundant
unimplemented devices.

Fixes: f8b26121762c ("hw/arm/fsl-imx8mp: Implement general purpose
timers")
cc: Gaurav Sharma <gaurav.sharma_7@nxp.com>
Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/arm/fsl-imx8mp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/arm/fsl-imx8mp.c b/hw/arm/fsl-imx8mp.c
index 79f9142777..0119a18416 100644
--- a/hw/arm/fsl-imx8mp.c
+++ b/hw/arm/fsl-imx8mp.c
@@ -688,6 +688,7 @@ static void fsl_imx8mp_realize(DeviceState *dev, Error **errp)
         case FSL_IMX8MP_GIC_DIST:
         case FSL_IMX8MP_GIC_REDIST:
         case FSL_IMX8MP_GPIO1 ... FSL_IMX8MP_GPIO5:
+        case FSL_IMX8MP_GPT1 ... FSL_IMX8MP_GPT6:
         case FSL_IMX8MP_ECSPI1 ... FSL_IMX8MP_ECSPI3:
         case FSL_IMX8MP_ENET1:
         case FSL_IMX8MP_I2C1 ... FSL_IMX8MP_I2C6:
-- 
2.53.0


