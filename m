Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp369330ejc;
        Thu, 26 Jan 2023 03:44:43 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvnUUVFi9/IzDD/h7aDu1UucpyYN2wiwbKbi0+z6LyII+CJ2yh6QTE4+Hd21ks4IKubCYf+
X-Received: by 2002:ac8:7f02:0:b0:3ad:17ca:c3f with SMTP id f2-20020ac87f02000000b003ad17ca0c3fmr65164501qtk.35.1674733482858;
        Thu, 26 Jan 2023 03:44:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674733482; cv=none;
        d=google.com; s=arc-20160816;
        b=fxiPzgdSUoxc4atuKCpkhKFY+K0QEKEInJmU7Jo1fd7CfQisYCS7zSAidWOAlWIz26
         8DEzaRNq1xDWgW8+UpDoOVQGBfcQSo1WL3U5LKhs90ILlTnSKP1WbhY4+lIC8IuCqxBq
         Y8uJcXESLVXeP5yP8RLsUOrCa6Nb2/fRo7+9I3G6mEIIaTdbshen0Fw0pJuBDjzqn77b
         xYLBspOaaciBqMyp4DydYS26VdqaL+ywv7hceEk/15LNDHsTLLeEb9ukvTdD6jSIFZ+T
         HOlr9q6BihUZuQM6PZX+jJwsB5oXZRMl2CvpCsaUzxtgmdkY4+wMG3RAU6pEiTlBLT5V
         /mJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from;
        bh=t0W82eVkxLwYifr8Md1HSizhjhSvEnFURdJQhGghNKw=;
        b=lbo12t0Ahn6c1IH1AzYfYb6sWKZVIPqDmokhvX0H8BmBb+ZHfg5/6FPv22I2cv/Mp/
         maK7GTsLbWzTM5FUJsye8wMBzO7hA+offeqULmrTUY2JiPrbKMOKmoc5sPxeuMiQo21y
         NC9QPNXjFuQk/L/xm5eXjDdUp1JFG58BWP7WlJ/jOV2eWSPWaii/OFPbLXwO3aCu4+Ks
         PEVvTvTJ0NUPJfqBb1vO7W80nDCdk495FYB3aAZmqcME4/YFpJYCFABY52FRd4tD1uPk
         QveatCA5Cs3xZpnsaflI93CJY44pQduUlXWvDJslMrty07i8ahN4UHcFolOu0BbG7XQ7
         diTA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 7-20020a05620a070700b006f9bc401e6dsi760915qkc.70.2023.01.26.03.44.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 26 Jan 2023 03:44:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pL0g8-0000sx-U6; Thu, 26 Jan 2023 06:44:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1pL0g7-0000sk-K5; Thu, 26 Jan 2023 06:44:27 -0500
Received: from muminek.juszkiewicz.com.pl ([213.251.184.221])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1pL0g5-0003HK-Ra; Thu, 26 Jan 2023 06:44:27 -0500
Received: from localhost (localhost [127.0.0.1])
 by muminek.juszkiewicz.com.pl (Postfix) with ESMTP id BEC1E260241;
 Thu, 26 Jan 2023 12:44:21 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at juszkiewicz.com.pl
Received: from muminek.juszkiewicz.com.pl ([127.0.0.1])
 by localhost (muminek.juszkiewicz.com.pl [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SrT7M81La2U0; Thu, 26 Jan 2023 12:44:19 +0100 (CET)
Received: from puchatek.com (83.8.199.139.ipv4.supernova.orange.pl
 [83.8.199.139])
 by muminek.juszkiewicz.com.pl (Postfix) with ESMTPSA id 2F38D260096;
 Thu, 26 Jan 2023 12:44:19 +0100 (CET)
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
To: Radoslaw Biernacki <rad@semihalf.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Leif Lindholm <quic_llindhol@quicinc.com>
Cc: qemu-arm@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel@nongnu.org, Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Subject: [PATCH] sbsa-ref: remove cortex-a76 from list of supported cpus
Date: Thu, 26 Jan 2023 12:44:16 +0100
Message-Id: <20230126114416.2447685-1-marcin.juszkiewicz@linaro.org>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: softfail client-ip=213.251.184.221;
 envelope-from=marcin.juszkiewicz@linaro.org; helo=muminek.juszkiewicz.com.pl
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: I32dwLiNIm+v

Cortex-A76 supports 40bits of address space. sbsa-ref's memory
starts above this limit.

Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
---
 hw/arm/sbsa-ref.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/arm/sbsa-ref.c b/hw/arm/sbsa-ref.c
index 4bb444684f..67c1f68c54 100644
--- a/hw/arm/sbsa-ref.c
+++ b/hw/arm/sbsa-ref.c
@@ -145,7 +145,6 @@ static const int sbsa_ref_irqmap[] = {
 static const char * const valid_cpus[] = {
     ARM_CPU_TYPE_NAME("cortex-a57"),
     ARM_CPU_TYPE_NAME("cortex-a72"),
-    ARM_CPU_TYPE_NAME("cortex-a76"),
     ARM_CPU_TYPE_NAME("neoverse-n1"),
     ARM_CPU_TYPE_NAME("max"),
 };
-- 
2.39.0

