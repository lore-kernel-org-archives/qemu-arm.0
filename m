Received: by 2002:a19:ee12:0:0:0:0:0 with SMTP id g18csp2421313lfb;
        Tue, 7 Jun 2022 14:16:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwVA4tLnNzo8pBIYljUMVR7670GSRkEctLW8LWoWKG58s1krkD+8R+6OVj/XqWLrO3pp8ST
X-Received: by 2002:a0c:df8c:0:b0:465:d376:1ec0 with SMTP id w12-20020a0cdf8c000000b00465d3761ec0mr22854568qvl.97.1654636605523;
        Tue, 07 Jun 2022 14:16:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654636605; cv=none;
        d=google.com; s=arc-20160816;
        b=QRwAMIy06PRPOSEDl/1SS6nnLcM5W9/zM8VpPyFqXjrtZAoxyF/loCFc9TU+rmNQli
         uLvRHO0J6AfsyDJFaKDbgJwmA4HGiKsut6qaZfO4BhCSplpzf4PFLZYpZ6ApgCnmyTMg
         M+BiT+JpZ3tQLDZuS/zySwGnGTL/aXyGn0+DZqe9laoelutYR2noyIn9qoHs+FyaaC4B
         IhzwWDpn05oLqRv7WzBfIqqRQhXoneVxdl0lFLMPOsXI/fx7KGG7IlgIIiEME8PI/o6q
         DolX3ewAvr5VKVDShV7tjZmeYwO63QfX3S6WRbUEWKQTYeCEKlf3jaYurzGhUxLtQ0TC
         i+fQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=7xdazpoc98KTxU+Hkap6hV74hgs0EjjQuCmdWfoKk1g=;
        b=HUljJzwyE6zK+TaVSXWWFycTjJEwyoD11uiLOf6q8aK4LFG46iBYjvfT+PvxFZ7CGj
         X7gDqydybnAfusoJGLixIj3U2q/wvDlR+JsdqSLwp0Al7bxpb6cnZelGqGRwqzAXuTZk
         gd7istACI0jf2nHUSskT5pDAJ5TU3+vm3S9qVYuInmnW2l9pbVjDlsMwebEv8ByGof/6
         d6OjG9m65L1TqpJ7LO/FJXzRjHtHqsl++J2H0fYrAV59HyESlYTqqpOt5RBAmhXKRPi0
         ckWgA9dp/dMaMr4hV3cI3SUVEUE9Le8GhNe+hTPnaEUsC2FAkHfyiBuxm/Se1CvPH5zo
         WLEg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="uHv8x/Nf";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v3-20020a05622a014300b00304c6ee4213si10575405qtw.765.2022.06.07.14.16.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 07 Jun 2022 14:16:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="uHv8x/Nf";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nygZB-0006fa-1F
	for alex.bennee@linaro.org; Tue, 07 Jun 2022 17:16:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34502)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyftd-0000Io-0i
 for qemu-arm@nongnu.org; Tue, 07 Jun 2022 16:33:49 -0400
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c]:44580)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyftU-0007Ib-0r
 for qemu-arm@nongnu.org; Tue, 07 Jun 2022 16:33:48 -0400
Received: by mail-pg1-x52c.google.com with SMTP id c18so8624792pgh.11
 for <qemu-arm@nongnu.org>; Tue, 07 Jun 2022 13:33:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7xdazpoc98KTxU+Hkap6hV74hgs0EjjQuCmdWfoKk1g=;
 b=uHv8x/Nf/neIA93S+wbDDYJYsPsV/MqtVTAQmTlIjXJiapyq7dFbfboMwxhIW827Y4
 zQrm8DKH+1VqIjniD92OQjvoUddABJrw7B0rOC5bne6gsrwvPrALbPETZhDKBUoDeYgc
 T77DDXDUWI5ebZlsUPT4xrWrahIX6BgEYaqkPQ+9OExvG4MARHI3TKr99BhlijmBdsFH
 b6oOelGO/QptVsLP2zlPKPKvcsZrIX0ZhV90LbFaJJkb6nIUQ91tXeVQGOR1fRGJ90w/
 oletdaoLZeMQmxlHyMbEJEKUiQPl9XjKXGeSSt1OhAJDp14niW24dP6NYcv4Cr9wqyxx
 Mi+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7xdazpoc98KTxU+Hkap6hV74hgs0EjjQuCmdWfoKk1g=;
 b=NiGVajp3XqOuctdL95QUa51KqT2dfe4w6zRcWY0Rx1lMbmC1wc6vhjsP7ZQBFioaFX
 YrybFbXpwaUP61CV9jFnrDm25Opvi7CHZ4m0NMdkjt3qsVFLIi27QKUFz4xiiaLyJIzP
 gVgUCR0L7YB7oHSTPra+rAqx6tTX7UJ7fY3vFgVvh1Yhm5w1ErK12h2Fln+TBfrNxeYJ
 4sCFnJM0Q9n1tNwaGbFemPfxOZFXWgYtK7AiwjGsuUD4Dti5BI4v1SSAaWQXyP348mjE
 HYFY1T15eNWmlQqjsPWOal1g04Y4z30KGgm9adRLXOKJBmVVQh3xO5du3aCXwEEgqwqD
 xyCQ==
