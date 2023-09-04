Received: by 2002:a17:906:cc96:b0:9a1:fa4e:495e with SMTP id oq22csp1444238ejb;
        Mon, 4 Sep 2023 09:14:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEV/ssa2DuvCKMchJ7tdxObKF0gR4vfzDIf8bDZasPjU49Nj7YfnnKy/8h95kP/h4Hy+JzG
X-Received: by 2002:a0c:a989:0:b0:649:b37f:46f6 with SMTP id a9-20020a0ca989000000b00649b37f46f6mr9608489qvb.13.1693844064163;
        Mon, 04 Sep 2023 09:14:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1693844064; cv=none;
        d=google.com; s=arc-20160816;
        b=HIa8JMd4euMn5s/8lcPZNK9oLlc1IB00M4cS5N2VXw1Nmh3WUM9ZOfLtfkfSXWnNon
         uPbYdPQjrUvC96WL+PrKDiscoo3YuO8fG+c57qXX4RpzNrWjon2Kbrzt+eVCdk1WMvIt
         smVuRPjPe7EUJuZS1eEnQtgPKGD1pIiXLEm4ZI57NTEbbIVvdy+oTrp2HikOe+MgHWQi
         A0XI0uMi28JHWNrpZZYdLEhZ2XyyGKW+ydTfctIJhpB2JSInqwgIwbSANM2qNLojw8Uj
         M5aS3V7GuExHwAbAX/UrKG22iIIGuwYDNletJuWYAE9JKhWYcp6MtG6klqBmhBVCUEft
         x5+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Qu4c9RFtBaI++TDfUfro9qCLzzwcVfWMk2RIqvZtG8c=;
        fh=F/1842D82jRvos7krVyRFuFf2x22S2qxPQWay0SVXOg=;
        b=LE6kGa5I7opFIIU41DfW95bgrs7/CMUwM6OXxO+bzTacHt44p/OD2yHEFz/03TZ+5M
         FHoz3fXKIPRFUHy8zB6Bw7s+enInoA8QQ+lgoBTah24aDKJ0mdUs4MxQfJYSNx2pkTO8
         JI9IPxg1ZwbR9S6QpnxAqyN4LR8JcoyYUnXtbQnZPih8ZaSi7dQ2AUb55/x1NTDDzIhZ
         3xQYCYPYeC3ZLDAVT2Jc20dnzvs0aqGy7+pC5XkE9c0IYftAb+XSN9EsK8cNPGT6tfsY
         eufRO6FoDDJy2majbhbYJW67mP6wqfUtu5nBlELw/gGe9h/RhZdUxj30iuF9Ufx5o0Jq
         twlQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="QEUf/TTt";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e25-20020a0caa59000000b0064f6f6518c1si586454qvb.592.2023.09.04.09.14.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 Sep 2023 09:14:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="QEUf/TTt";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qdCCO-0002OH-3u; Mon, 04 Sep 2023 12:13:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qdCCM-0002N7-Bz
 for qemu-arm@nongnu.org; Mon, 04 Sep 2023 12:13:10 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qdCCE-0007Tr-M3
 for qemu-arm@nongnu.org; Mon, 04 Sep 2023 12:13:09 -0400
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-52e5900cf77so275011a12.2
 for <qemu-arm@nongnu.org>; Mon, 04 Sep 2023 09:13:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693843981; x=1694448781; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Qu4c9RFtBaI++TDfUfro9qCLzzwcVfWMk2RIqvZtG8c=;
 b=QEUf/TTteNX5kzgU31y0Soiq4jioE4wkhZsLdKOHz+bWRwDzyb/c+M6lBVOXHn03op
 o+17G5DnKrkz1Hmm2uKiaWI1DjCyzvY61VzJ4b4tPMvtf15cmlS07Tg+n+9N/b75S0u9
 hfOTqERI/Z+WBoKu5ekuGEfg+662CJNe5pwFQq/cca5Xv93DdL+qcf7C48oaWm91Se1J
 v3GDtpjKOC2P7Tf5seQOLbi6T1Cbuol+LAVh+SZYZ7dqxGeLBgW7NXimL+moWkCAXpcy
 xSa2cTGWrTX17aaJ/2gs8bSnvXuN4z4NvuVPsSPevyR9eKNvHJyeclEVTp4yqe+wNfWr
 yu6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693843981; x=1694448781;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Qu4c9RFtBaI++TDfUfro9qCLzzwcVfWMk2RIqvZtG8c=;
 b=NOzRO1DNUjvPVo031Ljb1qb19LDuPdT/O/IIVAwPMDcCCv+CHaCuyTih2uTrHuyUHq
 JxHPh2zE+8Mmv6mpMhIk38bMK9HOH9OEJoBvKHT4cJ0BRKOspt9tq9Bw2+vw9LgNk5yH
 W38ySAO4ai0mWX4vOebE4J05AFMdWpT9pclft0W1h7yZ8csN0DTnVCZOzsAZ4kRM477A
 tIaIuAG6wMmhe/VcT1384AOuKFZ6AT1wYLWLMQ9TOogmT6eyWz8tQWVMl10GBOOrPuI+
 V1ihRV1lde2KMI+ghzAqb3Qiie9mvu7fjRmogTztFUYgzw2YKLHqy+bfadU5bARwp3jV
 8IRQ==
