Received: by 2002:a8a:1193:0:0:0:0:0 with SMTP id m19csp450236ocs;
        Wed, 28 Sep 2022 10:21:46 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM64ktJMvdJBsxl+3mh344g6aJVp/D3Bwb9nniv5kstjVTcNwvIIAiEIzLNYi4QCN4JCG2TU
X-Received: by 2002:a05:6214:29c2:b0:4ad:68be:8c57 with SMTP id gh2-20020a05621429c200b004ad68be8c57mr27076967qvb.3.1664385706630;
        Wed, 28 Sep 2022 10:21:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1664385706; cv=none;
        d=google.com; s=arc-20160816;
        b=GD25sQQhWEJ/hOiFg68x+fb6hb+7ldCsX/X7YMXRyXveXhSUuDOtkp4y0kumKcreWN
         00wndhu28gScCJ8m0JBCYh+Kp2iet3MkOuWdO/GxIGfP8Mo5FFkjjfp4kCqmDnYYsRdv
         cxDfEg7pQzX08h+xh42brjmih9N1sMs0BHpzpE2N2RkIeoE6HGG8djmyKlQuZUj5U87H
         W1C5WWzI0Mwcc//tV1AhdKL/J1pP8n4Ld3BNci05ZlaM975pTY/3/HrL6c1O/W98Ozd2
         GVEsBYfLlviBEhpWclaBH+jVotTfcVsXU2l2wkKd8leP93TO4IsvvpwmuqGQ01S1pvCa
         itHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=PFgEmXdHTjcwQ3+4eYEC5FasLQ6GOPcGhr61h7Y2S28=;
        b=TYv2BXCQBR630e3hYRVEi5WVRS7wJjKcWzt/HpLoC+lTsbOJHFxydBSiZArSvSKirV
         E0VvPgHcdSpoNDYs0dfPgin0avYdIGE7K/+7tKNzRYJMIOHBDD5BtYhJTCS25J8bMICM
         L2FjTPLrdQAKG1DWKGp4U57JbcpUX+qW7t4iURRcDN1WcywSX1CFzQuOwUSw6RhUv9XV
         EuJ7uE/O665lAKk2KvCZKSVaHQm7MUNHMgi8yI9pHamdLvuEX0eHhYtHik55J3v1v8yP
         RsrM4EdtxKjd2pL/0evR5b283fPUK3OysdgrSGUiXCHvzoooP/vyAkk4M4uEqZxCtJSp
         u9DA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id jp8-20020ad45f88000000b004991ccb0d81si3643416qvb.270.2022.09.28.10.21.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 28 Sep 2022 10:21:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:53466 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1odakk-0004oA-6W
	for alex.bennee@linaro.org; Wed, 28 Sep 2022 13:21:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53704)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=OEEd=Z7=kaod.org=clg@ozlabs.org>)
 id 1odaDm-0003jB-Eb; Wed, 28 Sep 2022 12:47:44 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:47523)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=OEEd=Z7=kaod.org=clg@ozlabs.org>)
 id 1odaDk-0001HU-NT; Wed, 28 Sep 2022 12:47:42 -0400
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4Md2Tw6l1Qz4xGk;
 Thu, 29 Sep 2022 02:47:32 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Md2Tt4fyHz4xGZ;
 Thu, 29 Sep 2022 02:47:30 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH 1/2] target/arm: Disable VFPv4-D32 when NEON is not available
Date: Wed, 28 Sep 2022 18:47:18 +0200
Message-Id: <20220928164719.655586-2-clg@kaod.org>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220928164719.655586-1-clg@kaod.org>
References: <20220928164719.655586-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=OEEd=Z7=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-TUID: x6/8vrGovuY7

As the Cortex A7 MPCore Technical reference says :

  "When FPU option is selected without NEON, the FPU is VFPv4-D16 and
  uses 16 double-precision registers. When the FPU is implemented with
  NEON, the FPU is VFPv4-D32 and uses 32 double-precision registers.
  This register bank is shared with NEON."

Modify the mvfr0 register value of the cortex A7 to advertise only 16
registers when NEON is not available, and not 32 registers.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 target/arm/cpu.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 7ec3281da9aa..01dc74c32add 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1684,6 +1684,10 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
         cpu->isar.id_isar6 = u;
 
         if (!arm_feature(env, ARM_FEATURE_M)) {
+            u = cpu->isar.mvfr0;
+            u = FIELD_DP32(u, MVFR0, SIMDREG, 1); /* 16 registers */
+            cpu->isar.mvfr0 = u;
+
             u = cpu->isar.mvfr1;
             u = FIELD_DP32(u, MVFR1, SIMDLS, 0);
             u = FIELD_DP32(u, MVFR1, SIMDINT, 0);
-- 
2.37.3

