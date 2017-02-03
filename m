Received: by 10.25.77.65 with SMTP id a62csp723698lfb;
        Fri, 3 Feb 2017 09:49:07 -0800 (PST)
X-Received: by 10.55.76.204 with SMTP id z195mr14734003qka.128.1486144146987;
        Fri, 03 Feb 2017 09:49:06 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e39si19718182qtb.299.2017.02.03.09.49.06
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 03 Feb 2017 09:49:06 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36142 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cZhys-0006HV-Fb
	for alex.bennee@linaro.org; Fri, 03 Feb 2017 12:49:06 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42145)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1cZhyn-0006HD-Br
	for qemu-arm@nongnu.org; Fri, 03 Feb 2017 12:49:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1cZhym-0003iI-Lv
	for qemu-arm@nongnu.org; Fri, 03 Feb 2017 12:49:01 -0500
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:48384)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1cZhym-0003iE-Es; Fri, 03 Feb 2017 12:49:00 -0500
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.84_2)
	(envelope-from <pm215@archaic.org.uk>)
	id 1cZhyi-0002fK-Hh; Fri, 03 Feb 2017 17:48:56 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Fri,  3 Feb 2017 17:48:53 +0000
Message-Id: <1486144135-4894-1-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH v2 0/2] target/arm: Support EL1 AArch32 guest
 under AArch64 EL2
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
X-TUID: Fxhq0t+fOSQA

Add support for generating the ISS (Instruction Specific Syndrome)
for Data Abort exceptions taken from AArch32. These syndromes are
used by hypervisors for example to trap and emulate memory accesses.

This is a respin of patch 1/3 from the previous series.
Changes v1->v2:
 * other 2 patches are now in QEMU master
 * split out the "use pbit/wbit variables" change into its own patch
 * dropped a few stray blank line changes

Otherwise unchanged.

thanks
-- PMM


Peter Maydell (2):
  target/arm: Abstract out pbit/wbit tests in ARM ldr/str decode
  target/arm: A32, T32: Create Instruction Syndromes for Data Aborts

 target/arm/translate.c | 207 ++++++++++++++++++++++++++++++++++++-------------
 1 file changed, 155 insertions(+), 52 deletions(-)

-- 
2.7.4

