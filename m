Received: by 2002:a17:906:80c3:b0:7ae:d8f:8937 with SMTP id a3csp384342ejx;
        Wed, 9 Nov 2022 08:16:44 -0800 (PST)
X-Google-Smtp-Source: AMsMyM6Sam0cSRWrRWNiQkL7bNhWym0KF9jvEXrH60odwRi8gI0vJPpRBk9o6WFlMbVOqiEl+oqW
X-Received: by 2002:a37:55c6:0:b0:6fa:62d:1556 with SMTP id j189-20020a3755c6000000b006fa062d1556mr1047039qkb.766.1668010604421;
        Wed, 09 Nov 2022 08:16:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1668010604; cv=none;
        d=google.com; s=arc-20160816;
        b=vGq/LMjvBxQ9o4hqpwSy0tGP+a/T2iRZx9ElGd9BIOdfB91S0I+4uNaoeh12YNPYLg
         0Nh7UPlCOGG98P4IPUfbxByOMKYvaf9rBAqJc6tNM5M3K38F1YmS0eh9QX2gO97wczsA
         sgScN6JYsxdhXu1aFkhQCeDdmEM6vJc1UzD9Bt8QFCrtHNfrRwKYxgVnJcJnN+QxeEIF
         E2tBIebE7qY9LJSzzwfSB8sb4bQPu99arja4IPHmiNHuNM6KBkDC49y11D8ss3IxKMbE
         E0281qlIE5mpw8TcrglPoHK+B59RGsM2Zfs2Xuca3EZakwOoTUniRb8xo5I42BeWoJ67
         23Rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=TkW7T5S7zm7opSYfPV3c9ibz6QYvnDa1N5Ybi4vqCbI=;
        b=VCeOl0G8pdj4vb8RRtv/6IsARGEg0eClpLAXLbO4r5Uap4KHwZaqsiCrC/LTkL85yV
         ZUflZ+/S7KIqswFSzh5bSFY8fmBv6r3/d7QUmNu0utoEdYUw9zWZiXMzGb2uDvwpw7ho
         HPY1qSkIIR+pBlcDd669eudYVBgRWJo1jOv/gTenqgXftVmbQOw4WLWRGD8IKLSVvLwr
         Xfe+suk5IIUGwGEUfQ0vkwzQ0o8NcebG96UOtdTun4/5UePSRM5KpRCQ2A+ZpNtcUM/D
         eLyRuYSze4uaGyaiLIgTh96uiU1BLBMIBIj/nohI1NmVEBUy3/6KfjUCz7kvf4VmeGbW
         AXaw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Ww8G8SPu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id fo12-20020ad45f0c000000b004b3f74336adsi8958001qvb.279.2022.11.09.08.16.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 09 Nov 2022 08:16:44 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Ww8G8SPu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1osnjB-00019k-SW; Wed, 09 Nov 2022 11:15:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1osnjA-00018P-LH
 for qemu-arm@nongnu.org; Wed, 09 Nov 2022 11:15:00 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1osnj0-0007hp-5I
 for qemu-arm@nongnu.org; Wed, 09 Nov 2022 11:14:59 -0500
Received: by mail-wr1-x42c.google.com with SMTP id a14so26511437wru.5
 for <qemu-arm@nongnu.org>; Wed, 09 Nov 2022 08:14:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=TkW7T5S7zm7opSYfPV3c9ibz6QYvnDa1N5Ybi4vqCbI=;
 b=Ww8G8SPu2ZcSeu389lYats1nfHf8H/jiGw+Y1AUKWgcF5FSFoATUL/+fnIKupfWtZ8
 poG4POP/tgE5CTKFZxV49FNeL0kynclNzFBqtFkNI3Oz2NQAMdYbAp/JOztn8nic3d+1
 fFqfXLGz5bZ3JBPWH9r+L1hhg+64TE4GC9rqVBa/oMruboGpipc8mIuj0tWtsww85Asg
 q9r6QsZUmYjCPBTwT7lEHxvqu418AfS9rIpRroIPp1ktviIOICmhpTfhw7wVvYgliWDu
 HFigr2yn4lYRqap0bEaFQNtNqQdkCM8Zsco+X6eTc/s/Zip/wkLkKKOYifdM6HE44FWc
 +dBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TkW7T5S7zm7opSYfPV3c9ibz6QYvnDa1N5Ybi4vqCbI=;
 b=ZVnErQWXyMM3S2Ng9VekSOMChVFuF64pSxi9NixoOG6boX0YpyGUpxuey3jqHjl50h
 Y83yZbVljPNqLxSthRIxnelffA9rYwx6VPZOK/S40KApOCcMTroBpTs4/LN7htH3ppHy
 KQrwqLuqPJcQOC9NBjeijE5y8VeImbs1mTVOWwO5Wo7vNU4oJpmke1XYILrH6jL1BqTB
 VibY7fgpNJ5zzE7HiBhbrr8F9VrOgm+e5732gLmeHqhyFmALIGIhhhLaKBQYJK+LMoUQ
 gpryikf3tU35GFLmF/3w3cN5afhojD00n1wTex8/1cphcunBgNdpBM33KGGob+0/jV75
 81cw==
