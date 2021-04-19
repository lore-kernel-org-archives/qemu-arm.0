Received: by 2002:a19:ee0d:0:0:0:0:0 with SMTP id g13csp1496216lfb;
        Mon, 19 Apr 2021 13:41:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyRxtiCGfiN6WdBsBTN/urF6J5x4Vf3LZmBwH6+6P+OAjnFh+KqiGs/gKrgue6j0gJDj/iH
X-Received: by 2002:a05:6602:1223:: with SMTP id z3mr6648743iot.36.1618864912548;
        Mon, 19 Apr 2021 13:41:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618864912; cv=none;
        d=google.com; s=arc-20160816;
        b=b9PChyhhQ9+ncwsIcwB9aaqR28UG88+lD1gZ5LlRSNqS3LsRciM61aBhT/Gesjpo8p
         Fl+woPQOnESUioVR1g8s3s+5fCCvSzTadtVBdHxA3IeLmddSw6RfLOuNrlT6N5wPGwMs
         lPJty64SLsdhdPY450LZ9PACif5kOyXCtxFfe5cKehiKlFxU88zYF4xGFR33peci2bgl
         9I06o2lXlXGeIqvT9Fu7at1etF1qrT+u68T+nSArFL2iXqFfKJ324RASrt/IkwvNa/wR
         qoxarpCXFSG0k0MU86m8U4ZzyYPgx8wtyxU2mGVkoYjlySd2Ivob/XGHLft4J9AKohpG
         214g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=PxZGDd3JlBDpDCLbYsDYq94kYNQcx3dkagpb2Omjk8Q=;
        b=jcvMlU8xHGkusPGL3OagTkVMKi63AWgHv3/3p22ZVdxkJSsP6bdOvigffv8y0vzyMd
         Y9j9oVmgwE6BliOAN+Nwjn0BpGiFo7cvyoGc95T4Tj7yQh+PyDbItNpoxTLBDRXzo7bC
         kXir72b7RYF1qpeVmBR68/k5neWfzJISFARhTPV+FTWC/uxCoFIs+zmWXQ7bZoSod4UY
         5ywKNw9Okz//IT/VuYfmQyDkl9AoK5KHTZcx1N9XKRcY4ZzqIj1LhUhFxfpHkbzG4+92
         KblExKgW/O9a6KEbCJdLe3IrsAPn9jvtfqX+83tFzRxCWfxmC75xlhz8LEPsxS6DKDZC
         fUwg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=dJrYzQUj;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x8si17195364jas.59.2021.04.19.13.41.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 19 Apr 2021 13:41:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=dJrYzQUj;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lYaiN-0000xy-Rd
	for alex.bennee@linaro.org; Mon, 19 Apr 2021 16:41:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lYaQd-0007Sa-1Q
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 16:23:31 -0400
Received: from mail-qv1-xf2e.google.com ([2607:f8b0:4864:20::f2e]:33472)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lYaQa-0002b5-JN
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 16:23:30 -0400
Received: by mail-qv1-xf2e.google.com with SMTP id ef17so11886449qvb.0
 for <qemu-devel@nongnu.org>; Mon, 19 Apr 2021 13:23:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PxZGDd3JlBDpDCLbYsDYq94kYNQcx3dkagpb2Omjk8Q=;
 b=dJrYzQUjMhz8ExSmjRETVN/Spn7xYrtUcgOvv8urWeQamODO3t86k7U6T22XcMT3ri
 s9wN8XprHN/Qil5glODuWjce+sVu6MLS+DyyeXauJT936HijRbS5C9t9o9tMPt+wqGih
 wVoHkRj+/o0hKSnBOo+UG0iRMguG2BggqRkYK0Wob0Z6zq/2pKcWBGGr+yh4vgqLOS7d
 L4M7q9oqHhgwbfSqNMYhcrYmUi7SL+8dwSL+BpS4HubuRCNRd6tlqxIUzszflhqTA3vY
 5cC6TVxtNaZIqc7lgyIz9+VCaEEyl0aid7EOQ3r4N5/q3wojnVvIbGjkXU0maVAVIHdP
 oDPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PxZGDd3JlBDpDCLbYsDYq94kYNQcx3dkagpb2Omjk8Q=;
 b=IWWqKln2AjT0iadJg/KEpAmAvrIHIjaz/2OwzGcxB1a6iMIw7nl/5lftDijqpRZcdP
 ywV/gFGgM5boMwvkAcOY8YH3FMJFesyUKGNm3izll2uRK0CSZFijZDTPE+QmnihnI5cE
 uXnkEVE5lb2LXl0S6NvJ43QZqNKFL/tTbfZ63eXylzhUam19ars0d5kIOKRI6gZ5Qyi8
 GS8mFSIB8SXr/DoNkFOtUBr97j0/LOfnx2xHHZfKJ4P7uTlJXBPwazHYm0ThpxhVBKgx
 TAOfrG23tvq5L96w0pMK7YPWMb/FdouGhz2DaeKnm+P1KYoUf+ctS9nEsxJ2ah5deHDa
 XyAw==
