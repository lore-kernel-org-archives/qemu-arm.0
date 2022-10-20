Received: by 2002:a17:906:43c7:b0:78d:9f02:16a1 with SMTP id j7csp832899ejn;
        Wed, 19 Oct 2022 20:13:10 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6bUifS9+QPLj184BZTf8VS2pKkO78LQlSXidKkBGmSZJcyQvfWgahVKJVZYXhPKh1OXrum
X-Received: by 2002:a37:ba04:0:b0:6e7:cc52:969e with SMTP id k4-20020a37ba04000000b006e7cc52969emr8054622qkf.412.1666235590604;
        Wed, 19 Oct 2022 20:13:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1666235590; cv=none;
        d=google.com; s=arc-20160816;
        b=JxIa2IPbyswugNGIkaaoi+Snxvt44mcZAMsxXP1gO32TadwEM60xz2kNjAb4ss7JIZ
         8GA1EtcSpfMJNMkZJOZTkkTaUYMc6BYZVCzbhUaVg5kehLpM6j8H7PrqLNH7TJ0NA6Ul
         N37tPrhwmZmvNPN7t3YgATgCQ7cmnX44L2yF15Hhziy3IneFz22/NVLQ2v0gyK1Dgjdr
         FZMXDVHk2lxGsV/6cyk/23E6T0m42WjGpLNRpYcw16vtwjJH+j6J9ZFXyjlqH/YTrVdL
         jcTBN+RY6WrCo/IYWbcjKN875JRXmJZ8zoz1O7omRFzZyFYZx2sQfqITAI51kzjzUeNM
         KkXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=8swKSgWeilWZrM/mNtFL8crpzMp47VFbNvAGDxXmm3Y=;
        b=r6cxu+FslU1b+v0Eww70krMnF06oAy3iceVdv4+TfTH6I+PsGW8uq0PXcOSl0XXGyd
         1Vh8TGAbUT9K++J7gAOKmnD3aKmpnRzMcyKK/aTJO0GbLoOi6JvJHkMcPitE1d5loV+k
         q9wYBYgVhtGcG331085jv8kvO1us9sXacXCRySwAjoE+Ed583VOdeyRL3F1LmCEpNIFw
         YGda3ItJzTRv4SoyV50YiYNC1RTJrzze+Hvwp+v18gdL0EFHBCFa4byOohBeecsLDwGV
         P6Q2q0vCSYHSS4rbko15nuFVpclJuyQ1whcJ3E4rWSbQ/qvyowfFYgdk/ju6X6NxQavh
         MXWA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=d4umjF4T;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bi34-20020a05620a31a200b006cf982c28absi10026007qkb.687.2022.10.19.20.13.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 19 Oct 2022 20:13:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=d4umjF4T;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57386 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1olLza-0000mz-2O
	for alex.bennee@linaro.org; Wed, 19 Oct 2022 23:13:10 -0400
Received: from [::1] (port=40130 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1olLvC-00033k-SR
	for alex.bennee@linaro.org; Wed, 19 Oct 2022 23:08:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48146)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1olLts-0002v2-Ft
 for qemu-arm@nongnu.org; Wed, 19 Oct 2022 23:07:17 -0400
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f]:34538)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1olLtq-0001mP-TI
 for qemu-arm@nongnu.org; Wed, 19 Oct 2022 23:07:16 -0400
Received: by mail-pg1-x52f.google.com with SMTP id 128so18039652pga.1
 for <qemu-arm@nongnu.org>; Wed, 19 Oct 2022 20:07:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8swKSgWeilWZrM/mNtFL8crpzMp47VFbNvAGDxXmm3Y=;
 b=d4umjF4TJTeW9c8Lx+zwMgq38yaK0bBRGjjVIpQQUCBpLRaRO6PLJGWN9IemoAVWs7
 irv/SL6Ft5MAnt9epwMuCLhkFiJ/PEAuD8FzWkILJM5A/ccPSa39CaFvv63Ghs/rPD6c
 zKPcs3vOWgM9NgfGlhI5MzoxlYA8Bqi4WCRkg7tJWPFscc/gY0qIw1y9neT3/XOrymW2
 DJarUHgLMJPAv0k9PlWEiUPq1WPr7t7KyEvVf+0mCD2yTNWY77vfiSm7X9en9F2rrlFX
 RorpGbgsM01cCFE4uLoak/by4ckPEqBY2R8ztfiL4yeoKVX9O6I0AeocQJNqVOZRkgZj
 H1bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8swKSgWeilWZrM/mNtFL8crpzMp47VFbNvAGDxXmm3Y=;
 b=jfzsM/Af665vxtjiaq7QEwi+NuAzPOmAhyA3R5okZrrmlvxL8lKbFTFk0bk2DdldHp
 QGI6jzRfsfwRqyXTGEkF7Yd+xoie2gZb5fpcYoWzKvNps+58He2ozuA7jgpQGA71lHuh
 L5tTJqnszcVjyrh8XYZmf3ASFGl3wCEv1qUvrW6bRC7sbt8hrKz4sB9oaa+kr+SUS/rq
 z+jRF7m6jSdj2F3JU4VfSgYQ9zEgv2ad9Lyb8j61kJvLoF4Fy18Mf3yrfqH+8rFyWYov
 DoufKVNZSoI99WuIH0s7fPYl7qFLHPCBWiZG0pTP3Q+0KIjDhf8624UFng4idVsdJT8z
 1EYQ==
X-Gm-Message-State: ACrzQf1itOJL0nujylnxPSd8WJYiAc4jxBBVhDh1dvn3ycuYMc1sS1z+
 6m/TRYTionu/FSxtyznNK/IZyw==
X-Received: by 2002:a63:1b15:0:b0:462:f17e:7051 with SMTP id
 b21-20020a631b15000000b00462f17e7051mr9991325pgb.619.1666235232375; 
 Wed, 19 Oct 2022 20:07:12 -0700 (PDT)
Received: from localhost.localdomain ([149.135.10.35])
 by smtp.gmail.com with ESMTPSA id
 m9-20020a63ed49000000b0043c7996f7f0sm10657647pgk.58.2022.10.19.20.07.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Oct 2022 20:07:11 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v8 1/9] target/arm: Introduce curr_insn_len
Date: Thu, 20 Oct 2022 13:06:33 +1000
Message-Id: <20221020030641.2066807-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221020030641.2066807-1-richard.henderson@linaro.org>
References: <20221020030641.2066807-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52f.google.com
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
X-TUID: ea7Mw3K81VlZ

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

