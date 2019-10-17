Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp1360814wrm;
        Thu, 17 Oct 2019 12:07:20 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxSb7Ljhrwu2J0r4rAXiAAKowkzmepqsxLv+UDssuFBs6Nx9Zvj4yOX46DTpIH7DdtnJq5U
X-Received: by 2002:aed:2602:: with SMTP id z2mr5592138qtc.150.1571339239939;
        Thu, 17 Oct 2019 12:07:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571339239; cv=none;
        d=google.com; s=arc-20160816;
        b=0ASITQr0BLHR52Dftlhqd2HXXMCnvfA0BdT9SERxpeYkGS/h2g068frKHop0nGwQle
         hzu6sfDbv5myr35wYNVUrpXU04G48AKcXnZf9euTHFWFKARDyywFn8/ltfOT/mO2pGKK
         QMmGy7OdsuML4Ttltz0v4iJUvWRFE3WXdOWGrAPeqELz6Y7YkrChNVnzDUTWMwx4qU56
         JdmASuMFGGHdoeJHT2YLIkBcERouwWfd0h6wXVUQgyNl8mU2YmS6MP3An6cvBYLoQzXf
         nLwq4u/kuKt4RExt7r9g0B82Uf5KCkVM2zjMegmw8ffV+z4sBRcJNRXlJ81i4mBB7Q0t
         Xk7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=5TK2BjuSMMDdIP7qbR+6sWroGlmanOV91VZR8RZQmXE=;
        b=fDJmC03mLT+/2TkOLVx14okmf/SVuWJgZzKa5AQ430kEQjeeq7zwa9wdYMu4vNOyhK
         HtwTIU1j5qthfEScg2+5jWFzn3HJ1ORV+kc2zJi5a2lUXYBTCk3GAbOeaOTZc2XfsBWn
         KDJFEv201QSfQc7v0Gq/UJua6uenyL/m+QJ4a9veYlhkAcm65yHbdPX06hOuJsBHs6fc
         XNvxhk2WIB4NQVo2ZHcf28gMbOhZlmJZy8DPnB3QLP3k5PLyhRngJsFMAUFy7k75MEp/
         zo0rdNcxwt4Npqv6OiYm4atzs75X4dmfSGGwZNJz6pKU4OV7YWUm3ueICXF0NCESWB0v
         zLWg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=JcrQDLns;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p198si3103976qke.113.2019.10.17.12.07.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 17 Oct 2019 12:07:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=JcrQDLns;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iLB7G-0002h2-UG
	for alex.bennee@linaro.org; Thu, 17 Oct 2019 15:07:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35449)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1iLAsA-0001MD-Fg
 for qemu-arm@nongnu.org; Thu, 17 Oct 2019 14:51:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1iLAs8-0000z9-Q5
 for qemu-arm@nongnu.org; Thu, 17 Oct 2019 14:51:42 -0400
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541]:44694)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1iLAs8-0000yi-KM
 for qemu-arm@nongnu.org; Thu, 17 Oct 2019 14:51:40 -0400
Received: by mail-pg1-x541.google.com with SMTP id e10so1847399pgd.11
 for <qemu-arm@nongnu.org>; Thu, 17 Oct 2019 11:51:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5TK2BjuSMMDdIP7qbR+6sWroGlmanOV91VZR8RZQmXE=;
 b=JcrQDLnsOHSe9OyD5Zy33o/NYsS5jm2PtO8t9wA+JNCeiNg/JNjUU/zTy9KXazvmhb
 JDz8qU5zMmSH5WHTefmctKIklYK1R1jN3JI5RVkCYedvhYV9+8r3hH70aQEdkXgrfdXY
 hhVvifhcN1p8omoFqNJfHooBdB3pu7wo6cV6bs9PQeBjUdQx+Xflm+0TPoRYlTt4nZrN
 x5vhKaaxlF4mzq3db994HFE75BE7Hj4WBDaXc/PYV8BcCVkDDhSt8/RnBY1f7QsNoaMK
 ETqjZj6jy6ljn/2UiVNogl2Z/bRaCl1TbttY9saqn1gFzVBomKQtN/eEv120/91dGkmu
 l5fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5TK2BjuSMMDdIP7qbR+6sWroGlmanOV91VZR8RZQmXE=;
 b=DIF076XZcKUGRS7gMZxiMbdUL6n/OcBBhKK1i/jI2AoMAimmrSHNSbmTvCqXcCvt4v
 9k0pFJhZFZEO/+4xCOxXHF5r2+22MSq3Ovl1q9VbbC9/KrKtJk1F63OPOLyHy3Gp63YE
 UNXxI7OUsUIiXkOQl5g4w25G2P7AVk+Ot9W+xpdZ5AO3PiWaF8mM/Q8bZBaPJltC84P/
 PqCMhBl45i6RTCynmlUF3/avOorc7JGkHlAxOrnQBLy8Q+FE30+IzDJOOAvBiVRUnyV5
 z2vjonTTyTncAcaXTjiPkNBMZtwFEvkT9WF0rM++qc1D2XCzqqNb+3Y1S7Bb31f3BUR2
 UDoA==
X-Gm-Message-State: APjAAAUpy06DD7BfL8l8h7BrqMqkW/duYnv95R9E8v/O2LMfRmHSSmGD
 SM6wOV0SDqX/OaIP+LaAmJUdGQ==
X-Received: by 2002:a63:dd11:: with SMTP id t17mr5742808pgg.242.1571338299344; 
 Thu, 17 Oct 2019 11:51:39 -0700 (PDT)
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net.
 [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id s97sm5009256pjc.4.2019.10.17.11.51.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Oct 2019 11:51:38 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 20/20] target/arm: Rely on hflags correct in
 cpu_get_tb_cpu_state
Date: Thu, 17 Oct 2019 11:51:10 -0700
Message-Id: <20191017185110.539-21-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191017185110.539-1-richard.henderson@linaro.org>
References: <20191017185110.539-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::541
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
X-TUID: 0c2gWp4XiTjy

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
index aae7b62458..c3e3dd2c41 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -11249,12 +11249,15 @@ void HELPER(rebuild_hflags_a64)(CPUARMState *env, int el)
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

