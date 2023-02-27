Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp4298179ejc;
        Sun, 26 Feb 2023 21:45:00 -0800 (PST)
X-Google-Smtp-Source: AK7set9kcEjLbsykssIj8IA84XO8vJdtHikni7A81qGCImesbP0k/u8Wuq2ay5VMWTsqn1AGgb5/
X-Received: by 2002:a05:622a:1902:b0:3bf:a932:5bce with SMTP id w2-20020a05622a190200b003bfa9325bcemr14747897qtc.2.1677476700389;
        Sun, 26 Feb 2023 21:45:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677476700; cv=none;
        d=google.com; s=arc-20160816;
        b=mRSO2fsPsN0BmHbKHz/JNT5zVqFqCwwmuy0HspJJ6zlThRdqo1s0NyFu7rwh3/rFhZ
         Top5n5mdRbFR31FTfcGS2HoFN+nMijPCPuPTlCY/KKAEjahCRca/DH1m97nKtHTKAJgu
         FdC+HUgqLn2Ufv36OpvdqjdvLFUY0Qx5VS0utChZkNa3Dfk9q4rtov2U3usu7lCafjwK
         CQnAOiDIOq6i1JhjNyZQtQrKok4cWHN4+5cyUPkJUciQZxoWH/QyliE5TJl9+J8GFzTf
         aBsnYvvNDNNmeDWblForWnVf9BeZz7tBmPhS4LDGoF39E4sWiN7VkJzq9wTZMQsMRSGt
         jvWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=mERf7MKXZT5xGumbcdn7TizHZXgv59+znRwTwlxucPE=;
        b=zX25B1sW0cWrV7Mtom/teRjplZdj+Ww/mA+E1JnuA2FWbkkuGn1B5xp1lgcdQlXTUJ
         pB8er95ALya480HJgFV/Q26nOaSTvd5xVu63p25RDVGAFOJ1+CkcnE1ksn8fsyTz2sxT
         uPb2KH8GXpvfZBO7OeUzCDPVMtpRX+0CVViQeaeoQG4yaIMG9PngoBVdFoDfu/eNhtg8
         t5fkYLuzar3WDsjXDe84+jOIBp4kTyME+MzOPm0w2FawTPf/taTmVpEHI3t9Mr3o9gO8
         hYxXqJTeiJLioLjZdOWAf6Zx6FJ0HQvzaZA+Ynn7NsVP8NDHrWoNYOLuFx7cfMOHeqCD
         N5vQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=r1ifEh3K;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 11-20020ac8590b000000b003bd16d07e57si5145277qty.515.2023.02.26.21.45.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 26 Feb 2023 21:45:00 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=r1ifEh3K;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pWWIE-0003WX-KN; Mon, 27 Feb 2023 00:43:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWI7-00038q-8U
 for qemu-arm@nongnu.org; Mon, 27 Feb 2023 00:43:15 -0500
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWI4-0004xK-63
 for qemu-arm@nongnu.org; Mon, 27 Feb 2023 00:43:14 -0500
Received: by mail-pg1-x534.google.com with SMTP id d6so2859333pgu.2
 for <qemu-arm@nongnu.org>; Sun, 26 Feb 2023 21:43:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mERf7MKXZT5xGumbcdn7TizHZXgv59+znRwTwlxucPE=;
 b=r1ifEh3KG71FigZ6/loi9WkzqdcvRgmE61jOctOKVy8A5w+JKHw7b0eqUCiv//lp2y
 2rFR8qU8Pce4JOQ8cSHmnmfMN1BPSmd+zI3yBnwBCXa4X43lVb41DaX/+cGh+EQ95aFZ
 LVqwhRKPmxjwKsq+gGyNtReCyri2Q0SNufabTbE29MzEmX7jwMYserDDeFpJ4tv5/u2d
 cEdUD0fi8IEAY27iLAWQZJjxbo3l0PKX2iO/GN+maKfPzL7qrsO0VmPENsprYE46HWHz
 1Vkpnxvvvsx32aHP9sHMa9IK3B3/s9i2eTcxyIW83BJ2WrCK3xS7+X/1N6UhQbacG4pE
 CHdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mERf7MKXZT5xGumbcdn7TizHZXgv59+znRwTwlxucPE=;
 b=uCFaQZS2ioi8Ts5cJVdKrG4avh5PMfMVv3iD+eS37QOvf5tCK/L8SMpr7a670BiMGr
 O+ztHBilQa7Ey2TPZJSByA9cIadicuiPPkI8/Y5Bf4+yD+z/S6lxa2C/fbwkgD+M/HHa
 ZSQWfWQwMm89+J9elh5JQDgXMP/MR11s3OoAx9GPypQENaPZjzV9Y4CM8+0kKb7RgJbE
 HWWSOGWCaVGChjz+8XKt8iaJ37OU2iBOyauP9wQ/wzz8bbDSc7j0q7Ozj1517JWzcU1P
 zRL2Rb1ObzdG8lQE67eV8AfmpNb+5MTadi2+sWvgrgjXlQcOG7EGefnhz5ET0ci8fsyg
 DX8A==
X-Gm-Message-State: AO0yUKVgyuLLH2tGHFBKhKdaO6H/4+X2a/IB4zRaT2bEz2fIVFArv3Fb
 NrpmmoiD8FTq5W9xc7EoCG8Djg==
X-Received: by 2002:a05:6a00:15cc:b0:5a8:51a3:7f69 with SMTP id
 o12-20020a056a0015cc00b005a851a37f69mr8331100pfu.2.1677476590507; 
 Sun, 26 Feb 2023 21:43:10 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 d10-20020aa7868a000000b005cdc64a287dsm3317137pfo.115.2023.02.26.21.43.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Feb 2023 21:43:10 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com
Subject: [PATCH 10/70] target/arm: Avoid tcg_const_ptr in
 handle_vec_simd_sqshrn
Date: Sun, 26 Feb 2023 19:41:33 -1000
Message-Id: <20230227054233.390271-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227054233.390271-1-richard.henderson@linaro.org>
References: <20230227054233.390271-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x534.google.com
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
X-TUID: YpSGZO5ZHNcT

It is easy enough to use mov instead of or-with-zero
and relying on the optimizer to fold away the or.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-a64.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 1726ec622d..16aa71451c 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -8459,7 +8459,7 @@ static void handle_vec_simd_sqshrn(DisasContext *s, bool is_scalar, bool is_q,
     tcg_rn = tcg_temp_new_i64();
     tcg_rd = tcg_temp_new_i64();
     tcg_rd_narrowed = tcg_temp_new_i32();
-    tcg_final = tcg_const_i64(0);
+    tcg_final = tcg_temp_new_i64();
 
     if (round) {
         tcg_round = tcg_constant_i64(1ULL << (shift - 1));
@@ -8473,7 +8473,11 @@ static void handle_vec_simd_sqshrn(DisasContext *s, bool is_scalar, bool is_q,
                                 false, is_u_shift, size+1, shift);
         narrowfn(tcg_rd_narrowed, cpu_env, tcg_rd);
         tcg_gen_extu_i32_i64(tcg_rd, tcg_rd_narrowed);
-        tcg_gen_deposit_i64(tcg_final, tcg_final, tcg_rd, esize * i, esize);
+        if (i == 0) {
+            tcg_gen_mov_i64(tcg_final, tcg_rd);
+        } else {
+            tcg_gen_deposit_i64(tcg_final, tcg_final, tcg_rd, esize * i, esize);
+        }
     }
 
     if (!is_q) {
-- 
2.34.1

