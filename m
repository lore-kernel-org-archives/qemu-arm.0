Received: by 10.223.159.74 with SMTP id f10csp3226919wrg;
        Tue, 5 Dec 2017 11:56:53 -0800 (PST)
X-Google-Smtp-Source: AGs4zMYDpUUZZHyvUJ6t3s2z5oHwhbzWP0tEW3zt9PJtrqtVfC4k1MXVjWUcSe+ImFlqEjifSpt0
X-Received: by 10.37.212.131 with SMTP id m125mr13428318ybf.51.1512503813649;
        Tue, 05 Dec 2017 11:56:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1512503813; cv=none;
        d=google.com; s=arc-20160816;
        b=SZc/zmrIvF17TMXAQ+U64LfsQg3+3utorEANx0v5jj40LVMjP7tu5/bpl4fhi8EfnO
         uMOuCn50wEymh4lTWhLmMRfMeErh1ET0/HRPxU9axgUyP2scMQCX+vYwW5MhK21B9uRv
         IGcp/RRxrvsNgyzs6q6uVEIcB7yXjPIIUoW7+PPeC/6FpuaCONg43PRMxDyU2gtvPBVd
         JfYKThbtazwsfs6tZRhqjKpM3032bbSNLlSDq4BtyHLeAOi7TqQ17+4NLJ4ljgfXuN1Z
         DBAeZFlQ7vCBfBdTpMd2oeSK17WDubdr5ZzSHa/TZ4NPEMNxySIyOncjwfVqZ9TvT63N
         7aUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=sWCNMmZlk7oJBJqZF3oGZiW7WZkh+NCdzBVJiEpZRok=;
        b=kDB5SQ1Mldpdqz0XBtVfQsfiihubLcbX/AoxlV3CIoBU+jh268vFK44as89gHt2aaG
         nQKk/JiQwdkvX7tQJQIyEYp5jRYGryRPIaYg6hhZMhtmXue+yFxWkALadVLtpfbZ7tEv
         PF5IY3laZx5SC++mQcU1fqnIphU95k0spzR7NjWWWdFKpFFdEMeOYmJN/8UN7RFWa8QO
         NwlQ1Yq/pGdUyGuNan8sxVeXrcGnYcqw5kmW/ViLkBNHDSUnH93TYuSnl3kkyxUrTgBT
         NvzrTW6jHkOiaauAMoYXH4/3PepaClLQJXxyRFpOFzGkdZX5wCqnCdD7iMoa7R7/3eTV
         u66A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r129si243784ywh.524.2017.12.05.11.56.53
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 05 Dec 2017 11:56:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51829 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eMJKm-0002jT-A2
	for alex.bennee@linaro.org; Tue, 05 Dec 2017 14:56:52 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56835)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1eMJBC-0001CD-Tl
	for qemu-devel@nongnu.org; Tue, 05 Dec 2017 14:47:00 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1eMJBB-0002Qh-Js
	for qemu-devel@nongnu.org; Tue, 05 Dec 2017 14:46:58 -0500
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:38776)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1eMJB7-0002CW-Rm; Tue, 05 Dec 2017 14:46:54 -0500
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1eMJAo-00058p-Dp; Tue, 05 Dec 2017 19:46:34 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue,  5 Dec 2017 19:46:21 +0000
Message-Id: <1512503192-2239-2-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1512503192-2239-1-git-send-email-peter.maydell@linaro.org>
References: <1512503192-2239-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-devel] [PATCH 01/12] target/arm: Provide fault type enum and
 FSR conversion functions
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
Cc: "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
	Stefano Stabellini <sstabellini@kernel.org>, patches@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: rEfI1N4sXmRx

Currently get_phys_addr() and its various subfunctions return
a hard-coded fault status register value for translation
failures. This is awkward because FSR values these days may
be either long-descriptor format or short-descriptor format.
Worse, the right FSR type to use doesn't depend only on the
translation table being walked -- some cases, like fault
info reported to AArch32 EL2 for some kinds of ATS operation,
must be in long-descriptor format even if the translation
table being walked was short format. We can't get those cases
right with our current approach.

