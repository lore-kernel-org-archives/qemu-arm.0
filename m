Received: by 2002:ac2:4318:0:0:0:0:0 with SMTP id l24csp5225189lfh;
        Thu, 2 Jun 2022 15:53:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyupa8+2eOs3svNURJ3g5TP1x8hX138+Sl7pCopnMk7oksDXNrrdNzKQ0nSIWha4WTQDlXw
X-Received: by 2002:a05:622a:20f:b0:304:da73:dc03 with SMTP id b15-20020a05622a020f00b00304da73dc03mr2320474qtx.436.1654210430372;
        Thu, 02 Jun 2022 15:53:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654210430; cv=none;
        d=google.com; s=arc-20160816;
        b=wx8h0hWVD7ANcVNhiacf0MACEShNkQv/JVYBSt8wHbg2o1ZYYbxOsbtLN+H71jQpM1
         K9y3h+3ParOlWDZtsak+vjq7erHhvNY7sjjE1QjbIOSpTvOccqHShf/GIklgLMUWA+9e
         lKFgKlU3y17r5D/fGK1BkG0x4IYLqvjfO5D12BfzI3tLZ0hZVSJFktkO28jD4cpKGFqw
         2UuHpdPhQ0ba4YYauBa2UlQ6FP2Lq9oH4ZlfYhQCzl/6cVc4Uo0+YLpkxojsk8rv/UM4
         cGxpvpXO4jTzhqciZsy4cq/2rFHW7fkbEk41utq70OZ0B6gmml0uEXEYg+DPSV6JHnTf
         tP1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=GOZiM5VIUJ7hxXAisXLAxtYs3O/u/UcypIboV374q90=;
        b=ut3+THSLAOlZd0nzYkpzGPLUdvN6AvsxRMX/QkXc6+MblOqWG4+a5OceC+WJIKsJnx
         pfXc6hsr5nOqkIf4qSHDrcQCrrjjxETcodQkg/o/uAHNWZEiwKh3qhJqB78A78JGD15R
         klIToWAWGJz+3vuk7oyDeRLpyppgDPlAZ3bc7feQFgSfZTUGzdrh1UlHqj3ccEkzreUX
         O7qMqp+UQw/k/K3kaEKKDFLzc35HCiUuptGodWkh8T//aiyu0FMKuWD71W7g0hsAi88Y
         opr/0o0W6GWQ5cpJLELo2p/pEFKJi8nQa/JJqsn8UyteD1HIKwepw9PBcbKX3BNd0NxN
         uc4A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vk9WESaJ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d22-20020a05622a101600b002f3d3574814si2676099qte.223.2022.06.02.15.53.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 02 Jun 2022 15:53:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vk9WESaJ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nwthN-0002er-RR
	for alex.bennee@linaro.org; Thu, 02 Jun 2022 18:53:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nwskL-0001dM-H0
 for qemu-devel@nongnu.org; Thu, 02 Jun 2022 17:52:49 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:36380)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nwskH-0000w4-Ou
 for qemu-devel@nongnu.org; Thu, 02 Jun 2022 17:52:47 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 u12-20020a17090a1d4c00b001df78c7c209so10647853pju.1
 for <qemu-devel@nongnu.org>; Thu, 02 Jun 2022 14:52:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GOZiM5VIUJ7hxXAisXLAxtYs3O/u/UcypIboV374q90=;
 b=vk9WESaJaWUwIqE6eCG5pL9COhfB/rOS2fgD8DMicZQQl6lxkGCRBmMhj7P0TxzWfV
 LgMYLQkKfhvtLAWnZm/CFA+DmqEuhzGr5emHr/mjG5j+mvN0FesxtTKQ5h2X7ZSEHjX7
 TPHqUd6WpJPpb/sY+0fAXrp575oGU5/39+IJpoeZV99NwVKQkOWRwBYnwjyWv0XKOpU8
 pyQ3iVlmVdUj1uCpnFeKC/YVML0YRor2ElgRj8hGr+DVZV7F9aJPA+AweUAun2skXVpU
 KIU1/SFJ0y6vhHXp7Q+SksROPNxYBiM6gIyWEcCRkhok6Wi41pq1n4tuSK59l63VKWyo
 UwGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GOZiM5VIUJ7hxXAisXLAxtYs3O/u/UcypIboV374q90=;
 b=K235BSfYpSrOYcZ5qnGYygbd93P+VsVkhyi/H0vhqx23V7CY3c1WJDUSsdvFoR4E56
 2wTblCmBNNmKPyBGTESdbWVZFvLbVLuUnx3emG6H1gIqgplEXROoa8PjXjEXK+R5NkR6
 F2dw/AWBE9s+pEFlVChjauoyzq4YhrnYs1ALYraIyC+FJYkt0W8VuLdkR7b5MFxmrKSS
 ObgyVsmK8lHF36gkvDBs553OI9KfGakPxdVWiDPj6+9/T0z2d73zbev2Ydgliw/MR8iD
 +JWfXFsqhSFfXX7BRXfaILW7vqGHZSwUAE1xHkqB8GJv8mcQuMQogrOqmqJN/jEju3zw
 7VZQ==
