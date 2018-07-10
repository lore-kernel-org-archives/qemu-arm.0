Received: by 2002:a5d:4308:0:0:0:0:0 with SMTP id h8-v6csp3757078wrq;
        Tue, 10 Jul 2018 09:25:03 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpeYqORkK7YLzf4M/Q1vcxG/hYRFGfopxlvlOX2kDJSclRpc8wysH3iHjMU2sswMeH3V0VgO
X-Received: by 2002:a0c:b4a9:: with SMTP id c41-v6mr22217038qve.57.1531239903524;
        Tue, 10 Jul 2018 09:25:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1531239903; cv=none;
        d=google.com; s=arc-20160816;
        b=N9Mwl28pYEA814KBWyAd7+nKSv2zPsD0+mJ3Qx8gUiZc8b0msTElom4Y/KwSh+QpQV
         ZQYuvdjAtYv+poMxll/VsU8iw0c0HHvS4NkNT0Q80f9jyKD33gTESOmY+KQog8pfBo5h
         nAYtmwoqASlG6xHdoYZFnEajWJ2jK7LgzkdgaJ8iUqe90Z+oVE9iiahJYEQWOmIWM74a
         EMg95qxtXWcNC62QZo9xJEcXo/ldrMC1YK1Y+ld845gd3wFba/KFWOFMh4vzpNkG1LBj
         pZReUzKoSp2D7oR4cz4aYT3Jadd0sqF1n5ra7ImaXLrejSSaUs1rxBOp7OPJvJjYgzH6
         UKHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=zGkLZrJ8BPTcu6rFiPZfnOcgvSBC1Nbm9Vl6tyz7qOU=;
        b=g1WCRN6AjT+otQ/Bf0ceQVq60Z9MuVdjHVLbH7NeQwGhIMuIVnLYk8nRNeLOhMBCAE
         4zrY6CxsPoRw1PELVPFItCIJJjUMGUNUW7jp9CVUefymcXRIlqAaCywvM+iW9nTxADqn
         EBLBRHV5563t1378AM9Qgx1bfmVaO9zcFCVmIr5ma1H5xF+K5PEJ6QXVACPBtkiWhJwe
         L/CIbhI0Zs9LfbSjfxGYu4afByh0KMsCRgDzvA+jrGWLX1eOpKaGVE3AjcxUilzXbqwm
         W6cIl11cDU2ZeJ+xWFdGNAiw8pEtsD/6uibQgKkJ7FBT1q7oaXbL4fq+dC0bEbEa2IRl
         y3Mg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j12-v6si17125643qkm.240.2018.07.10.09.25.03
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 10 Jul 2018 09:25:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48799 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fcvRn-0005Lj-1B
	for alex.bennee@linaro.org; Tue, 10 Jul 2018 12:25:03 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57353)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1fcvRd-0005KB-HP
	for qemu-arm@nongnu.org; Tue, 10 Jul 2018 12:24:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1fcvRc-0006WF-NM
	for qemu-arm@nongnu.org; Tue, 10 Jul 2018 12:24:53 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:43454)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1fcvRc-0006Tu-Fv; Tue, 10 Jul 2018 12:24:52 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1fcv3r-0001qD-JX; Tue, 10 Jul 2018 17:00:19 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue, 10 Jul 2018 17:00:13 +0100
Message-Id: <20180710160013.26559-7-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180710160013.26559-1-peter.maydell@linaro.org>
References: <20180710160013.26559-1-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 6/6] target/arm: Allow execution from small
 regions
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
Cc: patches@linaro.org, KONRAD Frederic <frederic.konrad@adacore.com>,
	"Emilio G . Cota" <cota@braap.org>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: cza7RA242+d2

Now that we have full support for small regions, including execution,
we can remove the workarounds where we marked all small regions as
non-executable for the M-profile MPU and SAU.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c | 23 -----------------------
 1 file changed, 23 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index a2ac96084e7..ed96e6c02fb 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -9784,17 +9784,6 @@ static bool get_phys_addr_pmsav7(CPUARMState *env, uint32_t address,
 
     fi->type = ARMFault_Permission;
     fi->level = 1;
-    /*
-     * Core QEMU code can't handle execution from small pages yet, so
-     * don't try it. This way we'll get an MPU exception, rather than
-     * eventually causing QEMU to exit in get_page_addr_code().
-     */
-    if (*page_size < TARGET_PAGE_SIZE && (*prot & PAGE_EXEC)) {
-        qemu_log_mask(LOG_UNIMP,
-                      "MPU: No support for execution from regions "
-                      "smaller than 1K\n");
-        *prot &= ~PAGE_EXEC;
-    }
     return !(*prot & (1 << access_type));
 }
 
@@ -10014,18 +10003,6 @@ static bool pmsav8_mpu_lookup(CPUARMState *env, uint32_t address,
 
     fi->type = ARMFault_Permission;
     fi->level = 1;
-    /*
-     * Core QEMU code can't handle execution from small pages yet, so
-     * don't try it. This means any attempted execution will generate
-     * an MPU exception, rather than eventually causing QEMU to exit in
-     * get_page_addr_code().
-     */
-    if (*is_subpage && (*prot & PAGE_EXEC)) {
-        qemu_log_mask(LOG_UNIMP,
-                      "MPU: No support for execution from regions "
-                      "smaller than 1K\n");
-        *prot &= ~PAGE_EXEC;
-    }
     return !(*prot & (1 << access_type));
 }
 
-- 
2.17.1

