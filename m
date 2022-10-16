Received: by 2002:a17:906:43c7:b0:78d:9f02:16a1 with SMTP id j7csp1969220ejn;
        Sun, 16 Oct 2022 15:11:39 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM52X8eARayjxdl3iJbctwXPPGF/ljlOgEEundQjOq/m4E9o/McxU8j7Kex8F60e2uRthVFP
X-Received: by 2002:a05:620a:170c:b0:6ee:88ca:f519 with SMTP id az12-20020a05620a170c00b006ee88caf519mr5800377qkb.149.1665958299448;
        Sun, 16 Oct 2022 15:11:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1665958299; cv=none;
        d=google.com; s=arc-20160816;
        b=m58fOGNl50YOcZIJsK9T1uznntYxbIxOH/4/+e0U/OlS3UY7quQh39BXhxiXScVTBv
         zR5morMKmKzzNQ//NimrORgl84vmlZzl9iV0iSo54yujPYRtIq4rL6C1if37+W1fhrPK
         hhzrLkdGzIDArRXOaNlasqDBdG2FsY9ITGaCs7RI6Ex1og2dXn8dWdap12JoXq2amrj0
         NNzXLK0oVJlTIXIqel5yporVPjd2keRKUGDIddgrLcB4tlwQIfiyaoDoragN/we7wjU5
         wu8Q03bU3H4vUrWnlmqu3lndqBK9KOL5XUwNdQTiEQMvcKTLEO5FsqJkQ22INhNBOS13
         HIVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=8swKSgWeilWZrM/mNtFL8crpzMp47VFbNvAGDxXmm3Y=;
        b=sIc7Y88P/CqYrMv+iZg3DnpUuQdUaAlkcR9NbwCcJcg9oRk/nXuj7QrO28HdM7/G7L
         t+Zh0Xce0+oqEixUaaISA53zfrADkrBJw2rxkdfBkQs5Y5TWYsCXo9U/0hMeLI4c8INO
         kZxp6jwM5w9HKmN2igdsOBpjzbl2Sj8K9VRo3PfwptqdSw//J9e0YJinXLdViME6q4ef
         phphj2IM42Wzf6WLxJdPiBww0JseoG7JFCvRS3p1dBQsD8MjFNVFspIYex6NrjVLYwtn
         sajfQRPW1iJo89zDkeQHU0Rszix8gWW3qiwc5RQSnMmyTNmkY1BC5HzH6afwQSZ4xauL
         /rCw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="yTMJjJe/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u7-20020a0562141c0700b004b189a1a34dsi5162235qvc.259.2022.10.16.15.11.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 16 Oct 2022 15:11:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="yTMJjJe/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34404 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1okBr8-0002Am-Kk
	for alex.bennee@linaro.org; Sun, 16 Oct 2022 18:11:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41042)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1okBpo-00028i-UA
 for qemu-arm@nongnu.org; Sun, 16 Oct 2022 18:10:17 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:54127)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1okBpn-0007fO-6p
 for qemu-arm@nongnu.org; Sun, 16 Oct 2022 18:10:16 -0400
Received: by mail-pj1-x1032.google.com with SMTP id fw14so9425344pjb.3
 for <qemu-arm@nongnu.org>; Sun, 16 Oct 2022 15:10:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8swKSgWeilWZrM/mNtFL8crpzMp47VFbNvAGDxXmm3Y=;
 b=yTMJjJe/EYbKfXpEjN9c6TI4KtLneOU3RUB9wxSByq1YMJxM3qoLvQm4TnVPtlxyIr
 q3KxjuJ0M6KWopgeRgEKkteFx0d7V7NApfX+XnfPOH2L54tUqd8zdNy5hyHTfuzQm2Fb
 fyYIFSGhA+J0+toeLQQD8chk8uiFm92wRV3/ue323VfSJzE5bdd2pylALWLfanw8oBnD
 +AIH42koVMgObKOylHXANHpiktNu88FwYE7FVmvI6rlVCShlA22B0puzdX5OAqdP45oj
 9UV6e6OGI8Q2vT/ggtyASoszM4NMqfXbHFwIHzX2DwB5Ftbo8UJ4gtipU6DctOKPX4YL
 FafQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8swKSgWeilWZrM/mNtFL8crpzMp47VFbNvAGDxXmm3Y=;
 b=vEmtJvbh98i5YVbYX7iMZIT041CI/iMrVmuvsYfQYEUlGUz+x3VniXa6e4dBffhhoW
 p363YhUl7nsCXBAOQvwmgw8mczpV/bhD9wM/S/sYpCy6q/6lIE7igEawSMiFld5Y5pKy
 7Z1bGTdw6ZSb6sOqPGex48KUktoUmSPxS3O89pkTRCiNEiKASI8vYcnJHQa1jSPcR2Gg
 IrRIV/Q/Xe2InGTk/EOI7QWYKValFP5bXUeTwRwLltcuiAa7NWRLyKL++oMkGEnBuxaO
 d/33eDYMPWIv9m/6oz/k0njP18hfpHwL8/sKl0UO1yOrE1fUllOQCBXGtB4Ayhkd0fmf
 YGDw==
