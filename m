Received: by 2002:a17:906:43c7:b0:78d:9f02:16a1 with SMTP id j7csp1969302ejn;
        Sun, 16 Oct 2022 15:11:54 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6ZTbHdoEbBpcU/xlOR/mkjWqGCelMejZU8VuU3qMpNMecUjeAuzguRw3hyz7DneS3t0VLG
X-Received: by 2002:ac8:7f04:0:b0:39c:e908:5d4d with SMTP id f4-20020ac87f04000000b0039ce9085d4dmr2530418qtk.209.1665958313875;
        Sun, 16 Oct 2022 15:11:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1665958313; cv=none;
        d=google.com; s=arc-20160816;
        b=dzgHKVYAhcnizkNUkaGU4Vq0LdTnAslnUNAtl++LvGGKHxiMRKbXOh7BGuMLf0a0cJ
         Sk2U/J6UQMHI+6jkvnVbu4SijFfl84M9hSSR0MroouQpwfcEExkVQwUjEVxwdOruudsr
         ybvVrS9BDuaUy38Q1+VA/A9J82wszkyklbZjb9XRIB2GoucQgKhQs8JsRKg10tEi94lj
         2mAryWPvUhoTt7F4s8yolb6Yv0F01cKCg0XFAkdDHnCCxmOTOUZpRIMx2RypJvnxoBBK
         wagfn8GeJ/o1ZNGiMG1cm2foGGkxuwfzGdUZUFkbkBx7iKX07Z4xm/1ofVBeVw6gGdUe
         akNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=6bcy/cgrj5zD+rnRzRv+8Z9hvfKTyl1svf3Chx5N2Jw=;
        b=Zs22jCJ8sbdVuYkZgl87yI7Q8ezdIriAzPjyp9iOQk4LPdpiPNZ+ogs+hsaqJL7hQ8
         poTVgDtMmI+vyK8MWT2JvMikYtSiiNWrbNySis8CPe6MFfEk17FXbEZoY/uHzN925XNp
         gTEJxEtErRtdzilTfYfB0KH06TSBKxHv2L+Jszem+UuTfGSWrf/nGBkmSFUTx5XeAeim
         z+hNvIYmvY2DAxP1aRluTToc5/QYKB/Qm6hATqS0P7qT50VyZJX128J3lUETY0Mts6+Q
         futWSCBfAO0QYBfV+VOUcmcUhCU1EbyMXSbPekyYzUvT+mCCgtlIjKs0P0/MsXoAE5I4
         q1RQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iE1KGCKK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id hr9-20020a05621423c900b004b367101932si4973799qvb.23.2022.10.16.15.11.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 16 Oct 2022 15:11:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iE1KGCKK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50224 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1okBrN-0002nI-2N
	for alex.bennee@linaro.org; Sun, 16 Oct 2022 18:11:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54766)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1okBq5-0002iK-5t
 for qemu-arm@nongnu.org; Sun, 16 Oct 2022 18:10:33 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633]:37621)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1okBq3-0007qZ-B9
 for qemu-arm@nongnu.org; Sun, 16 Oct 2022 18:10:32 -0400
Received: by mail-pl1-x633.google.com with SMTP id d24so9212687pls.4
 for <qemu-arm@nongnu.org>; Sun, 16 Oct 2022 15:10:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6bcy/cgrj5zD+rnRzRv+8Z9hvfKTyl1svf3Chx5N2Jw=;
 b=iE1KGCKKNqnK0lKfrQNtZC35VJ8rMe9B13D93qNacvgssTD+ytXm9JbJZJ8h9fiZ2X
 4XfLwZCpjBWVgnW26D8d/Nggk5ovYeMYHJh7HFCUu3fdxaF3hLVLx5VC8/NKDHon0DC1
 PMVkmhnf4GD1MEZjInHipB+WzMFjVu9tUAz/fRHJTig6yhVFlrOzHwvc9QDtleEaSLXk
 dus7sS/B44fUY7QWm7+e6FSixiKZtmNu6BW6UyNvAtr5WjCQ5IZe6SAJqGOgT9PljOCd
 BidxNo8/544daiGAsl4hI3wq6Iiaw3z669b2aZOgrRTFKvi5pqeZ9o/R/C4h0kBNe9IC
 Xv6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6bcy/cgrj5zD+rnRzRv+8Z9hvfKTyl1svf3Chx5N2Jw=;
 b=eKdcUdyhjKDmm6fa9GJfynruq2kkbWnQPPPdl7pUv6J+7PROt0yzFk9r1vcS24r7aY
 B5/Ea2ANf/oJGFvhUEtbhrh0vntgIgbSbzs4BffvrQYeMbhDzMSjEbXAJtWnu4opb0S/
 Ris7D33SlQCBFYcR9Id+WPfi5ouFOYfVpckrHSY64bWOZRFuMVcWKPt1aP0fPqF0VQYD
 D6GShPvkkx5JwR6fv8jMi3tULDEM2oy1HIJrFQ5CH2Uw9NrWQMJzsYXXBp0fJ95+M3uE
 yUeWltOxt3y5xX/ts6eI6VycVg6MsCQlw0te7k6sjGb7dzbZxfwMgMn+8j0Nz7F0Q/mk
 6AWg==
