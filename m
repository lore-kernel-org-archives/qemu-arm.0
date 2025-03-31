Received: by 2002:a17:504:17d6:b0:1be9:327d:8ee3 with SMTP id o22csp1842634njd;
        Sun, 30 Mar 2025 18:36:05 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCXUMfGN2Yi56XrjMkO8jfmVbWKte5qOmiNfVsIco/XAS/XsO6tCW/5leE+ryZHt/8J1pZdmWN/xvEfxPw==@linaro.org
X-Google-Smtp-Source: AGHT+IFYiZ/hWO5/DCObbxtJr02qdHLGghulT4XWP18uKnuEO/7NwDwvF5MknrgRoKW2I2y7rG1h
X-Received: by 2002:a17:906:6a10:b0:ac2:6bb5:413c with SMTP id a640c23a62f3a-ac738a9700amr753194766b.31.1743384965268;
        Sun, 30 Mar 2025 18:36:05 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1743384965; cv=pass;
        d=google.com; s=arc-20240605;
        b=V3VgCTFDoWlfUUuQ/ICdxiGDQRFIMnXdJsW1v/JkMCgVNrW0itXMFXY4qdRYULu0Ol
         SJa9q4qoBNLCsQUSJlFmw17QIV1PyG5FdEFf7D3+83HT86Mo/bFw0D9yID4/vEAV9grL
         z0rbZWtyWAcuasDI6cg92mNDduVF4772NGaZLRotZ8b5BdxxYHLAy0T+YAY5WrhlLdt/
         Jwpb+if0Q5OW8af/0QdBlvNnz/No54Gu0poXbcBt9lBWfj63UhilBTDBanDVg/WJVqcx
         R7m/Nt/KBvfk6wIbxXmwZrLxJLF0JJAMom//20bKk9GDng1IBC/NdZqgWzJCi0pv3WQZ
         w4tg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=fPfXDrOzaHcHS0nz37sj3IHcdYCKyF/+hei62PcUU+U=;
        fh=DY5/iPQTkaegFowhDos3pccVqX4NyD5RR8nxFVZ/2MQ=;
        b=GE9KO4yg+Tmthp4o4kfZNk1xZYZXFFxf4Ekizo7js16GuFNKeT6FRi9IcoOr7yxv+K
         2D8w8t6YUG1G3U6rmpywzJznL8cXjpO3JS7KVCdErFeCfFegf5mOyVwczwSAWziIRn+M
         c6pUhPvjf9ZX47zSn7bjj0vRAM7p+FLg2xzBc553SNJj2bWUSSEWGr5I1Ze6LZjUM9FF
         Ua9hx5l6recn5PLXXn9VsAXvR4OUY6UV3AVRscOaAokPupaMblK2DNvvCJhZQmCVjrKm
         9PiCut75+s1zE4v8+VwPlMZaeKzNQHkcNG1b91wQUZ8frUAMXGekYwDyGusklEi15ZO/
         dpbQ==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@oracle.com header.s=corp-2023-11-20 header.b=j48wOII8;
       arc=pass (i=1 spf=pass spfdomain=oracle.com dkim=pass dkdomain=oracle.com dmarc=pass fromdomain=oracle.com);
       spf=pass (google.com: domain of kvm+bounces-42223-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:4601:e00::3 as permitted sender) smtp.mailfrom="kvm+bounces-42223-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=oracle.com
