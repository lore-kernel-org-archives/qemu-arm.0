Received: by 2002:ac2:5f6a:0:0:0:0:0 with SMTP id c10csp634819lfc;
        Thu, 21 Oct 2021 11:41:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyRkfJppoXzY/pJdejFCGWnP1MgSeSDQwsvPSc7SnW1HoDGpNN/EOWfyHy/a4z/J37Y35kl
X-Received: by 2002:a9d:1b4d:: with SMTP id l71mr6026548otl.188.1634841711641;
        Thu, 21 Oct 2021 11:41:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1634841711; cv=none;
        d=google.com; s=arc-20160816;
        b=cOnovgKwNllvNgYM9Ip3OAjuxSQIrMRpd1LGStliJWorw9GfIS/iOAKP5O6tiUJrR0
         V1boiQ8bk9wJqL6wQlCfbKKiarDcB/YjD0gi98jE9YwD92zdEQRUdIhwKp4JefQgvG6J
         Yi+PSQMfzBSoK43sSMFbZnyLC+nQYlck3rTlRIKtOt9CfdRIeF+MVpckjtsolw1hwopM
         prIDyb5feDPrgKUdu/ni3zwML2AmC0H0N81D82tI8DOgwziX4vkDhafnYpZDr8aCTwcv
         FYKAi5490NKVyXOHQEwgLOYTLJKKq+4D5qf60RQw84oHL1AvFhocDIMEQsYumndJAhcW
         cJbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:references
         :mime-version:message-id:in-reply-to:date:dkim-signature;
        bh=8ZPzHXI27eSMyCY5kmkkFOCCpj1SqSSz1aHWQ3TU5qM=;
        b=qdSi5RG+qvbYR1sn1NcbW8FdTl48cuJyeXWklPbe7jp+LBiuZo6bZ57DFtiO8DsIb5
         bZtMUx66oaLUB8toxmOq5T0veeWG5Kty0CXy4iNPLKnlFsBAZ1r4coWPG161DJo14cjV
         8WoJ1xOm8Sdr4x/4RZ5ZlZrD5sEV1w+QEQdBQpcz9rLgdKoxKNqaRgbVGCi34FUlMD4/
         nq+fipWPk4hlWI0ikbcxIGDPdKR9uarer/V9HfIqhBwVe3a/lpVLfhbCMRSMt3Hq+NqF
         xq49PcvSrPE5zG/xcTHItKA+c1O9y3CUqGmn6M8cRnXh6HLsB9sXKEcLbJY+UpSpJUto
         HJiw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=PIN3Y4Is;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w5si7160069otu.77.2021.10.21.11.41.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 21 Oct 2021 11:41:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=PIN3Y4Is;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1]:52512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mdd0g-0006HU-Qm
	for alex.bennee@linaro.org; Thu, 21 Oct 2021 14:41:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3GrRxYQgKCFsPNA3HMLA9HH9E7.5HFJ7FN-3KFGHG9GN.HK9@flex--wuhaotsh.bounces.google.com>)
 id 1mdczY-0005Il-GE
 for qemu-arm@nongnu.org; Thu, 21 Oct 2021 14:40:40 -0400
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a]:41517)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3GrRxYQgKCFsPNA3HMLA9HH9E7.5HFJ7FN-3KFGHG9GN.HK9@flex--wuhaotsh.bounces.google.com>)
 id 1mdczO-0003WB-Rf
 for qemu-arm@nongnu.org; Thu, 21 Oct 2021 14:40:39 -0400
Received: by mail-pj1-x104a.google.com with SMTP id
 mm1-20020a17090b358100b001a0a81b8664so351112pjb.6
 for <qemu-arm@nongnu.org>; Thu, 21 Oct 2021 11:40:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=8ZPzHXI27eSMyCY5kmkkFOCCpj1SqSSz1aHWQ3TU5qM=;
 b=PIN3Y4IsuqLDwPhrKGcKcNJzlByde4/JFzASID1lJEp8qA/PW/OAHP+2cKc2rXWrLm
 SSKcBO5uD6ZVoy9MQFw566zkozvA8dH+NSpIHSiBZkWrya6ey/BHjnWni+oGx5dvkKJY
 46/d4+hlzqdkCCkrPRIU4WVmB4Ff1SkGjXyMWVVJXszsZL4Noe8YUJLA7uW/CnGszXz9
 8jX78SS36Qq7tT4XE0iMYMjplHKvvHzsIS4kWXtrnEVI+bjLmlAszYbrZGDg4OQ5rPxa
 NvLtRPJf/Gy1rnx8Rd8HrnRj7e4PEnjmj9bX36lyV7xdrWDFfoUq2PGw1xcKIPTgtfFO
 zgYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=8ZPzHXI27eSMyCY5kmkkFOCCpj1SqSSz1aHWQ3TU5qM=;
 b=sWNIw0kcKc+XEFFarFzD6AtVpU5VNQJuEAYM3LhWeBragsdzKG56Rk8iMxIizAZ58b
 bKA/H50fbbiUjXcwqZ3nCnqwGoy5AuWkKoXd7meGgpwKDjfOPEJYCX7IA7TwyuYV7PaQ
 46iG02Wr+KbHuB85brOfUzKaztUjJf+w/812bl2QqKh3TERQlMbFHVqARC3sa9pkwGZe
 s5XW9SX0lcdO5Pu00ldejrX0JqkcXV4aXf+S9VJvSMUUxjWWFuqb6Zgv58/+rHcrIO0f
 NZTCStvUMWFtldcINAZeVtA/ajfi5igE3q8jAnM+M3VV+Kyj85PsazQKfIUaq/laL5G5
 8WOg==
