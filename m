Received: by 2002:a19:f807:0:0:0:0:0 with SMTP id a7csp733503lff;
        Wed, 16 Jun 2021 14:44:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx3qJXn3z6hbDsUZV4sithrP9wv7ldViiQEw6gl5Q+ZGmZwjA0wj12583r70BmPGaBI1UYk
X-Received: by 2002:a67:6bc4:: with SMTP id g187mr1453317vsc.59.1623879847256;
        Wed, 16 Jun 2021 14:44:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623879847; cv=none;
        d=google.com; s=arc-20160816;
        b=Z3F7ASTdj5jnSnFOaCxHpSLFaLhKFf/OnkrzMKQ/AW9fLIzMMm+HP7DA75hMmkD/Xx
         0Aq3bM9q35UPTfMZ1yfyxFUCtqenmP0BspwD7Y6xepFS2jF3DRT8psoxpTDcaSMAGcZ6
         PIGnWYYcFlGUN+d6uvgx02cvTUMtb/SuombW6JzKu1R5yYUy996jQ7sKrfBetZk+UCzX
         VxK7xo5LPvIy17ADEgRmHF5rsyLDpWFx5EFUGO9H9KdfTZLVLfCZ2K7yCe+6KvoD+z9q
         iSNi0c0VwO2TSdd+NKbFnOEfyfiejWZbsG3KEYYYf9gpzOI8Z6/fztw815WGFezUEkZA
         bpGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=WmyHaJHcvUKLEVm6aSpmTart9qZchQ/2Um+oWz7mMdA=;
        b=SdzhoCZIACmxjGMj8GmQ7nlktEz7yREzJO7xTdCH6/MBanXZePJM552o7Sahe9eZQc
         AYhW5CnwQU43BA6nW/Zov0C92zb+HiXmznTA+YvB6G4DyjUVRjFclYZbutqqHL9/zOtD
         382gd6v2v9KAHhcuzbvqfj6EzzHiBIaMF7iMiujE69IaILRwoVJbHmjL8F7RMOJOPiKP
         XV5cZ/cXa7xInxYh17FeD+qweXuCrhRG/xgL2feDtLdwlXCCxHNCaRyF3tcaTcwuOlYb
         QtOedb8LLc5YVxjPkrHckDPUFaV1u+o8ucFaXruv9f+MG32NBXL9VN25ePNIwOmpgEsm
         MrHQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=gSI59bBq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r17si2531765ual.32.2021.06.16.14.44.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 16 Jun 2021 14:44:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=gSI59bBq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:39068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ltdKQ-0001uO-9W
	for alex.bennee@linaro.org; Wed, 16 Jun 2021 17:44:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49046)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ltdJt-0001ML-Ub; Wed, 16 Jun 2021 17:43:34 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:50908)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ltdJs-0006Rr-Bf; Wed, 16 Jun 2021 17:43:33 -0400
