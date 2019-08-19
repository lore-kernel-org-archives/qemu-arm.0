Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp3181849wrs;
        Mon, 19 Aug 2019 14:54:26 -0700 (PDT)
X-Google-Smtp-Source: APXvYqx2FIw8OnBQbhVve11x/roFwQWXik/o5/bMBBr4T7f68XmK7zeJlEOF9YNpZdQESRT4xRDG
X-Received: by 2002:a17:906:32c2:: with SMTP id k2mr6345102ejk.308.1566251666675;
        Mon, 19 Aug 2019 14:54:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566251666; cv=none;
        d=google.com; s=arc-20160816;
        b=0whzeYwF74DdXyJd5eCZ0CYf4JLvKfZGrk1gMz7cPzr6yy9ER495RWAy8hMSJ8KXZM
         /GjWoJqy1OJHzNXNRlEl71GGfiHFBNyYABBwKAXRwCxWsIqSOkbmSkFZ8IjOKYEmrvpM
         u1y1j9nEHX52/JtsfcdBAlz+JJy+MXTCa7YkaMvgFnAXq5EHqo79EDkCHtZXJedMZSqs
         sFMG1JwnnQ9Ruwyx/qsy7pRL4K42bcKQhnXFqxlMg7OpZEYt/ct39hMpCZx7qZSKc3gR
         fmlAt0WgQ0GR6boazXQUyCJ14zySamQ1KHbtzB0UBfiwtqpa4Osq30kxV9CnF59p4Us+
         wEsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=PE2YkC2uYnkrGF/f+RQwnN2RH8jlq2MEkPtJdHa8VHQ=;
        b=hZbCl1pzGcmzM1IA+i3Wcqws2i2L3q/8XG6WhnVXfLZxMBWt/7wxD28XI5hL/zcK7O
         PA1b4PfI5HZ7/1Csz+06wp9XzSQgGFRo1xse6aqY3xfDLZUsfdIUHC94BKFrlwUvJ0wo
         EPCPsHFMoBFokHEzUj/bFMtjI2E9dAe4obTEszslotd6j7lqoQbH6t7HlIOg5A2L62nq
         kkaar/XV8zUxYZFJXmNNvVnTBgBnY93OrpMQdFadUI3TQxk843bbdDlu6sTmBt+fcxpy
         6U2ljs2gR3gH7aAtFS6mv+OXaQ8f7lDIlB+WgIgjyEN1S+r5MBea48khbCr/G5AvL22q
         UUvA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=t8oNyn9Z;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b14si1897285ede.227.2019.08.19.14.54.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 19 Aug 2019 14:54:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=t8oNyn9Z;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hzpbd-0005Tx-7F
	for alex.bennee@linaro.org; Mon, 19 Aug 2019 17:54:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59185)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1hzpMK-00025x-D9
 for qemu-arm@nongnu.org; Mon, 19 Aug 2019 17:38:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hzpMJ-0006Np-0c
 for qemu-arm@nongnu.org; Mon, 19 Aug 2019 17:38:36 -0400
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542]:41905)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hzpMI-0006Ml-Mv
 for qemu-arm@nongnu.org; Mon, 19 Aug 2019 17:38:34 -0400
Received: by mail-pg1-x542.google.com with SMTP id x15so1926988pgg.8
 for <qemu-arm@nongnu.org>; Mon, 19 Aug 2019 14:38:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=PE2YkC2uYnkrGF/f+RQwnN2RH8jlq2MEkPtJdHa8VHQ=;
 b=t8oNyn9ZZ3RCoFQiIKX4jSToehRsZPBSpTvpY9Z9O0ijBgjNpKVTXyQQZIj+0WQ1I9
 vNssbEbg6nKXjvsygAhI5ZFYDHFXOe/jw8E/zmSjoiCT3D6DbkmJ4SI65C+i5glaquEj
 exzjnem76xrCYZdKpZsexjc6bFARf8cGzp0Ys+IWQ4ZDKMUoDuTLzxjLI8XxjQg7Dn42
 yKjbV5ycXhFT1NOZUC1RmQa75ErVhGNizoUDdc0h4aJVW9h/kehjv0qgQYEsVChuRj/P
 e1hZc6hrr8YwFEFpq5wuuDR3YzMk2wA64D2E/2ta6lMlYUWOosLaFXvWmKHn/LUU9cbw
 3R8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=PE2YkC2uYnkrGF/f+RQwnN2RH8jlq2MEkPtJdHa8VHQ=;
 b=THuw2ZCZqMbylluSWmUL1n34khMXwNj7U+54yEYUamSNj/U6s2kGEOhRzeWwZN1N8v
 6WsBjPMC8umsX9hhcrw5BXhBld3OY3HFMIndrg8AmPaITp+WeDfEY3MyF4Ae+/Z/zoft
 l8ZgpxBUVs8YoXfjKfKAFXyc+1IxGG4fBsB9LHPzIwIwGqeX1HClYD42hPx36auZiJks
 FDhp5QU3AXpzK2MYlHKiS7S49lWAM33/hwBTnAFa93crIXKArgyiCTXEa/58M4b/k2MQ
 Np1iI28cgyhPcTC9e+O9eYSth6wwvSFb/ysxuf3ppfq18a9jGWzvoBAR9Qc+4ET8OCN0
 CMug==
