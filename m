Received: by 2002:a19:690d:0:0:0:0:0 with SMTP id e13csp1692249lfc;
        Wed, 10 Feb 2021 14:05:58 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxcshEmAGDD/u62v0qiLIBeHU2XmPEbpeO/RLgptEi8Shn1O1sgaSxmsUexPAdIG15VH3uF
X-Received: by 2002:a25:ef0e:: with SMTP id g14mr7417415ybd.90.1612994758410;
        Wed, 10 Feb 2021 14:05:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1612994758; cv=none;
        d=google.com; s=arc-20160816;
        b=ipp/K6SpkkmuKsWIeGylQwpqbAqXGXnCQyTmCb0t7KhaoIWKWWY6fHj2wziT0IER5m
         PThwSmfZua9rzyTKIt702E/gqHeYCzQjuHCsnQnxxo49RfG79poxqXJ2UFIcG1vIaMDT
         jqE8WorDJpn5oMzBmCi+WwFSEQI6PYyfHo+qR/CxWrbgu8LvVDuqbUzHqHD3lCizKRpE
         xMTBb6Ug9rAsNo9tnyx9uBhD8fTRBjH/wjn+Twif1rq9hYem/WDjZRF3NtJQTAJsHQ/K
         xJXcKqoEApMKGiziI2VeBwSDa5nd//c2SpHzJgHeG8gJhzye2Y4+r+7q4I4yhuvORjdH
         wltA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=from:reply-to:sender:errors-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:cc:to:subject
         :references:mime-version:message-id:in-reply-to:date:dkim-signature;
        bh=dpq8MEr8Yyy5k0UaGwfFoovmuecOr53Phwau+fJ4meU=;
        b=NamrNeKpQRXbb37MN/1oj4fCvHFLsgQyRJ+t5N7spqZ4kWUIhQgUzDtVXD+vnWU8Pk
         2qgHhoy9kTXNUq+GGCp/l+HMEakdKPoLNAeaxxWY9rUKRw86pRFX2t81Rlx61nT5ZVaP
         c6645jA6a6IIUpcYqCQoq3IB4NOyR9yKkuSwDZkpd8oRk0cRjK2Q/dNtbZDmPIdTmzJX
         7GSai5MD/V2MQOTo49S0ZBXuD7ps08DKSENN4WZRO0CZnkyhg61UIQdIOV5//ZlEHz3o
         pVm6QFqkhgdVLmil6kNWChHL57XMNxztY6b8OllNxK6jibvSfxLwalwRDwKjY/WXmh1J
         a0mA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@google.com header.s=20161025 header.b=f3DWpwM3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m75si2926630ybf.460.2021.02.10.14.05.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 10 Feb 2021 14:05:58 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@google.com header.s=20161025 header.b=f3DWpwM3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1]:36586 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l9xcT-0000n5-PO
	for alex.bennee@linaro.org; Wed, 10 Feb 2021 17:05:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55122)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3elgkYAgKCMM53qjx21qpxxpun.lxvznv3-j0vwxwpw3.x0p@flex--wuhaotsh.bounces.google.com>)
 id 1l9xbj-0000lw-N1
 for qemu-arm@nongnu.org; Wed, 10 Feb 2021 17:05:11 -0500
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a]:49004)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3elgkYAgKCMM53qjx21qpxxpun.lxvznv3-j0vwxwpw3.x0p@flex--wuhaotsh.bounces.google.com>)
 id 1l9xbJ-0000kl-FN
 for qemu-arm@nongnu.org; Wed, 10 Feb 2021 17:05:07 -0500
Received: by mail-yb1-xb4a.google.com with SMTP id f3so3472534ybg.15
 for <qemu-arm@nongnu.org>; Wed, 10 Feb 2021 14:04:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:in-reply-to:message-id:mime-version:references:subject
 :from:to:cc; bh=dpq8MEr8Yyy5k0UaGwfFoovmuecOr53Phwau+fJ4meU=;
 b=f3DWpwM3e+qDv3BFHwSB+Uz1a06s9x70SsCjXwLZXBFKS9EEzeCT6wXqvK3gcctc/s
 K9kCL/t00SUNx+6pEps59fDtL1XWjAXWc9Kn1Ncai+XRUAzyMsrV7LtChYNoQqIeDbZg
 aAeMikuC7k/+qTnRm8brl5cvPWb4qoBFU6DlCMlygoW5SFn78NyMAfdBHLNJoXp+AD6q
 ocgJRhT7BXAt4RNdd5Gh1zmx5mP5WwCs9X/sziwaxJONuYl5dOMUZ4atlkvIIGq+qwrM
 j6BY0ce0gaicVKHb+IlEP/qsj8axDzunGrUOfFFHF1xPjswkeQAYNjnSxWdTkkrIZWX+
 7sYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=dpq8MEr8Yyy5k0UaGwfFoovmuecOr53Phwau+fJ4meU=;
 b=UHRnYXB1y8QIbewpm5H4JyM4TV8gH5zaNLcHTPGcGudETcCXIQI2WLYLvlYxxJ7Qsa
 hG25VPtakc+DR87Q9/dUuiK2d/Yow5sohH1UddqUmVjukWMdgkjo1cP4DzEtG738XjZA
 i7wKLbs9UNR/IlZxAigjPcaSFP+98tvR1bb3uq+M3/M5WJgw3ZkhjOel7NNT5TZfBMht
 MW97xrrexpqt+esqWFZ6ZTuaZVjn3vMrmWpcVBQhtdzkh/X+SJxmke7YXGar7b126KlZ
 qxXggvfdgsHQPUjFu4Yz5UZAG0AmOFXbFopQ7qFL3C+OaN7QgNDoSoD/DkVr55mr4xnA
 SMNQ==
