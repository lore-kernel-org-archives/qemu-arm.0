Received: by 2002:ac2:596f:0:0:0:0:0 with SMTP id h15csp784445lfp;
        Thu, 14 Jul 2022 11:08:56 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vd1cGNT2ht7Riok9o86LSP0H3dpKXDZEloHobRfmQUy8cmmObkJN9KGHdWQhrcDkdLZmjb
X-Received: by 2002:a05:622a:189d:b0:31e:a89b:99fd with SMTP id v29-20020a05622a189d00b0031ea89b99fdmr9139132qtc.638.1657822135998;
        Thu, 14 Jul 2022 11:08:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1657822135; cv=none;
        d=google.com; s=arc-20160816;
        b=KB7prf4dFAMzm9/DI1iWCZA92QtllSvdQi8tpXh/HMsredsXcFVMwe29fuqi93IcEm
         RTtr36vjX0EsCqutPxWjB/x4n7/SyMykfumv0gsizeQLACN+XrrI6cnGm5fP+TKYuOVZ
         INHIzHQUl66/bOIJTaoUU/a6/cPfZfIyFPoX1VIOnIigWqK6/dOdxDZq7a4GEfk/VZFa
         CYQmnhFwPxlVDZgTFrcWqfrdZRO936YLZ7zdLv3+02qxPlTs9LYdM2uClvSDEv+q0PuD
         qBEK3X4+bzv0qhVwc/cPCKFyDt7/9EBH5/SjwW3BQ7KGOytb13tIs/l+ZW2w+ulNF7XW
         S0SA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:references
         :mime-version:message-id:in-reply-to:date:dkim-signature;
        bh=rH29rTwqC9tPWRe/rtqEAu2r9YLWMWTi3GrHYsUhaSM=;
        b=cH5OglRLfFRSB9EuRahuQsZrvdigD0mXa+KZVhUs3ByHLBj7uT4BYEBveMrPxbanLH
         uDwtnniPLQoLtPIy3SY4g6UY59gn1krbLMeUFwHpRdYYEr9mdX+gZJnMVfY3MQJFfA/A
         /GmbhAD5j/n5RxD6bXi4gjk2s2y9lhnP4ncHujxvDZUxR9y6KlBo87AZan0JGOf6iYk9
         wA9lnOGn5bqIGNWlTSFn1UJma6c/o3fRqD2OSlcZb2LMVkC3VZ/HSTr+q3w5E0MNWHVM
         q8AAwS6GY7GFnFcg2scroAedVuzmHr0VdQ75lVPsMWxXPKdBrSt+0AHCEVLAeuBYVJHJ
         Ifvw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=DkxFmYDn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r2-20020ae9d602000000b006af049d2f88si1356668qkk.516.2022.07.14.11.08.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 14 Jul 2022 11:08:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=DkxFmYDn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1]:45022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oC3Gg-0000zP-9F
	for alex.bennee@linaro.org; Thu, 14 Jul 2022 14:08:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3xFnQYggKCNUNL81FKJ87FF7C5.3FDH5DL-1IDEFE7EL.FI7@flex--wuhaotsh.bounces.google.com>)
 id 1oC38t-0007Or-9h
 for qemu-arm@nongnu.org; Thu, 14 Jul 2022 14:00:51 -0400
Received: from mail-pg1-x549.google.com ([2607:f8b0:4864:20::549]:47783)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3xFnQYggKCNUNL81FKJ87FF7C5.3FDH5DL-1IDEFE7EL.FI7@flex--wuhaotsh.bounces.google.com>)
 id 1oC38o-0005ma-Nm
 for qemu-arm@nongnu.org; Thu, 14 Jul 2022 14:00:50 -0400
Received: by mail-pg1-x549.google.com with SMTP id
 e5-20020a636905000000b004119d180b54so1545886pgc.14
 for <qemu-arm@nongnu.org>; Thu, 14 Jul 2022 11:00:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=rH29rTwqC9tPWRe/rtqEAu2r9YLWMWTi3GrHYsUhaSM=;
 b=DkxFmYDncCITpBlyLNBqVxi+i7R/HUXKk2dDC7HKUxv+Dox5ZuKqR7/kRlNXQ3T3w4
 jUWCWTC9xfp6OBj6tRfuETczVY6RCEg4oehcnPbVXqgKb3cPN3dumv3U7lQNGurQ1kws
 R3wQhGrxnzVND1vQ6IbnoYb/Otli1xTEJ1WdXJOTwI0hUw/8MGHh5mVdhM5eHOW8q21g
 t1RMr9HNkbFy1eJMeTu5H/eUhCKBiDIYeVJL/LkC879dEw05UtowvD5Pyq38eKdFKbA5
 dQSJO+yCgPcMUfJay/lEmtKsEEdAnD39NUJBfHVHaSR4sy9iB8ENDUwzv4wOEkCZtzCO
 NxjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=rH29rTwqC9tPWRe/rtqEAu2r9YLWMWTi3GrHYsUhaSM=;
 b=X+cQfrarvif0pV88xPJjmE92IQ0nHU2uu7l++7/vtKLzW+f7JJuteUMaWeX2pIoFAW
 5+o00QmYsGm78BfmYcNNFmBbooW36oLxhE2BTOQLMXwY7AIssd4v2T1YD2kLm7jNpgUe
 lagN7CNjtSZh1yMrZIfaqIAh6jiXnv41DOrl+QXegoTGfIybnt76FwScHKVi4xkPFsBv
 hkpqLVKW7kV9dny1G+DxRapZeRfKnlXDJONZtUmvLiYBfLQyY5fnJ27GefUBP0XNgTPM
 ZoaGXgoypnj5OZh7n5uNkT1+z0H46uwknCxhcJcM5VwGBsK+dsv5kP5RNk8/NwsnXWR4
 jzPw==
