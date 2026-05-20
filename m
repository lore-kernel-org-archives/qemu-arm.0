Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 018B8CD5BA4
	for <qemu-arm@archiver.kernel.org>; Wed, 20 May 2026 17:20:01 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wPkZR-0001jl-VE; Wed, 20 May 2026 13:19:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wPkZC-0001Yb-JU
 for qemu-arm@nongnu.org; Wed, 20 May 2026 13:18:46 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wPkZ5-0001zX-P8
 for qemu-arm@nongnu.org; Wed, 20 May 2026 13:18:46 -0400
Received: by mail-pg1-x529.google.com with SMTP id
 41be03b00d2f7-c80170db7d6so2292416a12.0
 for <qemu-arm@nongnu.org>; Wed, 20 May 2026 10:18:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1779297518; x=1779902318; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yciU7wfFxUZkhCl24mXhpsueynP3S6dxYuvKP7a/kAg=;
 b=MRDx5KCe5SY2/k2gI+X3wCcu+eOXSz57MkSY7JKqHXqdDNQcEm7k5ebQl20KWpBEM3
 FHYa6Fny5xOPhFz8Gr9SFdd6obxQqRN95pkMtGVS43oQeOktTxU/gYskXR/uEMmiHN7Z
 USzXHyj4fvbxk9PJCHrrLZ3kZBRnRq19AD/d+zmNgSmP3lL+eHJSvLn8ROSccWpgvFm3
 zjnYJ+8vSYyHovhykxANgNOr/9UbRgw+LAtZcGaiJ3JgMjdK2zgBt8uM09+81WF1B3pn
 UIy1A9MYbGUkoT4D2ijp+wyGj6bKddzGzSSa6CvDq5fktZHdnJFlFY5qLAwGZjXtpEKW
 OKdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779297518; x=1779902318;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=yciU7wfFxUZkhCl24mXhpsueynP3S6dxYuvKP7a/kAg=;
 b=RgOAzCjU+izrOYWidtG17dpoyfI4rgha0eSGRSuKxTPSZ0pK0crs1/L6ChFelXFhfg
 WCA8YQmbYEkBnda1CA5hpPTfvv0bc8uV+hqeKfUsUrs3HvLBMbMa4+ziPEKXJLS6trPe
 ntQLHvxgic257u5vqkQVvZhHU+nfedyF3VG2zJVu8jToh64jzmEZg2TV6/QU88U04mKV
 2tHaJvhjir337JvGXbi8JacHOyGB8rUFYRu9DC3i5DfcYy5rFCBi1PUhd19z70v8IOJM
 T/V9p0tgHv7xJNvRyBDjSLXR8KwSIao13adHalDSdw/nEiHH0WrlYzkGMTfEG5YxTpLQ
 TqRA==
X-Gm-Message-State: AOJu0YzG71DgYZTvxtR2mHF8anWmwCmi8awskoxNXbAnzBBqwqMjoEiW
 hQnoYe0GK3aLFDgwPf6ULKnuoBYKMTyEYKjPrqg4IwHWPKxevM/d+G7TW89NFAMixnc=
X-Gm-Gg: Acq92OGvx5JFrZ5gaxfbvBXj7N3TwoCRi6Ao4ycLirAnEfH4+oeywbFng0rHFLJksoc
 AE2CxUiybgDY57CLpHvSszTSXqbNzwsIXcIzJX2BMTTfP8xJ9GWuzP9xwptXspKsJFbgfgYbBAE
 zZrw/pBNKKLH5QZx9JNV0dAQOWQXeL3ZBJBblHfv3DxLMTdHFsCPdfLpQdinqaT4aBohjCHxHiD
 k1Sf+gDLRcHhcNlaJUlyMlxR8Px3tCkAdx6TMdJBFFyee2MWHfGfydoyFDhoTSu2HSkBKlMmgGj
 az5MpwDV7Ca5OyJkCmC/nfDAZ1W440YpDJaazLKuGjfNffK8Hlxx7kWKh/ev4R0vnhnwW092vEs
 i4uy/AqgUDjlMl+S6u4I6M3YPZ2IKE/QxY3EfVO9UThEqRk3BOnaDsfIGp5a8+7GPFfisQm+FS6
 Sshe9QMh5y9K7gcR2v4sqnwcXAmyM+
