Received: by 2002:a17:504:3f1b:b0:1be9:327d:8ee3 with SMTP id x27csp1260257njk;
        Wed, 17 Jul 2024 23:50:20 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWXXQW8t7bkqD6rxxQi5RpNTyW+JeFYhjoN80WQx/0job0Ipx63+/IOfvH25MGiZ9y+OP8TgtVAPhV/UlQkaGDtQjXsfDwi
X-Google-Smtp-Source: AGHT+IFH01VOM1Hj8sS3EheIK2ucn2nKxFS81+CmObMfW+6TNC/l5Z0C8ek6KM7CRtbpaBg2Wide
X-Received: by 2002:ac8:5fcc:0:b0:440:4d76:a601 with SMTP id d75a77b69052e-44f865fa12amr45455941cf.38.1721285420736;
        Wed, 17 Jul 2024 23:50:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721285420; cv=none;
        d=google.com; s=arc-20160816;
        b=i+hWkc8T8qdmdNgRrkplCb9iS+OarkSN2/of/6uXBX7dlJR8NLKb8Ymif0sBXTv666
         96pdeWI5G63PQ2pCB16efcU0sIkljCr/oq07l4ZMP4DIE4noQ/GyeWQSA2LGFFYKyNYf
         3yMDJ6fJiu64c6nxi/JdIJ9VcAxK7epFWSrBuoXBA4/TnUv6/7sdLvZlFEd0ixO9PuKu
         GgOlwIR7vW1CExYtZlR7wVpymx6OwHMsqSr+5319gXJrIWZt28NzEilErdEbjuM4g0HP
         dtir3uf4RXp98xE5JIgfNJiRLUHVSVkvNWu8SB9CbEhAbRn3lVDQj84BuON7hprK9lYG
         Vmvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to;
        bh=LkWKqisN2FS9mP32G1J1Y4ksCO9RJsVRoe0fDEUbKIE=;
        fh=cqT0Sm0iQHqDiDEsJ3ixFD44Q88e2AVQBWE8a4yA5Ck=;
        b=JY/OC3+uAbQaRgWwGEpiUDzaRJUz5uGBBFRS0DjYRTIYsO8kViwZR8lrMlMcVWl28v
         Mm/H+x0JNNYrZ/oO88R8jFMZSDLVbsNJ9+MqT54ro9Wt0hD/UqiAwaYo6N/8Q1wqqtlH
         eoVeRUPSMI/daCWWAScCYDwQhet0BGl82OJeT7Qps9Iz/N6GOy4D1uQuJQv+08fVtPwE
         IeXZlaPhmEyw57MFrKi7f6P+aj5lrRgalKXkWqH14LgEoXFiCLrQnlygsseqnD7fLaUj
         wEfng9t3xn9WIUUmRGl3TWfFoTQvGHA+a0lCDAXIOql+VE3e1q1Us6QU17iMdEFciAXh
         mfvw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-44f5b77ebf4si116653261cf.161.2024.07.17.23.50.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 17 Jul 2024 23:50:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sUKxp-0004hb-26; Thu, 18 Jul 2024 02:50:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1sUKxn-0004fC-8S; Thu, 18 Jul 2024 02:50:03 -0400
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1sUKxk-00047C-PI; Thu, 18 Jul 2024 02:50:02 -0400
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Thu, 18 Jul
 2024 14:49:25 +0800
Received: from localhost.localdomain (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Thu, 18 Jul 2024 14:49:25 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, Alistair Francis <alistair@alistair23.me>, "open
 list:ASPEED BMCs" <qemu-arm@nongnu.org>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>,
 <yunlin.tang@aspeedtech.com>
Subject: [PATCH v1 00/15] support ADC and I2C for AST2700
Date: Thu, 18 Jul 2024 14:49:10 +0800
Message-ID: <20240718064925.1846074-1-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=211.20.114.72;
 envelope-from=jamin_lin@aspeedtech.com; helo=TWMBX01.aspeed.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_FAIL=0.001,
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
Reply-to:  Jamin Lin <jamin_lin@aspeedtech.com>
From:  Jamin Lin via <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: w3+X8o7B/CqZ

v1: 
1. support ADC for AST2700
2. support I2C for AST2700

Jamin Lin (15):
  aspeed/adc: Add AST2700 support
  aspeed/soc: support ADC for AST2700
  hw/i2c/aspeed: support to set the different memory size
  hw/i2c/aspeed: support discontinuous register memory region of I2C bus
  hw/i2c/aspeed: rename the I2C class pool attribute to share_pool
  hw/i2c/aspeed: introduce a new bus pool buffer attribute in
    AspeedI2Cbus
  hw/i2c/aspeed: support discontinuous poll buffer memory region of I2C
    bus
  hw/i2c/aspeed: introduce a new dma_dram_offset attribute in
    AspeedI2Cbus
  hw/i2c/aspeed: Add AST2700 support
  hw/i2c/aspeed: support Tx/Rx buffer 64 bits address
  hw/i2c/aspeed: support high part dram offset for DMA 64 bits
  aspeed/soc: introduce a new API to get the INTC orgate information
  aspeed/soc: support I2C for AST2700
  aspeed: fix coding style
  aspeed: add tmp105 in i2c bus 0 for AST2700

 hw/adc/aspeed_adc.c         |  16 ++
 hw/arm/aspeed.c             |  31 +++-
 hw/arm/aspeed_ast27x0.c     |  65 +++++++
 hw/i2c/aspeed_i2c.c         | 340 ++++++++++++++++++++++++++++++------
 include/hw/adc/aspeed_adc.h |   1 +
 include/hw/i2c/aspeed_i2c.h |  34 ++--
 6 files changed, 418 insertions(+), 69 deletions(-)

-- 
2.34.1

