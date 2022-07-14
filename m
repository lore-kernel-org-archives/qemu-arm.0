Received: by 2002:ac2:596f:0:0:0:0:0 with SMTP id h15csp794776lfp;
        Thu, 14 Jul 2022 11:39:36 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1u4IgFegv+I62AkhhARZkCUNpMZV3Neldp9JFsuJ+tHA8AWaWM5ruE5993D3vO2br0oosPh
X-Received: by 2002:a05:620a:16ab:b0:6b5:bd4c:48c9 with SMTP id s11-20020a05620a16ab00b006b5bd4c48c9mr5382806qkj.558.1657823975836;
        Thu, 14 Jul 2022 11:39:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1657823975; cv=none;
        d=google.com; s=arc-20160816;
        b=oQJmOeHwLQbX3UdWkn8ME60faZO+f3szj4oQNSyqmBqlb72lMLdPK8FFUvg2NDo8Xu
         zRYiyy4Fju0HOmeHUlJv1RCgQDTQ4nFq2NPdFw9+widi5UoOl0GOVMW/JQI2xZRZIYQE
         2GUB3ysOzXaUecgHrza7aMPGJUa/mA0xtsXPDF/I0069vVrhF3RIUZ7BMLBnSEzTQVtk
         GV5nFJCNW5WqixK0V3ZiGdDyo84nKjBHLYECwCOkkW/U+6fxk6pKU3eeayNGoMp2LAQP
         /3xGPlJyFPyhVg6La3CSmwKn0hdcCf1hpO8pDLDvuQlRD9jZNqJhHgYVJuSG0Vp5CMvQ
         c14A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:references
         :mime-version:message-id:in-reply-to:date:dkim-signature;
        bh=vhcn9HX+W8BDC3zc9EzHTKhU6VuXS2Qk41Wg69c1pG8=;
        b=PGxW2+r2RAbCBJGkme7fSzmXaY4ZyZrHR2k6/jbI8XaZVUIqwQOScw8E0HDWmKgb+2
         hTw8ybi2FRuCGah3arFa/NapyrAJLGuYUOQcftbgvNQt5u0spPfjCeJxoeTT+IpxKA4T
         Iv18M/+s/ifn2KWKxf/9CJy4WokaF6eHny4012yYP5jLmLJQK1yArQQA55eYq+7MubGj
         U96fSiLT6Wcp+h3kYDgBe6cXPZlQEGrEMkRzm1lGUsAg4jV1CovtH9MyFGXN6QDOquWd
         sgUcaiENjpaEPgtTHgGA0Xv2Gu5e0bNKBMCoNih1U408rppqTz4irw0yrxvo6OxsK0u5
         xEgg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=U0Asrr7J;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g24-20020ac842d8000000b0031ed0e220bfsi1825890qtm.52.2022.07.14.11.39.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 14 Jul 2022 11:39:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=U0Asrr7J;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1]:36102 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oC3kN-0001iz-Bt
	for alex.bennee@linaro.org; Thu, 14 Jul 2022 14:39:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3WWDQYggKCHgsqdWkpodckkcha.Ykimaiq-Wnijkjcjq.knc@flex--wuhaotsh.bounces.google.com>)
 id 1oC3Zu-0005ZM-CL
 for qemu-arm@nongnu.org; Thu, 14 Jul 2022 14:28:46 -0400
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649]:51111)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3WWDQYggKCHgsqdWkpodckkcha.Ykimaiq-Wnijkjcjq.knc@flex--wuhaotsh.bounces.google.com>)
 id 1oC3Zr-00082E-4p
 for qemu-arm@nongnu.org; Thu, 14 Jul 2022 14:28:46 -0400
