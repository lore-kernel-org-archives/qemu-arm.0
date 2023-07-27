Received: by 2002:a17:906:2484:b0:98d:b2f5:1316 with SMTP id e4csp1416580ejb;
        Thu, 27 Jul 2023 09:33:23 -0700 (PDT)
X-Google-Smtp-Source: APBJJlH+1eh9Zn6YtDSF7afidcwSMPLgh5IRu3n1G187cikVBU+uKfbBqFQDbI4e2VpEcM7FTBIg
X-Received: by 2002:a05:620a:2211:b0:767:26d:1142 with SMTP id m17-20020a05620a221100b00767026d1142mr440158qkh.21.1690475603725;
        Thu, 27 Jul 2023 09:33:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1690475603; cv=none;
        d=google.com; s=arc-20160816;
        b=DgBt+KQ1UgcIsSJi4XcYUmTnMjp56JVr9MtjYUwi0Abe8Pn9snISM7Xp+CSU2Za57k
         /8Zs9QettlKez/BYGElLXDRCh+r2z+RITu7YZGojC3dTh4T3cj2lpMKg4zWHtn4TC4Dz
         q4Ppoq/b9PUEgoW8kM4lZWyAAGh5bRY6DJcONwqBCCllXPlUbxkIllBuMe+iFo1+wnOo
         N5Ug1sFPQZmnAFPf9o+KXz1ff7V3fGgGKokTnrxZAQsk32PgI9ozYDQw7o/JwiGFySbe
         OrBrU5oI8NwEtAiIwIT6OoEqFZTr6Zp/W4WnjO3yLDn/WE418e6tAGknfqWMkzYLKuql
         Q8MA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=3G2qvF807dtcBmq3t7VF0034ERKCeVyIfRSjPFahYwM=;
        fh=oweadga+1U1BKjDqlK8hSmEWEC1EUfcsKuPkDinEDsU=;
        b=gd8UAhXZ9e1DrQP1eFbhB5iffGIHanytU68NjMTri86++gAY7noMdM7ftVGI7taP6u
         cTxIlL0IBN+zYz3FuC1rVQMQ2+vhskrJHCa4dnGKgE39e2qXWbfqeqdU8XfHgf7e5N3M
         d8Cwocj5LGc7uqCYXOePArP0ux65iKNljlR5iFRa57wZSKsJjPZS+YFZhL2TWkJYIN1x
         lvvPG558mzne4N+pg4aC3vWmXpdPfV4fGGU7ZVH3WvoavRfWDIpX2HZGWwrSMfJFTZhl
         RnQnOV9GA4PpcHHWB3PEtqeGdFIfy/ZaN5DeGGAAOz5HMddhE6ayIzmKG383GidG4WJO
         aaSg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="sMG0w/xn";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h25-20020a05620a21d900b00767dd2b2020si920746qka.163.2023.07.27.09.33.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 27 Jul 2023 09:33:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="sMG0w/xn";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qP3ov-000426-GE; Thu, 27 Jul 2023 12:26:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qP3op-0003vF-7r
 for qemu-arm@nongnu.org; Thu, 27 Jul 2023 12:26:27 -0400
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qP3on-0000fW-8f
 for qemu-arm@nongnu.org; Thu, 27 Jul 2023 12:26:26 -0400
Received: by mail-pf1-x434.google.com with SMTP id
 d2e1a72fcca58-686f090316dso769753b3a.2
 for <qemu-arm@nongnu.org>; Thu, 27 Jul 2023 09:26:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690475183; x=1691079983;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=3G2qvF807dtcBmq3t7VF0034ERKCeVyIfRSjPFahYwM=;
 b=sMG0w/xn9GQ2iZUQ2aEEE/C0ljYIaczAdwqPdn9zwWYC7TFXk5oe2IO3KGvM8AvLHV
 Sh0bTB3tZqW9mFiacCBJeMV0fGtwCT8rGbEO3AXgtzJyHWyX6FlUStZWkOghbdPbLeBH
 2P4ZAZYkdfaxnP6UKnTN2Z2KoD7Kc3A2D1Qj6wVsJZtdRQj6VmV3K29yb2YMAsIak6Q4
 9BDK0UUZwJjLUUmVk9l0fN8qnmAW1UVZGKLvA0utfxIeH+g34zQalQ0bE5Uy1LoLNC4E
 ZBqZe6lOUaYNVIp/Vwu5mxlbWbCGPrQ3HkbAO7ZNjORFZMqJFBhObl9YBgglb3jpxSE5
 VMww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690475183; x=1691079983;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3G2qvF807dtcBmq3t7VF0034ERKCeVyIfRSjPFahYwM=;
 b=Bj/usUhA83qvEtKAGOyNp7TQdojeZczYL+NS+DrglyYx5OCortUaNVEedVUOnjrWQT
 8UznRGX2pj5rG4ioEVjdQAWDjIyhNUrQPTN0ak+On6vmy3ULzkSpJqbX/5lKLvm4IHwC
 W1mPmL6Yds/ccSrPUFFWxcUXthlI9crM6tspvywZ167Xey9McOZtcFmiqUqY8kmukfG/
 NYQ8arbilxgjyGdzYjWIOb/r2XZErTfL+Fp69DNNXxbe/A9ejuMPyuAwe1EUcLe533UK
 buyivGMyp+qAcu1i4W2KNj5c9kIO8Zd3i449rGSw4PbVfjCudJP3g36yWeHsle2kyh+9
 /Zsg==
X-Gm-Message-State: ABy/qLYdjwLRLapNa8C2rgROQ8M4KvAzILkaS8Ib7/BFSBJhTS48qJUy
 Or2cC7yA/g01DnchJnfQR6R3OAqBLLxEw/aKvHE=
X-Received: by 2002:a05:6a00:1a94:b0:682:2e99:9de0 with SMTP id
 e20-20020a056a001a9400b006822e999de0mr5566719pfv.23.1690475182516; 
 Thu, 27 Jul 2023 09:26:22 -0700 (PDT)
Received: from stoup.. ([2602:ae:154e:c001:caf5:5ae2:432a:1bdf])
 by smtp.gmail.com with ESMTPSA id
 p13-20020aa7860d000000b00682c1db7551sm1687786pfn.49.2023.07.27.09.26.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jul 2023 09:26:22 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH] target/arm: Do not use gen_mte_checkN in trans_STGP
Date: Thu, 27 Jul 2023 09:26:21 -0700
Message-Id: <20230727162621.445400-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: DeNc0S5JfhyL

STGP writes to tag memory, it does not check it.
This happened to work because we wrote tag memory first
so that the check always succeeded.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate-a64.c | 41 +++++++++++++---------------------
 1 file changed, 15 insertions(+), 26 deletions(-)

diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 5fa1257d32..dfd18e19ca 100644
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
+    mop = MO_128 | MO_ALIGN | MO_ATOM_IFALIGN_PAIR;
 
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

