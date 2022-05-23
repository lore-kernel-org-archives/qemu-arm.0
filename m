Received: by 2002:a19:ef07:0:0:0:0:0 with SMTP id n7csp3755069lfh;
        Mon, 23 May 2022 13:52:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwevRga886aQiOmcCKj8j50qLVT3011gAjIFle3vfoOCMWavqAeuNyiVDTwF0ai4JE/eYUx
X-Received: by 2002:a37:ab01:0:b0:6a3:4bb6:50e8 with SMTP id u1-20020a37ab01000000b006a34bb650e8mr10722817qke.255.1653339143752;
        Mon, 23 May 2022 13:52:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1653339143; cv=none;
        d=google.com; s=arc-20160816;
        b=P7uLc8frBwjfLqKPaetLmosi0AiUmZr8MhCbaIlOXgR0mw766Mh2mc1cuerhJBw97q
         rvm0Kc8unk/xiKA8l7uvrJWFZ0iwoYupqsG7MW8zMp8/YsxZbwAzjP6jle+QI4r9Ox2P
         R0koeS4lkjB+KvEZjRt+Z/aQT80hfApUTPpS0stg1YV0yyz37TJxn4m5APCJ4Wm6jF3P
         +xZOedzy1Abf8+8DYqciDS3ISPG8HSigwPuSsrAW/QPNXN3zgtdRKgQ4jyjP0EDx+uwF
         oYHKnRO+BVx4whwYpOQDxPLpeIWk4mJ0fQj003OAsHd6SEAjlzqJ//6J8zyAABdxrDFt
         eNNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=vy83GOBaz0c9nFoZWpk3k7JL3LGlXb9nxH3dH76w/MM=;
        b=b26hV+JMlWBpJ1zdWOqhG0l08MptjBK481foTkxnZKLnNs+AkNE3emJ23MpSQx/N75
         NrQr2uBdVJwKncALAJbF68q3xUPIqxFeiQRhxCw+QtShNU5Ck3v1BH6CAvBL6NUE3qmp
         rhAq4VM0pA0Gt63ViC8aGoG/q9vj8CnPqyQxDpELTWbvw0J3twm9JlDD6vdxxOSfK3L/
         ay1V0CaUsr7lk18MiokHGCU2vJXDac47KF4wAu9sB+X30s8lhynMTu3mTQhiqVSR/dm/
         XF/0hkXm1j+Vte2ZSHRO5Ke1OXEDLOnPQJWcJTTsvpZuMAM1HlF6JqSTVX5qfIjP4eCv
         BTuQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tvh5ypp1;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 14-20020ad45bae000000b00456344a8d86si3001062qvq.124.2022.05.23.13.52.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 May 2022 13:52:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tvh5ypp1;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ntF2N-0006FN-7Z
	for alex.bennee@linaro.org; Mon, 23 May 2022 16:52:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ntEy1-0008FL-Or
 for qemu-devel@nongnu.org; Mon, 23 May 2022 16:47:53 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:44553)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ntExy-00050J-3L
 for qemu-devel@nongnu.org; Mon, 23 May 2022 16:47:53 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 pq9-20020a17090b3d8900b001df622bf81dso363199pjb.3
 for <qemu-devel@nongnu.org>; Mon, 23 May 2022 13:47:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vy83GOBaz0c9nFoZWpk3k7JL3LGlXb9nxH3dH76w/MM=;
 b=tvh5ypp1qO+lPVgKSGyu3Qu8nwG1YfW8zb6Y0hePkEeEjpYlLOHf0Dgt1//Po552Wf
 iMivU0x4pfSRtmqmUbOsiHo1yYLWmWn1DMEBkdBOjtms2nqd5kjfTfpOvN5egAxwbU2k
 juUHI1LPFc3HcC3uBtA2rUgpTHp0MIYbmAZynOVWhZ4metwn2BG5KBf1JZfL6TvHNAW4
 /BcUVbtUJXVBxzYcHzfp2Y+pBZCcKPRQfMQUsFNR192vC65ir74YjRi6bvKUlq8K+yvi
 56JKeQ94RQG4nzNmmmkqrYjiMb3oHy1YLRSByLs5ijgq4jilJzOlDkRNKAycoRNbLbjd
 PqLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vy83GOBaz0c9nFoZWpk3k7JL3LGlXb9nxH3dH76w/MM=;
 b=MD546FFarIelKgchwuhoUudIIygM91e0XId6gIz35BNiJ9Lu0uiDxyKglyeQ8SSHOv
 kQC2Boiks1JJL/XLLl7lM7fuP/iEi7di4PNHTF7SN9ozf1DJNXZpfaJqxH7Tl52usOdJ
 nT61uni4FGJaKsSvPoQEDKX3wsw22Hwg7QmLsafPL6xafByzdQH5QKYZ4zam2VcEuACl
 1Lb4wQrHnmKgCQmT7OExtMl3q5Qlaf79c4KWobCPli11w8lgCLNXk7eL89CDaLLdURZ8
 KjdjxMZny5ShL2/02SejxzcVx2Wc7/TSVG/4xdnzpvmPvSSwDY2aUS7TVVmIthnxbgbA
 YVGg==
