Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp1122888lfo;
        Fri, 29 Jan 2021 05:24:50 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz4tSIY90Tj8wd+7KCGymiU2/PHb0yG6wC6EoasYxnc8f7unzZ+CZFcVWrThQ1NUWOqGk2s
X-Received: by 2002:a25:5582:: with SMTP id j124mr5928535ybb.309.1611926690155;
        Fri, 29 Jan 2021 05:24:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1611926690; cv=none;
        d=google.com; s=arc-20160816;
        b=NVm43CP0HFpHQTwvIhWni1stJzQ83FHXRmA832QzQkc53DBKCVyesHzL+NJHq59v1b
         MMl1owKaS7AXMPXNQUGtagmjxUg2cCKRHczcw8O4gWaPj+E9eoZ+VHnvFXrLP47+Z5kz
         9fH58RHGZoAWkUfOVgQYieJ2L3Puv7ePEP3d/FYxt+OcaAqzpQCo8Dd+q7Pd+2+g5B5o
         O4fuOxVa0HbEY6SjJiw9IOB/PJ9bw4j9e/MEnO7Yx87hRhO5s2msHDTJDzBUX/lfSvRc
         9LYRwVbt8PK2Vl4nQNk3QSZYl+seGI6rcxK1E1tMfb2MyAV7R+69DVgaeNmz2XTij0Ws
         +Leg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=Ja59qADvqfh/2q+KQY+LSk2zC5zuDWA+c5NUnArnusQ=;
        b=Ltuymoq3b39YGZzwulULpNZ2TOx3YDsSZdXthHLQZw0qqWAJ6/x/Xjp20ETbBDn/Cc
         Iw8Ke1JtC2iDHK7erpsctW53EhGDVgySfsiJS/OQG7wTi1Z4Rs9anDXtiKEehE7Bbw7g
         rgzKVBE0B0RSl46qtaVQXKxLoqSa4/we6ev/b+gVRqxgVx/WHgb0b9k1zku45Y0Gbm/g
         OSfDKDifPMSpF6nTlj3F084RTvwDSF0zom5CXDuHnWxAuA7cbM5xCGa3kUr8y+pbKkKf
         FjDG6+dOd40GLpmHvEWP6tqhatmL5KbT3B1vm9P62W09Ud17hiKxHaDGHhfSHs00BUF7
         nBhw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=qIvbNySf;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w15si8462562ybl.313.2021.01.29.05.24.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 29 Jan 2021 05:24:50 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=qIvbNySf;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:52978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l5TlZ-0003kt-Gz
	for alex.bennee@linaro.org; Fri, 29 Jan 2021 08:24:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l5Tku-0003ib-Rw; Fri, 29 Jan 2021 08:24:10 -0500
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435]:37752)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l5Tkl-0007vi-NZ; Fri, 29 Jan 2021 08:24:03 -0500
Received: by mail-pf1-x435.google.com with SMTP id 11so6229918pfu.4;
 Fri, 29 Jan 2021 05:23:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ja59qADvqfh/2q+KQY+LSk2zC5zuDWA+c5NUnArnusQ=;
 b=qIvbNySfjDas6JHaKn94Jzi284Ig8lyM4svVDtouJWOz0XRyzOeMBbXFn/n6Q4kqln
 eWxbFcmc9JqUXhiRTm0xFRswFsDTIwvKTs4UnXszcC0VLfPsJq7Eiy9EoOkiJObmdHJs
 S9IM4xFxb0tBrsckaY/x2FRQzAWZjJCMljV9fPAcpS42A+IOIk4v3sYTbnfVRYhjmS2J
 oBDMOmh/0WUFRl/TW7EMvxRxoJFNX/3X05n+WKG286GYpoQVghx/cy6mDzCG+CtO29K/
 ZQu3YMLibD70fQIcgmYcea+AIf9kJx/yE3A7DJeWm1yMJTCfEiIxNxtvCtgtlw0LNHEm
 Eh+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ja59qADvqfh/2q+KQY+LSk2zC5zuDWA+c5NUnArnusQ=;
 b=L6Bw4N25zy0jvrIIJlnPgNxqw3OlokaSaT+9ZFfjEhnvDFIJexzQlGSn+GCiqUsLdS
 FxAQFeRJ4vVvRzYbq5RKK5nF08Pyp/3dPSVQ9RKrHnt2SCRPSVk4d8mEPi4ARwVCj4/o
 lKEVlRrC9tWTSJArRzIwFjKo4J+oPVVL17NnlXKkXyeDh7ly4n+QOVerV4tkFGvqPI26
 ieYiWLb53H0WAK19uSRnFG+4Pk3dgt6qcRW/zxMVeaOa8aBq5eFztCI5VRb9XAWjtIoi
 RltYYqAk11lek4YVIoUdUnKsKKGuxA88IsN2XUijANV8YDjvQhDL6u3eZPRlHyrPHotk
 CsDw==
