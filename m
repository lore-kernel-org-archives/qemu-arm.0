Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp5771596lfb;
        Thu, 10 Dec 2020 02:36:33 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzJvKMnCgTllM6HKEi1fRjkVxIh49kALzMu5HK05AznuRUhAQL3NtHWvlzUOJWl0pVjxqv8
X-Received: by 2002:a25:c052:: with SMTP id c79mr9425049ybf.287.1607596593775;
        Thu, 10 Dec 2020 02:36:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1607596593; cv=none;
        d=google.com; s=arc-20160816;
        b=H7gvi4Rbtm9L3HlGyG50jCdvRnNKcHm51S27xCO8YtLKivYFrHk++7yH9+ZGNGX4Cc
         oe/lcurJ6SNIshscgaHvs4esldkL29rz8K5gSOS0UzteCkSsCswW46Tol/m89lhk+RPN
         q6i8gTqQRTMALCeKtEqWFv2gWjdNqye1Cn4EXBVUOrt3PDoDXzEuYT61VFzbTr5Em2bI
         cBNiZeI3pet9zczkSRV3OQ+Z75S9rl0d+0CJqoHtw11ibtPYqgh8D9l6dB+Jz6TxS+Ls
         lu/BM0bpqdP6+cBAVJJ6wCL47shw2bCYG8LsAOzQ1TN1cr2Wi8ahFQM4hcb8a3tgQCTx
         RINA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=UZD9l1LIxuZlKe2qFaqT1BozfrmszhcvghzaTewzuMc=;
        b=SZ4xKQ5c7SLrA6geQDD9Rpnx1QUeECp3Suu4YmFO7fhdHEk3Q1dqcwe0QOPzihjTE3
         hjrsT6EINThnfoTNNdztcIPFKN/k1sJkizNbMKFva++WdzEWAKrMc15YRLYGGTIB3ueC
         3Nf1t0/QsnwVbGl65cILFj5p3Cl2sT4jdr4Zcdy8sHWvm2bU37SxxapsVejn+ZBnrBUW
         xjXY3pJuNTxKWmrFOQ+m7m0X9pUMNNnM0oEG9cHGlAwU8FF/0VODSjz5NNo+q9UKyFQP
         TVCjZ4/CHGS42fQ9+SHThqTFV5aGvs1vgrGX+7BlP/T5LiraStltMpDEt+2phxeoAejw
         haOA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@bytedance-com.20150623.gappssmtp.com header.s=20150623 header.b=v7vEUuKl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=bytedance.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v16si4967214ybs.126.2020.12.10.02.36.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 10 Dec 2020 02:36:33 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@bytedance-com.20150623.gappssmtp.com header.s=20150623 header.b=v7vEUuKl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=bytedance.com
Received: from localhost ([::1]:34574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1knJJJ-0007dB-7E
	for alex.bennee@linaro.org; Thu, 10 Dec 2020 05:36:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33996)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangzhiqiang.bj@bytedance.com>)
 id 1knJJ6-0007Zo-R8
 for qemu-arm@nongnu.org; Thu, 10 Dec 2020 05:36:20 -0500
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443]:40345)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wangzhiqiang.bj@bytedance.com>)
 id 1knJJ1-0007WR-DT
 for qemu-arm@nongnu.org; Thu, 10 Dec 2020 05:36:17 -0500
