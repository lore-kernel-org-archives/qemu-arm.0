Received: by 2002:a17:907:76b5:b0:9a1:fa4e:495e with SMTP id jw21csp890015ejc;
        Fri, 1 Sep 2023 13:31:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHAL8dBzOX1EnESmEfsG7ol3cdLAr60LbLyqJFKjTsXhTipWpWcZOGBD6FsHFqH/d4XfIgY
X-Received: by 2002:a0c:aada:0:b0:63c:c3f0:82e6 with SMTP id g26-20020a0caada000000b0063cc3f082e6mr3847898qvb.60.1693600289036;
        Fri, 01 Sep 2023 13:31:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1693600289; cv=none;
        d=google.com; s=arc-20160816;
        b=GelYKb37PENdVd0H4D2cQyTKpLud9AzG0z5IhIodtRyuFl24DNYN7hioUD01oA+klE
         SpY55l55/+9Oh/I8wWCB6Ud4HcnFF6LpKKPj/qZZgExbwaQpwkw+yJOc4x2Ls4zQgiDR
         /QrBYSmqS674TbD2ARKpK7ZEiP0tg5rElUds5nWl0BDbVSb03FcerslT312yiF0XDbyl
         5FnpIxYxtwzyDNZi0jnwuC9LcSyHwMvXR46QP5G8yye84OUt4Fsq4i0WU3pooThb5ZJ1
         TT9FqGgLMtIFHWhtGjU7ApZFMvWTpBWoDKzKo/FZkzhdHtRGGl5locVrOPvZif1KKYzI
         tTeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=VN6l2cROyOIJzFYTqk3mQSzHqtpIGQeP6fwa2uvMk5I=;
        fh=9Ev+QBUhk6P6vR3LT1wYeDLexozsz44nqjfoyPajZCc=;
        b=w2C/eX3LlzdI1TEGwxevZzhLfAXMHrlCH/GgPI9pqJa0Z5qgyph9rjRLDYN0e2VsxJ
         QwceVhrmuuho8dHPcfgHCSXrl0Lci4uT9e4QcPV2GP7zixvTtj47TBRZ5XPLwGNz01lh
         Q4MacAQ79kQpVYXRUpoOcxoa/QW+p2w1XD8MyHIjANs8MdPoy2gpzh+Tyk5trBhnBzHR
         PcJQiRI5i/2SZ+Fc+L9Xef6++uMrboAD2h1KlUbg4sAAXHzEbnDzG2O85cJxdBGCq+e4
         FzLs6mD1m84mfxvm794jtsmMTJUV0bFz47kmvA5zNEyeP8KLCZEngheMluREX6s5MtnX
         lgsA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mlkChalY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w12-20020a0c8e4c000000b006490c267f9fsi2864183qvb.528.2023.09.01.13.31.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 01 Sep 2023 13:31:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mlkChalY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qcAnO-00086q-8Q; Fri, 01 Sep 2023 16:31:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qcAnN-00086c-Gs
 for qemu-arm@nongnu.org; Fri, 01 Sep 2023 16:31:09 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qcAnK-0005Pc-U5
 for qemu-arm@nongnu.org; Fri, 01 Sep 2023 16:31:09 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 98e67ed59e1d1-2685bcd046eso1664339a91.3
 for <qemu-arm@nongnu.org>; Fri, 01 Sep 2023 13:31:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693600265; x=1694205065; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=VN6l2cROyOIJzFYTqk3mQSzHqtpIGQeP6fwa2uvMk5I=;
 b=mlkChalYArBHuLVyfUFLhw5KKbAHJ5U58eCXE/J2sbxFSKqJhP7HhlS3nwbk0tDk3a
 T4ggddBQRA+xuTi2z6mmBpU/ZnX/DVVccrjRqfYb17X89xUvN0Q6MuJW5V6obvaQRd09
 IkoZeIYkx3ygKr7uRlXpgk+SxIn0KzkOtxaH4ASB0QObp1FML+ER6ZcpP8ldMLC7AzFY
 ebiLwTsEHm74/fXQpryImO7wUKBFHhxugmYBZf3F++kevkLjkrx1Gc0vXqLoL1Mjt2op
 qZoN4WQVpnh7V4ebdulZ9OortXWalrMOkMe8UBWIkpIHgZVfytnH/RZe/18hP8UFTWeY
 O8pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693600265; x=1694205065;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=VN6l2cROyOIJzFYTqk3mQSzHqtpIGQeP6fwa2uvMk5I=;
 b=hTN8vXfcA8asvwmnPHXl3Y+liomJJ2/hyQov0XGEzunZ0acOgqedhF0b/sMLvk8XTV
 mjwc7h4fpR90w2YCr7lubjfeU28t6cmOZJtSx0EtKclz+yjtx3CAKIM9dOhSE+JBL4sA
 WeNW8a3jgzrkk6T1MOodvg3JsGKuHIOe7uKfr/rgH+2gsvTxy4Ma6HjR1AYCgq06TdJ6
 UL3XhmPPkKOEyJvvOqw/rVcgSjjAIWxU1/8HlsnlJ7S3HaIJUyhdbjVlFrdwgLU7UG+S
 I8tzBjb9/cnsUnnrfQDZH8hl3UPyv3DxXRDCMbWUvpZqdgumiufbxkpyh4FLUylaDN0T
 CFOw==