Provide fields in the ARMMMUFaultInfo struct which allow
get_phys_addr() to provide sufficient information for a caller to
construct an FSR value themselves, and utility functions which do
this for both long and short format FSR values, as a first step in
switching get_phys_addr() and its children to only returning the
failure cause in the ARMMMUFaultInfo struct.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/internals.h | 185 +++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 185 insertions(+)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index aa9c91b..67b9a52 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -488,7 +488,39 @@ static inline void arm_clear_exclusive(CPUARMState *env)
 }
 
 /**
+ * ARMFaultType: type of an ARM MMU fault
+ * This corresponds to the v8A pseudocode's Fault enumeration,
+ * with extensions for QEMU internal conditions.
+ */
+typedef enum ARMFaultType {
+    ARMFault_None,
+    ARMFault_AccessFlag,
+    ARMFault_Alignment,
+    ARMFault_Background,
+    ARMFault_Domain,
+    ARMFault_Permission,
+    ARMFault_Translation,
+    ARMFault_AddressSize,
+    ARMFault_SyncExternal,
+    ARMFault_SyncExternalOnWalk,
+    ARMFault_SyncParity,
+    ARMFault_SyncParityOnWalk,
+    ARMFault_AsyncParity,
+    ARMFault_AsyncExternal,
+    ARMFault_Debug,
+    ARMFault_TLBConflict,
+    ARMFault_Lockdown,
+    ARMFault_Exclusive,
+    ARMFault_ICacheMaint,
+    ARMFault_QEMU_NSCExec, /* v8M: NS executing in S&NSC memory */
+    ARMFault_QEMU_SFault, /* v8M: SecureFault INVTRAN, INVEP or AUVIOL */
+} ARMFaultType;
+
+/**
  * ARMMMUFaultInfo: Information describing an ARM MMU Fault
+ * @type: Type of fault
+ * @level: Table walk level (for translation, access flag and permission faults)
+ * @domain: Domain of the fault address (for non-LPAE CPUs only)
  * @s2addr: Address that caused a fault at stage 2
  * @stage2: True if we faulted at stage 2
  * @s1ptw: True if we faulted at stage 2 while doing a stage 1 page-table walk
@@ -496,12 +528,165 @@ static inline void arm_clear_exclusive(CPUARMState *env)
  */
 typedef struct ARMMMUFaultInfo ARMMMUFaultInfo;
 struct ARMMMUFaultInfo {
+    ARMFaultType type;
     target_ulong s2addr;
+    int level;
+    int domain;
     bool stage2;
     bool s1ptw;
     bool ea;
 };
 
