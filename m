Received: by 2002:a17:504:17d6:b0:1be9:327d:8ee3 with SMTP id o22csp8215241njd;
        Thu, 10 Apr 2025 00:23:49 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWV/lRF31o6KNcXc2Vjoq7FRAxhKRvbjGdWHf4ORWgl7BFVW7CgEAd+0iMTvXLOxNaLyh4kNyF/9MZHjg==@linaro.org
X-Google-Smtp-Source: AGHT+IG8ILnweIMgNREbIkS6zXAsFY0IHQrAVkByDPjXMDLXs/KaAizVfD80iRHQpafmkUi04vrU
X-Received: by 2002:a05:620a:1915:b0:7c5:50ab:de02 with SMTP id af79cd13be357-7c7a81b1493mr143259485a.41.1744269829100;
        Thu, 10 Apr 2025 00:23:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1744269829; cv=none;
        d=google.com; s=arc-20240605;
        b=EBGpY9sunxMv/GvS62BCDV8nmnUIyOf9Ojk2NXdxY06GoEHP3auS7tgjpsQIOsz7Uv
         WFIfTbUFqGhl8uCaa6ZmdZFrjgylFn588JiN+l3gog7VvTsUhOvztLJ2L3hh0tX0KO8T
         zNf9GuIxt3f+XkYQbf5r2QzHKyH8ttmgFgYLk4Fp6GvOA9PwnjKtvTEVFzRBog1dsNS5
         wKqcLmX7wrzEL+Odx8bA/wK/njc5yUAA0bAtmiv28gZc3zD1UfNHylnbW+HlFa2dh4kM
         OPaBsq+CYt0qczy6wiKJDYTo3RQuGU28sPv/oy6zYC3fpPP5ONB0u2kbQeFbz8jhCGmt
         JKNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=0x2ZS7SmoLDg+4IcLFJEiYR9ogKbRZumyj87Y3Hu0U4=;
        fh=MAffrn4U4uG1V2DrepAitVuUISIAqDfmc8PNRNXcHoo=;
        b=I7hoQbQ+E4P50qxJlWjmQuZBsRFvh5F7+dYdLpL0iIU0uWCoYcNVO+P1+QF3tccT+p
         nuC0tbCygdBvcF8Z45z54u7o+7X5KuQud3uEUIyDo8OYo5GxwkYHCRCU02P9H5pQb5lp
         OpBkLqE1YzGw5uKEoR1ZU/9WTp4VllvnWfnKixUbziyDcLb//Z73/SpwyhDj+vxz+LbK
         bxI0rtuOrYzE6wymYv5hPu602O7NPnqOcMV/CNVdbr76rz9jSxyLBzVaLmjXQudKeNbt
         1iiK6kw/xub1FOR8CAqwd4xl3eOHgVfb+pIImjvIpCHWaH4lN/t5bpQ+XAA/FVw/v0vP
         7ZpA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=nRSb0qd0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c7a89f6ce5si52905885a.283.2025.04.10.00.23.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 10 Apr 2025 00:23:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=nRSb0qd0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1u2mG2-0002Zm-8R; Thu, 10 Apr 2025 03:23:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@intel.com>)
 id 1u2mFv-0002ZA-98; Thu, 10 Apr 2025 03:23:25 -0400
Received: from mgamail.intel.com ([192.198.163.13])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@intel.com>)
 id 1u2mFr-0001d0-Ee; Thu, 10 Apr 2025 03:23:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744269799; x=1775805799;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Lh9jXEP9tgVr78Y+bjPvBpsrVvBVBSu8yVPe3X6/PBk=;
 b=nRSb0qd0mPvsnCA8UggK+s4HYDYYQqiZHFFKu2AgqgRgHa5OErudp0kh
 dPSwh8QqCcAJzjAZEsnMMCnieQhOcVkL7ACndmJPk/WpbHJQhGBrDR7sN
 Lysqx2d25eDSWh3e1Odxb/56DgVXlReueZ1Pg0v5Be7d9xtvp4MOPEJEG
 Qsuo9TFSxOaYOmsezbLCMlPJUqGt28hi7VFvu6fmhmuzzNIKZVRx5hPmU
 ZigwN8HYEdRwAxsQHegTcV+XcF7S1o03cSxSSZ5fHm1ZOim03DgidL94y
 c74j86YTvk7wyg3UJbIoIelKTCqebbc9mxwqZtBYRfKHO0zEKxYN7L57+ Q==;