X-Gm-Message-State: AOAM533UWiYO2lY9OmDf8Y8HdFMPMW0P4Svzn0Ym06kZjz8YOPM3Qinz
 cTvHq/R4rIBDGn7tEqrDA6i6w2JKwzjOlg==
X-Received: from mimik.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4e])
 (user=wuhaotsh job=sendgmr) by 2002:a17:902:7ec2:b0:13d:b563:c39 with SMTP id
 p2-20020a1709027ec200b0013db5630c39mr6810418plb.14.1634841626383; Thu, 21 Oct
 2021 11:40:26 -0700 (PDT)
Date: Thu, 21 Oct 2021 11:39:54 -0700
In-Reply-To: <20211021183956.920822-1-wuhaotsh@google.com>
Message-Id: <20211021183956.920822-6-wuhaotsh@google.com>
Mime-Version: 1.0
References: <20211021183956.920822-1-wuhaotsh@google.com>
X-Mailer: git-send-email 2.33.0.1079.g6e70778dc9-goog
Subject: [PATCH v2 5/7] hw/nvram: Update at24c EEPROM init function in NPCM7xx
 boards
From: Hao Wu <wuhaotsh@google.com>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, wuhaotsh@google.com, 
 venture@google.com, Avi.Fishman@nuvoton.com, kfting@nuvoton.com, 
 hskinnemoen@google.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::104a;
 envelope-from=3GrRxYQgKCFsPNA3HMLA9HH9E7.5HFJ7FN-3KFGHG9GN.HK9@flex--wuhaotsh.bounces.google.com;
 helo=mail-pj1-x104a.google.com
X-Spam_score_int: -76
X-Spam_score: -7.7
X-Spam_bar: -------
X-Spam_report: (-7.7 / 5.0 requ) DKIMWL_WL_MED=-0.001, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: lKRLRIX1DM35

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
 hw/arm/npcm7xx_boards.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/hw/arm/npcm7xx_boards.c b/hw/arm/npcm7xx_boards.c
index a656169f61..cdb52b9922 100644
--- a/hw/arm/npcm7xx_boards.c
+++ b/hw/arm/npcm7xx_boards.c
@@ -107,13 +107,18 @@ static I2CBus *npcm7xx_i2c_get_bus(NPCM7xxState *soc, uint32_t num)
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
+    BlockInterfaceType type = IF_NONE;
+    DriveInfo *dinfo;
 
+    dinfo = drive_get(type, bus, unit_number);
+    if (dinfo) {
+        qdev_prop_set_drive(dev, "drive", blk_by_legacy_dinfo(dinfo));
+    }
     qdev_prop_set_uint32(dev, "rom-size", rsize);
     i2c_slave_realize_and_unref(i2c_dev, i2c_bus, &error_abort);
 }
@@ -220,8 +225,8 @@ static void quanta_gsj_i2c_init(NPCM7xxState *soc)
     i2c_slave_create_simple(npcm7xx_i2c_get_bus(soc, 3), "tmp105", 0x5c);
     i2c_slave_create_simple(npcm7xx_i2c_get_bus(soc, 4), "tmp105", 0x5c);
 
-    at24c_eeprom_init(soc, 9, 0x55, 8192);
-    at24c_eeprom_init(soc, 10, 0x55, 8192);
+    at24c_eeprom_init(npcm7xx_i2c_get_bus(soc, 9), 9, 0x55, 8192, 0);
+    at24c_eeprom_init(npcm7xx_i2c_get_bus(soc, 10), 10, 0x55, 8192, 1);
 
     /*
      * i2c-11:
-- 
2.33.0.1079.g6e70778dc9-goog

