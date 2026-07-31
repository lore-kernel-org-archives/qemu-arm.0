Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD0E6C5516D
	for <qemu-arm@archiver.kernel.org>; Fri, 31 Jul 2026 12:29:17 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wpmMJ-0003hA-T1; Fri, 31 Jul 2026 08:29:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1wpmMI-0003gp-9r
 for qemu-arm@nongnu.org; Fri, 31 Jul 2026 08:29:02 -0400
Received: from mail-ej1-f47.google.com ([209.85.218.47])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1wpmMG-0007p0-RM
 for qemu-arm@nongnu.org; Fri, 31 Jul 2026 08:29:02 -0400
Received: by mail-ej1-f47.google.com with SMTP id
 a640c23a62f3a-c1f5208b38dso163847666b.0
 for <qemu-arm@nongnu.org>; Fri, 31 Jul 2026 05:29:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785500939; x=1786105739;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=3HXSIeK8mWZ2PnMbAWCWa/yBZfh8RAlza6b/3uHsW2c=;
 b=fBrsB8DIAklRHRRsyd8N5auScPmvJ+fq1GspT23ri1MSfio/JNLkL78bU976ixd/HA
 fs8KBzIaVSHR3zgzM7XwXnpm06LLDdQNoCTZjpPoSt5qtIRH5M4PrtW7YOYdQeIpb9Il
 fVvStbgTbFgPiYZd0oUheUayGdFIlyr41kbTktAT5w2M8DSbIm1Ka1FQI1p5WQGkbNVz
 NMvlCVKDQd3vXYtMNuVPgRVdzhsfxyIovfSvWoxq14pUobSgWzDN3yOlNzGPOg3Sf810
 OktbNskJr1jlumOAeoSp3b3s8F41bxoM3DjQOxxm38tT5outuKNU/d3LzAs9AZ6WeDPp
 UK8g==
X-Forwarded-Encrypted: i=1;
 AHgh+RrMLnVk09Bd7g/iXnUTyQLfYJ+MtEC3hIRKj1yc/Y+Ch46iHv2eOQDMTGGeOxZtLcyX31oX8dBjLg==@nongnu.org
X-Gm-Message-State: AOJu0Yy7HXXd4HDEoBHhJvme+MRdz22Uwl7989lZ9Cc3NSSvJBdglIg5
 36kM/mK8m9AxBCV9QBxuxdaanNMitk/reki9H4M6trMwRLBMhyRRc/MR
X-Gm-Gg: AR+sD11pfowqeIppu8bYgryoGFCPKJI7u+kE/wFdD3Z9DkrWtF/7w1IF1cQAdWB02pr
 vKnEKQEmO2hhNtoW8ZYZNDrtsTNdyV0aB8rG2Z5deHl4cSem4jslg63fPbTkhYlcZtKqXKmfGpm
 jdO2TNk4WH/mtcdYLm23+u+RhlM9qBH3pv0QsU4LXiZkU+OTMtnQqXZSeYWJsNQaRnIIFZTJlcw
 xeImhuNcNLK+yy3MDIpEDal6TbH4cVLaWcOjIlSD4uKQHefAxec/ToQZCN2mUFXgAyEJNGYtE9Z
 utvUuGomejvNmf4PPG+C/LucTbz6NMHUx1Tov4jjoCKRCKSqPzrDt9PZ3n96cSX8P87N5UbpQBv
 jAqIEwCBWrrgvm212EOB+NpAlbhlCMBy3TYyRNdfSEtpVPReNtH9m8rxFyjwpR+/wo12q4wjjqr
 P42Xh5/ihgebsMe1ZMBnA4FmLYxfbhYiZhvPNrOzK+nCY/+v3Dci8aJBG3oIacM6pItk2ftF7V5
 0fzgKEIfyCulEMr6Dgume+7SET/Rm7upX5J
X-Received: by 2002:a17:907:ea8c:b0:c1c:4d19:f733 with SMTP id
 a640c23a62f3a-c1fd253ca8fmr123373466b.40.1785500938847; 
 Fri, 31 Jul 2026 05:28:58 -0700 (PDT)
Received: from localhost (89-93-216-19.hfc.dyn.abo.bbox.fr. [89.93.216.19])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47fd458b05fsm4427813f8f.28.2026.07.31.05.28.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Jul 2026 05:28:58 -0700 (PDT)
Date: Fri, 31 Jul 2026 12:45:04 +0200
Subject: [PATCH v2 05/25] hw/sensor: tmp105: describe the temperature property
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260731-sanmiguel-bmc-locator-v2-5-1266926ba769@free.fr>
References: <20260731-sanmiguel-bmc-locator-v2-0-1266926ba769@free.fr>
In-Reply-To: <20260731-sanmiguel-bmc-locator-v2-0-1266926ba769@free.fr>
To: qemu-devel@nongnu.org
Cc: =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <philmd@mailo.com>, 
 =?utf-8?q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Peter Maydell <peter.maydell@linaro.org>, 
 Steven Lee <steven_lee@aspeedtech.com>, 
 Jamin Lin <jamin_lin@aspeedtech.com>, Kane Chen <kane_chen@aspeedtech.com>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>, 
 qemu-arm@nongnu.org, Fabiano Rosas <farosas@suse.de>, 
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Thomas Huth <th.huth+qemu@posteo.eu>, 
 =?utf-8?q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Emmanuel Blot <eblot@meta.com>, Emmanuel Blot <emmanuel.blot@free.fr>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785494707; l=912;
 i=emmanuel.blot@free.fr; s=20260602; h=from:subject:message-id;
 bh=g8A8gv76U0FMm8xBATGnot2HwMPDfcx9sBsIePg5EDM=;
 b=M4vWqPJGaRiiRPGeGTbq9yhgPt9jN61jcU/MNTm71Vxb1iVNuBSYLNwkqop+u/hA3LumQo2tp
 4+km/3BMqirAZ0DMsobg+Kst9lkM+szNMYhzLBMv5/c1cSAPWcsSfWV
X-Developer-Key: i=emmanuel.blot@free.fr; a=ed25519;
 pk=0qFrZ21FAAN8OfVsSoVcCFTk/NMYOWzxJz4paSAVm0g=
Received-SPF: pass client-ip=209.85.218.47; envelope-from=eblot.ml@gmail.com;
 helo=mail-ej1-f47.google.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.001, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Reply-to:  Emmanuel Blot <emmanuel.blot@free.fr>
From:  Emmanuel Blot via <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Attach a description to the dynamic "temperature" QOM property so it is
documented in the QOM introspection output (qom-list-properties). The
value is expressed in millidegrees Celsius.

Signed-off-by: Emmanuel Blot <emmanuel.blot@free.fr>
---
 hw/sensor/tmp105.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/sensor/tmp105.c b/hw/sensor/tmp105.c
index 5c77f991cc..fefa661711 100644
--- a/hw/sensor/tmp105.c
+++ b/hw/sensor/tmp105.c
@@ -367,6 +367,8 @@ static void tmp105_initfn(Object *obj)
     object_property_add(obj, "temperature", "int",
                         tmp105_get_temperature,
                         tmp105_set_temperature, NULL, NULL);
+    object_property_set_description(obj, "temperature",
+                                    "Temperature, in millidegrees Celsius");
 }
 
 static void tmp105_class_init(ObjectClass *klass, const void *data)

-- 
2.50.1


