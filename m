Received: by 10.28.91.67 with SMTP id p64csp474013wmb;
        Wed, 28 Feb 2018 03:04:11 -0800 (PST)
X-Google-Smtp-Source: AH8x227g1O5EoPts+6yfnHzJ08HuqQ00YZdrshU5QBgXlmhJzUdGb5amrjrFrGn45eEJZCbcte7X
X-Received: by 10.129.165.69 with SMTP id c66mr11584924ywh.17.1519815851174;
        Wed, 28 Feb 2018 03:04:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519815851; cv=none;
        d=google.com; s=arc-20160816;
        b=1GwFDUxjCQJf7ci/Sk9HN9Dn+Sjla7IVfnx9PZU6ECepx1UocwWVPf7v85p3WmZGrg
         Fo9hfcgdcptZ665/lW9JMvjokH+t1dm9BPvECX9qIjO1c9gy8XJHeYDs1tjM2+6DquSQ
         a/7Onnf+YGPdXd0esQASCx6JrY9BKMxKekFwpq3ktbD0//zzIOWWhPpuW1Nmaamh57fA
         sqzJlcPeBIfV1yAfH6p8SBdFC9XWX/t2IYRgcls3vrdFYWev7W1zFqF4Tc8xJb0HeiS9
         HWdxtbfJDSM4JK0tARL+ooE/XLfDkXSBmBxuqJlCIYs1Frc2qf3XcAfIp4JpPuxA3EkM
         BYqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=nP1nratX5e367qw9Ft0k0KI+UeZny6Jtlx9tt3RRA5c=;
        b=f0n3MH+2hCdLxN+IqQLHoN3s3g8ftrbShpX6T2iT91egegNsuJZns/gknutcrEw00R
         446CvfwwPFcAOwEc6sFIkhuSbE01b96hovMUR1eF6mDBuxBz0uPQiEveezHY+ZCg8PtP
         LmK6bIzirOgQ/v7uX4J5HKAV8Mgm5TrfSLjYPKdSaAK7cLTBym96fg/wz7RMA1TUveMs
         xqTKmv3H9GAEZv5hQNZdIretYGQb6RETgc4/bG/BIPuiYAy9gM5xCwWBDU6g+FBMlFZ8
         zlFjyDsfUmKmrH3dkPIA5bkjKO6mJTXypK5QhmK5ryTs480GErwssO9+jNr/F8cz5fA4
         rvdw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x184si227434ywe.454.2018.02.28.03.04.11
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 28 Feb 2018 03:04:11 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:43303 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eqzWs-0004dL-Fk
	for alex.bennee@linaro.org; Wed, 28 Feb 2018 06:04:10 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40213)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <abdallah.bouassida@lauterbach.com>)
	id 1eqzV8-0003dY-Lv
	for qemu-devel@nongnu.org; Wed, 28 Feb 2018 06:02:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <abdallah.bouassida@lauterbach.com>)
	id 1eqzV4-0007Nl-NS
	for qemu-devel@nongnu.org; Wed, 28 Feb 2018 06:02:22 -0500
Received: from smtp1.lauterbach.com ([62.154.241.196]:53912)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <abdallah.bouassida@lauterbach.com>)
	id 1eqzV4-0007GH-Cm
	for qemu-devel@nongnu.org; Wed, 28 Feb 2018 06:02:18 -0500
Received: (qmail 1098 invoked by uid 484); 28 Feb 2018 11:02:01 -0000
X-Qmail-Scanner-Diagnostics: from 41.224.44.126 by smtp1.lauterbach.com
	(envelope-from <abdallah.bouassida@lauterbach.com>,
	uid 484) with qmail-scanner-2.11 
	(mhr: 1.0. clamdscan: 0.99/21437. spamassassin: 3.4.0.  
	Clear:RC:1(41.224.44.126):. 
	Processed in 0.052075 secs); 28 Feb 2018 11:02:01 -0000
