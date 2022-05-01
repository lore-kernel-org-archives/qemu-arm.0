Received: by 2002:a05:6512:2248:0:0:0:0 with SMTP id i8csp473659lfu;
        Sat, 30 Apr 2022 23:17:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzgRdy7Y8mivarrM9RtqWUbj7rRROpvXFn5v9Sm9d1Eb3Sv+2T55cGnO2mzv5cnOMEJTH7i
X-Received: by 2002:ae9:f504:0:b0:69f:ba2d:29ff with SMTP id o4-20020ae9f504000000b0069fba2d29ffmr4803624qkg.583.1651385869994;
        Sat, 30 Apr 2022 23:17:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1651385869; cv=none;
        d=google.com; s=arc-20160816;
        b=Ku6aV6enfQhtw9UtouzHYuOkBXBRBKjXq0l0/5ABY7Widy89UjZPVCwKNFVTgkha1L
         X386S0JivxBfXh3YYW/FoEZvRJYL5XEJBgQqqoU5v5Y7cClAnVa7crP6/I/lZCFnKb+N
         rn01ZiApzzif++6qD5fAokpPgf9ISOYI1yXSrUxrX8WK/3C0EnyfcW5icuTnYb2kEgLw
         pDwLjWWdh2mCjXIeZ8kQBchjmWUe0OZGqJGQ4t3P9QvIqMmMDK4AdSv8OFfpXcGBqUNI
         JtpnlJqFD+vF+OuuWE43JE6IBgsTn6f4QjO8KsnKKUd2ifpWtaumoJPoHJaH/J9Kw9l+
         0nPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=Hr9XVqQdGgVN9QhGevO5NcMkH7ocZJOMtPxHUW2biKk=;
        b=ALi4dNLYvBxdIAw6krINwXVINnvuH3EK7RabsjBbooHQI/qXAHr2HvA7eL0Kvdy1YD
         ozZZ+UjkGZow7HUoJ4QwUlZHU5DI1MDM0cr/zMlwOT0Ij6jyNxTQ9mG0uEiZUjFc9l0g
         Z02Aby9wfLsIpOdNp0i9uuMJrmUQbA4M8Osv3H6iuUvzt4k3NtIydM2hd0Kb2AdnYJ8Y
         zWvSTICUh8xBbZQReUmfy9KFYURIbPbqB7DBLUVISNtgSQN/Eml+cyG6ZhDxYAzpRbI+
         D7YSSKCt0pDBehUQFYI0qqKKIjK/NFbfyHNqZ/Row2qY3t/hoakd5hIFc3ZFWudUVwht
         U91w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=zo8ZOnOY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bs9-20020a05620a470900b0069ebc8d8cedsi5008243qkb.555.2022.04.30.23.17.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 30 Apr 2022 23:17:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=zo8ZOnOY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nl2tx-0007Ca-EQ
	for alex.bennee@linaro.org; Sun, 01 May 2022 02:17:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nl2U0-0006um-Lt
 for qemu-arm@nongnu.org; Sun, 01 May 2022 01:51:00 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:39598)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nl2Tx-0001Lu-JC
 for qemu-arm@nongnu.org; Sun, 01 May 2022 01:51:00 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 a15-20020a17090ad80f00b001dc2e23ad84so1790797pjv.4
 for <qemu-arm@nongnu.org>; Sat, 30 Apr 2022 22:50:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Hr9XVqQdGgVN9QhGevO5NcMkH7ocZJOMtPxHUW2biKk=;
 b=zo8ZOnOYe5x9TL0vqrWTngMo2610HN43KkwZyAQqNw1bl4HYNcCJDbapL1zhZ9shcT
 Tsop9dpNFpkv4HTNodpBjvK39L5gmYUCh/5ftEYPcJT13BOVFBK/FtUmvNviBYDSmRDV
 vNa0akZX4UUY8eWFs/fKqUV7cfVkukI5TFoCBbgep2EF8z7DQFhch0Ha4vHhEyH6jVQm
 wDWxn6F4u5OP7DbR4iaCyJ6F9SGcejsJw0ZVSUkIrGGI3vwcZzZjzaDv7IReD03iYrr5
 NwggZQsyzoPHVRY0+1kVQi2mc8G+eQ5PeugmQSeNvRvVyd95sQS5DpUwYAE5C9kz2hCD
 6v8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Hr9XVqQdGgVN9QhGevO5NcMkH7ocZJOMtPxHUW2biKk=;
 b=ot3/BXAYFwfw9/KTaTkmcfzEU67aUAY6tsB0quTx6859qLTtRpytRG3xRjwJjbCS8P
 AUOD7VAPA9lb8ye9gwD/1mbGmywi8Rly/kQ9OOOzWJhV1/7OIbIwns2Q3pO1SpQtu6Px
 Mw883mTKu8+pA+FdudHYNxFo+ojLchKyUatTgExBzRpT25RQDMh0tQEZsVyadkoWuVn5
 PP8ThvT45yvRaVjhL7ESAjADOB6gKRvnP+5ScsH7ttj9KEVp8lHN8luMVsPUDBSotbOy
 zdn9R5bEGbywymqjGvbD0MdaIkTWI1KtYpPlioWyqP2fJXSztgOIVnQYNmGTrOVjKknt
 Oe4A==
X-Gm-Message-State: AOAM533pzVjeE+15X5XFPW09CsXzSqFtqjjW0bkhwuQbVvV66rv6GYeX
 6Y0fVXAPLPtrHnBI7XZHyf7VzW8ljMbU2Q==
X-Received: by 2002:a17:90a:884:b0:1d9:531c:9cd6 with SMTP id
 v4-20020a17090a088400b001d9531c9cd6mr6907382pjc.211.1651384256275; 
 Sat, 30 Apr 2022 22:50:56 -0700 (PDT)
Received: from stoup.. ([71.212.142.129]) by smtp.gmail.com with ESMTPSA id
 cm18-20020a17090afa1200b001cd8e9ea22asm17310342pjb.52.2022.04.30.22.50.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Apr 2022 22:50:55 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 27/45] target/arm: Set ID_DFR0.PerfMon for qemu-system-arm
 -cpu max
Date: Sat, 30 Apr 2022 22:50:09 -0700
Message-Id: <20220501055028.646596-28-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220501055028.646596-1-richard.henderson@linaro.org>
References: <20220501055028.646596-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: qPxQpV+jVasE

We set this for qemu-system-aarch64, but failed to do so
for the strictly 32-bit emulation.

Fixes: 3bec78447a9 ("target/arm: Provide ARMv8.4-PMU in '-cpu max'")
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu_tcg.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/target/arm/cpu_tcg.c b/target/arm/cpu_tcg.c
index f9094c1752..9aa2f737c1 100644
--- a/target/arm/cpu_tcg.c
+++ b/target/arm/cpu_tcg.c
@@ -1084,6 +1084,10 @@ static void arm_max_initfn(Object *obj)
     t = FIELD_DP32(t, ID_PFR2, SSBS, 1);
     cpu->isar.id_pfr2 = t;
 
+    t = cpu->isar.id_dfr0;
+    t = FIELD_DP32(t, ID_DFR0, PERFMON, 5); /* v8.4-PMU */
+    cpu->isar.id_dfr0 = t;
+
 #ifdef CONFIG_USER_ONLY
     /*
      * Break with true ARMv8 and add back old-style VFP short-vector support.
-- 
2.34.1

