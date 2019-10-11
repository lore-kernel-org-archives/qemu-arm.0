Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp1022563wrm;
        Fri, 11 Oct 2019 09:04:14 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzCLFU0I5ogzl/rIaq4r2elAqcRY8lWxaAjR1ai50FvM5WB+0O8bzkmj0XJWH+HsuAbCEGc
X-Received: by 2002:a17:906:c49:: with SMTP id t9mr14664201ejf.267.1570809854268;
        Fri, 11 Oct 2019 09:04:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570809854; cv=none;
        d=google.com; s=arc-20160816;
        b=P+7+3az+gWblOwcYEl9XknTVYbWcaeedz7X4JvBJAZkuH4pifBoYtb84LIABdMRvjn
         7Yl6TqCk4NtMaZaLnzu2ME7SexOqDZQocoPK23bOQGbC9qSLSxlUVkhu4t+EPXG5sBeI
         8ZElCW2SXpcQEXg/tlpvaURBeAne6oMqgIGJ7xpWawp7mjx7KTIqbvdGhSqCb4pa2mCL
         9nY4GdJgmGQrQOapiEkiN4AGWg+BJPOnF472xDHs7g3S1vKwaOzR5u22ixSQdr91F64y
         PR6u8MbBP4Dlaz9Q3fxJeM0CvJ+FOPkg9GOfZMh8hX+b5JgL22QPs665SUi/wYbVEQiX
         EnQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:references:in-reply-to
         :message-id:date:subject:to:from:dkim-signature;
        bh=iqTlbqaEumCeViAxHmy3brKEyzF/IL5OcylNHq80qOA=;
        b=WS/6D4ZzG7ZdYIPYvidlksD4k/7Uckxh1o4IldHaWipl/94z/yZyENv1+vyk5m/okg
         44p5AU8GF7rq8rdHdnA1pZgoW3vezOX+MNMIlIqRc9Vw2oBeLwEpsmuuN1rlx+ZVriP2
         i+69LDiYzkVF90pVwAE66zgDsc42dZl1GKQNVNwxQyfqR2/LVzi4nuVAh42o5toK23lb
         m8xJI1eSHv+Gji8SbeUPhK8If2+pLUihzFXmdZ8z3nNepMxThW3UWGoOSEBTQE9f5gjY
         OX2dt96dVSqkUvJnMB7nWfj128RmwHZlJeX5ZnXC+wQ5ikw3mqqmQDdOV4qA9GS9MXKK
         t/eg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=LlaPsAfS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k14si6180094ede.421.2019.10.11.09.04.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 11 Oct 2019 09:04:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=LlaPsAfS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iIxOm-0003SZ-Pj
	for alex.bennee@linaro.org; Fri, 11 Oct 2019 12:04:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33723)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1iIxGq-0002RB-9S
 for qemu-arm@nongnu.org; Fri, 11 Oct 2019 11:56:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1iIxGp-0007gJ-5e
 for qemu-arm@nongnu.org; Fri, 11 Oct 2019 11:56:00 -0400
Received: from mail-yb1-xb41.google.com ([2607:f8b0:4864:20::b41]:39997)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1iIxGp-0007g8-1k
 for qemu-arm@nongnu.org; Fri, 11 Oct 2019 11:55:59 -0400
Received: by mail-yb1-xb41.google.com with SMTP id s7so3254937ybq.7
 for <qemu-arm@nongnu.org>; Fri, 11 Oct 2019 08:55:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=iqTlbqaEumCeViAxHmy3brKEyzF/IL5OcylNHq80qOA=;
 b=LlaPsAfSZ9ajH0n/1v6zbHEnrz97OeHhwUUtJCeQvP+1xHOkAd54BXlZbLPsSV+yx1
 /4LxMyYD4sdNS/WBhp9O5MF4v6kKMCPTXuPeGojNocanhka7xK2/mJ8pI0vLbNXW24+/
 rhW50d+qU/ZqSheeixunH7PNW5rOB0VFa18L4MHo8ySH/w+9rf52cQ+FM1i8pLSQRrEs
 TnnO+QjWfwAQu7/p4KLZqV7Lx0NFq3X1bSeAmGVTRLO9o4IxYPfO9ucRzfJvOF2wgVPP
 4nmPDDdluOdjw9qINF8rQVt9jrVCPztH27iROZYVKpwUIlvDKo+evX0qjO3t4NjYheDk
 yFvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=iqTlbqaEumCeViAxHmy3brKEyzF/IL5OcylNHq80qOA=;
 b=nJz46bMu5WqBOiOJJ17MWfMbtfecgKY5y/QUfmyUZ2k/P+I6C33TbX4DzA6WTbfPSC
 Zv4AvvvWqbJ67fHIu4qD58yehwcTQm9HvznwFBW9o8qiLKJKNXMQvIzQOFHxYLNNEXym
 Q4zKRTIFkcvFt9Tdt6OcA1RyPtZuzHEPlJ1f5dzVnnnlPMV65M68+yf15yrxLbj92FO0
 Hzg7be/6P5Q9PhGwh4EYYgtH+mrfRKstRacBPRe3VTenH9aLkFQBfI6RG6YqqcPXeu4i
 goOqOkbDHZcqnEKiR6AXdGuoiAcpyWhZqc3WkRPnpJKT1VYsVEk0S0EGpBKFFcaOLiiZ
 CGLw==
