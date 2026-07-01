Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77787C43458
	for <qemu-arm@archiver.kernel.org>; Wed,  1 Jul 2026 14:17:50 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wevl3-0007Hs-P0; Wed, 01 Jul 2026 10:17:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zenghui.yu@linux.dev>)
 id 1wevl2-0007HP-B4
 for qemu-arm@nongnu.org; Wed, 01 Jul 2026 10:17:44 -0400
Received: from out-180.mta1.migadu.com ([2001:41d0:203:375::b4])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zenghui.yu@linux.dev>)
 id 1wevl0-000172-30
 for qemu-arm@nongnu.org; Wed, 01 Jul 2026 10:17:43 -0400
Message-ID: <10c554a8-3602-4ab0-a3df-796d8f7c2268@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1782915449;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OaMwduoRAKIjOQFP6y0wArUDt0qzWVZ7mzAnUdjLbwk=;
 b=cZbX/UyaNevAnUvBUCl4WO70LDUwOQXwphNRAr+EBOaidIT3xAE3BI+w23QJ4idBcL3BFw
 hTawdAzXWMtgqXoG52uIjiR5sJjv2HAJT+1BHjluL0v0TGktiK2OM+0MZnWW+ipNSIwOhg
 ipPnYErUMuDE+IFuOvxPwSex8RWcN3M=
Date: Wed, 1 Jul 2026 22:17:14 +0800
MIME-Version: 1.0
Subject: Re: [PATCH v2] target/arm/hvf: seed NO_RAW ID registers from
 isar.idregs[] on vCPU init
To: Jason Wright <wrigjl@proton.me>
Cc: agraf@csgraf.de, peter.maydell@linaro.org, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, richard.henderson@linaro.org, philmd@oss.qualcomm.com
References: <20260529114723.42040-1-peter.maydell@linaro.org>
 <20260529114723.42040-18-peter.maydell@linaro.org>
 <745e66c7-2a9b-4185-bae7-77e10623332b@linux.dev>
 <20260607182221.4357-1-wrigjl@proton.me>
 <20260629205213.82391-1-wrigjl@proton.me>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Zenghui Yu <zenghui.yu@linux.dev>
In-Reply-To: <20260629205213.82391-1-wrigjl@proton.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
Received-SPF: pass client-ip=2001:41d0:203:375::b4;
 envelope-from=zenghui.yu@linux.dev; helo=out-180.mta1.migadu.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On 6/30/26 4:52 AM, Jason Wright wrote:
> Commit 887eaa8a29 ("target/arm: implement FEAT_RNG_TRAP for RNDR/RNDRRS")
> gave ID_AA64ISAR0_EL1 a readfn so the RNDR field can reflect SCR_EL3.TRNDR
> at read time, and marked the cpreg ARM_CP_NO_RAW in the system-emulation
> path.  HVF then trips its hvf_arch_init_vcpu() assertion that no ID
> register in hvf_sreg_list[] is NO_RAW, aborting on boot on Apple Silicon:
> 
>   Assertion failed: (!(ri->type & ARM_CP_NO_RAW)),
>   function hvf_arch_init_vcpu, file hvf.c, line 1441.
> 
> Reproduce with:
> 
>   qemu-system-aarch64 -M virt,accel=hvf -cpu host \
>                       -nographic -display none -bios /dev/null
> 
> Fix it the same way ID_AA64PFR0_EL1 already is: list
> HV_SYS_REG_ID_AA64ISAR0_EL1 in the SYNC_NO_RAW_REGS block in sysreg.c.inc
> so the assert loop skips it, and seed the vCPU's copy at init time.
> 
> While here, unify how the three isar.idregs[]-backed ID registers are
> seeded.  isar.idregs[] already holds QEMU's intended value for each (the
> host caps, probed once at realize via hv_vcpu_config_get_feature_reg(),
> plus any QEMU adjustment), so there is no need to read each register back
> from the vCPU first.  Seed PFR0, ISAR0 and MMFR0 directly from
> isar.idregs[], dropping the two per-vCPU hv_vcpu_get_sys_reg() reads:
> 
>   - PFR0: take the GIC sysreg-interface bit from env->gicv3state, as the
>     id_aa64pfr0_read() readfn does.  Identical to the previous code
>     whenever a GICv3 sysreg interface is present (the configuration HVF
>     runs in practice); it differs only in that a vCPU with no GICv3 now
>     reports ID_AA64PFR0_EL1.GIC == 0 instead of inheriting the host's
>     value, which matches the field's meaning.
>   - ISAR0: no overlay is needed; HVF does not expose EL3, so
>     SCR_EL3.TRNDR is never set and the readfn is constant.
>   - MMFR0: still clamp PARANGE to the chosen IPA size, updating
>     isar.idregs[] in place because the page-table walker and the
>     ID_AA64MMFR0_EL1 cpreg resetvalue read PARANGE back from there.
> 
> Reported-by: Zenghui Yu <zenghui.yu@linux.dev>
> Suggested-by: Peter Maydell <peter.maydell@linaro.org>
> Fixes: 887eaa8a29 ("target/arm: implement FEAT_RNG_TRAP for RNDR/RNDRRS")
> Signed-off-by: Jason Wright <wrigjl@proton.me>

Tested-by: Zenghui Yu <zenghui.yu@linux.dev>

Thank you for the fix!

Zenghui

