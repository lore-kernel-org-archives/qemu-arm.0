Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp6579072ejq;
        Mon, 15 May 2023 08:09:02 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5yvmboaZXNM6PHwiH5tlOSfuwr/88WKIxvRczI2ZUwMdl4fhwRyvJBrxf2DugAolv4VYxf
X-Received: by 2002:a5d:4446:0:b0:307:c7e5:dd84 with SMTP id x6-20020a5d4446000000b00307c7e5dd84mr10270145wrr.66.1684163342092;
        Mon, 15 May 2023 08:09:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684163342; cv=none;
        d=google.com; s=arc-20160816;
        b=Nyl/NqmMh4nyx4QxVfUgIEKZHWB9E/oqVH4JtCvegswVekvDKxU4Hk3jOIHpEVsLmX
         +bag8gnCnyMPWfUbRmevDCc76tRguoNIGNEhpV4MgTDAkK5f8+E3JHQnJ4wsY0VNt/bA
         08gtaQtfQsSLVwHrAdAOgq4uWM1q/JlFyQV4WDMB/+PhhjMbagvODCvzb/3iMu+5nEPu
         FutL5uSldzWpnmdJtn9Xtea+gYqSyUQlDxuzNxVkm5ieOeUCU90Y40BCd4A0pjpv5531
         ckjyFibRRGWP7K2L4WurQzCaONYuN0XLrzoo/LFgW3UshJvIitIx4T+gltLSiTKfdS01
         /0HA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from;
        bh=FRu34YKApWrY6ll0OL/nPqS1GCHOI/wPzC56luKqaRM=;
        b=scWfA4PErhltRqPayilSlHZo3w6hiUFJZ5mmkW9lnISgEKCPRkQOZTDXmpwovhJ/JB
         qdroympRHc3oA/ZFwI/Y28BjtVRuz3ZnOPRxjz43Rw2hAhX3LsoIZWpDDY1W0PrggUXK
         e9i0IjIGdEGttvgRp+Ddx3D/ICMmTvedf+wCQKYkBC/XBs5wTIDcq2P0gVxrzLkMwhW3
         jDyDasMQzXIt+3D3YlaOyMBpMYGYDx9yvOacRbbIwuPHcXWZMxyVu0rnfuv/6yZF2EOv
         BQ+2zdiHfNv63hXWHl9eO6KecNf1znvJi+lmUyeyuv6M5qgthoaPCHCiobzeLZINT+tx
         5iag==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z12-20020adfe54c000000b00306429c7e4dsi6484wrm.832.2023.05.15.08.09.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 15 May 2023 08:09:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pyZM7-0002tN-MT; Mon, 15 May 2023 10:39:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1pyZL6-0007ZV-EG; Mon, 15 May 2023 10:38:18 -0400
Received: from muminek.juszkiewicz.com.pl ([213.251.184.221])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1pyZKr-0006D2-5m; Mon, 15 May 2023 10:38:15 -0400
Received: from localhost (localhost [127.0.0.1])
 by muminek.juszkiewicz.com.pl (Postfix) with ESMTP id 6BC60260BA9;
 Mon, 15 May 2023 16:37:57 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at juszkiewicz.com.pl
Received: from muminek.juszkiewicz.com.pl ([127.0.0.1])
 by localhost (muminek.juszkiewicz.com.pl [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cwPAqeGSOPdx; Mon, 15 May 2023 16:37:55 +0200 (CEST)
Received: from applejack.lan (83.11.34.59.ipv4.supernova.orange.pl
 [83.11.34.59])
 by muminek.juszkiewicz.com.pl (Postfix) with ESMTPSA id 4AD792600A6;
 Mon, 15 May 2023 16:37:55 +0200 (CEST)
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Leif Lindholm <quic_llindhol@quicinc.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Subject: [PATCH] Maintainers: add myself as reviewer for sbsa-ref
Date: Mon, 15 May 2023 16:37:53 +0200
Message-Id: <20230515143753.365591-1-marcin.juszkiewicz@linaro.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: softfail client-ip=213.251.184.221;
 envelope-from=marcin.juszkiewicz@linaro.org; helo=muminek.juszkiewicz.com.pl
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: obqDWffFEU6J

At Linaro I work on sbsa-ref, know direction it goes.

May not get code details each time.

Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index ff2aa53bb9..3bc12229ba 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -939,6 +939,7 @@ SBSA-REF
 M: Radoslaw Biernacki <rad@semihalf.com>
 M: Peter Maydell <peter.maydell@linaro.org>
 R: Leif Lindholm <quic_llindhol@quicinc.com>
+R: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
 L: qemu-arm@nongnu.org
 S: Maintained
 F: hw/arm/sbsa-ref.c
-- 
2.40.1

