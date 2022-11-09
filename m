Received: by 2002:a17:906:80c3:b0:7ae:d8f:8937 with SMTP id a3csp384457ejx;
        Wed, 9 Nov 2022 08:16:53 -0800 (PST)
X-Google-Smtp-Source: AMsMyM7pe2GJ1FZeD0KPrrJTf2Di0Yb8BpkQnECSvQR9AokC4hPyRKVPAR2pB4cCgucjg2WTBsuY
X-Received: by 2002:ad4:5c8c:0:b0:4b9:fe5:e7a8 with SMTP id o12-20020ad45c8c000000b004b90fe5e7a8mr55018092qvh.99.1668010613210;
        Wed, 09 Nov 2022 08:16:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1668010613; cv=none;
        d=google.com; s=arc-20160816;
        b=P06jNuYAgj4Urg+Q7M9SORy3mWSS9nS8u9w4eHEInEJfZzlLz4vwfNuKdfElGcgLcl
         qNneLMG5gxVrUs/XuhOVmD3vlHPHg0/qmfckUH5TAULAcoiVEzjpMF3u9kOyPI7sAKtW
         ey4bOOWPBXD2lQ+C8Vz94ip3tFOuOC/vcgCLHE91yUHH/mEWBPnGO77BJEObClpEKKmM
         aVlhEn5qh2OGXT2MmPn1tsABMBJYn05yl4Q0sGT48KDaM4k72GSxRT4e07nhQlleA7dX
         qjFQUH+gSF5p71tVDrd4FqtMwbSqsM7iOkJ0RiuPHtZCoohtj/JC2xN5HTKm+szK68A9
         3Q+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=ca3S+uVbBJTLXkcc5so3RKCbYfZ7cQitrV38GQNpu6s=;
        b=Rn+LVYtRc1jpGGHZ3GnFCx1YhMAztNJKoM+XFl3cihiE5owqPuN75sDsm2w3KsVNVL
         yI3apqOr/CGQolmxvN/ypbLPZe+xAJwkF43UekgvlYNBPYVecFY0rGQV9Ad2vx8h/bqQ
         J6qypVaw5wB+e5YKkSiY2651CVH8axqU17l05zOSSrI16hItptDxH7KYDvu2INnuSfTN
         qzdZtSjTK6oz/+mFbmckuUCgt/lh0hXnodg1xPeijUVloVYXMy/VVXbpiE9yUMqSb/hm
         Vtb9dG9mdbf1ZlZueP+lgYGdUpJP2VAFDtY1xlIuE8kkZCJzSDp3Hp/xWQBhE8FCcwyY
         8BIw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UGq0qXcb;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ch14-20020a05622a40ce00b0039cbf67b278si8755510qtb.309.2022.11.09.08.16.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 09 Nov 2022 08:16:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UGq0qXcb;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osnjA-00018p-PW; Wed, 09 Nov 2022 11:15:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1osnj9-00018O-Jj
 for qemu-devel@nongnu.org; Wed, 09 Nov 2022 11:14:59 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1osnj4-0007ry-Bx
 for qemu-devel@nongnu.org; Wed, 09 Nov 2022 11:14:59 -0500
Received: by mail-wr1-x432.google.com with SMTP id w14so26494342wru.8
 for <qemu-devel@nongnu.org>; Wed, 09 Nov 2022 08:14:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=ca3S+uVbBJTLXkcc5so3RKCbYfZ7cQitrV38GQNpu6s=;
 b=UGq0qXcbl2HlNTdkgFa5D1jeNMUB9ZJ1xrdzsK4RAMl48TSW0Tlurz43wCkPCjzpy2
 nBHBuSchvHFh6gkomwOq0fBNBlGYX7U8nwVi9myj+zshOpXis+1mmIWw2zX7IZx9QmlR
 Mr64OQ7pT8bRV8L8/eG18Uw2JhQjYEbPjkshSjAjr4auLjO2cw/HmfZgaZGtvn0JVuKT
 cl3+k6tBzSktghFknowxBA03r+w5jYK7BqgyNaN+1Dx7QjFBmDc0mTKFxfE25fxsPH8n
 WtsS+vY8lN294+B9SgJSDu9SyLNMJZ/K+KkUCzm9UYUmdtNjLsGnwjFLMWfvZR0fq6cS
 4Jrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ca3S+uVbBJTLXkcc5so3RKCbYfZ7cQitrV38GQNpu6s=;
 b=kWTUZAFgBQJboqIRvjTfhVWKREW/kTlsHOiOd+PHzRZ8bMHGc/atn8uQwjSBeVmu5+
 Vno4QnPDtqPpp+Mo0c7kczKoxEHrLEJxJ3FwKT0o2k82J9eQyvBePXV5Oq27DcQfZL+I
 7F0KTGQn/ZdEjtIJyZNOr6pRwKQw+EfrZdgGNEjV04TFCdi7UpMKyEMaat6VQWFiR5wM
 JQyNrV23FeDcDjA3wreevek5J+hBC3rvTTCj70aGngjoWp6wpLzvh1Wz3Z/LD24I955z
 PpunyODPBJEHUwN/lVDr9k1BDZV9tDI4E/pNkMnYq1HQ3p1QjuJm20HnUsCKWwj5h0fO
 IQyQ==
