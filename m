Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp815638wrd;
        Mon, 20 Aug 2018 08:30:42 -0700 (PDT)
X-Google-Smtp-Source: AA+uWPx3b4O9wuw36LMRw53m+3CtVCO+fDGfXi1qBi2GiKz6yAOYBgz7ISYfT8suEnHVEhEtBEkJ
X-Received: by 2002:a0c:9692:: with SMTP id a18-v6mr42055990qvd.16.1534779042410;
        Mon, 20 Aug 2018 08:30:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1534779042; cv=none;
        d=google.com; s=arc-20160816;
        b=IuD/MZoD7qYH/6TpELxC4A+vUzRFgg5x2sI82yGz+XUmkMLtomcYVr0kgo1uaA71ce
         K9+W3KolG4iDsKK3jVbMrKONJ5btZGcjaSdypHUGsjLcOsb5KQAF2tfhpQH9cJNuW6H2
         HhYMM4T5Zs5eG/a3ohPMbvitioaSQZJjyaZwgGSw6ksQo0xHpj3mA6TALHwoDgX/+ipH
         Xl6TrrWeDPWTeRs5NZPBMsMC5Rfmj9N+jp+CJf+I/NLNtWfsw7JVVNOHpek7lMCOEFKw
         FZJLm5c3RHjlkmkSPPAjmk6Hb7N6IVIpWFqHoV//7AlSeZvXiyuVkuvGc08BX0UDBbU4
         pWXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :arc-authentication-results;
        bh=VTUkeocQXTm7av/+2qmuEAFOwpyQ3oU3Na4IaWUMdi8=;
        b=uP5qzeIoHQjNJ2GT10ZEhfi3hOwpeaO8v0OjkC4ok4ZBZKbLeYW0G1dzq4XeBxao2b
         Y4h2NLjzjb4g6wGcqfv4J2gOVxWGJSp3YQ2OdhHrbWOcYfFXj2+v3OQvyrXKR5HA0Iou
         vaSg2mKx3tXv6Ur3n2TJnwOsYsk9gSyvHjHZIja498NpCC1EN+mC1tZbpumr+U9NSRdL
         VEOQUO8TOIp8K8dQgx/rk3oSr+DcX5+ozcjgEktaeWwlD/XB4Ut790txU/oxEbVhWgJU
         vO+iJKmK/cDUyAvSVlb9odTRKaezGj+5ilhE3Fnqa4y1IDQvqhXgBCBgnPr12P8sQJoy
         QUww==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m77-v6si325917qkl.347.2018.08.20.08.30.42
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 20 Aug 2018 08:30:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47740 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1frm8f-0005Um-Qx
	for alex.bennee@linaro.org; Mon, 20 Aug 2018 11:30:41 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46118)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1frm8Q-0005Sh-36
	for qemu-arm@nongnu.org; Mon, 20 Aug 2018 11:30:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1frm8P-00042R-DB
	for qemu-arm@nongnu.org; Mon, 20 Aug 2018 11:30:26 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:44694)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1frm8P-00041d-5w; Mon, 20 Aug 2018 11:30:25 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1frm8M-0003Xd-Qp; Mon, 20 Aug 2018 16:30:22 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Mon, 20 Aug 2018 16:30:14 +0100
Message-Id: <20180820153020.21478-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.18.0
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH v2 0/6] target/arm: Some pieces of support for
 32-bit Hyp mode
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
Cc: "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
	Luc Michel <luc.michel@greensocs.com>, patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: sDwyXSjZMTsW

Now we have virtualization support in the GICv2 emulation,
I thought I'd have a look at how much we were still missing
for being able to enable EL2 support for AArch32.
This set of patches fixes some minor missing pieces:
 * AArch32 HACTLR2
 * AArch32 HCR, HCR2
 * support for taking exceptions to Hyp mode
 * boot AArch32 kernels in Hyp mode where available
and I threw in a trivial bugfix:
 * Clear CPSR.IL and CPSR.J on 32-bit exception entry
since it would otherwise have a conflict with the refactoring
of exception entry.

Changes v1->v2:
 * some patches are now upstream
 * v8-only registers no longer created for v7 CPUs
 * split the "factor out exception-entry code" into
   its own patch
 * new patch: clear CPSR.IL and CPSR.J
 * new patch: boot kernels in Hyp mode if possible

(I still have the same "guest EL0 segv" issue as for v1
if I actually enable the EL2 feature on Cortex-A15.)

thanks
-- PMM

Peter Maydell (6):
  target/arm: Implement RAZ/WI HACTLR2
  target/arm: Implement AArch32 HCR and HCR2
  target/arm: Factor out code for taking an AArch32 exception
  target/arm: Implement support for taking exceptions to Hyp mode
  target/arm: Clear CPSR.IL and CPSR.J on 32-bit exception entry
  hw/arm/boot: AArch32 kernels should be started in Hyp mode if
    available

 hw/arm/boot.c       |  11 +++
 target/arm/helper.c | 212 ++++++++++++++++++++++++++++++++++++++------
 2 files changed, 196 insertions(+), 27 deletions(-)

-- 
2.18.0

