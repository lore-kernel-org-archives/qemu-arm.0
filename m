Received: by 2002:ac2:596f:0:0:0:0:0 with SMTP id h15csp781132lfp;
        Thu, 14 Jul 2022 11:01:49 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1u2uMVdrjyNdaXK3tImTmv+1CLRXInlIpzPKDf4ARpP91B9GpWMs0KNbufkjFc6fa7UwLSF
X-Received: by 2002:a37:6896:0:b0:6b5:c556:cac4 with SMTP id d144-20020a376896000000b006b5c556cac4mr2160442qkc.13.1657821709160;
        Thu, 14 Jul 2022 11:01:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1657821709; cv=none;
        d=google.com; s=arc-20160816;
        b=r/cvfhILaD1xrXuvbvyvn4QR/VNLKdf/oJwEFWaxzXtTVOpHBDWgfJtzkAmiUxSeUm
         9IS1WXInEWJpa5uGrLAmukQG4Nzp4UBBJtRx3c7K/3zMZKeStlJUSoJCtOzNMPjPG29b
         I2Mpc69hV+aFx2E2HH5UluD0A2m6LhHRn2wOcAvxy/KUZlUgy00JS7olfAl3wSab7547
         jzvLjjpdMWEwlCIU8/ELdihIhJBFOfSbacnwtP3k/5u5q1aqC+CcC5n6vLBwzYNjjimV
         PWNgNjLiZ4MTPYtZkXluuWPGng/Dpg5iwipgxX5hWd8eLVkqoFnOWV2EWPAaM5qlbmto
         FrvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:references
         :mime-version:message-id:in-reply-to:date:dkim-signature;
        bh=TM8Kh0gGU2hIWoEk51Qm6WG9lPFo5JxHmzkWdY1yzZE=;
        b=gmFZH5ivsJs4zlqWduhXFqY8s7AIeqMCzMoTK+qpIy0xiO2d0FrkrRs5+BikHYmQr9
         lVPH38CVqe+Vx0RK+XwKQgfTVxpcNbkQjGS5UDxsbAiOR4oVLh6udXQ+2+hChnnw/cIo
         8TuXE6WOf9u+xWR5m3+RV3HhjVvmdWM38yGOWu/VGgGeSk+8uKIqsEb5D4yE3bkdLj2q
         O8EGC/hfsaqWyiBjfjyq7w6w60qHgUNcP58DN8IMMjQKhNi/m2o642kyFgXAJTjbqNIR
         15ZzYlPz9EOZPm77CzNxr+2CUGTDAlh2DPRmXENPDmlmm/XTObM333rxxE88N2587XO3
         DJEw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=DttwrmR5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m1-20020a05620a290100b006b56d4dfc3fsi1795312qkp.608.2022.07.14.11.01.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 14 Jul 2022 11:01:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=DttwrmR5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1]:58158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oC39o-0007Ld-In
	for alex.bennee@linaro.org; Thu, 14 Jul 2022 14:01:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58106)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3u1nQYggKCMwECzs6BAzy66y3w.u648w4C-s94565y5C.69y@flex--wuhaotsh.bounces.google.com>)
 id 1oC38q-0007IK-87
 for qemu-arm@nongnu.org; Thu, 14 Jul 2022 14:00:49 -0400
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049]:34644)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3u1nQYggKCMwECzs6BAzy66y3w.u648w4C-s94565y5C.69y@flex--wuhaotsh.bounces.google.com>)
 id 1oC38k-0005d2-Es
 for qemu-arm@nongnu.org; Thu, 14 Jul 2022 14:00:45 -0400
Received: by mail-pj1-x1049.google.com with SMTP id
 rm8-20020a17090b3ec800b001f07b25d636so1625100pjb.1
 for <qemu-arm@nongnu.org>; Thu, 14 Jul 2022 11:00:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=TM8Kh0gGU2hIWoEk51Qm6WG9lPFo5JxHmzkWdY1yzZE=;
 b=DttwrmR57xLkaUZhlrTbzCDprlscSFViSKthUtCeZfZJkdXsGJFEUHg7YsqyTD8lUz
 6pn7TTkYp0c75hvC0BUjVr1SWIwebRrFy7zuliUPjH1l4IZiVEqV/LR0RxrZWFGOrJeb
 0XzPK1uaJcj//BFEEcCq96/a4QwtgmjLpjINBRjKHps5pg+1GmVSIaW/bMxNUfCq+rXy
 4XZUhWAF2Tzf3r6uKKjHmRYbZA21YXjATTaJSGwNMreow5F7kUAHE1NvpHXLN1nR4pXT
 y3lCftYJtge+AGHZo5G4riu9N4WTtVI8YdB4GVhQMLzGW0bU9mUkwtfqLvajpeszieW/
 uoxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=TM8Kh0gGU2hIWoEk51Qm6WG9lPFo5JxHmzkWdY1yzZE=;
 b=zMmVaXhvE9dowao+zCM3zaUdECyvAcz/R85iUXKjOys27BBu29ZfwEgNP61yruXBHI
 R1O/hINwQ+xGeqpootyf6R8v9mSjSkqnOmfb5Rlec0by4RFB46N6YWrG0c1h8LY48Xea
 Um2u+gZgsaShyTXxYb2ePMsibVBzm0iRw2DIBFNX7rV6/zVKcLomapIx7u6Tih6A65qn
 9MLJv5fNqXspb/vPvflOWf3PkPhqUpciaPNYUGDQ7WtvDP8Nni72raEppAVqgBZ8Z30q
 Nkf0FSeb+VQmOwaQmdyanFWwHqVQKzr5t0by8fqTimFGxu8BAKDtx3iSbzE1dgmDIBwv
 mefg==
