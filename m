Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AB36C5DF8A
	for <qemu-arm@archiver.kernel.org>; Thu, 20 Aug 2026 10:49:12 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wx0K8-0001Tw-DT; Thu, 20 Aug 2026 06:48:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wx0K7-0001Rs-0S
 for qemu-arm@nongnu.org; Thu, 20 Aug 2026 06:48:39 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wx0K4-0005q0-F2
 for qemu-arm@nongnu.org; Thu, 20 Aug 2026 06:48:38 -0400
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67K7LCGx2753039
 for <qemu-arm@nongnu.org>; Thu, 20 Aug 2026 10:48:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 nYEga+4OcEVia3VM7f85YtQuaKth7rLR95DfKAITOyo=; b=K/BMCHwBlX9JXrLg
 +cBsAxLVJxEkE8qDTOUtJWz/fEdq9r3iqikICqyaeXyLRL/dPGXjokH7SdHHViPn
 ZxoXIKhhHclk3eTJ3ktRYDzJ1o1g6Zs00xuE+4m+K/Cl/G3tFWc24i00xHWL06i2
 THILhPy1AIQGU/QBbdQ3A6z5j7uhTtE+nog9eLNGmdKtdHAbqonB/S4zQNHff499
 frbs4g8UPnPnskn/NRjjEfYqI1A4S/TMFq8wGsSRGm39Eyk5spzZksIB9wzRzc4X
 lMGIg/32F2xhDIeEwFmJDH6j+HSXuYAWENe1Pp+ZMFmumaa5pyqsOd/XkL+VumNO
 ddGATw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5w498t0b-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Thu, 20 Aug 2026 10:48:25 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-92e695a3b28so89942185a.1
 for <qemu-arm@nongnu.org>; Thu, 20 Aug 2026 03:48:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1787222904; x=1787827704; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=nYEga+4OcEVia3VM7f85YtQuaKth7rLR95DfKAITOyo=;
 b=QPB0jNP1Jy8ToTs5Ddaz5DedYmazfuELUkRZ1KDiHpowY+tZv2rSNfvMjeU5NPb6DZ
 IabLikNMK7wVgSAiKsUcCr2HGavbabzWb3qPbx+A+RNBn9sy5ka4GcQpwr7BHlBqUAyI
 /u95LYczhu/QYWjb/gb7LG13t94FZ135i2jWeZ576OuEQWdzHuIgp/qkjytEj86gG8oZ
 XbWK2r0NSHKb/panvj2aiwnB+2g0pdKBiMeJ7GKICv1a+eOkDSc9RTnufrZvKIoY6EFC
 gdq0Oscy+RQ4kpSs2iWicObnjWKL7a7amoE6seud5qMD3FHmIFqeNBQF4H0ar6IX6O4f
 Ku9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787222904; x=1787827704;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=nYEga+4OcEVia3VM7f85YtQuaKth7rLR95DfKAITOyo=;
 b=E8wwcVigM0YoodhVtJ2GF97MkUZUhYMnoz0zX208zMsrnm0yiwqsfa4ommRxv/dSVE
 VcB5FlWdGvH4mD5yEAyqGvODzhm7Owbh0eNLuCPvxG5IFc0b3nkwR9CQIpCU+RFjiBqH
 XGRFCUMkpmKWIibD4DwitWs1LDjD+1ypN3FLjWa/wYbQk5QyKUEliGduAwgb0Rqt0SYp
 ME9Dt6me6FR+aDorE/7BHhRNfCweIF8afmgjuKbOeXV42KLPKY5KEtTmCEUqG0JBNMnR
 i3kna1QQpM92Yis9OfMw5zBhNb+BkK6Bw71eyYbcwJM8BS4m5/jAh1A4AodVsHqRvenO
 wixQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RqYFdFhr8VV3BdZ/5gzJSkCE1BueFzs5l5KLF2NAcEs+6Qu0WM3H1Lq+A1tMoVp9iSuCB8EYF2IWw==@nongnu.org
X-Gm-Message-State: AOJu0YzObX4VzX/ac5x0oGzWqCyXB3ADIyZn3kFIWG9VJahHtD4fa8lX
 Hl+okM5v/Rt5LMzpV/XafsUAhBHxxWRB18UcGmHyAcFE6d3UwAEjj140UjD4vrsQ+Frg3Sh7q8B
 L3DuUFohXfA0cP4+3Pz7HpUvrrY3RTlkJ/EQdaNV7DRxDJO9lzz7OZHg=
X-Gm-Gg: AR+sD12gkquHIzQJeSHezGb6SH1zRa9tK1Ge7KKpL+bqP5ON8oFAXpssgKbDk8cMARZ
 JHDi7urKKSv527FpaCxvuoOJ0OChPgIWr+c4nV/NRA98DZjBxS6OCi+g6YblE23caCQd3+NXAah
 LvU9zFEhfTIClT9Z02Z6Y78Dzhl7ys8oGMQBzT8wQE/TJWSYU5CBfYDeQ9UoZ/0c4LRjq0KBcXq
 DMlIyUnOLG/Fd3u+76nPgw9p9mWZa69exOdEm2b2xozxQkOxpqs/i7SfqJsruJhbcj4mbO+P+Ok
 OkEnsTS2CR2JkaJCWhSfT7rF2tv4qAEGPOjG5Tvyfjcvg2pufZxorh7w0VUDsNliEgLrzS527wk
 y6BDBkR/WrUkf4DNOcPhi/WNi3ISkvCm+MLmx58LOMA==
