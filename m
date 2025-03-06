Received: by 2002:a17:504:6810:b0:1be9:327d:8ee3 with SMTP id f16csp1608703njm;
        Thu, 6 Mar 2025 08:40:22 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXq5iezbC0gU+/Auwof7i6NATS6cgUDAtAy11nAF3WL5Jx071QVH3znIBqeV+tIWr6TJtilVqAqfmkB1Q==@linaro.org
X-Google-Smtp-Source: AGHT+IFJAVyucAFJO58iNDwWvtBjuocfQXov2RBvm/TTa/dlIJMZaxrt8KRxlxoIprUG2oq9nTYc
X-Received: by 2002:ad4:5f06:0:b0:6e8:f5d9:57be with SMTP id 6a1803df08f44-6e8f5d958aemr54421696d6.28.1741279222161;
        Thu, 06 Mar 2025 08:40:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1741279222; cv=none;
        d=google.com; s=arc-20240605;
        b=kmZDVYSIPUJfpIxK4fkPyntOEHrKVOO5USurvprIfSFdokE+TcjfO4TR3bAWzDdaah
         0YDLlczw0W0xxZ7tioymw7r7p6ei7roMH2135BYnZ2dcUHR/qJBVTu0wj2RlxVUyPwra
         8Dh+l1HiRS0ykK2PlYHWxvrg4Rjq3F9iSDdvRULWW6HULgEkKZsC2WAG4WkDkV2mP4vs
         adwHizkQPo941IwYSe2DsqHZ1nIoMVbqd/itQPLzau8I3SHltNWeKB4Xis5S5J4Vx3gp
         +Ss+RXbDRCBvdDwQJMWAfrr1UmLFEQE5sfBMGfNXdqeOtY0ySOlV0k2lXTNkxfhcxMnI
         Du5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=Q+T7VuurGO0f901MDk6f8XYzX0X5BpbcVrzC5rBMrok=;
        fh=H2AmuqulvQE+T5zu97MCEUC3z9wF9NssS7895NhR/+c=;
        b=Horcg0Fuz+37m7Sklh1cGw/4F0jmgNdrbns/WLfY7bLQZePjGTM2ajJ3telRjatC3z
         +jdXx+vqZq6TcrHYgaDGFjWa4qelxoed+INW4XXglc0WX2ITuqCCrR5GKJum4lZCxHTZ
         3Fh8f5pZAHuv6XRNTiHXK/iL8tgb7lU87+SHImoj1wtvAgYm6KiZjXaGV+suanRrF/pv
         JDpljswyywU33nqiR51gBe/2OYUpKykYqPHy68gjfWg+M8xfgTdH/d1qYxwjqQVPsgPO
         OxumnX9VUO3QFKTaAMGHVRLE9oLRdigHNYuHTmhAIBdjlzSYXZhClcupw19bEn2q/D4T
         H1hw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Shj7twNx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=fail header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4751daf6579si14855331cf.286.2025.03.06.08.40.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Mar 2025 08:40:22 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Shj7twNx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=fail header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tqEG4-0006ot-3d; Thu, 06 Mar 2025 11:39:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tqEFw-0006kc-8z
 for qemu-arm@nongnu.org; Thu, 06 Mar 2025 11:39:35 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tqEFu-0004W6-8Y
 for qemu-arm@nongnu.org; Thu, 06 Mar 2025 11:39:31 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-43bdf0cbb6bso5178375e9.1
 for <qemu-arm@nongnu.org>; Thu, 06 Mar 2025 08:39:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741279168; x=1741883968; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Q+T7VuurGO0f901MDk6f8XYzX0X5BpbcVrzC5rBMrok=;
 b=Shj7twNxNso0/7igM+cnhcekdGRnwcLGR3N1/f+epBdrzzpaJEGYfo7CXWMI2yY6vr
 zX+khxiK2mQcZDks6DKw3Zlk89+tr5wR5nddI17pEvMN2Jn/YSJHEADjnT0WRFJwib/l
 xp3IZmRrKyfgFD9Y1l9DVqrFIlR3Fx/S5RpnGNNe/xT6jnqNaOpOi9E8Q8DvmhUuhmoW
 wZZekJv7WfhOMMVOobk3N0JkQxY509o/d3QcfWXQye4GMwqjTfdE9p4Nhh30jmUug/yA
 o1Rj61+kbgwGuLRg/7213RJg0LxWj/StoSzbGhXxnbsJ7udxXa9I2vRhfjiBXvyfkRku
 246Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741279168; x=1741883968;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Q+T7VuurGO0f901MDk6f8XYzX0X5BpbcVrzC5rBMrok=;
 b=QajNx4EMGvYTW4E4n9p+KSyglc9gAIw4U/u9HY/U14Y5IasXJrACf2Em1tPSjWUYZ6
 kcuwDgSgSp4NOlk2jhkiZmoX7YinAHiVpMzdMG8Ba3xtjgHRjPEfh2l8QzB8TiBPEt3Q
 ss4WQOSV4fzFkCHzjqkJDaaPc8+LmbxzuOJ1NVH5z5ljKwQFXLnX/2KdqOF46OZ5ZKcA
 5gCersEg93lulcw02gzGUImBut3NBzBAfZQwM12PmOqSnN4odwXEXiDq9pTzUsJ1Ldd5
 zDmMMYSVi5aDY8E4n42RQnP2k2H9qcXwWG8gcaTlIxK29zQAITna6/W4h6YWMazStD7D
 p6Eg==
X-Gm-Message-State: AOJu0YxhLAn5ExZ7i4hDNjrLZuCrkZSPMRVEu8o/g+Mly9Xx7o85d9tX
 cMHmp0pXXtILSvD9Spu6dyyfVQwbboBJK/hfyYyYdSalYLBmOirlz7rpyikSv0fLWJyZxP9DkAg
 U
