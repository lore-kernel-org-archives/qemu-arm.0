Received: by 2002:a8a:1930:0:0:0:0:0 with SMTP id be48csp185123ocb;
        Wed, 5 Oct 2022 20:40:05 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7ovugXEnu8QXEoULuuMKQfEhXUNDS0DryJbUpnLs8QD8CHKZl6N8wOtqKUvpBbGsrcxyUG
X-Received: by 2002:a05:622a:1a05:b0:394:5528:426a with SMTP id f5-20020a05622a1a0500b003945528426amr527015qtb.27.1665027605165;
        Wed, 05 Oct 2022 20:40:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1665027605; cv=none;
        d=google.com; s=arc-20160816;
        b=uUJaGBos943gfqo2RdEA0wFuT43rcyEBc+oTybYS5pbmyG8Zaz2yXNTqxf4sgGqfe9
         399r+9AyqJK35qJqz4G4MaOR1dIDT/hoxT6HcIvOqXJ8HAXli3rFDa/LYBGgsuHI+bcF
         IqJ/UZkOS++SRCkW1Ac3ORvMwd6054zkfu2jSAFt6XSoRrQR4ADX0GQePXMRlrCwGtRO
         +mhWCT+AoEt4r0oZD+t7dAYuKcf+BWV02/zjtovGC+Ib4CrunbdbFmXAOk5iKyvlrKEY
         5OlhjRBBW1GODIjuwaW1/CCMu2HVFln5s26253eZaj6euZDPvVqqmX2+wP9DpqTf2dt6
         fUbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=apBe+xOEG/yN097g7gF2sx0rQ+06LZSBxstARnEgFm4=;
        b=dHFZEqKBulpnPP+ZzgAIvY5gLN9kregsUNsfAnhMEggsRpIo7G6lnbPyEkz7ewCgDw
         7ZIcgYF/Pg60g1lMoc533IvAdYUNerbEGQTiFU5gITZAmUjG2KLxf8ZSjTYJcF0HzYlw
         GQn2ia7bYFxrEH1ywWjCy86rXRTLQN2cJGFn68fJmeMNWGqF5P0NSDSS7RmhyBs1kgKV
         6nFhgEWPW+lTJuXnYlxiN7mNnCAQtM/VxxTPS6BIOxC0rohpOGc5T5F6JTBvItaKkuD1
         uA4wSskhZrCR1BXGPbo0grBt4esKxhBRlCe4qvuag1p1Q0nQ4R7g4LNjAB07HF0uarqY
         wswQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZM23Fyhg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m12-20020a0562141bcc00b004af8a33b0c1si2890523qvc.476.2022.10.05.20.40.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 05 Oct 2022 20:40:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZM23Fyhg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ogHjw-0003yc-Os
	for alex.bennee@linaro.org; Wed, 05 Oct 2022 23:40:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ogHit-00032h-4I
 for qemu-arm@nongnu.org; Wed, 05 Oct 2022 23:38:59 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c]:38599)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ogHip-0002u8-2D
 for qemu-arm@nongnu.org; Wed, 05 Oct 2022 23:38:57 -0400
Received: by mail-pl1-x62c.google.com with SMTP id x1so579541plv.5
 for <qemu-arm@nongnu.org>; Wed, 05 Oct 2022 20:38:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=apBe+xOEG/yN097g7gF2sx0rQ+06LZSBxstARnEgFm4=;
 b=ZM23Fyhg+rzcP0voVzKaW06aK/aMM2HZkml+J0N0D84Tiv+Xw0ag4HI5xzcYmUCMRl
 1oEjyrnGROuOkdlsZcPJ3jDGXQsJzqKrWRJ69P9Ay6D0ln4EurhCBA8mE5BqcX/jtOou
 DQjh1WItNvyuY+/J2zTr27/elDZeCRBuoARQisTbRSJFC6eSmK+vs1PKQFVYMW4xJzaI
 JvuR26GLmc/z23MIHt7z4QGYb5puvHW9VpXDjjjFTXckkZaZgzDKpcfQ5G0gYy01wmpW
 p1Z6nazIm6zcKLhz/spW/4xOFj+YRuJMwYz7dlfcvoQ+sw3VLs14ehhbHyeXn49fj7B8
 65vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=apBe+xOEG/yN097g7gF2sx0rQ+06LZSBxstARnEgFm4=;
 b=IUvh90IeTxKnlwsqiVJk/IZ+HXKXvae+VSQKfBqi7sKMzgulXZDNdtegu9beYXApZI
 VQvUBwvaMhEK0vba4Qlw8Fsyn3YXTZ7vhn6GUfSJ4PKyQL4zIM/DABpTgAu8KzClEbhp
 r171Nci3vR37GVh4l5Jcqh6GDn2uEGhpqOhzgwZE4O0gKaTYMqFe1cgEP8veotoBnlg7
 unFWY5NHq3ouj/we+HcU8xHjfr5yNOg4RiwG8B60wL0vCRPSKs2eU3rnRD8dDCjQbTID
 WajACZvCD0Y2x+Yl4LHn+LbcyF7p5PUQ2YyvdRBiPi5REJZGnS8zVMKmv4sdm/Ax4pAy
 DbUw==
X-Gm-Message-State: ACrzQf3p+vJrXGAIB2UOXFaAc4qjm0hnndCmqEx6QMMsGsDEVGN7mjiH
 S5CxRC45gxA0KnU8ux0oIJp6iA==
X-Received: by 2002:a17:902:b942:b0:178:be25:203f with SMTP id
 h2-20020a170902b94200b00178be25203fmr2474122pls.101.1665027528568; 
 Wed, 05 Oct 2022 20:38:48 -0700 (PDT)
Received: from stoup.. ([2602:47:d49d:ec01:9ad0:4307:7d39:bb61])
 by smtp.gmail.com with ESMTPSA id
 t11-20020a63534b000000b0043014f9a4c9sm539831pgl.93.2022.10.05.20.38.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Oct 2022 20:38:48 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v6 1/9] target/arm: Introduce curr_insn_len
Date: Wed,  5 Oct 2022 20:38:38 -0700
Message-Id: <20221006033846.1178422-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221006033846.1178422-1-richard.henderson@linaro.org>
References: <20221006033846.1178422-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
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
X-TUID: kpDIiPmy9mrC

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
index 5aaccbbf71..42e11102f7 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -6654,7 +6654,7 @@ static ISSInfo make_issinfo(DisasContext *s, int rd, bool p, bool w)
     /* ISS not valid if writeback */
     if (p && !w) {
         ret = rd;
-        if (s->base.pc_next - s->pc_curr == 2) {
+        if (curr_insn_len(s) == 2) {
             ret |= ISSIs16Bit;
         }
     } else {
@@ -9817,8 +9817,7 @@ static void arm_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
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

