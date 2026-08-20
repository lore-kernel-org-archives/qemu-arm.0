Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03910C5DF86
	for <qemu-arm@archiver.kernel.org>; Thu, 20 Aug 2026 20:15:33 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wx9AG-0005oj-5q; Thu, 20 Aug 2026 16:15:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wx9AE-0005ma-VH
 for qemu-arm@nongnu.org; Thu, 20 Aug 2026 16:15:03 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wx9AD-0002Lb-3I
 for qemu-arm@nongnu.org; Thu, 20 Aug 2026 16:15:02 -0400
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67KK7XvQ250313
 for <qemu-arm@nongnu.org>; Thu, 20 Aug 2026 20:14:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 E4Asvl4uLwcbAodqEq9ruJYyCPOIEYw9M6JfsXTVRG0=; b=kscPNHkv/YnPK8RE
 S4s9vj9eYf9FAT2+jcP8js2ETP4TlqthKsHJv4112H10Un/XfPrZQgWSz+6yukRB
 jgMg+gaJ24SPB5/DdJxK+a31n0hktzCLGOPrTGFluQlQlLY1i1/R2qNGJiUukQQj
 /UgZZgVlglZ8aYqfVdVK8lRbr5PwZuX/2PjyhJ1DfkPjemY3RxrsJYDHTE9OrGkP
 5rtYSeHUgSrBRXaLYwb1pxq63eNd7beL3BKrOttmJyhJSGOFT3HfoXwbIaA5VuQ3
 0YIG1+TAH8STLDwxkJOhKEIz7n8hAvvELfhjMWYDqhj6Z4PeK/sip1eVtl1vZBGe
 N2q2/Q==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5w49bejd-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Thu, 20 Aug 2026 20:14:59 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-52ce64c41efso3868901cf.3
 for <qemu-arm@nongnu.org>; Thu, 20 Aug 2026 13:14:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1787256899; x=1787861699; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=E4Asvl4uLwcbAodqEq9ruJYyCPOIEYw9M6JfsXTVRG0=;
 b=R5ngahGRNs15fwnIPmN4fhnG3LdGzoNpvGSGddmbxgH+XEdhSGZEfwpkACdjvNBI9/
 2Nr12RavWml80OfDjkTJvsULYu1bbLpCSfOxtKzjIH94Th6NUkctkdBWg+1wCKpOF+YX
 YjbruiZDIRIF91Z+kvtRH9yQsFuomQIeS+q0wAHJAZ4YAc38s8X7pHOJ84oO+oIEA3rF
 9MCS75zuITqSLTRbXGg/NVRqcpqSUreC/0X7PXU7XRl+IeaDslYD9bNGhwXlvCA02862
 FoSbmp+o3E2KQdPTZR909F8XCS2Hmw72GGhpS7kR1k+zGYYMlvhiE8iTWiFpIpcXF23j
 AF8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787256899; x=1787861699;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=E4Asvl4uLwcbAodqEq9ruJYyCPOIEYw9M6JfsXTVRG0=;
 b=GL6L9VZW7ynKyLI1lPuowK7bkl90BJNFOKdgGt/yDCrFgZ1AN5QMiK20dqXSXgKmff
 4FcRkxRR0ZpDZDylXAY621/QXNEqVeSAhDbquvqqQKDJJR2nHoPLKeB6G7hezEHZUzz/
 06OWr0RMFkpdspKxyDosJTSQtyY+4XwC3waY57Tb+ETz0USyw246OHOhsoS7k5aFXC/3
 7E/qv3xWf11UZWjgKRrDXWPBz/c5xrwJDNbVURXZEiKf0aMH5Ag5whRNT4aXhH+9g2Aw
 ao6qEVrCz2RW6vFF//eKOxkNHP7CIPiJESkzgHJbttm6MDoGhVFF5X34Cp/BK5CvjmkH
 Qyww==
X-Forwarded-Encrypted: i=1;
 AHgh+RrBQSNBHL0htJlj+uf5a9Ur8LX4BeI1W1VKP4rHGjO1gWZ/tLMjs51jCH22ACkG1vJkwLhyhtyEdg==@nongnu.org
X-Gm-Message-State: AOJu0YyEY0tUbhDOlNeFRHsnjY8uxKpXoiGVwpNcJPZZwxNWdoVJDnD/
 vVXoIQiftEy1tlyA9MJAl8fRH+YmEGha93YDV9LB1A1EEvwRE+GsQ0i4NT25vWni4Sw+jadqorH
 h1xeSmuWfNkF8GmDH+sh19OH3LwXOACypK93mPff/5KST3odKqYQTFhg=
