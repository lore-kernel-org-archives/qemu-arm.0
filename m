Received: by 2002:a17:504:749a:b0:1be9:327d:8ee3 with SMTP id a26csp392556njk;
        Wed, 16 Apr 2025 14:58:38 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCVjFyc28UaMRky25e6F1woWeMTJQMcUWyvR3/oHpPXGC3bAsLVAOFYoK5oyMSAoUbAC1ViRJMfwLK3hYg==@linaro.org
X-Google-Smtp-Source: AGHT+IHvrGb6pya4Jlg26c7pfQv/8dJEF/E6MHDF9F9xEgut81lxNxQRasOyGPzTgJLiIc4fjsUs
X-Received: by 2002:a05:6a20:d489:b0:1ee:d664:17a4 with SMTP id adf61e73a8af0-203bdc71680mr699086637.10.1744840718591;
        Wed, 16 Apr 2025 14:58:38 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1744840718; cv=pass;
        d=google.com; s=arc-20240605;
        b=J8uB0X5cfWrmwBjJyp6CXzOxSkZhCR+LMPq9F+0zqm2n7y8b9zlngEyROmDvsV3n/C
         hCOvfWlMwxHtOAEV8gs32SH3P1AxGRjKtfWb1oz295fmIsLbn+FzQP8Tt5d3GlK6V8zK
         ujljyVr1a1vjm2iib0a1GJyNZobIKytYpv9Cl/v10DblmjACgyBI7easWS2Oi44Yn6EG
         ABzPbwSzQBWk+gqTFE5bCBxOAmz1Z7rEmad85uzgNTe02hpHVOk6kSIls/75+Y9I7rIY
         YeaL4QYufdW3r5Tc67VZx6Ucsn+L/yC4WVJS5jjDEPIhP24SBcxVx15D7cvCQHCaiQyH
         59Kw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=P+y3hXliBATUS9ugfrqFQr/NNfi77W/oCWt15hw2lKs=;
        fh=pr/dSBFL9oLV7kU9Ai5m+xSM8b3nJsKetG/wF2Loub4=;
        b=jn3/cZaDIBk08AJ1x27hZ+LNuvLn9xwNWTJ3EuGJWvp0lXrr5FZK5DKiD8motI3dwN
         nKCz8lFvscoXBDgsEaUt6t56jO5UQOhB9QSaxRVPWYTAgXqMnT/Mx4vahwjt+g+KgvYj
         JgYHW2LQTeGqZcZfjRGADSQs+YJz3eqzYtxmilWxVq6uquDwtsenp+TCMKCFivqlmOD2
         UYHsOrRpm7YXl/EvqBYuW3amSh3eF9G6yCimrfK/FlOLHWahiY7cHSjfJYQ2yVx0xETs
         ZI7OV1ITKsfRGUwUcx44GklKbenWgqFVjAWfl/eooIGTAZIuEC+ewG/Qm+9w99y7bbzl
         A1pQ==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@oracle.com header.s=corp-2023-11-20 header.b=MgSaoTlu;
       arc=pass (i=1 spf=pass spfdomain=oracle.com dkim=pass dkdomain=oracle.com dmarc=pass fromdomain=oracle.com);
       spf=pass (google.com: domain of kvm+bounces-43497-alex.bennee=linaro.org@vger.kernel.org designates 147.75.48.161 as permitted sender) smtp.mailfrom="kvm+bounces-43497-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=oracle.com
