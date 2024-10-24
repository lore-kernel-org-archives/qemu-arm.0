Received: by 2002:a17:504:5682:b0:1be9:327d:8ee3 with SMTP id r2csp126043njx;
        Wed, 23 Oct 2024 23:37:40 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWOhbgJV1RMHtBPiXR6YMyLP3So8A8rGVTwtjizuezrvtTpcF75HlJ+DuU9sWnyHuJnKD8uqd2iSFEj5w==@linaro.org
X-Google-Smtp-Source: AGHT+IFG6yWZ/IFiEPrxbckMuFqQ6ONUQxEsNdiMalTepVKC86xkTdpzdL2hKSBirfRDie/7YXVC
X-Received: by 2002:a05:6214:590f:b0:6cd:f1c7:7254 with SMTP id 6a1803df08f44-6ce34287579mr65817646d6.34.1729751860359;
        Wed, 23 Oct 2024 23:37:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1729751860; cv=none;
        d=google.com; s=arc-20240605;
        b=R5BWdCU/vzJIQ7SNJj5vtyjsYS+pG+B0YpZknBNZH3eZDBCA5PSa5MeQnEGbQGzIMn
         EDYLPKdmyR50rbz8VlXU1aS2PQfG2Joa1w1Z4IwoeJhpgBHnkoeC2y9Ss0yPzJ4pe4ya
         ua80auC+YDHVpmckMYMBvaFU9tJ4ajnJbvVRP6hO/7XExOZut1l6ArOZLPDVextyyjYt
         6dXPrOyI8RhxTy1KQscFJWQStqNgNsL96jos07CA/l6hMapPWtNkSWKCTGbx6pD/VXTH
         nfUBGCqAMfOM7OdL5SzZOWhhoCi7iiGwIVyFxe2fpJgiy0r7vO8xVV2MyRA68RctcOcJ
         oIkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=I1oB/OfCv79w1hba7mjaeNA30HkpQTP75ZffIS+cv40=;
        fh=i/PI/VfZf54YsTwJ9sJhiHcO+8PSmdTrt3qYCjPMyJY=;
        b=MUHjaeIoiZlkw5LDb2oyU36DL6DoKAYij6xFPqjJs4v+xw5bFeRiOf+bWQLiS3cJ7c
         VEm9XxkVt2nCjXRTiweh+QNaMjGUI2/Yl5DkThAynQkwVmvjEiqoTrr0sa1MuZedbSel
         TYCG5inywniIVjfWKpCuXb9nWC0Lgw3FWxlR6jljqs/p7O5zABi9SvGERcoxkXyxHjCN
         4IoNPrrCoT+hefcojDVNaUYIpyu3VJfHOJBBI2JJdlNezQkf1RTVgIBGpt032VKUr0sT
         e9lDGfY1Na9SFHLNX7q9bLACaxM80/f+V923YbEQVZihLbStwAETkLfS3cQN5vbCa9bi
         WJdQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=bZdpPMgz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6ce0098abf5si109620956d6.261.2024.10.23.23.37.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 23 Oct 2024 23:37:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=bZdpPMgz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1t3rRe-0002Gp-O9; Thu, 24 Oct 2024 02:35:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1t3rRb-0002F3-SF
 for qemu-arm@nongnu.org; Thu, 24 Oct 2024 02:35:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1t3rRa-0003QM-3P
 for qemu-arm@nongnu.org; Thu, 24 Oct 2024 02:35:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1729751737;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=I1oB/OfCv79w1hba7mjaeNA30HkpQTP75ZffIS+cv40=;
 b=bZdpPMgzS57iCeDLTqBqecLVt3BfKb7h0ePq3gsuu+xqyb5TE4ISNbE+7771uNxGuo2buJ
 7+Q24D61RWoG5KeTD2HcVOVaGXVzEhL0VTBnULIx6aTGytno3yivlF9IiCGdkHzgnPw8Rq
 4by9Dd18dmX3eFyCa8cvp8iNa3WrS1o=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-393-1q3qFdwdPdmy2AyCw-JmxQ-1; Thu,
 24 Oct 2024 02:35:34 -0400
X-MC-Unique: 1q3qFdwdPdmy2AyCw-JmxQ-1
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 360C21955F2E; Thu, 24 Oct 2024 06:35:32 +0000 (UTC)
Received: from corto.redhat.com (unknown [10.39.192.9])
 by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 624CA1956056; Thu, 24 Oct 2024 06:35:30 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Jamin Lin <jamin_lin@aspeedtech.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
Subject: [PULL 06/17] aspeed/soc: Correct GPIO irq 130 for AST2700
Date: Thu, 24 Oct 2024 08:34:56 +0200
Message-ID: <20241024063507.1585765-7-clg@redhat.com>
In-Reply-To: <20241024063507.1585765-1-clg@redhat.com>
References: <20241024063507.1585765-1-clg@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
Received-SPF: pass client-ip=170.10.129.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.263,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1.697,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
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
X-TUID: n+Cx4gxeOmDc

From: Jamin Lin <jamin_lin@aspeedtech.com>

The register set of GPIO have a significant change since AST2700.
Each GPIO pin has their own individual control register and users are able to
set one GPIO pin’s direction, interrupt enable, input mask and so on in the
same one control register.

AST2700 does not have GPIO18_XXX registers for GPIO 1.8v, removes
ASPEED_DEV_GPIO_1_8V. It is enough to only have ASPEED_DEV_GPIO
device in AST2700.

The AST2700 GPIO controller interrupt is connected to GICINT130_INTC at
bit 18. Therefore, correct GPIO irq 130.

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
Reviewed-by: Cédric Le Goater <clg@redhat.com>
---
 hw/arm/aspeed_ast27x0.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/hw/arm/aspeed_ast27x0.c b/hw/arm/aspeed_ast27x0.c
index 761ee116579c..99135edc1ed2 100644
--- a/hw/arm/aspeed_ast27x0.c
+++ b/hw/arm/aspeed_ast27x0.c
@@ -87,8 +87,7 @@ static const int aspeed_soc_ast2700_irqmap[] = {
     [ASPEED_DEV_ADC]       = 130,
     [ASPEED_DEV_XDMA]      = 5,
     [ASPEED_DEV_EMMC]      = 15,
-    [ASPEED_DEV_GPIO]      = 11,
-    [ASPEED_DEV_GPIO_1_8V] = 130,
+    [ASPEED_DEV_GPIO]      = 130,
     [ASPEED_DEV_RTC]       = 13,
     [ASPEED_DEV_TIMER1]    = 16,
     [ASPEED_DEV_TIMER2]    = 17,
@@ -124,7 +123,7 @@ static const int aspeed_soc_ast2700_gic128_intcmap[] = {
 static const int aspeed_soc_ast2700_gic130_intcmap[] = {
     [ASPEED_DEV_I2C]        = 0,
     [ASPEED_DEV_ADC]        = 16,
-    [ASPEED_DEV_GPIO_1_8V]  = 18,
+    [ASPEED_DEV_GPIO]       = 18,
 };
 
 /* GICINT 131 */
-- 
2.47.0

