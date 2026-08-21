Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 255C8C5DF7D
	for <qemu-arm@archiver.kernel.org>; Fri, 21 Aug 2026 10:55:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wxMr0-0006kM-1Q; Fri, 21 Aug 2026 06:52:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wxMqy-0006fU-Cc
 for qemu-arm@nongnu.org; Fri, 21 Aug 2026 06:52:04 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wxMqp-0003j3-30
 for qemu-arm@nongnu.org; Fri, 21 Aug 2026 06:52:04 -0400
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67L9LrCf2324778
 for <qemu-arm@nongnu.org>; Fri, 21 Aug 2026 10:51:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 LWQwdDV2fkgFjhmKLwyo93xfsCf8ZqnI4jIB05mjxx8=; b=apcgSN2qJGgisag2
 XEj/1dMYy8LcIZcdoDHbzeMJN0xFUgTZ2YsKe5Kx77CqdEaXHfwj0egHeB0hizfa
 ipmx1ZtXbHfGVkVmXEFrrMYPyezjE4kuIlzfRvDhmGizeVa+3VGHeux6hyvmWOgl
 vSOVW4RoN/UIWyatre0w4uWFhoN8pzwyJMGxh9/lJdKG2KWq7D12mji1xSNvi2Bz
 a6/wvfoNOTrzuPMw2kodUTRGrk8srdba7eBItPNsLHc07zTiG9gzDWmc9aLl3xNw
 ia8MoGsTV3DvN485b0/m6sSHb9Ik0RutUbH00aKS7rLgwTfEpS2+wfDJrpu0hb29
 lqlypw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g6gdf15nb-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Fri, 21 Aug 2026 10:51:39 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-51c1d7886cdso16048481cf.1
 for <qemu-arm@nongnu.org>; Fri, 21 Aug 2026 03:51:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1787309499; x=1787914299; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=LWQwdDV2fkgFjhmKLwyo93xfsCf8ZqnI4jIB05mjxx8=;
 b=ilL+kN/r4qRw6RJKOlnkad5w0Q9K6PPGOGld29xu2VzsygUdZPIqMEVR2KUNywa2Ci
 QB8ltnARM481WVJ0EPImPONW3nsV4997sOIx4kgwuwfdgWBhqOWvQHXJznBoEnipuLAs
 Ba+I3kj6cNy9IsK6X5MHDqmzzJOclTI4RscNjQ1AWcD+bj6ZanOtRUpsPmO68bR5P4gy
 iuKg8eUC2MTh/QjrgZPaQrAM0xKXCgV5HdPNfqZdsDj56mZE1RxGawIwMVYvGJDZzjHo
 Jeap+XgFuOcif0dPIByQtwpSAD1b+S9+ST+WoOwCtw/Qgz7YqH1t9B4Bw7f4Rxw8DAzV
 ttJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787309499; x=1787914299;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=LWQwdDV2fkgFjhmKLwyo93xfsCf8ZqnI4jIB05mjxx8=;
 b=PLxP7/ciBMsqmPBtz94FalkVff+tjqDee8T/55LtLU8zHfI2WB2+T2AIJywdm60LwM
 rpExsheNg7bGDGTYLpqc0WCDx2Fo/D+alDT0Vj35byBpYbZdiOh3Em3aBX1wK35yIfJQ
 rjcd3wIxA3NrYS7982ZYzutlSBsd62APdTjDO9qR18yHUEPG/dnMekGEs+CJYwj5G9BJ
 xuVrgF/T9dPGW/A85A2CLc2YMk74OgAyxCkKsVanjcJ/kfLYhlR3UxvrCQHnDZL93atX
 Grncrd1LuIkUOo0UR/q5ovGbgmsuQ6FejJlTMsJSTfJzNLii5yoUX+Ju7Luk6HaWQzlg
 C5pQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RoP6+4RIzQIku4je38gEqGA77xLkuEsNVK4ZdzUkoLAwOVGDQJwmyqlIyC5KD1VfdlchKoBTTD1Mw==@nongnu.org
