Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79663C5DF86
	for <qemu-arm@archiver.kernel.org>; Thu, 20 Aug 2026 20:15:47 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wx9AF-0005oN-Pl; Thu, 20 Aug 2026 16:15:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wx9AD-0005ld-U0
 for qemu-arm@nongnu.org; Thu, 20 Aug 2026 16:15:01 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wx9AC-0002G3-Ds
 for qemu-arm@nongnu.org; Thu, 20 Aug 2026 16:15:01 -0400
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67KK7b333242336
 for <qemu-arm@nongnu.org>; Thu, 20 Aug 2026 20:14:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 omys+sjzsI02iJIWLB5L11LGUGEpkxHVCWBpSv/GVBA=; b=kxQDRD1qMWNa6Z8B
 sZ3H5DRpphqUCFfZTk74/sNHGAKo/Y480IMLt0W9628/DCs0GalMqi+D2yE1/MkR
 tsCk8kptRMnDzxL6MAZLeSCHOhy8LFaE/wdZyemF90+HtJ+LioEQEC0wgjFCahYu
 m4SQHuGzwzmcphYU4XxcKJqMkyW+Qyhj+rYf1AwIZiL/cSRemsXGEH11EwrDvHnQ
 taI+c+do3kpQNPw23b96OMOy1jAi84CYQD/6CJ9fFgwd/ybOwoSCZgcQlBkN70et
 OKcR6II1RIgm+M6aEovNFs01e3JKXKwhAaPrvEZPqmxP0Q9co0jsy53+Wh2HOlGi
 Uf1FSA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5x05u5qq-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Thu, 20 Aug 2026 20:14:49 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-52b4f6ac06aso3622141cf.1
 for <qemu-arm@nongnu.org>; Thu, 20 Aug 2026 13:14:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1787256889; x=1787861689; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=omys+sjzsI02iJIWLB5L11LGUGEpkxHVCWBpSv/GVBA=;
 b=DEOsoYkVxrh0Dpwt86c5v2VLWv1MHkMa9EkJgRc+LeErRJi/ijqRst9okWP1woh8Rn
 auK+KNID5TlghFnOFXP2Ncu9mVrbmB+DKeigo6VjHVS/rntDBOGsaBRFZeXaL4gOTvHZ
 aN7S5Oufsmj9JcY21NWJvJwVxrVN8t0APBOXYJvp192F++PpHsB+AJwUixrW6YhYggBh
 iN/nVpGNEz7pK0hzgip9iyK8g7f7qdA26AfvwJ29X26/SVV5JS8fZeW18ZVfEF1JKoIM
 FoTuZKahuPJJI/9PqwIdA9MVgVYMk4T2dckDb20ZR9NOySr/aoP6LfivZDIKBa0ZRm6B
 bLRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787256889; x=1787861689;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=omys+sjzsI02iJIWLB5L11LGUGEpkxHVCWBpSv/GVBA=;
 b=bevw1M7EkGQjxbJW1fYp3s/v+TqiNdReDKVyqfVt2NbgnbiJeeOAYleYrv7l8x37k+
 FZrK2lFu9N8Idq26uDblV8Gr+32M0oE8XRnvMkyHJNlxGO+w976i6fsCB/suq68mda9D
 eUL8sGG41upeifjBxZ0bRggDkqCLo7DnhvyGCLRlzbEfHxOIP47UFyfL9ZZzztyQIqWy
 emER8rqp4PKIc5fkQx+sonQdqSJDyT+02ZuTtkv8Tv7R22jql8wLQ1XBnV82BRuxXMV4
 Rf//CUB0+kRCPSCa1457x9Lsc2ZtfzdprL7xo5UxCFxXoZngy22Hx+lnOiGLSCXFNU8K
 W8mQ==
X-Forwarded-Encrypted: i=1;
 AHgh+Ro6T3heaiRBKJ/+91oNu93nwjtJJwyRRldTUXFPZivT1Q5IKBIMjL1v7PXIJzeWkSVQZ9rOgqyYRg==@nongnu.org
