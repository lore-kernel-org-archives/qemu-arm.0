Received: by 10.25.159.19 with SMTP id i19csp1083918lfe;
        Fri, 5 Feb 2016 06:38:02 -0800 (PST)
X-Received: by 10.140.150.66 with SMTP id 63mr17435415qhw.91.1454683081863;
        Fri, 05 Feb 2016 06:38:01 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w198si16082664qkw.58.2016.02.05.06.38.01
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 05 Feb 2016 06:38:01 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:48680 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aRhWL-0002CA-AQ
	for alex.bennee@linaro.org; Fri, 05 Feb 2016 09:38:01 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40268)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1aRhWI-00027x-Fv
	for qemu-arm@nongnu.org; Fri, 05 Feb 2016 09:37:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1aRhWH-00066K-JC
	for qemu-arm@nongnu.org; Fri, 05 Feb 2016 09:37:58 -0500
Received: from mnementh.archaic.org.uk ([2001:8b0:1d0::1]:57194)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1aRhWF-00062e-Nr; Fri, 05 Feb 2016 09:37:55 -0500
Received: from pm215 by mnementh.archaic.org.uk with local (Exim 4.84)
	(envelope-from <pm215@archaic.org.uk>)
	id 1aRhW7-0004Ad-Mz; Fri, 05 Feb 2016 14:37:47 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Date: Fri,  5 Feb 2016 14:37:44 +0000
Message-Id: <1454683067-16001-1-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.1.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::1
Cc: qemu-arm@nongnu.org, patches@linaro.org
Subject: [Qemu-arm] [PATCH 0/3] target-arm: Fix IL in syndromes for FP and
	copro traps
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: vXDABliEPk8G

This series corrects a bug I noticed while reading the code.

In syndrome register values, the IL bit indicates the instruction
length, and is 1 for 4-byte instructions and 0 for 2-byte
instructions.  All A64 and A32 instructions are 4-byte, but Thumb
instructions may be either 2 or 4 bytes long.  Unfortunately we named
the parameter to the syn_* functions for constructing syndromes
"is_thumb", which falsely implies that it should be set for all Thumb
instructions, rather than only the 16-bit ones.

Fix the parameter names to a less confusing "is_16bit", and
correct the places where we should be passing in 'false' rather
than 's->thumb' for syndrome construction, which are the
coprocessor, VFP and Neon instruction traps (all these are always
32-bit for Thumb).

The calls to syn_aa32_svc() and syn_aa32_bkpt() correctly still
use s->thumb, because for SVC and BKPT the Thumb encoding is 16
bits but the ARM encoding is 32 bits.


Peter Maydell (3):
  target-arm: Correct misleading 'is_thumb' syn_* parameter names
  target-arm: Fix IL bit reported for Thumb coprocessor traps
  target-arm: Fix IL bit reported for Thumb VFP and Neon traps

 target-arm/internals.h | 28 ++++++++++++++--------------
 target-arm/translate.c | 14 +++++++-------
 2 files changed, 21 insertions(+), 21 deletions(-)

-- 
1.9.1

