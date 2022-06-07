Received: by 2002:a19:ee12:0:0:0:0:0 with SMTP id g18csp1807463lfb;
        Mon, 6 Jun 2022 20:02:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyM1Msli/b1QXHdShGtaB8VGwV/PS7wB0sIOcRVOW/re+8HamNphT5fiS/wlZ6WQfiXVRYg
X-Received: by 2002:a05:620a:2807:b0:6a6:7055:48a0 with SMTP id f7-20020a05620a280700b006a6705548a0mr18234462qkp.8.1654570941598;
        Mon, 06 Jun 2022 20:02:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654570941; cv=none;
        d=google.com; s=arc-20160816;
        b=kOEshmohJIsFIVVanJ++hX12fXEd4p2EMPWOj6zm925Yi0SMbAYi3guN/bOUTP0yF9
         je1lZktCOahy+a/1H3u91sfDVQ0839Y5WRx+WXLy2V2XpeEqjxLIouqoxub4SfUhd1Mi
         fjRRYBDfjjhBj7Zneevw58C3mU2RrBLUbeQBT2rWoD8IWqHqu4Y/rc+Hk+Q03xztWaWN
         zkeTXlwZ1icKQjO6pFKNznyH+3zSfBkP79kRS8FiEwt23t7YCCphFstfKz4Jeiw8RxeR
         vBi4DMMw/2xmpL6Uu342wscy4YmoXhz8deyFEPaofsO+I/ClpmRDHbq7uIHfSCd5/CXQ
         7zIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=wQ71nJahwuqq+z7DVE0+r1oElsGD+n7N1FiHPA9m6ck=;
        b=mBLYBToAaM+IePrjctDjal2qDZOTIjWKguwfYjGepwYDCtFmS64syM/gWiAexn5CHa
         NQ4n05oypk/Yb8j9VMU3MFBJE1CRlYDuvdfxDUYCLbJ3mcVx2rKj9kK0oGAzup0IZYC/
         eJH/lygjUd/8IKjKg9Svlb69vmcSAm9Rf1Q4XgjcX/o2h65BUn56YxXnhSx8Vx7bQTSL
         G6IdvYR3mBlPBPY+pM/sva+wRi+t5H0Ayp/DhnOGCLAohYsT3+uSSBCUzU1IZisSlnAH
         WyuolpgD0ezYc75Y3AOuqFaCrB5Vvca9yaJw30rdraflcUKvLth1mee/1UJ5pUcng40y
         Mwqg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vAFIFBzf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r18-20020ac85c92000000b00304ea3d2f54si3170824qta.304.2022.06.06.20.02.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 Jun 2022 20:02:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vAFIFBzf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nyPU5-000093-49
	for alex.bennee@linaro.org; Mon, 06 Jun 2022 23:02:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyPGB-0007T2-O5
 for qemu-arm@nongnu.org; Mon, 06 Jun 2022 22:47:59 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b]:36530)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyPGA-0000LV-76
 for qemu-arm@nongnu.org; Mon, 06 Jun 2022 22:47:59 -0400
