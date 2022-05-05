Received: by 2002:a19:3859:0:0:0:0:0 with SMTP id d25csp1306089lfj;
        Thu, 5 May 2022 12:27:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxmUlbNOguNrn43pu7CH5hHUoLAje3gYawRaxfuXswW4bSU0jV1GEVtOv1Sev1GYhC1mPHf
X-Received: by 2002:a05:620a:280e:b0:680:d1b9:6b0 with SMTP id f14-20020a05620a280e00b00680d1b906b0mr20928114qkp.391.1651778823116;
        Thu, 05 May 2022 12:27:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1651778823; cv=none;
        d=google.com; s=arc-20160816;
        b=UAAtLFLGHGujbY5IqieeYn3Vv2E4E5T9iZLii35d4NlXNQsMFJRyPL3H764R5rlBik
         Esi30/NPd9Bmf/dnPYnBTrN0uv7sFlTJu8dWu8D9hsHRwKxTe+xSLYnn+KToS/Yz6qru
         pdVYysaqqBStXN2kNX+mIF1jfPyqehicY69qLNlyX01XKNs/UCKENRu34Wpce9pkLE1o
         PJJ5TO8X466QnB65HR07n/auOKyD80YhXGFO1F5zQRJMCK6cUIfd7yk3NAWxM1pcwfRC
         rt0TUmhPkWHiQWGH0bCEIHnrSf17wgAJ7xitJwBcq09Tn+XZ5BU3yV93ZFDGYz9iuqTj
         jcZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=NgxsvnW311osB1m0PaTzB1/zyzTpUBL9MpOPjCAC0zA=;
        b=ezIGsXCuMn6JVfy3SiMPcFYfbncvN8uBF7q56WEpf72SK8VyKYCSgx/FR9stB617yy
         FCeSKP/OBizEm93rDQebFwTE6p/YySTzHYgrkwrfGb/N/hyna95dxQ94IIZ7iuhq6xmP
         5ok2ImZ7/q8T/4LtwBQl32IRrmIm/A/jmrWoFXQ6q/PfG7MplrhoOue24WLUNh5HvbJu
         SAXY6nZ5uUqT8ObRzKGN74KG0Ki+pv7fiy1O7EwmO/qvcVdEhTJJCY21Bm27XWEm8KeA
         v4E8KA4QbSjGxyzImRU+hp3SFWGdUf1s0xSCogctGcj+B1gNonHRIP159hCkP6IegNBx
         9ixg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZL6oSjQY;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h15-20020a05620a244f00b0069ff2ff28c1si1640300qkn.417.2022.05.05.12.27.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 05 May 2022 12:27:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZL6oSjQY;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nmh7u-0006Os-Dv
	for alex.bennee@linaro.org; Thu, 05 May 2022 15:27:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nmgYa-0002tV-JN
 for qemu-devel@nongnu.org; Thu, 05 May 2022 14:50:32 -0400
Received: from mail-oi1-x232.google.com ([2607:f8b0:4864:20::232]:33579)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nmgYU-0004SW-SU
 for qemu-devel@nongnu.org; Thu, 05 May 2022 14:50:32 -0400
Received: by mail-oi1-x232.google.com with SMTP id l203so5285697oif.0
 for <qemu-devel@nongnu.org>; Thu, 05 May 2022 11:50:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NgxsvnW311osB1m0PaTzB1/zyzTpUBL9MpOPjCAC0zA=;
 b=ZL6oSjQYgwGvyUmbOuJhH2oROr1BUhbzBbvfpXFeMMAKsWWDHhYhoM6jwz4UyelgvS
 0aB9q7uCgvGqkSNPIC65s0GDcyqJ0fiRpzDZv6LzjA0ywZdWEgBsYmwXhysDbyCgwFU8
 aYBXJq7w1VsoBdBL3euDE4SEw+cewDavI/ApkPPWhmHwb20FeB5XRyesS/hSXp69JeJO
 o4Yvx/pA65eo1IL1KsZnR89Xv33MdFa/xwaJvENjjDZm9KiuC3MwzK8IWTyFJqrBPsal
 iSIjuvjp7T5lFvrGK6EQJlZRj6oLSQs6tn0qOetO2wZHlv0xM1aXxlqPXL+y+DX/wj9y
 yDcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NgxsvnW311osB1m0PaTzB1/zyzTpUBL9MpOPjCAC0zA=;
 b=F4DyOcJKZ3sN0HTzFHhIz7XO1h/5q8olJkqxCG78lax2pGsNLUoHJqdlQ9G2BPw5Wi
 fLsCxJHRioEZx0nitdtnJslQMnJ9bfxTCFyCQN+AZwt2vmY1Bv2zFEMtXla9xdbQ8u0g
 fb8R27/U0ucS2phpN6Nk5JHHzI/7KGn23LP4UgBRev7dKMYD7EV4RH/+bbzpJsJDbP4b
 lkwphzp7dlHQyFIRaDHroR9ei4bE/NU3AS/6fPo/7QQRROMfqSGbqUqIymmKKWu/eiLq
 VVXMec9eNVE4FI3yPe4GVhngvc41bbc9DWye/mw9CdUcOS6K7zX2/+IcB8zhSd26Atoy
 PDQQ==
