Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp2930743lfq;
        Mon, 11 Jan 2021 11:20:40 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzXeq9/1tYMdeKScr3orCJcxIcRsEbxiLpRZBjDIqG3WnoCxenrZtgbUhghjxOxlN/gMafX
X-Received: by 2002:a25:2c58:: with SMTP id s85mr1977938ybs.366.1610392840579;
        Mon, 11 Jan 2021 11:20:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1610392840; cv=none;
        d=google.com; s=arc-20160816;
        b=SrsxgUXj83aKxZtB+xtQVItL5zLlSR8O7FNwMyKOhltIs+mrvox9vtbO8cqRiGPniZ
         oaBbgkennqr9UtR95onxMn+pS+CzklteEjbIqZUW16VbMZrU3ADJy48hsd2znazi1kJ7
         suVGvdu8+5voXlUwrwwU3uekknhWcY7IeIU8HtUNT3W/b57DxTTfzlkcyqRrk/l8Ns8/
         dYcsmUNu8ei8V5KFiSo4BWjYJgvVQD7nKqnoU3hwjS2D7vNaMhIftZgN3K5MdsZm6NhD
         ThaO31jNo8ZJ4HlOBql9224xo3WvbY0Bh+BJs+/+2/RK4Tc8Ttk0eH/FW0biJWb61C0v
         AboQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=+VZ34zw/gJ5eF9hiq6PjNGF/Zdf/LyRPrp4QbqxhsNY=;
        b=c2XRksS7iFNLtPNdKbwke2zZBgW0Dpxiloj/F/X1sUuBv/HOezn+Qh+ISpvjvV4NFQ
         HSj1TzO3DANtGyrG9om2PKsphYTfMjESK+9sRD5Ied90IJo9o0uq92VXjZ5syYVyPfnl
         sOQYIoz0nHaHesns6IT8CnIsDEk408LPTxNfHiyAxL/a53ZraDiyxGqx99ORtuKIU9DA
         haEYp9V7IJc8iMSam1LJdCA+n+n4eXW84xH1T55+5CqcY1EzqPkh+ACdEHvVSkD4yPui
         px3xaKosSavuUbwR680ZfRSAXiE6Pgm2XEUfj7JlCaTB6kvwZDtc15GrldtjK9P34qMH
         YlSA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=UTkxvt+q;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i15si556531ybk.325.2021.01.11.11.20.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 11 Jan 2021 11:20:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=UTkxvt+q;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kz2k3-0005Eh-TM
	for alex.bennee@linaro.org; Mon, 11 Jan 2021 14:20:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kz2Rz-0006DZ-3A
 for qemu-arm@nongnu.org; Mon, 11 Jan 2021 14:01:59 -0500
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a]:34106)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kz2Rs-0006TA-IV
 for qemu-arm@nongnu.org; Mon, 11 Jan 2021 14:01:58 -0500
Received: by mail-pl1-x62a.google.com with SMTP id t6so355067plq.1
 for <qemu-arm@nongnu.org>; Mon, 11 Jan 2021 11:01:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+VZ34zw/gJ5eF9hiq6PjNGF/Zdf/LyRPrp4QbqxhsNY=;
 b=UTkxvt+qVNsEy8H580vKPZh1VXl1wdWywnr8powCEkGoe29AC2yEk1/q69xuBFW3GI
 bnh0eRwEWMGCOppsK5LDYWjMUwIpMR2v4ey9M4L8yD9VPTBYGd5UTC8C4iuZUrWNJFjK
 RkPfbJO9GoQsqU6QOIaTJdUAqYX5NAR/Aj6pbhOIiump9a1yAZXdFMHpwgqR+pKY0VrG
 nwR8ESLfRU2vNvSY964iAr7OfPtM4fbIEBelPnUplBSUHBiOj4onzlRwPhau2tZkm1bF
 YAUdrjV1C4JEo3hc++LZQm1fv1aQZWq7aAwPpGwuQHLkDazyss5C2fYb3sgNeXqmmRvt
 b8lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+VZ34zw/gJ5eF9hiq6PjNGF/Zdf/LyRPrp4QbqxhsNY=;
 b=B5il7EmFQEHqx0wbyma0BJkj/ZzV48sbm+wEtZ/x8Y37A2aG66r6b5+fjouR0sS/Gr
 zDwjMhpiczDH9ZG/BBETIDufYlYDQXoBHx8JRntxJJLfdvNrvhVCJnEy9owGbnP+iQqV
 rSu845Mt9Dam7ypQmk8Kjj5hgGChCwH0GITtVFGKDdEsoh67SzALWoNHG+XuYWOeQ3fz
 X89u48c9PolQszoU2f0XMPtE0aJkg/5NvRxgM6XrOvq8RXezal/KnAXq5/BQquo7vyG/
 kvrKh4audYudMeSgcdf0XjEhvIX5hu9XLL4gmv7p5L2FoBKoHA74I5QDNyNn6kOU4A8R
 1j0A==
X-Gm-Message-State: AOAM530mujAo6W/i5b3btKtKyNqGLeDtPKFZjmNaICC6N78cE6Z0KAY6
 sEv2LpxqXzj1bgxD0WJG7yk6qg==
X-Received: by 2002:a17:90a:eacf:: with SMTP id
 ev15mr309212pjb.174.1610391707934; 
 Mon, 11 Jan 2021 11:01:47 -0800 (PST)
Received: from localhost.localdomain (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id n195sm350395pfd.169.2021.01.11.11.01.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jan 2021 11:01:47 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 18/30] target/arm: Enforce alignment for SRS
Date: Mon, 11 Jan 2021 09:01:01 -1000
Message-Id: <20210111190113.303726-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210111190113.303726-1-richard.henderson@linaro.org>
References: <20210111190113.303726-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
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
X-TUID: bsXKPtFG1svo

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index a0d543ec1f..3057d102f2 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -5170,11 +5170,11 @@ static void gen_srs(DisasContext *s,
     }
     tcg_gen_addi_i32(addr, addr, offset);
     tmp = load_reg(s, 14);
-    gen_aa32_st32(s, tmp, addr, get_mem_index(s));
+    gen_aa32_st_i32(s, tmp, addr, get_mem_index(s), MO_UL | MO_ALIGN);
     tcg_temp_free_i32(tmp);
     tmp = load_cpu_field(spsr);
     tcg_gen_addi_i32(addr, addr, 4);
-    gen_aa32_st32(s, tmp, addr, get_mem_index(s));
+    gen_aa32_st_i32(s, tmp, addr, get_mem_index(s), MO_UL | MO_ALIGN);
     tcg_temp_free_i32(tmp);
     if (writeback) {
         switch (amode) {
-- 
2.25.1

