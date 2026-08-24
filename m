Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 301DCC5DF94
	for <qemu-arm@archiver.kernel.org>; Mon, 24 Aug 2026 11:20:22 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wySiN-0006MX-Bl; Mon, 24 Aug 2026 07:19:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wySiK-00067X-OM
 for qemu-arm@nongnu.org; Mon, 24 Aug 2026 07:19:40 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wySiH-00065R-8C
 for qemu-arm@nongnu.org; Mon, 24 Aug 2026 07:19:40 -0400
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67O99FEb3575214
 for <qemu-arm@nongnu.org>; Mon, 24 Aug 2026 11:19:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 ujtZfmyEeRuspxcgfhS3V2xIrt3RbrmKuzrHykBSXQI=; b=AHxmfqXpB7AjiZDx
 0DUn0ESZzsAcRKKe6Rc+FhEpEBAIjjS9U0xNHbWN1igOfB//1P3NAhOUsXfK5408
 9qEi1fqx+QmrzEcAhfdj/am2mkttgQUlrm9gjXGBC4zFlR8DnSUS0bXXyOkKHn1w
 rs3njST4jSo+ZYzklKEXygDlOTdYAnvqMN3igy1Gz1vHu3mOFMiFjJ1qUrPE2j4O
 DhqT0uoPwUJ5UwNJ9fxwvdTC57UspkJBs09nwZxM36b+WpqbLrSyfXQexukE2V/v
 D44Fkb9yQQrAJd0C55ZlKJtiEUuoXfwK+UtfMI3zJFvr2Icj4nXC0pTvqb1pLT8e
 B3StUQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g88jpjd4h-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Mon, 24 Aug 2026 11:19:25 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-51bfe3fa93bso34383731cf.2
 for <qemu-arm@nongnu.org>; Mon, 24 Aug 2026 04:19:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1787570365; x=1788175165; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=ujtZfmyEeRuspxcgfhS3V2xIrt3RbrmKuzrHykBSXQI=;
 b=iGJsll09OQf2b+bqhV1Ev3CwJQ81xb3dUb6sK5zaDKyZmBjpW641QN8vKy6fRazfLU
 AuG1K1kPXm9NPfEBi9ETjKX1abtGwDRzrfvSwFeUBBpsi8497TWIACh5VKHypDKM4iLf
 82gx1PGvP2xxOtPDYXHHIDGV1m9OIdn5tYMK3Cauc/fWtpjLb9juAJtZ4AOaL1pt+S9P
 nGUdp6qDgtgxqcOol6JdCTytA2G1vN/QtJATgCZd4PawqiYCVKrXzzJh5k0wunR/lkAF
 bS2XdVKS3/eEDhgxS+J86SqgaXqB2a+vQvSq0aMsn+wO8d1EhFRKK6IFybFqQz9CydM8
 XpKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787570365; x=1788175165;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=ujtZfmyEeRuspxcgfhS3V2xIrt3RbrmKuzrHykBSXQI=;
 b=CbEKFJ9wfCZJ+WnH//l9uTVg/xS0V091jhESEDuzhImOhV2uuXNvjeQ9OMJ2lScWoo
 4aQfxjc/SmTcR2OhDUsOn3xqbt9fRWHcPIhj059Ht1NU0VH+n42UrHOv1sKxRirncfFH
 WtTLaq3TB1wXJ3qX7WlbqE/T6qeCD41/OPVrCiX0JBddmY7Qqryj+rbMQ6i7is1Ptrib
 OasDXbr/tKqJNFVK1C0cmq6raHA9VsWApgERSVKmZbekJcamIioZWSnxSdnPHcWbWyI2
 +6Mgj5uU8hVil+0U48skTqjyQ9OE+frTYkT24ZdxBnXqwooaiU4hStwNBh66G7zdjhUC
 uC4w==
X-Forwarded-Encrypted: i=1;
 AHgh+Rr5KTjsl4SWh+2e1kK6Da5WxAuRvP472JJvCUEwEnfstL1JMhoTKAUOo26zdIHcdxyXC2hFQDiz2w==@nongnu.org
X-Gm-Message-State: AFuF++k6S05n9CbnP7YOZsLrcvLixcHfMtAB9lhXHD/XWN+l/ULqiyWL
 8PR18Ukh9Evtzn0e/V4Wb1p16E+ExHKfwjp3V3KqYVC+Ig32iSkJGGPzu4ZZNGdjQBPL/PHw+pu
 MpHNnjmn+mft6fQjUbFWBNErxnxZF5NYyLbqaRnvou7rrb50y/YoERc4=
