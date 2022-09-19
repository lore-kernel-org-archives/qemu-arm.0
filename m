Received: by 2002:a17:906:b088:0:0:0:0 with SMTP id x8csp1286627ejy;
        Mon, 19 Sep 2022 10:30:58 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4O2ucIpeGMFfgydnOTasd8F19Yy3UACEreyUFUK/HeTsbyat0q4liRQTwIGekh3xy5lp2s
X-Received: by 2002:a05:620a:24cf:b0:6ce:7d6a:9c85 with SMTP id m15-20020a05620a24cf00b006ce7d6a9c85mr14165738qkn.271.1663608657940;
        Mon, 19 Sep 2022 10:30:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1663608657; cv=none;
        d=google.com; s=arc-20160816;
        b=FWj9QFDbRjufKGeZKThnZvKEA1M56vEEjD4wFRzgoQJxx0YxCDAPyz/Nvsl1QApaB5
         pDAcKX15GLwNQexcareFhmjt7YNHH9PIF0TjKFETeS8Q+LsCmcHPzSo49PXKz6Faad8b
         zM78yOROuEmW5gS7ZMYfdA9mOrFWbGBwJOiUrz/lYvH0o/zrpKRK/En3bqoOJk8xKjtg
         WgVkSAm/9bBeaTm5Nna779tNhH1SJaDAwroEUQbbX3+NNlfG6mUNFzGsQyUR1c6Amuv9
         RenDbQQP98Gp6jaqAToOfaerLDMcvKwsG8p5/ae+Nn9OYq8cWIemDVadr0lzrcPdKpQi
         KcJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=MKmFcMrw4Ulwq9cX8g5pa2zrdMnwEk2YgEPM3gKsVrk=;
        b=GDF0i+aPUs+IqCaX02WZjAcVm+wm8waeNNXfwz1HOc83GiEeyw0xz0owVGPE4uJg9q
         ZN/QOdRXFTO12YjgdKmFhdqAibnhqQC4LYlhD8DSpsm2NRU3krjlbtT4GYM38F5P4L9H
         08NJMroumgwYOWirwFCAhF2/su9MYAPLEsio2qAfrxZr6oVWcsJ75j1w12kZR0WeRKMs
         /v38ElWQ0eMzRAheCEeeXZ8sed6pwiYLg3yjqJ6B/9uLqXj00HsIR1y5/R1FYV5tVfXE
         xW1RDWrZvN9dLlYW29xmXgkMOyihmZ+2iDjh+GD39km2dOKLtNeLOm7WtvSQPTX4i7pF
         E40Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@bytedance-com.20210112.gappssmtp.com header.s=20210112 header.b=HjTdgNPC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=bytedance.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x10-20020a05620a258a00b006cdd84e8019si11663535qko.397.2022.09.19.10.30.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 19 Sep 2022 10:30:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@bytedance-com.20210112.gappssmtp.com header.s=20210112 header.b=HjTdgNPC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=bytedance.com
Received: from localhost ([::1]:47740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oaKbd-0005jw-Q2
	for alex.bennee@linaro.org; Mon, 19 Sep 2022 13:30:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhangjian.3032@bytedance.com>)
 id 1oaKT6-00067E-19
 for qemu-arm@nongnu.org; Mon, 19 Sep 2022 13:22:04 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d]:43628)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <zhangjian.3032@bytedance.com>)
 id 1oaKT4-0000Sc-9E
 for qemu-arm@nongnu.org; Mon, 19 Sep 2022 13:22:03 -0400
