Received: by 2002:a17:504:749a:b0:1be9:327d:8ee3 with SMTP id a26csp392564njk;
        Wed, 16 Apr 2025 14:58:39 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCWbCeGPeZpvxqSgGya2YMMKeDcHq5r6gzkULEH4OuMXRPja65lLog0sBh5SEGV3w/zvztI5ByvXBXmIVw==@linaro.org
X-Google-Smtp-Source: AGHT+IESZz0ke9pnFxT34/hEj6vi5eNlOLDbTWnaXYsZpfB7QgdIGpSScXfTk6ZGeaO473DB9pzs
X-Received: by 2002:a05:6214:3003:b0:6e8:9053:825e with SMTP id 6a1803df08f44-6f2ba9842bbmr5915736d6.17.1744840719178;
        Wed, 16 Apr 2025 14:58:39 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1744840719; cv=pass;
        d=google.com; s=arc-20240605;
        b=KvJPtZbvUoeTK2cJ0eq2D07yLaA2C6+dN+ANp5Jc4oMUtPP1zp5yUUV/65ujJ3Pe6d
         pGk1AEGWu/E/4maP1DoGrZ9GkzOH+tijkmHm7UQorc0C6jB5uQaSsF4vM8CougUBpDE/
         tiqkoTMRcSpmDwJCLv+ByhJJUm8VOerQaznVFJGMO2oYSdEdGg52JaVJGlEBmNg5xVxZ
         y0LWLmjp9pRtUJvwO+KrNtG8JaWG4rpAu7EY1ZZNYNPsTMLzlTkFuTcyJaW1G1fpY6Ey
         wZG/KnenvhChpSnDmzkfIFdmsBoid1o3KxXspEiHfUS/7b+Lsc3KR7Tb4BGDiWkMo71A
         aGzg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=26biSeKyClnKK7tVS05KxYECIm8bQH64xTAw4ai6yEU=;
        fh=pr/dSBFL9oLV7kU9Ai5m+xSM8b3nJsKetG/wF2Loub4=;
        b=FbJZedpHsJsVtu5vkq1nuDa2nhPUv3wbfUmR4tTOKpJuZs8esj+ODxJ0nbQP1UAo+x
         oCtxWahIdSKCFqFoSEoeLsgk2q64cbNmjV1AS1Bpo47somIKTUr8CnxDmkmEO9P/V3Zd
         YIrpllfy6lyXIkfuLNXubRLlNduLPURyHtbqWPEh75tgjncF6H7NZxdt7wxArscNDAci
         fnFaaGGyOxKvQn2asePxYJwnoGz/dxM6htlFbCNLIiZLGszB7hUTg3Df2X0BPoM6MX8O
         DS4zELdpu9h4nXxuj92O+RL57MS5Obnt/6kEagIg6rMHClY+1HemdQ7CXYJwLlYR87Ks
         Cn2w==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@oracle.com header.s=corp-2023-11-20 header.b=a1cV1Uhs;
       arc=pass (i=1 spf=pass spfdomain=oracle.com dkim=pass dkdomain=oracle.com dmarc=pass fromdomain=oracle.com);
       spf=pass (google.com: domain of kvm+bounces-43498-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45d1:ec00::1 as permitted sender) smtp.mailfrom="kvm+bounces-43498-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=oracle.com
