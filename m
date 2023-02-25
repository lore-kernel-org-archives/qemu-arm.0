Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp2642393ejc;
        Sat, 25 Feb 2023 01:28:48 -0800 (PST)
X-Google-Smtp-Source: AK7set+4Q1cJ33VS9wGK7+erbc0itj5HLgg2jRZ0K2XbBzy15PDb9WB/kET/gGMaLbyCatATh0fA
X-Received: by 2002:a05:6214:260e:b0:56e:b1d2:9c33 with SMTP id gu14-20020a056214260e00b0056eb1d29c33mr33131043qvb.20.1677317328616;
        Sat, 25 Feb 2023 01:28:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677317328; cv=none;
        d=google.com; s=arc-20160816;
        b=A3UiRXiGCkRNQRkbYaxyfNccGvrFqbqWu16zbyV0GH+40DjNpD8LVjA1UDwKND+DeJ
         8fjnhkqKySQzejMWBCDA4ol9XYTfBCmSI7yzOhkMpkTgsvcTstHUymNZNm7PT5HNLEQi
         sqHER9mOVmQF2Yme+5yQzuSeSqE4gRZuWXDtAbaK9VcLg2zDMhAWp6U/ljmx/LfL1Dla
         fGsBG90WPpdiotOTYIRRaAvLgmzjXQygeuOMh99X0K4RG0+WgWtsx3uvHNdKtjYif2NA
         bYVsmhd/cAvBZuh9jEO/IAnuHviON2IrLewJLkbXb8naeM43e8QvUi1P4LSzaCyjJdna
         /lbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=wYL+y8pL8fUeyYxKPpZSV5KcdIFrgA/ShmRzCV44YVg=;
        b=Wl6C1TP4S4OCUknclOCMwOrf3B0DKvxvqRFMSITLv790LyuNAte+2jAOKurbBgZzmr
         r9sobpA4qOUJVsS+sx3VQLs9+gekhuDEBJJgvY5S2iNtugFSuI8ofZt8L32+pTJ+qzoo
         z9HXP9sBweEdKssr+hGPvXlIctu9SOLSrMSi2G9oHzNlpJyG1O2HGYCAd52oROI29YQi
         1bjiOUztPGlzkuq1vB+HJWzdNYy8HxjZQo4KLP8xkzI0K/cSh2Szfd8bMqX0DOddfI1j
         CXnO6AvDf4wUknqdbzcKloEb6jVUwb7uTzpLLlCKUBlFaYbejV+wBpyNFAHEUs2N9OoJ
         AoNQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zkH1iDSk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p8-20020a0ccb88000000b0056e95808bb9si1486341qvk.295.2023.02.25.01.28.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 25 Feb 2023 01:28:48 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zkH1iDSk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pVqjn-0000OQ-8K; Sat, 25 Feb 2023 04:21:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVqj8-0006In-1g
 for qemu-arm@nongnu.org; Sat, 25 Feb 2023 04:20:23 -0500
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVqj3-0003CS-Ms
 for qemu-arm@nongnu.org; Sat, 25 Feb 2023 04:20:21 -0500
Received: by mail-pg1-x52d.google.com with SMTP id p6so962807pga.0
 for <qemu-arm@nongnu.org>; Sat, 25 Feb 2023 01:20:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wYL+y8pL8fUeyYxKPpZSV5KcdIFrgA/ShmRzCV44YVg=;
 b=zkH1iDSkz01mDAtPZePvEVJaW9yiQA1WXPTNCmqT/tDER5uVma1IR68NQmf7K6/l2F
 vZphHx6sYuYnKCxJWQH8sFicOFoUHyg9PR9IdFdRI5ELJ6tUc49991hGHHd0d7xyBjnr
 RMJskgUxatbFuhKnO3N7ZUVt1YUtMM6s9Y9c4dGKDknFvnZg8CRqM08iOpDJJWd/1qoL
 ee8HRsBmBWJSZptnxrV9mWyOkjzY6PrNPfw6ruYrPiLCTJY7dW5pfmE4L9P0PgE06FOb
 XanmkJN+zRxGItU5dRR1cTVuq0Am9stSCGne485XOyxM83LUyMrjZmaVKqWIPFjTIHBi
 ZEIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wYL+y8pL8fUeyYxKPpZSV5KcdIFrgA/ShmRzCV44YVg=;
 b=P5oeDnRoTBwCGOMF3z+TZjlYx/p4P080mC5TEq8RDOcRmvkE6/YlYNPME/OAdgAIdS
 FPXWLTDwuTzzhRfQFuYminoOyWvyGu3OPxbvRrf/TmshSm0JAjEAmGVLeLT6RUNtb5Cv
 5PWhv0ZI+gbFpt3WbNJvzxiT+qFLY7gyWk/63+MvsMHUIrVWqS8eUL6tSq6INTPl4Maj
 QYqg8umevyaX9DPk6NjeplqLX/coPVb5zxsu/eh9disEh6vMF/gVmWJkNWJCZ9wSvica
 cl17F0CiVDy4U66Pzb08oqD8EshMA8/gY/0jZBgQml0SclvBJJFP2mG/LYP6tfyc1Lx0
 mIyw==
