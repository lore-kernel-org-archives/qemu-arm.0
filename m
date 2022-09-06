Received: by 2002:a17:906:1c87:0:0:0:0 with SMTP id g7csp2854060ejh;
        Tue, 6 Sep 2022 03:12:21 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6uJmb5+S7c9AgoOwcQ2ObS4FZ6/qYqJLFnPUiTMEcKpim5SCWUYawNQO6YwgrgmeZNvg6q
X-Received: by 2002:a05:6214:4001:b0:474:1516:5372 with SMTP id kd1-20020a056214400100b0047415165372mr43294988qvb.96.1662459141072;
        Tue, 06 Sep 2022 03:12:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1662459141; cv=none;
        d=google.com; s=arc-20160816;
        b=pidiKDruaMCW76Usfe9IpViRVMTqgfs0F3dM02eHDgNATbYFUjToyfOOxgjIPOZrTq
         XQ6nwT0J40512xnQSlZK2GNmjnAsY9d6IgaGk9I8y7r5mlkMUeef/pFDYH4TiXn+z3Bm
         b84HiIrXWUZOeFLgYYUixKUvKTr+iPuhbinQqX7j49RqSaG07QxNFVhzJ9Im9WOyxRQI
         6eSMNqbxk+2fte1CzEE3uaXyO9iZhhOr0zJiKQ1ZfzZAYy77eO/6qih7d51mboo+TwGx
         fklTHxnvBMxu+gID5t4dBfaLK6tNumxNeCiWeA3LRX+kXnZJmFdKOcV5U7RXEM1McslK
         x1Zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=RKoJ35vLYvCsMuP+JFswrPYXmhyjLc71nVTkFzG8E7k=;
        b=bnZ+4jjEZpX7o+cbG7y32EmsEhGhy5MYGKVV3GWARae6C2r57j0HU5Bt2U1zmWYShA
         3n1W8ETJLosLtQ8LUBh7iIDKv9x7XsjSQIHJjWVc3pjqULvg5Z99Itbl+de95vK0XL4i
         qdufZmjR+xDuLSff3yOwjn2oHMIjgYxDgpexqHOAYZqKAaFAOtE5Bz/mq0tseCSPgJpt
         yCXSklbUMlVOin8HFdzHJ9jPwTO8Qj8r2zkdDHb9oxdDQBNd4P7+VLHHmcMTGdVwmF/M
         9Zomu2Y0bwqQC5mfUTBNUNgzOXtRNN3Blgf9VV/zL0gYE7Gb5VK+jXVlwy7rGDbfRcKM
         HNzQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Igblpssy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id jp7-20020ad45f87000000b0049d2f6c1d92si5233479qvb.585.2022.09.06.03.12.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 06 Sep 2022 03:12:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Igblpssy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oVVZ6-00048k-Hj
	for alex.bennee@linaro.org; Tue, 06 Sep 2022 06:12:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oVVSi-00044z-S7
 for qemu-arm@nongnu.org; Tue, 06 Sep 2022 06:05:45 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:40875)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oVVSf-00034T-1o
 for qemu-arm@nongnu.org; Tue, 06 Sep 2022 06:05:44 -0400
Received: by mail-wr1-x42e.google.com with SMTP id b16so14641729wru.7
 for <qemu-arm@nongnu.org>; Tue, 06 Sep 2022 03:05:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=RKoJ35vLYvCsMuP+JFswrPYXmhyjLc71nVTkFzG8E7k=;
 b=IgblpssyW8HXS/pqGANSNx0GiZcnGxb+pcQZ6P/T2FuqfxF4mHfb124Mh8hBJAIePD
 XoFeHQWJly0WjphMCjE1Lzqh5vVa2+m9Z09B/IGQ3hl4669hZzocRvdpvtVQWtrxd0cf
 IguY+/Ix6cEVGK9esnTTFa8g++TWwQRpU6I+6YVS0AQJHtLIanqcTuqxkwIWVQrqeZSZ
 +KxxOlRpOW8zBxNko7y/QNWh4cgqVVTk3R8U6DB0HPR4QeNqH8pRrB9V4BVji6dTnOn6
 X5EUHlJXqNQmeIOxxTNa90unz79+UP9ejdXddfwp7zPus12a3eO+BIB3JusAjsnTsHvD
 vnJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=RKoJ35vLYvCsMuP+JFswrPYXmhyjLc71nVTkFzG8E7k=;
 b=au1InlsiXfwRCORyVo32jIZjRB4APBNn5prRRwt2XpLV3S85OBv6Nj8dlR7l6BDbRH
 vj7JP80UUrL9mHjjUzn/6atQ/eLXmjEAAa7321lIh1fh9BDGzaz6wI2retMzE6vTuWQl
 lP9/DOFtiwV5YP7Go9KDj80VBiDYz9mtnHwu5aPJV93BJ8ea5Rm3uD90QzIX/uP+u5Td
 lPjOo9hdjPJdTGSkY0O92rZrRKARVRquyeakKPy/bfyskX4RGQvorp7bWeolgFi17hSz
 HI6E12KrmQGUqYOOVRA8/V5s+R4cAfcjZ44rUS6Mi1Qzokvv+wIvpfO75/Vl5EwjKQqK
 tq5g==
X-Gm-Message-State: ACgBeo2/3eEMHW/q/9URJLh/MQZTaeX+cSLolNo2rl/1R49IKj9FP1be
 7xxfgTcu3mV3mQT1N9ozVOfk6w==
X-Received: by 2002:a5d:4405:0:b0:228:dab2:d900 with SMTP id
 z5-20020a5d4405000000b00228dab2d900mr1014644wrq.502.1662458737893; 
 Tue, 06 Sep 2022 03:05:37 -0700 (PDT)
Received: from localhost.localdomain
 ([2a02:8084:a5c0:5a80:ba98:3a71:8524:e0b1])
 by smtp.gmail.com with ESMTPSA id
 d15-20020a5d6dcf000000b00225307f43fbsm12271081wrz.44.2022.09.06.03.05.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Sep 2022 03:05:37 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v4 6/9] target/arm: Change gen_jmp* to work on displacements
Date: Tue,  6 Sep 2022 11:05:25 +0100
Message-Id: <20220906100528.343244-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220906100528.343244-1-richard.henderson@linaro.org>
References: <20220906100528.343244-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42e.google.com
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
X-TUID: s+wLQ20P2LUY

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

