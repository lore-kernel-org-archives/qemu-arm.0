Received: by 2002:a05:6512:230d:0:0:0:0 with SMTP id o13csp365993lfu;
        Tue, 26 Apr 2022 09:46:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxPz1xGt3j7FiXILr1dYp/6oqMJbfrqL7dr/hgMG3UlBcpimhkLIVswBdv5kT+LsS5rj60H
X-Received: by 2002:a81:5584:0:b0:2f7:d7b6:d910 with SMTP id j126-20020a815584000000b002f7d7b6d910mr13672498ywb.469.1650991602907;
        Tue, 26 Apr 2022 09:46:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1650991602; cv=none;
        d=google.com; s=arc-20160816;
        b=Ybv/6PvBjhmPZ/OyP6uD3jxKePjElQn8ISHd3qNqUisRQoPjzv0LQ9wvFYCahtzgKi
         51MA8bLPZMub69X2f+kg/e7PbSHUSM0zdfdWFQSCeQCfwFEIPwTA6mO0d9OXGcakewgr
         Kh17RK0sPvkLN+thBhg7mfq48oDeeujm4ZMBtMYOwbJcMyx2IEiQiTyC9KlBBfyobHxk
         A3IE/eG78vDpcLPQn4b1cDY8CUYQ2qzqLv+qAxakRC2XemFCVKcDZZKFzsQ05tCmpFxQ
         QHbpb5zYpKFAvTOXjbGkLfmEN7JGe2+bpP5CENTpnqNURYO43vvNE5nw1pagYqDRA3jD
         C+mQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=j8ZzQJaFsLEhBqWaL0qX7yYVNAnc01NjxlTahTgdBew=;
        b=FFAlXcywYCeLixXflwQvT2UUUQNCr8+UGu0n8wAgO2gRn/dKcm0rwQo4bPF9v53JNV
         WMkGDmOIwZhIdi77VggfM0/zEreNPo+JmPGpzKjLjjviSFSoY8NIAAmy9F9xTiyDSsUx
         yLEmoexcOp7USqnEADpmjAx7dQj5NU759Euqfs62D7GzaFYOch3MS4XOeWLnbWA3iCUC
         8jsuQMXcunr1T4DhN+wu98g4qjp4wROeU38AxpNCypdjMab2be52k51Wjb4Yp/Mb8Hza
         Z7KBg89VR3gP6LQzMbwushKUQ0kIi3FQDubGaGWWlVjXv0bZIBdYKvJc+mEczK4C/L/o
         U0hg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WoLXpdwG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h127-20020a812185000000b002f4d24182f3si14097112ywh.77.2022.04.26.09.46.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 26 Apr 2022 09:46:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WoLXpdwG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46244 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1njOKo-00033A-8B
	for alex.bennee@linaro.org; Tue, 26 Apr 2022 12:46:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njO5v-00036b-Fy
 for qemu-arm@nongnu.org; Tue, 26 Apr 2022 12:31:23 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f]:39923)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njO5s-0003uc-K1
 for qemu-arm@nongnu.org; Tue, 26 Apr 2022 12:31:19 -0400