X-Gm-Message-State: AOAM533ZUMRZCNIL3t6OdcUlRRZtkESJrTy85sq4XZa4bcyR2M1wXPwk
 0rIZcn32KBqVWAItHnNKXAyhNakfEw6IqJV0
X-Received: by 2002:a05:6808:1b13:b0:326:8545:bc60 with SMTP id
 bx19-20020a0568081b1300b003268545bc60mr1089318oib.286.1651776625765; 
 Thu, 05 May 2022 11:50:25 -0700 (PDT)
Received: from stoup.. ([2607:fb90:5fe8:83ea:bbf4:c9ef:4f3:11c6])
 by smtp.gmail.com with ESMTPSA id
 s36-20020a0568302aa400b0060603221259sm857273otu.41.2022.05.05.11.50.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 May 2022 11:50:25 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v5 12/24] target/arm: Enable FEAT_Debugv8p4 for -cpu max
Date: Thu,  5 May 2022 13:49:54 -0500
Message-Id: <20220505185006.200555-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220505185006.200555-1-richard.henderson@linaro.org>
References: <20220505185006.200555-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::232;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x232.google.com
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
X-TUID: H+xG5g3MwN6d

This extension concerns changes to the External Debug interface,
with Secure and Non-secure access to the debug registers, and all
of it is outside the scope of QEMU.  Indicating support for this
is mandatory with FEAT_SEL2, which we do implement.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v2: Update emulation.rst
---
 docs/system/arm/emulation.rst | 1 +
 target/arm/cpu64.c            | 2 +-
 target/arm/cpu_tcg.c          | 4 ++--
 3 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/docs/system/arm/emulation.rst b/docs/system/arm/emulation.rst
index 965f35d8c9..0acac6347c 100644
--- a/docs/system/arm/emulation.rst
+++ b/docs/system/arm/emulation.rst
@@ -15,6 +15,7 @@ the following architecture extensions:
 - FEAT_DIT (Data Independent Timing instructions)
 - FEAT_DPB (DC CVAP instruction)
 - FEAT_Debugv8p2 (Debug changes for v8.2)
+- FEAT_Debugv8p4 (Debug changes for v8.4)
 - FEAT_DotProd (Advanced SIMD dot product instructions)
 - FEAT_FCMA (Floating-point complex number instructions)
 - FEAT_FHM (Floating-point half-precision multiplication instructions)
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 202fd5c46e..88d3cef93e 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -799,7 +799,7 @@ static void aarch64_max_initfn(Object *obj)
     cpu->isar.id_aa64zfr0 = t;
 
     t = cpu->isar.id_aa64dfr0;
-    t = FIELD_DP64(t, ID_AA64DFR0, DEBUGVER, 8);  /* FEAT_Debugv8p2 */
+    t = FIELD_DP64(t, ID_AA64DFR0, DEBUGVER, 9);  /* FEAT_Debugv8p4 */
     t = FIELD_DP64(t, ID_AA64DFR0, PMUVER, 5);    /* FEAT_PMUv3p4 */
     cpu->isar.id_aa64dfr0 = t;
 
diff --git a/target/arm/cpu_tcg.c b/target/arm/cpu_tcg.c
index b6fc3752f2..337598e949 100644
--- a/target/arm/cpu_tcg.c
+++ b/target/arm/cpu_tcg.c
@@ -76,8 +76,8 @@ void aa32_max_features(ARMCPU *cpu)
     cpu->isar.id_pfr2 = t;
 
     t = cpu->isar.id_dfr0;
-    t = FIELD_DP32(t, ID_DFR0, COPDBG, 8);        /* FEAT_Debugv8p2 */
-    t = FIELD_DP32(t, ID_DFR0, COPSDBG, 8);       /* FEAT_Debugv8p2 */
+    t = FIELD_DP32(t, ID_DFR0, COPDBG, 9);        /* FEAT_Debugv8p4 */
+    t = FIELD_DP32(t, ID_DFR0, COPSDBG, 9);       /* FEAT_Debugv8p4 */
     t = FIELD_DP32(t, ID_DFR0, PERFMON, 5);       /* FEAT_PMUv3p4 */
     cpu->isar.id_dfr0 = t;
 }
-- 
2.34.1

