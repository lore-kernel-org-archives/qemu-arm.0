Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp1948793wrd;
        Tue, 21 Aug 2018 07:00:44 -0700 (PDT)
X-Google-Smtp-Source: AA+uWPwh0VJumTvRSebVTydrFQ7oT2zezBCK9yxkJMyMqMvs6LN+Q9FxxpIVen1bX5jvA9GbyDa7
X-Received: by 2002:a37:5d84:: with SMTP id r126-v6mr45842348qkb.155.1534860044358;
        Tue, 21 Aug 2018 07:00:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1534860044; cv=none;
        d=google.com; s=arc-20160816;
        b=KJunXmB/mI0CNiZz6U/YxgShkBZugJpgPAensRv051ESWT281TS8TOzrbhXaOEXtOp
         syfaR7jXxwqD1AmFJ0is1tcrAo3d3y1u7UOsS/H+SpXbqn6il6lOZosgCg+r5Z9WjNXC
         0FOkQfdvpcSiOQxCiodNXqdd4Z3YEqzF1gow61kt1qDtiLfhw/WTZMg5nJsg483MLzuU
         Xn2tVjED14gg74vzc+l2oLkNXfLmhzFDBLu+V/vEgeYbMwbUtP9nVbRyvSBR9cHjtn/m
         PRfWKyNXRkWPScRSVx7j1kq2s9DtzoSRnKqM1QgtogCGR9i4Y/COpNeWVBwlYXCeD/Hb
         zd1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :arc-authentication-results;
        bh=+McuawqOn8ydeCFe1IdY2COARGnE/SwZjvgxx1OVsRE=;
        b=A3XoIG+jOCmR54SEzWop3RAyvJwpE7NQDIIQeGRxVMHGstE4ZyZhje2mPgelITwdt2
         +PxW5IYsN9HXUdL2sWn7lybKiU62z7MGWsTkpLfc3Wn10C8jgj+epgjxGEyrxOhH6pnc
         9MsU6Yf93GlNUt4fulFrkR5gxUAqsrzi6tN/2p3WN8Tw4MY8HhQvFbnwfyxfQPafOFUQ
         qIBmwh47R8GlQU2vpn1OpZ5KKaGWnvsOEiOHUFFoyBghCJOm84n4hegwVojBU9DLOc7Q
         vfrF0iv43o0YYSILhEFFxSOc3c//v7qBgjnKYEryVvdmZLgFrDUMxjMDO/GSwrbQnYhW
         Ldig==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c66-v6si2404207qkb.392.2018.08.21.07.00.44
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 21 Aug 2018 07:00:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53767 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fs7D9-0002VR-PC
	for alex.bennee@linaro.org; Tue, 21 Aug 2018 10:00:43 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60299)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1fs6ht-0005oq-PT
	for qemu-arm@nongnu.org; Tue, 21 Aug 2018 09:28:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1fs6hs-0003XT-Eg
	for qemu-arm@nongnu.org; Tue, 21 Aug 2018 09:28:25 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:44756)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1fs6hs-0003S5-5T; Tue, 21 Aug 2018 09:28:24 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1fs6hi-00048p-H7; Tue, 21 Aug 2018 14:28:14 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue, 21 Aug 2018 14:28:02 +0100
Message-Id: <20180821132811.17675-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.18.0
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 0/9] arm: Wire up GICv2 virt support on A15/A7
 boards
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
Cc: Luc Michel <luc.michel@greensocs.com>, patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: O49DHHcy3Y2q

This patchset wires up the GICv2 virtualization support
on all our Cortex-A15 and Cortex-A7 boards.

These boards fall into various categories:
 * virt: already done in master
 * highbank, imx6, imx7: the CPU is configured to always
   have EL3, so we unconditionally allow EL2 to be enabled too
   and just need to wire up the GIC VIRQ/VFIQ lines
 * raspi2: has a non-standard interrupt controller, not a GIC,
   so we enable EL2 but there's no wiring to be done
 * vexpress-a15: is configurable to have EL3 or not; we add
   extra configuration so the user can add EL2 or not, using
   a machine property "virtualization", paralleling the
   existing "secure" property.

In all cases, most of the handling of mapping extra register
ranges into the address space and wiring up the maintenance
irq is dealt with by the a15mpcore container object.

Adding EL2 support has the potential to confuse older guests,
because it will mean that we'll boot into Hyp mode by default
if we're booting the kernel non-secure. But the Linux kernel
booting specification has required that for a long time now.

I had to fix one issue with an oversized memory region in
the GIC; there's also a documentation-comment patch in there
which records some stuff I had to figure out in trying to
map the right memory regions in the right places.

None of this code actually does anything (except provide a
property that doesn't do anything on vexpress-a15) until we
actually set the ARM_FEATURE_EL2 bit for A15 and A7.

thanks
-- PMM


Peter Maydell (9):
  hw/intc/arm_gic: Document QEMU interface
  hw/intc/arm_gic: Make per-cpu GICH memory regions 0x200 bytes large
  hw/arm/vexpress: Connect VIRQ and VFIQ
  hw/arm/highbank: Connect VIRQ and VFIQ
  hw/arm/fsl-imx6ul: Connect VIRQ and VFIQ
  hw/arm/fsl-imx6ul: Connect VIRQ and VFIQ
  hw/cpu/a15mpcore: If CPU has EL2, enable it on the GIC and wire it up
  hw/arm/vexpress: Don't set info->secure_boot if CPU doesn't have EL3
  hw/arm/vexpress: Add "virtualization" property controlling presence of
    EL2

 include/hw/intc/arm_gic.h | 35 +++++++++++++++++++++
 hw/arm/fsl-imx6ul.c       |  4 +++
 hw/arm/fsl-imx7.c         |  4 +++
 hw/arm/highbank.c         |  6 ++++
 hw/arm/vexpress.c         | 64 ++++++++++++++++++++++++++++++++++++---
 hw/cpu/a15mpcore.c        | 31 +++++++++++++++++--
 hw/intc/arm_gic.c         |  2 +-
 7 files changed, 137 insertions(+), 9 deletions(-)

-- 
2.18.0

