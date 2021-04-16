Received: by 2002:ac2:5e6c:0:0:0:0:0 with SMTP id a12csp756009lfr;
        Fri, 16 Apr 2021 14:59:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzl2YAAtUsvQ5ixumRvo/RYN1tbiVgPWwXTYpS6UP5dEt8WRl2JE0SXtuF4Z4S+x4HBnset
X-Received: by 2002:a25:d153:: with SMTP id i80mr1804797ybg.48.1618610345457;
        Fri, 16 Apr 2021 14:59:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618610345; cv=none;
        d=google.com; s=arc-20160816;
        b=00SsJhfzjDGTEOC5Ydas+/dYeCrEV7DMIISKqDDX+rim68WwIACWLqrAAk+cno7tJ9
         4a8Iocx1war/d2eF82hR0MTl6BXSQQYg8Jxl19HsJEvNt+/Ou4FvT3ta24/f/PxNX5cL
         Q30/9RaDt/t3sp6i5NmKjcbVW4RVI5eVJk8jhg2z5303qq1a+i8INjaeiIUeQZ/8vDvM
         M6MU77YyGHGcIokSatxiRgqOfy6mcQh6wuWWXA9B6MUtafC9TZBylC/ADdvWoO0bpiF9
         sL2EM64jVxCmr+qyuAq6KqOL1aL2680zTB7r3izB/xmvU6jtaxll67LL4tpbq7i8p9te
         HFAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=pwtVsWMVmbv9sqp1N/B2+DpRKMYOpBDEtVpM5RexTu0=;
        b=kmMifkPKX4m58WxAqs1p0rrrnc4lrO3f6xE/p98bRdjorQQi3t7OR9MBwT5SEkCQ6m
         bDJJNS74UujqEE8M0cJD60MUbPYNg5HuFE4nmHET/sJ81UOrALPBRG/mOC6DPzgqHtmb
         cqjmOgToxD0GtnwJKzIhbJy8nzkq30mVp2F9NasaF8FgGBZp7pnc11zLQM4RuwMsKnRU
         tSQtdX1n1mMQ6JNAoNl4X6LMC4JagSltGLmAV9HckFarezyUoUg9/GptuH9bpdlAMr9N
         DOPBrCXOVeCoQCipjYNlkRoLkcmMFs/JrDdfiAeGOyMLWgwpv/YytSVV2ArrOOL8gnOB
         vkFQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=c1n0aLkt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r14si4388769ybm.232.2021.04.16.14.59.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 16 Apr 2021 14:59:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=c1n0aLkt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lXWUS-0008BG-Oh
	for alex.bennee@linaro.org; Fri, 16 Apr 2021 17:59:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45710)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXVdy-0006u9-4L
 for qemu-arm@nongnu.org; Fri, 16 Apr 2021 17:04:50 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629]:46903)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXVdd-0001rv-T9
 for qemu-arm@nongnu.org; Fri, 16 Apr 2021 17:04:49 -0400
Received: by mail-pl1-x629.google.com with SMTP id m18so12424157plc.13
 for <qemu-arm@nongnu.org>; Fri, 16 Apr 2021 14:04:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pwtVsWMVmbv9sqp1N/B2+DpRKMYOpBDEtVpM5RexTu0=;
 b=c1n0aLktOe+6zT06/QQuLNvggpDg+M/p98tmU6Db0PSssv29DVciG0AUjSEVAr4wwe
 eh+IsBBJO/00ZIY3c+S+2V8h+dtGKn8V1MkSStJy3Ck0jK7S/BC1WMC868So/CASfbGZ
 Es3t+G1P1VxobcXzlHFvNr94AUnhEzqYB44BSUjHRjqLVR7EQnR2pT/wHiDYEGvsxV99
 6aHm6SY6CY9InooK9Up6o435tXBIge7PnIZf8ihZPb5YQQuwfNfrokGp+Aq9OibazJ8V
 d04i2Q5LlNVJOYlyxLs6kNOLy0AZ48OExF0buzknAWrBANcvN8EoZ4pbKEC/d+mT0JNl
 e+fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pwtVsWMVmbv9sqp1N/B2+DpRKMYOpBDEtVpM5RexTu0=;
 b=hBZEzVVLU4p5S743/Fi9Z+g8sXBUj1es/cPX7oIqUUez/gGyZkoM7G841Yd72KzKUk
 yzGhrnFMWqT+WssixwqQwWxWxb6noOG4r9WUgOy+nK6JxQEfZ7VoN/sj6QYZ7r6X+Wdr
 rqr0h9aPZdFUpP+PBfId8+8rGPflHYSykHhKRhsSzdN4YUziASnQovK/u0ArozhZyV+9
 5tRI0Cdnj6EuWN3g2xy1JxaZkhIKa4okL5MzkGGbfuHwkdkQ7gObGuryW2ZrZiHeUQYj
 o9nefjRYEgz3Ox7w7zCZ56W0W0rgPG/o6aeA/OicOwaLre6Y8ywRBktox+DfOq+04tvF
 gWCw==
X-Gm-Message-State: AOAM530DFMXPmXtVomKFc7+EMQJMyUoVc+5JnOXS8E7drG7TNJtcFhut
 LbMkV/k1EnTmRUUMln4RKEYqPuwvAbjwwg==
X-Received: by 2002:a17:90a:670a:: with SMTP id
 n10mr11561574pjj.176.1618607068373; 
 Fri, 16 Apr 2021 14:04:28 -0700 (PDT)
