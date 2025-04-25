Received: by 2002:a17:504:17c4:b0:1be9:327d:8ee3 with SMTP id o4csp4228807njd;
        Fri, 25 Apr 2025 01:57:58 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVvgiybCrcswg3nJLPbz1AXlRtylaBe0Ye+wo3TurElojQhgJkQ/2nh9gOfcMeDASpw2VN5EBRgWc+0RQ==@linaro.org
X-Google-Smtp-Source: AGHT+IHgwrdRoRNn+r1HNBXq0W6KfGAE2hEiUE8JZgg2iEAIQF99V+j2ftbnar77D2rdYlFPwhVq
X-Received: by 2002:a05:600c:1e25:b0:43d:46de:b0eb with SMTP id 5b1f17b1804b1-440a65dd632mr13501125e9.12.1745571477769;
        Fri, 25 Apr 2025 01:57:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1745571477; cv=none;
        d=google.com; s=arc-20240605;
        b=NZ8Azvt0dFJG0OdmgI1eUO1h72dce4JOtcy//aYe82YR4IcU9fnKqGwEkr+2Kb3Y6I
         npjRXk8/GVHk4hCwHVpjWht+g0F8kcKbR39A+cNTziGacpYf1eCWclkHjyPBhsZ1+fIj
         HpE/jPGZyOnogTCZmbmn7nXSq/yT2nBHn5yaGbzxnanXKNykCCEZmiVQwWost/VTYFpx
         ASPLysr636QQmjpaq86UZPL97f8cIuoYnu9bA02rit+3G9bQdM0K8w9KjSlfIIXp+mPa
         npKt2kqTLIHVQeN3JHqeCUUfMTAoVujUEhkLtDGSTTodmOHrZqNyMMRCpTv0RAN5P5Xn
         Bicw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=kBZCLz2dFBgx9PrHYuxwg/dmCppbagqmhMvrWKFAlkI=;
        fh=Z5gh/o5ZL3xRtUwccechZMEA5ciId+Hw9EA3V2rP7fg=;
        b=eIfo0sQu0lAtDhBDe42MkuwDCM+G/lhXoUc02lFVkro5HeP6zoPdcvfegwTvy47FXI
         MqADelbCDLe+fyXwj1eCPeMLcU2v6Bd0WiKtKws5dxWgy6B6Ha6VFp5XtWez7hIsm93e
         L8/j23v7MIWiT6mB4PdKKi7PSgikwSE2n/U0W1udFQ+TxaAagJUCG0WNA7Ojp14t+kJJ
         AFegHPXOGoH06Z03ILAQWzHu3D4ohta/gFhLtjb399ET0ucJ2n12d4KSueRA3p1Myo1S
         +5/Br7I+7gtFqnx0BWCzT72EbgYak0y20ZhOS80ql1Qf1Uk/Y+dv1ROjwngG+EmhwylU
         2kkQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=gzJzqx9u;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 5b1f17b1804b1-440a5311358si8657125e9.85.2025.04.25.01.57.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 25 Apr 2025 01:57:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=gzJzqx9u;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1u8EsZ-0008GH-NA; Fri, 25 Apr 2025 04:57:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@intel.com>)
 id 1u8EsY-0008F1-Df; Fri, 25 Apr 2025 04:57:50 -0400
Received: from mgamail.intel.com ([192.198.163.10])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@intel.com>)
 id 1u8EsV-0004Lf-Au; Fri, 25 Apr 2025 04:57:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745571467; x=1777107467;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=mcEr0zmSiDOPEt70TYU6E6B7dOkZJjNKNUv16j9oVcE=;
 b=gzJzqx9urLiWY7IF+T7VZB1QYy7yKnyIrd+9yW9gv44b0kGPhxqmGybJ
 +oXA7hRe3W/p8yKwBOGlEFxlKejUVqefFmiMSoqskazHUt3NEt8ef0qQ+
 6aHrs80p+BEf6jAoBoOixhDPfzLycDDJ7Jx//Ouu8czfP5ObCd42RMEMj
 qe/mlCdUwsm8rdwg2Pf9s4uYzSCnbseDXQXoHYvpYrs3Q9+onUgNMEug+
 AF12JPh3oqkgNqzkZa03d893vVzgGQtWqZIMMpxVekQI8exYbkwAunHWV
 x2r1QyXmanXSlXuqD3EuhUFoX7qTrM4Z01Df+ePM2uQx4rfG7HBwVjWQe Q==;
X-CSE-ConnectionGUID: IwSWVHI9RG2I35TwnBtCTg==
X-CSE-MsgGUID: h1loQsGDTrq39tAMSSeo0A==
X-IronPort-AV: E=McAfee;i="6700,10204,11413"; a="58598709"
X-IronPort-AV: E=Sophos;i="6.15,238,1739865600"; d="scan'208";a="58598709"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2025 01:57:43 -0700
X-CSE-ConnectionGUID: GO8FEL63QBeQRXrZ2LqRRQ==
X-CSE-MsgGUID: gdGUVTFQQaa54FHx4mG1AA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,238,1739865600"; d="scan'208";a="132847488"
Received: from liuzhao-optiplex-7080.sh.intel.com (HELO localhost)
 ([10.239.160.39])
 by fmviesa007.fm.intel.com with ESMTP; 25 Apr 2025 01:57:33 -0700
