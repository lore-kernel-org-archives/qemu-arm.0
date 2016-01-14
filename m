Received: by 10.25.159.19 with SMTP id i19csp1930008lfe;
        Thu, 14 Jan 2016 10:00:45 -0800 (PST)
X-Received: by 10.140.131.17 with SMTP id 17mr7852626qhd.12.1452794444995;
        Thu, 14 Jan 2016 10:00:44 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l10si8425477qgf.68.2016.01.14.10.00.44
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 14 Jan 2016 10:00:44 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@virtualopensystems-com.20150623.gappssmtp.com
Received: from localhost ([::1]:44041 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aJmCS-0001zp-Kz
	for alex.bennee@linaro.org; Thu, 14 Jan 2016 13:00:44 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37582)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <a.rigo@virtualopensystems.com>) id 1aJmC4-0001iv-Dt
	for qemu-devel@nongnu.org; Thu, 14 Jan 2016 13:00:21 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <a.rigo@virtualopensystems.com>) id 1aJmC2-0005hF-2F
	for qemu-devel@nongnu.org; Thu, 14 Jan 2016 13:00:20 -0500
Received: from mail-io0-x243.google.com ([2607:f8b0:4001:c06::243]:33496)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <a.rigo@virtualopensystems.com>) id 1aJmC0-0005h3-OX
	for qemu-devel@nongnu.org; Thu, 14 Jan 2016 13:00:17 -0500
Received: by mail-io0-x243.google.com with SMTP id f81so18098791iof.0
	for <qemu-devel@nongnu.org>; Thu, 14 Jan 2016 10:00:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=virtualopensystems-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=E8ipnix7NBAYh68WsvMt4kfVmPVvuEYKu0svsU7mX0s=;
	b=XKhzQ8hWZw1UL5KuDDs8mc8QQWfKEUDc6UjLcC+ZSgBkcKDY0GVXCGrCsQplElX2Ju
	rsK2RlTfGYYISQmu0MRYozb7+1qkDhfv5bPLUYfcmAVv9fsKh/Pv116/nGZG/LF+HSiu
	wSLZsvP5+Z0tXVHHtSuPUfDI9dz2D1DAxmW7c3f7GuSkjzTrcP2kTMx5ERO3XNeYdM90
	v5a7Cy+71Zr2lp8g/RtVypy6sbMOcGf9XgdBqAjXnIeS2p5rNvAUNBUkG2he67eJoqIh
	rShz9beV532C30XywjltZZb4k051d6qyzxLe0GFt+/uMF/MF0jkz/6h3YVttOACZd9/O
	OMGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=E8ipnix7NBAYh68WsvMt4kfVmPVvuEYKu0svsU7mX0s=;
	b=WLtBpQzS+1hnob+8U0qtS2VPTO8H1dHx7s8gl9v6kZg8U3i7672y/l4+wwYIqdTVKY
	WQDHN26kD/NMFMtEbPPvK/iqc3epjQZhClupWT8Wj3EJapAQLRNoJ/tXHUb/iMWzRo36
	OeLMch7cbxOWEMayLmxV0kn4wB+a+TyRgDZWa6ODmfvARSDbJC4PsqMMxVmoyji80elz
	1yQQs9xTnMhnKJMKuNRDaiuWn3C+VEAoAO81WMsH+xQU3yyS/cuFLr1bnKMdMjE2oxdx
	RapFi9DCVrvO7YI8c2rcOcD89kfwy1j7qnyxBjZ1mvuAyydop/niJ+aBAg2e5eCF97GY
	kFZw==
X-Gm-Message-State: ALoCoQmNKVIqu4lSeFHmAaq80jvT89UMwAnl2FN50SLvqsUkDKw1XCjHPU/lRiIfurze7JcBZa5MlaRWiPl6CloWZKKQhVASSQ==
MIME-Version: 1.0
X-Received: by 10.107.30.144 with SMTP id e138mr5639281ioe.158.1452794414426; 
	Thu, 14 Jan 2016 10:00:14 -0800 (PST)
Received: by 10.64.224.180 with HTTP; Thu, 14 Jan 2016 10:00:14 -0800 (PST)
X-Originating-IP: [80.15.154.113]
In-Reply-To: <1449167808-5656-1-git-send-email-Andrew.Baumann@microsoft.com>
References: <1449167808-5656-1-git-send-email-Andrew.Baumann@microsoft.com>
Date: Thu, 14 Jan 2016 19:00:14 +0100
Message-ID: <CAH47eN1oHgoVPR0f2+1Npi1z_4sHbeL1cFQT3R+9VeZCm0t+Yg@mail.gmail.com>
From: alvise rigo <a.rigo@virtualopensystems.com>
To: Andrew Baumann <Andrew.Baumann@microsoft.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:4001:c06::243
Cc: Laurent Desnogues <laurent.desnogues@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-devel] [PATCH v2] target-arm: raise exception on
 misaligned LDREX operands
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
X-TUID: 6IBb6dSLPw8Z

