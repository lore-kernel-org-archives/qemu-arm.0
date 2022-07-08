Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp352326lft;
        Fri, 8 Jul 2022 08:53:03 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sPvkZruyxkL0q4wItPEAdFOYU3rtk63iCCsdwZcss2O1gC15oGdL3yZJKijKNK59kyY5+x
X-Received: by 2002:a05:6214:400d:b0:473:47cb:18ba with SMTP id kd13-20020a056214400d00b0047347cb18bamr1519229qvb.51.1657295583614;
        Fri, 08 Jul 2022 08:53:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1657295583; cv=none;
        d=google.com; s=arc-20160816;
        b=cEyCtFfKaVeI9xYCQUwEuKugWKGA1QFBVsKIv3fBAwqd58iY4t93Dk5DmzcP1JbFvX
         JU81Jyxe7yU7Vl1qpf0MOE5R+Nq23mVgZDKP/j2V17OP0vnl63MBxjAq/vdIin6wdezp
         m4UGD5IhvSzG7nEoZjAnXFE55DyA9gs7VMKMSyBlhAgkSDHziAGU6W30Ow9MIWeVBaFO
         w7WiOvD6e2UQoagMYPEOv3vo9l0jgNXb2XSbX7TMKBDQWuZ8b3nukEa1t3lttT9XYiXv
         pVn1ZHONPOkrc0bIV/o+BiMR3WqMT1hcwAckESgewuqal6cYwrrVBaxiqrUCNm2MCvxq
         kIYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=84H03quhV23tsQtptgYsSVgdXeP+LjLwInxbgDJtprk=;
        b=hB3D5QPlvH/glHmzSBGHXRAlnGrFQmwyrLUTJkcoQxGuYujUdzoBO0TLZ/YrYyc455
         rUFSZr9trlUmJD80Ug0YDvEfAuBhyFNyP5Y9OG82u5CO6+10/YAoEan49xZ9nx9L9dFa
         pe5TaQoRA8whEtz2CokAx7iuGlivDnvNsC4IevALkkUtBrYGT8t0Jj4PXjPnS5CST0+N
         w7vjx5f79VLLVUJcfwtL6IITP6Tyhm3YmyO1GV5xdhG/bfKJtiHRHEab2q50RDo1V/WI
         T62lQGsuS3eIwXTy9PwLN24w67Fo1yp9cXcLTsaPpg86z/YLQocBCS73T9JRNUs6Y8Nw
         M0gg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Oz/TiA8M";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d19-20020ac800d3000000b002f93c4a2337si22290796qtg.472.2022.07.08.08.53.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 08 Jul 2022 08:53:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Oz/TiA8M";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34518 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o9qHv-0007Gl-3p
	for alex.bennee@linaro.org; Fri, 08 Jul 2022 11:53:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o9pjO-0004NS-PT
 for qemu-arm@nongnu.org; Fri, 08 Jul 2022 11:17:24 -0400
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d]:37388)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o9pjN-0002TX-7l
 for qemu-arm@nongnu.org; Fri, 08 Jul 2022 11:17:22 -0400
Received: by mail-pg1-x52d.google.com with SMTP id bh13so16666008pgb.4
 for <qemu-arm@nongnu.org>; Fri, 08 Jul 2022 08:17:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=84H03quhV23tsQtptgYsSVgdXeP+LjLwInxbgDJtprk=;
 b=Oz/TiA8MmV3xIdM+MaurNIuOibDIJq9clPQeaz9a71rTsJbLiHTTesr937A8KG/OKV
 Nc7AD2D/1xFcWsqS3xG/4Xff7gGPFSxtzOsvxXQWaU4GwQjxYnAxnzW48UYddBAQM/+W
 A+Oxp9TXoxgZS2aNrT7Oq/LDEScveVl22bU2174Du6deXIad4QQI55IAGUxL62IQHMRc
 4AIsoY6wWK9LRVjBicR4q+s1z/lhFLqdnybdJPIQ6lhBF+m/7hNF7s/RlSutIKAK9R8n
 jZoN6ZsWsY4xCelmiehmovy/zEbCubZLVT1Trw7PiDkzjlnlNNzrO9BNR/+luj7PDdBv
 dapg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=84H03quhV23tsQtptgYsSVgdXeP+LjLwInxbgDJtprk=;
 b=AK9Lox+XK13g0NkUXIfWE7uazgUFyVIrEmIPFf4yAUQ1EN375pvaSOYg6si5w7Gq01
 57aabamLAtLcOKYuY0yr/ZzbyO3LCnSk1ot37DoySwibrLzEY+5LNKSo5rOr1ZZc7Z+P
 Tm9vmKkjW4d8qAw7LW8A46HIlAZs+waZAAL8bmgFlPhcjKjq6glp0Xfc75+S/2jBvNpo
 Usx2re4HHL8VKDWlRCxPI2JuDrkP2QNAvAa5WDBUCHTTgzEXKAkhQ/ZejUoSt9p3lQ6z
 62n6PWuiY6bUOSIw1RwHQIwxXd11W9WPd1OgMuUqn5Gn8aw4rQW0AT7Zb8jYvjXGpI+R
 /Tzg==
X-Gm-Message-State: AJIora//OurhxUWeNDtoKSy9NQsc2eWo/LjJSBHtXid9Feth74Q/yRG3
 SvQzmWb/54zyc52YucSmz5nPzVQfXcB39i7U
X-Received: by 2002:a62:a113:0:b0:51c:1b4c:38d1 with SMTP id
 b19-20020a62a113000000b0051c1b4c38d1mr4453742pff.13.1657293439963; 
 Fri, 08 Jul 2022 08:17:19 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 n17-20020a056a0007d100b0051bada81bc7sm29085774pfu.161.2022.07.08.08.17.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jul 2022 08:17:19 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v6 31/45] target/arm: Reset streaming sve state on exception
 boundaries
Date: Fri,  8 Jul 2022 20:45:26 +0530
Message-Id: <20220708151540.18136-32-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220708151540.18136-1-richard.henderson@linaro.org>
References: <20220708151540.18136-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52d.google.com
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
X-TUID: kR9PHEf5Erxw

We can handle both exception entry and exception return by
hooking into aarch64_sve_change_el.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 73a5b2b86d..cfcad97ce0 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -11242,6 +11242,19 @@ void aarch64_sve_change_el(CPUARMState *env, int old_el,
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
@@ -11254,10 +11267,8 @@ void aarch64_sve_change_el(CPUARMState *env, int old_el,
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