X-Gm-Message-State: AOAM53107ZginrQTihEuKp8mWxWSTnjIwQYLHyT22SJ0TQfI69S3Me+E
 G+hdCryZV9ye+CnVg8JxpqdFRAM+ORWnuQ==
X-Received: by 2002:a63:b55:0:b0:3fd:a384:bd10 with SMTP id
 a21-20020a630b55000000b003fda384bd10mr12291615pgl.534.1654634019154; 
 Tue, 07 Jun 2022 13:33:39 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:3cf2:c634:5b19:25f6])
 by smtp.gmail.com with ESMTPSA id
 s22-20020a17090aba1600b001d9780b7779sm4227856pjr.15.2022.06.07.13.33.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jun 2022 13:33:38 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org
Subject: [PATCH v2 34/71] target/arm: Generalize cpu_arm_{get,
 set}_default_vec_len
Date: Tue,  7 Jun 2022 13:32:29 -0700
Message-Id: <20220607203306.657998-35-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220607203306.657998-1-richard.henderson@linaro.org>
References: <20220607203306.657998-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: lAvx8HrRf5Z7

Rename from cpu_arm_{get,set}_sve_default_vec_len,
and take the pointer to default_vq from opaque.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu64.c | 27 ++++++++++++++-------------
 1 file changed, 14 insertions(+), 13 deletions(-)

diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index dcec0a6559..c5bfc3d082 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -638,11 +638,11 @@ static void cpu_arm_set_sve(Object *obj, bool value, Error **errp)
 
 #ifdef CONFIG_USER_ONLY
 /* Mirror linux /proc/sys/abi/sve_default_vector_length. */
-static void cpu_arm_set_sve_default_vec_len(Object *obj, Visitor *v,
-                                            const char *name, void *opaque,
-                                            Error **errp)
+static void cpu_arm_set_default_vec_len(Object *obj, Visitor *v,
+                                        const char *name, void *opaque,
+                                        Error **errp)
 {
-    ARMCPU *cpu = ARM_CPU(obj);
+    uint32_t *ptr_default_vq = opaque;
     int32_t default_len, default_vq, remainder;
 
     if (!visit_type_int32(v, name, &default_len, errp)) {
@@ -651,7 +651,7 @@ static void cpu_arm_set_sve_default_vec_len(Object *obj, Visitor *v,
 
     /* Undocumented, but the kernel allows -1 to indicate "maximum". */
     if (default_len == -1) {
-        cpu->sve_default_vq = ARM_MAX_VQ;
+        *ptr_default_vq = ARM_MAX_VQ;
         return;
     }
 
@@ -675,15 +675,15 @@ static void cpu_arm_set_sve_default_vec_len(Object *obj, Visitor *v,
         return;
     }
 
-    cpu->sve_default_vq = default_vq;
+    *ptr_default_vq = default_vq;
 }
 
-static void cpu_arm_get_sve_default_vec_len(Object *obj, Visitor *v,
-                                            const char *name, void *opaque,
-                                            Error **errp)
+static void cpu_arm_get_default_vec_len(Object *obj, Visitor *v,
+                                        const char *name, void *opaque,
+                                        Error **errp)
 {
-    ARMCPU *cpu = ARM_CPU(obj);
-    int32_t value = cpu->sve_default_vq * 16;
+    uint32_t *ptr_default_vq = opaque;
+    int32_t value = *ptr_default_vq * 16;
 
     visit_type_int32(v, name, &value, errp);
 }
@@ -706,8 +706,9 @@ void aarch64_add_sve_properties(Object *obj)
 #ifdef CONFIG_USER_ONLY
     /* Mirror linux /proc/sys/abi/sve_default_vector_length. */
     object_property_add(obj, "sve-default-vector-length", "int32",
-                        cpu_arm_get_sve_default_vec_len,
-                        cpu_arm_set_sve_default_vec_len, NULL, NULL);
+                        cpu_arm_get_default_vec_len,
+                        cpu_arm_set_default_vec_len, NULL,
+                        &cpu->sve_default_vq);
 #endif
 }
 
-- 
2.34.1

