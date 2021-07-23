Received: by 2002:a19:7b1b:0:0:0:0:0 with SMTP id w27csp711008lfc;
        Fri, 23 Jul 2021 09:22:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxlBQ7HVbHUXhu5LhCmAZOKXzrSWpVpr1oZi6HfnMklnOiJch5ZRihnPnpjcjW8L6ov/Mbs
X-Received: by 2002:a25:e681:: with SMTP id d123mr7324843ybh.472.1627057348242;
        Fri, 23 Jul 2021 09:22:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1627057348; cv=none;
        d=google.com; s=arc-20160816;
        b=RJxin+LPzWhBAN8+tWILqLPoiJO9LmLNICVm71z50i5/LdQxwQUjxrH1vYExuBR5Od
         B/wwgJAhnT4O2AOqyobOAy5Q1wltMK8O1cBqfDaMNNp3JDZd0Q6bSQ1BU20IKZv+Ko1R
         DbGRK4xyFyQQcAX8yxWbCH4ZSLtzNJ4qZbuY18uHbt+1mi1Cr/2Gbxp7Cna+TNHQgOzS
         4TpJuuYlIRuhEXGhmn2BPb05omaROz0zMWUR2w+khpQ/37xZPEIPxGqPmdeosQgByOPA
         jvgkTFWzPwldShcphTlmJV69rm4wDCRO6vcd/fFhZ1Z+9Yw9lW2gfy8MF0aF/5eEdN8C
         GVWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=6bcSsnl6u82JYa+g2MBv9GVvdo5DY+x1DAHdRtbYsP0=;
        b=ACoKhlO+AjpLRihF4iaiPq7SUpecTnhEE3kFSSrmfr8PjHA8a8hukD/trjtRKln7do
         jiZ20eTsOFiTZm+wnYON7JRoU07Dh4qy4va3SLIo8oLCUIDcMMpBFaSQ7TTC/epmM2DJ
         gBAbbl/qlvfR8QvdrTwaTI3o/HEoxIfFHxDMxI7264cMwKVRd3cpkpfUD/TfkZB/Y4b/
         hH7O5CVQM/mXWJwSUvHCFya/DokCYAPkA5J+UT8KqEjrCEPWdXATTWitaqwJ9HVcOGCh
         u8qOnAZnDIDxX4BJPOlQCPzHBR0fvgNxP+AejgzJdT5IWTgMrr+DwDzG2hXtLMKs8Eqw
         O16w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=H6dZBnzo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m198si32522555ybm.59.2021.07.23.09.22.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 23 Jul 2021 09:22:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=H6dZBnzo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43992 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1m6xwR-0008Ug-5f
	for alex.bennee@linaro.org; Fri, 23 Jul 2021 12:22:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m6xvt-0008Rw-SV
 for qemu-arm@nongnu.org; Fri, 23 Jul 2021 12:21:53 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:38456)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m6xvr-0000ks-Dq
 for qemu-arm@nongnu.org; Fri, 23 Jul 2021 12:21:53 -0400
Received: by mail-wr1-x42e.google.com with SMTP id o1so2974115wrp.5
 for <qemu-arm@nongnu.org>; Fri, 23 Jul 2021 09:21:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=6bcSsnl6u82JYa+g2MBv9GVvdo5DY+x1DAHdRtbYsP0=;
 b=H6dZBnzoqjJDX0KwISIefbEulJ+2575Ex/SNWD2GZw3VU+DRfn66XFWLBFyviC07Wp
 9rqtcANTpIqSaGZhQNBGEHK/I3k+eIs4aPEQrgcahzyEuJjIJrREjhW6HwY8vVVfw6mI
 CnVRlXQJT3pkxO5bO6VEb+luJV4Jfx7CnR/JDxOJFhI/P1TBqROdcQZ8Li2dreCljxzw
 SAROfw4mXaVtrsTHgijweLG9D7GEz+a+7Pc1KZiLnK555YavSLRRiO+WF2+doDLj9zTz
 i9aCfwLhfUAEyJ4GutqdZM7GOiYFfcGm/ojAdIup2IFprvHCtSmtYn0ku9f8im39RIao
 ooaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6bcSsnl6u82JYa+g2MBv9GVvdo5DY+x1DAHdRtbYsP0=;
 b=i0wZ9s7u8WHB8Napx62oUXndu3n6kutBkMmP/E5S48CDlG1wnWp+MxQ4jT0l6Xs7fp
 tnQFgB+U7W2DoGh10lBuFWyg7yY+YToYQ8tGv7xc1nkzC0366PgzjblaJ0uNMFOj9iHi
 ERwnhlaEMfBO/0n/H4eGzb7XkzZR9rtpb7rSyg+zbXPR9nAok5Iip/EGlC9RSOYyIt+Z
 Ns3+Q2+SGT9uB+VRiU+2Z+It5Q4S4vsPtO34FXccHnb9bE5TWQ8/3GYWRGRM75zSiJ+/
 3b+62holnHXpif7ioFy/mgknK3sGRS6Ekb/k4GEg+lZcQ7ANJIe5KpQerKth9P8FE2nO
 /miQ==
X-Gm-Message-State: AOAM531+9gGrGhKYXJoZXwpE+7m6nC7gznho4/qLNmJbb4nPIGxe2GDD
 O6RcC0IUUNKbANPzUHacyufAG0IJoBw72w==
