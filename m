Received: by 2002:a17:505:610b:b0:1be9:327d:8ee3 with SMTP id tt11csp2002571njc;
        Mon, 4 Nov 2024 02:17:24 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWhS2TdvmsbCgiyvr3MqDIy0K6fkPSDVW0Pzute4id0I2myYV/svfuPGXWYbR1ax4vngZnldatXFGU3pw==@linaro.org
X-Google-Smtp-Source: AGHT+IEYXb0IMoRWack2QZwUDfvrlUsZyNDxBoiTMAjpnfvA4s0dGxJ/t2sSX08YhI226B2jC+kG
X-Received: by 2002:a05:620a:40d6:b0:7a1:e4e4:3a9e with SMTP id af79cd13be357-7b1aed921b2mr2440327385a.21.1730715444609;
        Mon, 04 Nov 2024 02:17:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1730715444; cv=none;
        d=google.com; s=arc-20240605;
        b=ITN7xrWfnsXY8GP09aBk9fS14HaE2gB04S2G+U89KbChocURNEeu8o+80QCHa/UUXR
         7gFOIuwa8s177TuidtwmRrNwGVyMd7KTMEbhVYKlafg1/xu1Lnvx/AhjR33VtsNg084P
         KsAIWOlgucqu1XQIfFxYheYA9z48hFh2Rpu+x3IWc1LJ5/TUD5YVGNfqMIGk4YjriqiB
         vwgUTDp1BPm3cBMEilzDTrLC1Hr5JXA2LNsTC/CgP+rtvdpT2Syw/aQynImdQhNaj5yQ
         ZHXfL1CPu9hy4E9iYGsZYAoWJPEgC6MRU0M9abVBd6f1aSm27Ee/Ff5QMrwxN0dVAT2b
         j42g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=wURCA/J3t3nlSwY6omLtbIcXXCMyGEwLA4Zktk+w0jw=;
        fh=i/PI/VfZf54YsTwJ9sJhiHcO+8PSmdTrt3qYCjPMyJY=;
        b=e2RDXdcfPT3woq+kea/UIN4kV5JNuurfKf4YAp6eZvRgi/cQlP6ZhN8pSmZzjOnNzb
         nA8D8PmjRFMPSKwNBmWWClL3KNhV7qa6xlfVxLYDAcqZDeYQYR4yn1/gfYl1GANOkRMF
         6bIy7ulsYCtSA8taK6ww3CA0lj7O8BomVntpGvLNbugQKrqsvjgx2NdtfznN+kJG1Dly
         y+vcOArZxRA7aN1aj/cM5gCMU273+O6BdF+phE3YOO/YuUP9oGvZJXnMeIveuryKUcVw
         HTedb9TyHv0WqCl2bQVK9xeZ3Vfg/rKYVWUqC9Z9J2eOG9cl1eEpCnKoI2XCKkAWDpoK
         TcUA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=gl71ulpp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b2f3a815adsi1037733985a.240.2024.11.04.02.17.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 Nov 2024 02:17:24 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=gl71ulpp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1t7u7n-0000sR-CD; Mon, 04 Nov 2024 05:15:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1t7u7V-0000nL-9p
 for qemu-arm@nongnu.org; Mon, 04 Nov 2024 05:15:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1t7u7S-0006cs-FP
 for qemu-arm@nongnu.org; Mon, 04 Nov 2024 05:15:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1730715331;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wURCA/J3t3nlSwY6omLtbIcXXCMyGEwLA4Zktk+w0jw=;
 b=gl71ulpp+YtmDgYluM6Q3latcusfk/Q/A1e4WS+uXdCpPWW9MeKZq9Ffs70fg/95YLZcHH
 6aFdAkdJNgx/KbuD/W/7Dwq15Dmpek53WyXHKoWUTBK1AuQ8yyZMjRS/7F3x+gMDTrCYGX
 tgY+89sQeZxhDN6h+kB22rdD3FmGs0o=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-671-FTDcEMctNi2gYfXBtJvkLg-1; Mon,
 04 Nov 2024 05:15:27 -0500
X-MC-Unique: FTDcEMctNi2gYfXBtJvkLg-1
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id EAA261944CC5; Mon,  4 Nov 2024 10:15:26 +0000 (UTC)
Received: from corto.redhat.com (unknown [10.39.192.67])
 by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 87F701956052; Mon,  4 Nov 2024 10:15:25 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Jamin Lin <jamin_lin@aspeedtech.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
Subject: [PULL 09/10] aspeed: Support create flash devices via command line
 for AST1030
Date: Mon,  4 Nov 2024 11:15:00 +0100
Message-ID: <20241104101501.2487001-10-clg@redhat.com>
In-Reply-To: <20241104101501.2487001-1-clg@redhat.com>
References: <20241104101501.2487001-1-clg@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
Received-SPF: pass client-ip=170.10.129.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.34,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
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
X-TUID: tTaipRQuLKwT

From: Jamin Lin <jamin_lin@aspeedtech.com>

Add a "if-statement" in aspeed_minibmc_machine_init function. If users add
"-nodefaults" in command line, the flash devices should be created by users
setting. Otherwise, the flash devices are created at machine init.

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
Reviewed-by: Cédric Le Goater <clg@redhat.com>
---
 hw/arm/aspeed.c | 22 ++++++++++++----------
 1 file changed, 12 insertions(+), 10 deletions(-)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index b4b1ce9efb2b..e447923536b4 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -1594,18 +1594,20 @@ static void aspeed_minibmc_machine_init(MachineState *machine)
     connect_serial_hds_to_uarts(bmc);
     qdev_realize(DEVICE(bmc->soc), NULL, &error_abort);
 
-    aspeed_board_init_flashes(&bmc->soc->fmc,
-                              bmc->fmc_model ? bmc->fmc_model : amc->fmc_model,
-                              amc->num_cs,
-                              0);
+    if (defaults_enabled()) {
+        aspeed_board_init_flashes(&bmc->soc->fmc,
+                            bmc->fmc_model ? bmc->fmc_model : amc->fmc_model,
+                            amc->num_cs,
+                            0);
 
-    aspeed_board_init_flashes(&bmc->soc->spi[0],
-                              bmc->spi_model ? bmc->spi_model : amc->spi_model,
-                              amc->num_cs, amc->num_cs);
+        aspeed_board_init_flashes(&bmc->soc->spi[0],
+                            bmc->spi_model ? bmc->spi_model : amc->spi_model,
+                            amc->num_cs, amc->num_cs);
 
-    aspeed_board_init_flashes(&bmc->soc->spi[1],
-                              bmc->spi_model ? bmc->spi_model : amc->spi_model,
-                              amc->num_cs, (amc->num_cs * 2));
+        aspeed_board_init_flashes(&bmc->soc->spi[1],
+                            bmc->spi_model ? bmc->spi_model : amc->spi_model,
+                            amc->num_cs, (amc->num_cs * 2));
+    }
 
     if (amc->i2c_init) {
         amc->i2c_init(bmc);
-- 
2.47.0

