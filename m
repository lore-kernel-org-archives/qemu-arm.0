Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC98AC624CF
	for <qemu-arm@archiver.kernel.org>; Tue,  1 Sep 2026 09:56:20 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x1LC1-000216-8q; Tue, 01 Sep 2026 05:54:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1x1LBz-0001yP-L1
 for qemu-arm@nongnu.org; Tue, 01 Sep 2026 05:54:11 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1x1LBx-0007fa-Vt
 for qemu-arm@nongnu.org; Tue, 01 Sep 2026 05:54:11 -0400
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 68179HGP1975447
 for <qemu-arm@nongnu.org>; Tue, 1 Sep 2026 09:54:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 ujtZfmyEeRuspxcgfhS3V2xIrt3RbrmKuzrHykBSXQI=; b=ccn16Hcx1CjwfTnh
 jukcwrF90/I+Pq08vxeEkhaJbogyQMfcciK+7j3eq9MAEuQNapDBPZ+ydinQ+8v2
 GWP8ZO3QAXzMmt3Awhc2kUTRZdAT0uqB2BXVhe0GmENxFFttnmhngIrxnZmxXY47
 1PgH+Ajo3kOuny1BbbZsBi7ze/hapELb6B6e+ZT7HWBc2SeSXhMng6cDcZv671dY
 jk7Dvy+mTXIwIDMdiBLv/1/z3GR/aY4ziRtgbXIGvNRzyI6+mMvGBoMUv/P+b8ZS
 FiZM9aFeQ960r/fa0M7vnoiMCcKxTy36zBYQkutdBVfxga5sPEdfZBaFeiZHPxnf
 HZY49Q==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdp7r1pae-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Tue, 01 Sep 2026 09:54:08 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-934956beec8so142207585a.0
 for <qemu-arm@nongnu.org>; Tue, 01 Sep 2026 02:54:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1788256448; x=1788861248; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=ujtZfmyEeRuspxcgfhS3V2xIrt3RbrmKuzrHykBSXQI=;
 b=HnP9slVVZg2CHCHQ8ALdZM7Daslx6FUkYlwqOel0PllvoPnTdMKzTlkXSYM/zm7dsW
 A4ILn+BYhE3c6UmdiYSfeqALuf8i5qjHZsEHgOQmeqjpsgqamrLST4jin4oBXD7SCFRj
 vnok/rjAGXD0yGrnq0JgoxYH027tttc3iY7PUSF1nHuBEPQxwxKBsAu45aE5Dsg8CNJk
 JrteGfVI9AUAMV+PmgQ3ABDgr+fmsFPl9EixoPq+0B7nl4l3+OxIUXj7fd3wk2qspW1m
 SL/ynNBYC7dECDoNSDjlDAOWq3T/KRIB2HQ3FKeSD5ue8kaflL3dbsIukv2G/oqVap/m
 Z+BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788256448; x=1788861248;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=ujtZfmyEeRuspxcgfhS3V2xIrt3RbrmKuzrHykBSXQI=;
 b=inxkCWNsz7Pq1sxdN3dRmk0Rc2B2UMM5kdSSOvXejNDIxoqzpKyvDuXbvd8aQma8px
 QmxSCpsGkaVv4k8oZNZqhA72jNKaLgfA3rgzWUOiJKkS5xCQvKbGTjrbphFqja9QpzIx
 fgOn/a7A3AEsa51v1UjAKrNAiE7eTta1uSui0WOwBPy42ZbN9kuuXit5wZVUAjlcsnwM
 1mMj5B3zUocV+MoezCcALbuoJWP3+KAzkHmfngI1l1IrRDXEXdrcxMiqYDw8e2OOLzkg
 Z2CJsQAelDUrULflAh11LKmgvHUbHOLjwVNl7Rght6UKk2ASiO/EjWUSuD3a3swjzvqX
 bDkw==
X-Forwarded-Encrypted: i=1;
 AHgh+RraLwARC8fQLzRZeGktUwWBSoiPuQYESLcVZVz3ItKT5XAqVxxa0Xn0chM1MccICc8kRG23lrVMzg==@nongnu.org