Received: from unknown (HELO localhost.localdomain)
	(Authenticated_SSL:abouassida@[41.224.44.126])
	(envelope-sender <abdallah.bouassida@lauterbach.com>)
	by smtp1.lauterbach.com (qmail-ldap-1.03) with ECDHE-RSA-AES256-SHA
	encrypted SMTP
	for <qemu-devel@nongnu.org>; 28 Feb 2018 11:02:00 -0000
From: Abdallah Bouassida <abdallah.bouassida@lauterbach.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Date: Wed, 28 Feb 2018 12:01:25 +0100
Message-Id: <1519815685-29200-5-git-send-email-abdallah.bouassida@lauterbach.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1519815685-29200-1-git-send-email-abdallah.bouassida@lauterbach.com>
References: <1519815685-29200-1-git-send-email-abdallah.bouassida@lauterbach.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 62.154.241.196
Subject: [Qemu-devel] [PATCH v3 4/4] target/arm: Add arm_gdb_set_sysreg()
 callback
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
X-TUID: 0Cl59bLDzuyQ

This is a callback to set the cp-regs registered by the dynamic XML.

Signed-off-by: Abdallah Bouassida <abdallah.bouassida@lauterbach.com>
---
>> Some of our customers need to connect to Qemu using our tool TRACE32® 
>> via GDB,
>> and for some use case they need to have write access to some particular 
>> cpregs.
>> So, it will be nice to have this capability!
>> Usually, a user won't modify these registers unless he knows what he is 
>> doing!

> I also still don't really like using write_raw_cp_reg() here --
> it will bypass some behaviour you want and in some cases will
> just break the emulation because invariants we assume will
> hold no longer hold. It would be a lot lot safer to not
> provide write access at all, only read access.

Adding to that our customers may need this write access, our tool TRACE32®
needs this also in some particular cases. For example: temporary disabling MMU
to do a physical memory access.

 target/arm/cpu.h     |  2 ++
 target/arm/gdbstub.c | 21 ++++++++++++++++++++-
 target/arm/helper.c  |  2 +-
 3 files changed, 23 insertions(+), 2 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 0e35f64..f4fea98 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -2120,6 +2120,8 @@ static inline bool cp_access_ok(int current_el,
 /* Raw read of a coprocessor register (as needed for migration, etc) */
 uint64_t read_raw_cp_reg(CPUARMState *env, const ARMCPRegInfo *ri);
 
+void write_raw_cp_reg(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t v);
+
 /**
  * write_list_to_cpustate
  * @cpu: ARMCPU
diff --git a/target/arm/gdbstub.c b/target/arm/gdbstub.c
index e08ad79..57bd418 100644
--- a/target/arm/gdbstub.c
+++ b/target/arm/gdbstub.c
@@ -183,12 +183,31 @@ static int arm_gdb_get_sysreg(CPUARMState *env, uint8_t *buf, int reg)
     return 0;
 }
 
+static int arm_gdb_set_sysreg(CPUARMState *env, uint8_t *buf, int reg)
+{
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
+    return 0;
+}
+
 void arm_register_gdb_regs_for_features(CPUState *cs)
 {
     int n;
 
     n = arm_gen_dynamic_xml(cs);
-    gdb_register_coprocessor(cs, arm_gdb_get_sysreg, NULL,
+    gdb_register_coprocessor(cs, arm_gdb_get_sysreg, arm_gdb_set_sysreg,
                              n, "system-registers.xml", 0);
 
 }
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 1594ec45..4a4afbf 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -200,7 +200,7 @@ uint64_t read_raw_cp_reg(CPUARMState *env, const ARMCPRegInfo *ri)
     }
 }
 
-static void write_raw_cp_reg(CPUARMState *env, const ARMCPRegInfo *ri,
+void write_raw_cp_reg(CPUARMState *env, const ARMCPRegInfo *ri,
                              uint64_t v)
 {
     /* Raw write of a coprocessor register (as needed for migration, etc).
-- 
2.7.4

