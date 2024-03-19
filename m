Received: by 2002:a17:906:aa04:b0:a46:bbde:2c08 with SMTP id ko4csp1382622ejb;
        Tue, 19 Mar 2024 08:44:38 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUtctwo3M1QThjJmjuTlyl4qIQ6OwLsWnXbJxWWYfjh5Nl5qtqK5VsvyTA5BU2n7+90OEb2+BQuy7KuZYhjdOdy7MlrDYK1
X-Google-Smtp-Source: AGHT+IHa2EyMLCiln/HcvAylhuehRkOnL7qNnPf9y1a6ri7O/mCAly8W76m2ZS9ana5xCqeawwff
X-Received: by 2002:ae9:c206:0:b0:789:e9c1:72a5 with SMTP id j6-20020ae9c206000000b00789e9c172a5mr10715956qkg.7.1710863078460;
        Tue, 19 Mar 2024 08:44:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1710863078; cv=none;
        d=google.com; s=arc-20160816;
        b=jCFD8iT4wsl5diofmIodg/YcyPNzyVRZGxxyvzdIPzLeKA1gHGSGLUBpKQzTys3YBh
         oLJFZdtBjV+/jcb1v29o9B22u1LyCEd6Oc3kPLtS9O5m4jduRTBWidtshXuqtfWPMJUJ
         1Q9L3QbOSJjOxcQRLggRBclPepMMpFRqXqfgKQlZPhJF85NhzPKI4mNCEtDgebdQ40Ea
         FJEfL8yjCxe3E5ay0uL5wNXqCJRGosGFQ+QyT/3EkyicgOw/AT2jHMrH7tad05IOsxlU
         Bjv7zRCopRaikwM7IS+6ftXcoMuH3x/t2JNT9S5Sif3n92H9eyV4HpDpQXsXZAOwCGEM
         Vp7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Uhrck07YAgtzhdFq8/D5fUYa0OpjmAt0ZJzdbBj3AUo=;
        fh=aPJPol97xYfOH367a04HD0pR1JxAhHDgYN7qXOOdXdw=;
        b=yiB0I6u6M7dAZ1lvQGD4Z+Qsw2jSqU7InjjAgUX9xFGeORDIRgJKAVasJXhhhzjWYz
         ytn0t3fJws5mDiK9Yfzlev0/ZcEonAG4ls220aiZ1sl5k1DxVDm6xmR55/ktdkKD+FmX
         Z3HkEgm8TqmplshiLBM0QzyXLpQvOWKmm1368mAq4dBW0Akv3uyoNcqxTvsdoFaF8qLG
         l/T2ILTHQ0Bs+yELRdZ83YDQhkG7QmemdKR4fE6WocC40BcKQnKRqfRMzCRKLDE7DEAg
         NV+nc/rQXkasQujrAO/cZSW01bfgr2Q//PtuzvnggjH3Av2NXm6ydApWKYUGZG8Bv6v1
         paKw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="rqu/EkyS";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id wk13-20020a05620a578d00b007887554e509si9573845qkn.492.2024.03.19.08.44.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 19 Mar 2024 08:44:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="rqu/EkyS";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rmbdY-00069k-Ll; Tue, 19 Mar 2024 11:44:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rmbdH-0005vL-It
 for qemu-arm@nongnu.org; Tue, 19 Mar 2024 11:44:09 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rmbd0-0004yA-Lr
 for qemu-arm@nongnu.org; Tue, 19 Mar 2024 11:44:06 -0400
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-33e285a33bdso2964542f8f.2
 for <qemu-arm@nongnu.org>; Tue, 19 Mar 2024 08:43:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1710863029; x=1711467829; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Uhrck07YAgtzhdFq8/D5fUYa0OpjmAt0ZJzdbBj3AUo=;
 b=rqu/EkySLXxLuBe89w6+sgPOBt2YinqCHysLniu6snnzBNL0LM9Bmucbl7hpMAlhRc
 wK6EIlb0wdHq1Tq3kC00WQx5fIVIlkd66wez6jZle/PqAOclD/riKF3cY48sXRFdjF3P
 UKLFEALzORtN1EEkRQf73vv/KeMQlDe3G98Hx+L+kJAsz6aVx0cUNV2Yzdn6ZaLmkSGE
 xNzYXKnGdXllCg5gyzd3VBKov1gE/9/6NFVUmD9sPWfaFEuuah5tauEgI7c/YEg9uwVY
 hEk1nYTE1xoDdBEpZVjvha33LJvi7pAaiMwqFtLORvN9N4B6/XDG5YKbOhRbnYON+HRO
 cd/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710863029; x=1711467829;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Uhrck07YAgtzhdFq8/D5fUYa0OpjmAt0ZJzdbBj3AUo=;
 b=rdJO8M3yYdfJEAieLuOj2WlpKVRVworxdbK+fTY/UlnsIzNv2+MWaC48wEBrF9bcQD
 wa3zj2UJUoNVOJ+se0mW/Va23fnn93n0wDItHaSTkLhatVfTOpOjgb0Zdd9kYtsoV0Lb
 +XXHgP85dPsG2ItixE1Ua7Im93d0d8DHcDiGi1eb+D5sI5niJhA9TcOCJil3/pXxTGEP
 lGR6P48TmI9SlBS04V2XyUgvzSdLgN6cR855uvBSmG/EIF0WE3xQ/nBGX3pasiGyx8py
 BnBoDuZrvzje4Cxo446AcgGHdSKIow5hmdXILs81dkQjkpEP/ZwQFXmMpwo6zus7F76T
 vmng==
