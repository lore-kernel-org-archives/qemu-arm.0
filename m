Received: by 2002:a19:3859:0:0:0:0:0 with SMTP id d25csp1247100lfj;
        Tue, 3 May 2022 00:58:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy6CmKwDvZ4N9zMGJjNMchneBmtg/oi0RLfYJdUVTaLEFURY2Oh0NN+vy3CPOysC1aLj6Ux
X-Received: by 2002:a05:6214:2a86:b0:45a:8a2d:1aa0 with SMTP id jr6-20020a0562142a8600b0045a8a2d1aa0mr7454822qvb.111.1651564726795;
        Tue, 03 May 2022 00:58:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1651564726; cv=none;
        d=google.com; s=arc-20160816;
        b=hoUj+ttw3zuxMHv2RMtJ0i6/fRJ/ykVJ7CiLcb+dE3PK+2SpU3Bb5diFHtXq0iHy+4
         d6rMHBHG8q50znzs4hIjKSZIzQwU7Bi8HT9kGZOXLupNnTDY+uFyAyXzC3z4/qAX350J
         LxBcNX/2lrrywBMh+ahXf74lwpCZuHqEbFykM7aJFXig9muxx1zrstHNpn+CaxGS4wqs
         NTDm3K6OoYR03q1yvbIhEQW87qBGtuIMyfgoA6KWTHMoPf+WllUE5lLz6iRiIevQN6to
         rhHdxjU6ftK2MGi6PJhOpVcF5TyKUd7VaCAvC/SnLkgriuT+cpj+y+mJgWcNaS0M2XWG
         Xm8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=4TmQUgQQOBC8W+B0G54+GxepJ9ydvrzNfhsIZ6tNRE0=;
        b=RSL0njLLuky+drNXtUGQqpbgvkTO16b4wL4IluopBdnAvu6wbwsJagmnx6WXqsG4d4
         j0jIuZJ7QGRIXMhA5UjVnIKUxZbYccW5btBstm8DCyS2ziD6vFeMeEtuU/q6BK5s1X2K
         NgGTZzbfPkhFsAmUdusYI9hIIwvplzXGARtQCSg07VVlhjhshW5agp8L+hEyVWGXlnp/
         OtZiQ4PnB3Cx5VtAudENuwSsiTn4nKzrkp0UeD4kHf+3JENbPlmfE5re466awE5fNN4U
         p6pofoWpXrWb75RpXwwcD9TUA/ejGH1kib6s7v7JMydPdfUAG6pooFHre9+ZhNQk+Hwp
         PCog==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h19-20020a05620a245300b0069eca9611eesi8783721qkn.596.2022.05.03.00.58.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 03 May 2022 00:58:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:43282 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nlnQk-0006Sp-90
	for alex.bennee@linaro.org; Tue, 03 May 2022 03:58:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49192)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=XF6a=VL=kaod.org=clg@ozlabs.org>)
 id 1nlmVW-0003Qq-8X; Tue, 03 May 2022 02:59:39 -0400
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3]:45653
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=XF6a=VL=kaod.org=clg@ozlabs.org>)
 id 1nlmVQ-0007W8-Sx; Tue, 03 May 2022 02:59:37 -0400
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4KsrRk3XYGz4ySs;
 Tue,  3 May 2022 16:59:30 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4KsrRh3K31z4yST;
 Tue,  3 May 2022 16:59:28 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Jae Hyun Yoo <quic_jaehyoo@quicinc.com>,
 Graeme Gregory <quic_ggregory@quicinc.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PULL 14/19] hw/arm/aspeed: fix AST2500/AST2600 EVB fmc model
Date: Tue,  3 May 2022 08:58:43 +0200
Message-Id: <20220503065848.125215-15-clg@kaod.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220503065848.125215-1-clg@kaod.org>
References: <20220503065848.125215-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=SRS0=XF6a=VL=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-TUID: ZH9EPRLCJr9p

From: Jae Hyun Yoo <quic_jaehyoo@quicinc.com>

Current fmc model of AST2500 EVB and AST2600 EVB can't emulate quad
mode properly so fix them using equivalent mx25l25635e and mx66u51235f
respectively.

These default settings still can be overridden using the 'fmc-model'
command line option.

Reported-by: Graeme Gregory <quic_ggregory@quicinc.com>
Signed-off-by: Jae Hyun Yoo <quic_jaehyoo@quicinc.com>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Message-Id: <20220402184427.4010304-1-quic_jaehyoo@quicinc.com>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/arm/aspeed.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index 4e27060324d6..a74c13ab0fbc 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -1093,7 +1093,7 @@ static void aspeed_machine_ast2500_evb_class_init(ObjectClass *oc, void *data)
     mc->desc       = "Aspeed AST2500 EVB (ARM1176)";
     amc->soc_name  = "ast2500-a1";
     amc->hw_strap1 = AST2500_EVB_HW_STRAP1;
-    amc->fmc_model = "w25q256";
+    amc->fmc_model = "mx25l25635e";
     amc->spi_model = "mx25l25635e";
     amc->num_cs    = 1;
     amc->i2c_init  = ast2500_evb_i2c_init;
@@ -1162,7 +1162,7 @@ static void aspeed_machine_ast2600_evb_class_init(ObjectClass *oc, void *data)
     amc->soc_name  = "ast2600-a3";
     amc->hw_strap1 = AST2600_EVB_HW_STRAP1;
     amc->hw_strap2 = AST2600_EVB_HW_STRAP2;
-    amc->fmc_model = "w25q512jv";
+    amc->fmc_model = "mx66u51235f";
     amc->spi_model = "mx66u51235f";
     amc->num_cs    = 1;
     amc->macs_mask = ASPEED_MAC0_ON | ASPEED_MAC1_ON | ASPEED_MAC2_ON |
-- 
2.35.1

