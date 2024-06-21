Received: by 2002:a17:505:2e08:b0:1bd8:8c49:4f6d with SMTP id ya8csp208139njc;
        Fri, 21 Jun 2024 08:43:18 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWxiOLhwj81WUpZrSfMNL8XQFXMU4gEvvm86dMrN8aAuJlnUrmtKOpgoLVJ+GdbsamLiP2aYni/fPAiYyFENGCXZ2onSp9m
X-Google-Smtp-Source: AGHT+IFJS4S3dJgTK17tkgSZWYoeFMOJcfgkB7gBfQXkri21ymoEtrwMDhg0jQGoRhmFAZGKXFj/
X-Received: by 2002:a05:6214:162b:b0:6b4:fd84:1cdf with SMTP id 6a1803df08f44-6b501e1d9dbmr84317036d6.18.1718984598161;
        Fri, 21 Jun 2024 08:43:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1718984598; cv=none;
        d=google.com; s=arc-20160816;
        b=dFn65jN6OPVkLNRel+cQag4cGm2IwKTCQ6vrFPE5dSO4Cb83Uz8sHgfokKQ+bPDPS/
         WSEC91T3/2w8fG71huxubPucDLX56GFnLcqFVKcgmsIAHid3FL+2xrgDSRyJrcWv279U
         SMACVr6t1bewxpaQgB6+Nq4SDdFDo95WtL71U9GVR6Hs3XTu8XlEp1GIPssbaICdLm3Y
         cAY16Opw0hXjkXgZ71fYcOQH5FRNV7dXeARz3CtZFvwT1i1b4k0cc7Ob+Vlr9PaTCaZf
         ZWsKgyzfGb0eHSAtThO5H4YXXwAPLI8M9JSylrnYYcSAkpwLIHuLbvDFQNINoxr8ZaIp
         O3Hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=IXSj+NNNgXINRu4ZC/RcR1zjLwZ2WpiPQ2GU5bGPi0c=;
        fh=sPNB+wMByEmOmv0NA5LZ0sZcEjWhHctCq8XojzuPPiI=;
        b=VbP5omHPfM8/xM/9LqXNgIzNWjlpD4VW1RljNre3NB4AoXVmp7LiHFzoacsQPP6Tv+
         xsEemoG8bXBLfNwjVBBCJXAi3Dqp4LXxTOGina909VKYxPZfKA2NVYlLYB+JOyJZUqKy
         GoYF0rueEbHxbfYhh/j/TY2gy+2PwiAHucHKKny0ZU3I1XtWZRrGBYehaFNVXfe2fMa8
         Jar4vOX5DWAaM8XMPLaFlqQhRe0mzq35fWYAhbCXUpClrjulXS/BmgiplbO/KS12Zwpg
         3iPJ87chokEzjXPhPGgNFqmO7CPkbJy8nXSBT+mAw05LHlG6YImj7KvJG0aRy9An7oao
         LUZQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=luICIPFM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6b51ef67482si18513666d6.611.2024.06.21.08.43.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 21 Jun 2024 08:43:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=luICIPFM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sKgPq-0001v9-S8; Fri, 21 Jun 2024 11:43:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sKgPi-0001mo-Mo
 for qemu-arm@nongnu.org; Fri, 21 Jun 2024 11:42:59 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sKgPf-0004Hq-H3
 for qemu-arm@nongnu.org; Fri, 21 Jun 2024 11:42:58 -0400
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-57d044aa5beso2429960a12.2
 for <qemu-arm@nongnu.org>; Fri, 21 Jun 2024 08:42:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1718984574; x=1719589374; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=IXSj+NNNgXINRu4ZC/RcR1zjLwZ2WpiPQ2GU5bGPi0c=;
 b=luICIPFMXSpNp/rxdbgnv6s+C3wvnzvyjDTWLWv/JS73O6qGQRAeIgRPqdo0BNCL0G
 GJpVoZ8AHB6xRMygjWB4KWnUpwkUmb42xgOrAYF2rskjt2puiD8eQnd4nqOyrBqbDvw6
 FibKCgjDw8n+b+eTDvv0sJJs+9BRnLYT0ws/tO/kwWXk4un8nUCSfb/A3cSouU4lyi4S
 uyKb0rdXo4EL4UG86Gm2u8VCbd8Iw19vOrADLUXR2AYeWHKseKBSVad9/0m8N0Y9cBSm
 qJoZ5STv2sgCOQHxIfZfCZ9A+u7Xg3mZes8MKPAdasT4t5dOeXPpaKoBUpjcnCpPnWoG
 /5qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718984574; x=1719589374;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=IXSj+NNNgXINRu4ZC/RcR1zjLwZ2WpiPQ2GU5bGPi0c=;
 b=RaOVvc5eIZgzyElafCH7xINHpyrOdkTStXV7m7LsMLg8Q/qVIoajtUHZHNPj7sc6Cx
 x/2517KpuZb8YOw4lXZXvd2qdjM8hc80AMMnR/wYC2jLJahnCkU0xxXc5Q5YVZm5NmrK
 OIueUKo4qAeW/IpZkhxMDODRaueI0+GJMAzhcJyY0fKr4euOSVrfCaBNjzT0q1DYb6CR
 8Rg5Gp+m9+IuqlfRpX7ZzEqie1Rrx1KTyAeIKl1qVpI90NbJOtXLTUyGgArnSeJkHGQ9
 +kSjohIZid/eqkia5y6GuSE+OftVaYlxhPEMdgcwWm5omI0sopAPNpw620x7Yg34JfTk
 RWbw==