X-Gm-Message-State: AJIora9f4qhlH3JnfNPiZH2qG9QpT25oRzO1GwQOYyBDqxm1johBGjJO
 poBODat7UbPfSHbzgGNNAS8MG2wb0IYqTg==
X-Received: from mimik.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4e])
 (user=wuhaotsh job=sendgmr) by 2002:a05:6a00:8cf:b0:522:93a6:46e9 with SMTP
 id s15-20020a056a0008cf00b0052293a646e9mr9921053pfu.62.1657821627807; Thu, 14
 Jul 2022 11:00:27 -0700 (PDT)
Date: Thu, 14 Jul 2022 11:00:00 -0700
In-Reply-To: <20220714180006.77360-1-wuhaotsh@google.com>
Message-Id: <20220714180006.77360-3-wuhaotsh@google.com>
Mime-Version: 1.0
References: <20220714180006.77360-1-wuhaotsh@google.com>
X-Mailer: git-send-email 2.37.0.170.g444d1eabd0-goog
Subject: [PATCH 2/8] hw/i2c: Read FIFO during RXF_CTL change in NPCM7XX SMBus
From: Hao Wu <wuhaotsh@google.com>
To: peter.maydell@linaro.org
Cc: richard.henderson@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 wuhaotsh@google.com, venture@google.com, Avi.Fishman@nuvoton.com, 
 kfting@nuvoton.com, hskinnemoen@google.com, f4bug@amsat.org, 
 bin.meng@windriver.com, qemu-block@nongnu.org, armbru@redhat.com, 
 thuth@redhat.com, Titus Rwantare <titusr@google.com>,
 Corey Minyard <cminyard@mvista.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1049;
 envelope-from=3u1nQYggKCMwECzs6BAzy66y3w.u648w4C-s94565y5C.69y@flex--wuhaotsh.bounces.google.com;
 helo=mail-pj1-x1049.google.com
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
X-TUID: S6n5oZzIINIZ

Originally we read in from SMBus when RXF_STS is cleared. However,
the driver clears RXF_STS before setting RXF_CTL, causing the SM bus
module to read incorrect amount of bytes in FIFO mode when the number
of bytes read changed. This patch fixes this issue.

Signed-off-by: Hao Wu <wuhaotsh@google.com>
Reviewed-by: Titus Rwantare <titusr@google.com>
Acked-by: Corey Minyard <cminyard@mvista.com>
---
 hw/i2c/npcm7xx_smbus.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/i2c/npcm7xx_smbus.c b/hw/i2c/npcm7xx_smbus.c
index f18e311556..1435daea94 100644
--- a/hw/i2c/npcm7xx_smbus.c
+++ b/hw/i2c/npcm7xx_smbus.c
@@ -637,9 +637,6 @@ static void npcm7xx_smbus_write_rxf_sts(NPCM7xxSMBusState *s, uint8_t value)
 {
     if (value & NPCM7XX_SMBRXF_STS_RX_THST) {
         s->rxf_sts &= ~NPCM7XX_SMBRXF_STS_RX_THST;
-        if (s->status == NPCM7XX_SMBUS_STATUS_RECEIVING) {
-            npcm7xx_smbus_recv_fifo(s);
-        }
     }
 }
 
@@ -651,6 +648,9 @@ static void npcm7xx_smbus_write_rxf_ctl(NPCM7xxSMBusState *s, uint8_t value)
         new_ctl = KEEP_OLD_BIT(s->rxf_ctl, new_ctl, NPCM7XX_SMBRXF_CTL_LAST);
     }
     s->rxf_ctl = new_ctl;
+    if (s->status == NPCM7XX_SMBUS_STATUS_RECEIVING) {
+        npcm7xx_smbus_recv_fifo(s);
+    }
 }
 
 static uint64_t npcm7xx_smbus_read(void *opaque, hwaddr offset, unsigned size)
-- 
2.37.0.170.g444d1eabd0-goog

