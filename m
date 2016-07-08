Received: by 10.25.21.156 with SMTP id 28csp311981lfv;
        Fri, 8 Jul 2016 08:49:32 -0700 (PDT)
X-Received: by 10.55.97.80 with SMTP id v77mr8596652qkb.41.1467992972672;
        Fri, 08 Jul 2016 08:49:32 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t66si204486qke.81.2016.07.08.08.49.32
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 08 Jul 2016 08:49:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@yandex.ru;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=ya.ru
Received: from localhost ([::1]:46375 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bLY20-0005ag-0J
	for alex.bennee@linaro.org; Fri, 08 Jul 2016 11:49:32 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45651)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afarallax@yandex.ru>) id 1bLY0Y-0004zW-U3
	for qemu-devel@nongnu.org; Fri, 08 Jul 2016 11:48:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <afarallax@yandex.ru>) id 1bLY0W-0004ya-9a
	for qemu-devel@nongnu.org; Fri, 08 Jul 2016 11:48:01 -0400
Received: from forward14h.cmail.yandex.net ([87.250.230.156]:57103)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afarallax@yandex.ru>)
	id 1bLY0P-0004so-R2; Fri, 08 Jul 2016 11:47:55 -0400
Received: from mxback8h.mail.yandex.net (mxback8h.mail.yandex.net
	[84.201.186.17])
	by forward14h.cmail.yandex.net (Yandex) with ESMTP id DC6CB21885;
	Fri,  8 Jul 2016 18:47:41 +0300 (MSK)
Received: from mxback8h.mail.yandex.net (localhost [127.0.0.1])
	by mxback8h.mail.yandex.net (Yandex) with ESMTP id DA9952013A6;
	Fri,  8 Jul 2016 18:47:41 +0300 (MSK)
Received: from web25h.yandex.ru (web25h.yandex.ru [84.201.187.159])
	by mxback8h.mail.yandex.net (nwsmtp/Yandex) with ESMTP id
	FUIE5i35ar-lfGiBtVL; Fri, 08 Jul 2016 18:47:41 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
	t=1467992861; bh=i1NYkfaG9UHiSN0DpmZdeIWV9j6mkp2WNyFNSeptIrk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date;
	b=VhV/JZyT4fuc7L82+ATD03WZgV/qqqr1EqKWFmRC03lK3Kk16cxMU2mVKnKnsFTf/
	HGASphCmpewS1bv4LYmgWBY9wqeLBPr69zlopdl6mueKIOPXAitiaJY8zYNJC7dBp7
	xuHWdNtRnLvwPSxgTRZI8LIQgZA/mtHFydl8A/xA=
Authentication-Results: mxback8h.mail.yandex.net; dkim=pass header.i=@yandex.ru
X-Yandex-Suid-Status: 1 0,1 0,1 0,1 37377968
X-Yandex-Sender-Uid: 15784356
Received: by web25h.yandex.ru with HTTP;
	Fri, 08 Jul 2016 18:47:41 +0300