Date: Fri, 25 Apr 2025 17:18:28 +0800
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
 liamni@zhaoxin.com, frankzhu@zhaoxin.com, silviazhao@zhaoxin.com,
 kraxel@redhat.com, berrange@redhat.com
Subject: Re: [PATCH v4 09/11] target/i386/kvm: reset AMD PMU registers during
 VM reset
Message-ID: <aAtTZLZR7IRhdOUC@intel.com>
References: <20250416215306.32426-1-dongli.zhang@oracle.com>
 <20250416215306.32426-10-dongli.zhang@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250416215306.32426-10-dongli.zhang@oracle.com>
Received-SPF: pass client-ip=192.198.163.10; envelope-from=zhao1.liu@intel.com;
 helo=mgamail.intel.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.84,
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
X-TUID: ygkKfntHBm0f

On Wed, Apr 16, 2025 at 02:52:34PM -0700, Dongli Zhang wrote:
> Date: Wed, 16 Apr 2025 14:52:34 -0700
> From: Dongli Zhang <dongli.zhang@oracle.com>
> Subject: [PATCH v4 09/11] target/i386/kvm: reset AMD PMU registers during
>  VM reset
> X-Mailer: git-send-email 2.43.5
> 
> QEMU uses the kvm_get_msrs() function to save Intel PMU registers from KVM
> and kvm_put_msrs() to restore them to KVM. However, there is no support for
> AMD PMU registers. Currently, pmu_version and num_pmu_gp_counters are
> initialized based on cpuid(0xa), which does not apply to AMD processors.
> For AMD CPUs, prior to PerfMonV2, the number of general-purpose registers
> is determined based on the CPU version.
> 
> To address this issue, we need to add support for AMD PMU registers.
> Without this support, the following problems can arise:
> 
> 1. If the VM is reset (e.g., via QEMU system_reset or VM kdump/kexec) while
> running "perf top", the PMU registers are not disabled properly.
> 
> 2. Despite x86_cpu_reset() resetting many registers to zero, kvm_put_msrs()
> does not handle AMD PMU registers, causing some PMU events to remain
> enabled in KVM.
> 
> 3. The KVM kvm_pmc_speculative_in_use() function consistently returns true,
> preventing the reclamation of these events. Consequently, the
> kvm_pmc->perf_event remains active.
> 
> 4. After a reboot, the VM kernel may report the following error:
> 
> [    0.092011] Performance Events: Fam17h+ core perfctr, Broken BIOS detected, complain to your hardware vendor.
> [    0.092023] [Firmware Bug]: the BIOS has corrupted hw-PMU resources (MSR c0010200 is 530076)
> 
> 5. In the worst case, the active kvm_pmc->perf_event may inject unknown
> NMIs randomly into the VM kernel:
> 
> [...] Uhhuh. NMI received for unknown reason 30 on CPU 0.
> 
> To resolve these issues, we propose resetting AMD PMU registers during the
> VM reset process.
> 
> Signed-off-by: Dongli Zhang <dongli.zhang@oracle.com>
> ---
> Changed since v1:
>   - Modify "MSR_K7_EVNTSEL0 + 3" and "MSR_K7_PERFCTR0 + 3" by using
>     AMD64_NUM_COUNTERS (suggested by Sandipan Das).
>   - Use "AMD64_NUM_COUNTERS_CORE * 2 - 1", not "MSR_F15H_PERF_CTL0 + 0xb".
>     (suggested by Sandipan Das).
>   - Switch back to "-pmu" instead of using a global "pmu-cap-disabled".
>   - Don't initialize PMU info if kvm.enable_pmu=N.
> Changed since v2:
>   - Remove 'static' from host_cpuid_vendorX.
>   - Change has_pmu_version to pmu_version.
>   - Use object_property_get_int() to get CPU family.
>   - Use cpuid_find_entry() instead of cpu_x86_cpuid().
>   - Send error log when host and guest are from different vendors.
>   - Move "if (!cpu->enable_pmu)" to begin of function. Add comments to
>     reminder developers.
>   - Add support to Zhaoxin. Change is_same_vendor() to
>     is_host_compat_vendor().
>   - Didn't add Reviewed-by from Sandipan because the change isn't minor.
> Changed since v3:
>   - Use host_cpu_vendor_fms() from Zhao's patch.
>   - Check AMD directly makes the "compat" rule clear.
>   - Add comment to MAX_GP_COUNTERS.
>   - Skip PMU info initialization if !kvm_pmu_disabled.
> 
>  target/i386/cpu.h     |  12 +++
>  target/i386/kvm/kvm.c | 175 +++++++++++++++++++++++++++++++++++++++++-
>  2 files changed, 183 insertions(+), 4 deletions(-)

Reviewed-by: Zhao Liu <zhao1.liu@intel.com>

