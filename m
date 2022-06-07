Received: by 2002:a19:ee12:0:0:0:0:0 with SMTP id g18csp1805712lfb;
        Mon, 6 Jun 2022 19:57:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJybjCOf6bCh35gLozAFtfP8fpBrbMB8kW5c5mY170QG8984Il5leoUuVV7AHI40oefi8hGD
X-Received: by 2002:a05:622a:41:b0:2f3:c678:34df with SMTP id y1-20020a05622a004100b002f3c67834dfmr20750722qtw.67.1654570675218;
        Mon, 06 Jun 2022 19:57:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654570675; cv=none;
        d=google.com; s=arc-20160816;
        b=q4W06VwNWJ1+8mlM9oNXTtFK0wlzT9FOQlr3MrmLw64RQouo7bzJsov9+tkApWCBa1
         V7JATK6mUdwr6R5tCN0fWeg6q8FCKA+zRbxiF4xaN0H+GdXp+kWV++zsD0Egf2426jWl
         LWUL9k/JKWro4L5raDmhdvvARw5OCGGQ+BQialGyPSlwY8Zdm7HJXpIb7CnOx8h43SDq
         crO+PX5vx7nu4+XD2l9Y6SQGNyy3PQfsIB6E1zC+QGzQ9wgUydomqjYB6MbPhvVHGDYv
         4ZGHMnLRbY1E1GgwFlKXmFOUAGVLk4unTXjNMxHAtIbyVF1aE5BhdKT1y6I0ID5rEpA5
         om9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=289sSy4/34uhXPS50aA0Z7O/jFOKdwauFBDFQW9kqgA=;
        b=leafM4Ev+4ywakOVZR/FwQAU3sqrDOBxoqVAmPtKk40pYwKFuy1qr+qG0Rq/GRFMxM
         SK9nM7t/Olp1jlGyl6vNDHImLaBQJBXYZyfnAZwoGRoCj+l1tIZPf7J4zgytVeoIVkcQ
         /eqQYQ8cBH/n/GF2VBfQ+m7jZEmUF0o4y5J9+5/uAwdamoBZ2kSF/0GOugDWHv5p73S+
         mmsOBN1YwsQx3/mUH3Kp9uC48pxv+8t6VmlwmqD8voYfkdnnU5dxVqWAybysuNyNjImC
         OL8M9Y3ytPfukhbc58u8KXMRajh1M9Km0Ery3q2gd2q/AE6i0eT1gCSFQhUwqDRmvgtK
         5Gog==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="DYg/ZaQr";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id gv8-20020a056214262800b00462666ed431si8783446qvb.290.2022.06.06.19.57.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 Jun 2022 19:57:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="DYg/ZaQr";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nyPPl-0000Bd-3s
	for alex.bennee@linaro.org; Mon, 06 Jun 2022 22:57:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyPG1-0006t6-NK
 for qemu-arm@nongnu.org; Mon, 06 Jun 2022 22:47:49 -0400
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535]:35820)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyPFx-0000KW-TP
 for qemu-arm@nongnu.org; Mon, 06 Jun 2022 22:47:49 -0400
Received: by mail-pg1-x535.google.com with SMTP id 129so14560156pgc.2
 for <qemu-arm@nongnu.org>; Mon, 06 Jun 2022 19:47:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=289sSy4/34uhXPS50aA0Z7O/jFOKdwauFBDFQW9kqgA=;
 b=DYg/ZaQrnmiCUvWZk177IA9o8P3kahZ3zUq1QRY1Xk/pi0cDPTLqzGpHET2iTpTKoY
 MVfw/CG05eTaOvUs5gV32bvrcTY6gaepTYrQG7eNo8ByLRjS3lEqswZBcowrSGn4snss
 61yy7g3CZo6eJR1vrejD3AqudCG1WsEVSDHHLqNETUB8qZFUmy+Ir624fGNkJGdrbWQj
 bOC8+RHKS/+iwKc/t2Ms8kln5sr6PYkQCcVLh1iG9WxWvDw6S03Q/NYSIE7pbdmh/NdK
 67J1M3GRQ79oibveZ8l5IFmz+f5pXdT3ApaJ/tmz6/qSxquWTiz+gHVhA3IE8RgAoQHA
 5ocQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=289sSy4/34uhXPS50aA0Z7O/jFOKdwauFBDFQW9kqgA=;
 b=FOiQnZeORg1lcUpxFRiAeGbKsL40ZtHwU4hE77MFzk7WTuqXSewOeoaIH7l65fkrG0
 39wEidsSdE1iMvBbQniExnccXPTHf2FNufVszW489ho65CCqSjUJkdqelCq/m8o9BFcT
 t9sdgWvPQgoY1H+RA14QGE6tnQMsGzNuY6f7SQg0Aki55JQhDs+XBFvIvDKIupvE6Yh1
 aO2HaauG6nWeL0rfqL1WvrmvHNbeuFAHDj3SptdmvdAniLNUN9rvjtq9MjSrHC8zKJTR
 TYjiYCGeE1D2xMprLInQGNr62KtNUeAIO061dWIxNSpr5OlaKAvgXFZbmxokwKSih5Ik
 CGVQ==
X-Gm-Message-State: AOAM5303i8pTrPn1uskthNuUgxSkEb4JAfHBuIOxe2rAZNob4hvnvr/8
 EC2+C/pmAF3bCdnnv9zPilQq8S5BFSA+Yg==
X-Received: by 2002:a05:6a00:170c:b0:51b:f057:85c2 with SMTP id
 h12-20020a056a00170c00b0051bf05785c2mr16600952pfc.18.1654570064617; 
 Mon, 06 Jun 2022 19:47:44 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:d3db:cca:e5c9:6531])
 by smtp.gmail.com with ESMTPSA id
 y26-20020aa7805a000000b0051876d83714sm7476904pfm.196.2022.06.06.19.47.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jun 2022 19:47:44 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v2 11/25] target/arm: Introduce gen_exception_insn_el_v
Date: Mon,  6 Jun 2022 19:47:20 -0700
Message-Id: <20220607024734.541321-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220607024734.541321-1-richard.henderson@linaro.org>
References: <20220607024734.541321-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x535.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: 24GpmsuM9LrA

Create a function below gen_exception_insn that takes
the target_el as a TCGv_i32, replacing gen_exception_el.

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

