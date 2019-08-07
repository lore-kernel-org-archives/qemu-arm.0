Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp6074477wrv;
        Tue, 6 Aug 2019 21:57:25 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyuVEBLSApeY6WGmpYX8Nt/N+s28ik1PDjIyxkzyOVKxB63k4tmMh4GHikfquTXvTBC3Otg
X-Received: by 2002:aa7:d5cf:: with SMTP id d15mr7654098eds.67.1565153845509;
        Tue, 06 Aug 2019 21:57:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1565153845; cv=none;
        d=google.com; s=arc-20160816;
        b=bAlJSiaPs2skJBKY7mCbxkFSX1u19kzIlcxAvyB0vUyXNUU3dri9TIs1hwnA/5M8C9
         lEgxgghzRb0/9pol3gXfAGupJx+e2MEiwr4n6fm+0fT+jD1kSbKeUBcncAlZca+C5CY9
         +puvGqraNWYwnZ2UNq2tIJX1wngr8O7hvbgcNVpjkpFb7aZxrPeUYN8HckjrLcPwnLnY
         Eg6w9hJ7+2uCIoCyySpinUCzSKMbun/1ZDgQ0BkuiaHpH68a2bTB9uthwkF1R01E0ey3
         3KAV62FLWLB6RJDYCUEiC38hlCvt13mnKj0yH4e3Jn1JoWdryfGuv/Om0BiP7O0lQXJu
         7kqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=wDovHb8+ljpi4sI8lS1gqNoa7uBRHGNbFn35mP5+duU=;
        b=BZk/QcZmkIyXq18duqi7QlDqRIbGf7xSQ7wLWR4Hb6LC6hjQgNgRZburFoZ7UGf+Qq
         Ihy2D+gvdAguqK+3UK3e6OKuSsJ3uPhrpar3A61doJMY6FP6zqohHmNYxMPDShnh6EeY
         trkGNzm2XQba3oRf1KTabBE8pwxX7WP6c5IojqsZmHegpqifRG6Ke583nnEoXA7IpzMI
         GslyX0P89TRdbYubKcFITofqrb79ViunYYpozx0rEa2qSnh0THyUeNVJotl7L2zW7za9
         fCG/DNUTAqZnVMcdCA/zp/gv1BaUtI2PvsvFg8ksgZqZuJa9/A5yHHRu1OrOsS9JsRed
         p4Yg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=OqT2BEgI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s26si28687136eja.330.2019.08.06.21.57.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 06 Aug 2019 21:57:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=OqT2BEgI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hvE0q-0000QO-L0
	for alex.bennee@linaro.org; Wed, 07 Aug 2019 00:57:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40726)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richard.henderson@linaro.org>) id 1hvDxT-0001NS-Pc
 for qemu-arm@nongnu.org; Wed, 07 Aug 2019 00:53:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hvDxS-0004sy-KG
 for qemu-arm@nongnu.org; Wed, 07 Aug 2019 00:53:55 -0400
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443]:46205)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hvDxS-0004sO-DO
 for qemu-arm@nongnu.org; Wed, 07 Aug 2019 00:53:54 -0400
Received: by mail-pf1-x443.google.com with SMTP id c3so19625315pfa.13
 for <qemu-arm@nongnu.org>; Tue, 06 Aug 2019 21:53:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=wDovHb8+ljpi4sI8lS1gqNoa7uBRHGNbFn35mP5+duU=;
 b=OqT2BEgIEQuSd8ShFb3RaeD82r3Bh/yyMtSbdIegm7GtN/0mckol0Dk8e4CEQ9atBS
 9r584wbilgkg7XYqXAxTZ/Uxjvr74kX+H+fcN5OLDoQrHPej+ca94YDPcy9ho4UFNHuq
 ZdnJQSASU/HJCbEY0RmnonneN3CaLWvi4c5YJMIdM3skY9kjrWlhOkzPq0h4FNTPtpF+
 NDGqmRGJC7P2Dbijt1aF5MRIQ7tXbvmWZVm5abW+IuVdH2qccZW43718n7Zu5MWaNhyt
 FDDbnnBNlT3Asfqqscp+nh/92mCtHE19TCW8vUIY4ssvYsDsTzK22aIE+Zk6/NvcrpXA
 fBLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=wDovHb8+ljpi4sI8lS1gqNoa7uBRHGNbFn35mP5+duU=;
 b=ild1vaj/ueHuWf9RZG1rzs9c909BE63M7vV57poEbSIz64Nw9Ny213JluEUgmR8QRj
 JTWqyMRvDZH38PvLs0XLyWLa6Fs34vWFTqSHPkYs54xn0tv6VG7d5L/pShLNrmW9GSwt
 zuADKy86Oym4ScnzQ3vrOnJ6O4JaW6mQg07bVKxunCdY7aPBW5S8Ysq/FtJcD7rO9PIM
 xdJmDcy8qini9ZbxW1PEF5okgs7GJkg5rT0rRmMVUzBREsYgVYS4aTJiFT1Ieqo+8M+J
 /FM2IegtE+/IlkPpOIDe8+atEKJkUzH5+OvdiUBxnTgHDqYB0GQGBqE/y9bWwfSvbZnp
 5Ccg==
