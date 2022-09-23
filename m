Received: by 2002:a17:906:b088:0:0:0:0 with SMTP id x8csp180229ejy;
        Fri, 23 Sep 2022 01:48:15 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7PmGF/oktGgdjK6E8SVRsH86puGlqHhf+TqoQ+PVXamNMLUEbaj2+AUScuSDKMFw1daerK
X-Received: by 2002:a17:902:ec82:b0:178:1062:3031 with SMTP id x2-20020a170902ec8200b0017810623031mr7400767plg.89.1663922895079;
        Fri, 23 Sep 2022 01:48:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1663922895; cv=none;
        d=google.com; s=arc-20160816;
        b=EPjnfZs1jU4I10zQfZeKyHVpczbNs9+UUwDHRbDFuM8xJGSvwTBlqlaHlJaoBWqA6c
         wxFwU3QOHkGVuSl/lm7xUjCy/G1++R8kEp++ITkD5c7gXRdbQd0C7drJqr4XhvBJeXm9
         ryo50G4y5V19viLWt1QBtYTAadI2jZjcbxjdX9W4W9wp5L4G4bxpxnAPBCRoOBrh8R1Z
         BKgRBN5EWDDJ81IkKYciIgHko6t4D3iQiu/nvNePmyewVnxjKdTe2f9bQT5Yj5dRHfdH
         VF6Eipbpp6HCPaWhDKUaXCCntCbCtcp8Vgf9ttv1FA+3FzOIVR5GPs4KfwfVNJdBz05s
         FTmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from;
        bh=1jVUuQIK3TwKbgGCJwwRItkEZ7miZX1GCBgoAfw9wiw=;
        b=0l1qi6WvLdCeCdFuhLjczlEXyqSxDpBj3ug1XvoM7jzus3T7pdA8Ao8dxz2aY3Nhe6
         j8huoK7SRCLD6OXqDuejK12ZnsbsQSaGP5tVWwuZZWUrPFL66Cz3+YV+1Gz50yJOQ1xE
         aM0cSJdYr7YUgL3Dtzbo2iPmiGdTv7GeqYaFk9TstiWF/myOudOyLvEmCS2ocDczw+pg
         yBvGKzk6OFpRkZKHSPCKFKs03V/7IJoiDzlTmlxmVCiXv4VphFPjwR0T5shGigYX5f9v
         NQEqT02JwcDHegGi5j3V6panjkXtUbt+GPo6KD/z/40eKbusKXWkECabSPfBIgJsbT3/
         yKAA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of srs0=gbdq=z2=kaod.org=clg@ozlabs.org designates 2404:9400:2221:ea00::3 as permitted sender) smtp.mailfrom="SRS0=gbDQ=Z2=kaod.org=clg@ozlabs.org"
Return-Path: <SRS0=gbDQ=Z2=kaod.org=clg@ozlabs.org>
Received: from gandalf.ozlabs.org (mail.ozlabs.org. [2404:9400:2221:ea00::3])
        by mx.google.com with ESMTPS id b29-20020a63715d000000b00438d11be245si9109638pgn.429.2022.09.23.01.48.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Sep 2022 01:48:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of srs0=gbdq=z2=kaod.org=clg@ozlabs.org designates 2404:9400:2221:ea00::3 as permitted sender) client-ip=2404:9400:2221:ea00::3;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of srs0=gbdq=z2=kaod.org=clg@ozlabs.org designates 2404:9400:2221:ea00::3 as permitted sender) smtp.mailfrom="SRS0=gbDQ=Z2=kaod.org=clg@ozlabs.org"
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	by gandalf.ozlabs.org (Postfix) with ESMTP id 4MYm575q84z4xGQ;
	Fri, 23 Sep 2022 18:48:11 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4MYm543SyDz4x1L;
	Fri, 23 Sep 2022 18:48:08 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@aj.id.au>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH 0/6] aspeed: avocado test boosts
