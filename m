Received: by 2002:ac2:5e6c:0:0:0:0:0 with SMTP id a12csp663779lfr;
        Fri, 16 Apr 2021 12:21:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzNKLORVqBigC94QtysqM2pO7RwX5n5/ops2CJfaSgSwUzuapkNtok5BUwMFIuDmZzUZtn1
X-Received: by 2002:a5d:8c82:: with SMTP id g2mr4702591ion.34.1618600915932;
        Fri, 16 Apr 2021 12:21:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618600915; cv=none;
        d=google.com; s=arc-20160816;
        b=s9PKvEeQD8G7NEgVMDRDHtL6pPy5sysjZ3ZgpZy9QEoVetq2mFNpLLAgGUcMvmRIt3
         +9chbqpyZepYcL3t3CQoGLaVyqv6ivjnl44txa+7Nw7c5aN99O9Fcx3LA3qNsqqK63oh
         TnA34HAqSwD/zu+aCglXZo8t022lL4jGcEvuePxpkrdc5VdY8nBmCMPN+nwvhZSckVxY
         yWisaxg9Yl31gX0FYoT6vMc44zmcE1nzuMSWLsLL5E/xl5Os8OJTV4HSPTldosxxcX8/
         b8CluH3W+uLZuZv0ZtYY1nY4Y5LB7/mti1iXbt0UKdu8qJwVr3BBqgU2mh/V/vjopatD
         yp7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=zsvdYXq6ehB6Yi/U879OLLmvPBBL5YJ5lhH9C+FI0w0=;
        b=Sbv3T1RSoroWdKD6C+gNtQ4fuPiJ4uzUEefCgg+mKdxGZU92mFmBh7TcRqPqF/nGRL
         QraYPROc8FHecv+JlSE4DQzx8XS2nHXiHZDlmibdKeeG+8ATKzgDJ0joQZ4O0w88ARn1
         kijZxUxNF79fUA7hIntIuhsIcPpB6c/RnlSEdLizvju0qXxk91Ok04QHyjX3KNI0UU4a
         gjHu3EpbK9K3QeFSfuoxUgNdVjNLI2tpSGhRT6KjCpT1WfoabEtj/Avos490ZulqzmwV
         scABgnRHlhNuxoWUeX5oaSnOQOBjoGeRiC/B87FmWfWDwb4sizXzrepQv4jkb2usWhOb
         H8zw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="HCKE/RTu";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m2si6750850ilq.104.2021.04.16.12.21.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 16 Apr 2021 12:21:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="HCKE/RTu";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lXU2N-0008Hb-5m
	for alex.bennee@linaro.org; Fri, 16 Apr 2021 15:21:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXTi9-00045N-M4
 for qemu-arm@nongnu.org; Fri, 16 Apr 2021 15:01:03 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530]:41526)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXThe-0004VL-Ps
 for qemu-arm@nongnu.org; Fri, 16 Apr 2021 15:01:01 -0400
Received: by mail-pg1-x530.google.com with SMTP id f29so19813846pgm.8
 for <qemu-arm@nongnu.org>; Fri, 16 Apr 2021 12:00:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zsvdYXq6ehB6Yi/U879OLLmvPBBL5YJ5lhH9C+FI0w0=;
 b=HCKE/RTuzwdMoopodiWGlcV8Lg6/4kqC1kjNOZUBCv8qF8BO9rrGeSx4+F12t2epvN
 UiogMdj92B8uWMzXd9fOhPtnGLHZ4LWjrU2FL2D/C2LZGGmwhSlVn6gFNsdV85CydOfc
 5LQMmRCrT3g5+REKRVrn5xi2B1bKRMTcoT047+6uGrZAHlP/fcyVT30Qjlj0Cvj6Bssa
 Zrk76TWWNUXZRZdySZkaGs8KnMJXqlbD4TKq1I/ICdiwQCrAo+ZbZj+QESsHuMBbqOZh
 sCHQRt3gSaAs5SsJ6sSaUOx096/abAfOA60ON2fVqbb59QSe3x4T9iX6H7zRhpHsR21p
 yzIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zsvdYXq6ehB6Yi/U879OLLmvPBBL5YJ5lhH9C+FI0w0=;
 b=WOoQDccUfsAnW6Oqt3cYxkFFHroJ7RvNwTjBo7NOhDDejf77eH0+wYDAib7X1w5YCM
 1xUw6IqKC+X36r3NR+i5/jRFXkcqVrcB7f7rAULlnqdu/qotbHV9E/N5ELobG270T8U/
 OzwZ3XTWSqTr7FGU+sC5EuUi2tQ8a/4i9k+88mFFadmlEn0LffpMMJzZ/Oq8x1Qbd9UM
 0GQnraFUdH6xZ1Q6oXgI7IOM0VFi0zsbK6IfULWbp85sI+pA0hDnvQ7gqlVzqSAkb4oW
 o4C1Zaiza6NVx7YZYzec++XWdFNq9jN5DwzWi83TN+AUog7eWqeviHwXkkhQ8q7PAJTJ
 +ihA==
