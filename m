Received: by 2002:ac2:596f:0:0:0:0:0 with SMTP id h15csp781887lfp;
        Thu, 14 Jul 2022 11:03:17 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1v5nT2NgbasPSrRtPXEkivw3hyPZbrCYnhVg3394A90ayfbzxHigMQIeJbm0G4mlrvi9xKx
X-Received: by 2002:ac8:7f08:0:b0:31e:b9af:f327 with SMTP id f8-20020ac87f08000000b0031eb9aff327mr9480651qtk.298.1657821797243;
        Thu, 14 Jul 2022 11:03:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1657821797; cv=none;
        d=google.com; s=arc-20160816;
        b=OvfHeTglvA4T0gaHz5jmWUh/jvlQogBDtNSI1cdjdG/Pia/2MB9C/pd3iB7CeSaBT0
         oBL1MEyfsmSdClphpkdZK3kzj+ghC8MOF++yeJTA0ZWHRsQhtss8oQBqV3zMxxvt6dzf
         0NcVekCISjRNgD31WlwwB3TBKGSFfOVy9iOgX5meil3ABDH5TNfdtpnKZYfi21OMXB7n
         mBwmWTWMyD25vkvq52ghCCLxC5nqzP8TkcXUOLDCr8BNlRPrayT7Nx+6VcZ0D0PYcwPG
         68/9hAxJMm1iXChuC4lbyYsVUdKdfUQGM5n2qVRk1lN5bCUJBtd64Dt15aoojRojC9Y+
         iEEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:references
         :mime-version:message-id:in-reply-to:date:dkim-signature;
        bh=vhcn9HX+W8BDC3zc9EzHTKhU6VuXS2Qk41Wg69c1pG8=;
        b=qlIFDojWm1x6hdVdUCGmSqc73VrYND80NJ9TwEOIBNfxdamRnOyeNasS2CLgKDEwYL
         YErzavriB12aTMzdQpRJ4qt2Ep0hq46MUv8U/JX/G1tSUp2IiMlKkXv9fyY/z6SEFU8w
         uvgY2jLo0CJuKC0KFh4px4yNXSiwWSiUxga13rYsfqcR/JhEGe4e9AoCnotUbi+JIhGP
         Q6QH3+TebY59ubkct6jgVzm+73VFtn+YQjp4QJWeHEkdUnfUjfvmD5JwaSDPde974KfW
         cfOZw3q+NUGlbqefpnM2wS0KOo7JtZRTreaI01e3STbxAY4CdhWX4xBBwGF+ifMMfQEA
         0Zxw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=Xyz2tsP5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f9-20020a05622a1a0900b002f364655293si1719310qtb.697.2022.07.14.11.03.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 14 Jul 2022 11:03:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=Xyz2tsP5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1]:60118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oC3BE-0000O3-Or
	for alex.bennee@linaro.org; Thu, 14 Jul 2022 14:03:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3ulnQYggKCMsDByr5A9yx55x2v.t537v3B-r83454x4B.58x@flex--wuhaotsh.bounces.google.com>)
 id 1oC38f-0007G4-BT
 for qemu-arm@nongnu.org; Thu, 14 Jul 2022 14:00:38 -0400
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649]:39878)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3ulnQYggKCMsDByr5A9yx55x2v.t537v3B-r83454x4B.58x@flex--wuhaotsh.bounces.google.com>)
 id 1oC38b-0005cN-PE
 for qemu-arm@nongnu.org; Thu, 14 Jul 2022 14:00:36 -0400
Received: by mail-pl1-x649.google.com with SMTP id
 d13-20020a170903230d00b0016c1efef9ecso547074plh.6
 for <qemu-arm@nongnu.org>; Thu, 14 Jul 2022 11:00:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=vhcn9HX+W8BDC3zc9EzHTKhU6VuXS2Qk41Wg69c1pG8=;
 b=Xyz2tsP5nk9RENxAzAasWNHzaWUmNR946oGcC4Lm8FixmR2uJRwe+Qd4TGnLJzLoMQ
 d/x9my8aDYz8uxJa9eqQo1X5sbky+cKPDeNDmCyFeGO7ObuNXkAF1t4pmpVVkvBV5/zG
 JxlLl1i4KVLLMWEGt8LRZFMBHDAzDAV8y6mufR5bUYrCX+JH2bl8RWAsi6lrTAyiGpcW
 0a6Bnk0Pkxviw8H7rD6M7mgshA3om7QY3/NsuO8bhxol0ukysPCZ6n7t7vUSa6L0/P/z
 +ilQRjRg4uzBm7+wyX3G4HVb35xfv/KUDZRuMOD90Qfrpof9ZJt8KHU50MUNZGdtriwS
 a0CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=vhcn9HX+W8BDC3zc9EzHTKhU6VuXS2Qk41Wg69c1pG8=;
 b=8IzS93AAsFhjEjEDrHEcLQExgJBWxqjSHIsVk071c9h5s57f6rEHCzlw8s5d+m+vLF
 htxMZYTStCpl4P6ZutguaQIX4M9fC+3LRxS6beSNMxQxyy3IisWiEAxvXC4SquJNbslP
 VCOaUor+GbR+1C7FUU+JWEMV/ehJofP0JZKQ3Egf6FEQ+XGiCVgjyZSpUDcNmA8iARgy
 OA5RQ3RyVtVqPKSRQcilToAL90DsD0sVQEMmFqArLG5vRZMKtGK8LJsmBjuD/ari/hIu
 trPgWo5hnOVpgex8bA2Nim6mpr/HQsNdlVhXGRGnMBVq5EH8JdzFhKf7rz71u9TXVo3G
 DSCg==
X-Gm-Message-State: AJIora9gCY8J08nD2dBoHguqMOROGP+YDNh2kJ+5kU4gqFzUMlKfZM4j
 7mnGlVFcgvcdXTmBQ/gW+yxK5X0bN9Xdqw==
X-Received: from mimik.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4e])
 (user=wuhaotsh job=sendgmr) by 2002:a05:6a00:224b:b0:52a:b918:e757 with SMTP
 id i11-20020a056a00224b00b0052ab918e757mr9739548pfu.38.1657821626055; Thu, 14
 Jul 2022 11:00:26 -0700 (PDT)
Date: Thu, 14 Jul 2022 10:59:59 -0700
In-Reply-To: <20220714180006.77360-1-wuhaotsh@google.com>
Message-Id: <20220714180006.77360-2-wuhaotsh@google.com>
Mime-Version: 1.0
References: <20220714180006.77360-1-wuhaotsh@google.com>
X-Mailer: git-send-email 2.37.0.170.g444d1eabd0-goog
Subject: [PATCH 1/8] hw/i2c: Clear ACK bit in NPCM7xx SMBus module
From: Hao Wu <wuhaotsh@google.com>
To: peter.maydell@linaro.org
Cc: richard.henderson@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 wuhaotsh@google.com, venture@google.com, Avi.Fishman@nuvoton.com, 
 kfting@nuvoton.com, hskinnemoen@google.com, f4bug@amsat.org, 
 bin.meng@windriver.com, qemu-block@nongnu.org, armbru@redhat.com, 
 thuth@redhat.com, Titus Rwantare <titusr@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::649;
 envelope-from=3ulnQYggKCMsDByr5A9yx55x2v.t537v3B-r83454x4B.58x@flex--wuhaotsh.bounces.google.com;
 helo=mail-pl1-x649.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
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
X-TUID: 1S6RROD7C1+6

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