X-Gm-Message-State: AOJu0YzFoKriydvKc2HMh3kQFvNuD4Gr30yQncBOXfnqQ0Uw3gVyTYHl
 FT3E78lMAiRXr1VYjPqXpn9dee8g69RviDHBM7g=
X-Received: by 2002:a17:906:f252:b0:99c:fb44:d4a9 with SMTP id
 gy18-20020a170906f25200b0099cfb44d4a9mr5892300ejb.77.1693843981145; 
 Mon, 04 Sep 2023 09:13:01 -0700 (PDT)
Received: from m1x-phil.lan ([176.187.209.227])
 by smtp.gmail.com with ESMTPSA id
 l13-20020a170906a40d00b0099bc0daf3d7sm6415230ejz.182.2023.09.04.09.12.59
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 04 Sep 2023 09:13:00 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: Markus Armbruster <armbru@redhat.com>,
	qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>
Subject: [PATCH v2 04/22] target/mips: Clean up local variable shadowing
Date: Mon,  4 Sep 2023 18:12:16 +0200
Message-ID: <20230904161235.84651-5-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230904161235.84651-1-philmd@linaro.org>
References: <20230904161235.84651-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x535.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: wz5HTv9qCdSy

Fix:

  target/mips/tcg/nanomips_translate.c.inc:4410:33: error: declaration shadows a local variable [-Werror,-Wshadow]
                        int32_t imm = extract32(ctx->opcode, 1, 13) |
                                ^
  target/mips/tcg/nanomips_translate.c.inc:3577:9: note: previous declaration is here
    int imm;
        ^
  target/mips/tcg/translate.c:15578:19: error: declaration shadows a local variable [-Werror,-Wshadow]
    for (unsigned i = 1; i < 32; i++) {
                  ^
  target/mips/tcg/translate.c:15567:9: note: previous declaration is here
    int i;
        ^
  target/mips/tcg/msa_helper.c:7478:13: error: declaration shadows a local variable [-Werror,-Wshadow]
            MSA_FLOAT_MAXOP(pwx->w[0], min, pws->w[0], pws->w[0], 32);
            ^
  target/mips/tcg/msa_helper.c:7434:23: note: expanded from macro 'MSA_FLOAT_MAXOP'
        float_status *status = &env->active_tc.msa_fp_status;
                      ^

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/mips/tcg/msa_helper.c             | 8 ++++----
 target/mips/tcg/translate.c              | 8 +++-----
 target/mips/tcg/nanomips_translate.c.inc | 6 +++---
 3 files changed, 10 insertions(+), 12 deletions(-)

diff --git a/target/mips/tcg/msa_helper.c b/target/mips/tcg/msa_helper.c
index 29b31d70fe..391a5fca26 100644
--- a/target/mips/tcg/msa_helper.c
+++ b/target/mips/tcg/msa_helper.c
@@ -7431,15 +7431,15 @@ void helper_msa_ftq_df(CPUMIPSState *env, uint32_t df, uint32_t wd,
 
 #define MSA_FLOAT_MAXOP(DEST, OP, ARG1, ARG2, BITS)                         \
     do {                                                                    \
-        float_status *status = &env->active_tc.msa_fp_status;               \
+        float_status *status_ = &env->active_tc.msa_fp_status;              \
         int c;                                                              \
                                                                             \
-        set_float_exception_flags(0, status);                               \
-        DEST = float ## BITS ## _ ## OP(ARG1, ARG2, status);                \
+        set_float_exception_flags(0, status_);                              \
+        DEST = float ## BITS ## _ ## OP(ARG1, ARG2, status_);               \
         c = update_msacsr(env, 0, 0);                                       \
                                                                             \
         if (get_enabled_exceptions(env, c)) {                               \
-            DEST = ((FLOAT_SNAN ## BITS(status) >> 6) << 6) | c;            \
+            DEST = ((FLOAT_SNAN ## BITS(status_) >> 6) << 6) | c;           \
         }                                                                   \
     } while (0)
 
diff --git a/target/mips/tcg/translate.c b/target/mips/tcg/translate.c
index 9bb40f1849..26d741d960 100644
--- a/target/mips/tcg/translate.c
+++ b/target/mips/tcg/translate.c
@@ -15564,10 +15564,8 @@ void gen_intermediate_code(CPUState *cs, TranslationBlock *tb, int *max_insns,
 
 void mips_tcg_init(void)
 {
-    int i;
-
     cpu_gpr[0] = NULL;
-    for (i = 1; i < 32; i++)
+    for (unsigned i = 1; i < 32; i++)
         cpu_gpr[i] = tcg_global_mem_new(cpu_env,
                                         offsetof(CPUMIPSState,
                                                  active_tc.gpr[i]),
@@ -15584,7 +15582,7 @@ void mips_tcg_init(void)
                                                rname);
     }
 #endif /* !TARGET_MIPS64 */
-    for (i = 0; i < 32; i++) {
+    for (unsigned i = 0; i < 32; i++) {
         int off = offsetof(CPUMIPSState, active_fpu.fpr[i].wr.d[0]);
 
         fpu_f64[i] = tcg_global_mem_new_i64(cpu_env, off, fregnames[i]);
@@ -15592,7 +15590,7 @@ void mips_tcg_init(void)
     msa_translate_init();
     cpu_PC = tcg_global_mem_new(cpu_env,
                                 offsetof(CPUMIPSState, active_tc.PC), "PC");
-    for (i = 0; i < MIPS_DSP_ACC; i++) {
+    for (unsigned i = 0; i < MIPS_DSP_ACC; i++) {
         cpu_HI[i] = tcg_global_mem_new(cpu_env,
                                        offsetof(CPUMIPSState, active_tc.HI[i]),
                                        regnames_HI[i]);
diff --git a/target/mips/tcg/nanomips_translate.c.inc b/target/mips/tcg/nanomips_translate.c.inc
index a98dde0d2e..d81a7c2d11 100644
--- a/target/mips/tcg/nanomips_translate.c.inc
+++ b/target/mips/tcg/nanomips_translate.c.inc
@@ -4407,8 +4407,8 @@ static int decode_nanomips_32_48_opc(CPUMIPSState *env, DisasContext *ctx)
                 case NM_BPOSGE32C:
                     check_dsp_r3(ctx);
                     {
-                        int32_t imm = extract32(ctx->opcode, 1, 13) |
-                                      extract32(ctx->opcode, 0, 1) << 13;
+                        imm = extract32(ctx->opcode, 1, 13)
+                            | extract32(ctx->opcode, 0, 1) << 13;
 
                         gen_compute_branch_nm(ctx, OPC_BPOSGE32, 4, -1, -2,
                                               imm << 1);
@@ -4635,7 +4635,7 @@ static int decode_isa_nanomips(CPUMIPSState *env, DisasContext *ctx)
         break;
     case NM_LI16:
         {
-            int imm = extract32(ctx->opcode, 0, 7);
+            imm = extract32(ctx->opcode, 0, 7);
             imm = (imm == 0x7f ? -1 : imm);
             if (rt != 0) {
                 tcg_gen_movi_tl(cpu_gpr[rt], imm);
-- 
2.41.0