+/**
+ * arm_fi_to_sfsc: Convert fault info struct to short-format FSC
+ * Compare pseudocode EncodeSDFSC(), though unlike that function
+ * we set up a whole FSR-format code including domain field and
+ * putting the high bit of the FSC into bit 10.
+ */
+static inline uint32_t arm_fi_to_sfsc(ARMMMUFaultInfo *fi)
+{
+    uint32_t fsc;
+
+    switch (fi->type) {
+    case ARMFault_None:
+        return 0;
+    case ARMFault_AccessFlag:
+        fsc = fi->level == 1 ? 0x3 : 0x6;
+        break;
+    case ARMFault_Alignment:
+        fsc = 0x1;
+        break;
+    case ARMFault_Permission:
+        fsc = fi->level == 1 ? 0xd : 0xf;
+        break;
+    case ARMFault_Domain:
+        fsc = fi->level == 1 ? 0x9 : 0xb;
+        break;
+    case ARMFault_Translation:
+        fsc = fi->level == 1 ? 0x5 : 0x7;
+        break;
+    case ARMFault_SyncExternal:
+        fsc = 0x8 | (fi->ea << 12);
+        break;
+    case ARMFault_SyncExternalOnWalk:
+        fsc = fi->level == 1 ? 0xc : 0xe;
+        fsc |= (fi->ea << 12);
+        break;
+    case ARMFault_SyncParity:
+        fsc = 0x409;
+        break;
+    case ARMFault_SyncParityOnWalk:
+        fsc = fi->level == 1 ? 0x40c : 0x40e;
+        break;
+    case ARMFault_AsyncParity:
+        fsc = 0x408;
+        break;
+    case ARMFault_AsyncExternal:
+        fsc = 0x406 | (fi->ea << 12);
+        break;
+    case ARMFault_Debug:
+        fsc = 0x2;
+        break;
+    case ARMFault_TLBConflict:
+        fsc = 0x400;
+        break;
+    case ARMFault_Lockdown:
+        fsc = 0x404;
+        break;
+    case ARMFault_Exclusive:
+        fsc = 0x405;
+        break;
+    case ARMFault_ICacheMaint:
+        fsc = 0x4;
+        break;
+    case ARMFault_Background:
+        fsc = 0x0;
+        break;
+    case ARMFault_QEMU_NSCExec:
+        fsc = M_FAKE_FSR_NSC_EXEC;
+        break;
+    case ARMFault_QEMU_SFault:
+        fsc = M_FAKE_FSR_SFAULT;
+        break;
+    default:
+        /* Other faults can't occur in a context that requires a
+         * short-format status code.
+         */
+        g_assert_not_reached();
+    }
+
+    fsc |= (fi->domain << 4);
+    return fsc;
+}
+
+/**
+ * arm_fi_to_lfsc: Convert fault info struct to long-format FSC
+ * Compare pseudocode EncodeLDFSC(), though unlike that function
+ * we fill in also the LPAE bit 9 of a DFSR format.
+ */
+static inline uint32_t arm_fi_to_lfsc(ARMMMUFaultInfo *fi)
+{
+    uint32_t fsc;
+
+    switch (fi->type) {
+    case ARMFault_None:
+        return 0;
+    case ARMFault_AddressSize:
+        fsc = fi->level & 3;
+        break;
+    case ARMFault_AccessFlag:
+        fsc = (fi->level & 3) | (0x2 << 2);
+        break;
+    case ARMFault_Permission:
+        fsc = (fi->level & 3) | (0x3 << 2);
+        break;
+    case ARMFault_Translation:
+        fsc = (fi->level & 3) | (0x1 << 2);
+        break;
+    case ARMFault_SyncExternal:
+        fsc = 0x10 | (fi->ea << 12);
+        break;
+    case ARMFault_SyncExternalOnWalk:
+        fsc = (fi->level & 3) | (0x5 << 2) | (fi->ea << 12);
+        break;
+    case ARMFault_SyncParity:
+        fsc = 0x18;
+        break;
+    case ARMFault_SyncParityOnWalk:
+        fsc = (fi->level & 3) | (0x7 << 2);
+        break;
+    case ARMFault_AsyncParity:
+        fsc = 0x19;
+        break;
+    case ARMFault_AsyncExternal:
+        fsc = 0x11 | (fi->ea << 12);
+        break;
+    case ARMFault_Alignment:
+        fsc = 0x21;
+        break;
+    case ARMFault_Debug:
+        fsc = 0x22;
+        break;
+    case ARMFault_TLBConflict:
+        fsc = 0x30;
+        break;
+    case ARMFault_Lockdown:
+        fsc = 0x34;
+        break;
+    case ARMFault_Exclusive:
+        fsc = 0x35;
+        break;
+    default:
+        /* Other faults can't occur in a context that requires a
+         * long-format status code.
+         */
+        g_assert_not_reached();
+    }
+
+    fsc |= 1 << 9;
+    return fsc;
+}
+
 /* Do a page table walk and add page to TLB if possible */
 bool arm_tlb_fill(CPUState *cpu, vaddr address,
                   MMUAccessType access_type, int mmu_idx,
-- 
2.7.4