From: Sergey Sorokin <afarallax@ya.ru>
Envelope-From: afarallax@yandex.ru
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
In-Reply-To: <1466694717-556963-1-git-send-email-afarallax@yandex.ru>
References: <1466694717-556963-1-git-send-email-afarallax@yandex.ru>
Message-Id: <758361467992861@web25h.yandex.ru>
X-Mailer: Yamail [ http://yandex.ru ] 5.0
Date: Fri, 08 Jul 2016 18:47:41 +0300
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 87.250.230.156
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.21
Subject: Re: [Qemu-devel] [PATCH] target-arm: Add missed AArch32 TLBI sytem
 registers
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 31KyFmnWwQc+

   23.06.2016, 18:12, "Sergey Sorokin" <afarallax@yandex.ru>:

     Some PL2 related TLBI system registers are missed in AArch32
     implementation. The patch fixes it.
     Signed-off-by: Sergey Sorokin <[1]afarallax@yandex.ru>
     ---
     Â target-arm/helper.c | 148
     ++++++++++++++++++++++++++++++++++++++++++++++++++++
     Â 1 file changed, 148 insertions(+)
     diff --git a/target-arm/helper.c b/target-arm/helper.c
     index 35ff772..73c844f 100644
     --- a/target-arm/helper.c
     +++ b/target-arm/helper.c
     @@ -572,6 +572,111 @@ static void tlbimvaa_is_write(CPUARMState
     *env, const ARMCPRegInfo *ri,
     Â Â Â Â Â }
     Â }
     +static void tlbiall_nsnh_write(CPUARMState *env, const ARMCPRegInfo
     *ri,
     + uint64_t value)
     +{
     + CPUState *cs = ENV_GET_CPU(env);
     +
     + if (arm_feature(env, ARM_FEATURE_EL2)) {
     + tlb_flush_by_mmuidx(cs, ARMMMUIdx_S12NSE1, ARMMMUIdx_S12NSE0,
     + ARMMMUIdx_S2NS, -1);
     + } else {
     + tlb_flush_by_mmuidx(cs, ARMMMUIdx_S12NSE1, ARMMMUIdx_S12NSE0, -1);
     + }
     +}
     +
     +static void tlbiall_nsnh_is_write(CPUARMState *env, const
     ARMCPRegInfo *ri,
     + uint64_t value)
     +{
     + bool has_el2 = arm_feature(env, ARM_FEATURE_EL2);
     + CPUState *other_cs;
     +
     + CPU_FOREACH(other_cs) {
     + if (has_el2) {
     + tlb_flush_by_mmuidx(other_cs, ARMMMUIdx_S12NSE1,
     + ARMMMUIdx_S12NSE0, ARMMMUIdx_S2NS, -1);
     + } else {
     + tlb_flush_by_mmuidx(other_cs, ARMMMUIdx_S12NSE1,
     + ARMMMUIdx_S12NSE0, -1);
     + }
     + }
     +}
     +
     +static void tlbiipas2_write(CPUARMState *env, const ARMCPRegInfo
     *ri,
     + uint64_t value)
     +{
     + /* Invalidate by IPA. This has to invalidate any structures that
     + * contain only stage 2 translation information, but does not need
     + * to apply to structures that contain combined stage 1 and stage 2
     + * translation information.
     + * This must NOP if EL2 isn't implemented or SCR_EL3.NS is zero.
     + */
     + CPUState *cs = ENV_GET_CPU(env);
     + uint64_t pageaddr;
     +
     + if (!arm_feature(env, ARM_FEATURE_EL2) || !(env->cp15.scr_el3 &
     SCR_NS)) {
     + return;
     + }
     +
     + pageaddr = sextract64(value << 12, 0, 40);
     +
     + tlb_flush_page_by_mmuidx(cs, pageaddr, ARMMMUIdx_S2NS, -1);
     +}
     +
     +static void tlbiipas2_is_write(CPUARMState *env, const ARMCPRegInfo
     *ri,
     + uint64_t value)
     +{
     + CPUState *other_cs;
     + uint64_t pageaddr;
     +
     + if (!arm_feature(env, ARM_FEATURE_EL2) || !(env->cp15.scr_el3 &
     SCR_NS)) {
     + return;
     + }
     +
     + pageaddr = sextract64(value << 12, 0, 40);
     +
     + CPU_FOREACH(other_cs) {
     + tlb_flush_page_by_mmuidx(other_cs, pageaddr, ARMMMUIdx_S2NS, -1);
     + }
     +}
     +
     +static void tlbiall_hyp_write(CPUARMState *env, const ARMCPRegInfo
     *ri,
     + uint64_t value)
     +{
     + CPUState *cs = ENV_GET_CPU(env);
     +
     + tlb_flush_by_mmuidx(cs, ARMMMUIdx_S1E2, -1);
     +}
     +
     +static void tlbiall_hyp_is_write(CPUARMState *env, const
     ARMCPRegInfo *ri,
     + uint64_t value)
     +{
     + CPUState *other_cs;
     +
     + CPU_FOREACH(other_cs) {
     + tlb_flush_by_mmuidx(other_cs, ARMMMUIdx_S1E2, -1);
     + }
     +}
     +
     +static void tlbimva_hyp_write(CPUARMState *env, const ARMCPRegInfo
     *ri,
     + uint64_t value)
     +{
     + CPUState *cs = ENV_GET_CPU(env);
     +
     + tlb_flush_page_by_mmuidx(cs, value & TARGET_PAGE_MASK,
     ARMMMUIdx_S1E2, -1);
     +}
     +
     +static void tlbimva_hyp_is_write(CPUARMState *env, const
     ARMCPRegInfo *ri,
     + uint64_t value)
     +{
     + CPUState *other_cs;
     + uint64_t pageaddr = value & TARGET_PAGE_MASK;
     +
     + CPU_FOREACH(other_cs) {
     + tlb_flush_page_by_mmuidx(other_cs, pageaddr, ARMMMUIdx_S1E2, -1);
     + }
     +}
     +
     Â static const ARMCPRegInfo cp_reginfo[] = {
     Â Â Â Â Â /* Define the secure and non-secure FCSE identifier CP
     registers
     Â Â Â Â Â Â * separately because there is no secure bank in V8 (no
     _EL3). This allows
     @@ -1238,6 +1343,14 @@ static const ARMCPRegInfo v7_cp_reginfo[] = {
     Â Â Â Â Â Â Â .type = ARM_CP_NO_RAW, .access = PL1_W, .writefn =
     tlbiasid_write },
     Â Â Â Â Â { .name = "TLBIMVAA", .cp = 15, .opc1 = 0, .crn = 8, .crm
     = 7, .opc2 = 3,
     Â Â Â Â Â Â Â .type = ARM_CP_NO_RAW, .access = PL1_W, .writefn =
     tlbimvaa_write },
     + { .name = "TLBIALLNSNH",
     + .cp = 15, .opc1 = 4, .crn = 8, .crm = 7, .opc2 = 4,
     + .type = ARM_CP_NO_RAW, .access = PL2_W,
     + .writefn = tlbiall_nsnh_write },
     + { .name = "TLBIALLNSNHIS",
     + .cp = 15, .opc1 = 4, .crn = 8, .crm = 3, .opc2 = 4,
     + .type = ARM_CP_NO_RAW, .access = PL2_W,
     + .writefn = tlbiall_nsnh_is_write },
     Â Â Â Â Â REGINFO_SENTINEL
     Â };
     @@ -3273,6 +3386,22 @@ static const ARMCPRegInfo v8_cp_reginfo[] = {
     Â Â Â Â Â Â Â .type = ARM_CP_NO_RAW, .access = PL1_W, .writefn =
     tlbimva_write },
     Â Â Â Â Â { .name = "TLBIMVAAL", .cp = 15, .opc1 = 0, .crn = 8, .crm
     = 7, .opc2 = 7,
     Â Â Â Â Â Â Â .type = ARM_CP_NO_RAW, .access = PL1_W, .writefn =
     tlbimvaa_write },
     + { .name = "TLBIIPAS2",
     + .cp = 15, .opc1 = 4, .crn = 8, .crm = 4, .opc2 = 1,
     + .type = ARM_CP_NO_RAW, .access = PL2_W,
     + .writefn = tlbiipas2_write },
     + { .name = "TLBIIPAS2IS",
     + .cp = 15, .opc1 = 4, .crn = 8, .crm = 0, .opc2 = 1,
     + .type = ARM_CP_NO_RAW, .access = PL2_W,
     + .writefn = tlbiipas2_is_write },
     + { .name = "TLBIIPAS2L",
     + .cp = 15, .opc1 = 4, .crn = 8, .crm = 4, .opc2 = 5,
     + .type = ARM_CP_NO_RAW, .access = PL2_W,
     + .writefn = tlbiipas2_write },
     + { .name = "TLBIIPAS2LIS",
     + .cp = 15, .opc1 = 4, .crn = 8, .crm = 0, .opc2 = 5,
     + .type = ARM_CP_NO_RAW, .access = PL2_W,
     + .writefn = tlbiipas2_is_write },
     Â Â Â Â Â /* 32 bit cache operations */
     Â Â Â Â Â { .name = "ICIALLUIS", .cp = 15, .opc1 = 0, .crn = 7, .crm
     = 1, .opc2 = 0,
     Â Â Â Â Â Â Â .type = ARM_CP_NOP, .access = PL1_W },
     @@ -3605,6 +3734,25 @@ static const ARMCPRegInfo el2_cp_reginfo[] =
     {
     Â Â Â Â Â { .name = "HTTBR", .cp = 15, .opc1 = 4, .crm = 2,
     Â Â Â Â Â Â Â .access = PL2_RW, .type = ARM_CP_64BIT | ARM_CP_ALIAS,
     Â Â Â Â Â Â Â .fieldoffset = offsetof(CPUARMState, cp15.ttbr0_el[2])
     },
     + { .name = "TLBIALLH", .cp = 15, .opc1 = 4, .crn = 8, .crm = 7,
     .opc2 = 0,
     + .type = ARM_CP_NO_RAW, .access = PL2_W,
     + .writefn = tlbiall_hyp_write },
     + { .name = "TLBIALLHIS", .cp = 15, .opc1 = 4, .crn = 8, .crm = 3,
     .opc2 = 0,
     + .type = ARM_CP_NO_RAW, .access = PL2_W,
     + .writefn = tlbiall_hyp_is_write },
     + { .name = "TLBIMVAH", .cp = 15, .opc1 = 4, .crn = 8, .crm = 7,
     .opc2 = 1,
     + .type = ARM_CP_NO_RAW, .access = PL2_W,
     + .writefn = tlbimva_hyp_write },
     + { .name = "TLBIMVAHIS", .cp = 15, .opc1 = 4, .crn = 8, .crm = 3,
     .opc2 = 1,
     + .type = ARM_CP_NO_RAW, .access = PL2_W,
     + .writefn = tlbimva_hyp_is_write },
     + { .name = "TLBIMVALH", .cp = 15, .opc1 = 4, .crn = 8, .crm = 7,
     .opc2 = 5,
     + .type = ARM_CP_NO_RAW, .access = PL2_W,
     + .writefn = tlbimva_hyp_write },
     + { .name = "TLBIMVALHIS",
     + .cp = 15, .opc1 = 4, .crn = 8, .crm = 3, .opc2 = 5,
     + .type = ARM_CP_NO_RAW, .access = PL2_W,
     + .writefn = tlbimva_hyp_is_write },
     Â Â Â Â Â { .name = "TLBI_ALLE2", .state = ARM_CP_STATE_AA64,
     Â Â Â Â Â Â Â .opc0 = 1, .opc1 = 4, .crn = 8, .crm = 7, .opc2 = 0,
     Â Â Â Â Â Â Â .type = ARM_CP_NO_RAW, .access = PL2_W,
     --
     1.9.3

   ping

   http://patchwork.ozlabs.org/patch/639688/

References

   Visible links
   1. mailto:afarallax@yandex.ru

   Hidden links:
   2. http://patchwork.ozlabs.org/patch/639688/
