Received: by 2002:a05:7022:2383:b0:6d:30c6:dd9e with SMTP id bz3csp1167978dlb;
        Fri, 13 Oct 2023 01:48:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEVpvBamp4p1UF4T+J8C+xGbA3CgAv4obZiMA7cBd5baYqEXfGg+dGhyg3RPAwoGjtXyNjV
X-Received: by 2002:a0c:f591:0:b0:66d:589:5841 with SMTP id k17-20020a0cf591000000b0066d05895841mr9757532qvm.28.1697186894837;
        Fri, 13 Oct 2023 01:48:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697186894; cv=none;
        d=google.com; s=arc-20160816;
        b=ewJChVN0bs59jWi08QclwDMCwR4wOTUMvEQu5g45Anv+yVss3bO9AK1FsX6PCaw5bW
         Xc+5R1/POmP3Kpb3JXkSCsIkTVOn7Fch/uUtYNXxmgIqmaVZ3Ymr04VMFZH1XVC/v2Fe
         QtDa3aUzeABZsE/Le/OS5WTNeGld0wq7/CWxczEP2R5S/G5m57Oewkd4HSvkW0m61jUX
         k4nwmZsgc2cU5oZNtJFjigS0EiYzOZ4GqjiMeDOQ2I3lY8AedhrPr20JfMYAytbE3EVe
         8ShW6UvBdIqB3q4mGhGyah4s3O1Wqsszxn4SEr1uih2Hv3DYYv1BvlqlKLZ7WsESxAu4
         G+1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=ULFeTIXj6bX1JE5sE4td36JwncG3JzFJuXREJ6wp7rc=;
        fh=cm3MXC61sDnZfM5D5OI9f9zHbrZe3OPoGk9cXPsjVOU=;
        b=JCtMMLXzvYorSLbf3SFShhdtN3coFJo2CbUP3dGmK2/lkKOIxOuweDGWboSyXoX0PX
         ilTJb3ixi+cUjNGw0wVG99ccGKSs4vpPWuoahcJiSYiS/mNkR653vXjXSkmzHECrrEFu
         VsErTzumJXJ+Uwc2923DK52YlgJ6UgD58sKMOOpZ4YOroRlGxi0DWxx2rQGYjJg1HlNU
         yJbqsY6xsjDHHZPiE/yeP9ebae4irA6lkQ2VQf/BQLVkdRnu0B4jIrdqGNWiWfanNMW2
         +iuLu+Lm3BcAvdkyX0ZflEwfXTdlItdc+0wXnE+UfoA1KEBv6k68EtrnNVGzwMirwJyh
         tgSw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mIOYQLyA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id op31-20020a056214459f00b0066cf4c72db7si843156qvb.493.2023.10.13.01.48.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 13 Oct 2023 01:48:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mIOYQLyA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qrDpn-0007cn-VG; Fri, 13 Oct 2023 04:47:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1qrDpc-0007RZ-5L
 for qemu-arm@nongnu.org; Fri, 13 Oct 2023 04:47:40 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1qrDpa-0000om-GY
 for qemu-arm@nongnu.org; Fri, 13 Oct 2023 04:47:39 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-406618d0991so19137815e9.2
 for <qemu-arm@nongnu.org>; Fri, 13 Oct 2023 01:47:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697186857; x=1697791657; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ULFeTIXj6bX1JE5sE4td36JwncG3JzFJuXREJ6wp7rc=;
 b=mIOYQLyAyjaagTsWweBwVnjlONwTEOlAoYV/ejQGrcdTR22vYx7XGm96wrHnqdzAfA
 sDB2PUBjBdaO9Lp08481dwGbWpvEYcpJcCQYiXf1WtlakUYupyJy0D+5uTRSlOmXwmJr
 UZRj2hPbiLQv0oCiyN79YNfqc/ED5fqR65wz+2HDsG5rwQcVC7DRx36CZ5cR1Bty8qw1
 vtUn8UW5INPPwyfY7Tng76Wzfe7t6F0uRi04/oTcfujxgMYrq7amxsCG6/C6FLgULQCp
 Nr6NbLfGbu1NaDGDTk79N7JZEooKkkWC43WLNMoaUnTA006hdo/RTx+iCMavSwryw/8F
 Z7iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697186857; x=1697791657;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ULFeTIXj6bX1JE5sE4td36JwncG3JzFJuXREJ6wp7rc=;
 b=FdDDMx5pSUWXJKVRUtwyRZ1m1Fi/HOOB0JcmYgBnIC6auQC5ZVI6hPJUC2s28sN/Dp
 sXtbNJ+11rdwoaQdrEvDXBZqIoM3AdJqmw4eiRF3P47yDOgvx+Ea9CouV8wRMQPjhNTe
 +ecS9S5/fqSD5v4+Qk8Vz+QCg15V5tMmQgZxoqaj2jr25gr5/sjMHrnlJ3yna3JtT7HT
 7h1I8egJ4gMBLjcvO8exxbJS3eURPrcUAJ9ZeKt/RYxwoP0ahf3M04dR4sOEH7Y1Ed89
 OTHaxmkrxBXZ4l4lpYBfOCHHmU4ZFK6b0Vv0Nk13O7c6Qhlew86vsWi7AJTRoB7xOZ8r
 C2BQ==
X-Gm-Message-State: AOJu0Yy1hyvgLqj9EdHxKqS0viFbn44MX9k2syQp79DtKTQd9MqM1mOr
 aD8vwF3Bwcw/9dHhdpAlsXAdtg==
X-Received: by 2002:a05:600c:ad0:b0:405:375d:b860 with SMTP id
 c16-20020a05600c0ad000b00405375db860mr24379109wmr.21.1697186857149; 
 Fri, 13 Oct 2023 01:47:37 -0700 (PDT)
