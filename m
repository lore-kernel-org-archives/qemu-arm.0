Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 112BAC5DF7D
	for <qemu-arm@archiver.kernel.org>; Fri, 21 Aug 2026 10:55:00 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wxMq4-0004zH-HC; Fri, 21 Aug 2026 06:51:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wxMq2-0004uP-N1
 for qemu-arm@nongnu.org; Fri, 21 Aug 2026 06:51:06 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wxMpz-0003Uq-RP
 for qemu-arm@nongnu.org; Fri, 21 Aug 2026 06:51:06 -0400
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67L9Lt472006077
 for <qemu-arm@nongnu.org>; Fri, 21 Aug 2026 10:50:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 VWq345a0G0XUYPJ8u6+lPJrThsdxHTF0ZV2AIgn58Tc=; b=Ho+SvkvhekCxRhmg
 K4iembLFfevuzGs5WIJgWTAyY4VAKnD9SC1zCbHR7+iuaMFpnBVr3Q6A0BpsaPPB
 V9slCB9KgLUHvHia6RzJnLW0LB4cN7/hQACmoHTGHT4HNlZLsfkPpL/xH/fiKabJ
 NgkgDWe6zQYaf4OP/KHHzzmPZui+1Wp2ctuf5zIZGasoRe6KLsgzm1VwzbcKTbb2
 w526eOtEVUOpaPhAO8s6ucDeVmh9jPZThXypmVszSVyPKIhi6XxTHVatCVWCsen4
 pzvMXkvV5PSzIXXlojAoFe+4bHSNK8/2n6hSPndRRPYkJRG3xceCqTNZj7THBMfs
 WonaUg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g6gddh65m-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Fri, 21 Aug 2026 10:50:52 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-51c26012cd0so8630251cf.0
 for <qemu-arm@nongnu.org>; Fri, 21 Aug 2026 03:50:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1787309452; x=1787914252; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=VWq345a0G0XUYPJ8u6+lPJrThsdxHTF0ZV2AIgn58Tc=;
 b=EA9TwTkSdRLU9K6C3eAQ1H1hit2K9i3a2iCFKpBppy+hksmrmhYEh8TZ8RTxk7PRd6
 Cdd4q96I4BoaxgocPwcmrFXZbRnLHFuOb84ig26r3g0X8iwwWMeZNNEs7LGTRLG9Pebq
 VhFy1zRb8GSr35FvSk7Lor63NECFEvn1apthSKYbqU1WNeeHGMuVbUcpXyeSNB1EWMZV
 xjQVuEOdU2Dc/qizIIOjAmiu1u+hoc/QzSpAJ7uegSABLN/S8KNrC4/WhNE3InY7lZ4o
 DVIStfm+rHXauA9HcZRWm+cwe0eS2Ja2RlZbNuXu8NiO3IVFv21dp9gKUOAGangumRUv
 wvXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787309452; x=1787914252;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=VWq345a0G0XUYPJ8u6+lPJrThsdxHTF0ZV2AIgn58Tc=;
 b=WWIdUR3zc7fJIbzJL+zo3KeJ6OfALAWgkbZ7G8IgUHZwIF8wroHjl8CGX6U/SZzCoN
 QMrrwUI7j3gaFqO2L6VmEX/vThqn+mnRqoQdiU2+PMD/VCFYWCEYdAJlpvA2GaFYHiKk
 ID+JecMcm4Frtm1R0iWEfVutWARf1CdONWLAerolEl09M2WSkZ25FIagEJ24TfhHYjqi
 RAwbY2jYsgCla4WxwOdbEIRaL4coDqFiq9SKZnMxf7eMpM+a9NykkpC99jJcj1nJvcN8
 MfGTMzNBxaNAq/AXdESyFkCrVbYUJvxRb179psPRBX04fLQrgCUcqmLSnZYBdWd6Ia85
 q5Ag==
X-Forwarded-Encrypted: i=1;
 AHgh+RrY0na39CW++zZfHlznX22nqiJdLJzCEKr5ZDsWae4tJAuoJoQNwpsbl1tyKKNQwlfAeGKY1GNxSw==@nongnu.org
X-Gm-Message-State: AOJu0YwHEyk9fxVvfy3jpiV9z2Uv4IETrfEJdcBFSjDZRbODuQp6qI3X
 BlF3//tivFbCrSpQgupPi6r5Bk7+la0H3v+41oWLUmxHlm0JRSNgpIi6QAvQBbufavLhms6/tsD
 wUijyCfSWPPxGU0H90zmnXLAQ+xVXIUHx5Gi/YdNqIIJ5+DT2f9sTr1k=
