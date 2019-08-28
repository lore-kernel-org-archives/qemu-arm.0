Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp1187044wrs;
        Wed, 28 Aug 2019 12:41:32 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwyCWmw/AGbbf2QFYikvN+blxOakDMDvT168ZQJXOBFPheKM/gCfemTKjAVHinUZTsgsbed
X-Received: by 2002:a05:620a:538:: with SMTP id h24mr5925543qkh.249.1567021292683;
        Wed, 28 Aug 2019 12:41:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1567021292; cv=none;
        d=google.com; s=arc-20160816;
        b=VPdzYnj4/slvEEG2wpzOXDupJ+fAreVes5jfTywR7wegbxuEH491d/cKOaKK22Ipbz
         7QCwPN3iBycB6DIiP0uQzD7add4bm16omQPRw9NU/rOyqtl9+zs/s85zgtOREEgPVi1k
         LmUBD2RTJo8AlOsrIHvmAwNYaUIFFHZRtVd+Z+dinBUR6+uXONFnhRbvAWjofrdeooQB
         IBvLMdF9EI8rI0WA/E9I6zXYQnmW3cUlZhOksW/ClqGQepT/p5VgBSjjhpnHmAu10EFc
         3vrsrDMY3Lt6ipBiHgne10M6/ah7iTYlCLuLV6zlIOIo69WNjsDdiG6rBXuG7UpVC+IR
         UhaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=dyqbVPM8CjlhxJ0X4xzBIRTbITeZE2k+cAo7OEV0NYI=;
        b=x33CmvyonmsuTmt4CK2NuPGzu04yi5DKZgoFviObb5GIQWPIHpJn8o6AKN/LFGaWY0
         8X4HuF00gorNxeVl0M1zcxT3xfBUkGZ0HD77gyZyv+WsPlfNZVCNMTBkjRh1c404ivpP
         DhJ1/MAOcVXFK69VqGn1YhirzY1iJgExsgucc/uhmSHXHbduewpaVRi4580OFXDUKJAy
         TMRJtuOr7Gtqr0yRFRM9MnVe6uVn0g/UAaNiztrENqTeZabnnS3ajwhjdiODIU0vznkA
         LvQVdYHm10+ODkel++8cpY7tEz7WXOJWRCwJIB+xDzdLCCPLJQ9oQiCNG3N+FOAWUy3H
         o0eQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=nM108mhT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d41si219423qve.113.2019.08.28.12.41.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 28 Aug 2019 12:41:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=nM108mhT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41496 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i33ox-0004bd-Mq
	for alex.bennee@linaro.org; Wed, 28 Aug 2019 15:41:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38131)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1i33GM-0003kT-No
 for qemu-arm@nongnu.org; Wed, 28 Aug 2019 15:05:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1i33GG-0000H4-G3
 for qemu-arm@nongnu.org; Wed, 28 Aug 2019 15:05:44 -0400
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444]:42607)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1i33GG-0000GK-6J
 for qemu-arm@nongnu.org; Wed, 28 Aug 2019 15:05:40 -0400
Received: by mail-pf1-x444.google.com with SMTP id i30so379149pfk.9
 for <qemu-arm@nongnu.org>; Wed, 28 Aug 2019 12:05:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=dyqbVPM8CjlhxJ0X4xzBIRTbITeZE2k+cAo7OEV0NYI=;
 b=nM108mhTAFLMCQZzRhGWwJFZu4vA3lBzqsS11J9rBTKL6CWPJwNYfNDVLZpUgVUaNf
 g46PIvwCYzyuRwgZXxWYaXIw8i8jyTt4jGt4+jA3dl/Yd03I8LNImepT9MS3iWgy1cG1
 znXbl+1iZBcwUzA4OyzGASFb5OooQ8Po+YOCpGGW6Mw3aeaPJQuhwVnKpWcwibRudX60
 tXcvMism++6U9zFIW8gV98lCejnrq0JAdkV5hl1n00VMnVQ6d2uISsrbqJYBY/MQZWfF
 wquqidmWhX2gcaMEDd0YF9pn2r1WrZ2yV/9dZ6ZFtTso3NaeU49MNsEFlWVe/D8y86++
 oosA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=dyqbVPM8CjlhxJ0X4xzBIRTbITeZE2k+cAo7OEV0NYI=;
 b=tzpQ7zB+QJb+9DaXjdCK6YMdRwzFJopt9nUXjurc1U5t1EkkJIgbPPK66kztzidyjS
 o48vA6Bo4ApL0zOd7OOjZxJI0zfnLtzRx/hVMS83OwiTzn5MybkutweaEncxw3gd6/r5
 pYhH+eqCh88y2s5DVnZJCxKM9qeR6pPV2F3TXTRIOUTB5rxAFH0Dum53HlnNEqG52gG9
 p5lah+Cc4bt2VKmco7DY1RE3qreG0AQ6qL93+TRuv3xPWas9HlVoG7NGeo3lugZTqi7Q
 OrmVM9sYlC12XPPEAJi4v2Sqn+SjzZ5wfML8IA4Jhrq+IlKOo5QT0A8fPJIWPAxuS81F
 ad2g==
