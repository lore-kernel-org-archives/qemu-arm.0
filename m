Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp505696lfg;
        Fri, 30 Apr 2021 14:21:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwhFqWCQi5AMlFX7Y/rlCKSb+MUG6B7yZCNWJpUFFNbKxl6APz+8d3ky3QN+VTC73GhVoIJ
X-Received: by 2002:a92:320f:: with SMTP id z15mr5800502ile.231.1619817681056;
        Fri, 30 Apr 2021 14:21:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1619817681; cv=none;
        d=google.com; s=arc-20160816;
        b=DNceDGR1KrQLAyKjsMW7KJ1JDKkCuVEGG9JfGQBYBgDSNSlir32fStIxB+FrMmGiqb
         XOX91eKg0NnIfuUP9d0SVRjthfsFkN/ptZAMnQj6f+D/P4nnxpcIeU/CuGW3DfVDwKHb
         e9mTjfgbntVBUL//8229uy9H9G/GYv5xblV9RgOhOnfo43ODIObpJWuqMqmMpKpC/DIi
         EUsC02pZkbbg5FfL+UC7I+53788HpxJ8PUvhONbN3cvecDiggjcjNsy3jHfUa+rLgAWF
         dTHBAeu2FBzdQeufk9zwasJYIkwamzq5ulxkr9MLnEhS7cZX5fedpjx4aUtkzS+aO56G
         aWZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=5QZBm0ZbmeHWM8+kmZROLRH67189ZahrRUX3tXQtOLs=;
        b=Uzw7JL+HmH/85lZtUnah9QWya64bnXpCoaf6AXzoLeaZ5NVEsTkUnI1bUNHPeIRsdS
         UAo25EOrZ1AfBIcbkM1K+Lo5gY4kxXQP6wpqMVVVrBIVxDFBzXzpm0mwuUpOZWLT/2pl
         rSqWdG0lFMlcP6s53NGs9NxQdPij0lbKiyGAPaVwrW1OrwxwZ8X7SA5yN8tli8PlcdEH
         1hFMV+/BLc8J2P0ZTB8ApJiI8H2q6HU/k400XqWSlEQC1hgWvvjnsezJ8f7Ro6pqiHbs
         xGpHetac/AHlf8mmI7DafjvxDjADTPLMKKht8l7tQxmJUeGoCHo8L9bsS+Ok52/Y3IE2
         YJYQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=L6EBd6sv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x7si3341741ilv.97.2021.04.30.14.21.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 30 Apr 2021 14:21:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=L6EBd6sv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lcaZc-00078Q-Bt
	for alex.bennee@linaro.org; Fri, 30 Apr 2021 17:21:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcZn5-0005D7-EO
 for qemu-arm@nongnu.org; Fri, 30 Apr 2021 16:31:11 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c]:44721)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcZlx-0007ou-Lp
 for qemu-arm@nongnu.org; Fri, 30 Apr 2021 16:31:11 -0400
Received: by mail-pl1-x62c.google.com with SMTP id y1so21580494plg.11
 for <qemu-arm@nongnu.org>; Fri, 30 Apr 2021 13:30:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5QZBm0ZbmeHWM8+kmZROLRH67189ZahrRUX3tXQtOLs=;
 b=L6EBd6svZU7a1AGWporDcn5T9zOKueKfe1gG6ZJR7JfzLeV9hQc7SQ8cdchctd9ItP
 KgnPxbeLBYPBaN8Jgnh0ixDQPwWyprqDGwCZMIR8YqCD5CNdHFzeWuNOlx+wlrhqBerR
 HxnJGJoVNz1zvt2lvmPpsKjCboKpdVSKHY9qy/Upin3p41/iSxtvOAMfDaumclqKwJkH
 oG4b7MDn9FEaAtXWs8B1TTQ+aY/mfUDgjZ/DJoEFSUyv90W0eV2i43mPxfHryn+457RL
 4Ch8H5KFfKNGcRhYT42WH7npS+4TlKU/r0AwRWEeN4PatL4d4FWxrS5m+JwC/V2KBqFq
 4Nyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5QZBm0ZbmeHWM8+kmZROLRH67189ZahrRUX3tXQtOLs=;
 b=oBlvr0+0AskC6ck6BWwLu+3pP7TSOXhXEk0vtE0WZ8Xt9/tM7aVWzPdwHvI7aPVG9h
 YSGpLG0neosMGV5qKlvNPQBZVdJ37y8xzJDt4sMVLcrEUYhL4ffgFvVfJuILqsh2hBWl
 DQS8d5l1/Rzvq5kIxnqTVnXRsuRS9qFX9tyv9JBnaXaNMUN7D6+yygRF+X7/7rHxTj+m
 80OR0gwHkwKBw+DL1lqEK9yzlFie6NnOPb0FEMd+S9zfMU9rPFdlm+tW+6avhh/s+bUt
 kBLSg/yoPeGI5fHihbuP/u9ImzeUB5sP+GXbqjbgccsvzP+v67ENdt4vbwvtb2QLvPxD
 gHPw==
X-Gm-Message-State: AOAM531tqz7GgTYARnP3q8+WwWLE6pRSmW+l0vpMaiV/udslsGxeBkf/
 968T79BO/sIi9imX0i3ctn5S5A==
X-Received: by 2002:a17:90a:e649:: with SMTP id
 ep9mr15423267pjb.8.1619814599705; 
 Fri, 30 Apr 2021 13:29:59 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id q23sm3788781pgt.42.2021.04.30.13.29.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Apr 2021 13:29:59 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 78/82] target/arm: Split decode of VSDOT and VUDOT
Date: Fri, 30 Apr 2021 13:26:06 -0700
Message-Id: <20210430202610.1136687-79-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210430202610.1136687-1-richard.henderson@linaro.org>
References: <20210430202610.1136687-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: VYnYsQVjk8aF

Now that we have a common helper, sharing decode does not
save much.  Also, this will solve an upcoming naming problem.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/neon-shared.decode |  9 ++++++---
 target/arm/translate-neon.c   | 30 ++++++++++++++++++++++--------
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
diff --git a/target/arm/translate-neon.c b/target/arm/translate-neon.c
index 52b75ff76f..194e329b6c 100644
--- a/target/arm/translate-neon.c
+++ b/target/arm/translate-neon.c
@@ -269,15 +269,22 @@ static bool trans_VCADD(DisasContext *s, arg_VCADD *a)
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
@@ -329,15 +336,22 @@ static bool trans_VCMLA_scalar(DisasContext *s, arg_VCMLA_scalar *a)
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

