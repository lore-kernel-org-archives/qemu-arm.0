Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E207CC55171
	for <qemu-arm@archiver.kernel.org>; Sun,  2 Aug 2026 14:07:22 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wqWqD-00063o-V0; Sun, 02 Aug 2026 10:07:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wqWq9-00063O-Ml
 for qemu-arm@nongnu.org; Sun, 02 Aug 2026 10:06:58 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wqWq7-0004g6-LB
 for qemu-arm@nongnu.org; Sun, 02 Aug 2026 10:06:57 -0400
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 672B6lVT1506704
 for <qemu-arm@nongnu.org>; Sun, 2 Aug 2026 14:06:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 rhzeq6/ebDyJeaYPdcIfh/T+qVdtjxo/dK29lb0KXvg=; b=l7Cdml8xuj+NlZ5o
 iyU2JtCFzOG7KmJmn3eHerGb4+F1dgWZorVAMisn5wctHJ1PepqbfZIQUW1jHc8H
 jKJ3lR3UcQkAnFAz7PAlmJg140YhPC38KVjxqUr7rQICAOZxdKHSKz5lx532s+VP
 C+V6kQHIxJMNxpmesaV7uqZeIENF+z2WaRoVhI6fCEVlKKMsi1+KSszpZF60qkUx
 3+wPrFky2CANm6p6CzqILJdUpgcIwZRnC3ZmMfX0jDKw9sSSDQUFfi2cnWHBU1iR
 BGKQB5lYKaLWK/2QVBI62boB1rOvVo8cV31wJX+AvTcpDN6Np+1xiOHsWMWGmmEk
 U1ehUg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fs8u9axnq-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Sun, 02 Aug 2026 14:06:53 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-51c01ff996dso24569351cf.2
 for <qemu-arm@nongnu.org>; Sun, 02 Aug 2026 07:06:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1785679612; x=1786284412; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=rhzeq6/ebDyJeaYPdcIfh/T+qVdtjxo/dK29lb0KXvg=;
 b=ffpNQOhyDJXSEPxLREQ9B36tm8JCglceuhOcBtkcgRd3WscNYFT7lblbSc/5+otWvb
 cd6ubF8axW3rNBy13Nq5/3AnjXndhJqaDtlu1tGnE+Ua0CLNTb5nO2xFxoQc4R0n5QFf
 HZgpfOlcS3wlcBfsMcG/yEc63gUhLSwdTfymWJ8S1QSMcvGL0iQa6d8FkoriLoGWYZhU
 HfRfqkxUhUw8A+46SYR2Cz7P4/oW8QEk3gsp2JA3IiDMN2oHK64yGtKXUautB2wh0OUc
 UFdybGH3fXf9eLxZf9sDYWPylJVxwjsfcYppGHIvuEJY646oe4eXkzspVd8JyXWV8yJo
 LFKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785679612; x=1786284412;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=rhzeq6/ebDyJeaYPdcIfh/T+qVdtjxo/dK29lb0KXvg=;
 b=mUnGKtxgbHcTinaNJxS7uJEnh+Iy6kLA7GtPLMt/Ta0hukXb+0cGrmOp/ZQk9k8fDZ
 1DFquhCYIcMcJh+dtfEG68A7TuRtvK0I76gERT4V8xW5rRqmY2n/r6+h5uSqY4GiIRJY
 r4Xlu9afEvkr7gKOm7Nl/z9mdpxbK5ci5FukFkxwBXZcQod/83k+FBzJMgMZcz13eW7k
 My5QZAYJVF2KjTPFddF8K7wvnxwcilVMs/DAa98u3sm8rFbA3zSZop6iyqydQCXr1mdr
 S+WGrfa3ipcV8IOzZGFAJvOcx1u+MIxobhR5Q+3L4JkwlzPJQvDonWQWMh6uB7WYp98t
 2HJg==
X-Forwarded-Encrypted: i=1;
 AHgh+Rqq2NPGXHp9igaCIUlh77ja/wSrYhx7NLGMSzdPua5j5Lh0ZeLr0oql/5fUzGsjZE5qbPbbTmpoOQ==@nongnu.org