X-Gm-Gg: ASbGncs9hSNFq1CEEEFxZ3nQrtONcDf/7VeKNo2QCTs5WigWiup5/0ytUKKT6ylv+jz
 56KK3HRNpMFA0MM+MpSI5mXYRiqcMFfyAKsmkftm7flch+EIo6ArWmG7D93ikPZ9Ks0eg+dVevB
 LtnwA74UQYsD6IvfvpfJ4NMkmhmbZBCP2m7JGsqekl1m8Atv91zogk4cCQkwRx9hqiZWUgMGd1F
 FmcEHc0mIu5ljvztl5N1PWTqGhE5BvzEYGDaipgwENP2KoXKr7zPKF2fvD8Fn+VuuUmsaye3pE4
 7LrVoJpUSPw5pTKQVf5iJRfqw/OvQ5Gzekjt/1numZw6R1ab0z8=
X-Received: by 2002:a05:600c:17d1:b0:439:8e95:795b with SMTP id
 5b1f17b1804b1-43c68729939mr716785e9.31.1741279168451; 
 Thu, 06 Mar 2025 08:39:28 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43bdd94913fsm23999905e9.37.2025.03.06.08.39.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Mar 2025 08:39:27 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 01/10] target/arm: Move A32_BANKED_REG_{GET,
 SET} macros to cpregs.h
Date: Thu,  6 Mar 2025 16:39:15 +0000
Message-ID: <20250306163925.2940297-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250306163925.2940297-1-peter.maydell@linaro.org>
References: <20250306163925.2940297-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32a.google.com
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
X-TUID: RGpRDFePbvYX

The A32_BANKED_REG_{GET,SET} macros are only used inside target/arm;
move their definitions to cpregs.h. There's no need to have them
defined in all the code that includes cpu.h.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpregs.h | 28 ++++++++++++++++++++++++++++
 target/arm/cpu.h    | 27 ---------------------------
 2 files changed, 28 insertions(+), 27 deletions(-)

diff --git a/target/arm/cpregs.h b/target/arm/cpregs.h
index 52377c6eb50..2183de8eda6 100644
--- a/target/arm/cpregs.h
+++ b/target/arm/cpregs.h
@@ -1157,4 +1157,32 @@ static inline bool arm_cpreg_traps_in_nv(const ARMCPRegInfo *ri)
     return ri->opc1 == 4 || ri->opc1 == 5;
 }
 
+/* Macros for accessing a specified CP register bank */
+#define A32_BANKED_REG_GET(_env, _regname, _secure)                     \
+    ((_secure) ? (_env)->cp15._regname##_s : (_env)->cp15._regname##_ns)
+
+#define A32_BANKED_REG_SET(_env, _regname, _secure, _val)       \
+    do {                                                        \
+        if (_secure) {                                          \
+            (_env)->cp15._regname##_s = (_val);                 \
+        } else {                                                \
+            (_env)->cp15._regname##_ns = (_val);                \
+        }                                                       \
+    } while (0)
+
+/*
+ * Macros for automatically accessing a specific CP register bank depending on
+ * the current secure state of the system.  These macros are not intended for
+ * supporting instruction translation reads/writes as these are dependent
+ * solely on the SCR.NS bit and not the mode.
+ */
+#define A32_BANKED_CURRENT_REG_GET(_env, _regname)                          \
+    A32_BANKED_REG_GET((_env), _regname,                                    \
+                       (arm_is_secure(_env) && !arm_el_is_aa64((_env), 3)))
+
+#define A32_BANKED_CURRENT_REG_SET(_env, _regname, _val)                    \
+    A32_BANKED_REG_SET((_env), _regname,                                    \
+                       (arm_is_secure(_env) && !arm_el_is_aa64((_env), 3)), \
+                       (_val))
+
 #endif /* TARGET_ARM_CPREGS_H */
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 215845c7e25..c360b74ded9 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -2682,33 +2682,6 @@ static inline bool access_secure_reg(CPUARMState *env)
     return ret;
 }
 
-/* Macros for accessing a specified CP register bank */
-#define A32_BANKED_REG_GET(_env, _regname, _secure)    \
-    ((_secure) ? (_env)->cp15._regname##_s : (_env)->cp15._regname##_ns)
-
-#define A32_BANKED_REG_SET(_env, _regname, _secure, _val)   \
-    do {                                                \
-        if (_secure) {                                   \
-            (_env)->cp15._regname##_s = (_val);            \
-        } else {                                        \
-            (_env)->cp15._regname##_ns = (_val);           \
-        }                                               \
-    } while (0)
-
-/* Macros for automatically accessing a specific CP register bank depending on
- * the current secure state of the system.  These macros are not intended for
- * supporting instruction translation reads/writes as these are dependent
- * solely on the SCR.NS bit and not the mode.
- */
-#define A32_BANKED_CURRENT_REG_GET(_env, _regname)        \
-    A32_BANKED_REG_GET((_env), _regname,                \
-                       (arm_is_secure(_env) && !arm_el_is_aa64((_env), 3)))
-
-#define A32_BANKED_CURRENT_REG_SET(_env, _regname, _val)                       \
-    A32_BANKED_REG_SET((_env), _regname,                                    \
-                       (arm_is_secure(_env) && !arm_el_is_aa64((_env), 3)), \
-                       (_val))
-
 uint32_t arm_phys_excp_target_el(CPUState *cs, uint32_t excp_idx,
                                  uint32_t cur_el, bool secure);
 
-- 
2.43.0

