Received: by 2002:a17:504:17c4:b0:1be9:327d:8ee3 with SMTP id o4csp4649036njd;
        Fri, 25 Apr 2025 14:34:05 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCUPOtHRyr+9WQ8Yp4o5bqwYMUawQx59oHjx0GbZa1vIynz7PAnJNShSwJa0glRfmVb5U6HdMSP+m1TXyg==@linaro.org
X-Google-Smtp-Source: AGHT+IEWmMLFEtlZ57N0/zw2RfaVTT+2TDPaLxWBK0X89j6MZgisRSKJHF8XoRw8vqTFxfg3hHBP
X-Received: by 2002:a17:903:2445:b0:224:2715:bf44 with SMTP id d9443c01a7336-22dbf5ede35mr59739045ad.19.1745616844967;
        Fri, 25 Apr 2025 14:34:04 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1745616844; cv=pass;
        d=google.com; s=arc-20240605;
        b=ReC0b1azs7Q1bjxZd7D96MFq7663g47UxkdvU1HLZyu7LGOE/dKk8LhOte7Pk0u+WY
         TK3cfOAFRxQ/Qg4ndvfy11zfb6RsaeSBkdISmMF/J+CQeNYIaGQ0pvp/YbR0c9KBR9vf
         LIXGH4FYCbsdyEtgFm0H/kTqZff+RB7aCIxO3be23Yevp9Wiaqv03a9mAJMdzdUz+YcU
         Z4qnrgZZnOVc23Oy9eMaT4ysTWrEfb33vvBUIGaSxtdqVhvam32nqkcACKMh/41TwzyF
         mlM2aRvC/X2IA9cgU90YgrRrZvdJZO9Y7NAB2e5xKH/8xLd+OVnz1ABEpUhm0kv8PI9z
         ha3g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=vHlal5sM41HUIlBH1XL+9AlvxE8dYuloDAD1r41fjqU=;
        fh=pr/dSBFL9oLV7kU9Ai5m+xSM8b3nJsKetG/wF2Loub4=;
        b=AG8WL20YQVTJwM1cshoAfJ6X7VEVGZ4FQoTMc3dY8Bkym85+0el9ZIRXzvUjIhbVc1
         ctHX5Wacyqalb53pvNGLj6nfeoWEy7o1bEtmgOoUlpBQ2+bdcNgfMuswUfQicfm2tPnX
         +IIKb8DiXNdOCUt+wb1jLhAE6QlP8GBEQF4NTdv+6PRHBAhgF5xqpsWBj6nVtoBV1JRi
         mJ+HI6amuD0FL7IL5UdVgoRBAtoLjk98nMB1xVwvFX1lTMJ4dCFX1GGVMdfhwImQYoMl
         zPDnO+2/UyDs2m2+6emOwoxaUYgs7hE4SXSftQ8BZAMIt1RWYkgZQRG7DtP7O0cTH5dl
         hY/Q==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@oracle.com header.s=corp-2023-11-20 header.b=CvP2qdZn;
       arc=pass (i=1 spf=pass spfdomain=oracle.com dkim=pass dkdomain=oracle.com dmarc=pass fromdomain=oracle.com);
       spf=pass (google.com: domain of kvm+bounces-44361-alex.bennee=linaro.org@vger.kernel.org designates 139.178.88.99 as permitted sender) smtp.mailfrom="kvm+bounces-44361-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=oracle.com
Return-Path: <kvm+bounces-44361-alex.bennee=linaro.org@vger.kernel.org>
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org. [139.178.88.99])
        by mx.google.com with ESMTPS id d9443c01a7336-22db4db9b0dsi60829585ad.124.2025.04.25.14.34.04
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 14:34:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvm+bounces-44361-alex.bennee=linaro.org@vger.kernel.org designates 139.178.88.99 as permitted sender) client-ip=139.178.88.99;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@oracle.com header.s=corp-2023-11-20 header.b=CvP2qdZn;
       arc=pass (i=1 spf=pass spfdomain=oracle.com dkim=pass dkdomain=oracle.com dmarc=pass fromdomain=oracle.com);
       spf=pass (google.com: domain of kvm+bounces-44361-alex.bennee=linaro.org@vger.kernel.org designates 139.178.88.99 as permitted sender) smtp.mailfrom="kvm+bounces-44361-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=oracle.com
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 332089A3C43
	for <alex.bennee@linaro.org>; Fri, 25 Apr 2025 21:33:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BC29221F2A;
	Fri, 25 Apr 2025 21:34:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="CvP2qdZn"
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BA2E21B91F
	for <kvm@vger.kernel.org>; Fri, 25 Apr 2025 21:33:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.177.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745616841; cv=none; b=TbcCxYT/9/CGenDf5AmCsh271bc2S25SNiiOa+7DN8kRMc7BegO/a7gUmAa5eaQ9ehXLbvsLkG/KCnr7d0oR6hSFaJRHKaSeHh7xmpcOYGgk9V2tS11/RC6Or5C6ejMqQCXogZrgBteDMZ+MuC2GjtX6HobDXNB+RFVeIcX2lmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745616841; c=relaxed/simple;
	bh=nYeiGrZwsEuqaPls2cmWSHVYP8mpKix/cHpZ3BElDsg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SMYn/bD0zlgB3Hh3vbmhS3f3bidFewko8i5nabzoRC+NkxmfCYPh7DGgRrr7NGKF8TrewXU9VoTZ713k9Tur96R4kdWvTj25uIQiUKOr/BuarHVB2/JCo44+64gKtAxYAwG3TtmNHL5koiQsechVRniunLrDktW4fs+rmiFyWME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=CvP2qdZn; arc=none smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53PLRGlL020534;
	Fri, 25 Apr 2025 21:33:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=corp-2023-11-20; bh=vHlal
	5sM41HUIlBH1XL+9AlvxE8dYuloDAD1r41fjqU=; b=CvP2qdZnNxsZXbWraBBrk
	h2y3+HiBB14vuuyA9oLIy7X4ecYhUYaR+ln9EwbX5p0AD9KishSOUPPfhRvfW1mh
	fzdgC3iD7zBguqTGJafew90beei6X5vJPsl9koR2nP7AAJHKUcHLoFKtX8xUfR2Y
	uYD8smJxy4Djb4I3EnS/iwG1ZdRDHd1j8tvN54XpUz3jXGOpSAxabIj99FlDxJNn
	bT1L0POxq9I2X9LVSJ+loiLw+Xm/T7nxLHZVTH6W8bqGi3gWCNNFwQLVf9sscYK8
	6ndDvW/0EMJ5O9uLimx9tyLylfiPThCcRwqYXGvjaU5cNva/NExtIseztT9ejv9u
	w==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 468jak80ra-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 25 Apr 2025 21:33:12 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 53PJV30n030849;
	Fri, 25 Apr 2025 21:31:46 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 466k095v5p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 25 Apr 2025 21:31:46 +0000
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 53PLVdAZ039597;
	Fri, 25 Apr 2025 21:31:44 GMT
