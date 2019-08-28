Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp1185157wrs;
        Wed, 28 Aug 2019 12:39:45 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwaK+Z+ji1CQrhYGb7sS8K/OY2R0nYfmf3Gc8Eud10oPE83HHMN+zn3LoRGhgeNqFwMVv4V
X-Received: by 2002:a17:906:c802:: with SMTP id cx2mr4732435ejb.114.1567021185827;
        Wed, 28 Aug 2019 12:39:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1567021185; cv=none;
        d=google.com; s=arc-20160816;
        b=1KZS6EgdbCR4iuZKbF/U4sMKZn4a4++JPp6PH98paGvUnTWKJ1L/U1sh4haJc8+FSx
         DvNhRIIUQQIpAkKUFOZBvB+MJftuCmDQ8VxRtBCr/Vrd9EGsNsg+Mf/YssxmmYk2OCXd
         3zydRDGE/TcHkc/LCM+D+RQLWqT55Zqfv7O8/LLxAusIOTH5BYFhzpCxVJPgrvtpwEVB
         VIthtuuOaCJUrrdas2bgNxX8iEa/lDJ0ShDMdmcDHlvE5RPJOz4MO2OdQHEWkvB1hfIm
         E8yA8tQVGpFtJQ4oUHmhnAMF4kqEiV26AkZaIyVwBZNuxQmm/7o41gueZyaHB+cIBwMt
         Bj2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=VWPLfRHZRw0RKor1YnAoLBlyaxXRqknq8DXuCG18/ZI=;
        b=MddlIn0NLwVeQ9hP/pDeOmvEIvouKuzlXxWJx//E3VAQh0LMZbMiSj1cGncNWpr1Oc
         PEeVYVZo7lsjcwwWMS2azSQquREsqHSMIo/sy32uWLcJYRXvCmYxgBIvhDYRM1LNui1e
         VQWx9br6dZ2xSdZPnjmC1+HE3T2lFJSoFWpewAxwiu6UFdAqIFwRsJoPNFOrQ8kXL+wk
         xOemlGL19Dv4OWn5IBxEZNLJGyo4TsCNcmjYrqn2jUyq2YVxxCb6Hu1nTIVmooY8Qe0e
         JwvMbGnZP4YR/qeFpl2ZkKZAqEm4tgTtY51f3bVHR9aFAX2A+EfB+YygbjweHS6rDK55
         WjSw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="Sj/JLM41";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 94si1932559edp.163.2019.08.28.12.39.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 28 Aug 2019 12:39:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="Sj/JLM41";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i33nE-0002Ks-3H
	for alex.bennee@linaro.org; Wed, 28 Aug 2019 15:39:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38144)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1i33GP-0003kc-Lh
 for qemu-devel@nongnu.org; Wed, 28 Aug 2019 15:05:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1i33GI-0000II-HG
 for qemu-devel@nongnu.org; Wed, 28 Aug 2019 15:05:47 -0400
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643]:36254)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1i33GH-0000HX-SH
 for qemu-devel@nongnu.org; Wed, 28 Aug 2019 15:05:42 -0400
Received: by mail-pl1-x643.google.com with SMTP id f19so404613plr.3
 for <qemu-devel@nongnu.org>; Wed, 28 Aug 2019 12:05:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=VWPLfRHZRw0RKor1YnAoLBlyaxXRqknq8DXuCG18/ZI=;
 b=Sj/JLM41doP0b6Im247Oh2934+pcd7CxM6+x2kZ4gm0v5hATARvOeHHCraiycrJFil
 PFW9l82pDwBcbIe2MVIoonKZw4WF2aisrLAtUxHvpO8vcmyEYxP1zbLUOctTivDE85Ok
 4PVJ9VU3DrVtYa4GHk05jOzNr3OrQQxWhWGM//rctDzKfnVo6RmN7GNO6gqrU6aUSmC9
 5lE8QvXlJCx9y+jU9CJebiZjDTkNEjcIvado98W8wa1L/qHnHeypRcebUAL+y2lB2NzA
 RIgoqxpFZy5GzDeuJdzAKXqeLE3AeTEIHM6XPSma8+n5NreZ1WTIXaB5RTU6z8+iFy/o
 ssSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=VWPLfRHZRw0RKor1YnAoLBlyaxXRqknq8DXuCG18/ZI=;
 b=aBBlq2q9+4tJxk9VbnoLQDyY4yP70c0tGpwD8Y0UwJ02F2zdWomrtTlyi0k9wcrmYg
 8TxU/OhlJSCZRTsM0m+sZR7+6myIcUpcLj6o+MLJuMZlD0H7JQPXaIlZDHQzHYj1Ku+W
 ltK328/E/163t0C7yf5yibYeseUIAvUr5m07fUlrfBgeW3MmvlZTP5jgoyyygd5WyqRr
 RrivauE9cNVNj4H7OAq97lYFQHdQHBk3AEdMnzpstoNOFP7rZ/IUDz4RxK5A4YepWvIA
 sSsSvux0SaqHe2Q/i7audH0/I0jr2Qnw7Oo67EwLGJg8x1Yovx0lw/w6bU9MT/hIjXA9
 xRAg==
X-Gm-Message-State: APjAAAW0QNOBarsaQMtM60YoXzj+q/lBr8UaiV7SNrTdkUQtZFAVnq43
 N6XC88jaGza3wB/D0QMtBPAn4B1FBHw=
X-Received: by 2002:a17:902:7b97:: with SMTP id
 w23mr5838844pll.283.1567019140318; 
 Wed, 28 Aug 2019 12:05:40 -0700 (PDT)
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net.
 [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id f27sm2967944pgm.60.2019.08.28.12.05.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Aug 2019 12:05:39 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed, 28 Aug 2019 12:04:18 -0700
Message-Id: <20190828190456.30315-32-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190828190456.30315-1-richard.henderson@linaro.org>
References: <20190828190456.30315-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::643
Subject: [Qemu-devel] [PATCH v3 31/69] target/arm: Diagnose base == pc for
 LDM/STM
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
X-TUID: 7lNy9EnsQS7U

We have been using store_reg and not store_reg_for_load when writing
back a loaded value into the base register.  At first glance this is
incorrect when base == pc, however that case is UNPREDICTABLE.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index bfc4508321..812ce5037f 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -9830,7 +9830,7 @@ static bool op_stm(DisasContext *s, arg_ldst_block *a, int min_n)
 
     list = a->list;
     n = ctpop16(list);
-    if (n < min_n) {
+    if (n < min_n || a->rn == 15) {
         unallocated_encoding(s);
         return true;
     }
@@ -9910,7 +9910,7 @@ static bool do_ldm(DisasContext *s, arg_ldst_block *a, int min_n)
 
     list = a->list;
     n = ctpop16(list);
-    if (n < min_n) {
+    if (n < min_n || a->rn == 15) {
         unallocated_encoding(s);
         return true;
     }
@@ -9950,6 +9950,7 @@ static bool do_ldm(DisasContext *s, arg_ldst_block *a, int min_n)
     op_addr_block_post(s, a, addr, n);
 
     if (loaded_base) {
+        /* Note that we reject base == pc above.  */
         store_reg(s, a->rn, loaded_var);
     }
 
-- 
2.17.1

