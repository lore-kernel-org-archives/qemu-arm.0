Received: by 2002:a17:906:43c7:b0:78d:9f02:16a1 with SMTP id j7csp835445ejn;
        Wed, 19 Oct 2022 20:18:31 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6DW03rLtD1C9Y+ah6F/suJuVR6wvwM5aDkZIMHh+DS+rfiyPdvxc7jX0chMaMFN8ZER76P
X-Received: by 2002:a05:6214:f2b:b0:4b1:7b01:6de2 with SMTP id iw11-20020a0562140f2b00b004b17b016de2mr9447926qvb.122.1666235911785;
        Wed, 19 Oct 2022 20:18:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1666235911; cv=none;
        d=google.com; s=arc-20160816;
        b=yJtwsUn+IEpy+CkaeO49JT9u2+tnq4R4gjxV2JexbJTVCzO5yfe8QUMAgES8tTtmf+
         UteS1Db0OPLMmHXtSTMwSbDmIVWqABZ/U0gK+qHLNHpCphiFBgZBNfJD/3Zoa7mISKh8
         p79W661fjQOIi7xp2XWr0nB3Y9tO+AXeUy1nSA4pLy7r/M8ZgE7SurP1MwXVq4RzWrib
         C3jG0j8gN5XwS8OmQbRq4LZQ15B43yh6nZUegdELl3KaRR73BEU6XO/VPREWqpLIcgjO
         3Phli6XXr6vo2IBb8gUkCA9Oaq6O8MdDzSGrgCOtvXL7LKGvt4YK8SPNsRZ9HRzN8tCD
         TJBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=6bcy/cgrj5zD+rnRzRv+8Z9hvfKTyl1svf3Chx5N2Jw=;
        b=aoEWo1czSEXHQnUxV5F3rU3mIBPZ8z6S9HrT/L/uy+z3yXp0aZ1jXIBgSTKUBgMK6+
         veDmU7X5khqjXDg1t28jp6HfEH4Mr47KS8uaaioZkv4RRo0gYfhlnxg70XLwkLDU9AlV
         12skVYHBINeOwUXk4lCBSdVQY4+yFLpD6cOOi90UsJ4zKe5V9KwoUS3XittQAtWbwT6m
         1ebhaWX/qCrrY9dgDN0zrwY7dlNkNY6tq3OaTnDvD+Zg7HXrt/xlNYv14yT9KuHTe7B9
         QGFm3GcR/HrnD4KOIjTv6fqtGNJwDAvbyhDrEtb90KHmsez6IOBsRi6kZbQHZDh7GMHB
         cdbg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dWyDFVZP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y188-20020a3796c5000000b006eb0c600c95si9506567qkd.491.2022.10.19.20.18.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 19 Oct 2022 20:18:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dWyDFVZP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58600 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1olM4l-00020g-7s
	for alex.bennee@linaro.org; Wed, 19 Oct 2022 23:18:31 -0400
Received: from [::1] (port=58002 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1olM0v-0002UN-TJ
	for alex.bennee@linaro.org; Wed, 19 Oct 2022 23:14:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1olLu6-0003MH-QA
 for qemu-arm@nongnu.org; Wed, 19 Oct 2022 23:07:30 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629]:37465)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1olLu3-0001p7-9l
 for qemu-arm@nongnu.org; Wed, 19 Oct 2022 23:07:29 -0400
Received: by mail-pl1-x629.google.com with SMTP id d24so19072980pls.4
 for <qemu-arm@nongnu.org>; Wed, 19 Oct 2022 20:07:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6bcy/cgrj5zD+rnRzRv+8Z9hvfKTyl1svf3Chx5N2Jw=;
 b=dWyDFVZPD6CjsRJFiEMto8mE2eW/vqKPQPlkqe8MXzMXcyDCI4RWnXM+1ytBjlfnjM
 Awn4Pbw/Na1uMfy8dXoVYb+vSo3cLWTey5T0bj8w9rRgGs8ukvCsNXXB7AEQX68dCsGZ
 OlD2xlr2AZwo9mfcdtGM64WifYKWuUQsC+lZBYahxko0bkXYDCSdw1s1AsWIiwvICoHD
 XXizs9ZESiO1F46tb16IS/z9KWIai6Fz5/SVAgYt7qLxTp44/fH2wBcO8g/n+pT5kHUO
 3OWJJQUGgQxxbaKaoilk9joT15OlJF/ahLfyUfm8yBSNvSZ0udb/h4h8wWwiLSSUemyk
 K38Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6bcy/cgrj5zD+rnRzRv+8Z9hvfKTyl1svf3Chx5N2Jw=;
 b=SBvnHs+I1Hvo5/suLraeA4Qckgvbc6lb7hxqYVOUp0F8KPblqTvemvnm57yxfkdaRp
 fK9l/cIMvP5CLF0nbZRYXzjy6ziedbe1w8eOGHtV+AFbEAi9wyqF4U5EHh809XDT5Wbs
 lJ6D+PUNApxKaxhxr9VenVepOIIHN+5P/Q3TjXr5VM/QxaENYiayAj/P6mY1OcBVci13
 CLi5FwBFsT13veItMYb0oZ85v7h0G2xkHaFnwiACvsIWn6IOSneIkaP5mMa3l6p5Wo0i
 l/wiDdV5C9dyQXWkuloUE6Fg+5hliCnbH+fNob2QmWvxyuDToOEPWJy6/GE08WjTeD4w
 AhrA==
X-Gm-Message-State: ACrzQf3CkUtPEZ8zsI9MCxZp+fWWSWNpEwKnpVUSxYJhjBTp4jJm/ezV
 UC6nuOBeIpEP2rVJN7/RNzbVhw==
X-Received: by 2002:a17:902:ec8a:b0:185:5462:261a with SMTP id
 x10-20020a170902ec8a00b001855462261amr11759982plg.160.1666235245864; 
 Wed, 19 Oct 2022 20:07:25 -0700 (PDT)
Received: from localhost.localdomain ([149.135.10.35])
 by smtp.gmail.com with ESMTPSA id
 m9-20020a63ed49000000b0043c7996f7f0sm10657647pgk.58.2022.10.19.20.07.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Oct 2022 20:07:25 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v8 5/9] target/arm: Remove gen_exception_internal_insn pc
 argument
Date: Thu, 20 Oct 2022 13:06:37 +1000
Message-Id: <20221020030641.2066807-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221020030641.2066807-1-richard.henderson@linaro.org>
References: <20221020030641.2066807-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: bmCAMumtLpLN

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

