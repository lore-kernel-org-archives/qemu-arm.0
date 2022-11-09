Received: by 2002:a17:906:80c3:b0:7ae:d8f:8937 with SMTP id a3csp385114ejx;
        Wed, 9 Nov 2022 08:17:43 -0800 (PST)
X-Google-Smtp-Source: AMsMyM4xcUAAKE7kmTHRrtU+VdG2+tleHdUBiYyqjBF1BxLpDFCmfB3Zjh3HVI6BMBuqeId5oiKX
X-Received: by 2002:a05:622a:1313:b0:3a5:7341:88fc with SMTP id v19-20020a05622a131300b003a5734188fcmr19972879qtk.220.1668010662904;
        Wed, 09 Nov 2022 08:17:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1668010662; cv=none;
        d=google.com; s=arc-20160816;
        b=yafpZlVgvh/7Fidcpvf9R0WIwx2jqVD8xmQytlVGFLWW8mRe7wf+iCVYEXYJWSU2IJ
         1V6uC0VGMclvJxkVwgrJyT33n+gA6kS46cC4uSgI1W50K7FTtC0cJi0gQVyyrKyoNFHT
         d1XwJxQh91bqNmgbCT9Kic9qk/lPiMSjKf5xDA8l4FpsU8VY3tYgOo+3Aj0p0AKNGvju
         NNZ3h0zxNezuMTytSSSBeUPap2zSu4mvdjZOLZZwiaKM8JT7BDW9yNkMhyn9rNqouJ3c
         wuL3Uf5MyJiTWYaCLMgGlTocs03cIACHJj7YTIIud/S1zrcO8eD2AxB5alpks9E7Oj1H
         VEVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=kuIn7I6CLp9VWQfNOdiiRV8ytBoQboktwZZOEvzvoPA=;
        b=wwM1zbpDpjysrtIOmg/L7xqA8klUZajFnS9RVF90SAYwueqOQhdVsYaUHpxV5luX1J
         qwgscED6ydQTmjXjOiqa/fAfWu44VvFZf5+E2/bTV5k/8QtpuB6SSujB59vQTkUKn0TX
         UQRQZIGLu6pqAWvk/3Hu2G/J2u0rHq15aMz4VvFjfEnB3Mg+we20chrlGyGou6riBdxf
         qY5Z79OFLXFWcO8sl3LcjfG3Qi5pv+ai9KQa1RKvvCrXk8Q+k3sYPDU7MM7vLN0coVnA
         AzrsMw5glXy+B5TutNT8mxWocn8RJW6DUKRmr/1FFXtFGKyD7SopVmJ5w1GEWXcvczWO
         V6vA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wfsrMWK9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id fw15-20020a056214238f00b004bb9e5d2208si8616281qvb.56.2022.11.09.08.17.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 09 Nov 2022 08:17:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wfsrMWK9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1osnjL-0001GG-1F; Wed, 09 Nov 2022 11:15:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1osnjJ-0001FX-Jb
 for qemu-arm@nongnu.org; Wed, 09 Nov 2022 11:15:09 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1osnj6-0007wI-50
 for qemu-arm@nongnu.org; Wed, 09 Nov 2022 11:15:07 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 i5-20020a1c3b05000000b003cfa97c05cdso1577180wma.4
 for <qemu-arm@nongnu.org>; Wed, 09 Nov 2022 08:14:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=kuIn7I6CLp9VWQfNOdiiRV8ytBoQboktwZZOEvzvoPA=;
 b=wfsrMWK9LTJNjPEVGpICwDLtgoHzmdjrg8b+bNT6twp1Y6Q2JhvZi6PRZYTbpzAflG
 lL1W2C8lujVDswv1hWAmK79mc0s8v/u3UR2OVM8QZHD0v7uPOxU/kwEQaFw92WckIMmB
 4Tl3u28pdDVAP7AWDgzxODjElQ+uIWKW3nxeFdqXkj8bleFB/zTTWrgtB/GvILnzRKUg
 GlRo/2JCvv3qH4xDOEFg542IGQQQqDc+VuYQqpyz8rHnD5kUwISIae21FGzNzvnGLWyJ
 NxoP2OnjKTVBAITlL1FzYf+mbRSu6n6OxuyV3zedy+1f2h86mHmlEgS4XIdONZw/Njc5
 zhxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kuIn7I6CLp9VWQfNOdiiRV8ytBoQboktwZZOEvzvoPA=;
 b=L9IRin5H7+cL+mlGb4B3ss5Zb/juN/GFfJWF/gPBOzpZWr73Kc+Q7j+vJtL/uO9rca
 knSWSuw2/393C6+SuO3zBGLKrZiNe2v6G4V+M5k/xoDdLubD8HFBy1RVAZw+YGOH+DDp
 Uy1YnrBoqdZa+JtPL2Uk9vUJG4pet+8ngfsNSjoqlJHk1H3sdAqcHEkyqpUBvbWBKdo+
 vovx72bsi8drzwlb3D7piNPolmCtxb+eAdXzT3wO+i7ys6jz+RJVjo9XnF+iRqYTYvbT
 WLQiocRv1jqdaRJs/XKB7jiam1aYl5actYR+qEWMeX6HOVgkA+X4Dmeql8Kdxey5wutq
 G1PA==