Received: from localhost.localdomain ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id m9sm5766734pgt.65.2021.04.16.14.04.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Apr 2021 14:04:28 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 78/81] target/arm: Split decode of VSDOT and VUDOT
Date: Fri, 16 Apr 2021 14:02:37 -0700
Message-Id: <20210416210240.1591291-79-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210416210240.1591291-1-richard.henderson@linaro.org>
References: <20210416210240.1591291-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4RonbsBylu6Z

Now that we have a common helper, sharing decode does not
save much.  Also, this will solve an upcoming naming problem.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/neon-shared.decode   |  9 ++++++---
 target/arm/translate-neon.c.inc | 30 ++++++++++++++++++++++--------
 2 files changed, 28 insertions(+), 11 deletions(-)

diff --git a/target/arm/neon-shared.decode b/target/arm/neon-shared.decode
index facb621450..2d94369750 100644
--- a/target/arm/neon-shared.decode
+++ b/target/arm/neon-shared.decode
@@ -46,8 +46,9 @@ VCMLA          1111 110 rot:2 . 1 . .... .... 1000 . q:1 . 0 .... \
 VCADD          1111 110 rot:1 1 . 0 . .... .... 1000 . q:1 . 0 .... \
                vm=%vm_dp vn=%vn_dp vd=%vd_dp size=%vcadd_size
 
-# VUDOT and VSDOT
-VDOT           1111 110 00 . 10 .... .... 1101 . q:1 . u:1 .... \
+VSDOT          1111 110 00 . 10 .... .... 1101 . q:1 . 0 .... \
+               vm=%vm_dp vn=%vn_dp vd=%vd_dp
+VUDOT          1111 110 00 . 10 .... .... 1101 . q:1 . 1 .... \
                vm=%vm_dp vn=%vn_dp vd=%vd_dp
 
 # VFM[AS]L
@@ -61,7 +62,9 @@ VCMLA_scalar   1111 1110 0 . rot:2 .... .... 1000 . q:1 index:1 0 vm:4 \
 VCMLA_scalar   1111 1110 1 . rot:2 .... .... 1000 . q:1 . 0 .... \
                vm=%vm_dp vn=%vn_dp vd=%vd_dp size=2 index=0
 
-VDOT_scalar    1111 1110 0 . 10 .... .... 1101 . q:1 index:1 u:1 vm:4 \
+VSDOT_scalar   1111 1110 0 . 10 .... .... 1101 . q:1 index:1 0 vm:4 \
+               vn=%vn_dp vd=%vd_dp
+VUDOT_scalar   1111 1110 0 . 10 .... .... 1101 . q:1 index:1 1 vm:4 \
                vn=%vn_dp vd=%vd_dp
 
 %vfml_scalar_q0_rm 0:3 5:1
diff --git a/target/arm/translate-neon.c.inc b/target/arm/translate-neon.c.inc
index d9901c0153..2fd6478d3c 100644
--- a/target/arm/translate-neon.c.inc
+++ b/target/arm/translate-neon.c.inc
@@ -260,15 +260,22 @@ static bool trans_VCADD(DisasContext *s, arg_VCADD *a)
     return true;
 }
 
-static bool trans_VDOT(DisasContext *s, arg_VDOT *a)
+static bool trans_VSDOT(DisasContext *s, arg_VSDOT *a)
 {
     if (!dc_isar_feature(aa32_dp, s)) {
         return false;
     }
     return do_neon_ddda(s, a->q * 7, a->vd, a->vn, a->vm, 0,
-                        a->u
-                        ? gen_helper_gvec_udot_b
-                        : gen_helper_gvec_sdot_b);
+                        gen_helper_gvec_sdot_b);
+}
+
+static bool trans_VUDOT(DisasContext *s, arg_VUDOT *a)
+{
+    if (!dc_isar_feature(aa32_dp, s)) {
+        return false;
+    }
+    return do_neon_ddda(s, a->q * 7, a->vd, a->vn, a->vm, 0,
+                        gen_helper_gvec_udot_b);
 }
 
 static bool trans_VFML(DisasContext *s, arg_VFML *a)
@@ -320,15 +327,22 @@ static bool trans_VCMLA_scalar(DisasContext *s, arg_VCMLA_scalar *a)
                              FPST_STD, gen_helper_gvec_fcmlas_idx);
 }
 
-static bool trans_VDOT_scalar(DisasContext *s, arg_VDOT_scalar *a)
+static bool trans_VSDOT_scalar(DisasContext *s, arg_VSDOT_scalar *a)
 {
     if (!dc_isar_feature(aa32_dp, s)) {
         return false;
     }
     return do_neon_ddda(s, a->q * 6, a->vd, a->vn, a->vm, a->index,
-                        a->u
-                        ? gen_helper_gvec_udot_idx_b
-                        : gen_helper_gvec_sdot_idx_b);
+                        gen_helper_gvec_sdot_idx_b);
+}
+
+static bool trans_VUDOT_scalar(DisasContext *s, arg_VUDOT_scalar *a)
+{
+    if (!dc_isar_feature(aa32_dp, s)) {
+        return false;
+    }
+    return do_neon_ddda(s, a->q * 6, a->vd, a->vn, a->vm, a->index,
+                        gen_helper_gvec_udot_idx_b);
 }
 
 static bool trans_VFML_scalar(DisasContext *s, arg_VFML_scalar *a)
-- 
2.25.1

