Received: by 2002:a19:3859:0:0:0:0:0 with SMTP id d25csp1224913lfj;
        Tue, 3 May 2022 00:02:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJznZ3QD4LtHVeVT3a8zoz+M15GPbGmREZa+YY5nUo3bGjaOzVSEMaF1Fc3v5OnJj6AEAJQR
X-Received: by 2002:a05:622a:1646:b0:2f3:a610:9d99 with SMTP id y6-20020a05622a164600b002f3a6109d99mr7183611qtj.55.1651561332015;
        Tue, 03 May 2022 00:02:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1651561332; cv=none;
        d=google.com; s=arc-20160816;
        b=0ZxnrhKqsj3p4Z+ejg604RprHHXZnHr6JXNK0G57H898FbRpMkFCbDUJ9Ib/SYt7tO
         jNRM0Vxdwy5qKWinKL3qCv9PNrddriaLhs4r8iFbtimqRHQhxUAFh3gGLKiUxNqTHT52
         3FnLWX8eLIexJacwz3biOjUmiE54YksWac21fkVcw4P3DbHD/tp81Ml1pf1qYo2alrqR
         0a5wGAp/OqVSTAqMdfXlxlXZbuAQr4pRp+ETu/Pz4jXeRx6AwH4smDptwqsT9uR4/1LP
         xHBHoHffvWQ2Ltt/NbdZppN7YiF42UduveAtJ+qrQBOpsux83/2Wqo0yS7fLYulroeXD
         QG4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=X51Z7FvDHNhcVisvNx2n8HhjApSCIMCGa4y0PXHQP4Y=;
        b=GKyQePEbGAWoaSwlEi4dv8gDHgwbqW2YpQ53rFkbEJjTi1iN7tQUmvJ8VBhvhzAXbb
         1RL/ZahBPZ+MIIYKT9VePy/K4x0F4q1yPqlfF7s0b0/Od0xayfp9RjlXSacxord9jhWP
         J0//dJMT+xGmfUVih0LbveiPw2ihC1I0Xqk2cR6H4KGpHlGArhUaoB7ZUMr2SohM299+
         5dDLPaiR0wRJbBUHG6z3QtM5TIOlBMbRcZ6Vy6qT8485VQtpyJjoUTKC4ncWFBb6K8Du
         u7aJyADeOEwLKNaLTksezPi00LSzkKqQLSpza/QRSiYU2dB96XOPvyKkY1wosX7VZDgm
         SdOQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n6-20020a37bd06000000b0069e5de8be68si6929211qkf.391.2022.05.03.00.02.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 03 May 2022 00:02:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:41326 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nlmXz-0003zo-E8
	for alex.bennee@linaro.org; Tue, 03 May 2022 03:02:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=XF6a=VL=kaod.org=clg@ozlabs.org>)
 id 1nlmUy-0002zL-I7; Tue, 03 May 2022 02:59:04 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:46799)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=XF6a=VL=kaod.org=clg@ozlabs.org>)
 id 1nlmUw-0007S4-RM; Tue, 03 May 2022 02:59:04 -0400
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4KsrR82vsGz4ySt;
 Tue,  3 May 2022 16:59:00 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4KsrR62Szcz4yST;
 Tue,  3 May 2022 16:58:58 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PULL 03/19] aspeed: sbc: Correct default reset values
Date: Tue,  3 May 2022 08:58:32 +0200
Message-Id: <20220503065848.125215-4-clg@kaod.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220503065848.125215-1-clg@kaod.org>
References: <20220503065848.125215-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
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
X-TUID: bwxZ07IQiwCB

From: Joel Stanley <joel@jms.id.au>

In order to correctly report secure boot running firmware, these values
must be set. They are taken from a running machine when secure boot is
enabled.

We don't yet have documentation from ASPEED on what they mean. Set the
raw values for now, and in the future improve the model with properties
to set these on a per-machine basis.

Signed-off-by: Joel Stanley <joel@jms.id.au>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20220310052159.183975-1-joel@jms.id.au>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/misc/aspeed_sbc.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/hw/misc/aspeed_sbc.c b/hw/misc/aspeed_sbc.c
index 40f2a8c6312f..bfa8b81d01c7 100644
--- a/hw/misc/aspeed_sbc.c
+++ b/hw/misc/aspeed_sbc.c
@@ -17,6 +17,7 @@
 
 #define R_PROT          (0x000 / 4)
 #define R_STATUS        (0x014 / 4)
+#define R_QSR           (0x040 / 4)
 
 static uint64_t aspeed_sbc_read(void *opaque, hwaddr addr, unsigned int size)
 {
@@ -50,6 +51,7 @@ static void aspeed_sbc_write(void *opaque, hwaddr addr, uint64_t data,
 
     switch (addr) {
     case R_STATUS:
+    case R_QSR:
         qemu_log_mask(LOG_GUEST_ERROR,
                       "%s: write to read only register 0x%" HWADDR_PRIx "\n",
                       __func__, addr << 2);
@@ -77,8 +79,9 @@ static void aspeed_sbc_reset(DeviceState *dev)
 
     memset(s->regs, 0, sizeof(s->regs));
 
-    /* Set secure boot enabled, and boot from emmc/spi */
-    s->regs[R_STATUS] = 1 << 6 | 1 << 5;
+    /* Set secure boot enabled with RSA4096_SHA256 and enable eMMC ABR */
+    s->regs[R_STATUS] = 0x000044C6;
+    s->regs[R_QSR] = 0x07C07C89;
 }
 
 static void aspeed_sbc_realize(DeviceState *dev, Error **errp)
-- 
2.35.1