X-Gm-Message-State: AFuF++nSHWCXdpLFuUtnx7p2Qo6N2hlP4u1Rpk8XC5icNOTy+osGEvpq
 3OsVSwGxOt/1ARtzDei0lCEgIVskHFU2Cs43eSifph6VS/eYo5LEA4Julf6Anld8dX76GA1a/IN
 I7FeLbBPrA0Bp3D2iArYou+jIxcF25g5j9/Z0gC72cwkko5+z6vsubvo=
X-Gm-Gg: AR+sD11lK5lDXH8k4OI/20JeYUzfUXAIH9NJ66J6Evguq/x/bF/cyaYYKA+op8e/yuo
 VZKDxNSd22WTUfYXlj9pw/0gLiRF1rGFsjS97NOnx5h8QD2qDNmp3DazXOlmSb394Cc4S+NEUrp
 lo30jVYEZfKgKyBItCPf88g+PfknsqxmbnJLQLcjzSjp2SYHMM644gCnS5fqUuSWMNFSt9bJfCc
 rRv325kHO4ycPcaup3SInrLQvt7tv2Xk7lVLnkZo9Wk8he/8LCG/dlilbwiabVT3cDBoYXkTv+0
 XBA6Vm8FMpWIKL4lKJjQ9oTVmnA5NMn2FAFuzrdjn5psuz162rvOu7C0RgW0Z++vN7EjOAlSk8a
 jGeF2IRMJbos4kDhc2+75BW5NI/aOo4Yd9VcERUis
X-Received: by 2002:a05:620a:458e:b0:939:3cb9:553d with SMTP id
 af79cd13be357-9393cb956bemr1401257085a.38.1788256448292; 
 Tue, 01 Sep 2026 02:54:08 -0700 (PDT)
X-Received: by 2002:a05:620a:458e:b0:939:3cb9:553d with SMTP id
 af79cd13be357-9393cb956bemr1401252985a.38.1788256447715; 
 Tue, 01 Sep 2026 02:54:07 -0700 (PDT)
Received: from localhost.localdomain (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49b9267c369sm237418685e9.3.2026.09.01.02.54.06
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 01 Sep 2026 02:54:07 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Zhao Liu <zhao1.liu@intel.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Rikalo <arikalo@gmail.com>
Subject: [PATCH v5 13/21] target/mips: Constify CPUMIPSState for various
 cpu_*() getters
Date: Tue,  1 Sep 2026 11:52:19 +0200
Message-ID: <20260901095229.72018-14-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260901095229.72018-1-philmd@oss.qualcomm.com>
References: <20260901095229.72018-1-philmd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=beZbluPB c=1 sm=1 tr=0 ts=6a96a0c0 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=20KFwNOVAAAA:8 a=h4i2fRRWLofFFTjKLt8A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDA4NyBTYWx0ZWRfX0NxJDhgslsbw
 3l9OUL/qjD6X6ePgPenottyzf7GeQjvlnbMYFyYf7EzxScIOU5Yqnf8VD2BZROLDHHB771VGNG7
 qVrklZGHKv3tWtG0217B/zvjAk4emrFAO0/TPdUX16XX+YxEGzYxFkRySobKIkjnHwNzrJx+oNv
 aRuQZqZ1ojP2FiuFb4eIW3rFSSl6kaGOnuxY1Nhr5LjQKDC4/owMBQZNGqNwch9TwHOJTPhAEhS
 7km1/jklc4tb8D4TMRZfZ7dXLQ7EQT6Vy2ZsnV9BlDSA0Vc8aNxhuKQ7tnj8gIAii96CRwuPHZK
 d7ra/q77VU8LpY7h/AORHRmlE1T5Kapi5I5gGspmoGTIrzJ9apmc9VLp9QIs5fcWORPxEcOWKpO
 V3/WdDrYzvsWWB9m0tAYj57kSbB2mMu4PTKr+2FH8GScYv0qhcf6ufT8jg+UWnLYeaLBoghw5mj
 18GwEG4SYRRzdxPBIpQ==
X-Proofpoint-GUID: dfzobXR9Db-Mo-yD4xpE2w8To4TQ00Dn
X-Proofpoint-ORIG-GUID: dfzobXR9Db-Mo-yD4xpE2w8To4TQ00Dn
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDA4NyBTYWx0ZWRfX4rlI7c9qkXh9
 IhV2py2yFd6/BL7xMTvb4Y2PflyT8il3zT6Xz+xRlCUiLSDguWIj4uXcKYSdbsEniuetG9afCOT
 10b9X8/Ppowl163uS0bEAWozZx/fflw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_02,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609010087
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Add the const qualifier to CPUMIPSState when
the argument is accessed without modification.

Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 target/mips/cpu.h      |  8 ++++----
 target/mips/internal.h | 10 +++++-----
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/target/mips/cpu.h b/target/mips/cpu.h
index 319147a948c..32549791a18 100644
--- a/target/mips/cpu.h
+++ b/target/mips/cpu.h
@@ -1300,7 +1300,7 @@ static inline int hflags_mmu_index(uint32_t hflags)
     }
 }
 
