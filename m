Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp3775057njj;
        Wed, 7 May 2025 05:41:39 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVWrpMuWZg7JDWoTSsuPYTbs+s6TAqZ+qq0PCq17PF4kMvxQrDM0ybi54htsQTl4YW0uHEM22KTLz3Mcw==@linaro.org
X-Google-Smtp-Source: AGHT+IFU052jyfhNF8Vf5rgTuqepkojLziL72erG8teDvHwKUioF5vwm5y5HrUnpQAtRHJ8AUpBd
X-Received: by 2002:ad4:5c8e:0:b0:6e8:fcc6:35b6 with SMTP id 6a1803df08f44-6f542b220b1mr46326076d6.2.1746621699548;
        Wed, 07 May 2025 05:41:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746621699; cv=none;
        d=google.com; s=arc-20240605;
        b=bSzA904UCDpBK3Uf0p9Bbz3X5XheEynMgqTI7Nke5iCRRZ616ro5c1BY/1Gk6KTxkb
         tMOM3NXIlRp5ghWfV4S5Sr6FZqyH84Udw2eP+WWGXRj5agwTfdf7YNOoHxGCh+eknG7d
         6A2OpMJ3A1SxW25yEPqSN5LubekjjgUAhcWfPGojWhIO735g6R+ATDhsMklHIsIPvCvR
         b+TGdtDkCYNmuDZO0PRfKpIyXMB2wFr5YlnV1StPCBCnb47Ki72Dy7hNsdXG6ugF3+XQ
         iyJlxLFktDifssjIXa09xUaUEZBdk+5C5u8oqD+LqkM9Jxyu6Qr07FpyKVYscoQWez1L
         7eKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=WXtzo8RvfOFbPN14G8275CPJMhhtba9xplx+kqTGCto=;
        fh=AzYzl6Tnk2M8LWnZ6ZeXTBrZqdhSNZJXLMGA8GC6NEM=;
        b=CyUp3q1iDLsTM6Eoi16cAGnZADqnuLhxBryqykZE3mG9vo2lHwziVXAdmiR2dQIR9L
         dxhDMUel5vQO/mCnl4OUPPZ6Grs4zYA/QFGd/q/xoI2yL1mCvG/7MDVM2E4iP9vXGnvn
         as+Zcg9CacB79ptiIH7bqV3LpdoVX5EE1n/MyfzPIWZLNSxfne8hSdERPQWihbP4QbPl
         ujgat90CMi0DXky3F/QPjv8hNeB/vgES4EnQZO21UpSYvfO5IbP762ubQxrQZo3ajLFQ
         tUc/LrVMin0aKjxDRkSeIc0Fp07ffCDhluHZyDrXYJhdtIqNYeB0CSRJv6CoT/ER8WfZ
         WRrQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b="P/rxCIJQ";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6f542907ce2si18244986d6.457.2025.05.07.05.41.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 07 May 2025 05:41:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b="P/rxCIJQ";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uCe56-00018j-6Y; Wed, 07 May 2025 08:41:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1uCe54-000180-D3; Wed, 07 May 2025 08:40:58 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1uCe51-0005I0-GC; Wed, 07 May 2025 08:40:58 -0400
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-3a0b637db6eso287933f8f.0; 
 Wed, 07 May 2025 05:40:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746621651; x=1747226451; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=WXtzo8RvfOFbPN14G8275CPJMhhtba9xplx+kqTGCto=;
 b=P/rxCIJQInLsL5DmcUEl17MN5lPbN53h7ekhHgRtMS8Yy/uznXMN8N9qv3MlfUMwV2
 5IYvy8VOf/hwPIeS4gfJW9ZfeGwTERw13s6AaKfxp13wMyCCLLHaqxTFyFBK1wBXj/i1
 pOkVDSqO9Ae/F1xlfpvzvLN+YVe9f8ivuRUySfsT/L2SZSgCmAE0hVVtiSJ4M6Toqt4k
 2n1eU2tQ7oMYn6jN29dXVHXdbExjzfN+fwmDNFrAF4hRacW643yx55m8ZC6OwlXxfoW7
 P/LUSSMu95yRlacnKcGKAcLAjrbYhDrUF5HyjW0wXHJQFm4vRV9StdshX34DI27BAL7O
 0pkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746621651; x=1747226451;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WXtzo8RvfOFbPN14G8275CPJMhhtba9xplx+kqTGCto=;
 b=ArLwwKPL1dXHNbj5I7kkK2vAuf74cOJlBOTm4ySkbgVBwsuMe3AwihKOXoOJSbsxqG
 cH4vQIECD21dpumUAMyLNFqQ9qOmrQ3r4u2KEQBXKainO60imd6no+qhc/NHgdmxx93Q
 dJV3X8EoyJCq2HFzZd/wiEAQn9gicciqJQ+x4NfIVKJpyiIW06SZfU4m1wzsF7hdk5iP
 QEAlSD7Mcf+iiYiaUzM1a+hKp3lpe3OEMxAcRxxovawLOdagAs4VNmJLqtOZ6me5QJCi
 13E34LRAfijKdKSyOnikzKs4SPAXVxYagszw5AjvsJS3gkFFdVn8rgqxX2zxqpoBP22C
 QocQ==