X-Gm-Message-State: AOJu0YxSlsoxM13e9QiNL9qLgqwtkw1jczVxwHGOfa0jJ2o1O6KWmprT
 JNXAy2M5/IXTdm+E4LaSKh2it3wSrI+C1HtMbdMQUBXwdiI248IjGvChJEB0Jpilx+kJYf1XBqn
 yqoah2quTi5q8SST5P0rx+Unv8M5AYGYmZ7B0cNBoSi8uXYeI9K2ayms=
X-Gm-Gg: AR+sD11MEaF5a3j2vC2FzkNESAqoaXXC04DZKyc+fvLfLf3er77qPnlr+R3Fn2A+vt+
 XcMW2ngT+INpYC37v1jpAkll1STiH3h9OWG+3gp3QFKiG6I7bpx+GPr8joVIAyCwQhleGKHdpAJ
 j7B30KXinnjdazhee4y4NSb824L6u1M2GL3LQNnuyFAyjL8zFV+dtgSYV+4yHhS4D2yGz2UPXHs
 aYITy8eh/40cHZGGIIsrRbpnybyBrSg3bdXdhCQIuYXOnmnP566VXniyCm65piN8DFIYDPnDEe4
 1yYgUzIdQrispsQM3u1yW7zn3jkDndN3jgVjQxQK4SIz5iv6vQY4U7cRUjUUb4KrlpqehIXnC/Q
 zxWYEbNBrRxi21XAfzV+RwfXgLH+dNQ25cyKYZGN2L9GtO0BwI08=
X-Received: by 2002:ac8:6f16:0:b0:528:3b9b:4f53 with SMTP id
 d75a77b69052e-52b566afa65mr142055771cf.16.1785679612240; 
 Sun, 02 Aug 2026 07:06:52 -0700 (PDT)
X-Received: by 2002:ac8:6f16:0:b0:528:3b9b:4f53 with SMTP id
 d75a77b69052e-52b566afa65mr142054941cf.16.1785679611779; 
 Sun, 02 Aug 2026 07:06:51 -0700 (PDT)
Received: from [192.168.69.212] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47fd456a6d7sm24826130f8f.19.2026.08.02.07.06.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 02 Aug 2026 07:06:51 -0700 (PDT)
Message-ID: <5738bb90-f78d-44c2-9253-7bde9bf635ef@oss.qualcomm.com>
Date: Sun, 2 Aug 2026 16:06:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Qemu-devel] [PULL 20/24] target-arm/powerctl: defer cpu reset
 work to CPU context
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, peter.maydell@linaro.org,
 "open list:ARM" <qemu-arm@nongnu.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>
References: <20170224112109.3147-1-alex.bennee@linaro.org>
 <20170224112109.3147-21-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20170224112109.3147-21-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: U1EmSDlS4j0wylsiBVYzFYnR985W0Egw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAyMDEyNSBTYWx0ZWRfX9zpECJG9uSR9
 eBFWqK1bCMN47xiTPzCvI2w6/jEF0V740zq9Saj0S+kfp26KCrUUUmIiKfbr01EOCvVdoDd2eCv
 TwJoCKCwBNwqMY0orM+RpU5pE2lwn38lvc1EENqqkFKnAOjuhCbtefAO5UzOQZikC0yU0XjXhmV
 YrqnZSu0Y1BXF5+j1JZnskXkrmySh6hKFQ0AyNSc9ZIGxiskZf/OBvekVlXR9JCt9C1fdkkIGRt
 a0k3pmjaIuZ1pujfBcqL46v1sZNNqAp4UJACpihC8wjxrd2N0385IWCbkTfi1tX+Y2pUB2NgKgg
 acREv/nFoUg1tszBvlvPpZl3/vGQszGXJ8xJAha5K0HDMZbAwpkXlhW6E7F6qv5LQcBpACEA0Ry
 kgp91kaoKdutI5zKfRyy5AjPEr/oWzKRZG+r7N0HRajHyTh1H7Z1JIW8B5kFCsEulogfuLL1MCv
 E+lRXaivBRY+GhrQG1w==
