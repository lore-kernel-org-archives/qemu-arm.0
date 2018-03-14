Received: by 10.28.91.67 with SMTP id p64csp164876wmb;
        Wed, 14 Mar 2018 06:31:45 -0700 (PDT)
X-Google-Smtp-Source: AG47ELtQ/KTW8tPRa7JpvQKkmvE4sawfz0zAF1WLkSYrMlQiiUQYnnZdS6UEmcY38f7/fQrpI46a
X-Received: by 10.55.189.196 with SMTP id n187mr6704770qkf.141.1521034305174;
        Wed, 14 Mar 2018 06:31:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1521034305; cv=none;
        d=google.com; s=arc-20160816;
        b=h8JfCVbbIJOl2UGPwLUEC5RNDC0eK3rW+jnSpAQIj8qtdrHhvwBLdJOAwaDRX7ggFF
         kDfim0FdV7f2TTvMc5qCMUi6mtA7bmQ3Y2hm0QZXS9zn3Sn68AbUjlXRUVHdDgN+APqI
         DHro1qrjRWQcuET0FFqGeCR8b/eiAVNFhwLLC+ExpB5Eknp0XbYT8b4mCwkRaKCd9GaG
         uaCToEb+bnBZsDyi7TNDz7cmYfWduQJ0wFRdsKbqIIKr1GyIjgE4aYEFrt40HPQeDZyg
         0qgCGWkpv4HgGkXPMlNBiF8aKEJacT9HxJaPwKYLlsr5C++qgtZNAL9ASqd41thvCmha
         IyiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=4TEppCtiEZjzeHHUsvwNzuayvk3iRc+9G7xytNPNYe8=;
        b=YW4YGmT6YBG6WoNsZasJ9UTsiYyWCpHWg9cC7j0l42HbgTUEq37vccUAHuSlV+WMn6
         rvg8jb4rtRPhz+zSjrYgs/LT1w90LOjhUZnBOH8N9pm25CJMEkAjIiOmnqttZVWoO7Kh
         TXtcVz3dcbD110ijqoQgbg9XLV8Tj5xmBAr5OzjDX+nexq08ygab3fIz9WSkaSYSwe+m
         jy1jrp/j418YqZLhtgZ6RONkOx7tJUi44QOuUzvskxslkJm4Mk/9erb8Osqv24pP/bjb
         uCxKrrmg9PF3bUt5v8ouFiYOw4t+Y8IP0xtZYo5ochGWR7ijw0CPpd2uUUGOkaDvE6Dr
         9FHA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r3si2381119qkd.367.2018.03.14.06.31.45
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 14 Mar 2018 06:31:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:46350 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ew6VM-00054i-KJ
	for alex.bennee@linaro.org; Wed, 14 Mar 2018 09:31:44 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35102)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <abdallah.bouassida@lauterbach.com>)
	id 1ew6UD-0004Pv-6C
	for qemu-arm@nongnu.org; Wed, 14 Mar 2018 09:30:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <abdallah.bouassida@lauterbach.com>)
	id 1ew6U8-0001wN-7p
	for qemu-arm@nongnu.org; Wed, 14 Mar 2018 09:30:33 -0400
Received: from smtp1.lauterbach.com ([62.154.241.196]:55030)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <abdallah.bouassida@lauterbach.com>)
	id 1ew6U7-0001ln-LR
	for qemu-arm@nongnu.org; Wed, 14 Mar 2018 09:30:28 -0400
Received: (qmail 29361 invoked by uid 484); 14 Mar 2018 13:30:10 -0000
X-Qmail-Scanner-Diagnostics: from 41.224.44.126 by smtp1.lauterbach.com
	(envelope-from <abdallah.bouassida@lauterbach.com>,
	uid 484) with qmail-scanner-2.11 
	(mhr: 1.0. clamdscan: 0.99/21437. spamassassin: 3.4.0.  
	Clear:RC:1(41.224.44.126):. 
	Processed in 0.051562 secs); 14 Mar 2018 13:30:10 -0000
Received: from unknown (HELO localhost.localdomain)
	(Authenticated_SSL:abouassida@[41.224.44.126])
	(envelope-sender <abdallah.bouassida@lauterbach.com>)
	by smtp1.lauterbach.com (qmail-ldap-1.03) with ECDHE-RSA-AES256-SHA
	encrypted SMTP
	for <qemu-devel@nongnu.org>; 14 Mar 2018 13:30:10 -0000
From: Abdallah Bouassida <abdallah.bouassida@lauterbach.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Date: Wed, 14 Mar 2018 14:28:02 +0100
Message-Id: <1521034084-17344-2-git-send-email-abdallah.bouassida@lauterbach.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1521034084-17344-1-git-send-email-abdallah.bouassida@lauterbach.com>
References: <1521034084-17344-1-git-send-email-abdallah.bouassida@lauterbach.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 62.154.241.196
Subject: [Qemu-arm] [PATCH v5 1/3] target/arm: Add "ARM_CP_NO_GDB" as a new
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
X-TUID: XmNL7qxn4pdn

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
index 1e7e1f8..5a6ea24 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1815,10 +1815,11 @@ static inline uint64_t cpreg_to_kvm_id(uint32_t cpregid)
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
index 09893e3..db8c925 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -5664,7 +5664,7 @@ static void add_cpreg_to_hashtable(ARMCPU *cpu, const ARMCPRegInfo *r,
     if (((r->crm == CP_ANY) && crm != 0) ||
         ((r->opc1 == CP_ANY) && opc1 != 0) ||
         ((r->opc2 == CP_ANY) && opc2 != 0)) {
-        r2->type |= ARM_CP_ALIAS;
+        r2->type |= ARM_CP_ALIAS | ARM_CP_NO_GDB;
     }
 
     /* Check that raw accesses are either forbidden or handled. Note that
-- 
2.7.4