Received: by mail-pl1-x649.google.com with SMTP id
 q4-20020a170902dac400b0016becde3dfbso588173plx.17
 for <qemu-arm@nongnu.org>; Thu, 14 Jul 2022 11:28:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=vhcn9HX+W8BDC3zc9EzHTKhU6VuXS2Qk41Wg69c1pG8=;
 b=U0Asrr7Jv/ZFnHlT0Qk4uee3mXE69YZfediDI5cas+O1Aoex9I2XQOXZGwEml/0roL
 VsrwY46sUpytgtCIZgJtpWTJ9cLoAa2Dnlj5j7dlTWnVhrdYF1AC9C13OevS015PAd37
 p8JpWaJjmVuUS1ZqV3A/TGPNeMppRY5xaONrU8cjkPbCkzE2NsHpGf2RUjebXB8iE1aj
 PjKSG7sB0N/U1MRcDPddHVLxtPWG1zMbGgt76hzvuk0Q7pX2D3/3gdp22PkjA/CjnyEP
 hmV4Vj0nZidqxwAYHjhNllfIncoQp8J+DoD353WP4B1w5WQpWx01zvbX2VNMTZrJtnDJ
 /akA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=vhcn9HX+W8BDC3zc9EzHTKhU6VuXS2Qk41Wg69c1pG8=;
 b=aQuSNTDAinUi+tO8E7clQ6S6bho5vDugx7qXJLZL4tOBitfu4rZn6BiXL2+jst4ryg
 vd4FGzx5MIK/cUXzos1Ak9mW/wnZdSMdwPxafE088DxwAHNEf5DpZMk/uOdmB8dzocQe
 Lp/qya7ZNp/vuyf0cssjNhZEb33qIbrkDcDpzYFqj5E9h3vsHFtmk9o7dYsZnkEiuwWK
 efd8lvEbHYgyND4tC2YOL0bDDvHoD0AeJF90YUvD89vp1ks+PBdaqwe/k6OrD3EdS7is
 V4pjim45UP/IiBfo8ztL4cd0DQgO5hdBHWfbeMBy1pEjacndYMGIZwEjC82YBoOEkV+/
 Eg8w==
X-Gm-Message-State: AJIora8GNA3gxynkgUdDgG2HhxznBSY1aZ3FfIoQhgDs3mFQZJ4hV97C
 Bb997VN9g/T0m0+k0e77X4F50D45x9bEOw==
X-Received: from mimik.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4e])
 (user=wuhaotsh job=sendgmr) by 2002:a17:90a:c4f:b0:1df:a178:897f with SMTP id
 u15-20020a17090a0c4f00b001dfa178897fmr11084385pje.19.1657823321270; Thu, 14
 Jul 2022 11:28:41 -0700 (PDT)
Date: Thu, 14 Jul 2022 11:28:29 -0700
In-Reply-To: <20220714182836.89602-1-wuhaotsh@google.com>
Message-Id: <20220714182836.89602-2-wuhaotsh@google.com>
Mime-Version: 1.0
References: <20220714182836.89602-1-wuhaotsh@google.com>
X-Mailer: git-send-email 2.37.0.170.g444d1eabd0-goog
Subject: [PATCH v5 1/8] hw/i2c: Clear ACK bit in NPCM7xx SMBus module
From: Hao Wu <wuhaotsh@google.com>
To: peter.maydell@linaro.org
Cc: richard.henderson@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 wuhaotsh@google.com, venture@google.com, Avi.Fishman@nuvoton.com, 
 kfting@nuvoton.com, hskinnemoen@google.com, f4bug@amsat.org, 
 bin.meng@windriver.com, qemu-block@nongnu.org, armbru@redhat.com, 
 thuth@redhat.com, Titus Rwantare <titusr@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::649;
 envelope-from=3WWDQYggKCHgsqdWkpodckkcha.Ykimaiq-Wnijkjcjq.knc@flex--wuhaotsh.bounces.google.com;
 helo=mail-pl1-x649.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9pMbyHs2nYcn

The ACK bit in NPCM7XX SMBus module should be cleared each time it
sends out a NACK signal. This patch fixes the bug that it fails to
do so.

Signed-off-by: Hao Wu <wuhaotsh@google.com>
Reviewed-by: Titus Rwantare <titusr@google.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/i2c/npcm7xx_smbus.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/i2c/npcm7xx_smbus.c b/hw/i2c/npcm7xx_smbus.c
index e7e0ba66fe..f18e311556 100644
--- a/hw/i2c/npcm7xx_smbus.c
+++ b/hw/i2c/npcm7xx_smbus.c
@@ -270,7 +270,7 @@ static void npcm7xx_smbus_recv_byte(NPCM7xxSMBusState *s)
     if (s->st & NPCM7XX_SMBCTL1_ACK) {
         trace_npcm7xx_smbus_nack(DEVICE(s)->canonical_path);
         i2c_nack(s->bus);
-        s->st &= NPCM7XX_SMBCTL1_ACK;
+        s->st &= ~NPCM7XX_SMBCTL1_ACK;
     }
     trace_npcm7xx_smbus_recv_byte((DEVICE(s)->canonical_path), s->sda);
     npcm7xx_smbus_update_irq(s);
-- 
2.37.0.170.g444d1eabd0-goog

