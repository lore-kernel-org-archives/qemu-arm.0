Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp1356310wrm;
        Thu, 17 Oct 2019 12:03:50 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyc185IOLUoOrFfh0/b3LyqkNYXHDb+2nc3hbFC7GiiZwfl3Cohhv//PT6rY8BDYACOijHx
X-Received: by 2002:a50:d794:: with SMTP id w20mr5473492edi.258.1571339030653;
        Thu, 17 Oct 2019 12:03:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571339030; cv=none;
        d=google.com; s=arc-20160816;
        b=b0qSgwF3wXza/A/YebBSXKb9hv5hQbH9Cpr4TvepOaMoU5BVWCb2Juqow+Ac0bYWuQ
         npcEPL/fS1IXC8paVsLyRohYV97i63jXbr4ateZ8w1IxD9wNwYGgnfUxCo21a/xW0p37
         qfMxtwsSMFUKuwEHB57g/qKpgquXHYQBNm/pcdaNXtXz/38A2zZp35/JJVnmxt6EN4JS
         MC0GWT7XpJ4elBIKpfZo2OE4EmRSzlhXlz7Of89QAmXa0naUWCxTbFqwEQSPW9eTDZBF
         YPMzBkip8a17Bts3Z2/tMcJWftHO47YF7Vlwv5ipeKDJkukm6GnpNv+H3veVenEcndv3
         z86w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=eUg5dM9Fl5udLxVDhP9VJ17zdeIkUx+G/V/inFv6c0s=;
        b=YO+KA3sSH+P6dVn6Oy8ex65X4NRWXQVG4g/ObBnaXqjt9LxZUKHmFdar7BToFaP2Fd
         bhYdQ2fTQ0g9Rznjyo8Wm+xdMoW8DiNl60nKq5UVH9ejrUF59z58TcIh4cwbsUAFeCWq
         ooSaV2O1rwVPgZyJ7sUAVi8iNnO63RaAqn25HLEoJN1lIw+AZEfiK08C5Lhf6E8PcUkb
         8tFXYTfFGt1FtDX5CcpvEKVrtgp1y/whkzSF+fVjhF1sYWWYaXBEs4QbHdQdemwoqaAw
         EhG0GUCNSQsObfiCsr6Sinh4TwORoPFSRZi0poFrYBCUUgibBKdrS7kQFrgncc6ETuzQ
         aszA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="plktUL/O";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h12si1939283ejj.40.2019.10.17.12.03.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 17 Oct 2019 12:03:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="plktUL/O";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iLB3s-0006Nd-RB
	for alex.bennee@linaro.org; Thu, 17 Oct 2019 15:03:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35396)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1iLAs9-0001Ka-FT
 for qemu-arm@nongnu.org; Thu, 17 Oct 2019 14:51:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1iLAs7-0000xi-19
 for qemu-arm@nongnu.org; Thu, 17 Oct 2019 14:51:41 -0400
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541]:42376)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1iLAs6-0000w7-RA
 for qemu-arm@nongnu.org; Thu, 17 Oct 2019 14:51:38 -0400
Received: by mail-pg1-x541.google.com with SMTP id f14so1849504pgi.9
 for <qemu-arm@nongnu.org>; Thu, 17 Oct 2019 11:51:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eUg5dM9Fl5udLxVDhP9VJ17zdeIkUx+G/V/inFv6c0s=;
 b=plktUL/OsfHIGQTbgv0X3YO7e7GgHsi4/sTMO3i0hTBtLAFWayLFBBXrCg2KCOYB4e
 IVwa5buvG7B7V6ahOYA8IAekltI8cezmKCEPuoX6J4tBr/Jh2Hdaoe9wKDzJYo6tQIZ4
 nrN8TZtLgdTiBBpxz7M/7p3xn8qxfQ0alezjVwoCQoj2xW1PCRdMkyfJnt5xEEnMK3jY
 F44+AnTW71P+aLuzaYE9wFZwuqlVUl8D6/cVDF/xUvGFKK2iHLclAJJSpH9TfYl7lGt4
 k3rkHNGwLYWmJasTco8OyFMlnmYnCr5f+DqO6mbFD7PKh0SW0iaWHV0Z//ejOYZ3jryp
 s/9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eUg5dM9Fl5udLxVDhP9VJ17zdeIkUx+G/V/inFv6c0s=;
 b=bkbyoR+OZcMX1gTSgesQiXV8FrFqFxwqgEGcAApjZyODwWTbckBX+pML83Z1b/5LbQ
 H8SnU8MjXl5IgAtXRAeDvcvzDzWLvYgJi9W4LL550RwFSstUQTYRbLIKHfv+2wKpaHA0
 GnglFY9OMQ5seyZs0zc+tzndungglZQeeK5vjS/k+sULVskRL/W3MpByxaD+teVyAUXH
 6OqNe6llSLkfe4glgL2ZtbVBpQ700+J5a1+U+L9WH8SWQyjOjEvrS2esFRgJQdMGiHgH
 PDIj/as0a1V3D6fOHGpU+M1JJZInD2o7ximGPaajatJ57Kru0usIab1vwv55eAYub9ii
 1L1Q==
