Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B2F6CD4F54
	for <qemu-arm@archiver.kernel.org>; Fri, 29 May 2026 18:33:28 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wT21B-000355-RJ; Fri, 29 May 2026 14:33:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wT210-0002v2-Ux
 for qemu-arm@nongnu.org; Fri, 29 May 2026 14:33:03 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wT20y-0008IQ-NE
 for qemu-arm@nongnu.org; Fri, 29 May 2026 14:33:02 -0400
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 64TI2Igu1912256
 for <qemu-arm@nongnu.org>; Fri, 29 May 2026 18:32:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 nzDfJflnY7niPY39DVPah9WcdVeoxqqcSGibMMC2R2U=; b=X5Gjv0OzIlKCRCuz
 o74u+xyPw43HCkwUyn0d30iUBIBuDBPSXaBy06oCKcmyW7BtE7UuGV4AXCF2k78Q
 hvdOkz8VQjixXU/zEnTOsL/UlGN+OptvUGctRSfN4u702Br1C5X/d8ODnt9lotGl
 LcQZrrZUiQ2McTF+OQvKch0OujbczCUyKYpbB4PZZqo67FzQAHEIAY/kHaOUmIx7
 X33N4hgMsOge7NwrA6T9RgdcVsV8Mpnssa+OWrKk1/cylIQ1aoD//vVYC9QlaGfa
 qvcotdZWvLz2jJlLJ9SGQf7aeDT1opLXrelFRl4bx0MhsmBk6ocZA8p7LmVbkjYn
 +2eNUg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com
 [74.125.82.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4efbu51qwk-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Fri, 29 May 2026 18:32:59 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id
 5a478bee46e88-2fe1cf409a1so4523479eec.1
 for <qemu-arm@nongnu.org>; Fri, 29 May 2026 11:32:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1780079578; x=1780684378; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=nzDfJflnY7niPY39DVPah9WcdVeoxqqcSGibMMC2R2U=;
 b=Ho3i0cyu/CDQzh1PVxyQkJzlaZGsbgHC37RjV383vfbEtJoFY2Z6Vc0GZeCGhl84Im
 v3Nd5y6HCVu+tsp3jjiXadhosi8cZbB49wjNPLQ6I3/9S/2Mh4BhM245syPDfSj8pFJK
 fij6y1bcfX0jEuBiVD+PkDlzgGrSnBwySRySSv4nEvIknRn/qLHsxyxN/vHXUlhpKDfF
 YdOihrxLe95uwkrKW55Hj5gOlrWVYFGuX1RkGyEqb3Z6bc/UtuQfh+tDQpo3dHd7m2kR
 1Qe/FCs7Gmr4PhIXMtm9We8QbqE0Sdb7vI4vI0fPUECzWjW+PMykZM5pWBau+NHiyRPV
 tCrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780079578; x=1780684378;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nzDfJflnY7niPY39DVPah9WcdVeoxqqcSGibMMC2R2U=;
 b=kHDWZTOtTBmVw+Tia3eliosQ+rwfmw5Q+B0fQ8bu5p5ILqrQN6/u5WKWovdKnlaBaD
 4HOhpr0GlxR6jLeIhBusxz3UOxMba4YcPhw8WiBayGphiubbp1qOSLF5M2rpzSZozHIe
 UuJhZ26oOTo3urmq/agWK78phaWoSCeoeDAGqsyU68SazrDZ7tEgeWbLRTW2S7PvNTEz
 sFWaXk4a2g7v0kdFTpKp06ECclVMR1deYOZiZq+WzDgNlJ1Cb0y2DoqwvOb89yeQPa/v
 xQcZ0NOB4kYED5ZvQjvcx6K9HNiT1c5gKmgwtL7EwY57Hvx7fMJyB99Gmq9JzA7oDRqE
 UjWA==
X-Forwarded-Encrypted: i=1;
 AFNElJ85Hy7BwyzGhM+sQHv1Tq6OHetfbepcCFciOxM6ZNMyNree8r/sPPStcPUeUC3iNq8lb9o9+PlIgQ==@nongnu.org
X-Gm-Message-State: AOJu0YxnjP9LTJSb4eILZ1grIsKnJ1eOLvtHl97TReCAthzWKBe6OueE
 xDGjcOyJXSsRpOlWFigkMUqhdLdv1NKlx8Lp81lWmbw2KvY3VfGzjOYOVoxQ8FOZAELgDIGfBqY
 7ahZNjGczEwBpfTeQzPpfM++/ctdoL7WLSFZ7i+C/v4i+cleQID79FE8=
X-Gm-Gg: Acq92OFenqA6yhKxtowHuwr5r+1zM3hEb+xZWHomosT/d189ZPCN2wYXuAB09TYv3/V
 mDuYRPaOikjTwCMGQH6wkRzuJWNF6RNS/9RQXDoDv9KjvoiNI0CJHMEhtj1ZCFCRwAkADswEJN3
 0TJoiZMjH/57eXW4zTWuHY5OOfYBBDo/AjSx0Z93sOUESvNP+s37p4ZVxpkgdxAgguqk8k04BSX
 MIj99CUScSi/Ws5YQyAlcZ2P9J/6uKxJlH6oM4RIrerlrGwHfJeTSxw7eKP0dvhlJk+pLyIH1+k
 MDR7mrSURFv4eubkSEgZeM934/gCR+09a9MfSzXsM12jUjq2kEgW3uTmEzzUm6ovAPo1bFm/1Uh
 NZa7X/oFGKcbrJDxH0TxHDeOprJIQH0fXnvQ5HoaE551cQdEr0mleNdYvDCrjaJldt/mS62tIE8
 UOG0LGe1+r2mAGQGFh+MptHNK3
X-Received: by 2002:a05:7022:b89:b0:12b:f8d6:d4bc with SMTP id
 a92af1059eb24-137d429c8cemr372065c88.34.1780079578368; 
 Fri, 29 May 2026 11:32:58 -0700 (PDT)
X-Received: by 2002:a05:7022:b89:b0:12b:f8d6:d4bc with SMTP id
 a92af1059eb24-137d429c8cemr372048c88.34.1780079577805; 
 Fri, 29 May 2026 11:32:57 -0700 (PDT)
Received: from [192.168.1.170] (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-137b36aef95sm1649548c88.4.2026.05.29.11.32.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 May 2026 11:32:57 -0700 (PDT)
Message-ID: <179357ae-8d50-49e5-abc5-8abf670be847@oss.qualcomm.com>
Date: Fri, 29 May 2026 11:32:55 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/17] accel/kvm: Remove need for
 AccelCPUClass::cpu_target_realize
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Reinoud Zandijk <reinoud@netbsd.org>,
 Pedro Barbuda <pbarbuda@microsoft.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 Glenn Miles <milesg@linux.ibm.com>, Alexander Graf <agraf@csgraf.de>,
 Peter Maydell <peter.maydell@linaro.org>,
 Marcelo Tosatti <mtosatti@redhat.com>, qemu-arm@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Roman Bolshakov <rbolshakov@ddn.com>, Anton Johansson <anjo@rev.ng>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Song Gao <gaosong@loongson.cn>,
 qemu-riscv@nongnu.org, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Phil Dennis-Jordan <phil@philjordan.eu>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-ppc@nongnu.org,
 Weiwei Li <liwei1518@gmail.com>, Chao Liu <chao.liu.zevorn@gmail.com>,
 kvm@vger.kernel.org, Claudio Fontana <cfontana@suse.de>,
 Chinmay Rath <rathc@linux.ibm.com>,
 Mohamed Mediouni <mohamed@unpredictable.fr>
References: <20260529142434.87880-1-philmd@linaro.org>
 <20260529142434.87880-6-philmd@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260529142434.87880-6-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=SMRykuvH c=1 sm=1 tr=0 ts=6a19dbdb cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=iLqgmErQAxjCjdq5jj1Aqg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=tWnGTKlWpr7XSlU29EEA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=PxkB5W3o20Ba91AHUih5:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: fmznrud3dpzI1Fb2yXe6sFzytwxmZR6Y
X-Proofpoint-ORIG-GUID: fmznrud3dpzI1Fb2yXe6sFzytwxmZR6Y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI5MDE4NSBTYWx0ZWRfX3WP+eB19TBj6
 3Yu5FKj78D9+rJsM5MdW+mRWD+sF3XPXBLCnI5ROMiyd0gx+L8ZAqIQvAnbeS+L1II0GYMoExnk
 hlseuLjQ/a963BT+EUX1RSWqrvmD/aKhcNOiSp/eskQx5AN6jQ/OsUb9aj3AFS8i854Ji3bldY8
 dhvLRwQUL8XTlnGnIGDIjUd2Sys/Xc5xNYTZlb9tk339Wtik+eaXqC939JunqazjWNqSnxViN3i
 gZma4jz2PvI3M3YiQefIzRrPZOKfRuyByyWQCGMjAqg+ekN8KfZdHrhrpyYxsft8M0jZELGpXhL
 Hxwvart66eVWXRbOXFr6g7YNXT6hpxiQa2aJ9WFPFR5n22qWssDYj6TqBP9QxLycJBMgWEiWCCr
 /AXgPmFILhcu9wE0oO/0I8pP6bxCnB0xiu6eylafGQZUB0ukkfSuSKOUIyV125r3n1dvBlDls3J
 X/9hq+wXLL2km57HF9A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-29_05,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1015
 phishscore=0 impostorscore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605290185
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=pierrick.bouvier@oss.qualcomm.com;
 helo=mx0a-0031df01.pphosted.com
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

On 5/29/2026 7:24 AM, Philippe Mathieu-Daudé wrote:
> accel_cpu_common_realize() first calls accel_cpu->cpu_target_realize
> then ops->cpu_realize.
> 
> Rather than having one handler for each host architecture, use a
> single host-specific method (prefixed with kvm_arch_* like other
> similar KVM methods). Register it once as AccelOpsClass
> cpu_target_realize handler.
> 
> PPC's ACCEL_CPU_NAME("kvm") TypeInfo is  now empty, remove it.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>  include/system/kvm.h       |  2 ++
>  accel/kvm/kvm-accel-ops.c  |  1 +
>  target/i386/kvm/kvm-cpu.c  |  3 +--
>  target/ppc/kvm.c           | 23 +----------------------
>  target/riscv/kvm/kvm-cpu.c | 10 +---------
>  5 files changed, 6 insertions(+), 33 deletions(-)
> 
> diff --git a/include/system/kvm.h b/include/system/kvm.h
> index 5fa33eddda3..fd7175ea9f5 100644
> --- a/include/system/kvm.h
> +++ b/include/system/kvm.h
> @@ -364,6 +364,8 @@ int kvm_arch_pre_create_vcpu(CPUState *cpu, Error **errp);
>  int kvm_arch_init_vcpu(CPUState *cpu);
>  int kvm_arch_destroy_vcpu(CPUState *cpu);
>  
> +bool kvm_arch_cpu_realize(CPUState *cpu, Error **errp);
> +
>  #ifdef TARGET_KVM_HAVE_RESET_PARKED_VCPU
>  void kvm_arch_reset_parked_vcpu(unsigned long vcpu_id, int kvm_fd);
>  #else
> diff --git a/accel/kvm/kvm-accel-ops.c b/accel/kvm/kvm-accel-ops.c
> index 6d9140e549f..4294c7a9514 100644
> --- a/accel/kvm/kvm-accel-ops.c
> +++ b/accel/kvm/kvm-accel-ops.c
> @@ -97,6 +97,7 @@ static void kvm_accel_ops_class_init(ObjectClass *oc, const void *data)
>      AccelOpsClass *ops = ACCEL_OPS_CLASS(oc);
>  
>      ops->create_vcpu_thread = kvm_start_vcpu_thread;
> +    ops->cpu_target_realize = kvm_arch_cpu_realize;

cpu_realize

>      ops->cpu_thread_is_idle = kvm_vcpu_thread_is_idle;
>      ops->cpus_are_resettable = kvm_cpus_are_resettable;
>      ops->synchronize_post_reset = kvm_cpu_synchronize_post_reset;
> diff --git a/target/i386/kvm/kvm-cpu.c b/target/i386/kvm/kvm-cpu.c
> index c34d9f15c7e..36634ec8929 100644
> --- a/target/i386/kvm/kvm-cpu.c
> +++ b/target/i386/kvm/kvm-cpu.c
> @@ -39,7 +39,7 @@ static void kvm_set_guest_phys_bits(CPUState *cs)
>      }
>  }
>  
> -static bool kvm_cpu_realizefn(CPUState *cs, Error **errp)
> +bool kvm_arch_cpu_realize(CPUState *cs, Error **errp)
>  {
>      X86CPU *cpu = X86_CPU(cs);
>      X86CPUClass *xcc = X86_CPU_GET_CLASS(cpu);
> @@ -237,7 +237,6 @@ static void kvm_cpu_accel_class_init(ObjectClass *oc, const void *data)
>  {
>      AccelCPUClass *acc = ACCEL_CPU_CLASS(oc);
>  
> -    acc->cpu_target_realize = kvm_cpu_realizefn;
>      acc->cpu_instance_init = kvm_cpu_instance_init;
>  }
>  static const TypeInfo kvm_cpu_accel_type_info = {
> diff --git a/target/ppc/kvm.c b/target/ppc/kvm.c
> index b94c2997a07..013f5e852e1 100644
> --- a/target/ppc/kvm.c
> +++ b/target/ppc/kvm.c
> @@ -49,7 +49,6 @@
>  #include "elf.h"
>  #include "system/kvm_int.h"
>  #include "system/kvm.h"
> -#include "accel/accel-cpu-target.h"
>  
>  #include CONFIG_DEVICES
>  
> @@ -2353,7 +2352,7 @@ static void alter_insns(uint64_t *word, uint64_t flags, bool on)
>      }
>  }
>  
> -static bool kvmppc_cpu_realize(CPUState *cs, Error **errp)
> +bool kvm_arch_cpu_realize(CPUState *cs, Error **errp)
>  {
>      int ret;
>      const char *vcpu_str = (cs->parent_obj.hotplugged == true) ?
> @@ -2995,23 +2994,3 @@ void kvmppc_set_reg_tb_offset(PowerPCCPU *cpu, int64_t tb_offset)
>  void kvm_arch_accel_class_init(ObjectClass *oc)
>  {
>  }
> -
> -static void kvm_cpu_accel_class_init(ObjectClass *oc, const void *data)
> -{
> -    AccelCPUClass *acc = ACCEL_CPU_CLASS(oc);
> -
> -    acc->cpu_target_realize = kvmppc_cpu_realize;
> -}
> -
> -static const TypeInfo kvm_cpu_accel_type_info = {
> -    .name = ACCEL_CPU_NAME("kvm"),
> -
> -    .parent = TYPE_ACCEL_CPU,
> -    .class_init = kvm_cpu_accel_class_init,
> -    .abstract = true,
> -};
> -static void kvm_cpu_accel_register_types(void)
> -{
> -    type_register_static(&kvm_cpu_accel_type_info);
> -}
> -type_init(kvm_cpu_accel_register_types);
> diff --git a/target/riscv/kvm/kvm-cpu.c b/target/riscv/kvm/kvm-cpu.c
> index 17ba38403a3..7c4440d0025 100644
> --- a/target/riscv/kvm/kvm-cpu.c
> +++ b/target/riscv/kvm/kvm-cpu.c
> @@ -1990,14 +1990,7 @@ static void kvm_cpu_instance_init(CPUState *cs)
>      kvm_riscv_add_cpu_user_properties(obj);
>  }
>  
> -/*
> - * We'll get here via the following path:
> - *
> - * riscv_cpu_realize()
> - *   -> cpu_exec_realizefn()
> - *      -> kvm_cpu_realize() (via accel_cpu_common_realize())
> - */
> -static bool kvm_cpu_realize(CPUState *cs, Error **errp)
> +bool kvm_arch_cpu_realize(CPUState *cs, Error **errp)
>  {
>      RISCVCPU *cpu = RISCV_CPU(cs);
>      int ret;
> @@ -2120,7 +2113,6 @@ static void kvm_cpu_accel_class_init(ObjectClass *oc, const void *data)
>      AccelCPUClass *acc = ACCEL_CPU_CLASS(oc);
>  
>      acc->cpu_instance_init = kvm_cpu_instance_init;
> -    acc->cpu_target_realize = kvm_cpu_realize;
>  }
>  
>  static const TypeInfo kvm_cpu_accel_type_info = {


Reviewed-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>

Regards,
Pierrick

