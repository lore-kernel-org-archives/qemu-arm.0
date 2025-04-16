Received: by 2002:a17:504:749a:b0:1be9:327d:8ee3 with SMTP id a26csp392791njk;
        Wed, 16 Apr 2025 14:59:11 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCWbQvMJtwYjR+5267+HwEJo+yU78I1mkaSLNaszFZUXlkYlQU4e//Pia24kZKqeZWSSe0DeGqkYOgyiKA==@linaro.org
X-Google-Smtp-Source: AGHT+IHg0aWcsfqmMR8PGMPZz8lnGPLNwNO9nTgFuhzr8hS22i2UuKy8BBIVWAaZ611vPmjDuV8g
X-Received: by 2002:a05:6a00:39a3:b0:736:3979:369e with SMTP id d2e1a72fcca58-73c266e6724mr4329808b3a.9.1744840750992;
        Wed, 16 Apr 2025 14:59:10 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1744840750; cv=pass;
        d=google.com; s=arc-20240605;
        b=ReCcb9dWh55V2TtIYMQ6EExd2xIWb0hf9ovquQGKgHxHAkxx1aBluWrvrfAt67jfBg
         hyMpUyorEUjo3DztBcgaVUxyGIdeFpWrEnEpor/hxtUIhpk3HoIA2SKAXekpADK/X91K
         7P6EXudOdFnPGWLTLoqethsxrV3l214yEEf2stYigbb6EgZVF3neNHCjMtIgWXOxaWEV
         P2/2/D0ch0LMPWkwxWOuCYJmu1683h3LZnJ0l5ZE3EnectKAb6AEPnmYHjyjm3KqaE3A
         LANtOLdMKt0q/fk08ztaPrq8AwPD+FK92IheimsTU7MEDX4i7mpDSbeqfWNVe5R1pKvD
         Uxgw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=AmHd+36j7GM9/O3fepi/uZSTy9/vxZxSBCu5TR/Esus=;
        fh=pr/dSBFL9oLV7kU9Ai5m+xSM8b3nJsKetG/wF2Loub4=;
        b=M9aY5XMYCNOAqStgA7DSUS6E0L5ZPjoFVT99TEo7J7/hZ2n4to1/uWcx1Xmgx7bHrf
         ibZWWiJhE3qo8CctCd6+HoBm2EjqAjVtoRoC9Ftw38ELCjrbYM7ppZBkH0Hi6CXwYrqB
         bM6VrOFhtXYB//TH9WQTRn5mLvr8wzBCnGhsnTZRYbyKc+7Z9AHU/eflNgNLL2C0KIjP
         zCuRB/tcILYuohELmSmSysVPiSVbYeiC4syjnliE2I1P0K6MPqTppAscaOTPSkv7bHEb
         kMNKV2wpx3Op9gXftx3VXg7p+loQ85lzKqPs23dSB9IssKrO3ghw604tG9sGJFPP21o/
         fxow==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@oracle.com header.s=corp-2023-11-20 header.b=bd+q6Bir;
       arc=pass (i=1 spf=pass spfdomain=oracle.com dkim=pass dkdomain=oracle.com dmarc=pass fromdomain=oracle.com);
       spf=pass (google.com: domain of kvm+bounces-43501-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:40f1:3f00::1 as permitted sender) smtp.mailfrom="kvm+bounces-43501-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=oracle.com
Return-Path: <kvm+bounces-43501-alex.bennee=linaro.org@vger.kernel.org>
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org. [2604:1380:40f1:3f00::1])
        by mx.google.com with ESMTPS id d2e1a72fcca58-73bd22f0032si16845714b3a.199.2025.04.16.14.59.10
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 14:59:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvm+bounces-43501-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:40f1:3f00::1 as permitted sender) client-ip=2604:1380:40f1:3f00::1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@oracle.com header.s=corp-2023-11-20 header.b=bd+q6Bir;
       arc=pass (i=1 spf=pass spfdomain=oracle.com dkim=pass dkdomain=oracle.com dmarc=pass fromdomain=oracle.com);
       spf=pass (google.com: domain of kvm+bounces-43501-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:40f1:3f00::1 as permitted sender) smtp.mailfrom="kvm+bounces-43501-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=oracle.com
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2380E7A9D31
	for <alex.bennee@linaro.org>; Wed, 16 Apr 2025 21:58:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4566324C063;
	Wed, 16 Apr 2025 21:58:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="bd+q6Bir"
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DF2A241673
	for <kvm@vger.kernel.org>; Wed, 16 Apr 2025 21:58:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.177.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744840691; cv=none; b=DHixOIhokrnPuKlqlmahEoQX/bQYhpQ9/IuqYEyIX61yj3W1gVUYzYFIRpVZMxA0IrJPcS9PK5qkuenNB58GzWdwVXpocd17D5vlOayKcYnY2ltWURNEYn5rwqGmsI4qF03j9NrP/jgBmeCZIGWzdPg1AulGKiqok1J6A8I5xmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744840691; c=relaxed/simple;
	bh=mJV7qRQyUHTAhjJmRrdb7P4tDBhjqEYFiEUbcKnwEqs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=POKkqhJG3Cs3j4biP6YHHb/bNrpmkYwBHOLpYZ9yMEf5SUC8YpkTK7Ofh2iIq2RggdH9boohCnULaYox1ph8Dpaqged0XLkb/QapJtoJNJjaYp4vVUmb4bV+/xMq6YFTvnRx1fQzhVCMsi4k25FbG0rYoiJSZYa6jzd3RGyHkLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=bd+q6Bir; arc=none smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53GLN3Hh005812;
	Wed, 16 Apr 2025 21:57:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=corp-2023-11-20; bh=AmHd+
	36j7GM9/O3fepi/uZSTy9/vxZxSBCu5TR/Esus=; b=bd+q6BirGegue/mjtvdnw
	aHdEUNL4PXHsKoWw6GQlxs43tisPHDT7KRT2RExB0+Wg/oA5sGqwzmgACAEZEgOC
	/vVyLfzVbRYM2+0YpamjD4HtBxZ3R8hPO03Q7jf1x9SAxNynZ73cNHPSh0CpM7lL
	/Uttr7EcBWRrcZPrArx0HjXOvu2jmSeo3z1ejl/mC/9EQWKqI6wMVuIL8Lil8tBJ
	8OHTFhCWiGX2j6nLxJwb7peepJz/wFfaKrwD7qoSMDwBLxo2mcKz6lbsrCBv9g07
	Jnu5UzNZg25AT7ztD2AKsBn7oVJE6KVQOkk4xoGuaDiD3lZNd+IsxrgO+L0r0iGC
	Q==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46187xw3pw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 16 Apr 2025 21:57:30 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 53GL07kI005731;
	Wed, 16 Apr 2025 21:57:29 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 460d5xhvvq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 16 Apr 2025 21:57:29 +0000
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 53GLv1qk036583;
	Wed, 16 Apr 2025 21:57:28 GMT
