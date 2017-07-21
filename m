Received: by 10.25.44.15 with SMTP id s15csp506963lfs;
        Fri, 21 Jul 2017 03:55:20 -0700 (PDT)
X-Received: by 10.55.135.199 with SMTP id j190mr9531469qkd.72.1500634520285;
        Fri, 21 Jul 2017 03:55:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1500634520; cv=none;
        d=google.com; s=arc-20160816;
        b=zj5/CinKkvjpfFP8Peloa92rXI44E3kInIHJoB6eJeNGyFLAwrN6Jmy/UPXuJJPDLb
         KFRkB7nx1kxjdvbP1Bp10aXepGxXPIqbEjYjiJWkryuxEhgxrXYC1gL4CqIPBiAJWTaT
         hLDJSB2ZL+55ntqeFO+E+APzGh87FjjT3rLsIfPct3fI0FIu+Ttg949n0yzJxi6vzmaZ
         TUSuPpF8s3U0wZZVscqycF1Qxf2qvN0J7O1I8BSGeaRhJl8dI86OfgSgQe0zpSJqdUcx
         wIF2kkEyVD2w/8GStcurA+IChp9xvnoDvekQ1VA5b0h7PTSTEUDs6n/lOI4xBs7DaZSR
         tYFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :arc-authentication-results;
        bh=YJplEbi6mMYQ+erUOFBQDFfV+3eaANyMnn5co7WyjU4=;
        b=ok2RLw6dW5VE0VLTG/tBG7NwvRc3SB7zYn/dXog3JB9bYpn8oFSY2NIHPQBk877TTD
         Xr++d5qf8oj0XbP9LMRxXPKX0PT802Wf0fS3SEVKcp01UzBM1mMwqNL7OzU/UfUSRQHE
         OdejxEIFJeryOFkol0qiUf7AftPuTeKFSf6oFoIgVcnn7g0KBv9VGe3bvLhPolAXCbmC
         jZAxQNxRfQ2qD1xwGX1cwW4d6lh2T1Ipiy1BQ4rCRVD+kKjW3NXxrkxWVmwAvxP0QvJo
         5Aucd1s/8EzohVhoyDXqwg4LGb8iLIj0EjgQyThl6UqbgfQkBk+XiFHtx2gGMghih7/V
         LuhA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t7si3557788qkd.83.2017.07.21.03.55.19
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 21 Jul 2017 03:55:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42269 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dYVaX-00076M-Ru
	for alex.bennee@linaro.org; Fri, 21 Jul 2017 06:55:17 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36329)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1dYVaT-00075K-Pz
	for qemu-arm@nongnu.org; Fri, 21 Jul 2017 06:55:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1dYVaT-0007uH-5F
	for qemu-arm@nongnu.org; Fri, 21 Jul 2017 06:55:13 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:37687)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1dYVaS-0007tk-Uo; Fri, 21 Jul 2017 06:55:13 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.84_2)
	(envelope-from <pm215@archaic.org.uk>)
	id 1dYVaQ-0000Jb-EQ; Fri, 21 Jul 2017 11:55:10 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Fri, 21 Jul 2017 11:55:09 +0100
Message-Id: <1500634509-28011-1-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH for-2.10] mps2: Correctly set parent bus for SCC
 device
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: pWYXtmRihFAS

A cut-and-paste error meant that instead of setting the
qdev parent bus for the SCC device we were setting it
twice for the ARMv7M container device. Fix this bug.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/mps2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/mps2.c b/hw/arm/mps2.c
index f727b43..abb0ab6 100644
--- a/hw/arm/mps2.c
+++ b/hw/arm/mps2.c
@@ -303,7 +303,7 @@ static void mps2_common_init(MachineState *machine)
 
     object_initialize(&mms->scc, sizeof(mms->scc), TYPE_MPS2_SCC);
     sccdev = DEVICE(&mms->scc);
-    qdev_set_parent_bus(armv7m, sysbus_get_default());
+    qdev_set_parent_bus(sccdev, sysbus_get_default());
     qdev_prop_set_uint32(sccdev, "scc-cfg4", 0x2);
     qdev_prop_set_uint32(sccdev, "scc-aid", 0x02000008);
     qdev_prop_set_uint32(sccdev, "scc-id", mmc->scc_id);
-- 
2.7.4