X-Gm-Message-State: APjAAAUnyN3XKpefdMSr7AHtY+boUSLL9jRIlfgRieLn4JN9+orE51N7
 rz7AMPGkp2QobfIr5zeWuZy6wQ==
X-Received: by 2002:a63:d30f:: with SMTP id b15mr4699713pgg.341.1567019139008; 
 Wed, 28 Aug 2019 12:05:39 -0700 (PDT)
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net.
 [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id f27sm2967944pgm.60.2019.08.28.12.05.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Aug 2019 12:05:38 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed, 28 Aug 2019 12:04:17 -0700
Message-Id: <20190828190456.30315-31-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190828190456.30315-1-richard.henderson@linaro.org>
References: <20190828190456.30315-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::444
Subject: [Qemu-arm] [PATCH v3 30/69] target/arm: Diagnose too few registers
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
X-TUID: Kkc5p/MF69XX

This has been a TODO item for quite a while.  The minimum bit
count for A32 and T16 is 1, and for T32 is 2.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 26 ++++++++++++++++++--------
 1 file changed, 18 insertions(+), 8 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 529660eb35..bfc4508321 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -9813,7 +9813,7 @@ static void op_addr_block_post(DisasContext *s, arg_ldst_block *a,
     }
 }
 
-static bool op_stm(DisasContext *s, arg_ldst_block *a)
+static bool op_stm(DisasContext *s, arg_ldst_block *a, int min_n)
 {
     int i, j, n, list, mem_idx;
     bool user = a->u;
@@ -9830,7 +9830,10 @@ static bool op_stm(DisasContext *s, arg_ldst_block *a)
 
     list = a->list;
     n = ctpop16(list);
-    /* TODO: test invalid n == 0 case */
+    if (n < min_n) {
+        unallocated_encoding(s);
+        return true;
+    }
 
     addr = op_addr_block_pre(s, a, n);
     mem_idx = get_mem_index(s);
@@ -9863,7 +9866,8 @@ static bool op_stm(DisasContext *s, arg_ldst_block *a)
 
 static bool trans_STM(DisasContext *s, arg_ldst_block *a)
 {
-    return op_stm(s, a);
+    /* BitCount(list) < 1 is UNPREDICTABLE */
+    return op_stm(s, a, 1);
 }
 
 static bool trans_STM_t32(DisasContext *s, arg_ldst_block *a)
@@ -9873,10 +9877,11 @@ static bool trans_STM_t32(DisasContext *s, arg_ldst_block *a)
         unallocated_encoding(s);
         return true;
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
@@ -9905,7 +9910,10 @@ static bool do_ldm(DisasContext *s, arg_ldst_block *a)
 
     list = a->list;
     n = ctpop16(list);
-    /* TODO: test invalid n == 0 case */
+    if (n < min_n) {
+        unallocated_encoding(s);
+        return true;
+    }
 
     addr = op_addr_block_pre(s, a, n);
     mem_idx = get_mem_index(s);
@@ -9973,7 +9981,8 @@ static bool trans_LDM_a32(DisasContext *s, arg_ldst_block *a)
         unallocated_encoding(s);
         return true;
     }
-    return do_ldm(s, a);
+    /* BitCount(list) < 1 is UNPREDICTABLE */
+    return do_ldm(s, a, 1);
 }
 
 static bool trans_LDM_t32(DisasContext *s, arg_ldst_block *a)
@@ -9983,7 +9992,8 @@ static bool trans_LDM_t32(DisasContext *s, arg_ldst_block *a)
         unallocated_encoding(s);
         return true;
     }
-    return do_ldm(s, a);
+    /* BitCount(list) < 2 is UNPREDICTABLE */
+    return do_ldm(s, a, 2);
 }
 
 /*
-- 
2.17.1

