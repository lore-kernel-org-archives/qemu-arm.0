Received: by 2002:ac2:4318:0:0:0:0:0 with SMTP id l24csp1205451lfh;
        Fri, 27 May 2022 11:19:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx0Htu2L9eR25538I9wPTwzjMWh4nFeTfVvoFQQkVgpzfMG/E3eEOdyf5Qddl0mIQ9cLvw4
X-Received: by 2002:a05:622a:1012:b0:2f3:ce26:9f93 with SMTP id d18-20020a05622a101200b002f3ce269f93mr34749251qte.175.1653675567333;
        Fri, 27 May 2022 11:19:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1653675567; cv=none;
        d=google.com; s=arc-20160816;
        b=dZnp3GBz/ekaSx2hgagipwU+v5/NhFjJ11PqqrSoT6Ij7jhNsWGsjEYHaH4eB0/ZnU
         6boT2XHN/ub/J8PskQdqGRjcQ1PcUGZ0vXOSnnkDJ4uZFtv1uoHpHhFkez8st7Auno2f
         Hyc4aQ3BaEEOiwoMpV4MAXvzZiFVmEnkGSesHCP4capkLPkib/ZX93rBELadROrdnn4V
         l3ESsGvcG3iyF4a20GQdSLSDBB9aDBGjz5qBr0tV3JEo15jU+X9LhUDOeqQQPmlGFwXT
         YB0wkMmnYbmAMFQonCxd08bG545baHgd7pY5PO3RvEFeSqZtRdOePb8H7OVFqjF+gyos
         uTpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Pgu2zydUpYMeYK9b3ALqFT5I3UrenI3q9C92LiEKRKg=;
        b=0Wzv6WcX03vhf3Ax0jnhlNquo+OAG/FJd3+9d7y5k3VzVMdCRKblzjwOmBYfxqQkKr
         UOWTN50Gg4l4qbP6H8nyl0T/qXh5hs8ykagMGYO/91mGfUbsDNdSgLHZOGLvrnQ8tRro
         uDtLvSYhPcM8XbzWCmhrESk5DzKOB+tX2q7F2y4xJmkN7jEMGwOq40ohIaS1UI/lTLjh
         i6jt+vuBUKYeuMkvE5aVMPYcBqL6aVNF86YZvDfwVpqrjIUUzaJDS0Hxd5MEgcSVYhUn
         02vDBhA/EQ1nNgC1BdWm8CJAGlHhp4JoMAq+ZVwK3yN7O9EwgQjS3l/DTNQj30cZCRQA
         +mUg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=n9QwUk6U;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e1-20020a05622a110100b002f9c2f27d5fsi3183394qty.762.2022.05.27.11.19.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 27 May 2022 11:19:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=n9QwUk6U;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47246 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nueYY-0005y2-QO
	for alex.bennee@linaro.org; Fri, 27 May 2022 14:19:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38990)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nueMK-0003TB-K3
 for qemu-arm@nongnu.org; Fri, 27 May 2022 14:06:48 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431]:34430)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nueMB-0001gT-HG
 for qemu-arm@nongnu.org; Fri, 27 May 2022 14:06:48 -0400
Received: by mail-pf1-x431.google.com with SMTP id c65so4387950pfb.1
 for <qemu-arm@nongnu.org>; Fri, 27 May 2022 11:06:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Pgu2zydUpYMeYK9b3ALqFT5I3UrenI3q9C92LiEKRKg=;
 b=n9QwUk6Us6ZTcZLlifoxpiojn/TjiabJcZM1PH9rD7yvVCnlVVPS0c6u1wGEwo2Vpz
 PyQNgtRObR6WIIoYyE4DxfLnyUY711XON1WtV7IOlqEAMck5jiK555EiYtd0IN+MUZP5
 /WaoJUkIOHCaJGtvuDYcp+vUW6litNMQgQRLkZL1Du0THZqttRV4mda+vmm0lbBLH7Cl
 SS6MczEAoGCEUUXs7rvEtgwzMTXToqdHHJCtfCKPeY4405OCl9om7VN6j2ZqZNqErSqj
 YWIu12NSvw3fc09gXusnD+ex8akNaK62m+iycDiFIUcZ0CoQ1QkFMXLE5cKcz84E4pQe
 hgqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Pgu2zydUpYMeYK9b3ALqFT5I3UrenI3q9C92LiEKRKg=;
 b=BxFvHWDlTWXeqaklUGRay2ZCQkiD74R6LFplfZMA9zI3QaHjN8be/BX5FvjzqDA/8k
 BbyF5RBC/9x6lAVHJlV1uJBZk6t9MIYNoHXfPzYbKBdyZqQWQSa75pvF+XNhwzSRt7QZ
 1D66l3U09qsC2yydr9aG+O6ZsMT3mHsoWaxwA30Z51ArIq/bFOUM3p7XCd/OgTnd8BgG
 rlyc89Znlt8J34I55AAd1vgFXOYa1MbLpqFS5Y26oR+h1x0+oClwKEoMxLv7qINuX/Df
 kH+i8fcGR5jRCOVh9+95W6a3paqVflAgnkYB/yzuPlbz6k9UXLAG06wknff+2Y1qbZDz
 XmjQ==
X-Gm-Message-State: AOAM531nw39NG0jqpHaWGA635O9tQ41PqcizkPYnfjs6y8yXz9NQL7UB
 U4W+RHfUvuZhilw3uTpfokyLos+zn5SMIw==
X-Received: by 2002:a05:6a00:c85:b0:518:b4a7:cce1 with SMTP id
 a5-20020a056a000c8500b00518b4a7cce1mr23252296pfv.66.1653674798192; 
 Fri, 27 May 2022 11:06:38 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 e10-20020a170902cf4a00b001618fee3900sm3934492plg.196.2022.05.27.11.06.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 11:06:37 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v3 15/15] target/arm: Export bfdotadd from vec_helper.c
Date: Fri, 27 May 2022 11:06:23 -0700
Message-Id: <20220527180623.185261-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220527180623.185261-1-richard.henderson@linaro.org>
References: <20220527180623.185261-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x431.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: yVX2E1r9MSzC

We will need this over in sme_helper.c.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/vec_internal.h | 2 ++
 target/arm/vec_helper.c   | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/target/arm/vec_internal.h b/target/arm/vec_internal.h
index 43cff5ec7c..5e50c503aa 100644
--- a/target/arm/vec_internal.h
+++ b/target/arm/vec_internal.h
@@ -230,4 +230,6 @@ uint64_t pmull_h(uint64_t op1, uint64_t op2);
  */
 uint64_t pmull_w(uint64_t op1, uint64_t op2);
 
+float32 bfdotadd(float32 sum, uint32_t e1, uint32_t e2);
+
 #endif /* TARGET_ARM_VEC_INTERNAL_H */
diff --git a/target/arm/vec_helper.c b/target/arm/vec_helper.c
index 4db68fbbb3..b3e8039cdb 100644
--- a/target/arm/vec_helper.c
+++ b/target/arm/vec_helper.c
@@ -2557,7 +2557,7 @@ DO_MMLA_B(gvec_usmmla_b, do_usmmla_b)
  * BFloat16 Dot Product
  */
 
-static float32 bfdotadd(float32 sum, uint32_t e1, uint32_t e2)
+float32 bfdotadd(float32 sum, uint32_t e1, uint32_t e2)
 {
     /* FPCR is ignored for BFDOT and BFMMLA. */
     float_status bf_status = {
-- 
2.34.1

