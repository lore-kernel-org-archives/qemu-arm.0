Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A2CC606A31E
	for <qemu-arm@archiver.kernel.org>; Thu, 26 Nov 2026 23:41:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=beGGu0XU;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IWfgHVFs
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xWj3K-0002Cl-It; Thu, 26 Nov 2026 18:38:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xWj3G-0001s8-8h
 for qemu-arm@nongnu.org; Thu, 26 Nov 2026 18:38:54 -0500
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xWj3D-0001Cq-Qm
 for qemu-arm@nongnu.org; Thu, 26 Nov 2026 18:38:53 -0500
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6AQJvrBg3339622
 for <qemu-arm@nongnu.org>; Thu, 26 Nov 2026 23:38:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 cqmwO8eUXokHwY7k+6o8UrAjVE1mFGN4V/zMu8vhll0=; b=beGGu0XUNAd3y6D5
 1y8bnIEIUIpHGh6RqGPcwyGI1UFqii2cXGxkV9gtp9PGVnSLdWwAcj2mfP0PjX4p
 A8ms/CARJCkeCyD1PR6ik8CmeCuU1jWMmrTKgxTrI9hTjUbQK7F8NNdL88oZNBcb
 FMarzp4N4uoZ2ZoD6I+4OMvYnia+HULJe3O1OMs/204VnN3uNhKUGgzE00EgvfdP
 h3MQ26e1TUI69ihQ4NL0HAaRH8p9FKidLCfmPRVG3TeVCRcpu47VgXgZYp87goXv
 SZR+pKnB6yX0EPHv8Et1Oh2dOVttwrhq4wXL2OofFO2JdDHqoXb/yaFP490sXhLZ
 Q+/9rg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6pgqhdvq-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Thu, 26 Nov 2026 23:38:40 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-9210a12765eso104063746d6.0
 for <qemu-arm@nongnu.org>; Thu, 26 Nov 2026 15:38:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1795736319; x=1796341119; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=cqmwO8eUXokHwY7k+6o8UrAjVE1mFGN4V/zMu8vhll0=;
 b=IWfgHVFs4HxmY81063GfCpBUI113V/H6K7kbFV+NLTTs0wN2KRkpmHyhQovUBtae69
 1Sa0bBwsBgiykd24j8k4XLDACVRkVtKnaiEJ9z0K2cyCOR/XgbTx+uClo0+BfbI9IJG0
 Jg/VHQ47CmlOClpAj7E9Dyw6F+TWN/K5Xvt32RjQ+beJy07lsEdVOaV+tiS3XZfxcbLZ
 uGof9O9sa+zbHKr6KMfsjLZF7s4xPPoQlP+yzPgnSf1uSGN7dL24bESLvVgO2OHDUvUY
 w9zAWNbnsZ1Nt6tjkSdaLUUy5BbhKJwV74sRiw/qsXByec6gFOtQEjl0U1m83lLHtjD1
 MJvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795736319; x=1796341119;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=cqmwO8eUXokHwY7k+6o8UrAjVE1mFGN4V/zMu8vhll0=;
 b=0kimgVTdGzNsccNtJBO7TJB0HQlZy/dudCtkgLtqIi0QEGlEJ/P1X1tOvov18oyM/+
 NsmamjlIHCh6BeJ86XDdRb52chv0MMHo0cAxmJtqiAfmAWSeFvgSnHyKVS1my1dtSm8Z
 sHKc4QaiubhGoNAE6VB9bvGjYgQamI5EaoIou/ix1o1dSUwQM8fTZkQG1TODkQPURWOA
 A9ODWwlLMx/t8RFdfn7zeqN/jyjFBfQChPe9fZKk7upI6nuyYu1NTKv/bJZzmXP8aCnG
 VRnyIDvzyh7SG2OAEcqOoKFwP5P/VVnmsxfa7PoetIM8Y0CbMD+2H4u+ww+OrLSfkfc7
 i47g==
X-Forwarded-Encrypted: i=1;
 AL+hErE1iWVAbckcWICpX3dnbnbDXf0jSW7na0H9FSEbEwLX1NuW3cWeS6Ilb3jJ+lkZaiwVa8pYSEJ86A==@nongnu.org
X-Gm-Message-State: APuU4Z8uboQWzm/FrVSpnBN1JjzlRBY++brGWXFzYzVS4eFzGvyEggpR
 1GOrWdEGW9/r525b5dXQ+fMVuu7RH7/sSiNhrZv4gH5M8Jfpw9Jwew0tZ+wJ/AB8XW6rDlPUAS1
 h3xl5+3DYiHR/7g1erE2QSNsG58A3dKTAJQ8JuKcqHivVZStJtbQ34ts=
