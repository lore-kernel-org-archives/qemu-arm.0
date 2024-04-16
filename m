Received: by 2002:a17:906:28cf:b0:a52:4db9:938b with SMTP id p15csp566244ejd;
        Tue, 16 Apr 2024 11:48:41 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWZ5c9ob6JNL1/qCeU3mL5RNmNNolYDT+01Wze/zSu3f1GnhMjv7IkQGWQMLGJCr5C45K5avbrD/+gYDNRVIjA1yElE5IBJ
X-Google-Smtp-Source: AGHT+IFtSr7n3pMB4+i1+fE4U7SwcmACAzUOb2xLwaQtIvK0rF8/n7/JfL7C6Mt1B7J59cSobcuO
X-Received: by 2002:a25:db8e:0:b0:dc7:4bc5:72cf with SMTP id g136-20020a25db8e000000b00dc74bc572cfmr12467982ybf.14.1713293321398;
        Tue, 16 Apr 2024 11:48:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1713293321; cv=none;
        d=google.com; s=arc-20160816;
        b=mpxQo8SjF/KvoLLygAjsn7ju2PqHIoGAB2sq9FgiIgxfsJWWKkj/1/73m2unXQJXv9
         LjyQ1CJEZ0AG/HrrvhWk2knh8KTn2iLd+ChsU8AXZecnf56JUsTb2sk6xOnYmCu3eBkW
         Udbn9Mv/NwMZt8UMmkEaJ5suubBVkXNmJ7smtq7GevHQVKM28aJho7X8a2tsBiaLZCk9
         nNCJ1+YjeL8OPeKUsNLk+oUQDtBfYnTNj+cWECnAuCmvPeTmPpi5s0m/Xjv98VIORP6N
         up2JheLl7LSEERlmOlIReFgowgyqQN6oRxgCKqpldxb88Rk90u/5PM5wFQs38T5EeGlh
         9mTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=xGn+yfMUz11JyYIw92kbWBG3cmCj73SLHNFhXZICy+A=;
        fh=SGEsPya3V3BI/NBcxqYfr743WWpn6JxQnb+XKTmlxKU=;
        b=YD9vhemN7Ncyjysc6K/RA6VT00+9oVoSiMasFV4vDNV19p14gPrlDY4DWuRyMkE5qH
         KTWE9vwTiFx1T1/PpNCSdOQ7Oc21aC4/hUdG8xbD79eWyS+hsuSmCUTuzLQ6JwCOAvYb
         q7Q4BmJJE7MwDqSmFTuwbVoPvWbf1dO7xZqgoVwtX9zd2kdglVyefFgDo40rYWvdXMDO
         kupC38L60lVpVWahO+GKUUk5tHUZokA2VbuUEnoPivzsHNjr5AS9pAHNn7ix+3OkyX8h
         RUodBoi9DZSjdFEBCvQbPfflR+/O1Kv12mJOYCxtstAoKsmzHPI6KSYsgS2z6rO1nqUk
         AlAQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pCs3FpTH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id fc4-20020ad44f24000000b0069d2d99d682si2393977qvb.236.2024.04.16.11.48.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 16 Apr 2024 11:48:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pCs3FpTH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rwnqF-0003aQ-Sd; Tue, 16 Apr 2024 14:47:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rwnqA-0003Yo-W3
 for qemu-arm@nongnu.org; Tue, 16 Apr 2024 14:47:36 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rwnq6-00031C-Gp
 for qemu-arm@nongnu.org; Tue, 16 Apr 2024 14:47:34 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-415515178ceso29505495e9.0
 for <qemu-arm@nongnu.org>; Tue, 16 Apr 2024 11:47:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713293245; x=1713898045; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=xGn+yfMUz11JyYIw92kbWBG3cmCj73SLHNFhXZICy+A=;
 b=pCs3FpTHAOzE9KigXLe5mOORs24V/gHsE9FSUF+C0k7GZGAAKyvizpuEx1EMQ67U06
 CPgUCxDFpCQNTQRX1/ry82DzeKHmRivPz30pEDShi2CtaGHybiHFOf4fpB7iAht7Bt89
 6zR9mfYcSbVZM79/D7NCjuLD/NGeUSQEjNNlywY/4SV45L8wHBH0Fdf+qs11MTUXfrUV
 sncM3eKXQHUkPXAZtWJkQ48yL213HDQR8WDykEXvmBHSOqmb/xJL85GB/u4WOxNETh6h
 81NBa1488C9J7l2wykgGPxVK4MCv9ZomTdHIif0ukUlXJtwqkLh0cwJwTgVZYmQZl22N
 N2ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713293245; x=1713898045;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xGn+yfMUz11JyYIw92kbWBG3cmCj73SLHNFhXZICy+A=;
 b=xOR7t8tEYj8DNgewcP8DPrYGaZAVfieTlgCXQbjYE57LB3BvZ3N8ht0wiYZidXLf95
 iyMMszpBfaeNtPjnr48MfiudUjkc4b4+b7jdubFSAd0qZPFD2IWz0ebb32iox8IxW0hY
 nuxffejkRjEXL6Pm9ZbkWqiyR52oym7WM49pC7IYg+jOlygCJLcT9XLF0Hkkvh+tDtW8
 9icEt/19Uo3r2Rq81aVKc98OfI10UqKcQDdz3GM5I2bszLy7hsiyQ+ZkkHtNPYEp0XrJ
 fhcaHwfu28jyi6az4XCiSVkbWym+WT6hIAXP8imU+OMz6lCcaq2e5WRXWAz9NdPwJruj
 ZIiQ==
