Received: by 10.182.158.201 with SMTP id ww9csp142833obb;
        Thu, 3 Dec 2015 10:51:22 -0800 (PST)
X-Received: by 10.140.44.9 with SMTP id f9mr12972693qga.69.1449168682102;
        Thu, 03 Dec 2015 10:51:22 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n66si9884404qge.4.2015.12.03.10.51.21
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 03 Dec 2015 10:51:22 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@microsoft.com;
       dmarc=fail (p=NONE dis=NONE) header.from=microsoft.com
Received: from localhost ([::1]:36928 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1a4YyP-00024a-PQ
	for alex.bennee@linaro.org; Thu, 03 Dec 2015 13:51:21 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47716)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1a4YyN-0001xh-1M
	for qemu-arm@nongnu.org; Thu, 03 Dec 2015 13:51:20 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1a4YyL-0007oD-FM
	for qemu-arm@nongnu.org; Thu, 03 Dec 2015 13:51:18 -0500
Received: from mail-bl2on0129.outbound.protection.outlook.com
	([65.55.169.129]:18176
	helo=na01-bl2-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>)
	id 1a4YyG-0007Ym-DR; Thu, 03 Dec 2015 13:51:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
	s=selector1; h=From:To:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=XdWWbDoQYM1zwdTbRWnW0dB6bypTGUDjmwiffhaRxYs=;
	b=F5h/JlArC2FhIzAxrJ+HmgbqifnClWNorohUWPDrp12z5YguEhNr1759Up6BM31gGQapvPIX4gyCCFUjJqx6jiuIoITe9iBF/SKwqFZWObNwXzWGh+NqidkuT5jBM5BYuXtVJ0d/joLsJrWpniTeljH1NwbLdn/yS3yJ6QYjHVY=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=Andrew.Baumann@microsoft.com; 
Received: from baumann-desk.redmond.corp.microsoft.com (2001:4898:80e8:e::724)
	by BY2PR0301MB2040.namprd03.prod.outlook.com (10.163.196.154) with
	Microsoft
	SMTP Server (TLS) id 15.1.331.20; Thu, 3 Dec 2015 18:37:06 +0000
From: Andrew Baumann <Andrew.Baumann@microsoft.com>
To: <qemu-devel@nongnu.org>
Date: Thu, 3 Dec 2015 10:36:48 -0800
Message-ID: <1449167808-5656-1-git-send-email-Andrew.Baumann@microsoft.com>
X-Mailer: git-send-email 2.5.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [2001:4898:80e8:e::724]
X-ClientProxiedBy: BY2PR08CA062.namprd08.prod.outlook.com (10.141.248.180) To
	BY2PR0301MB2040.namprd03.prod.outlook.com (25.163.196.154)
