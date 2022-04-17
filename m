Received: by 2002:a19:e348:0:0:0:0:0 with SMTP id c8csp1268262lfk;
        Sun, 17 Apr 2022 10:54:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyTCLRdzuv5g+qyWwRKrwxHEpfLFpJv7/Z+vziO5npWE5SjJVmdFknatPe7tKNUu3tgA4Jw
X-Received: by 2002:a37:2788:0:b0:69e:6b77:f4a2 with SMTP id n130-20020a372788000000b0069e6b77f4a2mr4700077qkn.492.1650218081565;
        Sun, 17 Apr 2022 10:54:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1650218081; cv=none;
        d=google.com; s=arc-20160816;
        b=gt3J8D4f85yWMXplSO/lytMobopGi1R+TuTJRbmszghYaX9q5nFlb4kz/bjzM2GdVl
         hbenSS8lk81OqWLPmsEKu6u5FyQeD4LuaN1HWgMngQHPZz5qXzeLRL4fpxvmBxeJLJG2
         EulRdtiKOvPOiBqWnCLScj90n9N4oI5ZcVHIxqDykDG7+EHUTAedujN3UBLxvZS8MXlr
         xl481kkdGM240gd+1Mp4OGPaqhdth7v89QlboqjbDqNJQDfCC7DcuLb9oxfbqusKsLnN
         xbKh2kgcC6j9hqu0zUyg5k+UkX4Bt1mZ7sxqxwZ8VBEyD+LhNOxPnJynYBbGnJ0TMhAd
         kLuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=MiWeWkecp06NuqnvJcQe+4MeVb3lXXDHi5qwkM/XVaM=;
        b=gGAo4nbklAGv/SgQMqGW+I5hLgY+il7P4MDSetmBiS83HxxqPimMKDgPaZIuwzdUWW
         o0rapSMbTJAmh7r2Y7lnoPcojFTAn9xmh7DHWqsM/4ytGOFnbrNr8sL24LNYF0BUja9G
         RK3Lh3xyVXl0Pw5MZp9u2daQTr00c+o8ouTI7IJVxVI6hMvC5o69y+FBjWOU32LZhXyq
         gW6PAAuAH3J+FprXnX83UHaq/rOY9jmfW/edYoTAHm3q2WqY9lUm/5j8iAqa0PofNwlf
         klGYDrISOlVh0CbJt0/FTOzDEod6yk21ctrcBpojDNA8kfwcYCec+9X9DvlblcQWuD/h
         RB7A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=B20sxyvp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w126-20020a379484000000b0069a11944e37si2326754qkd.375.2022.04.17.10.54.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 17 Apr 2022 10:54:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=B20sxyvp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ng96e-0006Ce-AN
	for alex.bennee@linaro.org; Sun, 17 Apr 2022 13:54:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ng8x1-0000gw-IG
 for qemu-arm@nongnu.org; Sun, 17 Apr 2022 13:44:45 -0400
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f]:46670)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ng8wy-0003Hw-Go
 for qemu-arm@nongnu.org; Sun, 17 Apr 2022 13:44:43 -0400
