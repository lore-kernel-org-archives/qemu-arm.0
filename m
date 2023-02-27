Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp4296229ejc;
        Sun, 26 Feb 2023 21:41:32 -0800 (PST)
X-Google-Smtp-Source: AK7set8pCbYy84s/RwOImmOjF4oF20wGB4VXeTknEa/EorEROece+qvykeh9OfQUb9hSitqGgmaw
X-Received: by 2002:a05:622a:1a1d:b0:3b8:4adb:c603 with SMTP id f29-20020a05622a1a1d00b003b84adbc603mr43490259qtb.60.1677476492115;
        Sun, 26 Feb 2023 21:41:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677476492; cv=none;
        d=google.com; s=arc-20160816;
        b=rn3I8ROHVgfuqkYpFGAv3NFS1l4SXJq3IBq0Njlk3uw88Zzoku230Ag2dnHYNRo3sA
         FqKhuMCchC/FWLH1xXzsPxlfd4LgB5WyByaRWz0jCGAs0HIYi0pubtBnlIVAjNbCSl9V
         7UrCRVi97FgVNo9tjucYvTmifYfo6pzpzd9KTGilbntLxgUopsVgiomZ29yZeeql1awf
         IWpxhkVdOetGBD4AF51aPunDi5IJZ94hg55yP10LMYaoOFMLFzAIrzwziKABqcifj7U7
         4c8Mp3PF6x+/apyq9eTpJlnVvEu8cnyXRsPSypk6RISRnT/Xpl/jXSHvASfsJCsQ1C7v
         0jUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=nOjB7Oa3s7/QHz69KU/odzNJz8JnUW0khbG4X3to11I=;
        b=XWEYW6UKNYSatTPaVcNpzwXhcCgM0iO4aZBptdiZVhxEKLdEBRTJ5At415RlRCN3gX
         v0vtGayPAGscrrPKeH11nJR06ALGksoiV0Tc48eiYxYEPkZ6obsw29EuB7o5Y3GMRRnf
         SPFTd4tPKQbYcfdLlUacoew0V4sZxy3oOneYYbEXIDNevPFn0ZmMhhDP12Wpal9MFBUx
         f79sb75qyh7Hm3VltgmO8HZA3QFTH40xEx0uOY10r9Ar10qtqqHLkHzBxCs8do/9DnZ3
         NLu1MOTxNQctHpojG0nftTI5Bszu4ZwwspeNzyTMuVeak4oc/78MJjsl/YWryFtDEzCo
         IhfA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DD3HF3A8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s15-20020ac85ccf000000b003bfba67c525si5458928qta.507.2023.02.26.21.41.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 26 Feb 2023 21:41:32 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DD3HF3A8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pWWEE-00088g-Iu; Mon, 27 Feb 2023 00:39:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWD9-0003PT-OR
 for qemu-arm@nongnu.org; Mon, 27 Feb 2023 00:38:10 -0500
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWD4-0002kb-5F
 for qemu-arm@nongnu.org; Mon, 27 Feb 2023 00:38:03 -0500
Received: by mail-pj1-x102c.google.com with SMTP id y2so4876606pjg.3
 for <qemu-arm@nongnu.org>; Sun, 26 Feb 2023 21:38:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nOjB7Oa3s7/QHz69KU/odzNJz8JnUW0khbG4X3to11I=;
 b=DD3HF3A8LG+tMhcugVaapMk7hvpK328xX0PIrq8xRIw/RZ2RpQHwOyqF8oVysCZ/Oq
 yTZOww5xlhB5sQsiwNMQx1oDcDC0fpgk3kG3WlM4klJu6GnC0ny+00k/XTWgyysZDNx6
 y8MUWGco1YHmcX9UAhDyksn0mZbG6lSkOP5rvyb9948NFG75mstJgBYl17ROEXodkcF9
 hnBxaQKq8SKPrz42eqOocOVeIFpg+X+ypYuLEIu00N03ELFRQ23ljP1O+yj7fPCQzj81
 jih+Z5RWhXi5vdkzlHPUmG7yhJTNfcZCxQt4WzDPxNVvAwFCfYOLjOQPO3Con7mrTCnh
 aR6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nOjB7Oa3s7/QHz69KU/odzNJz8JnUW0khbG4X3to11I=;
 b=pkSI4BcTFrWPb8wyvAbIyE1qtCz9oHK6ijKcm04L69trJEP0Y8wNkHrPJH9Zp4bGBZ
 9dBv+/oF4y7x1u4FYwabefLy8dMuRvM/VhoOjooKwSfU6EIqxhh3rCsWtS/1dNMmyjP2
 94NmxeKRDazR3ZsVgG7ej3fGUe4H+ba69gBR7/Wea1ecYL5p8UOnMljHYpooOShHg3+6
 ioU7o5x/hOuL3v2Qdh97YOQpiuBo9LRenX/wLLNTHuHzmItFPjbikrOBroy6ogmz/cTE
 DB3CJjAnxXiaBDsUb1HA21A4lR039xjUsC/7JMW2UtXa1xp9FUKOxwLU4u/RcRPfzCXm
 sSUQ==