X-Authority-Analysis: v=2.4 cv=LsCiDHdc c=1 sm=1 tr=0 ts=6a6f4efd cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=KKAkSRfTAAAA:8 a=rWkr9Ua9AAAA:8 a=dVG45nXhEZL_2GfGWOUA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22 a=cvBusfyB2V15izCimMoJ:22
 a=Qv-QrLrHZjTXZfLJ-zom:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAyMDEyNSBTYWx0ZWRfX9HJzHqvIdJLF
 T7R43vjjQATLhSYyNsDhfvRYpWEEMHRDFkKRL0rO91icQqRb98DQNi2K6NTyt5eyLvmZ7R6Kv/T
 nfCfmIHpM6ufJtKDWaIG1Fn6YR2vBp4=
X-Proofpoint-ORIG-GUID: U1EmSDlS4j0wylsiBVYzFYnR985W0Egw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-02_04,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 spamscore=0 adultscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608020125
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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

Hi Alex,

(old patch now committed as 062ba099e01ff1474be98c0a4f3da351efab5d9d)

On 24/2/17 12:21, Alex Bennée wrote:
> When switching a new vCPU on we want to complete a bunch of the setup
> work before we start scheduling the vCPU thread. To do this cleanly we
> defer vCPU setup to async work which will run the vCPUs execution
> context as the thread is woken up. The scheduling of the work will kick
> the vCPU awake.
> 
> This avoids potential races in MTTCG system emulation.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Reviewed-by: Richard Henderson <rth@twiddle.net>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   target/arm/arm-powerctl.c | 202 +++++++++++++++++++++++++++++++---------------
>   target/arm/arm-powerctl.h |   2 +
>   target/arm/cpu.c          |   4 +-
>   target/arm/cpu.h          |  15 +++-
>   target/arm/kvm.c          |   7 +-
>   target/arm/machine.c      |  41 +++++++++-
>   target/arm/psci.c         |   4 +-
>   7 files changed, 201 insertions(+), 74 deletions(-)
> 
> diff --git a/target/arm/arm-powerctl.c b/target/arm/arm-powerctl.c
> index fbb7a15daa..25207cb850 100644
> --- a/target/arm/arm-powerctl.c
> +++ b/target/arm/arm-powerctl.c
> @@ -14,6 +14,7 @@
>   #include "internals.h"
>   #include "arm-powerctl.h"
>   #include "qemu/log.h"
> +#include "qemu/main-loop.h"
>   #include "exec/exec-all.h"
>   
>   #ifndef DEBUG_ARM_POWERCTL
> @@ -48,11 +49,93 @@ CPUState *arm_get_cpu_by_id(uint64_t id)
>       return NULL;
>   }
>   
> +struct CpuOnInfo {
> +    uint64_t entry;
> +    uint64_t context_id;
> +    uint32_t target_el;
> +    bool target_aa64;
> +};
> +
> +
> +static void arm_set_cpu_on_async_work(CPUState *target_cpu_state,
> +                                      run_on_cpu_data data)
> +{
> +    ARMCPU *target_cpu = ARM_CPU(target_cpu_state);
> +    struct CpuOnInfo *info = (struct CpuOnInfo *) data.host_ptr;
> +
> +    /* Initialize the cpu we are turning on */
> +    cpu_reset(target_cpu_state);
> +    target_cpu_state->halted = 0;
> +
> +    if (info->target_aa64) {
> +        if ((info->target_el < 3) && arm_feature(&target_cpu->env,
> +                                                 ARM_FEATURE_EL3)) {
> +            /*
> +             * As target mode is AArch64, we need to set lower
> +             * exception level (the requested level 2) to AArch64
> +             */
> +            target_cpu->env.cp15.scr_el3 |= SCR_RW;
> +        }
> +
> +        if ((info->target_el < 2) && arm_feature(&target_cpu->env,
> +                                                 ARM_FEATURE_EL2)) {
> +            /*
> +             * As target mode is AArch64, we need to set lower
> +             * exception level (the requested level 1) to AArch64
> +             */
> +            target_cpu->env.cp15.hcr_el2 |= HCR_RW;
> +        }
> +
> +        target_cpu->env.pstate = aarch64_pstate_mode(info->target_el, true);
> +    } else {
> +        /* We are requested to boot in AArch32 mode */
> +        static const uint32_t mode_for_el[] = { 0,
> +                                                ARM_CPU_MODE_SVC,
> +                                                ARM_CPU_MODE_HYP,
> +                                                ARM_CPU_MODE_SVC };
> +
> +        cpsr_write(&target_cpu->env, mode_for_el[info->target_el], CPSR_M,
> +                   CPSRWriteRaw);
> +    }
> +
> +    if (info->target_el == 3) {
> +        /* Processor is in secure mode */
> +        target_cpu->env.cp15.scr_el3 &= ~SCR_NS;
> +    } else {
> +        /* Processor is not in secure mode */
> +        target_cpu->env.cp15.scr_el3 |= SCR_NS;
> +    }
> +
> +    /* We check if the started CPU is now at the correct level */
> +    assert(info->target_el == arm_current_el(&target_cpu->env));
> +
> +    if (info->target_aa64) {
> +        target_cpu->env.xregs[0] = info->context_id;
> +        target_cpu->env.thumb = false;
> +    } else {
> +        target_cpu->env.regs[0] = info->context_id;
> +        target_cpu->env.thumb = info->entry & 1;
> +        info->entry &= 0xfffffffe;
> +    }
> +
> +    /* Start the new CPU at the requested address */
> +    cpu_set_pc(target_cpu_state, info->entry);
> +
> +    g_free(info);
> +
> +    /* Finally set the power status */
> +    assert(qemu_mutex_iothread_locked());
> +    target_cpu->power_state = PSCI_ON;
> +}
> +
>   int arm_set_cpu_on(uint64_t cpuid, uint64_t entry, uint64_t context_id,
>                      uint32_t target_el, bool target_aa64)
>   {
>       CPUState *target_cpu_state;
>       ARMCPU *target_cpu;
> +    struct CpuOnInfo *info;
> +
> +    assert(qemu_mutex_iothread_locked());

Why enforce the caller hold the BQL? This isn't documented in the
method docstring. We are queuing async work at the end anyway with
async_run_on_cpu().

My understanding is taking the BQL was required to have this method
safe with MTTCG, but since you also converted to move the racy code
to an async work queued function, it is not necessary anymore.

If there is a justification for it, wouldn't it be simpler to have
the callee take the BQL?

Thanks,

Phil.

>   
>       DPRINTF("cpu %" PRId64 " (EL %d, %s) @ 0x%" PRIx64 " with R0 = 0x%" PRIx64
>               "\n", cpuid, target_el, target_aa64 ? "aarch64" : "aarch32", entry,
> @@ -77,7 +160,7 @@ int arm_set_cpu_on(uint64_t cpuid, uint64_t entry, uint64_t context_id,
>       }
>   
>       target_cpu = ARM_CPU(target_cpu_state);
> -    if (!target_cpu->powered_off) {
> +    if (target_cpu->power_state == PSCI_ON) {
>           qemu_log_mask(LOG_GUEST_ERROR,
>                         "[ARM]%s: CPU %" PRId64 " is already on\n",
>                         __func__, cpuid);
> @@ -109,74 +192,54 @@ int arm_set_cpu_on(uint64_t cpuid, uint64_t entry, uint64_t context_id,
>           return QEMU_ARM_POWERCTL_INVALID_PARAM;
>       }
>   
> -    /* Initialize the cpu we are turning on */
> -    cpu_reset(target_cpu_state);
> -    target_cpu->powered_off = false;
> -    target_cpu_state->halted = 0;
> -
> -    if (target_aa64) {
> -        if ((target_el < 3) && arm_feature(&target_cpu->env, ARM_FEATURE_EL3)) {
> -            /*
> -             * As target mode is AArch64, we need to set lower
> -             * exception level (the requested level 2) to AArch64
> -             */
> -            target_cpu->env.cp15.scr_el3 |= SCR_RW;
> -        }
> -
> -        if ((target_el < 2) && arm_feature(&target_cpu->env, ARM_FEATURE_EL2)) {
> -            /*
> -             * As target mode is AArch64, we need to set lower
> -             * exception level (the requested level 1) to AArch64
> -             */
> -            target_cpu->env.cp15.hcr_el2 |= HCR_RW;
> -        }
> -
> -        target_cpu->env.pstate = aarch64_pstate_mode(target_el, true);
> -    } else {
> -        /* We are requested to boot in AArch32 mode */
> -        static uint32_t mode_for_el[] = { 0,
> -                                          ARM_CPU_MODE_SVC,
> -                                          ARM_CPU_MODE_HYP,
> -                                          ARM_CPU_MODE_SVC };
> -
> -        cpsr_write(&target_cpu->env, mode_for_el[target_el], CPSR_M,
> -                   CPSRWriteRaw);
> -    }
> -
> -    if (target_el == 3) {
> -        /* Processor is in secure mode */
> -        target_cpu->env.cp15.scr_el3 &= ~SCR_NS;
> -    } else {
> -        /* Processor is not in secure mode */
> -        target_cpu->env.cp15.scr_el3 |= SCR_NS;
> -    }
> -
> -    /* We check if the started CPU is now at the correct level */
> -    assert(target_el == arm_current_el(&target_cpu->env));
> -
> -    if (target_aa64) {
> -        target_cpu->env.xregs[0] = context_id;
> -        target_cpu->env.thumb = false;
> -    } else {
> -        target_cpu->env.regs[0] = context_id;
> -        target_cpu->env.thumb = entry & 1;
> -        entry &= 0xfffffffe;
> +    /*
> +     * If another CPU has powered the target on we are in the state
> +     * ON_PENDING and additional attempts to power on the CPU should
> +     * fail (see 6.6 Implementation CPU_ON/CPU_OFF races in the PSCI
> +     * spec)
> +     */
> +    if (target_cpu->power_state == PSCI_ON_PENDING) {
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                      "[ARM]%s: CPU %" PRId64 " is already powering on\n",
> +                      __func__, cpuid);
> +        return QEMU_ARM_POWERCTL_ON_PENDING;
>       }
>   
> -    /* Start the new CPU at the requested address */
> -    cpu_set_pc(target_cpu_state, entry);
> +    /* To avoid racing with a CPU we are just kicking off we do the
> +     * final bit of preparation for the work in the target CPUs
> +     * context.
> +     */
> +    info = g_new(struct CpuOnInfo, 1);
> +    info->entry = entry;
> +    info->context_id = context_id;
> +    info->target_el = target_el;
> +    info->target_aa64 = target_aa64;
>   
> -    qemu_cpu_kick(target_cpu_state);
> +    async_run_on_cpu(target_cpu_state, arm_set_cpu_on_async_work,
> +                     RUN_ON_CPU_HOST_PTR(info));
>   
>       /* We are good to go */
>       return QEMU_ARM_POWERCTL_RET_SUCCESS;
>   }
>   
> +static void arm_set_cpu_off_async_work(CPUState *target_cpu_state,
> +                                       run_on_cpu_data data)
> +{
> +    ARMCPU *target_cpu = ARM_CPU(target_cpu_state);
> +
> +    assert(qemu_mutex_iothread_locked());
> +    target_cpu->power_state = PSCI_OFF;
> +    target_cpu_state->halted = 1;
> +    target_cpu_state->exception_index = EXCP_HLT;
> +}
> +
>   int arm_set_cpu_off(uint64_t cpuid)
>   {
>       CPUState *target_cpu_state;
>       ARMCPU *target_cpu;
>   
> +    assert(qemu_mutex_iothread_locked());
> +
>       DPRINTF("cpu %" PRId64 "\n", cpuid);
>   
>       /* change to the cpu we are powering up */
> @@ -185,27 +248,34 @@ int arm_set_cpu_off(uint64_t cpuid)
>           return QEMU_ARM_POWERCTL_INVALID_PARAM;
>       }
>       target_cpu = ARM_CPU(target_cpu_state);
> -    if (target_cpu->powered_off) {
> +    if (target_cpu->power_state == PSCI_OFF) {
>           qemu_log_mask(LOG_GUEST_ERROR,
>                         "[ARM]%s: CPU %" PRId64 " is already off\n",
>                         __func__, cpuid);
>           return QEMU_ARM_POWERCTL_IS_OFF;
>       }
>   
> -    target_cpu->powered_off = true;
> -    target_cpu_state->halted = 1;
> -    target_cpu_state->exception_index = EXCP_HLT;
> -    cpu_loop_exit(target_cpu_state);
> -    /* notreached */
> +    /* Queue work to run under the target vCPUs context */
> +    async_run_on_cpu(target_cpu_state, arm_set_cpu_off_async_work,
> +                     RUN_ON_CPU_NULL);
>   
>       return QEMU_ARM_POWERCTL_RET_SUCCESS;
>   }
>   
> +static void arm_reset_cpu_async_work(CPUState *target_cpu_state,
> +                                     run_on_cpu_data data)
> +{
> +    /* Reset the cpu */
> +    cpu_reset(target_cpu_state);
> +}
> +
>   int arm_reset_cpu(uint64_t cpuid)
>   {
>       CPUState *target_cpu_state;
>       ARMCPU *target_cpu;
>   
> +    assert(qemu_mutex_iothread_locked());
> +
>       DPRINTF("cpu %" PRId64 "\n", cpuid);
>   
>       /* change to the cpu we are resetting */
> @@ -214,15 +284,17 @@ int arm_reset_cpu(uint64_t cpuid)
>           return QEMU_ARM_POWERCTL_INVALID_PARAM;
>       }
>       target_cpu = ARM_CPU(target_cpu_state);
> -    if (target_cpu->powered_off) {
> +
> +    if (target_cpu->power_state == PSCI_OFF) {
>           qemu_log_mask(LOG_GUEST_ERROR,
>                         "[ARM]%s: CPU %" PRId64 " is off\n",
>                         __func__, cpuid);
>           return QEMU_ARM_POWERCTL_IS_OFF;
>       }
>   
> -    /* Reset the cpu */
> -    cpu_reset(target_cpu_state);
> +    /* Queue work to run under the target vCPUs context */
> +    async_run_on_cpu(target_cpu_state, arm_reset_cpu_async_work,
> +                     RUN_ON_CPU_NULL);
>   
>       return QEMU_ARM_POWERCTL_RET_SUCCESS;
>   }
> diff --git a/target/arm/arm-powerctl.h b/target/arm/arm-powerctl.h
> index 98ee04989b..04353923c0 100644
> --- a/target/arm/arm-powerctl.h
> +++ b/target/arm/arm-powerctl.h
> @@ -17,6 +17,7 @@
>   #define QEMU_ARM_POWERCTL_INVALID_PARAM QEMU_PSCI_RET_INVALID_PARAMS
>   #define QEMU_ARM_POWERCTL_ALREADY_ON QEMU_PSCI_RET_ALREADY_ON
>   #define QEMU_ARM_POWERCTL_IS_OFF QEMU_PSCI_RET_DENIED
> +#define QEMU_ARM_POWERCTL_ON_PENDING QEMU_PSCI_RET_ON_PENDING
>   
>   /*
>    * arm_get_cpu_by_id:
> @@ -43,6 +44,7 @@ CPUState *arm_get_cpu_by_id(uint64_t cpuid);
>    * Returns: QEMU_ARM_POWERCTL_RET_SUCCESS on success.
>    * QEMU_ARM_POWERCTL_INVALID_PARAM if bad parameters are provided.
>    * QEMU_ARM_POWERCTL_ALREADY_ON if the CPU was already started.
> + * QEMU_ARM_POWERCTL_ON_PENDING if the CPU is still powering up
>    */
>   int arm_set_cpu_on(uint64_t cpuid, uint64_t entry, uint64_t context_id,
>                      uint32_t target_el, bool target_aa64);


