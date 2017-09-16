Received: by 10.223.172.38 with SMTP id v35csp2017650wrc;
        Sat, 16 Sep 2017 09:48:03 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QChHYFu8XpMbEM0vCa1UMsvwKSSrHAYVBAQQ0IGgmRRnGkCn7NLiRq9nyaWcJkbwd5cxiWv
X-Received: by 10.200.44.14 with SMTP id d14mr31347428qta.175.1505580482999;
        Sat, 16 Sep 2017 09:48:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505580482; cv=none;
        d=google.com; s=arc-20160816;
        b=Lc4x2YnuOKVA96PuPW2RdQmbmg+/cquyJ5N6nBApkb+wFCzpLopDV7rlBZV4AINT5P
         RaiOi/O/cPYm2HPwe1WO3nVb5kb43HVeWtRGj4WnlIvfZSkHy+Q/Cb0mMSWravaic/p7
         0ergcYYL1F4v8aoFVqg0JWOKL3YyEX6BlKdoOYJ3b4qy28sFsDeMOjnLWNuCNbn4xS5M
         WPMD0xjJLXSHFycHhS9mzkYFy6pcTXPI4jplwUfCOx0+ch3jIB2AB0Wbjhe4QctqTLmy
         SN6x58siFMn5A58nzgfJ8gLlXl8+lzHzUvRGHqjqqYpyb8cuB1Qd+u2wR9PW1QvN1d/X
         6rhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :arc-authentication-results;
        bh=BvbVogzjlkA5Qj4USAZRmBzdraDFsiS7JLs0pqtjJAQ=;
        b=A8RVXHdQ66brXC9e/4woPnvuFpam2RqKlOZg7DYm7w5hXUtsrIlE88YBUD25EMlS3A
         R8jbNFWppw3GrdW+AZNwVleaQLNvJhGF139mxK3s2qLDGPLbESkO2Z+vDGj+jWTiZ/54
         0737qMjLlovu4ltauP/1HZe4mlfeT0fEjGvPT2MkUrWIwDoq96Aotefx9gi3/LhU3mow
         SJY0IC7OUUBENt2mDJG5Z35OgWXTMjmmZIWQcBzmuqifXs+2jPRQCsBSI1Qs0i5IqQGL
         lG1+uxtBbfj7j/3lDP8QKLiP0j2rHU83paGoSawLQHknLht5pFhiNnjMVqQ1Td+KonAH
         Qbxg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 72si3449393qtf.400.2017.09.16.09.48.02
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 16 Sep 2017 09:48:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57980 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dtGG8-0001En-RG
	for alex.bennee@linaro.org; Sat, 16 Sep 2017 12:48:00 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52498)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1dtGE9-0008C4-US
	for qemu-arm@nongnu.org; Sat, 16 Sep 2017 12:45:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1dtGE9-00077c-05
	for qemu-arm@nongnu.org; Sat, 16 Sep 2017 12:45:58 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:37412)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1dtGE8-00075o-PQ; Sat, 16 Sep 2017 12:45:56 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1dtGDy-00015K-SR; Sat, 16 Sep 2017 17:45:46 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Sat, 16 Sep 2017 17:46:12 +0100
Message-Id: <1505580378-9044-1-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 0/6] convert some omap/palm devices from using
 old_mmio
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
X-TUID: vExITtir1r7X

This patchset converts a handful of old devices from the old_mmio
fields in MemoryRegionOps. We don't have very many devices still
using old_mmio, so it would be nice to get rid of the remainder
and drop the field entirely at some point.

(You could argue that really we should mark some of these old
boards as obsolete and eventually delete them. I don't actually
have a test image for the palm stuff at all...)

thanks
-- PMM

Peter Maydell (6):
  hw/arm/palm.c: Don't use old_mmio for static_ops
  hw/gpio/omap_gpio.c: Don't use old_mmio
  hw/timer/omap_synctimer.c: Don't use old_mmio
  hw/timer/omap_gptimer: Don't use old_mmio
  hw/i2c/omap_i2c.c: Don't use old_mmio
  hw/arm/omap2.c: Don't use old_mmio

 hw/arm/omap2.c            | 49 +++++++++++++++++++++++++++++++++++------------
 hw/arm/palm.c             | 30 ++++++++++-------------------
 hw/gpio/omap_gpio.c       | 26 ++++++++++++-------------
 hw/i2c/omap_i2c.c         | 44 ++++++++++++++++++++++++++++++------------
 hw/timer/omap_gptimer.c   | 49 +++++++++++++++++++++++++++++++++++------------
 hw/timer/omap_synctimer.c | 35 +++++++++++++++++++--------------
 6 files changed, 149 insertions(+), 84 deletions(-)

-- 
2.7.4

