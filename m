Received: by 2002:ac2:596f:0:0:0:0:0 with SMTP id h15csp798163lfp;
        Thu, 14 Jul 2022 11:49:36 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sQl0O3yFHkD6z1DlhYsj+puWvJi69x0WQwMQeOnNilL/tex0wpkhVzOB5RL0XdWvI0TRq+
X-Received: by 2002:a05:620a:2a0a:b0:6b5:a0ad:cfa0 with SMTP id o10-20020a05620a2a0a00b006b5a0adcfa0mr7019278qkp.177.1657824576413;
        Thu, 14 Jul 2022 11:49:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1657824576; cv=none;
        d=google.com; s=arc-20160816;
        b=UMildrStq9S/yg4Ol5wOcHKuZyLdXOnpEPjK9GDr9xU9M/xQFXlzzL6nkW/kCdjjlx
         YJg9+JUMAFdJDodlGd8sCyqFtDaAcgLR40D3IuyVDm1GepTlYzFt9+hy6E4NCO5Wq8pO
         YmhbqlPrl2gBjSvtA1QTypBVpSx/8IoZrDXeZPYqNEhuJRPH0juAOT1xmwBVp4E9h9L1
         j1T+8Kux2XTyj/YSddywmDlgOOI7U2kFtFEnWmerKyBvUSgsYvJMbwWNEdGGQzNqFV5h
         lvy+Z17HDibaArR5zz2zpxBflBECYEVT1AewbiFI8S1n4F0ITAYgqMIN+nJQNRolxTqo
         n9nQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:references
         :mime-version:message-id:in-reply-to:date:dkim-signature;
        bh=ZPy/+0dqgBOB4uWjUnv2kiH/6vyYCxfU19RjpK4Qvr8=;
        b=Qf3xjJND/9W4FzxniFZhH4CN5rEN8Kx9eom8SXdTJoSVXNo1UJANSRkNzNd95vCOK5
         decPoALTPLDsQYVNN+RpNkg+sMSDkLshLdIzJfE+bHzafAM7lT8R1rD7/4FMQg3vBB0n
         FG8Fuj4axqMokMQLlu5JINBgp6otD9/V0Vw5cQSe/VK3zb1Nk3kTHIl5scPN71DIeZ7q
         vpUdd0I90h6gOYwj9vC6DR8c9bC+No+df0aZpwWTVp0XIwB+jmY6TbG284tXTAfIu+fa
         oHG0pWxNbOklTlPlxrE7ghsY9ASN7+N30OZzi8mqtOskUyhgXCdQZoNmWqG8QBws/Lba
         SYow==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=Ut4AStBj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m5-20020a05620a290500b006b5c8e87aaesi973451qkp.447.2022.07.14.11.49.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 14 Jul 2022 11:49:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=Ut4AStBj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1]:55328 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oC3u3-000752-UI
	for alex.bennee@linaro.org; Thu, 14 Jul 2022 14:49:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3Y2DQYggKCII20nguzynmuumrk.iuswks0-gxstutmt0.uxm@flex--wuhaotsh.bounces.google.com>)
 id 1oC3a3-0005zw-Di
 for qemu-arm@nongnu.org; Thu, 14 Jul 2022 14:28:55 -0400
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a]:52810)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3Y2DQYggKCII20nguzynmuumrk.iuswks0-gxstutmt0.uxm@flex--wuhaotsh.bounces.google.com>)
 id 1oC3a0-000866-F5
 for qemu-arm@nongnu.org; Thu, 14 Jul 2022 14:28:55 -0400
Received: by mail-yb1-xb4a.google.com with SMTP id
 m11-20020a5b040b000000b0066fcc60d1a0so1917103ybp.19
 for <qemu-arm@nongnu.org>; Thu, 14 Jul 2022 11:28:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=ZPy/+0dqgBOB4uWjUnv2kiH/6vyYCxfU19RjpK4Qvr8=;
 b=Ut4AStBjr8MlQaAsJa9lSYqGFU2Es/qTrkneU9bH8Bu9j//US/GJWQFpq5hkRCbDdt
 hhHQA0hmQtLDdfspzD1BmneqCfhtbCmSI6vjEg/pdwZ/LGrAGH8SfLsEe5CjgwGj+CzG
 cuoEQgL+dUOSXfywvrbOg8Xc8t3XjKefranhvG7EA/7roPMwLnSa9wt9YSXMJNoAufIn
 /eh3J3Y6KKzrfZYfcktb4/1OisTI8b+FLppwBNAMyOxgWEk6UwwHh+0iSjelIVu3kOd9
 dxS38HDIr1+TUyy8e0MBMabLeVVZEmRTvVtRQgUue3mnLDjEi7OtpvKdtHVCWuIbKHo0
 sB9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=ZPy/+0dqgBOB4uWjUnv2kiH/6vyYCxfU19RjpK4Qvr8=;
 b=NbsIoBCm0ssYUPKTJ8HYJUNyJbwz0GLTNOSeHzwAeuZGq433WTrsPfK90j6lNPFgtU
 kTG5fkxaWAlW5LChzT+oooeKpRBDwyRodh4czi5NlEj3nCHl3QtWMC+oyRzhMhcmddUQ
 az8cJlAhxeMlZacijGYlgdhmisyW1dR24NxLNKbVLH+FUVH2TIMykilBznpAEhmg+6Qx
 U4Zk/F01lyXB1j2t6w+yxjLfvFzQNF227nWAzJghWomY8d+b5KXL+/YEEnnFk2m7IjGk
 4uAXpOdrWL6FoS7JRbO093XpQzV43jmkQzxOYjRhTInyjC3B1dnG34sFrmn0Ub8o2qOi
 wypw==
