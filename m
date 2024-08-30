Received: by 2002:a17:504:3a8f:b0:1be9:327d:8ee3 with SMTP id g15csp356258njf;
        Fri, 30 Aug 2024 11:05:36 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWvQ6uHiCnxtLkxvDUzgnKK00zU+zZt7joD5GLMMHHSgO3M23LOTW0bUvI2LdU6V8I03XScofqE1r7qbw==@linaro.org
X-Google-Smtp-Source: AGHT+IEmlr7KZjzT3y3GoMfJf3+BJJD0kiNRit7M06QJ8i8D/nlXLRuR27PkWarpM3C0/VuvHzwo
X-Received: by 2002:a05:622a:4d09:b0:456:959d:ec35 with SMTP id d75a77b69052e-456959e0d15mr8546351cf.37.1725041136018;
        Fri, 30 Aug 2024 11:05:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1725041136; cv=none;
        d=google.com; s=arc-20160816;
        b=YQILPqiY49dQzUvUcobfKjgw2jMQc1kEFE4D70yHkYFYRZYYV0Za9OH5UCZjTeh1fv
         PN6BR2xSIgoaIhrUD3uESBDn12jnjwyVfzjgtqh2QxWa8XxAWi4JfJsrvQdUMc4pjFfe
         sBXUd54ixJ6c/L4TwG4oBe/XKXTQ9O7qhuBfTRkGH1qeF5dh1F8Z4q4UCqMIjh/UgwFm
         w+krbE77545wekl5xqNLcpuzvslXFlUDvnYhIJ8ICFoaNlOjuU9M0kArWlkeanIjCLND
         sbvWbqk3CZZ5XdgylMc3drg79iIPR6qZsTv2AiWcQpGZkwOslYtHToJDYbZi4YCDnsI+
         lM2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=87fChB+xc7soA2EPRxfWWl3aNqmrKrcv5Gq87Q1dcqo=;
        fh=U/0C24lFKzzomuy67bTtM+LZKjwyWOJtFrkAZXiyaww=;
        b=nZtue5yqWjieIskPAj2Z1G/07jkb21EC5a93RdG2wdqBxvvafTZaApt8v8lvbSQOdv
         41jKzKNG+T8ulnuefqg2XgVR0+PETVkXl2VStx7SuIScLDAahukwRDkAnXzlKhQorV+S
         1NAl5bSItkUYwQCiZI/ahQwkU5uBgOHwVxr6K/NZwJTJZzr3PiYZ2ghiaobQOhvGvS5L
         XX0NALBXKKxyIt6uO9LTIzYcpN+u6BjPyo29y9fnzljetKE05Bp3vU3gFqT2Xw3J9VyB
         ANvzvp7A2wVYXJbVMhLgul+XcVc4xc4Tz6u3kz7OxihIoRiR45xHi50zMrgc8VzyeFMd
         LTnw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="FIqM/CbS";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-45682dc8784si5678321cf.590.2024.08.30.11.05.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 30 Aug 2024 11:05:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="FIqM/CbS";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sk5zw-00037Z-TT; Fri, 30 Aug 2024 14:05:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sk5zv-00035I-0i
 for qemu-arm@nongnu.org; Fri, 30 Aug 2024 14:05:23 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sk5zs-0006Yj-45
 for qemu-arm@nongnu.org; Fri, 30 Aug 2024 14:05:22 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-427fc97a88cso17718675e9.0
 for <qemu-arm@nongnu.org>; Fri, 30 Aug 2024 11:05:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725041118; x=1725645918; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=87fChB+xc7soA2EPRxfWWl3aNqmrKrcv5Gq87Q1dcqo=;
 b=FIqM/CbS4br1G/WLewwDxMx2ivRf0XUfGdn+p1D6P5q86Hm0k2B0DK4YCyDw7Bq9F8
 FWd9ikntxQ81Hd0j3kg3UoNgOnIUbkft+X8dbCRBFxk4DDBtmZ+vXaZs6gYaaKbNLn7i
 j09saCLvJ+SxGEd/rPGOQVXXdpI/fkRkpkgqSQoRlCw5zk7Lbtev51S8kBlPEKd+5bhe
 E+l4AFhDtN6GCFW2Nkg9Fsdfv+CWCwlz+tgCYbrrSadgQErbenBz6KC7PecLtv0Jxhhy
 Q2MOnQYjmkzaaIRZiwPVm/afkwmSeTFxfznDY7LJDbJNyXG7cyZBcj+78m5R8z9g9bnu
 ZRkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725041118; x=1725645918;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=87fChB+xc7soA2EPRxfWWl3aNqmrKrcv5Gq87Q1dcqo=;
 b=rmU5nsjR8TxhOfcXo4as2FwMZVQRRYDWImSjAGPjLy9hTRVjewBqJaf9nvbw7VMXD3
 Ovw+lyb1AzgXxyInG+N6LxlwWmsiVbIyK4mpLNIBxzMc0T6FvsCOoUZYAHHuUCdejxeM
 v8Go51p9xJkQDCKp+n7tKqyyR1h9fRFbcxTZ6Ou7ibufbhdvTaFYsaEPI1CCI7t8zIIj
 SL6U+GuX7Z+eAGpX5aWnyLj+6wE1H2p//pFRCrfTWAENLT/59qhvYWbP7Zd2lvohvGLa
 UIUDtfBLBgy8na0FRcSUXQaSDICecZq8VflwADndPyYXzrqLom/m5StW36Q/MIDfJd8b
 FQcA==
X-Gm-Message-State: AOJu0YyFW0sDdYZmbUcPG42COkGcxpq3wcdWd5OR64O4dZ+BYU0VQA+4
 gQlhUDC1Q3VMT/cTek/1LXKumTXVXYtT5UOU2kEln/ac9B/FehQdYOqE62N8iUdbzHLE7np4g4y
 x
X-Received: by 2002:a05:600c:3c93:b0:426:67f0:b4eb with SMTP id
 5b1f17b1804b1-42bb0244482mr54257325e9.2.1725041117971; 
 Fri, 30 Aug 2024 11:05:17 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42bbe79f545sm18969555e9.2.2024.08.30.11.05.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Aug 2024 11:05:17 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH] hw/gpio/aspeed_gpio: Avoid shift into sign bit
Date: Fri, 30 Aug 2024 19:05:16 +0100
Message-Id: <20240830180516.2103062-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: KTtJfhz/roOc

In aspeed_gpio_update() we calculate "mask = 1 << gpio", where
gpio can be between 0 and 31. Coverity complains about this
because 1 << 31 won't fit in a signed integer.

For QEMU this isn't an error because we enable -fwrapv,
but we can keep Coverity happy by doing the shift on
unsigned numbers.

Resolves: Coverity CID 1547742
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
Very minor but I'm just fixing a few easy issues on a Friday
evening :-)

 hw/gpio/aspeed_gpio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/gpio/aspeed_gpio.c b/hw/gpio/aspeed_gpio.c
index 6474bb8de5b..d6ccf63a2ff 100644
--- a/hw/gpio/aspeed_gpio.c
+++ b/hw/gpio/aspeed_gpio.c
@@ -281,7 +281,7 @@ static void aspeed_gpio_update(AspeedGPIOState *s, GPIOSets *regs,
     diff &= mode_mask;
     if (diff) {
         for (gpio = 0; gpio < ASPEED_GPIOS_PER_SET; gpio++) {
-            uint32_t mask = 1 << gpio;
+            uint32_t mask = 1U << gpio;
 
             /* If the gpio needs to be updated... */
             if (!(diff & mask)) {
-- 
2.34.1