Received: by mail-pf1-x42d.google.com with SMTP id d82so233662pfd.10
 for <qemu-arm@nongnu.org>; Mon, 19 Sep 2022 10:22:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=MKmFcMrw4Ulwq9cX8g5pa2zrdMnwEk2YgEPM3gKsVrk=;
 b=HjTdgNPCZXM7/6uZ0EmISXGtj9hxf1BHyFx1d7UwNdvRY716bWI1z+DMFaqYhwNLpO
 UXHvuABvNUrleednyx+BKWH5MzT7k6nEA45p5XBaJEL22l4PH0kErqwS+rILXnRPcKjq
 YiFlRf1hValSa03QIeFQr96wp97OZUasrmfPiH2eWaNe0VnJA6kVaVP9Xi+tsyyVNhVy
 oz4Ylqg5hHCHVlrzIE42IjKPHAXA1yJcF3skmD0+W3wKHzgqNNxTOdlMo9Yvq5qGGrxF
 JiPydpQ4YmouurWslf9C8Uwv3wF5JdJeIjOf9UaFFsiTFv6AjNOLc8KpAN1qLe8eGuxS
 niNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=MKmFcMrw4Ulwq9cX8g5pa2zrdMnwEk2YgEPM3gKsVrk=;
 b=EU+zAcxo6NkKGVcDW88Spcj1c4/o6CPSIy95MF7u+OErLlxS8Sn31QlVmsQZgbgbux
 78NjRr1UN6et0+8e0Wy+Sv8/q/rpLh3+IhxYaIhIqeCyIUm8eOE2wZCqT/TTSV1mwsJV
 VRopyVP64I6yqb1Sr0jebXsqk+MHvGzTW1QB9B19j+yI0iazSRSd4CsxMAwXke4r6dvD
 Vpxh/uDXoAJxZw6ucwDcdlUBOUGGUZQn/xZE46SB/BL5N79kGpNetX/fpNCKww1I29a4
 YKq1wAT9st5+2//rxtfIIwzZTMDUl+BCFocYORxsBfgG9tKpmeKBYYhfLv8WIAaciRta
 dgMQ==
X-Gm-Message-State: ACrzQf3z1beH06mVm3u99ExoYQ6AKy5kWTA4hzRuGdIaivAT92oyd6pA
 a5aUJgvoGB2Ky8QHfJ9Cyw46YA==
X-Received: by 2002:a05:6a00:180d:b0:540:ec09:293 with SMTP id
 y13-20020a056a00180d00b00540ec090293mr19611543pfa.3.1663608120887; 
 Mon, 19 Sep 2022 10:22:00 -0700 (PDT)
Received: from localhost ([49.7.199.22]) by smtp.gmail.com with ESMTPSA id
 x1-20020aa79a41000000b00536b2483aedsm18849161pfj.199.2022.09.19.10.21.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Sep 2022 10:22:00 -0700 (PDT)
From: Jian Zhang <zhangjian.3032@bytedance.com>
To: peter.maydell@linaro.org, clg@kaod.org, andrew@aj.id.au, joel@jms.id.au,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org
Cc: yulei.sh@bytedance.com, tangyiwei.2022@bytedance.com,
 chentingting.2150@bytedance.com, yuhao.17@bytedance.com,
 wangxiaohua.1217@bytedance.com, xiening.xll@bytedance.com,
 Jian Zhang <zhangjian.3032@bytedance.com>
Subject: [PATCH 3/3] hw/arm/aspeed: g220a: Add host-power device
Date: Tue, 20 Sep 2022 01:21:12 +0800
Message-Id: <20220919172112.2706026-4-zhangjian.3032@bytedance.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220919172112.2706026-1-zhangjian.3032@bytedance.com>
References: <20220919172112.2706026-1-zhangjian.3032@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=zhangjian.3032@bytedance.com; helo=mail-pf1-x42d.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 19 Sep 2022 13:29:32 -0400
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
X-TUID: FiCg7l6DNsiR

Add power-button/power-good gpio connect between g220a BMC machind(soc
gpio) and host.

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
 hw/arm/aspeed.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index 952fa11ca2..80a98b8d74 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -28,6 +28,7 @@
 #include "hw/qdev-clock.h"
 #include "sysemu/sysemu.h"
 #include "hw/arm/fby35.h"
+#include "hw/misc/host_power.h"
 
 static struct arm_boot_info aspeed_board_binfo = {
     .board_id = -1, /* device-tree-only board */
@@ -723,6 +724,24 @@ static void g220a_bmc_i2c_init(AspeedMachineState *bmc)
     };
     smbus_eeprom_init_one(aspeed_i2c_get_bus(&soc->i2c, 4), 0x57,
                           eeprom_buf);
+
+    /* Add a host-power device */
+    HostPowerState *power = host_power_create_simple(OBJECT(bmc));
+
+    /*
+     * connect the power button(in) to soc(out)
+     * the power button in g220a is 215
+     */
+    qdev_connect_gpio_out(DEVICE(&bmc->soc.gpio), 215,
+                          qdev_get_gpio_in_named(DEVICE(power),
+                                                 "power-button", 0));
+
+    /*
+     * connect the power good signal(out) to soc(in)
+     * the power good in g220a is 209
+     */
+    qdev_connect_gpio_out_named(DEVICE(power), "power-good", 0,
+                                qdev_get_gpio_in(DEVICE(&bmc->soc.gpio), 209));
 }
 
 static void aspeed_eeprom_init(I2CBus *bus, uint8_t addr, uint32_t rsize)
-- 
2.25.1