X-Gm-Message-State: AJIora/cYjCRg21Pdc7pHk0xbRYifsWruDPAIOjrlGv7ZbDL/ZT93KiS
 2GPD81lZW9cM4pcoCD8aWg98llVqO8rGYw==
X-Received: from mimik.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4e])
 (user=wuhaotsh job=sendgmr) by 2002:a25:3b11:0:b0:66e:ccf2:76dc with SMTP id
 i17-20020a253b11000000b0066eccf276dcmr9964429yba.247.1657823331277; Thu, 14
 Jul 2022 11:28:51 -0700 (PDT)
Date: Thu, 14 Jul 2022 11:28:34 -0700
In-Reply-To: <20220714182836.89602-1-wuhaotsh@google.com>
Message-Id: <20220714182836.89602-7-wuhaotsh@google.com>
Mime-Version: 1.0
References: <20220714182836.89602-1-wuhaotsh@google.com>
X-Mailer: git-send-email 2.37.0.170.g444d1eabd0-goog
Subject: [PATCH v5 6/8] hw/arm: npcm8xx_boards: EEPROMs can take bus as
 parameter
From: Hao Wu <wuhaotsh@google.com>
To: peter.maydell@linaro.org
Cc: richard.henderson@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 wuhaotsh@google.com, venture@google.com, Avi.Fishman@nuvoton.com, 
 kfting@nuvoton.com, hskinnemoen@google.com, f4bug@amsat.org, 
 bin.meng@windriver.com, qemu-block@nongnu.org, armbru@redhat.com, 
 thuth@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b4a;
 envelope-from=3Y2DQYggKCII20nguzynmuumrk.iuswks0-gxstutmt0.uxm@flex--wuhaotsh.bounces.google.com;
 helo=mail-yb1-xb4a.google.com
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
X-TUID: IGSpsC9JJl1c

We allow at24c_eeprom_init to take a I2CBus* as parameter. This allows
us to attach an EEPROM device behind an I2C mux which is not
possible with the old method.

Signed-off-by: Hao Wu <wuhaotsh@google.com>
---
 hw/arm/npcm7xx_boards.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/hw/arm/npcm7xx_boards.c b/hw/arm/npcm7xx_boards.c
index 6bc6f5d2fe..b083b0c572 100644
--- a/hw/arm/npcm7xx_boards.c
+++ b/hw/arm/npcm7xx_boards.c
@@ -140,10 +140,9 @@ static I2CBus *npcm7xx_i2c_get_bus(NPCM7xxState *soc, uint32_t num)
     return I2C_BUS(qdev_get_child_bus(DEVICE(&soc->smbus[num]), "i2c-bus"));
 }
 
-static void at24c_eeprom_init(NPCM7xxState *soc, int bus, uint8_t addr,
+static void at24c_eeprom_init(I2CBus *i2c_bus, int bus, uint8_t addr,
                               uint32_t rsize)
 {
-    I2CBus *i2c_bus = npcm7xx_i2c_get_bus(soc, bus);
     I2CSlave *i2c_dev = i2c_slave_new("at24c-eeprom", addr);
     DeviceState *dev = DEVICE(i2c_dev);
 
@@ -253,8 +252,8 @@ static void quanta_gsj_i2c_init(NPCM7xxState *soc)
     i2c_slave_create_simple(npcm7xx_i2c_get_bus(soc, 3), "tmp105", 0x5c);
     i2c_slave_create_simple(npcm7xx_i2c_get_bus(soc, 4), "tmp105", 0x5c);
 
-    at24c_eeprom_init(soc, 9, 0x55, 8192);
-    at24c_eeprom_init(soc, 10, 0x55, 8192);
+    at24c_eeprom_init(npcm7xx_i2c_get_bus(soc, 9), 9, 0x55, 8192);
+    at24c_eeprom_init(npcm7xx_i2c_get_bus(soc, 10), 10, 0x55, 8192);
 
     /*
      * i2c-11:
@@ -360,7 +359,8 @@ static void kudo_bmc_i2c_init(NPCM7xxState *soc)
 
     i2c_slave_create_simple(npcm7xx_i2c_get_bus(soc, 4), TYPE_PCA9548, 0x77);
 
-    at24c_eeprom_init(soc, 4, 0x50, 8192); /* mbfru */
+    /* mbfru */
+    at24c_eeprom_init(npcm7xx_i2c_get_bus(soc, 4), 4, 0x50, 8192);
 
     i2c_mux = i2c_slave_create_simple(npcm7xx_i2c_get_bus(soc, 13),
                                       TYPE_PCA9548, 0x77);
@@ -371,7 +371,8 @@ static void kudo_bmc_i2c_init(NPCM7xxState *soc)
     i2c_slave_create_simple(pca954x_i2c_get_bus(i2c_mux, 4), "tmp105", 0x48);
     i2c_slave_create_simple(pca954x_i2c_get_bus(i2c_mux, 5), "tmp105", 0x49);
 
-    at24c_eeprom_init(soc, 14, 0x55, 8192); /* bmcfru */
+    /* bmcfru */
+    at24c_eeprom_init(npcm7xx_i2c_get_bus(soc, 14), 14, 0x55, 8192);
 
     /* TODO: Add remaining i2c devices. */
 }
-- 
2.37.0.170.g444d1eabd0-goog