X-Gm-Message-State: AJIora8p3rI4V0pokbmpH4Qg8DfoGQ/2txUuJZrQeunJv0H6NZnxY4br
 xrzw/Z8RPhewPdkppNnkD0N3Id0JuMKH4g==
X-Received: from mimik.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4e])
 (user=wuhaotsh job=sendgmr) by 2002:a17:902:e54b:b0:16c:38e5:a9b7 with SMTP
 id n11-20020a170902e54b00b0016c38e5a9b7mr9490923plf.66.1657821636109; Thu, 14
 Jul 2022 11:00:36 -0700 (PDT)
Date: Thu, 14 Jul 2022 11:00:05 -0700
In-Reply-To: <20220714180006.77360-1-wuhaotsh@google.com>
Message-Id: <20220714180006.77360-8-wuhaotsh@google.com>
Mime-Version: 1.0
References: <20220714180006.77360-1-wuhaotsh@google.com>
X-Mailer: git-send-email 2.37.0.170.g444d1eabd0-goog
Subject: [PATCH 7/8] hw/arm: Set drive property for at24c eeprom
From: Hao Wu <wuhaotsh@google.com>
To: peter.maydell@linaro.org
Cc: richard.henderson@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 wuhaotsh@google.com, venture@google.com, Avi.Fishman@nuvoton.com, 
 kfting@nuvoton.com, hskinnemoen@google.com, f4bug@amsat.org, 
 bin.meng@windriver.com, qemu-block@nongnu.org, armbru@redhat.com, 
 thuth@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::549;
 envelope-from=3xFnQYggKCNUNL81FKJ87FF7C5.3FDH5DL-1IDEFE7EL.FI7@flex--wuhaotsh.bounces.google.com;
 helo=mail-pg1-x549.google.com
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
X-TUID: LMSvNoo5YvNS

This patch allows the user to attach an external drive as a property
for an onboard at24c eeprom device. It uses an unit number to
distinguish different devices.

Signed-off-by: Hao Wu <wuhaotsh@google.com>
---
 hw/arm/npcm7xx_boards.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/hw/arm/npcm7xx_boards.c b/hw/arm/npcm7xx_boards.c
index b083b0c572..b8337871ba 100644
--- a/hw/arm/npcm7xx_boards.c
+++ b/hw/arm/npcm7xx_boards.c
@@ -141,11 +141,16 @@ static I2CBus *npcm7xx_i2c_get_bus(NPCM7xxState *soc, uint32_t num)
 }
 
 static void at24c_eeprom_init(I2CBus *i2c_bus, int bus, uint8_t addr,
-                              uint32_t rsize)
+                              uint32_t rsize, int unit)
 {
     I2CSlave *i2c_dev = i2c_slave_new("at24c-eeprom", addr);
     DeviceState *dev = DEVICE(i2c_dev);
+    DriveInfo *dinfo;
 
+    dinfo = drive_get(IF_OTHER, bus, unit);
+    if (dinfo) {
+        qdev_prop_set_drive(dev, "drive", blk_by_legacy_dinfo(dinfo));
+    }
     qdev_prop_set_uint32(dev, "rom-size", rsize);
     i2c_slave_realize_and_unref(i2c_dev, i2c_bus, &error_abort);
 }
@@ -252,8 +257,8 @@ static void quanta_gsj_i2c_init(NPCM7xxState *soc)
     i2c_slave_create_simple(npcm7xx_i2c_get_bus(soc, 3), "tmp105", 0x5c);
     i2c_slave_create_simple(npcm7xx_i2c_get_bus(soc, 4), "tmp105", 0x5c);
 
-    at24c_eeprom_init(npcm7xx_i2c_get_bus(soc, 9), 9, 0x55, 8192);
-    at24c_eeprom_init(npcm7xx_i2c_get_bus(soc, 10), 10, 0x55, 8192);
+    at24c_eeprom_init(npcm7xx_i2c_get_bus(soc, 9), 9, 0x55, 8192, 0);
+    at24c_eeprom_init(npcm7xx_i2c_get_bus(soc, 10), 10, 0x55, 8192, 1);
 
     /*
      * i2c-11:
@@ -360,7 +365,7 @@ static void kudo_bmc_i2c_init(NPCM7xxState *soc)
     i2c_slave_create_simple(npcm7xx_i2c_get_bus(soc, 4), TYPE_PCA9548, 0x77);
 
     /* mbfru */
-    at24c_eeprom_init(npcm7xx_i2c_get_bus(soc, 4), 4, 0x50, 8192);
+    at24c_eeprom_init(npcm7xx_i2c_get_bus(soc, 4), 4, 0x50, 8192, 0);
 
     i2c_mux = i2c_slave_create_simple(npcm7xx_i2c_get_bus(soc, 13),
                                       TYPE_PCA9548, 0x77);
@@ -372,7 +377,7 @@ static void kudo_bmc_i2c_init(NPCM7xxState *soc)
     i2c_slave_create_simple(pca954x_i2c_get_bus(i2c_mux, 5), "tmp105", 0x49);
 
     /* bmcfru */
-    at24c_eeprom_init(npcm7xx_i2c_get_bus(soc, 14), 14, 0x55, 8192);
+    at24c_eeprom_init(npcm7xx_i2c_get_bus(soc, 14), 14, 0x55, 8192, 1);
 
     /* TODO: Add remaining i2c devices. */
 }
-- 
2.37.0.170.g444d1eabd0-goog

