Received: by 2002:a17:505:57c2:b0:1be9:327d:8ee3 with SMTP id yd2csp683480njb;
        Fri, 13 Dec 2024 11:20:40 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUx4RzTz6boQirhzEmVEw2A4Ef5YJIINN860QopTv39MdypB7sC8sbY5zitqL9YJvUhqwhn5DffdTLfDw==@linaro.org
X-Google-Smtp-Source: AGHT+IE6z0f15twNmUF6kVRE6+NZu0oGCplW+39ykkBEI+R7D7oXJJzZtU2/nIsv6olJulFiK5y6
X-Received: by 2002:a05:6102:32d2:b0:4b2:45a3:59f1 with SMTP id ada2fe7eead31-4b25d98cc02mr4007505137.9.1734117640412;
        Fri, 13 Dec 2024 11:20:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1734117640; cv=none;
        d=google.com; s=arc-20240605;
        b=Iajv3Okd4yj7H5vDT+q3EQHe51yBq0ASVen7T/hwOnnComc2N/3VEPPUmQeemTNgEN
         rOy1DWn5zg0xVYTv89flcVTvsHoXhcp8diaerSpJcQrGWMR9t/T07ioYzN8g3RVaiyIt
         nJtKQBJtWSpHzpNL7mnt2r4nrha1VJFXWBmJEa33/NnVRe8UrtoFMAviHFrI234FhYxY
         ZjLFNOSJad2bQOKKrDZKKs7ie9oxNsnUxwb+JpZL1wdF0yDkGon7F4zphF2F7Me/ShWj
         GAzEKg0MkCHUryKV9vpfPgQFxBtPKkkfKg9LpMWpanD1w6q0vQjC17H5WRXoRV0HQVDL
         Qq3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=4K+Ow/kpxla1hHfSMb1r5BWBj60XilhZFUT+PuNLeCM=;
        fh=Ud5rPIdYeD9NBj8SFa0cwZjKeU+M2mgeJzZ+m79q2YI=;
        b=k1Xh1VzduzFzVOuRpzgwTVbrWDYuaKvIcApbpaZN+1r+y6oE8lfdcxDrhji3/gcck5
         A9zigaDiFaJdWUdoHX/+8+A6Tiqu4graY5d/xLBhfkkY8g/W5USxhk69QNSduyM3xNyR
         tICfAY2Nr64WQPrxFn1WrFRADi9J62/Rem9yrwwxs6m3CB9pYCtGsjbNg70d23BC4EOo
         cPnZ2ddqcj75RohasYQkfm/HSPFJvMKFvCY6swWzXgyokcwt1mFRNyLJ7quvZfIRVzfB
         7N9OW2wIOjOxg7JlziehyrIp5TUl53oteSZq0S6pnvBfmy8YX4xJCisJZeBfaNoSib7U
         CYIg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rJ1zB70l;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-4b270433325si33369137.475.2024.12.13.11.20.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 13 Dec 2024 11:20:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rJ1zB70l;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tMB3n-00067f-Pz; Fri, 13 Dec 2024 14:10:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tMB3V-0005bu-TM
 for qemu-arm@nongnu.org; Fri, 13 Dec 2024 14:10:31 -0500
