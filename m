Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8309CCF9E0
	for <qemu-arm@archiver.kernel.org>; Tue, 28 Oct 2025 18:35:12 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vDoWj-0007Mv-Sr; Tue, 28 Oct 2025 14:34:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vDoWc-00077M-U3
 for qemu-arm@nongnu.org; Tue, 28 Oct 2025 14:34:33 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vDoWP-0004IM-Md
 for qemu-arm@nongnu.org; Tue, 28 Oct 2025 14:34:30 -0400
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-426f1574a14so4160517f8f.3
 for <qemu-arm@nongnu.org>; Tue, 28 Oct 2025 11:34:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761676448; x=1762281248; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5DmeGIOtnQgeitCackLcdl7/cs7kVLgAOODhMbDoGJI=;
 b=dlz//2b/LqJ9+l44emJzfc7Ki0c2Rt+fLe1uIMudzuhcnHcKiOB8+KeU+peYtwkR2o
 kw3RgIUWwBd81ellbWlWVhAz+xwr9zIFOqjNftHEkbUEEFNwsXFIrq9TU5ngrDYaztXd
 /YaxG1MvMULNR+6oOBHG4R7+pJqyixrWBOBSZEEAK7UrChBbLmx1N7BkzZtHr8YSA/Cz
 X5AuoAlGm99hknm7ODnyfCqU4q0N2b5c69FOVF/xLsCJdC87R7oO1lG4ZgD408IwpOMW
 nNDI5IYWhY8iwfzCxhhpWOtBeGGoHs5WDCs2+HUmxDMB8CYiNwEt7F3EmVy1HXsiMTBh
 iLdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761676448; x=1762281248;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5DmeGIOtnQgeitCackLcdl7/cs7kVLgAOODhMbDoGJI=;
 b=prApuXnH02A+++RS8h2JwO7xIFHIMLQqn03JUAtipvFE2zgQRHiO3GUHpUwX/Shm+3
 bBHU63pnSRvKGJWrBjTbtj7bo12xdw5Zga1gtt20zQmiTSIGtNfeHMLwgb1INYY2QWCU
 euqQw4zvOJBcbKJUvMp7Ew0iv5I2uwclLMZWXCt6tE1KYJsS590rdtykVLWJ+3zMBvpZ
 xT1lHtB50qDGOtENlszAB1GLTjqxiULfgao23DkHJ13lztUuc6neTiVJ+UopEJw9M3S+
 vxV3/KrUsQ/+WhmUdIUoxrrqv4+qfDfQ4laKJCY0I8ybs+1N/NRp+rmHUvlPWd16HaNF
 FFAg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX5FOjVLhRFE7l3VwbmOqwOn71XNf5SPuJdgwxM+Ecarg6jcp94Yz44yJ5bOomTx+urL0wWPco6sg==@nongnu.org
X-Gm-Message-State: AOJu0YxGl8JpY9rkuobM8ANreVHaNqI8U7rLyLuuqVsW9Op+hqR1kq1z
 NnKnE1AIawnaCRYMCrgreQceUdu77tldh/g4KEfp5WEzJzcScG8QSm/Hm0FK6m02XpE=
X-Gm-Gg: ASbGnct+4pev/g46w7kZ/g4cFnwquMeFL576xB81evFUI87ZCDXHkkNj3oZ897fCkI9
 S3f2cao05KVE9FTy0jQtCFugyPpX2hFxIClDz3FrhKqI3F6BY33dZRZBISnb4DcHkUtQ1bYPKCG
 OwbUpUkTe6Kg6PRuuz1bCahdJD9dwUvqEI28WdVV+GEBaPZTBmV4xr6cAbLjyUWI78ovbmTNmMo
 llM0FDtMw8Lfu9YHFHQ5zWmRYzkEnn1PnNbVjq3Mwa28M449yIRaMKXSTq+3CsxJ37v2eQi8Za6
 YJSpgnZ6cQSf3+FIPIBe7tfJYgiksndl/tBkwyxrf82gdpUOXFBsM5OVlhBaQbUjy4fi9Rb5xpA
 x8umbpLqL5WP14c661mLvi03wPEPyBL6unXh9djwFZgXV0f/f75kFquGbuddSZZJkWMlkwJNqlO
 xMdsohxnt92T7EF0WuyD2atYsH80VcY/aZ2/+rJrqSPHXYsIhsVw==
X-Google-Smtp-Source: AGHT+IHsIum+c9nT7pG2emhzPJVq5xAQ7ZBeEj43AMtw4RcW7IdMZOY2egDdd/SBNbjY67+SkP8JZw==
X-Received: by 2002:a05:6000:2512:b0:427:6a4:93da with SMTP id
 ffacd0b85a97d-429aefbe0c0mr45031f8f.49.1761676448174; 
 Tue, 28 Oct 2025 11:34:08 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429952cbb2bsm22064803f8f.13.2025.10.28.11.34.06
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 28 Oct 2025 11:34:07 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Mark Cave-Ayland <mark.caveayland@nutanix.com>, qemu-ppc@nongnu.org,
 qemu-riscv@nongnu.org, qemu-block@nongnu.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 qemu-arm@nongnu.org, qemu-s390x@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
 Jamin Lin <jamin_lin@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>
Subject: [PATCH v3 18/25] hw/watchdog/aspeed: Use memory_region_get_address()
Date: Tue, 28 Oct 2025 19:12:52 +0100
Message-ID: <20251028181300.41475-19-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251028181300.41475-1-philmd@linaro.org>
References: <20251028181300.41475-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

MemoryRegion::addr is private data of MemoryRegion, use
memory_region_get_address() to access it.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/watchdog/wdt_aspeed.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/watchdog/wdt_aspeed.c b/hw/watchdog/wdt_aspeed.c
index 30226435efc..f842d8e973a 100644
--- a/hw/watchdog/wdt_aspeed.c
+++ b/hw/watchdog/wdt_aspeed.c
@@ -274,7 +274,7 @@ static void aspeed_wdt_timer_expired(void *dev)
     }
 
     qemu_log_mask(CPU_LOG_RESET, "Watchdog timer %" HWADDR_PRIx " expired.\n",
-                  s->iomem.addr);
+                  memory_region_get_address(&s->iomem));
     watchdog_perform_action();
     timer_del(s->timer);
 }
-- 
2.51.0


