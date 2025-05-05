Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp2306726njj;
        Mon, 5 May 2025 02:11:58 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXeV0xeTWe+HKT5Kx83/YWtw0ZLVDvvdEmVydsU4oQq4BqpXEDYZfAEffJcynwyG9cPxgEwUSa/1dcTyw==@linaro.org
X-Google-Smtp-Source: AGHT+IFT4R31PRPfZ7PryWXFwEaY0+uAVin1w/nu7r0kMGRkLwgFx7/2QLOE6pFy+KPEu7/0zkPE
X-Received: by 2002:a05:6000:4382:b0:3a0:831a:42b3 with SMTP id ffacd0b85a97d-3a09fdd4ac3mr4992600f8f.40.1746436318265;
        Mon, 05 May 2025 02:11:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746436318; cv=none;
        d=google.com; s=arc-20240605;
        b=atYPJgAMVtbYS2c42rNCaFShLrxKMNBoVTkcCIGAIpl0PRDx1Gu6bliyn019Brtr37
         zzr0447lg3l0f7aXQq+wOl7MkI+MeBjoOU5BOvLItRurAIyBeuSBaZG/X+CxN72cZYGG
         7R3u3QKsc+t0U9IHnLvPqtySjxHb7FRakiIIUH85+fNbWFxr1l63ehb6fgIthA77yrkx
         91roeaPpXCi90xg3GZr8M3fRI6anvnMSHfq4cX+kT8kV0cw4gq1NEYm2zz4RgR2pFFe7
         L/7Kmk046jMrhOpt5HndUgy3+Z6R64pUVKO9ydKp5TEBU6BZLa9bAeHVc6+XGkaq3Xlc
         q3zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=tflaZVL/Gi8AvsVBx5Cs/8+jfMQ7qN3i139cq4xOVHs=;
        fh=O3GBR2OOT5hhNkvxv+rlHs7YTTnYAArA4Xdium3ocZU=;
        b=Zpfia7UIhW89OqMk7pJ5ebq5upGXioTS3pDW9lQ5ykTHOJ/kDmAs21SxGGEt96lJbh
         x1B5K9LmUwYhYYFd/w7QUegLZ/dD+DOBRwrAlzoM+F5rCeJ/rTqs78VU1pokFTJ/+kwm
         MFCTvwEXRrPIGugMmodBhkCcKZ4aIwXULU7pX10wD9PLp4M35ODqEr2GEDINmJEkBG7S
         rxx5uTy4Z+Mh1nhpBA31Bnm1v0l+vht+m/1Yk4KDPbKj8DzjrfU5qN76mdyZeFqpLc6m
         qykKHSs17ZwYm4UvxCw0L2ldwwC/TSAh17eZ+JHp6M0jRzeGbLWfkCWllr9wYrIcrfov
         QSxw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=cCKQV5oW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ffacd0b85a97d-3a099ae3214si5091180f8f.242.2025.05.05.02.11.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 05 May 2025 02:11:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=cCKQV5oW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uBrrL-0005Ir-SS; Mon, 05 May 2025 05:11:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1uBrnP-00087S-1Q
 for qemu-arm@nongnu.org; Mon, 05 May 2025 05:07:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1uBrnM-0006NT-Oj
 for qemu-arm@nongnu.org; Mon, 05 May 2025 05:07:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1746436047;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tflaZVL/Gi8AvsVBx5Cs/8+jfMQ7qN3i139cq4xOVHs=;
 b=cCKQV5oWojUtRIPhXetja8J76EcfTlDuWsBQ3kZGfSB+KKIJL4NGyfOA8YHRX+DqqTRhJZ
 19VejsCpY7EWtA+Yu2csvEzSfBhUqqhtijxir2XQt4A5qS0r1p4R0SrZPRs84xeug3v4rb
 p0BDVHXQq0C7FjJJ5Wm+E7gy9rfkPLc=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-650-wD0Lxm7_NA6Gp1RvBjORog-1; Mon,
 05 May 2025 05:07:25 -0400
X-MC-Unique: wD0Lxm7_NA6Gp1RvBjORog-1
X-Mimecast-MFC-AGG-ID: wD0Lxm7_NA6Gp1RvBjORog_1746436044
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 52A4E19560A2; Mon,  5 May 2025 09:07:24 +0000 (UTC)
Received: from corto.redhat.com (unknown [10.44.32.38])
 by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id AF80330001A2; Mon,  5 May 2025 09:07:22 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Steven Lee <steven_lee@aspeedtech.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
