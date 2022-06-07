Received: by 2002:a19:ee12:0:0:0:0:0 with SMTP id g18csp1803612lfb;
        Mon, 6 Jun 2022 19:50:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwHm0J8KlqeYMZGVf1657XFZFqART76WyQ3ifKIhfgQk416L/Pgpdr3W3nj9CDOSeukcxAd
X-Received: by 2002:a05:6214:4013:b0:467:d600:76ea with SMTP id kd19-20020a056214401300b00467d60076eamr17096331qvb.70.1654570237773;
        Mon, 06 Jun 2022 19:50:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654570237; cv=none;
        d=google.com; s=arc-20160816;
        b=JTT9qvOw5ct6UKF+xXM4OG2FKUgIeilyUwmC7R2eeZNe84+MgtqHpl/bjinLjMkkVd
         q2KR1PVijrQ8EIKgrAsA0HCqbXwjdYYWw7SdC8toeyhMUvkW4eY3UmS0BUkwTeyhyJat
         sK33dVHmgN0hmTzMEFN5ooVre3M/SMFTvUUevoukgZvb841XJpnCj6q2MUhttw354XDU
         HiSrreKIJB3xfkB3oZNL73B00DsTh7WGvUzX6LOSBAKQbKkP0s00hj7j4E10KGRqrfpw
         sic2/mHCv6DaBLZummhV30nuP8hppomz36k+eYTHJy6AIe8kRcLngNHUuaw9b5CR5n2v
         1HDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=SyvEw0v6kbVYTBLHikS3UDLCGmQvw9Yz1NNALVd/Wyo=;
        b=NKAgpXo1PaGe9AkV3Er79aJzS6ur14ch7BESyYNYJBtk4FRJHw8aEmrQb80zZbp+zP
         xGPCDMmKutcWtuDEixbu0zwuftIABko91Vt8iWEYyrFR1w53+vuNqkLCS7JJidUnwOvS
         kEIxOQWexaTCeLTZ9Lh0hIzI7ERSS3TphMnQwyVk0gDEKOMV1WKzJtEOTCMYwXrVXLb2
         1Dc6Cc9TcX/OZYaNMoJliRkFtxjb1QfJDKgCTIWV8EfntVRKaO6tUt8LtyiXtjA7kzHe
         i3A3uTYI7BCxDt0bD4jg+T1DGwsOf8eBw44NEjaZqOvfNgO6mMX2tY8IksRLmF27hPLp
         HENg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MBUKvjyr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id az9-20020a05620a170900b006a680e77579si8031063qkb.732.2022.06.06.19.50.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 Jun 2022 19:50:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MBUKvjyr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nyPIj-0003ug-69
	for alex.bennee@linaro.org; Mon, 06 Jun 2022 22:50:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyPFv-0006aU-M8
 for qemu-arm@nongnu.org; Mon, 06 Jun 2022 22:47:43 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d]:45694)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyPFt-0000He-7p
 for qemu-arm@nongnu.org; Mon, 06 Jun 2022 22:47:43 -0400
Received: by mail-pl1-x62d.google.com with SMTP id q18so13632143pln.12
 for <qemu-arm@nongnu.org>; Mon, 06 Jun 2022 19:47:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SyvEw0v6kbVYTBLHikS3UDLCGmQvw9Yz1NNALVd/Wyo=;
 b=MBUKvjyrwR4arOEVmAGOy6mwQkAapGNZLmSgHPucF0q9w2GSR+Y3ddqNSh1gthAq74
 r2GXkomWUFne7L8d1dIR3sElpL8NCx0pzCiM5WEmEtvYZoQZ0e6vxaZ7gcsOPXJo8kXe
 T/vmE2fE0LEWsIUfpzrxQgqETP+yZyyrob6g4Gm4mRUJqleVVw+wuF3wNJ5Bj9eptgu4
 0KxNEL2YkrhOozC8AeYABroTwCP8SQ0ej3Hk9v0boo+5qsOnyKo2M+AzSA0r8yrMO/S9
 G+b9uU4LzHmEoJn+7fxBo3Tolt/jpOlMluQtnPL5VJFZhzJbDgOcTDquQg5lpAX19I+N
 SIyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SyvEw0v6kbVYTBLHikS3UDLCGmQvw9Yz1NNALVd/Wyo=;
 b=11vx534FkbZ9wvmmmkLLQoKH1rtT8bh1r8c1y+uChOLJ5DTI7KWIUz41EILJ8k9cNM
 jevoJvnsXepNZYDT/EjbMVQE/vWcOvCbwDS/CiilOJtISfQ8fM7b8n06ShDQvXNdiQJ0
 15eb0FBUQfVmxAjgPaxg3bnnZTqvHyZOfY+vvPM3qiW0PPMhAfwhjGlFjxQVASF2gBS8
 7mKYI1XKaxKl7YbinhQg28VzP+FAAyO/dvZzqz48iHP6rEct6QgxlUl1yVrZ94fuh/kq
 3yWdzXpzUS0qC9KMAJN3XVt8oTL0ixIcb34CIoY+JG5pwBGraQBLsznNObixMhd1y+WN
 xXMA==
X-Gm-Message-State: AOAM531jc4zssnSlL9Q4DsfpHUYX8UtrETLfLhL8tMk2Nlg6jkoIFR2U
 HGO1G5ISLsif+OxpRWKlqBWvVT61txI7SA==
X-Received: by 2002:a17:90b:170b:b0:1e8:6d34:eba6 with SMTP id
 ko11-20020a17090b170b00b001e86d34eba6mr12740077pjb.105.1654570059849; 
 Mon, 06 Jun 2022 19:47:39 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:d3db:cca:e5c9:6531])
 by smtp.gmail.com with ESMTPSA id
 y26-20020aa7805a000000b0051876d83714sm7476904pfm.196.2022.06.06.19.47.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jun 2022 19:47:39 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 05/25] target/arm: Move arm_singlestep_active out of line
Date: Mon,  6 Jun 2022 19:47:14 -0700
Message-Id: <20220607024734.541321-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220607024734.541321-1-richard.henderson@linaro.org>
References: <20220607024734.541321-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
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
X-TUID: VdyrE40u5D/7

Move the function to debug_helper.c, and the
declaration to internals.h.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
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
index 36c33a6ac5..148f2a9252 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1315,5 +1315,6 @@ void define_cortex_a72_a57_a53_cp_reginfo(ARMCPU *cpu);
 
 void aa32_max_features(ARMCPU *cpu);
 int exception_target_el(CPUARMState *env);
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

