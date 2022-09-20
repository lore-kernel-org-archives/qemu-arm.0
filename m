Received: by 2002:a17:906:b088:0:0:0:0 with SMTP id x8csp2076007ejy;
        Tue, 20 Sep 2022 15:44:14 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7FiNifhlq0WMVQVZ1Mx0wdoYcAXIoeKwWQxSERJHmJYRpBEFX78c+eesuCYtjRehVw+EtX
X-Received: by 2002:a05:620a:4f2:b0:6cf:2175:e7d2 with SMTP id b18-20020a05620a04f200b006cf2175e7d2mr6522807qkh.401.1663713853906;
        Tue, 20 Sep 2022 15:44:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1663713853; cv=none;
        d=google.com; s=arc-20160816;
        b=AyhEB2+FANiz/OXM1kDlFjJJyHGJSb6pStnWLNLL1h3gjBhL6S+lLqBVVJ+iDw9u6T
         VGJqknf9RHiY0Yz0DZqe9rk1Qfp5KQbEwtwe2GDP0d3DVYt3JZkK/KydUXBiwAm7c5fE
         BKlMpmfe8TOPAnuO4sFRZ3yE7CqC/JaLtJtEh0iCOWxgY6zxAHKUKqKbSso8c51+gH2i
         lRlPFSmbuQzCvX6+dYCv34cekppTzhjarLwEBnCdACgtC905Dgli5vDNFVqhZ9z1SjQs
         t0IjXGjgCME0NXsEJGolZWGSn5hzUL5TUDTi7GG4X1quCZHO529Kf+1llv2mjJarMBN7
         JbDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=3k7De6dda7HtE0VoeJmLCIiYC0o1UACU10YlAWqrISw=;
        b=IxbPVjnOx8mx3sHe8/EFUFmdeg6BVqezws0bGboBSeWNeo/iFENJJ5fh4JYZnY29rF
         ZPXRHdFkXt2cWYJnOzwlQE+dHlAHC1jhDpGafQ4fSaHt77Nv9qNtHMqXE92AbqrKNAtE
         m3KNJDvxiV7Qrvtw6973KfkXDbq2resR75qpAMitv+nkSiYLk0xTmEeHme4uC08ICwT0
         a4Z46n4mjxkaHu0p6jCaBT6+TOXRRHfNPjRDTY7526P7jTFDuJos+Yo3clquUUjqKSME
         uzKEP41/V24adg8+82+fZKpQw68EH8LW3+tZ+MYx2bykYSzhVOmZG19M5B8XI4NMZVRJ
         h2ig==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@bytedance-com.20210112.gappssmtp.com header.s=20210112 header.b=uysbs+EU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=bytedance.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b10-20020ac8540a000000b0034478988b45si507266qtq.1.2022.09.20.15.44.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 20 Sep 2022 15:44:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@bytedance-com.20210112.gappssmtp.com header.s=20210112 header.b=uysbs+EU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=bytedance.com
Received: from localhost ([::1]:36924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oalyP-0003Pu-E2
	for alex.bennee@linaro.org; Tue, 20 Sep 2022 18:44:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58826)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhangjian.3032@bytedance.com>)
 id 1oaiGe-0004Rv-FP
 for qemu-arm@nongnu.org; Tue, 20 Sep 2022 14:46:51 -0400
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e]:42556)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <zhangjian.3032@bytedance.com>)
 id 1oaiGZ-0007S2-Vt
 for qemu-arm@nongnu.org; Tue, 20 Sep 2022 14:46:47 -0400
Received: by mail-pg1-x52e.google.com with SMTP id t190so3551577pgd.9
 for <qemu-arm@nongnu.org>; Tue, 20 Sep 2022 11:46:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=3k7De6dda7HtE0VoeJmLCIiYC0o1UACU10YlAWqrISw=;
 b=uysbs+EUwH5Rc9qwEQ7m40LbRGRcauWexufWDZqaffyGfLYBIi8zSyFKka7GcmyM4B
 8gvQVnsc9t9IdIjnVHW4Wyjj73QdojRw88HYvfY3qPdka7b8gGeQQd/X6dgZcpbtOkq/
 8RFO4o/rFeev2ghfuQ9yk0E81FvTa84E/WuCUCIKNBs8KqNwVpF3i4eU9wz5eXmA7arX
 s64JeodAFk7oSv5Ae+8vyiPCO7ZZJlBzOn+DBCBGnLP5f3jYWaJqx+ZQRlctYftEl/yk
 ce16MY3ocBJHxFoy1r/dDgv8IBVcXP/WX5wePI/TseKBkFh0imlwE9rDrc4lTv8MnLDC
 AGyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=3k7De6dda7HtE0VoeJmLCIiYC0o1UACU10YlAWqrISw=;
 b=ouxdLzWWrWxUbVttib2rJh4mI9k5H5qgku1LoJZIIdP3SukXq0tnf2FsmjIC34VhjD
 X9gFPjJmnY/bUmEtfP5hgSAx5kD4ZEMKXpZBgH6wKdLx1ksNVT6sT9nBf3misC6B0MRu
 DKBjxRekRwoTdKUx4iY07GZDVfgne7pKXfa8k67+7GmAldD46sEg1DbYcPEldCZhqrDb
 xil8pn4yzhXP3CxTEWQeOZMVRf00t1R+w7qb/0Mp3PPuKO4+RIHcUeBmvZIz56EWY47y
 D6/GxKbbH+h/xi1sUAjrWL4gO4AaRvl828XgL84Qqih8gm+a/DvDa4ZWfCqQsStW9jg5
 JRxQ==
