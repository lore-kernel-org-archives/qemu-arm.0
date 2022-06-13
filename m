Received: by 2002:a19:ee12:0:0:0:0:0 with SMTP id g18csp1381836lfb;
        Mon, 13 Jun 2022 06:27:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxdH3Bl532M8/X48FPKHIEZOIuoZaTWjEGR1tE9CiTCxT8mzNXFLJ5zkD8ePWaB96gonZbj
X-Received: by 2002:a05:620a:808d:b0:6a6:d43f:afd7 with SMTP id ef13-20020a05620a808d00b006a6d43fafd7mr22207410qkb.524.1655126829387;
        Mon, 13 Jun 2022 06:27:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1655126829; cv=none;
        d=google.com; s=arc-20160816;
        b=apiu35WVMmP6TCGXpad5FxvHp/PUnV23KReFsS44v3OtA6xaBNNRp+nlNlFcB+N7V9
         MysrmY+dEECVMBFk7xOjoZDu1coxX28MmG7As3C74puGNf7IdNqZD5rYe/bgVZ3os5K6
         yEuglrs4m0QmS2okPkHUurTSH3oyd8VLQBOinzKwvGPc8741+UCCHiDt0ma/O5rMtq7J
         XC89fG1R6i1JeFRDrGjJEx2Q0IW5SXxIVFiId/SbERpZbdsHKWlGnPziuDpdWQnw687s
         o2kbr21svo2F7fqFLXOOPf1MdZZlu6E5eH+ZlqohY5gmnTOnfxltQ2zuqL8CCRifAFP3
         1+eQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=QjY9dtj+LwSMu76x/ex70SFXn2cyWZ9SDSLvsJWx/9o=;
        b=OvGPoTH1l0ktQWSdnh2uTgqj7EVaGcMEhw5o52e+lERlktZL5HXKXyyciVhZRE+B0I
         Ws+1sVW4U+yXovnJAC8UedjAWJU47R2qemxJFb4I2uKkmrDDYy0D07Xh9d37sVA2sZnW
         q15Jfxl9VRF77F/+38RDLR4EwxZQFTwHzqOV765ibypgAZx7gRSmpjH6VDi5dcdgNGC7
         OpNngj3gqO6XRm8B0LD32RnqJ0DjVIpDf8DE9E+/3e4g56CxqCEs2ptCBg/gqb1KqmMX
         M3q79ZK+caMYGlTve6i8UkrseYFogSZReeIDcorh6e0HFlVuYGk6P5A0z/NBmUmx6S9o
         0E0A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f14-20020ac8498e000000b0030511c5d7eesi3442108qtq.407.2022.06.13.06.27.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 13 Jun 2022 06:27:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:34108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o0k60-0000Ft-Ph
	for alex.bennee@linaro.org; Mon, 13 Jun 2022 09:27:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=yfRC=WU=kaod.org=clg@ozlabs.org>)
 id 1o0k55-0000FM-7p; Mon, 13 Jun 2022 09:26:11 -0400
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3]:38827
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=yfRC=WU=kaod.org=clg@ozlabs.org>)
 id 1o0k53-0004ST-5N; Mon, 13 Jun 2022 09:26:11 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4LMC4p06qxz4yXX;
 Mon, 13 Jun 2022 23:26:02 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4LMC4h4x11z4yXP;
 Mon, 13 Jun 2022 23:25:56 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Joe Komlodi <komlodi@google.com>,
 Troy Lee <troy_lee@aspeedtech.com>, Jamin Lin <jamin_lin@aspeedtech.com>,
 Steven Lee <steven_lee@aspeedtech.com>,
 Klaus Jensen <k.jensen@samsung.com>, Peter Delevoryas <pdel@fb.com>,
 Corey Minyard <cminyard@mvista.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Damien Hedde <damien.hedde@greensocs.com>,
 Andrew Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH v2 01/17] aspeed: Remove fake RTC device on ast2500-evb
Date: Mon, 13 Jun 2022 15:25:23 +0200
Message-Id: <20220613132539.2199772-2-clg@kaod.org>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220613132539.2199772-1-clg@kaod.org>
References: <20220613132539.2199772-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=SRS0=yfRC=WU=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
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
X-TUID: Ic3+9GHtGiM+

The board has no such device. It might have been useful for some tests
in the past, it's not anymore and the same can be achieved on the
command line.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/arm/aspeed.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index 98dc185acd9a..c49772e2eb59 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -519,10 +519,6 @@ static void ast2500_evb_i2c_init(AspeedMachineState *bmc)
     /* The AST2500 EVB expects a LM75 but a TMP105 is compatible */
     i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 7),
                      TYPE_TMP105, 0x4d);
-
-    /* The AST2500 EVB does not have an RTC. Let's pretend that one is
-     * plugged on the I2C bus header */
-    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 11), "ds1338", 0x32);
 }
 
 static void ast2600_evb_i2c_init(AspeedMachineState *bmc)
-- 
2.35.3

