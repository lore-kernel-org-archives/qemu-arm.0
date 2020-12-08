Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp4232757lfb;
        Tue, 8 Dec 2020 10:02:38 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz7cf+cGNfBzst2f0sVHSLj4dNyyr9gWWjyyPwtChp/HWapE3SwuW/Oq28EFrbafmuOrLcb
X-Received: by 2002:a25:b814:: with SMTP id v20mr32335354ybj.323.1607450558123;
        Tue, 08 Dec 2020 10:02:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1607450558; cv=none;
        d=google.com; s=arc-20160816;
        b=sutSESMfDIbgqcwvMikLkHg2C0+8DD4mEP76B41VDPyrciXN1PQiV8BBgVGRWxR27e
         T0uaM6Y6WaJxZjotYpijX+Sul33c+UUpMXIWmuLGd9DO0esbjgBBZ53IzyVl/nJAaAoq
         92bauaSNU1Kmqc7WK5FtFqiZNRoGSUv35d+0e8+9+kwP3TM9+OqjyHKQDcMb19TAYyMH
         HqAWtgjrAm0vGiefN2E9xFArrxafpaf05ARfoDYaBHt90PySThtloLewRBZYtFldYIt2
         ub7usb3W3HgxBEaqEWHxQQn+6C5AGVH+OA1SEgEstUrGcejaTZQhVnrl31mRME0PM9Js
         oRJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=BbcpleEZKyhprJSQbmMTNOGh64QQmS1NjHgoZYuCqSw=;
        b=C4KdQZpNSEQLVwqQCIZL8iAbcWbbq9Y55ahvrIXtFVGwwvF43UwzQfgQwNiK4IN5ja
         UX+TMEKMzP+1I3+KQ2Ty6SZmOggrkUifE7hniochad0PK/XbdgTeCgV2C/jZ9kGywnUs
         vNCRjYZv+obllgY4ReC5U7AMFhUcnRSDh0JgILes4yWZGbmb0cTcMO6XYt5xDZMdZ6hh
         mvfaqMnwxx+h0n81h9pQAQ0DnTYLUvC3kiZsPDJiKUSqdcMpTGulAGSxgTk9oYUbGndZ
         aRwTUyhCr8D0xuLbC9xH+ES6wejKWEoEobZJvCWwjmaZEu4QfBSmuWpwv57fWEIRBRyZ
         PV2g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=NRrPdEVV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n67si13927011yba.35.2020.12.08.10.02.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 08 Dec 2020 10:02:38 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=NRrPdEVV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kmhJt-000879-F4
	for alex.bennee@linaro.org; Tue, 08 Dec 2020 13:02:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56856)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kmhIw-0007a5-Jc
 for qemu-arm@nongnu.org; Tue, 08 Dec 2020 13:01:38 -0500
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243]:39239)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kmhIm-0006Kt-53
 for qemu-arm@nongnu.org; Tue, 08 Dec 2020 13:01:38 -0500
Received: by mail-oi1-x243.google.com with SMTP id v85so9734587oia.6
 for <qemu-arm@nongnu.org>; Tue, 08 Dec 2020 10:01:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BbcpleEZKyhprJSQbmMTNOGh64QQmS1NjHgoZYuCqSw=;
 b=NRrPdEVVkQlX9xp4tMaisqz23qIimHNK4rKLvD9M03ojTP6jJY6YiqRkgTWCVZIi3W
 SZc922+gvlV+VWKTDA3Ny6jHvjahSWq9icDP2T8YrzcjW1IzLLkh7AYIr+7GJoxhLP3y
 HVZgO+XeVI2Bj2ZpSkyWahoXm+jlbg96OlVYlL9WDLF0XF59RRa9qRP6EmcK+nlmqkX1
 fIrBKQ+m9SWcVuUJmg5b3javhQtDCelCDAr/oWjXgzOchYFMI9FckEzBV/zJfe7LD8Z5
 vj//7PQp0YCHtxwJJLwali2tD1uFAjsHNLzPt4tH5okvM2Br0xXbsTuv18rrXDVz1bvd
 3xcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BbcpleEZKyhprJSQbmMTNOGh64QQmS1NjHgoZYuCqSw=;
 b=Q8vDdS63R2QTYrn8OpTGmmFy0EZ58XvPIktdb3Ug2/kHwO2VqKkNomCkCItSFtebMf
 ZbXsUsrl96kOkjEjybLwiBw7uz1Ra1fsHuIMwYjZvtDkYhw/54Qwu64YyNah0CSQhv0X
 8brXnJJ9umhq7RtbptDa9C3rBfHyOznM9YIneFTyapvYr+1JltbwBlfE8xkYNIXWw/5A
 j0tRKhUZdfeLKTD88cCcT2SMtG/CDOImlca2Zk8RRbn6gSJwOE9IoEOMinwSORLmYCN1
 gcpPeXKQWEoJjhWDMQnXo7Oeb9QYc0zx7GrwWrYkekJM0ssB5Eh7hJNv99qCdrqkQw6Q
 XuZQ==
