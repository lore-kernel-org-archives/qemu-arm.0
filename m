Received: by 2002:a8a:1193:0:0:0:0:0 with SMTP id m19csp42666ocs;
        Fri, 30 Sep 2022 15:10:24 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6iGggHOUkwwSLh97I8+yHHkibkryywWjekrvblozEncGimNISkIhbaxs/emj0l1bn0h7Ty
X-Received: by 2002:ad4:5e89:0:b0:4ad:715:897 with SMTP id jl9-20020ad45e89000000b004ad07150897mr8420160qvb.114.1664575824845;
        Fri, 30 Sep 2022 15:10:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1664575824; cv=none;
        d=google.com; s=arc-20160816;
        b=IVU22BNTxnQCr0BJgIRrCQZLgLXqM77Qx9am4mv2fwtmBHyUQIWOXNsG8J32ORcREo
         gXptzt/IBOT9LqlOrY1YkP890y9Z9474zi65ZedvsbvxPf2HxDoOe7JgYaLsQEaHCgDq
         vKDFLDNOH4G5jIm/fyVQyxnilI9Blx5OXxlTn7I4FcBX5eybRH5GVrr/SHZbiZBTcgOq
         g+fXWFV3RZvlXwSPxtSn8XlQ20VCD95x1FuTrqrnJJ5uaLsnJlhDckFz4ihBAdAKORTH
         HgJgGIRj7pYAylf7MkqE51QdMoTPT3rYwVcdjSmLmXzRoYTq2aeywkMWqpthyF/Jc3ad
         W7DQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=3hKb/je4nMUKelmVIMgrIA0fdH/qZbe18AKzmaatg8o=;
        b=SUSXqawPVTlME6Ndkq5YuN/uffW3xCyQ6WjGmmpDQJ/n1ZCGR8KKBc2ObYiZNl+BJh
         P8nv5CAjktsEAVDWjdttuQp5Fo5WlwKdu/9IM7wkdMm83SvqkblT1/F0aw6wmSirst/6
         jcqCw7jOb4Zzozvo9xaqP/qxqZU72I/BQh/Vj4GJiyeS3lmSN0pFhvlSsn1KnrpAHZV/
         GNvDOBhlWFI3WxUyio6SgeU2xpweVs6alF/WvrXgj3Hk9DXESNUwlnfrguyilEcKY4Kx
         wn4IsiF27BNea2dz3jEyVQ3qgn0d8qv8z62kvC3DyqXMILUTdThwGubGqpINEhCrQxEt
         cnsw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yy6MxWq1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y30-20020ac8705e000000b0035cf72a3281si2146254qtm.498.2022.09.30.15.10.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 30 Sep 2022 15:10:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yy6MxWq1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oeODA-0003c8-BI
	for alex.bennee@linaro.org; Fri, 30 Sep 2022 18:10:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oeO6X-0001sB-4V
 for qemu-arm@nongnu.org; Fri, 30 Sep 2022 18:03:33 -0400
Received: from mail-qv1-xf2d.google.com ([2607:f8b0:4864:20::f2d]:35506)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oeO6S-0002Ze-Eg
 for qemu-arm@nongnu.org; Fri, 30 Sep 2022 18:03:32 -0400
Received: by mail-qv1-xf2d.google.com with SMTP id i12so3656868qvs.2
 for <qemu-arm@nongnu.org>; Fri, 30 Sep 2022 15:03:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=3hKb/je4nMUKelmVIMgrIA0fdH/qZbe18AKzmaatg8o=;
 b=yy6MxWq1YV0tj9Nk8BFm7dLU5pvB2Q/au1KarvkTXo0lT3HgyiTou1MaoKbLO74uC5
 NS0IuDbpH3xCHDx1jzleAMwXyfYW79hamLMWEORgAGeNGktYOZsHik0ApNlGHyyW2DfW
 9dIFh6PfUqiNY4lA4e+ze+igYUNpyy03jKBVxYfaNuRgJqhYgUenPRbntbMPrzsA3+CB
 PDJ3OHbxfTdSP6UA62boQWn78hIX0q2XIh3vObCJlc/Q6DkWFoGTJEzyfBU/LCezZ+QX
 H85og6OFTl9/4obet+U4EbGJhlWZ0x2NNfhbeyHiUnS+BEWyw1hPnVu1Vu3yJ7Qf3Q7N
 JsyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=3hKb/je4nMUKelmVIMgrIA0fdH/qZbe18AKzmaatg8o=;
 b=sRL6TlvMAsZagHqI0+w9GboBr/uFE6ETmJx+uc1ZtIRCo6rQBmCzsKEH95lvZNLnRH
 1V/7DZQOqF+cHO7fqE2wpcinXP+2Z1ZJFPJzIHKx77D/GZuwhsmcPkRb5/nLRXwdkmVN
 UrY0d0CxpWmIfB/fQnltklRO6bO2YJ0/Kv/u8ZPzS36ait/i5Lz6Tad56MfTcwQc+aI7
 dUrV0GTPppEPY1zCbxN2gKTSARPJU/G3LByd90gsvfw5u8Y5hezoS7k7mZA42nFajKzm
 cT3LmIuWfZM5u7+/30I7G2Iyt1zbgzfF8k28g60qX2xNfpJASGstp9jXxOLADUIRY+3x
 hqiw==
X-Gm-Message-State: ACrzQf11FrwXabIls6oqZLlKqq1J6sMZO4zU9/L7uolKv6zqOOKY2Xr1
 WRIu1UmndC+YgmsXthiFLH5xJjDhya6hoA==
X-Received: by 2002:a05:6214:2307:b0:46e:5fbc:3c30 with SMTP id
 gc7-20020a056214230700b0046e5fbc3c30mr8547009qvb.21.1664575407578; 
 Fri, 30 Sep 2022 15:03:27 -0700 (PDT)
