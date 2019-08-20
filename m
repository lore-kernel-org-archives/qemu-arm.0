Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp2280wrs;
        Tue, 20 Aug 2019 14:21:11 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzTupcrYhwt0aDq0YO6+gFoxP9i0vXC12V0ri3QSqccQW5d5ZheeqMUgjiVMKaPyn9P2wvQ
X-Received: by 2002:a37:e10f:: with SMTP id c15mr27451518qkm.219.1566336071745;
        Tue, 20 Aug 2019 14:21:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566336071; cv=none;
        d=google.com; s=arc-20160816;
        b=NutUsyzAFJsTXEwpwoWIcKapXm5Rh0pBsNUfnTUHoH9HTR0K3AKZy3Dcjd3eaiNawG
         YIgB3kKZ/KleRVmpk04fPe0XMQPNphAW6MD4vfDPCSD47MFM1QTm0nQMJ88dlvs9R5c5
         ggNhyOJC3JBnSmZZtSWj50EVgjzjZvPhTfmdqWHn2NNsjpgMjG7R7g3ByGq+NrNzqls0
         dTi7BuRQmi9yZkc0xyUt1RAzM3ELxC9aDL4BatSKq2K29kZcR1V61jtmrFDaNN6q1Hxf
         Kn5m9d+xqIw/Edh6F3zdsCBcJLnp+zCOltqPExpu25SaOfobkyhEhYKl1Rm08uQtk99E
         XqSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=ukkPGAVjpyiRXhgCeNuw1onp0A6uGMb4+O/vZ/cyj7c=;
        b=HN9nafVUm15IjaQk8VV2i7S0EAGdqZFZzFkgxQmylGITRhV1Kaopca2gMsJ+4vjYb7
         nJ4rb32EUUAc3TOETrwrLZjHZc+KMvpnTFKj4TdJh3xcCjZ6Bz2oMsnuanE/H5EZtNfs
         T3OrYtWvwLLEpgyPUfs9+gq6FxPcYhH6Ban/x891ZJeViz5+eW21hyC5HS5AGF4djxXH
         3ltdPqeW66njPi/QVbByBwIWUbzGhjIBGZpms60OoyGkMOoPhdMKafMZnkogq1G3c+dA
         KOXuTPPjYhewahzRlNUwKJxuwRXxwJJjrSlTeG/Y2rklzp8wMVMuO9xxQu6ZlfxWthnL
         MpSg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="yuQlPjz/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q11si12306001qta.391.2019.08.20.14.21.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 20 Aug 2019 14:21:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="yuQlPjz/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i0BZ0-0004Hw-RW
	for alex.bennee@linaro.org; Tue, 20 Aug 2019 17:21:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53674)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1i0BLl-0000FN-7x
 for qemu-arm@nongnu.org; Tue, 20 Aug 2019 17:07:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1i0BLk-0008N6-4B
 for qemu-arm@nongnu.org; Tue, 20 Aug 2019 17:07:29 -0400
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441]:42837)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1i0BLj-0008ML-Ue
 for qemu-arm@nongnu.org; Tue, 20 Aug 2019 17:07:28 -0400
Received: by mail-pf1-x441.google.com with SMTP id i30so4111787pfk.9
 for <qemu-arm@nongnu.org>; Tue, 20 Aug 2019 14:07:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=ukkPGAVjpyiRXhgCeNuw1onp0A6uGMb4+O/vZ/cyj7c=;
 b=yuQlPjz/D/iLzbeS7LqBhzuxH/9up4FNXsZo2ec1o5fwM9roaHw/umNMOJ4DFxl+tJ
 OR+TzqhIZQ6rO7+qt0nsk/YePEoFe5HVsmg+EIgaJvbUUcAg6+5RQCdsZtzB7KV2B4p7
 tAaJzzX2AISMUzau2vNSAlFlIAlibstjoq73MljAjUfBSTAr6mltZhvUnGu+mEgBbGzg
 6IxHGqtpAO5WrzSse/UOfUxQRIY6KQsCvTwnifsuJTOH6Zo6gRXnf0aMzsdiB9ig2Y36
 T9o/tUVCFq29I8/8p1hy+2ECG0wY4ff7WR+ItYvQYv8j236RCimt4sLbwHkfZbQNADui
 cL7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=ukkPGAVjpyiRXhgCeNuw1onp0A6uGMb4+O/vZ/cyj7c=;
 b=Fc16r3oOce0VfJUvTzssMZfMW9rXlTSokRP4Zrh7qhk3AO0fyoOvz6E43aesz50ALZ
 lqo+iputIhyWx1D8DYUIhFzCjNtyfDSuzHQR7Gmw4piM4lMIcIRGD1Sfn2PFeQFj6WTo
 Oyz6Zhr5kj+DEGp3h6jKf5llLayFxo4lgcVL8PeM4FhKZN7miwDrU4Hu6AQTyaAQwqAj
 JcHpqG6GaEKq6Btik/371pOwK+8vgt0mbugcXcGKYhwlPw5tm6fZLPsdex52aWoYFhBQ
 iEdh1mhgEHVuhLfvuMqugd2Yx2J8drV26tD/7pULdEDfmmoV9AE6fKhUXwia10AuHwTM
 0AbQ==
