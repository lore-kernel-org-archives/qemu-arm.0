Received: by 10.25.0.144 with SMTP id 138csp206142lfa;
        Fri, 28 Apr 2017 06:41:27 -0700 (PDT)
X-Received: by 10.200.55.145 with SMTP id d17mr10564907qtc.232.1493386887654;
        Fri, 28 Apr 2017 06:41:27 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 51si6347516qtt.147.2017.04.28.06.41.27
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 28 Apr 2017 06:41:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=antfield.fr
Received: from localhost ([::1]:37169 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1d469H-0001ar-3q
	for alex.bennee@linaro.org; Fri, 28 Apr 2017 09:41:27 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47949)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@git.antfield.fr>) id 1d45ST-0005O1-BU
	for qemu-arm@nongnu.org; Fri, 28 Apr 2017 08:57:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <luc.michel@git.antfield.fr>) id 1d45SO-0001CE-HB
	for qemu-arm@nongnu.org; Fri, 28 Apr 2017 08:57:13 -0400
Received: from bee.antfield.fr ([188.165.75.195]:54716)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <luc.michel@git.antfield.fr>)
	id 1d45SO-0001Bk-88; Fri, 28 Apr 2017 08:57:08 -0400
From: Luc MICHEL <luc.michel@git.antfield.fr>
To: qemu-devel@nongnu.org
Date: Fri, 28 Apr 2017 14:56:31 +0200
Message-Id: <20170428125632.5704-1-luc.michel@git.antfield.fr>
X-Mailer: git-send-email 2.12.2
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 188.165.75.195
X-Mailman-Approved-At: Fri, 28 Apr 2017 09:41:24 -0400
Subject: [Qemu-arm] [PATCH 0/1] target/arm: add data cache invalidation cp15
 instruction to cortex-r5
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
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org, Luc MICHEL <luc.michel@git.antfield.fr>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: cetEzyR48ruU

This patch adds the cp15, CRn=15, opc1=0, CRm=5, opc2=0 coprocessor instruction
to the cortex-r5. As stated in the TRM, this instruction invalidates all the
data cache. This trivial patch implements it as NOP as cache operations are not
implemented in QEMU.

The documentation is here:
http://infocenter.arm.com/help/index.jsp?topic=/com.arm.doc.ddi0460d/Bgbdbdjc.html

Tested using this minimal program:
 .global _start
 
 .section .text
 _start:
   mcr p15, 0, r1, c15, c5, 0
 
 idle:
   wfi
   b idle

Before implementation:
 IN: 
 0x00008000:  ee0f1f15      mcr 15, 0, r1, cr15, cr5, {0}

 Taking exception 1 [Undefined Instruction]
 ...from EL1 to EL1
 ...with ESR 0x0/0x2000000

After implementation:
 IN: 
 0x00008000:  ee0f1f15      mcr 15, 0, r1, cr15, cr5, {0}
 0x00008004:  e320f003      wfi

Luc MICHEL (1):
  target/arm: add data cache invalidation cp15 instruction to cortex-r5

 target/arm/cpu.c | 2 ++
 1 file changed, 2 insertions(+)

-- 
2.12.2

