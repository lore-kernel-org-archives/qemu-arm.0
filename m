Received: by 2002:a17:906:3b11:0:0:0:0 with SMTP id g17csp2009272ejf;
        Tue, 16 Aug 2022 13:35:08 -0700 (PDT)
X-Received: by 2002:a05:6808:14c4:b0:343:7905:bbab with SMTP id f4-20020a05680814c400b003437905bbabmr136145oiw.93.1660682108089;
        Tue, 16 Aug 2022 13:35:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1660682108; cv=none;
        d=google.com; s=arc-20160816;
        b=aYdRze/bFemhHdtELajd9DfvagREVnlfz5cPl/3caYZ3Yy4KJfTLqOooZ6uHCGf43x
         uBWnZgd0M1q4wCpLpZM8FTYCIa7xs8wxdTqg/6DqdCqZw+3G1UQOpGmKDVzif3z0NK4G
         NlpuE7faNF2eyTevUCJnwwVjzDJePuwyhernIrRZFCwKPVCSXVGAh8N6k26+At/Hjh46
         oGH36pWAHOBp9vXrPtuQLB3VRJ/TkEw21d8iL++4Q87ykXQ/g8PwgdRDiiQHAgSkE79e
         1bI4Wbc7519NmPmjKCvA8q51866vYdm5jmqpbhQv3L3+qP2BNkarCQ/I5ThGU1Ky/XLj
         J2zA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=bPLSwnwAm3KKQjuztom5hM3FzbmQvthZN4SqhLXx1Bg=;
        b=rrzfFmcUoKWXt5qgbzOuT+oMNddm4jHrx/4+adUxYOdqOjw6rSR8YDN5XgmYTOZ53g
         06PNTFgcOWdbm43Mr1eKWA8yiKkr9BSJIADxhSRmqzWrGL9ULhEmTSOtFEbr/ilIV47t
         YPBBqn0ak9hwB6BiCU42/b24nRhcbg7UrvlRQtnxoBej3bCYzlKVnguxfbwNGY5QejsW
         x8Lqs6xnJPUgw0pnUBcNZuPwIiB9B/BO2MRMZqci4XoOBLdXeRcPnzfizbMMLYTIjaBT
         mPrGjwkE47e/va/Lcx1zkDnK3kVFkFcqChG5NOjrA/9HWp4jHBoOSUWlMKR6wrVgso4Y
         q3Eg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=l+SJLAFr;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id v36-20020a056830092400b006370ec4687dsor1682412ott.175.2022.08.16.13.35.07
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 16 Aug 2022 13:35:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=l+SJLAFr;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=bPLSwnwAm3KKQjuztom5hM3FzbmQvthZN4SqhLXx1Bg=;
        b=l+SJLAFr6nSyYAwIXqL7qH2D3Aqbm4zrqsb7wpZpP4FtPBjh0tR0dRz/t0WdP2zPPK
         hBab2WKucG/XNDkuao4jYbBzlES7Av/U4vpu1yGfAFsR+QPI7zu0rVCKZlG2tcCBrOyL
         h7QcC4N4HafLtDueVr3az+lHvqR27qpPHBQ//WRsIxqOxQITI6v+XbFxkC9sf/CgNWUa
         BCq3GJc7tEgo+w0FnBU0sBXIv2pOpDfilUkEEXI9bF8Lkr5FsCQgteeF/h+9KKGJsWCj
         e4cifYkW5S3mGB3oFfGcsqdzpsKh4zrZwCGQCNrfNBupM/ZETmNaFhC2dUADbBfxffRT
         nGxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=bPLSwnwAm3KKQjuztom5hM3FzbmQvthZN4SqhLXx1Bg=;
        b=ELGRgvxySxsADWpolG6CWp40juPAChWJFjYg5krzQiXhv0vWQOUCfYB5tt4tCEkDhL
         qCrVd6ZENYolc6UEjPSJ+VRDRqzIC8Y13MiUZmk+EOiNBbHA5YNiR9ytntBr/X5P8Tdl
         jDXGqFggJlVPdLndLJjqdEHxYCIKxPhaD2c+mKZt2IPKCMFwcS7XjpYlVVgVW6ZysMGC
         FDSni86IAgJHb0d/4kEKWBuzcOHtxSPtBsG/R6hidXqpIXwsPmWX+TXT4IQXRc+BWqo5
         6HB8xqpnrJVP2XcfEVBlPyS0WU82BolPYW2/OyDNZwO7/T3RsxvI37FZy0nra723n9HW
         qMOw==
X-Gm-Message-State: ACgBeo1pOSgM/EkqbaDC//HCdp7tZGmTZOHHD7eZGUsnQh1Y4QJbHHv7
	MoXgTcvUCxaeTRBntju7ibXBrLlx
