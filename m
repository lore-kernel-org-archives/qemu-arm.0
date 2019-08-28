Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp1175855wrs;
        Wed, 28 Aug 2019 12:30:59 -0700 (PDT)
X-Google-Smtp-Source: APXvYqw1/nqXK7g2tnmwJNvpvD749C24faWq1a+M4Sh2VJJmDh8iD+mQOAeY04FcqI+4amEukVGQ
X-Received: by 2002:ac8:60d6:: with SMTP id i22mr2639922qtm.250.1567020659203;
        Wed, 28 Aug 2019 12:30:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1567020659; cv=none;
        d=google.com; s=arc-20160816;
        b=MyV62dXLGDL4CZTYNjrELraJjHlPJxQmP81TUQPM9iHm2JH/mmSVYOIsAcFe6MQYGB
         o0WBSkPX633KC148PBP08jM3HpnuHI80IavkROQwrz3mCXKamKlmCqkBwxkMfSqG/G+d
         s17Flts7Q/zgNlErCmEHRLJ10LY1UAtUgsdsuV26mwVEzj8Yd2a5eliBppRk0RQ7LDSz
         OqwGKJS5Zl0DZ4cpYoJpC9lc2lfurHu2jbh/VIRRdbdlKnAqzoR2xBhdxNx5bl0e/jXu
         91Nk2lRKLsVUqcz8OSmw1QnLoWhpVrq9grIhMFId1KvD0XcqM/k8Zs+9sCxvXIuZju8y
         3Zkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=ZPbSh9zJCU6tFB8sqkv7S5LslxkLSpT7ZOLVU6IYp00=;
        b=C1NXnY26PfP4cUoDL+NJh2LCU2dsuYZZaILEzFITd8SFGu1688uoTWh5dyg3obG9XG
         wQ9b/DFyrlZ42XMd6BXhV2KcmHmzzOdF7ZosK9900di9gA2KLnljtY8ofAMrTRPoN1Cm
         AZcpeH5q7Czile4OOuBqioN/CKuFYSgvRsLC0JYhLnv/b4iLb7jZizjUrtBQ6HRuedPg
         f2WHl0ynYDemDkxbcitVczouLkHVF8EGYuq+s2MhLmSVrFaeDxgTobibmE/LM0FhhqGy
         xZaYHg9fb0q0kru8b4ALYEg/FDXAEifZMRyRX8cAJrvyhuiIK3hUJLGbrsUoa0TlSI29
         uRxg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ekb03WIJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 15si84928qtu.68.2019.08.28.12.30.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 28 Aug 2019 12:30:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ekb03WIJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41328 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i33ek-0003w2-Eu
	for alex.bennee@linaro.org; Wed, 28 Aug 2019 15:30:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37860)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1i33G8-0003W2-4x
 for qemu-arm@nongnu.org; Wed, 28 Aug 2019 15:05:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1i33G6-0000AW-64
 for qemu-arm@nongnu.org; Wed, 28 Aug 2019 15:05:31 -0400
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642]:34913)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1i33G5-00009Z-K5
 for qemu-arm@nongnu.org; Wed, 28 Aug 2019 15:05:30 -0400
