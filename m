Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp2924465lfq;
        Mon, 11 Jan 2021 11:11:43 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx8S1Tkf3+gnMet35H5MgvgMzDx51UASWFEVIEVKL6uJ7fwSm0oRXwWmzqKSD8QwzCTpFGM
X-Received: by 2002:a25:d014:: with SMTP id h20mr1917825ybg.149.1610392303112;
        Mon, 11 Jan 2021 11:11:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1610392303; cv=none;
        d=google.com; s=arc-20160816;
        b=nYL71BB1m6hxXxumueHdGsZYTxc/sz0Gejt2TPpRcxHhiN9YV9vzjs9fiE9eNIqVMW
         BzWHJYdzUAMkfeJthNP7qnkDGGHheKwoBbbm5089YxQTNgxSxjmgiWm8piH1DqBceYrF
         iD8crCe4LypMI6FQoIqq0UNY0OOVwb87uqwEGyMGwV0VNNZahxaa7J1HB4OG5yLX9moU
         swJrC15AdIRbtOnALKJFa7jQSlzCdsAE/1qVpV5wpkf2X+lo7rMY+WLJZxRKBewwgoct
         1ZqPNAsWNeoRR15fIgPXg/Sm3Mj65SqQ46n2AN4Tm7jeZCzC7rSLbOC8BNQ2i1xOE77q
         5F2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=GncTsfZkzDCi87UalR7JxGVcBAUvdECHyv5Jv99YvLY=;
        b=GsfQxhkeDPeG+ge++BoSFYK2QPzaJsaDirTCojz94p7+lbH9/qA54BNqtGI7hmc7Pu
         IlD1714jv+k137rHAm4TWlzoFMAF4quOGJENHw1tzZ9hTNqGZECALWhoifcftBW1Lswn
         T4+49ZiUXH2NrDNlhft5MeNQtZhqONzFQvMWEZSAaP2V5gor3ycq1iX5EsRMkZw1GYDm
         ECQJHeA7QRLtRe/UvGe8ubxChYikABVZBJwJjQ3IFwHxREqPABaDz20G+DeRgeAZ1dlI
         nYBsPFRO2h+bz98vK50bFso0RlgLPbi3EUI3Sf04WFXMY3KmGtTICtCVFgsSXjQOAtn0
         wwDQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="R5g+/ABQ";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e5si565383ybo.330.2021.01.11.11.11.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 11 Jan 2021 11:11:43 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="R5g+/ABQ";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kz2bO-0006Zu-Gs
	for alex.bennee@linaro.org; Mon, 11 Jan 2021 14:11:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47352)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kz2Rw-00067E-FL
 for qemu-arm@nongnu.org; Mon, 11 Jan 2021 14:01:56 -0500
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:33719)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kz2Rj-0006SJ-IV
 for qemu-arm@nongnu.org; Mon, 11 Jan 2021 14:01:56 -0500
Received: by mail-pj1-x1033.google.com with SMTP id w1so338702pjc.0
 for <qemu-arm@nongnu.org>; Mon, 11 Jan 2021 11:01:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GncTsfZkzDCi87UalR7JxGVcBAUvdECHyv5Jv99YvLY=;
 b=R5g+/ABQnTHfK++A9I+6jU7i7jfYIre2xc9V7BStNJh+WEYSjjKhp03MDvP79sZNch
 rqu/2NfadFqXwWkIC58dGrlzbDhsFjnPSDtd80V8TPfkJncxRp17HXHOuYw7zOmSUY58
 QMXNiDnMIXZrKjpf+gdpXryvmGcDE0WU51DBZRyVKunN/0MQ9WyfCFhodwzoJtoPnFM9
 S0CjFcFXZE0JmZINlIixG4EjZ5G+yZnNKniU1m1SdzTpWoePaoLI4K16XSk8bIIUi1Er
 fzhXoFpuh4TCyDaxJFhzlb97ye6Bw4/lfgLB5lpNVYmwxl/X99keHXIohG5hIuBGm73G
 /WjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GncTsfZkzDCi87UalR7JxGVcBAUvdECHyv5Jv99YvLY=;
 b=BWdUdk/ank/bRwoIKtslJds7AmowLUsFkVJ4FKI+WSC4fGr4275dPHskKrsFC0k4Fa
 mxbczenwjAK0F9gVB6VVLSmb97AaNqbIJ/jjiJUICdPAGI4vdsH91HsM0vhPM3kOQKwq
 bw+E90r850VLdBGW7LKXu+N6HiED2XU3ag/buWTRz2PtuKfojpzfdLbsMmBvTzQZDmAD
 y1/ftAGKiPVKoBUOJ72Abk3TXToX5oRhF5FfS6J9lBw25zg5DYblYP7bW1KvZt6+lEby
 cPvoWjBGReHXCoDCHCZs7O3S6vA5AQHDiIxS0rBd4dmP9UNHGl/G3jjWFl5C47w8dVaQ
 hGNw==
X-Gm-Message-State: AOAM533V/ZM+srrHncwreRpNg3sYgw6JDfYtyjGbTuIkHfBZiKu79rSu
 aQggXuiW+lOpzl32PIfwE0HU9g==
X-Received: by 2002:a17:902:bf4a:b029:da:d0b8:6489 with SMTP id
 u10-20020a170902bf4ab02900dad0b86489mr720542pls.58.1610391700948; 
 Mon, 11 Jan 2021 11:01:40 -0800 (PST)
Received: from localhost.localdomain (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id n195sm350395pfd.169.2021.01.11.11.01.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jan 2021 11:01:40 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 14/30] target/arm: Enforce word alignment for LDRD/STRD
Date: Mon, 11 Jan 2021 09:00:57 -1000
Message-Id: <20210111190113.303726-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210111190113.303726-1-richard.henderson@linaro.org>
References: <20210111190113.303726-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: FmbNF6b5WmTh

Buglink: https://bugs.launchpad.net/qemu/+bug/1905356
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index f75987dac4..9cc6a9f83d 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -6475,13 +6475,13 @@ static bool trans_LDRD_rr(DisasContext *s, arg_ldst_rr *a)
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
@@ -6504,13 +6504,13 @@ static bool trans_STRD_rr(DisasContext *s, arg_ldst_rr *a)
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
@@ -6612,13 +6612,13 @@ static bool op_ldrd_ri(DisasContext *s, arg_ldst_ri *a, int rt2)
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
@@ -6651,13 +6651,13 @@ static bool op_strd_ri(DisasContext *s, arg_ldst_ri *a, int rt2)
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

