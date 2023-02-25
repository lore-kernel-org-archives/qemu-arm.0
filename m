Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp2635127ejc;
        Sat, 25 Feb 2023 01:17:01 -0800 (PST)
X-Google-Smtp-Source: AK7set8KryHV4wriND2jqe9yPi8nSDMBqiN10x0flf3zmfQdseqcDkKVZlVOwcws/aCXZWvShXUZ
X-Received: by 2002:ac8:5a13:0:b0:3bd:1bbc:8d8e with SMTP id n19-20020ac85a13000000b003bd1bbc8d8emr21254665qta.0.1677316621218;
        Sat, 25 Feb 2023 01:17:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677316621; cv=none;
        d=google.com; s=arc-20160816;
        b=z+9vwJJRPFLYxA945iO9LZ+qCVwc5d3JA63ZD2/3Q7maPfpVZBZpCKwFCGE4xgquvI
         VQbB1BU7B7n5ATmr8ercZX+RNu3KhZh2SIyE6qystXVqJS0HQtANWT2QokDdClF9NqEq
         6XcPwJSBUnf0E3gMH7C3XwaS5cPz2HSL4Rt4VAf6vQ39jTYNFYnTKplyCH8G/igoW9Vp
         ij8FTkavrutpTqgm2qiMOypxEEFd0YLI7DpgSGj/D8WKXjm4SpVurc2tCtMaqVFqL4MT
         cpgOSJ0VinUDZOJJef9AyKoOCM558u4b3yLT9Erl3WbeS4Tj8U2/ol1hRL+JGpYIVbmY
         NgaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=hocy2mGz2CCTt4Bq9qJMXd0ON/jxXgLLJ1IYsbDvM70=;
        b=MhQ/vjbk57o+Kj8MckMfmIK0UPUXHRXsQJ+UWvI73n3Cmr9iOKNv4pmmbZKMfWIq8Q
         xhMJk/YlARrle6e4+/s7kv01YJ3wS5HTeerz8uvxeJQl4wZT0pMGqXc3WhLO+T3x2bJD
         DKF0UCkCJm0rQicJcqX78sVXgjk1eto4U/xZQN8R8e8cdvw6oEt0YplRenczKJbSquzk
         J1LNAAUob1NvGf9LYcq/CxE5hd760DraVRpyAmN3o166L11PxdD96VwZdc7OqN2xONcE
         bt3+G3LznUJPMV2IcXeAqqnzBRCxeSs7vxUzANLSoD+hGcj5RnH0qq/9nkDMnbO68+aU
         sI0A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qev02yUY;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w10-20020a05622a190a00b003b1089eccc7si1629496qtc.582.2023.02.25.01.17.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 25 Feb 2023 01:17:01 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qev02yUY;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVqdt-0004kL-1I; Sat, 25 Feb 2023 04:14:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVqdr-0004j4-CY
 for qemu-devel@nongnu.org; Sat, 25 Feb 2023 04:14:55 -0500
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVqdn-0001Ph-AJ
 for qemu-devel@nongnu.org; Sat, 25 Feb 2023 04:14:55 -0500
Received: by mail-pl1-x629.google.com with SMTP id p20so658950plw.13
 for <qemu-devel@nongnu.org>; Sat, 25 Feb 2023 01:14:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hocy2mGz2CCTt4Bq9qJMXd0ON/jxXgLLJ1IYsbDvM70=;
 b=qev02yUY8iYooZf7Ra1A/KkFLVbz3N+FKHwPZT6qaGLSms34u9xZszwe2WCjpmzTS8
 7L+YkVWfNl3iM8jWzsNmmhIs1Q9vaPojWd6JUbIj1W4MXTqaDdBT2qbMF2tuGVd1ZHSl
 AJzepaphkUo75S2b6D3T1YNNpCQ1qOB4k41/0fBlCUo1qrSxdAyI/juI+QQoASR8pBwn
 Yjsz+jYpPBnVhysOh/mtOEZkSLazH/DMOS0XlchsOMbez6u//BQcXj0+54uMXTaabPAA
 IiJMZVNYc6KBNdv8PtbgKQO1dQaGK4OkZyO37iVZtwoQE0NC3oE8pci3DlBKEGzkK6e6
 JMkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hocy2mGz2CCTt4Bq9qJMXd0ON/jxXgLLJ1IYsbDvM70=;
 b=NksyUJjDr2jiQiEn+M1p6mb1t1mJ3N7TktO0qxIAcFxsqMp6029Fv/gYp4Fmn9DsKM
 JlUCaLF3PjurP/JyFCZOaQL6xD02qmcdOj8nsKELdnuEvdqffVU/JZqpHvx4cFOM+eI+
 6/gFUHw2xulvsfn5a0LHKP80rPEGbILB5RhgbV/xYPKEMMgUGmZtvyW9Cw8GC1MpF51Z
 iw5Pisk5X003eL2AqTjJhPmsY1L9ih9v9asqAxFmFvrqls32MA2NzLRRrEB6R8vqA6Jg
 UijsvqCzm0illyHxR5fs9tFt+qJCY0cle4Eg/LOneD3VE0sEf+5Lhnu5yYxD7uK0ex+M
 x7dw==
