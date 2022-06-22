Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp1880333lft;
        Wed, 22 Jun 2022 03:08:54 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sr8rET8X7KC0aHmpHz3p7yrSimul/ojzasvEhyZFOaexRP41hfjvlPI5WZ9ZIKemqDjiRK
X-Received: by 2002:a05:620a:22b6:b0:6a6:dceb:880a with SMTP id p22-20020a05620a22b600b006a6dceb880amr1498761qkh.675.1655892534685;
        Wed, 22 Jun 2022 03:08:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1655892534; cv=none;
        d=google.com; s=arc-20160816;
        b=NfjjVevsMLr2o8IxDCOIF6LxCM+sO4yCmYR355bMDO8kjxf2YmB7mrlgVdlwei3k0F
         5Ux8vVk8rai7mRSkL9vIrwG9DVkvfkWcgnaddF1lCX7Is6x5ALMiacnzPH9Et8BlxwNf
         SkF1pCe6rmYCXsrircp7fxAgCdok1sLSYlt5DN6D8maURlDsP2DYZz3MZv29vIOm6DFU
         s9fCTUKgniN3szArTvo/ebs6E7I7yos1oPdQ4ed6yBkRj4NOO/kByzoda+n9OFCjE16d
         D4Rfuti/sgxxH1lzYJfJh+iFeKANUrMbhVNH1J32RN1Jn2fpSafbd+Icab4IeVzPX08p
         SHCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=3r5JegCVE6c4O6IVph7tLV6JVrAMtKCw7H+fPsL4XTg=;
        b=Nrp6v9ZCV4QW0zM28uKxQnABfVnCsjI7XGx860W9IecFLWuTbDkKFFf/RcouvYOoeo
         Mn01ye4NaLRYJrm95TOzWuKUfbRnKVoaRp5+WDUbgVS+GlQCFFZnUXoH6Jacn7XlD2fl
         0Z1Bv4Z2OZSbXx48JKPbjfGPXVbGRDNl5yrwuxgDEik8QD1caWTrwDMPa3UjpZwP8oF/
         Q780A9EfgFbKrKe4HiB0I6RJMkKuNmsVTt7LpkEJgOy0VCnx3M8yIJ9jeo03qpIQAmPv
         1wzpHGCYe/hlqacaUPJdQKH9DRblxSsS26NBka+wdEgYF2d4MQWLHOqIZDn8dvacX45I
         FfyQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n17-20020ae9c311000000b006a68b074727si10582667qkg.199.2022.06.22.03.08.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 22 Jun 2022 03:08:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:56754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o3xI6-0008B8-5k
	for alex.bennee@linaro.org; Wed, 22 Jun 2022 06:08:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=05Ho=W5=kaod.org=clg@ozlabs.org>)
 id 1o3x5y-0006y5-0G; Wed, 22 Jun 2022 05:56:22 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:37935)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=05Ho=W5=kaod.org=clg@ozlabs.org>)
 id 1o3x5q-0004qP-2T; Wed, 22 Jun 2022 05:56:16 -0400
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4LSf0X64lDz4xZj;
 Wed, 22 Jun 2022 19:56:12 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4LSf0V5m5fz4xD9;
 Wed, 22 Jun 2022 19:56:10 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PULL 18/19] aspeed/hace: Add missing newlines to unimp messages
Date: Wed, 22 Jun 2022 11:55:19 +0200
Message-Id: <20220622095520.3683321-19-clg@kaod.org>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220622095520.3683321-1-clg@kaod.org>
References: <20220622095520.3683321-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=05Ho=W5=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
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
X-TUID: a79IAk0Mq3iU

From: Joel Stanley <joel@jms.id.au>

Signed-off-by: Joel Stanley <joel@jms.id.au>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/misc/aspeed_hace.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/misc/aspeed_hace.c b/hw/misc/aspeed_hace.c
index 4b5997e18fad..731234b78c4c 100644
--- a/hw/misc/aspeed_hace.c
+++ b/hw/misc/aspeed_hace.c
@@ -340,12 +340,12 @@ static void aspeed_hace_write(void *opaque, hwaddr addr, uint64_t data,
 
         if ((data & HASH_HMAC_MASK)) {
             qemu_log_mask(LOG_UNIMP,
-                          "%s: HMAC engine command mode %"PRIx64" not implemented",
+                          "%s: HMAC engine command mode %"PRIx64" not implemented\n",
                           __func__, (data & HASH_HMAC_MASK) >> 8);
         }
         if (data & BIT(1)) {
             qemu_log_mask(LOG_UNIMP,
-                          "%s: Cascaded mode not implemented",
+                          "%s: Cascaded mode not implemented\n",
                           __func__);
         }
         algo = hash_algo_lookup(data);
-- 
2.35.3

