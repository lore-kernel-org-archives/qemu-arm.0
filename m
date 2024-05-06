Received: by 2002:a17:907:a09:b0:a52:4db9:938b with SMTP id bb9csp1270607ejc;
        Sun, 5 May 2024 18:07:52 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVH03qGZ4bgcv4WUS5mHO4hUe9hw6i1NKxSvwGXRJLvNPoFl9j2JQPP9gLPCVewQ9qZ6bR4vwx2TPI+6JutUQkN2kFuDVJZ
X-Google-Smtp-Source: AGHT+IFrUjsR/2tSjIYYnx0wdmQwLmf2Uqdm5vzwbsg5E6T+S87PFCa+hVpTfxzgHLLTdoDbyZbU
X-Received: by 2002:a05:622a:164a:b0:43a:d84e:442b with SMTP id y10-20020a05622a164a00b0043ad84e442bmr10755581qtj.5.1714957671799;
        Sun, 05 May 2024 18:07:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1714957671; cv=none;
        d=google.com; s=arc-20160816;
        b=R3bziuPk8VkO2qarhAGhT8SOpK98wyAkudRCK9s2NsEv474a0jezyOWoFSlj4ydRKD
         GcQJEsWP2IVU2f1nKfGW5kSRKbfoy13j5FQ2YE/zj2GyyzZibg0zTIcNDOTsZFx6q0pi
         GYk8mJ2auqX9ON+FcLGWs2KwIwtuKX702WlQKrHGJYkHnZcsmtGgURYuo/nfI12oDKHA
         RBA5l2hlVu5aWpRTK8BZnWwIrc5yRDQWUy8wBHy4cuUTtm1lKrcym4qdVOj/hJAvT9b3
         PZxNyPKP7lWxaz3YhJMx23xId5kJM229UX7PaV+kgZfasq0KNIUq8BB/u/4ES2oDUOZg
         QQBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=XbPodXVfNYDOBeFPuI23bmSPTaq8W6PthVSB/YmIGHc=;
        fh=9Ev+QBUhk6P6vR3LT1wYeDLexozsz44nqjfoyPajZCc=;
        b=VI+iWpoSdmjKOBnuJI+2XjstiL1fvMXC+24u/lnRyKhBW1EJynTAOcjyQe4dRa39oM
         BUeyeTtTncuY5tJRJS+lHXvJvOmtEjjHP9HYaxXEdoWrGH8iPLb+IpHvgCiUVNzqoTGI
         Gs6yHPNOg2hQuOyS50WKtEgEkwlaGGhD+rJ62v9O7IDnL7sFgKEFJZVFvynADEht62WS
         RWDVYTvNnaPo4WYzvFAhcVKYW8F+ykhQrwNVM/041KEKTE9THSTWYAN60HrKmsPrwbKN
         PERPG2YhEyHRC2EOUTGV4HF7S2LUy8I7+bBH5axqeSoRTs/bWyc9DKYhQVKwK9rHBzXK
         ZOGg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xEJDXnh2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y19-20020a05622a165300b0043aea7c8b1asi8740015qtj.444.2024.05.05.18.07.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 05 May 2024 18:07:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xEJDXnh2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1s3mnJ-0000W9-OM; Sun, 05 May 2024 21:05:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1s3mmr-0008Kk-3I
 for qemu-arm@nongnu.org; Sun, 05 May 2024 21:05:01 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1s3mmO-0002XE-8W
 for qemu-arm@nongnu.org; Sun, 05 May 2024 21:05:00 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 98e67ed59e1d1-2ac9b225a91so990179a91.2
 for <qemu-arm@nongnu.org>; Sun, 05 May 2024 18:04:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1714957470; x=1715562270; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XbPodXVfNYDOBeFPuI23bmSPTaq8W6PthVSB/YmIGHc=;
 b=xEJDXnh2pC61OPsT3B2r4ySQf/qWqVEwuUKICjBbdXynHLB4OrSR5nah8Xkukc5YYX
 xSch0ttaOtU2dy6Gv53AwO0+E0bXnhf5t3bUmd05BUDbBUzGHGXciIDFucL4n3uk5Ba0
 dDYusYRdK64Eak0x0TypzviXBj3iAmuJYHpMyXn5BFjgwR/P6U9RUWl+wWA5vBLgI+U+
 0eDDsgcXoT4X1HqdrZsheQMmIJFaj16XO1+nnngNFnC7IY8LQiFKfZOR1d7zrdM80bUM
 7ymAziiFZ8Q0m5jthHOVZe14QXks6c88s1tUmSbN7S6H1rgUDcOPGtEAgUilS/hfTwb5
 zrBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714957470; x=1715562270;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XbPodXVfNYDOBeFPuI23bmSPTaq8W6PthVSB/YmIGHc=;
 b=vB8b9DcmQO4WjX7/WrXd+wATypoR1ACH1hnLJmoeZ3wkzMDxrEbMcX+jW00W7JdaWN
 58GK5bEs1pIfxdz/yUbMHwS4xTj3UQnheIM8jNC11Ncp20qQMc4IPlYz4sg+cO5LXvPN
 fNaVrT7IRkRDA4ICAwGPwp+ZySSnEsmcB9j3N+BhKH+M8DFQ0K8243AruV+kdAwt8e3n
 DTe9rzax49V6MWxm9W9z2BGpqgP3y9qXRuKplH3HkDF9xNVBJcti4MPCL9adclE77nyu
 4SpYEMNDge4EwM/ukEHatO2oYoPAp9oKI2XKPYCUKd4ek6KIOZ8c8sabMCZ4qzJmc097
 EF7g==
