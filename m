Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D33C7606A32E
	for <qemu-arm@archiver.kernel.org>; Thu,  5 Nov 2026 09:13:48 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xOtXQ-00053U-FO; Thu, 05 Nov 2026 04:13:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1xOtXO-000531-Qk
 for qemu-arm@nongnu.org; Thu, 05 Nov 2026 04:13:38 -0500
Received: from mail-pl1-f180.google.com ([209.85.214.180])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1xOtXM-0005Od-MM
 for qemu-arm@nongnu.org; Thu, 05 Nov 2026 04:13:38 -0500
Received: by mail-pl1-f180.google.com with SMTP id
 d9443c01a7336-2e8f2c3ad6bso9202715ad.1
 for <qemu-arm@nongnu.org>; Thu, 05 Nov 2026 01:13:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793870015; x=1794474815;
 h=cc:to:content-transfer-encoding:content-type:mime-version
 :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=hiayx6BWGpzODx59jEqteBwXl6UPmbPV8uXYm3q5qzM=;
 b=isCN2+WfH27O8F3Xr8Bi3Qx9tRvUSmXWxDQ3NM+TwnmvOdjg5Sz9gRKwPp3PPWTItP
 cguDKwH7Ye8nymInUGzJmFYQvCtVhjGzTL3/2mUM4xJd9Vq0k2Avv158/X/pGH56Xjmg
 geYm+LtSj2cxS3gmPiN4+GXID5OaQ8UwBfMcu7F4/HIUoAFi9SuO8zYV42sGeUcq2rBi
 zJJkjc08QDA/MS5TVFTQfg1EFGVjvE3h1psi2EKJcqJbUMpSSUSKrHAVWoyBEYjgxIru
 F5yEkKrtDade5n2HGpgOSk1319GabspCHx/AHSqzxQK6L1jIqzec3pvoxb6AlZ6zS8Za
 iByw==
X-Forwarded-Encrypted: i=1;
 AKwUvByXZGiduIhUw6makJGZ6I6S3rDMD9LOMzYyBTKb6wdRnZKuX401TBIeqpnXQSjUWBRD5FAFUe+5NA==@nongnu.org
X-Gm-Message-State: APuU4Z/tBeNmSOnkfbX3c2z1C58EThmpbu7CldrRaWnzVAgSHGdhZuQG
 S9UCK4GDxV5V1sz3OPbW2YoYSuS7eUF9naULm1GMjGsUcNKAt4OIisz5
X-Gm-Gg: AYBFou21BvRdpoe/UYuJWoVQ69cBcvdbX3QLNyfrGUNJ+F9H6jnlHFTDG376+UHENkq
 ugm3qM2TR6u9taO/QN9B4p8dc8EOHDjWEb576oYWK/h9r6nbIAWGTH6WuXAtogzGZJG1052VTWZ
 4BfsL3asKMaga69yGkCZVdixkOpPaytS9mNyDUJmeNhFcBRyCih6Msqud8ABmzShNQaGBsC08yj
 aO+gVz/ACo4W2yjwBBb1ZGJINSIbeLv/pYOrPNh5r+oQqu0wxrcb9RF1zOAo86WzJOtvRjD1z0m
 y8fC2t7oafCd2WZpQJ/n9/kCChnhI0Ddf2nEFdcp2FRAM0Qvsytst57iVTFY5FoYB7HK3hscRDq
 7ywfFfOv6Ao7yf5ZFSUwmEfayBM0g5LrAWOKfJM6cppHNLtB4UnUPNqhS4bEMWqKrL9wUI0e87N
 /h8awa32jXgnwSUSDO3Qmo8A5/ekUo8xknroAHKZpez14T/6CE5I+ZnNgXMJQd4LEwVLx13Jr4R
 +ivoXGqMw0+voLSMgqK8dYS074w2eyIVmie4LDLs2cHeUWSExqoi679TekE6PlfsQAXuQ5f2yMc
 jccK6I3gXU3C/pyDLa+l8ihW4KpJWzAmaA5GQPOXUJU9AuoYTh0Y1y9tKUdWHD2t+5NfOnzstHZ
 Y0Ouy2w==
X-Received: by 2002:a17:903:4b27:b0:2ed:1e0f:c0a9 with SMTP id
 d9443c01a7336-2ed1e0fc2ecmr28312315ad.57.1793870015015; 
 Thu, 05 Nov 2026 01:13:35 -0800 (PST)
