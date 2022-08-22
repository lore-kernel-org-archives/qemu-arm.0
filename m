Received: by 2002:a17:906:9c0a:0:0:0:0 with SMTP id ff10csp1187867ejc;
        Mon, 22 Aug 2022 16:39:06 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4IG3NYAENqJxy5n60KNS5u3oLGMZCSmJw7I6V6zTO6zyfIjS6227Q+ilqe+vnXThg8D+7R
X-Received: by 2002:a05:6214:21e8:b0:496:de02:b084 with SMTP id p8-20020a05621421e800b00496de02b084mr6751428qvj.120.1661211546474;
        Mon, 22 Aug 2022 16:39:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1661211546; cv=none;
        d=google.com; s=arc-20160816;
        b=WFAQvWzp8tKgX0L4138fpsdqn+4QfbBh9ugsY2U/frpS63049lTN7O3xq5adgBQD3J
         +RaTzy0eM5eK3sS+oDoXoElRrDjN3CHwMi1gNKhzDU6b0a+drF2fbMOlSxzzOioH0b5D
         y8ZN0BUoF9tVpNxjA6nJPSegvB+39uulNreFeYDP+cdP6QT2mUL1Dx+WpIhzWlJh2ffW
         8uwmlgSJ0ITIGtXx3Tcz8UnFZU3pSX5QBYkJX152eKeRyvY7ZZP2+Wsu616zoNle50BP
         qi8NwIdjHQpl0nU3Znlrfbwdf7Y2Al5cZDhlcKCRcytN+5MkdTCW/p1seZwBi8vnCm3O
         n3aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=RKoJ35vLYvCsMuP+JFswrPYXmhyjLc71nVTkFzG8E7k=;
        b=JejvmBPQy0Py9NEeClKaA33yWenhDCOhBdw9vw8dv1TCPwAVI4ylxVgg/Cfn5tftds
         vRq4wbFKh+H3vLua6g8Cp+E4U8FdeR11JQWnQ8bfI1C2jR434+2lYqE9zIWajlcBkfb9
         JjMrDJOXX0H55YxomMMe820xaGiEyUbACAexf1j/mEsW/X80h/KBMYCR8oOEnntsmf5m
         HJbcxtydxVIaCosNEuKYKir5BevPcwRYLZ+WPNEX8n1XAPoD1cQnSZqY67Tz+16xmIS6
         hz+WJ3FoWK6KNEY2sSjV6b4vXtctNK4/uadZPABeaWjmD0jOf/AVYJaT6rWIWbfc3HkB
         eKsg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WLBGS1gA;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j4-20020ac84044000000b00342fea11b7bsi5878421qtl.302.2022.08.22.16.39.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 22 Aug 2022 16:39:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WLBGS1gA;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oQH0b-0003Dr-QG
	for alex.bennee@linaro.org; Mon, 22 Aug 2022 19:39:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQGlz-0005jT-7H
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 19:24:00 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f]:43673)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQGlw-0005bY-TA
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 19:23:58 -0400
Received: by mail-pf1-x42f.google.com with SMTP id w138so9197402pfc.10
 for <qemu-devel@nongnu.org>; Mon, 22 Aug 2022 16:23:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=RKoJ35vLYvCsMuP+JFswrPYXmhyjLc71nVTkFzG8E7k=;
 b=WLBGS1gAh6iSpNuimV6mUPfJcfa6fd14Rb5wi3pghWXNje53sSNiGEmTMgDpLElnLq
 1D2PTil7WFabFFt9rGgd8mPIeMmjfV3pD14PDkaJ9deYVd3zXqgWF6avqF5T1z9L6HsZ
 7Sit5f3uxi27Rt4vovhq4rvcnvn052LbYrJM9o4vSWovqPT1O5euAisry+g7nwKtsbXM
 z2FHfSC8NB14GEwBN/BaAntnCYYdLf5GQvGCnResfoK3AVwbD8egRD2qQRiSCONPW3IY
 crxY2fYoQwN5Sm/IgJE8/0gPZNyNSdEBTmf3uHOwCpw3PkCcrjEtYGb/x04mGLhiPO+z
 HAIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=RKoJ35vLYvCsMuP+JFswrPYXmhyjLc71nVTkFzG8E7k=;
 b=MQ5cEtNSYIgyJFe0YuRicAfCznDs9b5TSOguq5ztPtTCzpVhq9zdnw4mXUK3RW+r9r
 DLxZ9pH94LdQYQ0SiUzfEikLrmyo57Db3EmvWNZpk7fue2Y7fuh4074+jAtcihcGmoau
 lLSLDlYKYZCcl8cSHP+Yz2ifcVYA9PMAPmygNAXz5bCzvb7dJWxAeqk6XA9SKFegiwO7
 tOKcSUgKIPnjoac6tt+X/CWwNpHOJXMBp6LuSYbmGWNKdnldbvNVCyNoGIsrpKpr9uaA
 4qOGoJ5fk9jL4NUlnIdt8ajvXceeeum/W4VlppIJqYb2pfCFJeOzhgA2CSYFM0EFR+7A
 1Wrg==
