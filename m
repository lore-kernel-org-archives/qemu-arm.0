Received: by 2002:a17:505:8f44:b0:1be9:327d:8ee3 with SMTP id jy4csp607286njc;
        Sun, 9 Mar 2025 06:55:10 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWDK9S4aTAt0OzTrjela3hrZc45t03MXpY2HTjU05ctIEdUeI7yTlpY/C+wTIhyA3fvmddov8WUJEBpLQ==@linaro.org
X-Google-Smtp-Source: AGHT+IHYe2aHBGTUEwYuvtXnwaNXBchYCJbUEChDM2Bny7mJVyhXW0rzpvMvUV99W/pf/8Jl8poM
X-Received: by 2002:a05:622a:15c5:b0:476:8225:dac9 with SMTP id d75a77b69052e-4768225deb5mr16522001cf.45.1741528510049;
        Sun, 09 Mar 2025 06:55:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1741528510; cv=none;
        d=google.com; s=arc-20240605;
        b=kA87ixySejdob/NWr8Gx+Py7krwloFONa+8SkQ+Sc8L9jDX0Xwd01c1f6gJbS8h88K
         eG9dhvjbZriUCHtv7ujZojTxNi7iKjgp12ZvnKt4ip8sUrwUYg3SJKiG51W+CbClWkB0
         UvN25qxrcYdH1rUAs/abBFS98QqWfAvbr3gqKl066yLaqjovuPVNo94XYvDHW3zYNTJf
         unJyWM7d4491p4BAd6KQMVyWVDrqPGz9xJMfHvYLk+GmByZmU/FUIp6PXNpfGRbL0tu4
         mKUc5chCib1L1ER5zl7QBC3E5rUdzzuwe7HcrVJhfVN8Hy69jqnfolKMrvwj5Cf/OIzk
         R4iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=o7KeAOD7K4cxXQg+uGQZFPUMlbbq7QvraDKIXJw/+CU=;
        fh=i/PI/VfZf54YsTwJ9sJhiHcO+8PSmdTrt3qYCjPMyJY=;
        b=cKVKQtCInoZl2Svi/z8BKAnnOXcgFL/0bQPc49A0CvpNo735ce/jpJUbV60B47203X
         RrFczV2JYIdIcgjmc8sPD40ZflaZG1neT4HVeM9Po/tD3IB5fDtAeJvLqldRWTuL6BUC
         QrWS49jj3D/h3mwNPqmhtxesrS2OqSGC0GKKMmKYclOPUAyBxwjhYiSJWD+0y4Fx2fk1
         kJyv7CKbCQS4gPKCHI1iD1dFj+LxztUWef/isYYH90u+qPsFn8zZ023Ukvd/nAlaGUn8
         F7+Ls4DGyAD7DtphIjgO6k6S1EA6Phn7nPXiUHtSljnQu/6vno3Fe17Fb0OIZUFRfQDH
         sh9Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=OWaBORR8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4751db44189si72750421cf.512.2025.03.09.06.55.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 09 Mar 2025 06:55:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=OWaBORR8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1trH5H-0000hf-QF; Sun, 09 Mar 2025 09:52:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1trH5B-0000K2-9f
 for qemu-arm@nongnu.org; Sun, 09 Mar 2025 09:52:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1trH59-0003CD-IC
 for qemu-arm@nongnu.org; Sun, 09 Mar 2025 09:52:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1741528362;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=o7KeAOD7K4cxXQg+uGQZFPUMlbbq7QvraDKIXJw/+CU=;
 b=OWaBORR8PEbvWYa46u9SMMhYBmDbv8U23wG09pIUb9vGxQ9FCsCSqWu/zWtFRnH/onderU
 Dt23iPOGnlIRBNy19c0EUK5Npq2N29n/iFDUziRqGsxB7x1he0frGhYNJFGyxp4CdVC1Pj
 DfUukUVXtz+v5WklpKLKoIBBeXWIVqc=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-93-XHeNDx_7MTqyqzFhuNsdTg-1; Sun,
 09 Mar 2025 09:52:39 -0400
X-MC-Unique: XHeNDx_7MTqyqzFhuNsdTg-1
X-Mimecast-MFC-AGG-ID: XHeNDx_7MTqyqzFhuNsdTg_1741528358
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 86C9F180049D; Sun,  9 Mar 2025 13:52:38 +0000 (UTC)
Received: from corto.redhat.com (unknown [10.44.32.17])
 by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id EB5521956094; Sun,  9 Mar 2025 13:52:36 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Jamin Lin <jamin_lin@aspeedtech.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
Subject: [PULL 26/46] hw/arm/aspeed_ast27x0: Sort the IRQ table by IRQ number
Date: Sun,  9 Mar 2025 14:51:10 +0100
Message-ID: <20250309135130.545764-27-clg@redhat.com>
In-Reply-To: <20250309135130.545764-1-clg@redhat.com>
References: <20250309135130.545764-1-clg@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
Received-SPF: pass client-ip=170.10.129.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: xW5WU0XpYyIi