X-CSE-ConnectionGUID: NOrZ43W/SsKlMPxVOpa4XA==
X-CSE-MsgGUID: o8wDdkHJQ6+PtL+MBLCRVA==
X-IronPort-AV: E=McAfee;i="6700,10204,11399"; a="48477565"
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; d="scan'208";a="48477565"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2025 00:23:14 -0700
X-CSE-ConnectionGUID: XUminAD6T0GYkRlVFemdzg==
X-CSE-MsgGUID: pctWMc5OS/GsMX0hxH8+og==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; d="scan'208";a="128681029"
Received: from liuzhao-optiplex-7080.sh.intel.com (HELO localhost)
 ([10.239.160.39])
 by fmviesa006.fm.intel.com with ESMTP; 10 Apr 2025 00:23:05 -0700
Date: Thu, 10 Apr 2025 15:43:53 +0800
From: Zhao Liu <zhao1.liu@intel.com>
To: Dongli Zhang <dongli.zhang@oracle.com>
Cc: qemu-devel@nongnu.org, kvm@vger.kernel.org, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org,
 pbonzini@redhat.com, mtosatti@redhat.com, sandipan.das@amd.com,
 babu.moger@amd.com, likexu@tencent.com, like.xu.linux@gmail.com,
 groug@kaod.org, khorenko@virtuozzo.com,
 alexander.ivanov@virtuozzo.com, den@virtuozzo.com,
 davydov-max@yandex-team.ru, xiaoyao.li@intel.com,
 dapeng1.mi@linux.intel.com, joe.jin@oracle.com,
 peter.maydell@linaro.org, gaosong@loongson.cn,
 chenhuacai@kernel.org, philmd@linaro.org, aurelien@aurel32.net,
 jiaxun.yang@flygoat.com, arikalo@gmail.com, npiggin@gmail.com,
 danielhb413@gmail.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com,
 pasic@linux.ibm.com, borntraeger@linux.ibm.com,
 richard.henderson@linaro.org, david@redhat.com, iii@linux.ibm.com,
 thuth@redhat.com, flavra@baylibre.com, ewanhai-oc@zhaoxin.com,
 ewanhai@zhaoxin.com, cobechen@zhaoxin.com, louisqi@zhaoxin.com,
 liamni@zhaoxin.com, frankzhu@zhaoxin.com, silviazhao@zhaoxin.com
Subject: Re: [PATCH v3 08/10] target/i386/kvm: reset AMD PMU registers during
 VM reset
Message-ID: <Z/d2ucu6Y5xlNh6S@intel.com>
References: <20250331013307.11937-1-dongli.zhang@oracle.com>
 <20250331013307.11937-9-dongli.zhang@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250331013307.11937-9-dongli.zhang@oracle.com>
Received-SPF: pass client-ip=192.198.163.13; envelope-from=zhao1.liu@intel.com;
 helo=mgamail.intel.com
