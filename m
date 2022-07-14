Received: by 2002:ac2:596f:0:0:0:0:0 with SMTP id h15csp791488lfp;
        Thu, 14 Jul 2022 11:28:45 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uYwfZKgU9xSgh3w+NPO5wGINEULztehBMp2zAIjSegSNBERQZ56gbxr8FhggAh85NdvaPm
X-Received: by 2002:a05:622a:40b:b0:31e:b4cb:1ffb with SMTP id n11-20020a05622a040b00b0031eb4cb1ffbmr9587602qtx.467.1657823324806;
        Thu, 14 Jul 2022 11:28:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1657823324; cv=none;
        d=google.com; s=arc-20160816;
        b=MM7fUckLv7oSw6tWYnbzcoMWJ4qCh4rp/z8TSPfaU6iXOW2VpFcosxmKJ0dnp9CsQg
         XH/Cx5d1P8uPYfHLdCg76IhYfyD1///4rpazkkIYjC4hQn45ngYbZz08a6seTQgbvmpI
         2tuZux8P3/sf+HRS6Lga5UeXdGd6rqk1MoYXtQm/jBhYzUdch9Edayp+sUmqbxeVDNFE
         HrCJCLJ4uqmicc27AMW3Se0p2sHLwSDsOVwl/JszCU9XJEm8mkFRvQvbpRQWPZlZ8/r4
         HmbRF/+iyFxpyOhUerMg10ljgEYG4pWIc80cAbOa1ga74amF53WSupKLfWyrUwQ83rCN
         Olsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:references
         :mime-version:message-id:in-reply-to:date:dkim-signature;
        bh=TM8Kh0gGU2hIWoEk51Qm6WG9lPFo5JxHmzkWdY1yzZE=;
        b=zhoSx4CWnH5QyRG95kfPokpmEpTNT3ILAO/vozq68iLQECx3YPNLTAE008JtYEhT10
         Roy2uI99wjby6tjTFrjtdPR4vZYi8z0jxurxZRriuTL1Y+A6U8xiXSEu+nVNl3QYHlAv
         UMF5jkw6veEZo4NYr4jAYayiGX1qyiFfT9Qe+cr0iBjKBwH4c6xjM8nvxw6U0DJPV0Bd
         vNiqtXaUzouke0JyvH8dU3oqleBDZ384ZfQKRUtyrT3hFkiftDnHgzGSBHDKZEI1iBXg
         M+GhLgFPM5io6jDf449hzrz0YbXVpaYPra3G+eTrzBXr7ds8mFKfr7FynRozlzL1XuHj
         X79A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=p0cH6IXx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q10-20020a05621419ea00b0047304ddb918si1509907qvc.397.2022.07.14.11.28.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 14 Jul 2022 11:28:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=p0cH6IXx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1]:44490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oC3Zs-0004q9-9j
	for alex.bennee@linaro.org; Thu, 14 Jul 2022 14:28:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3MmDQYggKCFEFD0t7CB0z77z4x.v759x5D-tA5676z6D.7Az@flex--wuhaotsh.bounces.google.com>)
 id 1oC3ZF-0004Lu-K8
 for qemu-arm@nongnu.org; Thu, 14 Jul 2022 14:28:05 -0400
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a]:54841)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3MmDQYggKCFEFD0t7CB0z77z4x.v759x5D-tA5676z6D.7Az@flex--wuhaotsh.bounces.google.com>)
 id 1oC3ZE-0007T6-0m
 for qemu-arm@nongnu.org; Thu, 14 Jul 2022 14:28:05 -0400
Received: by mail-pl1-x64a.google.com with SMTP id
 b10-20020a170902d50a00b0016c56d1f90fso589417plg.21
 for <qemu-arm@nongnu.org>; Thu, 14 Jul 2022 11:28:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=TM8Kh0gGU2hIWoEk51Qm6WG9lPFo5JxHmzkWdY1yzZE=;
 b=p0cH6IXxkzUspP/eJTqe5KW03kk2E7qB9PtS3r7Q3gCJPA0R4DBuHl7UhHgEvRWf2o
 iGppc1bcFzVQMvXmaxAG2fIgtjpfmtaAiiIX/uNZDeAa5Jq74DmFHxs54fTGnNyPBZa+
 vKMUtD5VcSIBpbfTmjt1A0oJkP62y6OKVPtfhUNZyCqx0IvmblQPg/xMuTjI4yb/zf1b
 IG45GNNOcPJTZjJ7vHY1OFNkZ/CNwLWeoH7w5nZFxnqDlpI9e5VEFxo5uzMQ/7mD93gE
 Z9gTlZtueZQb6uW07jV1aArwpUBdrk3j4yrMppLqhJm64Wyy8qQu8QI+1vgFJdrb1ge/
 tnWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=TM8Kh0gGU2hIWoEk51Qm6WG9lPFo5JxHmzkWdY1yzZE=;
 b=I57plY00L6x6oLmvFqZN2TWYqdbGsFX0Tr/43noNrbAFUyjCBHR20iYdDey8aaiU57
 xyNwrTur5hkV3OLmDkA4z1CBV87qV2RJTMu1/NivEmbR0sD92y0aPk81hgtBX3WPke32
 0CwTJ5hw++6C2O4936eLynfq+g+TXopiYY1rWGRYBcv1dAb5LgyHYvZPjk2WEdjTKLZ6
 ojn92uUSOFvRq+PwGYB3Yr+zCZUlC9nYt49CM005MKRiBuH/icnZ85I3ZkC3MHWXgGI3
 owpD1QqAyzAq5JU4Ssord66Zpj/lFN35GuxeFG3n/QokPDZJdhoP7VuyQwnAzyeDdfox
 zhXw==
X-Gm-Message-State: AJIora/XrL0Fh05km43wIWXk3Ahg+ljW1Dr2sjBHPp/2qPiuSQOLyGpV
 wP9+GSEhflDIjNWYY1LVdzHb/1o5Ij9X9A==
X-Received: from mimik.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4e])
 (user=wuhaotsh job=sendgmr) by 2002:a05:6a00:c91:b0:52a:cad7:d755 with SMTP
 id a17-20020a056a000c9100b0052acad7d755mr9830300pfv.66.1657823282162; Thu, 14
 Jul 2022 11:28:02 -0700 (PDT)
Date: Thu, 14 Jul 2022 11:27:41 -0700
In-Reply-To: <20220714182756.85664-1-wuhaotsh@google.com>
Message-Id: <20220714182756.85664-3-wuhaotsh@google.com>
Mime-Version: 1.0
References: <20220714182756.85664-1-wuhaotsh@google.com>
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
Received-SPF: pass client-ip=2607:f8b0:4864:20::64a;
 envelope-from=3MmDQYggKCFEFD0t7CB0z77z4x.v759x5D-tA5676z6D.7Az@flex--wuhaotsh.bounces.google.com;
 helo=mail-pl1-x64a.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
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
X-TUID: YbDZmkpw7E23

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