Received: by mail-wm1-x32e.google.com with SMTP id k42so179820wms.0;
 Wed, 16 Jun 2021 14:43:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WmyHaJHcvUKLEVm6aSpmTart9qZchQ/2Um+oWz7mMdA=;
 b=gSI59bBqHbKcJKwzyvgmBKRH5hvXTSABasX41TFH0De/0Ui4pY4hIG+zBJDeqUbSnC
 AU9C0rAUllPQMS1RoWs8fBMLcNvLJZ0TpfB6Py1dX3YMzI6Z1P6vYxfOhdqbOwqQtMI0
 1jb9RSyzBw+QTY3cbEjP1dWgJm1qFfjjQ33uMbnPvrjFqt8yUmlyDXDx9r6kFglH27AO
 67bXjcDjEIcWlX2B3qfEvr+5RAhNehJ06q2u5sCD78bjhGHs5uIp8+5ZhCRz3bBOr15n
 8WwoonqxtHQJDib8Lez0oT7RO75UtBh+xQppFshNYBZg/tClz9hWJsJj6o7YGia7pbae
 jFGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=WmyHaJHcvUKLEVm6aSpmTart9qZchQ/2Um+oWz7mMdA=;
 b=WEOAd6PSZgPSb8oGihtimP5u9EpBbxecwqawj/PJXQyrOGjh7iiBxxqStsZ99c4Mtr
 FD7U0ZHhznOWw/P/QZWCNzuIotgg6jSE+7XS4LTOIDyMdbjBRlhIsNAhJpCv1xj5LB42
 sGJVaIRL7SGGRBJ0ryntKN131mLYKyn1DOslRy+F8WDJoIY9udr1I2LcQhMzpKHNTQ7H
 hY3eHlri9gIy5AjueBJxsi+WS/ws6SYSxyVmuHmLZ2KwRMJjwonNk2TEZ9OCPLhmYIIn
 ohl71aTXEp0YLu1qXa0Ot1F4/L3Nu/U6tX3Wgokrnnj6QWmFMX82u94lvO/wO5u/3xfZ
 OCRg==
X-Gm-Message-State: AOAM533JRswyYZIdVP/Nnpf0i5Yv9Q8x/SwQAxKEU7S+ekZGNBw36W1i
 21oKGPsRXpAbJ2O9AJczTt/SJoT0QV+r+g==
X-Received: by 2002:a05:600c:1ca6:: with SMTP id
 k38mr1147060wms.49.1623879810085; 
 Wed, 16 Jun 2021 14:43:30 -0700 (PDT)
Received: from x1w.. (93.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id m65sm2796646wmm.19.2021.06.16.14.43.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Jun 2021 14:43:29 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 06/15] hw/i2c/ppc4xx_i2c: Replace i2c_send_recv() by
 i2c_recv() & i2c_send()
Date: Wed, 16 Jun 2021 23:42:45 +0200
Message-Id: <20210616214254.2647796-7-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210616214254.2647796-1-f4bug@amsat.org>
References: <20210616214254.2647796-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Corey Minyard <cminyard@mvista.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 BALATON Zoltan <balaton@eik.bme.hu>,
 KONRAD Frederic <frederic.konrad@adacore.com>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: cLMUT6PuwpUj

Instead of using the confuse i2c_send_recv(), rewrite to directly
call i2c_recv() & i2c_send(), resulting in code easier to review.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Acked-by: Corey Minyard <cminyard@mvista.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/i2c/ppc4xx_i2c.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/hw/i2c/ppc4xx_i2c.c b/hw/i2c/ppc4xx_i2c.c
index f4c5bc12d36..75d50f15158 100644
--- a/hw/i2c/ppc4xx_i2c.c
+++ b/hw/i2c/ppc4xx_i2c.c
@@ -240,11 +240,14 @@ static void ppc4xx_i2c_writeb(void *opaque, hwaddr addr, uint64_t value,
                         i2c->sts &= ~IIC_STS_ERR;
                     }
                 }
-                if (!(i2c->sts & IIC_STS_ERR) &&
-                    i2c_send_recv(i2c->bus, &i2c->mdata[i], !recv)) {
-                    i2c->sts |= IIC_STS_ERR;
-                    i2c->extsts |= IIC_EXTSTS_XFRA;
-                    break;
+                if (!(i2c->sts & IIC_STS_ERR)) {
+                    if (recv) {
+                        i2c->mdata[i] = i2c_recv(i2c->bus);
+                    } else if (i2c_send(i2c->bus, i2c->mdata[i]) < 0) {
+                        i2c->sts |= IIC_STS_ERR;
+                        i2c->extsts |= IIC_EXTSTS_XFRA;
+                        break;
+                    }
                 }
                 if (value & IIC_CNTL_RPST || !(value & IIC_CNTL_CHT)) {
                     i2c_end_transfer(i2c->bus);
-- 
2.31.1

