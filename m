Received: by 2002:a17:504:7fd7:b0:1be9:327d:8ee3 with SMTP id hj23csp358189njc;
        Wed, 7 Aug 2024 19:50:41 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW5+SlPEOOQfkUFyNagUAbseoDzfXmoAn/BLEZnfD1vFDRLFeETNgT0rj69Yu28rcJo22iPB/qc24WTuv07riA2sQsl3dcI
X-Google-Smtp-Source: AGHT+IFfExWOciruHxIjrcfg//ea2vWoqG+YL7AccGvYOvr/xWkcPa7AeWH4CNjmTDoNINsND3kl
X-Received: by 2002:a05:6214:3b86:b0:6b5:786e:fd43 with SMTP id 6a1803df08f44-6bd6bcbdd30mr6466416d6.7.1723085441792;
        Wed, 07 Aug 2024 19:50:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1723085441; cv=none;
        d=google.com; s=arc-20160816;
        b=ypELE9BrUuO5d8xMdLhNwqh5wBaGcui5NJG9pj9ClDcASMbg/y8PAv+bxjVuG5oZfZ
         MdCpeuV39iLXTxHO+TzYVbCFG55P5m2QLHMh2HokyZ3OQyTlH/+X1E5MmdPDnzoiZDjC
         bI/JYDg+D14Jqx1MREfR7JDPzFeM/Av+cXG2TVustIVBCRNXOpFjbEIiMIXIYi/SibeW
         KSc1rMS09WJsu0LLtaaS5sVPRzUBqfCFkR3aFjlnJJvWS1jxrS8CBjBPBrR2+fyugmrf
         q622bZIGhWUdgQI+EOBceYFxENG3WBZYjZnz/eYZ+QJbsOEh7wmPf55CXiGFA387Gegl
         5OXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=V32Rn9IrlILylnah5H4NCEtWsQwDIbnW27V95O+USsw=;
        fh=FCtYWwOtEgMeIuI7wG7f687kK1NW14MjWu/nT+chD9o=;
        b=PWx+szKcEoQFnbSqVPzs9wtvG173V1F6JEoozJnaO+Ex/LYZvtBac6berWuSh69FcX
         53Q31fP3qOAlVwjHMd4EzJ7HF2k8n6GG+ej9gdEy6VXuVt30skVy5K9BAF/YfYVwMmWf
         c9hWwopAzmUy1bWdZ3jKmL8KPMSDCsP41VDMwiYKmSqAg/m+hCBTaQZYUmORtSgby+1c
         ss90xFYRkVscXcNornEf/uTY0tQtriipk9KaYHNXlyqR+m4XNNFajO5IU1GkoWQj/EOr
         rnYo/Hs++A2GE99kk4f8OrrFS9yFk1UiYhzTuT+/japbM6L+8VNI8Y2tepp4I4zNSt0O
         AaAw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6bbbb8ed385si34243536d6.325.2024.08.07.19.50.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 07 Aug 2024 19:50:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sbtDe-0007BO-Ql; Wed, 07 Aug 2024 22:49:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1sbtDd-00075A-Cj; Wed, 07 Aug 2024 22:49:37 -0400
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1sbtDb-0008AE-RV; Wed, 07 Aug 2024 22:49:37 -0400
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Thu, 8 Aug
 2024 10:49:17 +0800
Received: from localhost.localdomain (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Thu, 8 Aug 2024 10:49:17 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>, "Wainer dos
 Santos Moschetta" <wainersm@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>, "open list:All patches CC
 here" <qemu-devel@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>,
 <yunlin.tang@aspeedtech.com>
Subject: [PATCH v2 03/11] hw/i2c/aspeed: support discontinuous poll buffer
 memory region of I2C bus
Date: Thu, 8 Aug 2024 10:49:08 +0800
Message-ID: <20240808024916.1262715-4-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240808024916.1262715-1-jamin_lin@aspeedtech.com>
References: <20240808024916.1262715-1-jamin_lin@aspeedtech.com>
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
X-TUID: zRR+X7LscEa4

It only support continuous pool buffer memory region for all I2C bus.
However, the pool buffer address of all I2c bus are discontinuous
for AST2700.

Ex: the pool buffer address of I2C bus for ast2700 as following.
0x1A0 - 0x1BF: Device 0 buffer
0x2A0 - 0x2BF: Device 1 buffer
0x3A0 - 0x3BF: Device 2 buffer
0x4A0 - 0x4BF: Device 3 buffer
0x5A0 - 0x5BF: Device 4 buffer
0x6A0 - 0x6BF: Device 5 buffer
0x7A0 - 0x7BF: Device 6 buffer
0x8A0 - 0x8BF: Device 7 buffer
0x9A0 - 0x9BF: Device 8 buffer
0xAA0 - 0xABF: Device 9 buffer
0xBA0 - 0xBBF: Device 10 buffer
0xCA0 - 0xCBF: Device 11 buffer
0xDA0 - 0xDBF: Device 12 buffer
0xEA0 - 0xEBF: Device 13 buffer
0xFA0 – 0xFBF: Device 14 buffer
0x10A0 – 0x10BF: Device 15 buffer

Introduce a new class attribute to make user set each I2C bus
pool buffer gap size. Update formula to create all I2C bus
pool buffer memory regions.

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
---
 hw/i2c/aspeed_i2c.c         | 3 ++-
 include/hw/i2c/aspeed_i2c.h | 1 +
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/hw/i2c/aspeed_i2c.c b/hw/i2c/aspeed_i2c.c
index d3d49340ea..abcb1d5330 100644
--- a/hw/i2c/aspeed_i2c.c
+++ b/hw/i2c/aspeed_i2c.c
@@ -1098,6 +1098,7 @@ static void aspeed_i2c_realize(DeviceState *dev, Error **errp)
     AspeedI2CState *s = ASPEED_I2C(dev);
     AspeedI2CClass *aic = ASPEED_I2C_GET_CLASS(s);
     uint32_t reg_offset = aic->reg_size + aic->reg_gap_size;
+    uint32_t pool_offset = aic->pool_size + aic->pool_gap_size;
 
     sysbus_init_irq(sbd, &s->irq);
     memory_region_init_io(&s->iomem, OBJECT(s), &aspeed_i2c_ctrl_ops, s,
@@ -1133,7 +1134,7 @@ static void aspeed_i2c_realize(DeviceState *dev, Error **errp)
     } else {
         for (i = 0; i < aic->num_busses; i++) {
             memory_region_add_subregion(&s->iomem,
-                                        aic->pool_base + (aic->pool_size * i),
+                                        aic->pool_base + (pool_offset * i),
                                         &s->busses[i].mr_pool);
         }
     }
diff --git a/include/hw/i2c/aspeed_i2c.h b/include/hw/i2c/aspeed_i2c.h
index 8e62ec64f8..b42c4dc584 100644
--- a/include/hw/i2c/aspeed_i2c.h
+++ b/include/hw/i2c/aspeed_i2c.h
@@ -284,6 +284,7 @@ struct AspeedI2CClass {
 
     uint64_t pool_size;
     hwaddr pool_base;
+    uint32_t pool_gap_size;
     uint8_t *(*bus_pool_base)(AspeedI2CBus *);
     bool check_sram;
     bool has_dma;
-- 
2.34.1

