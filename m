Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98E15CA5FF5
	for <qemu-arm@archiver.kernel.org>; Mon,  5 Oct 2026 20:07:08 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xDoxe-000863-5w; Mon, 05 Oct 2026 16:06:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gromero@redhat.com>)
 id 1xDoxa-00084z-Op
 for qemu-arm@nongnu.org; Mon, 05 Oct 2026 16:06:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gromero@redhat.com>)
 id 1xDoxY-0003d8-Iz
 for qemu-arm@nongnu.org; Mon, 05 Oct 2026 16:06:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1791230811;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=c6Sdtt3HORv6KZW79HF8YK9duNsSzOXMZL+YL/KN7/I=;
 b=ENvOHHOO/LxwofZUsJawOF5c1S3yJuCkZDtq/T0nK0dhCW1xmsHIdKfb8vgkoV3R+gdPh2
 jwgzmayQrUgeEGHbURIwpEcNQx1Q8Qa0PO/2PMtpy3ldEprNKcyeg6x1TiiNTwhWA9sUJU
 brFDGOs0riwFoy7LhXYH/AzFuvx81Ek=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-235-nt-6EkYHM4e8T2zbzmPJHA-1; Mon, 05 Oct 2026 16:06:49 -0400
X-MC-Unique: nt-6EkYHM4e8T2zbzmPJHA-1
X-Mimecast-MFC-AGG-ID: nt-6EkYHM4e8T2zbzmPJHA_1791230809
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-48c4f6f6691so2011445f8f.2
 for <qemu-arm@nongnu.org>; Mon, 05 Oct 2026 13:06:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791230808; x=1791835608;
 h=in-reply-to:content-disposition:content-type:mime-version
 :references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=c6Sdtt3HORv6KZW79HF8YK9duNsSzOXMZL+YL/KN7/I=;
 b=ytSjqEVMRpxYYeFZ5kvJRGg+gn+fpykbazGM1ZQ/TcF9PEixzP4YxYPLGeLQIle0Dh
 r31BgwXemfRKq27MoO+0J4CHF7Gdl1HFqSVjoaYK1M1lesMbSzyiF4c8sa81niLeeBfm
 qubIZQYl1VinGY8sKXcEj7ZYcsMMlsuspGWIukopp92C7HvB4kff5wDlP4HEl/FjJhTK
 RhgAuTAVZlHSrhIxwBjowava2JwrxuWKbc9ZkuOkuV24rahgjKaGIjUD7T4wJWjJOUAz
 AxYyebwYS8v2Dk3lqsPhepAr9cKDjXHXiLoUPXKYrrmCdRvXxjzBoOamZbhNjmKKLM6M
 74tg==
X-Forwarded-Encrypted: i=1;
 AKwUvByiPS1/JaPs33SLZNYljaje8tUs18ZccAexJC36LcD217U9RuH73mVfdQ26C9G9uxoJXQLn3FLd4Q==@nongnu.org
X-Gm-Message-State: AFq9FYLW2W4W7PBDviqYAUzycr/RL7dT7bDygc2mwdN9yHiJY7LjeTI+
 SQwrGfcUX1QtAoJm+F7zcLqHgLe93HaXjJpr68ZDNquMJVBTrYyViyabb0KwN66PkkbZKpryEpU
 sVdz3KOWydv1VXksARuFyjR+k4ldZLiJyZ7oWT42/UGWau3LKlk1znw==
X-Gm-Gg: AYBFou0evqIuubrI/XsC9ie8WhQlmRZB2hwaPvKU2CbKEH+eyzXwpWLAgBZDG2RpAnW
 fUgSsQDlM32se3vPck5qkmMu4IZphR9YMYyOW6xPH9cycGY2sKaSRg/j9YdcaoCs8UnzzJv8vGo
 M7aN2fg6k9Pqru3QCunjvmwLjItL3SJG1VJk/sR4EcXnnMsLLR+hlN6v/Jh5YYWOjWRMLGE5GhK
 /1lYDgpksG8avSh8tlSQUjezf+An+1fukQlv3VtPhxu9R7eb4yhY0q4Rcgnc54d5sb0Vlr7+Ki6
 9oHGM/PXd3shuZv76xsFJzp6B8OEzvl7dwxJ9JgbZ89gAOywcZk8yxOmgkzW
X-Received: by 2002:a5d:6f14:0:b0:48b:2a1:dfe3 with SMTP id
 ffacd0b85a97d-48c48015331mr14750016f8f.41.1791230808537; 
 Mon, 05 Oct 2026 13:06:48 -0700 (PDT)
