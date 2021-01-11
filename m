Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp2929854lfq;
        Mon, 11 Jan 2021 11:19:28 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw6eNA7Ys1V5rHR4N5JgMrgGMZ20uaDSg84pl4s07x1EtpXINXg33m2I7y1RM1i9/jiduhe
X-Received: by 2002:a25:4744:: with SMTP id u65mr1979811yba.239.1610392767969;
        Mon, 11 Jan 2021 11:19:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1610392767; cv=none;
        d=google.com; s=arc-20160816;
        b=cUt1t0P0SLne6Zuw7eCpVdOMGxaJLlUUl62Kz9mJxVWJGnORfQN+LWQDfik2/1nZu4
         xzehVfqZ6zREdPITxLXx5C++PhgMcOu/IKXcJyB8rVn9Fzf51ixGkCbSSw8uaAvCpVN9
         X45qOhl3TyOnnwRB2gWX6eN7r0cRRe33P8qf4RsAzjQhSDaYYKgl4ixbgeWQ1kVOnZK5
         z6jwdvnBHQ+v+7NDFfH+SoPV1o4HuOogGCBBpfrBaJCeOGkWD9mWB4ii7nWFlvrmdeLT
         Zyzpww5YQ99+R3B0hO3QgMU14kKP7aCgqwhAyVVWQysIkAfnnw0BJD8srfZX6fJCAdXN
         LeeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=jFhFnE5ZXuq9dWAVT2u9B69HDlRNyiFEVFvSvAG4Tcg=;
        b=xrj/NzRbkiTTZTbvT9yW08J9ycC/5y+JniGlXz0Cc5RBQ2HPp2moYgl4WLBcP914Lh
         jXM7XYuHa50Vx3KXakBtw139bZgVk10cZYsnBZPCoZL57ROX+x/O1JNvC5mTOcHME61H
         iL/GCsFYKLbNV949TjWVAIh85Mi4g6cZc4Ed+IFmseckK03/bnjav9KSJQx6yraxhcXX
         d4c0vpwNxUDJdIgD3Acwbfgrjle2WULzhMFHtsVqTUER3+c6ayXT+DghK1rmXI4MXLWe
         todbVz6qwK5yp2w4ptGrUucB4ZezFzwFWU+quqTa3LTJWZCnaUX3yFipThDB6fgdK7fG
         BQ5A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=lIpNzQmu;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u24si676838ybd.456.2021.01.11.11.19.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 11 Jan 2021 11:19:27 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=lIpNzQmu;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kz2it-0003IY-BK
	for alex.bennee@linaro.org; Mon, 11 Jan 2021 14:19:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kz2Ru-00066e-Gd
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 14:01:56 -0500
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:51059)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kz2Rh-0006Ry-Ah
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 14:01:53 -0500
Received: by mail-pj1-x102f.google.com with SMTP id lj6so106260pjb.0
 for <qemu-devel@nongnu.org>; Mon, 11 Jan 2021 11:01:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jFhFnE5ZXuq9dWAVT2u9B69HDlRNyiFEVFvSvAG4Tcg=;
 b=lIpNzQmuxaYXUBXXW6RpE/j7sfGjRVTAZvHZdHCC7EnXk19y2ck/Y/R+9p6XugvIcg
 8yOVrjjCNXdfOLTZjk0yE5XXajZ1S3T9spTPEcnvLuqxdsplrtjtci461SB67bBvbmFT
 TwehNfNHaSA1jyQSy7YxTMZEoLwOi/CMWS8wzCP/CBU51NZ9aRfwhSDpEveLzCTK2x1p
 cWxaFmco8IQLIX5lvLxG/Qwn/iW1KxUdbJ1vkv8w4RXoVVbVM6jWyumvNWsOGSXAXCit
 /3+nDqABSGvN0VO7SPFnVDRVfrv/uyc/VIC1d9GYQd0ZBUlgOeYCjKmX3z0yAyyfiyPr
 snug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jFhFnE5ZXuq9dWAVT2u9B69HDlRNyiFEVFvSvAG4Tcg=;
 b=XQmEMd6l1VqMxMLws2zayptKYMrVpcx8eEyM2ibW7RZfko7fQFg1ob5IaVz1GoUovk
 1KFIr5/EHFDmwePS3X2v/I3LTMB887R70rFfC4m1eE3U0rT4cOUy5bQFEy8uPDff3vTt
 3qlI+hTQgSVTdYkwX4z5vtg4Ba7RM6VzZsm5wZFqK3V+nNYgg2O8S3xjP3kctCY9JfOn
 lt2qGhgflpKk+nrU/maADRJj/I5/853QP4jHM7LXG8MURaI2N9p/6c047BIc6srC6OQ5
 5T7/waNtb6kcWpUjJHmjk3M2EtC3KUPEk20nhKCR0jwYcknngaA3AaRuhjrmqjUUAioC
 wZOg==
X-Gm-Message-State: AOAM531kjpOmgoMgvJ5vXEw73xA4sEe5bA/PCi2jjaWDXWyKqI2phwHE
 oZMJjU2A7FLTPowvT8qXdDxANliuRdtucQ==
X-Received: by 2002:a17:90a:8c87:: with SMTP id
 b7mr313582pjo.158.1610391697398; 
 Mon, 11 Jan 2021 11:01:37 -0800 (PST)
Received: from localhost.localdomain (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id n195sm350395pfd.169.2021.01.11.11.01.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jan 2021 11:01:36 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 12/30] target/arm: Fix SCTLR_B test for TCGv_i64 load/store
Date: Mon, 11 Jan 2021 09:00:55 -1000
Message-Id: <20210111190113.303726-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210111190113.303726-1-richard.henderson@linaro.org>
References: <20210111190113.303726-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: td0kkTJNE3pf

Just because operating on a TCGv_i64 temporary does not
mean that we're performing a 64-bit operation.  Restrict
the frobbing to actual 64-bit operations.

This bug is not currently visible because all current
users of these two functions always pass MO_64.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index efcb393b99..bf1c0f7279 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -982,7 +982,7 @@ static void gen_aa32_ld_i64(DisasContext *s, TCGv_i64 val, TCGv_i32 a32,
     tcg_gen_qemu_ld_i64(val, addr, index, opc);
 
     /* Not needed for user-mode BE32, where we use MO_BE instead.  */
-    if (!IS_USER_ONLY && s->sctlr_b) {
+    if (!IS_USER_ONLY && s->sctlr_b && (opc & MO_SIZE) == MO_64) {
         tcg_gen_rotri_i64(val, val, 32);
     }
 
@@ -1001,7 +1001,7 @@ static void gen_aa32_st_i64(DisasContext *s, TCGv_i64 val, TCGv_i32 a32,
     TCGv addr = gen_aa32_addr(s, a32, opc);
 
     /* Not needed for user-mode BE32, where we use MO_BE instead.  */
-    if (!IS_USER_ONLY && s->sctlr_b) {
+    if (!IS_USER_ONLY && s->sctlr_b && (opc & MO_SIZE) == MO_64) {
         TCGv_i64 tmp = tcg_temp_new_i64();
         tcg_gen_rotri_i64(tmp, val, 32);
         tcg_gen_qemu_st_i64(tmp, addr, index, opc);
-- 
2.25.1

