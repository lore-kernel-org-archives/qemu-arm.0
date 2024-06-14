Received: by 2002:a17:907:681:b0:a6f:694d:5ff8 with SMTP id wn1csp93164ejb;
        Fri, 14 Jun 2024 00:29:36 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUvoPEUWCVdQYcZGBRx4Mh569hHJVfFsNeekcAOM5g1ra5hlTLMs4UY3HtNiN8FcGMjFYBFWsEXyz+Utv328//kq/BFtUfD
X-Google-Smtp-Source: AGHT+IFTGTsFKotvHL2lZjnzy87QYbugfdQgzwlBEokNoGd17HPuvEPhd4EAweZo6lpTWyGjyI2b
X-Received: by 2002:a0c:f842:0:b0:6b0:4cc0:2168 with SMTP id 6a1803df08f44-6b2af2ff426mr35411426d6.30.1718350176197;
        Fri, 14 Jun 2024 00:29:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1718350176; cv=none;
        d=google.com; s=arc-20160816;
        b=tPe3MN3fVXCf2306ciWxbdBfJR18KTVzrh0a7EdgkvzPYEUvVreqgu18+MQa/llYr7
         u2rezmqTGg+iRevRCk1D/Vm9iq6tSno6kHtOmW4ZfIEaF7B2CLMi0ruVBcXfOxhbse2R
         5Wowt+6/8EYIxymTMBM/Up2nqbRA6EZ6F5w1thWQj6hEaCB89EuSbXIzOzRijRxDY3nx
         R3EOS6ykIqkXr8GRIQSR/vkuwXy6cjFdZMubjfJ1j3W/03wiJVyC5JI9TJrnAtNEQBhQ
         8r8oLuC80y989WVaRmIiG5XOjNiwE3XRZc0xXGw8ZVMeySNKg8EKcPDa7be9YsMbLu8q
         PS4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=eCZmP/J2Zbdu/LNH+1MhtiH0c8YE8hp82fj5KAC5fXQ=;
        fh=AcWSTBBcQtYb7MKLFQz0jAErn8oNU1WklmI8CXNUViI=;
        b=Ms+QxhFB6NoPtkQsKfb3YND7fTGhqOHEpXh+ynJtXfHiwQmqMm7k5G2z75j/k9nvBp
         h8DB7W+lA9A23BNAZdOOLIeF26+V/CchpHYXLZluqNGJpwSx9ogKdnXqdEcUlGwpxHGc
         vM0yCiaarDT8+kN/kFthj+Fq0+ZpsJslO03Z0SgdAsZbwT5Lw7cz3kamfkJYjHDsdAYu
         cNOeTQ5mMZ7cWLHF+7zmZxkQLInA59OeJg39zdyqi9z2gHzrmGoprQGvyTeu9zLlyl9Q
         locapA4ybGbEvGuyC5Js7I5erly27ts0wS/96qwHad/MyouVl6uIVWBtr489IOnHFJnv
         6Plg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=KUH5Jgfc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6b2a5afd15asi33035076d6.216.2024.06.14.00.29.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 14 Jun 2024 00:29:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=KUH5Jgfc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sI1Lj-0003IW-H1; Fri, 14 Jun 2024 03:27:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1sI1Lh-0003I8-Sq
 for qemu-arm@nongnu.org; Fri, 14 Jun 2024 03:27:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1sI1Lg-0000m0-Dt
 for qemu-arm@nongnu.org; Fri, 14 Jun 2024 03:27:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1718350067;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eCZmP/J2Zbdu/LNH+1MhtiH0c8YE8hp82fj5KAC5fXQ=;
 b=KUH5JgfcYF+u4u7w1UECCj1MRPVkmfmRniqf21V7jOLYcnP6J4LzlM6axQpv3k+3gmJUKH
 mdlKg/PdUYT2toU/d+AkO2s+2fZUIWMbdYM/n7fLuSPytOhL7vAtZLhfdD5/W8haByQamB
 vl08fKLqExU/VPmKMbfEumHVu1PbL74=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-247-9GCs9DixPx-MjyB_Cn-aDA-1; Fri,
 14 Jun 2024 03:27:41 -0400
X-MC-Unique: 9GCs9DixPx-MjyB_Cn-aDA-1
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 80D55195608B; Fri, 14 Jun 2024 07:27:40 +0000 (UTC)
Received: from corto.redhat.com (unknown [10.39.192.49])
 by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 83C663000219; Fri, 14 Jun 2024 07:27:38 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Jamin Lin <jamin_lin@aspeedtech.com>, Troy Lee <troy_lee@aspeedtech.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PULL 07/19] aspeed/smc: correct device description
Date: Fri, 14 Jun 2024 09:26:08 +0200
Message-ID: <20240614072620.1262053-8-clg@redhat.com>
In-Reply-To: <20240614072620.1262053-1-clg@redhat.com>
References: <20240614072620.1262053-1-clg@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: 11
X-Spam_score: 1.1
X-Spam_bar: +
X-Spam_report: (1.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.145,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 6MUSB28AuA0p

From: Jamin Lin <jamin_lin@aspeedtech.com>

Signed-off-by: Troy Lee <troy_lee@aspeedtech.com>
Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
---
 hw/ssi/aspeed_smc.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/ssi/aspeed_smc.c b/hw/ssi/aspeed_smc.c
index 7075bc9d61b0..fe1cd96b803a 100644
--- a/hw/ssi/aspeed_smc.c
+++ b/hw/ssi/aspeed_smc.c
@@ -1449,7 +1449,7 @@ static void aspeed_2500_fmc_class_init(ObjectClass *klass, void *data)
     DeviceClass *dc = DEVICE_CLASS(klass);
     AspeedSMCClass *asc = ASPEED_SMC_CLASS(klass);
 
-    dc->desc               = "Aspeed 2600 FMC Controller";
+    dc->desc               = "Aspeed 2500 FMC Controller";
     asc->r_conf            = R_CONF;
     asc->r_ce_ctrl         = R_CE_CTRL;
     asc->r_ctrl0           = R_CTRL0;
@@ -1487,7 +1487,7 @@ static void aspeed_2500_spi1_class_init(ObjectClass *klass, void *data)
     DeviceClass *dc = DEVICE_CLASS(klass);
     AspeedSMCClass *asc = ASPEED_SMC_CLASS(klass);
 
-    dc->desc               = "Aspeed 2600 SPI1 Controller";
+    dc->desc               = "Aspeed 2500 SPI1 Controller";
     asc->r_conf            = R_CONF;
     asc->r_ce_ctrl         = R_CE_CTRL;
     asc->r_ctrl0           = R_CTRL0;
@@ -1522,7 +1522,7 @@ static void aspeed_2500_spi2_class_init(ObjectClass *klass, void *data)
     DeviceClass *dc = DEVICE_CLASS(klass);
     AspeedSMCClass *asc = ASPEED_SMC_CLASS(klass);
 
-    dc->desc               = "Aspeed 2600 SPI2 Controller";
+    dc->desc               = "Aspeed 2500 SPI2 Controller";
     asc->r_conf            = R_CONF;
     asc->r_ce_ctrl         = R_CE_CTRL;
     asc->r_ctrl0           = R_CTRL0;
-- 
2.45.2

