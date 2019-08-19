Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp3173999wrs;
        Mon, 19 Aug 2019 14:43:18 -0700 (PDT)
X-Google-Smtp-Source: APXvYqy2Ff8y/k+u2x3ovr4HHhg54B2yT+32hujMjYGUSRebOjrFt5GoSj2c18lRZ226kYPiV1Nl
X-Received: by 2002:a17:906:4c49:: with SMTP id d9mr23396960ejw.23.1566250998454;
        Mon, 19 Aug 2019 14:43:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566250998; cv=none;
        d=google.com; s=arc-20160816;
        b=PczkvIBBxXja0PoJ/rdBeIK36uwRMtdX/URhAe3h3V/4BGxUAZaYvF0/YNQ6KVaHSn
         QxLnvmOxlenHITEmBrrQIMybn6ArCdsCXxx5ZsLEe2A23frwZd4+XwdGGYp0PCMEiV9l
         ZOVoA90Ru4R9loE67DfGm/dSw6LX9mQmc4VikTd7IsEYo64r7YqrjJELjNhBbJebqRAb
         ypG1LHjtJGd169O4aKfzDfYPiJSGkSQtQjLAlQbveGeLcJegN/OgcnNxp1rgSmAWaHsr
         fL0/2qCIoJuT5Nvgxcptxqr1TFbcrTe9dhyDsXYU4o7kvBWTPFNi2H5KmqHykuzDzQQm
         7RUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=UWYlG2k/Brng2tcRnik0JT0fnjwpLVOKsVAvc3Cf6uM=;
        b=F73WkE+zfPcGtqknAI00keV/EmiwNOsjBZFpeG1SJ/NdGHlUEoSbbSSJqug3ZacsSo
         Mqseq+7SGNBza0imm45GQvgbA8TMmgDifzWycLhz33JBYfklEgCj+V8WD0zzx3vwR+jr
         nzCWws757IKninVecEv68VYV8jzTGQBHNIZ/2dRYcNQAK/37n3hMWOx7sahbwEYiFlRa
         uXKq+QcRDs5xc3aMuCoTeyyCiWYWjLcZpRX3pkUxiZNYGaXsiW2OUCgn1e1R6V7g7CGf
         yqIq8s5EMiaO11MQpgFBUpF3yoRNgb12xKmcqz9AI7sZsieNwLbH1v/qsr+ZPoO4KzEB
         GMKQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=uE9+yCU0;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h21si8470982eda.85.2019.08.19.14.43.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 19 Aug 2019 14:43:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=uE9+yCU0;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hzpQr-0007vO-3F
	for alex.bennee@linaro.org; Mon, 19 Aug 2019 17:43:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58658)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1hzpLw-0001QC-5Q
 for qemu-devel@nongnu.org; Mon, 19 Aug 2019 17:38:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hzpLv-00064N-4t
 for qemu-devel@nongnu.org; Mon, 19 Aug 2019 17:38:12 -0400
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542]:34695)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hzpLu-000641-W3
 for qemu-devel@nongnu.org; Mon, 19 Aug 2019 17:38:11 -0400
