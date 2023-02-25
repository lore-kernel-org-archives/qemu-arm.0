Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp2639615ejc;
        Sat, 25 Feb 2023 01:24:08 -0800 (PST)
X-Google-Smtp-Source: AK7set8FYy6HOalLHow+0QEnF5WVD6k07zzV1xXGzWqgBluxAfZYbAdrR93tqEdhtxsYY5SZh350
X-Received: by 2002:a05:6214:27c2:b0:573:de:fe16 with SMTP id ge2-20020a05621427c200b0057300defe16mr6229181qvb.43.1677317048568;
        Sat, 25 Feb 2023 01:24:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677317048; cv=none;
        d=google.com; s=arc-20160816;
        b=wbygMoa88z9h39hYTBR28MOxBZ6tWXmqBZtGdm//DAc0aJFeOEoN9M6FeDzd0PiIvj
         ZNeoApI3a4hbG1e2EBD/Db1c6liGH7vPL1oYr3spZxp1Bwsvga6cIcjyLHU6AnsTd4sd
         0Un+OfWF2ldzLa4jNlhrXxwojqZxsYKmMQDLnJ6locm+oaaxQ35/SMOAsYvMMdEdL54G
         y4cpq075/UEYt3uZUCqh+SOeY4tvNMR1LklUkisuQC77uxie8QVwLFX6RZDJURtD15pu
         qDKPJLbmfp3uV7RlkcVuk6rtAwLjJM68Z4sis7Lzga43i68OxUoukvW9L4XZMcc0F8LB
         MiNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=4kqBfUrEC0hgJZyLTR3qpiXaj+lmTNXQFttN4oATONw=;
        b=btqEMtEH+rSaWablTNgMBYwj9fsnDH+SuNpfhWsXtXLQCG//JqBJ5wkl1loVCVSp5l
         KmR54v1Alt7q1QlUG9oKBx7KjwFeHHRAnSS9XmtVcuBtTY2a4SuknU+UOKiXZ41gqm2Y
         hW5h7rwR0mNtQu6tl7qqDhUPCfLyL1I0/xHUKSRNOWoFijP/v9QUbpC6xEGrc5wQsEIn
         7kSSUfCZsc4ywQ9r7o61pQ9DIujCDU5ngemjeCcQJOZXoKJLCMlmrjvkU9B1KYtIMwk1
         wo0agWqPlufIunkiD9B76IyU/LL5UO9AgCur4tpYoJgWG/+Dc/ThgycIpJF3EM1AtjBN
         /BJQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZSVYRsNU;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i1-20020a0cf101000000b005721e43ba4bsi1499437qvl.489.2023.02.25.01.24.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 25 Feb 2023 01:24:08 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZSVYRsNU;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVqiA-0003c0-Ue; Sat, 25 Feb 2023 04:19:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVqi7-0003Sr-Uq
 for qemu-devel@nongnu.org; Sat, 25 Feb 2023 04:19:19 -0500
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVqi6-0002qP-5s
 for qemu-devel@nongnu.org; Sat, 25 Feb 2023 04:19:19 -0500
Received: by mail-pf1-x42e.google.com with SMTP id cp12so95106pfb.5
 for <qemu-devel@nongnu.org>; Sat, 25 Feb 2023 01:19:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4kqBfUrEC0hgJZyLTR3qpiXaj+lmTNXQFttN4oATONw=;
 b=ZSVYRsNUIDn7g03b6Zmm1s/svttekCWdxfp5MuYbWaDLHPM9PVT6hYKMrdul/jjiZV
 r3bUznD7xu+HbKsQ7XdZHa4KbyZG2fwaFCAn01XN4fV5gJ2VhxW4qEfLEC4Jc06jRYA2
 43GvG1Y9p65h6AXsadwD+ife+dIAcp0NJZpKgHWHxns5QMeEnO8+EEPYzQA9XdctKvTR
 oCbW6qSckRFVFzYKH7zk0uUK6AL7Jv1wOAn6B2BAvnZisU5SqBFJa1d2Wf4up2sgKr/L
 5O46ftHkLLTQ7dBRKXJorlNgvxDC9D7+mbe1WN7MSL+PlgvRAj55GybynFT/AzoPV3SI
 aunw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4kqBfUrEC0hgJZyLTR3qpiXaj+lmTNXQFttN4oATONw=;
 b=YgeACTjwcQtuRSJaVMvUWyFy4OHAx5mNfTjE4A3GMMlCxg66g64K/rugsG5h2SXonG
 NeQxjD4g0K5d+5MY8Mybzi32udR6qJRdxY4Mz1I/b9pUtZhsef4r8CvGl3399ZkidT07
 gU/pmzBPSRWw2h9z4u+7qh/ijpOcA5RN0pamGnHDgIqOFuVSMz8jZaTv9PFJAFo5Oe+6
 kI4dDZO2WcRsIhy6v8OVEhIckpu+1MotFUaNaPEEti4Bq7LJ+pvU3MjI/9EZUVfUEd8X
 2uC4pW796V257xbnVpF/kfGKYfwkBnMH95PqDAfJqAro/gWxrRtdl2uB46u51YVpANuy
 Fd6g==
