Received: by 10.28.91.67 with SMTP id p64csp595844wmb;
        Mon, 12 Mar 2018 03:32:19 -0700 (PDT)
X-Google-Smtp-Source: AG47ELuu4//0ngckDsXOAH4gi3itB7hyCRTdZEiFB5FtsXoVVtvPfT5J0dCffiu2ORQ5TwRuzGtZ
X-Received: by 10.129.34.193 with SMTP id i184mr4173415ywi.146.1520850739583;
        Mon, 12 Mar 2018 03:32:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1520850739; cv=none;
        d=google.com; s=arc-20160816;
        b=sR8d7CiENwgSD3aSVFzUVPrnA1F0X7ACeOoOx5ac1nMV0uc5HerhEvHcc39v0k78gg
         8wFMu74v7d/0Ck3Hh7LcOuXjWXJqmZPvoaKTjbCURKU+HdQ5nRNp9+/gSGIGqdFaxcug
         J0y5w3VN4TvGcC03F2acHUUEsROm6AKau2tSzzlIozXfY2ZpnJVLvEogbUGv7+e9pWPo
         TF7ySIavgTeFWhQlPd2B3c0O5EibEmlMRntPXITnqY4gp7uoEKFLUIafWpHoDgnsVrDr
         5oC/379QntYsg1mk0g9dfY/zM+oXSnSV/u0EzNhy7InNFkpPGsoNVrb2gOSmXHEAS6u7
         Xpdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=jalJyuQ0MckKl2h3NoDEfAaS0E+8788kk3xWNK5nDhY=;
        b=SvkjVJvzJPSn5UbhMEO17VF7LCPbJMBwahJwOPCp9szZOdeVUZclFLIMLwQ+n6B4X3
         3kOtGpEtIupXYAOWnuZqDwBYWmWE2NUjZNr+k1rBOb7nkO++nFiPEk/KBLIZbpyJjzQj
         HhW9yhJCXktvlaU/20KQFHqBLigFe6cKVHgt7/oXgUrhdrV86QE4ROxKW/hijhO7HJxO
         VpCPGCH9nhNAaqg3zF2DSGwaX3ibIzRo5cb8Q5nfecuLFHN3IdvLXULJJD+4c1/juhDT
         ISblvWM4qV2spw5pFdPFUy6jg9WIdCsviKqpr9aBTii9KLTs+UV3YCcZviHbb9Yqvdms
         Fv1g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h131si501371ywh.444.2018.03.12.03.32.19
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 12 Mar 2018 03:32:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:57593 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1evKkc-0004OS-Tx
	for alex.bennee@linaro.org; Mon, 12 Mar 2018 06:32:18 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38978)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <abdallah.bouassida@lauterbach.com>)
	id 1evKkI-0004Ml-Ay
	for qemu-arm@nongnu.org; Mon, 12 Mar 2018 06:31:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <abdallah.bouassida@lauterbach.com>)
	id 1evKkF-0003aP-5t
	for qemu-arm@nongnu.org; Mon, 12 Mar 2018 06:31:58 -0400
Received: from smtp1.lauterbach.com ([62.154.241.196]:44090)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <abdallah.bouassida@lauterbach.com>)
	id 1evKkE-00034d-Rd
	for qemu-arm@nongnu.org; Mon, 12 Mar 2018 06:31:55 -0400
Received: (qmail 13374 invoked by uid 484); 12 Mar 2018 10:31:37 -0000
X-Qmail-Scanner-Diagnostics: from 41.224.44.126 by smtp1.lauterbach.com
	(envelope-from <abdallah.bouassida@lauterbach.com>,
	uid 484) with qmail-scanner-2.11 
	(mhr: 1.0. clamdscan: 0.99/21437. spamassassin: 3.4.0.  
	Clear:RC:1(41.224.44.126):. 
	Processed in 0.051559 secs); 12 Mar 2018 10:31:37 -0000
Received: from unknown (HELO localhost.localdomain)
	(Authenticated_SSL:abouassida@[41.224.44.126])
	(envelope-sender <abdallah.bouassida@lauterbach.com>)
	by smtp1.lauterbach.com (qmail-ldap-1.03) with ECDHE-RSA-AES256-SHA
	encrypted SMTP
	for <qemu-devel@nongnu.org>; 12 Mar 2018 10:31:37 -0000
From: Abdallah Bouassida <abdallah.bouassida@lauterbach.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Date: Mon, 12 Mar 2018 11:31:27 +0100
Message-Id: <1520850690-23245-2-git-send-email-abdallah.bouassida@lauterbach.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1520850690-23245-1-git-send-email-abdallah.bouassida@lauterbach.com>
References: <1520850690-23245-1-git-send-email-abdallah.bouassida@lauterbach.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 62.154.241.196
Subject: [Qemu-arm] [PATCH v4 1/4] target/arm: Add "ARM_CP_NO_GDB" as a new
 bit field for ARMCPRegInfo type
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
Cc: khaled.jmal@lauterbach.com, qemu-arm@nongnu.org,
	Abdallah Bouassida <abdallah.bouassida@lauterbach.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: nsES/GLU4lA4

This is a preparation for the coming feature of creating dynamically an XML
description for the ARM sysregs.
A register has ARM_CP_NO_GDB enabled will not be shown in the dynamic XML.
This bit is enabled automatically when creating CP_ANY wildcard aliases.
This bit could be enabled manually for any register we want to remove from the
dynamic XML description.

Signed-off-by: Abdallah Bouassida <abdallah.bouassida@lauterbach.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.h    | 3 ++-
 target/arm/helper.c | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 2b97408..818a98a 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1796,10 +1796,11 @@ static inline uint64_t cpreg_to_kvm_id(uint32_t cpregid)
 #define ARM_LAST_SPECIAL         ARM_CP_DC_ZVA
 #define ARM_CP_FPU               0x1000
 #define ARM_CP_SVE               0x2000
+#define ARM_CP_NO_GDB            0x4000
 /* Used only as a terminator for ARMCPRegInfo lists */
 #define ARM_CP_SENTINEL          0xffff
 /* Mask of only the flag bits in a type field */
-#define ARM_CP_FLAG_MASK         0x30ff
+#define ARM_CP_FLAG_MASK         0x70ff
 
 /* Valid values for ARMCPRegInfo state field, indicating which of
  * the AArch32 and AArch64 execution states this register is visible in.
diff --git a/target/arm/helper.c b/target/arm/helper.c
index c82f63d..c5d62c8 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -5663,7 +5663,7 @@ static void add_cpreg_to_hashtable(ARMCPU *cpu, const ARMCPRegInfo *r,
     if (((r->crm == CP_ANY) && crm != 0) ||
         ((r->opc1 == CP_ANY) && opc1 != 0) ||
         ((r->opc2 == CP_ANY) && opc2 != 0)) {
-        r2->type |= ARM_CP_ALIAS;
+        r2->type |= ARM_CP_ALIAS | ARM_CP_NO_GDB;
     }
 
     /* Check that raw accesses are either forbidden or handled. Note that
-- 
2.7.4