X-Gm-Gg: AR+sD13JowzsG37DhxeEQwdSS7s3hMe+SaqHVLHIrQi/Kjmg8lllfcoB/kj47cauDCe
 2qgJWCS9czFWz9EtDW6Jk07MHlij5Gf15+YSOMcUTF51vwuwGzqfZKIh5WoB4n7o/RaOFAe51+m
 nL5qbSMH7xrQAxpZjx9RMDmxrOIgDVkGCJ8xJ62L9pCQYkT6C+XRW/De5MqdiEH+tLcA8+P2oFs
 CO77O7Uqgx6UCVDsMLnOw6v4qUN5WbmQcOMFmTowSBDnljIJOhJHznVLyvPfeN0+PJ+6JdPEsYW
 lw/RERusI0dHqjUR1TQizgUxigkrjZu+P7LAj8/WVn+wdINAyxmMNxWV8vt3sBeKDqNsh3fxtKb
 uPng24IEbhOjaGW38PWOzYkKlwVzf+Fe9bzy+6/WuSCrBAu+dXQ==
X-Received: by 2002:a05:622a:5816:b0:51f:20e1:137f with SMTP id
 d75a77b69052e-52df5766f0cmr266544311cf.19.1787570364562; 
 Mon, 24 Aug 2026 04:19:24 -0700 (PDT)
X-Received: by 2002:a05:622a:5816:b0:51f:20e1:137f with SMTP id
 d75a77b69052e-52df5766f0cmr266543841cf.19.1787570364172; 
 Mon, 24 Aug 2026 04:19:24 -0700 (PDT)
Received: from localhost.localdomain (44.170.88.92.rev.sfr.net. [92.88.170.44])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c249606a8fasm1348981266b.8.2026.08.24.04.19.20
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 24 Aug 2026 04:19:23 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-arm@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-ppc@nongnu.org,
 qemu-s390x@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Rikalo <arikalo@gmail.com>
Subject: [PATCH v4 12/20] target/mips: Constify CPUMIPSState for various
 cpu_*() getters
Date: Mon, 24 Aug 2026 13:17:01 +0200
Message-ID: <20260824111711.26297-13-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260824111711.26297-1-philmd@oss.qualcomm.com>
References: <20260824111711.26297-1-philmd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA5NCBTYWx0ZWRfX3Ki4QnjtYAUU
 RgHpV2v63R+FrWReI0816za5IA09BulMmXSGwPsiDkhOdWZrh6m9iWZL7bI1BS45hL/lxzqRyVC
 rC7UkN0mve5mFK6ONFyNBA0NRrI98nePk4Zl2OEAZw3FdUbp1/ZZj8zkBDiygjunijvtkUvJf9y
 7aU5nr63OyLA7S4VoO2mBKaVwKC3+yQrgpSXA54jkR07MVPvvtAH3e/ulmsbH7bFdZTH+Xp6e9K
 a33FlGNklC2RjRBZ9PYq61U5CWw1edRuBfADmLoec1Ce8MTUqM7lB4iUES5eiCqhBI0h9prO+c7
 Mc1Bw4D2O4K73oHli5UEAOTP9k7GeeI5W4UL+i4dpCjtIU1lWjO6BjZf5gc6OapHEwZ9njQ4IZ+
 lbtAZAU0cykwMTdQbna2tczHxjyt/or6FXcCZzni0hxMHHJNHpsubl9E/poV/rQ3g5Y2KRzI9VM
 NAaP2RjbElEoW2pT74g==
X-Proofpoint-GUID: QldAi5NBQLXGBaVS_ty_BXdylPf9WaI7
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA5NCBTYWx0ZWRfXwUTqdBQqzmSy
 O0p8ObiBtE0gRZfC1SJ4AGo2NiGHei/8hrZIPqCHhbs5E5ZtMxrWTSRMXD8+6JTqlhHi+5hNm4i
 uSqH8p5MrPDi2OITkHaoIWNHgnHAvM0=
X-Authority-Analysis: v=2.4 cv=Xey5Co55 c=1 sm=1 tr=0 ts=6a8c28bd cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=s1NLoHz9uzatdv2VNqxUSg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=20KFwNOVAAAA:8 a=h4i2fRRWLofFFTjKLt8A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: QldAi5NBQLXGBaVS_ty_BXdylPf9WaI7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_03,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 impostorscore=0 spamscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 clxscore=1015 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608240094
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


