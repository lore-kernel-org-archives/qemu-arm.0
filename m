Received: by 2002:a5d:4308:0:0:0:0:0 with SMTP id h8-v6csp1515613wrq;
        Thu, 12 Jul 2018 08:42:15 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpdZILrFUEneSOSvgZP4XQclJhQdlSExg+7yVkErninJhMtrsZsiZeqdpFbuezQHy2t7nyFH
X-Received: by 2002:a37:7e04:: with SMTP id z4-v6mr2163853qkc.66.1531410135154;
        Thu, 12 Jul 2018 08:42:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1531410135; cv=none;
        d=google.com; s=arc-20160816;
        b=U9BUnusPWpVKfh3CSQKPzZcD8LJxWJjsLTTNU3jge7HglL8qpfhdgUbZNU0WSIqN2D
         DG9wcnB21MGvnudTxMYBlAW1kveBpqfoU6Xu/w6xEojupLnT1aL9d0fsHUiM/uamrubs
         cIRf9yVoFX7lk7V1FXR/5kXQn/ameu12kag/OB7vU70iQL86xdW8jvDQOTlyEvTn/B21
         cfkhsXBOjtrFb/9MdKES/KBwjurBsksBGTDPQGyW9f3oPzqyB+mNuUiJd5c5uwVirqV/
         iItmhFfOv56/fvkhAgcyOGHRmCxuVo2LnLe4SF6XyxM+unWexHEbS0KZjtGuGT+Z3aZL
         NIWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :arc-authentication-results;
        bh=M3Rw5d0YNpwblC4KsKXX3QZKA0tP5FpNUTVJ3E7FBv8=;
        b=LCKSKHucaoDX4FRvD6s+7T4RgJtrDnsvqc8r+h2ljrMzcjt1NTUanKZVPYCPnqVuuq
         dw7D0Wa2MXVcJPS/RstkAxTtnA/6BWml9go4Cfg245dTeeftHLl16kldjSJSzyA73FBC
         WVE7EsnT+N5InuodRua7CzYBY34ZcAddx9ZsXYEwQZp0DWRhCzkjtk59QzdmEtBBulnQ
         oUcBZQMYaXKHG/4aCUPWK68HToHp7wDMHKN4Y80bZdReaYv4yJBSk+uVQiiG1MH2Bqqm
         ujrV3UFq6Z5/fG7TsjZwJDE1T33SQAEV4PsV6yEt1WBn6HBbUsACKeLvcn+gJCNcdxQ1
         UmgA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 48-v6si5828373qty.188.2018.07.12.08.42.15
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 12 Jul 2018 08:42:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60843 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fddjS-0004Zu-J0
	for alex.bennee@linaro.org; Thu, 12 Jul 2018 11:42:14 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41199)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1fddjG-0004Yv-Gh
	for qemu-arm@nongnu.org; Thu, 12 Jul 2018 11:42:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1fddjF-0008Mf-OC
	for qemu-arm@nongnu.org; Thu, 12 Jul 2018 11:42:02 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:43486)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1fddjF-0008GP-HP; Thu, 12 Jul 2018 11:42:01 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1fddj7-0003qE-FU; Thu, 12 Jul 2018 16:41:53 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Thu, 12 Jul 2018 16:41:50 +0100
Message-Id: <20180712154152.32183-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.17.1
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH for-3.0 0/2] a couple of GICv2 bug fixes
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
Cc: Jan Kiszka <jan.kiszka@web.de>, Luc Michel <luc.michel@greensocs.com>,
	patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: b7yra4fMroBZ

These patches fix bugs in our GICv2 implementation that we noticed
in the course of reviewing Luc's patchset to add virtualization
support to it.

Patch 1 is a missing bounds check, effectively. Luckily there
was a mask operation in place that means it's not actually
possible to do anything nasty as a result.

Patch 2 fixes GICD_ITARGETSR for non-11MPCore GICs, which is
necessary to run Jailhouse as a guest.

thanks
-- PMM

Peter Maydell (2):
  hw/intc/arm_gic: Check interrupt number in gic_deactivate_irq()
  hw/intc/arm_gic: Fix handling of GICD_ITARGETSR

 hw/intc/arm_gic.c | 22 +++++++++++++++++++---
 1 file changed, 19 insertions(+), 3 deletions(-)

-- 
2.17.1

