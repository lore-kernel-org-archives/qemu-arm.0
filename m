Received: by 2002:a17:504:17d6:b0:1be9:327d:8ee3 with SMTP id o22csp8120484njd;
        Wed, 9 Apr 2025 19:23:28 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX37op924nGyp790lcfFN1D2gJMNH9ymyFzjoksmW5TGxEJF4jBCGoT+qTIzOPELWpD8LDG69Q5XQHbrQ==@linaro.org
X-Google-Smtp-Source: AGHT+IGJSP4JBGkKjT0MkN33AWm/OetZJI5rZboHBeGxuJpU+lg2UukAKB8yC+bgkFBEkIdkUMqn
X-Received: by 2002:a05:6214:1253:b0:6d4:238e:35b0 with SMTP id 6a1803df08f44-6f0e5bbd079mr20608886d6.17.1744251808556;
        Wed, 09 Apr 2025 19:23:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1744251808; cv=none;
        d=google.com; s=arc-20240605;
        b=UayvRs8YtxCz4DTM33fQasZhuN26zpaOkB32smcJCTDx5SVhdTJ9d4UIA8K/lln/oM
         cE1/oG2UCU2T8KSudt7tlgJ37mPVKnFdNKYy7b6Z4ex46AHdOxSps2MX+ULuLgMgDVI0
         HQjwyDFBTeTNY8q6XY+5QMi03bYlDmW+IJiskzjTzprrzF4Ygyga+CRA1ZX3WQtWi7BH
         noWfvt/2sOageJMyzcfkKy7o1L3mN5eALHS1eS/74WRzMNtuo59puQHe2FnBvI9nM78r
         TSmtna5wCA4BODR88nmEnpIiHnqfJc+Awgn1aRQ7MTMsL3vB79c+d++4ssVQskl8QUpU
         epsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=tFZKI7YS9quTnlsR0zwdYxWschD/ySCG7WfCb+Ai8No=;
        fh=MAffrn4U4uG1V2DrepAitVuUISIAqDfmc8PNRNXcHoo=;
        b=iB5shCU29nVyJZA8a2akuWF862LR11lL2pPc4Eh1lbNA3wSskAc59Ty3xF0tS5TLMH
         j2yv9kGqUUHNiARz4RXuep4yUpmNGWg7Fx30FIn1mM3QRcTTyevy6UP8jR16611UnhmM
         dYO/yG1QIC0TvrnNBQQ30BfX8RAvTDfFlymtPjmsWsagLRMtgu6KPr43V6Fgq5qqRZVQ
         c+zANXYFe0LPfEgZ0YUmp+vU92Ce7eJ29heCjaY5hrZXakClnlsyg07/QpQj5i/w/AE9
         jNXz2TYcSXzy1c7FMmDDAub7c3SumZiLCKaywCY3q2J8V7KUJYK7cFNM3mgZ4BA041ho
         ubgw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=MtF6geJ5;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6f0de9dcbb4si21481796d6.198.2025.04.09.19.23.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 09 Apr 2025 19:23:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=MtF6geJ5;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1u2hXH-0005J3-Oz; Wed, 09 Apr 2025 22:20:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@intel.com>)
 id 1u2hXD-0005HY-Jy; Wed, 09 Apr 2025 22:20:57 -0400
Received: from mgamail.intel.com ([192.198.163.11])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@intel.com>)
 id 1u2hXB-0000qw-Ha; Wed, 09 Apr 2025 22:20:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744251654; x=1775787654;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=N/CZ9fUsPlUSKuyUXcdSU3b8XXzkRmBDT3dSqkO2yL0=;
 b=MtF6geJ5YKqC4Bph5o/C9+cZdZiVEQikmIDcyLYXvNBJVPlvPG5gYXIK
 olYIMHpgWGjhBja1f7O0THiqg6mxhyru5Ua+6SgWu2/w0BYowOcvqUQOy
 +wNx4Lod59UgXa6TIV/KrV/OtYtCfuQBkFO43CBzDZjkaLlvA0TrveTnY
 CPevpZnCTAKtVqwZ9w/LZcyOXFBZluGvJobZhffdqrVUbb8RnpmlT+jtC
 BvpmHQFnnIuajrALnvy3HU/LZ/O1riR3oy7IGZvBRWVUEJV69GqXIOJZV
 5q1wWhYmdKFsDVaRkIM4rRRESbpemEdG+xFVtWo9VIb3CQoHbVzupPVok w==;
X-CSE-ConnectionGUID: KB05lRf6SB+CSEpoCJLf4w==
X-CSE-MsgGUID: +Ff0PVmDSEag9e5juLTrWQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11399"; a="56418582"
X-IronPort-AV: E=Sophos;i="6.15,201,1739865600"; d="scan'208";a="56418582"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2025 19:20:47 -0700
X-CSE-ConnectionGUID: bKFIMmGZTHaJskCfi9AWxQ==
X-CSE-MsgGUID: 2Y5avAX7QIGpzHaRBG2jdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,201,1739865600"; d="scan'208";a="151936000"
Received: from liuzhao-optiplex-7080.sh.intel.com (HELO localhost)
 ([10.239.160.39])
 by fmviesa002.fm.intel.com with ESMTP; 09 Apr 2025 19:20:38 -0700
Date: Thu, 10 Apr 2025 10:41:27 +0800
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
Subject: Re: [PATCH v3 05/10] target/i386/kvm: extract unrelated code out of
 kvm_x86_build_cpuid()
Message-ID: <Z/cv155eTgVSW0rm@intel.com>
References: <20250331013307.11937-1-dongli.zhang@oracle.com>
 <20250331013307.11937-6-dongli.zhang@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250331013307.11937-6-dongli.zhang@oracle.com>
Received-SPF: pass client-ip=192.198.163.11; envelope-from=zhao1.liu@intel.com;
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
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: hRI3k+g/ZUDy

On Sun, Mar 30, 2025 at 06:32:24PM -0700, Dongli Zhang wrote:
> Date: Sun, 30 Mar 2025 18:32:24 -0700
> From: Dongli Zhang <dongli.zhang@oracle.com>
> Subject: [PATCH v3 05/10] target/i386/kvm: extract unrelated code out of
>  kvm_x86_build_cpuid()
> X-Mailer: git-send-email 2.43.5
> 
> The initialization of 'has_architectural_pmu_version',
> 'num_architectural_pmu_gp_counters', and
> 'num_architectural_pmu_fixed_counters' is unrelated to the process of
> building the CPUID.
> 
> Extract them out of kvm_x86_build_cpuid().
> 
> In addition, use cpuid_find_entry() instead of cpu_x86_cpuid(), because
> CPUID has already been filled at this stage.
> 
> Signed-off-by: Dongli Zhang <dongli.zhang@oracle.com>
> ---
> Changed since v1:
>   - Still extract the code, but call them for all CPUs.
> Changed since v2:
>   - Use cpuid_find_entry() instead of cpu_x86_cpuid().
>   - Didn't add Reviewed-by from Dapeng as the change isn't minor.
> 
>  target/i386/kvm/kvm.c | 62 ++++++++++++++++++++++++-------------------
>  1 file changed, 35 insertions(+), 27 deletions(-)

Reviewed-by: Zhao Liu <zhao1.liu@intel.com>

