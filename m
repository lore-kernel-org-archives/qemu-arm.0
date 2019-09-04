Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp1133793wrp;
        Wed, 4 Sep 2019 12:55:25 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxbLL0ZD99khkAFo4O9qkqWaKHO3g2P39mCcho8p3TkGzUgWsS1iXf5c9TD3f+8IJU2Xkmo
X-Received: by 2002:a50:f285:: with SMTP id f5mr43413015edm.109.1567626924993;
        Wed, 04 Sep 2019 12:55:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1567626924; cv=none;
        d=google.com; s=arc-20160816;
        b=p3GN90KHQYiY2A1ttKNMqwsIVrOkJ00Cd7bvzbSv2uBTiyrfNNSB2euL0NgROsCAw6
         RbRb+xn18sC/z0Olpsm54OtEcNJ1MLUwNk1b5j3FFxj+6y1XC8ZGBUnqhPZSqF745lL8
         Ri5gqvfyoki1eViMKshAbmknkCZ3psXnH2Dbjqj9yG2kpH/Nv7L07haTZw5sK+fN54N5
         FmZjo9f3ethb0VZH+m+vkn4yv9X3QeN4KCL/3kxInWIDsOzoVasvJZ94bcUDFHv9NY8A
         FOsXaMk3xVEv9UCXmbAJEsI+kW2nRvt3SD4ssrlpBQyHy+oHNhw8+tS8hjnOi7wT11lC
         eASQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=aOeT7JW4syMFoke9pOSfcUTMmUalFkDrt8zliWzFSBI=;
        b=wrdw6l7Cw6AM/y8bh9BSwjBMrre8dyesalleTqe7LQH+DDaTZl5WYYEZbm7k2pQ8rM
         3EbfQlaT0kDgozG/BU5lSYYBwleyS+G9VAqHlrBLtKXZtJuEgpUd+FbycQgQZFEKzi1M
         0B7grd7OBeYbVwQILTLyKMbW8Rb307ybfCrJcSSW5N0mMYwVhQPs9PY5K/IkzMjWuaee
         6aOsq36D8uaPGAUiXW1yZPulxd5h4Zubvpnsa9c637+7fzG+2RTRKwIbQNgZ0qbIfpSH
         yWQfmBrx/g19Fa3spYl84EhzNAVBFkX69m5wyL1PP7j1agvldDm7xXHx+PQDMbcRXtpV
         hoRw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=PC6P+R2Z;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m26si12752501edc.388.2019.09.04.12.55.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 04 Sep 2019 12:55:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=PC6P+R2Z;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i5bND-0004zj-C6
	for alex.bennee@linaro.org; Wed, 04 Sep 2019 15:55:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40443)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1i5b0K-0004tn-0y
 for qemu-arm@nongnu.org; Wed, 04 Sep 2019 15:31:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1i5b0H-0002Zl-0W
 for qemu-arm@nongnu.org; Wed, 04 Sep 2019 15:31:43 -0400
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444]:34377)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1i5b0G-0002ZC-OS
 for qemu-arm@nongnu.org; Wed, 04 Sep 2019 15:31:40 -0400
Received: by mail-pf1-x444.google.com with SMTP id r12so1751175pfh.1
 for <qemu-arm@nongnu.org>; Wed, 04 Sep 2019 12:31:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=aOeT7JW4syMFoke9pOSfcUTMmUalFkDrt8zliWzFSBI=;
 b=PC6P+R2ZIPGunwlvD2YZXGgZJOQ06RN/RE+cazziFhPqltlTlTHhEBUn1au/EFJ66N
 rM3GuU10yZlTqBGrGqxvOnRrbAlPrJcg3WscIfqDvXTm5QNyroTBJ5J2P7UL6hSR12zY
 Ast5tqsMYeXVrXC727LXHyi58efXyYV86n9seuxEajOJXQ1i/eOruSIspq7fJUbr9dtK
 lyuRKeSOgIoRs62B+vaapzDgyId1v2kh/UX2LgubKTvudTyosqcqJpmF5r57PRN2HLqh
 4+ScQuJ6KRksTDqOb/GeI88pizOyAA3AYWhB3MGmubZOIXB5BMKjATees9YbYKy1D3wq
 noTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=aOeT7JW4syMFoke9pOSfcUTMmUalFkDrt8zliWzFSBI=;
 b=pKnpkBJo+iSAEscuX9To8GcTLLa7nx/+MQtQoLOWWpppMugyU8bFhNpCIbdtFHYSYQ
 /xDhar+EmK1OgkAeQirh8DwZ3K9FKRtugD1CVInecmekDbvMIXE2RmWH/KZ4Rcjpj7aX
 nEFfisuXLDHP48D2mmeh+Rcy12fxM3p4vjNkRqw44fBqfoSgFWWafq6jOFf5+KeExHly
 WtxtpfJOLRP2H4YBGS2FjLSen0Wp5vbcjecvWGeQ4J2dTz3dL4c35b+qzzBU8jxeByfh
 wjQnXUBc8KXrWCD4pyzRTDGQQkCYe0CY3UkYhnBeXXg5Rn0kXidc6av3l9CJVl12bKPp
 U7WQ==