X-Forwarded-Encrypted: i=1;
 AJvYcCUbBj3LQPsZceH0hUuH8NOrgdY4IYqjRDZZ88UzCvFnJbVx+Eie/SZVvsE7r5z8ej2Hla0LE7suLmcBOZhyqXv2trmB
X-Gm-Message-State: AOJu0YxBbuRMDhQd+5rVaDAk3vLSXqiHv9ZxUZilQkDocNM3B2CS5qBW
 MJaIAQgYNa1peoJIX7f7xNcZ1QUbDIBR/idagfAcYdlY3Pdy/YnsDCqV3N4X3Ak=
X-Received: by 2002:a5d:6a46:0:b0:33e:cc2e:8286 with SMTP id
 t6-20020a5d6a46000000b0033ecc2e8286mr9495145wrw.59.1710863028662; 
 Tue, 19 Mar 2024 08:43:48 -0700 (PDT)
Received: from m1x-phil.lan ([176.176.166.129])
 by smtp.gmail.com with ESMTPSA id
 w10-20020adff9ca000000b0033e72e104c5sm12591686wrr.34.2024.03.19.08.43.47
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 19 Mar 2024 08:43:48 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 qemu-ppc@nongnu.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 Anton Johansson <anjo@rev.ng>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Brian Cain <bcain@quicinc.com>
Subject: [PATCH-for-9.1 08/27] target/hexagon: Convert to
 TCGCPUOps::get_cpu_state()
Date: Tue, 19 Mar 2024 16:42:37 +0100
Message-ID: <20240319154258.71206-9-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240319154258.71206-1-philmd@linaro.org>
References: <20240319154258.71206-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
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
X-TUID: gTg4Tz1M5TdS

Convert cpu_get_tb_cpu_state() to TCGCPUOps::get_cpu_state().

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/hexagon/cpu.h | 14 --------------
 target/hexagon/cpu.c | 13 +++++++++++++
 2 files changed, 13 insertions(+), 14 deletions(-)

diff --git a/target/hexagon/cpu.h b/target/hexagon/cpu.h
index 935a9c3276..1d42c33827 100644
--- a/target/hexagon/cpu.h
+++ b/target/hexagon/cpu.h
@@ -134,20 +134,6 @@ struct ArchCPU {
 
 FIELD(TB_FLAGS, IS_TIGHT_LOOP, 0, 1)
 
-#define TARGET_HAS_CPU_GET_TB_CPU_STATE
-
-static inline void cpu_get_tb_cpu_state(CPUHexagonState *env, vaddr *pc,
-                                        uint64_t *cs_base, uint32_t *flags)
-{
-    uint32_t hex_flags = 0;
-    *pc = env->gpr[HEX_REG_PC];
-    *cs_base = 0;
-    if (*pc == env->gpr[HEX_REG_SA0]) {
-        hex_flags = FIELD_DP32(hex_flags, TB_FLAGS, IS_TIGHT_LOOP, 1);
-    }
-    *flags = hex_flags;
-}
-
 typedef HexagonCPU ArchCPU;
 
 void hexagon_translate_init(void);
diff --git a/target/hexagon/cpu.c b/target/hexagon/cpu.c
index 3a716b9be3..5e0a9441f2 100644
--- a/target/hexagon/cpu.c
+++ b/target/hexagon/cpu.c
@@ -273,6 +273,18 @@ static void hexagon_restore_state_to_opc(CPUState *cs,
     cpu_env(cs)->gpr[HEX_REG_PC] = data[0];
 }
 
+static void hexagon_get_cpu_state(CPUHexagonState *env, vaddr *pc,
+                                  uint64_t *cs_base, uint32_t *flags)
+{
+    uint32_t hex_flags = 0;
+    *pc = env->gpr[HEX_REG_PC];
+    *cs_base = 0;
+    if (*pc == env->gpr[HEX_REG_SA0]) {
+        hex_flags = FIELD_DP32(hex_flags, TB_FLAGS, IS_TIGHT_LOOP, 1);
+    }
+    *flags = hex_flags;
+}
+
 static void hexagon_cpu_reset_hold(Object *obj)
 {
     CPUState *cs = CPU(obj);
@@ -327,6 +339,7 @@ static const TCGCPUOps hexagon_tcg_ops = {
     .initialize = hexagon_translate_init,
     .synchronize_from_tb = hexagon_cpu_synchronize_from_tb,
     .restore_state_to_opc = hexagon_restore_state_to_opc,
+    .get_cpu_state = hexagon_get_cpu_state,
 };
 
 static void hexagon_cpu_class_init(ObjectClass *c, void *data)
-- 
2.41.0

