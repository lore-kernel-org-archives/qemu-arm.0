Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41910C5DF81
	for <qemu-arm@archiver.kernel.org>; Mon, 24 Aug 2026 11:21:14 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wyShx-0004Ax-84; Mon, 24 Aug 2026 07:19:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wyShv-00048L-LE
 for qemu-arm@nongnu.org; Mon, 24 Aug 2026 07:19:15 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wySht-0005eT-BJ
 for qemu-arm@nongnu.org; Mon, 24 Aug 2026 07:19:15 -0400
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67OA3FiU1630157
 for <qemu-arm@nongnu.org>; Mon, 24 Aug 2026 11:19:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 wR0QaQrDb7GuMtRSy5NqIH8YoOaer7cA+7FXtXgJvnE=; b=nEFyh0+rukjbFjsa
 Nh0hzSV9ZK1W2dQnIcmIL+9sWGqtl1809Kegs5tzPxTpl+IgIAVgyJkdIattVPYN
 SATjC1ugAnuRSJoigHbaQXiNzPHNdePLxGgICTvlsXHnaXlIaEx9WduQBmsNINCy
 xqJt2ScGzVE6elVgD9GPhLdu9CNXeq5tioiTzR5L0/fnFIdQHlYR7nkz/gAjBXE5
 +5FrXeOydQcH2MP33Oo8uKIbdSeSx5w3oJklGedS531ZtuAFNVRDblkQk1ix9set
 Xfe6M1a20LeVqKoDZzxNcc8fBy6F2XuWDivjGXDQRpKQAQBm99rbWDCzfw00ltIT
 I/8o7A==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8kv7883a-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Mon, 24 Aug 2026 11:19:01 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-52ce3c7cb2eso64228551cf.3
 for <qemu-arm@nongnu.org>; Mon, 24 Aug 2026 04:19:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1787570341; x=1788175141; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=wR0QaQrDb7GuMtRSy5NqIH8YoOaer7cA+7FXtXgJvnE=;
 b=Y9Zid1Xhk+wQf6oButofO8tPOkF6Qe9JF9PtbiArkjGYjriIK9sOKHdOQbvtw7a4l2
 rh8NBL7Hf/4wlyeZ/GYLGDRsPWrpJCpiW+GWvgU7QkGxvPv9hoDDg7UhlIaEjohsc+o7
 jAjn8QOVafCV/wc6Yas7D1ViRahxNrDQMpRHx++mowhbvRAulmRj7hrojFTNTQnLZqwO
 /VQy9ORGrX1LCwX/X98mvEhYUUeYUUzmObq9rxck40yNKim7MM9crDx1t4PoffunvHkQ
 rNCoxLcKOcpaH+wjA87/JEnycCRXLRhGoZ1jP3mAsVvPJdYzEPm/z6scXUnjgC8RvGfq
 cPGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787570341; x=1788175141;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=wR0QaQrDb7GuMtRSy5NqIH8YoOaer7cA+7FXtXgJvnE=;
 b=akn1vQTvStcKW3bsIpXWUHCCVtixNkiuVELogUCkl6v0n5mcAqBh2oDFaeV5QVLgrA
 L1tSzkpm2S7MmVslGaNXrIV8w+qvSUWTi/dyRgFl0asmg9Vnagr/5tVdH9Agu7MQGQOK
 EPFYCE5p+AxkoBzLwS4oDte1kZBMmXciUExP8amWmuNBVlAsw52HbCx32zoXnw4ZK0Kx
 bZVwtjFMoCeMWZEFfHw+/EXLDZ7T/2DwV2km5cQymjErQbTsp3WjVNGe4S6Pu8MyzOJZ
 8j3/8WShS3aTa2ONGTynFss6gyY9BQKtcd50ORzYjYHXNZw2VA/1ei6LBQkM7JV2aqaG
 Fqhw==
X-Forwarded-Encrypted: i=1;
 AHgh+Rr5eWlWxJAVnA6sX1eboGhxwCMZ28vcmz7ppT9tGoA/KjD0+AChkYLTHsRBzz7gpMrVHybauiQggg==@nongnu.org
X-Gm-Message-State: AFuF++lPVwz4J1wd2s7qrXgqjC4j3Z7Ib92Swe9/DLSrvKF5BRlt2nDS
 l5YsaxDRKvAyQtYUq+69RQgntdiaPmI5g1LDsjx4gsRH0c4X1q7B2uGDO3AYAs+VJcB9CswrfbF
 dbizgk0yQ2+d/ACNLfdqn/pny8LCqjDY4suP7BWsCXo5efqZNGQFycWE=