X-Gm-Message-State: AOJu0Yy9aRvW8lWC61ABGgCi49mwLOKMuHyZLqYUyU3qJVtsmnqZt7aZ
 3L7CGKnbeUqEWOjhSteJQWksSf5cNEYoXn6A9w6xVdGeE8/M9CXe3kontHMGoK0WR7hMxPbMusf
 fXGE8ZYZcOPPffsDmMVc+iOlw1LxwGA4AJjxk1w==
X-Received: by 2002:a50:8acf:0:b0:57c:5764:15f1 with SMTP id
 4fb4d7f45d1cf-57d07eaab6fmr4716563a12.29.1718984573959; Fri, 21 Jun 2024
 08:42:53 -0700 (PDT)
MIME-Version: 1.0
References: <20240614093026.328271-1-sai.pavan.boddu@amd.com>
 <20240614093026.328271-2-sai.pavan.boddu@amd.com>
In-Reply-To: <20240614093026.328271-2-sai.pavan.boddu@amd.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 21 Jun 2024 16:42:43 +0100
Message-ID: <CAFEAcA-A8xuJza+B8K3-6go=BBY+n9ruy7_FpEMTZKqKFPn+3w@mail.gmail.com>
Subject: Re: [PATCH RFC 1/3] target/arm: Add dcc uart support
To: Sai Pavan Boddu <sai.pavan.boddu@amd.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>, francisco.iglesias@amd.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: vlxqp1FGVZHZ