Received: by mail-pg1-x52f.google.com with SMTP id q12so14933893pgj.13
 for <qemu-arm@nongnu.org>; Sun, 17 Apr 2022 10:44:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MiWeWkecp06NuqnvJcQe+4MeVb3lXXDHi5qwkM/XVaM=;
 b=B20sxyvpNez0Dj4y1gXoZcPlKJOklmmL98rVxx52/lIffU2syKDPNWTYTn1V5eNvoI
 1BvR+zNmREQIXGN8NHFFPGhVSMW9A22KtqBcbPWvJtM6O2KqhgBTNwEFXQEDDlKbzQu0
 3YmA8XB6I1Oxydq4f7zBJynmBUyCu1QIT+nh2eAyLuwBGPiL+GDuqljuYrjfruf6AbIO
 NQovIcO7noSyD6t61CDTie0lWOogauqxNaNJgFjBWUn1u1tD3hiuQsSYVEePLU9OZOVs
 sXgnKnK9J29WNXVaoLU7vwsMxF7WfFuqO/e6mwIP+DoHdpM5q6l269EUXgaEtlYNrhnO
 baBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MiWeWkecp06NuqnvJcQe+4MeVb3lXXDHi5qwkM/XVaM=;
 b=CIQ1oih/BcaTISDnnpKfwoLcKmEJFO2xf6HaPT5BhKu2bZICYA8i896hT4tgbfOoZY
 bBP7ie2qul/WAbunXbPJHFGbbBltx3azExnarHRddqvv3Zgsf773f4gEtnUqKvNirn0D
 odb2np4Oz/cQUzfFjgT6AARfMCot639atchOshsFHnQcMLyuci3zjkRdguzqH0lXQsDK
 iynxM4i/GaCToxd5hBPbW/jK0X54cp7ZPMfDHoT01J1zcIEcR8syEtBxhF2BE48RKgGA
 xccVVxH9fxcebciudf6X/iRovecZvX/ksOdrNiQM9Vza/VTntfXJEnz7YyBeYRf1DkcA
 bBiw==
X-Gm-Message-State: AOAM532YP3O0shD+dbPCx3I34ZPQiaDmIYeL8Wpzrcz3B+0p5AiOxZfg
 doyVhst6g/zI2CUD1gNmpoqX6A==
X-Received: by 2002:aa7:9ad8:0:b0:50a:49e1:164c with SMTP id
 x24-20020aa79ad8000000b0050a49e1164cmr8354515pfp.8.1650217479056; 
 Sun, 17 Apr 2022 10:44:39 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 i2-20020a17090a138200b001cb6512b579sm10372119pja.44.2022.04.17.10.44.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Apr 2022 10:44:38 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 11/60] target/arm: Split out set_btype_raw
Date: Sun, 17 Apr 2022 10:43:37 -0700
Message-Id: <20220417174426.711829-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220417174426.711829-1-richard.henderson@linaro.org>
References: <20220417174426.711829-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52f.google.com
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: by+HZqTJcR/Y

Common code for reset_btype and set_btype.
Use tcg_constant_i32.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-a64.c | 25 ++++++++++++-------------
 1 file changed, 12 insertions(+), 13 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index be7283b966..a85ca380a9 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -128,29 +128,28 @@ static int get_a64_user_mem_index(DisasContext *s)
     return arm_to_core_mmu_idx(useridx);
 }
 
-static void reset_btype(DisasContext *s)
+static void set_btype_raw(int val)
 {
-    if (s->btype != 0) {
-        TCGv_i32 zero = tcg_const_i32(0);
-        tcg_gen_st_i32(zero, cpu_env, offsetof(CPUARMState, btype));
-        tcg_temp_free_i32(zero);
-        s->btype = 0;
-    }
+    tcg_gen_st_i32(tcg_constant_i32(val), cpu_env,
+                   offsetof(CPUARMState, btype));
 }
 
 static void set_btype(DisasContext *s, int val)
 {
-    TCGv_i32 tcg_val;
-
     /* BTYPE is a 2-bit field, and 0 should be done with reset_btype.  */
     tcg_debug_assert(val >= 1 && val <= 3);
-
-    tcg_val = tcg_const_i32(val);
-    tcg_gen_st_i32(tcg_val, cpu_env, offsetof(CPUARMState, btype));
-    tcg_temp_free_i32(tcg_val);
+    set_btype_raw(val);
     s->btype = -1;
 }
 
+static void reset_btype(DisasContext *s)
+{
+    if (s->btype != 0) {
+        set_btype_raw(0);
+        s->btype = 0;
+    }
+}
+
 void gen_a64_set_pc_im(uint64_t val)
 {
     tcg_gen_movi_i64(cpu_pc, val);
-- 
2.25.1

