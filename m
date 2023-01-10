Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp2994914ejc;
        Tue, 10 Jan 2023 00:38:31 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvD7dnxDN50NkNq8zSwE+ymIGFdLw6HftMfthSONZvAgOSBLXPrGMPxfE8Ysrr7GLsEAQlH
X-Received: by 2002:ad4:568d:0:b0:532:23db:c116 with SMTP id bd13-20020ad4568d000000b0053223dbc116mr16666234qvb.46.1673339911566;
        Tue, 10 Jan 2023 00:38:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673339911; cv=none;
        d=google.com; s=arc-20160816;
        b=EvCyYd2XSmXoV3cRA00v89SBrmOfCat5ccJAQ8cr5pJ5fCeIBBnpBbKlyWE0zKoTy4
         tHghl8saCInsYlq2+vCcVmETEs0rXiFHG+W69+dWZ3a0OI82cLWFc/K8U5R1sMQRBvZm
         up51Z3davFZvzshs1PuXglXVqe8/gw0s/rzTmh83RI2EuMgGLSTSq+AjKdjkt7g8j0Cq
         hGQBMfRUl63c8fVCVwbB9ZOjD48ibfiSn6eHUPgbKmifjWAxWzCpH3j+T9Ukq3V/NWL1
         oEmFpyiU79Uw9j0aHeA9Hdr/7dOZhTN/6DpEbr03hTwTs9PTA3lB7BwT/sXwWiwgq4JJ
         z4SA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=/ti15IV9GQmTjc2dtF2pUFnsEJ5Eg/sMdeoZUB/d2rk=;
        b=Kpq0V4bdkoPjNPxsM+tQsneAkP7ajToWZGxDWOwUV59V5MgrnAFC5xCBxhshwisRnJ
         EmhztDVDQfsZylQXLz/MkxjRYcwhyA58ccygRuE5J1sO0EXsgFOw14pEO0HrE+vWrnqh
         lhowqvmG0ltoqScOMpV1Y3vhXT2PO1dgieXc3q/M0f4ZBqkA/91YaZVrX3KwS9k2JMYy
         L1a9vDE9YXhaOnjxnkN6f4mYfPMwxXcDlNPZSXCkt/Tq0M4HBaXlhnGPloon3cMw5llY
         LmZWtwVY++dMVSL2bIBpSeFXDWwaNPb8wW5sBR1DwbTIXb9NIuh/JuAPMGyhEcHbxdjG
         R02Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vNOhICyD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l3-20020a37f903000000b006fa0fed9bdbsi5689605qkj.324.2023.01.10.00.38.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 10 Jan 2023 00:38:31 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vNOhICyD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pF9wi-0005Ys-Sy; Tue, 10 Jan 2023 03:25:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pF9wg-0005X3-OX
 for qemu-arm@nongnu.org; Tue, 10 Jan 2023 03:25:22 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pF9wf-0004Wg-76
 for qemu-arm@nongnu.org; Tue, 10 Jan 2023 03:25:22 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 p1-20020a05600c1d8100b003d8c9b191e0so9181041wms.4
 for <qemu-arm@nongnu.org>; Tue, 10 Jan 2023 00:25:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/ti15IV9GQmTjc2dtF2pUFnsEJ5Eg/sMdeoZUB/d2rk=;
 b=vNOhICyDsZR3mOCc5Zv7CZ1MbzPMBaS4IWceBba88/ctkdVbz6hkItpl6oDg6nRAWt
 6qe6qZNiYAL+Q6/7DmDidIow6A/nzJubVX9yOv5K+Su9C8QN/77t7X5j+9XwM8sVgcFT
 qa1TKcG19moivkp0pmROVamEAQdEt7phT7yY0MUpayk5iwk1Yw38IzdLl6VWJacz1JT6
 7Qa+nymP+FzzdlW2ixoBJCENtC0VS3jIH5AfT/HFauROJYGlvv5umEWZfNZ6rhXCp4vy
 iL0Y1s/YD+sGAxaDZU9OKXseKdN1giK+TCLmSRlaNSBAmIvjWz/eAc9pAHJu0tKxyOht
 ilGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/ti15IV9GQmTjc2dtF2pUFnsEJ5Eg/sMdeoZUB/d2rk=;
 b=6zKkyEUrRmZbTWMQZCwhzFcDp/OBbVUYYR2zsHFzuNqd5PGaU1Tfj8APmr7aQDvoxK
 B0jZme5WvzEGe8IKIK3FM3kWIdk0I7nvM2CmYiUk1X16LpnFpEnTZ0NqSm1b6Q3PFxQq
 T6v+tNWGLYBkUsNtsa9d8SvRu7baKb+d7WSf0Mr3lX4CIZ2u7rU5ci1TRQ+FHJ/zCGT5
 qbRNZ0e4g+mLDEmIFSur1PjCIbow4oV4ucGOtQxwdykUvUGtC5qbTaARPH6qGu9r107A
 v8zRIwJSn5m7hqgtjUfN/jvCIJ5k3Xqxe2EpVM7BDaFF5Z/l6Nb03U73NpEWXIjY7yXJ
 shQQ==
X-Gm-Message-State: AFqh2ko+blnJNkU6AaNH0iQx+hCE2xiQEBwlvBrIVRKBDV7N0LegWSQa
 gyrvK4ZZE33GSqAWW3eU1yHkOQ==
X-Received: by 2002:a05:600c:2318:b0:3c6:e63e:23e9 with SMTP id
 24-20020a05600c231800b003c6e63e23e9mr51419102wmo.24.1673339119781; 
 Tue, 10 Jan 2023 00:25:19 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 g14-20020a05600c310e00b003cf5ec79bf9sm15275356wmo.40.2023.01.10.00.25.19
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 10 Jan 2023 00:25:19 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v2 2/5] hw/i2c/versatile_i2c: Replace VersatileI2CState ->
 ArmSbconI2CState
Date: Tue, 10 Jan 2023 09:25:05 +0100
Message-Id: <20230110082508.24038-3-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230110082508.24038-1-philmd@linaro.org>
References: <20230110082508.24038-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
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
X-TUID: ulTs9eAlLWTh

In order to rename TYPE_VERSATILE_I2C as TYPE_ARM_SBCON_I2C
(the formal ARM naming), start renaming its state.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
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

