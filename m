Received: by 10.28.91.67 with SMTP id p64csp856684wmb;
        Tue, 13 Mar 2018 08:43:14 -0700 (PDT)
X-Google-Smtp-Source: AG47ELtEltSP7hUFvrckGyLD3jkhcH11DX4NFBoDw++T7bR8G9hrijh1K/w/S/IcDG8rVmCDcVeA
X-Received: by 10.129.137.2 with SMTP id z2mr878811ywf.91.1520955794439;
        Tue, 13 Mar 2018 08:43:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1520955794; cv=none;
        d=google.com; s=arc-20160816;
        b=n6Qer82VM5OJciWR8M7BKkMLakVIhl+kSgfJ80mn8H6XKwDsTQ6NUCKmo6RkeYF2/s
         dZCVsXU5oqk8iHqLhHLFVLxy02mouHxSsIll5aDtM3WRkar0YxiCQzebBkk2je3s3veD
         6Fb8Xrr6Y9Jc+thruoNDVttSeKmqd0Tcc7AfHxTFEdl5FlAv03I1OidYHRMqvxEl7Jv0
         tZsXG5wEHIueMxEE3Dk8acjU9BkSok0wdDiiLT0692j7n/wvIZSIga/8zgxyWdo0Of91
         VosqHGLakwSHEFUpQMtZxu6EAb+VzsXR0mbBsSwR6NJtPF5YzL/zJol2vgvrvxen0L3K
         K71w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=I+J7W86xjQa/W5GFXY1gXcMG+aKQSom9RaDZujfIguA=;
        b=stOKkU8QOG3i0cPgJNWcda5CEtXDgSayfU5JaMXlSMjbm+hRdAFgDA85y3Qjk++BuS
         EYiBhFpu5r0s7vX26Xyvpqr6GAGGC2+kgNI0bbugnMTyP99EtwOo8ZTJvkYTCnT1skfB
         bx9sAgeidbMX0BzMkBivOnEWIWFgsyOAn6sG+HVpbqGJbhcIxcfnpmXcKOtCspOKwUog
         y9WR7MBCCta2UOzlUXJha4kK44oAjRlwJwLgMZKzGogu6K+lv+KUzuUnnZixuTntvNXF
         qDKURnXlKDmhGZzktCngNkZyG1cEMqD1cnoex3x+8Ez1JSzESEczTsaIbS/Xb8bOTQ6Z
         X+3w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n4si421933qkb.276.2018.03.13.08.43.14
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 13 Mar 2018 08:43:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40603 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1evm53-0004IT-Rf
	for alex.bennee@linaro.org; Tue, 13 Mar 2018 11:43:13 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47247)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1evlxb-0005qm-Qe
	for qemu-devel@nongnu.org; Tue, 13 Mar 2018 11:35:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1evlxb-00067Z-61
	for qemu-devel@nongnu.org; Tue, 13 Mar 2018 11:35:31 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:47058)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1evlxQ-0005j0-B8; Tue, 13 Mar 2018 11:35:20 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1evlx8-0003ER-ER; Tue, 13 Mar 2018 15:35:02 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue, 13 Mar 2018 15:34:51 +0000
Message-Id: <20180313153458.26822-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.16.2
In-Reply-To: <20180313153458.26822-1-peter.maydell@linaro.org>
References: <20180313153458.26822-1-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-devel] [PATCH 2/9] hw/arm/boot: assert that secure_boot and
 secure_board_setup are false for AArch64
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Pekka Enberg <penberg@iki.fi>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>, patches@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: cEdzd5oxdo+0

Add some assertions that if we're about to boot an AArch64 kernel,
the board code has not mistakenly set either secure_boot or
secure_board_setup. It doesn't make sense to set secure_boot,
because all AArch64 kernels must be booted in non-secure mode.

It might in theory make sense to set secure_board_setup, but
we don't currently support that, because only the AArch32
bootloader[] code calls this hook; bootloader_aarch64[] does not.
Since we don't have a current need for this functionality, just
assert that we don't try to use it. If it's needed we'll add
it later.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/boot.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/hw/arm/boot.c b/hw/arm/boot.c
index 196c7fb242..e21a92f972 100644
--- a/hw/arm/boot.c
+++ b/hw/arm/boot.c
@@ -720,6 +720,13 @@ static void do_cpu_reset(void *opaque)
                     } else {
                         env->pstate = PSTATE_MODE_EL1h;
                     }
+                    /* AArch64 kernels never boot in secure mode */
+                    assert(!info->secure_boot);
+                    /* This hook is only supported for AArch32 currently:
+                     * bootloader_aarch64[] will not call the hook, and
+                     * the code above has already dropped us into EL2 or EL1.
+                     */
+                    assert(!info->secure_board_setup);
                 }
 
                 /* Set to non-secure if not a secure boot */
-- 
2.16.2

