Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp2038525ejb;
        Tue, 23 May 2023 10:29:19 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4YT89f/NQrfc9rNiTEMtuLc00WbK0Q2py/+FJm55o/i++r+Auw6MqpddNCLhtX61cnqYLX
X-Received: by 2002:a05:620a:8c04:b0:75b:23a1:3646 with SMTP id qz4-20020a05620a8c0400b0075b23a13646mr4145835qkn.7.1684862959457;
        Tue, 23 May 2023 10:29:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684862959; cv=none;
        d=google.com; s=arc-20160816;
        b=kb6vtpcs0eII71cR6AtQdqkUZ+517jge5IMtUbp02XTG3WM9nC+pSPbyeWbA5QZt+h
         SZDhCYIXBADQ1019+AxtoAtPSXnEXvcTnGQ/Hy/0WjZpy+00/GXq/7PbSgaFFOxTbsra
         byExoBtGgvP4YB6P2o0jTguWU+FtJj6v03VtSPzFhWpfq5MQ2e/ryIrniWiKedGNdTn6
         v6JZJ00D227+QPFYiCuKOwh/8YP8GyoSJkfaSwvAPIEBdNTX21pU7Cno10Y+LByv0EB/
         gIj4Xgn6mjsit4b8lab4w5csS6fd42kFrvX9HCumETik80T+xPMSp2XXyZWeU1xBcvK1
         3Yog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=YEpGmRg5GUnndxj6u4yWHcwoKuZsUGvxmxfvfo4Bl5M=;
        b=L34dyLE8UOGNrOQ3hc1EVo87MQ8COqS8DXAhpgcU3ZISy0eNPQtEHTPimvBd5OGScJ
         mg4RlOUaI+JJyWy4h4FChCN9ckcLY56bf84jIWQ/gr/zuQAwm6Bv6A+SxCdfpvdN2hAm
         aw/hGGj0RbVuB0WN5+Q3SIxZ03ZDZFwrYeDvjvNOdtBcq/uarg/MnqiqpifwiXQU5mYw
         yS3tFvtuQosxDhTZxQhO33ToYbGVyXlkcNc4TWQ1s5dJzKaPbgqBqdpg86osjamj1dPk
         vxRjIlvuwsNjtAQS/6qjeSsCWEFxVkB/hEo4gWbc/WXJKly0xy9dOy4J5KnDSJIOZo4q
         K5kw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k25-20020ae9f119000000b0075b18047486si2754549qkg.729.2023.05.23.10.29.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 23 May 2023 10:29:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q1Von-0001h7-1n; Tue, 23 May 2023 13:29:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1q1Vol-0001fk-Uo; Tue, 23 May 2023 13:29:03 -0400
Received: from muminek.juszkiewicz.com.pl ([213.251.184.221])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1q1Vok-0006rZ-A7; Tue, 23 May 2023 13:29:03 -0400
Received: from localhost (localhost [127.0.0.1])
 by muminek.juszkiewicz.com.pl (Postfix) with ESMTP id 3C420260698;
 Tue, 23 May 2023 19:28:59 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at juszkiewicz.com.pl
Received: from muminek.juszkiewicz.com.pl ([127.0.0.1])
 by localhost (muminek.juszkiewicz.com.pl [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ccccDbaEB0MV; Tue, 23 May 2023 19:28:57 +0200 (CEST)
Received: from applejack.lan (83.21.125.167.ipv4.supernova.orange.pl
 [83.21.125.167])
 by muminek.juszkiewicz.com.pl (Postfix) with ESMTPSA id 8C9762600C6;
 Tue, 23 May 2023 19:28:56 +0200 (CEST)
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Leif Lindholm <quic_llindhol@quicinc.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Subject: [PATCH v2 1/3] docs: sbsa: correct graphics card name
Date: Tue, 23 May 2023 19:28:53 +0200
Message-Id: <20230523172855.679018-1-marcin.juszkiewicz@linaro.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <e682f6d5-acbe-7910-54ef-4d75c88a3d28@redhat.com>
References: <e682f6d5-acbe-7910-54ef-4d75c88a3d28@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: softfail client-ip=213.251.184.221;
 envelope-from=marcin.juszkiewicz@linaro.org; helo=muminek.juszkiewicz.com.pl
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_SOFTFAIL=0.665, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-TUID: OG+9FS714qw/

We moved from VGA to Bochs to have PCIe card.

Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
---
 docs/system/arm/sbsa.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/system/arm/sbsa.rst b/docs/system/arm/sbsa.rst
index b499d7e927..016776aed8 100644
--- a/docs/system/arm/sbsa.rst
+++ b/docs/system/arm/sbsa.rst
@@ -27,6 +27,6 @@ The sbsa-ref board supports:
   - System bus EHCI controller
   - CDROM and hard disc on AHCI bus
   - E1000E ethernet card on PCIe bus
-  - VGA display adaptor on PCIe bus
+  - Bochs display adapter on PCIe bus
   - A generic SBSA watchdog device
 
-- 
2.40.1

