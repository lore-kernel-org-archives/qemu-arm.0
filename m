Received: by 2002:a17:504:749a:b0:1be9:327d:8ee3 with SMTP id a26csp392529njk;
        Wed, 16 Apr 2025 14:58:35 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCUd/rNpazPkmBKYn1A8fRzY2qF/RbBi/vSHPZt+z086iOY3+LhIO9Qn2fUmjp8fVpMsQMTUwL5ZOdS/1A==@linaro.org
X-Google-Smtp-Source: AGHT+IEYxECAECwCh6edxycwUgOHgPV/8m1aTMGY1v2D1GEfwPQrr7AtSkSXNGX3to6xmD6UnRnA
X-Received: by 2002:a17:90b:5404:b0:2fa:13d9:39c with SMTP id 98e67ed59e1d1-30863f1c900mr5854708a91.14.1744840715130;
        Wed, 16 Apr 2025 14:58:35 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1744840715; cv=pass;
        d=google.com; s=arc-20240605;
        b=Fbc7C7A0IRdxmKDa+fiMFK/A3pnJue3IXhZWmpwrjczsJeb02f7ENqgpk0b0dL2+xN
         WHaSKZYfHH75L80vnyvX+swXKrmc7KX4PXMQqYkuCAwgj69BPsbd6Y3FghWYivdXdTdP
         qu6sa83nAcrJD9iDxpqbb1GWj15LQW0AqT10RNQQ817/vlJhHOLXmM6IMKp3HDG0DkKf
         NYaciXS9YLwSMB1m4uy4EZ5LqOz2gq4JlHSv1cqWrOxNrb8YuRBqM5Zr58JGfZD+08qr
         uyVLZtbwfdVrxnYb7sAhxT/gbKwBDeJLxRWZ5lFyd5zsb2S/FAt0LYplaRNeMuX2y4Pb
         ZFaA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=8MiQKOWBJPUnuQbzB9mWg2ZXmXCdDXNgaggCFWA/Z1Q=;
        fh=pr/dSBFL9oLV7kU9Ai5m+xSM8b3nJsKetG/wF2Loub4=;
        b=OT5QL947v+RPD+LyH/F4aNW437SpM4IlaKBhrpdxSJVKmIq0rvDzOwzk1UtvgTl++3
         O/a1TYAnyUm6pyzo9Lid2BK6ZXwbbUc/FRM9m0Ek6xW25Ohe6ZmCa7O0AJ+sag3Qqnoc
         bo+C6Q/H6PA6E5XCJgAXpRL1113nYBSMsAi3pNx6HQBm4wWQDAd5nUFKS4uTxQEfe2dv
         C9AyF1IerEMG8BjZAb9yAEVSahpB9e1adc7Z1OA9OUtB1vwLUN30nPHNd5i1VsMdNtkn
         AcW22CpxKZUSDCafj+tMwiiFkDlOei0Ph3w4YsNfv8QyTeFpt1rOhx+N4ZZwzjHkN7hl
         1D7w==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@oracle.com header.s=corp-2023-11-20 header.b=UrYd8R1A;
       arc=pass (i=1 spf=pass spfdomain=oracle.com dkim=pass dkdomain=oracle.com dmarc=pass fromdomain=oracle.com);
       spf=pass (google.com: domain of kvm+bounces-43496-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45e3:2400::1 as permitted sender) smtp.mailfrom="kvm+bounces-43496-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=oracle.com
