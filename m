Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp1027457wrm;
        Fri, 11 Oct 2019 09:07:54 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzH3mZihYGBzhFM/EHqf4EMaNJbpfTFO8FyOlKr7WOQcN8eOjWCruSDGsfJo4aP8Hmps1FU
X-Received: by 2002:a17:907:41e1:: with SMTP id nb1mr14467385ejb.323.1570810074744;
        Fri, 11 Oct 2019 09:07:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570810074; cv=none;
        d=google.com; s=arc-20160816;
        b=RCealQIfHyiIXsBvpjF14RjwvsJ3wczMnLjpIh+EbhLowbIGiHfEd944vs/Z+dHXVw
         1pip/I2AGU5tn3gYbprXScQU3XJyBF57JMuaz0sITMOpD3K0chmUT3Fa3mcn9vAZgsM3
         4VXjUYTSvSv/ZFOPKx22oewlWChUaX7aefQXvbaGzlajsfZpMKfSx6I37ylQhnJzN3ib
         IwnAodHV1mUFyfMPtSAQaFQAEacTGsiDxWRj4vo5AkUkzrvzkwOxXgItxcJ9jMB9eDWA
         EPA1LUI/RJq6ddO7rpGhim+7TqT7PtdzDR+Mfmy4I10BeSpiqaqPniJ0Qh2YAkCmwN1c
         DVIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:references:in-reply-to
         :message-id:date:subject:to:from:dkim-signature;
        bh=4OOGMGav7WyY+i6Vj46PkAX7nW+w3pL8v7F+DMrUq7Y=;
        b=MCKjwBjCV5/go023aZq2y3OBTel12EjtUcZ1+vJ4pjNnrIBMHt04+9aSMr4YbeaJMx
         a4xEIAXTI/xDPDRmXBEiLiC78HdknJVkP2vRMKovZEw5MxIslFJCxVH4sdEBZ2bP7nCu
         hQWkbRjQswkoxpNl7y6JKxcgVSC1rpldGYCbXI6+qLBrbzvLVW8LU+o0jEgesIj/b4sx
         Dhg8oSC0/4Q+FTbeyrTWBEFef5U/vHczuGeEgd/Z4pudkn8e2eT6QG/Lcuhx+oUA8LCt
         T9SPgi7sLIzVRJQm5YUeloOPxCjrvM8uPYg5q7PLdL8KlqGon2wex1hIwOPtptHP/Ge8
         pbZQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=aILbN6xZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o22si5401323eju.25.2019.10.11.09.07.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 11 Oct 2019 09:07:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=aILbN6xZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iIxSL-00089X-4E
	for alex.bennee@linaro.org; Fri, 11 Oct 2019 12:07:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33776)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1iIxGs-0002VU-QL
 for qemu-arm@nongnu.org; Fri, 11 Oct 2019 11:56:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1iIxGr-0007iH-IH
 for qemu-arm@nongnu.org; Fri, 11 Oct 2019 11:56:02 -0400
Received: from mail-yw1-xc42.google.com ([2607:f8b0:4864:20::c42]:45681)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1iIxGr-0007i2-Dw
 for qemu-arm@nongnu.org; Fri, 11 Oct 2019 11:56:01 -0400
Received: by mail-yw1-xc42.google.com with SMTP id x65so3633756ywf.12
 for <qemu-arm@nongnu.org>; Fri, 11 Oct 2019 08:56:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=4OOGMGav7WyY+i6Vj46PkAX7nW+w3pL8v7F+DMrUq7Y=;
 b=aILbN6xZ30EdzU7O9mibwUqzEqS2SYXFObkfEjAJZKVPFnRsKsQ7cLSrGAVHICGR4V
 y3o7gQPy64gjZJ4lN1GLaHIvu5Gf0AQKQp2Kwnd4hPC4LOoeQj0mDoHM0iTZOxSKp79r
 oKAobjVm6JkBKqFytkWOtvdf/hVVug3pjTQpSpYwLwbi31tVKZsDJg7ocTjwNGL9IMgD
 6Vhs/FsABJEFrTFGsKOCCezZDFf9xrpTXRJh+VkzdHmM2YRkCVblHLmFg9nIkmj8nNdj
 r+/SnYZvW3gGRxeKHEts9pWMhMSsxF7ig26z4IRTkj+4733JmWbcfLjwag+9/wtvfBTI
 lwJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=4OOGMGav7WyY+i6Vj46PkAX7nW+w3pL8v7F+DMrUq7Y=;
 b=mpfgmnKyu9saHnH9GkWgIJlDloB2/Y95B51QEg6o9y7WTUR8jlvkX+J8Iv46bgrvXf
 Vf6UscX1myyV9nb1eQ5cx0s/3si7LIRP4iLHNTms8wppImE1YNXZOleaR1DqKhCcvXFW
 C8iC1OBc9ZUwanwpw0pTFdbD/mZUFX9XQ3jX9cLL2SvMw8qi3HtxNigng5u9lwMCPBmG
 N9wMhEXd9zjTUViz/GqRO5aB8BtGF7WUT0idaswdsSlkgPZ3cI3GK9PABfon2eHiAWeJ
 6btJTS5OqzvwVhQx3SFGpgJogd7VoNGgisU89OItMUxgw7T08F9PotaLzRC1aaMQ0sDH
 WJrQ==