X-Gm-Message-State: AO0yUKUonpSimM/HqKbjpKdegEpbg38J/5U55RcsORWfUETlhCiOo13o
 dc/WjL5ohC3CcxfLMaLRyqpw9Q==
X-Received: by 2002:aa7:8ecc:0:b0:5a9:b910:6d98 with SMTP id
 b12-20020aa78ecc000000b005a9b9106d98mr17241347pfr.13.1677316814490; 
 Sat, 25 Feb 2023 01:20:14 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 26-20020aa7921a000000b00592417157f2sm843114pfo.148.2023.02.25.01.20.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Feb 2023 01:20:14 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com
Subject: [PATCH 62/76] target/s390x: Remove assert vs g_in2
Date: Fri, 24 Feb 2023 23:14:13 -1000
Message-Id: <20230225091427.1817156-63-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230225091427.1817156-1-richard.henderson@linaro.org>
References: <20230225091427.1817156-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52d.google.com
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: ra1JC39LSnWC

These were trying to determine if o->in2 was available for
use as a temporary.  It's better to just allocate a new one.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/s390x/tcg/translate.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/target/s390x/tcg/translate.c b/target/s390x/tcg/translate.c
index beccd3429e..c431903c67 100644
--- a/target/s390x/tcg/translate.c
+++ b/target/s390x/tcg/translate.c
@@ -1428,11 +1428,11 @@ static DisasJumpType op_andi(DisasContext *s, DisasOps *o)
     int shift = s->insn->data & 0xff;
     int size = s->insn->data >> 8;
     uint64_t mask = ((1ull << size) - 1) << shift;
+    TCGv_i64 t = tcg_temp_new_i64();
 
-    assert(!o->g_in2);
-    tcg_gen_shli_i64(o->in2, o->in2, shift);
-    tcg_gen_ori_i64(o->in2, o->in2, ~mask);
-    tcg_gen_and_i64(o->out, o->in1, o->in2);
+    tcg_gen_shli_i64(t, o->in2, shift);
+    tcg_gen_ori_i64(t, t, ~mask);
+    tcg_gen_and_i64(o->out, o->in1, t);
 
     /* Produce the CC from only the bits manipulated.  */
     tcg_gen_andi_i64(cc_dst, o->out, mask);
@@ -3520,10 +3520,10 @@ static DisasJumpType op_ori(DisasContext *s, DisasOps *o)
     int shift = s->insn->data & 0xff;
     int size = s->insn->data >> 8;
     uint64_t mask = ((1ull << size) - 1) << shift;
+    TCGv_i64 t = tcg_temp_new_i64();
 
-    assert(!o->g_in2);
-    tcg_gen_shli_i64(o->in2, o->in2, shift);
-    tcg_gen_or_i64(o->out, o->in1, o->in2);
+    tcg_gen_shli_i64(t, o->in2, shift);
+    tcg_gen_or_i64(o->out, o->in1, t);
 
     /* Produce the CC from only the bits manipulated.  */
     tcg_gen_andi_i64(cc_dst, o->out, mask);
@@ -4832,10 +4832,10 @@ static DisasJumpType op_xori(DisasContext *s, DisasOps *o)
     int shift = s->insn->data & 0xff;
     int size = s->insn->data >> 8;
     uint64_t mask = ((1ull << size) - 1) << shift;
+    TCGv_i64 t = tcg_temp_new_i64();
 
-    assert(!o->g_in2);
-    tcg_gen_shli_i64(o->in2, o->in2, shift);
-    tcg_gen_xor_i64(o->out, o->in1, o->in2);
+    tcg_gen_shli_i64(t, o->in2, shift);
+    tcg_gen_xor_i64(o->out, o->in1, t);
 
     /* Produce the CC from only the bits manipulated.  */
     tcg_gen_andi_i64(cc_dst, o->out, mask);
-- 
2.34.1

