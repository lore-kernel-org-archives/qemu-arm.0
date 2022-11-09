Received: by 2002:a17:906:80c3:b0:7ae:d8f:8937 with SMTP id a3csp385272ejx;
        Wed, 9 Nov 2022 08:17:54 -0800 (PST)
X-Google-Smtp-Source: AMsMyM6ZTsQJ4p3Xt1lGdGFmhFIBatC6fVfSHP28qzRCK6LxG9ZNwkuWQuTGAZ9uqL5el4Cpd424
X-Received: by 2002:a05:6214:258f:b0:4bb:96dc:9081 with SMTP id fq15-20020a056214258f00b004bb96dc9081mr56209230qvb.56.1668010674483;
        Wed, 09 Nov 2022 08:17:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1668010674; cv=none;
        d=google.com; s=arc-20160816;
        b=aX9thzf8hgDCv0U/acO1DYRB7qNQfvOJYXBC4Ry/FAhXKSpBdvAIywc4DCGAKIvW0E
         pUZ5c+epPXXY5HxJCmc6wOeM5HihBI+grbm+WDbYnOymN2uDTVZ+EDMKIMSyYkniHO1J
         k9REYobcrpOpLfIb0oE18es1NS7SapoyzO/SXzWXJPT6jBqduojqKGGT13HFiGx5AusY
         BLPG2J7SfuK+xzjapjPctUvX6Q7UH1H1L+EUT/spri/64Hxd1xUTZIEcZWTbBQIRW+wa
         juS6LRIQJ7p2pMjwwj2d410/64+gFaMW2fOsS6NR9t/ktYriUNR3xgsSbJSENi1BpiEv
         PVWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=MhXy5FBRE7GB4BVHsReuiuVjoZnsxoIVvRZtpjaxie8=;
        b=ZxEkpYTjz8hOth0XvIjaH3+FdE79aPJoc7cnkIFGc+Qe58bYUTaAii3ODgae5NVAKt
         lOg80rskSDak3Po8PgF4U7NuTNeBntoG2HTDizL/GqO8HYfesJkpZFgKpAhxxpRm6Whz
         PLQDz2skxXpqs+daA9DMp4E3nInhYolezjjyv7REnyAOMj8lZznw3vKCz/RgG60w+O4w
         TwB5bHrDCClSBcPruPzNJFguDeuQJJnuf5XS+FGBaKQ4i5F3ILfkbFE5rWXBtmudgz2J
         hNcUxyKsI4YNbV76Gv2UF9D/XbXvN2WwxKU99WBASL7TNqTd4UtfjrxTz5LNMokfjL8N
         3fhg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hUGj8q8O;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l19-20020ac848d3000000b00399c50c71c2si8429900qtr.12.2022.11.09.08.17.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 09 Nov 2022 08:17:54 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hUGj8q8O;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1osnjV-0001JI-0a; Wed, 09 Nov 2022 11:15:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1osnjT-0001J2-54
 for qemu-arm@nongnu.org; Wed, 09 Nov 2022 11:15:19 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1osnj7-0007wb-8O
 for qemu-arm@nongnu.org; Wed, 09 Nov 2022 11:15:18 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 h133-20020a1c218b000000b003cf4d389c41so1581048wmh.3
 for <qemu-arm@nongnu.org>; Wed, 09 Nov 2022 08:14:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=MhXy5FBRE7GB4BVHsReuiuVjoZnsxoIVvRZtpjaxie8=;
 b=hUGj8q8O+4hvifMlG0jW7Iw0N0b8+DEurQN/UXJDLq6Gp7v152t4gjzX+zuhZjfjce
 N2u7LCHUUl4VH1SZ+2Op2Hn71TX+JoUDDnjlzENFPZH8rVxGAOggYUoLVF/foYTychst
 WubtShLpNo9ce9UmEvyjloNEK3CgiV5rd6MSdrXIauNUpaoYHHcVxLx8mc6T7be9aFS+
 GuEOQyuNYQvlWBJj7N9IGQxe+q6yqZaKWdirguz64OsCr4oweZWK0r2XsImIxd8Y0Dry
 Qqf/iCmHnhvCgCAl8TUghZRkf9+VxGvCVqD2+mpVW9ZVFdqJhAD7DJTzJFVHwh/mtnB4
 FLjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MhXy5FBRE7GB4BVHsReuiuVjoZnsxoIVvRZtpjaxie8=;
 b=wB7/NV0sfyPTQGMfYNpUEjVA7KP/j4pR7MdzE9m3E8Za+R0KDvm9Rv8Dpx6vUN+sGd
 Ov6g0t1pQ06MhyBSR+9ye1A6/IVhQy3FGJw4wQbWS4nq0PvJ8mQiVRCrz0bM59URH5x3
 fUD+2U9g4ndnqiPrE4MI99GTRYjf0HFRNP1L40i8z98nkNwSkVOAXY5OZcvtiwMFT423
 uxueNN3fPKEuXpTB91w9J8gps9g5zGfUblJm03qNHRbGEvLs/Kd4qgOvVdcjropgF8LR
 7H2V7x346e56lstpo805bUNu05Vo7AoJj6BNrRQI3mkRh7T9rtAkoO92GUMZpKfiJX+g
 mfTA==
