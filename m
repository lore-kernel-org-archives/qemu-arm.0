Received: by 10.28.71.27 with SMTP id u27csp2946339wma;
        Thu, 15 Feb 2018 10:01:19 -0800 (PST)
X-Google-Smtp-Source: AH8x225/u3+bvHaV9Zl4mfhSi87X85rVYcpbjt9UZWiY+MdYYGIrrTR7qCPG8Qya33oDFdoTBovS
X-Received: by 10.37.16.138 with SMTP id 132mr2658647ybq.55.1518717679563;
        Thu, 15 Feb 2018 10:01:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1518717679; cv=none;
        d=google.com; s=arc-20160816;
        b=pPK7eiFoOxfqg6J0hahNWNqNVV9my7qCKY58NzWEiXkisTDlv4DwNsyYQTmQ5U+2jo
         Y05RsEwHuYNUwNN2w4LxFVPZ0UOh4gjHoeDynfceO2vfra3O//YsZhmFR1b0J3w4CXGr
         CyLOX2vLze23Ta1CSvNaHiPl1Fne7QevJcupSEOMjwvQWoGGqpkFNK+5elbAN4FTl/Uw
         /76b1FI73UaEZch573VpNX8g75/t6ctfiCCqMmVWE/6Bfbj4ZfMj4mpJH/ACXgAyLUp+
         TqoGcGAXRb38d93Xu6ITb6cTuJrwkq7UiqvqN9q0utYVWJ2/pDoxkwyAFYYdtyY+kyG3
         v3Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :arc-authentication-results;
        bh=FsElHulj+4dSPuaJppAEDMUsbA3HN/sL9I/n823K0lM=;
        b=ch8JgmYuGDdTBSaAdnS8pIk2x7bP9AQpQd5aPDmgti0rTgSnfeVzJjZ7r7I8U1C2NX
         NLwQxbRka4Ikg7qgbbDOtNqFb9M3R8OB5EE5vpZvD1OZtJQd42ryoaqH9HC13fbd8Zcw
         xilnjFtBTBLl1l84u/vMH+JFeTcFf1sTfjuedawSU6hoLuOdIGIr7gOLYqYUJT1OVAgQ
         i1JQoqSw7kk0TEZh/z6Km9tA9SVGkn8+lWUb5ZRtkuTcZQKKjxDFK4nZYAxjPedF2pn9
         usUZWPXTQ4r3MoCIS+GOdkbZ/E0YY34DQh/JkSRqgKg+P8Y1fYkeytJ0+5OWd3pOTL7E
         39AQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w188si2785372ywe.231.2018.02.15.10.01.19
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 15 Feb 2018 10:01:19 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44287 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1emNqQ-0003oX-Na
	for alex.bennee@linaro.org; Thu, 15 Feb 2018 13:01:18 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55312)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1emNmV-00085k-9j
	for qemu-arm@nongnu.org; Thu, 15 Feb 2018 12:57:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1emNmU-0000c1-Bn
	for qemu-arm@nongnu.org; Thu, 15 Feb 2018 12:57:15 -0500
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:46422)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1emNmU-0000Xo-56; Thu, 15 Feb 2018 12:57:14 -0500
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1emNmO-00020L-6r; Thu, 15 Feb 2018 17:57:08 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Thu, 15 Feb 2018 17:57:03 +0000
Message-Id: <20180215175707.15491-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.16.1
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 0/3] Arm: honour CPU address space for image loads
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
X-TUID: MbRYb4xQlh7v

This patchset makes the Arm code for loading kernels, initrds,
etc etc honour the CPU's address space rather than loading
everything via the system address space. This makes a difference
when the image is being loaded to memory or via an alias memory
region which is implemented by an SoC container object (and
which therefore doesn't appear in the system address space).

I needed this in particular for M profile, but I'd written all
the boot.c changes before I remembered that M profile doesn't
use that code at all :-)

thanks
-- PMM

Peter Maydell (3):
  loader: Add new load_ramdisk_as()
  hw/arm/boot: Honour CPU's address space for image loads
  hw/arm/armv7m: Honour CPU's address space for image loads

 include/hw/loader.h |  12 +++++-
 hw/arm/armv7m.c     |  17 ++++++--
 hw/arm/boot.c       | 119 +++++++++++++++++++++++++++++++++-------------------
 hw/core/loader.c    |   8 +++-
 4 files changed, 108 insertions(+), 48 deletions(-)

-- 
2.16.1