X-Gm-Message-State: APjAAAXCsBUlWen5RE6txKe8k4kYAU7j73rAhhCJPBATrDWTc5HYZk7+
 8VH3Of5ByUayx9nNQSrSakKNJ2zFzAw=
X-Received: by 2002:a62:1703:: with SMTP id 3mr22426920pfx.118.1566250713399; 
 Mon, 19 Aug 2019 14:38:33 -0700 (PDT)
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net.
 [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id d2sm13446951pjs.21.2019.08.19.14.38.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Aug 2019 14:38:32 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Mon, 19 Aug 2019 14:37:16 -0700
Message-Id: <20190819213755.26175-30-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190819213755.26175-1-richard.henderson@linaro.org>
References: <20190819213755.26175-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::542
Subject: [Qemu-arm] [PATCH v2 29/68] target/arm: Diagnose too few registers
 in list for LDM/STM
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
X-TUID: tY25/ZjpZNMs

This has been a TODO item for quite a while.  The minimum bit
count for A32 and T16 is 1, and for T32 is 2.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 24 ++++++++++++++++--------
 1 file changed, 16 insertions(+), 8 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 29e2eae441..1792bb7abd 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -9733,7 +9733,7 @@ static void op_addr_block_post(DisasContext *s, arg_ldst_block *a,
     }
 }
 
-static bool op_stm(DisasContext *s, arg_ldst_block *a)
+static bool op_stm(DisasContext *s, arg_ldst_block *a, int min_n)
 {
     int i, j, n, list, mem_idx;
     bool user = a->u;
@@ -9749,7 +9749,9 @@ static bool op_stm(DisasContext *s, arg_ldst_block *a)
 
     list = a->list;
     n = ctpop16(list);
-    /* TODO: test invalid n == 0 case */
+    if (n < min_n) {
+        return false;
+    }
 
     addr = op_addr_block_pre(s, a, n);
     mem_idx = get_mem_index(s);
@@ -9782,7 +9784,8 @@ static bool op_stm(DisasContext *s, arg_ldst_block *a)
 
 static bool trans_STM(DisasContext *s, arg_ldst_block *a)
 {
-    return op_stm(s, a);
+    /* BitCount(list) < 1 is UNPREDICTABLE */
+    return op_stm(s, a, 1);
 }
 
 static bool trans_STM_t32(DisasContext *s, arg_ldst_block *a)
@@ -9791,10 +9794,11 @@ static bool trans_STM_t32(DisasContext *s, arg_ldst_block *a)
     if (a->w && (a->list & (1 << a->rn))) {
         return false;
     }
-    return op_stm(s, a);
+    /* BitCount(list) < 2 is UNPREDICTABLE */
+    return op_stm(s, a, 2);
 }
 
-static bool do_ldm(DisasContext *s, arg_ldst_block *a)
+static bool do_ldm(DisasContext *s, arg_ldst_block *a, int min_n)
 {
     int i, j, n, list, mem_idx;
     bool loaded_base;
@@ -9821,7 +9825,9 @@ static bool do_ldm(DisasContext *s, arg_ldst_block *a)
 
     list = a->list;
     n = ctpop16(list);
-    /* TODO: test invalid n == 0 case */
+    if (n < min_n) {
+        return false;
+    }
 
     addr = op_addr_block_pre(s, a, n);
     mem_idx = get_mem_index(s);
@@ -9888,7 +9894,8 @@ static bool trans_LDM_a32(DisasContext *s, arg_ldst_block *a)
     if (ENABLE_ARCH_7 && a->w && (a->list & (1 << a->rn))) {
         return false;
     }
-    return do_ldm(s, a);
+    /* BitCount(list) < 1 is UNPREDICTABLE */
+    return do_ldm(s, a, 1);
 }
 
 static bool trans_LDM_t32(DisasContext *s, arg_ldst_block *a)
@@ -9897,7 +9904,8 @@ static bool trans_LDM_t32(DisasContext *s, arg_ldst_block *a)
     if (a->w && (a->list & (1 << a->rn))) {
         return false;
     }
-    return do_ldm(s, a);
+    /* BitCount(list) < 2 is UNPREDICTABLE */
+    return do_ldm(s, a, 2);
 }
 
 /*
-- 
2.17.1