X-Gm-Message-State: AOAM5311BkJY9KHP010VLX2+OsqbbKYZE3wQIcirbQ4nNfl60jTL6qdU
 pMcfXjdSmUgWOhIqspvu0YK7SvcPygKt7A==
X-Received: by 2002:a63:5004:: with SMTP id e4mr466189pgb.61.1618599629297;
 Fri, 16 Apr 2021 12:00:29 -0700 (PDT)
Received: from localhost.localdomain ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id d7sm1988337pfv.197.2021.04.16.12.00.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Apr 2021 12:00:28 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 29/30] target/arm: Enforce alignment for aa64 vector
 LDn/STn (single)
Date: Fri, 16 Apr 2021 11:59:58 -0700
Message-Id: <20210416185959.1520974-30-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210416185959.1520974-1-richard.henderson@linaro.org>
References: <20210416185959.1520974-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x530.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3SaSGzGDvGgA

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-a64.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 2a82dbbd6d..95897e63af 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -3815,6 +3815,7 @@ static void disas_ldst_single_struct(DisasContext *s, uint32_t insn)
     int index = is_q << 3 | S << 2 | size;
     int xs, total;
     TCGv_i64 clean_addr, tcg_rn, tcg_ebytes;
+    MemOp mop;
 
     if (extract32(insn, 31, 1)) {
         unallocated_encoding(s);
@@ -3876,6 +3877,7 @@ static void disas_ldst_single_struct(DisasContext *s, uint32_t insn)
 
     clean_addr = gen_mte_checkN(s, tcg_rn, !is_load, is_postidx || rn != 31,
                                 total);
+    mop = finalize_memop(s, scale);
 
     tcg_ebytes = tcg_const_i64(1 << scale);
     for (xs = 0; xs < selem; xs++) {
@@ -3883,8 +3885,7 @@ static void disas_ldst_single_struct(DisasContext *s, uint32_t insn)
             /* Load and replicate to all elements */
             TCGv_i64 tcg_tmp = tcg_temp_new_i64();
 
-            tcg_gen_qemu_ld_i64(tcg_tmp, clean_addr,
-                                get_mem_index(s), s->be_data + scale);
+            tcg_gen_qemu_ld_i64(tcg_tmp, clean_addr, get_mem_index(s), mop);
             tcg_gen_gvec_dup_i64(scale, vec_full_reg_offset(s, rt),
                                  (is_q + 1) * 8, vec_full_reg_size(s),
                                  tcg_tmp);
@@ -3892,9 +3893,9 @@ static void disas_ldst_single_struct(DisasContext *s, uint32_t insn)
         } else {
             /* Load/store one element per register */
             if (is_load) {
-                do_vec_ld(s, rt, index, clean_addr, scale | s->be_data);
+                do_vec_ld(s, rt, index, clean_addr, mop);
             } else {
-                do_vec_st(s, rt, index, clean_addr, scale | s->be_data);
+                do_vec_st(s, rt, index, clean_addr, mop);
             }
         }
         tcg_gen_add_i64(clean_addr, clean_addr, tcg_ebytes);
-- 
2.25.1