Return-Path: <kvm+bounces-43496-alex.bennee=linaro.org@vger.kernel.org>
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org. [2604:1380:45e3:2400::1])
        by mx.google.com with ESMTPS id 98e67ed59e1d1-308611d6115si3429021a91.47.2025.04.16.14.58.34
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 14:58:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvm+bounces-43496-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45e3:2400::1 as permitted sender) client-ip=2604:1380:45e3:2400::1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@oracle.com header.s=corp-2023-11-20 header.b=UrYd8R1A;
       arc=pass (i=1 spf=pass spfdomain=oracle.com dkim=pass dkdomain=oracle.com dmarc=pass fromdomain=oracle.com);
       spf=pass (google.com: domain of kvm+bounces-43496-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45e3:2400::1 as permitted sender) smtp.mailfrom="kvm+bounces-43496-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=oracle.com
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6CBF33B002F
	for <alex.bennee@linaro.org>; Wed, 16 Apr 2025 21:58:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8320124BBE0;
	Wed, 16 Apr 2025 21:58:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="UrYd8R1A"
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A699A248869
	for <kvm@vger.kernel.org>; Wed, 16 Apr 2025 21:58:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.165.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744840684; cv=none; b=SRxmlOHQ/JatBC73co37RxckSaye8NiHo1xC8cfi/Ek1zTYOZHxHLhe4oG4Kkh92HpCaMO+1js9osoTKHE+tMUB9r92xKDw8HDkYSHpZmVMbc1kw3EgZUbMcd+AGgBzhSzFRJ2c3xUo+b9nLkwbNVFuFC485pwYAqXlw9kE4Mi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744840684; c=relaxed/simple;
	bh=UNngoe2/gXJWQOPonQ6vQVvug9IjRVX/cjeiZS+DRB0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ko1JOwhsNE/YbpMofP5o7xBDiC7zGgMbMdTxVp1x7bJiWC96GzYI9eJ+jPSh8tQ5pijcEcTRP2ChuGEzmbWmHe2/lr01VdTFjfoY+hjOJao/fuzra57KJDrIos3cbBMi3hpkC5AovWvcb6WvEkpCGt+8k+3sDckWB9d1xhGyFc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=UrYd8R1A; arc=none smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53GLN0B0019727;
	Wed, 16 Apr 2025 21:57:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=corp-2023-11-20; bh=8MiQK
	OWBJPUnuQbzB9mWg2ZXmXCdDXNgaggCFWA/Z1Q=; b=UrYd8R1A8kWZj+XhW7DcE
	I6FnsAqh70UmcHiSljLNH/AOYVagdmvrWzCSx74OE+0nIUkGRx8a5zM1VtX9k+kL
	klrvvU8emdamFAeLvyleawtPD6fas53SUy98mgbI0w9zA/qaxoLlRhaZMhKOGstM
	Db/GnLawPE8yWep8Npdk6wPv5qNNQpgvj8okNhCVG1xdRW609QcOkcg23KkWXq/g
	p4FYlsIjGL1vxW9dJXYS78kMZmiwLg1Vy5lfRVe2PAKv8ec9n8E3IRcYly/doMcX
	ReFaSxL51O78RM4AZJWDhVaqYxS3ruXrVl4Spam13FR0V7c201p31HpxsQdLjl6H
	g==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4619444xqa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 16 Apr 2025 21:57:18 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 53GK51Uo005725;
	Wed, 16 Apr 2025 21:57:18 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 460d5xhvmw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 16 Apr 2025 21:57:18 +0000
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 53GLv1qa036583;
	Wed, 16 Apr 2025 21:57:17 GMT
Received: from localhost.localdomain (ca-dev80.us.oracle.com [10.211.9.80])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id 460d5xhvcp-7;
	Wed, 16 Apr 2025 21:57:17 +0000
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
Subject: [PATCH v4 06/11] target/i386/kvm: extract unrelated code out of kvm_x86_build_cpuid()
Date: Wed, 16 Apr 2025 14:52:31 -0700
Message-ID: <20250416215306.32426-7-dongli.zhang@oracle.com>
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
X-Proofpoint-GUID: Sytf9wIJ_bDojv6Sta1nfUN0xmbXSRHM
X-Proofpoint-ORIG-GUID: Sytf9wIJ_bDojv6Sta1nfUN0xmbXSRHM
X-TUID: BsPTPtkWu/G+

The initialization of 'has_architectural_pmu_version',
'num_architectural_pmu_gp_counters', and
'num_architectural_pmu_fixed_counters' is unrelated to the process of
building the CPUID.

Extract them out of kvm_x86_build_cpuid().

In addition, use cpuid_find_entry() instead of cpu_x86_cpuid(), because
CPUID has already been filled at this stage.

