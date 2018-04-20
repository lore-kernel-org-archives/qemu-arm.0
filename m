Received: by 10.28.4.212 with SMTP id 203csp729965wme;
        Fri, 20 Apr 2018 05:55:47 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZqyMaMp7+vMcFGwOj8FagODKw52A5cYP7bJ35QflSLQpKhiIuTwP+nw90Pb732+Ory/anx5
X-Received: by 10.55.209.214 with SMTP id o83mr9872448qkl.203.1524228947426;
        Fri, 20 Apr 2018 05:55:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1524228947; cv=none;
        d=google.com; s=arc-20160816;
        b=FDwXPL99+oOxH0uKpySONcjGd35RkZCu+AH50jzwy90jdWXHf9LIQbkHA1IZhCpGGJ
         ZWGgBVX0XjcBMMPXiIWmNt6Y2Mxv592QBpYHlvX9bGi8hP3FiPl4bjWxRQtjECCqx7Ny
         ex89FFWfnFrq5XTclc8zww1OLmNwllA1EDHcoP3v5e+j+tHA5Vmo7Gv57/0yp0q54H1O
         NY6XeDa9iDnVEzWZU3+8M+0AW1i3j/XDTC9BUOlRYgwdaZMaN66Zwq4UxnfOcgwwEdzN
         BiUbfGZvdUCeXUc6Xrw+GZyodF0dkEQpL5yTAeN0ZZVqhbxg9HIav44MJ4UpDv4bxpiH
         YzcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :arc-authentication-results;
        bh=69YiykE1Mq2yTonEsarc4wRogzT/gQqDq1O65LzdrGA=;
        b=ul8ZkFve4Q2SmsCDxi47Cqs+S93JhD4DxiJwGc+ZVydGyjFc3rWb8JsukJwn45qedF
         xSiAAaG2B/voe8UOgC3hQlUzd9ZmyEC5qczw+QkJbpdZ7yMWnFC2ZalW73UHCtRGBikt
         sS14qi3ySo3puXVSAxw9+RzxQ4Zq4Bwmws8ECkyaWox09B144PY1peRuUE87Z8+Pulml
         PEH6e0UMJOJJSazaHfT06uLRYtdoeiNIqD1SNIyVK6DJgP8XTna/oFEmSkBts8GgAMXk
         A1hw5H4W8yYIm2QdgPYXMjAVDAqLbvSdL3GvAwDKUcRweddIoQMeoesn/hAmBtgV/c8+
         FRKw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l12-v6si7893555qtn.400.2018.04.20.05.55.47
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 20 Apr 2018 05:55:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55010 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1f9VZq-0002GO-UL
	for alex.bennee@linaro.org; Fri, 20 Apr 2018 08:55:46 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48621)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1f9VZd-0002F8-5J
	for qemu-arm@nongnu.org; Fri, 20 Apr 2018 08:55:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1f9VZb-0008Lv-EN
	for qemu-arm@nongnu.org; Fri, 20 Apr 2018 08:55:33 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:40974)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1f9VZb-0008EW-5G; Fri, 20 Apr 2018 08:55:31 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1f9VSu-0004mM-JM; Fri, 20 Apr 2018 13:48:36 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Fri, 20 Apr 2018 13:48:32 +0100
Message-Id: <20180420124835.7268-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.17.0
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 0/3] aspeed, highbank: fix RAM migration oddities
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
X-TUID: TkJACQOixtp1

In a couple of places in the highbank and aspeed boards,
we create RAM regions with memory_region_init_ram_nomigrate()
and then either:
 * don't call vmstate_register_ram()
 * from a device, register it with
   vmstate_register_ram_global()

The first case is a bug. Currently it means that the underlying
RAM block will have a name which is the empty string; it will
migrate, but if there is more than one such RAM block in the
system migration will fail. Future changes to the migration
code are likely to mean that the RAM block isn't migrated at all.

The second case is also a bug: since the name used for the RAM
block is global to all of QEMU, it means that you can't have
more than one instance of the device without QEMU abort()ing
because of the name clash.

Fix both of these by using memory_region_init_ram(), which
automatically registers the RAM block for migration with
a sensible name.

This patchset is a cross-version migration compatibility
break for the boards "palmetto-bmc", "ast2500-evb", "romulus-bmc",
"highbank" and "midway". We don't promise migration compat
for those boards, so this is OK.

NB: I haven't tested this code beyond "does make check pass",
because I don't have a test image for any of these boards.
Testing welcomed :-)

thanks
-- PMM

Peter Maydell (3):
  hw/arm/highbank: don't make sysram 'nomigrate'
  hw/arm/aspeed: don't make 'boot_rom' region 'nomigrate'
  hw/arm/aspeed_soc: don't use vmstate_register_ram_global for SRAM

 hw/arm/aspeed.c     | 2 +-
 hw/arm/aspeed_soc.c | 3 +--
 hw/arm/highbank.c   | 2 +-
 3 files changed, 3 insertions(+), 4 deletions(-)

-- 
2.17.0

