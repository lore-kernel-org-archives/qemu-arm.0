Received: by 2002:a17:906:aa04:b0:a46:bbde:2c08 with SMTP id ko4csp1384209ejb;
        Tue, 19 Mar 2024 08:47:18 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUrROy/ZtjYbe0+Si3HCgWY8hHnzwYGnJ//+yuCO9ud/KpRl0na/NJRZ1s4je3g3IdVvKJLGu+Fr/wVvV6zhNic5QWJY+B1
X-Google-Smtp-Source: AGHT+IHyPxo1veEQkzZ5rSxcwTSjDvnVN8/Qr87h6fp61pXk/HUJbWzl+QwD377+RlCkevFJL+AF
X-Received: by 2002:ac8:4405:0:b0:42e:ef7a:d697 with SMTP id j5-20020ac84405000000b0042eef7ad697mr4807660qtn.33.1710863237785;
        Tue, 19 Mar 2024 08:47:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1710863237; cv=none;
        d=google.com; s=arc-20160816;
        b=WqD10AxM0eZkhrX514hpkvAwJO/KEiOAIkVffu8tVNge1266r5YmTshPW4zhzRWhWb
         GjZ9a+Ps5AYohtVpM7cA3fpDIJZGWiDfl2D/Rk25vV5DKNPLxE3KIKRwGelIzAkwGR1r
         qh84W6IO3slAXKs+Nh91XSzMNb1jRBo7ngiRgnQ0huop8hmPf1YO5E6OrVEnuNRQnP8f
         cdOAeQQyw4+9lHSj66hLSOjNobtQGe02bqyU8lNJQXfLjwk/V/F/sA9i0ohP63M7s4JU
         yC/lNuebpnvJXA+KqzRjAps1bOTNNoNw5svLJGKDm1a2KqgCE7G/zJmwN9Qo6LXyLr5r
         mIzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=goVPZjhGsrNSLmW6IZIplIeGALKCmKT21+JRh5OPT4g=;
        fh=RlQYLPQH+TMJTEvMJHAV3VIP5UQwNcKK9VwZHIayJLA=;
        b=Re3k/brMDJjcrxwWdR7ShWOJEo3Dbf+ouYw9/9NWgWIJbgIa0Gl6LQGloznP0Pv8HX
         BVa4lio8EzJd/xijASJ6cX5dtxdana+E/lgMkdsti/eEL/B4bu2VT/cJ6jl6WOoPqUgo
         uEianFTzB3UKiZ+tY0O7gpui4qDuo/GTNbnJaKVY4PDEB1e69AQCL+3JXJPgf8SxxH+e
         AaS062VH1d/hLId6sif9WcHyuJq7rMPHZDkcWWGkGOw3HiWhwSy50m8Qu8eVSNFj7/L5
         CXzokXC5uTaffsEPLjyUgb0n0oX92CEFXCj28f2QkyaQM11V/XTEEfrEbFZQWjC624Py
         WF2Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RF89ge2M;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u20-20020ac858d4000000b00430d8ca526dsi3386183qta.762.2024.03.19.08.47.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 19 Mar 2024 08:47:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RF89ge2M;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rmbdp-0007bp-Lb; Tue, 19 Mar 2024 11:44:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rmbdn-0007Rq-4f
 for qemu-arm@nongnu.org; Tue, 19 Mar 2024 11:44:39 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rmbdd-0005Dx-B0
 for qemu-arm@nongnu.org; Tue, 19 Mar 2024 11:44:38 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-41468993f93so3067505e9.3
 for <qemu-arm@nongnu.org>; Tue, 19 Mar 2024 08:44:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1710863068; x=1711467868; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=goVPZjhGsrNSLmW6IZIplIeGALKCmKT21+JRh5OPT4g=;
 b=RF89ge2MZ0jHRN0KR97wC/9dNKrOWqZ5vxM1+bvJ3kk78z1eRgfNk6GmenC7ohxWES
 GHcgFnzAm8Jx34p0plVoWm4BjvSojifDphY+U/zubykc+9Q7pOLhmbLxURSY7HPliMGm
 nInSFUdVY0T0mbO+Rpqr6NyumiHbHD9IcPsGCUTFUIf/t1u9IS9vLAWHlJ2M7j6zKfRs
 PilbfkICYH12MtRjOe3UtVLp0j+XhWb5n+38peOWDHAw09MnDDxOF7ksyvR/t9DBpl2j
 4XcVAyTnNEokZkCkG0Q3UUYu5/9A9kXTBI9m0857V9JRisLR0PV3/M1WIOLtt6eHLZUh
 4n7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710863068; x=1711467868;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=goVPZjhGsrNSLmW6IZIplIeGALKCmKT21+JRh5OPT4g=;
 b=MSaYDgdB5gJHiplhtRf9sSVuhC3dEqZAAu7MFk1zzxaU6JwcGK3FP2Hn3dot/hD0WE
 uAd9DhEoesL+1+QJ4TPNqVOPNhuwcNfUrXCYzDmb/WsG3AuTQrNB5Md3p7MewsdKz8Sq
 PsbTLlt+FujB7jr+JvQYNC3WV/FgBJIFFBiv7+UZu1zisa+d2DLII8zX5optmyc2zKNk
 LaKn+jqVvR6lSvNz3z21wFVAQUFUV3dHOByTdmqcQycm+sBMg4HiJwB2lTB3HTHHwET/
 qu8LAOR0Ir7+knOp9HJQaf9Hxmdt3B8RKkRp3WyPD4EU0x28uTgAu5crQAkfgKT+qmDo
 LTzA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVJgcshO8d6JfyPXZ5deq9Kg4Hgb9svcJ6CKNpgPcc6mrVo7YdIiJ/Y9ZOl7+jpTfkcEFCcEEs+njXkbD0f+tTJe7oL