Received: by mail-pf1-x443.google.com with SMTP id t7so3643457pfh.7
 for <qemu-arm@nongnu.org>; Thu, 10 Dec 2020 02:36:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UZD9l1LIxuZlKe2qFaqT1BozfrmszhcvghzaTewzuMc=;
 b=v7vEUuKl7RitJRvLBh7tAubG7YoiCBq6PZom/+rsTBxgtVOcxiEbBUQMO6MMyuogUw
 boZpIJ7ZTIJOBuSbOxn/u38G4i+uFkTVDrcafsYi/dnJppSItbEFy/jRMxJa07+LPBNX
 mHI5iP/t4bReKX1C0giXyB7jM1p4Yb8iMk4R6SnA72K1L4+sSjoKJArstH3xokwBYbu4
 4EJUKsl7Podway8bie1arScNiWuZPO32sH35WIiK7TIlFJAA1Q/7J3tJp5Sfxn9y7Bi2
 C4IFguWHu1LYfqp6iH12tnAJw4mtE2lKHfPxxFrnMmXkPLSEhl0RvMAEHbmBr2ZYr8E4
 K4dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UZD9l1LIxuZlKe2qFaqT1BozfrmszhcvghzaTewzuMc=;
 b=bMhX47zURDwYb/hvXmQxbWF+0QLZ248GR8yhcPvsghvhmLoDR4ssSG6CZhYcetGd6f
 dYIBHUPLTQWUlWrp9W9p7+AqYWU0DvX6rVjFdXzroqLQlo1GprN4a9S9pkPLS3xOiSDs
 e13xY+VuxprODjxc1AdBkTfOt3J0YHY2Elq6FaLoz7bqxqYQeWZzcnpQF3Oq6jwCHiLl
 EC3KT2OZGXiDq4bmfodr4W62vMBYFlWMws2u9nMhW+eGYZPMGMKTsGPFLlEqZEK+wyeH
 ON06HPn+xuxhZLxHA1ZpHhZ6klMgtRprlirjMIN0u4/ZdNPVWGgQ2qAJwBC1LwplhfqX
 x7MQ==
X-Gm-Message-State: AOAM530iSMPqzbyOLjGnyIhykcN41zvM4Qew+C2jakRnNOjlfUMXsWfZ
 usHYS/MEwPop6E2AIOyIGJuhVw==
X-Received: by 2002:a17:90b:4a0c:: with SMTP id
 kk12mr6817832pjb.205.1607596571038; 
 Thu, 10 Dec 2020 02:36:11 -0800 (PST)
Received: from localhost ([61.120.150.75])
 by smtp.gmail.com with ESMTPSA id p15sm5808772pgl.19.2020.12.10.02.36.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Dec 2020 02:36:10 -0800 (PST)
From: John Wang <wangzhiqiang.bj@bytedance.com>
To: xuxiaohan@bytedance.com,
	yulei.sh@bytedance.com
Subject: [PATCH aspeed-5.2] aspeed: g220a-bmc: Add an FRU
Date: Thu, 10 Dec 2020 18:36:07 +0800
Message-Id: <20201210103607.556-1-wangzhiqiang.bj@bytedance.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::443;
 envelope-from=wangzhiqiang.bj@bytedance.com; helo=mail-pf1-x443.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: c9yYtcce9MIX

Add an eeprom device and fill it with fru
information

$ ipmitool fru print 0
Product Manufacturer  : Bytedance
Product Name          : G220A

Signed-off-by: John Wang <wangzhiqiang.bj@bytedance.com>
---
 hw/arm/aspeed.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index 04c8ad2bcd..fc80d45513 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -595,6 +595,18 @@ static void g220a_bmc_i2c_init(AspeedMachineState *bmc)
     object_property_set_int(OBJECT(dev), "temperature0", 31000, &error_abort);
     object_property_set_int(OBJECT(dev), "temperature1", 28000, &error_abort);
     object_property_set_int(OBJECT(dev), "temperature2", 20000, &error_abort);
+
+    static uint8_t eeprom_buf[2 * 1024] = {
+            0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0xfe,
+            0x01, 0x06, 0x00, 0xc9, 0x42, 0x79, 0x74, 0x65,
+            0x64, 0x61, 0x6e, 0x63, 0x65, 0xc5, 0x47, 0x32,
+            0x32, 0x30, 0x41, 0xc4, 0x41, 0x41, 0x42, 0x42,
+            0xc4, 0x43, 0x43, 0x44, 0x44, 0xc4, 0x45, 0x45,
+            0x46, 0x46, 0xc4, 0x48, 0x48, 0x47, 0x47, 0xc1,
+            0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xa7,
+    };
+    smbus_eeprom_init_one(aspeed_i2c_get_bus(&soc->i2c, 4), 0x57,
+                          eeprom_buf);
 }
 
 static bool aspeed_get_mmio_exec(Object *obj, Error **errp)
-- 
2.25.1