X-Gm-Message-State: ACrzQf0JpSl4ZN9SW+njjBEecIxAwJ9McAtq+PpoSJPcg+4ST8IWstej
 lcu+WdX+ZOhzH+RqZC++mkJYmwbOdbVI5w==
X-Received: by 2002:adf:f687:0:b0:236:481f:83a6 with SMTP id
 v7-20020adff687000000b00236481f83a6mr39697164wrp.342.1668010488625; 
 Wed, 09 Nov 2022 08:14:48 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 p15-20020adfce0f000000b0022cbf4cda62sm16209186wrn.27.2022.11.09.08.14.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Nov 2022 08:14:48 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-8.0 2/9] hw/arm: Convert TYPE_ARM_SMMUV3 to 3-phase reset
Date: Wed,  9 Nov 2022 16:14:37 +0000
Message-Id: <20221109161444.3397405-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221109161444.3397405-1-peter.maydell@linaro.org>
References: <20221109161444.3397405-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42c.google.com
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
X-TUID: mdi4tlmjpVQF

Convert the TYPE_ARM_SMMUV3 device to 3-phase reset.  The legacy
reset method doesn't do anything that's invalid in the hold phase, so
the conversion only requires changing it to a hold phase method, and
using the 3-phase versions of the "save the parent reset method and
chain to it" code.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/arm/smmuv3.h |  2 +-
 hw/arm/smmuv3.c         | 12 ++++++++----
 2 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/include/hw/arm/smmuv3.h b/include/hw/arm/smmuv3.h
index c641e60735e..f1921fdf9e7 100644
--- a/include/hw/arm/smmuv3.h
+++ b/include/hw/arm/smmuv3.h
@@ -77,7 +77,7 @@ struct SMMUv3Class {
     /*< public >*/
 
     DeviceRealize parent_realize;
-    DeviceReset   parent_reset;
+    ResettablePhases parent_phases;
 };
 
 #define TYPE_ARM_SMMUV3   "arm-smmuv3"
diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
index daa80e9c7b6..955b89c8d59 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -1431,12 +1431,14 @@ static void smmu_init_irq(SMMUv3State *s, SysBusDevice *dev)
     }
 }
 
-static void smmu_reset(DeviceState *dev)
+static void smmu_reset_hold(Object *obj)
 {
-    SMMUv3State *s = ARM_SMMUV3(dev);
+    SMMUv3State *s = ARM_SMMUV3(obj);
     SMMUv3Class *c = ARM_SMMUV3_GET_CLASS(s);
 
-    c->parent_reset(dev);
+    if (c->parent_phases.hold) {
+        c->parent_phases.hold(obj);
+    }
 
     smmuv3_init_regs(s);
 }
@@ -1520,10 +1522,12 @@ static void smmuv3_instance_init(Object *obj)
 static void smmuv3_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
+    ResettableClass *rc = RESETTABLE_CLASS(klass);
     SMMUv3Class *c = ARM_SMMUV3_CLASS(klass);
 
     dc->vmsd = &vmstate_smmuv3;
-    device_class_set_parent_reset(dc, smmu_reset, &c->parent_reset);
+    resettable_class_set_parent_phases(rc, NULL, smmu_reset_hold, NULL,
+                                       &c->parent_phases);
     c->parent_realize = dc->realize;
     dc->realize = smmu_realize;
 }
-- 
2.25.1