X-Gm-Gg: AR+sD10AheIi+67RElkfM70b3Hw5Kcumdj2NPggDykfo23Be5PRQv69uTpudyU9VBL+
 fkjt/zdcVFH3s+NWS+zaz57VtHu5FZ7Gq9I2mqfZavw2iLelihtyM8xpGgtvdWWCgUnCEIlBpCi
 qn/CQ4aAIHyxW+qX5BFUfobhhDKg3shO6ryT9ObNvKRTorbr64+IuE2C+bwR1aseyzGS4eL5oxL
 5GKmqx1RMPBftxKEpWkcwRoq+V3tmLm/iO6nJs09wn6rQsAYI4/XY531PMW6ylifxyIwNFC/zCr
 oG1WdIRyAiTTJK98ieOmRhG6xuzNgMwHBu15qzTD5OmvWln1riHMO9nzVTvJlGwla2YppbuhXXD
 pPM3CF8Bi3Fjtk1KXmLYJJY1pSIV7owFp8MuZxALJqQ==
X-Received: by 2002:ac8:6546:0:b0:51b:f857:cf82 with SMTP id
 d75a77b69052e-52df5694797mr50223001cf.8.1787309452197; 
 Fri, 21 Aug 2026 03:50:52 -0700 (PDT)
X-Received: by 2002:ac8:6546:0:b0:51b:f857:cf82 with SMTP id
 d75a77b69052e-52df5694797mr50222521cf.8.1787309451781; 
 Fri, 21 Aug 2026 03:50:51 -0700 (PDT)
Received: from localhost.localdomain (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-499b90e7fdbsm23197365e9.6.2026.08.21.03.50.49
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 21 Aug 2026 03:50:50 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 qemu-s390x@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 qemu-riscv@nongnu.org, qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Song Gao <17746591750@163.com>, Bibo Mao <maobibo@loongson.cn>,
 Xianglai Li <lixianglai@loongson.cn>
Subject: [PATCH v3 08/15] target/loongarch: Constify CPULoongArchState for
 various cpu_*() getters
Date: Fri, 21 Aug 2026 12:49:42 +0200
Message-ID: <20260821104950.32108-9-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260821104950.32108-1-philmd@oss.qualcomm.com>
References: <20260821104950.32108-1-philmd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIxMDA4MSBTYWx0ZWRfX04S4Lnaw7S/O
 sbab69046+6BFk3f7NkIsgNtwOwiSb/j9EzkzruJ4WudAaqJQYm7qGsEweZ9XUlQN0ecTeAr+A3
 RiVkb+/pSPR5PsLM92aI6iH2EFDTbMY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIxMDA4MSBTYWx0ZWRfX8GUZ6+8aOBWf
 8BmZOCzmsTWtPYlxJC59YikHf2iRfwI28TZxfgdj8YML8LcBkSzdPM/DL0Bc7ghfZnu6fxfe+V2
 CI9UFcFucpX66QM3DW6aN27BwUehHPy9xYZv6HIj3au7k94AEhuGCyR1XXOlBGKz6BU5ZkD6x+0
 JICDOfHLQRo5sG+dE9zMKBTXgauWyE5HxN5v1+cs8Ukg9SUlHNfHUuY99qEKW4u2sUz1N2YYSUw
 C3nknEdlD7qwuTFrRkAtNyW6yPvEyFfMrfqCKjv7/l8tS86dTjn9SKyu+PxHZdCVH8rpypL+bnL
 umEqmj9pnvWl8in27g3PIMoFfZjYGUeN0OXCuWCBBkZlbZqgLeVv9hjXNN7WyDZhsEapnTg5NhI
 z8UoQFCP2IRpgHx0hDeJmenXHOX2OL5/CvyjEBul1scrL2VKdTZt45YrVXhXI4pAKhAO9AwZXu4
 A6C8tpl7u/OjKT9dz/w==
X-Authority-Analysis: v=2.4 cv=ApHeGu9P c=1 sm=1 tr=0 ts=6a882d8c cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=20KFwNOVAAAA:8 a=WMCVsHtyMyZApbVNAjAA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: jhTTd_ZvDpX1L_M6dcjMQv1hOkBy_sf0
X-Proofpoint-ORIG-GUID: jhTTd_ZvDpX1L_M6dcjMQv1hOkBy_sf0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-21_03,2026-08-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 bulkscore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 adultscore=0 phishscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608210081
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
index 97db3b453fe..ad8e7497279 100644
--- a/target/loongarch/cpu.h
+++ b/target/loongarch/cpu.h
@@ -486,7 +486,7 @@ struct LoongArchCPUClass {
 #define MMU_USER_IDX     MMU_PLV_USER
 #define MMU_DA_IDX       4
 
-static inline CPUSysState *env_sys(CPULoongArchState *env)
+static inline CPUSysState *env_sys(const CPULoongArchState *env)
 {
     return env->sys_state;
 }
@@ -496,12 +496,12 @@ static inline void set_sys_state(CPULoongArchState *env, CPUSysState *sys)
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
index d9c1e871027..2dbe2203b20 100644
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


