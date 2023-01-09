Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp2317328ejc;
        Mon, 9 Jan 2023 06:58:24 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvA/9ciku/TvZTRJHrgLLQQNqPebPBoJGZtJ5FdPmjiWJWjfZMU20RQy+39Xx/WEZ5uHsUk
X-Received: by 2002:a05:622a:4d98:b0:3a5:24ac:a175 with SMTP id ff24-20020a05622a4d9800b003a524aca175mr97577938qtb.56.1673276303873;
        Mon, 09 Jan 2023 06:58:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673276303; cv=none;
        d=google.com; s=arc-20160816;
        b=wlhKjWe61e9l1lQHmb/Z5mwhqpIcpgtuknc63ibE74UOb4UygUs6GG+zSfRBa9ueQI
         LRSOof22Bf2sxgtdTNW6PbdJXUnjrV0TT06QTPeI1xud0ln/cHZVR72UzeTg8zjiQaM5
         tQAANK/2u/jjtukPaaN+3j+RICH45s63eHfOovdEBSP2Hq43Oysk30n7wzjpHnnw5tiX
         /rTUl3HlVPlxHPZpK6P40TE3ALPqMnOUnirwfCZmZ5YmQhuxwwreB4TlCU39SOr7Tk56
         /MH9bUFLBJyMODori1IXLTT3K6OsQUNJ/XvRiM9DD8QO3j7y3Yqv4WtnSqnxLjh0MMmj
         ZjZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=kmxG628TWZ0nrw6bA+Re1tjxcTyz6IlDL5hx2BveKgI=;
        b=LlQf4VXt87N/oElJUvloZh+dwjs5CsBcNwIhC0878KrOSd41cWD80EKvQMpkf5amXt
         wKtYdYSd2k9Q+qXKodBXQVTftQOgX3OsbSNJQwaSZhrxF06jguFA3Tmmu/+o8siNe9J4
         oCLIf5+RlwekxmKXgHf+g2nckKZcuOB7IKqagUZqQdEIfgEweUlU6FwhoVNrGAXPRNGT
         LftS+v0XJ/MzqYcu0QDB4OmpgkRTspfaWMrbARd0DJmYkM6N9KOllYXoWRDIKHTSS9bR
         heWa+q3G/ieE/Zt5uW4X7gpHyZkjQ8CNFKviFIbu8z+RvkudHLiOJZC3qBHR6o6yNLUW
         Q4Bg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zXJoS5bb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t14-20020ac865ce000000b003a699e9d6b4si4564104qto.704.2023.01.09.06.58.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 09 Jan 2023 06:58:23 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zXJoS5bb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pEskU-0001aj-Bg; Mon, 09 Jan 2023 09:03:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pEskT-0001Zj-6C
 for qemu-arm@nongnu.org; Mon, 09 Jan 2023 09:03:37 -0500
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pEskR-0006Rs-8q
 for qemu-arm@nongnu.org; Mon, 09 Jan 2023 09:03:36 -0500
Received: by mail-lj1-x22a.google.com with SMTP id s25so8962569lji.2
 for <qemu-arm@nongnu.org>; Mon, 09 Jan 2023 06:03:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kmxG628TWZ0nrw6bA+Re1tjxcTyz6IlDL5hx2BveKgI=;
 b=zXJoS5bb9QdrB9PViEuE64yPBo4QFiUZvtjwHgNd3qvsoUCIgAySlRfJzAvdVnBll5
 4mRTSHEYHGLkKFSS2602pPE1iluJ594Cl0AsqDVvRlnIC/Wu87QS7o9c932AUmrMDAOp
 ABAXcpM2uLEJj6D93yr+pBO34CGTm/NpX2fLuPH4NMWjwf6GIHIulOd/V9IjmeYPb0ev
 pSKrUrNbgtHhTvxN+KOgtBrDqs/1Gt1UiZLQq+YorRCaozM4xuAJ3xFZpoX05v+m/ZI/
 /pqa+NkrT7uucGnBO48nh1ol8HoF5HmOMcXfeJPfRs/IylPlwY8iplGcBBh9P0RcHXq4
 mxkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kmxG628TWZ0nrw6bA+Re1tjxcTyz6IlDL5hx2BveKgI=;
 b=CodwvWd5CPnBQODXLSQngFgJlhZMn3kb1/6B/WVg2WYz3DxzrsIHTK6HhdlqJZ5nyp
 e+n5WXS52Q6HeNIoQb2iA43T2OVZShEcbdHV78HRVvqA0p1+m7OgyImm8zjITBv/dh2Y
 K+tFPOuNVor3nosAUc0XSMUt6mpdEO9eFNNUYQ3DT/ZefjNwGq0xIek6pzEcx2xUfxKn
 BiKFyvrO+LjMUIIJb6dy2h5Pc9uD1JHJgEEgI1yofD9XKyAjzsz0n+FhaVvvCTLaKd0W
 DDwCovAvl3Tx6g5ztl8RxkFdxiM/nJm8Tk856zd+wHuLimtNkDYK86WSyNk4fMoMeiaq
 l+9g==