X-Gm-Message-State: ACrzQf1LnPJqDwiywguGXH/we5/NYLarmKWu3Uu+ML2OMWCXNml1rSBH
 nxsh+vdkHVKDvIapqHasKYQUHunis6Hehz7n
X-Received: by 2002:a17:90b:2705:b0:20a:b4fa:f624 with SMTP id
 px5-20020a17090b270500b0020ab4faf624mr10077840pjb.124.1665958214378; 
 Sun, 16 Oct 2022 15:10:14 -0700 (PDT)
Received: from localhost.localdomain ([149.135.10.35])
 by smtp.gmail.com with ESMTPSA id
 z18-20020aa79592000000b0053e2b61b714sm5454751pfj.114.2022.10.16.15.10.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Oct 2022 15:10:13 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v7 1/9] target/arm: Introduce curr_insn_len
Date: Mon, 17 Oct 2022 08:09:24 +1000
Message-Id: <20221016220932.274260-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221016220932.274260-1-richard.henderson@linaro.org>
References: <20221016220932.274260-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
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
X-TUID: qAhz4uiL4s4U

A simple helper to retrieve the length of the current insn.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.h     | 5 +++++
 target/arm/translate-vfp.c | 2 +-
 target/arm/translate.c     | 5 ++---
 3 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/target/arm/translate.h b/target/arm/translate.h
index af5d4a7086..90bf7c57fc 100644
--- a/target/arm/translate.h
+++ b/target/arm/translate.h
@@ -226,6 +226,11 @@ static inline void disas_set_insn_syndrome(DisasContext *s, uint32_t syn)
     s->insn_start = NULL;
 }
 
+static inline int curr_insn_len(DisasContext *s)
+{
+    return s->base.pc_next - s->pc_curr;
+}
+
 /* is_jmp field values */
 #define DISAS_JUMP      DISAS_TARGET_0 /* only pc was modified dynamically */
 /* CPU state was modified dynamically; exit to main loop for interrupts. */
diff --git a/target/arm/translate-vfp.c b/target/arm/translate-vfp.c
index bd5ae27d09..94cc1e4b77 100644
--- a/target/arm/translate-vfp.c
+++ b/target/arm/translate-vfp.c
@@ -242,7 +242,7 @@ static bool vfp_access_check_a(DisasContext *s, bool ignore_vfp_enabled)
     if (s->sme_trap_nonstreaming) {
         gen_exception_insn(s, s->pc_curr, EXCP_UDEF,
                            syn_smetrap(SME_ET_Streaming,
-                                       s->base.pc_next - s->pc_curr == 2));
+                                       curr_insn_len(s) == 2));
         return false;
     }
 
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 2f72afe019..5752b7af5c 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -6650,7 +6650,7 @@ static ISSInfo make_issinfo(DisasContext *s, int rd, bool p, bool w)
     /* ISS not valid if writeback */
     if (p && !w) {
         ret = rd;
-        if (s->base.pc_next - s->pc_curr == 2) {
+        if (curr_insn_len(s) == 2) {
             ret |= ISSIs16Bit;
         }
     } else {
@@ -9812,8 +9812,7 @@ static void arm_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
             /* nothing more to generate */
             break;
         case DISAS_WFI:
-            gen_helper_wfi(cpu_env,
-                           tcg_constant_i32(dc->base.pc_next - dc->pc_curr));
+            gen_helper_wfi(cpu_env, tcg_constant_i32(curr_insn_len(dc)));
             /*
              * The helper doesn't necessarily throw an exception, but we
              * must go back to the main loop to check for interrupts anyway.
-- 
2.34.1

