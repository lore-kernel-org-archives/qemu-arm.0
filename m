Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp1132024wrp;
        Wed, 4 Sep 2019 12:53:12 -0700 (PDT)
X-Google-Smtp-Source: APXvYqw9Wwxn/E3xKvcskoE5UNtf3mY1ByYj8806yyhPt0owVl9MXGnxTCd2aowsCgZJNS68rYHT
X-Received: by 2002:ac8:714f:: with SMTP id h15mr5179720qtp.328.1567626792693;
        Wed, 04 Sep 2019 12:53:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1567626792; cv=none;
        d=google.com; s=arc-20160816;
        b=CLwPQI7m1BtGeDh6NYnbodcWcGrdwNfG0WyzTUo1bKqen6c9lum61s7LOSKLW7oM3J
         rQ7yRHBPVUDN3jl8y4o0LN54agQXkGKClmjKfe8KM9zqcdrLaCc5jJ8e6dtl5UV2e6HQ
         48IfGIoetV97Tm0g4PJqUUSygHM8HIk1vCNxFqfLCuH8G40N5AgyXr4YcKYd/xZqFVtC
         T3ecBrgEwikFFkO7ENcX+P08MorgA1UQXhFOOwZoxMJdSGJbygBEGaB/2pnW93eDcebh
         hgle4YSx3EYue8JE5FWsw0bbelymVlgJ5VTGMRzxqLox+jwcksH2JS2zNfn8xUONbs8Q
         2VlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=w4KLvtnzbGeNcUZz918DD9xSWUWeMSJ2fRY4zLuIN7M=;
        b=anm/1f77ByKpL46K5wwIitcy5yga6Uutqzus8C33D5eBJwPSxfmQXUamgA48GMYpWl
         +ZDYWn2g3ny9PCFl2O8EdFlKhSfuUZtnvDbRVmYXRGXsxGYfPEwD77PyySuEdKM5ThTK
         613rN3V1qoJG3lZInZzSsPv9y0BABB3EFZWBC40t1QNDyJAChbWc07JyPLId8tmKv9LW
         8bLLLmmX9xqv3mUk3L8FAhaSnpcydHej0awokbBU0dJRpsVeNfAuO4O1v4tmmkVLc/Tr
         vXSE2/nw6KHzJ7slKYDvALToUtZ6neKwV3LtuakbP4VdVGJCWYEKvCIf5gnqLK9G31yv
         zWoQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Xo4CiaJ2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n45si11430081qta.39.2019.09.04.12.53.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 04 Sep 2019 12:53:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Xo4CiaJ2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i5bL5-000215-NU
	for alex.bennee@linaro.org; Wed, 04 Sep 2019 15:53:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40211)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1i5b08-0004c1-C5
 for qemu-arm@nongnu.org; Wed, 04 Sep 2019 15:31:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1i5b06-0002Pz-8G
 for qemu-arm@nongnu.org; Wed, 04 Sep 2019 15:31:32 -0400
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442]:40819)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1i5b05-0002Pf-VD
 for qemu-arm@nongnu.org; Wed, 04 Sep 2019 15:31:30 -0400
Received: by mail-pf1-x442.google.com with SMTP id x127so1220728pfb.7
 for <qemu-arm@nongnu.org>; Wed, 04 Sep 2019 12:31:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=w4KLvtnzbGeNcUZz918DD9xSWUWeMSJ2fRY4zLuIN7M=;
 b=Xo4CiaJ2viHwnNykF9aQFpzgH/WazLxvqgaLL1+oZC9xYBHkAoGfSLdhKqdU92db2G
 OyoM71AXfDwwIUU4xwwVxyC19ZJxx4sxtO4PlWLRsCgM4RVSolrIcNtdErudmyq3QOAd
 q/LYCPMFrUXthM2djMOmsTJ1s0GTQuBMoF33XS55pYcvk5OwGwbASVDQ5nigjNXLuplu
 PX25wihAvAdArplzvZiBjWz3NrBu8ZFuSqgqJxiILNo/AWV3SsPB5OxsbGAsD9pXV0j5
 uQsibc81/wpocRqBua9h4qwXlxufykJzhkq8ykQ15CI6w/IKC2nxVvCFEyWCCedmPdh0
 dW5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=w4KLvtnzbGeNcUZz918DD9xSWUWeMSJ2fRY4zLuIN7M=;
 b=Q4Nspg8/hvYiuN6ZhATOAqDj30meypY45srqjmJNA3TvD3tjqSr1Rc25QEov/nlvS1
 4i6B2Cj/AAGiLrTj7jCHGeK9VJiwvnZWal7JKtl+qPqqjoRbkj24gdVu8JlVT9C9I3QY
 dt7sOMKYnEU3ttDZ5U7WVzNUBYwdChanlbXXws7dZPd1iPnP4OfAgVMzs0S8ucrRPWo/
 CR6gR2zIkR9i2QBRBb2Qy6YphQZmArxrYSqtW6QySFa5fYSUIV6PEa2XxNFm84w5G4SX
 7L7KtqZ4BMny6PJYH1Co5MZHo0wK5uN7Go6D9Hc0boNp1ApZnzuNoftjYBdOO543zLJP
 VKGg==
X-Gm-Message-State: APjAAAWvvKk3njFDjKVA8tw2tzS3Q8xGVrzTzoNTeWduT7Lkj5vW4s8w
 o4Ibl4CG5+w5J13puVBDVfl+Dw==