Received: by mail-pl1-x62f.google.com with SMTP id c12so30706725plr.6
 for <qemu-arm@nongnu.org>; Tue, 26 Apr 2022 09:31:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=j8ZzQJaFsLEhBqWaL0qX7yYVNAnc01NjxlTahTgdBew=;
 b=WoLXpdwGRb2nL1ysk4INTaM1lP8ndGyl7aus2HzolylQSxLcjOn56VXsRKsb6Km87Q
 l0lqiSWhdld+5pQN0efcEaLIo0Nw3UuKP03spBrZc+NtSp+WS5OeRYy5pfSZJ5+Fatp7
 Y+30BuRMLRJ2LuKdI6cWxevBhCB1ONqvNO4MApaxIOUsZluKOdLugOMbaDw7+m6cQw2m
 JMFqpt7cmT1QNj5EeW+lb6ub/kRVr2B8zAheDzu2p4r14gVkYxjb6FpayQYtPTOj/s07
 dQOl0WBqgLneEdWEE/gsyQj+KqxD0dgSFfWqPfYYEGeA8v96st/YBcK89gWMarvMQx/L
 R3KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=j8ZzQJaFsLEhBqWaL0qX7yYVNAnc01NjxlTahTgdBew=;
 b=fmgxGj5OnXYDxrIlty2XgPvbo9zmt1IgMosH2iz2tQHWINYffNlLzutHS+k53a8+r0
 a/X73oA0GdroKQIm6HK8da6SZ6c2QrwJjeil+rXPBCWZYZwQ9xSlpnPe8JPaKC2NXMVI
 uuHYGLcLlFG6uX39UG33IwhyKXBxwjy6UvSQ69+mHQSckx/NmVSzls5sIiOloprQOCzH
 PrjT86+fNc++FfZPnDQ2SEjeJCvjatZRv/HteO7vZr9jzqweiXcQNRqCJaYcV+fiYsd0
 92F7LbTMUX+i6vtXd3KLEIfpg1TWHkJACOHHcVVqS7ahqX39DvG0AZtJUoDpZ7u/hnLC
 zsAg==
X-Gm-Message-State: AOAM531NrZhwlQaCkPtoceWtHCIM5qogxN56GAnhb2O+1c774/BJa1Tb
 WNOonkCOz9h4TIZe136WhAzYqQ==
X-Received: by 2002:a17:90a:ba15:b0:1c6:7873:b192 with SMTP id
 s21-20020a17090aba1500b001c67873b192mr27873659pjr.76.1650990674784; 
 Tue, 26 Apr 2022 09:31:14 -0700 (PDT)
Received: from stoup.. (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 y131-20020a626489000000b00505a8f36965sm15655813pfb.184.2022.04.26.09.31.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 09:31:14 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 32/47] target/arm: Use tcg_constant in LDM, STM
Date: Tue, 26 Apr 2022 09:30:28 -0700
Message-Id: <20220426163043.100432-33-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220426163043.100432-1-richard.henderson@linaro.org>
References: <20220426163043.100432-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
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
X-TUID: B9gp1ngU85w2

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 24e522e1d6..e0469da0a1 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -8050,7 +8050,7 @@ static bool op_stm(DisasContext *s, arg_ldst_block *a, int min_n)
 {
     int i, j, n, list, mem_idx;
     bool user = a->u;
-    TCGv_i32 addr, tmp, tmp2;
+    TCGv_i32 addr, tmp;
 
     if (user) {
         /* STM (user) */
@@ -8080,9 +8080,7 @@ static bool op_stm(DisasContext *s, arg_ldst_block *a, int min_n)
 
         if (user && i != 15) {
             tmp = tcg_temp_new_i32();
-            tmp2 = tcg_const_i32(i);
-            gen_helper_get_user_reg(tmp, cpu_env, tmp2);
-            tcg_temp_free_i32(tmp2);
+            gen_helper_get_user_reg(tmp, cpu_env, tcg_constant_i32(i));
         } else {
             tmp = load_reg(s, i);
         }
@@ -8123,7 +8121,7 @@ static bool do_ldm(DisasContext *s, arg_ldst_block *a, int min_n)
     bool loaded_base;
     bool user = a->u;
     bool exc_return = false;
-    TCGv_i32 addr, tmp, tmp2, loaded_var;
+    TCGv_i32 addr, tmp, loaded_var;
 
     if (user) {
         /* LDM (user), LDM (exception return) */
@@ -8166,9 +8164,7 @@ static bool do_ldm(DisasContext *s, arg_ldst_block *a, int min_n)
         tmp = tcg_temp_new_i32();
         gen_aa32_ld_i32(s, tmp, addr, mem_idx, MO_UL | MO_ALIGN);
         if (user) {
-            tmp2 = tcg_const_i32(i);
-            gen_helper_set_user_reg(cpu_env, tmp2, tmp);
-            tcg_temp_free_i32(tmp2);
+            gen_helper_set_user_reg(cpu_env, tcg_constant_i32(i), tmp);
             tcg_temp_free_i32(tmp);
         } else if (i == a->rn) {
             loaded_var = tmp;
-- 
2.34.1

