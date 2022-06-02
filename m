Received: by 2002:ac2:4318:0:0:0:0:0 with SMTP id l24csp5196344lfh;
        Thu, 2 Jun 2022 14:51:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxgZMG7fGf6k7CgvFISTrW5W6Vb7r0M3o1uL01gpUfe2Ya/2a1IRFNwbxuYllW7WULIOaUc
X-Received: by 2002:a05:6214:508b:b0:467:de79:4f7d with SMTP id kk11-20020a056214508b00b00467de794f7dmr1103qvb.101.1654206665231;
        Thu, 02 Jun 2022 14:51:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654206665; cv=none;
        d=google.com; s=arc-20160816;
        b=ow10rUqTgepiz8ZEVDpWaEJjw5ouLkAD145vqj6DGWbr/29GyyoVHe9vImMCTkcw19
         E8JyrWdBQy6NwtsmGLpEKbdDZWBaA8uxUz88EY0DzqhxYWQXXkV2BEoLXO/gI0h01Pup
         cNNLQq6/Q1asHUFfEhyjhVcKssBfW25jRqPenwpoAGzV3rruAf1/9tqAgW1xQ3pWheUP
         u+XJQHKSX4OsKWyOxQz/aiMVu3x2aF4sSEL7+P6sPKRTp5aozkUwt7Ev9qYo9NYo/dMf
         hCd1xgQ3xQpJd57B6+4x6dlY8Kf+EXQ52gOLryzsSHyTjcfnLyXpNYoGAUxaxmIMV1wD
         JIUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=80S55FypfkD2P2t6Vkw3PZn9gYfntg1XNKdtyYp1U90=;
        b=zjYDUYMH52UnI7tYc3uPrGc8t16LvmeI0eBTTqLqURz2TRdz3Yyk95aGVDow0dzdyN
         A6M9lHqxwWofgxrgJTzsgp84iEoxTuC3XvwmygqXe3O4Wr7E8qBgYl5KSnG08uJ1Zml2
         5TBRSuW1f+7ym9ahiyqi41Lej5+dWPKyUtnmNole0tpA3Ae6V4pkZxYEZyzp3fxNiJdB
         yyFeSIJXpqaDFM4FT+P92ejwS4JhMinI9JyLpKsbgOf2iN3NGwspzfRkGYNoFnsILX4s
         aE5xZVh70+UABi/yRCrmHBUYYcja12IJmvCmTDWQW0yKCBDWq0Fqpivm8BaiOefj01wZ
         yvfA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DDh1dNJY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z4-20020ac84304000000b002f3cbd31d2dsi2888381qtm.551.2022.06.02.14.51.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 02 Jun 2022 14:51:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DDh1dNJY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nwsie-0006Xl-Mq
	for alex.bennee@linaro.org; Thu, 02 Jun 2022 17:51:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nwsgg-0004Uc-Dh
 for qemu-arm@nongnu.org; Thu, 02 Jun 2022 17:49:02 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:36371)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nwsgc-0008UM-QY
 for qemu-arm@nongnu.org; Thu, 02 Jun 2022 17:49:01 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 u12-20020a17090a1d4c00b001df78c7c209so10641410pju.1
 for <qemu-arm@nongnu.org>; Thu, 02 Jun 2022 14:48:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=80S55FypfkD2P2t6Vkw3PZn9gYfntg1XNKdtyYp1U90=;
 b=DDh1dNJYUj7ab/yKsg7Jp6GsTSGOUo+qthEPoOPyYgwBxq44wGW3N7dSva5qSlc+MP
 FwSsB2KSQHyRNJM8mH8BwVNhJj0sCX7CyAkDm9AV/pe78xRDjcppzOpQUUM1r8XTW8Za
 sk3WuDBruuPIL3i5RngtGXNodvDnFblReRUEOtVkwwcpxuKPCZ90beaAu5M5PE79TAOE
 fuRVQRNon99gv60lmOWJYD7ZAKJf40dbq3crcOO2jPADjIAaYGfo9DLbyViNZTv1TZKo
 uCI6nCpQvdk7BHvxxkh9iqT9zrwNw7/a5ukbMQE8SjtJX2guFAv7ymUDvLEWlN/PMGNC
 /uqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=80S55FypfkD2P2t6Vkw3PZn9gYfntg1XNKdtyYp1U90=;
 b=wb8unaOYPhPzfGvuzAaqFX1p+T4mknClKlt8uXa6cifTHFqhiTErcBndCx8w65dU5h
 XnMwFEv3mmL3L7KprC1FSF4/yzzlHWaDWfjjLb9WUbggDIKGveyK1SXeX3wq6PNcj8NV
 YSlyKs/ziSc/895vV2kNXh7OJKIA2uDUNnFN9RoyKNi16keHT4dgaIa+MLXXfEOeufY9
 qS1TEUUHuQ/kH+aJ21dDbzxGXvE9FFEtcxWsF7nddfgEKqw7UskxAZRlAkYwohA8L+Pc
 Oec8YtF6ktXWquirFMzeuG84ekE8mu0bWYVvxL5abtebYF3ctJ744HbHASDsc9mQHaNF
 LKDw==
X-Gm-Message-State: AOAM530RnsNam/dXWN/wOPkSXFmYFVV8FyeBTI3iVC+TV6NSfkxFFxUm
 4tvxewah72CuGWESQnYU0tZ0glb9i1CQ2w==
X-Received: by 2002:a17:90b:2404:b0:1e3:4db0:f32a with SMTP id
 nr4-20020a17090b240400b001e34db0f32amr14706764pjb.201.1654206537513; 
 Thu, 02 Jun 2022 14:48:57 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 bf7-20020a170902b90700b00163c6ac211fsm3988760plb.111.2022.06.02.14.48.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jun 2022 14:48:57 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 03/71] target/arm: Remove route_to_el2 check from
 sve_exception_el
Date: Thu,  2 Jun 2022 14:47:45 -0700
Message-Id: <20220602214853.496211-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220602214853.496211-1-richard.henderson@linaro.org>
References: <20220602214853.496211-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
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
X-TUID: oIH8tzGcO2+0

We handle this routing in raise_exception.  Promoting the value early
means that we can't directly compare FPEXC_EL and SVEEXC_EL.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 960899022d..8ace3ad533 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -6159,8 +6159,7 @@ int sve_exception_el(CPUARMState *env, int el)
             /* fall through */
         case 0:
         case 2:
-            /* route_to_el2 */
-            return hcr_el2 & HCR_TGE ? 2 : 1;
+            return 1;
         }
 
         /* Check CPACR.FPEN.  */
-- 
2.34.1