X-Gm-Message-State: ACrzQf01dMGs4mlJQfj0BrqFfpIMdXsq1cAJKwIDB4PV52Iy9BtyzeF3
 KRJkiIgOV3t/ib2l7o5KdaENJyOamwCU6A==
X-Received: by 2002:a05:600c:474a:b0:3cf:a197:8039 with SMTP id
 w10-20020a05600c474a00b003cfa1978039mr14928912wmo.179.1668010495889; 
 Wed, 09 Nov 2022 08:14:55 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 p15-20020adfce0f000000b0022cbf4cda62sm16209186wrn.27.2022.11.09.08.14.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Nov 2022 08:14:55 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-8.0 9/9] hw/intc: Convert TYPE_KVM_ARM_ITS to 3-phase reset
Date: Wed,  9 Nov 2022 16:14:44 +0000
Message-Id: <20221109161444.3397405-10-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221109161444.3397405-1-peter.maydell@linaro.org>
References: <20221109161444.3397405-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
X-TUID: 4PtzoaSaj9OW

Convert the TYPE_KVM_ARM_ITS device to 3-phase reset.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/arm_gicv3_its_kvm.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/hw/intc/arm_gicv3_its_kvm.c b/hw/intc/arm_gicv3_its_kvm.c
index 529c7bd4946..7eda9fb86ea 100644
--- a/hw/intc/arm_gicv3_its_kvm.c
+++ b/hw/intc/arm_gicv3_its_kvm.c
@@ -37,7 +37,7 @@ DECLARE_OBJ_CHECKERS(GICv3ITSState, KVMARMITSClass,
 
 struct KVMARMITSClass {
     GICv3ITSCommonClass parent_class;
-    void (*parent_reset)(DeviceState *dev);
+    ResettablePhases parent_phases;
 };
 
 
@@ -197,13 +197,15 @@ static void kvm_arm_its_post_load(GICv3ITSState *s)
                       GITS_CTLR, &s->ctlr, true, &error_abort);
 }
 
-static void kvm_arm_its_reset(DeviceState *dev)
+static void kvm_arm_its_reset_hold(Object *obj)
 {
-    GICv3ITSState *s = ARM_GICV3_ITS_COMMON(dev);
+    GICv3ITSState *s = ARM_GICV3_ITS_COMMON(obj);
     KVMARMITSClass *c = KVM_ARM_ITS_GET_CLASS(s);
     int i;
 
-    c->parent_reset(dev);
+    if (c->parent_phases.hold) {
+        c->parent_phases.hold(obj);
+    }
 
     if (kvm_device_check_attr(s->dev_fd, KVM_DEV_ARM_VGIC_GRP_CTRL,
                                KVM_DEV_ARM_ITS_CTRL_RESET)) {
@@ -241,12 +243,14 @@ static Property kvm_arm_its_props[] = {
 static void kvm_arm_its_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
+    ResettableClass *rc = RESETTABLE_CLASS(klass);
     GICv3ITSCommonClass *icc = ARM_GICV3_ITS_COMMON_CLASS(klass);
     KVMARMITSClass *ic = KVM_ARM_ITS_CLASS(klass);
 
     dc->realize = kvm_arm_its_realize;
     device_class_set_props(dc, kvm_arm_its_props);
-    device_class_set_parent_reset(dc, kvm_arm_its_reset, &ic->parent_reset);
+    resettable_class_set_parent_phases(rc, NULL, kvm_arm_its_reset_hold, NULL,
+                                       &ic->parent_phases);
     icc->send_msi = kvm_its_send_msi;
     icc->pre_save = kvm_arm_its_pre_save;
     icc->post_load = kvm_arm_its_post_load;
-- 
2.25.1

