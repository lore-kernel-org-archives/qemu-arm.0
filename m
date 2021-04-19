Received: by 2002:a19:ee0d:0:0:0:0:0 with SMTP id g13csp1502333lfb;
        Mon, 19 Apr 2021 13:53:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyJBTxK73/xJIlwG9A1OvjLjp4SxC86XrVO8s+Nl7O6A27OZscW3Nd740pchN0B0wZpcW8y
X-Received: by 2002:a92:c203:: with SMTP id j3mr17790813ilo.224.1618865589325;
        Mon, 19 Apr 2021 13:53:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618865589; cv=none;
        d=google.com; s=arc-20160816;
        b=DlZJ6C0FcPtJBLZhFM3tDAgEcfajsnzjw9cOI5pS1moAheIJiQ6reQhwlfvUu/ejyB
         jSbwkVJlLASYNNrpWzC039w8N8f5gOeDbBy6qnYj4RJm/xnv+deUjeU7Nr333AaSibIP
         qvj9keMfuITLRpqqy84zCuB3gj/nuDA8DdLVf0BHSejJIEk7zJ2tVXgqQboLxZ/82W4k
         KQ19CREQEXrSABp/IXO0D35M9E2AV4+Bu/WpxppralDZiMcdn26eauuU3KziF09kppNT
         zz0ERyPbLxSdMZyAYhYPzxcxy9Lr6fJ2F8tGAM6mG6fj1/NZKG8/P5dfOeSF/Lk2/deJ
         kTAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=JvIEukWRJcec2HtgegM57M5MObIvx3MKZPreWQgWndE=;
        b=wgT/tH3LjKyf04hCIp+uuVp/wjF6ny9bLmwPcTvvPD/5axTMSJC6e+2u6W3FnQ44ee
         u1JfP61FR3FTJm2pDXA9cAmlpUWqN+BZXGFUg5Y9J5VjrXPu8eZLgKDAhNQPRsoXRdNw
         9NZXgB80r2zEjAeIFXsNBpRZ8FwNc4olNlXvE7CWuhtQH8eb11UInd6BPw2elBMo3Xs6
         UIANXnjI8niv5tP7BPzxsCbuFCbiBISKWF6lu70ej+N22q3zd+0jTPOfqmQ9GgBnzdav
         wObJsvMDJ+HiIyekY9UdF2zk0sjiEKtzc+YKoocWtqKQd0vkMeSV3LZuD0/rLPsaIgUy
         6AzA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=eYynPLC6;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i9si17992411iog.54.2021.04.19.13.53.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 19 Apr 2021 13:53:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=eYynPLC6;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lYatI-0006kx-LV
	for alex.bennee@linaro.org; Mon, 19 Apr 2021 16:53:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lYaQx-0007wU-6K
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 16:23:51 -0400
Received: from mail-qk1-x733.google.com ([2607:f8b0:4864:20::733]:45658)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lYaQu-0002mS-DQ
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 16:23:50 -0400
Received: by mail-qk1-x733.google.com with SMTP id d19so1478383qkk.12
 for <qemu-devel@nongnu.org>; Mon, 19 Apr 2021 13:23:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JvIEukWRJcec2HtgegM57M5MObIvx3MKZPreWQgWndE=;
 b=eYynPLC6eqjSEb7leR9UU98ZygEbW4PaWv/lFMkBtz0QMAfJ7RmfLtyCn2fITQWDjJ
 qYdHj7glcn2hJ0T+PcLVdNlNnYGCgyPX96FSoQ3sLnbG4XKl1dKwMqHGQNpEk1sEFe0k
 EMHqdJ8944hCd+sMZ+SYB2eMWstnhYpah3uBoR/6nO7d9XUne7ixXwV6I+NZf3ICd9HT
 rxSvStBrektZAM25L/R8Z6EL5h+UVqeaRRcgVVJqvY4dTRHrdpXajrHV42gv2Gn0H9rJ
 MXVMWbMmBtynJa08U2tRpy3iUrLnMoM5hZgwjM3gX2a/7UBavLHWBEibNQlVIU8uefzI
 VvPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JvIEukWRJcec2HtgegM57M5MObIvx3MKZPreWQgWndE=;
 b=t5Zne1nyawz5llBBbvAM2bYXoxQ5rRQoTy9leMHybr3VfVGrufcNEq+ptg4FdGox8R
 JaNsEnuxJAunxkob3DtxWbMw7gmYPIogqgzM4VdfQuOc8OYBcldNNa4yA+rO5t37tFp4
 9bixFRXNYvNtP7umOFjNBggbwt0fcb8ITaoHIObry3tL7YxDu7w0wtHjScXiDZHZ6FL8
 tdtdWV5VFqT3kMakUn3mKNY0tYlnvJPwFPU15N4sPadq6hS2bGiV0A8e/kSKLyJmPRSv
 MsZYP2gWHvCjr5Dh9nBSG80PEew+wdltdEZ4QHx58w8jB/OGyFeQY8Gx7D5sYfVmVIzn
 Kcew==
X-Gm-Message-State: AOAM532RzyWXg1chyNg49CoUPt/j9WJ7s9I9gHy2QvXovCz47MJc7lbG
 NE3N0S6N5VXmJQtcq/rz3dzP4QqyK9toV85i
X-Received: by 2002:a37:76c2:: with SMTP id
 r185mr13477618qkc.204.1618863827272; 
 Mon, 19 Apr 2021 13:23:47 -0700 (PDT)