X-Gm-Gg: AR+sD13JtEp1XA5+9W73xGBXEEmuctPfkDgPiDlF0m5WcX8ZoNQflELfZw/Cr9tbX6e
 Kai4Od4SZGECVFnkUBvHX2H2m778dysbTFGoXbitJI8kojY7tV8Kpzu7h9ORz39nuw5hU39s3P1
 t8qXpijTTjTbuMsimFhi4qTA9ngRz1mP8DWhIeXc/4C6Zu9fgtla5YeRylN/RMRpygXCEjeLpsy
 uqmv42JwbFSjzkJL2Npwk+bwrHg1Rf1P0e5L2pd3hDlcksWm2B01CricTgEwt4IU5Iu8JXahmOO
 5zRAP1W69WkeFtm7Y0q3TbKWBmY54ol1LtToYPWtIcuYE8EgEilLt1RS9zVku1tHCu9rYY/QG5P
 xCee/HgPMA5DH32dxI4Ku6fan+boTe5WoFmtZfuMTeHfg6Jtt8g==
X-Received: by 2002:ac8:59d2:0:b0:51b:eb55:2916 with SMTP id
 d75a77b69052e-52df59b3b8cmr262380671cf.34.1787570340769; 
 Mon, 24 Aug 2026 04:19:00 -0700 (PDT)
X-Received: by 2002:ac8:59d2:0:b0:51b:eb55:2916 with SMTP id
 d75a77b69052e-52df59b3b8cmr262380141cf.34.1787570340266; 
 Mon, 24 Aug 2026 04:19:00 -0700 (PDT)
Received: from localhost.localdomain (44.170.88.92.rev.sfr.net. [92.88.170.44])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c2496296cafsm1248768066b.14.2026.08.24.04.18.56
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 24 Aug 2026 04:18:59 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-arm@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-ppc@nongnu.org,
 qemu-s390x@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Song Gao <17746591750@163.com>, Bibo Mao <maobibo@loongson.cn>,
 Xianglai Li <lixianglai@loongson.cn>
Subject: [PATCH v4 10/20] target/loongarch: Constify CPULoongArchState for
 various cpu_*() getters
Date: Mon, 24 Aug 2026 13:16:59 +0200
Message-ID: <20260824111711.26297-11-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260824111711.26297-1-philmd@oss.qualcomm.com>
References: <20260824111711.26297-1-philmd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Cfg4Irrl c=1 sm=1 tr=0 ts=6a8c28a5 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=s1NLoHz9uzatdv2VNqxUSg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=20KFwNOVAAAA:8 a=WMCVsHtyMyZApbVNAjAA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA5NCBTYWx0ZWRfX6kBowPKFbsNS
 fF03C5dykuQW1TaTZ/TwcSDD+HZIi3ggmlkIohdg6QhtKqt6HEUuu2ti56q5IHsgoh43A3+vBB/
 4Pa/1OnBfRhSWGSIYkdI+hEDySgn4N4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA5NCBTYWx0ZWRfX+eIHnlFO4GM7
 YODC68TAGSsNNq07Cil2pKvnAxgxkUVUGXTXM/4Gx/kvtEw6KoT31FyF5WGF8yHEGjAtNwbC/tk
 zHLt/1G5c4TrSE4fmYY9p6JF0mBfwDJtTMrgcCJWhtuJzhO4pUFaDtDmwoCWxf27fuU0xCpvv3U
 rfOE/OYfiDqgnAM0XANPb6Q3zuf7/cjI9dTVP1o4+mpwtHobWod0dgmrWcHVZ/Gd6Hog6KI2d1J
 uhbKqv6Q+WCU1iPfpv+iL9pl3pu5xbRFO8tFvH6pIE2xr+vJUVoTyJfwWbg66308HtCqE2+oPgN
 0G5XHObQcDqgnzO510rbWHHwmL8+bPurCYs14jext5/skbKkotQAhyM1iQuwrOw5/oflh2TWnkB
 J/8Tw/2dytkS055bBFCCvoaoR19dkmMHDGx/YX5fG1zvjRT8jBD2Hxi1gSx7vOZpSwFtxdbTxLI
 ZeGc3Ouo/41VmzJ8Xvw==
X-Proofpoint-ORIG-GUID: 5VC0-dYaj7AkWQZsK2DtCaFDqEk59Vhj
X-Proofpoint-GUID: 5VC0-dYaj7AkWQZsK2DtCaFDqEk59Vhj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_03,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 impostorscore=0 spamscore=0 suspectscore=0
 priorityscore=1501 malwarescore=0 clxscore=1015 lowpriorityscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
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

Add the const qualifier to CPULoongArchState when
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