X-Gm-Message-State: AOJu0Yx3besjymx9MNfv481xYIHuH5qdEk4sFXeDH72eFCN923/G6Qx2
 0v6itPsAtMeYV96yt7SJOewATktVys54X37+b9Vn4WtTWe+WgM+LBiw7zQ==
X-Gm-Gg: ASbGncsoC3ey4asbEo1iQi9qpfH0/66ygQamKoGNQaKlwhmCly1/i8zri2sHKs1jREf
 Rphhlv9EfEto9gnBw3ljsFNcuA0720l+YiTOwP5EEZCnZyovwWdTsn5/KZR3OOlCkF7z8+vwnQP
 DOirB6il0MIGE3Rq6W/6cXhqfoLlafyq9JB1f3430Yoa/QkRp/lx6B7cJlNJuKPU7Uz22WiZk64
 oECSec9xTdUX88R6Gm3DT1tFqv38TpIaoPUPfXhdbUiN8RgHclHha7AA85fAHwVjcCQk0s3otLm
 YpCmWuNpmumh3cy9HcXptTQZO9C8NebiYFCXRQlhuhir/EVGWK21z/hZIliqg803NUX3QqhPGNH
 XF3WgkJPrDlzbcCR9TcurEjMRHqwGN2EDq1I=
X-Received: by 2002:a05:6000:1acd:b0:391:4674:b10f with SMTP id
 ffacd0b85a97d-3a0b4a39f78mr2747614f8f.36.1746621650920; 
 Wed, 07 May 2025 05:40:50 -0700 (PDT)
Received: from Georg-PC.fritz.box
 (p200300faaf05a000f691e93a67aa5664.dip0.t-ipconnect.de.
 [2003:fa:af05:a000:f691:e93a:67aa:5664])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a099ae3b57sm17162871f8f.36.2025.05.07.05.40.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 May 2025 05:40:50 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH] hw/i2c/imx_i2c: Always set interrupt status bit if interrupt
 condition occurs
Date: Wed,  7 May 2025 14:40:40 +0200
Message-ID: <20250507124040.425773-1-shentey@gmail.com>
X-Mailer: git-send-email 2.49.0
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: cn89PKlgCz8V

According to the i.MX 8M Plus reference manual, the status flag I2C_I2SR[IIF]
continues to be set when an interrupt condition occurs even when I2C interrupts
are disabled (I2C_I2CR[IIEN] is clear). However, the device model only sets the
flag when I2C interrupts are enabled which causes U-Boot to loop forever. Fix
the device model by always setting the flag and let I2C_I2CR[IIEN] guard I2C
interrupts only.

Also remove the comment in the code since it merely stated the obvious and would
be outdated now.

Fixes: 20d0f9cf6a41 ("i.MX: Add I2C controller emulator")
cc: qemu-stable
Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/i2c/imx_i2c.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/hw/i2c/imx_i2c.c b/hw/i2c/imx_i2c.c
index 91f84c2ad7..d26177c85d 100644
--- a/hw/i2c/imx_i2c.c
+++ b/hw/i2c/imx_i2c.c
@@ -79,13 +79,12 @@ static void imx_i2c_reset(DeviceState *dev)
 
 static inline void imx_i2c_raise_interrupt(IMXI2CState *s)
 {
-    /*
-     * raise an interrupt if the device is enabled and it is configured
-     * to generate some interrupts.
-     */
-    if (imx_i2c_is_enabled(s) && imx_i2c_interrupt_is_enabled(s)) {
+    if (imx_i2c_is_enabled(s)) {
         s->i2sr |= I2SR_IIF;
-        qemu_irq_raise(s->irq);
+
+        if (imx_i2c_interrupt_is_enabled(s)) {
+            qemu_irq_raise(s->irq);
+        }
     }
 }
 
-- 
2.49.0