Received: from localhost.localdomain (ca-dev80.us.oracle.com [10.211.9.80])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id 460d5xhvcp-12;
	Wed, 16 Apr 2025 21:57:28 +0000
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
Subject: [PATCH v4 11/11] target/i386/kvm: don't stop Intel PMU counters
Date: Wed, 16 Apr 2025 14:52:36 -0700
Message-ID: <20250416215306.32426-12-dongli.zhang@oracle.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250416215306.32426-1-dongli.zhang@oracle.com>
References: <20250416215306.32426-1-dongli.zhang@oracle.com>
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
X-Proofpoint-GUID: xDo9o_icqz0hlnFpR2_M0tPWOwYCN-kY
X-Proofpoint-ORIG-GUID: xDo9o_icqz0hlnFpR2_M0tPWOwYCN-kY
X-TUID: RQggQ1NXOd85

PMU MSRs are set by QEMU only at levels >= KVM_PUT_RESET_STATE,
excluding runtime. Therefore, updating these MSRs without stopping events
should be acceptable.

In addition, KVM creates kernel perf events with host mode excluded
(exclude_host = 1). While the events remain active, they don't increment
the counter during QEMU vCPU userspace mode.

Finally, The kvm_put_msrs() sets the MSRs using KVM_SET_MSRS. The x86 KVM
processes these MSRs one by one in a loop, only saving the config and
triggering the KVM_REQ_PMU request. This approach does not immediately stop
the event before updating PMC. This approach is true since Linux kernel
commit 68fb4757e867 ("KVM: x86/pmu: Defer reprogram_counter() to
kvm_pmu_handle_event"), that is, v6.2.

No Fixed tag is going to be added for the commit 0d89436786b0 ("kvm:
migrate vPMU state"), because this isn't a bugfix.

Signed-off-by: Dongli Zhang <dongli.zhang@oracle.com>
Reviewed-by: Zhao Liu <zhao1.liu@intel.com>
---
Changed since v3:
  - Re-order reasons in commit messages.
  - Mention KVM's commit 68fb4757e867 (v6.2).
  - Keep Zhao's review as there isn't code change.

 target/i386/kvm/kvm.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
index 13ad7de690..6396f65558 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -4172,13 +4172,6 @@ static int kvm_put_msrs(X86CPU *cpu, int level)
         }
 
         if ((IS_INTEL_CPU(env) || IS_ZHAOXIN_CPU(env)) && pmu_version > 0) {
-            if (pmu_version > 1) {
-                /* Stop the counter.  */
-                kvm_msr_entry_add(cpu, MSR_CORE_PERF_FIXED_CTR_CTRL, 0);
-                kvm_msr_entry_add(cpu, MSR_CORE_PERF_GLOBAL_CTRL, 0);
-            }
-
-            /* Set the counter values.  */
             for (i = 0; i < num_pmu_fixed_counters; i++) {
                 kvm_msr_entry_add(cpu, MSR_CORE_PERF_FIXED_CTR0 + i,
                                   env->msr_fixed_counters[i]);
@@ -4194,8 +4187,6 @@ static int kvm_put_msrs(X86CPU *cpu, int level)
                                   env->msr_global_status);
                 kvm_msr_entry_add(cpu, MSR_CORE_PERF_GLOBAL_OVF_CTRL,
                                   env->msr_global_ovf_ctrl);
-
-                /* Now start the PMU.  */
                 kvm_msr_entry_add(cpu, MSR_CORE_PERF_FIXED_CTR_CTRL,
                                   env->msr_fixed_ctr_ctrl);
                 kvm_msr_entry_add(cpu, MSR_CORE_PERF_GLOBAL_CTRL,
-- 
2.39.3

