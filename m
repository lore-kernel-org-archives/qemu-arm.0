Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E28B9C5DF81
	for <qemu-arm@archiver.kernel.org>; Thu, 20 Aug 2026 20:15:10 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wx99p-0005YE-AX; Thu, 20 Aug 2026 16:14:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wx99o-0005Wp-4X
 for qemu-arm@nongnu.org; Thu, 20 Aug 2026 16:14:36 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wx99m-00024X-Ov
 for qemu-arm@nongnu.org; Thu, 20 Aug 2026 16:14:35 -0400
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67KK7m7O158548
 for <qemu-arm@nongnu.org>; Thu, 20 Aug 2026 20:14:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 mEq07J79FZAVrGE5OPh7byVYhPMuxRT7e37T72un2JY=; b=TtpABNBi3HVQUY2M
 62KJdbbEqaf9DmpqjB3iapOnhmeHeDI7Woy1jzs4o7KO/lK+fvN6gjR+QrojpfeX
 V8lW7adOVEpV65469o1y0+x64bRmoLJY8CajuLQUny3hK7ku9GovgIti98VgNytE
 SPKuTXGYZsYXZh1oacEZeEufDN+naLNAQ6x1wkbuUQt5+vRqZfUla0UFlGtIGRGG
 8HvWJgnba+lbjPr1/qv86xFVblL94nQz7mle0EKsnga9Aa6Q33stg4++BinoLtxX
 dBUItiUyO5dqM5xb20v/Q/SaO4ONKtD37eRI3rcoItcKJ51DgYA6g8P4g+5P9Rjr
 42wE9Q==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5xuk2y9t-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Thu, 20 Aug 2026 20:14:23 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-51c083f1818so2661761cf.0
 for <qemu-arm@nongnu.org>; Thu, 20 Aug 2026 13:14:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1787256863; x=1787861663; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=mEq07J79FZAVrGE5OPh7byVYhPMuxRT7e37T72un2JY=;
 b=A099Jc0mFnsXmEtk38ssisOJ18El1FQXJ/MT7cxawx4toxoH7h49d7gcoi9Oqkuzd7
 QoVLE9cIlMcRsxztGp9DNWbRpWcyAy1JZpOcOgGJpzvIrOORcNapbT35FtCXrYyyM9eR
 PmmxoRjiB2883W4DQ8vzwhoxD+oMseQsYWydf98zBSxayM4FV7tEOM9t3PvtPLWkJp0J
 4NpAqnqZjd6VXF27jdQv93Gi1X9PvGvdcE0CEZhTSjYw1/jy7HSXEn1gXFFA/GyD9LI5
 Y3j3oMXJuJ205y92jvzrHW9Q6xNQVkjmjaYu0T52lsCzln2adJEbTu2zkvhmSkMrsB04
 QwtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787256863; x=1787861663;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=mEq07J79FZAVrGE5OPh7byVYhPMuxRT7e37T72un2JY=;
 b=q3gIe+xP2GaEUVsKdwW9h4pkr1lNoC5oN60S/d75JL7L4o2ER0jnLAQENqaXAIB9rq
 jBfRSQ3b0b6hroEcd2T4DFiOc2UUEtKcjWes13Eqny6dTcvKsUH522x8F1R+7MlZaa4q
 N5sHRgnLumBrPTxaapufv9Gfmr7OzRqvrZQAJwmD2IPODlCdmxlqD3NhK2a7+sEWQder
 jx4aWN0rQxUcvRwwqx8tPP3bL7tOqJT5lG47XWSNjFEYe8HgmuXhXH9EqBHkPpKrSUP9
 5O+NBrBMH56T16GSICCRESgl6Q7a0F6hgoVJIGyAOVnkUD3NEVG4PGz1w30P7EAQcYDc
 F4Gw==
X-Forwarded-Encrypted: i=1;
 AHgh+RqxPJnAmhmMD2p4MTHef0cksIPD9TOlaN5Ugz9hTqOs5+0f+0BwbGBiwinQAptMjkSTGjFmWagyHA==@nongnu.org
X-Gm-Message-State: AOJu0YxT7dGAVEL+ths7dv3kpIoz8peqseOlaAmRKo0b2Qi75zhsfoK3
 3efGxM8iilSAYgVE+SaZm6DUvc+FEWncHEtP5gmnTiYR0FLL5oAWkjBfRG/0FN5uRgwQ5zGeCkf
 l0xWHKxh0llCgEvFbJZNWmkWvI7zoTBenyoAbK+ZdAW/6BGH4edqgNUw=
X-Gm-Gg: AR+sD11+QSfxuPtDsUX+LvCyetPM0nfOlf3Y9YYwCy6EuNcCV7z7SOrEBuW1Emgb231
 d72LNxpeBKoMIpz6SnEiBIJTbPik6eGDrBD+4SIzVoWSI0LlkEoS6tyUkwW+uhHep8UDLwc/wfP
 B64yD1HWKHjred0cjGLEAhqnH/NisBNn5TxAZW6M4WzizhQ2oSJO4q3iX+wEOsqPvPy9bOrwAju
 mFIz28IB7ob7xXMoswgN30i43ykvDEQunDolw/HFswFGwzDuHJrumOieQ1R9cghLJyBs+VdNLos
 1Npx9S/7X0cghiC4h3ak/5NwPGo2D+FJHkA80yiOBo5Qkufrg0L3M+z8V7ypUm2DLrSpSgvFHk0
 E6bg/qkcTeMMuYEaa3bUPkZdWJgUN3CWH+C9pNV1g3Q==