X-Gm-Message-State: AO0yUKVOLdSEaoZF1+Fu1E5yd2sHZXZGTXxEJXd0XTGvn5yJy/y2Ozk8
 eJVuXKDVbmQDOhwyj00OX47czf8UKyNZVWF3/TI=
X-Received: by 2002:a62:17ce:0:b0:5a8:abd2:2beb with SMTP id
 197-20020a6217ce000000b005a8abd22bebmr15717442pfx.30.1677316756752; 
 Sat, 25 Feb 2023 01:19:16 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 26-20020aa7921a000000b00592417157f2sm843114pfo.148.2023.02.25.01.19.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Feb 2023 01:19:16 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com
Subject: [PATCH 40/76] target/mips: Drop tcg_temp_free from mxu_translate.c
Date: Fri, 24 Feb 2023 23:13:51 -1000
Message-Id: <20230225091427.1817156-41-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230225091427.1817156-1-richard.henderson@linaro.org>
References: <20230225091427.1817156-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42e.google.com
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
X-TUID: ylLWgUh5XGht

Translators are no longer required to free tcg temporaries.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/mips/tcg/mxu_translate.c | 51 ---------------------------------
 1 file changed, 51 deletions(-)

diff --git a/target/mips/tcg/mxu_translate.c b/target/mips/tcg/mxu_translate.c
index f52244e1b2..8703b0cef4 100644
--- a/target/mips/tcg/mxu_translate.c
+++ b/target/mips/tcg/mxu_translate.c
@@ -513,8 +513,6 @@ static void gen_mxu_s32i2m(DisasContext *ctx)
     } else if (XRa == 16) {
         gen_store_mxu_cr(t0);
     }
-
-    tcg_temp_free(t0);
 }
 
 /*
@@ -537,8 +535,6 @@ static void gen_mxu_s32m2i(DisasContext *ctx)
     }
 
     gen_store_gpr(t0, Rb);
-
-    tcg_temp_free(t0);
 }
 
 /*
@@ -613,9 +609,6 @@ static void gen_mxu_s8ldd(DisasContext *ctx)
     }
 
     gen_store_mxu_gpr(t0, XRa);
-
-    tcg_temp_free(t0);
-    tcg_temp_free(t1);
 }
 
 /*
@@ -664,11 +657,6 @@ static void gen_mxu_d16mul(DisasContext *ctx)
     }
     gen_store_mxu_gpr(t3, XRa);
     gen_store_mxu_gpr(t2, XRd);
-
-    tcg_temp_free(t0);
-    tcg_temp_free(t1);
-    tcg_temp_free(t2);
-    tcg_temp_free(t3);
 }
 
 /*
@@ -741,11 +729,6 @@ static void gen_mxu_d16mac(DisasContext *ctx)
     }
     gen_store_mxu_gpr(t3, XRa);
     gen_store_mxu_gpr(t2, XRd);
-
-    tcg_temp_free(t0);
-    tcg_temp_free(t1);
-    tcg_temp_free(t2);
-    tcg_temp_free(t3);
 }
 
 /*
@@ -821,15 +804,6 @@ static void gen_mxu_q8mul_q8mulsu(DisasContext *ctx)
 
     gen_store_mxu_gpr(t0, XRd);
     gen_store_mxu_gpr(t1, XRa);
-
-    tcg_temp_free(t0);
-    tcg_temp_free(t1);
-    tcg_temp_free(t2);
-    tcg_temp_free(t3);
-    tcg_temp_free(t4);
-    tcg_temp_free(t5);
-    tcg_temp_free(t6);
-    tcg_temp_free(t7);
 }
 
 /*
@@ -860,9 +834,6 @@ static void gen_mxu_s32ldd_s32lddr(DisasContext *ctx)
     tcg_gen_qemu_ld_tl(t1, t1, ctx->mem_idx, MO_TESL ^ (sel * MO_BSWAP));
 
     gen_store_mxu_gpr(t1, XRa);
-
-    tcg_temp_free(t0);
-    tcg_temp_free(t1);
 }
 
 
@@ -1125,9 +1096,6 @@ static void gen_mxu_D16MAX_D16MIN(DisasContext *ctx)
         tcg_gen_shri_i32(t0, t0, 16);
         /* finally update the destination */
         tcg_gen_or_i32(mxu_gpr[XRa - 1], mxu_gpr[XRa - 1], t0);