Signed-off-by: Dongli Zhang <dongli.zhang@oracle.com>
Reviewed-by: Zhao Liu <zhao1.liu@intel.com>
---
Changed since v1:
  - Still extract the code, but call them for all CPUs.
Changed since v2:
  - Use cpuid_find_entry() instead of cpu_x86_cpuid().
  - Didn't add Reviewed-by from Dapeng as the change isn't minor.

 target/i386/kvm/kvm.c | 62 ++++++++++++++++++++++++-------------------
 1 file changed, 35 insertions(+), 27 deletions(-)

diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
index 579c0f7e0b..4d86c08c6c 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -1959,33 +1959,6 @@ static uint32_t kvm_x86_build_cpuid(CPUX86State *env,
         }
     }
 
-    if (limit >= 0x0a) {
-        uint32_t eax, edx;
-
-        cpu_x86_cpuid(env, 0x0a, 0, &eax, &unused, &unused, &edx);
-
-        has_architectural_pmu_version = eax & 0xff;
-        if (has_architectural_pmu_version > 0) {
-            num_architectural_pmu_gp_counters = (eax & 0xff00) >> 8;
-
-            /* Shouldn't be more than 32, since that's the number of bits
-             * available in EBX to tell us _which_ counters are available.
-             * Play it safe.
-             */
-            if (num_architectural_pmu_gp_counters > MAX_GP_COUNTERS) {
-                num_architectural_pmu_gp_counters = MAX_GP_COUNTERS;
-            }
-
-            if (has_architectural_pmu_version > 1) {
-                num_architectural_pmu_fixed_counters = edx & 0x1f;
-
-                if (num_architectural_pmu_fixed_counters > MAX_FIXED_COUNTERS) {
-                    num_architectural_pmu_fixed_counters = MAX_FIXED_COUNTERS;
-                }
-            }
-        }
-    }
-
     cpu_x86_cpuid(env, 0x80000000, 0, &limit, &unused, &unused, &unused);
 
     for (i = 0x80000000; i <= limit; i++) {
@@ -2085,6 +2058,39 @@ int kvm_arch_pre_create_vcpu(CPUState *cpu, Error **errp)
     return 0;
 }
 
+static void kvm_init_pmu_info(struct kvm_cpuid2 *cpuid)
+{
+    struct kvm_cpuid_entry2 *c;
+
+    c = cpuid_find_entry(cpuid, 0xa, 0);
+
+    if (!c) {
+        return;
+    }
+
+    has_architectural_pmu_version = c->eax & 0xff;
+    if (has_architectural_pmu_version > 0) {
+        num_architectural_pmu_gp_counters = (c->eax & 0xff00) >> 8;
+
+        /*
+         * Shouldn't be more than 32, since that's the number of bits
+         * available in EBX to tell us _which_ counters are available.
+         * Play it safe.
+         */
+        if (num_architectural_pmu_gp_counters > MAX_GP_COUNTERS) {
+            num_architectural_pmu_gp_counters = MAX_GP_COUNTERS;
+        }
+
+        if (has_architectural_pmu_version > 1) {
+            num_architectural_pmu_fixed_counters = c->edx & 0x1f;
+
+            if (num_architectural_pmu_fixed_counters > MAX_FIXED_COUNTERS) {
+                num_architectural_pmu_fixed_counters = MAX_FIXED_COUNTERS;
+            }
+        }
+    }
+}
+
 int kvm_arch_init_vcpu(CPUState *cs)
 {
     struct {
@@ -2267,6 +2273,8 @@ int kvm_arch_init_vcpu(CPUState *cs)
     cpuid_i = kvm_x86_build_cpuid(env, cpuid_data.entries, cpuid_i);
     cpuid_data.cpuid.nent = cpuid_i;
 
+    kvm_init_pmu_info(&cpuid_data.cpuid);
+
     if (((env->cpuid_version >> 8)&0xF) >= 6
         && (env->features[FEAT_1_EDX] & (CPUID_MCE | CPUID_MCA)) ==
            (CPUID_MCE | CPUID_MCA)) {
-- 
2.39.3

