Received: by 2002:a05:6512:b9e:0:0:0:0 with SMTP id b30csp119980lfv;
        Wed, 3 Nov 2021 15:08:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx9tDkgfbJiDxS8MGxJ4L3MAsyCxGj5AziKENrcJGjOpdMwQWetL02Nra8aQkg1zVZQkVTb
X-Received: by 2002:aca:1213:: with SMTP id 19mr12777643ois.117.1635977299467;
        Wed, 03 Nov 2021 15:08:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1635977299; cv=none;
        d=google.com; s=arc-20160816;
        b=VIZspr+EwmFTi983VLlW+HWULhc86+XUW7ltveU4UOeAUhGQypKvQobc9Nl4/xmeoa
         Q++TjoIzF4WfOfgGFBxSmbnJFvQGV/G47ZB6joG08z3lH5He7Aza8TNTR9MX+Bava4+L
         VmIoLe8oAoMWgR/9GtXLW1ZKahRksReoAsm/wUGw+W1SDf9nAkAUXP2ixF2DPb4QfSI0
         E3B4Gw2Lzbcei/Z0JzcuDuzbAbRA3pj3Q4852+4ZioZ2X9W+Rzkik+XJSTC/1Z7pvpEf
         qipqZC26F2sgu1Q0qPqIg7wioCg521gga2ZoT69u5j1akSo6DLKcYzs1m04mOyQFPRox
         I0Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:references
         :mime-version:message-id:in-reply-to:date:dkim-signature;
        bh=zKsthWD6aLJepNequIRsE8wsdkCHtKgMHCSXi5pgrhc=;
        b=fc+1vigqj8jg3nNsc9bOVFXc2tYgNX0JM5To2jzmmqWhcSpt8B87XE7wj+Phd6HQQt
         F5o8xW1LWqlyYCXgq1Xz1zVa5r1WSNeTkYTpnUktZ3+CaXbOQFDu1irepAXvGTFiPYrx
         m6OIJAXKWuy8r1VfWCyQA2jn4GfWh1QVBrUSlzzERrAtShAV1GM8MaUwZcmp356QsXQ3
         e1NtQ0rrJDF8FFERID0LBV8bN3c4pYkiQ7euxPgs/DtumMvVOBXp4OSGroAqFthRO5Wa
         p6H8he5tEwcMtpjxYhy8/w4/OEXvsFl733emJgwVWiIlrbITzUv0f/zjUc7T2dYJodf4
         doDA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=LdKZ6V9H;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r19si763487ota.259.2021.11.03.15.08.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 03 Nov 2021 15:08:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=LdKZ6V9H;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1]:40064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1miOQc-0006L1-Ql
	for alex.bennee@linaro.org; Wed, 03 Nov 2021 18:08:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3yQaDYQgKCPQsqdWkpodckkcha.Ykimaiq-Wnijkjcjq.knc@flex--wuhaotsh.bounces.google.com>)
 id 1miOKU-0003F7-D4
 for qemu-arm@nongnu.org; Wed, 03 Nov 2021 18:01:58 -0400
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a]:34422)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3yQaDYQgKCPQsqdWkpodckkcha.Ykimaiq-Wnijkjcjq.knc@flex--wuhaotsh.bounces.google.com>)
 id 1miOKO-0002c9-LH
 for qemu-arm@nongnu.org; Wed, 03 Nov 2021 18:01:57 -0400