X-Gm-Message-State: ANoB5plrjDQLylLlySj7ZYWBo2GKynXqUtZevdmDIMQ6FllIVv6YbxFx
 K8x2mWJxa612w7RL5D2q+kn13LlHiOw/Ww==
X-Received: by 2002:a05:600c:230d:b0:3cf:acc6:ba97 with SMTP id
 13-20020a05600c230d00b003cfacc6ba97mr10336300wmo.102.1668010494825; 
 Wed, 09 Nov 2022 08:14:54 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 p15-20020adfce0f000000b0022cbf4cda62sm16209186wrn.27.2022.11.09.08.14.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Nov 2022 08:14:54 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-8.0 8/9] hw/intc: Convert TYPE_ARM_GICV3_ITS to 3-phase
 reset
Date: Wed,  9 Nov 2022 16:14:43 +0000
Message-Id: <20221109161444.3397405-9-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221109161444.3397405-1-peter.maydell@linaro.org>
References: <20221109161444.3397405-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
X-TUID: 528xmbirJGiX

Convert the TYPE_ARM_GICV3_ITS device to 3-phase reset.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/arm_gicv3_its.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
index 2ff21ed6bbe..57c79da5c55 100644
--- a/hw/intc/arm_gicv3_its.c
+++ b/hw/intc/arm_gicv3_its.c
@@ -27,7 +27,7 @@ DECLARE_OBJ_CHECKERS(GICv3ITSState, GICv3ITSClass,
 
 struct GICv3ITSClass {
     GICv3ITSCommonClass parent_class;
-    void (*parent_reset)(DeviceState *dev);
+    ResettablePhases parent_phases;
 };
 
 /*
@@ -1953,12 +1953,14 @@ static void gicv3_arm_its_realize(DeviceState *dev, Error **errp)
     }
 }
 
-static void gicv3_its_reset(DeviceState *dev)
+static void gicv3_its_reset_hold(Object *obj)
 {
-    GICv3ITSState *s = ARM_GICV3_ITS_COMMON(dev);
+    GICv3ITSState *s = ARM_GICV3_ITS_COMMON(obj);
     GICv3ITSClass *c = ARM_GICV3_ITS_GET_CLASS(s);
 
-    c->parent_reset(dev);
+    if (c->parent_phases.hold) {
+        c->parent_phases.hold(obj);
+    }
 
     /* Quiescent bit reset to 1 */
     s->ctlr = FIELD_DP32(s->ctlr, GITS_CTLR, QUIESCENT, 1);
@@ -2012,12 +2014,14 @@ static Property gicv3_its_props[] = {
 static void gicv3_its_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
+    ResettableClass *rc = RESETTABLE_CLASS(klass);
     GICv3ITSClass *ic = ARM_GICV3_ITS_CLASS(klass);
     GICv3ITSCommonClass *icc = ARM_GICV3_ITS_COMMON_CLASS(klass);
 
     dc->realize = gicv3_arm_its_realize;
     device_class_set_props(dc, gicv3_its_props);
-    device_class_set_parent_reset(dc, gicv3_its_reset, &ic->parent_reset);
+    resettable_class_set_parent_phases(rc, NULL, gicv3_its_reset_hold, NULL,
+                                       &ic->parent_phases);
     icc->post_load = gicv3_its_post_load;
 }
 
-- 
2.25.1

