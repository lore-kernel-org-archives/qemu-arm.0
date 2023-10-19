Received: by 2002:a17:906:cf90:b0:9bd:85f7:2662 with SMTP id um16csp502499ejb;
        Thu, 19 Oct 2023 06:10:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGe20N9fJevp7mcEvDVocSmjILjbtF8A+Qm4DCgyU9XFwz4WssjuAlTsRFE5zYd5Oz31zhN
X-Received: by 2002:a05:6000:124c:b0:31f:a256:4bbb with SMTP id j12-20020a056000124c00b0031fa2564bbbmr1316444wrx.71.1697721027873;
        Thu, 19 Oct 2023 06:10:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697721027; cv=none;
        d=google.com; s=arc-20160816;
        b=l3/hfmkPl9rrUUtlT1/Iun9YeFqIJdipwFZ7J7cV7iu0BUKFJ9Mw60+pFNu+fE4xEN
         /BXcz6qCy8twfKfqf+YX6BmIq7bwBmLwLCipcRNExH0M/Bd5Dp0ldzIZjuyntzAM5Qll
         64mm2Q4k7PXwnJsH4yK837p4MW9LuZOGrMY61Gxz4nyjGSHH6pHCx5j485cOGZ2Q+lJY
         k8/vWtRA5P1oQHymOFoJTGfOdclquuZDMOijQJkNNLPe9nJKhGC27xJNX6YRZj6JHJ61
         EdHlWo1FOYvVU5yCUW1x0bvOQrkoQ6aeYTt2OZBGoNAv++68lCl298YsOFOqZv2YPjhF
         QBHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=7XHyEIGArD78mgw8R7PN08IB8dbr9alKW/qdS4/dSAc=;
        fh=rYBZhAJdgCvxZRRcO2tKw9iXjHkAG8ZfVdmqU/2KeAE=;
        b=TiPCw4YgzGdYkSScBVi+b3c270gDwxHzFuuheKSXlefJ5PiOrZjYsIolzWGbvFCbEh
         5a4UQU3PXJ3ztgcFzd79VXejrG5vQHrXUoHsgp/dp0PkhgUrlBRnPgeNDyGlCz4p5mOA
         j6q4YtK5DZP3mMWv6Ur7yrskaB7l6I5SZwE5byavkUwWj9+rQowPlJPpmWXyOpEgyrYn
         AYuqvKJxEep+pi8B7fMUiJSlOKG8NJ/rpPgMD4ZutkC6BkXMO2667HtAZKZD7mAxI+px
         dAK22WpAUs0YsL2P9fRabY5ivzrxsFU2R2kdkjQSO5ZtqQNDg1Tj11jwNgErXPmOt12q
         SoNA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tTlJfgfF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f1-20020a5d50c1000000b0032dad22e065si2647259wrt.602.2023.10.19.06.10.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Oct 2023 06:10:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tTlJfgfF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qtSnB-0005vp-RD; Thu, 19 Oct 2023 09:10:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qtSnA-0005tB-Kt
 for qemu-arm@nongnu.org; Thu, 19 Oct 2023 09:10:24 -0400
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qtSn8-0008DG-Mc
 for qemu-arm@nongnu.org; Thu, 19 Oct 2023 09:10:24 -0400
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-2c504a5e1deso101127151fa.2
 for <qemu-arm@nongnu.org>; Thu, 19 Oct 2023 06:10:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697721021; x=1698325821; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7XHyEIGArD78mgw8R7PN08IB8dbr9alKW/qdS4/dSAc=;
 b=tTlJfgfFTTti9T7ef2mjZmwlgwquxMQHtMBIfvTBQPlHRKPiaZIc3HTOU6opKGCJdL
 Inbe6F7veaVsjcf09k0wNWrDA5zj70/uFO0aauYPVYXW0TM4MtuzS+YxyDqJeQFWR64E
 ImSFy7CYO/gle+5yJ+C0CGaTNEtl4SSa0ITq4LfvqlkrZyzJApMFR4dHBPNvHSZfN60q
 6hljErKdy3oio3Vyu3Th2hVhBiYrl3ZbX6fYn8btEIqTED6Sm6HJ4GGdwqthl0y45g+4
 BhGRDWk2CWqdmJyGMRsv/LcweeSj4kbJw6tINhiQObzTNYkc9rt+8/eBcksakjLOiFYY
 EGkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697721021; x=1698325821;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7XHyEIGArD78mgw8R7PN08IB8dbr9alKW/qdS4/dSAc=;
 b=LO9AJZGqgc1OEKAcSysjXSQQX4mYO7m+RDnnl7VeTJcsAaWYitBHqp7TljxuywJW3H
 09rvnihOqc8gl2uzkUCiwGYSPQ3LVkoN7OfbRvPP3xmz2Pf3OBmfDPZO77tYlkj5Wke1
 akXsgINlmLisn+HOc6bUjHWAFcAVo4A8nD2YNzSm2auq/LIFLok90v7x80RMkjo/O3x5
 eD105DAG2uxVFjjyVnf7gaUA2DZmIaelz8FcIAcq2vW8W/ktcLDmhn0dC6++ISJaZdD9
 T3GlAoobTYlY6ss2XSNx/5+yi8F7IY9w2K7BoVdq9iHgFnO+HLNQAlSfpRB4Xgbj7KWL
 xzlw==