X-Received: by 2002:a65:4b8b:: with SMTP id t11mr36313870pgq.130.1567625488997; 
 Wed, 04 Sep 2019 12:31:28 -0700 (PDT)
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net.
 [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id f6sm18999174pga.50.2019.09.04.12.31.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Sep 2019 12:31:27 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed,  4 Sep 2019 12:30:12 -0700
Message-Id: <20190904193059.26202-23-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190904193059.26202-1-richard.henderson@linaro.org>
References: <20190904193059.26202-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::442
Subject: [Qemu-arm] [PATCH v4 22/69] target/arm: Diagnose UNPREDICTABLE
 ldrex/strex cases
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5moWv9Q//NKa

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 40 ++++++++++++++++++++++++++++++++++++++--
 1 file changed, 38 insertions(+), 2 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index ec80c9cbbc..9338873a4a 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -8912,6 +8912,18 @@ static bool op_strex(DisasContext *s, arg_STREX *a, MemOp mop, bool rel)
 {
     TCGv_i32 addr;
 
+    /* We UNDEF for these UNPREDICTABLE cases.  */
+    if (a->rd == 15 || a->rn == 15 || a->rt == 15
+        || a->rd == a->rn || a->rd == a->rt
+        || (s->thumb && (a->rd == 13 || a->rt == 13))
+        || (mop == MO_64
+            && (a->rt2 == 15
+                || a->rd == a->rt2 || a->rt == a->rt2
+                || (s->thumb && a->rt2 == 13)))) {
+        unallocated_encoding(s);
+        return true;
+    }
+
     if (rel) {
         tcg_gen_mb(TCG_MO_ALL | TCG_BAR_STRL);
     }
@@ -8938,6 +8950,7 @@ static bool trans_STREXD_a32(DisasContext *s, arg_STREX *a)
     if (!ENABLE_ARCH_6K) {
         return false;
     }
+    /* We UNDEF for these UNPREDICTABLE cases.  */
     if (a->rt & 1) {
         unallocated_encoding(s);
         return true;
@@ -8980,6 +8993,7 @@ static bool trans_STLEXD_a32(DisasContext *s, arg_STREX *a)
     if (!ENABLE_ARCH_8) {
         return false;
     }
+    /* We UNDEF for these UNPREDICTABLE cases.  */
     if (a->rt & 1) {
         unallocated_encoding(s);
         return true;
@@ -9019,8 +9033,13 @@ static bool op_stl(DisasContext *s, arg_STL *a, MemOp mop)
     if (!ENABLE_ARCH_8) {
         return false;
     }
-    addr = load_reg(s, a->rn);
+    /* We UNDEF for these UNPREDICTABLE cases.  */
+    if (a->rn == 15 || a->rt == 15) {
+        unallocated_encoding(s);
+        return true;
+    }
 
+    addr = load_reg(s, a->rn);
     tmp = load_reg(s, a->rt);
     tcg_gen_mb(TCG_MO_ALL | TCG_BAR_STRL);
     gen_aa32_st_i32(s, tmp, addr, get_mem_index(s), mop | s->be_data);
@@ -9050,6 +9069,16 @@ static bool op_ldrex(DisasContext *s, arg_LDREX *a, MemOp mop, bool acq)
 {
     TCGv_i32 addr;
 
+    /* We UNDEF for these UNPREDICTABLE cases.  */
+    if (a->rn == 15 || a->rt == 15
+        || (s->thumb && a->rt == 13)
+        || (mop == MO_64
+            && (a->rt2 == 15 || a->rt == a->rt2
+                || (s->thumb && a->rt2 == 13)))) {
+        unallocated_encoding(s);
+        return true;
+    }
+
     addr = tcg_temp_local_new_i32();
     load_reg_var(s, addr, a->rn);
     tcg_gen_addi_i32(addr, addr, a->imm);
@@ -9076,6 +9105,7 @@ static bool trans_LDREXD_a32(DisasContext *s, arg_LDREX *a)
     if (!ENABLE_ARCH_6K) {
         return false;
     }
+    /* We UNDEF for these UNPREDICTABLE cases.  */
     if (a->rt & 1) {
         unallocated_encoding(s);
         return true;
@@ -9118,6 +9148,7 @@ static bool trans_LDAEXD_a32(DisasContext *s, arg_LDREX *a)
     if (!ENABLE_ARCH_8) {
         return false;
     }
+    /* We UNDEF for these UNPREDICTABLE cases.  */
     if (a->rt & 1) {
         unallocated_encoding(s);
         return true;
@@ -9157,8 +9188,13 @@ static bool op_lda(DisasContext *s, arg_LDA *a, MemOp mop)
     if (!ENABLE_ARCH_8) {
         return false;
     }
-    addr = load_reg(s, a->rn);
+    /* We UNDEF for these UNPREDICTABLE cases.  */
+    if (a->rn == 15 || a->rt == 15) {
+        unallocated_encoding(s);
+        return true;
+    }
 
+    addr = load_reg(s, a->rn);
     tmp = tcg_temp_new_i32();
     gen_aa32_ld_i32(s, tmp, addr, get_mem_index(s), mop | s->be_data);
     disas_set_da_iss(s, mop, a->rt | ISSIsAcqRel);
-- 
2.17.1

