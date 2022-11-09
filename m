Received: by 2002:a17:906:80c3:b0:7ae:d8f:8937 with SMTP id a3csp383811ejx;
        Wed, 9 Nov 2022 08:16:07 -0800 (PST)
X-Google-Smtp-Source: AMsMyM7fMwpXWFq7lBS42Rrhvv8Pn3pBxDabbgxCLLLyGZ+V8A2DjAPvZ7qCTvhX+q5O8Voc04Au
X-Received: by 2002:a05:620a:1256:b0:6fa:2370:a7e8 with SMTP id a22-20020a05620a125600b006fa2370a7e8mr39375337qkl.374.1668010567788;
        Wed, 09 Nov 2022 08:16:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1668010567; cv=none;
        d=google.com; s=arc-20160816;
        b=PRucvR2uYEhX5Jself3EluU3/wW2zjpULCNVgdG0ZBkmORb2xdsLuiQA5lkYJ0ifDd
         Sq3zrxu0bMtxDMv61Jnx7ron9xPJz3jBgg8EZeuvgpze909Iaclv/QMphueWSl8YyF6/
         q8i4UPPwXwG8cT13fzjSlXmuPM5Q4+TwtRINTWugQhzemVI5bOTAr+9wJJ9W9qpyRabf
         t3Oju1xuRBztICkLEfho7ojfcqXWL/Xtzjljg8KlZ/o6GpSrp32MwwI/P49wi2ThtXzN
         eM1L0ImoFUI5OGN4KUNfHgCAn+LyofaU+Zg8FNXyKusZPwSpetkQwIeEnhlqtUNJ0Pl6
         7s4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=94zFxEDln0hVAcYsJJAZunaQ0vJlEEsykd+74gFzfm0=;
        b=V+2VXO0yMPsv6EhzKB+ZsAPtQb0TNa/nuZuAYSlNXmbhthej9Mes7mne+EwS/Bo1R1
         rlLi+jWBRkGu1DMhXI8wDVtlpg0rO+2PiXMW+sIKr41a1kwsvGBj3651bBy0QS3sUVsW
         MTkGf2K/LwiWe3FEjxEQ2RzT3mQcbTFiQ6zMZS1bB/LYo9cs/BZsPXJp+PiU9Zk6hSLT
         oWMaKQ06S5oh5DcHXZXtkPdjh0PXzRlB7BtiPvd30G1n5QYnib6SXsyB7iDIcKowB/g8
         kDRWWE+HuTI0cWm8zzGkp67RpqAbiD04gz7zUwbcP22DN+9sRSzPw/9mcxIieR/5uHON
         aqoA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DeIkwfa+;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j18-20020ac85f92000000b0039cea911e39si9950156qta.490.2022.11.09.08.16.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 09 Nov 2022 08:16:07 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DeIkwfa+;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osnjA-00018f-7q; Wed, 09 Nov 2022 11:15:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1osnj9-00017z-0p
 for qemu-devel@nongnu.org; Wed, 09 Nov 2022 11:14:59 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1osnj2-0007jg-VO
 for qemu-devel@nongnu.org; Wed, 09 Nov 2022 11:14:58 -0500
Received: by mail-wr1-x42d.google.com with SMTP id w14so26494208wru.8
 for <qemu-devel@nongnu.org>; Wed, 09 Nov 2022 08:14:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=94zFxEDln0hVAcYsJJAZunaQ0vJlEEsykd+74gFzfm0=;
 b=DeIkwfa++O/IXOpFeGHJ4/EpE2JrAypDl8sAqG4jkgb79MvB0yy8I0jn+PLisceDls
 cCYu55VBm940wKFskjlZ5ytCKkJ27/L8JUsMOo7/7b+kHBiZQtjUxW1L8/VH5LFy86hm
 vmfdasNWnrjU486fWdYa85DZk0lzy+3g6vqpHR0zg1gUEvwwLVZMSGFquec9FuYPhfgA
 wbkj3y+GKZ1rlgqmZiduqpZpeNg1tAJw+PPKNA0q75xV/RRLi7h3z+ALTkqkL2hbk+s5
 rmiQLgKt9awnqeW9irWhJGb+rpNODXNRvNKRGzGFyO5gNcyZJjv8a1ktRHIyH9Aq0lxK
 sToQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=94zFxEDln0hVAcYsJJAZunaQ0vJlEEsykd+74gFzfm0=;
 b=AP9n/90mCY7RCrCWuFwaUQOdu2x6Y2hZaOVfz9DjM6p04q8NkWMDzu+Yp1uiqagB/g
 aSYFvjFKfbYc01glByOUNUDk9IA1usPjZBZa2sr0A04BoASwQe/N0ikX2xqvogLZ3RLL
 AYuPmNef/R/EiQMeBGZzX4M/td1Oo64dVQnCTkZNlfVXzsFYwNlodjRD0Ckv8VjiCZiM
 7TjxORg/shfzRZah+HRYJYlegXXuQKskZRFZm/+/Pe83xLsQxrawSbyMEErLF+Nrnf9b
 LMfs87qipz5RNyi9MgzSJ+qFTwzNMT5dk9u9LosPSSwwh1DuHwRc2tOUdmzKnh1SxIWt
 HE9w==