X-Gm-Message-State: APjAAAWKkBoB/LbOWITKWAkwIMoMjRhuzo+6eE+WVk5tnwSlvxXKpgs2
 y4ZlNfFpEyPo/MV68GCVbTVWHg==
X-Received: by 2002:a17:90a:2385:: with SMTP id
 g5mr6788791pje.12.1565153633487; 
 Tue, 06 Aug 2019 21:53:53 -0700 (PDT)
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net.
 [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id t9sm24347921pji.18.2019.08.06.21.53.52
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 06 Aug 2019 21:53:52 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Tue,  6 Aug 2019 21:53:32 -0700
Message-Id: <20190807045335.1361-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190807045335.1361-1-richard.henderson@linaro.org>
References: <20190807045335.1361-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::443
Subject: [Qemu-arm] [PATCH 08/11] target/arm: Replace offset with pc in
 gen_exception_internal_insn
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: TCpEkQD0fEvp

The offset is variable depending on the instruction set.
Passing in the actual value is clearer in intent.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-a64.c | 8 ++++----
 target/arm/translate.c     | 8 ++++----
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 92aa6db12e..c8504d221a 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -266,9 +266,9 @@ static void gen_exception(int excp, uint32_t syndrome, uint32_t target_el)
     tcg_temp_free_i32(tcg_excp);
 }
 
-static void gen_exception_internal_insn(DisasContext *s, int offset, int excp)
+static void gen_exception_internal_insn(DisasContext *s, uint64_t pc, int excp)
 {
-    gen_a64_set_pc_im(s->base.pc_next - offset);
+    gen_a64_set_pc_im(pc);
     gen_exception_internal(excp);
     s->base.is_jmp = DISAS_NORETURN;
 }
@@ -1938,7 +1938,7 @@ static void disas_exc(DisasContext *s, uint32_t insn)
                 break;
             }
 #endif
-            gen_exception_internal_insn(s, 0, EXCP_SEMIHOST);
+            gen_exception_internal_insn(s, s->base.pc_next, EXCP_SEMIHOST);
         } else {
             unsupported_encoding(s, insn);
         }
@@ -14234,7 +14234,7 @@ static bool aarch64_tr_breakpoint_check(DisasContextBase *dcbase, CPUState *cpu,
         /* End the TB early; it likely won't be executed */
         dc->base.is_jmp = DISAS_TOO_MANY;
     } else {
-        gen_exception_internal_insn(dc, 0, EXCP_DEBUG);
+        gen_exception_internal_insn(dc, dc->base.pc_next, EXCP_DEBUG);
         /* The address covered by the breakpoint must be
            included in [tb->pc, tb->pc + tb->size) in order
            to for it to be properly cleared -- thus we
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 7a05ecae87..e6b18ecdaf 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -1256,10 +1256,10 @@ static inline void gen_smc(DisasContext *s)
     s->base.is_jmp = DISAS_SMC;
 }
 
-static void gen_exception_internal_insn(DisasContext *s, int offset, int excp)
+static void gen_exception_internal_insn(DisasContext *s, uint32_t pc, int excp)
 {
     gen_set_condexec(s);
-    gen_set_pc_im(s, s->base.pc_next - offset);
+    gen_set_pc_im(s, pc);
     gen_exception_internal(excp);
     s->base.is_jmp = DISAS_NORETURN;
 }
@@ -1311,7 +1311,7 @@ static inline void gen_hlt(DisasContext *s, int imm)
         s->current_el != 0 &&
 #endif
         (imm == (s->thumb ? 0x3c : 0xf000))) {
-        gen_exception_internal_insn(s, 0, EXCP_SEMIHOST);
+        gen_exception_internal_insn(s, s->base.pc_next, EXCP_SEMIHOST);
         return;
     }
 
@@ -11953,7 +11953,7 @@ static bool arm_tr_breakpoint_check(DisasContextBase *dcbase, CPUState *cpu,
         /* End the TB early; it's likely not going to be executed */
         dc->base.is_jmp = DISAS_TOO_MANY;
     } else {
-        gen_exception_internal_insn(dc, 0, EXCP_DEBUG);
+        gen_exception_internal_insn(dc, dc->base.pc_next, EXCP_DEBUG);
         /* The address covered by the breakpoint must be
            included in [tb->pc, tb->pc + tb->size) in order
            to for it to be properly cleared -- thus we
-- 
2.17.1

