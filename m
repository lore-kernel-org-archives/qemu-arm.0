Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp704190wrw;
        Fri, 9 Nov 2018 05:48:09 -0800 (PST)
X-Google-Smtp-Source: AJdET5cKipCaexzdJaCsJglNR9Yuz7wTukLFxPb4xXFLtGtCz7/ZS5il7q3kCwsBn8hbtgTT1FVR
X-Received: by 2002:ac8:6949:: with SMTP id n9mr2066368qtr.308.1541771289659;
        Fri, 09 Nov 2018 05:48:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1541771289; cv=none;
        d=google.com; s=arc-20160816;
        b=wRgFXcSspcnwz7H9KiZDNpKPDokxE7OyR+e+upH10pcStId+zGN9B6yzaz/wS/KZ1y
         G8ScsH9J6ZntfxisbneBjsxYe47PMYkFGNRVxtNIRAzz5eYDmdU0gExLW3bqjlns8SBv
         G3y8IeBHyJF4MPU5anhuO4nCzDZKOyxpA0GiZ0kwiyLnlGitgFCBS2noAImxXWX2zxgU
         fSc+K0cOrIUHQbT4vmXOJvHW0yFv00hdJCuSH9usxaU0etx9/oiKIk8pCCAgONAgftiv
         MthaUmAFa7FNAYA5JbDK657kg4/oMi7qZI6fco/PITOxgLSqqqF6eTwxKmUnXEVnVfmE
         gURw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from;
        bh=iRP2duKp/W36udL721gPV0sBelTVzRafrOWXlaxczzY=;
        b=X4jmfijJ8RgcPyL37TAReetih/LOYUBHhRxRGLUKq0YnLVVJUED8oXN54WS/FnNjvF
         UzlblzuFKHOReweRPwq1BuCiGpWguVd1OZqq/s/38viZcDHwTQQfCFNurJCO6ZjCrhWV
         tYbC0f5S5+eCEK4jxyblbplTfqdC3WJAIAQ768Bk3ct8pBdCNkPHeoBDNh76/BW0uhR7
         4nVIgEgEJV5Gbesfdkd4l2g542bof8nBsNlDSEb+Oz/YJn8KtA27h2CangtTGjdosnOX
         XbLzkSH8MRXaUZ4HVBpJgVHhtFtOOgD9yC3xZOBFW+TQebZx6HY8FdcwNR2JNpdfq8pa
         uVVw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b20si6083983qte.363.2018.11.09.05.48.09
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 09 Nov 2018 05:48:09 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34197 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gL78r-0001NU-3I
	for alex.bennee@linaro.org; Fri, 09 Nov 2018 08:48:09 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37632)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1gL78b-00019m-7X
	for qemu-arm@nongnu.org; Fri, 09 Nov 2018 08:47:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1gL78Z-0007iv-Nm
	for qemu-arm@nongnu.org; Fri, 09 Nov 2018 08:47:52 -0500
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:52456)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1gL78Y-0007ON-FH; Fri, 09 Nov 2018 08:47:50 -0500
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1gL78I-0002kA-NU; Fri, 09 Nov 2018 13:47:34 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Fri,  9 Nov 2018 13:47:28 +0000
Message-Id: <20181109134731.11605-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH for-v3.1 0/3] Fix handling of HCR.VI and VF
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
Cc: Adam Lackorzynski <adam.lackorzynski@kernkonzept.com>, patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: b4qfIy6z3tLy

This patchset reverts commit 8a0fc3a29fc2315325400, which tried
to implement HCR.VI and VF, and then reimplements it correctly.

The implementation of HCR.VI and VF in that commit is not
correct -- they do not track the overall "is there a pending
VIRQ or VFIQ" status, but whether there is a pending interrupt
due to "this mechanism", ie the hypervisor having set the VI/VF
bits. The overall pending state for VIRQ and VFIQ is effectively
the logical OR of the inbound lines from the GIC with the
VI and VF bits. Commit 8a0fc3a29fc231 would result in pending
VIRQ/VFIQ possibly being lost when the hypervisor wrote to HCR.

Patch 1 reverts the broken implementation.
Patch 2 adds tracking of the state of the input lines from the
GIC (most of the complexity here is from having to handle
inbound migration from older QEMU versions).
Patch 3 implements HCR.{VI,VF} correctly.

I plan to put the revert into rc1 at least, because it
fixes a regression.

thanks
-- PMM

Peter Maydell (3):
  Revert "target/arm: Implement HCR.VI and VF"
  target/arm: Track the state of our irq lines from the GIC explicitly
  target/arm: Correctly implement handling of HCR_EL2.{VI,VF}

 target/arm/cpu.h       |  3 ++
 target/arm/internals.h | 18 ++++++++++++
 target/arm/cpu.c       | 64 +++++++++++++++++++++++++++++++++++++++++-
 target/arm/helper.c    | 57 +++++++++++--------------------------
 target/arm/machine.c   | 51 +++++++++++++++++++++++++++++++++
 5 files changed, 152 insertions(+), 41 deletions(-)

-- 
2.19.1