X-Gm-Message-State: ACrzQf0z4LX4xBAVWrgYDzh9Y8cfv5N0AOmhBamEGZO/ryfcaGS0YBXv
 ffwxa6nug4WcLYA8O0ozUfEJAg==
X-Received: by 2002:a17:90b:4b46:b0:20a:e906:426d with SMTP id
 mi6-20020a17090b4b4600b0020ae906426dmr10402702pjb.48.1665958227868; 
 Sun, 16 Oct 2022 15:10:27 -0700 (PDT)
Received: from localhost.localdomain ([149.135.10.35])
 by smtp.gmail.com with ESMTPSA id
 z18-20020aa79592000000b0053e2b61b714sm5454751pfj.114.2022.10.16.15.10.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Oct 2022 15:10:27 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v7 5/9] target/arm: Remove gen_exception_internal_insn pc
 argument
Date: Mon, 17 Oct 2022 08:09:28 +1000
Message-Id: <20221016220932.274260-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221016220932.274260-1-richard.henderson@linaro.org>
References: <20221016220932.274260-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: yF5FmFqAv9mi

In preparation for TARGET_TB_PCREL, reduce reliance on absolute values.
Since we always pass dc->pc_curr, fold the arithmetic to zero displacement.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-a64.c |  6 +++---
 target/arm/translate.c     | 10 +++++-----
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 49380e1cfe..623f7e2e96 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -332,9 +332,9 @@ static void gen_exception_internal(int excp)
     gen_helper_exception_internal(cpu_env, tcg_constant_i32(excp));
 }
 
-static void gen_exception_internal_insn(DisasContext *s, uint64_t pc, int excp)
+static void gen_exception_internal_insn(DisasContext *s, int excp)
 {
-    gen_a64_update_pc(s, pc - s->pc_curr);
+    gen_a64_update_pc(s, 0);
     gen_exception_internal(excp);
     s->base.is_jmp = DISAS_NORETURN;
 }
@@ -2211,7 +2211,7 @@ static void disas_exc(DisasContext *s, uint32_t insn)
          * Secondly, "HLT 0xf000" is the A64 semihosting syscall instruction.
          */
         if (semihosting_enabled(s->current_el == 0) && imm16 == 0xf000) {
-            gen_exception_internal_insn(s, s->pc_curr, EXCP_SEMIHOST);
+            gen_exception_internal_insn(s, EXCP_SEMIHOST);
         } else {
             unallocated_encoding(s);
         }
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 350f991649..9104ab8232 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -1074,10 +1074,10 @@ static inline void gen_smc(DisasContext *s)
     s->base.is_jmp = DISAS_SMC;
 }
 
-static void gen_exception_internal_insn(DisasContext *s, uint32_t pc, int excp)
+static void gen_exception_internal_insn(DisasContext *s, int excp)
 {
     gen_set_condexec(s);
-    gen_update_pc(s, pc - s->pc_curr);
+    gen_update_pc(s, 0);
     gen_exception_internal(excp);
     s->base.is_jmp = DISAS_NORETURN;
 }
@@ -1169,7 +1169,7 @@ static inline void gen_hlt(DisasContext *s, int imm)
      */
     if (semihosting_enabled(s->current_el != 0) &&
         (imm == (s->thumb ? 0x3c : 0xf000))) {
-        gen_exception_internal_insn(s, s->pc_curr, EXCP_SEMIHOST);
+        gen_exception_internal_insn(s, EXCP_SEMIHOST);
         return;
     }
 
@@ -6556,7 +6556,7 @@ static bool trans_BKPT(DisasContext *s, arg_BKPT *a)
     if (arm_dc_feature(s, ARM_FEATURE_M) &&
         semihosting_enabled(s->current_el == 0) &&
         (a->imm == 0xab)) {
-        gen_exception_internal_insn(s, s->pc_curr, EXCP_SEMIHOST);
+        gen_exception_internal_insn(s, EXCP_SEMIHOST);
     } else {
         gen_exception_bkpt_insn(s, syn_aa32_bkpt(a->imm, false));
     }
@@ -8762,7 +8762,7 @@ static bool trans_SVC(DisasContext *s, arg_SVC *a)
     if (!arm_dc_feature(s, ARM_FEATURE_M) &&
         semihosting_enabled(s->current_el == 0) &&
         (a->imm == semihost_imm)) {
-        gen_exception_internal_insn(s, s->pc_curr, EXCP_SEMIHOST);
+        gen_exception_internal_insn(s, EXCP_SEMIHOST);
     } else {
         gen_update_pc(s, curr_insn_len(s));
         s->svc_imm = a->imm;
-- 
2.34.1