X-Gm-Gg: AZFdTZc5dDh9POh92tu2NBz+z8wmpJ2t7Ng+YseKgKbmAeXrIMkXPJKiypacr6cg7Dp
 JoxH9onuvwc1UuZ+f30Sb3l3nGuz2Zmi2iWG6XT61dUDDNRaAE6PJ5vcF/OoAUS1C8uf0JW272C
 p4Ftyu83cmY8psc9105u1A1LMjMZY8qg7jJ7Q8ahi5OI7yLbO8LG/HfsMzCwbPmcOfvCHFHxhfX
 oioh7B3NHrVj/60+31KzYpbHROBuDxOXU7vdzWGATyhZ0dcP3/i7kgIvqGQ3lghkZXKgZqiUecr
 q2JPuas9jep3kMCBJ0JFreIjarPssWhD+hOWegr6OMiKRVCgmS8KpCw3GCGtIEjTBSRAAti7w7w
 a3RptqWy+sZ0vF4/BVb/k7AQk5aN/jEQbF9zKGLk83wdb/r39u82WqIFrvgI6d5nriACQH+ISwJ
 iCDeKuezTpvvG+qg==
X-Received: by 2002:a05:620a:2912:b0:947:81e0:bd0b with SMTP id
 af79cd13be357-949ba99cb28mr3822467085a.20.1795736319400; 
 Thu, 26 Nov 2026 15:38:39 -0800 (PST)
X-Received: by 2002:a05:620a:2912:b0:947:81e0:bd0b with SMTP id
 af79cd13be357-949ba99cb28mr3822465385a.20.1795736318999; 
 Thu, 26 Nov 2026 15:38:38 -0800 (PST)
Received: from localhost.localdomain (pmd666.hd.free.fr. [82.67.153.177])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4ab6a67fe48sm39611286f8f.23.2026.11.26.15.38.36
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 26 Nov 2026 15:38:37 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Anton Johansson <anjo@rev.ng>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>, David Hildenbrand <david@kernel.org>,
 Cornelia Huck <cohuck@redhat.com>, Eric Farman <farman@linux.ibm.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>
Subject: [PATCH 19/24] target/s390x: Use 64-bit TB flags
Date: Fri, 27 Nov 2026 00:35:57 +0100
Message-ID: <20261126233604.67722-20-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261126233604.67722-1-philmd@oss.qualcomm.com>
References: <20261126233604.67722-1-philmd@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: H7v126zKgzsvzeyfpx-ZmkWF_sLXU8Md
X-Proofpoint-ORIG-GUID: H7v126zKgzsvzeyfpx-ZmkWF_sLXU8Md
X-Authority-Analysis: v=2.4 cv=A7H5rKWG c=1 sm=1 tr=0 ts=6b08c300 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=nz36NW0qrpeEijYxj/H2Ew==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=vHQHl_Q7FjuyMDeck6EA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA5MyBTYWx0ZWRfX4dddNPEjcQIk
 neehVgsh7J01X8cfZ5qxCL0q4u4xmzDDdFKHbHyaADYdIAWpQxrOFEDdP1eFp4o8+OQVdwjy55O
 u/GG9dhjYA/NHfqXafFQZZqJelNQW/0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA5MyBTYWx0ZWRfX0G/mGisewzkG
 0PIGSJRVOWPsaO0ZEzQ5VVQCewxMHFL/mLysauHM5J4bojl3EYHoBiRnwQlUJB87Q7o8C4Naau0
 FY3VlgxePUwD0lw6J21OQEy35N/XvWmZnYKP0sVDuPMP+eoa70QdEUkIvKh+GNIJTk1UXIjKSCG
 JY/EQhlVBwRsO/uc3Sa5Z6M/3nRNhQOfps5n2rUoA8OdcQoK47PXCACiAAC9ZtiP69smzzgbPEd
 rCbrQmKd6H/Kg6Lhcy/SkGYOUmDUIqH5aCiNbx9eLwHvr8C5PguumFjveUZYES8cSmF7eQkQIu2
 1EqiAOf/ef4GXOHeOZ/PfT5bI3TU8a2OVQPbHlQWfreNfNQaFxjZ8uwQ0UhZ+PNPJ1g0rN/A9VP
 PjlnKzDlEc9Gt47f8A6B+cI/FFxI4Tj756NJTnb0KGHHJFLascmFdu/gz2HORbGJZTiQK+kEY3d
 eM/eycsGqLIlpVhez/A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_05,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 malwarescore=0 phishscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260093
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
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
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

TranslationBlock::flags and TCGTBCPUState::flags are now
64-bit, use matching types for the values derived from them.

Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
---
 target/s390x/cpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/s390x/cpu.c b/target/s390x/cpu.c
index d1250945d489..c6564974c50e 100644
--- a/target/s390x/cpu.c
+++ b/target/s390x/cpu.c
@@ -319,7 +319,7 @@ static int s390x_cpu_mmu_index(CPUState *cs, bool ifetch)
 static TCGTBCPUState s390x_get_tb_cpu_state(CPUState *cs)
 {
     CPUS390XState *env = cpu_env(cs);
-    uint32_t flags;
+    uint64_t flags;
 
     if (env->psw.addr & 1) {
         /*
-- 
2.55.0


