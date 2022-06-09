Received: by 2002:a19:ee12:0:0:0:0:0 with SMTP id g18csp689450lfb;
        Thu, 9 Jun 2022 13:48:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxFfPonUJklbVHWPspBrah5hFY6/uAxmJnb6BIGsZvL+/UazeoWdQMB5FLikMQFi7CoxchT
X-Received: by 2002:a05:620a:4404:b0:6a0:51e5:ee72 with SMTP id v4-20020a05620a440400b006a051e5ee72mr28848426qkp.121.1654807701200;
        Thu, 09 Jun 2022 13:48:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654807701; cv=none;
        d=google.com; s=arc-20160816;
        b=Y+SU/AzVFpS8UtIEJINU8c9Vl3Hc+oqpJ5fzg3Wb1+8MKzO/vYQ/2NyjXZ3XEjehaF
         JnobNfo0Uj977k2gUxHdWa/k/0FD05Y4SjwSrbKRS1zIKJ8h4phauazJ2RyslF8KyvxV
         RTlmq1zVyCHPJX1TlvVLCbybPC8ph1QyZBO2Of3+8dADU84Q9CkfhgTVfmdrYr20UduQ
         OR/dBQ/2DWIqiCfifAySUKhuykMJjO1lGlg6UmMMi3WDF5qtg5hPXWWODbe6QGb396MS
         dCLMfBc7yZVL2JJTVT+EHJT94U/ptB612E5IQvoGUJ3aey5YdQqD09ttXAhJUES2WafG
         0oWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=kDOWLCpGVLLdjCKXH6PsNmxsJeThW1Pjgc0CFkMFbWw=;
        b=fzyOakEWFELeDBao1nRjUrh2OpGIJaNCT9dbkdzWEmluexulK0ka1AOQVtaLl1Aagg
         dkGcGfYFrOkT9HRoPmgXgKf7Gd116QOm4jowQg8zOC+M9uEbtXipUUCdxIJsROOq87uq
         ZwttyHcJ1j6qWgJZgLr8oGq8ItJOMVNJYj+lLAc44PT/fHmvtV4qdQJ+nSxZ2X6SlsJU
         a4RoawhdnVkfmByxcVBONMkjKeokme67tgCUQWBkUTBWu0HKMCaPH5uPr/oP1a6Xng4N
         BVnNf7LCX/Ny4zeP0uW7N6FfWVdojFQDmz0GQfT+RI2ANjmdCfrpe6NAi5dRgdmkRnuN
         fRDw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nnhX+QxL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id gf11-20020a056214250b00b0045b3d6ee6d9si12635256qvb.464.2022.06.09.13.48.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 09 Jun 2022 13:48:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nnhX+QxL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nzP4m-0007Dj-MB
	for alex.bennee@linaro.org; Thu, 09 Jun 2022 16:48:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43284)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nzOmL-0003tE-PA
 for qemu-arm@nongnu.org; Thu, 09 Jun 2022 16:29:17 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435]:40695)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nzOmG-0008TX-TK
 for qemu-arm@nongnu.org; Thu, 09 Jun 2022 16:29:17 -0400
Received: by mail-pf1-x435.google.com with SMTP id z17so22028284pff.7
 for <qemu-arm@nongnu.org>; Thu, 09 Jun 2022 13:29:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kDOWLCpGVLLdjCKXH6PsNmxsJeThW1Pjgc0CFkMFbWw=;
 b=nnhX+QxLssQskHldmsxbJZFqx+lkz84X5rZ1vOBOHQ2pjDJiFiWZellsTVExZMobHk
 cDXOR5ik8Z4Z3clh027+HkNEvg2mAsd9qtqynm0T+IIOIZwDB05/99hPJx+ZpAAjwLAg
 fd+7RyzvvuUlVZE2YCrnZmJnKmOLIPPM8Aqrn7xKp7yA571Hi4At7YvATcQNMUNqxs9P
 NGbsYjuFwPxWJTmd2ztVzTRqovfPIrGNlvFmUhhogeAw4mxmIyiWs82hqxgLzx+E07AB
 sahLkbACYeuB6wroh6nY2XUaP2P96IEvfZvuQvrbmTVWpnaU/aEYP0XlkLdVgWg190p2
 cMqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kDOWLCpGVLLdjCKXH6PsNmxsJeThW1Pjgc0CFkMFbWw=;
 b=o81te69kytaFc2OPOn/fjuOY2JQf4b+a571EGDFzN6//cep/wImRitlBkSpQhH/u+7
 hHG1aFs2P5p0XQhewfXdIn+Iwah79u12OsJFzjGIQTfoPeZQZxYlZHfIkpwO3+Qz7iSw
 +ycYqAi8U5uTaYKyMBKu7NR3ryXJT+ulrzqTTNHzPwx5JLch6+2/ApOmWtbfSQB81LxX
 1a0zHRKJbgduwn7b7iJrQxZkxvIZ75fJT1zU8YH4nKGSkHoz7bCpOMMU70LyXQy3g3L8
 D1OUT8HNKn3agWUHpipc2T/4kgMPanLCz9DWm4w1Rw/hweJpmGKCWoqEy7E11EDzHaaR
 4tSA==