Received: by mail-pg1-x542.google.com with SMTP id n9so1937730pgc.1
 for <qemu-devel@nongnu.org>; Mon, 19 Aug 2019 14:38:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=UWYlG2k/Brng2tcRnik0JT0fnjwpLVOKsVAvc3Cf6uM=;
 b=uE9+yCU0T6Ao9JMkI8KrbQfhfd2p5ajqTi+mS0jkyNzaOKbM+TKA8AtOCL4pC6F/Yv
 /CbiLFEEQlrYbNj5U1s5YbgpvtZ/sTezNqAKO2PPBRgNUzBaZYD+lEybrcTMWGSRW/CF
 Nft3it02B853GxhnR4bWQ7LtIXYLQjEdkzRWYFWJWx8QK3sYo6TOMgbYyS6P5ROs7Fs1
 qnXtAy/D+c1AztrlLgdyBeFHDG08pyGCZ+hQE+TyiYXF7yta4U9WAU33L9p/hhzELN2a
 DRgFMwT+xQSG/dKxX1X540+PtLcdldj5NPQZ9vVs2l1J+8zEURAZhLxvjHOw0pRnILGo
 PXTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=UWYlG2k/Brng2tcRnik0JT0fnjwpLVOKsVAvc3Cf6uM=;
 b=bgs35LoFgSqOR9tKKjL2wiLapLd+lDtSgUk92D+6VvRHjhSNuHEWz3OfzrU19CwXZP
 NqwBDaDmwM0h/YhmekiLK4q1tBf7nxd0GVFy2K+Du1Pf3pE/vaxKzf9Ve6hSVaQtsx/P
 xVZe6y4ziVu6nx0PRXjDM4nhC4B7hnM22wclN+/HAzZKOV2jX5+ef/N+1YsXuf54aGFY
 T+d9f1qCsyNdJQ5CApKlpXWUivbbNxxpxYkijTkasf0LT/LxVCWQRwYXvi1RiEnpxrDi
 cqsnWGqf5/TCAvmgq9kW4RLlr2/vVVlZVNLNrFPzBG3pdTYEna8qaDpP5kElodOnkXbB
 4ATg==
X-Gm-Message-State: APjAAAWtef8QGbH+u+DvCWEA+TmuBm43BEi5d0q3Z3DaVc0GlPEXQVkq
 DFbMlSUEwkATnkvL4PJ8NE+nSlswbH4=
X-Received: by 2002:a62:584:: with SMTP id 126mr26621954pff.73.1566250689777; 
 Mon, 19 Aug 2019 14:38:09 -0700 (PDT)
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net.
 [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id d2sm13446951pjs.21.2019.08.19.14.38.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Aug 2019 14:38:08 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Mon, 19 Aug 2019 14:36:57 -0700
Message-Id: <20190819213755.26175-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190819213755.26175-1-richard.henderson@linaro.org>
References: <20190819213755.26175-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::542
Subject: [Qemu-devel] [PATCH v2 10/68] target/arm: Simplify op_smlaxxx for
 SMLAL*
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
X-TUID: pTEc2UQ/sn78

Since all of the inputs and outputs are i32, dispense with
the intermediate promotion to i64 and use tcg_gen_add2_i32.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 56ae83a7d0..8557ef831f 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -8148,8 +8148,7 @@ DO_QADDSUB(QDSUB, false, true)
 static bool op_smlaxxx(DisasContext *s, arg_rrrr *a,
                        int add_long, bool nt, bool mt)
 {
-    TCGv_i32 t0, t1;
-    TCGv_i64 t64;
+    TCGv_i32 t0, t1, tl, th;
 
     if (s->thumb
         ? !arm_dc_feature(s, ARM_FEATURE_THUMB_DSP)
@@ -8173,12 +8172,14 @@ static bool op_smlaxxx(DisasContext *s, arg_rrrr *a,
         store_reg(s, a->rd, t0);
         break;
     case 2:
-        t64 = tcg_temp_new_i64();
-        tcg_gen_ext_i32_i64(t64, t0);
+        tl = load_reg(s, a->ra);
+        th = load_reg(s, a->rd);
+        t1 = tcg_const_i32(0);
+        tcg_gen_add2_i32(tl, th, tl, th, t0, t1);
         tcg_temp_free_i32(t0);
-        gen_addq(s, t64, a->ra, a->rd);
-        gen_storeq_reg(s, a->ra, a->rd, t64);
-        tcg_temp_free_i64(t64);
+        tcg_temp_free_i32(t1);
+        store_reg(s, a->ra, tl);
+        store_reg(s, a->rd, th);
         break;
     default:
         g_assert_not_reached();
-- 
2.17.1

