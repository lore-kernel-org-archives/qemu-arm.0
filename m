Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp2107834ejc;
        Mon, 9 Jan 2023 01:18:53 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvNFZpafvTfOvomK9SthO95UADUTUmj508mF6GhWcVHY8R1M0HlsKDrMjbgu3veP451GA4Z
X-Received: by 2002:a05:6214:4c1b:b0:532:213f:a9f2 with SMTP id qh27-20020a0562144c1b00b00532213fa9f2mr12235648qvb.35.1673255933607;
        Mon, 09 Jan 2023 01:18:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673255933; cv=none;
        d=google.com; s=arc-20160816;
        b=VbrHsQV66M+8JO0nXyonXyaEFqL9JhH2ZctapFWqfBKR/xM3SzjN8ARinonUe/jUyK
         oz4NyK3XGPjv9iMBFR4zFqySsO7PqYs9BjRs7J9gbwe1xbhYs3MXViKTI2LoG/cl3BBm
         1gVTHIwsl1EntiZ8oJ0oDq/oE0xoaDawHX8vAAlsj2gQ//G5965o84uessTBntfj0d1y
         x1LlYrK6Ih/F3GQMjlYuKiY3l/SKGSefoegBUFwLbhrki/11YXJ7FsN2r3LjvxYiOKP8
         UDteG6PkPQBEd2HssCGC99fvozof8PuW+hmI7sAvZ2VDKX49YEcsz4qguYf1Ouc3YDEW
         K/2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=OIe7Y6R4ZGYTW1AgsVF/JtMshtc/HMe6xazQxLy6+Ac=;
        b=IbxnLNzA9sRwZ241LzT4J3Ymtfs2CRhdh+nNkuKclX6BF8xj/FmyWXogZtwrCCqAEF
         HUwR8oAJTqP415bv1sHV7EUimmxYz23oqI08vVB7sCrR9O/B+T7rvXg/+GBQAAfSiHfS
         lSJ+av55PBMsnGa+jQPG/LPrE9cyngEpnecHRtypDGei8S/OD76h3FOI6yacy+uOs7Ao
         k18lOpygMTgZECrJwnXwc9xCN52yBiBOHQjahPEbTCR2CP75B0OIapG9nJn3kOAl6/pu
         nS3mKh+RLeRwkA01/qVG7fT9WOAkzt07yEXkKiGdXkuVnEIhQQ2f/AginNdeU4lOeHvN
         IypA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xSR5sayn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id iu3-20020ad45cc3000000b0052fe5539dd3si4330838qvb.304.2023.01.09.01.18.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 09 Jan 2023 01:18:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xSR5sayn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pEoIF-0000vk-5C; Mon, 09 Jan 2023 04:18:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pEoIC-0000ut-Bd
 for qemu-arm@nongnu.org; Mon, 09 Jan 2023 04:18:08 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pEoIA-0002kD-Ln
 for qemu-arm@nongnu.org; Mon, 09 Jan 2023 04:18:08 -0500
Received: by mail-wr1-x433.google.com with SMTP id h16so7446933wrz.12
 for <qemu-arm@nongnu.org>; Mon, 09 Jan 2023 01:18:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OIe7Y6R4ZGYTW1AgsVF/JtMshtc/HMe6xazQxLy6+Ac=;
 b=xSR5saynuC3VTXQ4y7L+weOHfsYJEuC1wJ91CRxG0aTNTheGzmqlgeXoy+gxc0p7RK
 DfxtB+1pccm1mmYYecT9I3dbI6kCLC5KxoHPC+uBsv8W35+ZxkgQl73dHoRnlwoVGhQ4
 FH+Wn8Zsl7mvrK+Jq440iVNlRHYLw3MwpA10AWt2qic3Zs+Hk95FQaASpEQVkgsKc+nf
 Rd7rsTAbRW0K0jQa4dBdpK0vCIT3LKOvu3Rzf7ZXtjrcq60ogFtnUfIMvTlNiqbM1m51
 vsMZs1pTtl9SyDIUYL/Uugteh+iQn9tkzWLrm/8lXrDeCTiCtJ+3wHeTs9dwqF5Y9V51
 XSsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OIe7Y6R4ZGYTW1AgsVF/JtMshtc/HMe6xazQxLy6+Ac=;
 b=lv/LxfO6HzImDeQ+M2+hVjGYNoKOGGWwtIfkBYUus3EfqFFHCSEzUkm3AlUJ2TfSXc
 026bZTwUiB2Jpmn7V5bglZN+SBYP4SowMW87NpKNk9kcExWZDNJGtVtIOMZ0BVRsSQyr
 5+0q6DHP+ppNmP0RLOW7FqOB7WFUN1Fa+djCb+VoZjryOdfzBgnsLiVbEsiMqEFBjX0T
 uVNY0prtfpTnWSK6xspHD63Ux+jWubS1/F0bVShOs52GTXlQx7vyyZ1eUIsxcCoUrcqj
 uc/uH6BAbZIAmuDuDmi2F2mBVWeUpldD9NO5HTgJmxI4AEOiv/Vu2dVQBM+zhdqWnUUb
 6w1g==
