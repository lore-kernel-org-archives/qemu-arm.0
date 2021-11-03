Received: by 2002:a05:6512:b9e:0:0:0:0 with SMTP id b30csp115653lfv;
        Wed, 3 Nov 2021 15:03:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzo3zqJR/ZrkDsLAs7tiuJyoGTkGONxIVBDajfrnVeMOjXwHtAzQoKqhUAck2E003Zo7EBo
X-Received: by 2002:a05:6830:43aa:: with SMTP id s42mr17090488otv.13.1635977037862;
        Wed, 03 Nov 2021 15:03:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1635977037; cv=none;
        d=google.com; s=arc-20160816;
        b=Ozrx0gjYNd44aWpVg4lw2RTEDVSVkgFENMpBIKirBmSHqOK+mql5lwmRPKbfIo4gIG
         0Bq7Q7BnRxyFsxPPyqpC5QmC/pVdCo68rO5f1lPJLeXm6X/dwiao15ds28jMS6vKykiJ
         6ZvmiA/0i0kHuPkjQjWP2kGQdq9QOaXwSoJrRHMz8xbS0liIWpLj/Om7aiGdW7KBSCZW
         QjymZLKejJpPOOjBKqDJeZ2JbYqcMuXH2UVF4y5pJeo5+i1CIHXYRIXVExioL+pJFjRX
         HOJ+zM9wFcIhvC0vg3ONZrH6lFJdF6DdoTjf9eifjpG7P+tnlBUkYeGFPkNONVDG3aHn
         W7rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:references
         :mime-version:message-id:in-reply-to:date:dkim-signature;
        bh=DofkSRTXRKtEMsEmkHJldcRscNyPS9ZKqUEISxFiUzc=;
        b=HiWfIbWRTxHZq7CUQgIaqPxnUiGyXrpRd+7+u5+xX3Ek8LftkxQL/aVIz6GZF09gM9
         LpfFw8xUkfOgW3fnzWIyX/4QH+mhFwq24ekak+ctlcw5ULj4spdtXAlH6fRMCPAjDMcj
         z9osotVTLIwMlz47TprPAUC5Mkcn55QKOq12QY1MjjNSxCtL+Rj53jG31hmuzqTCvjtm
         hinYljIqW2OqVP8MkLb+Et3m4xm8ILU3JlvNsd0x5hOfTm88SvPP5Sbk9mQuHgLy6z/8
         SE+QhczT6d2a3ztd4Fe7kSttcHcceuMIiOd7rlMW6GinJTspllPr4M8WF7fwMtcbfokP
         IzUw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b="Ir/f1gSb";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r82si3550156oif.142.2021.11.03.15.03.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 03 Nov 2021 15:03:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b="Ir/f1gSb";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1]:58298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1miOMP-0007Ul-7x
	for alex.bennee@linaro.org; Wed, 03 Nov 2021 18:03:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54410)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3xwaDYQgKCPIqobUinmbaiiafY.WigkYgo-Ulghihaho.ila@flex--wuhaotsh.bounces.google.com>)
 id 1miOKS-0003Ep-B6
 for qemu-arm@nongnu.org; Wed, 03 Nov 2021 18:01:58 -0400
Received: from mail-pg1-x549.google.com ([2607:f8b0:4864:20::549]:52805)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3xwaDYQgKCPIqobUinmbaiiafY.WigkYgo-Ulghihaho.ila@flex--wuhaotsh.bounces.google.com>)
 id 1miOKM-0002bl-07
 for qemu-arm@nongnu.org; Wed, 03 Nov 2021 18:01:56 -0400
Received: by mail-pg1-x549.google.com with SMTP id
 z7-20020a63c047000000b0026b13e40309so2163407pgi.19
 for <qemu-arm@nongnu.org>; Wed, 03 Nov 2021 15:01:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=DofkSRTXRKtEMsEmkHJldcRscNyPS9ZKqUEISxFiUzc=;
 b=Ir/f1gSbLy9cLdndt/s2yFMzleVVnjUGZlYAjIpJyjKSVbCL+zQIxFrSO20Yn9jv6e
 pBHGwuHaSczYjjkroQcQIW9H/WhUBlugYMbtfW/+udprAskcGv1IfqvgQ5xgKZjWdPaY
 j7yobWBylCM+ZEeHP9PhAf/VGu6gX/6NPPCKuK+XE4Vef/xZLLUFmpvL+URkRF6ba6iC
 XnLRDGC7OvdYzaCFVOJTXvsq7hn/RT55E6E+/6CIT+XdAdRx9L+c4euzhEbKkLSk0hc4
 bgcpoOTnoxxR7e2MsAP5Z0nS/0CtpqC9/lfHtmCo+JKwcecuPMt1MwJ3KyTZpefrE/UH
 /mDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=DofkSRTXRKtEMsEmkHJldcRscNyPS9ZKqUEISxFiUzc=;
 b=Wr8kDthR4VgRYcYSsY5V+Ilqs2lWFSUwlJouZEbQjq1uN/T3qQ1TwMjafskl4Rh6nR
 kLlktdvJ4H+W0znA1mU2EZka3uGVAXzLHfp0dn6GlxOPI/kQqiP2yHpq+fWLXbXfy7sf
 Vf0/DZt17nMoc1KstPifTQSwftomtZ3ssGbizWjBrDEAAbeXaKehihkWT2PiQK9BKbT9
 /k9hIUMDlkw19w48snZbvXauJszKt+ItI9WMutsttsCPKfPG25S+aU1jR4DkYvUaGooz
 F3fPqGI+Ob+jqN11y9adjtYFTHWWxHh8T/P2GFObjGlFyJ7a+uFah26shJOKASlIKNfI
 djnA==