X-Gm-Message-State: APjAAAWFLVj5qjv5BeHK8WqT1w678lUtRpSYwD2hTky+EelBsenieMuI
 npiARvWlwYwp/5gdUMJj8RsBxQ==
X-Received: by 2002:a65:6284:: with SMTP id f4mr27188420pgv.416.1566335247021; 
 Tue, 20 Aug 2019 14:07:27 -0700 (PDT)
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net.
 [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id k22sm21690743pfk.157.2019.08.20.14.07.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Aug 2019 14:07:26 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Tue, 20 Aug 2019 14:07:06 -0700
Message-Id: <20190820210720.18976-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190820210720.18976-1-richard.henderson@linaro.org>
References: <20190820210720.18976-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::441
Subject: [Qemu-arm] [PATCH v5 03/17] target/arm: Split out
 rebuild_hflags_common_32
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
X-TUID: 1lLgTXG7pf0O

Create a function to compute the values of the TBFLAG_A32 bits
that will be cached, and are used by all profiles.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 02cb43cf58..1844c13a19 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -11032,6 +11032,15 @@ static uint32_t rebuild_hflags_common(CPUARMState *env, int fp_el,
     return flags;
 }
 
+static uint32_t rebuild_hflags_common_32(CPUARMState *env, int fp_el,
+                                         ARMMMUIdx mmu_idx, uint32_t flags)
+{
+    flags = FIELD_DP32(flags, TBFLAG_A32, SCTLR_B, arm_sctlr_b(env));
+    flags = FIELD_DP32(flags, TBFLAG_A32, NS, !access_secure_reg(env));
+
+    return rebuild_hflags_common(env, fp_el, mmu_idx, flags);
+}
+
 static uint32_t rebuild_hflags_a64(CPUARMState *env, int el, int fp_el,
                                    ARMMMUIdx mmu_idx)
 {
@@ -11103,7 +11112,7 @@ void cpu_get_tb_cpu_state(CPUARMState *env, target_ulong *pc,
     ARMMMUIdx mmu_idx = arm_mmu_idx(env);
     int current_el = arm_current_el(env);
     int fp_el = fp_exception_el(env, current_el);
-    uint32_t flags = 0;
+    uint32_t flags;
 
     if (is_a64(env)) {
         *pc = env->pc;
@@ -11113,12 +11122,11 @@ void cpu_get_tb_cpu_state(CPUARMState *env, target_ulong *pc,
         }
     } else {
         *pc = env->regs[15];
+        flags = rebuild_hflags_common_32(env, fp_el, mmu_idx, 0);
         flags = FIELD_DP32(flags, TBFLAG_A32, THUMB, env->thumb);
         flags = FIELD_DP32(flags, TBFLAG_A32, VECLEN, env->vfp.vec_len);
         flags = FIELD_DP32(flags, TBFLAG_A32, VECSTRIDE, env->vfp.vec_stride);
         flags = FIELD_DP32(flags, TBFLAG_A32, CONDEXEC, env->condexec_bits);
-        flags = FIELD_DP32(flags, TBFLAG_A32, SCTLR_B, arm_sctlr_b(env));
-        flags = FIELD_DP32(flags, TBFLAG_A32, NS, !access_secure_reg(env));
         if (env->vfp.xregs[ARM_VFP_FPEXC] & (1 << 30)
             || arm_el_is_aa64(env, 1) || arm_feature(env, ARM_FEATURE_M)) {
             flags = FIELD_DP32(flags, TBFLAG_A32, VFPEN, 1);
@@ -11128,8 +11136,6 @@ void cpu_get_tb_cpu_state(CPUARMState *env, target_ulong *pc,
             flags = FIELD_DP32(flags, TBFLAG_A32,
                                XSCALE_CPAR, env->cp15.c15_cpar);
         }
-
-        flags = rebuild_hflags_common(env, fp_el, mmu_idx, flags);
     }
 
     /* The SS_ACTIVE and PSTATE_SS bits correspond to the state machine
-- 
2.17.1

