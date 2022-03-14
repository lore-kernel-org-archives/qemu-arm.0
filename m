Received: by 2002:a05:6512:204:0:0:0:0 with SMTP id a4csp1843173lfo;
        Sun, 13 Mar 2022 21:44:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzCx6liHxUZGCFk65Z4hXH4qi9nX1LjDWuW2fxfXSSo3M/mqQy8WNdNaO8uxm4HG3hla4oI
X-Received: by 2002:a25:cf89:0:b0:628:6550:ed28 with SMTP id f131-20020a25cf89000000b006286550ed28mr17609012ybg.114.1647233060274;
        Sun, 13 Mar 2022 21:44:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1647233060; cv=none;
        d=google.com; s=arc-20160816;
        b=ZBNlgm7hCEDx+GfXqiK5dzBDqQqv6hpIHfCg5mkRGg7/7KtAITBHNLajZCzmRf1+Tm
         Y58Amw4H7Dp4vgJqAXIQgC2RJqZO3/xXKk1EGf2598tvT9dz8Dh8l6sZ2UkQCr2aVOEX
         NqTpeqyd+Fkf2KD+RCI02QNtPeHwvR431YuQYgKTiLrQtdcee3GLbgruUO95jZwvcq2q
         Bi9erSfZenHA6hZpHHDcJK2/NvIrUyO6mcH4IhUKTSsQySN97OCSGnmghH7CiBHV4ZDi
         UY1KjVJSxy6xIphofihbE6rQtB1BaIajOb6FFqX/CtgUQHwMBgKU8z+OM6oll3ypWHKw
         vG4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=LFfrJYY5Ma0BjX1lYohp7IXb94eb73+HfKk9HI5l13k=;
        b=yQoHcUI/VWzxQ7szcqxULj91cjL2zgORUkTyqovl3NrtkAoLoBE0SEElU56R3mAQEC
         liK6BG5TRWZcFUl2PAzU14+6zfw+Md5sYN23rezzTwq92NepRJsAZNmeFTX8l8n4O31/
         A+OmDtiRQKbEYWRK9gJITjbynbJymLAd7/yhle9m+Y2L1X8+X0ZNKBHQys/lVqfocRAl
         gHOCIBKKRwOfkX2BqBwXuZ42UQA2qCfBpWUv+SICFQbJk/cNJ/ZLhjPgCLsNc0LvdpzJ
         UQ4aLbOasw2CZiC0XqtO2hMW3sjn6LvKK9ejfLVfIBf/eAjLp5E444XoS+8cdKZzQ3OT
         KFqw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YrZ3jsnL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b80-20020a253453000000b00628b48a3337si8087401yba.139.2022.03.13.21.44.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 13 Mar 2022 21:44:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YrZ3jsnL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nTcZ9-0003EA-2Q
	for alex.bennee@linaro.org; Mon, 14 Mar 2022 00:44:19 -0400
Received: from eggs.gnu.org ([209.51.188.92]:50018)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nTcY3-0003D4-C9
 for qemu-arm@nongnu.org; Mon, 14 Mar 2022 00:43:11 -0400
Received: from [2607:f8b0:4864:20::436] (port=34508
 helo=mail-pf1-x436.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nTcY1-0004Og-FQ
 for qemu-arm@nongnu.org; Mon, 14 Mar 2022 00:43:11 -0400
Received: by mail-pf1-x436.google.com with SMTP id l8so2740694pfu.1
 for <qemu-arm@nongnu.org>; Sun, 13 Mar 2022 21:43:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LFfrJYY5Ma0BjX1lYohp7IXb94eb73+HfKk9HI5l13k=;
 b=YrZ3jsnLM3czeMzWYH9P3kmmZtzf6Ix9noe7QgMtyHfKkYJ/paQEyfct/TcN1VBY0O
 m0i8/IA+lufPHLkYlQCxIM3VA0jVEHZApmJn+E03Yq2TRtiwDEkp9+0vVp3Um8lSoeCE
 JAvC+U7Yeu15t6FQH/4vz8LUEQ2vIftTeTbsooKzBqDNlY/UYSYOatOpMg6Ti3aN17Vi
 keNzegvIbJytmav8K9zcDBpjImQtSa4SJBmGWY7pH8fLBS0iTcMc4Jy3TRVCutwgxvw/
 sobkF2YCkaE/IgrQ/dDOfXAC9ewN5EkxKvtjwPOuXo8mDVzqFBpa+nIZd41kzRkr00ot
 EAUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LFfrJYY5Ma0BjX1lYohp7IXb94eb73+HfKk9HI5l13k=;
 b=r68NtYgJqrxSmECZIg75yrsRm8UVwKe+UwUT26hVFQCknx0FdsQmlpYLnXh0dywfdP
 C7aIy/bTeUOpStiNkqfk6b0c3FejmMiV7DqeqaB7uS8IpMotUFBFFkNkppJKmoxVI7jh
 Bc5RcBnF06mIG+rR9ou66OYpcflnx+DHbGRUfoxYmErr1Ofm96TspLprXrqu6Poduhye
 KTEZAr+U94CTmHNCEds+52fGaTOM54rvfzMnUsf7GECtwK1IU4AgacSVl8vF3K9BLDYg
 0q/IAdj5zW14RRj8+T1g3Rf5S6pNyKp91Kao2aM0e4gL7m1eX1vXKJcGn3piykmUFEoN
 BTfQ==
X-Gm-Message-State: AOAM530Qyg3Vo7ZCDEAkENJWZ+J/3fkpSpKRHCJ8vAZ+NFkJ0MWyfYDI
 bxYAX7d5mywDLy3Qlt8so9NirA==
X-Received: by 2002:a65:68d6:0:b0:380:7ef:30cf with SMTP id
 k22-20020a6568d6000000b0038007ef30cfmr18269455pgt.271.1647232988120; 
 Sun, 13 Mar 2022 21:43:08 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 l18-20020a056a00141200b004f75395b2cesm18258153pfu.150.2022.03.13.21.43.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Mar 2022 21:43:07 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/3] linux-user/arm: Implement __kernel_memory_barrier
Date: Sun, 13 Mar 2022 21:43:03 -0700
Message-Id: <20220314044305.138794-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220314044305.138794-1-richard.henderson@linaro.org>
References: <20220314044305.138794-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::436
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x436.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm@nongnu.org, laurent@vivier.eu
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: MgzuMg5aexCb

This fallback syscall was stubbed out.
It would only matter for emulating pre-armv6.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/arm/cpu_loop.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/linux-user/arm/cpu_loop.c b/linux-user/arm/cpu_loop.c
index 032e1ffddf..a0e43b261c 100644
--- a/linux-user/arm/cpu_loop.c
+++ b/linux-user/arm/cpu_loop.c
@@ -158,7 +158,7 @@ do_kernel_trap(CPUARMState *env)
 
     switch (env->regs[15]) {
     case 0xffff0fa0: /* __kernel_memory_barrier */
-        /* ??? No-op. Will need to do better for SMP.  */
+        smp_mb();
         break;
     case 0xffff0fc0: /* __kernel_cmpxchg */
          /* XXX: This only works between threads, not between processes.
-- 
2.25.1