X-Spam_score_int: -48
X-Spam_score: -4.9
X-Spam_bar: ----
X-Spam_report: (-4.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.505,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 1lxGVoK30F9u

...

> TODO:
>   - This patch adds is_host_compat_vendor(), while there are something
>     like is_host_cpu_intel() from target/i386/kvm/vmsr_energy.c. A rework
>     may help move those helpers to target/i386/cpu*.

vmsr_energy emulates RAPL in user space...but RAPL is not architectural
(no CPUID), so this case doesn't need to consider "compat" vendor.

>  target/i386/cpu.h     |   8 ++
>  target/i386/kvm/kvm.c | 176 +++++++++++++++++++++++++++++++++++++++++-
>  2 files changed, 180 insertions(+), 4 deletions(-)

...

> +static bool is_host_compat_vendor(CPUX86State *env)
> +{
> +    char host_vendor[CPUID_VENDOR_SZ + 1];
> +    uint32_t host_cpuid_vendor1;
> +    uint32_t host_cpuid_vendor2;
> +    uint32_t host_cpuid_vendor3;
>
> +    host_cpuid(0x0, 0, NULL, &host_cpuid_vendor1, &host_cpuid_vendor3,
> +               &host_cpuid_vendor2);
> +
> +    x86_cpu_vendor_words2str(host_vendor, host_cpuid_vendor1,
> +                             host_cpuid_vendor2, host_cpuid_vendor3);

We can use host_cpu_vendor_fms() (with a little change). If you like
this idea, pls feel free to pick my cleanup patch into your series.

> +    /*
> +     * Intel and Zhaoxin are compatible.
> +     */
> +    if ((g_str_equal(host_vendor, CPUID_VENDOR_INTEL) ||
> +         g_str_equal(host_vendor, CPUID_VENDOR_ZHAOXIN1) ||
> +         g_str_equal(host_vendor, CPUID_VENDOR_ZHAOXIN2)) &&
> +        (IS_INTEL_CPU(env) || IS_ZHAOXIN_CPU(env))) {
> +        return true;
> +    }
> +
> +    return env->cpuid_vendor1 == host_cpuid_vendor1 &&
> +           env->cpuid_vendor2 == host_cpuid_vendor2 &&
> +           env->cpuid_vendor3 == host_cpuid_vendor3;

Checking AMD directly makes the "compat" rule clear:

    return g_str_equal(host_vendor, CPUID_VENDOR_AMD) &&
           IS_AMD_CPU(env);

> +}

...

>      if (env->mcg_cap) {
>          kvm_msr_entry_add(cpu, MSR_MCG_STATUS, 0);
>          kvm_msr_entry_add(cpu, MSR_MCG_CTL, 0);
> @@ -4871,6 +5024,21 @@ static int kvm_get_msrs(X86CPU *cpu)
>          case MSR_P6_EVNTSEL0 ... MSR_P6_EVNTSEL0 + MAX_GP_COUNTERS - 1:
>              env->msr_gp_evtsel[index - MSR_P6_EVNTSEL0] = msrs[i].data;
>              break;
> +        case MSR_K7_EVNTSEL0 ... MSR_K7_EVNTSEL0 + AMD64_NUM_COUNTERS - 1:
> +            env->msr_gp_evtsel[index - MSR_K7_EVNTSEL0] = msrs[i].data;
> +            break;
> +        case MSR_K7_PERFCTR0 ... MSR_K7_PERFCTR0 + AMD64_NUM_COUNTERS - 1:
> +            env->msr_gp_counters[index - MSR_K7_PERFCTR0] = msrs[i].data;
> +            break;
> +        case MSR_F15H_PERF_CTL0 ...
> +             MSR_F15H_PERF_CTL0 + AMD64_NUM_COUNTERS_CORE * 2 - 1:
> +            index = index - MSR_F15H_PERF_CTL0;
> +            if (index & 0x1) {
> +                env->msr_gp_counters[index] = msrs[i].data;
> +            } else {
> +                env->msr_gp_evtsel[index] = msrs[i].data;

This msr_gp_evtsel[] array's size is 18:

#define MAX_GP_COUNTERS    (MSR_IA32_PERF_STATUS - MSR_P6_EVNTSEL0)

This formula is based on Intel's MSR, it's best to add a note that the
current size also meets AMD's needs. (No need to adjust the size, as
it will affect migration).

> +            }
> +            break;
>          case HV_X64_MSR_HYPERCALL:
>              env->msr_hv_hypercall = msrs[i].data;
>              break;

Others LGTM!

Thanks,
Zhao