X-Received: by 2002:a5d:6f14:0:b0:48b:2a1:dfe3 with SMTP id
 ffacd0b85a97d-48c48015331mr14749973f8f.41.1791230808055; 
 Mon, 05 Oct 2026 13:06:48 -0700 (PDT)
Received: from x1 ([151.42.212.213]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48c6229ee60sm5406531f8f.34.2026.10.05.13.06.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Oct 2026 13:06:47 -0700 (PDT)
Date: Mon, 5 Oct 2026 22:06:44 +0200
From: Gustavo Romero <gromero@redhat.com>
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org, 
 qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>, 
 Will Deacon <will@kernel.org>, Itaru Kitayama <itaru.kitayama@linux.dev>, 
 Fuad Tabba <tabba@google.com>
Subject: Re: [PATCH 1/2] target/arm: Clear TTBR[5:0] from a 52-bit table base
 address
Message-ID: <l5hcpwnktn2hvbt55ux42xzb2euc5zqohnxtaiftr7lxynfx2g@myyytd4e4owp>
References: <20261001175003.ttbr-baddr-52bit-0-fuad.tabba@linux.dev>
 <20261002070925.2627344-1-fuad.tabba@linux.dev>
MIME-Version: 1.0
In-Reply-To: <20261002070925.2627344-1-fuad.tabba@linux.dev>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: L3VrhFEUPmeIuvvMPANjvx82hYrrREA41Ur5APNHOgw_1791230809
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=gromero@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.24,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Hi Fuad,

On Fri, Oct 02, 2026 at 08:09:19AM +0100, Fuad Tabba wrote:
> get_phys_addr_lpae() can read the first descriptor of a walk from the
> wrong address. This happens with a 52-bit OA when the initial lookup
> table has fewer than eight entries and its base address has bit 51 set,
> or bit 50 for a two-entry table. The walk then faults or translates
> through whatever that address holds. VTTBR walks for stage 2 take the
> same path.
> 
> For example, the 16KB granule with a 48-bit VA has a two-entry level 0
> (FEAT_LPA2). The 64KB granule with a 44-bit VA has a four-entry level 1
> (FEAT_LPA). KVM's page_fault_test hangs on this in its 16KB, 52-bit PA
> guest mode under TCG, as reported on kvmarm.
> 
> With a 52-bit OA, TTBR[5:2] hold bits [51:48] of the base address. Such
> a table is 64-byte aligned (R_KBLCR), so bits [5:0] of the base address
> are zero. get_phys_addr_lpae() ORs TTBR[5:2] into bits [51:48], but
> then clears only the bits in indexmask. For these tables indexmask
> covers fewer than six bits, so TTBR[5] stays in the address, and
> TTBR[4] too for a two-entry table.
> 
> Clear TTBR[5:0] when forming a 52-bit table base address, and add a
> TCG test that walks a two-entry table through an IPA with bit 50 set,
> which stage 2 maps back onto the table.
> 
> Reported-by: Itaru Kitayama <itaru.kitayama@linux.dev>
> Link: https://lore.kernel.org/kvmarm/B4C0AC3E-6A4F-4A7B-B7BC-81207539115E@linux.dev/
> Fixes: 7a928f43d872 ("target/arm: Implement FEAT_LPA")
> Cc: qemu-stable@nongnu.org
> Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
> ---
>  target/arm/ptw.c                      |   5 +-
>  tests/tcg/aarch64/system/meson.build  |   6 ++
>  tests/tcg/aarch64/system/ttbr-baddr.c | 141 ++++++++++++++++++++++++++
>  3 files changed, 151 insertions(+), 1 deletion(-)
>  create mode 100644 tests/tcg/aarch64/system/ttbr-baddr.c
> 
> diff --git a/target/arm/ptw.c b/target/arm/ptw.c
> index de0435a58b..6cff52d592 100644
> --- a/target/arm/ptw.c
> +++ b/target/arm/ptw.c
> @@ -2107,13 +2107,16 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
>      descaddr = extract64(ttbr, 0, 48);
>  
>      /*
> -     * For FEAT_LPA and PS=6, bits [51:48] of descaddr are in [5:2] of TTBR.
> +     * With a 52-bit OA (FEAT_LPA or FEAT_LPA2), bits [51:48] of descaddr are
> +     * in [5:2] of TTBR, and bits [5:0] of the base address are zero: a table
> +     * under 64 bytes is still 64-byte aligned (R_KBLCR).
>       *
>       * Otherwise, if the base address is out of range, raise AddressSizeFault.
>       * In the pseudocode, this is !IsZero(baseregister<47:outputsize>),
>       * but we've just cleared the bits above 47, so simplify the test.
>       */
>      if (outputsize > 48) {
> +        descaddr &= ~MAKE_64BIT_MASK(0, 6);
>          descaddr |= extract64(ttbr, 2, 4) << 48;
>      } else if (descaddr >> outputsize) {
>          level = 0;
> diff --git a/tests/tcg/aarch64/system/meson.build b/tests/tcg/aarch64/system/meson.build
> index f51feb253f..270d4d6c31 100644
> --- a/tests/tcg/aarch64/system/meson.build
> +++ b/tests/tcg/aarch64/system/meson.build
> @@ -79,6 +79,12 @@ tests += {
>                    '-semihosting-config', 'enable=on,arg=2',
>                    qemu_base_args]
>    },
> +  'ttbr-baddr.c': {
> +    'cflags': cflags,
> +    'qemu_args': ['-M', 'virt,virtualization=on', '-cpu', 'max',
> +                  '-semihosting-config', 'enable=on,arg=2',
> +                  qemu_base_args]
> +  },
>  }
>  
>  tests += {
> diff --git a/tests/tcg/aarch64/system/ttbr-baddr.c b/tests/tcg/aarch64/system/ttbr-baddr.c
> new file mode 100644
> index 0000000000..7360684268
> --- /dev/null
> +++ b/tests/tcg/aarch64/system/ttbr-baddr.c
> @@ -0,0 +1,141 @@
> +/*
> + * TTBR base address with a 52-bit layout and a small initial lookup table
> + *
> + * Copyright (c) 2026 Google LLC
> + * Author: Fuad Tabba <fuad.tabba@linux.dev>
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + */
> +
> +#include <stdint.h>
> +#include <minilib.h>
> +
> +/* from Linux's include/linux/stringify.h */
> +#define __stringify_1(x...) #x
> +#define __stringify(x...)   __stringify_1(x)
> +
> +#define read_sysreg(r) ({                                           \
> +            uint64_t __val;                                         \
> +            asm volatile("mrs %0, " __stringify(r) : "=r" (__val)); \
> +            __val;                                                  \
> +})
> +
> +#define write_sysreg(r, v) do {                     \
> +        uint64_t __val = (uint64_t)(v);             \
> +        asm volatile("msr " __stringify(r) ", %x0"  \
> +                 : : "rZ" (__val));                 \
> +} while (0)
> +
> +#define RAM_BASE    0x40000000UL
> +#define HIGH_IPA    (1UL << 50)
> +#define TEST_VA     (0xffff000000000000UL | RAM_BASE)
> +
> +/*
> + * Stage 1: 16KB granule, 48-bit VA, so level 0 has two entries.
> + * Stage 2: 64KB granule, 52-bit IPA, mapping RAM at its own address and
> + * again at HIGH_IPA.
> + */
> +static uint64_t s1_l0[2048] __attribute__((aligned(16384)));
> +static uint64_t s1_l1[2048] __attribute__((aligned(16384)));
> +static uint64_t s1_l2[2048] __attribute__((aligned(16384)));
> +static uint64_t s2_l1[1024] __attribute__((aligned(65536)));
> +static uint64_t s2_l2[8192] __attribute__((aligned(65536)));
> +static uint64_t s2_l2_high[8192] __attribute__((aligned(65536)));
> +
> +#define TCR_T0SZ(x)     ((uint64_t)(x) << 0)
> +#define TCR_T1SZ(x)     ((uint64_t)(x) << 16)
> +#define TCR_TG0_16K     (2UL << 14)
> +#define TCR_TG1_16K     (1UL << 30)
> +#define TCR_IPS_52      (6UL << 32)
> +#define TCR_DS          (1UL << 59)
> +
> +#define VTCR_T0SZ(x)    ((uint64_t)(x) << 0)
> +#define VTCR_SL0_L1     (2UL << 6)
> +#define VTCR_TG0_64K    (1UL << 14)
> +#define VTCR_PS_52      (6UL << 16)
> +#define VTCR_RES1       (1UL << 31)
> +
> +#define HCR_VM          (1UL << 0)
> +#define HCR_RW          (1UL << 31)
> +
> +#define PAR_F           (1UL << 0)
> +#define PAR_PA(par)     ((par) & 0xfffffffff000UL)
> +#define S2_BLOCK        ((1 << 10) | (3 << 6) | (0xf << 2) | 1)
> +
> +static void tlb_flush(void)
> +{
> +    asm volatile("dsb sy; tlbi alle1; dsb sy; isb" : : : "memory");
> +}
> +
> +static uint64_t at(uint64_t ttbr1)
> +{
> +    uint64_t par;
> +
> +    write_sysreg(ttbr1_el1, ttbr1);
> +    tlb_flush();
> +    asm volatile("at s12e1r, %1; isb; mrs %0, par_el1"
> +                 : "=r" (par) : "r" (TEST_VA));
> +    return par;
> +}
> +
> +static void setup_tables(void)
> +{
> +    /* Stage 1: TEST_VA -> RAM_BASE, 32MB block, AF */
> +    s1_l0[0] = (uint64_t)s1_l1 | 3;
> +    s1_l1[0] = (uint64_t)s1_l2 | 3;
> +    s1_l2[(RAM_BASE >> 25) & 0x7ff] = RAM_BASE | (1 << 10) | 1;
> +
> +    /* Stage 2: 512MB blocks at RAM_BASE and HIGH_IPA | RAM_BASE, AF, RW */
> +    s2_l1[0] = (uint64_t)s2_l2 | 3;
> +    s2_l1[HIGH_IPA >> 42] = (uint64_t)s2_l2_high | 3;
> +    s2_l2[RAM_BASE >> 29] = RAM_BASE | S2_BLOCK;
> +    s2_l2_high[RAM_BASE >> 29] = RAM_BASE | S2_BLOCK;
> +}
> +
> +static int check(const char *name, uint64_t par)
> +{
> +    int ok = !(par & PAR_F) && PAR_PA(par) == RAM_BASE;
> +
> +    ml_printf("%s: PAR_EL1=%lx %s\n", name, par, ok ? "ok" : "FAIL");
> +    return !ok;
> +}
> +
> +int main(void)
> +{
> +    uint64_t mmfr0 = read_sysreg(id_aa64mmfr0_el1);
> +    uint64_t tcr = TCR_T0SZ(16) | TCR_T1SZ(16) | TCR_TG0_16K | TCR_TG1_16K |
> +                   TCR_DS;
> +    uint64_t base = (uint64_t)s1_l0;
> +    int ret = 0;
> +
> +    ml_printf("TTBR base address test\n");
> +
> +    /* PARange 52 bits, TGran16 with 52-bit addresses (FEAT_LPA2) */
> +    if ((mmfr0 & 0xf) != 6 || ((mmfr0 >> 20) & 0xf) != 2) {

I understand you are checking PARange == 6 here for checking if FEAT_LPA (not
FEAT_LPA2) is also available? If so, maybe change the comment to:

/* PARange 52 bits (FEAT_LPA) and TGran16 with 52-bit addresses (FEAT_LPA2) */

?


> +        ml_printf("SKIP: no 52-bit PA or no FEAT_LPA2 with 16KB\n");
> +        return 0;

Return 'ret' here for consistence?


That's a nice test.

I'm wondering if the fixes should be separated from the tests as we usually do,
but feel free to wait for collecting more input from the other reviewers about
it.


Cheers,
Gustavo

> +    }
> +
> +    /*
> +     * The test runs at EL2 (arg=2) and walks the EL1&0 regime with AT, so
> +     * the EL1 MMU settings below only affect those walks.
> +     */
> +    setup_tables();
> +    write_sysreg(mair_el1, 0xff);
> +    write_sysreg(sctlr_el1, read_sysreg(sctlr_el1) | 1);
> +
> +    /*
> +     * 52-bit OA: TTBR[4] is base address bit 50. Through stage 2, the
> +     * table at HIGH_IPA | s1_l0 is s1_l0, so the walk succeeds only if
> +     * TTBR[4] does not also offset the two-entry table by 0x10.
> +     */
> +    write_sysreg(vtcr_el2, VTCR_T0SZ(12) | VTCR_SL0_L1 | VTCR_TG0_64K |
> +                 VTCR_PS_52 | VTCR_RES1);
> +    write_sysreg(vttbr_el2, (uint64_t)s2_l1);
> +    write_sysreg(hcr_el2, HCR_RW | HCR_VM);
> +    write_sysreg(tcr_el1, tcr | TCR_IPS_52);
> +    ret |= check("ips52", at(base));
> +    ret |= check("ips52 ttbr[4]", at(base | (1 << 4)));
> +
> +    return ret;
> +}
> -- 
> 2.39.5
> 
> 


