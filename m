Received: by 2002:a19:690d:0:0:0:0:0 with SMTP id e13csp2211674lfc;
        Thu, 11 Feb 2021 04:21:52 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyRN6mhWHIkiXbzeLyNnq7aShoq5BOGq2RCpB5f7bubmKMAq66VScrHfDSwONcKJ667l7rB
X-Received: by 2002:a25:e481:: with SMTP id b123mr11302361ybh.178.1613046112074;
        Thu, 11 Feb 2021 04:21:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1613046112; cv=none;
        d=google.com; s=arc-20160816;
        b=Jfw0CQhzo2P10y96C63us/a4EGusaCng+Dse1vjHdxMykFkRMKhXjMxPUgJHcPXtgX
         QJjWcWiJAYOQyrKdJRZUz3o4AbE8hgelNLwuobV2nTLwicWof+A5Gl9Va/MjYTZPSyNW
         K7DYJGO4pv3NW7dpS6aKhXaXD11fOG7sbNmgdZsisRjghkbUr81xA19XsRZOyThGGW77
         MiYaSwvlH6hb+37kD03pm83kodbC6Dm6k/HG6G25YNns59bTvzG4+ZqPvTYwHq9aklUL
         KW2BfY93ajD0X0a4B/1b49kmtxPKl/a+x7PE9tbMSOxNi144QuRjJbW5d2zTfQ5i0BLr
         PdwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from;
        bh=uDl8joMb5XtpbB7wuM06duRGZchK2sfLNR1Ccjlxbuo=;
        b=zm+gUtzrUfzT29CL3YT0wm9yiMSEyY1LOsorlkIG44oqgXaF9Es2OdYY2YInTliwJe
         UbB1ZZV0CjRvQwTYZzAvrGYxAVt8amJOIafEU+UBd/8wRRb6NXf0jYv21zknMxmInSG8
         j54tx2WW1LiKfiphZFYedEnIU2hSOXkWrgkkGJHV1qWxW8B2vVBTYZq8f1+iPw7ryD5I
         zygw50IoO4w7ZJYCG/wecG3mrrvP3aFJ8mPklMT5hh7dgcSK5Dh9on8OFg4gYqbZ8l61
         15b9Q1IAsDhOQrHwL67fKKJ2iWYzmuiXc00SRPIxBtW1RvnrdnNfXbJXzPvREtuxEFj6
         2kAA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j133si4661399ybb.145.2021.02.11.04.21.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 11 Feb 2021 04:21:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lAAyj-0007tj-UK
	for alex.bennee@linaro.org; Thu, 11 Feb 2021 07:21:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1lAAxY-0006tT-98; Thu, 11 Feb 2021 07:20:36 -0500
Received: from muminek.juszkiewicz.com.pl ([2001:41d0:1:43dd::1]:38212)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1lAAxW-0000oq-4u; Thu, 11 Feb 2021 07:20:36 -0500
Received: from localhost (localhost [127.0.0.1])
 by muminek.juszkiewicz.com.pl (Postfix) with ESMTP id DCC0326026A;
 Thu, 11 Feb 2021 13:20:29 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at juszkiewicz.com.pl
Received: from muminek.juszkiewicz.com.pl ([127.0.0.1])
 by localhost (muminek.juszkiewicz.com.pl [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MgOo9xuy4wOi; Thu, 11 Feb 2021 13:20:27 +0100 (CET)
Received: from puchatek.lan (89-67-26-161.dynamic.chello.pl [89.67.26.161])
 by muminek.juszkiewicz.com.pl (Postfix) with ESMTPSA id 35CCC2600B6;
 Thu, 11 Feb 2021 13:20:26 +0100 (CET)
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
To: qemu-arm@nongnu.org
Subject: [PATCH] sbsa-ref: remove cortex-a53 from list of supported cpus
Date: Thu, 11 Feb 2021 13:20:22 +0100
Message-Id: <20210211122022.1811362-1-marcin.juszkiewicz@linaro.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: softfail client-ip=2001:41d0:1:43dd::1;
 envelope-from=marcin.juszkiewicz@linaro.org; helo=muminek.juszkiewicz.com.pl
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
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
Cc: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, Leif Lindholm <leif@nuviainc.com>,
 =?UTF-8?q?Rados=C5=82aw=20Biernacki?= <rad@semihalf.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: pEwHwI3eQm4F

Cortex-A53 supports 40bits of address space. sbsa-ref's memory starts
above this limit.
---
 hw/arm/sbsa-ref.c | 1 -
 1 file changed, 1 deletion(-)

diff --git hw/arm/sbsa-ref.c hw/arm/sbsa-ref.c
index 9f70735153..276243d122 100644
--- hw/arm/sbsa-ref.c
+++ hw/arm/sbsa-ref.c
@@ -145,7 +145,6 @@ static const int sbsa_ref_irqmap[] = {
 };
 
 static const char * const valid_cpus[] = {
-    ARM_CPU_TYPE_NAME("cortex-a53"),
     ARM_CPU_TYPE_NAME("cortex-a57"),
     ARM_CPU_TYPE_NAME("cortex-a72"),
 };
-- 
2.29.2