Return-Path: <kvm+bounces-43498-alex.bennee=linaro.org@vger.kernel.org>
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org. [2604:1380:45d1:ec00::1])
        by mx.google.com with ESMTPS id 6a1803df08f44-6f0de9735ecsi162123326d6.154.2025.04.16.14.58.39
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 14:58:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvm+bounces-43498-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45d1:ec00::1 as permitted sender) client-ip=2604:1380:45d1:ec00::1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@oracle.com header.s=corp-2023-11-20 header.b=a1cV1Uhs;
       arc=pass (i=1 spf=pass spfdomain=oracle.com dkim=pass dkdomain=oracle.com dmarc=pass fromdomain=oracle.com);
       spf=pass (google.com: domain of kvm+bounces-43498-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45d1:ec00::1 as permitted sender) smtp.mailfrom="kvm+bounces-43498-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=oracle.com
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BFA1B46003D
	for <alex.bennee@linaro.org>; Wed, 16 Apr 2025 21:58:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B67AF23237A;
	Wed, 16 Apr 2025 21:58:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="a1cV1Uhs"
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D74A23534A
	for <kvm@vger.kernel.org>; Wed, 16 Apr 2025 21:58:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.165.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744840684; cv=none; b=SAkDTWVcq7eqqFx1sKA8RsfCMpvtkY/HaTMyz3Ake/ZSqqqyr61kYa7ug3QmqjbhBqustNPRZThz0epZlfccFkb8wT6O1nudjirDKzlVnHC1qmmfS/5uazrku1QX1lNgONrRLxwzUyPcYr9t4Dj4QVHEFKad/JkvTE/jQ76X53k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744840684; c=relaxed/simple;
	bh=bXXWF0aEhpaycxotmu6g9BXCxDtzaqBk0G2QtOg3k5Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=URw5elq2BcEQNvlq4hA4+szsd4wCxzTqFONmdNNDN7IATwbxxVp/h/NBsbD/b3Bf7yqolDz40ymsDIdTZYUaJV5cQssdxI1p3lnzR0pQ9mMsMEeR+SEzVhhxijW/mt/WV9yLyfWKYJSCYom9ouij/rtbDJtSTT0rAx+irmgrquY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=a1cV1Uhs; arc=none smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53GLN0Ax019727;
	Wed, 16 Apr 2025 21:57:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=corp-2023-11-20; bh=26biS
	eKyClnKK7tVS05KxYECIm8bQH64xTAw4ai6yEU=; b=a1cV1UhsWqAzYj8Yu5rsO
	2mmDkS7CTJm6PUF0t9K0XDOftBVvByHhvaUvPXcvjBYeYmWtPcQoRaWZv8TaKXT1
	pIMX60mG3yWsZX8WbLXl1az7Tetu5FqpmIXe43PvjQuK0Fivfz2eHDiJWr/H1HA3
	a6OLAsU+g5wBOhzeb/R63/8epPDKoRQGPkRF3749MylE5xawob22v6mc8Y0XbEki
	MsER0h6HadmTdqmpIiDsDhs8gdbWcUEZPt9bVNsEV7QyzSmSU8Ko8/HgUpsBmZPQ
	CZZeK2a703uNbKOD3WhSSBSrgIuSMhizNb+RAmFaUO4N30tEP8mOomzwoN/X5Y1d
	g==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4619444xq6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 16 Apr 2025 21:57:08 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 53GKwS07005672;
	Wed, 16 Apr 2025 21:57:07 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 460d5xhvg6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 16 Apr 2025 21:57:07 +0000
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 53GLv1qS036583;
	Wed, 16 Apr 2025 21:57:06 GMT
Received: from localhost.localdomain (ca-dev80.us.oracle.com [10.211.9.80])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id 460d5xhvcp-3;
	Wed, 16 Apr 2025 21:57:06 +0000
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
Subject: [PATCH v4 02/11] target/i386: disable PerfMonV2 when PERFCORE unavailable
Date: Wed, 16 Apr 2025 14:52:27 -0700
Message-ID: <20250416215306.32426-3-dongli.zhang@oracle.com>
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
X-Proofpoint-GUID: 1ZX-wEgbeIX-zrphKb9xK-enwtl1Thwj
X-Proofpoint-ORIG-GUID: 1ZX-wEgbeIX-zrphKb9xK-enwtl1Thwj
X-TUID: GBEp3jAK30BQ

When the PERFCORE is disabled with "-cpu host,-perfctr-core", it is
reflected in in guest dmesg.

[    0.285136] Performance Events: AMD PMU driver.

However, the guest CPUID indicates the PerfMonV2 is still available.

CPU:
   Extended Performance Monitoring and Debugging (0x80000022):
      AMD performance monitoring V2         = true
      AMD LBR V2                            = false
      AMD LBR stack & PMC freezing          = false
      number of core perf ctrs              = 0x6 (6)
      number of LBR stack entries           = 0x0 (0)
      number of avail Northbridge perf ctrs = 0x0 (0)
      number of available UMC PMCs          = 0x0 (0)
      active UMCs bitmask                   = 0x0

Disable PerfMonV2 in CPUID when PERFCORE is disabled.

Suggested-by: Zhao Liu <zhao1.liu@intel.com>
Fixes: 209b0ac12074 ("target/i386: Add PerfMonV2 feature bit")
Signed-off-by: Dongli Zhang <dongli.zhang@oracle.com>
Reviewed-by: Xiaoyao Li <xiaoyao.li@intel.com>
Reviewed-by: Zhao Liu <zhao1.liu@intel.com>
Reviewed-by: Sandipan Das <sandipan.das@amd.com>
---
Changed since v1:
  - Use feature_dependencies (suggested by Zhao Liu).
Changed since v2:
  - Nothing. Zhao and Xiaoyao may move it to x86_cpu_expand_features()
    later.

 target/i386/cpu.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 1b64ceaaba..2b87331be5 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -1808,6 +1808,10 @@ static FeatureDep feature_dependencies[] = {
         .from = { FEAT_7_1_EDX,             CPUID_7_1_EDX_AVX10 },
         .to = { FEAT_24_0_EBX,              ~0ull },
     },
+    {
+        .from = { FEAT_8000_0001_ECX,       CPUID_EXT3_PERFCORE },
+        .to = { FEAT_8000_0022_EAX,         CPUID_8000_0022_EAX_PERFMON_V2 },
+    },
 };
 
 typedef struct X86RegisterInfo32 {
-- 
2.39.3