Received: by mail-pl1-x64a.google.com with SMTP id
 k9-20020a170902ba8900b00141f601d5c8so1772200pls.1
 for <qemu-arm@nongnu.org>; Wed, 03 Nov 2021 15:01:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=zKsthWD6aLJepNequIRsE8wsdkCHtKgMHCSXi5pgrhc=;
 b=LdKZ6V9HSdXlROBBmA/fypBCta8ug4XXGnUmkBApf2ExIWyZcJDcEBZjmrLnHHiuic
 9Dz/rp4xR/kgBEiUD9UdaB7uI4TljLwlkNseSVXUbBdpjdZZrJ5qtLWnRpk9VsOYn/A5
 napPDpH/wgOhqEZdtUmIM/V72DvmElO5A/3X/XLJ2kuNPwzv1/zEWan1zxXdcD6FDRG1
 fNNvlXW1PTbmoAK7GVkX4XPoSqHIp7MBKWeu9l/mkZLQoM//HD47ECh499q0jxkPpd4t
 pMYM1qBsal1IcQuVjAgKLgv1oxrcif41nWVwiWVUQVd7x/KUwVEye9MaEocfYggRBrw2
 G9IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=zKsthWD6aLJepNequIRsE8wsdkCHtKgMHCSXi5pgrhc=;
 b=zH+7GyeBRgNd7OYN/adR1ahLcDxRienR8ongwQr5+hYtEfnCl5YlSi7ZuVk/RvIbqk
 XajYtZSqDvmksI0RMvyyYYZduw2Ol3e3my9aXhhagTmR1QX3Hbu+4U5bNVgJ9cD2DyRS
 TaextO70pVVTtoiAKbLpdwtU3VUrAgr5LA52QQl89WE8UijY1MsVOOTbhrafjN/UDLNj
 Aau74a1saAl2EhkU40BH6QR38Q/uE8cFYV3I+E/mKiB7Jg82nSzUYAQzNu1wMGUw6uOh
 G1X8JHKIiA3el4PxmrszwVR1Bc6z61EZuIZmtCAdvxICi0c9vKhWXamq7QEQz5poLB7a
 xAaQ==
X-Gm-Message-State: AOAM532kkQdgaPauA5cmT+8atheD4EYvnoW8pHtcgpW2/hqWMzXA5EIm
 uvJrVeO1eSmuRSIl2Fdb6r97PqtdLPEATQ==
X-Received: from mimik.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4e])
 (user=wuhaotsh job=sendgmr) by 2002:a17:90b:2487:: with SMTP id
 nt7mr17397144pjb.75.1635976905864; Wed, 03 Nov 2021 15:01:45 -0700 (PDT)
Date: Wed,  3 Nov 2021 15:01:33 -0700
In-Reply-To: <20211103220133.1422879-1-wuhaotsh@google.com>
Message-Id: <20211103220133.1422879-5-wuhaotsh@google.com>
Mime-Version: 1.0
References: <20211103220133.1422879-1-wuhaotsh@google.com>
X-Mailer: git-send-email 2.33.1.1089.g2158813163f-goog
Subject: [PATCH v4 7/7] hw/arm: quanta-gbs-bmc add i2c devices
From: Hao Wu <wuhaotsh@google.com>
To: peter.maydell@linaro.org
Cc: richard.henderson@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 wuhaotsh@google.com, venture@google.com, Avi.Fishman@nuvoton.com, 
 kfting@nuvoton.com, hskinnemoen@google.com, f4bug@amsat.org, 
 bin.meng@windriver.com, qemu-block@nongnu.org, armbru@redhat.com, 
 thuth@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::64a;
 envelope-from=3yQaDYQgKCPQsqdWkpodckkcha.Ykimaiq-Wnijkjcjq.knc@flex--wuhaotsh.bounces.google.com;
 helo=mail-pl1-x64a.google.com
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
X-TUID: 2yMmglCWBG3U

From: Patrick Venture <venture@google.com>

Adds supported i2c devices to the quanta-gbc-bmc board.

Signed-off-by: Patrick Venture <venture@google.com>
Reviewed-by: Hao Wu <wuhaotsh@google.com>
---
 hw/arm/npcm7xx_boards.c | 82 ++++++++++++++++++++++++-----------------
 1 file changed, 49 insertions(+), 33 deletions(-)