X-Gm-Message-State: ACrzQf3BgKIx/I6+dlO5iOKUPAP5Bk4mqPA4XMAX8EQ8+GtdwQ3bjFOZ
 QPTUGOuIliU6Ttxi0Gl7tbMfJg==
X-Received: by 2002:a5d:6d8a:0:b0:236:6123:a8a5 with SMTP id
 l10-20020a5d6d8a000000b002366123a8a5mr37979088wrs.229.1668010490566; 
 Wed, 09 Nov 2022 08:14:50 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 p15-20020adfce0f000000b0022cbf4cda62sm16209186wrn.27.2022.11.09.08.14.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Nov 2022 08:14:50 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-8.0 4/9] hw/intc: Convert TYPE_ARM_GIC_KVM to 3-phase reset
Date: Wed,  9 Nov 2022 16:14:39 +0000
Message-Id: <20221109161444.3397405-5-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221109161444.3397405-1-peter.maydell@linaro.org>
References: <20221109161444.3397405-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: BojkA1Rqscfr

Now we have converted TYPE_ARM_GIC_COMMON, we can convert the
TYPE_ARM_GIC_KVM subclass to 3-phase reset.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/arm_gic_kvm.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/hw/intc/arm_gic_kvm.c b/hw/intc/arm_gic_kvm.c
index 7d2a13273a4..1d588946bce 100644
--- a/hw/intc/arm_gic_kvm.c
+++ b/hw/intc/arm_gic_kvm.c
@@ -38,7 +38,7 @@ DECLARE_OBJ_CHECKERS(GICState, KVMARMGICClass,
 struct KVMARMGICClass {
     ARMGICCommonClass parent_class;
     DeviceRealize parent_realize;
-    void (*parent_reset)(DeviceState *dev);
+    ResettablePhases parent_phases;
 };
 
 void kvm_arm_gic_set_irq(uint32_t num_irq, int irq, int level)
@@ -473,12 +473,14 @@ static void kvm_arm_gic_get(GICState *s)
     }
 }
 
-static void kvm_arm_gic_reset(DeviceState *dev)
+static void kvm_arm_gic_reset_hold(Object *obj)
 {
-    GICState *s = ARM_GIC_COMMON(dev);
+    GICState *s = ARM_GIC_COMMON(obj);
     KVMARMGICClass *kgc = KVM_ARM_GIC_GET_CLASS(s);
 
-    kgc->parent_reset(dev);
+    if (kgc->parent_phases.hold) {
+        kgc->parent_phases.hold(obj);
+    }
 
     if (kvm_arm_gic_can_save_restore(s)) {
         kvm_arm_gic_put(s);
@@ -593,6 +595,7 @@ static void kvm_arm_gic_realize(DeviceState *dev, Error **errp)
 static void kvm_arm_gic_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
+    ResettableClass *rc = RESETTABLE_CLASS(klass);
     ARMGICCommonClass *agcc = ARM_GIC_COMMON_CLASS(klass);
     KVMARMGICClass *kgc = KVM_ARM_GIC_CLASS(klass);
 
@@ -600,7 +603,8 @@ static void kvm_arm_gic_class_init(ObjectClass *klass, void *data)
     agcc->post_load = kvm_arm_gic_put;
     device_class_set_parent_realize(dc, kvm_arm_gic_realize,
                                     &kgc->parent_realize);
-    device_class_set_parent_reset(dc, kvm_arm_gic_reset, &kgc->parent_reset);
+    resettable_class_set_parent_phases(rc, NULL, kvm_arm_gic_reset_hold, NULL,
+                                       &kgc->parent_phases);
 }
 
 static const TypeInfo kvm_arm_gic_info = {
-- 
2.25.1

