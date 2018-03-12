Received: by 10.28.91.67 with SMTP id p64csp598701wmb;
        Mon, 12 Mar 2018 03:35:46 -0700 (PDT)
X-Google-Smtp-Source: AG47ELs+tY5S0viCauzGDFiDLY0di860EP+dSwS7PGwoeZHHMMcWwZqnrMZ1x2qF3iKImqtQoIVD
X-Received: by 10.13.239.70 with SMTP id y67mr4252944ywe.506.1520850946770;
        Mon, 12 Mar 2018 03:35:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1520850946; cv=none;
        d=google.com; s=arc-20160816;
        b=XqmhKkCNzc1+PWAsTziU9HNSjx5TtftVI7e9efCBC0F14bb2GGmJQDDS5xkjIsXYrG
         RjxsOieLeYAT4aEqlgsl4qIA76qWKRGTd9HnAqCaKwg88KF5ZmA/MWq469ZI5a4zrKkK
         A7ulqwZbkycdZfsf/6/V5ETf0T7jl88FuY1Of1xdw9g8TS1nITTQQ94K2YbvBwWa6hDh
         DmL71rE2Bg5zVxM4GHO3gRq+nhnfv4BZYVK6sZgWK9hgS+rHN18DTVL7a9cL8M2fmHpL
         He7jX2DKpxaYvmQRQ7Sc8p7aJt185Rg8QzODTGXDRxPMF+dFt/3Vn61wFpgbhiVHos7P
         Izyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=NJDSU+CRlqGhycqDDrYXWdWGtmAcbg7ApBOQ0OAeWhA=;
        b=FqAUGkkSilOQw9QNM/ASpHDZ6qyHuqn/AfCYvNAXWYeDjQf7I184FH0L0oh8POUZcg
         5/Mhzwfz/aXUQj90JCWQWgaXkZxXbfrYwogJa2v5nd1WK/0JGcJdMWD8SlyX9f6u+YEH
         iRWCw9AiM2x6pTHuL4R0xrIRlKEnPnxWBhdi/jgJQZGqxXapfK/XAa9vYWtmSltK7lkw
         OsDWHWYt24UZl4rhz9hcrtV7+sm5vlvdsR3fltjHYUnFcRHL7PYzn3rms6ZiTHuweVrI
         7qxPh+xGZbIs0SHma/OqQKHeolExnyeD5SjEAlULnhaUNWJ0grTyV7tCzjCzyZs1xSQQ
         qFHQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 130si1182066yws.788.2018.03.12.03.35.46
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 12 Mar 2018 03:35:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:57617 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1evKny-0007Ti-7T
	for alex.bennee@linaro.org; Mon, 12 Mar 2018 06:35:46 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39033)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <abdallah.bouassida@lauterbach.com>)
	id 1evKkK-0004Nl-Dm
	for qemu-arm@nongnu.org; Mon, 12 Mar 2018 06:32:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <abdallah.bouassida@lauterbach.com>)
	id 1evKkI-0003fb-TW
	for qemu-arm@nongnu.org; Mon, 12 Mar 2018 06:32:00 -0400
Received: from smtp1.lauterbach.com ([62.154.241.196]:51018)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <abdallah.bouassida@lauterbach.com>)
	id 1evKkI-0003Bd-HB
	for qemu-arm@nongnu.org; Mon, 12 Mar 2018 06:31:58 -0400
Received: (qmail 13483 invoked by uid 484); 12 Mar 2018 10:31:41 -0000
X-Qmail-Scanner-Diagnostics: from 41.224.44.126 by smtp1.lauterbach.com
	(envelope-from <abdallah.bouassida@lauterbach.com>,
	uid 484) with qmail-scanner-2.11 
	(mhr: 1.0. clamdscan: 0.99/21437. spamassassin: 3.4.0.  
	Clear:RC:1(41.224.44.126):. 
	Processed in 0.131647 secs); 12 Mar 2018 10:31:41 -0000
Received: from unknown (HELO localhost.localdomain)
	(Authenticated_SSL:abouassida@[41.224.44.126])
	(envelope-sender <abdallah.bouassida@lauterbach.com>)
	by smtp1.lauterbach.com (qmail-ldap-1.03) with ECDHE-RSA-AES256-SHA
	encrypted SMTP
	for <qemu-devel@nongnu.org>; 12 Mar 2018 10:31:40 -0000
From: Abdallah Bouassida <abdallah.bouassida@lauterbach.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Date: Mon, 12 Mar 2018 11:31:30 +0100
Message-Id: <1520850690-23245-5-git-send-email-abdallah.bouassida@lauterbach.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1520850690-23245-1-git-send-email-abdallah.bouassida@lauterbach.com>
References: <1520850690-23245-1-git-send-email-abdallah.bouassida@lauterbach.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 62.154.241.196
Subject: [Qemu-arm] [PATCH v4 4/4] target/arm: Add arm_gdb_set_sysreg()
 callback
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
X-TUID: ZlmSSeZl4+V6

This is a callback to set the cp-regs registered by the dynamic XML.

Signed-off-by: Abdallah Bouassida <abdallah.bouassida@lauterbach.com>
---
>> Adding to that our customers may need this write access, our tool TRACE32®
>> needs this also in some particular cases. For example: temporary disabling MMU
>> to do a physical memory access.

> By clearing the SCTLR bit? That's a good example of a case that
> won't work reliably. If you clear the SCTLR.M bit via raw_write
> this will not perform the tlb_flush() that it needs to, which
> means that if anything does a memory access via the QEMU TLB
> it may get the wrong cached results. If you always clear the
> bit, do one gdb memory access then set the bit then it will
> probably not run into problems but you're walking on thin ice.

Does adding tlb_flush() before or after write_raw_cp_reg()
could solve the reliability issue for other particular cases?
Or is there any improvement that could be done for this write
callback in order to get more reliable results for other
particular cases?

 target/arm/helper.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 5929e0b..bb5a97c 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -239,6 +239,20 @@ static int arm_gdb_get_sysreg(CPUARMState *env, uint8_t *buf, int reg)
 
 static int arm_gdb_set_sysreg(CPUARMState *env, uint8_t *buf, int reg)
 {
+    ARMCPU *cpu = arm_env_get_cpu(env);
+    const ARMCPRegInfo *ri;
+    uint32_t key;
+    uint32_t tmp;
+
+    tmp = ldl_p(buf);
+    key = cpu->dyn_xml.cpregs_keys[reg];
+    ri = get_arm_cp_reginfo(arm_env_get_cpu(env)->cp_regs, key);
+    if (ri) {
+        if (!(ri->type & ARM_CP_CONST)) {
+            write_raw_cp_reg(env, ri, tmp);
+            return cpreg_field_is_64bit(ri) ? 8 : 4;
+        }
+    }
     return 0;
 }
 
-- 
2.7.4