Subject: [PULL 16/23] aspeed: ast27x0: Correct hex notation for device
 addresses
Date: Mon,  5 May 2025 11:06:28 +0200
Message-ID: <20250505090635.778785-17-clg@redhat.com>
In-Reply-To: <20250505090635.778785-1-clg@redhat.com>
References: <20250505090635.778785-1-clg@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.411,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=-1, RCVD_IN_MSPIKE_WL=-0.01,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: cjMyziZ6zSAX

From: Steven Lee <steven_lee@aspeedtech.com>

Corrected the hexadecimal notation for several device addresses in the
aspeed_soc_ast2700_memmap array by changing the uppercase 'X' to
lowercase 'x'.

Signed-off-by: Steven Lee <steven_lee@aspeedtech.com>
Change-Id: I45426e18ea8e68d7ccdf9b60c4ea235c4da33cc3
Reviewed-by: Cédric Le Goater <clg@redhat.com>
Link: https://lore.kernel.org/qemu-devel/20250502103449.3091642-3-steven_lee@aspeedtech.com
Signed-off-by: Cédric Le Goater <clg@redhat.com>
---
 hw/arm/aspeed_ast27x0.c | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/hw/arm/aspeed_ast27x0.c b/hw/arm/aspeed_ast27x0.c
index 21769669df27..1974a257660c 100644
--- a/hw/arm/aspeed_ast27x0.c
+++ b/hw/arm/aspeed_ast27x0.c
@@ -46,7 +46,7 @@ static const hwaddr aspeed_soc_ast2700_memmap[] = {
     [ASPEED_DEV_RTC]       =  0x12C0F000,
     [ASPEED_DEV_TIMER1]    =  0x12C10000,
     [ASPEED_DEV_SLI]       =  0x12C17000,
-    [ASPEED_DEV_UART4]     =  0X12C1A000,
+    [ASPEED_DEV_UART4]     =  0x12C1A000,
     [ASPEED_DEV_IOMEM1]    =  0x14000000,
     [ASPEED_DEV_FMC]       =  0x14000000,
     [ASPEED_DEV_SPI0]      =  0x14010000,
@@ -67,19 +67,19 @@ static const hwaddr aspeed_soc_ast2700_memmap[] = {
     [ASPEED_DEV_I2C]       =  0x14C0F000,
     [ASPEED_DEV_INTCIO]    =  0x14C18000,
     [ASPEED_DEV_SLIIO]     =  0x14C1E000,
-    [ASPEED_DEV_VUART]     =  0X14C30000,
-    [ASPEED_DEV_UART0]     =  0X14C33000,
-    [ASPEED_DEV_UART1]     =  0X14C33100,
-    [ASPEED_DEV_UART2]     =  0X14C33200,
-    [ASPEED_DEV_UART3]     =  0X14C33300,
-    [ASPEED_DEV_UART5]     =  0X14C33400,
-    [ASPEED_DEV_UART6]     =  0X14C33500,
-    [ASPEED_DEV_UART7]     =  0X14C33600,
-    [ASPEED_DEV_UART8]     =  0X14C33700,
-    [ASPEED_DEV_UART9]     =  0X14C33800,
-    [ASPEED_DEV_UART10]    =  0X14C33900,
-    [ASPEED_DEV_UART11]    =  0X14C33A00,
-    [ASPEED_DEV_UART12]    =  0X14C33B00,
+    [ASPEED_DEV_VUART]     =  0x14C30000,
+    [ASPEED_DEV_UART0]     =  0x14C33000,
+    [ASPEED_DEV_UART1]     =  0x14C33100,
+    [ASPEED_DEV_UART2]     =  0x14C33200,
+    [ASPEED_DEV_UART3]     =  0x14C33300,
+    [ASPEED_DEV_UART5]     =  0x14C33400,
+    [ASPEED_DEV_UART6]     =  0x14C33500,
+    [ASPEED_DEV_UART7]     =  0x14C33600,
+    [ASPEED_DEV_UART8]     =  0x14C33700,
+    [ASPEED_DEV_UART9]     =  0x14C33800,
+    [ASPEED_DEV_UART10]    =  0x14C33900,
+    [ASPEED_DEV_UART11]    =  0x14C33A00,
+    [ASPEED_DEV_UART12]    =  0x14C33B00,
     [ASPEED_DEV_WDT]       =  0x14C37000,
     [ASPEED_DEV_SPI_BOOT]  =  0x100000000,
     [ASPEED_DEV_LTPI]      =  0x300000000,
-- 
2.49.0