Return-Path: <kvm+bounces-43497-alex.bennee=linaro.org@vger.kernel.org>
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org. [147.75.48.161])
        by mx.google.com with ESMTPS id 41be03b00d2f7-b0b223163a6si3168379a12.652.2025.04.16.14.58.38
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 14:58:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvm+bounces-43497-alex.bennee=linaro.org@vger.kernel.org designates 147.75.48.161 as permitted sender) client-ip=147.75.48.161;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@oracle.com header.s=corp-2023-11-20 header.b=MgSaoTlu;
       arc=pass (i=1 spf=pass spfdomain=oracle.com dkim=pass dkdomain=oracle.com dmarc=pass fromdomain=oracle.com);
       spf=pass (google.com: domain of kvm+bounces-43497-alex.bennee=linaro.org@vger.kernel.org designates 147.75.48.161 as permitted sender) smtp.mailfrom="kvm+bounces-43497-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=oracle.com
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id ACD7D7A6BDC
	for <alex.bennee@linaro.org>; Wed, 16 Apr 2025 21:57:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8327724BBE1;
	Wed, 16 Apr 2025 21:58:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="MgSaoTlu"
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9557923AE8D
	for <kvm@vger.kernel.org>; Wed, 16 Apr 2025 21:58:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.177.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744840684; cv=none; b=OszotJRDcPGZbJgaSm7faSBcX++kZ5ULZObETwyh6BX+UQhSFL8nXIqCXCfCZoBaq/lNiJIftjRiLvxR+18y6RQGIL7bXnD7nXZCwe4AjnFANvFrxDoxDuJqu1XtxJelln5OdKs8gpgW6T5Gj5vA2QVdD7Ycc64CTG0Ncl7jflk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744840684; c=relaxed/simple;
	bh=CrRjAe600Oy4tZJj4A1Q63oALlI2bgBeDxL91kGcUwQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CUqccMoT978bPzbrqoLSm1O29aUOmxD9A1uImRFCgHZJEvViaGYtBvV0TJeHqt8LfanZB/P9z2gO0tCy7u9zPsHC0uQoaqQzfZU3Zzz/n2PHRpTyFHhnKbkhALR3yJ02R90ZvqdxLDjI430KaIciDoGjlmggOHG/DFZ5r2kvEi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=MgSaoTlu; arc=none smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53GLNKj4006121;
	Wed, 16 Apr 2025 21:57:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=corp-2023-11-20; bh=P+y3hXliBATUS9ugfrqFQr/NNfi77
	W/oCWt15hw2lKs=; b=MgSaoTluoa97GbrVNP3SgMyt0b9YusOKQBM5APcmsqvmp
	b/zUeUYCrl7inHfHBHwFRQttHAiExJNQAg0fANxu2impKTStzBuF04vinIgRDycV
	94aEWL7iDfFvX9TLwcTfjhyDmmH7Jdt/KRR8mPTKsYUdzQyITzwfPp799te9riUy
	vrCNK/vWW41AvFcijRqaddcJ+IjA2FSnuxwlL+Mp43SEF8oprbmxU1h/MWYpReUs
	t23wZuY0YJH4RWS8Fq7A2ZgERfKftDTQbc30ZiVwU48iYR1JkjEAaDCqwKbzccJF
	gwC9eQJ1tFcsCl6tASP1yA0EzbM0ZEmdNV7AxoBRg==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46187xw3pg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 16 Apr 2025 21:57:03 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 53GK4wuH005671;
	Wed, 16 Apr 2025 21:57:02 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 460d5xhvdg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 16 Apr 2025 21:57:02 +0000
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 53GLv1qO036583;
	Wed, 16 Apr 2025 21:57:01 GMT
Received: from localhost.localdomain (ca-dev80.us.oracle.com [10.211.9.80])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id 460d5xhvcp-1;
	Wed, 16 Apr 2025 21:57:01 +0000
From: Dongli Zhang <dongli.zhang@oracle.com>
To: qemu-devel@nongnu.org, kvm@vger.kernel.org, qemu-arm@nongnu.org,
        qemu-ppc@nongnu.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org