X-Gm-Message-State: APjAAAXKvgcL7lIj2+kBminqOKCcub5895U6ew7KqsOuBIiMPZeO/ORy
 5EKnvYMgq1HdKYNX5pG9oW1zmQ==
X-Received: by 2002:a25:4b04:: with SMTP id y4mr10225057yba.480.1570809358429; 
 Fri, 11 Oct 2019 08:55:58 -0700 (PDT)
Received: from cloudburst.gateway.pace.com (67.216.151.25.pool.hargray.net.
 [67.216.151.25])
 by smtp.gmail.com with ESMTPSA id d17sm2473139ywb.95.2019.10.11.08.55.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Oct 2019 08:55:57 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 09/20] target/arm: Hoist XSCALE_CPAR, VECLEN,
 VECSTRIDE in cpu_get_tb_cpu_state
Date: Fri, 11 Oct 2019 11:55:35 -0400
Message-Id: <20191011155546.14342-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191011155546.14342-1-richard.henderson@linaro.org>
References: <20191011155546.14342-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::b41
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
Cc: laurent.desnogues@gmail.com, peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 8PFgCvYXiymu

We do not need to compute any of these values for M-profile.
Further, XSCALE_CPAR overlaps VECSTRIDE so obviously the two
sets must be mutually exclusive.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 21 ++++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index ddd21edfcf..e2a62cf19a 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -11235,21 +11235,28 @@ void cpu_get_tb_cpu_state(CPUARMState *env, target_ulong *pc,
             }
         } else {
             flags = rebuild_hflags_a32(env, fp_el, mmu_idx);
+
+            /*
+             * Note that XSCALE_CPAR shares bits with VECSTRIDE.
+             * Note that VECLEN+VECSTRIDE are RES0 for M-profile.
+             */
+            if (arm_feature(env, ARM_FEATURE_XSCALE)) {
+                flags = FIELD_DP32(flags, TBFLAG_A32,
+                                   XSCALE_CPAR, env->cp15.c15_cpar);
+            } else {
+                flags = FIELD_DP32(flags, TBFLAG_A32, VECLEN,
+                                   env->vfp.vec_len);
+                flags = FIELD_DP32(flags, TBFLAG_A32, VECSTRIDE,
+                                   env->vfp.vec_stride);
+            }
         }
 
         flags = FIELD_DP32(flags, TBFLAG_A32, THUMB, env->thumb);
-        flags = FIELD_DP32(flags, TBFLAG_A32, VECLEN, env->vfp.vec_len);
-        flags = FIELD_DP32(flags, TBFLAG_A32, VECSTRIDE, env->vfp.vec_stride);
         flags = FIELD_DP32(flags, TBFLAG_A32, CONDEXEC, env->condexec_bits);
         if (env->vfp.xregs[ARM_VFP_FPEXC] & (1 << 30)
             || arm_el_is_aa64(env, 1) || arm_feature(env, ARM_FEATURE_M)) {
             flags = FIELD_DP32(flags, TBFLAG_A32, VFPEN, 1);
         }
-        /* Note that XSCALE_CPAR shares bits with VECSTRIDE */
-        if (arm_feature(env, ARM_FEATURE_XSCALE)) {
-            flags = FIELD_DP32(flags, TBFLAG_A32,
-                               XSCALE_CPAR, env->cp15.c15_cpar);
-        }
     }
 
     /* The SS_ACTIVE and PSTATE_SS bits correspond to the state machine
-- 
2.17.1

