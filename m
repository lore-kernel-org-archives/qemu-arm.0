Received: by 2002:a19:ee12:0:0:0:0:0 with SMTP id g18csp2421746lfb;
        Tue, 7 Jun 2022 14:17:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz3CL6hkveRC5idrqjG174jXbur94C6H3s4aH9iw7Mgqc+MhP0qrWCUF5o40BuQeBPb9TTG
X-Received: by 2002:a05:622a:144b:b0:304:f481:f56d with SMTP id v11-20020a05622a144b00b00304f481f56dmr6668151qtx.152.1654636658687;
        Tue, 07 Jun 2022 14:17:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654636658; cv=none;
        d=google.com; s=arc-20160816;
        b=D+vWMZ06SZ408ETDCy8ArjbRHvd0/pLVU4+iOcW+cBWTTypspA6w3rWzTLcMhoZcVv
         HlzusLxzLQefSK4YJ3wvp0RNzYQlTwLvJrSufLnilxHHglP0N8/jav9zve2yBaoKCf4H
         30me80forEcIP4ks7+3n1cELxyS6RgFcn2dHjfn8/xAXPuTQi1/l5YGfvMBbrkzvQVtT
         fT0fVlgIo+TesCiw+3sev93IcA+I0Mz6wZkhYc29+mtS3refE4zdV+LPI0QYFqRRroUZ
         aI/hPhcKebxGLk7hM/iYbobeAiBOSTU3Qhcc3e2jwUSs0s5Xiyhib1Z/XJQl66+qnsvi
         T7Qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=nRiBuDw8xOiappiLJwDebAsj0dPMzIOBq+w1XQpJT0Q=;
        b=wp1fxIAUkdFKUgHN+P4c8Qo3/0eNVI3NTjoR4mb0c8o6tJNvBhfncu11InRD1E3YRV
         YAlw42gaxZj1f0j+k7LcegexnaYcm4JxiO4MrHB0zpeUTmlyB6eZtPW1S1CvcSQwXFZq
         /ybOxzp1u3vp7nA84kYwF+a58Z9FM3USON04zXrPSQEz1oQ8OMvUOOLBGeZCJkl4LyzI
         bVwMP/VyElG1p8CZmoSuTMAS8N40xK+zCf/kePRjhrGhuDMQXUTBoSBvZEXpWWdGojET
         D/JRQnCNcPCF1BT3yIuYdcS74hVCeMEwIrJ3UkFvK5Kk4kg8sTqDV/Xo26DgsfRZZPWu
         vq2A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=QLDWXpE8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m19-20020a05620a291300b006a6c4d52e3fsi3135201qkp.293.2022.06.07.14.17.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 07 Jun 2022 14:17:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=QLDWXpE8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nyga2-0008UT-4F
	for alex.bennee@linaro.org; Tue, 07 Jun 2022 17:17:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyfwV-0006L8-V8
 for qemu-arm@nongnu.org; Tue, 07 Jun 2022 16:36:49 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632]:41885)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyfwU-0008DI-8u
 for qemu-arm@nongnu.org; Tue, 07 Jun 2022 16:36:47 -0400
Received: by mail-pl1-x632.google.com with SMTP id s14so15798498plk.8
 for <qemu-arm@nongnu.org>; Tue, 07 Jun 2022 13:36:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nRiBuDw8xOiappiLJwDebAsj0dPMzIOBq+w1XQpJT0Q=;
 b=QLDWXpE8up/O5B4CSnNCMsB3GaGriyBjzSU1f6JAX9+dwTlN0N4NRfotk3OZhZYM4I
 WY1dECOkMy0TgaiCagsKQ6aJoF8mqlm+nfe+pfpJV1/yxcRKu1VJEtdA3YgReXesMbzL
 Wd0thSlToEiJWbVJOwboxqiDL4gwvZiCXZ0DIQUKR7YhJ3Ub3NxjVVZ/alf50rgRx2dK
 Y62lc9DZtkxGaHl8x6i5hMfnGwvBGQyjQIyLsHkUHEvhBnAIY+zZTDVtPgJQhvcwRmSd
 8cV/O4tvceXzA2dnc7UDPvJynsBJ3hvunqM1gQwXWA1aI5Mr2R/Q71xM7zaEMiv44RhJ
 PMqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nRiBuDw8xOiappiLJwDebAsj0dPMzIOBq+w1XQpJT0Q=;
 b=o8xUUzQzQdufL2JdmQdEqulEzlV5BJyAp3bvwK3v/hvOkqFQB68F40+QTKQ/UqiMFw
 b4x0LQ/jbTPM4drt6j1T+V9cAPj9qjXhfDkscdui6UJO9aHg+rshGRRuy4YmT4ViWcPo
 z0B5bVU6yA4vPyvGV+Cq8VdGCqr/pvXC616Ow5MyWZWMTC1SR4GJMNyH70TfftBHdJ1z
 cq8nCyzL+fJArH+etOI5gaLO/TZbXCRtan6Y1JxpaEcX2Am1dCuTtArk1LTn/sQlkd5I
 T92eA06RncYB6mQJgFTNfzH7G8uRrHogR5qYGRY/7v4nq/KVhHMr5m6g5ggXwfmiUdCj
 KcXw==