X-Gm-Message-State: APjAAAUvBICL+TA+/BBwaNWKIutc+3c8IIl2m8RxJyJn//FaXkynBevT
 EygLKm19gKXTgNlDGA+6AvGVAA==
X-Received: by 2002:a63:e20c:: with SMTP id q12mr5659220pgh.275.1571338297696; 
 Thu, 17 Oct 2019 11:51:37 -0700 (PDT)
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net.
 [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id s97sm5009256pjc.4.2019.10.17.11.51.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Oct 2019 11:51:37 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 19/20] target/arm: Rebuild hflags for M-profile.
Date: Thu, 17 Oct 2019 11:51:09 -0700
Message-Id: <20191017185110.539-20-richard.henderson@linaro.org>
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
X-TUID: vBzawvgw7mEU

Continue setting, but not relying upon, env->hflags.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v7: Add rebuilds for v7m_msr and nvic_writel to v7m.ccr.
---
 hw/intc/armv7m_nvic.c  | 1 +
 target/arm/m_helper.c  | 6 ++++++
 target/arm/translate.c | 5 ++++-
 3 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/hw/intc/armv7m_nvic.c b/hw/intc/armv7m_nvic.c
index 8e93e51e81..a3993e7b72 100644
--- a/hw/intc/armv7m_nvic.c
+++ b/hw/intc/armv7m_nvic.c
@@ -1604,6 +1604,7 @@ static void nvic_writel(NVICState *s, uint32_t offset, uint32_t value,
         }
 
         cpu->env.v7m.ccr[attrs.secure] = value;
+        arm_rebuild_hflags(&cpu->env);
         break;
     case 0xd24: /* System Handler Control and State (SHCSR) */
         if (!arm_feature(&cpu->env, ARM_FEATURE_V7)) {
diff --git a/target/arm/m_helper.c b/target/arm/m_helper.c
index 27cd2f3f96..f2512e448e 100644
--- a/target/arm/m_helper.c
+++ b/target/arm/m_helper.c
@@ -494,6 +494,7 @@ void HELPER(v7m_bxns)(CPUARMState *env, uint32_t dest)
     switch_v7m_security_state(env, dest & 1);
     env->thumb = 1;
     env->regs[15] = dest & ~1;
+    arm_rebuild_hflags(env);
 }
 
 void HELPER(v7m_blxns)(CPUARMState *env, uint32_t dest)
@@ -555,6 +556,7 @@ void HELPER(v7m_blxns)(CPUARMState *env, uint32_t dest)
     switch_v7m_security_state(env, 0);
     env->thumb = 1;
     env->regs[15] = dest;
+    arm_rebuild_hflags(env);
 }
 
 static uint32_t *get_v7m_sp_ptr(CPUARMState *env, bool secure, bool threadmode,
@@ -895,6 +897,7 @@ static void v7m_exception_taken(ARMCPU *cpu, uint32_t lr, bool dotailchain,
     env->regs[14] = lr;
     env->regs[15] = addr & 0xfffffffe;
     env->thumb = addr & 1;
+    arm_rebuild_hflags(env);
 }
 
 static void v7m_update_fpccr(CPUARMState *env, uint32_t frameptr,
@@ -1765,6 +1768,7 @@ static void do_v7m_exception_exit(ARMCPU *cpu)
 
     /* Otherwise, we have a successful exception exit. */
     arm_clear_exclusive(env);
+    arm_rebuild_hflags(env);
     qemu_log_mask(CPU_LOG_INT, "...successful exception return\n");
 }
 
@@ -1837,6 +1841,7 @@ static bool do_v7m_function_return(ARMCPU *cpu)
     xpsr_write(env, 0, XPSR_IT);
     env->thumb = newpc & 1;
     env->regs[15] = newpc & ~1;
+    arm_rebuild_hflags(env);
 
     qemu_log_mask(CPU_LOG_INT, "...function return successful\n");
     return true;
@@ -1959,6 +1964,7 @@ static bool v7m_handle_execute_nsc(ARMCPU *cpu)
     switch_v7m_security_state(env, true);
     xpsr_write(env, 0, XPSR_IT);
     env->regs[15] += 4;
+    arm_rebuild_hflags(env);
     return true;
 
 gen_invep:
diff --git a/target/arm/translate.c b/target/arm/translate.c
index cb47cd9744..b3720cd59b 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -8325,7 +8325,7 @@ static bool trans_MRS_v7m(DisasContext *s, arg_MRS_v7m *a)
 
 static bool trans_MSR_v7m(DisasContext *s, arg_MSR_v7m *a)
 {
-    TCGv_i32 addr, reg;
+    TCGv_i32 addr, reg, el;
 
     if (!arm_dc_feature(s, ARM_FEATURE_M)) {
         return false;
@@ -8335,6 +8335,9 @@ static bool trans_MSR_v7m(DisasContext *s, arg_MSR_v7m *a)
     gen_helper_v7m_msr(cpu_env, addr, reg);
     tcg_temp_free_i32(addr);
     tcg_temp_free_i32(reg);
+    el = tcg_const_i32(s->current_el);
+    gen_helper_rebuild_hflags_m32(cpu_env, el);
+    tcg_temp_free_i32(el);
     gen_lookup_tb(s);
     return true;
 }
-- 
2.17.1