X-Gm-Message-State: AOAM532u6soGbFKlE8W7McgTyJXojB+3GBI3j6Aqib1LuztCbfVe1XKN
 IyWZaNpEKDWlUvp9AERLBEcuCQ==
X-Received: by 2002:a05:6808:a1a:: with SMTP id
 n26mr3636377oij.94.1607450486901; 
 Tue, 08 Dec 2020 10:01:26 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id k20sm3886805oig.35.2020.12.08.10.01.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Dec 2020 10:01:25 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 04/24] target/arm: Merge gen_aa32_frob64 into
 gen_aa32_ld_i64
Date: Tue,  8 Dec 2020 12:00:58 -0600
Message-Id: <20201208180118.157911-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201208180118.157911-1-richard.henderson@linaro.org>
References: <20201208180118.157911-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::243;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x243.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: EKhwGizWSiG2

This is the only caller.  Adjust some commentary to talk
about SCTLR_B instead of the vanishing function.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 37 ++++++++++++++++---------------------
 1 file changed, 16 insertions(+), 21 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 7b3ebf44ae..f35d376341 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -942,20 +942,17 @@ static void gen_aa32_st_i32(DisasContext *s, TCGv_i32 val, TCGv_i32 a32,
         gen_aa32_st_i32(s, val, a32, index, OPC);                       \
     }
 
-static inline void gen_aa32_frob64(DisasContext *s, TCGv_i64 val)
-{
-    /* Not needed for user-mode BE32, where we use MO_BE instead.  */
-    if (!IS_USER_ONLY && s->sctlr_b) {
-        tcg_gen_rotri_i64(val, val, 32);
-    }
-}
-
 static void gen_aa32_ld_i64(DisasContext *s, TCGv_i64 val, TCGv_i32 a32,
                             int index, MemOp opc)
 {
     TCGv addr = gen_aa32_addr(s, a32, opc);
     tcg_gen_qemu_ld_i64(val, addr, index, opc);
-    gen_aa32_frob64(s, val);
+
+    /* Not needed for user-mode BE32, where we use MO_BE instead.  */
+    if (!IS_USER_ONLY && s->sctlr_b) {
+        tcg_gen_rotri_i64(val, val, 32);
+    }
+
     tcg_temp_free(addr);
 }
 
@@ -4921,16 +4918,13 @@ static void gen_load_exclusive(DisasContext *s, int rt, int rt2,
         TCGv_i32 tmp2 = tcg_temp_new_i32();
         TCGv_i64 t64 = tcg_temp_new_i64();
 
-        /* For AArch32, architecturally the 32-bit word at the lowest
+        /*
+         * For AArch32, architecturally the 32-bit word at the lowest
          * address is always Rt and the one at addr+4 is Rt2, even if
          * the CPU is big-endian. That means we don't want to do a
-         * gen_aa32_ld_i64(), which invokes gen_aa32_frob64() as if
-         * for an architecturally 64-bit access, but instead do a
-         * 64-bit access using MO_BE if appropriate and then split
-         * the two halves.
-         * This only makes a difference for BE32 user-mode, where
-         * frob64() must not flip the two halves of the 64-bit data
-         * but this code must treat BE32 user-mode like BE32 system.
+         * gen_aa32_ld_i64(), which checks SCTLR_B as if for an
+         * architecturally 64-bit access, but instead do a 64-bit access
+         * using MO_BE if appropriate and then split the two halves.
          */
         TCGv taddr = gen_aa32_addr(s, addr, opc);
 
@@ -4990,14 +4984,15 @@ static void gen_store_exclusive(DisasContext *s, int rd, int rt, int rt2,
         TCGv_i64 n64 = tcg_temp_new_i64();
 
         t2 = load_reg(s, rt2);
-        /* For AArch32, architecturally the 32-bit word at the lowest
+
+        /*
+         * For AArch32, architecturally the 32-bit word at the lowest
          * address is always Rt and the one at addr+4 is Rt2, even if
          * the CPU is big-endian. Since we're going to treat this as a
          * single 64-bit BE store, we need to put the two halves in the
          * opposite order for BE to LE, so that they end up in the right
-         * places.
-         * We don't want gen_aa32_frob64() because that does the wrong
-         * thing for BE32 usermode.
+         * places.  We don't want gen_aa32_st_i64, because that checks
+         * SCTLR_B as if for an architectural 64-bit access.
          */
         if (s->be_data == MO_BE) {
             tcg_gen_concat_i32_i64(n64, t2, t1);
-- 
2.25.1