X-Gm-Message-State: AO0yUKWlhU+WJFTN9GRlvZRiwVwxOsGNpFuGHKqUCuaoE9oYMqtOkH0Y
 /CEpnKjehSpNh5bJ8+5ZaCrJQg==
X-Received: by 2002:a05:6a20:428b:b0:cd:6c14:9854 with SMTP id
 o11-20020a056a20428b00b000cd6c149854mr1300643pzj.26.1677476281419; 
 Sun, 26 Feb 2023 21:38:01 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 k12-20020aa792cc000000b005a7c892b435sm3342137pfa.25.2023.02.26.21.37.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Feb 2023 21:38:01 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v4 20/31] target/arm: Don't use tcg_temp_local_new_*
Date: Sun, 26 Feb 2023 19:36:50 -1000
Message-Id: <20230227053701.368744-21-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227053701.368744-1-richard.henderson@linaro.org>
References: <20230227053701.368744-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
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
X-TUID: zoI+OAcDffN9

Since tcg_temp_new_* is now identical, use those.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-sve.c | 6 +++---
 target/arm/translate.c     | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 02150d93e8..718a5bce1b 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -2694,7 +2694,7 @@ static bool do_clast_vector(DisasContext *s, arg_rprr_esz *a, bool before)
         return true;
     }
 
-    last = tcg_temp_local_new_i32();
+    last = tcg_temp_new_i32();
     over = gen_new_label();
 
     find_last_active(s, last, esz, a->pg);
@@ -4342,7 +4342,7 @@ void gen_sve_ldr(DisasContext *s, TCGv_ptr base, int vofs,
         tcg_temp_free_i64(t0);
     } else {
         TCGLabel *loop = gen_new_label();
-        TCGv_ptr tp, i = tcg_const_local_ptr(0);
+        TCGv_ptr tp, i = tcg_const_ptr(0);
 
         gen_set_label(loop);
 
@@ -4427,7 +4427,7 @@ void gen_sve_str(DisasContext *s, TCGv_ptr base, int vofs,
         tcg_temp_free_i64(t0);
     } else {
         TCGLabel *loop = gen_new_label();
-        TCGv_ptr tp, i = tcg_const_local_ptr(0);
+        TCGv_ptr tp, i = tcg_const_ptr(0);
 
         gen_set_label(loop);
 
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 92955d505c..9c8e1ac04c 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -7136,7 +7136,7 @@ static bool op_strex(DisasContext *s, arg_STREX *a, MemOp mop, bool rel)
         tcg_gen_mb(TCG_MO_ALL | TCG_BAR_STRL);
     }
 
-    addr = tcg_temp_local_new_i32();
+    addr = tcg_temp_new_i32();
     load_reg_var(s, addr, a->rn);
     tcg_gen_addi_i32(addr, addr, a->imm);
 
@@ -7289,7 +7289,7 @@ static bool op_ldrex(DisasContext *s, arg_LDREX *a, MemOp mop, bool acq)
         return true;
     }
 
-    addr = tcg_temp_local_new_i32();
+    addr = tcg_temp_new_i32();
     load_reg_var(s, addr, a->rn);
     tcg_gen_addi_i32(addr, addr, a->imm);
 
@@ -8696,7 +8696,7 @@ static bool trans_LE(DisasContext *s, arg_LE *a)
          * Decrement by 1 << (4 - LTPSIZE). We need to use a TCG local
          * so that decr stays live after the brcondi.
          */
-        TCGv_i32 decr = tcg_temp_local_new_i32();
+        TCGv_i32 decr = tcg_temp_new_i32();
         TCGv_i32 ltpsize = load_cpu_field(v7m.ltpsize);
         tcg_gen_sub_i32(decr, tcg_constant_i32(4), ltpsize);
         tcg_gen_shl_i32(decr, tcg_constant_i32(1), decr);
-- 
2.34.1

