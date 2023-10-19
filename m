Received: by 2002:a17:906:cf90:b0:9bd:85f7:2662 with SMTP id um16csp502385ejb;
        Thu, 19 Oct 2023 06:10:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHD39W6ViEnWSlAqNoPPhLwf+QytbLfFUW/GpKG1pEjZQ0Ij1vfgM6l0h4HpVF68a7qv21b
X-Received: by 2002:a05:6512:33ce:b0:504:7ff8:3430 with SMTP id d14-20020a05651233ce00b005047ff83430mr1760475lfg.10.1697721018713;
        Thu, 19 Oct 2023 06:10:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697721018; cv=none;
        d=google.com; s=arc-20160816;
        b=yAaXBTzmJmd6ARnZ4lvCMhWzfLKDMhrlB5ewt/gsOowCDTOLPsEJyW2y1gKpMesOS1
         grP3xpgWTiaUFnn2q8a7o5vEYR7SW4Cub2rrqlvJcXL+jj7SmZ8ovUbIv5pP2omobc9/
         d8gkgb7BVMjyneTg5QDYLa1p8xuFRZ+wsd/27bzkOlwUTCJXGoAAtyivKGI4DbKGMfzh
         xUPtmiv9LO7Lpco3jPJ2Y61EBkixZp6Mb/wyPnM/HHTkKE9QqSBwbSZvNZl5JkpNfcye
         N/4MwdhWeUiqRpTBP60dxT5M+H90TZ3GvVynh2oFwkdjN+ISKm4/rq5NguI1eJwGQ+hd
         J6TA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=e3Wrm2+hEgcQGJPeHM5sv3LDR90OXcyWyLu0fpUZ2rw=;
        fh=rYBZhAJdgCvxZRRcO2tKw9iXjHkAG8ZfVdmqU/2KeAE=;
        b=VQcIPtMQEva3ivLVLDAUOY6XsXgF7waiAf9CnxkncF2ZMupk6WPA56IOlEBsGMnXHL
         dSe9eaTzv8Nk7nKkxvRirk2knAu7IL9tNeux+4pvpRav/UlR2yoTGbPLTcP5M7coBmiW
         PDwDXRE4hi9o1IcOJ5CYycN6CPPzQhoQ4zM9WEPDtW4k1yrnhVIsrzashUVKlbN5+guY
         cE8RJ8qw2NGrLrt5y9p9XuDsU28EnhcunFnhfEQtq0Hq+hB6QOIPjh7imNtri5Hg+wlF
         zRfItqG5Gs1pZv4OPfe3eMQTvHPs/VxaQGZfre7VIdpp+rd7A8KIjCCN68K6Ddmfe0Ra
         2eag==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zbK9Zyo4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a14-20020a5d508e000000b0032daf8456a0si2512924wrt.1.2023.10.19.06.10.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Oct 2023 06:10:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zbK9Zyo4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qtSmm-0004nd-0k; Thu, 19 Oct 2023 09:10:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qtSma-0004N5-6s
 for qemu-arm@nongnu.org; Thu, 19 Oct 2023 09:09:53 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qtSmY-0007bQ-Kv
 for qemu-arm@nongnu.org; Thu, 19 Oct 2023 09:09:47 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-408425c7c10so8826505e9.0
 for <qemu-arm@nongnu.org>; Thu, 19 Oct 2023 06:09:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697720985; x=1698325785; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=e3Wrm2+hEgcQGJPeHM5sv3LDR90OXcyWyLu0fpUZ2rw=;
 b=zbK9Zyo417DCzyH8E4A2HqVhjOUKdl3LFcSRuAj0WoDsv5eHBCDCMtpLheDO6Iy6fJ
 2UQBb/wFbEXf/J1V7NkpTbd1gVVRirNQkErukNcO/9rST5QWUhZipCO40GjqYzQE2yim
 Mf9lh0NitDKZIfPqBjmFAFjL0KMQumHvDUjYjj33IImM7f6+Lnn7baha9O2U/JZRCtc/
 SSweHfJhqk6P1AFaEqgh2SmqVc9zEMXaHl/FYEeueJQFJy7PrpdmAdQqHQybk298gtrS
 gKMtfdbUlE0juqPMOh6Kq+ATOgUt8ZNfKFslTz0d0/H0i1FbmH052alT+Jpf7wZfEq/L
 XKdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697720985; x=1698325785;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=e3Wrm2+hEgcQGJPeHM5sv3LDR90OXcyWyLu0fpUZ2rw=;
 b=Vj2XFmKk3zuQRq6HXWSRC7H/ofS7MyFySBphlulxAPjEKbgBvRLgk5GlP0epdoQ2I1
 Dx5ehU+BYT59u69NLH29JzmvzYS1tTc4QUXIUmqPBel5TfIfXxspxzCRT/M2FMr7nZsh
 xFk7pF+m4V5bF/Wr2bMojwtjPHMRWHNrYJ1miIXUvLPRlZnFSDGcMVi6uSLOWIfrcctg
 qX5Crd4lguKBN1ousKKoOKF5SpSWSMdsfE/lqZnw4ZyeYTZyj9jOKRPSnrxPRqH3Ruw7
 PGGtQcn/0RfXoeY2U2iBVRlLnKJX5j6L1jOvuq9ZunOV11SeZmFOpzwvVTIDivPXxMxc
 rluQ==
X-Gm-Message-State: AOJu0Yyu9IKseRKnYiGAas1TXjOT4Ng8GPyU8YYEq/c3ZGI4AO66fW/g
 wzc3Fz2ohOdE920RT5Pgo60vXSWpCLoPP1KHEPeCTQ==
X-Received: by 2002:adf:db4b:0:b0:32d:b06c:80b5 with SMTP id
 f11-20020adfdb4b000000b0032db06c80b5mr1581493wrj.2.1697720985190; 
 Thu, 19 Oct 2023 06:09:45 -0700 (PDT)
Received: from m1x-phil.lan (176-131-216-177.abo.bbox.fr. [176.131.216.177])
 by smtp.gmail.com with ESMTPSA id
 k1-20020a5d66c1000000b0032dbf99bf4fsm4439609wrw.89.2023.10.19.06.09.44
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 19 Oct 2023 06:09:44 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 3/9] hw/pcmcia/pxa2xx: Realize sysbus device before
 accessing it
Date: Thu, 19 Oct 2023 15:09:18 +0200
Message-ID: <20231019130925.18744-4-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231019130925.18744-1-philmd@linaro.org>
References: <20231019130925.18744-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x336.google.com
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
X-TUID: u1+vFuMdMYac

sysbus_mmio_map() should not be called on unrealized device.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/pcmcia/pxa2xx.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/hw/pcmcia/pxa2xx.c b/hw/pcmcia/pxa2xx.c
index fcca7e571b..e7264feb45 100644
--- a/hw/pcmcia/pxa2xx.c
+++ b/hw/pcmcia/pxa2xx.c
@@ -142,15 +142,12 @@ PXA2xxPCMCIAState *pxa2xx_pcmcia_init(MemoryRegion *sysmem,
                                       hwaddr base)
 {
     DeviceState *dev;
-    PXA2xxPCMCIAState *s;
 
     dev = qdev_new(TYPE_PXA2XX_PCMCIA);
-    sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, base);
-    s = PXA2XX_PCMCIA(dev);
-
     sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
+    sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, base);
 
-    return s;
+    return PXA2XX_PCMCIA(dev);
 }
 
 static void pxa2xx_pcmcia_initfn(Object *obj)
-- 
2.41.0

