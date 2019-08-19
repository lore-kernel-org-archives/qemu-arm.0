Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp3170599wrs;
        Mon, 19 Aug 2019 14:38:37 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzZiSUF7nZ6kh7/6QhTK0iM1ywyuVuWmhSDj4V9hVExn5tIkjVt12E/8dKqZUankhBufIDF
X-Received: by 2002:a05:620a:70f:: with SMTP id 15mr22626682qkc.171.1566250717061;
        Mon, 19 Aug 2019 14:38:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566250717; cv=none;
        d=google.com; s=arc-20160816;
        b=As6YqUWt8o0ZfSSLIM+t4m59TrG3WZm/mjDsLlsequfTairCNPOXK725d/XxaB/Q1Z
         1yFG71cys8vVqQKnNOpmG2slU0yVvtu8PvCJVYfqJRFkkLuG2x4s15Ur/RP/WepbV3Mg
         zoCyGIXtKl6XTijF3axCQsM1X4oW+Ryy8wMdCeqwNs/3H3iP/t8LFhJ3uOZxjavLZoYo
         tPua3BDuYvCgPad+CG71hGbuT3JxAapL1J0fHDB/sdfmEpDkcnx4gmWEGMD0tVYqlDyA
         4jCXK2pJfS2HLJITLKfwTcg4YuhKuDuHiIX1LyfWnhTeF+a82CwkoTlR8aICY5tVwMsz
         ZkwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=YCIk/F5LxR+bAmsRyhfJi8qC+d9H6yIirq1I2qlCLZk=;
        b=BKplBjcSKfxaugMrEXC+PcSKag/aHCu88zUlCyKqUmxz3Tn56YBrOflP1M60dnlcIn
         AMkt0V6QosRaUKYHmmOLoROkXabXzsZkbcjICwk12iYhHtGnHlhLKhneCVQQRExvMqAz
         B6j78AHR/SpHb9Bb6q3cobU7NaP3TTqB0FDgXClJAoM2BSnwfHutkWBzGKWN1WHT2itO
         +VBUTrXWd+MaVU275mbfv62eDf/drztYx9KYosqmEWqiC6HLx8qFsc0fOlO0m/OVdUmN
         9ZDfZUdewnKX2HvaPpi/OO0YiSOGdWygpl1Chs+Er0yux5MPqWMecOpeijbziJmYmcqy
         qY1Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=HPosPl9e;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j18si6478954qkg.136.2019.08.19.14.38.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 19 Aug 2019 14:38:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=HPosPl9e;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58246 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hzpMJ-0001fw-OB
	for alex.bennee@linaro.org; Mon, 19 Aug 2019 17:38:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58560)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1hzpLs-0001Ji-9M
 for qemu-arm@nongnu.org; Mon, 19 Aug 2019 17:38:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hzpLr-00061Q-0q
 for qemu-arm@nongnu.org; Mon, 19 Aug 2019 17:38:08 -0400
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644]:43893)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hzpLq-00061A-Rn
 for qemu-arm@nongnu.org; Mon, 19 Aug 2019 17:38:06 -0400
Received: by mail-pl1-x644.google.com with SMTP id 4so1583561pld.10
 for <qemu-arm@nongnu.org>; Mon, 19 Aug 2019 14:38:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=YCIk/F5LxR+bAmsRyhfJi8qC+d9H6yIirq1I2qlCLZk=;
 b=HPosPl9eiczke+k7xDh+6kjHrl5v1F6hnfQ0nrkfjkzhdEOpEUZ4mHsd9wrxvDee47
 JrWRXIBNIhc9pJbttavZwxlvcXlP82JAfVCo7cZKEDYY6ld9rOwlJPOd+ASyYq/RZymh
 Ur+a64Kx1QVeAr3Ixl6IgfHxaqZ5/9U8IIEaNXHVf7Yr2AxHKMwU7URrbBtjHFLxEC5e
 QSmJ4PX7jeXRBxLXNX3mkyunxZDUMj2tYi824Qq+4OVvMa2ZVeV3DUMMyJUrcc8zaD3+
 TcPknfGtpJpxweiUofjme1LeXcBIW1izr8wBCY/yURt6RaoEgk04PZfauJvVkWhtvGi0
 nmsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=YCIk/F5LxR+bAmsRyhfJi8qC+d9H6yIirq1I2qlCLZk=;
 b=ruEH+BmvnFxMvLt2C++wuWF/LVDb/LdK7DnhEb+2g3IUbPHkhVvjVjHN7tzxqEnHzf
 ibRyFv62Jnh2cURphByaGg331b/HJMTIErjnvCxBcBENAI5IKozbX/b6ZqTZ/2c9SJ4k
 BR44DzRYbvgiDMXOS1bslazZiJltTRcl6gyfGtFfT7JTFD+h/hEikORMvKPHHwOJ2wmp
 tKFp5E8niRfXua3kPzRbFBGqs8s3dfeOMZKjK3TPiBfUDpU8pLOal6zHzVKchuTW0DNr
 HZ65xslN2ehX0b4ZsknDZjcqlL5jTj+5zrn1jYOaqrdo9e4Mj+xEog+mYoCA2ODeIP45
 WISg==
