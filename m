Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp2943057lfq;
        Mon, 11 Jan 2021 11:38:53 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz4/T5ZD9p75EpVe4yTawUuACYZQjwxUV/jKxWUsNBPEcfhZ7SDgIj3rO5OfXALCrBCpDVY
X-Received: by 2002:a25:11c2:: with SMTP id 185mr2069251ybr.74.1610393933430;
        Mon, 11 Jan 2021 11:38:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1610393933; cv=none;
        d=google.com; s=arc-20160816;
        b=0m3R596xLd661PbSjR3KxeOkBUxMXEC1MaKuEVBpvnYaEpJtMW7VnwLmTIYRg2i9ON
         LToVam6iEbGt7Yvqmwl7WGT7QkwNt/Li5hGgHNZge8Rk0tbWfMZCCn6zQkte6Bmquy2k
         EzifubgG16LAqF6f+r6dC3aTppUNGGphFSGQY8mTY5IZudAkQpwDeYfa1ghTmqsBVAZl
         0bklKSMorI+eBIKUqfFEGPTFnViBH0mp+w1yYu830QZ+tCFE0DVtlAsO0Z4Blm+ATBUV
         oVm8alUltLOXGbnb2v49GnqQZpO53ym1cvrdBym3QXrkFsAOiMdr/KcwZ/NyqBGIMdxY
         Aysg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=mcXjxlPWR8jTh0X8knptdL/K1lbgLUw3V3hljuNtlzU=;
        b=EzxqeYDzLIDnVZITDA7PPkIEUEYA9gq7ZdD0o1L7azzpMARxZbmhuiw9NEXptHdmnA
         tBPCix+41P+y949tbpYx+vcoM1q3Qx1/4n1+OfAo9KAfTFUrvHdyyOP1rFTsYAC8yMiF
         +odpWVO3pGMtXVzem4oVVDqQZpwiKAk1LHtBYfuQnbLhr+nronwQvX0hiNljvi9kN3Pq
         Bytlqi4tFeKQanpJ+zhyyP8FdfquiDXE1IQgLj/rbWPHFooefzwrWi+XVSIXlmoXOFIN
         0INAI9aLItXf3QFiAdybpVqWganYWa0xeJ1w0L/1Q0Tp0alkm6LmIb/LwEAyQW50c062
         X7IA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=OH62gf8s;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m74si820079ybm.161.2021.01.11.11.38.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 11 Jan 2021 11:38:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=OH62gf8s;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kz31g-0005DR-K4
	for alex.bennee@linaro.org; Mon, 11 Jan 2021 14:38:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kz2SB-0006SQ-Bc
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 14:02:12 -0500
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c]:39109)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kz2S7-0006Xj-68
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 14:02:11 -0500
Received: by mail-pf1-x42c.google.com with SMTP id m6so498307pfm.6
 for <qemu-devel@nongnu.org>; Mon, 11 Jan 2021 11:02:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mcXjxlPWR8jTh0X8knptdL/K1lbgLUw3V3hljuNtlzU=;
 b=OH62gf8sUx9GXYA4RfAtUsMcj/cmC3IkrfbUG0YhYv0v75VIngnAw38uOzWnyMB3IH
 aF6+g2m7jh7vXfvuUJVIgUJcGrXtCYRQGZ5ow2CA83oE6QS1A9J3on5A5+84Qoisbfnf
 QB5cPIxfgYSkIMQjj6FDmIaD2pZ+JuybseO64bqIuoXtndr6xT0S0AL9UTd1F0wEYpYV
 3dFshtAjYC4j0ZSAQFeaISJzmaIBE3Jy/mmC9mF5dk71Tca5YWl8CAEFzhT849Ozfryk
 W0Kb5iOCk7/Gn9KaqgOgwmhXXqtcbHIf6bv0XoAfpzY3wSKFJsG+LwYuCIsE2p4AIGlZ
 C2Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mcXjxlPWR8jTh0X8knptdL/K1lbgLUw3V3hljuNtlzU=;
 b=lgp3qjsl75BJXSbe4yC0M4vfgd7oAPUWNNAX6Y9gw3VyNj7QhVCetd2PJvGx8r4ALi
 EN15BOdZMsJjY2kK4GZvP+1CViLSBfbsoTtYsYtYZDIEYa99lMH4XVgagpb8jxS5LA+V
 DN2IQK+e+GlIon2OZUgK5+b8o7ekwtHL0gcFSrnz+/Vf+yAkZNR+/0ROtvbbW+4JktRL
 xFxaahOlUD5Fgb5GhZFQHyB9Zd9Dmr4pasO3VC0SaDeugGi87YwayCbcVOwm+umV9Cua
 YPHm3F/E1Xfzga1uIy6aRFyEOWyfgVKwBpcKMF3FFKgdJ/xWDJD20BBUGIgSMvvu8jb/
 A4gw==