X-Gm-Message-State: AOJu0YzqjpnLL2VramnnIdRq5+S0rPiX90panlc9dC1bNFr28egD5ZMQ
 pK+xjw62H6BU8eS4DN8DW7h3fImnCgEmbR71EooAzE4jxJiqddPigSuR88dmcI8=
X-Received: by 2002:a05:600c:1e1b:b0:418:6900:96af with SMTP id
 ay27-20020a05600c1e1b00b00418690096afmr4449823wmb.25.1713293244987; 
 Tue, 16 Apr 2024 11:47:24 -0700 (PDT)
Received: from m1x-phil.lan ([176.176.155.61])
 by smtp.gmail.com with ESMTPSA id
 a13-20020a05600c348d00b004186eb69a55sm7331020wmq.25.2024.04.16.11.47.23
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 16 Apr 2024 11:47:24 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Corey Minyard <cminyard@mvista.com>,
 Philippe =?unknown-8bit?q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 0/4] hw/i2c: Convert to spec v7 (inclusive) terminology
Date: Tue, 16 Apr 2024 20:47:17 +0200
Message-ID: <20240416184722.28334-1-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: f4FqNLO1PT6v

Since v1:
- Convert TYPE_I2C_TARGET definition (Paolo)

Mechanical (mostly) conversion inspired by Wolfram [*] to
use inclusive terminology, similarly to the other renames
we did 3 years ago, shortly before the I2C spec v7 was
published.

This series convert core I2C. Following will convert the
devices and SMBus.

[*] https://lore.kernel.org/all/20240322132619.6389-1-wsa+renesas@sang-engineering.com/

Philippe Mathieu-Daudé (4):
  hw/i2c: Fix checkpatch block comment warnings
  hw/i2c: Fix checkpatch line over 80 chars warnings
  hw/i2c: Convert to spec v7 terminology (automatically)
  hw/i2c: Convert to spec v7 terminology (manually)

 include/hw/display/i2c-ddc.h     |   2 +-
 include/hw/gpio/pca9552.h        |   2 +-
 include/hw/gpio/pca9554.h        |   2 +-
 include/hw/i2c/aspeed_i2c.h      |   4 +-
 include/hw/i2c/i2c.h             | 123 ++++++-------
 include/hw/i2c/i2c_mux_pca954x.h |   2 +-
 include/hw/i2c/smbus_slave.h     |   4 +-
 include/hw/nvram/eeprom_at24c.h  |   8 +-
 include/hw/sensor/tmp105.h       |   2 +-
 hw/arm/aspeed.c                  | 290 +++++++++++++++++--------------
 hw/arm/bananapi_m2u.c            |   2 +-
 hw/arm/cubieboard.c              |   2 +-
 hw/arm/musicpal.c                |   6 +-
 hw/arm/npcm7xx_boards.c          |  44 ++---
 hw/arm/nseries.c                 |   6 +-
 hw/arm/pxa2xx.c                  |  36 ++--
 hw/arm/realview.c                |   2 +-
 hw/arm/spitz.c                   |  12 +-
 hw/arm/stellaris.c               |   2 +-
 hw/arm/tosa.c                    |  14 +-
 hw/arm/versatilepb.c             |   2 +-
 hw/arm/vexpress.c                |   2 +-
 hw/arm/z2.c                      |  20 +--
 hw/audio/wm8750.c                |  18 +-
 hw/display/ati.c                 |   4 +-
 hw/display/i2c-ddc.c             |  10 +-
 hw/display/sii9022.c             |  16 +-
 hw/display/sm501.c               |   2 +-
 hw/display/ssd0303.c             |  14 +-
 hw/display/xlnx_dp.c             |   2 +-
 hw/gpio/max7310.c                |  14 +-
 hw/gpio/pca9552.c                |  14 +-
 hw/gpio/pca9554.c                |  14 +-
 hw/gpio/pcf8574.c                |  12 +-
 hw/i2c/aspeed_i2c.c              |  16 +-
 hw/i2c/core.c                    |  90 +++++-----
 hw/i2c/i2c_mux_pca954x.c         |   6 +-
 hw/i2c/imx_i2c.c                 |   2 +-
 hw/i2c/smbus_slave.c             |  12 +-
 hw/input/lm832x.c                |  14 +-
 hw/misc/axp2xx.c                 |  14 +-
 hw/misc/i2c-echo.c               |  14 +-
 hw/nvram/eeprom_at24c.c          |  26 +--
 hw/ppc/e500.c                    |   2 +-
 hw/ppc/pnv.c                     |   4 +-
 hw/ppc/sam460ex.c                |   2 +-
 hw/rtc/ds1338.c                  |  14 +-
 hw/rtc/m41t80.c                  |  12 +-
 hw/rtc/twl92230.c                |  16 +-
 hw/sensor/dps310.c               |  14 +-
 hw/sensor/emc141x.c              |  16 +-
 hw/sensor/lsm303dlhc_mag.c       |  16 +-
 hw/sensor/tmp105.c               |  16 +-
 hw/sensor/tmp421.c               |  20 +--
 hw/tpm/tpm_tis_i2c.c             |  12 +-
 55 files changed, 541 insertions(+), 506 deletions(-)

-- 
2.41.0