Received: by mail-pf1-x42b.google.com with SMTP id 15so14288625pfy.3
 for <qemu-arm@nongnu.org>; Mon, 06 Jun 2022 19:47:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wQ71nJahwuqq+z7DVE0+r1oElsGD+n7N1FiHPA9m6ck=;
 b=vAFIFBzfip9YbJuILHAJ+0Ll9RvT/j5oI5SOqM7O7iUGgrLjL0xZNYU0KPwQnajshS
 szox5ZfepniHVgen2HiepStLT589/WcYr2nmXLPWSjBVNby2XqulbdIyNMy/QMXa0pBm
 /aV3M2BcwDMz5T4yT9ijOTzG/sbi2gJ7wq1RIbi/0wmDer7//CscuYMqOx+HTJXCcZ29
 pBiGl8Fz2x+dD+UZr5p0r3JpLX0ZyqoPuAR91yC1bYNOR0bp3yVm+cygBcxPow3LGFH6
 EsEDJ/2v7S/KrBLRIw8uOdTunIcPj+XvdmQ1JF58KWrd1vo8bRfXU3rhvsVB6ZU4W+dm
 RNVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wQ71nJahwuqq+z7DVE0+r1oElsGD+n7N1FiHPA9m6ck=;
 b=1a4KsOqlvNEKC0i4m1VW98iMABM0USbEcyy7f/Xf2JiiHW6h8OgRe3GFpf3jcz0xWn
 0qmlzaWzkBLRMCEeVN41KwyiexGES44hqUNqDsKSgb4bBPuM3u5cmJEo468aA3BVXlge
 pKFcWUoVh9w3gWkS33AW0n/YFMHM2ZKK3kSFZA2wdnPZ+bkJwKppt1XQE+fyvo7QBb+E
 q4mY6y2ZY4QErlbMARiT7UfSMZt7EvqEkweKOZ3p3uuYSwjW0dmLB55CLgIfbngFo1yN
 iiAijbFWjz6Txw+NchYvCKjRNwzbk7pp1XR0aQndGbE3+DFjCWo1TKIvQudXfzjIM3aU
 UoZA==
X-Gm-Message-State: AOAM532ilq2GD0x+ZqucqbXY5JKQ20YJWLZLP4Q9Tw/1SsJALfAUkbtM
 LZgf/JyVS8KVYR0Eh5fwHR3HqQ==
X-Received: by 2002:a05:6a00:130e:b0:51b:c19c:44b0 with SMTP id
 j14-20020a056a00130e00b0051bc19c44b0mr27422448pfu.21.1654570077371; 
 Mon, 06 Jun 2022 19:47:57 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:d3db:cca:e5c9:6531])
 by smtp.gmail.com with ESMTPSA id
 y26-20020aa7805a000000b0051876d83714sm7476904pfm.196.2022.06.06.19.47.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jun 2022 19:47:56 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v2 25/25] target/arm: Fix Secure PL1 tests in fp_exception_el
Date: Mon,  6 Jun 2022 19:47:34 -0700
Message-Id: <20220607024734.541321-26-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220607024734.541321-1-richard.henderson@linaro.org>
References: <20220607024734.541321-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: eRGkg8zJKxc+

We were using arm_is_secure and is_a64, which are
tests against the current EL, as opposed to
arm_el_is_aa64 and arm_is_secure_below_el3, which
can be applied to a different EL than current.
Consolidate the two tests.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 23 +++++++++--------------
 1 file changed, 9 insertions(+), 14 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index eeca1a5dc8..1d81a01c94 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -13400,27 +13400,22 @@ int fp_exception_el(CPUARMState *env, int cur_el)
         int fpen = FIELD_EX64(env->cp15.cpacr_el1, CPACR_EL1, FPEN);
 
         switch (fpen) {
+        case 1:
+            if (cur_el != 0) {
+                break;
+            }
+            /* fall through */
         case 0:
         case 2:
-            if (cur_el == 0 || cur_el == 1) {
-                /* Trap to PL1, which might be EL1 or EL3 */
-                if (arm_is_secure(env) && !arm_el_is_aa64(env, 3)) {
-                    return 3;
-                }
-                return 1;
-            }
-            if (cur_el == 3 && !is_a64(env)) {
-                /* Secure PL1 running at EL3 */
+            /* Trap from Secure PL0 or PL1 to Secure PL1. */
+            if (!arm_el_is_aa64(env, 3)
+                && (cur_el == 3 || arm_is_secure_below_el3(env))) {
                 return 3;
             }
-            break;
-        case 1:
-            if (cur_el == 0) {
+            if (cur_el <= 1) {
                 return 1;
             }
             break;
-        case 3:
-            break;
         }
     }
 
-- 
2.34.1

