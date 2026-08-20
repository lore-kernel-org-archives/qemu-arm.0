Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AB23C5DF87
	for <qemu-arm@archiver.kernel.org>; Thu, 20 Aug 2026 10:48:48 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wx0JV-0008L8-7d; Thu, 20 Aug 2026 06:48:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wx0JU-0008JB-5E
 for qemu-arm@nongnu.org; Thu, 20 Aug 2026 06:48:00 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wx0JQ-0005kO-Qo
 for qemu-arm@nongnu.org; Thu, 20 Aug 2026 06:47:59 -0400
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67K9JJ6G2927299
 for <qemu-arm@nongnu.org>; Thu, 20 Aug 2026 10:47:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 vPkYOzjCZEx4JelHAd8fdNs4FoNuCoY284i0qko/5Zs=; b=KB9Z/65yGP+p8+tz
 CqJEB/KIqGyW8nELYe9ROEmSDRt04+Wr7cX4YONnglW5bwXmGeV0rhFp77dfpTth
 Dc6PkEtTrD1/C7P+LFJ/gyuxZ4sUkCpaKS+CShHoUh2i2fOZ0JHjkJ69nFYkRKF6
 W6TanPR6vGPcj3YFA5y7x6CpmboaKkMcHW6FsvGPEd3pOjGLSoivDx8te7DP236N
 f++ehJ7NJdt8sP6RHfp5NgkfFx0BUyUeTAHxlzi3QRFyEARZSFEGoe3c3mY/ATnd
 2+HFsJU+4y8AkP5I2Th6+Wtf+Z29zkbLVLkRnJiRLICOrxjm74nJKy4kssvU1Hbf
 xCj96A==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5xuk0b9r-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Thu, 20 Aug 2026 10:47:55 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-5283df62d68so23719921cf.0
 for <qemu-arm@nongnu.org>; Thu, 20 Aug 2026 03:47:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1787222875; x=1787827675; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=vPkYOzjCZEx4JelHAd8fdNs4FoNuCoY284i0qko/5Zs=;
 b=L9YjbjyrfypRuIFkBLUyC1gu/+EXnMw4yyJfmdm0Hx0UeFiq6ezw0XO62qWr2FMkh+
 5viS2rImJMf46fOL/xa3KGBQ9SPCkECcdu5iZu+Mx0gsF933CFT9Gmb7viy9bV6HtpSZ
 Jsv5xKF1Q/IlHPo7nGcJk9kwSVc2cRIZNd2tcgIBqbsCfqKKzZIbrC+Ya7dxkz12Yn2t
 IB+HYX0igIigeyxLiF4W4nwBgoKokakbE86+Yu9ITQb944NUXUt2KL6nqbFpuLh2Ppia
 6wyaK/WdaF0v+N7DlD79XesAig6wijfxBmVhL8PuB4pFahd2zi2oo3LqPblRT9i89AFu
 YwMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787222875; x=1787827675;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=vPkYOzjCZEx4JelHAd8fdNs4FoNuCoY284i0qko/5Zs=;
 b=sZB6qt4HSM7PSyxkgkmCl1/FXVOSNkrqaGaaiyVLQjkas63W6MNvolKIu0ZIbXgLhg
 bnxeCCS+7J13kU9pENXFHFaxLUyWzbNAuhAr8EzmBbZwVSxzCd6JOg4Xj+CfRQgYVyWY
 QwUvfsezUySj0kYTC9/PZFKBF70IjBLw2fqWWSenORHOhLQIijv0YBkZ5/rOCOlIxMtJ
 esc/YM08M8VxmEraIKQdCOh3IgwQBi9QdpGp5jdUCYeSmHDVq0bXu8WUcTWSnAo63bxU
 Df8pFGLpO0QCxL6qfvf7i+hayS0F8yH05IIeTCcFXlSz3AEZWLzJPFwNXy0y7Jy356s0
 uX0w==
X-Forwarded-Encrypted: i=1;
 AHgh+RoTrYAclNNvTGEJ2AnqQroiriuHWpLBormR5U9n6KMgJ4XPG904zD6ltY6rJdzf/E3ZMsW5h6yihg==@nongnu.org
X-Gm-Message-State: AOJu0YySSuIK4OISBSlw8euGmUu3O1VwdRrQw/kp0k9jbM7j8QH+EcBF
 cwVGXU+QOB+RAyyDUMpSwAAyfmmWJBQZxNl4fDmhv4PIsjjtc+U/pnRdpvYar9nI9q6GGqGIT2K
 UzwLPrsDSSUUYKFqQ86y7FAjdPo4se0+c/OdiIKxEuJf6/8Bp0F3DhyU=
