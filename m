Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 782D0CD4F3D
	for <qemu-arm@archiver.kernel.org>; Wed, 20 May 2026 17:22:19 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wPkaT-0002xk-FX; Wed, 20 May 2026 13:20:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wPkZE-0001a1-Rz
 for qemu-arm@nongnu.org; Wed, 20 May 2026 13:18:48 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wPkZ7-00020O-Nl
 for qemu-arm@nongnu.org; Wed, 20 May 2026 13:18:48 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 98e67ed59e1d1-36a35e4eefeso422102a91.1
 for <qemu-arm@nongnu.org>; Wed, 20 May 2026 10:18:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1779297520; x=1779902320; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rdCiAeyqDTXuK52kfIqalebuIdHOX+3Sh4uzHDXmhFg=;
 b=Bd/pvMtWAjdhY8yW3X1wPXwXjr/8koOxG6H5yxPjNeb28oa95XFW2Fv60OdHEmKBpj
 qjMreP1qFCPzTikHXHRc8VzLJm+0o6o7IqnfzzopsHr3wVAdRl4M615AhWDWGGlPI+k5
 vn1kZ2Qn7yHyiFlbdI8k93q/UV6b9E1MojGeu1nU4+BGkXEk8iH/Im0zSHIJc9wDzag2
 GAOEmjUL+wwTOCsOEfOFLe+EaMibE+kgNCNUIW26UZbHitybbTciarGNmUjcul9qfDTd
 zE6nefYVYJYbnVVTka65fOzAtqyIKTCtfnyISlYuyUqSBQfV8aJKxKj2r6IjHbqFx+ai
 CNzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779297520; x=1779902320;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=rdCiAeyqDTXuK52kfIqalebuIdHOX+3Sh4uzHDXmhFg=;
 b=N4wcCIOF3dm3Pkld1l5JhqoxGG0brLn+UDO9gKG5T4PD5AyzkVBT2bQaxIpkql8VEt
 fpbd9T2lDuzTH0qGBIMfewsRE9CtpE1XCWzHlIVYafF2vbxhrFgRmPKB7TSmR7jvdkXo
 rIx9wRVua4F/C3GlFrLGTcmS3h0PMdFMFCBkmw7RQHC8c5D3xn/g6sW575W123Lk7kK5
 ZcIqzFJpSIjBr131Yk7h46YwfX2kokWUfC+p3xLQrLwC8ZRMt6/yFwG7GkJCmGR2rp/I
 g/ASZ4JwJcpb3L3Z0rkSYunbFO59hUI7VoLLYuRXVx38JmctacdBCZ36IYTOUk/iK1wK
 NlfA==
X-Gm-Message-State: AOJu0Yyx1JXefdYnbF93DOZCr17Gge89HgYXg769ysV/Qe//bCLrim86
 3gsKl7dx8EHIRta35STGVnocjOxAS6c+YUl2eVlnEUN7HuxDpvVyC2xRdRBiZruXaMg=
X-Gm-Gg: Acq92OEJbUp2rJwUMW9E3mKKIsmxjd0zi03g62PcL8u7dS3TIuaoNUXNtpbrhNTtgm9
 waXOIDxms38XRu8p7snFOftBjWbJ7xcqVxmouEdScyRFjM7RaY8ZEYDFAJ6jrYQKhTR8eJhj4wR
 yZxbpy6CyZeNrEl+3mnE0z/LIw2oCrAX5mw3DzQJ5JwelfKx/f/jDv51U34sLmbLXxTk3dmW/BF
 oNcHlgJyT+oicmydsp5rdbLrE4wWt/zJGcKVNfdDWgRrLSxPfk7cf3yDANIU/mYRX8Cexvg/un7
 TknYncprLKBscbHTYI0G043oOURVETb5wN0eBWWbIbtbUOG8qDR72p3oaCEEigGYm6bAfxUQ1NV
 M9bJ6xajQRAwBzvbOKz3XBGvGEhvDZ1JNFkjVEHkV2MAh4LyKoKqKp1e1UmrNT48FekWe/za62V
 iushGdwiXy7hRDNi+0U6368KqzmdhlVKZyxm1DHao=
X-Received: by 2002:a17:90b:260b:b0:365:f8fc:3846 with SMTP id
 98e67ed59e1d1-36951b87209mr26499265a91.22.1779297520228; 
 Wed, 20 May 2026 10:18:40 -0700 (PDT)
