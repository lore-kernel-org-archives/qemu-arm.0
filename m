Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp8337220wrv;
        Thu, 8 Aug 2019 13:27:38 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzM1Y8/zyiImDY92CdtgzxQtgxMnJfY/kgi6TUKc7GcGP83ObVsPPztHhQNsHUAQlBNqN4W
X-Received: by 2002:a50:9871:: with SMTP id h46mr18000262edb.69.1565296058929;
        Thu, 08 Aug 2019 13:27:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1565296058; cv=none;
        d=google.com; s=arc-20160816;
        b=teBcjkK6xBikFLw2sePhEvM07U9LH0N7H+fssNSu541DMG2hEZHPMCX2C2tN0kJE3n
         JEf9cH8lSfYMjGcTN9DPFhvp/vDRjSObprTQMtIUFKX5RprSLWMkfhjEMUPTMrwMMUrj
         PjZOgmuo8ui2Ah1RDC3ruvsl6WzTHHDXxXNst/0my3GxhTfFaPG44m2mWdvJlmXyAKvY
         y65+3hIj59XTgy3N7JgXDvLaNFyQfokBoKlTFehUgvirw3wz68W55ZwDbtyLHUfPyNnv
         m0SrtvL+cGK239ye97HLe5cO2MphniGFwfWud2E2Yhx1T3M0F9YSYPSd9fgHRlktVdPO
         nwAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=otP5Jhfl1E+0A9Fm71GI7ndCATRFA/GRNsznhHQJJms=;
        b=oF0BaWNCAS1pbAM424FlnJgKlUUEMIIEt7JFN5LDQn7flyPmErL6MfMhI5+QL3VoxK
         p3Cm9qX8YEw3uSD0KTBViyigJDKDbjOhAuJZnQkpM6AJuD3kuUi93tq/Sw6wGDbBxDLj
         heDZCaONRz4Yg0qU891lAsmeKpVs4jnmWKDCrQ61384XQ1uAq1g0dvqum6y000WJWBmD
         YW7VmVR2CRZGiMbKy88NJKvapCEKKuxo8Ck1fcBF1QhMalGKzunGaUME76HyODRciRjS
         HY921npwKG9lVt3yDQg77lqFd3ciND3OeveIULPN/z4saIZcfAdMmcFnZpWVaX/UBAgF
         pfkA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="U6D/k8pu";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c15si37666975edc.361.2019.08.08.13.27.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 08 Aug 2019 13:27:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="U6D/k8pu";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hvp0b-0001lG-Tf
	for alex.bennee@linaro.org; Thu, 08 Aug 2019 16:27:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59748)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richard.henderson@linaro.org>) id 1hvozO-0006wz-34
 for qemu-arm@nongnu.org; Thu, 08 Aug 2019 16:26:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hvozN-0001CJ-3r
 for qemu-arm@nongnu.org; Thu, 08 Aug 2019 16:26:22 -0400
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444]:39523)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hvozM-0001Bl-Td
 for qemu-arm@nongnu.org; Thu, 08 Aug 2019 16:26:21 -0400
Received: by mail-pf1-x444.google.com with SMTP id f17so40730749pfn.6
 for <qemu-arm@nongnu.org>; Thu, 08 Aug 2019 13:26:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=otP5Jhfl1E+0A9Fm71GI7ndCATRFA/GRNsznhHQJJms=;
 b=U6D/k8pueOnINcKO96ewDohrHmZ87S9SdidjRs0w8n/eTVuJGDAiOHNgUnmrhpiRGP
 0RIQ+LDvf7kDPtG6QBd+2OR7P7aVhpmAJm1A9BzZva7KSutWjNwzR7MWyitBzJhsjiLo
 X4svsBqMWpGXLlwgsher8u03wIP7xwcPPX6ncHlWCqt5mOJxoa1zDYxx2G98g8eqD1Hd
 5jm/663k6yxKiDdxjUlRLuYS9gY8yz8rLibCJJtwasI703ZrQZLhM3HvycsF2Jj4LORs
 jbul/lBhoawVT4/LLWTCCSiubqe/G71gIiHi0TwqMGKsTKjxB/2FLh+Nqu/vrV5CasZC
 qVkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=otP5Jhfl1E+0A9Fm71GI7ndCATRFA/GRNsznhHQJJms=;
 b=LcFe1cIcCO6IGviZIaVAve/SEmQ8Ipiz4rThQeTw0AfJJX3atQgiw/jHRjNNAlZBcq
 AN5KfGid7xYhP2m3mmPJRr9YAZnnarGIqt3I2OCl7wjUfwzPGAzf5+u5DAzMBLN5q0HZ
 u1sebla9ii6A7upUVyaQHZzR/eXHbZ2ztTe6ZOavzGl+XF2d6S8ZXnVzKeAh5aELMwy8
 Q7NgR/Nbjvem8nSau0ehIAG3ZHrsEC/rpXaWXWTp42z0SDU5kdYB2N2sQwZeLmlEENdO
 z0TiCxatEcPXFwxqb2VjQUQ7XTjT84sfDgfucuHWMZvag6+igVKjqHkymgra0HYlVGa6
 uCEw==
X-Gm-Message-State: APjAAAV29ArbAICHnjWVpyLGhBvsUpejuiqjGQUzO6FXTvmQQ6147fER
 OeQau+tK41eJ2K9xRsnCtyFONg==
X-Received: by 2002:a17:90a:2008:: with SMTP id n8mr5763309pjc.4.1565295979981; 
 Thu, 08 Aug 2019 13:26:19 -0700 (PDT)
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net.
 [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id v12sm2850146pjk.13.2019.08.08.13.26.18
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 08 Aug 2019 13:26:19 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Thu,  8 Aug 2019 13:26:10 -0700
Message-Id: <20190808202616.13782-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190808202616.13782-1-richard.henderson@linaro.org>
References: <20190808202616.13782-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::444
Subject: [Qemu-arm] [PATCH 1/7] target/arm: Use tcg_gen_extract_i32 for
 shifter_out_im
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
X-TUID: Tak6iCCgw2l9

Extract is a compact combination of shift + and.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 846052acea..43e005d191 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -620,14 +620,7 @@ static void gen_sar(TCGv_i32 dest, TCGv_i32 t0, TCGv_i32 t1)
 
 static void shifter_out_im(TCGv_i32 var, int shift)
 {
-    if (shift == 0) {
-        tcg_gen_andi_i32(cpu_CF, var, 1);
-    } else {
-        tcg_gen_shri_i32(cpu_CF, var, shift);
-        if (shift != 31) {
-            tcg_gen_andi_i32(cpu_CF, cpu_CF, 1);
-        }
-    }
+    tcg_gen_extract_i32(cpu_CF, var, shift, 1);
 }
 
 /* Shift by immediate.  Includes special handling for shift == 0.  */
-- 
2.17.1

