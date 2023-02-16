Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp77924ejb;
        Wed, 15 Feb 2023 19:09:17 -0800 (PST)
X-Google-Smtp-Source: AK7set+98zml2uxbUVH6tbJ2CQBdddCZyup/3eYnb/hfC2kz07QMs+JlcNHAwSJr6cbVGXS4nkwG
X-Received: by 2002:ad4:5bc4:0:b0:56e:bfda:a138 with SMTP id t4-20020ad45bc4000000b0056ebfdaa138mr7845563qvt.10.1676516957718;
        Wed, 15 Feb 2023 19:09:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676516957; cv=none;
        d=google.com; s=arc-20160816;
        b=Xr3vzlUUQ/DFCSdlFKzZGxbyLsh7naxdvIdhLdzE95eZrFjKgk4BTHqGMlDe/Hz6UW
         uugLlek5mMpt/fEhg5jYrttu2sWGHN13pgwiXNotYRumFE70PneW4W9VYYWqIhFSzjeb
         RjlgfRcLasuJ4az6v/mCII1bpnrjNs75iTxgG6t+8VucWMarU2+VOXv16jDwEmveoOre
         smBtWoO/U4DxC/JwBu0/bRjWh4UlMBXhbu3m+aOOr6p+PtJpc1p26gb1rPXzKmlMYcld
         wqwPcAm5Tb6BEMJ18HA87XBY+sKKb4iCc3aZrYoicDEJRbmdl5tYiD69OYyb2/81wghQ
         O0kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=5MWcfMPzd9PL4JEvdoqxUVWO14/+wVWQFzje3SFl6vk=;
        b=w5Eo2mgCQrgvXHyJka81uqXPbthOpvdCFJ9BSpijgE6vCbvyEItrKs9obw5iPFj5Lh
         hNktKj1cMgIoEAsvZirtELNGVVcpfdHkazwivml//+5fHQX0cfH0cLUqBU4R19BCuUZu
         U92GiudSrN2eD9HhivBV+F2Jf0m3qJK+K/S6Ed5zWA+gjSiseNYadaejMltq4szQGWB7
         nJEINntNfPcGdQyiYmHQg8IVpm8XOF65XB5v4cn1Ggxt6cIy87iYJ80/tQAcv8jhGIPg
         N3hOI/UsOuDognkvR1pOsIF16Udf9MeGvxPCzkEo1aQkWZHejhOAnEyCfgxQKQmD+gmA
         XeBQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rrKM1dFK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h22-20020a0cab16000000b0053a300cb14fsi107292qvb.402.2023.02.15.19.09.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 15 Feb 2023 19:09:17 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rrKM1dFK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pSUds-0007GP-E7; Wed, 15 Feb 2023 22:09:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pSUdr-0007FC-6A
 for qemu-arm@nongnu.org; Wed, 15 Feb 2023 22:09:03 -0500
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pSUdo-00004x-N3
 for qemu-arm@nongnu.org; Wed, 15 Feb 2023 22:09:02 -0500
Received: by mail-pg1-x530.google.com with SMTP id 78so422453pgb.8
 for <qemu-arm@nongnu.org>; Wed, 15 Feb 2023 19:09:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5MWcfMPzd9PL4JEvdoqxUVWO14/+wVWQFzje3SFl6vk=;
 b=rrKM1dFKYaWD2B+eYgQhlwH5tqQxEIEHlQH/NS4evGCluACblzjNjn+Jz1CySwyXm4
 NRJXT0ARKrfx3YVH2Qq7YTT2msE7HW5ROMnWuBawqrwdTHsdONHi2mNcGqbF0E6jLvae
 Ig4iCJG8MGUxwwKsaJuN0+JoLvMeX09/+3lpJ8x3pR0x85gYSi2wkcUl2s7zXbhC9Vpx
 dQVoEFGC6zom0LF9R0YHPCxbBjIvdm/k7rUsOPBTz0ICmNLzbIfcb7fP/J8580i42ZIm
 FetJDS0WbRBTl6vS9c8PxZ7OqjoJ4eoXE2o6mWE7bt6vnYwnf0dVo5rarrhak701Hi4w
 nXPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5MWcfMPzd9PL4JEvdoqxUVWO14/+wVWQFzje3SFl6vk=;
 b=icnBi8Hqw7RqCzbmo2npwZ5ZACQMU/wdLm8UU4rkTLZiR0iK7tMHsCKTdW8axzncJO
 m1/TAp2dz0mpMfYv2DYMN+m5C3Lfm1lIMbqOl/gTcNgqffV7tM7JKtfhq9KtwcIHLbam
 l1LAx3N/On5DPy/HkwH8CpmRHsXTg30ODqKHW6xZyLedyXoSmS71SDu9Vc6VUvA6CE1Q
 DF8IDYWmad+3OaJ8Gw3eq6AAPr1/0RR+l0yq1ED2IG25upvcN5xbETSF5kJin+MvM2c6
 9sGzYyVpUDhmvAR8fgS9zRXI2JTzjrXBi1ASRw1p/YpbzS+fp21i5t7AqUyPaQsUX35g
 Dv6A==
X-Gm-Message-State: AO0yUKV0xrXyERmEpydjLa/F37iUOo4cejad9WD76zTIf6Nt4vn+YLS2
 5CXeHCNJ/Qz7H+IOHVAc04Pdu6UM+RFhjvk1eQY=
X-Received: by 2002:aa7:9ad1:0:b0:5a8:a82a:bd8b with SMTP id
 x17-20020aa79ad1000000b005a8a82abd8bmr3456896pfp.20.1676516939312; 
 Wed, 15 Feb 2023 19:08:59 -0800 (PST)