X-Gm-Message-State: APjAAAV5kF81EFZwbOJUcqsgRp2Bj7hQ6VIyJLr31GZBHw8viVUYb0s7
 UNmf+FukZKy8ZSU9RUMTmoew4w==
X-Received: by 2002:a17:902:6b07:: with SMTP id
 o7mr24106899plk.180.1566250685895; 
 Mon, 19 Aug 2019 14:38:05 -0700 (PDT)
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net.
 [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id d2sm13446951pjs.21.2019.08.19.14.38.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Aug 2019 14:38:05 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Mon, 19 Aug 2019 14:36:54 -0700
Message-Id: <20190819213755.26175-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190819213755.26175-1-richard.henderson@linaro.org>
References: <20190819213755.26175-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::644
Subject: [Qemu-arm] [PATCH v2 07/68] target/arm: Simplify UMAAL
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
X-TUID: SCur3ldkdbM7

Since all of the inputs and outputs are i32, dispense with
the intermediate promotion to i64 and use tcg_gen_mulu2_i32
and tcg_gen_add2_i32.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 34 ++++++++++++----------------------
 1 file changed, 12 insertions(+), 22 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 94659086c0..82bd207799 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -7324,21 +7324,6 @@ static void gen_storeq_reg(DisasContext *s, int rlow, int rhigh, TCGv_i64 val)
     store_reg(s, rhigh, tmp);
 }
 
-/* load a 32-bit value from a register and perform a 64-bit accumulate.  */
-static void gen_addq_lo(DisasContext *s, TCGv_i64 val, int rlow)
-{
-    TCGv_i64 tmp;
-    TCGv_i32 tmp2;
-
-    /* Load value and extend to 64 bits.  */
-    tmp = tcg_temp_new_i64();
-    tmp2 = load_reg(s, rlow);
-    tcg_gen_extu_i32_i64(tmp, tmp2);
-    tcg_temp_free_i32(tmp2);
-    tcg_gen_add_i64(val, val, tmp);
-    tcg_temp_free_i64(tmp);
-}
-
 /* load and add a 64-bit value from a register pair.  */
 static void gen_addq(DisasContext *s, TCGv_i64 val, int rlow, int rhigh)
 {
@@ -8090,8 +8075,7 @@ static bool trans_SMLAL(DisasContext *s, arg_SMLAL *a)
 
 static bool trans_UMAAL(DisasContext *s, arg_UMAAL *a)
 {
-    TCGv_i32 t0, t1;
-    TCGv_i64 t64;
+    TCGv_i32 t0, t1, t2, zero;
 
     if (s->thumb
         ? !arm_dc_feature(s, ARM_FEATURE_THUMB_DSP)
@@ -8101,11 +8085,17 @@ static bool trans_UMAAL(DisasContext *s, arg_UMAAL *a)
 
     t0 = load_reg(s, a->rm);
     t1 = load_reg(s, a->rn);
-    t64 = gen_mulu_i64_i32(t0, t1);
-    gen_addq_lo(s, t64, a->ra);
-    gen_addq_lo(s, t64, a->rd);
-    gen_storeq_reg(s, a->ra, a->rd, t64);
-    tcg_temp_free_i64(t64);
+    tcg_gen_mulu2_i32(t0, t1, t0, t1);
+    zero = tcg_const_i32(0);
+    t2 = load_reg(s, a->ra);
+    tcg_gen_add2_i32(t0, t1, t0, t1, t2, zero);
+    tcg_temp_free_i32(t2);
+    t2 = load_reg(s, a->rd);
+    tcg_gen_add2_i32(t0, t1, t0, t1, t2, zero);
+    tcg_temp_free_i32(t2);
+    tcg_temp_free_i32(zero);
+    store_reg(s, a->ra, t0);
+    store_reg(s, a->rd, t1);
     return true;
 }
 
-- 
2.17.1