Received: from localhost.localdomain (adsl-170.109.242.226.tellas.gr.
 [109.242.226.170]) by smtp.gmail.com with ESMTPSA id
 v10-20020a5d678a000000b0032d9f32b96csm569185wru.62.2023.10.13.01.47.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Oct 2023 01:47:36 -0700 (PDT)
From: Emmanouil Pitsidianakis <manos.pitsidianakis@linaro.org>
To: qemu-devel@nongnu.org
Cc: Emmanouil Pitsidianakis <manos.pitsidianakis@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 Joel Stanley <joel@jms.id.au>, Alistair Francis <alistair@alistair23.me>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 qemu-arm@nongnu.org (open list:ASPEED BMCs)
Subject: [RFC PATCH v3 13/78] hw/adc: add fallthrough pseudo-keyword
Date: Fri, 13 Oct 2023 11:45:41 +0300
Message-Id: <9d4eebb3c55f9a6cf7b3df5e09b6b692a028e024.1697186560.git.manos.pitsidianakis@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1697186560.git.manos.pitsidianakis@linaro.org>
References: <cover.1697186560.git.manos.pitsidianakis@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=manos.pitsidianakis@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: MBQgFNQ/PBQZ

In preparation of raising -Wimplicit-fallthrough to 5, replace all
fall-through comments with the fallthrough attribute pseudo-keyword.

(Cédric Le Goater review is for aspeed_adc.c)

Reviewed-by: Cédric Le Goater <clg@kaod.org>
Signed-off-by: Emmanouil Pitsidianakis <manos.pitsidianakis@linaro.org>
---
 hw/adc/aspeed_adc.c | 12 ++++++------
 hw/adc/zynq-xadc.c  |  2 +-
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/hw/adc/aspeed_adc.c b/hw/adc/aspeed_adc.c
index 0d29663129..f9f5f7bb17 100644
--- a/hw/adc/aspeed_adc.c
+++ b/hw/adc/aspeed_adc.c
@@ -119,7 +119,7 @@ static uint64_t aspeed_adc_engine_read(void *opaque, hwaddr addr,
                           __func__, s->engine_id, reg - BOUNDS_CHANNEL_0);
             break;
         }
-        /* fallthrough */
+        fallthrough;
     case HYSTERESIS_CHANNEL_8 ... HYSTERESIS_CHANNEL_15:
         if (s->nr_channels <= 8) {
             qemu_log_mask(LOG_GUEST_ERROR, "%s: engine[%u]: "
@@ -127,7 +127,7 @@ static uint64_t aspeed_adc_engine_read(void *opaque, hwaddr addr,
                           __func__, s->engine_id, reg - HYSTERESIS_CHANNEL_0);
             break;
         }
-        /* fallthrough */
+        fallthrough;
     case BOUNDS_CHANNEL_0 ... BOUNDS_CHANNEL_7:
     case HYSTERESIS_CHANNEL_0 ... HYSTERESIS_CHANNEL_7:
     case ENGINE_CONTROL:
@@ -145,7 +145,7 @@ static uint64_t aspeed_adc_engine_read(void *opaque, hwaddr addr,
                           __func__, s->engine_id, reg - DATA_CHANNEL_1_AND_0);
             break;
         }
-        /* fallthrough */
+        fallthrough;
     case DATA_CHANNEL_1_AND_0 ... DATA_CHANNEL_7_AND_6:
         value = read_channel_sample(s, reg);
         /* Allow 16-bit reads of the data registers */
@@ -194,7 +194,7 @@ static void aspeed_adc_engine_write(void *opaque, hwaddr addr, uint64_t value,
                           __func__, s->engine_id, reg - DATA_CHANNEL_1_AND_0);
             return;
         }
-        /* fallthrough */
+        fallthrough;
     case BOUNDS_CHANNEL_8 ... BOUNDS_CHANNEL_15:
         if (s->nr_channels <= 8) {
             qemu_log_mask(LOG_GUEST_ERROR, "%s: engine[%u]: "
@@ -202,7 +202,7 @@ static void aspeed_adc_engine_write(void *opaque, hwaddr addr, uint64_t value,
                           __func__, s->engine_id, reg - BOUNDS_CHANNEL_0);
             return;
         }
-        /* fallthrough */
+        fallthrough;
     case DATA_CHANNEL_1_AND_0 ... DATA_CHANNEL_7_AND_6:
     case BOUNDS_CHANNEL_0 ... BOUNDS_CHANNEL_7:
         value &= ASPEED_ADC_LH_MASK;
@@ -214,7 +214,7 @@ static void aspeed_adc_engine_write(void *opaque, hwaddr addr, uint64_t value,
                           __func__, s->engine_id, reg - HYSTERESIS_CHANNEL_0);
             return;
         }
-        /* fallthrough */
+        fallthrough;
     case HYSTERESIS_CHANNEL_0 ... HYSTERESIS_CHANNEL_7:
         value &= (ASPEED_ADC_HYST_EN | ASPEED_ADC_LH_MASK);
         break;
diff --git a/hw/adc/zynq-xadc.c b/hw/adc/zynq-xadc.c
index 032e19cbd0..a74de3a4fd 100644
--- a/hw/adc/zynq-xadc.c
+++ b/hw/adc/zynq-xadc.c
@@ -235,7 +235,7 @@ static void zynq_xadc_write(void *opaque, hwaddr offset, uint64_t val,
             break;
         case CMD_WRITE:
             s->xadc_regs[xadc_reg] = xadc_data;
-            /* fallthrough */
+            fallthrough;
         case CMD_NOP:
             xadc_push_dfifo(s, 0);
             break;
-- 
2.39.2