X-Received: by 2002:adf:dfcb:: with SMTP id q11mr864529wrn.16.1627057309409;
 Fri, 23 Jul 2021 09:21:49 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id y11sm5721416wmi.33.2021.07.23.09.21.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Jul 2021 09:21:49 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-6.1 1/6] target/arm: Enforce that M-profile SP low 2 bits
 are always zero
Date: Fri, 23 Jul 2021 17:21:41 +0100
Message-Id: <20210723162146.5167-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210723162146.5167-1-peter.maydell@linaro.org>
References: <20210723162146.5167-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: PqdGP7E+VxUv

For M-profile, unlike A-profile, the low 2 bits of SP are defined to be
RES0H, which is to say that they must be hardwired to zero so that
guest attempts to write non-zero values to them are ignored.

Implement this behaviour by masking out the low bits:
 * for writes to r13 by the gdbstub
 * for writes to any of the various flavours of SP via MSR
 * for writes to r13 via store_reg() in generated code

Note that all the direct uses of cpu_R[] in translate.c are in places
where the register is definitely not r13 (usually because that has
been checked for as an UNDEFINED or UNPREDICTABLE case and handled as
UNDEF).

All the other writes to regs[13] in C code are either:
 * A-profile only code
 * writes of values we can guarantee to be aligned, such as
   - writes of previous-SP-value plus or minus a 4-aligned constant
   - writes of the value in an SP limit register (which we already
     enforce to be aligned)

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
This is one of those changes where the code changed is clearly OK
and the review is more "did we miss anything?". Optimization of cases
in generated code where we know the value is already aligned would
obviously be possible (eg "ADD SP, SP, #8") but I haven't looked at
that; after all, it's only one extra AND insn.
---
 target/arm/gdbstub.c   |  4 ++++
 target/arm/m_helper.c  | 14 ++++++++------
 target/arm/translate.c |  3 +++
 3 files changed, 15 insertions(+), 6 deletions(-)

diff --git a/target/arm/gdbstub.c b/target/arm/gdbstub.c
index a8fff2a3d09..826601b3415 100644
--- a/target/arm/gdbstub.c
+++ b/target/arm/gdbstub.c
@@ -84,6 +84,10 @@ int arm_cpu_gdb_write_register(CPUState *cs, uint8_t *mem_buf, int n)
 
     if (n < 16) {
         /* Core integer register.  */
+        if (n == 13 && arm_feature(env, ARM_FEATURE_M)) {
+            /* M profile SP low bits are always 0 */
+            tmp &= ~3;
+        }
         env->regs[n] = tmp;
         return 4;
     }
diff --git a/target/arm/m_helper.c b/target/arm/m_helper.c
index 7a1e35ab5b6..f9a9cb466c9 100644
--- a/target/arm/m_helper.c
+++ b/target/arm/m_helper.c
@@ -2563,13 +2563,13 @@ void HELPER(v7m_msr)(CPUARMState *env, uint32_t maskreg, uint32_t val)
             if (!env->v7m.secure) {
                 return;
             }
-            env->v7m.other_ss_msp = val;
+            env->v7m.other_ss_msp = val & ~3;
             return;
         case 0x89: /* PSP_NS */
             if (!env->v7m.secure) {
                 return;
             }
-            env->v7m.other_ss_psp = val;
+            env->v7m.other_ss_psp = val & ~3;
             return;
         case 0x8a: /* MSPLIM_NS */
             if (!env->v7m.secure) {
@@ -2638,6 +2638,8 @@ void HELPER(v7m_msr)(CPUARMState *env, uint32_t maskreg, uint32_t val)
 
             limit = is_psp ? env->v7m.psplim[false] : env->v7m.msplim[false];
 
+            val &= ~0x3;
+
             if (val < limit) {
                 raise_exception_ra(env, EXCP_STKOF, 0, 1, GETPC());
             }
@@ -2660,16 +2662,16 @@ void HELPER(v7m_msr)(CPUARMState *env, uint32_t maskreg, uint32_t val)
         break;
     case 8: /* MSP */
         if (v7m_using_psp(env)) {
-            env->v7m.other_sp = val;
+            env->v7m.other_sp = val & ~3;
         } else {
-            env->regs[13] = val;
+            env->regs[13] = val & ~3;
         }
         break;
     case 9: /* PSP */
         if (v7m_using_psp(env)) {
-            env->regs[13] = val;
+            env->regs[13] = val & ~3;
         } else {
-            env->v7m.other_sp = val;
+            env->v7m.other_sp = val & ~3;
         }
         break;
     case 10: /* MSPLIM */
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 351afa43a29..80c282669f0 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -291,6 +291,9 @@ void store_reg(DisasContext *s, int reg, TCGv_i32 var)
          */
         tcg_gen_andi_i32(var, var, s->thumb ? ~1 : ~3);
         s->base.is_jmp = DISAS_JUMP;
+    } else if (reg == 13 && arm_dc_feature(s, ARM_FEATURE_M)) {
+        /* For M-profile SP bits [1:0] are always zero */
+        tcg_gen_andi_i32(var, var, ~3);
     }
     tcg_gen_mov_i32(cpu_R[reg], var);
     tcg_temp_free_i32(var);
-- 
2.20.1

