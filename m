Received: by 10.28.91.67 with SMTP id p64csp472906wmb;
        Wed, 28 Feb 2018 03:03:07 -0800 (PST)
X-Google-Smtp-Source: AG47ELvn0Q++MAJRJ6XCF5f8FsC2X9iq3PumSM8DsR9qQIdnjcP60s2KCTpJu7lNTGFaqghptiSZ
X-Received: by 2002:a25:8281:: with SMTP id r1-v6mr1636909ybk.125.1519815786959;
        Wed, 28 Feb 2018 03:03:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519815786; cv=none;
        d=google.com; s=arc-20160816;
        b=GwrjI9N0mjLVAVJuO1PQZdt4sQ85RV4JI7oWzRG5Wpmdwxrpncbf84RMbD4FytiWo/
         TAEnwJZZPdenrvaz0b85BS+JuVZIOlGArYLiut75uiDIfhNeoM9S5HzJfFnnFdS7S1vQ
         h5D/eNcgfbU9+yxeHscREPDHBIVzye26MLoi60kKO5ttsKGtjRuRU2HqQX0o7Bt0KNzj
         iqpzRvKEYGoUUDOF0tSZOTb5aad6xTOJp4H/hF5GUESpiDLTawESRKpY0v7JwM+A5WS8
         DhhLSkd0TZ9kPPkdG0ZLAchU2nb7WzArJXQSmQ+6zQmFwQJ9YsuRZtdzVc1pKlQlbdeN
         nXzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=MR3tgkzknjpYcnbpEXaGvzuG+Pmv/AeRIVTm58G7AI0=;
        b=0WcDul0NjGjWG/m2zQ1HqNuU0orwPZTSJMoJcN4a6MOlrvzeqr+eMaiHHh5+cx26AW
         0m/L1tPlU/LmjQ8aaOkRZcBdthMLzNMPr5sTaRVriXA4eI7sQN/xgcQnhjEMzeGCjLCM
         DcZkD/4CaXzjnwn/1Ab7GfcjFVLeHvROiWw0NhB/QZuPG2+K+Gyv6dK+hvMjhJGHD6Gq
         QJVEhJJLOZ7+HttfWHel/qsqVfCHrA18lbVFEGG3mtkkRDxIb3JZdaoF8YjHi/+zAos8
         QIGhKrAtoMSscAsIO+gvB7NcV3AbBgwDIzu0qsQX0osFgtD4Xp83u9EL4rZdUQDjV/tK
         BcIA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i66si235588ywe.138.2018.02.28.03.03.06
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 28 Feb 2018 03:03:06 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:43299 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eqzVq-0003o8-E4
	for alex.bennee@linaro.org; Wed, 28 Feb 2018 06:03:06 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40161)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <abdallah.bouassida@lauterbach.com>)
	id 1eqzV4-0003ac-4G
	for qemu-devel@nongnu.org; Wed, 28 Feb 2018 06:02:19 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <abdallah.bouassida@lauterbach.com>)
	id 1eqzUy-0007Kl-D5
	for qemu-devel@nongnu.org; Wed, 28 Feb 2018 06:02:18 -0500
Received: from smtp1.lauterbach.com ([62.154.241.196]:51694)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <abdallah.bouassida@lauterbach.com>)
	id 1eqzUy-0007Cp-1Y
	for qemu-devel@nongnu.org; Wed, 28 Feb 2018 06:02:12 -0500
Received: (qmail 994 invoked by uid 484); 28 Feb 2018 11:01:55 -0000
X-Qmail-Scanner-Diagnostics: from 41.224.44.126 by smtp1.lauterbach.com
	(envelope-from <abdallah.bouassida@lauterbach.com>,
	uid 484) with qmail-scanner-2.11 
	(mhr: 1.0. clamdscan: 0.99/21437. spamassassin: 3.4.0.  
	Clear:RC:1(41.224.44.126):. 
	Processed in 0.056838 secs); 28 Feb 2018 11:01:55 -0000
Received: from unknown (HELO localhost.localdomain)
	(Authenticated_SSL:abouassida@[41.224.44.126])
	(envelope-sender <abdallah.bouassida@lauterbach.com>)
	by smtp1.lauterbach.com (qmail-ldap-1.03) with ECDHE-RSA-AES256-SHA
	encrypted SMTP
	for <qemu-devel@nongnu.org>; 28 Feb 2018 11:01:54 -0000
From: Abdallah Bouassida <abdallah.bouassida@lauterbach.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Date: Wed, 28 Feb 2018 12:01:22 +0100
Message-Id: <1519815685-29200-2-git-send-email-abdallah.bouassida@lauterbach.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1519815685-29200-1-git-send-email-abdallah.bouassida@lauterbach.com>
References: <1519815685-29200-1-git-send-email-abdallah.bouassida@lauterbach.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 62.154.241.196
Subject: [Qemu-devel] [PATCH v3 1/4] target/arm: Add "ARM_CP_NO_GDB" as a
 new bit field for ARMCPRegInfo type
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
Cc: khaled.jmal@lauterbach.com, qemu-arm@nongnu.org,
	Abdallah Bouassida <abdallah.bouassida@lauterbach.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Cmh+8ZANpUdz

This is a preparation for the coming feature of creating dynamically an XML
description for the ARM sysregs.
A register has ARM_CP_NO_GDB enabled will not be shown in the dynamic XML.
This bit is enabled automatically when creating CP_ANY wildcard aliases.
This bit could be enabled manually for any register we want to remove from the
dynamic XML description.

Signed-off-by: Abdallah Bouassida <abdallah.bouassida@lauterbach.com>
---
 target/arm/cpu.h    | 3 ++-
 target/arm/helper.c | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 8c839fa..92cfe4c 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1776,10 +1776,11 @@ static inline uint64_t cpreg_to_kvm_id(uint32_t cpregid)
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
index c5bc69b..bdd212f 100644
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

