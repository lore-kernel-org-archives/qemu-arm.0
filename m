Received: by 2002:a17:505:564d:b0:1be9:327d:8ee3 with SMTP id jl13csp382225njb;
        Wed, 3 Jul 2024 22:38:13 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWY+Py4Z5yxpwbW0tD3Hz/fkzbsatLY7ivrE25xcYAu0hP+7RZn19eUflaHG48UaHJoNsprkemTxnYTRqcIsw8eOdHj4vfZ
X-Google-Smtp-Source: AGHT+IH4mjLuKPUKwb+XOCmMaHea1VSiU7jzg2gt14CnOICQAbhhjFtcS+F8PH/423j8OxiEDsck
X-Received: by 2002:a05:620a:4552:b0:79d:78c2:1bfd with SMTP id af79cd13be357-79eee29a891mr99665385a.63.1720071493066;
        Wed, 03 Jul 2024 22:38:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1720071493; cv=none;
        d=google.com; s=arc-20160816;
        b=X1Iai4oq3XpL/nht7PJsxbAUUQv+zwOy4O2mFNcY+2RC2rOKYOekUaJdlkuoGOuAi4
         5jucbYhMr7r1n/njTQRVu9xvcAGh32gAY8PRAItWQZUPNL72WxqU/aKw680Qwg+wThb7
         q2KA+F18ZFy/8QTWd4gkWYrv3x/byCNGBQtEf9zNcnX6yDUkxEzOWd3dhuLS4OxZP8ee
         2apGxKTyo4tq9664MljgVDWT/yV92fIEkgeRC51uvzjbzEezqRihUOrfyiTkBOk4kS7J
         vZn7qQY3x52hu5ppb9sSDq6Bqv1UyHJAIh5NBK15havkb5E5V13yy40djtnjQ+bULUPC
         luQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=iu6CNvU65NpCZg75wAglcNvd8YEs0L710xhfxPzGxjw=;
        fh=pmKRfOPFN0ULs83IIygI07LSKzxt8irZuLBhP9+6oM8=;
        b=WkkQ35i+je6Kdu3Ca5lq0ZVdN+JAPO7jx2c3r+Bmnk6tgpEHVTLPIiW2JHrvZvF7DR
         /1voRHQ9dmBAvCDFa3Uo2xULBejW9KC4cG1860UZ7/r727f1J2NrfG0FX/NprfH4FtdW
         yIn+RBbQ6Akx5BrE4iw/qLAVWWhsUy4iAbswTYAelpLQnamVdO0YOHNrd3dw+BqIs4Dc
         tityq/wzIQN7rymjvZkihvJA8IilCLjOigKqNZnp+qh1ChMk/qke45/81buQF/svXups
         f1U1Q1YRVmUJsgLRfIfLPHBBTSUX19ozJlEu1P8QpGK2IIiENs2EsI6CMw1HbScMmP0v
         4OkQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=J3bxOT3H;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-446513c2071si139518851cf.117.2024.07.03.22.38.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 03 Jul 2024 22:38:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=J3bxOT3H;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sPFA5-0002FC-T5; Thu, 04 Jul 2024 01:37:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1sPFA4-0002Aw-4m
 for qemu-arm@nongnu.org; Thu, 04 Jul 2024 01:37:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1sPFA0-00027t-MT
 for qemu-arm@nongnu.org; Thu, 04 Jul 2024 01:37:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1720071453;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iu6CNvU65NpCZg75wAglcNvd8YEs0L710xhfxPzGxjw=;
 b=J3bxOT3HCUr//J6r1T3BmzOdb9x5cnDQyZUS9TpJSTD+JUXvJfgmTWzpl17mHA3p69prwC
 yv7O5TGLRDXR3JlpJcfYqMkXD2oLU6XQE09zH241bQTgUolByBhHFyJancRzujWP1I5vBK
 j1fv8Fo+dPPHjEGZQrgo8Q5BNENodsw=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-287-CODLcr5SNE-ev5a_QwqBeg-1; Thu,
 04 Jul 2024 01:37:27 -0400
X-MC-Unique: CODLcr5SNE-ev5a_QwqBeg-1
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 95C471955BC2; Thu,  4 Jul 2024 05:37:25 +0000 (UTC)
Received: from corto.redhat.com (unknown [10.39.192.90])
 by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 90086195607C; Thu,  4 Jul 2024 05:37:22 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Andrew Jeffery <andrew@codeconstruct.com.au>,
 Joel Stanley <joel@jms.id.au>, Steven Lee <steven_lee@aspeedtech.com>,
 Troy Lee <leetroy@gmail.com>, Jamin Lin <jamin_lin@aspeedtech.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH 7/8] aspeed: Introduce a 'hw_strap1' machine attribute
Date: Thu,  4 Jul 2024 07:36:50 +0200
Message-ID: <20240704053651.1100732-8-clg@redhat.com>
In-Reply-To: <20240704053651.1100732-1-clg@redhat.com>
References: <20240704053651.1100732-1-clg@redhat.com>
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
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-TUID: K03GPvWsH2v8

From: Cédric Le Goater <clg@kaod.org>

To change default behavior of a machine and boot from eMMC, future
changes will add a machine option to let the user configure the
boot-from-eMMC HW strapping bit. Add a new machine attribute first.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/arm/aspeed.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index abd2412ad8b9..4ce995e875da 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -46,6 +46,7 @@ struct AspeedMachineState {
     uint32_t uart_chosen;
     char *fmc_model;
     char *spi_model;
+    uint32_t hw_strap1;
 };
 
 /* On 32-bit hosts, lower RAM to 1G because of the 2047 MB limit */
@@ -391,7 +392,7 @@ static void aspeed_machine_init(MachineState *machine)
         }
     }
 
-    object_property_set_int(OBJECT(bmc->soc), "hw-strap1", amc->hw_strap1,
+    object_property_set_int(OBJECT(bmc->soc), "hw-strap1", bmc->hw_strap1,
                             &error_abort);
     object_property_set_int(OBJECT(bmc->soc), "hw-strap2", amc->hw_strap2,
                             &error_abort);
@@ -1075,7 +1076,10 @@ static void aspeed_set_mmio_exec(Object *obj, bool value, Error **errp)
 
 static void aspeed_machine_instance_init(Object *obj)
 {
+    AspeedMachineClass *amc = ASPEED_MACHINE_GET_CLASS(obj);
+
     ASPEED_MACHINE(obj)->mmio_exec = false;
+    ASPEED_MACHINE(obj)->hw_strap1 = amc->hw_strap1;
 }
 
 static char *aspeed_get_fmc_model(Object *obj, Error **errp)
-- 
2.45.2