X-Gm-Message-State: AOJu0Yw9uYXMmgleUnDvX+TjqtoGufDeA85bQ1GhKABKLqGjm9X+NHsY
 zTpCc3KKgY20X4Yqlc8JHvveJHesE7guIZht2uA=
X-Received: by 2002:a17:90b:150:b0:269:7eea:d7f6 with SMTP id
 em16-20020a17090b015000b002697eead7f6mr2917655pjb.49.1693600264674; 
 Fri, 01 Sep 2023 13:31:04 -0700 (PDT)
Received: from stoup.. ([71.212.131.115]) by smtp.gmail.com with ESMTPSA id
 14-20020a17090a190e00b00262ca945cecsm5360373pjg.54.2023.09.01.13.31.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Sep 2023 13:31:04 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v2] target/arm: Do not use gen_mte_checkN in trans_STGP
Date: Fri,  1 Sep 2023 13:31:03 -0700
Message-Id: <20230901203103.136408-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: WZzMcE7+iMsZ

STGP writes to tag memory, it does not check it.
This happened to work because we wrote tag memory first
so that the check always succeeded.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate-a64.c | 41 +++++++++++++---------------------
 1 file changed, 15 insertions(+), 26 deletions(-)

diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 0b77c92437..c5de176b8b 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -3020,37 +3020,17 @@ static bool trans_STGP(DisasContext *s, arg_ldstpair *a)
         tcg_gen_addi_i64(dirty_addr, dirty_addr, offset);
     }
 
-    if (!s->ata) {
-        /*
-         * TODO: We could rely on the stores below, at least for
-         * system mode, if we arrange to add MO_ALIGN_16.
-         */
-        gen_helper_stg_stub(cpu_env, dirty_addr);
-    } else if (tb_cflags(s->base.tb) & CF_PARALLEL) {
-        gen_helper_stg_parallel(cpu_env, dirty_addr, dirty_addr);
-    } else {
-        gen_helper_stg(cpu_env, dirty_addr, dirty_addr);
-    }
-
-    mop = finalize_memop(s, MO_64);
-    clean_addr = gen_mte_checkN(s, dirty_addr, true, false, 2 << MO_64, mop);
-
+    clean_addr = clean_data_tbi(s, dirty_addr);
     tcg_rt = cpu_reg(s, a->rt);
     tcg_rt2 = cpu_reg(s, a->rt2);
 
     /*
-     * STGP is defined as two 8-byte memory operations and one tag operation.
-     * We implement it as one single 16-byte memory operation for convenience.
-     * Rebuild mop as for STP.
-     * TODO: The atomicity with LSE2 is stronger than required.
-     * Need a form of MO_ATOM_WITHIN16_PAIR that never requires
-     * 16-byte atomicity.
+     * STGP is defined as two 8-byte memory operations, aligned to TAG_GRANULE,
+     * and one tag operation.  We implement it as one single aligned 16-byte
+     * memory operation for convenience.  Note that the alignment ensures
+     * MO_ATOM_IFALIGN_PAIR produces 8-byte atomicity for the memory store.
      */
-    mop = MO_128;
-    if (s->align_mem) {
-        mop |= MO_ALIGN_8;
-    }
-    mop = finalize_memop_pair(s, mop);
+    mop = finalize_memop_atom(s, MO_128 | MO_ALIGN, MO_ATOM_IFALIGN_PAIR);
 
     tmp = tcg_temp_new_i128();
     if (s->be_data == MO_LE) {
@@ -3060,6 +3040,15 @@ static bool trans_STGP(DisasContext *s, arg_ldstpair *a)
     }
     tcg_gen_qemu_st_i128(tmp, clean_addr, get_mem_index(s), mop);
 
+    /* Perform the tag store, if tag access enabled. */
+    if (s->ata) {
+        if (tb_cflags(s->base.tb) & CF_PARALLEL) {
+            gen_helper_stg_parallel(cpu_env, dirty_addr, dirty_addr);
+        } else {
+            gen_helper_stg(cpu_env, dirty_addr, dirty_addr);
+        }
+    }
+
     op_addr_ldstpair_post(s, a, dirty_addr, offset);
     return true;
 }
-- 
2.34.1