X-Gm-Message-State: APjAAAWClVzS/ruuyFpa0yDG5b8lnbugYlDGLO9yInPLAq9QLs4t7ixo
 /zsI9Ur25rqF5M97w7yHVXab1oNtBJM=
X-Received: by 2002:a0d:d384:: with SMTP id v126mr2818553ywd.166.1570809360832; 
 Fri, 11 Oct 2019 08:56:00 -0700 (PDT)
Received: from cloudburst.gateway.pace.com (67.216.151.25.pool.hargray.net.
 [67.216.151.25])
 by smtp.gmail.com with ESMTPSA id d17sm2473139ywb.95.2019.10.11.08.55.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Oct 2019 08:56:00 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 11/20] target/arm: Hoist computation of TBFLAG_A32.VFPEN
Date: Fri, 11 Oct 2019 11:55:37 -0400
Message-Id: <20191011155546.14342-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191011155546.14342-1-richard.henderson@linaro.org>
References: <20191011155546.14342-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::c42
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
Cc: laurent.desnogues@gmail.com, peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: z1CMa0JrFsFm

There are 3 conditions that each enable this flag.  M-profile always
enables; A-profile with EL1 as AA64 always enables.  Both of these
conditions can easily be cached.  The final condition relies on the
FPEXC register which we are not prepared to cache.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h    |  2 +-
 target/arm/helper.c | 14 ++++++++++----
 2 files changed, 11 insertions(+), 5 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 4d961474ce..9909ff89d4 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -3192,7 +3192,7 @@ FIELD(TBFLAG_A32, XSCALE_CPAR, 4, 2)
  * the same thing as the current security state of the processor!
  */
 FIELD(TBFLAG_A32, NS, 6, 1)
-FIELD(TBFLAG_A32, VFPEN, 7, 1)          /* Not cached. */
+FIELD(TBFLAG_A32, VFPEN, 7, 1)          /* Partially cached, minus FPEXC. */
 FIELD(TBFLAG_A32, CONDEXEC, 8, 8)       /* Not cached. */
 FIELD(TBFLAG_A32, SCTLR_B, 16, 1)
 /* For M profile only, set if FPCCR.LSPACT is set */
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 398e5f5d6d..89aa6fd933 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -11088,6 +11088,9 @@ static uint32_t rebuild_hflags_m32(CPUARMState *env, int fp_el,
 {
     uint32_t flags = 0;
 
+    /* v8M always enables the fpu.  */
+    flags = FIELD_DP32(flags, TBFLAG_A32, VFPEN, 1);
+
     if (arm_v7m_is_handler_mode(env)) {
         flags = FIELD_DP32(flags, TBFLAG_A32, HANDLER, 1);
     }
@@ -11119,6 +11122,10 @@ static uint32_t rebuild_hflags_a32(CPUARMState *env, int fp_el,
                                    ARMMMUIdx mmu_idx)
 {
     uint32_t flags = rebuild_hflags_aprofile(env);
+
+    if (arm_el_is_aa64(env, 1)) {
+        flags = FIELD_DP32(flags, TBFLAG_A32, VFPEN, 1);
+    }
     return rebuild_hflags_common_32(env, fp_el, mmu_idx, flags);
 }
 
@@ -11250,14 +11257,13 @@ void cpu_get_tb_cpu_state(CPUARMState *env, target_ulong *pc,
                 flags = FIELD_DP32(flags, TBFLAG_A32, VECSTRIDE,
                                    env->vfp.vec_stride);
             }
+            if (env->vfp.xregs[ARM_VFP_FPEXC] & (1 << 30)) {
+                flags = FIELD_DP32(flags, TBFLAG_A32, VFPEN, 1);
+            }
         }
 
         flags = FIELD_DP32(flags, TBFLAG_A32, THUMB, env->thumb);
         flags = FIELD_DP32(flags, TBFLAG_A32, CONDEXEC, env->condexec_bits);
-        if (env->vfp.xregs[ARM_VFP_FPEXC] & (1 << 30)
-            || arm_el_is_aa64(env, 1) || arm_feature(env, ARM_FEATURE_M)) {
-            flags = FIELD_DP32(flags, TBFLAG_A32, VFPEN, 1);
-        }
         pstate_for_ss = env->uncached_cpsr;
     }
 
-- 
2.17.1