Cc: pbonzini@redhat.com, zhao1.liu@intel.com, mtosatti@redhat.com,
        sandipan.das@amd.com, babu.moger@amd.com, likexu@tencent.com,
        like.xu.linux@gmail.com, groug@kaod.org, khorenko@virtuozzo.com,
        alexander.ivanov@virtuozzo.com, den@virtuozzo.com,
        davydov-max@yandex-team.ru, xiaoyao.li@intel.com,
        dapeng1.mi@linux.intel.com, joe.jin@oracle.com,
        peter.maydell@linaro.org, gaosong@loongson.cn, chenhuacai@kernel.org,
        philmd@linaro.org, aurelien@aurel32.net, jiaxun.yang@flygoat.com,
        arikalo@gmail.com, npiggin@gmail.com, danielhb413@gmail.com,
        palmer@dabbelt.com, alistair.francis@wdc.com, liwei1518@gmail.com,
        zhiwei_liu@linux.alibaba.com, pasic@linux.ibm.com,
        borntraeger@linux.ibm.com, richard.henderson@linaro.org,
        david@redhat.com, iii@linux.ibm.com, thuth@redhat.com,
        flavra@baylibre.com, ewanhai-oc@zhaoxin.com, ewanhai@zhaoxin.com,
        cobechen@zhaoxin.com, louisqi@zhaoxin.com, liamni@zhaoxin.com,
        frankzhu@zhaoxin.com, silviazhao@zhaoxin.com, kraxel@redhat.com,
        berrange@redhat.com
Subject: [PATCH v4 00/11] target/i386/kvm/pmu: PMU Enhancement, Bugfix and Cleanup
Date: Wed, 16 Apr 2025 14:52:25 -0700
Message-ID: <20250416215306.32426-1-dongli.zhang@oracle.com>
X-Mailer: git-send-email 2.43.5
Precedence: bulk
X-Mailing-List: kvm@vger.kernel.org
List-Id: <kvm.vger.kernel.org>
List-Subscribe: <mailto:kvm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kvm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-16_08,2025-04-15_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 mlxlogscore=999
 suspectscore=0 spamscore=0 bulkscore=0 malwarescore=0 adultscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2502280000 definitions=main-2504160177
X-Proofpoint-GUID: 8mMJbOzcgPAvzedhIzqsy2EkKTwmROrC
X-Proofpoint-ORIG-GUID: 8mMJbOzcgPAvzedhIzqsy2EkKTwmROrC
X-TUID: 7VUKUnz8ELtW

This patchset addresses four bugs related to AMD PMU virtualization.

1. The PerfMonV2 is still available if PERCORE if disabled via
"-cpu host,-perfctr-core".

2. The VM 'cpuid' command still returns PERFCORE although "-pmu" is
configured.

3. The third issue is that using "-cpu host,-pmu" does not disable AMD PMU
virtualization. When using "-cpu EPYC" or "-cpu host,-pmu", AMD PMU
virtualization remains enabled. On the VM's Linux side, you might still
see:

[    0.510611] Performance Events: Fam17h+ core perfctr, AMD PMU driver.

instead of:

[    0.596381] Performance Events: PMU not available due to virtualization, using software events only.
[    0.600972] NMI watchdog: Perf NMI watchdog permanently disabled

To address this, KVM_CAP_PMU_CAPABILITY is used to set KVM_PMU_CAP_DISABLE
when "-pmu" is configured.

4. The fourth issue is that unreclaimed performance events (after a QEMU
system_reset) in KVM may cause random, unwanted, or unknown NMIs to be
injected into the VM.

The AMD PMU registers are not reset during QEMU system_reset.

(1) If the VM is reset (e.g., via QEMU system_reset or VM kdump/kexec) while
running "perf top", the PMU registers are not disabled properly.

(2) Despite x86_cpu_reset() resetting many registers to zero, kvm_put_msrs()
does not handle AMD PMU registers, causing some PMU events to remain
enabled in KVM.

(3) The KVM kvm_pmc_speculative_in_use() function consistently returns true,
preventing the reclamation of these events. Consequently, the
kvm_pmc->perf_event remains active.