X-Gm-Message-State: AOAM532d77fsNzW30fTpv7Kn1jCdwSscjvA6ckQUSXjPUhHgf7WxUC48
 IexlRhNWOecrBj6ai58Qjxg=
X-Received: by 2002:a63:171d:: with SMTP id x29mr4779341pgl.168.1611926638249; 
 Fri, 29 Jan 2021 05:23:58 -0800 (PST)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id j6sm8857259pfg.159.2021.01.29.05.23.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jan 2021 05:23:57 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Subject: [PATCH v9 02/10] hw/ssi: imx_spi: Remove imx_spi_update_irq() in
 imx_spi_reset()
Date: Fri, 29 Jan 2021 21:23:15 +0800
Message-Id: <20210129132323.30946-3-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210129132323.30946-1-bmeng.cn@gmail.com>
References: <20210129132323.30946-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pf1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Bin Meng <bin.meng@windriver.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: OX0plPBGfJKp

From: Bin Meng <bin.meng@windriver.com>

Usually the approach is that the device on the other end of the line
is going to reset its state anyway, so there's no need to actively
signal an irq line change during the reset hook.

Move imx_spi_update_irq() out of imx_spi_reset(), to a new function
imx_spi_soft_reset() that is called when the controller is disabled.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

---

(no changes since v5)

Changes in v5:
- rename imx_spi_hard_reset() to imx_spi_soft_reset()

Changes in v4:
- adujst the patch 2,3 order
- rename imx_spi_soft_reset() to imx_spi_hard_reset() to avoid confusion

Changes in v3:
- new patch: remove imx_spi_update_irq() in imx_spi_reset()

 hw/ssi/imx_spi.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/hw/ssi/imx_spi.c b/hw/ssi/imx_spi.c
index e605049a21..4d488b159a 100644
--- a/hw/ssi/imx_spi.c
+++ b/hw/ssi/imx_spi.c
@@ -241,11 +241,16 @@ static void imx_spi_reset(DeviceState *dev)
     imx_spi_rxfifo_reset(s);
     imx_spi_txfifo_reset(s);
 
-    imx_spi_update_irq(s);
-
     s->burst_length = 0;
 }
 
+static void imx_spi_soft_reset(IMXSPIState *s)
+{
+    imx_spi_reset(DEVICE(s));
+
+    imx_spi_update_irq(s);
+}
+
 static uint64_t imx_spi_read(void *opaque, hwaddr offset, unsigned size)
 {
     uint32_t value = 0;
@@ -351,8 +356,9 @@ static void imx_spi_write(void *opaque, hwaddr offset, uint64_t value,
         s->regs[ECSPI_CONREG] = value;
 
         if (!imx_spi_is_enabled(s)) {
-            /* device is disabled, so this is a reset */
-            imx_spi_reset(DEVICE(s));
+            /* device is disabled, so this is a soft reset */
+            imx_spi_soft_reset(s);
+
             return;
         }
 
-- 
2.25.1