X-Gm-Message-State: AOJu0Yz8mPltU6o7zs2D0uVnbpSQADvj7R8IhBulmUEQ9aloRxYOl7Ni
 FQeokiNNFbzgbZknEFTaituY44zIO2FPRI1wjvqF96ZXy1PGwtdHP4EamKu2xzU=
X-Received: by 2002:a17:90a:650a:b0:2a2:70f6:8f67 with SMTP id
 i10-20020a17090a650a00b002a270f68f67mr7393275pjj.30.1714957469835; 
 Sun, 05 May 2024 18:04:29 -0700 (PDT)
Received: from stoup.. (174-21-72-5.tukw.qwest.net. [174.21.72.5])
 by smtp.gmail.com with ESMTPSA id
 pv7-20020a17090b3c8700b002a5f44353d2sm8958232pjb.7.2024.05.05.18.04.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 May 2024 18:04:29 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 30/57] target/arm: Improve vector UQADD, UQSUB, SQADD, SQSUB
Date: Sun,  5 May 2024 18:03:36 -0700
Message-Id: <20240506010403.6204-31-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240506010403.6204-1-richard.henderson@linaro.org>
References: <20240506010403.6204-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
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
X-TUID: tT5onFBk/kgb

No need for a full comparison; xor produces non-zero bits
for QC just fine.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/gengvec.c | 32 ++++++++++++++++----------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/target/arm/tcg/gengvec.c b/target/arm/tcg/gengvec.c
index 22c9d17dce..bfe6885a01 100644
--- a/target/arm/tcg/gengvec.c
+++ b/target/arm/tcg/gengvec.c
@@ -1217,21 +1217,21 @@ void gen_gvec_sshl(unsigned vece, uint32_t rd_ofs, uint32_t rn_ofs,
     tcg_gen_gvec_3(rd_ofs, rn_ofs, rm_ofs, opr_sz, max_sz, &ops[vece]);
 }
 