X-Gm-Message-State: AOAM5307be28Ui2s2PSiefUWlMhFNfx3q3ZvgWbb97Rg9IGdZzNZW6MB
 xJT54wM7K+ZZ9qeDpDX85bCtkKwBCK+MVg==
X-Received: from mimik.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4e])
 (user=wuhaotsh job=sendgmr) by 2002:a17:902:ce8c:b0:141:d411:7e25 with SMTP
 id f12-20020a170902ce8c00b00141d4117e25mr26691523plg.85.1635976903943; Wed,
 03 Nov 2021 15:01:43 -0700 (PDT)
Date: Wed,  3 Nov 2021 15:01:32 -0700
In-Reply-To: <20211103220133.1422879-1-wuhaotsh@google.com>
Message-Id: <20211103220133.1422879-4-wuhaotsh@google.com>
Mime-Version: 1.0
References: <20211103220133.1422879-1-wuhaotsh@google.com>
X-Mailer: git-send-email 2.33.1.1089.g2158813163f-goog
Subject: [PATCH v4 6/7] hw/nvram: Update at24c EEPROM init function in NPCM7xx
 boards
From: Hao Wu <wuhaotsh@google.com>
To: peter.maydell@linaro.org
Cc: richard.henderson@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 wuhaotsh@google.com, venture@google.com, Avi.Fishman@nuvoton.com, 
 kfting@nuvoton.com, hskinnemoen@google.com, f4bug@amsat.org, 
 bin.meng@windriver.com, qemu-block@nongnu.org, armbru@redhat.com, 
 thuth@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::549;
 envelope-from=3xwaDYQgKCPIqobUinmbaiiafY.WigkYgo-Ulghihaho.ila@flex--wuhaotsh.bounces.google.com;
 helo=mail-pg1-x549.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-TUID: yd7h4qTZTtuZ

We made 3 changes to the at24c_eeprom_init function in
npcm7xx_boards.c:

1. We allow the function to take a I2CBus* as parameter. This allows
   us to attach an EEPROM device behind an I2C mux which is not
   possible with the old method.

2. We make at24c EEPROMs are backed by drives so that we can
   specify the content of the EEPROMs.

3. Instead of using i2c address as unit number, This patch assigns
   unique unit numbers for each eeproms in each board. This avoids
   conflict in providing multiple eeprom contents with the same address.
   In the old method if we specify two drives with the same unit number,
   the following error will occur: `Device with id 'none85' exists`.

Signed-off-by: Hao Wu <wuhaotsh@google.com>
---
 hw/arm/npcm7xx_boards.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/hw/arm/npcm7xx_boards.c b/hw/arm/npcm7xx_boards.c
index dec7d16ae5..9121e081fa 100644
--- a/hw/arm/npcm7xx_boards.c
+++ b/hw/arm/npcm7xx_boards.c
@@ -126,13 +126,17 @@ static I2CBus *npcm7xx_i2c_get_bus(NPCM7xxState *soc, uint32_t num)
     return I2C_BUS(qdev_get_child_bus(DEVICE(&soc->smbus[num]), "i2c-bus"));
 }
 
-static void at24c_eeprom_init(NPCM7xxState *soc, int bus, uint8_t addr,
-                              uint32_t rsize)
+static void at24c_eeprom_init(I2CBus *i2c_bus, int bus, uint8_t addr,
+                              uint32_t rsize, int unit_number)
 {
-    I2CBus *i2c_bus = npcm7xx_i2c_get_bus(soc, bus);
     I2CSlave *i2c_dev = i2c_slave_new("at24c-eeprom", addr);
     DeviceState *dev = DEVICE(i2c_dev);
+    DriveInfo *dinfo;
 
+    dinfo = drive_get(IF_OTHER, bus, unit_number);
+    if (dinfo) {
+        qdev_prop_set_drive(dev, "drive", blk_by_legacy_dinfo(dinfo));
+    }
     qdev_prop_set_uint32(dev, "rom-size", rsize);
     i2c_slave_realize_and_unref(i2c_dev, i2c_bus, &error_abort);
 }
@@ -239,8 +243,8 @@ static void quanta_gsj_i2c_init(NPCM7xxState *soc)
     i2c_slave_create_simple(npcm7xx_i2c_get_bus(soc, 3), "tmp105", 0x5c);
     i2c_slave_create_simple(npcm7xx_i2c_get_bus(soc, 4), "tmp105", 0x5c);
 
-    at24c_eeprom_init(soc, 9, 0x55, 8192);
-    at24c_eeprom_init(soc, 10, 0x55, 8192);
+    at24c_eeprom_init(npcm7xx_i2c_get_bus(soc, 9), 9, 0x55, 8192, 0);
+    at24c_eeprom_init(npcm7xx_i2c_get_bus(soc, 10), 10, 0x55, 8192, 1);
 
     /*
      * i2c-11:
-- 
2.33.1.1089.g2158813163f-goog