Received: from localhost (118-163-122-149.hinet-ip.hinet.net.
 [118.163.122.149]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2ed09082a5esm15727845ad.37.2026.11.05.01.13.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Nov 2026 01:13:34 -0800 (PST)
Subject: [PATCH 00/16] hw/sensor: add the INA230 and INA238 power monitors
Date: Thu, 05 Nov 2026 17:12:52 +0800
Message-Id: <20261105-sensor-ina23x-v1-0-5433ed104990@free.fr>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMTQ5AMBBA4avIrDUx9RNcRSyqBmNR0kEk4u6K5
 bd47wIhzyRQRxd4Olh4cQEYR2An40ZS3AeDTnSBmORKyMniFTuj01OVpqv6zFZoDUJoVk8Dn9+
 vaX/L3s1kt3cC9/0AXhkOz3EAAAA=
X-Change-ID: 20261105-sensor-ina23x-8ab9d4c91ca1
To: qemu-devel@nongnu.org
Cc: =?utf-8?q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, eblot@meta.com, 
 Paolo Bonzini <pbonzini@redhat.com>, 
 Peter Maydell <peter.maydell@linaro.org>, 
 =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>, 
 qemu-arm@nongnu.org, Fabiano Rosas <farosas@suse.de>, 
 Laurent Vivier <lvivier@redhat.com>, Emmanuel Blot <emmanuel.blot@free.fr>, 
 Glenn Miles <milesg@linux.ibm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793869975; l=2357;
 i=emmanuel.blot@free.fr; s=20260602; h=from:subject:message-id;
 bh=qMgn805R1R1GjlsOl0qJxUiJfh+5i+8NwnjZA/oS4eg=;
 b=5lXo46M8V5MHW0cE/2K4hLWkLSAnlsgr2UjLf44aa+EHb+W0mOfw1oSs3lu9cFLW5CZALCBoP
 RDVvX3xSHjgBYztduCXftYQxbo8VM9Oo5Q5qUj6CGelmsJKuVrY48RP
X-Developer-Key: i=emmanuel.blot@free.fr; a=ed25519;
 pk=0qFrZ21FAAN8OfVsSoVcCFTk/NMYOWzxJz4paSAVm0g=
Received-SPF: pass client-ip=209.85.214.180; envelope-from=eblot.ml@gmail.com;
 helo=mail-pl1-f180.google.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.001, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Reply-to:  Emmanuel Blot <emmanuel.blot@free.fr>
From:  Emmanuel Blot via <qemu-arm@nongnu.org>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Based on master, at:
  f29ccc287a

New models:

  INA230   TI 36V current-shunt and power monitor
  INA238   TI 85V current-shunt, power and temperature monitor

The INA devices derive current and power from the shunt voltage and
their calibration registers. ALERT output is supported. Measurements
come in through QOM properties; however, conversion delay is not
modelled.

New qtests for the INA230 and INA238.

Signed-off-by: Emmanuel Blot <emmanuel.blot@free.fr>
---
Emmanuel Blot (16):
      hw/sensor: ina230: add current/voltage/power monitor
      tests/qtest: ina230: add current/voltage/power monitor test
      tests/qtest: ina230: cover voltage injection and power derivation
      tests/qtest: ina230: cover the ALERT limit functions and CVRF
      tests/qtest: ina230: cover the injection-property limits
      tests/qtest: ina230: cover operating modes and triggered conversions
      tests/qtest: ina230: cover ALERT latch persistence
      tests/qtest: ina230: cover a cleared calibration per channel
      hw/sensor: ina238: add current/voltage/power monitor
      tests/qtest: ina238: add current/voltage/power monitor test
      tests/qtest: ina238: cover voltage/temperature injection and derivation
      tests/qtest: ina238: cover the ALERT path and conversion-ready flag
      tests/qtest: ina238: cover the injection-property limits
      tests/qtest: ina238: cover the operating modes
      tests/qtest: ina238: cover conversion-ready and alert-latch semantics
      tests/qtest: ina238: cover a cleared calibration per channel

 hw/arm/Kconfig             |   2 +
 hw/sensor/Kconfig          |   8 +
 hw/sensor/ina230.c         | 598 +++++++++++++++++++++++++++++++++
 hw/sensor/ina238.c         | 803 ++++++++++++++++++++++++++++++++++++++++++++
 hw/sensor/meson.build      |   2 +
 hw/sensor/trace-events     |  14 +
 include/hw/sensor/ina230.h |  14 +
 include/hw/sensor/ina238.h |  14 +
 tests/qtest/ina230-test.c  | 602 +++++++++++++++++++++++++++++++++
 tests/qtest/ina238-test.c  | 806 +++++++++++++++++++++++++++++++++++++++++++++
 tests/qtest/meson.build    |   2 +
 11 files changed, 2865 insertions(+)
---
base-commit: f29ccc287a6cfdd51d3a4fd17fbe9af3310a0ac5
change-id: 20261105-sensor-ina23x-8ab9d4c91ca1

Best regards,
--  
Emmanuel Blot <emmanuel.blot@free.fr>


