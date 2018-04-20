Received: by 10.28.4.212 with SMTP id 203csp730010wme;
        Fri, 20 Apr 2018 05:55:49 -0700 (PDT)
X-Google-Smtp-Source: AIpwx4/nE3ZF9QEzOXnRe2oeytHSerby8hDnoyyLjo7jl+qkJYuXhDNUwTZFInfrk20Fe+IpV19J
X-Received: by 2002:ac8:1c92:: with SMTP id f18-v6mr11237510qtl.186.1524228949524;
        Fri, 20 Apr 2018 05:55:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1524228949; cv=none;
        d=google.com; s=arc-20160816;
        b=rWrzQpP+tEW39JRtsYbvEuOW79PmpvgfkY4k9ezZzUQO+TNvah5Vn9aIs86VB/++zM
         DIyTAcplzn/FDHBgiuP0fHN5xF8iHmjyGg462G0CYOm0NBP3M9Es+nd9qMVYWQNjQyXs
         8+DLyv7l0vAYga4oZ79Itz60o3l8uGyYiGxwZ5OK5KyQsQHYvCgDfMHiFtivxXkRTFgQ
         fkXqFaJ3sQs8xv/mANrGuw8vTN/zSHd1fotN6aGlwm0wUp/2ruVssAgF4s23bk9GTM1+
         606GB+415kiu+XwePeZnmSpFOgkeKkqFpdlGo3CvKjb4mP+HIcfyT6FvpuNbsy95UGK/
         NTjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=0hzWiXfWmBaT9sDT9A5zS+9gnpxdlNquGUAZ6mbnyd8=;
        b=MP/LpqDwyoxdWKOOX28ZVxDecE/dhswo4JI+rFQ+Fk58vSAbTnb0RFiOFgW5KIyOes
         l1A2w3pbUmd7erqxTGPjpnBH0RtvLaL5wdL3jP6QMaSV8rh1UuWxAr+Qfkc4GJGIry60
         9HygPaL6pI0OxVA8/OPNEv4EiI9vS8VHDalVVVPwJFQYdGe5L6Q0XGaWfOB/biNwzjor
         WFiaTYF6QtdBDjHOfO+FPqKDoSodxeTJQFuLxpNqiYiqf2dx4Bj7Vexul+DabAdnnUo9
         yyBYvk/BqYDqOzq1vz/c6SdqIlfoPILfjr+oq2AwFTJ/yzovgWh6VSidm9UxoxD8CiUg
         0Bxg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q2si543251qki.252.2018.04.20.05.55.49
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 20 Apr 2018 05:55:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55012 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1f9VZt-0002II-19
	for alex.bennee@linaro.org; Fri, 20 Apr 2018 08:55:49 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48676)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1f9VZe-0002FV-Cx
	for qemu-arm@nongnu.org; Fri, 20 Apr 2018 08:55:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1f9VZd-0008TT-D9
	for qemu-arm@nongnu.org; Fri, 20 Apr 2018 08:55:34 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:40974)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1f9VZd-0008EW-3a; Fri, 20 Apr 2018 08:55:33 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1f9VSw-0004mn-1d; Fri, 20 Apr 2018 13:48:38 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Fri, 20 Apr 2018 13:48:34 +0100
Message-Id: <20180420124835.7268-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180420124835.7268-1-peter.maydell@linaro.org>
References: <20180420124835.7268-1-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 2/3] hw/arm/aspeed: don't make 'boot_rom' region
 'nomigrate'
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
Cc: Rob Herring <robh@kernel.org>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>, patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: of1KPJnto3+1

Currently we use memory_region_init_ram_nomigrate() to create
the "aspeed.boot_rom" memory region, and we don't manually
register it with vmstate_register_ram(). This currently
means that its contents are migrated but as a ram block
whose name is the empty string; in future it may mean they
are not migrated at all. Use memory_region_init_ram() instead.

Note that this is a cross-version migration compatibility break
for the "palmetto-bmc", "ast2500-evb" and "romulus-bmc" machines.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/aspeed.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index 7088c907bd..aecb3c1e75 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -225,7 +225,7 @@ static void aspeed_board_init(MachineState *machine,
          * SoC and 128MB for the AST2500 SoC, which is twice as big as
          * needed by the flash modules of the Aspeed machines.
          */
-        memory_region_init_rom_nomigrate(boot_rom, OBJECT(bmc), "aspeed.boot_rom",
+        memory_region_init_rom(boot_rom, OBJECT(bmc), "aspeed.boot_rom",
                                fl->size, &error_abort);
         memory_region_add_subregion(get_system_memory(), FIRMWARE_ADDR,
                                     boot_rom);
-- 
2.17.0