X-Gm-Gg: AR+sD12rAPhguYcMnVsAL50hygtOO72SZe1DChpe6Rsr9A+jb/th92Jjkp98P531Mc6
 C7Ku8JnbzSCCsNI9cNusdd2HFAd+bVNKo2WqRjNAFtZbkXIh9rUkN/legh/I+QdKqBdQzFSE6Ij
 gitcl8ONt+PjUrgQHdFC6NYKA179VmA8e0WMHuYGpDHLuHbdxUFyhO513icnLzqm/QVVnS9+bPH
 X/CgrxoLc8vOsSXJlsDgXPewvqW9F4HE4CUab44dqsti3j35FF9cmHRNkzel+V6ifY+6AdPqDdq
 sHBC7RczUatEp8WEzH9xsr3JzSmVT7VIuVJy9ZO7NdIoErATeQCrqFOJGKGkaS9ty7X1ixzFD+w
 6qPhr5aN4/Kn2he1vHRlyyCPiS74CdfMSYshGla9Chg==
X-Received: by 2002:a05:622a:a1b:b0:52b:4f1a:5fde with SMTP id
 d75a77b69052e-52df5864a38mr11139661cf.19.1787256898782; 
 Thu, 20 Aug 2026 13:14:58 -0700 (PDT)
X-Received: by 2002:a05:622a:a1b:b0:52b:4f1a:5fde with SMTP id
 d75a77b69052e-52df5864a38mr11135411cf.19.1787256894914; 
 Thu, 20 Aug 2026 13:14:54 -0700 (PDT)
Received: from localhost.localdomain (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-499b90d3046sm4287185e9.1.2026.08.20.13.14.53
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 20 Aug 2026 13:14:54 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-s390x@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-ppc@nongnu.org,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Rikalo <arikalo@gmail.com>
Subject: [PATCH v2 07/15] target/mips: Constify CPUMIPSState for various
 cpu_*() getters
Date: Thu, 20 Aug 2026 22:13:47 +0200
Message-ID: <20260820201356.29775-8-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260820201356.29775-1-philmd@oss.qualcomm.com>
References: <20260820201356.29775-1-philmd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDE1MiBTYWx0ZWRfX6oamYQuiGyfc
 Y1vfvPMOf8qhvg5j1b8/w24GPZR3HTEH43uJ6YEikm+LFF1edbTYKOsPfIdrvbvULnu/8uaMaIB
 f+n57cnQNbEitXwnOWKYRuY927w2E50=
X-Authority-Analysis: v=2.4 cv=YP+vDxGx c=1 sm=1 tr=0 ts=6a876043 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=20KFwNOVAAAA:8 a=OdUTIDwS7iTBxe5GiEQA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: xhKFGertTpwty8R9lKGtUNtTqSYln2zy
X-Proofpoint-GUID: xhKFGertTpwty8R9lKGtUNtTqSYln2zy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDE1MiBTYWx0ZWRfX51nOvIL+51uu
 33fid0hoQpCeFxrtpXkrCSwz8mSHqB9LZ4ABsJsL2crBcF5PqVODtmgJXah0F5QzYEBe5mCgSm9
 b+UZoe7Vbr8gXU/AvTS6xBomYrzAMk7GRKqUr2xGhGsO4yBmb26RjZWLoSmqzAwGWKZSwWAUy9n
 bJcu5Vq4JwUZhOR7gTGS6e3luH+0/qUV1Ewa268guTqasTbU79U+V774JOCXU+DO0Uaj+BJvIBm
 znk6/cMCK6SADJjSeAxEML5XUd+k3u5tl2f5B3ZJ/9ye+5kBpUZDhfbaIk83YlI3F30vDAs4H0C
 AVAyketQCldJlKcnIWDGA//oH0n4ek++a6m2v9dIp2opDq9KU7B+Njm14ya8BRWNmaFH9DoKnoe
 Rm2SROCQ/uWVslcxgusxkmkEfFyxZDxxQ9916vnZhJF8lHh7H/GcIFzOTyZEWpzC2Lz9/s96svF
 YsOqkCu4fyxQ8oa6sYg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-20_02,2026-08-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 bulkscore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 clxscore=1015
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608200152
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
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
 target/mips/cpu.h      |  6 +++---
 target/mips/internal.h | 10 +++++-----
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/target/mips/cpu.h b/target/mips/cpu.h
index 319147a948c..6404b342a5d 100644
--- a/target/mips/cpu.h
+++ b/target/mips/cpu.h
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


