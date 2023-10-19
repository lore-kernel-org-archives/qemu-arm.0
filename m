Received: by 2002:a17:906:cf90:b0:9bd:85f7:2662 with SMTP id um16csp325637ejb;
        Thu, 19 Oct 2023 00:18:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEJW2XNBQZhuUy0QV5ijSl05VqI9KyTMVFSYRqsnkfesZZDCay+87AbcWeVwl8Md+KsFjV9
X-Received: by 2002:a05:622a:64f:b0:417:b901:91a7 with SMTP id a15-20020a05622a064f00b00417b90191a7mr1619610qtb.24.1697699916583;
        Thu, 19 Oct 2023 00:18:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697699916; cv=none;
        d=google.com; s=arc-20160816;
        b=T2cRi3/lAL7EAo3VVvSb3vj94oHHBezerRzNxgXbePP/b6W9cC7fsoKkltCEseX7s/
         lAWEFCiKZ5FmJLrxvI0ZosRxhUtaBDpUlCP99TsRkc7X8kNRwLD7RmpK0gl26DBICRi4
         mZ9IqvFX19/k7aU9XfRIzqvl2YYzZOWKJuDXPB/YuKk3Y6RoBuOHSxqno6CtrlO+gR9d
         YqWldhTid5kIAKCpH0yNSDpHxx4axgwBAMz34iuoqM6zoIWn4HHwGxuW/VWbiAehP1Hi
         /2nhrfAIGzbE4iYKWKNFeMWOdoBHeetTKdF9ut8FX+AFCg8QTXTsKfYHWu5+hPDftqE1
         uXfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=OG/eTeWn+OzUtyx8iBSPb0Amcuu5LlJ9K/x3TvIXfKM=;
        fh=6jYKO1R8PvzdW4tN+W/XYlQifBf+lht0eG+bQc5OUAg=;
        b=1COUMBq/UF7GWfpgvfb6p5SrlzB5u6kFVcZ1uFAWBdRtTj1j7Q+lgw7lfhKSojhpQU
         JEQ99dRaXUCn38jCtQ2rMq1+q7kihP5QhZPHXFQE2iio54TbX2fQKToFRqvFvg+luJJu
         rAing3Knw+JaNVavfMSpyZYd1m5B7o7VnSy1KBygnShe6BaODU2X4oYKQDDSOZcavPsV
         o6E4WjH26OPIo6AWgCTT8uD7h/ySwxBdKX4rBnjDYDFRG32I9dadUeSQcV7AhWe6Mh7v
         xCw7hovT6CnQh+ax/RpW7NReIGH2g3CVhsWP3Br79/YQRtEvekUUSV1eaU/4mI9Rj/lq
         K1lw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LMTy28il;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s19-20020a05622a1a9300b004195f8e5ed0si1107649qtc.164.2023.10.19.00.18.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Oct 2023 00:18:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LMTy28il;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qtNHD-00058c-W2; Thu, 19 Oct 2023 03:17:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qtNH2-0004zG-7e
 for qemu-arm@nongnu.org; Thu, 19 Oct 2023 03:16:53 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qtNH0-0003CP-DA
 for qemu-arm@nongnu.org; Thu, 19 Oct 2023 03:16:51 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4084095722aso9368325e9.1
 for <qemu-arm@nongnu.org>; Thu, 19 Oct 2023 00:16:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697699809; x=1698304609; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OG/eTeWn+OzUtyx8iBSPb0Amcuu5LlJ9K/x3TvIXfKM=;
 b=LMTy28ilQ4PoOMyTvYA2M5rnGT0R0/HVQydI9FutXMXoovWq4qcPQPdg1iHItGy+jq
 MoSI+taehZIBbjJEipGErf0Dnj5diwcPRzKeKg3vQs1S5MTw3LO2Hk6bDCqhleQMUX+C
 3Du3VQmlb7LZHow6U0p/xe6FC/AYRtbz2P9g2SrHxuNEGj7fW0DX5mHtNewToNZErJYG
 abL+XtOh2VCBGFKdd2AKZp/b5jQsz9NX0Sgy7tWUbMgtSx3vs6QT5Xu1BEF3Y465YQdy
 c56HjY18zGk7QQyn3dZFVPRJvSZPGtpC1H+P5yMLHWNjn/1V2eHNvqVs2RCVJHGs17jd
 afnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697699809; x=1698304609;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OG/eTeWn+OzUtyx8iBSPb0Amcuu5LlJ9K/x3TvIXfKM=;
 b=fvKNlo462K0LfEKOaOKQkcn0M0DFawpCGklbXKqeGx1jqYrnG91K31JE5vhUT0h+if
 pgKNhK1dFXZPQEOlqPFXEGyhc/ZM/+S86RkI14NI0OTKHf4UicQjSGyIvGWLnEB8MxeA
 aIUt+z+5oiQUaAkiKleieONbRxXAkp+BGk89AoxTXKs54V5MgwIene2o/TOd4tqtviis
 pQYBfBmvrZeam/nqBJL/hI9+Jm2P5VbJc5VVC7my9q0K8uB6O85tXY6lyXVBzABq7zcd
 Y1kADDDYLDAP0kUvgXy5x4NPW60mPuEURR7ROWHMA2+fuUDqfxMZQ2WujfQWnx6B2y4o
 BLjw==