(4) After a reboot, the VM kernel may report the following error:

[    0.092011] Performance Events: Fam17h+ core perfctr, Broken BIOS detected, complain to your hardware vendor.
[    0.092023] [Firmware Bug]: the BIOS has corrupted hw-PMU resources (MSR c0010200 is 530076)

(5) In the worst case, the active kvm_pmc->perf_event may inject unknown
NMIs randomly into the VM kernel:

[...] Uhhuh. NMI received for unknown reason 30 on CPU 0.

To resolve these issues, we propose resetting AMD PMU registers during the
VM reset process


Changed since v1:
  - Use feature_dependencies for CPUID_EXT3_PERFCORE and
    CPUID_8000_0022_EAX_PERFMON_V2.
  - Remove CPUID_EXT3_PERFCORE when !cpu->enable_pmu.
  - Pick kvm_arch_pre_create_vcpu() patch from Xiaoyao Li.
  - Use "-pmu" but not a global "pmu-cap-disabled" for KVM_PMU_CAP_DISABLE.
  - Also use sysfs kvm.enable_pmu=N to determine if PMU is supported.
  - Some changes to PMU register limit calculation.
Changed since v2:
  - Change has_pmu_cap to pmu_cap.
  - Use cpuid_find_entry() instead of cpu_x86_cpuid().
  - Rework the code flow of PATCH 07 related to kvm.enable_pmu=N following
    Zhao's suggestion.
  - Use object_property_get_int() to get CPU family.
  - Add support to Zhaoxin.
Changed since v3:
  - Re-base on top of Zhao's queued patch.
  - Use host_cpu_vendor_fms() from Zhao's patch.
  - Pick new version of kvm_arch_pre_create_vcpu() patch from Xiaoyao.
  - Re-split the cases into enable_pmu and !enable_pmu, following Zhao's
    suggestion.
  - Check AMD directly makes the "compat" rule clear.
  - Some changes on commit message and comment.
  - Bring back global static variable 'kvm_pmu_disabled' read from
    /sys/module/kvm/parameters/enable_pmu.


Zhao Liu (1):
  i386/cpu: Consolidate the helper to get Host's vendor [Don't merge]

Xiaoyao Li (1):
  kvm: Introduce kvm_arch_pre_create_vcpu()

Dongli Zhang (9):
  target/i386: disable PerfMonV2 when PERFCORE unavailable
  target/i386: disable PERFCORE when "-pmu" is configured
  target/i386/kvm: set KVM_PMU_CAP_DISABLE if "-pmu" is configured
  target/i386/kvm: extract unrelated code out of kvm_x86_build_cpuid()
  target/i386/kvm: rename architectural PMU variables
  target/i386/kvm: query kvm.enable_pmu parameter
  target/i386/kvm: reset AMD PMU registers during VM reset
  target/i386/kvm: support perfmon-v2 for reset
  target/i386/kvm: don't stop Intel PMU counters

 accel/kvm/kvm-all.c           |   5 +
 include/system/kvm.h          |   1 +
 target/arm/kvm.c              |   5 +
 target/i386/cpu.c             |   8 +
 target/i386/cpu.h             |  16 ++
 target/i386/host-cpu.c        |  10 +-
 target/i386/kvm/kvm.c         | 360 ++++++++++++++++++++++++++++++++-----
 target/i386/kvm/vmsr_energy.c |   3 +-
 target/loongarch/kvm/kvm.c    |   4 +
 target/mips/kvm.c             |   5 +
 target/ppc/kvm.c              |   5 +
 target/riscv/kvm/kvm-cpu.c    |   5 +
 target/s390x/kvm/kvm.c        |   5 +
 13 files changed, 379 insertions(+), 53 deletions(-)

base-commit: a9cd5bc6399a80fcf233ed0fffe6067b731227d8

Thank you very much!

Dongli Zhang