X-Google-Smtp-Source: AA6agR6K3QKcVvnS4i7XdYjhU7Tg47xz6W8rDuQZDuEHXW9KMSawLO0AeXdaD5W03W1BbF06mP3oxQ==
X-Received: by 2002:a05:6830:2a07:b0:637:36c1:4765 with SMTP id y7-20020a0568302a0700b0063736c14765mr8451621otu.283.1660682107711;
        Tue, 16 Aug 2022 13:35:07 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from stoup.. ([2605:ef80:80f6:61fa:9bc2:5095:d612:5e22])
        by smtp.gmail.com with ESMTPSA id y23-20020a056870b01700b0010ef8ccde67sm2285220oae.13.2022.08.16.13.35.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Aug 2022 13:35:06 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	alex.bennee@linaro.org,
	iii@linux.ibm.com
Subject: [PATCH v2 31/33] target/arm: Introduce gen_pc_plus_diff for aarch64
Date: Tue, 16 Aug 2022 15:33:58 -0500
Message-Id: <20220816203400.161187-32-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220816203400.161187-1-richard.henderson@linaro.org>
References: <20220816203400.161187-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: hmnuaiC91xRU

In preparation for TARGET_TB_PCREL, reduce reliance on absolute values.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-a64.c | 41 +++++++++++++++++++++++++++-----------
 1 file changed, 29 insertions(+), 12 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index b777742643..322a09c503 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -148,9 +148,14 @@ static void reset_btype(DisasContext *s)
     }
 }
 
+static void gen_pc_plus_diff(DisasContext *s, TCGv_i64 dest, int diff)
+{
+    tcg_gen_movi_i64(dest, s->pc_curr + diff);
+}
+
 void gen_a64_update_pc(DisasContext *s, int diff)
 {
-    tcg_gen_movi_i64(cpu_pc, s->pc_curr + diff);
+    gen_pc_plus_diff(s, cpu_pc, diff);
 }
 
 /*
@@ -1368,7 +1373,7 @@ static void disas_uncond_b_imm(DisasContext *s, uint32_t insn)
 
     if (insn & (1U << 31)) {
         /* BL Branch with link */
-        tcg_gen_movi_i64(cpu_reg(s, 30), s->base.pc_next);
+        gen_pc_plus_diff(s, cpu_reg(s, 30), curr_insn_len(s));
     }
 
     /* B Branch / BL Branch with link */
@@ -2319,11 +2324,17 @@ static void disas_uncond_b_reg(DisasContext *s, uint32_t insn)
         default:
             goto do_unallocated;
         }
-        gen_a64_set_pc(s, dst);
         /* BLR also needs to load return address */
         if (opc == 1) {
-            tcg_gen_movi_i64(cpu_reg(s, 30), s->base.pc_next);
+            TCGv_i64 lr = cpu_reg(s, 30);
+            if (dst == lr) {
+                TCGv_i64 tmp = new_tmp_a64(s);
+                tcg_gen_mov_i64(tmp, dst);
+                dst = tmp;
+            }
+            gen_pc_plus_diff(s, lr, curr_insn_len(s));
         }
+        gen_a64_set_pc(s, dst);
         break;
 
     case 8: /* BRAA */
@@ -2346,11 +2357,17 @@ static void disas_uncond_b_reg(DisasContext *s, uint32_t insn)
         } else {
             dst = cpu_reg(s, rn);
         }
-        gen_a64_set_pc(s, dst);
         /* BLRAA also needs to load return address */
         if (opc == 9) {
-            tcg_gen_movi_i64(cpu_reg(s, 30), s->base.pc_next);
+            TCGv_i64 lr = cpu_reg(s, 30);
+            if (dst == lr) {
+                TCGv_i64 tmp = new_tmp_a64(s);
+                tcg_gen_mov_i64(tmp, dst);
+                dst = tmp;
+            }
+            gen_pc_plus_diff(s, lr, curr_insn_len(s));
         }
+        gen_a64_set_pc(s, dst);
         break;
 
     case 4: /* ERET */
@@ -2918,7 +2935,8 @@ static void disas_ld_lit(DisasContext *s, uint32_t insn)
 
     tcg_rt = cpu_reg(s, rt);
 
-    clean_addr = tcg_constant_i64(s->pc_curr + imm);
+    clean_addr = new_tmp_a64(s);
+    gen_pc_plus_diff(s, clean_addr, imm);
     if (is_vector) {
         do_fp_ld(s, rt, clean_addr, size);
     } else {
@@ -4262,23 +4280,22 @@ static void disas_ldst(DisasContext *s, uint32_t insn)
 static void disas_pc_rel_adr(DisasContext *s, uint32_t insn)
 {
     unsigned int page, rd;
-    uint64_t base;
-    uint64_t offset;
+    int64_t offset;
 
     page = extract32(insn, 31, 1);
     /* SignExtend(immhi:immlo) -> offset */
     offset = sextract64(insn, 5, 19);
     offset = offset << 2 | extract32(insn, 29, 2);
     rd = extract32(insn, 0, 5);
-    base = s->pc_curr;
 
     if (page) {
         /* ADRP (page based) */
-        base &= ~0xfff;
         offset <<= 12;
+        /* The page offset is ok for TARGET_TB_PCREL. */
+        offset -= s->pc_curr & 0xfff;
     }
 
-    tcg_gen_movi_i64(cpu_reg(s, rd), base + offset);
+    gen_pc_plus_diff(s, cpu_reg(s, rd), offset);
 }
 
 /*
-- 
2.34.1