On Fri, 14 Jun 2024 at 10:30, Sai Pavan Boddu <sai.pavan.boddu@amd.com> wrote:
>
> DCC is a debug port to transfer some data between debugger and
> processor, we are using this feature to connect a chardev device.
> Chardev frontends should be named as "dcc<cpu-index>" inorder to connect
> to this interface.
>
> Signed-off-by: Sai Pavan Boddu <sai.pavan.boddu@amd.com>
> ---
>  target/arm/cpu.h       | 11 +++++
>  target/arm/internals.h |  4 ++
>  target/arm/debug-dcc.c | 99 ++++++++++++++++++++++++++++++++++++++++++
>  target/arm/helper.c    |  3 ++
>  target/arm/meson.build |  1 +
>  5 files changed, 118 insertions(+)
>  create mode 100644 target/arm/debug-dcc.c
>
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index 3841359d0f..6b3cb8e70e 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -30,6 +30,8 @@
>  #include "qapi/qapi-types-common.h"
>  #include "target/arm/multiprocessing.h"
>  #include "target/arm/gtimer.h"
> +#include "chardev/char.h"
> +#include "chardev/char-fe.h"
>
>  #ifdef TARGET_AARCH64
>  #define KVM_HAVE_MCE_INJECTION 1
> @@ -523,6 +525,11 @@ typedef struct CPUArchState {
>
>          /* NV2 register */
>          uint64_t vncr_el2;
> +        /*
> +         * Debug Trace regsiters
> +         */
> +        uint32_t dbgdtr_tx;
> +        uint32_t dbgdtr_rx;
>      } cp15;
>
>      struct {
> @@ -1097,6 +1104,9 @@ struct ArchCPU {
>
>      /* Generic timer counter frequency, in Hz */
>      uint64_t gt_cntfrq_hz;
> +
> +    /* dcc chardev */
> +    CharBackend dcc;
>  };
>
>  typedef struct ARMCPUInfo {
> @@ -2388,6 +2398,7 @@ enum arm_features {
>       * CPU types added in future.
>       */
>      ARM_FEATURE_BACKCOMPAT_CNTFRQ, /* 62.5MHz timer default */
> +    ARM_FEATURE_DCC,

Generally speaking we want to avoid adding new ARM_FEATURE bits
if there's some way to identify the presence of the feature via
the ID registers. In this case, the debug registers always exist
as long as we have ARM_FEATURE_V7, I think. So I think we should
always provide this as part of the registers we define in
debug_cp_reginfo[] in debug_helper.c, rather than having a
separate feature bit.

>  };
>
>  static inline int arm_feature(CPUARMState *env, int feature)
> diff --git a/target/arm/internals.h b/target/arm/internals.h
> index 11b5da2562..2fa797c5df 100644
> --- a/target/arm/internals.h
> +++ b/target/arm/internals.h
> @@ -1778,4 +1778,8 @@ uint64_t gt_get_countervalue(CPUARMState *env);
>   * and CNTVCT_EL0 (this will be either 0 or the value of CNTVOFF_EL2).
>   */
>  uint64_t gt_virt_cnt_offset(CPUARMState *env);
> +/*
> + * Initialise Coresight Debug interface
> + */
> +void arm_dcc_init(ARMCPU *cpu);
>  #endif
> diff --git a/target/arm/debug-dcc.c b/target/arm/debug-dcc.c
> new file mode 100644
> index 0000000000..9144b54994
> --- /dev/null
> +++ b/target/arm/debug-dcc.c
> @@ -0,0 +1,99 @@
> +#include "qemu/osdep.h"
> +#include "cpu.h"
> +#include "internals.h"
> +#include "cpregs.h"
> +#include "chardev/char-fe.h"
> +
> +#define MDCCSR_EL0_RXFULL_MASK (1 << 30)
> +#define MDCCSR_EL0_TXFULL_MASK (1 << 29)
> +
> +static void debug_dcc_write(CPUARMState *env, const ARMCPRegInfo *ri,
> +                        uint64_t value)
> +{
> +    ARMCPU *cpu = ri->opaque;
> +    env->cp15.dbgdtr_tx = value;
> +
> +    if (qemu_chr_fe_get_driver(&cpu->dcc)) {

This is a weird function to have to call. Generally we set things
up so that you don't need to care if there's actually anything
connected to the chardev -- qemu_chr_fe_write() and friends will
do nothing if there's no chardev attached to this backend.

> +        /*
> +         * Usually dcc is used for putc/getc calls which expect only
> +         * 1 byte from external debugger.
> +         * TODO: This needs to be generalized for other use-cases.
> +         */

Is this referring to the way that the DCC is defined as a 64-bit
(or 32-bit for AArch32) channel but we're ignoring all but the bottom
8 bits of the values?

> +        qemu_chr_fe_write_all(&cpu->dcc, (uint8_t *)&env->cp15.dbgdtr_tx, 1);

The DCC has flow-control flags so we don't need to use _write_all, and
generally we should avoid that in new code because it might block.

> +    }
> +}
> +
> +static uint64_t debug_dcc_read(CPUARMState *env, const ARMCPRegInfo *ri)
> +{
> +    uint32_t ret = 0;
> +    ARMCPU *cpu = ri->opaque;
> +
> +    if (env->cp15.mdscr_el1 & MDCCSR_EL0_RXFULL_MASK) {
> +        ret = env->cp15.dbgdtr_rx;
> +        env->cp15.dbgdtr_rx = 0;
> +        env->cp15.mdscr_el1 &= ~MDCCSR_EL0_RXFULL_MASK;
> +        qemu_chr_fe_accept_input(&cpu->dcc);
> +    }
> +    return ret;
> +}
> +
> +static const ARMCPRegInfo dcc_cp_reginfo[] = {
> +    /* DBGDTRTX_EL0/DBGDTRRX_EL0 depend on direction */
> +    { .name = "DBGDTR_EL0", .state = ARM_CP_STATE_AA64,
> +      .opc0 = 2, .opc1 = 3, .crn = 0, .crm = 5, .opc2 = 0,
> +      .access = PL0_RW, .writefn = debug_dcc_write,
> +      .readfn = debug_dcc_read,
> +      .type = ARM_CP_OVERRIDE, .resetvalue = 0 },
> +    /* DBGDTRTXint/DBGDTRRXint depend on direction */
> +    { .name = "DBGDTRint", .state = ARM_CP_STATE_AA32, .cp = 14,
> +      .opc1 = 0, .crn = 0, .crm = 5, .opc2 = 0,
> +      .access = PL0_RW, .writefn = debug_dcc_write,
> +      .readfn = debug_dcc_read,
> +      .type = ARM_CP_OVERRIDE, .resetvalue = 0 },
> +};

Other registers that need updates for a real DCC:
 * MDCCSR_EL0
 * OSDTRRX_EL1
 * OSDTRTX_EL1

(all of which we currently have dummy versions of in
debug_helper.c).

> +
> +
> +static int dcc_chr_can_read(void *opaque)
> +{
> +    ARMCPU *cpu = opaque;
> +    CPUARMState *env = &cpu->env;
> +
> +    if (!(env->cp15.mdscr_el1 & MDCCSR_EL0_RXFULL_MASK)) {
> +        /*
> +         * Usually dcc is used for putc/getc calls which expect only
> +         * 1 byte from external debugger.
> +         * TODO: This needs to be generalized for other use-cases.
> +         */
> +        return 1;
> +    }
> +
> +    return 0;
> +}
> +
> +static void dcc_chr_read(void *opaque, const uint8_t *buf, int size)
> +{
> +    ARMCPU *cpu = opaque;
> +    CPUARMState *env = &cpu->env;
> +
> +    env->cp15.dbgdtr_rx = *buf;
> +    env->cp15.mdscr_el1 |= MDCCSR_EL0_RXFULL_MASK;
> +}
> +
> +void arm_dcc_init(ARMCPU *cpu)
> +{
> +    Chardev *chr;
> +    char *dcc_name;
> +    CPUState *p = CPU(cpu);
> +
> +    dcc_name = g_strdup_printf("dcc%d", p->cpu_index);
> +    chr = qemu_chr_find(dcc_name);
> +    define_arm_cp_regs_with_opaque(cpu, dcc_cp_reginfo, cpu);
> +    if (chr) {
> +        qemu_chr_fe_init(&cpu->dcc, chr, NULL);
> +        qemu_chr_fe_set_handlers(&cpu->dcc,
> +                      dcc_chr_can_read,
> +                      dcc_chr_read,
> +                      NULL, NULL, cpu, NULL, true);
> +    }
> +    g_free(dcc_name);
> +}

thanks
-- PMM
