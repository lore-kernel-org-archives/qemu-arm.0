Received: by 10.25.208.137 with SMTP id h131csp189238lfg;
        Wed, 4 May 2016 07:17:58 -0700 (PDT)
X-Received: by 10.194.5.101 with SMTP id r5mr9198865wjr.47.1462371478338;
        Wed, 04 May 2016 07:17:58 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id db7si5100459wjc.243.2016.05.04.07.17.58
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 04 May 2016 07:17:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48201 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1axxcS-0000lw-Vq
	for alex.bennee@linaro.org; Wed, 04 May 2016 10:17:41 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54131)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1axxbY-0007Nd-HV
	for qemu-arm@nongnu.org; Wed, 04 May 2016 10:16:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1axxbM-00072S-Gg
	for qemu-arm@nongnu.org; Wed, 04 May 2016 10:16:39 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:56723)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1axxbM-0006uU-8f; Wed, 04 May 2016 10:16:32 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.84_2)
	(envelope-from <pm215@archaic.org.uk>)
	id 1axxaj-0007OC-Ax; Wed, 04 May 2016 15:15:53 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Wed,  4 May 2016 15:15:50 +0100
Message-Id: <1462371352-21498-1-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.9.1
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 0/2] hw/display/blizzard: remove
 blizzard_template.h
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
Cc: Eric Blake <eblake@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
	Pooja Dhannawat <dhannawatpooja1@gmail.com>, patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5vpuTKVFrfxT

Now that we can rely on the display surface being 32 bits,
the whole machinery of blizzard_template.h being included once
per supported depth is unnecessary.

This series expands out the DEPTH-dependent macros, and then
moves the remaining code into blizzard.c and removes the header file.

It applies on top of Pooja Dhannawat's patch
"blizzard: Remove support for DEPTH != 32" (which you can
also find in my target-arm.next branch:
https://git.linaro.org/people/peter.maydell/qemu-arm.git target-arm.next)

thanks
-- PMM

Peter Maydell (2):
  hw/display/blizzard: Expand out macros
  hw/display/blizzard: Remove blizzard_template.h

 hw/display/blizzard.c          |  79 ++++++++++++++++++++++++++-
 hw/display/blizzard_template.h | 118 -----------------------------------------
 2 files changed, 77 insertions(+), 120 deletions(-)
 delete mode 100644 hw/display/blizzard_template.h

-- 
1.9.1