diff --git a/hw/arm/npcm7xx_boards.c b/hw/arm/npcm7xx_boards.c
index 9121e081fa..7fb1b3dbc2 100644
--- a/hw/arm/npcm7xx_boards.c
+++ b/hw/arm/npcm7xx_boards.c
@@ -276,10 +276,12 @@ static void quanta_gsj_fan_init(NPCM7xxMachine *machine, NPCM7xxState *soc)
 
 static void quanta_gbs_i2c_init(NPCM7xxState *soc)
 {
+    I2CSlave *i2c_mux;
+
+    /* i2c-0: */
+    i2c_slave_create_simple(npcm7xx_i2c_get_bus(soc, 0), TYPE_PCA9546, 0x71);
+
     /*
-     * i2c-0:
-     *     pca9546@71
-     *
      * i2c-1:
      *     pca9535@24
      *     pca9535@20
@@ -288,46 +290,60 @@ static void quanta_gbs_i2c_init(NPCM7xxState *soc)
      *     pca9535@23
      *     pca9535@25
      *     pca9535@26
-     *
-     * i2c-2:
-     *     sbtsi@4c
-     *
-     * i2c-5:
-     *     atmel,24c64@50 mb_fru
-     *     pca9546@71
-     *         - channel 0: max31725@54
-     *         - channel 1: max31725@55
-     *         - channel 2: max31725@5d
-     *                      atmel,24c64@51 fan_fru
-     *         - channel 3: atmel,24c64@52 hsbp_fru
-     *
+     */
+
+    /* i2c-2: sbtsi@4c */
+
+    /* i2c-5: */
+    /* mb_fru */
+    at24c_eeprom_init(npcm7xx_i2c_get_bus(soc, 5), 5, 0x50, 8192, 0);
+    i2c_mux = i2c_slave_create_simple(npcm7xx_i2c_get_bus(soc, 5),
+                                      TYPE_PCA9546, 0x71);
+    /* max31725 is tmp105 compatible. */
+    i2c_slave_create_simple(pca954x_i2c_get_bus(i2c_mux, 0), "tmp105", 0x54);
+    i2c_slave_create_simple(pca954x_i2c_get_bus(i2c_mux, 1), "tmp105", 0x55);
+    i2c_slave_create_simple(pca954x_i2c_get_bus(i2c_mux, 2), "tmp105", 0x5d);
+    /* fan_fru */
+    at24c_eeprom_init(pca954x_i2c_get_bus(i2c_mux, 2), 5, 0x51, 8192, 1);
+    /* hsbp_fru */
+    at24c_eeprom_init(pca954x_i2c_get_bus(i2c_mux, 3), 5, 0x52, 8192, 2);
+
+    /*
      * i2c-6:
      *     pca9545@73
      *
      * i2c-7:
      *     pca9545@72
-     *
-     * i2c-8:
-     *     adi,adm1272@10
-     *
-     * i2c-9:
-     *     pca9546@71
-     *         - channel 0: isil,isl68137@60
-     *         - channel 1: isil,isl68137@61
-     *         - channel 2: isil,isl68137@63
-     *         - channel 3: isil,isl68137@45
-     *
+     */
+
+    /* i2c-8: */
+    i2c_slave_create_simple(npcm7xx_i2c_get_bus(soc, 8), "adm1272", 0x10);
+
+    /* i2c-9: */
+    i2c_slave_create_simple(npcm7xx_i2c_get_bus(soc, 9), TYPE_PCA9546, 0x71);
+    /*
+     * - channel 0: isil,isl68137@60
+     * - channel 1: isil,isl68137@61
+     * - channel 2: isil,isl68137@63
+     * - channel 3: isil,isl68137@45
+     */
+
+    /*
      * i2c-10:
      *     pca9545@71
      *
      * i2c-11:
      *     pca9545@76
-     *
-     * i2c-12:
-     *     maxim,max34451@4e
-     *     isil,isl68137@5d
-     *     isil,isl68137@5e
-     *
+     */
+
+    /* i2c-12: */
+    i2c_slave_create_simple(npcm7xx_i2c_get_bus(soc, 12), "max34451", 0x4e);
+    /*
+     * isil,isl68137@5d
+     * isil,isl68137@5e
+     */
+
+    /*
      * i2c-14:
      *     pca9545@70
      */
-- 
2.33.1.1089.g2158813163f-goog