-static void gen_uqadd_vec(unsigned vece, TCGv_vec t, TCGv_vec sat,
+static void gen_uqadd_vec(unsigned vece, TCGv_vec t, TCGv_vec qc,
                           TCGv_vec a, TCGv_vec b)
 {
     TCGv_vec x = tcg_temp_new_vec_matching(t);
     tcg_gen_add_vec(vece, x, a, b);
     tcg_gen_usadd_vec(vece, t, a, b);
-    tcg_gen_cmp_vec(TCG_COND_NE, vece, x, x, t);
-    tcg_gen_or_vec(vece, sat, sat, x);
+    tcg_gen_xor_vec(vece, x, x, t);
+    tcg_gen_or_vec(vece, qc, qc, x);
 }
 
 void gen_gvec_uqadd_qc(unsigned vece, uint32_t rd_ofs, uint32_t rn_ofs,
                        uint32_t rm_ofs, uint32_t opr_sz, uint32_t max_sz)
 {
     static const TCGOpcode vecop_list[] = {
-        INDEX_op_usadd_vec, INDEX_op_cmp_vec, INDEX_op_add_vec, 0
+        INDEX_op_usadd_vec, INDEX_op_add_vec, 0
     };
     static const GVecGen4 ops[4] = {
         { .fniv = gen_uqadd_vec,
@@ -1259,21 +1259,21 @@ void gen_gvec_uqadd_qc(unsigned vece, uint32_t rd_ofs, uint32_t rn_ofs,
                    rn_ofs, rm_ofs, opr_sz, max_sz, &ops[vece]);
 }
 
-static void gen_sqadd_vec(unsigned vece, TCGv_vec t, TCGv_vec sat,
+static void gen_sqadd_vec(unsigned vece, TCGv_vec t, TCGv_vec qc,
                           TCGv_vec a, TCGv_vec b)
 {
     TCGv_vec x = tcg_temp_new_vec_matching(t);
     tcg_gen_add_vec(vece, x, a, b);
     tcg_gen_ssadd_vec(vece, t, a, b);
-    tcg_gen_cmp_vec(TCG_COND_NE, vece, x, x, t);
-    tcg_gen_or_vec(vece, sat, sat, x);
+    tcg_gen_xor_vec(vece, x, x, t);
+    tcg_gen_or_vec(vece, qc, qc, x);
 }
 
 void gen_gvec_sqadd_qc(unsigned vece, uint32_t rd_ofs, uint32_t rn_ofs,
                        uint32_t rm_ofs, uint32_t opr_sz, uint32_t max_sz)
 {
     static const TCGOpcode vecop_list[] = {
-        INDEX_op_ssadd_vec, INDEX_op_cmp_vec, INDEX_op_add_vec, 0
+        INDEX_op_ssadd_vec, INDEX_op_add_vec, 0
     };
     static const GVecGen4 ops[4] = {
         { .fniv = gen_sqadd_vec,
@@ -1301,21 +1301,21 @@ void gen_gvec_sqadd_qc(unsigned vece, uint32_t rd_ofs, uint32_t rn_ofs,
                    rn_ofs, rm_ofs, opr_sz, max_sz, &ops[vece]);
 }
 
-static void gen_uqsub_vec(unsigned vece, TCGv_vec t, TCGv_vec sat,
+static void gen_uqsub_vec(unsigned vece, TCGv_vec t, TCGv_vec qc,
                           TCGv_vec a, TCGv_vec b)
 {
     TCGv_vec x = tcg_temp_new_vec_matching(t);
     tcg_gen_sub_vec(vece, x, a, b);
     tcg_gen_ussub_vec(vece, t, a, b);
-    tcg_gen_cmp_vec(TCG_COND_NE, vece, x, x, t);
-    tcg_gen_or_vec(vece, sat, sat, x);
+    tcg_gen_xor_vec(vece, x, x, t);
+    tcg_gen_or_vec(vece, qc, qc, x);
 }
 
 void gen_gvec_uqsub_qc(unsigned vece, uint32_t rd_ofs, uint32_t rn_ofs,
                        uint32_t rm_ofs, uint32_t opr_sz, uint32_t max_sz)
 {
     static const TCGOpcode vecop_list[] = {
-        INDEX_op_ussub_vec, INDEX_op_cmp_vec, INDEX_op_sub_vec, 0
+        INDEX_op_ussub_vec, INDEX_op_sub_vec, 0
     };
     static const GVecGen4 ops[4] = {
         { .fniv = gen_uqsub_vec,
@@ -1343,21 +1343,21 @@ void gen_gvec_uqsub_qc(unsigned vece, uint32_t rd_ofs, uint32_t rn_ofs,
                    rn_ofs, rm_ofs, opr_sz, max_sz, &ops[vece]);
 }
 
-static void gen_sqsub_vec(unsigned vece, TCGv_vec t, TCGv_vec sat,
+static void gen_sqsub_vec(unsigned vece, TCGv_vec t, TCGv_vec qc,
                           TCGv_vec a, TCGv_vec b)
 {
     TCGv_vec x = tcg_temp_new_vec_matching(t);
     tcg_gen_sub_vec(vece, x, a, b);
     tcg_gen_sssub_vec(vece, t, a, b);
-    tcg_gen_cmp_vec(TCG_COND_NE, vece, x, x, t);
-    tcg_gen_or_vec(vece, sat, sat, x);
+    tcg_gen_xor_vec(vece, x, x, t);
+    tcg_gen_or_vec(vece, qc, qc, x);
 }
 
 void gen_gvec_sqsub_qc(unsigned vece, uint32_t rd_ofs, uint32_t rn_ofs,
                        uint32_t rm_ofs, uint32_t opr_sz, uint32_t max_sz)
 {
     static const TCGOpcode vecop_list[] = {
-        INDEX_op_sssub_vec, INDEX_op_cmp_vec, INDEX_op_sub_vec, 0
+        INDEX_op_sssub_vec, INDEX_op_sub_vec, 0
     };
     static const GVecGen4 ops[4] = {
         { .fniv = gen_sqsub_vec,
-- 
2.34.1