X-Gm-Message-State: AOJu0Yy44Y28DoNmhGSM/J0AwVzyiaWv95M03q2cIg98R4MxDrIlIXZm
 M4MkJhzXtKavuMa5v7lgKGjXGRFtdcM7658dks8UWk6nmBL/T1doDBlT/vdfuIjLsD77i4Cs7Y1
 zQvq/+BpENinngtO4dhfPFtshzTJaHLF2+4JSf09w7v2LZAVhvY3KbY4=
X-Gm-Gg: AR+sD13TFf9N2mn/Z8RnJTIWu18y9E4JMYzeyV6KXtdbnQt8KJ2V1XoYoELaJ86zen3
 RGBs+YkTg1EXisuH2xjw/UZQyxuubVx3IkVaeZTF5fkhvdYdEWf89JxlPMfQNqNLeV/NwwNBxm4
 mhxtiin92cMSt7f0Bdt9Eum1nfnbs57JDcOmruAoPuNTSFu6X0trDE8upiTsaZNVgMZ7X0svSuF
 ImwnLdKDFWDJfytTbgjniZI0eQNsDBJNd4DiqPCOzarB7Kj/YCX8itzKCtrSF7eCWKE7qr5dvkU
 tnRkmo5pitajZ0DH6zn3A9OmG8sswQQJuqPMAer7ZkdUmdTJr3vtb4UUlw6YgQ7cyN+AfG4jT2U
 CUezi/PSZBpLRs5yZzeCVJX/tRYDkV56sUKLHLGWSaA==
X-Received: by 2002:a05:622a:99b:b0:51a:6feb:dc8a with SMTP id
 d75a77b69052e-52df573ffcemr50630491cf.18.1787309498946; 
 Fri, 21 Aug 2026 03:51:38 -0700 (PDT)
X-Received: by 2002:a05:622a:99b:b0:51a:6feb:dc8a with SMTP id
 d75a77b69052e-52df573ffcemr50630191cf.18.1787309498602; 
 Fri, 21 Aug 2026 03:51:38 -0700 (PDT)
Received: from localhost.localdomain (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-499b90e3138sm23836275e9.4.2026.08.21.03.51.37
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 21 Aug 2026 03:51:37 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 qemu-s390x@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 qemu-riscv@nongnu.org, qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>
Subject: [PATCH v3 12/15] target/riscv: Constify CPURISCVState for various
 cpu_*() getters
Date: Fri, 21 Aug 2026 12:49:46 +0200
Message-ID: <20260821104950.32108-13-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260821104950.32108-1-philmd@oss.qualcomm.com>
References: <20260821104950.32108-1-philmd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=CsqPtH4D c=1 sm=1 tr=0 ts=6a882dbb cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=20KFwNOVAAAA:8 a=T9gU_B0lrst8XM-M1voA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIxMDA4MSBTYWx0ZWRfX1K6+9KqMOnXe
 yU0LN3k80kPpYTaUNQ4zx3Dc2wHnz5h/D7n48diu/2uwxgIuj1gmRmtG6dRhPCnr0uDEFtGfPIa
 IaPRJIYn4iuVOnY7NffIHDlcIL+NPbD1zLAm0RmAFJfEIAXL3eYwz7I2xU2ODcSGJnRvofVAhPk
 sYkVkDLWfpjO4352D7wv+sLa+faMhJRvmsjMUcH9jvwcp1eQZq6B+clvldRgoKgp2QWG3ozOV3u
 nyx96zsfskvRzTEPHOhVxfVhub4dkxqiYULaVKvJpFP6oVSavZWPXq972uGg5l9yNsOWt4O7jrT
 d6T6mSE2hN1IIP2GpqL/pCHkkY7ZbXYi9AVNI6TMlT0cTZTloTr5B73KkMyE4+w7C/wby3A96T6
 lWi5N9T4YQv0OAJpJZyx3UT1ZjZnLQO7LWWjDHEy0aKFLCW1CCjKU1gT2cTmXLUUOKYCAj9DrIZ
 Cn9oV3k45CS0oo3Su0Q==
X-Proofpoint-ORIG-GUID: o80Ob44zgx_2Hw8OiaJVkYXOMMXGl5gV
X-Proofpoint-GUID: o80Ob44zgx_2Hw8OiaJVkYXOMMXGl5gV
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIxMDA4MSBTYWx0ZWRfX1AVzv5IWUfjk
 EIzSDYrJgVmCmgBJwANjjjxP7ayFg8iuIGiKF8TPCLICYfNM392yR3zdeam8Nowawy75C74L7GS
 HeaR1jp/ZHij331NSUzs2P9B0D97qUA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-21_03,2026-08-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 malwarescore=0 clxscore=1015 adultscore=0 bulkscore=0 priorityscore=1501
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

Add the const qualifier to CPURISCVState when the
argument is accessed without modification.
Simplify directly using cpu_env() in riscv_cpu_has_work().

Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 target/riscv/cpu.h | 27 ++++++++++++++-------------
 target/riscv/cpu.c | 13 ++++++-------
 2 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index bb4c8563554..c51e0d5f919 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -636,11 +636,11 @@ int riscv_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg);
 int riscv_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
 int riscv_cpu_hviprio_index2irq(int index, int *out_irq, int *out_rdzero);
 uint8_t riscv_cpu_default_priority(int irq);