X-Gm-Message-State: AOAM533aoPRKnITHKCDAc6qsKQ7sZUFnacbJdSvWRfPyK8yvNLzbfvba
 NAMFBEQrZR3cOkblwhbdFB4Xhzj7xx8Q4w==
X-Received: by 2002:a17:90b:1808:b0:1e0:4dbc:8781 with SMTP id
 lw8-20020a17090b180800b001e04dbc8781mr866356pjb.58.1653338868916; 
 Mon, 23 May 2022 13:47:48 -0700 (PDT)
Received: from stoup.. ([71.212.142.129]) by smtp.gmail.com with ESMTPSA id
 c16-20020a624e10000000b0050dc7628142sm7721788pfb.28.2022.05.23.13.47.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 May 2022 13:47:48 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 05/18] target/arm: Move arm_singlestep_active out of line
Date: Mon, 23 May 2022 13:47:29 -0700
Message-Id: <20220523204742.740932-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220523204742.740932-1-richard.henderson@linaro.org>
References: <20220523204742.740932-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
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
X-TUID: 9b0N0SpcoDjd

Move the function to debug_helper.c, and the
declaration to internals.h.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h          | 10 ----------
 target/arm/internals.h    |  1 +
 target/arm/debug_helper.c | 12 ++++++++++++
 3 files changed, 13 insertions(+), 10 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index c1865ad5da..2e115a0281 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -3087,16 +3087,6 @@ static inline bool arm_generate_debug_exceptions(CPUARMState *env)
     }
 }
 
-/* Is single-stepping active? (Note that the "is EL_D AArch64?" check
- * implicitly means this always returns false in pre-v8 CPUs.)
- */
-static inline bool arm_singlestep_active(CPUARMState *env)
-{
-    return extract32(env->cp15.mdscr_el1, 0, 1)
-        && arm_el_is_aa64(env, arm_debug_target_el(env))
-        && arm_generate_debug_exceptions(env);
-}
-
 static inline bool arm_sctlr_b(CPUARMState *env)
 {
     return
diff --git a/target/arm/internals.h b/target/arm/internals.h
index a71f795628..b447d850ae 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1317,5 +1317,6 @@ void define_cortex_a72_a57_a53_cp_reginfo(ARMCPU *cpu);
 #endif
 
 void aa32_max_features(ARMCPU *cpu);
+bool arm_singlestep_active(CPUARMState *env);
 
 #endif
diff --git a/target/arm/debug_helper.c b/target/arm/debug_helper.c
index 46893697cc..1abf41c5f8 100644
--- a/target/arm/debug_helper.c
+++ b/target/arm/debug_helper.c
@@ -11,6 +11,18 @@
 #include "exec/exec-all.h"
 #include "exec/helper-proto.h"
 
+
+/*
+ * Is single-stepping active? (Note that the "is EL_D AArch64?" check
+ * implicitly means this always returns false in pre-v8 CPUs.)
+ */
+bool arm_singlestep_active(CPUARMState *env)
+{
+    return extract32(env->cp15.mdscr_el1, 0, 1)
+        && arm_el_is_aa64(env, arm_debug_target_el(env))
+        && arm_generate_debug_exceptions(env);
+}
+
 /* Return true if the linked breakpoint entry lbn passes its checks */
 static bool linked_bp_matches(ARMCPU *cpu, int lbn)
 {
-- 
2.34.1