-
-        tcg_temp_free(t1);
-        tcg_temp_free(t0);
     } else if (unlikely(XRb == XRc)) {
         /* both operands same -> just set destination to one of them */
         tcg_gen_mov_i32(mxu_gpr[XRa - 1], mxu_gpr[XRb - 1]);
@@ -1161,9 +1129,6 @@ static void gen_mxu_D16MAX_D16MIN(DisasContext *ctx)
         tcg_gen_shri_i32(t0, t0, 16);
         /* finally update the destination */
         tcg_gen_or_i32(mxu_gpr[XRa - 1], mxu_gpr[XRa - 1], t0);
-
-        tcg_temp_free(t1);
-        tcg_temp_free(t0);
     }
 }
 
@@ -1226,9 +1191,6 @@ static void gen_mxu_Q8MAX_Q8MIN(DisasContext *ctx)
             /* finally update the destination */
             tcg_gen_or_i32(mxu_gpr[XRa - 1], mxu_gpr[XRa - 1], t0);
         }
-
-        tcg_temp_free(t1);
-        tcg_temp_free(t0);
     } else if (unlikely(XRb == XRc)) {
         /* both operands same -> just set destination to one of them */
         tcg_gen_mov_i32(mxu_gpr[XRa - 1], mxu_gpr[XRb - 1]);
@@ -1266,9 +1228,6 @@ static void gen_mxu_Q8MAX_Q8MIN(DisasContext *ctx)
             /* finally update the destination */
             tcg_gen_or_i32(mxu_gpr[XRa - 1], mxu_gpr[XRa - 1], t0);
         }
-
-        tcg_temp_free(t1);
-        tcg_temp_free(t0);
     }
 }
 
@@ -1384,9 +1343,6 @@ static void gen_mxu_S32ALNI(DisasContext *ctx)
                 tcg_gen_shri_i32(t1, t1, 24);
 
                 tcg_gen_or_i32(mxu_gpr[XRa - 1], t0, t1);
-
-                tcg_temp_free(t1);
-                tcg_temp_free(t0);
             }
             break;
         case MXU_OPTN3_PTN2:
@@ -1410,9 +1366,6 @@ static void gen_mxu_S32ALNI(DisasContext *ctx)
                 tcg_gen_shri_i32(t1, t1, 16);
 
                 tcg_gen_or_i32(mxu_gpr[XRa - 1], t0, t1);
-
-                tcg_temp_free(t1);
-                tcg_temp_free(t0);
             }
             break;
         case MXU_OPTN3_PTN3:
@@ -1436,9 +1389,6 @@ static void gen_mxu_S32ALNI(DisasContext *ctx)
                 tcg_gen_shri_i32(t1, t1, 8);
 
                 tcg_gen_or_i32(mxu_gpr[XRa - 1], t0, t1);
-
-                tcg_temp_free(t1);
-                tcg_temp_free(t0);
             }
             break;
         case MXU_OPTN3_PTN4:
@@ -1598,7 +1548,6 @@ bool decode_ase_mxu(DisasContext *ctx, uint32_t insn)
         }
 
         gen_set_label(l_exit);
-        tcg_temp_free(t_mxu_cr);
     }
 
     return true;
-- 
2.34.1