Received: from localhost.localdomain ([2607:fb90:80c7:aba4:3594:91a:8889:c77a])
 by smtp.gmail.com with ESMTPSA id c23sm10007835qtm.46.2021.04.19.13.23.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Apr 2021 13:23:47 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 26/31] target/arm: Use finalize_memop for aa64 fpr
 load/store
Date: Mon, 19 Apr 2021 13:22:52 -0700
Message-Id: <20210419202257.161730-27-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210419202257.161730-1-richard.henderson@linaro.org>
References: <20210419202257.161730-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::733;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x733.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: y2UxZN08j/fP

For 128-bit load/store, use 16-byte alignment.  This
requires that we perform the two operations in the
correct order so that we generate the alignment fault
before modifying memory.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-a64.c | 42 +++++++++++++++++++++++---------------
 1 file changed, 26 insertions(+), 16 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index f2995d2b74..b90d6880e7 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -963,25 +963,33 @@ static void do_gpr_ld(DisasContext *s, TCGv_i64 dest, TCGv_i64 tcg_addr,
 static void do_fp_st(DisasContext *s, int srcidx, TCGv_i64 tcg_addr, int size)
 {
     /* This writes the bottom N bits of a 128 bit wide vector to memory */
-    TCGv_i64 tmp = tcg_temp_new_i64();
-    tcg_gen_ld_i64(tmp, cpu_env, fp_reg_offset(s, srcidx, MO_64));
+    TCGv_i64 tmplo = tcg_temp_new_i64();
+    MemOp mop;
+
+    tcg_gen_ld_i64(tmplo, cpu_env, fp_reg_offset(s, srcidx, MO_64));
+
     if (size < 4) {
-        tcg_gen_qemu_st_i64(tmp, tcg_addr, get_mem_index(s),
-                            s->be_data + size);
+        mop = finalize_memop(s, size);
+        tcg_gen_qemu_st_i64(tmplo, tcg_addr, get_mem_index(s), mop);
     } else {
         bool be = s->be_data == MO_BE;
         TCGv_i64 tcg_hiaddr = tcg_temp_new_i64();
+        TCGv_i64 tmphi = tcg_temp_new_i64();
 
+        tcg_gen_ld_i64(tmphi, cpu_env, fp_reg_hi_offset(s, srcidx));
+
+        mop = s->be_data | MO_Q;
+        tcg_gen_qemu_st_i64(be ? tmphi : tmplo, tcg_addr, get_mem_index(s),
+                            mop | (s->align_mem ? MO_ALIGN_16 : 0));
         tcg_gen_addi_i64(tcg_hiaddr, tcg_addr, 8);
-        tcg_gen_qemu_st_i64(tmp, be ? tcg_hiaddr : tcg_addr, get_mem_index(s),
-                            s->be_data | MO_Q);
-        tcg_gen_ld_i64(tmp, cpu_env, fp_reg_hi_offset(s, srcidx));
-        tcg_gen_qemu_st_i64(tmp, be ? tcg_addr : tcg_hiaddr, get_mem_index(s),
-                            s->be_data | MO_Q);
+        tcg_gen_qemu_st_i64(be ? tmplo : tmphi, tcg_hiaddr,
+                            get_mem_index(s), mop);
+
         tcg_temp_free_i64(tcg_hiaddr);
+        tcg_temp_free_i64(tmphi);
     }
 
-    tcg_temp_free_i64(tmp);
+    tcg_temp_free_i64(tmplo);
 }
 
 /*
@@ -992,10 +1000,11 @@ static void do_fp_ld(DisasContext *s, int destidx, TCGv_i64 tcg_addr, int size)
     /* This always zero-extends and writes to a full 128 bit wide vector */
     TCGv_i64 tmplo = tcg_temp_new_i64();
     TCGv_i64 tmphi = NULL;
+    MemOp mop;
 
     if (size < 4) {
-        MemOp memop = s->be_data + size;
-        tcg_gen_qemu_ld_i64(tmplo, tcg_addr, get_mem_index(s), memop);
+        mop = finalize_memop(s, size);
+        tcg_gen_qemu_ld_i64(tmplo, tcg_addr, get_mem_index(s), mop);
     } else {
         bool be = s->be_data == MO_BE;
         TCGv_i64 tcg_hiaddr;
@@ -1003,11 +1012,12 @@ static void do_fp_ld(DisasContext *s, int destidx, TCGv_i64 tcg_addr, int size)
         tmphi = tcg_temp_new_i64();
         tcg_hiaddr = tcg_temp_new_i64();
 
+        mop = s->be_data | MO_Q;
+        tcg_gen_qemu_ld_i64(be ? tmphi : tmplo, tcg_addr, get_mem_index(s),
+                            mop | (s->align_mem ? MO_ALIGN_16 : 0));
         tcg_gen_addi_i64(tcg_hiaddr, tcg_addr, 8);
-        tcg_gen_qemu_ld_i64(tmplo, be ? tcg_hiaddr : tcg_addr, get_mem_index(s),
-                            s->be_data | MO_Q);
-        tcg_gen_qemu_ld_i64(tmphi, be ? tcg_addr : tcg_hiaddr, get_mem_index(s),
-                            s->be_data | MO_Q);
+        tcg_gen_qemu_ld_i64(be ? tmplo : tmphi, tcg_hiaddr,
+                            get_mem_index(s), mop);
         tcg_temp_free_i64(tcg_hiaddr);
     }
 
-- 
2.25.1