Received: from stoup.. (rrcs-74-87-59-234.west.biz.rr.com. [74.87.59.234])
 by smtp.gmail.com with ESMTPSA id
 i25-20020aa79099000000b005810a54fdefsm79051pfa.114.2023.02.15.19.08.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Feb 2023 19:08:58 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v1 01/19] target/arm: Make cpu_exclusive_high hold the high
 bits
Date: Wed, 15 Feb 2023 17:08:36 -1000
Message-Id: <20230216030854.1212208-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230216030854.1212208-1-richard.henderson@linaro.org>
References: <20230216030854.1212208-1-richard.henderson@linaro.org>
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
X-TUID: bj+AkmrGLph7

We currently treat cpu_exclusive_high as containing the
second word of LDXP, even though that word is not "high"
in big-endian mode.  Swap things around so that it is.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-a64.c | 54 ++++++++++++++++++++------------------
 1 file changed, 29 insertions(+), 25 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index da9f877476..78a2141224 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -2547,17 +2547,28 @@ static void gen_load_exclusive(DisasContext *s, int rt, int rt2,
         } else {
             /* The pair must be single-copy atomic for *each* doubleword, not
                the entire quadword, however it must be quadword aligned.  */
+            TCGv_i64 t0 = tcg_temp_new_i64();
+            TCGv_i64 t1 = tcg_temp_new_i64();
+
             memop |= MO_64;
-            tcg_gen_qemu_ld_i64(cpu_exclusive_val, addr, idx,
-                                memop | MO_ALIGN_16);
+            tcg_gen_qemu_ld_i64(t0, addr, idx, memop | MO_ALIGN_16);
 
-            TCGv_i64 addr2 = tcg_temp_new_i64();
-            tcg_gen_addi_i64(addr2, addr, 8);
-            tcg_gen_qemu_ld_i64(cpu_exclusive_high, addr2, idx, memop);
-            tcg_temp_free_i64(addr2);
+            tcg_gen_addi_i64(t1, addr, 8);
+            tcg_gen_qemu_ld_i64(t1, t1, idx, memop);
 
-            tcg_gen_mov_i64(cpu_reg(s, rt), cpu_exclusive_val);
-            tcg_gen_mov_i64(cpu_reg(s, rt2), cpu_exclusive_high);
+            if (s->be_data == MO_LE) {
+                tcg_gen_mov_i64(cpu_exclusive_val, t0);
+                tcg_gen_mov_i64(cpu_exclusive_high, t1);
+            } else {
+                tcg_gen_mov_i64(cpu_exclusive_high, t0);
+                tcg_gen_mov_i64(cpu_exclusive_val, t1);
+            }
+
+            tcg_gen_mov_i64(cpu_reg(s, rt), t0);
+            tcg_gen_mov_i64(cpu_reg(s, rt2), t1);
+
+            tcg_temp_free_i64(t0);
+            tcg_temp_free_i64(t1);
         }
     } else {
         memop |= size | MO_ALIGN;
@@ -2604,36 +2615,29 @@ static void gen_store_exclusive(DisasContext *s, int rd, int rt, int rt2,
         } else {
             TCGv_i128 t16 = tcg_temp_new_i128();
             TCGv_i128 c16 = tcg_temp_new_i128();
-            TCGv_i64 a, b;
+            TCGv_i64 lo, hi;
 
             if (s->be_data == MO_LE) {
                 tcg_gen_concat_i64_i128(t16, cpu_reg(s, rt), cpu_reg(s, rt2));
-                tcg_gen_concat_i64_i128(c16, cpu_exclusive_val,
-                                        cpu_exclusive_high);
             } else {
                 tcg_gen_concat_i64_i128(t16, cpu_reg(s, rt2), cpu_reg(s, rt));
-                tcg_gen_concat_i64_i128(c16, cpu_exclusive_high,
-                                        cpu_exclusive_val);
             }
+            tcg_gen_concat_i64_i128(c16, cpu_exclusive_val, cpu_exclusive_high);
 
             tcg_gen_atomic_cmpxchg_i128(t16, cpu_exclusive_addr, c16, t16,
                                         get_mem_index(s),
                                         MO_128 | MO_ALIGN | s->be_data);
             tcg_temp_free_i128(c16);
 
-            a = tcg_temp_new_i64();
-            b = tcg_temp_new_i64();
-            if (s->be_data == MO_LE) {
-                tcg_gen_extr_i128_i64(a, b, t16);
-            } else {
-                tcg_gen_extr_i128_i64(b, a, t16);
-            }
+            lo = tcg_temp_new_i64();
+            hi = tcg_temp_new_i64();
+            tcg_gen_extr_i128_i64(lo, hi, t16);
 
-            tcg_gen_xor_i64(a, a, cpu_exclusive_val);
-            tcg_gen_xor_i64(b, b, cpu_exclusive_high);
-            tcg_gen_or_i64(tmp, a, b);
-            tcg_temp_free_i64(a);
-            tcg_temp_free_i64(b);
+            tcg_gen_xor_i64(lo, lo, cpu_exclusive_val);
+            tcg_gen_xor_i64(hi, hi, cpu_exclusive_high);
+            tcg_gen_or_i64(tmp, lo, hi);
+            tcg_temp_free_i64(lo);
+            tcg_temp_free_i64(hi);
             tcg_temp_free_i128(t16);
 
             tcg_gen_setcondi_i64(TCG_COND_NE, tmp, tmp, 0);
-- 
2.34.1