Received: from stoup.. ([71.212.142.33]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-36a3c83f226sm254416a91.0.2026.05.20.10.18.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 May 2026 10:18:39 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v5 26/30] fpu: Add accessors for rebias_{underflow,overflow}
Date: Wed, 20 May 2026 10:18:16 -0700
Message-ID: <20260520171820.848839-27-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260520171820.848839-1-richard.henderson@linaro.org>
References: <20260520171820.848839-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/fpu/softfloat-helpers.h | 10 ++++++++++
 target/ppc/cpu.c                |  4 ++--
 fpu/softfloat-parts.c.inc       |  4 ++--
 fpu/softfloat-specialize.c.inc  | 10 ++++++++++
 4 files changed, 24 insertions(+), 4 deletions(-)

diff --git a/include/fpu/softfloat-helpers.h b/include/fpu/softfloat-helpers.h
index 49e04ffee9..4791a7fc87 100644
--- a/include/fpu/softfloat-helpers.h
+++ b/include/fpu/softfloat-helpers.h
@@ -131,6 +131,16 @@ static inline void set_snan_rule(FloatSNaNRule val, float_status *status)
     status->float_snan_rule = val;
 }
 
+static inline void set_float_rebias_overflow(bool val, float_status *status)
+{
+    status->rebias_overflow = val;
+}
+
+static inline void set_float_rebias_underflow(bool val, float_status *status)
+{
+    status->rebias_underflow = val;
+}
+
 static inline FloatRoundMode get_float_rounding_mode(const float_status *status)
 {
     return status->float_rounding_mode;
diff --git a/target/ppc/cpu.c b/target/ppc/cpu.c
index 4d8faaddee..41edb18643 100644
--- a/target/ppc/cpu.c
+++ b/target/ppc/cpu.c
@@ -248,8 +248,8 @@ void ppc_store_fpscr(CPUPPCState *env, target_ulong val)
         val |= FP_FEX;
     }
     env->fpscr = val;
-    env->fp_status.rebias_overflow  = (FP_OE & env->fpscr) ? true : false;
-    env->fp_status.rebias_underflow = (FP_UE & env->fpscr) ? true : false;
+    set_float_rebias_overflow(FP_OE & env->fpscr, &env->fp_status);
+    set_float_rebias_underflow(FP_UE & env->fpscr, &env->fp_status);
     if (tcg_enabled()) {
         fpscr_set_rounding_mode(env);
     }
diff --git a/fpu/softfloat-parts.c.inc b/fpu/softfloat-parts.c.inc
index bef47a932d..184614ea47 100644
--- a/fpu/softfloat-parts.c.inc
+++ b/fpu/softfloat-parts.c.inc
@@ -358,7 +358,7 @@ static void partsN(uncanon_normal)(FloatPartsN *p, float_status *s,
             switch (fmt->exp_max_kind) {
             case float_expmax_ieee:
                 flags |= float_flag_overflow;
-                if (s->rebias_overflow) {
+                if (get_float_rebias_overflow(s)) {
                     exp -= fmt->exp_re_bias;
                 } else if (overflow_norm) {
                     flags |= float_flag_inexact;
@@ -398,7 +398,7 @@ static void partsN(uncanon_normal)(FloatPartsN *p, float_status *s,
             }
         }
         fracN(shr)(p, frac_shift);
-    } else if (unlikely(s->rebias_underflow)) {
+    } else if (unlikely(get_float_rebias_underflow(s))) {
         flags |= float_flag_underflow;
         exp += fmt->exp_re_bias;
         if (p->frac_lo & round_mask) {
diff --git a/fpu/softfloat-specialize.c.inc b/fpu/softfloat-specialize.c.inc
index c1ed661f5e..b97c971ae6 100644
--- a/fpu/softfloat-specialize.c.inc
+++ b/fpu/softfloat-specialize.c.inc
@@ -94,6 +94,16 @@ static inline uint8_t get_float_default_nan_pattern(const float_status *status)
     return status->default_nan_pattern;
 }
 
+static inline bool get_float_rebias_overflow(const float_status *status)
+{
+    return status->rebias_overflow;
+}
+
+static inline bool get_float_rebias_underflow(const float_status *status)
+{
+    return status->rebias_underflow;
+}
+
 /*----------------------------------------------------------------------------
 | For the deconstructed floating-point with fraction FRAC, return true
 | if the fraction represents a signalling NaN; otherwise false.
-- 
2.43.0


