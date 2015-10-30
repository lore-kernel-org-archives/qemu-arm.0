Received: by 10.182.105.169 with SMTP id gn9csp909412obb;
        Thu, 29 Oct 2015 22:36:19 -0700 (PDT)
X-Received: by 10.55.51.200 with SMTP id z191mr7477860qkz.21.1446183378393;
        Thu, 29 Oct 2015 22:36:18 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n82si4554249qkl.13.2015.10.29.22.36.18
        for <alex.bennee@linaro.org>
        (version=TLSv1 cipher=RC4-SHA bits=128/128);
        Thu, 29 Oct 2015 22:36:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:48480 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1Zs2ML-0006MB-Ui
	for alex.bennee@linaro.org; Fri, 30 Oct 2015 01:36:17 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53246)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1Zs2LR-0005Jr-DN
	for qemu-devel@nongnu.org; Fri, 30 Oct 2015 01:35:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1Zs2LN-0002Oj-Ad
	for qemu-devel@nongnu.org; Fri, 30 Oct 2015 01:35:21 -0400
Received: from mail-pa0-x233.google.com ([2607:f8b0:400e:c03::233]:33926)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>)
	id 1Zs2LN-0002Oe-4x; Fri, 30 Oct 2015 01:35:17 -0400
Received: by padhk11 with SMTP id hk11so63265781pad.1;
	Thu, 29 Oct 2015 22:35:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=NrM8WLH4PcOoQ7G7bVTNyDgY7SRUqZrA4FGVfn1GqBw=;
	b=N1muxyqmRMOySfxdCrUfcNskK+KmshHaquwiTSx+SMLYmDwC+Oovc4qA0fUyaofHlx
	F9trsNlT/BHR+oLxbiz/+CuMqaENbQEB3jeNs9ADunhcPOLd3Sf2zZSJPxx85P26WN7q
	rpgnNM3hvoaatMARG4Pw3qIPmiW4M7prVIVpVooJlYI9GwsPLo3iv733to4fDXNGZG4l
	cHeYLZwSGpaTO1gIW0IUA8zLj+0p/FvX8TAfRGPm6BftA5kmZ0e7iZ/etuFRebPkJGLu
	nCftAasOvwY/j+DSATwn/lUFK2Jruj25CtdULb/DF8qYnFJ5lso707liTG9XYk5EzQ2c
	qwRg==
X-Received: by 10.66.150.231 with SMTP id ul7mr6538103pab.42.1446183316248;
	Thu, 29 Oct 2015 22:35:16 -0700 (PDT)
Received: from pcrost-box.hsd1.ca.comcast.net
	(c-24-130-130-137.hsd1.ca.comcast.net. [24.130.130.137])
	by smtp.gmail.com with ESMTPSA id
	yi8sm5604313pab.22.2015.10.29.22.35.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 29 Oct 2015 22:35:14 -0700 (PDT)
From: Peter Crosthwaite <crosthwaitepeter@gmail.com>
X-Google-Original-From: Peter Crosthwaite <crosthwaite.peter@gmail.com>
To: qemu-devel@nongnu.org
Date: Thu, 29 Oct 2015 22:34:55 -0700
Message-Id: <cover.1446182614.git.crosthwaite.peter@gmail.com>
X-Mailer: git-send-email 1.9.1
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400e:c03::233
Cc: peter.maydell@linaro.org, Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	qemu-arm@nongnu.org, linux@roeck-us.net, robh@kernel.org
Subject: [Qemu-devel] [PATCH v2 0/5]  ARM: Machine specific boot blobs
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: WVqJJvfp6yiw

Hi,

This adds support for machine-specific primary boot blobs. This can be
used to install little bits of firmware or boot code without having
to throw the whole QEMU bootloader out and BYO (with device drivers
and all).

It is then used to fix two boards, Zynq and Highbank, both which have
small but critical expectations of pre-boot software setup.

Regards,
Peter

Changed since v1:
Addressed PMM review.
Added secure_board_setup flag (P4)
Added Zynq patch first, then Highbank
See indiv. patches for detailed change logs.


Peter Crosthwaite (5):
  arm: boot: Adjust indentation of FIXUP comments
  arm: boot: Add board specific setup code API
  arm: xilinx_zynq: Add linux pre-boot
  arm: boot: Add secure_board_setup flag
  arm: highbank: Implement PSCI and dummy monitor

 hw/arm/boot.c        | 39 +++++++++++++++++++++++--------
 hw/arm/highbank.c    | 66 ++++++++++++++++++++++++++++++++++++++++++++--------
 hw/arm/xilinx_zynq.c | 42 +++++++++++++++++++++++++++++++++
 include/hw/arm/arm.h | 16 +++++++++++++
 4 files changed, 143 insertions(+), 20 deletions(-)

-- 
1.9.1

