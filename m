Received: by 2002:ac2:5e6c:0:0:0:0:0 with SMTP id a12csp657615lfr;
        Fri, 16 Apr 2021 12:12:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyh4E8mOtCY/MAcuqPRbNDd5MdvpN8Hkq0N9mbD5WKjf0b2469W15JFF2zUGVKHVLBYIyDe
X-Received: by 2002:aca:f4c5:: with SMTP id s188mr7454569oih.129.1618600375817;
        Fri, 16 Apr 2021 12:12:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618600375; cv=none;
        d=google.com; s=arc-20160816;
        b=ynWE3bGiyhl6jWSGxWwSPwjHJ9T9cb1fkKusgrBu2kiSFG2vRV10NMckP8AvGRIB5n
         NRBB6wyYSsJDz/QAeT2/BTxtBREhhFCYMLVYG1gWSa2cuS0FL5kvuWyziOlJLuXKMnsr
         tn54AtAHh+gvM3mQvMXKXQmgLUAmsTUL7VwldgFf0TNO0WJL4jtFREkdX3DZLW3pze9H
         oUPN4gfJi503s1FcYlUw0dEbmLcbpBay5hrKYO3fjXTmg2uJNRjlyT1IpsHT2z+eZVpZ
         N9Lwue8shNkIDSvUmVlWLV53sB8iqobdELOIqgrLhXDVqIl49FjYCu3VW2FZyPqq2aIc
         qEsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=JvIEukWRJcec2HtgegM57M5MObIvx3MKZPreWQgWndE=;
        b=MRYAuBGX3XsW5NlyvVK0zfO1tUf3P5QDYnFY3AdrGc3EeSZJs92I7A61uihZL4B/45
         /Bg/k2joRPL81ta609euZIGmjhgFSOxlHvrZT4cCQysAwuemUs0Z4ijkgMIZDzSrvBJe
         KTueEUIL4Mec82mGz7kUA2oWIRJY7u3hv0IaJc11kE+UrctPxdjME9FFhXbtiQic4CkJ
         ByydwV0PaTrbHatokRlNaEthyacxtmNwndiPOBjx5sHXjsWVkcDvHErJ4M8w5kr+/GuS
         c3TaSXeXgzYX54D+t0oO8kTJoVLuLVSxIzqL0d0luYvFYacTV190N+cTChVoSWOO3wVT
         5+1Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=yFUMFO9x;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q11si4401990ota.13.2021.04.16.12.12.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 16 Apr 2021 12:12:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=yFUMFO9x;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lXTtf-00029A-2o
	for alex.bennee@linaro.org; Fri, 16 Apr 2021 15:12:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXTi2-00043K-Nh
 for qemu-arm@nongnu.org; Fri, 16 Apr 2021 15:00:56 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:34337)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXThb-0004TL-Tg
 for qemu-arm@nongnu.org; Fri, 16 Apr 2021 15:00:52 -0400
Received: by mail-pl1-x631.google.com with SMTP id t22so14153104ply.1
 for <qemu-arm@nongnu.org>; Fri, 16 Apr 2021 12:00:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JvIEukWRJcec2HtgegM57M5MObIvx3MKZPreWQgWndE=;
 b=yFUMFO9xoRJ83pGRrwjhUbC3pZHO4Lc4Z6IZI7XqTZhoqpWMUVcUpLy9Q9UbXTihuz
 HDNQJeuJFTNwU6vNPbe8WI1/ZXYgJ68jspnz8r+wOae4qNMiJ9MKPCtMGHJpNyW0CjyB
 ZSLESLcQAuD6ykfybyS1Ll6OapdAclWQ8oRA2+6zKFx5oXyfzdCDPjR3k4odubUPc1aF
 bJkE/ZmLIv41Hryj0MeBec2D7UKQKWiVnnXU/CABxMTQPv7kC7YHGpXkyr7cYQJMCFbI
 bq4H2VrahfFeajoFS7mU1ni9ctIoVVrdqocEjfyj/2e6VFDN4CRNnz1w320WeauC1uU9
 XSWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JvIEukWRJcec2HtgegM57M5MObIvx3MKZPreWQgWndE=;
 b=CPTnUp/8SJSBa1JpfULm0eiS6SVJJWe+JuHC3Tk0PyPIADxlAFskcQNuBzTdPajhHz
 46oTKFG2ygGc14VKhhODuOi/45vWWaGlv+q34gp8FSaRqf8d+rABViQb/wtnC15GjvEH
 LZrxuzZKXyeXc/uK+d+vOQGHY3EyNL6zbIuawXbeaD63fAsX5QPtmvmVD/ubMzWulwJ+
 meGqEWdt08B7BjZ3EFNOA2MiOtWEt2gdyuxpobL4S6L5uDklTwob8QnL60eTjj4Xk2D6
 RL8hO4ZZwgoG09uTM+LYG6ECuGw5rYn2Vtsnkz/LATrWEZQqinqkVmbQUw0GTJopVlsf
 K0rg==
X-Gm-Message-State: AOAM533quAirKoumqvOZRH4RHsKChe+YtKrFt7VDB2XnIZ23lV/v9CGz
 lpvSb2QmU1LVDjZGkRY7DAnR3X2JCJfzoA==
X-Received: by 2002:a17:90b:2291:: with SMTP id
 kx17mr10970936pjb.79.1618599625568; 
 Fri, 16 Apr 2021 12:00:25 -0700 (PDT)
Received: from localhost.localdomain ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id d7sm1988337pfv.197.2021.04.16.12.00.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Apr 2021 12:00:25 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 25/30] target/arm: Use finalize_memop for aa64 fpr
 load/store
Date: Fri, 16 Apr 2021 11:59:54 -0700
Message-Id: <20210416185959.1520974-26-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210416185959.1520974-1-richard.henderson@linaro.org>
References: <20210416185959.1520974-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
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
X-TUID: GhevHF6JVJ7/

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