X-Gm-Message-State: ACrzQf03Kv5bmouUePDTC0ohWyGsR4lIWP1RbjvsyNhRXkZg9ATG/irk
 am1xzqgW9IYvV6PPDDEBhrUIsA==
X-Received: by 2002:adf:e0c8:0:b0:236:d9e5:4a51 with SMTP id
 m8-20020adfe0c8000000b00236d9e54a51mr31991642wri.168.1668010492632; 
 Wed, 09 Nov 2022 08:14:52 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 p15-20020adfce0f000000b0022cbf4cda62sm16209186wrn.27.2022.11.09.08.14.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Nov 2022 08:14:52 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-8.0 6/9] hw/intc: Convert TYPE_KVM_ARM_GICV3 to 3-phase
 reset
Date: Wed,  9 Nov 2022 16:14:41 +0000
Message-Id: <20221109161444.3397405-7-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221109161444.3397405-1-peter.maydell@linaro.org>
References: <20221109161444.3397405-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x432.google.com
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
X-TUID: NZPvI+/9nJmi

Convert the TYPE_KVM_ARM_GICV3 device to 3-phase reset.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/arm_gicv3_kvm.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/hw/intc/arm_gicv3_kvm.c b/hw/intc/arm_gicv3_kvm.c
index 3ca643ecba4..72ad916d3db 100644
--- a/hw/intc/arm_gicv3_kvm.c
+++ b/hw/intc/arm_gicv3_kvm.c
@@ -77,7 +77,7 @@ DECLARE_OBJ_CHECKERS(GICv3State, KVMARMGICv3Class,
 struct KVMARMGICv3Class {
     ARMGICv3CommonClass parent_class;
     DeviceRealize parent_realize;
-    void (*parent_reset)(DeviceState *dev);
+    ResettablePhases parent_phases;
 };
 
 static void kvm_arm_gicv3_set_irq(void *opaque, int irq, int level)
@@ -703,14 +703,16 @@ static void arm_gicv3_icc_reset(CPUARMState *env, const ARMCPRegInfo *ri)
     c->icc_ctlr_el1[GICV3_S] = c->icc_ctlr_el1[GICV3_NS];
 }
 
-static void kvm_arm_gicv3_reset(DeviceState *dev)
+static void kvm_arm_gicv3_reset_hold(Object *obj)
 {
-    GICv3State *s = ARM_GICV3_COMMON(dev);
+    GICv3State *s = ARM_GICV3_COMMON(obj);
     KVMARMGICv3Class *kgc = KVM_ARM_GICV3_GET_CLASS(s);
 
     DPRINTF("Reset\n");
 
-    kgc->parent_reset(dev);
+    if (kgc->parent_phases.hold) {
+        kgc->parent_phases.hold(obj);
+    }
 
     if (s->migration_blocker) {
         DPRINTF("Cannot put kernel gic state, no kernel interface\n");
@@ -890,6 +892,7 @@ static void kvm_arm_gicv3_realize(DeviceState *dev, Error **errp)
 static void kvm_arm_gicv3_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
+    ResettableClass *rc = RESETTABLE_CLASS(klass);
     ARMGICv3CommonClass *agcc = ARM_GICV3_COMMON_CLASS(klass);
     KVMARMGICv3Class *kgc = KVM_ARM_GICV3_CLASS(klass);
 
@@ -897,7 +900,8 @@ static void kvm_arm_gicv3_class_init(ObjectClass *klass, void *data)
     agcc->post_load = kvm_arm_gicv3_put;
     device_class_set_parent_realize(dc, kvm_arm_gicv3_realize,
                                     &kgc->parent_realize);
-    device_class_set_parent_reset(dc, kvm_arm_gicv3_reset, &kgc->parent_reset);
+    resettable_class_set_parent_phases(rc, NULL, kvm_arm_gicv3_reset_hold, NULL,
+                                       &kgc->parent_phases);
 }
 
 static const TypeInfo kvm_arm_gicv3_info = {
-- 
2.25.1

