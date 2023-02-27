Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp4304376ejc;
        Sun, 26 Feb 2023 21:56:41 -0800 (PST)
X-Google-Smtp-Source: AK7set/pSJd5Swgb1iWWBwUUxiburTzn3jdDjngPvr7t+N2S7WT9DA2uwk0bLw8qXuFSqsOtP2A/
X-Received: by 2002:a05:622a:1101:b0:3b9:b703:d803 with SMTP id e1-20020a05622a110100b003b9b703d803mr40897974qty.3.1677477401231;
        Sun, 26 Feb 2023 21:56:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677477401; cv=none;
        d=google.com; s=arc-20160816;
        b=uAESHePBO5CBvChZUfD45WHU4+HY5GUmrvzpWdfehOPS1uE/g4b8Jq0ynARmXxm9gy
         k7y4zTZGgqQYoov2HEB9D5iGjnEdKB6EBZ+uX4yeITtRXEUYwFbo/KOi+XLebIqXgpju
         +QziJpwvxtHCj0QBMqMI08Jhbh6lhiqfc6aScpEgfw8Xx/r6b87kyPXD6Su2q36FtyKy
         Y6p+lOYcx+MYVpPZPxqc2fVJOuqlYzw7yro7mgf/YNf6p1+tZ1EGKi+FeWy3QiFCxEs8
         5o3mZqmIYyvs2/ULmXedAP2wuWqxQZzPbM7XLZ1MmcoxnggqnOf0KATn7yFsmLsN0T/t
         25qQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=8N7xotiHYXic1O+ZngEc/VLZwzQZsxzh55isgdpz8J8=;
        b=nrmAbtOO7iefkGqqt37OZF3fX4FUDpDRHC0z8iJr+Ebfb0NeTHp3kNMiw8wrcaQ3Lo
         NaIOWAfPdfLxNkKdvyyjJ9+VzWpMZsYyHK2kqcTkw/BbrI/jCcRptyYMcVJJPAxcyPms
         KqQ3Oq2p3qVYX8EJd5yO1NxBj41yVZUzClgPL0xFrw7aB5SvI/4aC7DjDF+fiKOYYOXG
         FR38HclpNcZ2r0IBF6a/TU18jn8TpjAmOuRTGmjEmRoGZH+BtS7WHdsxSGgv303j90/Q
         pqkgzkkniZaY8rCvmzhfT4VuYI5BZmg87gE+PJsshVItik/C8lJOT81vfJjItmj+/6+u
         Mq+Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="ZUVtD/F2";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y18-20020a37f612000000b006fee8832cb6si5278210qkj.177.2023.02.26.21.56.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 26 Feb 2023 21:56:41 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="ZUVtD/F2";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWWOE-0007sT-Hi; Mon, 27 Feb 2023 00:49:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWN7-0003bz-6C
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 00:48:25 -0500
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWN4-0007W4-Mq
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 00:48:24 -0500
Received: by mail-pl1-x630.google.com with SMTP id i10so5550240plr.9
 for <qemu-devel@nongnu.org>; Sun, 26 Feb 2023 21:48:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8N7xotiHYXic1O+ZngEc/VLZwzQZsxzh55isgdpz8J8=;
 b=ZUVtD/F27vUyfCT6aiJTqZlp5XxOntjL3saEiLCHem5ik5o4QMTo2TkY6IU3yk+jtO
 6XaNAlMwh+0XEfs7VG9dOApUhOo0ErL9GHPGX3IyCGUw/NOl3ihpEH29tF/ak6BpzkyH
 oEZU6OwYX+SF43iX2uD2KL2itlS3mKUUTgJr6EbYfdD3Fs94fJzS6NIaT+HK2krsJZ2q
 y0k6E9hfKGU1952i7wldz83hLdTSHHcA0mQtVAUWWgMFlFeEFGsrIxKWYU5oQ7pjwXFj
 uyz06cQeYXdG/q4Sw7P2qH0duLQwb2Whv17aMwzti/x+D0YBywBMNEwlVM++UX/vY8rT
 iIqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8N7xotiHYXic1O+ZngEc/VLZwzQZsxzh55isgdpz8J8=;
 b=O8zfdVhFav3CNwaCMP33QhAUQUtXUoaWlathE7NW1d3u+v12xgN4FneG4nDwd/5QMX
 32ZLMIUUjoKIY80UqUojdsphgttGPndZlXZ1gQjao1IrV7ri4uA3exuQo3Dk7XtjtOsC
 PvK4IxTrRF9Zw2M5PMfkKWHHWBKO0GAmehzwAOcLJG9s9dtGHaxikj35crP2Wxi3yzol
 YGVgDEyUPJd0WUJl1uJDCWw/yj103lMXJHqEOk4kuRFM/eAgvFwKOHxCYfBL8IrbixcV
 q6yXZVgHYmb4HlMqJrp85GZUNFo+1W9fdmhHPeVwf3Y593RYO8qnrNZ/jLAMNO+opGD8
 DC5Q==
X-Gm-Message-State: AO0yUKXrTP3PJbFKI2dQmd3djqdjq3BzmnJ9w4cLvEh1MAMYi00G+q4n
 Pw740ib+jeXI7HEIncsXMuhytBJSjsiWWyfgNfY=
X-Received: by 2002:a17:902:d48e:b0:19d:1230:439b with SMTP id
 c14-20020a170902d48e00b0019d1230439bmr3152137plg.63.1677476901086; 
 Sun, 26 Feb 2023 21:48:21 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 im16-20020a170902bb1000b0019a983f0119sm3553986plb.307.2023.02.26.21.48.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Feb 2023 21:48:20 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com
Subject: [PATCH 59/70] target/tricore: Use setcondi instead of explicit
 allocation
Date: Sun, 26 Feb 2023 19:42:22 -1000
Message-Id: <20230227054233.390271-60-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227054233.390271-1-richard.henderson@linaro.org>
References: <20230227054233.390271-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: k+b+T02MZ72G

This removes the only use of temp.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/tricore/translate.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/target/tricore/translate.c b/target/tricore/translate.c
index d5129f22f5..6b7b876808 100644
--- a/target/tricore/translate.c
+++ b/target/tricore/translate.c
@@ -3506,17 +3506,14 @@ static void decode_sr_accu(DisasContext *ctx)
 {
     uint32_t op2;
     uint32_t r1;
-    TCGv temp;
 
     r1 = MASK_OP_SR_S1D(ctx->opcode);
     op2 = MASK_OP_SR_OP2(ctx->opcode);
 
     switch (op2) {
     case OPC2_16_SR_RSUB:
-        /* overflow only if r1 = -0x80000000 */
-        temp = tcg_const_i32(-0x80000000);
-        /* calc V bit */
-        tcg_gen_setcond_tl(TCG_COND_EQ, cpu_PSW_V, cpu_gpr_d[r1], temp);
+        /* calc V bit -- overflow only if r1 = -0x80000000 */
+        tcg_gen_setcondi_tl(TCG_COND_EQ, cpu_PSW_V, cpu_gpr_d[r1], -0x80000000);
         tcg_gen_shli_tl(cpu_PSW_V, cpu_PSW_V, 31);
         /* calc SV bit */
         tcg_gen_or_tl(cpu_PSW_SV, cpu_PSW_SV, cpu_PSW_V);
-- 
2.34.1