X-Gm-Gg: AR+sD121ClFK2soNvHPROHxmP8f9mpuDhxfyIKUgJQjNdMe8GXf5Tk+uf7CS+Vu7CwF
 FvRtumQ74re/tZes7ICiJjyApB3QulAnK/jLEyZ/VVIAYv48W8Lk45fKqyfUjubCRex9pfZx3ZF
 yiCPNgQy5TIepDsrX3uDl0cwjMHqpYfhEVQepByQOZ8lQmF8b7A/rTIBlvujR82k6FrSiZICtAR
 W+NrUm1XQNebKM4Rl8KkUb6M71+vSqoQUQm1opg4nzUhMfTP4RsYyRrXNOCTJ63qo8qj8RYJ/85
 woK5D/ZQugquuMvbb8rjFXGL0Lqw1e56J3Zx5FXR61TGl6jF5zOk2R5xnRPySWWRxwQYsOUM4Ba
 V8o4Q+vA2NmT3+x6ic8n8XSmggDy+udor4KWCeJo4VQ==
X-Received: by 2002:a05:622a:1206:b0:52d:94c5:2212 with SMTP id
 d75a77b69052e-52dd5733782mr87611101cf.3.1787222875243; 
 Thu, 20 Aug 2026 03:47:55 -0700 (PDT)
X-Received: by 2002:a05:622a:1206:b0:52d:94c5:2212 with SMTP id
 d75a77b69052e-52dd5733782mr87610791cf.3.1787222874820; 
 Thu, 20 Aug 2026 03:47:54 -0700 (PDT)
Received: from localhost.localdomain (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-499a9e784b3sm117761165e9.3.2026.08.20.03.47.53
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 20 Aug 2026 03:47:54 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-ppc@nongnu.org,
 qemu-riscv@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Song Gao <17746591750@163.com>, Bibo Mao <maobibo@loongson.cn>,
 Xianglai Li <lixianglai@loongson.cn>
Subject: [PATCH 03/13] target/loongarch: Constify CPULoongArchState for
 various cpu_*() getters
Date: Thu, 20 Aug 2026 12:47:19 +0200
Message-ID: <20260820104730.25462-4-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260820104730.25462-1-philmd@oss.qualcomm.com>
References: <20260820104730.25462-1-philmd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: ut6s0RVOrOc19gEfFsbe0q3mQUEgQ2Bi
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDA3OSBTYWx0ZWRfX67Vcr7tQubJT
 LSYj5O3tLPxYAQTpiVXq76Sw68bJsP1bP8d18C8QruQAC9rXbPirhGD+gGANmAkUujPGJlmC5E9
 53LOEX6Mm5gXr4z6i3pc+7n+BLAwYM4=
X-Authority-Analysis: v=2.4 cv=T/O8ifKQ c=1 sm=1 tr=0 ts=6a86db5b cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=cEYDorbIuKFc_Ye4BekA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDA3OSBTYWx0ZWRfXwB2a8rs6CDS+
 7JtwxJUb+Ew8pzl+RrDpkPulmjcCA1Z9aYx9gTwo7k+DCTL1pOmSHvOtvHjZdumweDqzR7rLovO
 Rv+zmf+W/j1jhecZIyyW79E1mPyBcPHAF/rSr8gnNHpWSvLsX5WUoMvRfJPFRvvFHRyzX+Nof4D
 RyEXQqZTMyBeOUwQEje0gLaggczrGu75lloGMpruZ6tCvQaNV1+q5uf4h6znRd7ia3LLHFbQafl
 +2n+j2TFGfXsVWPDlqpkC0oGRG/ul9o2MdZvwfPOeKSlS1lke5O8S3KOZZOd6G+Ycwe0O5NAew0
 IcF+uctLFrN4twu7J58I6aI7HFpwZO5r48s3BDUokKQ9FxLhzNb1VFyqxHXFzoD1DsBJ3AFNSmd
 WME7erg/y8H0qT8/ILY4+v8WwZ2vgTYCRMItVjl1W4VaoeMmYWHJgEpfat2gx/ro99B70iYOcTQ
 zDwXf9f/jY/5Esq3KhQ==
X-Proofpoint-ORIG-GUID: ut6s0RVOrOc19gEfFsbe0q3mQUEgQ2Bi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_06,2026-08-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 bulkscore=0
 spamscore=0 adultscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608200079
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
index e01dbed40f6..6a733e6c3a5 100644
--- a/target/loongarch/internals.h
+++ b/target/loongarch/internals.h
@@ -39,7 +39,7 @@ uint64_t cpu_loongarch_get_constant_timer_ticks(LoongArchCPU *cpu);
 void cpu_loongarch_store_constant_timer_config(LoongArchCPU *cpu,
                                                uint64_t value);
 bool loongarch_cpu_has_work(CPUState *cs);
-bool cpu_loongarch_hw_interrupts_pending(CPULoongArchState *env);
+bool cpu_loongarch_hw_interrupts_pending(const CPULoongArchState *env);
 #endif /* !CONFIG_USER_ONLY */
 
 uint64_t read_fcc(CPULoongArchState *env);
diff --git a/target/loongarch/cpu.c b/target/loongarch/cpu.c
index 8cd5bc18a3c..82ec35e081f 100644
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