X-Gm-Message-State: ACgBeo0KGh41WwgdttDFNxn+aTP4dQifyctsXeoKJBDOtsYZzcuAKBYH
 KO0ZZbST7WkOlQdtU7GR+1uiCZ7c8XjywA==
X-Received: by 2002:a63:6a48:0:b0:42a:3cab:cc36 with SMTP id
 f69-20020a636a48000000b0042a3cabcc36mr15265356pgc.135.1661210636093; 
 Mon, 22 Aug 2022 16:23:56 -0700 (PDT)
Received: from stoup.. ([2602:47:d49d:ec01:c3f1:b74f:5edd:63af])
 by smtp.gmail.com with ESMTPSA id
 k17-20020aa79731000000b0052d3899f8c2sm3809112pfg.4.2022.08.22.16.23.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Aug 2022 16:23:55 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v3 14/17] target/arm: Change gen_jmp* to work on displacements
Date: Mon, 22 Aug 2022 16:23:35 -0700
Message-Id: <20220822232338.1727934-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220822232338.1727934-1-richard.henderson@linaro.org>
References: <20220822232338.1727934-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Dl2NU7eILS6Q

In preparation for TARGET_TB_PCREL, reduce reliance on absolute values.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 35 ++++++++++++++++++++---------------
 1 file changed, 20 insertions(+), 15 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 63a41ed438..4d13e365e2 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -270,6 +270,12 @@ static uint32_t read_pc(DisasContext *s)
     return s->pc_curr + (s->thumb ? 4 : 8);
 }
 
+/* The pc_curr difference for an architectural jump. */
+static int jmp_diff(DisasContext *s, int diff)
+{
+    return diff + (s->thumb ? 4 : 8);
+}
+
 /* Set a variable to the value of a CPU register.  */
 void load_reg_var(DisasContext *s, TCGv_i32 var, int reg)
 {
@@ -2614,10 +2620,8 @@ static void gen_goto_tb(DisasContext *s, int n, int diff)
 }
 
 /* Jump, specifying which TB number to use if we gen_goto_tb() */
-static inline void gen_jmp_tb(DisasContext *s, uint32_t dest, int tbno)
+static void gen_jmp_tb(DisasContext *s, int diff, int tbno)
 {
-    int diff = dest - s->pc_curr;
-
     if (unlikely(s->ss_active)) {
         /* An indirect jump so that we still trigger the debug exception.  */
         gen_update_pc(s, diff);
@@ -2659,9 +2663,9 @@ static inline void gen_jmp_tb(DisasContext *s, uint32_t dest, int tbno)
     }
 }
 
-static inline void gen_jmp(DisasContext *s, uint32_t dest)
+static inline void gen_jmp(DisasContext *s, int diff)
 {
-    gen_jmp_tb(s, dest, 0);
+    gen_jmp_tb(s, diff, 0);
 }
 
 static inline void gen_mulxy(TCGv_i32 t0, TCGv_i32 t1, int x, int y)