X-Gm-Message-State: AOJu0Yw2B5Si6QAQijq6z0Zg6jqzT7ASjHqmrGaFCAcoC6aHHZtdtLAq
 xeJ1u/ZrkxrVjY1wHfwPL3NSvw==
X-Received: by 2002:a2e:b601:0:b0:2c5:1a89:41c0 with SMTP id
 r1-20020a2eb601000000b002c51a8941c0mr1329995ljn.23.1697721020837; 
 Thu, 19 Oct 2023 06:10:20 -0700 (PDT)
Received: from m1x-phil.lan (176-131-216-177.abo.bbox.fr. [176.131.216.177])
 by smtp.gmail.com with ESMTPSA id
 p15-20020a05600c1d8f00b00402d34ea099sm4421837wms.29.2023.10.19.06.10.19
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 19 Oct 2023 06:10:20 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 9/9] hw/arm/pxa2xx: Realize PXA2XX_I2C device before
 accessing it
Date: Thu, 19 Oct 2023 15:09:24 +0200
Message-ID: <20231019130925.18744-10-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231019130925.18744-1-philmd@linaro.org>
References: <20231019130925.18744-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::235;
 envelope-from=philmd@linaro.org; helo=mail-lj1-x235.google.com
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
X-TUID: dKqbgPH4rgIu

qbus_new(), called in i2c_init_bus(), should not be called
on unrealized device.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/pxa2xx.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/hw/arm/pxa2xx.c b/hw/arm/pxa2xx.c
index 601ddd8766..f0bf407e66 100644
--- a/hw/arm/pxa2xx.c
+++ b/hw/arm/pxa2xx.c
@@ -1513,14 +1513,15 @@ PXA2xxI2CState *pxa2xx_i2c_init(hwaddr base,
     qdev_prop_set_uint32(dev, "size", region_size + 1);
     qdev_prop_set_uint32(dev, "offset", base & region_size);
 
+    /* FIXME: Should the slave device really be on a separate bus?  */
+    i2cbus = i2c_init_bus(dev, "dummy");
+
     i2c_dev = SYS_BUS_DEVICE(dev);
     sysbus_realize_and_unref(i2c_dev, &error_fatal);
     sysbus_mmio_map(i2c_dev, 0, base & ~region_size);
     sysbus_connect_irq(i2c_dev, 0, irq);
 
     s = PXA2XX_I2C(i2c_dev);
-    /* FIXME: Should the slave device really be on a separate bus?  */
-    i2cbus = i2c_init_bus(dev, "dummy");
     s->slave = PXA2XX_I2C_SLAVE(i2c_slave_create_simple(i2cbus,
                                                         TYPE_PXA2XX_I2C_SLAVE,
                                                         0));
-- 
2.41.0

