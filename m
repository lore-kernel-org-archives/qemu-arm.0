Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp1344689wrm;
        Thu, 17 Oct 2019 11:53:05 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzkDogKGIcb9CnNi9HUkFKj2tfkFTWvaJVYod9AkxOPnSmTF2jGG21FgPlaEO07SpcruSJW
X-Received: by 2002:a17:906:474d:: with SMTP id j13mr4996874ejs.166.1571338385403;
        Thu, 17 Oct 2019 11:53:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571338385; cv=none;
        d=google.com; s=arc-20160816;
        b=TVa7djaX2atYm/ErRW9acCmPuRUT/plHjk9F5OS3+3nbFIADQR8g7cPpi37FrcQCmA
         ZRUHfFUnoSAk8XeUAo7o6acN8Gr/mFxgFco360C69uY9X2Vdu1c3ThAOL7oASUWzEK34
         OA+ejGCqSQHSruO3ctcMSxIZICI0Z0GWV4eMfeblAdvpsHnqBuZmvcBvFIrLtMPqtGLZ
         NnyY5oz2Of2/6hDv2LrJlhOXoza1PvdTJe6Fe921Bdj+XqK/K1rotdmzTJztiuxi94Xx
         m+BhRaWTkjSVvi75/AWuWFvGeI5DX/9ZZr95PI0nwLYe52uERA2nzRU9JdTfa+rqk6+V
         nFOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=Iym+ywFHjEBpwuu12wdHsU0gouX4jDUf3/+DDNH9pyk=;
        b=gjk31Zba6o3lck9ootW0PfmT4Mb9DB9XvdbOvlYWfVqqJVzO4Xa+0YbxEseVF8Wy+D
         Kovm+quehLcW59bS4N9goz+lw3Gt3SkihCu9I0B44EvsrltHm6QcVvBjUvq86Dh05Nc+
         3WYJMfE7biSZthiOwenwS0BrtUqIqLDDtWHw2ScCl7wdhZ4c1p9k3QBrTp/ouaJ4aW4D
         iqDgGsB8l+RSuDEyjrae4l1jj/PZuczOXoqkzmkpA4sOJsoA644C+j6wfUwgLtuWdVQ8
         4umZm9Ry6JZlF65uz6pJpkDnfXu2ATxkY1KcHuF0lWPSg53/yCwIF5bIF6TRHd9pYxZ4
         xvOg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=eomd+q7F;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b56si2181988edb.418.2019.10.17.11.53.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 17 Oct 2019 11:53:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=eomd+q7F;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iLAtT-0002x4-VP
	for alex.bennee@linaro.org; Thu, 17 Oct 2019 14:53:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35367)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1iLAs8-0001Jl-Tg
 for qemu-arm@nongnu.org; Thu, 17 Oct 2019 14:51:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1iLAs6-0000x1-HH
 for qemu-arm@nongnu.org; Thu, 17 Oct 2019 14:51:40 -0400
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444]:35682)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1iLAs6-0000vU-6l
 for qemu-arm@nongnu.org; Thu, 17 Oct 2019 14:51:38 -0400
Received: by mail-pf1-x444.google.com with SMTP id 205so2223041pfw.2
 for <qemu-arm@nongnu.org>; Thu, 17 Oct 2019 11:51:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Iym+ywFHjEBpwuu12wdHsU0gouX4jDUf3/+DDNH9pyk=;
 b=eomd+q7FBtX57jhaP+godJma/1o5Zf+oYg3UXznfKR4wPos0bFbOWEftx1M4k/jng9
 OCuj3KKdkctf4snN8cQYDZ8ywrDSgde+8yPLdhi1plV4Wp7h69ws3ws3ptAfD3M9gZbF
 RovGtP40Tr2tRKNZ3MuJ8YfqNaHirYSrM1A/xOBwIBGGkfwxHfYTtc+52+22Dy5+c4lC
 ivlBD5pQnLUfC2zH9Dl29Z4HJO1RIhKs0l4C/ei5FGgNBm12OAAhK2J6a6JGfU6FK8U8
 rF8ISlV+ouGyA0DHwzlyC1b+Vc862MaRASAbBNlkfXCcoqfvbnEiCsbAbCx8yS1rFEG7
 LADw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Iym+ywFHjEBpwuu12wdHsU0gouX4jDUf3/+DDNH9pyk=;
 b=GX86SdEAp69E3+MOIjUucDqDELj6gtM6iJRheqA26e6T9EufHitrRo0nm3/8ughfXk
 Ugk/oTYIO5cDOLnGN06a1c2deirhQmLNwpEgbTsHHYnza27s1vDqQh+uZI8pYvx5JDqK
 axzS6sjoHu8ubQ0VwDk5YhNXkuW/slbuyg0tcYUQeQ6K4s39g9c05uySFIhrEMiH8ECe
 ZEm+mZWXcFUC2ZN/ayvLybX8Jldi0F6dbdLQDoMkYArG2Yxyzfi7kQNrL3wZYSpNqwIc
 /pmct1Fg1ELQXj8uo99D2HgP70LCCzDbaAZ1ANY8IZ9cYBmuoE1Mxgh+LmT06mD5v2l8
 Y4mw==
X-Gm-Message-State: APjAAAXmInRw4x3fso4O9a1Bg745BGb3dFTCofEi0Eo7ScYgYC2fbcmN
 5LLwp+uk35jrL/vGgoONdKDcMUnslxQ=
X-Received: by 2002:a65:6898:: with SMTP id e24mr4081018pgt.358.1571338296203; 
 Thu, 17 Oct 2019 11:51:36 -0700 (PDT)
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net.
 [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id s97sm5009256pjc.4.2019.10.17.11.51.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Oct 2019 11:51:35 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 18/20] target/arm: Rebuild hflags at CPSR writes
Date: Thu, 17 Oct 2019 11:51:08 -0700
Message-Id: <20191017185110.539-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191017185110.539-1-richard.henderson@linaro.org>
References: <20191017185110.539-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::444
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7sZ5A/VrT4sK

Continue setting, but not relying upon, env->hflags.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/op_helper.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/target/arm/op_helper.c b/target/arm/op_helper.c
index ccc2cecb46..b529d6c1bf 100644
--- a/target/arm/op_helper.c
+++ b/target/arm/op_helper.c
@@ -224,6 +224,7 @@ uint32_t HELPER(usat16)(CPUARMState *env, uint32_t x, uint32_t shift)
 void HELPER(setend)(CPUARMState *env)
 {
     env->uncached_cpsr ^= CPSR_E;
+    arm_rebuild_hflags(env);
 }
 
 /* Function checks whether WFx (WFI/WFE) instructions are set up to be trapped.
@@ -387,6 +388,8 @@ uint32_t HELPER(cpsr_read)(CPUARMState *env)
 void HELPER(cpsr_write)(CPUARMState *env, uint32_t val, uint32_t mask)
 {
     cpsr_write(env, val, mask, CPSRWriteByInstr);
+    /* TODO: Not all cpsr bits are relevant to hflags.  */
+    arm_rebuild_hflags(env);
 }
 
 /* Write the CPSR for a 32-bit exception return */
-- 
2.17.1