@@ -8331,7 +8335,7 @@ static bool trans_CLRM(DisasContext *s, arg_CLRM *a)
 
 static bool trans_B(DisasContext *s, arg_i *a)
 {
-    gen_jmp(s, read_pc(s) + a->imm);
+    gen_jmp(s, jmp_diff(s, a->imm));
     return true;
 }
 
@@ -8346,14 +8350,14 @@ static bool trans_B_cond_thumb(DisasContext *s, arg_ci *a)
         return true;
     }
     arm_skip_unless(s, a->cond);
-    gen_jmp(s, read_pc(s) + a->imm);
+    gen_jmp(s, jmp_diff(s, a->imm));
     return true;
 }
 
 static bool trans_BL(DisasContext *s, arg_i *a)
 {
     tcg_gen_movi_i32(cpu_R[14], s->base.pc_next | s->thumb);
-    gen_jmp(s, read_pc(s) + a->imm);
+    gen_jmp(s, jmp_diff(s, a->imm));
     return true;
 }
 
@@ -8373,7 +8377,8 @@ static bool trans_BLX_i(DisasContext *s, arg_BLX_i *a)
     }
     tcg_gen_movi_i32(cpu_R[14], s->base.pc_next | s->thumb);
     store_cpu_field_constant(!s->thumb, thumb);
-    gen_jmp(s, (read_pc(s) & ~3) + a->imm);
+    /* This difference computes a page offset so ok for TARGET_TB_PCREL. */
+    gen_jmp(s, (read_pc(s) & ~3) - s->pc_curr + a->imm);
     return true;
 }
 
@@ -8534,10 +8539,10 @@ static bool trans_WLS(DisasContext *s, arg_WLS *a)
          * when we take this upcoming exit from this TB, so gen_jmp_tb() is OK.
          */
     }
-    gen_jmp_tb(s, s->base.pc_next, 1);
+    gen_jmp_tb(s, curr_insn_len(s), 1);
 
     gen_set_label(nextlabel);
-    gen_jmp(s, read_pc(s) + a->imm);
+    gen_jmp(s, jmp_diff(s, a->imm));
     return true;
 }
 
@@ -8617,7 +8622,7 @@ static bool trans_LE(DisasContext *s, arg_LE *a)
 
     if (a->f) {
         /* Loop-forever: just jump back to the loop start */
-        gen_jmp(s, read_pc(s) - a->imm);
+        gen_jmp(s, jmp_diff(s, -a->imm));
         return true;
     }
 
@@ -8648,7 +8653,7 @@ static bool trans_LE(DisasContext *s, arg_LE *a)
         tcg_temp_free_i32(decr);
     }
     /* Jump back to the loop start */
-    gen_jmp(s, read_pc(s) - a->imm);
+    gen_jmp(s, jmp_diff(s, -a->imm));
 
     gen_set_label(loopend);
     if (a->tp) {
@@ -8656,7 +8661,7 @@ static bool trans_LE(DisasContext *s, arg_LE *a)
         store_cpu_field(tcg_constant_i32(4), v7m.ltpsize);
     }
     /* End TB, continuing to following insn */
-    gen_jmp_tb(s, s->base.pc_next, 1);
+    gen_jmp_tb(s, curr_insn_len(s), 1);
     return true;
 }
 
@@ -8755,7 +8760,7 @@ static bool trans_CBZ(DisasContext *s, arg_CBZ *a)
     tcg_gen_brcondi_i32(a->nz ? TCG_COND_EQ : TCG_COND_NE,
                         tmp, 0, s->condlabel);
     tcg_temp_free_i32(tmp);
-    gen_jmp(s, read_pc(s) + a->imm);
+    gen_jmp(s, jmp_diff(s, a->imm));
     return true;
 }
 
-- 
2.34.1