X-Gm-Message-State: AOAM531vsz3k3+GgzvP2dZwOTKQGrsblfkns84iH7CmnhbkKhyYtNNxf
 hnraFECBv88lPo8HeIzZrq+42hcppS7ieSoh
X-Received: by 2002:ad4:522b:: with SMTP id r11mr23537378qvq.6.1618863807824; 
 Mon, 19 Apr 2021 13:23:27 -0700 (PDT)
Received: from localhost.localdomain ([2607:fb90:80c7:aba4:3594:91a:8889:c77a])
 by smtp.gmail.com with ESMTPSA id c23sm10007835qtm.46.2021.04.19.13.23.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Apr 2021 13:23:27 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 15/31] target/arm: Enforce word alignment for LDRD/STRD
Date: Mon, 19 Apr 2021 13:22:41 -0700
Message-Id: <20210419202257.161730-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210419202257.161730-1-richard.henderson@linaro.org>
References: <20210419202257.161730-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2e;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf2e.google.com
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
X-TUID: kL5TM1lFIYfa

Buglink: https://bugs.launchpad.net/qemu/+bug/1905356
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 6171347d6d..1b0951c45b 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -6512,13 +6512,13 @@ static bool trans_LDRD_rr(DisasContext *s, arg_ldst_rr *a)
     addr = op_addr_rr_pre(s, a);
 
     tmp = tcg_temp_new_i32();
-    gen_aa32_ld_i32(s, tmp, addr, mem_idx, MO_UL);
+    gen_aa32_ld_i32(s, tmp, addr, mem_idx, MO_UL | MO_ALIGN);
     store_reg(s, a->rt, tmp);
 
     tcg_gen_addi_i32(addr, addr, 4);
 
     tmp = tcg_temp_new_i32();
-    gen_aa32_ld_i32(s, tmp, addr, mem_idx, MO_UL);
+    gen_aa32_ld_i32(s, tmp, addr, mem_idx, MO_UL | MO_ALIGN);
     store_reg(s, a->rt + 1, tmp);
 
     /* LDRD w/ base writeback is undefined if the registers overlap.  */
@@ -6541,13 +6541,13 @@ static bool trans_STRD_rr(DisasContext *s, arg_ldst_rr *a)
     addr = op_addr_rr_pre(s, a);
 
     tmp = load_reg(s, a->rt);
-    gen_aa32_st_i32(s, tmp, addr, mem_idx, MO_UL);
+    gen_aa32_st_i32(s, tmp, addr, mem_idx, MO_UL | MO_ALIGN);
     tcg_temp_free_i32(tmp);
 
     tcg_gen_addi_i32(addr, addr, 4);
 
     tmp = load_reg(s, a->rt + 1);
-    gen_aa32_st_i32(s, tmp, addr, mem_idx, MO_UL);
+    gen_aa32_st_i32(s, tmp, addr, mem_idx, MO_UL | MO_ALIGN);
     tcg_temp_free_i32(tmp);
 
     op_addr_rr_post(s, a, addr, -4);
@@ -6649,13 +6649,13 @@ static bool op_ldrd_ri(DisasContext *s, arg_ldst_ri *a, int rt2)
     addr = op_addr_ri_pre(s, a);
 
     tmp = tcg_temp_new_i32();
-    gen_aa32_ld_i32(s, tmp, addr, mem_idx, MO_UL);
+    gen_aa32_ld_i32(s, tmp, addr, mem_idx, MO_UL | MO_ALIGN);
     store_reg(s, a->rt, tmp);
 
     tcg_gen_addi_i32(addr, addr, 4);
 
     tmp = tcg_temp_new_i32();
-    gen_aa32_ld_i32(s, tmp, addr, mem_idx, MO_UL);
+    gen_aa32_ld_i32(s, tmp, addr, mem_idx, MO_UL | MO_ALIGN);
     store_reg(s, rt2, tmp);
 
     /* LDRD w/ base writeback is undefined if the registers overlap.  */
@@ -6688,13 +6688,13 @@ static bool op_strd_ri(DisasContext *s, arg_ldst_ri *a, int rt2)
     addr = op_addr_ri_pre(s, a);
 
     tmp = load_reg(s, a->rt);
-    gen_aa32_st_i32(s, tmp, addr, mem_idx, MO_UL);
+    gen_aa32_st_i32(s, tmp, addr, mem_idx, MO_UL | MO_ALIGN);
     tcg_temp_free_i32(tmp);
 
     tcg_gen_addi_i32(addr, addr, 4);
 
     tmp = load_reg(s, rt2);
-    gen_aa32_st_i32(s, tmp, addr, mem_idx, MO_UL);
+    gen_aa32_st_i32(s, tmp, addr, mem_idx, MO_UL | MO_ALIGN);
     tcg_temp_free_i32(tmp);
 
     op_addr_ri_post(s, a, addr, -4);
-- 
2.25.1