Received: by mail-pl1-x642.google.com with SMTP id gn20so407348plb.2
 for <qemu-arm@nongnu.org>; Wed, 28 Aug 2019 12:05:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=ZPbSh9zJCU6tFB8sqkv7S5LslxkLSpT7ZOLVU6IYp00=;
 b=ekb03WIJpECk2/qIFh9O+7RE8shJjCiDjcwFSzkQDbLsmEut/DxTEoPuBd+FDCIUk/
 BiMhjpSFbd3ue5/xCMQjyAIoze8Z90CpkhpM6jlkf0Z4MwIXimVm6/mh26+HJdeYJWK9
 g3ejcbBopJQMpt3XibmsHRESKPmRQPjrQuDgO4Xhl3yNYNEHF3D1Zt7qfpQkTPA2Xavl
 ygzipBBBZo/Jl4G+kl+/0M4baog+Z18mdj6xhuIZXxRzUnu6JLrKGawffbhG7Hsxs9b+
 kjMBGHHBCc33AEdiPAWHw/7xWJggsJ7DrQyQ98A2TcpF5O4lQfxXr8QcvfnA6ESJFpeJ
 m3Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=ZPbSh9zJCU6tFB8sqkv7S5LslxkLSpT7ZOLVU6IYp00=;
 b=n8dTohY/VLqI+8uUcdj6Z7vPtYBfs5mt33PMjxN1yUDDFHb8LDFvXt2lU6rRt3X3l5
 twQK3W3lrBTJEIcAS6oahU7di4XZuZthntMpSu7fM7VDRkJ+5hUOwBuwQoRYC6oQpWHs
 H5jii6DcBDuJhWUKntrmv8ORMXOSA8vCxyncq7cmgdEnp8picCEz+qexRFDisxQ7EAnS
 Zq2DsKhogYVxi8LM4wbVybRWojOEJp9PcYHq4ae4/Of1N7EcjdGrWG19ro7y895QZSAD
 PZA5V3F06UWC+H6a7MNNZPuNEY0bj3ccaiUuSFh6m9iCN0KpjIGhqBb5VVt7tzZplKU4
 Vcnw==
X-Gm-Message-State: APjAAAUvz47mT8/t4gCvBOCT0c5dPXxKpX8WPwQmI62cjfuh7vllTgRN
 4s9yq5/dzqDIRykGChgyoLTmwkQBUmw=
X-Received: by 2002:a17:902:d906:: with SMTP id
 c6mr5633124plz.13.1567019128062; 
 Wed, 28 Aug 2019 12:05:28 -0700 (PDT)
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net.
 [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id f27sm2967944pgm.60.2019.08.28.12.05.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Aug 2019 12:05:27 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed, 28 Aug 2019 12:04:09 -0700
Message-Id: <20190828190456.30315-23-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190828190456.30315-1-richard.henderson@linaro.org>
References: <20190828190456.30315-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::642
Subject: [Qemu-arm] [PATCH v3 22/69] target/arm: Diagnose UNPREDICTABLE
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
X-TUID: VpPOf6/wgfGn

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 40 ++++++++++++++++++++++++++++++++++++++--
 1 file changed, 38 insertions(+), 2 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 10ec976bd9..3f61916ff9 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -8886,6 +8886,18 @@ static bool op_strex(DisasContext *s, arg_STREX *a, TCGMemOp mop, bool rel)
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
@@ -8912,6 +8924,7 @@ static bool trans_STREXD_a32(DisasContext *s, arg_STREX *a)
     if (!ENABLE_ARCH_6K) {
         return false;
     }
+    /* We UNDEF for these UNPREDICTABLE cases.  */
     if (a->rt & 1) {
         unallocated_encoding(s);
         return true;
@@ -8954,6 +8967,7 @@ static bool trans_STLEXD_a32(DisasContext *s, arg_STREX *a)
     if (!ENABLE_ARCH_8) {
         return false;
     }
+    /* We UNDEF for these UNPREDICTABLE cases.  */
     if (a->rt & 1) {
         unallocated_encoding(s);
         return true;
@@ -8993,8 +9007,13 @@ static bool op_stl(DisasContext *s, arg_STL *a, TCGMemOp mop)
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
@@ -9024,6 +9043,16 @@ static bool op_ldrex(DisasContext *s, arg_LDREX *a, TCGMemOp mop, bool acq)
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
@@ -9050,6 +9079,7 @@ static bool trans_LDREXD_a32(DisasContext *s, arg_LDREX *a)
     if (!ENABLE_ARCH_6K) {
         return false;
     }
+    /* We UNDEF for these UNPREDICTABLE cases.  */
     if (a->rt & 1) {
         unallocated_encoding(s);
         return true;
@@ -9092,6 +9122,7 @@ static bool trans_LDAEXD_a32(DisasContext *s, arg_LDREX *a)
     if (!ENABLE_ARCH_8) {
         return false;
     }
+    /* We UNDEF for these UNPREDICTABLE cases.  */
     if (a->rt & 1) {
         unallocated_encoding(s);
         return true;
@@ -9131,8 +9162,13 @@ static bool op_lda(DisasContext *s, arg_LDA *a, TCGMemOp mop)
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