X-Gm-Message-State: AOAM532l64uGz+705nRSk7jkEZntSNvYlG1swLh1RvxzgvnYUWjjwmpS
 I670Ufsuy79voNuL48c2jk0Xd4jmk0jv4Q==
X-Received: from mimik.c.googlers.com ([fda3:e722:ac3:10:7f:e700:c0a8:4e])
 (user=wuhaotsh job=sendgmr) by 2002:a25:b74d:: with SMTP id
 e13mr7373447ybm.405.1612994682358; Wed, 10 Feb 2021 14:04:42 -0800 (PST)
Date: Wed, 10 Feb 2021 14:04:23 -0800
In-Reply-To: <20210210220426.3577804-1-wuhaotsh@google.com>
Message-Id: <20210210220426.3577804-3-wuhaotsh@google.com>
Mime-Version: 1.0
References: <20210210220426.3577804-1-wuhaotsh@google.com>
X-Mailer: git-send-email 2.30.0.478.g8a0d178c01-goog
Subject: [PATCH v3 2/5] hw/arm: Add I2C sensors for NPCM750 eval board
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, Avi.Fishman@nuvoton.com, 
 kfting@nuvoton.com, wuhaotsh@google.com, hskinnemoen@google.com, 
 venture@google.com, dje@google.com, cminyard@mvista.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b4a;
 envelope-from=3elgkYAgKCMM53qjx21qpxxpun.lxvznv3-j0vwxwpw3.x0p@flex--wuhaotsh.bounces.google.com;
 helo=mail-yb1-xb4a.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Reply-to:  Hao Wu <wuhaotsh@google.com>
From:  Hao Wu via <qemu-arm@nongnu.org>
X-TUID: 9I8XwX6fe/IJ

Add I2C temperature sensors for NPCM750 eval board.

Reviewed-by: Doug Evans<dje@google.com>
Reviewed-by: Tyrong Ting<kfting@nuvoton.com>
Signed-off-by: Hao Wu <wuhaotsh@google.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

diff --git a/hw/arm/npcm7xx_boards.c b/hw/arm/npcm7xx_boards.c
index 3fdd5cab01..47a215bd01 100644
--- a/hw/arm/npcm7xx_boards.c
+++ b/hw/arm/npcm7xx_boards.c
@@ -98,6 +98,24 @@ static NPCM7xxState *npcm7xx_create_soc(MachineState *machine,
     return NPCM7XX(obj);
 }
 
+static I2CBus *npcm7xx_i2c_get_bus(NPCM7xxState *soc, uint32_t num)
+{
+    g_assert(num < ARRAY_SIZE(soc->smbus));
+    return I2C_BUS(qdev_get_child_bus(DEVICE(&soc->smbus[num]), "i2c-bus"));
+}
+
+static void npcm750_evb_i2c_init(NPCM7xxState *soc)
+{
+    /* lm75 temperature sensor on SVB, tmp105 is compatible */
+    i2c_slave_create_simple(npcm7xx_i2c_get_bus(soc, 0), "tmp105", 0x48);
+    /* lm75 temperature sensor on EB, tmp105 is compatible */
+    i2c_slave_create_simple(npcm7xx_i2c_get_bus(soc, 1), "tmp105", 0x48);
+    /* tmp100 temperature sensor on EB, tmp105 is compatible */
+    i2c_slave_create_simple(npcm7xx_i2c_get_bus(soc, 2), "tmp105", 0x48);
+    /* tmp100 temperature sensor on SVB, tmp105 is compatible */
+    i2c_slave_create_simple(npcm7xx_i2c_get_bus(soc, 6), "tmp105", 0x48);
+}
+
 static void npcm750_evb_init(MachineState *machine)
 {
     NPCM7xxState *soc;
@@ -108,6 +126,7 @@ static void npcm750_evb_init(MachineState *machine)
 
     npcm7xx_load_bootrom(machine, soc);
     npcm7xx_connect_flash(&soc->fiu[0], 0, "w25q256", drive_get(IF_MTD, 0, 0));
+    npcm750_evb_i2c_init(soc);
     npcm7xx_load_kernel(machine, soc);
 }
 
-- 
2.30.0.478.g8a0d178c01-goog

