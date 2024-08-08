Received: by 2002:a17:504:7fd7:b0:1be9:327d:8ee3 with SMTP id hj23csp358327njc;
        Wed, 7 Aug 2024 19:51:37 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXWgm4Y9kK7Hma8CeTKIKzpx574I+fNI/rXY8Pf/JgFNkeTyWym25zmTGdg0fcAPWjchVVIsyQmKm1oijK/k2S7fCKBdYJ8
X-Google-Smtp-Source: AGHT+IH0iS2bzBOcTIiRdnyVQYSH5RdE6fReFKX4cAZHizm5iVMVWJLL9QJOcH29wsAfjvGgQobR
X-Received: by 2002:a05:6902:e10:b0:e06:fe1a:ffd8 with SMTP id 3f1490d57ef6-e0e9db18d8dmr638264276.31.1723085497297;
        Wed, 07 Aug 2024 19:51:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1723085497; cv=none;
        d=google.com; s=arc-20160816;
        b=lh6ewv8gFvyOEm0xLX0+Y/jEkgSJ/4dRV2r9Zwvj6cPocQ3guXV+5ofv86JFVM9+2j
         ChxD7cJpt9AZk/SxU6IOHCkLbYIGCRY64clwMCl1CBWisRd1cDUFEzNFY9gQX2j9fIka
         xS2lHNo8vP84pg5xx4NU963AGZ2i3AGl2fP4hHiYaioenf1PuLbgWEpD1khRGl/5LtvV
         Bg5URufED78wqMM2Q5mVFzoSshs2TqC03US5u35UeY+ShP+wjBjSFZMEInueR2nUTLdz
         VumTQl2f30rPwhGvye+kpAPW8C5oCfSow1Rw8edZQjYVmC88ADw0nosH8Xwg08OOC1wY
         uYsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=2FFFweZUkPie0yQCHSTR/dzQg6he2wo/VTkFJZzLHoY=;
        fh=FCtYWwOtEgMeIuI7wG7f687kK1NW14MjWu/nT+chD9o=;
        b=Jv/msgfFZBdpwyLhq1R0KD/72y+MOFF18aCe5CPkG9F8nulIZL3h8n0FjEAGqzKwcE
         krwneGNTLfVZbNL9kHfPjDldH83m/voPPe+br367Lp0i2y/XpifsMkDWGQT9yuXR6SDr
         drorOWYyz3KxRUoVgFZm1MJr3RRjTCwdgCEg+KkPguUTl6QvN7jfw72nqISq881AhQV1
         Sotdd4ppQbQuHc1GORhIaEZi2PWyjlbtI1uckv6Q7LCs9sGfM5uPYZUkvRAH2exGcL1o
         yITwpZDa5n2kKgk0c/FciWzsU7ZMx8AdQmBLLaqYMGH1SgjGZxHB6/EXoWSRmezZlEZH
         beug==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-451c87fc963si30842811cf.428.2024.08.07.19.51.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 07 Aug 2024 19:51:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1sbtDZ-0006nX-7w; Wed, 07 Aug 2024 22:49:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1sbtDY-0006iv-2R; Wed, 07 Aug 2024 22:49:32 -0400
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1sbtDW-0008AE-I3; Wed, 07 Aug 2024 22:49:31 -0400
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Thu, 8 Aug
 2024 10:49:16 +0800
Received: from localhost.localdomain (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Thu, 8 Aug 2024 10:49:16 +0800
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
Subject: [PATCH v2 01/11] hw/i2c/aspeed: support discontinuous register memory
 region of I2C bus
Date: Thu, 8 Aug 2024 10:49:06 +0800
Message-ID: <20240808024916.1262715-2-jamin_lin@aspeedtech.com>
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
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-to:  Jamin Lin <jamin_lin@aspeedtech.com>
From:  Jamin Lin via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: RUYo+UGpsS/m

It only support continuous register memory region for all I2C bus.
However, the register address of all I2c bus are discontinuous
for AST2700.

Ex: the register address of I2C bus for ast2700 as following.
0x100 - 0x17F: Device 0
0x200 - 0x27F: Device 1
0x300 - 0x37F: Device 2
0x400 - 0x47F: Device 3
0x500 - 0x57F: Device 4
0x600 - 0x67F: Device 5
0x700 - 0x77F: Device 6
0x800 - 0x87F: Device 7
0x900 - 0x97F: Device 8
0xA00 - 0xA7F: Device 9
0xB00 - 0xB7F: Device 10
0xC00 - 0xC7F: Device 11
0xD00 - 0xD7F: Device 12
0xE00 - 0xE7F: Device 13
0xF00 – 0xF7F: Device 14
0x1000 – 0x107F: Device 15

Introduce a new class attribute to make user set each I2C bus gap size.
Update formula to create all I2C bus register memory regions.

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
---
 hw/i2c/aspeed_i2c.c         | 3 ++-
 include/hw/i2c/aspeed_i2c.h | 1 +
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/hw/i2c/aspeed_i2c.c b/hw/i2c/aspeed_i2c.c
index b52a99896c..9c222a02fe 100644
--- a/hw/i2c/aspeed_i2c.c
+++ b/hw/i2c/aspeed_i2c.c
@@ -1012,6 +1012,7 @@ static void aspeed_i2c_realize(DeviceState *dev, Error **errp)
     SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
     AspeedI2CState *s = ASPEED_I2C(dev);
     AspeedI2CClass *aic = ASPEED_I2C_GET_CLASS(s);
+    uint32_t reg_offset = aic->reg_size + aic->reg_gap_size;
 
     sysbus_init_irq(sbd, &s->irq);
     memory_region_init_io(&s->iomem, OBJECT(s), &aspeed_i2c_ctrl_ops, s,
@@ -1034,7 +1035,7 @@ static void aspeed_i2c_realize(DeviceState *dev, Error **errp)
             return;
         }
 
-        memory_region_add_subregion(&s->iomem, aic->reg_size * (i + offset),
+        memory_region_add_subregion(&s->iomem, reg_offset * (i + offset),
                                     &s->busses[i].mr);
     }
 
diff --git a/include/hw/i2c/aspeed_i2c.h b/include/hw/i2c/aspeed_i2c.h
index fad5e9259a..02ede85906 100644
--- a/include/hw/i2c/aspeed_i2c.h
+++ b/include/hw/i2c/aspeed_i2c.h
@@ -275,6 +275,7 @@ struct AspeedI2CClass {
 
     uint8_t num_busses;
     uint8_t reg_size;
+    uint32_t reg_gap_size;
     uint8_t gap;
     qemu_irq (*bus_get_irq)(AspeedI2CBus *);
 
-- 
2.34.1