X-Gm-Message-State: AOJu0Yz0l5aMVxOpIkyjC2APULFSihCDzvcPLGnBTqVB8XD1KG+M9ap7
 I22nQ/JqUG99Y+nEmnIk0ULQSvw3ZT8gzwrR1UREJVoU8oE3RK6+D3xxSm8tdSHjx+URDiGUWcp
 kYzL2iWCef0bMX0C5Qt69UY/aYCeyUPEzxlJ3FJuF5EAzSg96l0GONd8=
X-Gm-Gg: AR+sD13y2BZ923ysYcIFLrQ+KH3R+CFQp02yB5wz8MLL8cFaFz18csigdmrVtx4QE8p
 W8ci9jYCV7qlQtVM8q3eIrHx+9Eopa+++7wP2L/6nkdr5/fCDmhF69AHquHdwrTyz2NzNEJTBow
 5HPtNxgvCmXrDnMYbJOqOyR7A6fVAUAROcyg2UO4HxLNFWqSZLlQAU7pVWJjEOABz4/I2UhjyMx
 kh/zcsjCHaUHt8GDvPEEHde71OFTcUjTnGuLClsNPPsNRABck7Z1xhQy5PyNM/RrGVStFilIELW
 XFs9gp0m/zyk0LkVbzu9d80V6Sas2HuyiKP3YvewlTTon4h1qnn4JLxyvmsCC/l/qJkVtn0Uovc
 szQtFrMvrvABj6Rg/2HMXVNKpSN8m7aH2EXDyDyIZ2w==
X-Received: by 2002:a05:622a:1353:b0:51c:1fa1:80da with SMTP id
 d75a77b69052e-52df5a100admr8562411cf.40.1787256888703; 
 Thu, 20 Aug 2026 13:14:48 -0700 (PDT)
X-Received: by 2002:a05:622a:1353:b0:51c:1fa1:80da with SMTP id
 d75a77b69052e-52df5a100admr8561141cf.40.1787256887630; 
 Thu, 20 Aug 2026 13:14:47 -0700 (PDT)