X-Received: by 2002:a05:620a:294d:b0:936:a184:3cf3 with SMTP id
 af79cd13be357-9372840f584mr544381485a.10.1787222904129; 
 Thu, 20 Aug 2026 03:48:24 -0700 (PDT)
X-Received: by 2002:a05:620a:294d:b0:936:a184:3cf3 with SMTP id
 af79cd13be357-9372840f584mr544377985a.10.1787222903737; 
 Thu, 20 Aug 2026 03:48:23 -0700 (PDT)
Received: from localhost.localdomain (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-482b14d05a6sm13685959f8f.35.2026.08.20.03.48.22
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 20 Aug 2026 03:48:23 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-ppc@nongnu.org,
 qemu-riscv@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>
Subject: [PATCH 07/13] target/riscv: Constify CPURISCVState for various
 cpu_*() getters
Date: Thu, 20 Aug 2026 12:47:23 +0200
Message-ID: <20260820104730.25462-8-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260820104730.25462-1-philmd@oss.qualcomm.com>
References: <20260820104730.25462-1-philmd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDA3OSBTYWx0ZWRfX69T8uArZ6yFM
 VfmR2gDNPh1f6OWF/84Pdu0oSeg2axTIdN7fUAGY2tXMlUoZJS+Be+b35GrtoffTCafkXErwnrm
 sPFF2El0c1ZiwQm6xKuIHxw0IPBK7Dg=
X-Authority-Analysis: v=2.4 cv=YP+vDxGx c=1 sm=1 tr=0 ts=6a86db79 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=9zj5Cwwbhz_JKt9pCs4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: -WrAQAkfccjjW1v_swl7crqL7XXB6Ik8
X-Proofpoint-GUID: -WrAQAkfccjjW1v_swl7crqL7XXB6Ik8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDA3OSBTYWx0ZWRfXzKRSJofJZjTP
 xL5ZVxwfD6TSJpic6lKiKEhWH9lTUK/Jo+yj06HkQT0QHfvtmgC+qUhlZZha+hsKpArbMRXvvVH
 QjYnjsqwb33i6VF10bqwyAAN2dOXkclxnc3tCI2WHD8gBVp1lKsGLvn+uAEB2jwlfsvIadK1xsx
 IbJxOPE3YD2Z0tFGgJEbWG6Bq4BhLT2V7KtvE9nDe/fvu5sjr9uYmrlbIbzAjXr5ZKWOC3QC0Q7
 UfxH7GP0hIbl04h7ofQrr67iAo/ocxTYmH7i6k5AgnpwzcR0XjqN4E6mqk1sT804Y7j2wYPRZCX
 TeO54ji8Y0VX8LFapkg5DlVwuHSSodIfes7qbsU+2jydGHonGX1/AKIsDgb3m6PiW9iteke4+9L
 0/dfOl43IhUoBG3tk52wU5Z237ZWspoqxcPMbeRUvEmHwJF1wp/zuX4ttkrOJe8P5L6Lx5ObRoQ
 TNTeQnfyQnYhhHkk78g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_06,2026-08-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 bulkscore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 clxscore=1015
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608200079
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

Add the const qualifier to CPURISCVState when the
argument is accessed without modification.

Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
---
 target/riscv/cpu.h | 17 +++++++++--------
 target/riscv/cpu.c |  2 +-
 2 files changed, 10 insertions(+), 9 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index bb4c8563554..2333dcecd8a 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -636,7 +636,7 @@ int riscv_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg);
 int riscv_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
 int riscv_cpu_hviprio_index2irq(int index, int *out_irq, int *out_rdzero);
 uint8_t riscv_cpu_default_priority(int irq);
-uint64_t riscv_cpu_all_pending(CPURISCVState *env);
+uint64_t riscv_cpu_all_pending(const CPURISCVState *env);
 int riscv_cpu_mirq_pending(CPURISCVState *env);
 int riscv_cpu_sirq_pending(CPURISCVState *env);
 int riscv_cpu_vsirq_pending(CPURISCVState *env);
@@ -746,7 +746,7 @@ FIELD(EXT_TB_FLAGS, BIG_ENDIAN, 33, 1)
 #ifdef TARGET_RISCV32
 #define riscv_cpu_mxl(env)  ((void)(env), MXL_RV32)
 #else
-static inline RISCVMXL riscv_cpu_mxl(CPURISCVState *env)
+static inline RISCVMXL riscv_cpu_mxl(const CPURISCVState *env)
 {
     return env->misa_mxl;
 }
@@ -759,7 +759,7 @@ static inline const RISCVCPUConfig *riscv_cpu_cfg(CPURISCVState *env)
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
index 68f5a620402..a344daf62f8 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -908,7 +908,7 @@ int riscv_cpu_pending_to_irq(CPURISCVState *env,
  * using hvip bits 13:63 from HS-mode. Those are returned in
  * riscv_cpu_sirq_pending() and riscv_cpu_vsirq_pending().
  */
-uint64_t riscv_cpu_all_pending(CPURISCVState *env)
+uint64_t riscv_cpu_all_pending(const CPURISCVState *env)
 {
     uint32_t gein = get_field(env->hstatus, HSTATUS_VGEIN);
     uint64_t vsgein = (env->hgeip & (1ULL << gein)) ? MIP_VSEIP : 0;
-- 
2.53.0