Return-Path: <kvm+bounces-42223-alex.bennee=linaro.org@vger.kernel.org>
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org. [2604:1380:4601:e00::3])
        by mx.google.com with ESMTPS id a640c23a62f3a-ac7196160f8si472835166b.610.2025.03.30.18.36.05
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Mar 2025 18:36:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvm+bounces-42223-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:4601:e00::3 as permitted sender) client-ip=2604:1380:4601:e00::3;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@oracle.com header.s=corp-2023-11-20 header.b=j48wOII8;
       arc=pass (i=1 spf=pass spfdomain=oracle.com dkim=pass dkdomain=oracle.com dmarc=pass fromdomain=oracle.com);
       spf=pass (google.com: domain of kvm+bounces-42223-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:4601:e00::3 as permitted sender) smtp.mailfrom="kvm+bounces-42223-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=oracle.com
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BEC52188A4D0
	for <alex.bennee@linaro.org>; Mon, 31 Mar 2025 01:36:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E2B212CD88;
	Mon, 31 Mar 2025 01:35:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="j48wOII8"
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 532DF70823
	for <kvm@vger.kernel.org>; Mon, 31 Mar 2025 01:35:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.177.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743384949; cv=none; b=iEO+TR3ZyfJAyCEyPWvOJ341GARx+jHsTMLkU2OX/ZEckbs116+BluNTktQ3yvv22b4du5dl/5uYt3FYhWhunoiovJMmQFkXd8z64d+K4xpu4qQEtDIENwyKcLtrdx+bdnjSgN3/iL29U8FTLPRSScGFVRCyYot5EKEthTIvFu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743384949; c=relaxed/simple;
	bh=UMgQy+3HBlfdLG75j46TW7KcGsLuo7MHYBWiaRlDiaw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bXrJSgdPWx3vvGq/xs0uZSjM8kpHzc+1WXOyUVs5vZpxCcXjCM7cgegdSYM1/O2PBj96eqT7bo/JqgKZKJ4/CJTjAlgSv0R9hHAVtyvsWim8bTqS3nTldun/NO2xBeNvIuK9jHzavQjz6ONgupj2MdYf9fOTSxfigNzMFPheclk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=j48wOII8; arc=none smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52ULUGXU012777;
	Mon, 31 Mar 2025 01:34:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=corp-2023-11-20; bh=fPfXD
	rOzaHcHS0nz37sj3IHcdYCKyF/+hei62PcUU+U=; b=j48wOII8nGH+cexuKH2Xs
	hLPeajw/H1B8BcT6ooCuFT41h6R+My4gEZNnI+9jfWXY4518Xky1SUVo10BaAYKL
	GNGvLmZe7FPXKKcSjAp2p44JqK8CzVxwBT6t/9zibJZwzrR61oOcbaolvPz6yer4
	brSzqq8BFTHLERPIdkhlKmp/3zjfKo7H3G/Oearzjp6LiWmG/m9ie4WZn4dBeX7X
	cjyLcigj4k3FVq3qliFP6ewUkZPKroNhak6C2NaQWcVMc+fkGltazDewMLqb0pwJ
	k8wSdl9Ay5VqQR1IkKBi3TSoBi5DbZy0N+D60jPbag8ktjrlZoTZGp0t1xMHnkI7
	w==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 45p7n22fh6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 31 Mar 2025 01:34:48 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 52UNQAtl032594;
	Mon, 31 Mar 2025 01:34:47 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 45p7a7ddq6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 31 Mar 2025 01:34:47 +0000
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 52V1YfxJ015214;
	Mon, 31 Mar 2025 01:34:46 GMT
Received: from localhost.localdomain (ca-dev80.us.oracle.com [10.211.9.80])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id 45p7a7ddms-3;
	Mon, 31 Mar 2025 01:34:46 +0000
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
        frankzhu@zhaoxin.com, silviazhao@zhaoxin.com
Subject: [PATCH v3 02/10] target/i386: disable PERFCORE when "-pmu" is configured
Date: Sun, 30 Mar 2025 18:32:21 -0700
Message-ID: <20250331013307.11937-3-dongli.zhang@oracle.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250331013307.11937-1-dongli.zhang@oracle.com>
References: <20250331013307.11937-1-dongli.zhang@oracle.com>
Precedence: bulk
X-Mailing-List: kvm@vger.kernel.org
List-Id: <kvm.vger.kernel.org>
List-Subscribe: <mailto:kvm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kvm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-30_11,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 phishscore=0
 suspectscore=0 mlxscore=0 malwarescore=0 spamscore=0 bulkscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2502280000 definitions=main-2503310009
X-Proofpoint-ORIG-GUID: 3D6zf21AIxxU6X9rNhPEAsUNEuh37aQA
X-Proofpoint-GUID: 3D6zf21AIxxU6X9rNhPEAsUNEuh37aQA
X-TUID: wwVrGFCVW1zE

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
---
Changed since v2:
  - No need to check "kvm_enabled() && IS_AMD_CPU(env)".

 target/i386/cpu.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 2b87331be5..acbd627f7e 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -7242,6 +7242,10 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
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