X-Gm-Message-State: AOAM533TfBSaSMSzsXE5M8PLW1yg3tIspfkzLxn5nSt+J/P7NEhCzhKp
 ksL6YE5JaSo72B1PopkpDKqM2rdf3d3M+A==
X-Received: by 2002:a65:6249:: with SMTP id q9mr967283pgv.82.1610391723980;
 Mon, 11 Jan 2021 11:02:03 -0800 (PST)
Received: from localhost.localdomain (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id n195sm350395pfd.169.2021.01.11.11.02.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jan 2021 11:02:03 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 27/30] target/arm: Use MemOp for size + endian in aa64
 vector ld/st
Date: Mon, 11 Jan 2021 09:01:10 -1000
Message-Id: <20210111190113.303726-28-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210111190113.303726-1-richard.henderson@linaro.org>
References: <20210111190113.303726-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5ryXEWiFtKYJ

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-a64.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 7f37f8bb12..296cd430ab 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -1140,24 +1140,24 @@ static void write_vec_element_i32(DisasContext *s, TCGv_i32 tcg_src,
 
 /* Store from vector register to memory */
 static void do_vec_st(DisasContext *s, int srcidx, int element,
-                      TCGv_i64 tcg_addr, int size, MemOp endian)
+                      TCGv_i64 tcg_addr, MemOp mop)
 {
     TCGv_i64 tcg_tmp = tcg_temp_new_i64();
 
-    read_vec_element(s, tcg_tmp, srcidx, element, size);
-    tcg_gen_qemu_st_i64(tcg_tmp, tcg_addr, get_mem_index(s), endian | size);
+    read_vec_element(s, tcg_tmp, srcidx, element, mop & MO_SIZE);
+    tcg_gen_qemu_st_i64(tcg_tmp, tcg_addr, get_mem_index(s), mop);
 
     tcg_temp_free_i64(tcg_tmp);
 }
 
 /* Load from memory to vector register */
 static void do_vec_ld(DisasContext *s, int destidx, int element,
-                      TCGv_i64 tcg_addr, int size, MemOp endian)
+                      TCGv_i64 tcg_addr, MemOp mop)
 {
     TCGv_i64 tcg_tmp = tcg_temp_new_i64();
 
-    tcg_gen_qemu_ld_i64(tcg_tmp, tcg_addr, get_mem_index(s), endian | size);
-    write_vec_element(s, tcg_tmp, destidx, element, size);
+    tcg_gen_qemu_ld_i64(tcg_tmp, tcg_addr, get_mem_index(s), mop);
+    write_vec_element(s, tcg_tmp, destidx, element, mop & MO_SIZE);
 
     tcg_temp_free_i64(tcg_tmp);
 }
@@ -3705,9 +3705,9 @@ static void disas_ldst_multiple_struct(DisasContext *s, uint32_t insn)
             for (xs = 0; xs < selem; xs++) {
                 int tt = (rt + r + xs) % 32;
                 if (is_store) {
-                    do_vec_st(s, tt, e, clean_addr, size, endian);
+                    do_vec_st(s, tt, e, clean_addr, size | endian);
                 } else {
-                    do_vec_ld(s, tt, e, clean_addr, size, endian);
+                    do_vec_ld(s, tt, e, clean_addr, size | endian);
                 }
                 tcg_gen_add_i64(clean_addr, clean_addr, tcg_ebytes);
             }
@@ -3856,9 +3856,9 @@ static void disas_ldst_single_struct(DisasContext *s, uint32_t insn)
         } else {
             /* Load/store one element per register */
             if (is_load) {
-                do_vec_ld(s, rt, index, clean_addr, scale, s->be_data);
+                do_vec_ld(s, rt, index, clean_addr, scale | s->be_data);
             } else {
-                do_vec_st(s, rt, index, clean_addr, scale, s->be_data);
+                do_vec_st(s, rt, index, clean_addr, scale | s->be_data);
             }
         }
         tcg_gen_add_i64(clean_addr, clean_addr, tcg_ebytes);
-- 
2.25.1

