Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp1979603ejb;
        Tue, 23 May 2023 08:57:16 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6UM5fFy9nVy1HpU6KVGmR4oITEF0MiGKJVW61dKc1fuRKpOD9RaVgC8tUdtdgmavYO7bzR
X-Received: by 2002:a05:622a:1ba4:b0:3f2:19dd:979a with SMTP id bp36-20020a05622a1ba400b003f219dd979amr23367986qtb.23.1684857436012;
        Tue, 23 May 2023 08:57:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684857435; cv=none;
        d=google.com; s=arc-20160816;
        b=xWlbKdlHl2/f9CVTMmhI8kRC/h1BQ2yc1S1Rt7gJWglAGTiNERRv/yAVufZ7WKTOhR
         lnmtCjo5B3dopRBHVk19dzuncRiKaMkBW5kR6mMrrEq8L/RrzvebOvBridf9+g/mtewA
         N0VxheY6JnbeKEdzscrDOSkcVpR3gwRykaL8mxK8E4fQVPv/zY+D+XWfBre63EqMZKZf
         nfxx+xg00ZTGT1yJ35uNTUM5Yuq7t3PpluLJ7/Gz9YZREnCJ3UN/4khf5PtQZ7sh/krQ
         waaU075bprDQD/9fuOKzg5PdB3l67hYMHChKi9qlRs4RO9hRwgllqqPYN9N+mMNcd1a7
         SJMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=h4JnHKvlV/ZipNs84qNeat5NFljNo1FT2Nvnb85Ugbw=;
        b=husQ8yDNSKFZKZtsWLpuSFsdyveJzv2XPVhLw6BghhJ3Rj/q+qa9Mx6UieC8pb8Gqq
         k4zntBD9Jm7cusVEka+wWOcfJMbj7AGLi3yukxseX9EsqUo4RCZk/0Sy6hhUiCzitI3h
         oGXeFr1JPrgFt8v1vkbLdiPpHXn8VtQmFIJhPkhSDdybw55D1sQ2aKFSpOAUJE/jglfK
         C9Ak0i7B9gBMMFtpfn3zujUBHGT/vq2WWCK1O27WAcy2eExnfZaFzRxSKbwf5YjRoiet
         QdF45LSD3QonAGc/wiZZWmdlnk3UW2YkTHliqoT59bf1uYwOD7OnvHDn3KqAX6ohtj6q
         3dEg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c12-20020ac85a8c000000b003f0a004df7dsi5388004qtc.312.2023.05.23.08.57.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 23 May 2023 08:57:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q1UNe-0005ct-M8; Tue, 23 May 2023 11:56:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1q1UNc-0005cL-VC; Tue, 23 May 2023 11:56:56 -0400
Received: from muminek.juszkiewicz.com.pl ([213.251.184.221])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1q1UNb-0000YE-6b; Tue, 23 May 2023 11:56:56 -0400
Received: from localhost (localhost [127.0.0.1])
 by muminek.juszkiewicz.com.pl (Postfix) with ESMTP id B25F52600C6;
 Tue, 23 May 2023 17:56:51 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at juszkiewicz.com.pl
Received: from muminek.juszkiewicz.com.pl ([127.0.0.1])
 by localhost (muminek.juszkiewicz.com.pl [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JErC4mPh7Y-c; Tue, 23 May 2023 17:56:49 +0200 (CEST)
Received: from applejack.lan (83.21.125.167.ipv4.supernova.orange.pl
 [83.21.125.167])
 by muminek.juszkiewicz.com.pl (Postfix) with ESMTPSA id 76553260698;
 Tue, 23 May 2023 17:56:49 +0200 (CEST)
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Leif Lindholm <quic_llindhol@quicinc.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Subject: [PATCH 1/2] docs: sbsa: correct graphics card name
Date: Tue, 23 May 2023 17:56:43 +0200
Message-Id: <20230523155644.678524-1-marcin.juszkiewicz@linaro.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <CAFEAcA9GamGybSzd8FKBtmZ2qMgjRFy6D=Vhu1y0dL8m9Sa80w@mail.gmail.com>
References: <CAFEAcA9GamGybSzd8FKBtmZ2qMgjRFy6D=Vhu1y0dL8m9Sa80w@mail.gmail.com>
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
X-TUID: lqc3r2VZqyRu

We moved from VGA to Bochs to have PCIe card.

Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
---
 docs/system/arm/sbsa.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/system/arm/sbsa.rst b/docs/system/arm/sbsa.rst
index b499d7e927..fea4992df2 100644
--- a/docs/system/arm/sbsa.rst
+++ b/docs/system/arm/sbsa.rst
@@ -27,6 +27,6 @@ The sbsa-ref board supports:
   - System bus EHCI controller
   - CDROM and hard disc on AHCI bus
   - E1000E ethernet card on PCIe bus
-  - VGA display adaptor on PCIe bus
+  - Bochs display adaptor on PCIe bus
   - A generic SBSA watchdog device
 
-- 
2.40.1

