Received: by 2002:a19:ee12:0:0:0:0:0 with SMTP id g18csp2411501lfb;
        Tue, 7 Jun 2022 13:56:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxNjlUonVKBbaPVmZI9rdSPSJnNRTk5RJVYxjyTTGVmGD9GKEaAiL2u7Nl8gIiTI99zfcQr
X-Received: by 2002:a05:622a:118e:b0:2f9:2aa1:71a9 with SMTP id m14-20020a05622a118e00b002f92aa171a9mr24415675qtk.190.1654635384530;
        Tue, 07 Jun 2022 13:56:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654635384; cv=none;
        d=google.com; s=arc-20160816;
        b=HZa9yb0BNBo9IPTcWa5HDlXbA/nWyZm6OXAQAmmWnHqgXZsVyxnGIap5Abbwa1IPkX
         7IMRxrjoC3wFWSF3RFxvhuYhe9FlvVjon3eiUthaVStxmaGBqZwEPkm95LDKJAY8C93o
         Z/xx+p9j9NolhQha4iu9ipWtdnJxPwIjGiGL6uTuC2bNMBjvgFXGtbzPJCuydW0qcN5i
         QSKCXhTJUd5hWsd/2xbezD3EHuHI+vGs7fYVykt0Fb6BSNwNHzT400RjAqj7Y2mW1Xwy
         M2/5lrfX7ib7x1FWixT4OtcdsVhvfM1f4JTUo7b7Kilz92s5q2e1yGf4i2gvhvLuHoTM
         +WKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=fwPtvhYNG8jCnQ1cI9YW7usJn3JNHfnrq4zhCHsHE5Y=;
        b=L7WZn7ZPFuSGRsNvovZotcfhhID3ZEBZZZx46uWWtFD0bPeqZVoPeD4eULIbzFL3X+
         R/NpsUnr3J48DiOcRhLZltOjP2rkpoxc+ZobIsH8DWLBt/sRn8TL6YwLnJjwgcQZPx+j
         tXF09GI1VjDXRHkKemgvnGLK3RqS6zWcatdsS1FDZ+XkjHfkeynTTmgcb8gnRbuk+KdG
         Z2kAQtVnTfnQRnA+ufMVym5NwkHfSNxMUhY8fpLgW++gD1j3kQzGF4NKqkqix+qNV1qb
         L/npZ0gCeMOMpbxsMCE5X2FRgG/lFesxq1C7L2HDMMXNU/VPrTGBMAOE+4WkHkeW8e1b
         YFxg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MxzIYGce;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j30-20020a05620a0a5e00b006a6c309eb6csi2923314qka.408.2022.06.07.13.56.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 07 Jun 2022 13:56:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MxzIYGce;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nygFU-00044m-1f
	for alex.bennee@linaro.org; Tue, 07 Jun 2022 16:56:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyfta-0000AP-Ow
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 16:33:47 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630]:33553)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyftT-0007Ms-3S
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 16:33:46 -0400
Received: by mail-pl1-x630.google.com with SMTP id f9so5339118plg.0
 for <qemu-devel@nongnu.org>; Tue, 07 Jun 2022 13:33:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fwPtvhYNG8jCnQ1cI9YW7usJn3JNHfnrq4zhCHsHE5Y=;
 b=MxzIYGceoED1CJ08IWUi6OjSG25mVg4ylwRQhErbf9lLok8srKuaPxpeep2mrZdbIr
 NrI7c9+IH5VpWUm0JhAYtT3lEE0SaUhwYUalsivPofNKAjr8m/VueWx+uRjt+P1jJ/yW
 BL7oZ6JuMWy8qvUXdRSUib/taHgPQ4cTHtoqO+XIF0VI4yh0JCs1aFVhpNGl0qyMCXdY
 kFxMir93dEooyb2fIUEIvST+x4QbtSwYJywO/Bi0/767uRksw9SLMta9hfWTct7tQJBD
 /cb+BKaO+WY7U+p6DVNEkW3Wr3fAGy8t1veCwPibG2dsPURqmGmhoqUQN8bpPCRDNIoO
 x1Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fwPtvhYNG8jCnQ1cI9YW7usJn3JNHfnrq4zhCHsHE5Y=;
 b=msklAAKdEOcIfJryGzKj8XenwxeOwJGB6Ok7/RmNww7pqDbvVHSXijGJ0uSJPNO2s7
 FRsSQrN5VYSZaEywrXi9c9Zx+rS3b+EzmR1xCyi3OdVBeCeB6Mnh+nQVr/jU0cj5rEpP
 2Mns+petXHerO4vDex8f84TXC/XFlh1CVnlhHLxQFnGE04R+o+zU9hhM3r6BhxbdAW7C
 voLabpN7UorvCkZc8PA8JZL9XG8VD+bisRA1Lh61IhCHdP/dkSLe3unT0UYC4KznaFp5
 +X1iLKDMqZgMul/sU9yFHDwq9XylSZgyevmxPcH/cI2u3IQPX873hSKBYCnbAGdLxC1C
 fN7Q==
