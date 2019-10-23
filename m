Received: by 2002:a5d:4890:0:0:0:0:0 with SMTP id g16csp1052859wrq;
        Wed, 23 Oct 2019 08:38:49 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyDV3zLlvMNmsJEqtIcrXjxuzhoywbxJt8GsSgV/S9X8QeRTq6pSU9eplLLkVn4MaeHIPRO
X-Received: by 2002:a05:6402:1a55:: with SMTP id bf21mr15319400edb.61.1571845129188;
        Wed, 23 Oct 2019 08:38:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571845129; cv=none;
        d=google.com; s=arc-20160816;
        b=Eusog+l92jPRu+nA6jR50HmZUEOHXB+/DLGnNacW4KuKD/aSiWNOrFjNYpo1ZW6AUr
         2Tu+CsjLQbz5ujWM/BKK95UTMQv2FB5A/I9XGneyiAvoXzx1ZwJCiFUQJhjUGEUyUsFj
         OrPFs1byBQ0zkPjkxHlBgONGc6FXTgsuTMKZmB+WT4eBpuYCJ6LMrzpDuhKOfYmyuYtW
         7UoGGOT8/gETlGiOaG34sJHZ0gJ0cK9UYhi8JtGeS+suX8pY1wa/iZtZMARjtECb2yMz
         nKM4QXRoPYsKDoF5R3nwTmVnQ4HMyeHSbZ+iJyud+Qjg0Ke+BuXmv/wdslhk+LXnMhIE
         6HhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=xYzA79nlkAAXT+tYBTRBvIlOCILLFnnuEHFTBSl+bu8=;
        b=kohEIxm2sqdKYM0ojJX8/7EBsA2/bXdMqayVpL8x4ZwovaBQNt6zVlXTJnE6vjnEqo
         xvORLHDJRcM0iIRHWP/qxHPaQwThW3l6q69zLZQDktqcSi9cURY8KwfUYTM35Atpo0Iu
         uLDOs26/zV6u3AGwkA+GBtIJmvXpw4RWvnhnT62DSyLK9vpd1hgDU2BAvdCLfBMZGfWR
         9raKj5Jl3uLpRivGPdMfXUxFd4P/+VP0WZNBhWoXbc6W6FJfzvFKl2d8uZu9e0xDDTzn
         mKTGwM8QSkn/t9YdlbJcFqWnPWa3hWqqnjQYrfoqn1EPtTXULEDxurcJ/TS3oM8TyZws
         kgbA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZivIxCUw;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h1si13302825edn.93.2019.10.23.08.38.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 23 Oct 2019 08:38:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZivIxCUw;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iNIil-0005k5-N0
	for alex.bennee@linaro.org; Wed, 23 Oct 2019 11:38:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35245)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1iNI8u-00089G-AX
 for qemu-devel@nongnu.org; Wed, 23 Oct 2019 11:01:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1iNI8r-0001Ff-Ca
 for qemu-devel@nongnu.org; Wed, 23 Oct 2019 11:01:43 -0400
Received: from mail-qk1-x742.google.com ([2607:f8b0:4864:20::742]:39581)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1iNI8r-0001CZ-2a
 for qemu-devel@nongnu.org; Wed, 23 Oct 2019 11:01:41 -0400
Received: by mail-qk1-x742.google.com with SMTP id 4so20038632qki.6
 for <qemu-devel@nongnu.org>; Wed, 23 Oct 2019 08:01:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xYzA79nlkAAXT+tYBTRBvIlOCILLFnnuEHFTBSl+bu8=;
 b=ZivIxCUwhBahdfwsD+jB9v9enkTyy4s1h8QmliJq3nU6rG7z0ArOqafJwiMOzZVcO3
 JnKE1LAj5rVNTUbPS1nwgEZvlGE/ERU3ygD6/9+zTRcQCEf1xUKX5nbbnx9TgtUp0bac
 Wly9VPhtukbkXDeaVg9AjGRl9YkOfRNNJJHvqBhsDExHkmDaa1iqKU/05zzu08zupMAA
 BIDnToG4ihtrYzYPTslSlFN6xKD51r8b7ae5xEhShXjNseBedcLkfwW+z+0jA3JmvmKo
 pCDB6Vq2lT1lgz9lFzumAb+e2a+W8IGMzHy6s9FOpDcd4HgpJa9sGRwI+rQ3E5shXVcX
 FoyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xYzA79nlkAAXT+tYBTRBvIlOCILLFnnuEHFTBSl+bu8=;
 b=AbkA8dNMEm6USSf6la+Z7RJeIl/zZJMy/4Z0JEJJ0zOnARgF/ycXlH3FOC9SBGKYVU
 bEzOQUXAh4LmuiEkUWHjCRoZsDbaNIRnTv5l/xXAyC82ggHlzJI8bSNXqjCzAWIgjedU
 oYD8XSASCmi1fNnOV50L+F7zBcUbxiOByWlrgeUBE13awQjXwxSVBGk/kynA6L20+S24
 vE7gG3rhBf2v5d8GYE+hWTTME8RWWj+5tW9jrqWevO3veMUVCP2nWNZAJ3VhHUCOStp+
 VkoosrGjOjdVw/7KMFWBV9zgmE8xoWbxaQNuYwEVmWAv1+1fQjaMtKyZjlY5dxJo4ezR
 LYJw==