-static inline int mips_env_mmu_index(CPUMIPSState *env)
+static inline int mips_env_mmu_index(const CPUMIPSState *env)
 {
     return hflags_mmu_index(env->hflags);
 }
@@ -1372,19 +1372,19 @@ static inline bool ase_3d_available(const CPUMIPSState *env)
 }
 
 /* Check presence of MSA implementation */
-static inline bool ase_msa_available(CPUMIPSState *env)
+static inline bool ase_msa_available(const CPUMIPSState *env)
 {
     return env->CP0_Config3 & (1 << CP0C3_MSAP);
 }
 
 /* Check presence of Loongson CSR instructions */
-static inline bool ase_lcsr_available(CPUMIPSState *env)
+static inline bool ase_lcsr_available(const CPUMIPSState *env)
 {
     return env->lcsr_cpucfg2 & (1 << CPUCFG2_LCSRP);
 }
 
 /* Check presence of multi-threading ASE implementation */
-static inline bool ase_mt_available(CPUMIPSState *env)
+static inline bool ase_mt_available(const CPUMIPSState *env)
 {
     return env->CP0_Config3 & (1 << CP0C3_MT);
 }
diff --git a/target/mips/internal.h b/target/mips/internal.h
index c5c286872eb..7dba22300b1 100644
--- a/target/mips/internal.h
+++ b/target/mips/internal.h
@@ -165,7 +165,7 @@ void cpu_mips_store_cause(CPUMIPSState *env, target_ulong val);
 
 extern const VMStateDescription vmstate_mips_cpu;
 
-static inline bool cpu_mips_hw_interrupts_enabled(CPUMIPSState *env)
+static inline bool cpu_mips_hw_interrupts_enabled(const CPUMIPSState *env)
 {
     return (env->CP0_Status & (1 << CP0St_IE)) &&
         !(env->CP0_Status & (1 << CP0St_EXL)) &&
@@ -180,7 +180,7 @@ static inline bool cpu_mips_hw_interrupts_enabled(CPUMIPSState *env)
 }
 
 /* Check if there is pending and not masked out interrupt */
-static inline bool cpu_mips_hw_interrupts_pending(CPUMIPSState *env)
+static inline bool cpu_mips_hw_interrupts_pending(const CPUMIPSState *env)
 {
     int32_t pending;
     int32_t status;
@@ -247,9 +247,9 @@ static inline void restore_pamask(CPUMIPSState *env)
     }
 }
 
-static inline int mips_vpe_active(CPUMIPSState *env)
+static inline int mips_vpe_active(const CPUMIPSState *env)
 {
-    MIPSCPU *cpu = env_archcpu(env);
+    const MIPSCPU *cpu = env_archcpu(env);
     int active = 1;
 
     /* Check that the VPE is enabled.  */
@@ -281,7 +281,7 @@ static inline int mips_vpe_active(CPUMIPSState *env)
     return active;
 }
 
-static inline int mips_vp_active(CPUMIPSState *env)
+static inline int mips_vp_active(const CPUMIPSState *env)
 {
     CPUState *cs;
 
-- 
2.53.0