Date: Fri, 23 Sep 2022 10:47:57 +0200
Message-Id: <20220923084803.498337-1-clg@kaod.org>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 7NGWz9gUloV2

Hello,

Alex's patchset [1] showed that by avoiding the class cast checkers in
hot code paths, performance is greatly improved. See results below.

This is a partial resend of [1] plus an extra caching a reference on
the AspeedSMC class, which adds an extra 10% boost.

Thanks ,

C.

[1] http://patchwork.ozlabs.org/project/qemu-devel/list/?series=313458


On a ThinkPad T480 i7-8650U, 

Before :

$ build/tests/venv/bin/avocado --show=app run build/tests/avocado/machine_aspeed.py
    ...
   (1/7) AST1030Machine.test_ast1030_zephyros: PASS (0.21 s)
   (2/7) AST2x00Machine.test_arm_ast2400_palmetto_openbmc_v2_9_0: PASS (23.51 s)
   (3/7) AST2x00Machine.test_arm_ast2500_romulus_openbmc_v2_9_0: PASS (39.59 s)
   (4/7) AST2x00Machine.test_arm_ast2500_evb_buildroot: PASS (23.74 s)
   (5/7) AST2x00Machine.test_arm_ast2600_evb_buildroot: PASS (34.44 s)
   (6/7) AST2x00MachineSDK.test_arm_ast2500_evb_sdk: PASS (91.13 s)
   (7/7) AST2x00MachineSDK.test_arm_ast2600_evb_sdk: PASS (112.27 s)
  RESULTS    : PASS 7 | ERROR 0 | FAIL 0 | SKIP 0 | WARN 0 | INTERRUPT 0 | CANCEL 0
  JOB TIME   : 325.72 s

After :

  $ build/tests/venv/bin/avocado --show=app run build/tests/avocado/machine_aspeed.py
    ...
   (1/7) AST1030Machine.test_ast1030_zephyros: PASS (0.22 s)
   (2/7) AST2x00Machine.test_arm_ast2400_palmetto_openbmc_v2_9_0: PASS (12.44 s)
   (3/7) AST2x00Machine.test_arm_ast2500_romulus_openbmc_v2_9_0: PASS (13.98 s)
   (4/7) AST2x00Machine.test_arm_ast2500_evb_buildroot: PASS (11.74 s)
   (5/7) AST2x00Machine.test_arm_ast2600_evb_buildroot: PASS (15.90 s)
   (6/7) AST2x00MachineSDK.test_arm_ast2500_evb_sdk: PASS (66.75 s)
   (7/7) AST2x00MachineSDK.test_arm_ast2600_evb_sdk: PASS (82.34 s)
  RESULTS    : PASS 7 | ERROR 0 | FAIL 0 | SKIP 0 | WARN 0 | INTERRUPT 0 | CANCEL 0
  JOB TIME   : 204.33 s
  
  


Alex Bennée (4):
  cpu: cache CPUClass in CPUState for hot code paths
  hw/core/cpu-sysemu: used cached class in cpu_asidx_from_attrs
  cputlb: used cached CPUClass in our hot-paths
  ssi: cache SSIPeripheralClass to avoid GET_CLASS()

Cédric Le Goater (2):
  tests/avocado/machine_aspeed.py: Fix typos on buildroot
  aspeed/smc: Cache AspeedSMCClass

 include/hw/core/cpu.h           |  9 +++++++++
 include/hw/ssi/aspeed_smc.h     |  2 ++
 include/hw/ssi/ssi.h            |  3 +++
 accel/tcg/cputlb.c              | 15 ++++++---------
 cpu.c                           |  9 ++++-----
 hw/core/cpu-sysemu.c            |  5 ++---
 hw/ssi/aspeed_smc.c             |  9 ++++-----
 hw/ssi/ssi.c                    | 18 ++++++++----------
 tests/avocado/machine_aspeed.py | 16 ++++++++--------
 9 files changed, 46 insertions(+), 40 deletions(-)

-- 
2.37.3