X-Gm-Message-State: AFqh2kqaump4WQsLLmuvboTysc/lIRyh5O19G0d4t6ClJvi1oVLQRC/U
 lYXMWPGq3zlhWglrM+SCqwquZw==
X-Received: by 2002:adf:cf11:0:b0:242:6777:de38 with SMTP id
 o17-20020adfcf11000000b002426777de38mr39891631wrj.10.1673255885267; 
 Mon, 09 Jan 2023 01:18:05 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 q11-20020adf9dcb000000b00268aae5fb5bsm8124614wre.3.2023.01.09.01.18.04
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 09 Jan 2023 01:18:04 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 2/5] hw/i2c/versatile_i2c: Replace VersatileI2CState ->
 ArmSbconI2CState
Date: Mon,  9 Jan 2023 10:17:51 +0100
Message-Id: <20230109091754.79499-3-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230109091754.79499-1-philmd@linaro.org>
References: <20230109091754.79499-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x433.google.com
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
X-TUID: nKXu6j+XOXIb

In order to rename TYPE_VERSATILE_I2C as TYPE_ARM_SBCON_I2C
(the formal ARM naming), start renaming its state.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/i2c/versatile_i2c.c         | 10 +++++-----
 include/hw/i2c/arm_sbcon_i2c.h |  3 +--
 2 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/hw/i2c/versatile_i2c.c b/hw/i2c/versatile_i2c.c
index 52a650f45e..ee095762e5 100644
--- a/hw/i2c/versatile_i2c.c
+++ b/hw/i2c/versatile_i2c.c
@@ -30,7 +30,7 @@
 #include "qom/object.h"
 
 typedef ArmSbconI2CState VersatileI2CState;
-DECLARE_INSTANCE_CHECKER(VersatileI2CState, VERSATILE_I2C,
+DECLARE_INSTANCE_CHECKER(ArmSbconI2CState, VERSATILE_I2C,
                          TYPE_VERSATILE_I2C)
 
 
@@ -45,7 +45,7 @@ REG32(CONTROL_CLR, 4)
 static uint64_t versatile_i2c_read(void *opaque, hwaddr offset,
                                    unsigned size)
 {
-    VersatileI2CState *s = opaque;
+    ArmSbconI2CState *s = opaque;
 
     switch (offset) {
     case A_CONTROL_SET:
@@ -60,7 +60,7 @@ static uint64_t versatile_i2c_read(void *opaque, hwaddr offset,
 static void versatile_i2c_write(void *opaque, hwaddr offset,
                                 uint64_t value, unsigned size)
 {
-    VersatileI2CState *s = opaque;
+    ArmSbconI2CState *s = opaque;
 
     switch (offset) {
     case A_CONTROL_SET:
@@ -86,7 +86,7 @@ static const MemoryRegionOps versatile_i2c_ops = {
 static void versatile_i2c_init(Object *obj)
 {
     DeviceState *dev = DEVICE(obj);
-    VersatileI2CState *s = VERSATILE_I2C(obj);
+    ArmSbconI2CState *s = VERSATILE_I2C(obj);
     SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
     I2CBus *bus;
 
@@ -100,7 +100,7 @@ static void versatile_i2c_init(Object *obj)
 static const TypeInfo versatile_i2c_info = {
     .name          = TYPE_VERSATILE_I2C,
     .parent        = TYPE_SYS_BUS_DEVICE,
-    .instance_size = sizeof(VersatileI2CState),
+    .instance_size = sizeof(ArmSbconI2CState),
     .instance_init = versatile_i2c_init,
 };
 
diff --git a/include/hw/i2c/arm_sbcon_i2c.h b/include/hw/i2c/arm_sbcon_i2c.h
index f54d1e5413..0101422d9d 100644
--- a/include/hw/i2c/arm_sbcon_i2c.h
+++ b/include/hw/i2c/arm_sbcon_i2c.h
@@ -21,8 +21,7 @@
 #define TYPE_ARM_SBCON_I2C TYPE_VERSATILE_I2C
 
 typedef struct ArmSbconI2CState ArmSbconI2CState;
-DECLARE_INSTANCE_CHECKER(ArmSbconI2CState, ARM_SBCON_I2C,
-                         TYPE_ARM_SBCON_I2C)
+DECLARE_INSTANCE_CHECKER(ArmSbconI2CState, ARM_SBCON_I2C, TYPE_ARM_SBCON_I2C)
 
 struct ArmSbconI2CState {
     /*< private >*/
-- 
2.38.1