Received: from localhost.localdomain (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-482b14b7d3asm14211152f8f.23.2026.08.20.13.14.45
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 20 Aug 2026 13:14:46 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-s390x@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-ppc@nongnu.org,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Song Gao <17746591750@163.com>, Bibo Mao <maobibo@loongson.cn>,
 Xianglai Li <lixianglai@loongson.cn>
Subject: [PATCH v2 06/15] target/loongarch: Constify CPULoongArchState for
 various cpu_*() getters
Date: Thu, 20 Aug 2026 22:13:46 +0200
Message-ID: <20260820201356.29775-7-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260820201356.29775-1-philmd@oss.qualcomm.com>
References: <20260820201356.29775-1-philmd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: CadIV8cUt78-kiyffmwXt_XeLewg6K9y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDE1MiBTYWx0ZWRfXz5TcZcNhPmSH
 EjfcsX77favfIKvmF5AtDtzATwQlvuOQm4IENMZ7OZjr2Zoe41zNKXEhyWkfezpofDCOUEi7eQ+
 vyBvWmGiLhie7Ddhz4bPKvOY3GvotV12hKJEG797moLSVELlxIgnCtebajAQR+LYjTBjdi4dXGk
 8biNGiX7bBjinUhmG2flHSeVlhEWZQ1X5gQXVN3xbIs47xh/0r0AI6JTuYX430BS1wIp8/NWbuG
 HBNqAUYf+cyG3Oru91GwwHFUWtoxJrzeACHFl5j6xrKDq1Sf6nHX+zvZ6u/u+R7xud4eCxsmRvk
 EkwdMXoDDnHTWolO0Zn16kI0dLu+NmXNI2/m1x6f10UyXn0JC5mFVVKE0HOCZOAdPg3jaFfCv9G
 6ouLWoFn2eqkk8zm/maHMmugo47qBIajcxHyWkP1V4ubdpV4I2UNC8j07StnmDQ11kBwkIvCap1
 ZbCScsnn4Y56GNL2aNw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDE1MiBTYWx0ZWRfX1+KIvk0AWAKS
 TB/8xoznZgfJR/CR//9vAK2/x3+pfppeWlFLBZr4Oyl2Fzd8Sh8/11fLSr94BS5/AdmtN0zJyIJ
 /IJ1uBfyfh46ttnY0+Wlaho7xM/8CKU=
X-Authority-Analysis: v=2.4 cv=VfPH+lp9 c=1 sm=1 tr=0 ts=6a876039 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=20KFwNOVAAAA:8 a=WMCVsHtyMyZApbVNAjAA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: CadIV8cUt78-kiyffmwXt_XeLewg6K9y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-20_02,2026-08-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 malwarescore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608200152
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=0.001, SPF_HELO_NONE=0.001,
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

Add the const qualifier to CPULoongArchStatCPUMIPSStatee when
the argument is accessed without modification.

Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 target/loongarch/cpu.h       | 6 +++---
 target/loongarch/internals.h | 2 +-
 target/loongarch/cpu.c       | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/target/loongarch/cpu.h b/target/loongarch/cpu.h
index ad30c73167e..494744788b8 100644
--- a/target/loongarch/cpu.h
+++ b/target/loongarch/cpu.h
@@ -485,7 +485,7 @@ struct LoongArchCPUClass {
 #define MMU_USER_IDX     MMU_PLV_USER
 #define MMU_DA_IDX       4
 
-static inline CPUSysState *env_sys(CPULoongArchState *env)
+static inline CPUSysState *env_sys(const CPULoongArchState *env)
 {
     return env->sys_state;
 }
@@ -495,12 +495,12 @@ static inline void set_sys_state(CPULoongArchState *env, CPUSysState *sys)
     env->sys_state = sys;
 }
 
-static inline bool is_la64(CPULoongArchState *env)
+static inline bool is_la64(const CPULoongArchState *env)
 {
     return FIELD_EX32(env->cpucfg[1], CPUCFG1, ARCH) == CPUCFG1_ARCH_LA64;
 }
 
-static inline bool is_va32(CPULoongArchState *env)
+static inline bool is_va32(const CPULoongArchState *env)
 {
     /* VA32 if !LA64 or VA32L[1-3] */
     bool va32 = !is_la64(env);
diff --git a/target/loongarch/internals.h b/target/loongarch/internals.h
index 50f0fe2e9be..d6f31161e85 100644
--- a/target/loongarch/internals.h
+++ b/target/loongarch/internals.h
@@ -38,7 +38,7 @@ uint64_t cpu_loongarch_get_constant_timer_counter(LoongArchCPU *cpu);
 uint64_t cpu_loongarch_get_constant_timer_ticks(LoongArchCPU *cpu);
 void cpu_loongarch_store_constant_timer_config(LoongArchCPU *cpu,
                                                uint64_t value);
-bool cpu_loongarch_hw_interrupts_pending(CPULoongArchState *env);
+bool cpu_loongarch_hw_interrupts_pending(const CPULoongArchState *env);
 #endif /* !CONFIG_USER_ONLY */
 
 uint64_t read_fcc(CPULoongArchState *env);
diff --git a/target/loongarch/cpu.c b/target/loongarch/cpu.c
index 2e938d7880f..b638ac25040 100644
--- a/target/loongarch/cpu.c
+++ b/target/loongarch/cpu.c
@@ -82,7 +82,7 @@ void loongarch_cpu_set_irq(void *opaque, int irq, int level)
 }
 
 /* Check if there is pending and not masked out interrupt */
-bool cpu_loongarch_hw_interrupts_pending(CPULoongArchState *env)
+bool cpu_loongarch_hw_interrupts_pending(const CPULoongArchState *env)
 {
     uint32_t pending;
     uint32_t status;
-- 
2.53.0


