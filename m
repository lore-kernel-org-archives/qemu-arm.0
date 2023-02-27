Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp4301855ejc;
        Sun, 26 Feb 2023 21:52:01 -0800 (PST)
X-Google-Smtp-Source: AK7set9ITfXgU6A6jSQEiqXxI1VIZ8+Pu0QoJslm3iqvQcEbBSAFlg0BNjjGm3nhR6rwRFGT9un8
X-Received: by 2002:a05:6214:2aa9:b0:56c:37a:58b2 with SMTP id js9-20020a0562142aa900b0056c037a58b2mr43874267qvb.15.1677477121501;
        Sun, 26 Feb 2023 21:52:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677477121; cv=none;
        d=google.com; s=arc-20160816;
        b=rVNSAQXBKW9JZ3BsrHt6vS4lFyRNAu4gfvQEO/yL8ETFORA6Wu6jp8sFP1866lf31Q
         I5tI9yWM6kuFzPTJj1a8aYQbGePi+1W66Edp7jEHffhdcRbC9n0Wk4UPti8qNI8Gg2Q/
         mwfB16NKZvk1tyyZwTG3BWK2zWMjCPGWZnyWqk20qms7is0uvmRJSu3QkYhgaJCS0os0
         TNDMEr8/VvRYRFBhKdLbpShwZkoYS8VsH/4x6Tsaf/6blSmTRp1OgCgtCabVvoo95Fg2
         sUaoxiw06VQsefRkrnGpX12zzaB9jUdsxJyw9MOFZ4xRn9+JfBhxO+2y1h+LAH7T1Ogy
         dnKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=YhL2WzjGmls46D+quq34ze/ulksmGA+cQwYE9pUognw=;
        b=ywc5rUKHl2nZ5ijLdugf5KH2iSTXcZp15LsBD9bhfSPEmybCwCZ4tWCsG49pYG3c9d
         CGvSgEcpsXF1CayH5rU5tKA4d2UeP7oG5Swevwl/d1b3er/EVe8CFWfYTCmkTgv4u49z
         vgtToSKK60esGcQN4Z+APY87k4FPbR7GcIoGmYYzXvEy5L7vk1OB8CIyGtHCmtkkeTkC
         U85Bj5n7crbx89WxijANZHhgKh6MlVwug9L8gU1t7xD5FGqHo0AUiX7XIAAthQhIF/wC
         IxebO/a/F06zl8djKcD+XTRXrg91BrQTbS2wEPZZaiMsV+v2GKgm8pc7VoLwwbVBSqW5
         HNfg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="IqZ+RBL/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bp36-20020a05620a45a400b0070655ddd307si6369329qkb.688.2023.02.26.21.52.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 26 Feb 2023 21:52:01 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="IqZ+RBL/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pWWEH-0008Gz-S9; Mon, 27 Feb 2023 00:39:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWDC-0003R0-QO
 for qemu-arm@nongnu.org; Mon, 27 Feb 2023 00:38:18 -0500
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWD9-0002xj-FL
 for qemu-arm@nongnu.org; Mon, 27 Feb 2023 00:38:10 -0500
Received: by mail-pf1-x431.google.com with SMTP id n2so2768359pfo.12
 for <qemu-arm@nongnu.org>; Sun, 26 Feb 2023 21:38:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YhL2WzjGmls46D+quq34ze/ulksmGA+cQwYE9pUognw=;
 b=IqZ+RBL/2YYgOsYsdvePHMAGCFEFsncU1Fp92DEasNpFqQ9VMjHTWrnkmbtD052KBO
 /Vv04Uz9AZxyCUNMVTIq4ylwpeiQ0sS49zirXicKzO3MCypmMwb1G2osdfm+DV+XMO9Q
 OWxaTZhT3asJurwFQHXz/TCD+Li/Lp85Hs2eeBYQGNyK50vTgUIE7s1xO8iiP2l5PNxf
 ap3OLGVCkLlDocjvNOqF3v0elqZOyTXUvUihJP+X4gpVvENMyFS1fFLuEw/4tlbQLZek
 jxuql4dIDxK6jm25kCDD462Ue/A/cFDuLWmYXFRfZ7PkZxwkeyt1WVOiP4Y7O/ocRoGP
 opDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YhL2WzjGmls46D+quq34ze/ulksmGA+cQwYE9pUognw=;
 b=o7tlmpBGrQV5e5wLLRa2Xx9T8Yv2NcAEyrFpmsrnSXtytoMWx8FDeYpvwu7tKboG1Y
 DWV6TlHiY4EBCXFPTDhaS0LILGU65N4O9ncO0jKTUkxU0GXOvUBVq3Ipr4B6TiLpqN3r
 dqDwsw2F5EN+/fVQzr8WmFt7FHuxWiVJGoca0gz2GXWOL/uDZ55BlIpluRhdj2/U4ck2
 +qir9AZPTHVU4S8Rcn4x9wQZ8oz/vgxohEztlI4rTsiOadMfseiuHR9e+FJIN/1O4uIZ
 cJAq3ef+CH9y8rkP/pQpY9XvHAf7rBHnbShjNwJb46ENrXRO0nidlY5s5C89l5dNqlx7
 MyWQ==
