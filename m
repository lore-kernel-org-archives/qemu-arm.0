Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp78702ejb;
        Wed, 15 Feb 2023 19:10:21 -0800 (PST)
X-Google-Smtp-Source: AK7set/TQYlU0GXkjQmQpKL3aIg23zAhM6lhpdY3b6TfycR4iTH9mWGO9pfgod9WI5bKiYvGgeKY
X-Received: by 2002:ac8:7dc1:0:b0:3b9:d14c:39f8 with SMTP id c1-20020ac87dc1000000b003b9d14c39f8mr7969329qte.40.1676517021117;
        Wed, 15 Feb 2023 19:10:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676517021; cv=none;
        d=google.com; s=arc-20160816;
        b=1FxQeyMog+dKg8uhVpWa/X3+3y5bd6Q3v8R6xbAkUVPrRZeoyJ6Xsix5ixj0MmINn8
         cifYav/AZIdNMI7LGUXj9DkTA88fZOwswL6jXG0r8MAH300PSyVPqEOVG37cIWQCs1Cn
         7YgUrTkpGL1guvQ3gVgfXCGOEOEZ3ks1cRr4X7P6Kr67kCI7NDxXuGQqnVfEoc2YSHyL
         8TNEwT0dpi3RHyzQ2QVObZrDDsOqbX+WiCN0qhhsErlZy5csde3aRwFBrVxUqhe+9ggA
         aitB7Tg4EZVdJza+zTybKa0U26Y5087FL92DYPHI/VQKiK2iu8RGDzVODQ+g6Eg744qw
         tYuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=wXIVB/G8C9wXJG2rRAh3Q1CpNhqpKuo9H1YxYu+YGPs=;
        b=mDQc2PfPUSsG8HDnDrprzH8iKo5jU4eC8OyYsv5QylCKoHlyWlJJRU+Gqvew5AICQp
         pZKeWwjvcapQgq2VloxygRLXQWTXeqZmFopdBT4wySbRbYlsdxS1YMasj1dT/g2NQz/I
         kfHbf7R27ka8lv1EEScG7+DyWuCrFgLbXSmkg/YMMwzoQUyKPcFfY4ZOETY2DARrxCPn
         CsTHUvLPSY9GHp+SzKE5Hb8fkkxljRw1AY7B2S78g78zgyBsm/PZK4PAbayRDloMwcNl
         pqgCJft2ccvbU2FUfhjTKPWQS7fdeEyoJIRf3PfHU+qgx7v9hDXWdRa0sLvRSiOEbIXl
         F5uQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=P8x4WH3J;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g22-20020ac85816000000b003b83b4c4ab6si476701qtg.408.2023.02.15.19.10.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 15 Feb 2023 19:10:21 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=P8x4WH3J;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSUe9-0007P4-Cr; Wed, 15 Feb 2023 22:09:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pSUe2-0007Ks-Sg
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 22:09:14 -0500
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pSUe0-00008p-W4
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 22:09:14 -0500
Received: by mail-pg1-x52a.google.com with SMTP id r18so413267pgr.12
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 19:09:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wXIVB/G8C9wXJG2rRAh3Q1CpNhqpKuo9H1YxYu+YGPs=;
 b=P8x4WH3JzGsfbqjr/W7kq3G31Sj8csnR4r+C8x/HkvsLR59UgRyVo3J2m5GJ7U/hGQ
 RPRvmjMDagEY0sj6rbnT6rUXp6+E+fcSvc2KYfAM1ITug6TzgrPj//1sVN+jY5MtV+SW
 adsMXQtZnATkjLgnwFtJr0a9NCfKMTe1IewhL5+OB+6iwiH9a3EVhTFLrjbhg1M5lFfu
 KDDNDDtTfZ+VxUmHw5hove1UeySsDnvbizRahGmoERbnupO3pUxEn1SgejmnJOGYmWZP
 R6XTtn261YJ9br1aItlJGYp72JVb61r4KuhawDatHpH/qc5RI4JaP4WZ5Zk3II8SVZYs
 Mq9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wXIVB/G8C9wXJG2rRAh3Q1CpNhqpKuo9H1YxYu+YGPs=;
 b=38PBR5N3lhgewU60e9NiHTKnxN4TlJkq9PMYi0kuxhFhLvVpuVrO4Jv645T8ys2DRA
 k02hQgVpJlHnRWA+TneaqSl2qLaGOxkpva0K0iK32ggtQBI4UNp07RFYXLN1w21bsc5D
 9qsuiHvzm7X4QdpguGqDHaT3J2/iObbuSxqRPQqZtZzSdji2LTw2qvfZBUfMiQES4RL1
 uOOeu3vGZu04PSm9id01yv6b5vYZuoJ8NpWycB3jQzB/+kl6KJy9m+ax7GXGvfp0/u3W
 lqJ1IyZyAaw8ThrDeU0s9gQ6DAOnyaY9tBQPT5oFcYJPFmalcrCrzjMWL+tmMoadoHzV
 3niA==
X-Gm-Message-State: AO0yUKURfX+s7+s+045M84a+IjCrul+WeUi6fAGyUZW3u+M0zzaus5vT
 Ew0AFtDcniwBxeaBvkMVFZl1Xx+pdytJ8rOaSCY=