X-Gm-Message-State: APjAAAX/iLsBbx5Zu+RbkjmLgAKC3fJhxN5l/srHzpqmy0MKKHxXQQdQ
 8j6vSoyAxMhqz608Tlg1+XBTww==
X-Received: by 2002:a17:90a:fd8c:: with SMTP id
 cx12mr6705903pjb.95.1567625499743; 
 Wed, 04 Sep 2019 12:31:39 -0700 (PDT)
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net.
 [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id f6sm18999174pga.50.2019.09.04.12.31.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Sep 2019 12:31:39 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed,  4 Sep 2019 12:30:20 -0700
Message-Id: <20190904193059.26202-31-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190904193059.26202-1-richard.henderson@linaro.org>
References: <20190904193059.26202-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::444
Subject: [Qemu-arm] [PATCH v4 30/69] target/arm: Diagnose too few registers
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
X-TUID: HmFwWbUbPV8T

This has been a TODO item for quite a while.  The minimum bit
count for A32 and T16 is 1, and for T32 is 2.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 26 ++++++++++++++++++--------
 1 file changed, 18 insertions(+), 8 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index b67e7389d3..b623dbcd48 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -9846,7 +9846,7 @@ static void op_addr_block_post(DisasContext *s, arg_ldst_block *a,
     }
 }
 
-static bool op_stm(DisasContext *s, arg_ldst_block *a)
+static bool op_stm(DisasContext *s, arg_ldst_block *a, int min_n)
 {
     int i, j, n, list, mem_idx;
     bool user = a->u;
@@ -9863,7 +9863,10 @@ static bool op_stm(DisasContext *s, arg_ldst_block *a)
 
     list = a->list;
     n = ctpop16(list);
-    /* TODO: test invalid n == 0 case */
+    if (n < min_n) {
+        unallocated_encoding(s);
+        return true;
+    }
 
     addr = op_addr_block_pre(s, a, n);
     mem_idx = get_mem_index(s);
@@ -9896,7 +9899,8 @@ static bool op_stm(DisasContext *s, arg_ldst_block *a)
 
 static bool trans_STM(DisasContext *s, arg_ldst_block *a)
 {
-    return op_stm(s, a);
+    /* BitCount(list) < 1 is UNPREDICTABLE */
+    return op_stm(s, a, 1);
 }
 
 static bool trans_STM_t32(DisasContext *s, arg_ldst_block *a)
@@ -9906,10 +9910,11 @@ static bool trans_STM_t32(DisasContext *s, arg_ldst_block *a)
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
@@ -9938,7 +9943,10 @@ static bool do_ldm(DisasContext *s, arg_ldst_block *a)
 
     list = a->list;
     n = ctpop16(list);
-    /* TODO: test invalid n == 0 case */
+    if (n < min_n) {
+        unallocated_encoding(s);
+        return true;
+    }
 
     addr = op_addr_block_pre(s, a, n);
     mem_idx = get_mem_index(s);
@@ -10006,7 +10014,8 @@ static bool trans_LDM_a32(DisasContext *s, arg_ldst_block *a)
         unallocated_encoding(s);
         return true;
     }
-    return do_ldm(s, a);
+    /* BitCount(list) < 1 is UNPREDICTABLE */
+    return do_ldm(s, a, 1);
 }
 
 static bool trans_LDM_t32(DisasContext *s, arg_ldst_block *a)
@@ -10016,7 +10025,8 @@ static bool trans_LDM_t32(DisasContext *s, arg_ldst_block *a)
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

