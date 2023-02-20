Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp2106368ejb;
        Mon, 20 Feb 2023 01:25:28 -0800 (PST)
X-Google-Smtp-Source: AK7set/6mni0HxSSopsen0YaRiGyB4BVwwDFh8Ad2hfsJqxi2BZ7ACY+ScBhjUx7qN0FQuyRNuyG
X-Received: by 2002:a05:622a:30b:b0:3b8:41f4:94e7 with SMTP id q11-20020a05622a030b00b003b841f494e7mr1597513qtw.17.1676885128583;
        Mon, 20 Feb 2023 01:25:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676885128; cv=none;
        d=google.com; s=arc-20160816;
        b=A3NnGu7kKp5YAUrHIHVKWqRgWDf4hBitcD57oDtvHgHMDd8YHTTxoMEWxj5+OkUUZG
         l1zIDz4NAqvFqTJYHlHhqLoGdZ1PYIoa/4n9RscE671zUf55BEzhReERWrBs5HwXA4FV
         7axIXW0rkCtyrhdc0zQMbFUITRs2uXnStXrXY38KmaYGejFqKSI6d7IdCfAGBBccKi8g
         hQWtx+KB+BWSyAWoJOuV1GjqOfNdwp16l1g3w09p1smlmMNiPNJXMgGxksUnA2XLISpV
         TCehTnRjU0ZvPszPU8Rb7fTy8ll09RAengBDxtSbq6O7a02hRgEMAX7ddsAaOXO3t8xZ
         +y4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Ep/ieGMZNayE9X06ftc5taHWHa+LemsYZU+KXdgMGEE=;
        b=MfcK2Fg5NSKWKUxzVT6xPq7yrw++nJL78HSAKVzzVOSBWbbY7xxhM5mArJsMAOvMAv
         i8OW3wO2GQq+q13VDLOn53thIK0UoguzLUIDu71K6SdTWh0/d7ltmO4zVp+TDxs1kOG/
         AKfKqhFVYquWe2EgwveXSujXroU6/HaTbTq7FgeXykJpe1Y7Ug8WXmqkLFcsg6gKgWIv
         +SIay41e09r4LZW+fUEg3BRHEqHdwD1nAeEyMvdbdKPimdbvhG0rmDM5SS3k+9w+Eyxh
         jNG2Wk0MFbxh57ZN5zwh+eF6CvDNJ/IapLa2ix/57VmChGGJXKJhFHR0IH4O87BbO6+3
         ydCw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BEYq2Swc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a10-20020ac85b8a000000b003bd1bc10386si7409967qta.733.2023.02.20.01.25.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Feb 2023 01:25:28 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BEYq2Swc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pU2Fn-0005lN-0Q; Mon, 20 Feb 2023 04:14:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pU2Fm-0005kw-2H
 for qemu-arm@nongnu.org; Mon, 20 Feb 2023 04:14:34 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pU2Fk-0003kG-Hl
 for qemu-arm@nongnu.org; Mon, 20 Feb 2023 04:14:33 -0500
Received: by mail-wr1-x431.google.com with SMTP id o4so337673wrs.4
 for <qemu-arm@nongnu.org>; Mon, 20 Feb 2023 01:14:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ep/ieGMZNayE9X06ftc5taHWHa+LemsYZU+KXdgMGEE=;
 b=BEYq2SwcM7Ko/Qtg515nOgnqfSctUE4pkYwordb0fLF6n6vhWQcfA8GoLMftdYevkC
 3LSdCAvnyeXfjBUnN+RFKQutgg/jwrIyuxweJxPmiRUB0qUsRqMHcTJcfZyx/OpxXfyp
 o7sqTjqMZ2uLMbJcL0L782wvcSJtlREKpwTKBWvYQaCvU8dcPBtMp07P3NzELHT8jIA/
 a4+8pyxxxuGEUe5L8O3fnbl+L144XTEsnGLOb+xBc/uWJiPyg9EV4btsqkYJyXIkgz4Z
 +baqrve1pKbRsiPMWJbtSc4TaZCbZz9IgB8pqWCyE69HPXzsdNBAK0yqb079lh4e9Y8W
 gOqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ep/ieGMZNayE9X06ftc5taHWHa+LemsYZU+KXdgMGEE=;
 b=6Z0beEDisG7mamn9AgqYhNsnKizml8Xe2bwzBLgKv1rTW2LPSXq1SeiQWDzYq7It4z
 cuI+vfpJppBUOAsLqaA9tMbmAhvfiqJSBPLEDIdoWMZqiWSoIBsnONWMKlHPtLal7G0U
 6TqBCvqTURbppZq5pkz8BvdnB99AyoMfX8Uxk9jFMEGSf9km1Io1IQ2cowHOarJtvig+
 owI83P1VFbkFsin4xW1oxVWwQD7dwd0jr2kdgzZkCOdTRQVV7mQeSurPC+dD2dT+JLMI
 ljHEv7dRKjQvd+cuQnfy5h5Fztjo96sFuV6yLjeiEuzzSWNU2nRB3v/RvFb5v/lzUXp8
 mRzA==
X-Gm-Message-State: AO0yUKW2g28PaRkGvoQOyEroOUX/FIpLS46Fjt4v2PGFvoYZjUmd7+Yq
 7WqTKD7GbiPSB7I3ASjFFCzLvw==
X-Received: by 2002:a5d:6b83:0:b0:2c5:77de:426b with SMTP id
 n3-20020a5d6b83000000b002c577de426bmr51913wrx.60.1676884471696; 
 Mon, 20 Feb 2023 01:14:31 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 a17-20020adffad1000000b002c54e26bca5sm4973762wrs.49.2023.02.20.01.14.30
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 20 Feb 2023 01:14:31 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, John Snow <jsnow@redhat.com>, qemu-block@nongnu.org,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Bernhard Beschow <shentey@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v2 06/24] hw/ide/isa: Remove intermediate ISAIDEState::irq
 variable
Date: Mon, 20 Feb 2023 10:13:40 +0100
Message-Id: <20230220091358.17038-7-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230220091358.17038-1-philmd@linaro.org>
References: <20230220091358.17038-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: MqtjvEN95uM0

The intermediate ISAIDEState::irq variable just add noise, remove it.

Message-Id: <20230215112712.23110-6-philmd@linaro.org>
Reviewed-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/ide/isa.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/hw/ide/isa.c b/hw/ide/isa.c
index 5c3e83a0fc..ad47e0899e 100644
--- a/hw/ide/isa.c
+++ b/hw/ide/isa.c
@@ -45,7 +45,6 @@ struct ISAIDEState {
     uint32_t  iobase;
     uint32_t  iobase2;
     uint32_t  irqnum;
-    qemu_irq  irq;
 };
 
 static void isa_ide_reset(DeviceState *d)
@@ -73,8 +72,7 @@ static void isa_ide_realizefn(DeviceState *dev, Error **errp)
 
     ide_bus_init(&s->bus, sizeof(s->bus), dev, 0, 2);
     ide_init_ioport(&s->bus, isadev, s->iobase, s->iobase2);
-    s->irq = isa_get_irq(isadev, s->irqnum);
-    ide_init2(&s->bus, s->irq);
+    ide_init2(&s->bus, isa_get_irq(isadev, s->irqnum));
     vmstate_register(VMSTATE_IF(dev), 0, &vmstate_ide_isa, s);
     ide_register_restart_cb(&s->bus);
 }
-- 
2.38.1

