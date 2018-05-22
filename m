Received: by 2002:a1c:4d4:0:0:0:0:0 with SMTP id 203-v6csp1777934wme;
        Tue, 22 May 2018 10:37:33 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZoxVBMzZ9i/LB0JDJdjK0b8PfUN0EjfuWV/Nl7eahWQwjz+phXku+X38VE2ODSzOqhbz6fR
X-Received: by 2002:a0c:d646:: with SMTP id e6-v6mr22454421qvj.26.1527010653480;
        Tue, 22 May 2018 10:37:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527010653; cv=none;
        d=google.com; s=arc-20160816;
        b=r6fkvj69amG5VslKAqKREVpfWBtoDDgLj42dxlv803Bd+hseZzuosF2WuIZgkBGw4r
         O19iOoRtbcO+FbtZzVs5ifASyX02/SpiXlJninupuki+SdLWCA0TLl2osNluNiqnT8C8
         IYT5sL+/N+Lz4X2q6tu//Y7MvbwdUeDAFj7LL9Grr9EtRtij9/3ccBf7bQTQ8nLEVUDV
         63mXwu5bamM2y2R65lUagroaKgcb5MFt04c2ZYOr5hy5iqneHb30YPcsyFYEz2EtZVVM
         k6t60OTSCMWZnrgZakiZqMw0iOKT5WgfISpOC1CfR5JkVABPoONezwsPfDBppqIj7peo
         okmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from
         :arc-authentication-results;
        bh=8JK+XveI07mK4wmG1xaMkelgEA9gBRO0WD5PtcJefr0=;
        b=deog0uhg/ViiZfK2LI0ZX+jjBksmPxbn2RoupsC3GroTTNf/wOQqy9oGdF9QHy+k47
         aaxO+Eb0IZmys1Pl0BwPr57n0fQYj/xzMgqNWsQqm8C3XFgeTPvXBeo+ofbOufMpXyQb
         hSXJvMnUoMyEcVefyYbv4IUCMYtu1Z86EsXLY+KutmARyo7Z9XLXcS7D71PKmpXzDlOG
         u86sIRw7uOBAgDYD1BPXRU9cH6xF+OIdZlOabz8sVanjZ9mWShUf6Ag+Mm/iTIcxfoXY
         qB1jORkHzhf5VBBMlMa4rT17gDYQDVzxXxMHC07GHme1dVa05iFAlZCBxfIeKuAQcDy7
         kpVg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i63-v6si3181512qkd.58.2018.05.22.10.37.33
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 22 May 2018 10:37:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57060 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fLBE5-0005aY-0I
	for alex.bennee@linaro.org; Tue, 22 May 2018 13:37:33 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34968)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1fLBDv-0005a8-MF
	for qemu-arm@nongnu.org; Tue, 22 May 2018 13:37:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1fLBDu-0006c0-QP
	for qemu-arm@nongnu.org; Tue, 22 May 2018 13:37:23 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:42126)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1fLBDu-0006Zf-JK; Tue, 22 May 2018 13:37:22 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1fLBDm-00018u-Lx; Tue, 22 May 2018 18:37:14 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue, 22 May 2018 18:37:13 +0100
Message-Id: <20180522173713.26282-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.17.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH] Correct CPACR reset value for v7 cores
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
Cc: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: O83xEs1X3bJB

In commit f0aff255700 we made cpacr_write() enforce that some CPACR
bits are RAZ/WI and some are RAO/WI for ARMv7 cores. Unfortunately
we forgot to also update the register's reset value. The effect
was that (a) a guest that read CPACR on reset would not see ones in
the RAO bits, and (b) if you did a migration before the guest did
a write to the CPACR then the migration would fail because the
destination would enforce the RAO bits and then complain that they
didn't match the zero value from the source.

Implement reset for the CPACR using a custom reset function
that just calls cpacr_write(), to avoid having to duplicate
the logic for which bits are RAO.

This bug would affect migration for TCG CPUs which are ARMv7
with VFP but without one of Neon or VFPv3.

Reported-by: Cédric Le Goater <clg@kaod.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
This is sufficient that a save-and-reload while the romulus-bmc
machine is in the bootloader will work. On the other hand if
I do a save-and-reload after the kernel has started booting
then we get the classic "guest hang after reload", so some
state is still not being transferred somewhere (probably in
a device in the machine model?)
---
 target/arm/helper.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index c0f739972e..6023bf6046 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -863,6 +863,14 @@ static void cpacr_write(CPUARMState *env, const ARMCPRegInfo *ri,
     env->cp15.cpacr_el1 = value;
 }
 
+static void cpacr_reset(CPUARMState *env, const ARMCPRegInfo *ri)
+{
+    /* Call cpacr_write() so that we reset with the correct RAO bits set
+     * for our CPU features.
+     */
+    cpacr_write(env, ri, 0);
+}
+
 static CPAccessResult cpacr_access(CPUARMState *env, const ARMCPRegInfo *ri,
                                    bool isread)
 {
@@ -920,7 +928,7 @@ static const ARMCPRegInfo v6_cp_reginfo[] = {
     { .name = "CPACR", .state = ARM_CP_STATE_BOTH, .opc0 = 3,
       .crn = 1, .crm = 0, .opc1 = 0, .opc2 = 2, .accessfn = cpacr_access,
       .access = PL1_RW, .fieldoffset = offsetof(CPUARMState, cp15.cpacr_el1),
-      .resetvalue = 0, .writefn = cpacr_write },
+      .resetfn = cpacr_reset, .writefn = cpacr_write },
     REGINFO_SENTINEL
 };
 
-- 
2.17.0