Received: from localhost.localdomain (ca-dev80.us.oracle.com [10.211.9.80])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id 466k095v2d-3;
	Fri, 25 Apr 2025 21:31:44 +0000
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
Subject: [PATCH v5 02/10] target/i386: disable PERFCORE when "-pmu" is configured
Date: Fri, 25 Apr 2025 14:29:59 -0700
Message-ID: <20250425213037.8137-3-dongli.zhang@oracle.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250425213037.8137-1-dongli.zhang@oracle.com>
References: <20250425213037.8137-1-dongli.zhang@oracle.com>
Precedence: bulk
X-Mailing-List: kvm@vger.kernel.org
List-Id: <kvm.vger.kernel.org>
List-Subscribe: <mailto:kvm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kvm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_07,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 bulkscore=0 mlxscore=0
 spamscore=0 malwarescore=0 mlxlogscore=999 suspectscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2504070000
 definitions=main-2504250154
X-Proofpoint-GUID: VrPZdl00NIu9xBUSjS3t_PRfCLeGEfzw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDE1NSBTYWx0ZWRfX/Lw0t1TvT23d fbnZr5MGgSwvi1x5ZncyefTP0G54r1PQfuMpWPz8Fh0aL4mRjw0UIlwPDuwFkIDGR0PqOfdH6fK 6cRjTOglTNNt9J6wgPj9J4VTbIDKgmPUA/mePjFaVqy9WaRPaXWl52yp4DNRnGPqz/76fmWpECM
 Hp31HSuLfIVoVgw/0CeItRDfycfexRwaAwQaILonyUgql8ZPTcx6ezMckl0QJdS2StEKNyEYlYW ZpBA4CwaR/Lz4RYWc+OFWq8t3ZesdW1bV0M2F0aw6Mf4FBpsjtGIgbkKT5zewYWftmc8ogn1vGF aIuYxObukJYiwQXw3kejeo98FSCoJXV1O+J2fSnTxJgJvW0Lhvz+YJfVncbbPnDAF/A9+Z9A+rA bo0J73r8
X-Proofpoint-ORIG-GUID: VrPZdl00NIu9xBUSjS3t_PRfCLeGEfzw
X-TUID: fkoxgI+TlTTE

Currently, AMD PMU support isn't determined based on CPUID, that is, the
"-pmu" option does not fully disable KVM AMD PMU virtualization.

To minimize AMD PMU features, remove PERFCORE when "-pmu" is configured.

To completely disable AMD PMU virtualization will be implemented via
KVM_CAP_PMU_CAPABILITY in upcoming patches.

As a reminder, neither CPUID_EXT3_PERFCORE nor
CPUID_8000_0022_EAX_PERFMON_V2 is removed from env->features[] when "-pmu"
is configured. Developers should query whether they are supported via
cpu_x86_cpuid() rather than relying on env->features[] in future patches.

Suggested-by: Zhao Liu <zhao1.liu@intel.com>
Signed-off-by: Dongli Zhang <dongli.zhang@oracle.com>
Reviewed-by: Zhao Liu <zhao1.liu@intel.com>
Reviewed-by: Sandipan Das <sandipan.das@amd.com>
---
Changed since v2:
  - No need to check "kvm_enabled() && IS_AMD_CPU(env)".
Changed since v4:
  - Add Reviewed-by from Sandipan.

 target/i386/cpu.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index b4d9ac032b..4faae503bd 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -7256,6 +7256,10 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
             !(env->hflags & HF_LMA_MASK)) {
             *edx &= ~CPUID_EXT2_SYSCALL;
         }
+
+        if (!cpu->enable_pmu) {
+            *ecx &= ~CPUID_EXT3_PERFCORE;
+        }
         break;
     case 0x80000002:
     case 0x80000003:
-- 
2.39.3