X-Gm-Message-State: AOAM532XE4KRRK+PBbFOJ7yHGMmPReiSRqQq/NbHSUU0T1OnHq5gJTHL
 xI1VLBLEJFs3Sg5ooT5wxGkoYOWQ9gTSBg==
X-Received: by 2002:a17:902:efcc:b0:163:f35b:2a99 with SMTP id
 ja12-20020a170902efcc00b00163f35b2a99mr29975966plb.42.1654634018260; 
 Tue, 07 Jun 2022 13:33:38 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:3cf2:c634:5b19:25f6])
 by smtp.gmail.com with ESMTPSA id
 s22-20020a17090aba1600b001d9780b7779sm4227856pjr.15.2022.06.07.13.33.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jun 2022 13:33:37 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org
Subject: [PATCH v2 33/71] target/arm: Generalize cpu_arm_{get,set}_vq
Date: Tue,  7 Jun 2022 13:32:28 -0700
Message-Id: <20220607203306.657998-34-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220607203306.657998-1-richard.henderson@linaro.org>
References: <20220607203306.657998-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: mNNrTJr2NgBt

Rename from cpu_arm_{get,set}_sve_vq, and take the
ARMVQMap as the opaque parameter.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu64.c | 29 +++++++++++++++--------------
 1 file changed, 15 insertions(+), 14 deletions(-)

diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 0a2f4f3170..dcec0a6559 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -579,15 +579,15 @@ static void cpu_max_set_sve_max_vq(Object *obj, Visitor *v, const char *name,
 }
 
 /*
- * Note that cpu_arm_get/set_sve_vq cannot use the simpler
- * object_property_add_bool interface because they make use
- * of the contents of "name" to determine which bit on which
- * to operate.
+ * Note that cpu_arm_{get,set}_vq cannot use the simpler
+ * object_property_add_bool interface because they make use of the
+ * contents of "name" to determine which bit on which to operate.
  */
-static void cpu_arm_get_sve_vq(Object *obj, Visitor *v, const char *name,
-                               void *opaque, Error **errp)
+static void cpu_arm_get_vq(Object *obj, Visitor *v, const char *name,
+                           void *opaque, Error **errp)
 {
     ARMCPU *cpu = ARM_CPU(obj);
+    ARMVQMap *vq_map = opaque;
     uint32_t vq = atoi(&name[3]) / 128;
     bool value;
 
@@ -595,15 +595,15 @@ static void cpu_arm_get_sve_vq(Object *obj, Visitor *v, const char *name,
     if (!cpu_isar_feature(aa64_sve, cpu)) {
         value = false;
     } else {
-        value = extract32(cpu->sve_vq.map, vq - 1, 1);
+        value = extract32(vq_map->map, vq - 1, 1);
     }
     visit_type_bool(v, name, &value, errp);
 }
 
-static void cpu_arm_set_sve_vq(Object *obj, Visitor *v, const char *name,
-                               void *opaque, Error **errp)
+static void cpu_arm_set_vq(Object *obj, Visitor *v, const char *name,
+                           void *opaque, Error **errp)
 {
-    ARMCPU *cpu = ARM_CPU(obj);
+    ARMVQMap *vq_map = opaque;
     uint32_t vq = atoi(&name[3]) / 128;
     bool value;
 
@@ -611,8 +611,8 @@ static void cpu_arm_set_sve_vq(Object *obj, Visitor *v, const char *name,
         return;
     }
 
-    cpu->sve_vq.map = deposit32(cpu->sve_vq.map, vq - 1, 1, value);
-    cpu->sve_vq.init |= 1 << (vq - 1);
+    vq_map->map = deposit32(vq_map->map, vq - 1, 1, value);
+    vq_map->init |= 1 << (vq - 1);
 }
 
 static bool cpu_arm_get_sve(Object *obj, Error **errp)
@@ -691,6 +691,7 @@ static void cpu_arm_get_sve_default_vec_len(Object *obj, Visitor *v,
 
 void aarch64_add_sve_properties(Object *obj)
 {
+    ARMCPU *cpu = ARM_CPU(obj);
     uint32_t vq;
 
     object_property_add_bool(obj, "sve", cpu_arm_get_sve, cpu_arm_set_sve);
@@ -698,8 +699,8 @@ void aarch64_add_sve_properties(Object *obj)
     for (vq = 1; vq <= ARM_MAX_VQ; ++vq) {
         char name[8];
         sprintf(name, "sve%d", vq * 128);
-        object_property_add(obj, name, "bool", cpu_arm_get_sve_vq,
-                            cpu_arm_set_sve_vq, NULL, NULL);
+        object_property_add(obj, name, "bool", cpu_arm_get_vq,
+                            cpu_arm_set_vq, NULL, &cpu->sve_vq);
     }
 
 #ifdef CONFIG_USER_ONLY
-- 
2.34.1