Received: from mail-ot1-x335.google.com ([2607:f8b0:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tMB3Q-00071S-UQ
 for qemu-arm@nongnu.org; Fri, 13 Dec 2024 14:10:28 -0500
Received: by mail-ot1-x335.google.com with SMTP id
 46e09a7af769-71e35be77b5so458108a34.1
 for <qemu-arm@nongnu.org>; Fri, 13 Dec 2024 11:10:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734117023; x=1734721823; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4K+Ow/kpxla1hHfSMb1r5BWBj60XilhZFUT+PuNLeCM=;
 b=rJ1zB70ld3fkZYYS0SLH3sC+Yp5bJPEKdCsDse0YW66Ci8Oa8wijrkO/QtCUvdUuKK
 BkTph2MufouxJuk1CoSXxN6ZG+GsTdGYCIqV4WSnaP9wSCyEVqrJMDR/zOlv7c6hPDGT
 HHRDKl8S8LsgAJeYUmj75S/3vXagjzZe9k/bn9XBoZn+hdiOaFejx89Y9O6voIQITUvv
 FaGTUiFC3KRuqyUQB1RypQY1FkdRti+5pkJktA9TGbYdVFqWC5/PFGX7HTcm0wqKcI4Q
 G0zRMu2A3LYBAclAmIsc9WjleMsQFfIrKfpJFsmnndU89iYyz9ZfbbYYTv0xTiOm6cW3
 c/Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734117023; x=1734721823;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4K+Ow/kpxla1hHfSMb1r5BWBj60XilhZFUT+PuNLeCM=;
 b=I7z53dhazBKV7O1EQPzH5Vf2AXiuMJ95Tk7N51qiYdT2Qkhy/+pMY3qArTKJ189qDr
 bjk58rWH70sMWtpXCc5cTZBrLfWkP/FTppRYBY6il9/2iX1dE03KuTtWaKE7dPvkHGpw
 YKWn0N2jbfyPuX0wBXC0kwTuKesD9SWGOyiFjLWVKVTpRd9JwEmNzKV4G4WGvwEpQL7P
 xyo0srZ6LLNJFp0Cg3jkcRogDUJs6j+Pw0ChZXLuAOWkd9lGhbxCtm6sspwqXBKCiJV6
 9U73guxN0lRMdHkjt8CSBV4FOmSQiHKQouAVMvO1IEg+Gv/va06yw1DsCU6kPXKH4HSK
 qYMg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV9TW3+clZilEtUcrsnJFOY8FoN/pFcsmSLtRgLNzYVaRrZFr4TsjiopFVcZK0WdGndS6O3WUB97A==@nongnu.org
X-Gm-Message-State: AOJu0YyHJw7QubXBBkmgWbBQdgy4x763WlrwA5QbLT+/PY1nQP5w5syu
 wrjqzFNNacbNHEi/U9sy8UQohuyUGgdng8z+BBxgW2RhIMkKFvm4EIsdmF796y8=
X-Gm-Gg: ASbGncuwQ2PT2mcNeckZm1n4DsyNlaSrM9rN/yunGesDq+mCQlTgE0LSJuy3zDZe/CN
 lxn37hVDvLR2xuDMA8CNaBMNuVqyQJIgTdZn05TXXPOjY+OX6F3WJLsEoTSsncOi2ht6tZuLwFX
 kycJRjMMl0sP+lxCuAJ5oS4CGQTRggjqgTtkedPEpSyyCLwcc6aAm9lzEJQ5Hk7swoawZcv7vPf
 nSGtG18sLeE0DFN+0kQtiO9PfjpBdXkk1TAvGPNlyWJ+5anoUUjtsXOiL6JkUoG
X-Received: by 2002:a05:6830:258c:b0:710:fef4:3c92 with SMTP id
 46e09a7af769-71e3ba26862mr2771330a34.21.1734117023633; 
 Fri, 13 Dec 2024 11:10:23 -0800 (PST)
Received: from stoup.. ([187.217.227.247]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-71e4834da91sm29697a34.18.2024.12.13.11.10.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Dec 2024 11:10:23 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
 Jamin Lin <jamin_lin@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Joel Stanley <joel@jms.id.au>, Corey Minyard <cminyard@mvista.com>,
 Patrick Leis <venture@google.com>,
 qemu-arm@nongnu.org (open list:ASPEED BMCs)
Subject: [PATCH 28/71] hw/i2c: Constify all Property
Date: Fri, 13 Dec 2024 13:07:02 -0600
Message-ID: <20241213190750.2513964-33-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241213190750.2513964-1-richard.henderson@linaro.org>
References: <20241213190750.2513964-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::335;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x335.google.com
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
X-TUID: XeHK+sHZJ8uL

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 hw/i2c/aspeed_i2c.c      | 4 ++--
 hw/i2c/core.c            | 2 +-
 hw/i2c/i2c_mux_pca954x.c | 2 +-
 hw/i2c/omap_i2c.c        | 2 +-
 4 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/hw/i2c/aspeed_i2c.c b/hw/i2c/aspeed_i2c.c
index 3ae22cb052..2ea68c3090 100644
--- a/hw/i2c/aspeed_i2c.c
+++ b/hw/i2c/aspeed_i2c.c
@@ -1258,7 +1258,7 @@ static void aspeed_i2c_realize(DeviceState *dev, Error **errp)
     }
 }
 
-static Property aspeed_i2c_properties[] = {
+static const Property aspeed_i2c_properties[] = {
     DEFINE_PROP_LINK("dram", AspeedI2CState, dram_mr,
                      TYPE_MEMORY_REGION, MemoryRegion *),
     DEFINE_PROP_END_OF_LIST(),
@@ -1446,7 +1446,7 @@ static void aspeed_i2c_bus_realize(DeviceState *dev, Error **errp)
     sysbus_init_mmio(SYS_BUS_DEVICE(dev), &s->mr_pool);
 }
 
-static Property aspeed_i2c_bus_properties[] = {
+static const Property aspeed_i2c_bus_properties[] = {
     DEFINE_PROP_UINT8("bus-id", AspeedI2CBus, id, 0),
     DEFINE_PROP_LINK("controller", AspeedI2CBus, controller, TYPE_ASPEED_I2C,
                      AspeedI2CState *),
diff --git a/hw/i2c/core.c b/hw/i2c/core.c
index 4cf30b2c86..4118d3db50 100644
--- a/hw/i2c/core.c
+++ b/hw/i2c/core.c
@@ -18,7 +18,7 @@
 
 #define I2C_BROADCAST 0x00
 
-static Property i2c_props[] = {
+static const Property i2c_props[] = {
     DEFINE_PROP_UINT8("address", struct I2CSlave, address, 0),
     DEFINE_PROP_END_OF_LIST(),
 };
diff --git a/hw/i2c/i2c_mux_pca954x.c b/hw/i2c/i2c_mux_pca954x.c
index db5db956a6..80c570fd10 100644
--- a/hw/i2c/i2c_mux_pca954x.c
+++ b/hw/i2c/i2c_mux_pca954x.c
@@ -211,7 +211,7 @@ static void pca954x_init(Object *obj)
     }
 }
 
-static Property pca954x_props[] = {
+static const Property pca954x_props[] = {
     DEFINE_PROP_STRING("name", Pca954xState, name),
     DEFINE_PROP_END_OF_LIST()
 };
diff --git a/hw/i2c/omap_i2c.c b/hw/i2c/omap_i2c.c
index e78505ebdd..172df135f5 100644
--- a/hw/i2c/omap_i2c.c
+++ b/hw/i2c/omap_i2c.c
@@ -511,7 +511,7 @@ void omap_i2c_set_fclk(OMAPI2CState *i2c, omap_clk clk)
     i2c->fclk = clk;
 }
 
-static Property omap_i2c_properties[] = {
+static const Property omap_i2c_properties[] = {
     DEFINE_PROP_UINT8("revision", OMAPI2CState, revision, 0),
     DEFINE_PROP_END_OF_LIST(),
 };
-- 
2.43.0