X-Gm-Message-State: AOJu0Yw3npl5/i10JfclHje2PLR0p+zBV5TlX8MisgwuaqKhGH9Sau65
 8okusVgqeyHxHJjk7+M/vQBaQHxSHKuU592UNXU8ioy5W8UAnPnCzGEkhSc8zP4=
X-Received: by 2002:a05:600c:314e:b0:413:ee58:db7e with SMTP id
 h14-20020a05600c314e00b00413ee58db7emr2335980wmo.3.1710863067825; 
 Tue, 19 Mar 2024 08:44:27 -0700 (PDT)
Received: from m1x-phil.lan ([176.176.166.129])
 by smtp.gmail.com with ESMTPSA id
 u6-20020a05600c19c600b0041413546e5bsm5695602wmq.0.2024.03.19.08.44.26
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 19 Mar 2024 08:44:27 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 qemu-ppc@nongnu.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 Anton Johansson <anjo@rev.ng>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Chris Wulff <crwulff@gmail.com>, Marek Vasut <marex@denx.de>
Subject: [PATCH-for-9.1 15/27] target/nios2: Convert to
 TCGCPUOps::get_cpu_state()
Date: Tue, 19 Mar 2024 16:42:44 +0100
Message-ID: <20240319154258.71206-16-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240319154258.71206-1-philmd@linaro.org>
References: <20240319154258.71206-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x331.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: vGOm2e2LXe3E

Convert cpu_get_tb_cpu_state() to TCGCPUOps::get_cpu_state().

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/nios2/cpu.h | 14 --------------
 target/nios2/cpu.c | 13 +++++++++++++
 2 files changed, 13 insertions(+), 14 deletions(-)

diff --git a/target/nios2/cpu.h b/target/nios2/cpu.h
index 32002b819a..d0616723fe 100644
--- a/target/nios2/cpu.h
+++ b/target/nios2/cpu.h
@@ -286,18 +286,4 @@ FIELD(TBFLAGS, CRS0, 0, 1)  /* Set if CRS == 0. */
 FIELD(TBFLAGS, U, 1, 1)     /* Overlaps CR_STATUS_U */
 FIELD(TBFLAGS, R0_0, 2, 1)  /* Set if R0 == 0. */
 
-#define TARGET_HAS_CPU_GET_TB_CPU_STATE
-
-static inline void cpu_get_tb_cpu_state(CPUNios2State *env, vaddr *pc,
-                                        uint64_t *cs_base, uint32_t *flags)
-{
-    unsigned crs = FIELD_EX32(env->ctrl[CR_STATUS], CR_STATUS, CRS);
-
-    *pc = env->pc;
-    *cs_base = 0;
-    *flags = (env->ctrl[CR_STATUS] & CR_STATUS_U)
-           | (crs ? 0 : R_TBFLAGS_CRS0_MASK)
-           | (env->regs[0] ? 0 : R_TBFLAGS_R0_0_MASK);
-}
-
 #endif /* NIOS2_CPU_H */
diff --git a/target/nios2/cpu.c b/target/nios2/cpu.c
index 679aff5730..d1a98c47ad 100644
--- a/target/nios2/cpu.c
+++ b/target/nios2/cpu.c
@@ -43,6 +43,18 @@ static void nios2_restore_state_to_opc(CPUState *cs,
     cpu_env(cs)->pc = data[0];
 }
 
+static void nios2_get_cpu_state(CPUNios2State *env, vaddr *pc,
+                                uint64_t *cs_base, uint32_t *flags)
+{
+    unsigned crs = FIELD_EX32(env->ctrl[CR_STATUS], CR_STATUS, CRS);
+
+    *pc = env->pc;
+    *cs_base = 0;
+    *flags = (env->ctrl[CR_STATUS] & CR_STATUS_U)
+             | (crs ? 0 : R_TBFLAGS_CRS0_MASK)
+             | (env->regs[0] ? 0 : R_TBFLAGS_R0_0_MASK);
+}
+
 static bool nios2_cpu_has_work(CPUState *cs)
 {
     return cs->interrupt_request & CPU_INTERRUPT_HARD;
@@ -354,6 +366,7 @@ static const struct SysemuCPUOps nios2_sysemu_ops = {
 static const TCGCPUOps nios2_tcg_ops = {
     .initialize = nios2_tcg_init,
     .restore_state_to_opc = nios2_restore_state_to_opc,
+    .get_cpu_state = nios2_get_cpu_state,
 
 #ifndef CONFIG_USER_ONLY
     .tlb_fill = nios2_cpu_tlb_fill,
-- 
2.41.0