X-Gm-Message-State: AFqh2ko1JzKqCsV6qEoffVLQzilIz0Li+KhD7DrXXEQHdv1NduOtGIhK
 z5D2nnroIR/yeMO//t2y/kwHvw==
X-Received: by 2002:a2e:b0da:0:b0:27f:dca1:8587 with SMTP id
 g26-20020a2eb0da000000b0027fdca18587mr9225729ljl.36.1673273013584; 
 Mon, 09 Jan 2023 06:03:33 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 x7-20020a05600c188700b003c701c12a17sm15363599wmp.12.2023.01.09.06.03.32
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 09 Jan 2023 06:03:33 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Havard Skinnemoen <hskinnemoen@google.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, Tyrone Ting <kfting@nuvoton.com>
Subject: [PATCH 05/14] hw/gpio/omap_gpio: Use CamelCase for TYPE_OMAP2_GPIO
 type name
Date: Mon,  9 Jan 2023 15:02:57 +0100
Message-Id: <20230109140306.23161-6-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230109140306.23161-1-philmd@linaro.org>
References: <20230109140306.23161-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::22a;
 envelope-from=philmd@linaro.org; helo=mail-lj1-x22a.google.com
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
X-TUID: LpeuZQsJLz9o

Following docs/devel/style.rst guidelines, rename omap2_gpif_s ->
Omap2GpioState. This also remove a use of 'struct' in the
DECLARE_INSTANCE_CHECKER() macro call.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/gpio/omap_gpio.c   | 20 ++++++++++----------
 include/hw/arm/omap.h |  9 ++++-----
 2 files changed, 14 insertions(+), 15 deletions(-)

diff --git a/hw/gpio/omap_gpio.c b/hw/gpio/omap_gpio.c
index 23502315ea..a3341d70f1 100644
--- a/hw/gpio/omap_gpio.c
+++ b/hw/gpio/omap_gpio.c
@@ -210,7 +210,7 @@ struct omap2_gpio_s {
     uint8_t delay;
 };
 