X-Microsoft-Exchange-Diagnostics: 1; BY2PR0301MB2040;
	2:b5xbObUPm1ma3dLRC4jiLwom+aONhiMpPf2fbL8dME7PDvt84dUlSt/25TnWp7e2NIbU6CF67WdegH36feyzwG/9k5B4G1fiAdTKFf1RCu98N2a76xY6Shsrn1L4LfM3F/3xy+cVp+ikbo/GHzECCw==;
	3:BMFvyjPxumXd1QS8t9TnKTT0pd57GhZA5mcxMMSnGRblq/MqDqdDFjrMh6+F4ds6H1IQApg++9lf3/6xnT03i3YipkcabV21soiW78W0GWoq/yR5ren7ED7Sxfu+79me;
	25:1VpYVZeel6gwgFjRYAFPq4yw8yGuSbyw67rYZMhoeIV5eLZl03oyR8wpaGzZKYTXUZhO1WZZg0lzEzZmo6J9EPJqrYMoPe+mDc/100M/3qZzPogWUQYm+MEkc6eTLBofU1qrJd+pnGPNCtrpjr0CWA29m/LND69IqsNpI91XrYjwd3PcoM51n/JRrXuGok1S1o9hUJHfyDbsjlPUHUYzdvOuA32H/zIxk/kd4L53YbRCgC6iKUCf+1mpSfZpJY+baZlVJeD1BGCNVEP2bEVmLQ==
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:BY2PR0301MB2040;
X-Microsoft-Exchange-Diagnostics: 1; BY2PR0301MB2040;
	20:qTvRwUTG3/v2pk3Ax34ZBKWk94Fh8EDSNkP85CIeCZ89WImtPXYLqOZqr7zcEK8tohrBsfw3GaCf5KJ4RADNWvBdXWwC51DSwJF+0IImBItPPe7Qs6rBYwAVCCtF0zGkkUE5MFe1dqUbK/MF0cQQtzGAgElxpJdEfuraWci8t9MwggrsGjPPgoIgloXMwRNjDXypCiRrZgpvndIw3Yex6j8ZCDw4ywgy++Lx7muXhWsZNcjAGsZpL/DUaZqM5ACvTQv2Qwfp0VyGIr4Cn3q4d5B4DmEcWfdw58MTOaCdsur/89MoBVJH/KmLcnulT65VQClvqKeEqU65kVFyrANmBKEGdAYYddb/n73ncqasxoOqX8OKK2rGBO6Zu1rBwdf0FUWPiCgamxVOyQyvZrP8d9araqUxlLCiPEcLOhkMnZev/TMxJOp56f353zSglDyDtxP0yrSSFAojUmePuspLI7igiAGRO39zaFoAdkMFQWTAI+yXNuo2tNPA2ZtRCzxj;
	4:9oheHw4Qb9FBLlhLSqAWOKGtrXOBRdzuQ49Hc9Frcew1F1gJfOb7axyO+qoCm6xkpqho2T/ju7TLWEopcJIbdUqWH3ZR43w8KxH0z9JD260yzqcKPK90fJTwnL9Q39JWazmIxXf6cambJ17aB+oPKIZPRCw3nzjplydkW32rhb965FcMV8j1FD7M/71E17KxV1q1YZ1ykHwTvCw7Cw4oi66iUsfAi9mNwQg2J7un3/M6laHKxrPtkl3pS9WtIZH7/U1JaqXk2vqOcD7L2Fx0J5oxBFs1zH9mb0GQ6L2WnL34fH6O3WAxMnaWZxsmdo6Pi2FCVLHJIXb5aKUugEffZeXqF1VItNVZO7kbyxGj+ONMS1UCwBB7wIkq8MPvKpMgspsSFwK95wVrjLbvX2Vsp1AA4AYxDIw2/Tpnb+dSrwAWkaISzcfcpJQ3Ncr/wSEU
X-Microsoft-Antispam-PRVS: <BY2PR0301MB2040CE2F199A5C38DC323CC49E0D0@BY2PR0301MB2040.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(108003899814671);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(520078)(8121501046)(5005006)(3002001)(10201501046);
	SRVR:BY2PR0301MB2040; BCL:0; PCL:0; RULEID:;
	SRVR:BY2PR0301MB2040; 
