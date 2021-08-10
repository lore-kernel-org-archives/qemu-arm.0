Received: by 2002:a19:c144:0:0:0:0:0 with SMTP id r65csp945421lff;
        Mon, 9 Aug 2021 20:58:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwU9mcSj4uYRF+BVBHhlkCc5HYm2Fa8iewdyy37LT8KrGGnHbQefxp+5W1b/5tQiqdkBOZl
X-Received: by 2002:ac8:6b05:: with SMTP id w5mr8780534qts.340.1628567886288;
        Mon, 09 Aug 2021 20:58:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1628567886; cv=none;
        d=google.com; s=arc-20160816;
        b=yHdQBBcCVf6UHXSPi0ieGbzm6HsqKjLlroubi/EPfoJ4cTSX4wmNQLAmOkNj6+LWD3
         i8t/zQs8eTbjwXBx+aBpZv4n6lMvKzF1u9CrEXbWoGoe78EU+sNS7NR+Awlj5KzKJFHu
         30qV5cyt8HSy9bvpxg8prU08roiYBj5sQzChJAskSocap5aB/zfSVfmBEWQoPItq8MQL
         Vs8bj4xwKI3ijuZ79wbxr1JeNSd+KeTwuV4hlEdLjPZ743p3ztnulCO8ab/YmDwJ0cQi
         ON5+yLLp5MJrMAVyDAqcmVXsBhAiRiQ+BAqmxgTYXxvLx6jXnUWdBibtvIIMMoggexUL
         9asQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=rS/7i3KindezxRe9g1hVBP/26sJAIOp7n+LWpi6n8B4=;
        b=V7Vh8PMp27+XeLR6o3piRastkcze2X3lKIR20F0jxtKOYPl07g0mGabHLER5FlWvId
         KhWj1eo/iBC3XiGwCT4hNasOlK43tIUnUUWY/MeyzYLbxUyrgriasLEm0UlCGstUzjgc
         CXPc8JaJ6lCUpBDaFwmPwxVVB796LDxTasD7/3/Vzxco/SmLO/zMUwLqHhzbMxSbPSJN
         zrz+upa8dAVFcC2KDSntsbdhW3Q6eZmrq16Pajcjf1BUftniVJXTQ1dstWBUks4Ruioo
         UCkbwpY22ecBk7Y8j3aT3PISKionYHbZEoYEdNwtJrQ6umQKTUj7Qf7yEBPTtmH7t+f/
         c9og==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=BPCumjma;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w2si211273qkp.327.2021.08.09.20.58.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 09 Aug 2021 20:58:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=BPCumjma;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:58294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mDItx-0001A8-Lj
	for alex.bennee@linaro.org; Mon, 09 Aug 2021 23:58:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>)
 id 1mDIti-00019n-K3; Mon, 09 Aug 2021 23:57:50 -0400
Received: from mail-ot1-x32d.google.com ([2607:f8b0:4864:20::32d]:37790)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>)
 id 1mDItg-00017P-VX; Mon, 09 Aug 2021 23:57:50 -0400
Received: by mail-ot1-x32d.google.com with SMTP id
 v24-20020a0568300918b02904f3d10c9742so17235999ott.4; 
 Mon, 09 Aug 2021 20:57:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rS/7i3KindezxRe9g1hVBP/26sJAIOp7n+LWpi6n8B4=;
 b=BPCumjmaoOhr9sja5BosRM1nxe4sv6SvzBbxU/x/I5DjPJ7XQKrE8VAphBeF7pkt2s
 PLgRg7/52XslT8tleP67qMKv+cyPrQGQvcKgdTHpcu8biyVFhgrHTm2I7IZbA89lr1Mq
 pumlHk4hNvu3OkJvIzxIh3P+TcGhzrq0NO/PnjMvAZYZF8ZBbPaflGVS8QkvpjpfEVHT
 Gw2Tp4w9u0XaPbTnMKlqLsI6ebqNKa4ocKb0WKQpQPBK6F+PQSmP5Mk8NYPrHkXxiys3
 8gNEOvHGC1JjmdoHcinaAQRiEGUSDebTG816VzqJrLR5wh+gU2KN2paJARwQsNci5fhC
 GXiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=rS/7i3KindezxRe9g1hVBP/26sJAIOp7n+LWpi6n8B4=;
 b=n+ysiHKMXtcLRzf05RfMt6hgfySf0KLU0rUo5suXxzrVZsa3J7ZGelH13QPFcWuamJ
 0hsGk8cE8J7RvrrfBzhdotB5v3aCXNAXvedG9sSGlIn89nGX6kwT8Q9/fU1pze8+e26q
 URsqVQm4jgscZFO1k/MSJSAGw91EboiEKhWYN39kC+byfdxPIvfn7FJW2EK4MbT4kG9o
 RYR10JjaeQCv6YetY94njMjcA+OOk5xKgkdBD8oXMdDZDnXa9CO62xOTZi5t81cltMcj
 komcFF/EwHamsir2KScuVpkisdj2lGqzbqH3nCO44SbfOitdAlC42Q/tjhw+Gldt102X
 GA5A==
X-Gm-Message-State: AOAM530XWxiZvjPXSoUMFkaC0B60U6iMqGGwP4sD54wwH5EMmFXTjnqU
 12SKjFUCQ77MMAImNXOoyEk=
X-Received: by 2002:a05:6830:1511:: with SMTP id
 k17mr1504368otp.19.1628567866922; 
 Mon, 09 Aug 2021 20:57:46 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 t24sm1043135oou.48.2021.08.09.20.57.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Aug 2021 20:57:46 -0700 (PDT)
From: Guenter Roeck <linux@roeck-us.net>
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH] hw: arm: aspeed: Enable mac0/1 instead of mac1/2 for g220a
Date: Mon,  9 Aug 2021 20:57:42 -0700
Message-Id: <20210810035742.550391-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32d;
 envelope-from=groeck7@gmail.com; helo=mail-ot1-x32d.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_ENVFROM_END_DIGIT=0.25,
 FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.248, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, Joel Stanley <joel@jms.id.au>,
 Guenter Roeck <linux@roeck-us.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: CweTLSpFUdyE

According to its dts file in the Linux kernel, we need mac0 and mac1 enabled
instead of mac1 and mac2. Also, g220a is based on aspeed-g5 (ast2500) which
doesn't even have the third interface.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 hw/arm/aspeed.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index ecf0c9cfac..20e3a77160 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -997,7 +997,7 @@ static void aspeed_machine_g220a_class_init(ObjectClass *oc, void *data)
     amc->fmc_model = "n25q512a";
     amc->spi_model = "mx25l25635e";
     amc->num_cs    = 2;
-    amc->macs_mask  = ASPEED_MAC1_ON | ASPEED_MAC2_ON;
+    amc->macs_mask  = ASPEED_MAC0_ON | ASPEED_MAC1_ON;
     amc->i2c_init  = g220a_bmc_i2c_init;
     mc->default_ram_size = 1024 * MiB;
     mc->default_cpus = mc->min_cpus = mc->max_cpus =
-- 
2.25.1