X-Received: by 2002:ac8:610a:0:b0:51c:6b6:9d0b with SMTP id
 d75a77b69052e-52df56e48ebmr12101651cf.2.1787256863167; 
 Thu, 20 Aug 2026 13:14:23 -0700 (PDT)
X-Received: by 2002:ac8:610a:0:b0:51c:6b6:9d0b with SMTP id
 d75a77b69052e-52df56e48ebmr12100911cf.2.1787256862673; 
 Thu, 20 Aug 2026 13:14:22 -0700 (PDT)
Received: from localhost.localdomain (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-499b90d297esm3831355e9.2.2026.08.20.13.14.21
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 20 Aug 2026 13:14:22 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-s390x@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-ppc@nongnu.org,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Michael Rolnik <mrolnik@gmail.com>
Subject: [PATCH v2 03/15] target/avr: Constify CPUAVRState for some cpu_*()
 getters
Date: Thu, 20 Aug 2026 22:13:43 +0200
Message-ID: <20260820201356.29775-4-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260820201356.29775-1-philmd@oss.qualcomm.com>
References: <20260820201356.29775-1-philmd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: buexeEjKLvfMFwkGu8FXFKcIGLeJTFTL
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDE1MiBTYWx0ZWRfX2XPQ4MjAuaZj
 VOfa1g4nvKvclTv8U7xo8E0zOSlmJkj/2lks0jnfdc7jfeNo+Sp6KQTaQbdpgOW2ROWds7Y2zya
 8cD4bs6Uwx/lwo9OYaXq1OAXzh+RA7c=
X-Authority-Analysis: v=2.4 cv=T/O8ifKQ c=1 sm=1 tr=0 ts=6a87601f cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=20KFwNOVAAAA:8 a=064F3_fa85QpgnnSfTgA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDE1MiBTYWx0ZWRfX2CJloQy8QdJa
 Oe0S0EmytRCpN7+TdmUVbZp1cO9SkJizoBxO5XT9Ckn/sVUW5tFTr1lyeOU9YLXryJrAbIItSqD
 998Hcj4xKjgmqzMySGEDo1CiuyjK+Coh6XWf29vst4Z1p9EVYBn42CjvVx8USP05yZjlf45BvsH
 1lhH6StX+D4msRy3M74BhGi+s1/UsxKSS69qbsCeHvfQk87iPHvmvTGBPGQYuk8R/rtOYSyaypF
 ytIb00EmMaCBWTE2HJlISmuJ3NQj4zNuTDMdA3BjAR6zTI+/mFBVfLsoAjunvCiMEM989tu9ipQ
 4/zl+8HqUHc9s6gGhJucxqFZ1OWvnMNYY3N9zer82YsN5ijOJ2ANiNxArBfZuHKULs9lIGyEoWF
 oSdu+oWzEZ/PcO1Pny2xPx/iAvcENsPgxI4zip3U5ugcUXDrIZiSuvkcuzqo/agToNhNtCFyfVH
 jZ/ukACuYKVncrEmhAg==
X-Proofpoint-ORIG-GUID: buexeEjKLvfMFwkGu8FXFKcIGLeJTFTL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-20_02,2026-08-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 bulkscore=0
 spamscore=0 adultscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
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

Add the const qualifier to CPUAVRState when the
argument is accessed without modification.

Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 target/avr/cpu.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/target/avr/cpu.h b/target/avr/cpu.h
index a818db753b2..1e4e839bd83 100644
--- a/target/avr/cpu.h
+++ b/target/avr/cpu.h
@@ -183,7 +183,7 @@ int avr_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
 int avr_print_insn(bfd_vma addr, disassemble_info *info);
 vaddr avr_cpu_gdb_adjust_breakpoint(CPUState *cpu, vaddr addr);
 
-static inline int avr_feature(CPUAVRState *env, AVRFeature feature)
+static inline int avr_feature(const CPUAVRState *env, AVRFeature feature)
 {
     return (env->features & (1U << feature)) != 0;
 }
@@ -204,12 +204,12 @@ enum {
     TB_FLAGS_SKIP = 2,
 };
 
-static inline int cpu_interrupts_enabled(CPUAVRState *env)
+static inline int cpu_interrupts_enabled(const CPUAVRState *env)
 {
     return env->sregI != 0;
 }
 
-static inline uint8_t cpu_get_sreg(CPUAVRState *env)
+static inline uint8_t cpu_get_sreg(const CPUAVRState *env)
 {
     return (env->sregC) << 0
          | (env->sregZ) << 1
-- 
2.53.0