From: Jamin Lin <jamin_lin@aspeedtech.com>

To improve readability, sort the IRQ table by IRQ number.

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
Reviewed-by: Cédric Le Goater <clg@redhat.com>
Link: https://lore.kernel.org/qemu-devel/20250307035945.3698802-10-jamin_lin@aspeedtech.com
Signed-off-by: Cédric Le Goater <clg@redhat.com>
---
 hw/arm/aspeed_ast27x0.c | 50 ++++++++++++++++++++---------------------
 1 file changed, 25 insertions(+), 25 deletions(-)

diff --git a/hw/arm/aspeed_ast27x0.c b/hw/arm/aspeed_ast27x0.c
index 44ddfdd2c6c9..642a8f55212f 100644
--- a/hw/arm/aspeed_ast27x0.c
+++ b/hw/arm/aspeed_ast27x0.c
@@ -74,27 +74,13 @@ static const hwaddr aspeed_soc_ast2700_memmap[] = {
 
 /* Shared Peripheral Interrupt values below are offset by -32 from datasheet */
 static const int aspeed_soc_ast2700a0_irqmap[] = {
-    [ASPEED_DEV_UART0]     = 132,
-    [ASPEED_DEV_UART1]     = 132,
-    [ASPEED_DEV_UART2]     = 132,
-    [ASPEED_DEV_UART3]     = 132,
-    [ASPEED_DEV_UART4]     = 8,
-    [ASPEED_DEV_UART5]     = 132,
-    [ASPEED_DEV_UART6]     = 132,
-    [ASPEED_DEV_UART7]     = 132,
-    [ASPEED_DEV_UART8]     = 132,
-    [ASPEED_DEV_UART9]     = 132,
-    [ASPEED_DEV_UART10]    = 132,
-    [ASPEED_DEV_UART11]    = 132,
-    [ASPEED_DEV_UART12]    = 132,
-    [ASPEED_DEV_FMC]       = 131,
     [ASPEED_DEV_SDMC]      = 0,
-    [ASPEED_DEV_SCU]       = 12,
-    [ASPEED_DEV_ADC]       = 130,
+    [ASPEED_DEV_HACE]      = 4,
     [ASPEED_DEV_XDMA]      = 5,
-    [ASPEED_DEV_EMMC]      = 15,
-    [ASPEED_DEV_GPIO]      = 130,
+    [ASPEED_DEV_UART4]     = 8,
+    [ASPEED_DEV_SCU]       = 12,
     [ASPEED_DEV_RTC]       = 13,
+    [ASPEED_DEV_EMMC]      = 15,
     [ASPEED_DEV_TIMER1]    = 16,
     [ASPEED_DEV_TIMER2]    = 17,
     [ASPEED_DEV_TIMER3]    = 18,
@@ -103,19 +89,33 @@ static const int aspeed_soc_ast2700a0_irqmap[] = {
     [ASPEED_DEV_TIMER6]    = 21,
     [ASPEED_DEV_TIMER7]    = 22,
     [ASPEED_DEV_TIMER8]    = 23,
-    [ASPEED_DEV_WDT]       = 131,
-    [ASPEED_DEV_PWM]       = 131,
+    [ASPEED_DEV_DP]        = 28,
     [ASPEED_DEV_LPC]       = 128,
     [ASPEED_DEV_IBT]       = 128,
+    [ASPEED_DEV_KCS]       = 128,
+    [ASPEED_DEV_ADC]       = 130,
+    [ASPEED_DEV_GPIO]      = 130,
     [ASPEED_DEV_I2C]       = 130,
-    [ASPEED_DEV_PECI]      = 133,
+    [ASPEED_DEV_FMC]       = 131,
+    [ASPEED_DEV_WDT]       = 131,
+    [ASPEED_DEV_PWM]       = 131,
+    [ASPEED_DEV_I3C]       = 131,
+    [ASPEED_DEV_UART0]     = 132,
+    [ASPEED_DEV_UART1]     = 132,
+    [ASPEED_DEV_UART2]     = 132,
+    [ASPEED_DEV_UART3]     = 132,
+    [ASPEED_DEV_UART5]     = 132,
+    [ASPEED_DEV_UART6]     = 132,
+    [ASPEED_DEV_UART7]     = 132,
+    [ASPEED_DEV_UART8]     = 132,
+    [ASPEED_DEV_UART9]     = 132,
+    [ASPEED_DEV_UART10]    = 132,
+    [ASPEED_DEV_UART11]    = 132,
+    [ASPEED_DEV_UART12]    = 132,
     [ASPEED_DEV_ETH1]      = 132,
     [ASPEED_DEV_ETH2]      = 132,
     [ASPEED_DEV_ETH3]      = 132,
-    [ASPEED_DEV_HACE]      = 4,
-    [ASPEED_DEV_KCS]       = 128,
-    [ASPEED_DEV_DP]        = 28,
-    [ASPEED_DEV_I3C]       = 131,
+    [ASPEED_DEV_PECI]      = 133,
     [ASPEED_DEV_SDHCI]     = 133,
 };
 
-- 
2.48.1

