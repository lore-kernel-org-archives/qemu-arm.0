Received: by 2002:ac2:4318:0:0:0:0:0 with SMTP id l24csp1026703lfh;
        Wed, 25 May 2022 09:12:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzEgLFK+EvRa3vdEcz0UBTXh15+liUR1CWae2KWQlh36+iEDfujgJ2svmq3BQwst0fZD24A
X-Received: by 2002:a05:622a:1301:b0:2f3:af1d:aa57 with SMTP id v1-20020a05622a130100b002f3af1daa57mr25668354qtk.257.1653495163311;
        Wed, 25 May 2022 09:12:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1653495163; cv=none;
        d=google.com; s=arc-20160816;
        b=EaroYKL7J9WMpljcHQmU9HqihqZMdTPOrryK+Z2u5OjL4xUdyvgCTD+3aC5IVSBalX
         DoR82Tesk54JOnRW2h5/fEtoFkqkdsWrd+n5XA7UpLn1n2DwGPwL7CwhEt91aSJOOY+5
         rbGn2plwl8CBZ3o3aW1jibPHKqcAcpc5kyazd4j9OJXwZAqdEiyheGu70Ow+BSegpU5A
         FZi7SAEHqEHyWPJ/YEQ42K7GgYtNEuZMbThpp1yWzVvR4Oqa4yDU61ozI4GtDEVMOyLo
         LkPA4IPKh/YbXpudLVJmOxk+gW8u0Ks4cs9d57OOD7xbU/P9CMTCZ33/IAF9swMcInyK
         O6FA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=gVR6NT8UGvxnftR5z1iJb3YfgWBEbToAXKwSkai64Qk=;
        b=b/kVIsdiV7EFmziLK+8WQHZ6yDwIosebPcZdzEztq9xcGsAekZ72bv3rO5SO/XGfkQ
         LPro2MzQMXY/DG5zcalw8jEe1KK2qPHbOxCZzV6G9OXeHif/7dgIciT2ZaScowciT5pW
         DTJBo+jAG/zT1FVgmuSPixGc65VSkzXHIjJghAQt/9/UyxTUaFrzoIYLXeGurywQBYug
         BO8FThFHR1Xb3yJXxINonD7WezX/BSWu1kobkVmwIRA1wugfAwb+gskFHJHJzB50FctG
         Jd7BerFxczIk70VnunS4qD+0tZd3acU/jZkAjyoWiyXW5uhr4OhAc2pbgfh232Xpa9Wi
         83Hg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id gc3-20020a056214230300b004624a3164c2si1523578qvb.221.2022.05.25.09.12.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 25 May 2022 09:12:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:46272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nttco-0001aD-QL
	for alex.bennee@linaro.org; Wed, 25 May 2022 12:12:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=Lufh=WB=kaod.org=clg@ozlabs.org>)
 id 1nttSO-00073J-HF; Wed, 25 May 2022 12:01:59 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:35487)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=Lufh=WB=kaod.org=clg@ozlabs.org>)
 id 1nttSL-00048m-L9; Wed, 25 May 2022 12:01:55 -0400
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4L7bRL1889z4ySg;
 Thu, 26 May 2022 02:01:50 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4L7bRJ27zyz4xXj;
 Thu, 26 May 2022 02:01:48 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Peter Delevoryas <pdel@fb.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PULL 03/15] docs: aspeed: Add fby35 board
Date: Wed, 25 May 2022 18:01:24 +0200
Message-Id: <20220525160136.556277-4-clg@kaod.org>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220525160136.556277-1-clg@kaod.org>
References: <20220525160136.556277-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=Lufh=WB=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: CcMtGBqUY+uv

From: Peter Delevoryas <pdel@fb.com>

Add fby35 to the list of Aspeed boards.

Signed-off-by: Peter Delevoryas <pdel@fb.com>
Message-Id: <20220506193354.990532-2-pdel@fb.com>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 docs/system/arm/aspeed.rst | 1 +
 1 file changed, 1 insertion(+)

diff --git a/docs/system/arm/aspeed.rst b/docs/system/arm/aspeed.rst
index 6f2e4fb53d49..5d0a7865d3a6 100644
--- a/docs/system/arm/aspeed.rst
+++ b/docs/system/arm/aspeed.rst
@@ -31,6 +31,7 @@ AST2600 SoC based machines :
 - ``tacoma-bmc``           OpenPOWER Witherspoon POWER9 AST2600 BMC
 - ``rainier-bmc``          IBM Rainier POWER10 BMC
 - ``fuji-bmc``             Facebook Fuji BMC
+- ``fby35-bmc``            Facebook fby35 BMC
 
 Supported devices
 -----------------
-- 
2.35.3