X-Forefront-PRVS: 077929D941
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(6009001)(199003)(51914003)(189002)(19580395003)(5004730100002)(48376002)(229853001)(105586002)(2351001)(81156007)(87976001)(50986999)(97736004)(50466002)(19580405001)(101416001)(106356001)(5001960100002)(189998001)(110136002)(86362001)(86612001)(50226001)(10090500001)(42186005)(5005710100001)(5003940100001)(107886002)(10290500002)(47776003)(77096005)(92566002)(6116002)(586003)(36756003)(4001430100002)(122386002)(40100003)(1096002)(5008740100001)(3826002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BY2PR0301MB2040;
	H:baumann-desk.redmond.corp.microsoft.com; FPR:; SPF:None;
	PTR:InfoNoRecords; A:1; MX:1; LANG:en; 
Received-SPF: None (protection.outlook.com: microsoft.com does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BY2PR0301MB2040;
	23:AXpobD90X2IY1yzfL6LH5F41kPUZOuL9MXq0D/K?=
	=?us-ascii?Q?6BZdr7Iti9JyJzRZmdobKc/suscjWVbGkepPykEQR6sMhuArBIWwxHxgiXUT?=
	=?us-ascii?Q?QE28amY4NvFXUrBl8POTT1AM1HFRZlqm8TmM2rQtCEeuo6RnhTtTeb2DhMsB?=
	=?us-ascii?Q?+QmPKYnUAaezO0ZMBdomaWEu0PZ1MAX4EGiy9TKvaDh9F+gkWcEkE7utnqhO?=
	=?us-ascii?Q?zn22ek4F2M9Kg+tRe3Cn3l7pa9OvzDHBIDdCJjbSTmrQvwyCzWuDx5A+wCzW?=
	=?us-ascii?Q?2YXALBhcfOF/kO0DSGFAeOLjaaN3+heyHLmlva5u6wruZ68qVo6SSEqmMVzF?=
	=?us-ascii?Q?0XRtOAMxd3/ITlNtnQet8o4Rl/F6ZAtciurLjrBPWhhb0pwstmE1C+VYkwIq?=
	=?us-ascii?Q?y4oH9lZ/OZiDF2ZiQHas04bNM7/1tKlOKGhVl52ZHgkb42kTkW1c/M0wKitX?=
	=?us-ascii?Q?RoUh8mLWnqEwLRSN55zrXmrUVs9LigS4uGmL5tissy4XLxCtREC3TgFgOFUv?=
	=?us-ascii?Q?hgjC0xPDe/35jsL8sOhZXiSoJJtKizV7Pfu7T8Rp7mZfSqs/KKbEgo1bKp72?=
	=?us-ascii?Q?1MOFCreJzhd2wmfML2Lsqjcekq3EOFEl2vIonfDpnU3JCYL1lSFWYCJBB9U+?=
	=?us-ascii?Q?FmuxdCxkXJxZcJjj706xlNTmoxQfI5V5ELCqP7h92pnlXvRfkaiolpbi19Y7?=
	=?us-ascii?Q?Lnxkhfp+xC9JPJnvO9nGHXg5kKOU4K944o5eZKNbrBXQFLxJjxoRL8o4Cm38?=
	=?us-ascii?Q?a7Doy/sDWnXG3P25qrka/c/vKeCVmxdfgQ8yTw2Df1l1R6ukslEyrrFTRkGx?=
	=?us-ascii?Q?6edJDKM8FkSDLUXaCyjQSHEEupmEHlooT4g2m21P2KhQH3zs5QGrfTPMeMUQ?=
	=?us-ascii?Q?tslMaD86vMNAPiUnJBwBtjZd724W/vP4ZtQsq1l3FPYV76ZQWfmTYq4fGFs+?=
	=?us-ascii?Q?+QDJi6V3JLcPHSw/G/Vv0IwE8U9vtj20IRBRAy2acsLR1eIopdSUhPgN38no?=
	=?us-ascii?Q?lsIqnN3g8sd/rHFn4jrqbP6KNt3xUxn45FCsE7uwqgMNODqlFQga8F0jt0dc?=
	=?us-ascii?Q?Ankx9aHVD00NuR3dL8bJy47Vb+cSMq/vqeDfDCFXdO7cRybjCXTkJzSoZKMk?=
	=?us-ascii?Q?CQGbNsKpTOkWBOdoqp/ZgOZDEbeiVLqaN?=
X-Microsoft-Exchange-Diagnostics: 1; BY2PR0301MB2040;
	5:HUzYI2guAyrSk8oiuOPL4Np0QfAIIoRnwazynMYPSb101ctI7IfMb9WvlQ4WSK9t1oVFnOpj8KgDesys3mgPXDM4LMDGiHMdqiuUMDU14TnJQ/G0xCfQUNMlqUoi0bDEEOcutpJ6hS2ai6qHG6MHTQ==;
	24:soCIXMkIOPkL2ungKEq9vyh5/Yyu4h+ajyt3U+zyC2yBRx9gQdKw4+XYFedpiIfsWYyDe2smXcSRn36jyZgLhKtGUkIQppLcyH0eLNP6Wpw=
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2015 18:37:06.1571 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY2PR0301MB2040
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8
X-Received-From: 65.55.169.129
Cc: Laurent Desnogues <laurent.desnogues@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	Andrew Baumann <Andrew.Baumann@microsoft.com>
Subject: [Qemu-arm] [PATCH v2] target-arm: raise exception on misaligned
	LDREX operands
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: N8flMoOjFc2u

Qemu does not generally perform alignment checks. However, the ARM ARM
requires implementation of alignment exceptions for a number of cases
including LDREX, and Windows-on-ARM relies on this.

This change adds plumbing to enable alignment checks on loads using
MO_ALIGN, a do_unaligned_access hook to raise the exception (data
abort), and uses the new aligned loads in LDREX (for all but
single-byte loads).

Signed-off-by: Andrew Baumann <Andrew.Baumann@microsoft.com>
---
Thanks for the feedback on v1! I wish I had known about (or gone
looking for) MO_ALIGN sooner...

arm_regime_using_lpae_format() is a no-op wrapper I added to export
regime_using_lpae_format (which is a static inline). Would it be
preferable to simply export the existing function, and rename it? If
so, is this still the correct name to use for the function?

 target-arm/cpu.c       |  1 +
 target-arm/helper.c    |  8 ++++++++
 target-arm/internals.h |  7 +++++++
 target-arm/op_helper.c | 35 ++++++++++++++++++++++++++++++++++-
 target-arm/translate.c | 11 +++++++----
 5 files changed, 57 insertions(+), 5 deletions(-)

diff --git a/target-arm/cpu.c b/target-arm/cpu.c
index 30739fc..35a1f12 100644
--- a/target-arm/cpu.c
+++ b/target-arm/cpu.c
@@ -1417,6 +1417,7 @@ static void arm_cpu_class_init(ObjectClass *oc, void *data)
     cc->handle_mmu_fault = arm_cpu_handle_mmu_fault;
 #else
     cc->do_interrupt = arm_cpu_do_interrupt;
+    cc->do_unaligned_access = arm_cpu_do_unaligned_access;
     cc->get_phys_page_debug = arm_cpu_get_phys_page_debug;
     cc->vmsd = &vmstate_arm_cpu;
     cc->virtio_is_big_endian = arm_cpu_is_big_endian;
diff --git a/target-arm/helper.c b/target-arm/helper.c
index afc4163..59d5a41 100644
--- a/target-arm/helper.c
+++ b/target-arm/helper.c
@@ -5996,6 +5996,14 @@ static inline bool regime_using_lpae_format(CPUARMState *env,
     return false;
 }
 
+/* Returns true if the translation regime is using LPAE format page tables.
+ * Used when raising alignment exceptions, whose FSR changes depending on
+ * whether the long or short descriptor format is in use. */
+bool arm_regime_using_lpae_format(CPUARMState *env, ARMMMUIdx mmu_idx)
+{
+    return regime_using_lpae_format(env, mmu_idx);
+}
+
 static inline bool regime_is_user(CPUARMState *env, ARMMMUIdx mmu_idx)
 {
     switch (mmu_idx) {
diff --git a/target-arm/internals.h b/target-arm/internals.h
index 347998c..b925aaa 100644
--- a/target-arm/internals.h
+++ b/target-arm/internals.h
@@ -441,4 +441,11 @@ struct ARMMMUFaultInfo {
 bool arm_tlb_fill(CPUState *cpu, vaddr address, int rw, int mmu_idx,
                   uint32_t *fsr, ARMMMUFaultInfo *fi);
 
+/* Return true if the translation regime is using LPAE format page tables */
+bool arm_regime_using_lpae_format(CPUARMState *env, ARMMMUIdx mmu_idx);
+
+/* Raise a data fault alignment exception for the specified virtual address */
+void arm_cpu_do_unaligned_access(CPUState *cs, vaddr vaddr, int is_write,
+                                 int is_user, uintptr_t retaddr);
+
 #endif
diff --git a/target-arm/op_helper.c b/target-arm/op_helper.c
index 6cd54c8..c6995ca 100644
--- a/target-arm/op_helper.c
+++ b/target-arm/op_helper.c
@@ -126,7 +126,40 @@ void tlb_fill(CPUState *cs, target_ulong addr, int is_write, int mmu_idx,
         raise_exception(env, exc, syn, target_el);
     }
 }
-#endif
+
+/* Raise a data fault alignment exception for the specified virtual address */
+void arm_cpu_do_unaligned_access(CPUState *cs, vaddr vaddr, int is_write,
+                                 int is_user, uintptr_t retaddr)
+{
+    ARMCPU *cpu = ARM_CPU(cs);
+    CPUARMState *env = &cpu->env;
+    int target_el;
+    bool same_el;
+
+    if (retaddr) {
+        /* now we have a real cpu fault */
+        cpu_restore_state(cs, retaddr);
+    }
+
+    target_el = exception_target_el(env);
+    same_el = (arm_current_el(env) == target_el);
+
+    env->exception.vaddress = vaddr;
+
+    /* the DFSR for an alignment fault depends on whether we're using
+     * the LPAE long descriptor format, or the short descriptor format */
+    if (arm_regime_using_lpae_format(env, cpu_mmu_index(env, false))) {
+        env->exception.fsr = 0x21;
+    } else {
+        env->exception.fsr = 0x1;
+    }
+
+    raise_exception(env, EXCP_DATA_ABORT,
+                    syn_data_abort(same_el, 0, 0, 0, 0, 0x21),
+                    target_el);
+}
+
+#endif /* !defined(CONFIG_USER_ONLY) */
 
 uint32_t HELPER(add_setq)(CPUARMState *env, uint32_t a, uint32_t b)
 {
diff --git a/target-arm/translate.c b/target-arm/translate.c
index 5d22879..12dbfac 100644
--- a/target-arm/translate.c
+++ b/target-arm/translate.c
@@ -926,13 +926,13 @@ static inline void store_reg_from_load(DisasContext *s, int reg, TCGv_i32 var)
 #define DO_GEN_LD(SUFF, OPC)                                             \
 static inline void gen_aa32_ld##SUFF(TCGv_i32 val, TCGv_i32 addr, int index) \
 {                                                                        \
-    tcg_gen_qemu_ld_i32(val, addr, index, OPC);                          \
+    tcg_gen_qemu_ld_i32(val, addr, index, (OPC));                        \
 }
 
 #define DO_GEN_ST(SUFF, OPC)                                             \
 static inline void gen_aa32_st##SUFF(TCGv_i32 val, TCGv_i32 addr, int index) \
 {                                                                        \
-    tcg_gen_qemu_st_i32(val, addr, index, OPC);                          \
+    tcg_gen_qemu_st_i32(val, addr, index, (OPC));                        \
 }
 
 static inline void gen_aa32_ld64(TCGv_i64 val, TCGv_i32 addr, int index)
@@ -988,6 +988,9 @@ DO_GEN_LD(8u, MO_UB)
 DO_GEN_LD(16s, MO_TESW)
 DO_GEN_LD(16u, MO_TEUW)
 DO_GEN_LD(32u, MO_TEUL)
+/* 'a' variants include an alignment check */
+DO_GEN_LD(16ua, MO_TEUW | MO_ALIGN)
+DO_GEN_LD(32ua, MO_TEUL | MO_ALIGN)
 DO_GEN_ST(8, MO_UB)
 DO_GEN_ST(16, MO_TEUW)
 DO_GEN_ST(32, MO_TEUL)
@@ -7435,11 +7438,11 @@ static void gen_load_exclusive(DisasContext *s, int rt, int rt2,
         gen_aa32_ld8u(tmp, addr, get_mem_index(s));
         break;
     case 1:
-        gen_aa32_ld16u(tmp, addr, get_mem_index(s));
+        gen_aa32_ld16ua(tmp, addr, get_mem_index(s));
         break;
     case 2:
     case 3:
-        gen_aa32_ld32u(tmp, addr, get_mem_index(s));
+        gen_aa32_ld32ua(tmp, addr, get_mem_index(s));
         break;
     default:
         abort();
-- 
2.5.3