X-Gm-Message-State: AOAM530pI9tuz4m/ww9XI7OPqQufyB9Dcv/wNnEkScmRtYdZ5lqEwJ0V
 79BGMeNcxLCoxGVIZA8XblUwQ89ZGEMnNg==
X-Received: by 2002:a17:90b:1d0a:b0:1e8:7f14:8db with SMTP id
 on10-20020a17090b1d0a00b001e87f1408dbmr13665038pjb.218.1654634204738; 
 Tue, 07 Jun 2022 13:36:44 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:3cf2:c634:5b19:25f6])
 by smtp.gmail.com with ESMTPSA id
 s18-20020aa78d52000000b0050dc76281fdsm13235645pfe.215.2022.06.07.13.36.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jun 2022 13:36:44 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org
Subject: [PATCH v2 40/71] target/arm: Move pred_{full, gvec}_reg_{offset,
 size} to translate-a64.h
Date: Tue,  7 Jun 2022 13:32:35 -0700
Message-Id: <20220607203306.657998-41-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220607203306.657998-1-richard.henderson@linaro.org>
References: <20220607203306.657998-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: oapZLOP9eV/p

We will need these functions in translate-sme.c.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-a64.h | 38 ++++++++++++++++++++++++++++++++++++++
 target/arm/translate-sve.c | 36 ------------------------------------
 2 files changed, 38 insertions(+), 36 deletions(-)

diff --git a/target/arm/translate-a64.h b/target/arm/translate-a64.h
index dbc917ee65..f0970c6b8c 100644
--- a/target/arm/translate-a64.h
+++ b/target/arm/translate-a64.h
@@ -107,6 +107,44 @@ static inline int vec_full_reg_size(DisasContext *s)
     return s->vl;
 }
 
+/*
+ * Return the offset info CPUARMState of the predicate vector register Pn.
+ * Note for this purpose, FFR is P16.
+ */
+static inline int pred_full_reg_offset(DisasContext *s, int regno)
+{
+    return offsetof(CPUARMState, vfp.pregs[regno]);
+}
+
+/* Return the byte size of the whole predicate register, VL / 64.  */
+static inline int pred_full_reg_size(DisasContext *s)
+{
+    return s->vl >> 3;
+}
+
+/*
+ * Round up the size of a register to a size allowed by
+ * the tcg vector infrastructure.  Any operation which uses this
+ * size may assume that the bits above pred_full_reg_size are zero,
+ * and must leave them the same way.
+ *
+ * Note that this is not needed for the vector registers as they
+ * are always properly sized for tcg vectors.
+ */
+static inline int size_for_gvec(int size)
+{
+    if (size <= 8) {
+        return 8;
+    } else {
+        return QEMU_ALIGN_UP(size, 16);
+    }
+}
+
+static inline int pred_gvec_reg_size(DisasContext *s)
+{
+    return size_for_gvec(pred_full_reg_size(s));
+}
+
 bool disas_sve(DisasContext *, uint32_t);
 
 void gen_gvec_rax1(unsigned vece, uint32_t rd_ofs, uint32_t rn_ofs,
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 67761bf2cc..62b5f3040c 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -100,42 +100,6 @@ static inline int msz_dtype(DisasContext *s, int msz)
  * Implement all of the translator functions referenced by the decoder.
  */
 
-/* Return the offset info CPUARMState of the predicate vector register Pn.
- * Note for this purpose, FFR is P16.
- */
-static inline int pred_full_reg_offset(DisasContext *s, int regno)
-{
-    return offsetof(CPUARMState, vfp.pregs[regno]);
-}
-
-/* Return the byte size of the whole predicate register, VL / 64.  */
-static inline int pred_full_reg_size(DisasContext *s)
-{
-    return s->vl >> 3;
-}
-
-/* Round up the size of a register to a size allowed by
- * the tcg vector infrastructure.  Any operation which uses this
- * size may assume that the bits above pred_full_reg_size are zero,
- * and must leave them the same way.
- *
- * Note that this is not needed for the vector registers as they
- * are always properly sized for tcg vectors.
- */
-static int size_for_gvec(int size)
-{
-    if (size <= 8) {
-        return 8;
-    } else {
-        return QEMU_ALIGN_UP(size, 16);
-    }
-}
-
-static int pred_gvec_reg_size(DisasContext *s)
-{
-    return size_for_gvec(pred_full_reg_size(s));
-}
-
 /* Invoke an out-of-line helper on 2 Zregs. */
 static bool gen_gvec_ool_zz(DisasContext *s, gen_helper_gvec_2 *fn,
                             int rd, int rn, int data)
-- 
2.34.1