Forcing an unaligned LDREX access in aarch32, QEMU fails the following assert:
target-arm/helper.c:5921:regime_el: code should not be reached

Running this snippet both baremetal and on top of Linux will trigger
the problem:

static inline int cmpxchg(volatile void *ptr, unsigned int old,
                          unsigned int new)
{
    unsigned int oldval, res;

    do {
        asm volatile("@ __cmpxchg4\n"
                "    ldrex    %1, [%2]\n"
                "    mov    %0, #0\n"
                "    teq    %1, %3\n"
                "    strexeq %0, %4, [%2]\n"
                : "=&r" (res), "=&r" (oldval)
                : "r" (ptr), "Ir" (old), "r" (new)
                : "memory", "cc");
    } while (res);

    return oldval;
}

void main(void)
{
    int arr[2] = {0, 0};
    int *ptr = (int *)(((void *)&arr) + 1);

    cmpxchg(ptr, 0, 0xbeef);
}

On Thu, Dec 3, 2015 at 7:36 PM, Andrew Baumann
<Andrew.Baumann@microsoft.com> wrote:
> Qemu does not generally perform alignment checks. However, the ARM ARM
> requires implementation of alignment exceptions for a number of cases
> including LDREX, and Windows-on-ARM relies on this.
>
> This change adds plumbing to enable alignment checks on loads using
> MO_ALIGN, a do_unaligned_access hook to raise the exception (data
> abort), and uses the new aligned loads in LDREX (for all but
> single-byte loads).
>
> Signed-off-by: Andrew Baumann <Andrew.Baumann@microsoft.com>
> ---
> Thanks for the feedback on v1! I wish I had known about (or gone
> looking for) MO_ALIGN sooner...
>
> arm_regime_using_lpae_format() is a no-op wrapper I added to export
> regime_using_lpae_format (which is a static inline). Would it be
> preferable to simply export the existing function, and rename it? If
> so, is this still the correct name to use for the function?
>
>  target-arm/cpu.c       |  1 +
>  target-arm/helper.c    |  8 ++++++++
>  target-arm/internals.h |  7 +++++++
>  target-arm/op_helper.c | 35 ++++++++++++++++++++++++++++++++++-
>  target-arm/translate.c | 11 +++++++----
>  5 files changed, 57 insertions(+), 5 deletions(-)
>
> diff --git a/target-arm/cpu.c b/target-arm/cpu.c
> index 30739fc..35a1f12 100644
> --- a/target-arm/cpu.c
> +++ b/target-arm/cpu.c
> @@ -1417,6 +1417,7 @@ static void arm_cpu_class_init(ObjectClass *oc, void *data)
>      cc->handle_mmu_fault = arm_cpu_handle_mmu_fault;
>  #else
>      cc->do_interrupt = arm_cpu_do_interrupt;
> +    cc->do_unaligned_access = arm_cpu_do_unaligned_access;
>      cc->get_phys_page_debug = arm_cpu_get_phys_page_debug;
>      cc->vmsd = &vmstate_arm_cpu;
>      cc->virtio_is_big_endian = arm_cpu_is_big_endian;
> diff --git a/target-arm/helper.c b/target-arm/helper.c
> index afc4163..59d5a41 100644
> --- a/target-arm/helper.c
> +++ b/target-arm/helper.c
> @@ -5996,6 +5996,14 @@ static inline bool regime_using_lpae_format(CPUARMState *env,
>      return false;
>  }
>
> +/* Returns true if the translation regime is using LPAE format page tables.
> + * Used when raising alignment exceptions, whose FSR changes depending on
> + * whether the long or short descriptor format is in use. */
> +bool arm_regime_using_lpae_format(CPUARMState *env, ARMMMUIdx mmu_idx)
> +{
> +    return regime_using_lpae_format(env, mmu_idx);
> +}
> +
>  static inline bool regime_is_user(CPUARMState *env, ARMMMUIdx mmu_idx)
>  {
>      switch (mmu_idx) {
> diff --git a/target-arm/internals.h b/target-arm/internals.h
> index 347998c..b925aaa 100644
> --- a/target-arm/internals.h
> +++ b/target-arm/internals.h
> @@ -441,4 +441,11 @@ struct ARMMMUFaultInfo {
>  bool arm_tlb_fill(CPUState *cpu, vaddr address, int rw, int mmu_idx,
>                    uint32_t *fsr, ARMMMUFaultInfo *fi);
>
> +/* Return true if the translation regime is using LPAE format page tables */
> +bool arm_regime_using_lpae_format(CPUARMState *env, ARMMMUIdx mmu_idx);
> +
> +/* Raise a data fault alignment exception for the specified virtual address */
> +void arm_cpu_do_unaligned_access(CPUState *cs, vaddr vaddr, int is_write,
> +                                 int is_user, uintptr_t retaddr);
> +
>  #endif
> diff --git a/target-arm/op_helper.c b/target-arm/op_helper.c
> index 6cd54c8..c6995ca 100644
> --- a/target-arm/op_helper.c
> +++ b/target-arm/op_helper.c
> @@ -126,7 +126,40 @@ void tlb_fill(CPUState *cs, target_ulong addr, int is_write, int mmu_idx,
>          raise_exception(env, exc, syn, target_el);
>      }
>  }
> -#endif
> +
> +/* Raise a data fault alignment exception for the specified virtual address */
> +void arm_cpu_do_unaligned_access(CPUState *cs, vaddr vaddr, int is_write,
> +                                 int is_user, uintptr_t retaddr)
> +{
> +    ARMCPU *cpu = ARM_CPU(cs);
> +    CPUARMState *env = &cpu->env;
> +    int target_el;
> +    bool same_el;
> +
> +    if (retaddr) {
> +        /* now we have a real cpu fault */
> +        cpu_restore_state(cs, retaddr);
> +    }
> +
> +    target_el = exception_target_el(env);
> +    same_el = (arm_current_el(env) == target_el);
> +
> +    env->exception.vaddress = vaddr;
> +
> +    /* the DFSR for an alignment fault depends on whether we're using
> +     * the LPAE long descriptor format, or the short descriptor format */
> +    if (arm_regime_using_lpae_format(env, cpu_mmu_index(env, false))) {

The following code seems to solve the problem, but I'm not really sure
this is the proper way to fix it.
-    if (arm_regime_using_lpae_format(env, cpu_mmu_index(env, false))) {
+    int mmu_idx = cpu_mmu_index(env, false);
+    if (!arm_feature(env, ARM_FEATURE_EL2)) {
+        mmu_idx += ARMMMUIdx_S1NSE0;
+    }
+    if (arm_regime_using_lpae_format(env, mmu_idx)) {

Regards,
alvise

> +        env->exception.fsr = 0x21;
> +    } else {
> +        env->exception.fsr = 0x1;
> +    }
> +
> +    raise_exception(env, EXCP_DATA_ABORT,
> +                    syn_data_abort(same_el, 0, 0, 0, 0, 0x21),
> +                    target_el);
> +}
> +
> +#endif /* !defined(CONFIG_USER_ONLY) */
>
>  uint32_t HELPER(add_setq)(CPUARMState *env, uint32_t a, uint32_t b)
>  {
> diff --git a/target-arm/translate.c b/target-arm/translate.c
> index 5d22879..12dbfac 100644
> --- a/target-arm/translate.c
> +++ b/target-arm/translate.c
> @@ -926,13 +926,13 @@ static inline void store_reg_from_load(DisasContext *s, int reg, TCGv_i32 var)
>  #define DO_GEN_LD(SUFF, OPC)                                             \
>  static inline void gen_aa32_ld##SUFF(TCGv_i32 val, TCGv_i32 addr, int index) \
>  {                                                                        \
> -    tcg_gen_qemu_ld_i32(val, addr, index, OPC);                          \
> +    tcg_gen_qemu_ld_i32(val, addr, index, (OPC));                        \
>  }
>
>  #define DO_GEN_ST(SUFF, OPC)                                             \
>  static inline void gen_aa32_st##SUFF(TCGv_i32 val, TCGv_i32 addr, int index) \
>  {                                                                        \
> -    tcg_gen_qemu_st_i32(val, addr, index, OPC);                          \
> +    tcg_gen_qemu_st_i32(val, addr, index, (OPC));                        \
>  }
>
>  static inline void gen_aa32_ld64(TCGv_i64 val, TCGv_i32 addr, int index)
> @@ -988,6 +988,9 @@ DO_GEN_LD(8u, MO_UB)
>  DO_GEN_LD(16s, MO_TESW)
>  DO_GEN_LD(16u, MO_TEUW)
>  DO_GEN_LD(32u, MO_TEUL)
> +/* 'a' variants include an alignment check */
> +DO_GEN_LD(16ua, MO_TEUW | MO_ALIGN)
> +DO_GEN_LD(32ua, MO_TEUL | MO_ALIGN)
>  DO_GEN_ST(8, MO_UB)
>  DO_GEN_ST(16, MO_TEUW)
>  DO_GEN_ST(32, MO_TEUL)
> @@ -7435,11 +7438,11 @@ static void gen_load_exclusive(DisasContext *s, int rt, int rt2,
>          gen_aa32_ld8u(tmp, addr, get_mem_index(s));
>          break;
>      case 1:
> -        gen_aa32_ld16u(tmp, addr, get_mem_index(s));
> +        gen_aa32_ld16ua(tmp, addr, get_mem_index(s));
>          break;
>      case 2:
>      case 3:
> -        gen_aa32_ld32u(tmp, addr, get_mem_index(s));
> +        gen_aa32_ld32ua(tmp, addr, get_mem_index(s));
>          break;
>      default:
>          abort();
> --
> 2.5.3
>
>