X-Gm-Message-State: APjAAAUb7bSY3qbzBOgivcraaMTeA8UoGrC+5Z+XNz2byowmw7cJ2huf
 zFAXjYd84VlIBeAxs+WLJOXsttCqIDA=
X-Received: by 2002:a37:684c:: with SMTP id d73mr8797940qkc.176.1571842895829; 
 Wed, 23 Oct 2019 08:01:35 -0700 (PDT)
Received: from localhost.localdomain (198-4-20-64.static.cosmoweb.net.
 [64.20.4.198])
 by smtp.gmail.com with ESMTPSA id l189sm11030168qke.69.2019.10.23.08.01.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Oct 2019 08:01:34 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v9 24/24] target/arm: Rely on hflags correct in
 cpu_get_tb_cpu_state
Date: Wed, 23 Oct 2019 11:00:57 -0400
Message-Id: <20191023150057.25731-25-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191023150057.25731-1-richard.henderson@linaro.org>
References: <20191023150057.25731-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::742
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: HYmBEzQ1/NAy

This is the payoff.

From perf record -g data of ubuntu 18 boot and shutdown:

BEFORE:

-   23.02%     2.82%  qemu-system-aar  [.] helper_lookup_tb_ptr
   - 20.22% helper_lookup_tb_ptr
      + 10.05% tb_htable_lookup
      - 9.13% cpu_get_tb_cpu_state
           3.20% aa64_va_parameters_both
           0.55% fp_exception_el

-   11.66%     4.74%  qemu-system-aar  [.] cpu_get_tb_cpu_state
   - 6.96% cpu_get_tb_cpu_state
        3.63% aa64_va_parameters_both
        0.60% fp_exception_el
        0.53% sve_exception_el

AFTER:

-   16.40%     3.40%  qemu-system-aar  [.] helper_lookup_tb_ptr
   - 13.03% helper_lookup_tb_ptr
      + 11.19% tb_htable_lookup
        0.55% cpu_get_tb_cpu_state

     0.98%     0.71%  qemu-system-aar  [.] cpu_get_tb_cpu_state

     0.87%     0.24%  qemu-system-aar  [.] rebuild_hflags_a64

Before, helper_lookup_tb_ptr is the second hottest function in the
application, consuming almost a quarter of the runtime.  Within the
entire execution, cpu_get_tb_cpu_state consumes about 12%.

After, helper_lookup_tb_ptr has dropped to the fourth hottest function,
with consumption dropping to a sixth of the runtime.  Within the
entire execution, cpu_get_tb_cpu_state has dropped below 1%, and the
supporting function to rebuild hflags also consumes about 1%.

Assertions are retained for --enable-debug-tcg.

Tested-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v2: Retain asserts for future debugging.
---
 target/arm/helper.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index c55783e540..63815fc4cf 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -11259,12 +11259,15 @@ void HELPER(rebuild_hflags_a64)(CPUARMState *env, int el)
 void cpu_get_tb_cpu_state(CPUARMState *env, target_ulong *pc,
                           target_ulong *cs_base, uint32_t *pflags)
 {
-    uint32_t flags, pstate_for_ss;
+    uint32_t flags = env->hflags;
+    uint32_t pstate_for_ss;
 
     *cs_base = 0;
-    flags = rebuild_hflags_internal(env);
+#ifdef CONFIG_DEBUG_TCG
+    assert(flags == rebuild_hflags_internal(env));
+#endif
 
-    if (is_a64(env)) {
+    if (FIELD_EX32(flags, TBFLAG_ANY, AARCH64_STATE)) {
         *pc = env->pc;
         if (cpu_isar_feature(aa64_bti, env_archcpu(env))) {
             flags = FIELD_DP32(flags, TBFLAG_A64, BTYPE, env->btype);
-- 
2.17.1