X-Gm-Message-State: AOJu0YwunSwF839remSp7bcv3DyKtcDRbBUPcqaU+fUiK7IfphNH0rm7
 qTpBqghSgPS5cPk1C8gW3SV1eg==
X-Received: by 2002:a05:600c:3587:b0:408:3a67:f6f5 with SMTP id
 p7-20020a05600c358700b004083a67f6f5mr1130034wmq.18.1697699808913; 
 Thu, 19 Oct 2023 00:16:48 -0700 (PDT)
Received: from localhost.localdomain (92.red-88-28-12.dynamicip.rima-tde.net.
 [88.28.12.92]) by smtp.gmail.com with ESMTPSA id
 g14-20020a05600c310e00b0040813e14b49sm3620516wmo.30.2023.10.19.00.16.44
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 19 Oct 2023 00:16:48 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>, Halil Pasic <pasic@linux.ibm.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 Beniamino Galvani <b.galvani@gmail.com>, Thomas Huth <thuth@redhat.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-arm@nongnu.org,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Eric Farman <farman@linux.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-s390x@nongnu.org, Strahinja Jankovic <strahinja.p.jankovic@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, Song Gao <gaosong@loongson.cn>,
 Eduardo Habkost <eduardo@habkost.net>, Peter Xu <peterx@redhat.com>,
 Sergio Lopez <slp@redhat.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 David Hildenbrand <david@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>
Subject: [PATCH v2 03/12] hw/misc/allwinner-dramc: Move sysbus_mmio_map call
 from init -> realize
Date: Thu, 19 Oct 2023 09:16:01 +0200
Message-ID: <20231019071611.98885-4-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231019071611.98885-1-philmd@linaro.org>
References: <20231019071611.98885-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
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
X-TUID: CiiTSajfgBA2

In order to make the next commit trivial, move the sysbus_init_mmio()
call in allwinner_r40_dramc_init() just before the corresponding
sysbus_mmio_map_overlap() call in allwinner_r40_dramc_realize().

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/misc/allwinner-r40-dramc.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/hw/misc/allwinner-r40-dramc.c b/hw/misc/allwinner-r40-dramc.c
index 6944f84455..2cc0254a55 100644
--- a/hw/misc/allwinner-r40-dramc.c
+++ b/hw/misc/allwinner-r40-dramc.c
@@ -414,6 +414,7 @@ static void allwinner_r40_dramc_reset(DeviceState *dev)
 static void allwinner_r40_dramc_realize(DeviceState *dev, Error **errp)
 {
     AwR40DramCtlState *s = AW_R40_DRAMC(dev);
+    SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
 
     if (!get_match_ddr(s->ram_size)) {
         error_report("%s: ram-size %u MiB is not supported",
@@ -421,8 +422,12 @@ static void allwinner_r40_dramc_realize(DeviceState *dev, Error **errp)
         exit(1);
     }
 
-    /* detect_cells */
-    sysbus_mmio_map_overlap(SYS_BUS_DEVICE(s), 3, s->ram_addr, 10);
+    /* R40 support max 2G memory but we only support up to 1G now. index 3 */
+    memory_region_init_io(&s->detect_cells, OBJECT(s),
+                          &allwinner_r40_detect_ops, s,
+                          "DRAMCELLS", 1 * GiB);
+    sysbus_init_mmio(sbd, &s->detect_cells);
+    sysbus_mmio_map_overlap(sbd, 3, s->ram_addr, 10);
     memory_region_set_enabled(&s->detect_cells, false);
 
     /*
@@ -458,12 +463,6 @@ static void allwinner_r40_dramc_init(Object *obj)
                           &allwinner_r40_dramphy_ops, s,
                           "DRAMPHY", 4 * KiB);
     sysbus_init_mmio(sbd, &s->dramphy_iomem);
-
-    /* R40 support max 2G memory but we only support up to 1G now. index 3 */
-    memory_region_init_io(&s->detect_cells, OBJECT(s),
-                          &allwinner_r40_detect_ops, s,
-                          "DRAMCELLS", 1 * GiB);
-    sysbus_init_mmio(sbd, &s->detect_cells);
 }
 
 static Property allwinner_r40_dramc_properties[] = {
-- 
2.41.0

