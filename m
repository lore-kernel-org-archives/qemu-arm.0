Received: by 10.223.159.74 with SMTP id f10csp3219100wrg;
        Tue, 5 Dec 2017 11:47:20 -0800 (PST)
X-Google-Smtp-Source: AGs4zMZZC34wawFIA+0y+NxR7GDQoI2sUDVTj1PXmIbgSAEx/c9kSfKmm6lARk+QnQgZqNUqlmio
X-Received: by 10.37.180.69 with SMTP id c5mr13981030ybg.193.1512503240792;
        Tue, 05 Dec 2017 11:47:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1512503240; cv=none;
        d=google.com; s=arc-20160816;
        b=USmj5t3QlrRq4dmocYtqgf9imkesNSwQHvMw5UJ0KNFmUAAMyNsOKeCvEBB4LGCd/9
         TLlpS4xfAXa6GzXO1kf0VeG0fOT2HuqeyUnUfaDmvAQNw7hXZ6K0X/ZecKW2h7Cxn4Ko
         PRKw6d4lkHV9mEbBh8HSQqBrdJunYrlSYAp9vqaNAuyPTFp90m8OhJkQssJxUnWX6035
         XfDET2NLHoEN2d6JRQJKR8AfoF0f7bN3No9BQLkiJjiyOQidCyjd2M6aEhXz4wAFJxPj
         ajF36YnbSOrVQs8LZ/UNCDssNLPMkWOnkgsReDJ8E/Xvbzv4DUf4Kb3OfVKHBpUFRmyV
         iG7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=qB9RN9afNeI8kCNbWloE9IdDxroG41xi0OTHqDEVoV8=;
        b=a1Cr0vP5YfEYav2+qX4TUHcBA3hEN40uFpBWBBzNki+WAPM0+HPUxRw+bRby7gdWNP
         6slDIP9Na0wc1+n7hzQoJ+9wqwamyRA8wWSWLXJe7u/yaKZh9imidZlMdglSOleDc0KY
         RBb4K5QYJeC//a3XeRzY8RUWR28iFiuHBmfGa1cTwsH8QdxEsGjiMQv5/xmn02F7+nwJ
         oEzPTwUCJi+rMD/59FznqGzAyWXfXaoAbqjPk/g5HsmfZCsBIOgqID6x9LzSdAaF2EL6
         P5ajltTmU/Cv0dzpglh3chGUFEThrILJiz5nPpM4n1Ykp4h4F8HIrLVJ+4S0BV2OtHTV
         wIdg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l12si226564ywl.715.2017.12.05.11.47.20
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 05 Dec 2017 11:47:20 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51762 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eMJBY-0001G6-6g
	for alex.bennee@linaro.org; Tue, 05 Dec 2017 14:47:20 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56546)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1eMJB0-0000yu-4C
	for qemu-arm@nongnu.org; Tue, 05 Dec 2017 14:46:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1eMJAz-0002J2-78
	for qemu-arm@nongnu.org; Tue, 05 Dec 2017 14:46:46 -0500
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:38776)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1eMJAz-0002CW-0g; Tue, 05 Dec 2017 14:46:45 -0500
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1eMJAu-0005Ck-E7; Tue, 05 Dec 2017 19:46:40 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue,  5 Dec 2017 19:46:30 +0000
Message-Id: <1512503192-2239-11-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1512503192-2239-1-git-send-email-peter.maydell@linaro.org>
References: <1512503192-2239-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 10/12] target/arm: Ignore fsr from
 get_phys_addr() in do_ats_write()
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
	Stefano Stabellini <sstabellini@kernel.org>, patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: SD5szyXiqly8

In do_ats_write(), rather than using the FSR value from get_phys_addr(),
construct the PAR values using the information in the ARMMMUFaultInfo
struct. This allows us to create a PAR of the correct format regardless
of what the translation table format is.

For the moment we leave the condition for "when should this be a
64 bit PAR" as it was previously; this will need to be fixed to
properly support AArch32 Hyp mode.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index fad4923..17192f8 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -2160,7 +2160,7 @@ static uint64_t do_ats_write(CPUARMState *env, uint64_t value,
     hwaddr phys_addr;
     target_ulong page_size;
     int prot;
-    uint32_t fsr;
+    uint32_t fsr_unused;
     bool ret;
     uint64_t par64;
     MemTxAttrs attrs = {};
@@ -2168,12 +2168,12 @@ static uint64_t do_ats_write(CPUARMState *env, uint64_t value,
     ARMCacheAttrs cacheattrs = {};
 
     ret = get_phys_addr(env, value, access_type, mmu_idx, &phys_addr, &attrs,
-                        &prot, &page_size, &fsr, &fi, &cacheattrs);
+                        &prot, &page_size, &fsr_unused, &fi, &cacheattrs);
+    /* TODO: this is not the correct condition to use to decide whether
+     * to report a PAR in 64-bit or 32-bit format.
+     */
     if (arm_s1_regime_using_lpae_format(env, mmu_idx)) {
-        /* fsr is a DFSR/IFSR value for the long descriptor
-         * translation table format, but with WnR always clear.
-         * Convert it to a 64-bit PAR.
-         */
+        /* Create a 64-bit PAR */
         par64 = (1 << 11); /* LPAE bit always set */
         if (!ret) {
             par64 |= phys_addr & ~0xfffULL;
@@ -2183,6 +2183,8 @@ static uint64_t do_ats_write(CPUARMState *env, uint64_t value,
             par64 |= (uint64_t)cacheattrs.attrs << 56; /* ATTR */
             par64 |= cacheattrs.shareability << 7; /* SH */
         } else {
+            uint32_t fsr = arm_fi_to_lfsc(&fi);
+
             par64 |= 1; /* F */
             par64 |= (fsr & 0x3f) << 1; /* FS */
             /* Note that S2WLK and FSTAGE are always zero, because we don't
@@ -2207,6 +2209,8 @@ static uint64_t do_ats_write(CPUARMState *env, uint64_t value,
                 par64 |= (1 << 9); /* NS */
             }
         } else {
+            uint32_t fsr = arm_fi_to_sfsc(&fi);
+
             par64 = ((fsr & (1 << 10)) >> 5) | ((fsr & (1 << 12)) >> 6) |
                     ((fsr & 0xf) << 1) | 1;
         }
-- 
2.7.4