X-Received: by 2002:aa7:9782:0:b0:5a8:aabf:46f4 with SMTP id
 o2-20020aa79782000000b005a8aabf46f4mr4120537pfp.8.1676516951087; 
 Wed, 15 Feb 2023 19:09:11 -0800 (PST)
Received: from stoup.. (rrcs-74-87-59-234.west.biz.rr.com. [74.87.59.234])
 by smtp.gmail.com with ESMTPSA id
 i25-20020aa79099000000b005810a54fdefsm79051pfa.114.2023.02.15.19.09.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Feb 2023 19:09:10 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v1 09/19] target/arm: Load/store integer pair with one tcg
 operation
Date: Wed, 15 Feb 2023 17:08:44 -1000
Message-Id: <20230216030854.1212208-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230216030854.1212208-1-richard.henderson@linaro.org>
References: <20230216030854.1212208-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: phwBmnlHnFV5

This is required for LSE2, where the pair must be treated
atomically if it does not cross a 16-byte boundary.  But
it simplifies the code to do this always, just use the
unpaired atomicity without LSE2.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-a64.c | 77 ++++++++++++++++++++++++++++++--------
 1 file changed, 61 insertions(+), 16 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index fa793485c3..c0d55c9204 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -3089,27 +3089,72 @@ static void disas_ldst_pair(DisasContext *s, uint32_t insn)
     } else {
         TCGv_i64 tcg_rt = cpu_reg(s, rt);
         TCGv_i64 tcg_rt2 = cpu_reg(s, rt2);
+        MemOp mop = (size + 1) | s->be_data;
+
+        /*
+         * With LSE2, non-sign-extending pairs are treated atomically if
+         * aligned, and if unaligned one of the pair will be completely
+         * within a 16-byte block and that element will be atomic.
+         * Otherwise each element is separately atomic.
+         * In all cases, issue one operation with the correct atomicity.
+         *
+         * This treats sign-extending loads like zero-extending loads,
+         * since that reuses the most code below.
+         */
+        mop |= size << MO_ATMAX_SHIFT;
+        mop |= s->atom_data;
+        if (s->align_mem) {
+            mop |= (size == 2 ? MO_ALIGN_4 : MO_ALIGN_8);
+        }
 
         if (is_load) {
-            TCGv_i64 tmp = tcg_temp_new_i64();
+            if (size == 2) {
+                TCGv_i64 tmp = tcg_temp_new_i64();
 
-            /* Do not modify tcg_rt before recognizing any exception
-             * from the second load.
-             */
-            do_gpr_ld(s, tmp, clean_addr, size + is_signed * MO_SIGN,
-                      false, false, 0, false, false);
-            tcg_gen_addi_i64(clean_addr, clean_addr, 1 << size);
-            do_gpr_ld(s, tcg_rt2, clean_addr, size + is_signed * MO_SIGN,
-                      false, false, 0, false, false);
+                tcg_gen_qemu_ld_i64(tmp, clean_addr, get_mem_index(s), mop);
+                if (s->be_data == MO_LE) {
+                    tcg_gen_extr32_i64(tcg_rt, tcg_rt2, tmp);
+                } else {
+                    tcg_gen_extr32_i64(tcg_rt2, tcg_rt, tmp);
+                }
+                if (is_signed) {
+                    tcg_gen_ext32s_i64(tcg_rt, tcg_rt);
+                    tcg_gen_ext32s_i64(tcg_rt2, tcg_rt2);
+                }
+                tcg_temp_free_i64(tmp);
+            } else {
+                TCGv_i128 tmp = tcg_temp_new_i128();
 
-            tcg_gen_mov_i64(tcg_rt, tmp);
-            tcg_temp_free_i64(tmp);
+                tcg_gen_qemu_ld_i128(tmp, clean_addr, get_mem_index(s), mop);
+                if (s->be_data == MO_LE) {
+                    tcg_gen_extr_i128_i64(tcg_rt, tcg_rt2, tmp);
+                } else {
+                    tcg_gen_extr_i128_i64(tcg_rt2, tcg_rt, tmp);
+                }
+                tcg_temp_free_i128(tmp);
+            }
         } else {
-            do_gpr_st(s, tcg_rt, clean_addr, size,
-                      false, 0, false, false);
-            tcg_gen_addi_i64(clean_addr, clean_addr, 1 << size);
-            do_gpr_st(s, tcg_rt2, clean_addr, size,
-                      false, 0, false, false);
+            if (size == 2) {
+                TCGv_i64 tmp = tcg_temp_new_i64();
+
+                if (s->be_data == MO_LE) {
+                    tcg_gen_concat32_i64(tmp, tcg_rt, tcg_rt2);
+                } else {
+                    tcg_gen_concat32_i64(tmp, tcg_rt2, tcg_rt);
+                }
+                tcg_gen_qemu_st_i64(tmp, clean_addr, get_mem_index(s), mop);
+                tcg_temp_free_i64(tmp);
+            } else {
+                TCGv_i128 tmp = tcg_temp_new_i128();
+
+                if (s->be_data == MO_LE) {
+                    tcg_gen_concat_i64_i128(tmp, tcg_rt, tcg_rt2);
+                } else {
+                    tcg_gen_concat_i64_i128(tmp, tcg_rt2, tcg_rt);
+                }
+                tcg_gen_qemu_st_i128(tmp, clean_addr, get_mem_index(s), mop);
+                tcg_temp_free_i128(tmp);
+            }
         }
     }
 
-- 
2.34.1

