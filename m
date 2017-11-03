Received: by 10.223.150.237 with SMTP id u100csp290751wrb;
        Fri, 3 Nov 2017 07:36:42 -0700 (PDT)
X-Google-Smtp-Source: ABhQp+TIIG/SQnsLH0wD5m2LWVr6Ms+f7lz2Gl5tdw7rpIFdubXb50hu2+zHN/5kUIZFkPxt2zQW
X-Received: by 10.37.108.135 with SMTP id h129mr4467104ybc.341.1509719802712;
        Fri, 03 Nov 2017 07:36:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1509719802; cv=none;
        d=google.com; s=arc-20160816;
        b=ssGfuWIM5KrZXTHuVCg1bF+NeslCuFbtt0Wor08iBGlMF3xfDCupoIj0PcXSzXd3BL
         d4NVjmZ7D6G/MTUmu+lFA/aopxSd92L4ZOlLwwttmHNc9qhfNoE6JfV6X8gtR1fQCuGv
         jeIDxq87uXMn7mNgPSyy6DqqbywikQuTwuFPSoGfh7Bz3BocWtM28M13tOROjB37P3P8
         cscPQKwiaKKh8iFNkFLT/2aY72YoC4h6yE8j2FviprQZNh0ERYyDvqtRsuXQm3jo4BR7
         adBrgESCgclA61JBhWMe0secrbbhSnDyQPzPGZrPLjPL9FjJaW5QiN7P9wLadEYGFQd3
         0oOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :arc-authentication-results;
        bh=p62trO8PQve/YQEyJFSCIk8m8oEyWjqUoGF+yVt3b6Q=;
        b=k6cJHO2S7c/l2U/3eh+Pbo7r8dKX5Akv1YLDgTrAHDOlwghae9FiEKyG6NsgqgkX+O
         wwvUGdwdJeEvL4KWcspvAqG+tS+xu8DwEJf7+vGv2VIOqSShAyBFXGtQszD44z9tOhX2
         st7ZEYzJkWwlv47BLCBanT52p3OnvAkufplfB7xy3yGILIJY3fT4JObUFCvg7LIwAiEY
         0O7f+uKaDCZwwELPgadVdZs9efB8j287m1afEnwbY0gXqSsg1pXnMnOyKTJSFlbDVbsF
         DQuavJyHdlwF8UFhBWqCF/ZQvL5bF4/hgviTzIwb4jAdXkQUZldMligIJCsr/i+712nT
         4z1w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v81si1319412ywb.570.2017.11.03.07.36.42
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 03 Nov 2017 07:36:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37003 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eAd5O-0005IU-5H
	for alex.bennee@linaro.org; Fri, 03 Nov 2017 10:36:42 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52110)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1eAd5G-0005IN-B6
	for qemu-arm@nongnu.org; Fri, 03 Nov 2017 10:36:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1eAd5E-0002SJ-W9
	for qemu-arm@nongnu.org; Fri, 03 Nov 2017 10:36:34 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:38142)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1eAd5E-0002G8-OV; Fri, 03 Nov 2017 10:36:32 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1eAd56-0004rj-FX; Fri, 03 Nov 2017 14:36:24 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Fri,  3 Nov 2017 14:36:54 +0000
Message-Id: <1509719814-6191-1-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH] arm: check regime, not current state,
 for ATS write PAR format
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
Cc: Julien Grall <julien.grall@linaro.org>,
	Stefano Stabellini <sstabellini@kernel.org>, patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: iwoMTo8z2+wt

In do_ats_write(), rather than using extended_addresses_enabled() to
decide whether the value we get back from get_phys_addr() is a 64-bit
format PAR or a 32-bit one, use arm_s1_regime_using_lpae_format().

This is not really the correct answer, because the PAR format
depends on the AT instruction being used, not just on the
translation regime. However getting this correct requires a
significant refactoring, so that get_phys_addr() returns raw
information about the fault which the caller can then assemble
into a suitable FSR/PAR/syndrome for its purposes, rather than
get_phys_addr() returning a pre-formatted FSR.

However this change at least improves the situation by making
the PAR work correctly for address translation operations done
at AArch64 EL2 on the EL2 translation regime. In particular,
this is necessary for Xen to be able to run in our emulation,
so this seems like a safer interim fix given that we are in freeze.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
I guess I should have a go at the "correct answer" I sketch
above, but no promises about when I'll get time for that :-(

 target/arm/helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 96113fe..37af750 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -2162,7 +2162,7 @@ static uint64_t do_ats_write(CPUARMState *env, uint64_t value,
 
     ret = get_phys_addr(env, value, access_type, mmu_idx,
                         &phys_addr, &attrs, &prot, &page_size, &fsr, &fi);
-    if (extended_addresses_enabled(env)) {
+    if (arm_s1_regime_using_lpae_format(env, mmu_idx)) {
         /* fsr is a DFSR/IFSR value for the long descriptor
          * translation table format, but with WnR always clear.
          * Convert it to a 64-bit PAR.
-- 
2.7.4