Received: from stoup.. ([2605:ef80:80a1:5a60:d0d7:468b:5667:114b])
 by smtp.gmail.com with ESMTPSA id
 o15-20020a05620a22cf00b006bb78d095c5sm3196055qki.79.2022.09.30.15.03.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Sep 2022 15:03:27 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v5 6/9] target/arm: Change gen_jmp* to work on displacements
Date: Fri, 30 Sep 2022 15:03:09 -0700
Message-Id: <20220930220312.135327-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220930220312.135327-1-richard.henderson@linaro.org>
References: <20220930220312.135327-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2d;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf2d.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: q7wpilBkdPBM

In preparation for TARGET_TB_PCREL, reduce reliance on absolute values.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 37 +++++++++++++++++++++----------------
 1 file changed, 21 insertions(+), 16 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index e0b1d415a2..fd35db8c8c 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -270,6 +270,12 @@ static uint32_t read_pc(DisasContext *s)
     return s->pc_curr + (s->thumb ? 4 : 8);
 }
 
+/* The pc_curr difference for an architectural jump. */
+static target_long jmp_diff(DisasContext *s, target_long diff)
+{
+    return diff + (s->thumb ? 4 : 8);
+}
+
 /* Set a variable to the value of a CPU register.  */
 void load_reg_var(DisasContext *s, TCGv_i32 var, int reg)
 {
@@ -2596,7 +2602,7 @@ static void gen_goto_ptr(void)
  * cpu_loop_exec. Any live exit_requests will be processed as we
  * enter the next TB.
  */
-static void gen_goto_tb(DisasContext *s, int n, int diff)
+static void gen_goto_tb(DisasContext *s, int n, target_long diff)
 {
     target_ulong dest = s->pc_curr + diff;
 
@@ -2612,10 +2618,8 @@ static void gen_goto_tb(DisasContext *s, int n, int diff)
 }
 
 /* Jump, specifying which TB number to use if we gen_goto_tb() */
-static inline void gen_jmp_tb(DisasContext *s, uint32_t dest, int tbno)
+static void gen_jmp_tb(DisasContext *s, target_long diff, int tbno)
 {
-    int diff = dest - s->pc_curr;
-
     if (unlikely(s->ss_active)) {
         /* An indirect jump so that we still trigger the debug exception.  */
         gen_update_pc(s, diff);
@@ -2657,9 +2661,9 @@ static inline void gen_jmp_tb(DisasContext *s, uint32_t dest, int tbno)
     }
 }
 
-static inline void gen_jmp(DisasContext *s, uint32_t dest)
+static inline void gen_jmp(DisasContext *s, target_long diff)
 {
-    gen_jmp_tb(s, dest, 0);
+    gen_jmp_tb(s, diff, 0);
 }
 
 static inline void gen_mulxy(TCGv_i32 t0, TCGv_i32 t1, int x, int y)
@@ -8326,7 +8330,7 @@ static bool trans_CLRM(DisasContext *s, arg_CLRM *a)
 
 static bool trans_B(DisasContext *s, arg_i *a)
 {
-    gen_jmp(s, read_pc(s) + a->imm);
+    gen_jmp(s, jmp_diff(s, a->imm));
     return true;
 }
 
@@ -8341,14 +8345,14 @@ static bool trans_B_cond_thumb(DisasContext *s, arg_ci *a)
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
 
@@ -8368,7 +8372,8 @@ static bool trans_BLX_i(DisasContext *s, arg_BLX_i *a)
     }
     tcg_gen_movi_i32(cpu_R[14], s->base.pc_next | s->thumb);
     store_cpu_field_constant(!s->thumb, thumb);
-    gen_jmp(s, (read_pc(s) & ~3) + a->imm);
+    /* This difference computes a page offset so ok for TARGET_TB_PCREL. */
+    gen_jmp(s, (read_pc(s) & ~3) - s->pc_curr + a->imm);
     return true;
 }
 
@@ -8529,10 +8534,10 @@ static bool trans_WLS(DisasContext *s, arg_WLS *a)
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
 
@@ -8612,7 +8617,7 @@ static bool trans_LE(DisasContext *s, arg_LE *a)
 
     if (a->f) {
         /* Loop-forever: just jump back to the loop start */
-        gen_jmp(s, read_pc(s) - a->imm);
+        gen_jmp(s, jmp_diff(s, -a->imm));
         return true;
     }
 
@@ -8643,7 +8648,7 @@ static bool trans_LE(DisasContext *s, arg_LE *a)
         tcg_temp_free_i32(decr);
     }
     /* Jump back to the loop start */
-    gen_jmp(s, read_pc(s) - a->imm);
+    gen_jmp(s, jmp_diff(s, -a->imm));
 
     gen_set_label(loopend);
     if (a->tp) {
@@ -8651,7 +8656,7 @@ static bool trans_LE(DisasContext *s, arg_LE *a)
         store_cpu_field(tcg_constant_i32(4), v7m.ltpsize);
     }
     /* End TB, continuing to following insn */
-    gen_jmp_tb(s, s->base.pc_next, 1);
+    gen_jmp_tb(s, curr_insn_len(s), 1);
     return true;
 }
 
@@ -8750,7 +8755,7 @@ static bool trans_CBZ(DisasContext *s, arg_CBZ *a)
     tcg_gen_brcondi_i32(a->nz ? TCG_COND_EQ : TCG_COND_NE,
                         tmp, 0, s->condlabel);
     tcg_temp_free_i32(tmp);
-    gen_jmp(s, read_pc(s) + a->imm);
+    gen_jmp(s, jmp_diff(s, a->imm));
     return true;
 }
 
-- 
2.34.1