X-Gm-Message-State: ACrzQf3BqXA9uEPIYHIxIerhZxQhIrw8mNlY86whHZI25QOESdqvR4N5
 KkoN3l4rky21yXHH/rKhj9+NsQ==
X-Received: by 2002:a05:6a00:15c9:b0:541:1767:4ce2 with SMTP id
 o9-20020a056a0015c900b0054117674ce2mr24202493pfu.30.1663699602291; 
 Tue, 20 Sep 2022 11:46:42 -0700 (PDT)
Received: from localhost ([49.7.199.220]) by smtp.gmail.com with ESMTPSA id
 y16-20020a626410000000b00545f5046372sm206927pfb.208.2022.09.20.11.46.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Sep 2022 11:46:41 -0700 (PDT)
From: Jian Zhang <zhangjian.3032@bytedance.com>
To: f4bug@amsat.org, peter.maydell@linaro.org, clg@kaod.org, andrew@aj.id.au,
 joel@jms.id.au, qemu-devel@nongnu.org, qemu-arm@nongnu.org
Cc: yulei.sh@bytedance.com, tangyiwei.2022@bytedance.com,
 chentingting.2150@bytedance.com, yuhao.17@bytedance.com,
 wangxiaohua.1217@bytedance.com, xiening.xll@bytedance.com
Subject: [PATCH v2 3/3] hw/arm/aspeed: g220a: Add a latching switch device
Date: Wed, 21 Sep 2022 02:46:19 +0800
Message-Id: <20220920184619.3370115-4-zhangjian.3032@bytedance.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220920184619.3370115-1-zhangjian.3032@bytedance.com>
References: <20220920184619.3370115-1-zhangjian.3032@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=zhangjian.3032@bytedance.com; helo=mail-pg1-x52e.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: eeli36hNIJH6

Add a latching switch device connect between g220a BMC machind(soc
gpio) as host-power.

The latching switch device default state is off and trigger edge is
falling edge.

Tested:
In qemu, use g220a image

~# ipmitool power status
Chassis Power is off

~# ipmitool power on
Chassis Power Control: Up/On

~# ipmitool power status
Chassis Power is on

~# ipmitool power off
Chassis Power Control: Down/Off

~# ipmitool power status
Chassis Power is off

Signed-off-by: Jian Zhang <zhangjian.3032@bytedance.com>
---
 hw/arm/Kconfig  |  1 +
 hw/arm/aspeed.c | 20 ++++++++++++++++++++
 2 files changed, 21 insertions(+)

diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 15fa79afd3..f2455db5a0 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -457,6 +457,7 @@ config ASPEED_SOC
     select LED
     select PMBUS
     select MAX31785
+    select LATCHING_SWITCH
 
 config MPS2
     bool
diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index bc3ecdb619..070de3aeff 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -27,6 +27,7 @@
 #include "qemu/units.h"
 #include "hw/qdev-clock.h"
 #include "sysemu/sysemu.h"
+#include "hw/misc/latching_switch.h"
 
 static struct arm_boot_info aspeed_board_binfo = {
     .board_id = -1, /* device-tree-only board */
@@ -666,6 +667,25 @@ static void g220a_bmc_i2c_init(AspeedMachineState *bmc)
     };
     smbus_eeprom_init_one(aspeed_i2c_get_bus(&soc->i2c, 4), 0x57,
                           eeprom_buf);
+
+    /* Add a host-power device */
+    LatchingSwitchState *power =
+        latching_switch_create_simple(OBJECT(bmc),
+                                      false, TRIGGER_EDGE_FALLING);
+
+    /*
+     * connect the input to soc(out, power button)
+     * the power button in g220a is 215
+     */
+    qdev_connect_gpio_out(DEVICE(&bmc->soc.gpio), 215,
+                          qdev_get_gpio_in(DEVICE(power), 0));
+
+    /*
+     * connect the output to soc(in, power good signal)
+     * the power good in g220a is 209
+     */
+    qdev_connect_gpio_out(DEVICE(power), 0,
+                          qdev_get_gpio_in(DEVICE(&bmc->soc.gpio), 209));
 }
 
 static void aspeed_eeprom_init(I2CBus *bus, uint8_t addr, uint32_t rsize)
-- 
2.25.1