X-Received: by 2002:a17:90a:701:b0:369:7433:3b1 with SMTP id
 98e67ed59e1d1-36974330471mr12917872a91.21.1779297518215; 
 Wed, 20 May 2026 10:18:38 -0700 (PDT)
Received: from stoup.. ([71.212.142.33]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-36a3c83f226sm254416a91.0.2026.05.20.10.18.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 May 2026 10:18:37 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v5 23/30] fpu: Use {get,set}_flush_inputs_to_zero everywhere
Date: Wed, 20 May 2026 10:18:13 -0700
Message-ID: <20260520171820.848839-24-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260520171820.848839-1-richard.henderson@linaro.org>
References: <20260520171820.848839-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x529.google.com
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
 fpu/softfloat.c           | 14 +++++++-------
 target/alpha/fpu_helper.c |  2 +-
 target/alpha/helper.c     |  3 ++-
 tests/fp/fp-bench.c       |  2 +-
 fpu/softfloat-parts.c.inc |  2 +-
 5 files changed, 12 insertions(+), 11 deletions(-)

diff --git a/fpu/softfloat.c b/fpu/softfloat.c
index dcae5b3be2..be6b02d866 100644
--- a/fpu/softfloat.c
+++ b/fpu/softfloat.c
@@ -141,7 +141,7 @@ GEN_INPUT_FLUSH__NOCHECK(float64_input_flush__nocheck, float64)
 #define GEN_INPUT_FLUSH1(name, soft_t)                  \
     static inline void name(soft_t *a, float_status *s) \
     {                                                   \
-        if (likely(!s->flush_inputs_to_zero)) {         \
+        if (likely(!get_flush_inputs_to_zero(s))) {     \
             return;                                     \
         }                                               \
         soft_t ## _input_flush__nocheck(a, s);          \
@@ -154,7 +154,7 @@ GEN_INPUT_FLUSH1(float64_input_flush1, float64)
 #define GEN_INPUT_FLUSH2(name, soft_t)                                  \
     static inline void name(soft_t *a, soft_t *b, float_status *s)      \
     {                                                                   \
-        if (likely(!s->flush_inputs_to_zero)) {                         \
+        if (likely(!get_flush_inputs_to_zero(s))) {                     \
             return;                                                     \
         }                                                               \
         soft_t ## _input_flush__nocheck(a, s);                          \
@@ -168,7 +168,7 @@ GEN_INPUT_FLUSH2(float64_input_flush2, float64)
 #define GEN_INPUT_FLUSH3(name, soft_t)                                  \
     static inline void name(soft_t *a, soft_t *b, soft_t *c, float_status *s) \
     {                                                                   \
-        if (likely(!s->flush_inputs_to_zero)) {                         \
+        if (likely(!get_flush_inputs_to_zero(s))) {                     \
             return;                                                     \
         }                                                               \
         soft_t ## _input_flush__nocheck(a, s);                          \
@@ -4764,7 +4764,7 @@ static bool parts_squash_denormal(FloatParts64 p, float_status *status)
 
 float16 float16_squash_input_denormal(float16 a, float_status *status)
 {
-    if (status->flush_inputs_to_zero) {
+    if (get_flush_inputs_to_zero(status)) {
         FloatParts64 p = unpack_raw64(&float16_params, a);
 
         if (parts_squash_denormal(p, status)) {
@@ -4776,7 +4776,7 @@ float16 float16_squash_input_denormal(float16 a, float_status *status)
 
 float32 float32_squash_input_denormal(float32 a, float_status *status)
 {
-    if (status->flush_inputs_to_zero) {
+    if (get_flush_inputs_to_zero(status)) {
         FloatParts64 p = unpack_raw64(&float32_params, a);
 
         if (parts_squash_denormal(p, status)) {
@@ -4788,7 +4788,7 @@ float32 float32_squash_input_denormal(float32 a, float_status *status)
 
 float64 float64_squash_input_denormal(float64 a, float_status *status)
 {
-    if (status->flush_inputs_to_zero) {
+    if (get_flush_inputs_to_zero(status)) {
         FloatParts64 p = unpack_raw64(&float64_params, a);
 
         if (parts_squash_denormal(p, status)) {
@@ -4800,7 +4800,7 @@ float64 float64_squash_input_denormal(float64 a, float_status *status)
 
 bfloat16 bfloat16_squash_input_denormal(bfloat16 a, float_status *status)
 {
-    if (status->flush_inputs_to_zero) {
+    if (get_flush_inputs_to_zero(status)) {
         FloatParts64 p = unpack_raw64(&bfloat16_params, a);
 
         if (parts_squash_denormal(p, status)) {
diff --git a/target/alpha/fpu_helper.c b/target/alpha/fpu_helper.c
index 0ced53c54e..5b7e4bd5eb 100644
--- a/target/alpha/fpu_helper.c
+++ b/target/alpha/fpu_helper.c
@@ -151,7 +151,7 @@ void helper_ieee_input_cmp(CPUAlphaState *env, uint64_t val)
 void helper_ieee_input_s(CPUAlphaState *env, uint64_t val)
 {
     if (unlikely(2 * val - 1 < 0x1fffffffffffffull)
-        && !env->fp_status.flush_inputs_to_zero) {
+        && !get_flush_inputs_to_zero(&env->fp_status)) {
         arith_excp(env, GETPC(), EXC_M_INV | EXC_M_SWC, 0);
     }
 }
diff --git a/target/alpha/helper.c b/target/alpha/helper.c
index 33fed0c746..2abf07c191 100644
--- a/target/alpha/helper.c
+++ b/target/alpha/helper.c
@@ -24,6 +24,7 @@
 #include "exec/page-protection.h"
 #include "exec/target_page.h"
 #include "fpu/softfloat-types.h"
+#include "fpu/softfloat-helpers.h"
 #include "exec/helper-proto.h"
 #include "qemu/qemu-print.h"
 #include "system/memory.h"
@@ -80,7 +81,7 @@ void cpu_alpha_store_fpcr(CPUAlphaState *env, uint64_t val)
     env->fpcr_exc_enable = ~t & FPCR_STATUS_MASK;
 
     env->fpcr_dyn_round = rm_map[(fpcr & FPCR_DYN_MASK) >> FPCR_DYN_SHIFT];
-    env->fp_status.flush_inputs_to_zero = (fpcr & FPCR_DNZ) != 0;
+    set_flush_inputs_to_zero(fpcr & FPCR_DNZ, &env->fp_status);
 
     t = (fpcr & FPCR_UNFD) && (fpcr & FPCR_UNDZ);
 #ifdef CONFIG_USER_ONLY
diff --git a/tests/fp/fp-bench.c b/tests/fp/fp-bench.c
index ccc561b578..c53d6e4b34 100644
--- a/tests/fp/fp-bench.c
+++ b/tests/fp/fp-bench.c
@@ -672,7 +672,7 @@ static void parse_args(int argc, char *argv[])
             tester = val;
             break;
         case 'z':
-            soft_status.flush_inputs_to_zero = 1;
+            set_flush_inputs_to_zero(true, &soft_status);
             break;
         case 'Z':
             set_flush_to_zero(true, &soft_status);
diff --git a/fpu/softfloat-parts.c.inc b/fpu/softfloat-parts.c.inc
index 0e5311b50f..6a67e6af2c 100644
--- a/fpu/softfloat-parts.c.inc
+++ b/fpu/softfloat-parts.c.inc
@@ -218,7 +218,7 @@ static void partsN(canonicalize)(FloatPartsN *p, float_status *status,
     if (unlikely(p->exp == 0)) {
         if (likely(fracN(eqz)(p))) {
             p->cls = float_class_zero;
-        } else if (status->flush_inputs_to_zero) {
+        } else if (get_flush_inputs_to_zero(status)) {
             float_raise(float_flag_input_denormal_flushed, status);
             p->cls = float_class_zero;
             fracN(clear)(p);
-- 
2.43.0


