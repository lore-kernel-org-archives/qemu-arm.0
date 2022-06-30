Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp254750lft;
        Thu, 30 Jun 2022 04:28:07 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uhl2cTKFpHznkleUBv9mqrxjzzv+ujIIa2nDWa0YciwUtiSrRhp7Z1re0J+eNbCLzFtygc
X-Received: by 2002:ac8:478b:0:b0:31a:89a8:ea63 with SMTP id k11-20020ac8478b000000b0031a89a8ea63mr7092309qtq.79.1656588487104;
        Thu, 30 Jun 2022 04:28:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656588487; cv=none;
        d=google.com; s=arc-20160816;
        b=SSlB+0zRUc4Zso7//Kshuh6aqWOXO/TxUmore8X9nB2WOfo5Dm3n+Dv2oMgpbd2jEu
         tWNq5QrNoh4/nQMeXrnhQ+jDn92upMe3fE+kRIq2+Wnd6uyucT1lDCjoeCOsH1iR1AYF
         OJKQovNMdLe0ndaCo+3Gnt8YTcL+lZ4OQfTVjuJyg+eVa8AFFUzncSa1WShZL1NLUY7o
         QTbArmBytMRbDihhEcY5CDr9pCirw30Z8oBAYbHW/ldYVtDccgGQhz/q8g8B/iSYFuLT
         l0k1QCJ80+Qw8TLebw5+U8x71A1XyxD7FEkse62sjS9JOU5kHHHxz7mdB1pGz+9gDwaV
         icVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=Leg777YqgT7ZzcpQjq3oJvoz+DiuuSO9fzfiIltwAfo=;
        b=o1qLYKO5amMTL3m09AdFT5nI/r8XEeTZm0jmmXr/S5bRJU/D1P29bmmZy2Ts5Jphr6
         fz0JatwGACsIekSWxaYtj7ZcKFYfPl69hsHAFdxLdTOl4OvcN+Yq6xrGOI/hjj8ZPV85
         IxH108GNgHVYBnp2IIhe+do6QoALmUcUBdlg1Py34f14Sn4/YuZmEesAcmpCyIqfX71d
         NIl1qv+3WM8Ag+KIyOsDdtFL0+h2KwZNNJax19+b5td3kDSzUdGz7Jum5UWB6xBH2wb9
         90zquD/q96rhiPo9M9y7of+N4/7flXzGtGdN3Huu4hDjWvT7OtdCEJ/+vMkOzkmUBfQh
         ta6Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v12-20020a05620a440c00b006a6ed810103si4310742qkp.393.2022.06.30.04.28.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 30 Jun 2022 04:28:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:50608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o6sL8-0004yJ-FL
	for alex.bennee@linaro.org; Thu, 30 Jun 2022 07:28:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=N4Bw=XF=kaod.org=clg@ozlabs.org>)
 id 1o6sHk-0007Es-Ua; Thu, 30 Jun 2022 07:24:36 -0400
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3]:54405
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=N4Bw=XF=kaod.org=clg@ozlabs.org>)
 id 1o6sHj-000201-1t; Thu, 30 Jun 2022 07:24:36 -0400
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4LYbZm1lcFz4xZB;
 Thu, 30 Jun 2022 21:24:32 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4LYbZk1WmLz4xD5;
 Thu, 30 Jun 2022 21:24:29 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Peter Delevoryas <pdel@fb.com>
Subject: [PULL 05/27] aspeed/i2c: Change trace event for NORMAL_STOP states
Date: Thu, 30 Jun 2022 13:23:49 +0200
Message-Id: <20220630112411.1474431-6-clg@kaod.org>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220630112411.1474431-1-clg@kaod.org>
References: <20220630112411.1474431-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=SRS0=N4Bw=XF=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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
X-TUID: 39N9V9Ow0iwB

Using a 'stop' string seems more appropriate than 'normal'.

Reviewed-by: Peter Delevoryas <pdel@fb.com>
Message-Id: <20220628154740.1117349-3-clg@kaod.org>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/i2c/aspeed_i2c.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/i2c/aspeed_i2c.c b/hw/i2c/aspeed_i2c.c
index 37ae1f2e04bd..9b41bc38964f 100644
--- a/hw/i2c/aspeed_i2c.c
+++ b/hw/i2c/aspeed_i2c.c
@@ -58,7 +58,7 @@ static inline void aspeed_i2c_bus_raise_interrupt(AspeedI2CBus *bus)
                ARRAY_FIELD_EX32(bus->regs, I2CD_INTR_STS, SLAVE_ADDR_RX_MATCH) ?
                                                "slave-match|" : "",
                SHARED_ARRAY_FIELD_EX32(bus->regs, reg_intr_sts, NORMAL_STOP) ?
-                                               "normal|" : "",
+                                               "stop|" : "",
                SHARED_ARRAY_FIELD_EX32(bus->regs, reg_intr_sts, ABNORMAL) ?
                                                "abnormal"  : "");
 
-- 
2.35.3