X-Gm-Message-State: AOAM530W5A8FQnswaSDgVzGrSKmyPHR4x6uUrAp5EiEIftkDUbxq0DEW
 UTO3cKC0U6ZAFPYw8hWFyc2quUSdRvKL6A==
X-Received: by 2002:a17:902:8487:b0:15f:b2c:435 with SMTP id
 c7-20020a170902848700b0015f0b2c0435mr6928647plo.33.1654206764263; 
 Thu, 02 Jun 2022 14:52:44 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 e14-20020a170902ed8e00b0015edfccfdb5sm4039605plj.50.2022.06.02.14.52.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jun 2022 14:52:43 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 57/71] target/arm: Reset streaming sve state on exception
 boundaries
Date: Thu,  2 Jun 2022 14:48:39 -0700
Message-Id: <20220602214853.496211-58-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220602214853.496211-1-richard.henderson@linaro.org>
References: <20220602214853.496211-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
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
X-TUID: F9KuKf9sTsVY

We can handle both exception entry and exception return by
hooking into aarch64_sve_change_el.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 7396be4352..af612b52b5 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -14276,6 +14276,19 @@ void aarch64_sve_change_el(CPUARMState *env, int old_el,
         return;
     }
 
+    old_a64 = old_el ? arm_el_is_aa64(env, old_el) : el0_a64;
+    new_a64 = new_el ? arm_el_is_aa64(env, new_el) : el0_a64;
+
+    /*
+     * Both AArch64.TakeException and AArch64.ExceptionReturn
+     * invoke ResetSVEState when taking an exception from, or
+     * returning to, AArch32 state when PSTATE.SM is enabled.
+     */
+    if (old_a64 != new_a64 && FIELD_EX64(env->svcr, SVCR, SM)) {
+        arm_reset_sve_state(env);
+        return;
+    }
+
     /*
      * DDI0584A.d sec 3.2: "If SVE instructions are disabled or trapped
      * at ELx, or not available because the EL is in AArch32 state, then
@@ -14288,10 +14301,8 @@ void aarch64_sve_change_el(CPUARMState *env, int old_el,
      * we already have the correct register contents when encountering the
      * vq0->vq0 transition between EL0->EL1.
      */
-    old_a64 = old_el ? arm_el_is_aa64(env, old_el) : el0_a64;
     old_len = (old_a64 && !sve_exception_el(env, old_el)
                ? sve_vqm1_for_el(env, old_el) : 0);
-    new_a64 = new_el ? arm_el_is_aa64(env, new_el) : el0_a64;
     new_len = (new_a64 && !sve_exception_el(env, new_el)
                ? sve_vqm1_for_el(env, new_el) : 0);
 
-- 
2.34.1