X-Gm-Message-State: AO0yUKXlYg9elxwJvrJhbvyIrEvD9gCgYGd2WLW9hgAc9SeoWFFKXWZD
 rX3qvc239cIkGePk9cOj+z1Law==
X-Received: by 2002:aa7:99dc:0:b0:5e5:e066:2304 with SMTP id
 v28-20020aa799dc000000b005e5e0662304mr8267814pfi.31.1677476283963; 
 Sun, 26 Feb 2023 21:38:03 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 k12-20020aa792cc000000b005a7c892b435sm3342137pfa.25.2023.02.26.21.38.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Feb 2023 21:38:03 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v4 21/31] target/cris: Don't use tcg_temp_local_new
Date: Sun, 26 Feb 2023 19:36:51 -1000
Message-Id: <20230227053701.368744-22-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227053701.368744-1-richard.henderson@linaro.org>
References: <20230227053701.368744-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x431.google.com
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
X-TUID: lIQvTwNIceRo

Since tcg_temp_new is now identical, use that.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/cris/translate.c         |  6 +++---
 target/cris/translate_v10.c.inc | 10 +++++-----
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/target/cris/translate.c b/target/cris/translate.c
index 905d01288e..a959b27373 100644
--- a/target/cris/translate.c
+++ b/target/cris/translate.c
@@ -1621,7 +1621,7 @@ static int dec_bound_r(CPUCRISState *env, DisasContext *dc)
     LOG_DIS("bound.%c $r%u, $r%u\n",
             memsize_char(size), dc->op1, dc->op2);
     cris_cc_mask(dc, CC_MASK_NZ);
-    l0 = tcg_temp_local_new();
+    l0 = tcg_temp_new();
     dec_prep_move_r(dc, dc->op1, dc->op2, size, 0, l0);
     cris_alu(dc, CC_OP_BOUND, cpu_R[dc->op2], cpu_R[dc->op2], l0, 4);
     tcg_temp_free(l0);
@@ -2404,8 +2404,8 @@ static int dec_bound_m(CPUCRISState *env, DisasContext *dc)
             dc->op1, dc->postinc ? "+]" : "]",
             dc->op2);
 
-    l[0] = tcg_temp_local_new();
-    l[1] = tcg_temp_local_new();
+    l[0] = tcg_temp_new();
+    l[1] = tcg_temp_new();
         insn_len = dec_prep_alu_m(env, dc, 0, memsize, l[0], l[1]);
     cris_cc_mask(dc, CC_MASK_NZ);
     cris_alu(dc, CC_OP_BOUND, cpu_R[dc->op2], l[0], l[1], 4);
diff --git a/target/cris/translate_v10.c.inc b/target/cris/translate_v10.c.inc
index f500e93447..9660f28584 100644
--- a/target/cris/translate_v10.c.inc
+++ b/target/cris/translate_v10.c.inc
@@ -68,9 +68,9 @@ static void gen_store_v10_conditional(DisasContext *dc, TCGv addr, TCGv val,
                        unsigned int size, int mem_index)
 {
     TCGLabel *l1 = gen_new_label();
-    TCGv taddr = tcg_temp_local_new();
-    TCGv tval = tcg_temp_local_new();
-    TCGv t1 = tcg_temp_local_new();
+    TCGv taddr = tcg_temp_new();
+    TCGv tval = tcg_temp_new();
+    TCGv t1 = tcg_temp_new();
     dc->postinc = 0;
     cris_evaluate_flags(dc);
 
@@ -434,7 +434,7 @@ static void dec10_reg_bound(DisasContext *dc, int size)
 {
     TCGv t;
 
-    t = tcg_temp_local_new();
+    t = tcg_temp_new();
     t_gen_zext(t, cpu_R[dc->src], size);
     cris_alu(dc, CC_OP_BOUND, cpu_R[dc->dst], cpu_R[dc->dst], t, 4);
     tcg_temp_free(t);
@@ -935,7 +935,7 @@ static int dec10_ind_bound(CPUCRISState *env, DisasContext *dc,
     int rd = dc->dst;
     TCGv t;
 
-    t = tcg_temp_local_new();
+    t = tcg_temp_new();
     insn_len += dec10_prep_move_m(env, dc, 0, size, t);
     cris_alu(dc, CC_OP_BOUND, cpu_R[dc->dst], cpu_R[rd], t, 4);
     if (dc->dst == 15) {
-- 
2.34.1

