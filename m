Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp6728663wru;
        Tue, 24 Jul 2018 05:00:09 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpfEFiOv2x3LhG3Nw0WIg5ttUHrawPX8KazdCEneWMopQMsi/crtzgDYNE6gonC9BaSKHWJb
X-Received: by 2002:a37:e103:: with SMTP id c3-v6mr14718223qkm.33.1532433609690;
        Tue, 24 Jul 2018 05:00:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1532433609; cv=none;
        d=google.com; s=arc-20160816;
        b=rxemMtNYqwLcwLtZytcIQGT2Brkm7l3NTXoOUSXDJYHqpOszeaJPHDSq57JJG5SXQP
         omgK3LifkceGWTH7ZgX+M15y3+gXM6bVkLMeUyQfX89QWVDKKt/e/QbV9cUNJCnM6Kxh
         bl4M3Zm3N3osUkNINqjXIy6sKWHj9PtIgt+42yjRzAgIigHAy9QeD3leHT/0AoGPNwrZ
         22YgMdQYUVaf3lPSWKY8VpUG0js+7jE0lEcq6CttZIPS5OemsfE0BZw+SIA/B2ebqEw5
         Z1abiE1Dau90GrOeRORAZSj/7KNFDbvkmqTzw3fPLWkcvn4vsrU884ZOrmW+ZWX9ojpe
         TdjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :arc-authentication-results;
        bh=1P/zauwyRldnEdVV8YnBfV20lNb+Bz4QIRJyc+ZeeqM=;
        b=PPami0fCqJzWaMDzCj5PgfuThRlH6al28vE0xqnXEGSmNnbs3zwbwJcMrpHwLvr764
         KG7mKMLMigL3wiRtAarN2Ysa4qbhJRU1ZzQsDS0088F90M9lN8x+FK3BJXbl+/MMzl4i
         IIzsUsxM34/PXAf2qSHkWpZnexrjzIiD8r16cInL5ZkOOWJJElIpRhV3500KY7eRd4Nf
         QaQ55iEVd3MZ+coHQgueDoD47tIZ9WhXsDwlotQKdvNLQ6i6AefteBaRsPrVaB0SQuoX
         bnH0zzeDluFQf+shE1nJrzdHlr+SnYkA1WUUIdrAv5hcjk+lM4QRfcVs8l0tgICoirF0
         86jA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r5-v6si1071972qkr.250.2018.07.24.05.00.09
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 24 Jul 2018 05:00:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39735 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fhvz7-00089f-3l
	for alex.bennee@linaro.org; Tue, 24 Jul 2018 08:00:09 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52043)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1fhvyt-00085b-CL
	for qemu-arm@nongnu.org; Tue, 24 Jul 2018 07:59:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1fhvys-00035T-Ir
	for qemu-arm@nongnu.org; Tue, 24 Jul 2018 07:59:55 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:43714)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1fhvys-00034o-Ag; Tue, 24 Jul 2018 07:59:54 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1fhvyp-0008Oj-SR; Tue, 24 Jul 2018 12:59:51 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue, 24 Jul 2018 12:59:45 +0100
Message-Id: <20180724115950.17316-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.17.1
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 0/5] target/arm: Implement HCR_EL2.TGE ("trap
 general exceptions")
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
X-TUID: 0SXn3bK63RF1

In the Arm architecture the HCR_EL2.TGE bit allows software to
configure the CPU so that all exceptions that would target EL1
are instead delivered to EL2. This patchset adds support for
this to QEMU.

The required behaviour is described in the ARMv8 Arm ARM documentation
of the HCR_EL2.TGE bit (in section D10.2.45 of DDI0487C.a):
 * all exceptions that would normally go to NS EL1 must go to NS EL2
 * SCTLR_EL1.M is treated as zero when NS
 * virtual interrupts are disabled
 * exception returns to NS EL1 are treated as illegal exception returns
   (and effectively the CPU cannot execute at NS EL1)
 * HCR_EL2.{FMO,IMO,AMO} are treated as one
 * MDCR_EL2.{TDRA,TDOSA,TDA,TDE} are treated as one

Parts of this we have already implemented:
 * the logic to route asynchronous exceptions (ie interrupts) in
   arm_phys_excp_target_el() already correctly handles the TGE==1 case
 * exception return code in HELPER(exception_return) for AArch64 and
   bad_mode_switch() for AArch32 already catch the exception returns
   which are illegal if TGE==1

This patchset provides the remaining parts, which turn out to
be fairly straightforward. (I was worried that this was going to
require complicated changes to all the sysreg access check code...)

(Needs a fresh git master to apply, since there's a textual
dependency on commit 042374c92e83.)

thanks
-- PMM

Peter Maydell (5):
  target/arm: Mask virtual interrupts if HCR_EL2.TGE is set
  target/arm: Honour HCR_EL2.TGE and MDCR_EL2.TDE in debug register
    access checks
  target/arm: Honour HCR_EL2.TGE when raising synchronous exceptions
  target/arm: Provide accessor functions for HCR_EL2.{IMO,FMO,AMO}
  target/arm: Treat SCTLR_EL1.M as if it were zero when HCR_EL2.TGE is
    set

 target/arm/cpu.h          | 62 ++++++++++++++++++++++++++++++++++++---
 hw/intc/arm_gicv3_cpuif.c | 19 ++++++------
 target/arm/helper.c       | 32 ++++++++++++++------
 target/arm/op_helper.c    | 14 +++++++++
 4 files changed, 105 insertions(+), 22 deletions(-)

-- 
2.17.1