X-Gm-Message-State: AOAM530qrd27eSftm9gZM49MlFN+gZ11AMvvDk+3KMr88FW+74LK0Me5
 5bmI80Nqh6KROyGl29l2iUqrPg==
X-Received: by 2002:a65:4304:0:b0:3fb:9303:de99 with SMTP id
 j4-20020a654304000000b003fb9303de99mr37063178pgq.429.1654806551500; 
 Thu, 09 Jun 2022 13:29:11 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:839f:476f:678:38a])
 by smtp.gmail.com with ESMTPSA id
 r20-20020a635d14000000b003fded88238esm7528139pgb.36.2022.06.09.13.29.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jun 2022 13:29:11 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v3 10/23] target/arm: Introduce gen_exception_insn_el_v
Date: Thu,  9 Jun 2022 13:28:48 -0700
Message-Id: <20220609202901.1177572-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220609202901.1177572-1-richard.henderson@linaro.org>
References: <20220609202901.1177572-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
X-TUID: LM9wd11utu2h

Create a function below gen_exception_insn that takes
the target_el as a TCGv_i32, replacing gen_exception_el.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 27 ++++++++++++---------------
 1 file changed, 12 insertions(+), 15 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index dc033600c0..9cb31663dd 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -1086,8 +1086,8 @@ static void gen_exception_internal_insn(DisasContext *s, uint32_t pc, int excp)
     s->base.is_jmp = DISAS_NORETURN;
 }
 
-void gen_exception_insn(DisasContext *s, uint64_t pc, int excp,
-                        uint32_t syn, uint32_t target_el)
+static void gen_exception_insn_el_v(DisasContext *s, uint64_t pc, int excp,
+                                    uint32_t syn, TCGv_i32 tcg_el)
 {
     if (s->aarch64) {
         gen_a64_set_pc_im(pc);
@@ -1095,10 +1095,17 @@ void gen_exception_insn(DisasContext *s, uint64_t pc, int excp,
         gen_set_condexec(s);
         gen_set_pc_im(s, pc);
     }
-    gen_exception(excp, syn, target_el);
+    gen_helper_exception_with_syndrome_el(cpu_env, tcg_constant_i32(excp),
+                                          tcg_constant_i32(syn), tcg_el);
     s->base.is_jmp = DISAS_NORETURN;
 }
 
+void gen_exception_insn(DisasContext *s, uint64_t pc, int excp,
+                        uint32_t syn, uint32_t target_el)
+{
+    gen_exception_insn_el_v(s, pc, excp, syn, tcg_constant_i32(target_el));
+}
+
 static void gen_exception_bkpt_insn(DisasContext *s, uint32_t syn)
 {
     gen_set_condexec(s);
@@ -1114,17 +1121,6 @@ void unallocated_encoding(DisasContext *s)
                        default_exception_el(s));
 }
 
-static void gen_exception_el(DisasContext *s, int excp, uint32_t syn,
-                             TCGv_i32 tcg_el)
-{
-    gen_set_condexec(s);
-    gen_set_pc_im(s, s->pc_curr);
-    gen_helper_exception_with_syndrome_el(cpu_env,
-                                          tcg_constant_i32(excp),
-                                          tcg_constant_i32(syn), tcg_el);
-    s->base.is_jmp = DISAS_NORETURN;
-}
-
 /* Force a TB lookup after an instruction that changes the CPU state.  */
 void gen_lookup_tb(DisasContext *s)
 {
@@ -2847,7 +2843,8 @@ static bool msr_banked_access_decode(DisasContext *s, int r, int sysm, int rn,
                 tcg_el = tcg_constant_i32(3);
             }
 
-            gen_exception_el(s, EXCP_UDEF, syn_uncategorized(), tcg_el);
+            gen_exception_insn_el_v(s, s->pc_curr, EXCP_UDEF,
+                                    syn_uncategorized(), tcg_el);
             tcg_temp_free_i32(tcg_el);
             return false;
         }
-- 
2.34.1