X-Gm-Message-State: AO0yUKVrOpdeZqx+8nKkKb9xGOl3mVmD6mS2bN5kcsj7wkuUK5RxLboW
 xRzal+e+SW6PvvvQ5RwMD++FST0Pk7S2VxM2kzc=
X-Received: by 2002:a17:902:f68c:b0:199:2ee:622d with SMTP id
 l12-20020a170902f68c00b0019902ee622dmr23300006plg.3.1677316490499; 
 Sat, 25 Feb 2023 01:14:50 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 je12-20020a170903264c00b0019607aeda8bsm831101plb.73.2023.02.25.01.14.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Feb 2023 01:14:50 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com
Subject: [PATCH 07/76] target/arm: Drop DisasContext.tmp_a64
Date: Fri, 24 Feb 2023 23:13:18 -1000
Message-Id: <20230225091427.1817156-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230225091427.1817156-1-richard.henderson@linaro.org>
References: <20230225091427.1817156-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
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
X-TUID: F3JRcpVujz7A

Translators are no longer required to free tcg temporaries,
therefore there's no need to record temps for later freeing.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.h     |  3 ---
 target/arm/translate-a64.c | 25 +------------------------
 2 files changed, 1 insertion(+), 27 deletions(-)

diff --git a/target/arm/translate.h b/target/arm/translate.h
index db29e8d799..d7fdbc1e3e 100644
--- a/target/arm/translate.h
+++ b/target/arm/translate.h
@@ -149,9 +149,6 @@ typedef struct DisasContext {
     int c15_cpar;
     /* TCG op of the current insn_start.  */
     TCGOp *insn_start;
-#define TMP_A64_MAX 16
-    int tmp_a64_count;
-    TCGv_i64 tmp_a64[TMP_A64_MAX];
 } DisasContext;
 
 typedef struct DisasCompare {
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 2a0bba3815..98d1bee5d5 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -408,27 +408,9 @@ static void gen_goto_tb(DisasContext *s, int n, int64_t diff)
     }
 }
 
-static void init_tmp_a64_array(DisasContext *s)
-{
-#ifdef CONFIG_DEBUG_TCG
-    memset(s->tmp_a64, 0, sizeof(s->tmp_a64));
-#endif
-    s->tmp_a64_count = 0;
-}
-
-static void free_tmp_a64(DisasContext *s)
-{
-    int i;
-    for (i = 0; i < s->tmp_a64_count; i++) {
-        tcg_temp_free_i64(s->tmp_a64[i]);
-    }
-    init_tmp_a64_array(s);
-}
-
 TCGv_i64 new_tmp_a64(DisasContext *s)
 {
-    assert(s->tmp_a64_count < TMP_A64_MAX);
-    return s->tmp_a64[s->tmp_a64_count++] = tcg_temp_new_i64();
+    return tcg_temp_new_i64();
 }
 
 TCGv_i64 new_tmp_a64_zero(DisasContext *s)
@@ -14781,8 +14763,6 @@ static void aarch64_tr_init_disas_context(DisasContextBase *dcbase,
         bound = 1;
     }
     dc->base.max_insns = MIN(dc->base.max_insns, bound);
-
-    init_tmp_a64_array(dc);
 }
 
 static void aarch64_tr_tb_start(DisasContextBase *db, CPUState *cpu)
@@ -14938,9 +14918,6 @@ static void aarch64_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
         break;
     }
 
-    /* if we allocated any temporaries, free them here */
-    free_tmp_a64(s);
-
     /*
      * After execution of most insns, btype is reset to 0.
      * Note that we set btype == -1 when the insn sets btype.
-- 
2.34.1