-uint64_t riscv_cpu_all_pending(CPURISCVState *env);
-int riscv_cpu_mirq_pending(CPURISCVState *env);
-int riscv_cpu_sirq_pending(CPURISCVState *env);
-int riscv_cpu_vsirq_pending(CPURISCVState *env);
-int riscv_cpu_pending_to_irq(CPURISCVState *env,
+uint64_t riscv_cpu_all_pending(const CPURISCVState *env);
+int riscv_cpu_mirq_pending(const CPURISCVState *env);
+int riscv_cpu_sirq_pending(const CPURISCVState *env);
+int riscv_cpu_vsirq_pending(const CPURISCVState *env);
+int riscv_cpu_pending_to_irq(const CPURISCVState *env,
                              int extirq, unsigned int extirq_def_prio,
                              uint64_t pending, const uint8_t *iprio);
 
@@ -746,20 +746,20 @@ FIELD(EXT_TB_FLAGS, BIG_ENDIAN, 33, 1)
 #ifdef TARGET_RISCV32
 #define riscv_cpu_mxl(env)  ((void)(env), MXL_RV32)
 #else
-static inline RISCVMXL riscv_cpu_mxl(CPURISCVState *env)
+static inline RISCVMXL riscv_cpu_mxl(const CPURISCVState *env)
 {
     return env->misa_mxl;
 }
 #endif
 #define riscv_cpu_mxl_bits(env) (1UL << (4 + riscv_cpu_mxl(env)))
 
-static inline const RISCVCPUConfig *riscv_cpu_cfg(CPURISCVState *env)
+static inline const RISCVCPUConfig *riscv_cpu_cfg(const CPURISCVState *env)
 {
     return &env_archcpu(env)->cfg;
 }
 
 #if !defined(CONFIG_USER_ONLY)
-static inline privilege_mode_t cpu_address_mode(CPURISCVState *env)
+static inline privilege_mode_t cpu_address_mode(const CPURISCVState *env)
 {
     privilege_mode_t mode = env->priv;
 
@@ -769,7 +769,8 @@ static inline privilege_mode_t cpu_address_mode(CPURISCVState *env)
     return mode;
 }
 
-static inline RISCVMXL cpu_get_xl(CPURISCVState *env, privilege_mode_t mode)
+static inline RISCVMXL cpu_get_xl(const CPURISCVState *env,
+                                  privilege_mode_t mode)
 {
     RISCVMXL xl = env->misa_mxl;
     /*
@@ -797,7 +798,7 @@ static inline RISCVMXL cpu_get_xl(CPURISCVState *env, privilege_mode_t mode)
 #if defined(TARGET_RISCV32)
 #define cpu_recompute_xl(env)  ((void)(env), MXL_RV32)
 #else
-static inline RISCVMXL cpu_recompute_xl(CPURISCVState *env)
+static inline RISCVMXL cpu_recompute_xl(const CPURISCVState *env)
 {
 #if !defined(CONFIG_USER_ONLY)
     return cpu_get_xl(env, env->priv);
@@ -810,7 +811,7 @@ static inline RISCVMXL cpu_recompute_xl(CPURISCVState *env)
 #if defined(TARGET_RISCV32)
 #define cpu_address_xl(env)  ((void)(env), MXL_RV32)
 #else
-static inline RISCVMXL cpu_address_xl(CPURISCVState *env)
+static inline RISCVMXL cpu_address_xl(const CPURISCVState *env)
 {
 #ifdef CONFIG_USER_ONLY
     return env->xl;
@@ -822,7 +823,7 @@ static inline RISCVMXL cpu_address_xl(CPURISCVState *env)
 }
 #endif
 
-static inline uint16_t riscv_cpu_xlen(CPURISCVState *env)
+static inline uint16_t riscv_cpu_xlen(const CPURISCVState *env)
 {
     return 16 << env->xl;
 }
@@ -830,7 +831,7 @@ static inline uint16_t riscv_cpu_xlen(CPURISCVState *env)
 #ifdef TARGET_RISCV32
 #define riscv_cpu_sxl(env)  ((void)(env), MXL_RV32)
 #else
-static inline RISCVMXL riscv_cpu_sxl(CPURISCVState *env)
+static inline RISCVMXL riscv_cpu_sxl(const CPURISCVState *env)
 {
 #ifdef CONFIG_USER_ONLY
     return env->misa_mxl;
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 858fbf865fd..4abf20d057a 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -864,7 +864,7 @@ uint8_t riscv_cpu_default_priority(int irq)
     return default_iprio[irq] ? default_iprio[irq] : IPRIO_MMAXIPRIO;
 };
 
-int riscv_cpu_pending_to_irq(CPURISCVState *env,
+int riscv_cpu_pending_to_irq(const CPURISCVState *env,
                              int extirq, unsigned int extirq_def_prio,
                              uint64_t pending, const uint8_t *iprio)
 {
@@ -908,7 +908,7 @@ int riscv_cpu_pending_to_irq(CPURISCVState *env,
  * using hvip bits 13:63 from HS-mode. Those are returned in
  * riscv_cpu_sirq_pending() and riscv_cpu_vsirq_pending().
  */
-uint64_t riscv_cpu_all_pending(CPURISCVState *env)
+uint64_t riscv_cpu_all_pending(const CPURISCVState *env)
 {
     uint32_t gein = get_field(env->hstatus, HSTATUS_VGEIN);
     uint64_t vsgein = (env->hgeip & (1ULL << gein)) ? MIP_VSEIP : 0;
@@ -917,7 +917,7 @@ uint64_t riscv_cpu_all_pending(CPURISCVState *env)
     return (env->mip | vsgein | vstip) & env->mie;
 }
 
-int riscv_cpu_mirq_pending(CPURISCVState *env)
+int riscv_cpu_mirq_pending(const CPURISCVState *env)
 {
     uint64_t irqs = riscv_cpu_all_pending(env) & ~env->mideleg &
                     ~(MIP_SGEIP | MIP_VSSIP | MIP_VSTIP | MIP_VSEIP);
@@ -926,7 +926,7 @@ int riscv_cpu_mirq_pending(CPURISCVState *env)
                                     irqs, env->miprio);
 }
 
-int riscv_cpu_sirq_pending(CPURISCVState *env)
+int riscv_cpu_sirq_pending(const CPURISCVState *env)
 {
     uint64_t irqs = riscv_cpu_all_pending(env) & env->mideleg & ~env->hideleg;
     uint64_t irqs_f = env->mvip & env->mvien & ~env->mideleg & env->sie;
@@ -935,7 +935,7 @@ int riscv_cpu_sirq_pending(CPURISCVState *env)
                                     irqs | irqs_f, env->siprio);
 }
 
-int riscv_cpu_vsirq_pending(CPURISCVState *env)
+int riscv_cpu_vsirq_pending(const CPURISCVState *env)
 {
     uint64_t irqs = riscv_cpu_all_pending(env) & env->mideleg & env->hideleg;
     uint64_t irqs_f_vs = env->hvip & env->hvien & ~env->hideleg & env->vsie;
@@ -952,8 +952,7 @@ int riscv_cpu_vsirq_pending(CPURISCVState *env)
 
 static bool riscv_cpu_has_work(CPUState *cs)
 {
-    RISCVCPU *cpu = RISCV_CPU(cs);
-    CPURISCVState *env = &cpu->env;
+    CPURISCVState *env = cpu_env(cs);
     /*
      * Definition of the WFI instruction requires it to ignore the privilege
      * mode and delegation registers, but respect individual enables
-- 
2.53.0


