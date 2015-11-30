Received: by 10.182.158.201 with SMTP id ww9csp1907439obb;
        Mon, 30 Nov 2015 14:24:54 -0800 (PST)
X-Received: by 10.55.78.78 with SMTP id c75mr58058393qkb.71.1448922293314;
        Mon, 30 Nov 2015 14:24:53 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 16si47183143qho.16.2015.11.30.14.24.53
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 30 Nov 2015 14:24:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@microsoft.com;
       dmarc=fail (p=NONE dis=NONE) header.from=microsoft.com
Received: from localhost ([::1]:43657 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1a3WsO-00055u-T3
	for alex.bennee@linaro.org; Mon, 30 Nov 2015 17:24:52 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58216)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1a3Wrz-0004oN-JX
	for qemu-devel@nongnu.org; Mon, 30 Nov 2015 17:24:28 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1a3Wrw-00009K-AW
	for qemu-devel@nongnu.org; Mon, 30 Nov 2015 17:24:27 -0500
Received: from mail-bn1bon0145.outbound.protection.outlook.com
	([157.56.111.145]:41408
	helo=na01-bn1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1a3Wrv-00008n-Ml
	for qemu-devel@nongnu.org; Mon, 30 Nov 2015 17:24:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
	s=selector1; h=From:To:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=v7h920vdKPR7XPBU2TIlfwLi//m0Vmi0LSnF7Bepvp4=;
	b=WTgHljqd/Av/jIRLjYkr0Zt49uJjLDxfh0luSx4GDL9OfZn4NE/DprLqCgGrTOvlx5eSdawGF22a40/3laWaT8+BRwSKuuKoBo09wQnH7uPHssxCD6+zfERxTFSUSTFQEazx8J41e3C5VXkKkoPTPf+QtR9s4PBrt4gF0txWY1s=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=Andrew.Baumann@microsoft.com; 
Received: from baumann-desk.redmond.corp.microsoft.com (2001:4898:80e8:5::724)
	by BY2PR0301MB2037.namprd03.prod.outlook.com (10.163.196.151) with
	Microsoft
	SMTP Server (TLS) id 15.1.331.20; Mon, 30 Nov 2015 22:24:20 +0000
From: Andrew Baumann <Andrew.Baumann@microsoft.com>
To: <qemu-devel@nongnu.org>
Date: Mon, 30 Nov 2015 14:23:58 -0800
Message-ID: <1448922238-5696-1-git-send-email-Andrew.Baumann@microsoft.com>
X-Mailer: git-send-email 2.5.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [2001:4898:80e8:5::724]
X-ClientProxiedBy: CY1PR21CA0033.namprd21.prod.outlook.com (25.161.247.43) To
	BY2PR0301MB2037.namprd03.prod.outlook.com (25.163.196.151)
X-Microsoft-Exchange-Diagnostics: 1; BY2PR0301MB2037;
	2:3dJ+r4S4yYMTo0CA3cp9hjSB3t7DnvVg+YBYMu4ixpCZVq9Q2lkN4tIbc9hdZO96h3X4CnwWrd9PBiod+vIXv+nuvsIeaGmrdWWy9/4tn3uGH4ccsjYAfjJoZ65sqe7xSvRPQX6tbOu+kFJgmwOnpA==;
	3:omo5AgYbPVbpO+4AmYggyGYDBkKSBMY1eCRn2B+GBqwIOIV1LOz0eLGNXrKAlnt8r+e9+hcq0fxmPpKCRj6IOVs0k4ZVDCUn1LI/2NebG3bsa5n0YqOsCB7CdwCyykgl;
	25:JDw8e329KZToiWEHGUXvEJ5O80L5z8fO6fRgwL3QJdP3F/nE22eNCujpWCxxVTY8j5KnmBbqBgSlWCwcxqZf0Ym8+HV8KVlHMRr6CzNkxSTIUSA4kWawSIcJi7ierOYpl5y0IopYLQodR90AI8DhKzQd+yL/x2S1bBT8covcsoH13SxK4n6W4F3EsBdaeal1P2oQty9tbCbPnEosbv+MkpSJshAk5T3QdL4cTEH8+jnyPWzoWPiwuj0DCFcYAO/IMUyxRbsIR8j9bKFIvHXsvA==
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:BY2PR0301MB2037;
X-Microsoft-Exchange-Diagnostics: 1; BY2PR0301MB2037;
	20:fi5stkLTz0wjco+/smAc/SoB1FuchX8JZccDbMEj1wWqjtpLarftWFMa8WSalw1SWaaqo9CWM5h5q+jeaGkQVtZxZaOzooqHFHdSJo3G7gNhujCoqemlbkGJJvqJDIgcKMyO+idy4MB6VH29sVNUJMMPkYn+1nWdgSYaLblvQ4HGmIJpmQOv6EOipu9+oXLTqU2zRDPVeYrcDr13gJaT2RoG5UVBFLJAptl0G9w33TpK6/iQX2T1+aHsIpBy0oYFhfJQQ0QOkTmpApnpYIMfRauOTjogP7zj/kVSjOQ9uvpW0eM29I4kXlWo0R1v8I0oR5enc3WgMozA3bMtjlZkwj2ixmNBnnfvv5XrAembFfWfJ/kw8NH394HociKnZPmcmzx7ksigZGv4wWEQ3pIn7oTmXp6jKTI1ozFFNhYwjkoBeh/jnMQnKNu6Q+A4FXbr5g1T27qXUKaxO0CQzxuHTQz2Lm5XxkQg5dltSMtNRDnBkgwuNYvwkTCrG0j1VEgu;
	4:ntoDIREGOnpyXUtnMFRwYqQw/bYUfvZ0AnN/z8a1u2Rz0vtCBb9ho/3geB3sL2sJ4RVl9GCCEqsNcW9qm2NWDQB1c4T6/Bt+t9cHIvcw/yC+QySHOGhAhtdAXSj6oaposI3m1J7DWQ0mSXs+oF3ZD3aDDYSXwxG3eCdC/vX6+vl3cFRZ+vs2kGEekiJRwZkqVIWvIr/zZnSnffPowuB78hfSY5I0DQGLWLnHaNT4fTLAtyVsCQkgoLYAyk0/fpaejZOVyRZq/HZvivr/cQ5RV2xL9dnu5jrGgjAVxzanBGQ0MliZVS5SLou3LiIrm0YtLGWAN1UhF2iIyQSzDZMi8gFlGXJvRSd8vw8tIw5s9dO93dCEcqjk6AskB5LSGfPeIAR86v7RZ+usnWLGDsWNvgGtK7R+7EatjMgd3imoaSHq06VcGTXjBby2bgVEDUHb
X-Microsoft-Antispam-PRVS: <BY2PR0301MB2037AD489081E1C0089582409E000@BY2PR0301MB2037.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(108003899814671);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(520078)(5005006)(8121501046)(10201501046)(3002001);
	SRVR:BY2PR0301MB2037; BCL:0; PCL:0; RULEID:;
	SRVR:BY2PR0301MB2037; 
X-Forefront-PRVS: 0776C39A48
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(6009001)(199003)(189002)(5008740100001)(5005710100001)(6116002)(19580405001)(19580395003)(40100003)(87976001)(229853001)(50226001)(97736004)(101416001)(47776003)(110136002)(2351001)(586003)(81156007)(5001960100002)(36756003)(189998001)(77096005)(10290500002)(5004730100002)(107886002)(1096002)(106356001)(50986999)(92566002)(4001430100002)(10090500001)(5003940100001)(105586002)(42186005)(48376002)(86362001)(122386002)(50466002)(86612001)(3826002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BY2PR0301MB2037;
	H:baumann-desk.redmond.corp.microsoft.com; FPR:; SPF:None;
	PTR:InfoNoRecords; A:1; MX:1; LANG:en; 
Received-SPF: None (protection.outlook.com: microsoft.com does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BY2PR0301MB2037;
	23:NeVEo5MLkCfQ1iIuKrnOO3ouHkmuKDLCnRLYQ5C?=
	=?us-ascii?Q?ppoc6sJXs8FImsAlKZWGOaIeNpW7qo69NiD6VpOZrnePiFvp3b2RqLOalUAm?=
	=?us-ascii?Q?GUru4IKHOJUCveb2679rLqHHhW6zOcYXw60818SiMuDP4wnQioNvUms2a+hz?=
	=?us-ascii?Q?4+1VStMVsSMHh3Nl71CqQTeGFmliXd2Z42pDoH/YCok0puabg8xhEYHXc/WQ?=
	=?us-ascii?Q?5JXnyfKlg1jlzIU8zalCheUagZf8qZfn+iDfEIxW9o//mFGryMVq5L6yRFnM?=
	=?us-ascii?Q?iKqY/H5r11qmgeSNq7eVXwrO5RTuEvfTGEyMGrUnBSUK5nu7ft2YoAk9UMR7?=
	=?us-ascii?Q?kubzRXwdUYwAlvtwbyM3AR5kps/03TnAerQzuEow0dWDs73GP2rXt6zkWGHh?=
	=?us-ascii?Q?h+vG7rDhyqMehUxCqRrJQEFzxlDTAyj9/Y4CPNi3pti0QHI/mKu/5MRg7u8x?=
	=?us-ascii?Q?ilfSL5GLbwQSdqfTSdKWMu3eVbi1B+oYaUIZ60PJzecPJRfAS8zd+kB5l1fH?=
	=?us-ascii?Q?QB5RPDFhJQIePn6B/Qn+XZdijK4KqHI11Y8bpS2JJr/UbeXm0aKWl7YcOKc5?=
	=?us-ascii?Q?90senLCS8k0kcLRUo3RoFKUb0fCSZzvDYTdwDXeaWP2jye+tx0nXPohrzYrB?=
	=?us-ascii?Q?5qkUO3xkQ4TvykggKiJvPOxbWes+kXaZ6ln7Gh1wmEBUaYpTzk2XOxj0hUJp?=
	=?us-ascii?Q?YQ97DDdKol0PtPcoAkLsNIBQBi0ZTsZgOIe9yv3gw6nE4m4ReKULoAeWojMP?=
	=?us-ascii?Q?PpKAJisNDyKojcM/rVPXcRAnW2mYtd2jIvnHiJUhVDkK5Z1WKXcVU9C1HZUB?=
	=?us-ascii?Q?i6xguhDiVgjVefW2Sx5Gu0YUoIw7mCSUQdAbxOQWDrq9b+8O4R1lTbXhi+P7?=
	=?us-ascii?Q?5E8Y9Ot7dNQk1IND4ruJX4Uhoq10JOijBmwJjkFuQV1ZCrSyZWvJiUJH0DOV?=
	=?us-ascii?Q?U4TvLxD11jDRavD04Tghaj9vOFRe6yzzQMN9kk4YjrqoPlf7shHze/4J6+hJ?=
	=?us-ascii?Q?EHj2HtKKV8jIFAFtf1h6IPuHoNbqu52JLM2QF70KyusfDNaDkxHwHMc4Uu0w?=
	=?us-ascii?Q?M9tgg8gNMf9ZteH5wgnSRthzxr0Y3wqTqPi5GxzuOfIoUoQn1vcl5aKR9rLb?=
	=?us-ascii?Q?fKQjX/0R2r5M=3D?=
X-Microsoft-Exchange-Diagnostics: 1; BY2PR0301MB2037;
	5:ZHJ4MFHDu7eqk3CaE4QTRCx7InwGXZMsnKquB0SEMsC2ugffiGFtp5MvKfd3OCa9kO6ZzGRTbDXlSdUz7zH/qLG/UuGRlBCJyMwaNHMBEEaSQeDdhd9oUUJGh/JJ6dWJ0n4BmLIvmVvk38hs3HpwUA==;
	24:Apow3C2vgLxRC3hOHT+aDDrME54M+fTi9FkE32HfY44uPVpR+e9HLl1HwibCW7oBV84Uj0rakYFWemkXSpmawzWHsJc7UFY0quY/1PpsnyE=
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2015 22:24:20.7468 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY2PR0301MB2037
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8
X-Received-From: 157.56.111.145
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org, Andrew
	Baumann <Andrew.Baumann@microsoft.com>
Subject: [Qemu-devel] [PATCH] target-arm: raise exception on misaligned
	LDREX operands
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 2n7XdTXagd4K

Qemu does not generally perform alignment checks. However, the ARM ARM
requires implementation of alignment exceptions for a number of cases
including LDREX, and Windows-on-ARM relies on this.

This change adds a helper function to raise an alignment exception
(data abort), a framework for implementing alignment checks in
translated instructions, and adds one such check to the translation of
LDREX instruction (for all variants except single-byte loads).

Signed-off-by: Andrew Baumann <Andrew.Baumann@microsoft.com>
---
I realise this will need to wait until after 2.5, but wanted to get
the review feedback started. If needed, I can resend this later.

arm_regime_using_lpae_format() is a no-op wrapper I added to export
regime_using_lpae_format (which is a static inline). Would it be
preferable to simply export the existing function, and rename it? If
so, is this still the correct name to use for the function?

CONFIG_ALIGNMENT_EXCEPTIONS shows how the check can be conditionally
enabled, but isn't presently hooked up to any configure mechanism. I
figured that the overhead of an alignment check in LDREX is not high
enough to warrant disabling the feature, but if it gets used more
widely it might be.

The same change is almost certainly applicable to arm64, but I am not
in a position to test it.

 target-arm/helper.c    |  8 ++++++++
 target-arm/helper.h    |  1 +
 target-arm/internals.h |  3 +++
 target-arm/op_helper.c | 21 +++++++++++++++++++++
 target-arm/translate.c | 29 +++++++++++++++++++++++++++++
 5 files changed, 62 insertions(+)

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
diff --git a/target-arm/helper.h b/target-arm/helper.h
index c2a85c7..16d0137 100644
--- a/target-arm/helper.h
+++ b/target-arm/helper.h
@@ -48,6 +48,7 @@ DEF_HELPER_FLAGS_3(sel_flags, TCG_CALL_NO_RWG_SE,
                    i32, i32, i32, i32)
 DEF_HELPER_2(exception_internal, void, env, i32)
 DEF_HELPER_4(exception_with_syndrome, void, env, i32, i32, i32)
+DEF_HELPER_2(alignment_exception, void, env, tl)
 DEF_HELPER_1(wfi, void, env)
 DEF_HELPER_1(wfe, void, env)
 DEF_HELPER_1(yield, void, env)
diff --git a/target-arm/internals.h b/target-arm/internals.h
index 347998c..17afe2a 100644
--- a/target-arm/internals.h
+++ b/target-arm/internals.h
@@ -441,4 +441,7 @@ struct ARMMMUFaultInfo {
 bool arm_tlb_fill(CPUState *cpu, vaddr address, int rw, int mmu_idx,
                   uint32_t *fsr, ARMMMUFaultInfo *fi);
 
+/* Return true if the translation regime is using LPAE format page tables */
+bool arm_regime_using_lpae_format(CPUARMState *env, ARMMMUIdx mmu_idx);
+
 #endif
diff --git a/target-arm/op_helper.c b/target-arm/op_helper.c
index 6cd54c8..5c46210 100644
--- a/target-arm/op_helper.c
+++ b/target-arm/op_helper.c
@@ -376,6 +376,27 @@ void HELPER(exception_with_syndrome)(CPUARMState *env, uint32_t excp,
     raise_exception(env, excp, syndrome, target_el);
 }
 
+/* Raise a data fault alignment exception for the specified virtual address */
+void HELPER(alignment_exception)(CPUARMState *env, target_ulong vaddr)
+{
+    int target_el = exception_target_el(env);
+    bool same_el = (arm_current_el(env) != target_el);
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
 uint32_t HELPER(cpsr_read)(CPUARMState *env)
 {
     return cpsr_read(env) & ~(CPSR_EXEC | CPSR_RESERVED);
diff --git a/target-arm/translate.c b/target-arm/translate.c
index 5d22879..c05ea1f 100644
--- a/target-arm/translate.c
+++ b/target-arm/translate.c
@@ -37,6 +37,7 @@
 
 #include "trace-tcg.h"
 
+#define CONFIG_ALIGNMENT_EXCEPTIONS 1
 
 #define ENABLE_ARCH_4T    arm_dc_feature(s, ARM_FEATURE_V4T)
 #define ENABLE_ARCH_5     arm_dc_feature(s, ARM_FEATURE_V5)
@@ -1058,6 +1059,28 @@ static void gen_exception_insn(DisasContext *s, int offset, int excp,
     s->is_jmp = DISAS_JUMP;
 }
 
+/* Emit an inline alignment check, which raises an exception if the given
+ * address is not aligned according to "size" (which must be a power of 2). */
+static void gen_alignment_check(DisasContext *s, int pc_offset,
+                                target_ulong size, TCGv addr)
+{
+#ifdef CONFIG_ALIGNMENT_EXCEPTIONS
+    TCGLabel *alignok_label = gen_new_label();
+    TCGv tmp = tcg_temp_new();
+
+    /* check alignment, branch to alignok_label if aligned */
+    tcg_gen_andi_tl(tmp, addr, size - 1);
+    tcg_gen_brcondi_tl(TCG_COND_EQ, tmp, 0, alignok_label);
+
+    /* emit alignment exception */
+    gen_set_pc_im(s, s->pc - pc_offset);
+    gen_helper_alignment_exception(cpu_env, addr);
+
+    gen_set_label(alignok_label);
+    tcg_temp_free(tmp);
+#endif
+}
+
 /* Force a TB lookup after an instruction that changes the CPU state.  */
 static inline void gen_lookup_tb(DisasContext *s)
 {
@@ -7430,6 +7453,12 @@ static void gen_load_exclusive(DisasContext *s, int rt, int rt2,
 
     s->is_ldex = true;
 
+    /* emit alignment check if needed */
+    if (size != 0) {
+        /* NB: all LDREX variants (incl. thumb) occupy 4 bytes */
+        gen_alignment_check(s, 4, (target_ulong)1 << size, addr);
+    }
+
     switch (size) {
     case 0:
         gen_aa32_ld8u(tmp, addr, get_mem_index(s));
-- 
2.5.3