-struct omap2_gpif_s {
+struct Omap2GpioState {
     SysBusDevice parent_obj;
 
     MemoryRegion iomem;
@@ -274,7 +274,7 @@ static inline void omap2_gpio_module_int(struct omap2_gpio_s *s, int line)
 
 static void omap2_gpio_set(void *opaque, int line, int level)
 {
-    struct omap2_gpif_s *p = opaque;
+    Omap2GpioState *p = opaque;
     struct omap2_gpio_s *s = &p->modules[line >> 5];
 
     line &= 31;
@@ -601,7 +601,7 @@ static void omap_gpif_reset(DeviceState *dev)
 
 static void omap2_gpif_reset(DeviceState *dev)
 {
-    struct omap2_gpif_s *s = OMAP2_GPIO(dev);
+    Omap2GpioState *s = OMAP2_GPIO(dev);
     int i;
 
     for (i = 0; i < s->modulecount; i++) {
@@ -613,7 +613,7 @@ static void omap2_gpif_reset(DeviceState *dev)
 
 static uint64_t omap2_gpif_top_read(void *opaque, hwaddr addr, unsigned size)
 {
-    struct omap2_gpif_s *s = opaque;
+    Omap2GpioState *s = opaque;
 
     switch (addr) {
     case 0x00:	/* IPGENERICOCPSPL_REVISION */
@@ -642,7 +642,7 @@ static uint64_t omap2_gpif_top_read(void *opaque, hwaddr addr, unsigned size)
 static void omap2_gpif_top_write(void *opaque, hwaddr addr,
                                  uint64_t value, unsigned size)
 {
-    struct omap2_gpif_s *s = opaque;
+    Omap2GpioState *s = opaque;
 
     switch (addr) {
     case 0x00:	/* IPGENERICOCPSPL_REVISION */
@@ -699,7 +699,7 @@ static void omap_gpio_realize(DeviceState *dev, Error **errp)
 
 static void omap2_gpio_realize(DeviceState *dev, Error **errp)
 {
-    struct omap2_gpif_s *s = OMAP2_GPIO(dev);
+    Omap2GpioState *s = OMAP2_GPIO(dev);
     SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
     int i;
 
@@ -771,19 +771,19 @@ static const TypeInfo omap_gpio_info = {
     .class_init    = omap_gpio_class_init,
 };
 
-void omap2_gpio_set_iclk(omap2_gpif *gpio, omap_clk clk)
+void omap2_gpio_set_iclk(Omap2GpioState *gpio, omap_clk clk)
 {
     gpio->iclk = clk;
 }
 
-void omap2_gpio_set_fclk(omap2_gpif *gpio, uint8_t i, omap_clk clk)
+void omap2_gpio_set_fclk(Omap2GpioState *gpio, uint8_t i, omap_clk clk)
 {
     assert(i <= 5);
     gpio->fclk[i] = clk;
 }
 
 static Property omap2_gpio_properties[] = {
-    DEFINE_PROP_INT32("mpu_model", struct omap2_gpif_s, mpu_model, 0),
+    DEFINE_PROP_INT32("mpu_model", Omap2GpioState, mpu_model, 0),
     DEFINE_PROP_END_OF_LIST(),
 };
 
@@ -801,7 +801,7 @@ static void omap2_gpio_class_init(ObjectClass *klass, void *data)
 static const TypeInfo omap2_gpio_info = {
     .name          = TYPE_OMAP2_GPIO,
     .parent        = TYPE_SYS_BUS_DEVICE,
-    .instance_size = sizeof(struct omap2_gpif_s),
+    .instance_size = sizeof(Omap2GpioState),
     .class_init    = omap2_gpio_class_init,
 };
 
diff --git a/include/hw/arm/omap.h b/include/hw/arm/omap.h
index 29d2ed7e3b..9e30ba7ba2 100644
--- a/include/hw/arm/omap.h
+++ b/include/hw/arm/omap.h
@@ -108,16 +108,15 @@ DECLARE_INSTANCE_CHECKER(Omap1GpioState, OMAP1_GPIO,
                          TYPE_OMAP1_GPIO)
 
 #define TYPE_OMAP2_GPIO "omap2-gpio"
-DECLARE_INSTANCE_CHECKER(struct omap2_gpif_s, OMAP2_GPIO,
+typedef struct Omap2GpioState Omap2GpioState;
+DECLARE_INSTANCE_CHECKER(Omap2GpioState, OMAP2_GPIO,
                          TYPE_OMAP2_GPIO)
 
-typedef struct omap2_gpif_s omap2_gpif;
-
 /* TODO: clock framework (see above) */
 void omap_gpio_set_clk(Omap1GpioState *gpio, omap_clk clk);
 
-void omap2_gpio_set_iclk(omap2_gpif *gpio, omap_clk clk);
-void omap2_gpio_set_fclk(omap2_gpif *gpio, uint8_t i, omap_clk clk);
+void omap2_gpio_set_iclk(Omap2GpioState *gpio, omap_clk clk);
+void omap2_gpio_set_fclk(Omap2GpioState *gpio, uint8_t i, omap_clk clk);
 
 /* OMAP2 l4 Interconnect */
 struct omap_l4_s;
-- 
2.38.1

