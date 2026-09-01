Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DB34C624CF
	for <qemu-arm@archiver.kernel.org>; Tue,  1 Sep 2026 09:56:27 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x1LBq-0000yX-UH; Tue, 01 Sep 2026 05:54:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1x1LBl-0000qG-5v
 for qemu-arm@nongnu.org; Tue, 01 Sep 2026 05:53:58 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1x1LBj-0007dC-Jl
 for qemu-arm@nongnu.org; Tue, 01 Sep 2026 05:53:56 -0400
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 681792L9705425
 for <qemu-arm@nongnu.org>; Tue, 1 Sep 2026 09:53:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 l/YzYoACAzMQZT0mHSEMi7Bfq6APst8PG0qMwh1Z/kg=; b=RsyXXd0MD/AtLzaw
 KYvaeBf8SeyWKOPn+88xmJ8FnBpaJjXaKG4ba1n76hVRD29BXy/zyCYwc+RWEuNg
 GayZWbtFLJQWGm0djJJcFchCdrPS4SRgIvfd8TcyAnB4njopryeD43xzoB4h118I
 4ZeLcAGwDVQOVyWKUr6YfoHrBoN2VB0sX2d9HTDWbeKSCGThkPR/sEUisBTztika
 3XzHxkK2bCFawi1Ws2QQOhUYU0R3sN+cn7Rwdf6BJC3sqED5odM/vkpERyUqE3dA
 fBch0Sfjkw8QWfVJWqqB84BDWLyj9fwOn42rYgV/EoeDKxVoJRImwSSM9rEiwlHM
 /AyVPw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdrcsh68e-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Tue, 01 Sep 2026 09:53:54 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-933023a5980so945295085a.3
 for <qemu-arm@nongnu.org>; Tue, 01 Sep 2026 02:53:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1788256433; x=1788861233; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=l/YzYoACAzMQZT0mHSEMi7Bfq6APst8PG0qMwh1Z/kg=;
 b=WvJUk+K956MGCFFwNO+cwX24wZvjwURdQYWxtl8hyIhUKSJsS1I4Y1GbrmyfNSaoDd
 +zFgqxPJQ0rdnxI7V0/n7JfRs7Z49WldHAmmeo+jDzkEd9pn+R0rCcCGe/4s5Y7vsqkr
 BdwB8NsC/zDEF1BfRvEpDlFT21VOdyjO7ki0JnzVO3e4bhCorXQZxhGteRbJANcrksUw
 OwM2TvTmqzTazkTw/2QdCwajfLqysur4LfvZ8P5YtWcyHY0GyFmjiqU7AFl10l0A1x7b
 mx9TAo+nvlv/PKm76xE6R1w2b8h/S6FQHsKMlJfH7+aGgDrZtYsK3CWBy8am4dZmiCth
 FkHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788256433; x=1788861233;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=l/YzYoACAzMQZT0mHSEMi7Bfq6APst8PG0qMwh1Z/kg=;
 b=Mp6qe2oMopmH/xtYJSYDHKFPwJF0JH2SrrtmCvU+tO2Jl2aDeCmBAT7jtkkzM9Pd7b
 obSi88/xFS1TfbqJsbAHq1arNS/HcVMRouHSQaHv1+MFNmmZvDggw9rHTYeulbPaB+gI
 SsICLEiG/lsYnx5JhrPj6pKdFzqiUcsn9Ljg64ai4O1sYGsAJK9m+qelPfRGyX9xTYwx
 czu7tkWJbCHpXQuw7VLuyk+ZKcFhCF/6/9hkr1Bk5NV7TkQ22AjT1MUK1utW7VtTXpWG
 n01LsyYwPjwlzuq7SUEyYqVXHE8/B9uCq1NvYxJ25JTDIpW1druqi/ONMIM1c2KItGCV
 8ccw==
X-Forwarded-Encrypted: i=1;
 AHgh+Rp7EfsZNf2Nlm5eEOmsfKnrmWlY/SFgAiHBiWFj9uwGI3hnd5+CCFNtkigOgGwWP7k5a90vIMZDiw==@nongnu.org
X-Gm-Message-State: AFuF++nBJfm5LefduOop7aBW+OAv2gDaoa+JN0+xBRZFfLhzX4fegYBc
 XJ6kc4vMBXUMWJvtNw6/xN/TWmYUSuaqTXIr0KLNSFfxXTiVJdYNfcf066U2RkbZDjZf+b83Zkx
 NiLsr5+8/kX1hNO4pxReoUsFMDMQgn1yDq1h5Ilh7IxAUWUmedxVlfkA=
X-Gm-Gg: AR+sD11GvGAMAK/xsntU9viTjT/oFDZtZ/8yATX1oA0gFWVJl4OO+xw8msBCMjXrLrL
 X8mp2QpIR0KsVmYV1Ai/AVPKPLMGA1iJJ/F57vTrBsRj+IVDqnp5tcWWdEeg9Gui8UC5EEOBF5b
 ssVYcGXu6HZRAU80mM1W6B9CrHNlzeJhDqzsC3lrTV2sYR76n/EqBk8zTx5rfP1tPt6YkzVAoTG
 WvzXCwfNeDX0y+xrI8UG3p9ZVPiI0m4WjXDGJpN17dK+a3XxgcaBFXo+UPBpeOXRo9PHn6Z0/Sx
 lGeVs0r1OgwnAYgroyDJPbdUK01EsmSFBV9zazsCqMosUgifjGOlAuZLWH9KfAz2Zq22XwiNxmU
 RorZDuItEvM0uBmywI55Qz71c7LsLw7Zf7lS6GBVc
X-Received: by 2002:a05:620a:44c4:b0:933:a17:c0c4 with SMTP id
 af79cd13be357-9391378416emr3344181985a.9.1788256433183; 
 Tue, 01 Sep 2026 02:53:53 -0700 (PDT)
X-Received: by 2002:a05:620a:44c4:b0:933:a17:c0c4 with SMTP id
 af79cd13be357-9391378416emr3344178885a.9.1788256432597; 
 Tue, 01 Sep 2026 02:53:52 -0700 (PDT)
Received: from localhost.localdomain (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49b91c5790csm294645385e9.0.2026.09.01.02.53.51
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 01 Sep 2026 02:53:51 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Zhao Liu <zhao1.liu@intel.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Bibo Mao <maobibo@loongson.cn>, Song Gao <17746591750@163.com>,
 Xianglai Li <lixianglai@loongson.cn>
Subject: [PATCH v5 11/21] target/loongarch: Constify CPULoongArchState for
 various cpu_*() getters
Date: Tue,  1 Sep 2026 11:52:17 +0200
Message-ID: <20260901095229.72018-12-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260901095229.72018-1-philmd@oss.qualcomm.com>
References: <20260901095229.72018-1-philmd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDA4NyBTYWx0ZWRfX4sqlTUuolIKJ
 zN7JkXDFrLoulhTPOUqx4YcuKOI74oAujChCQ09OPwzGPUugolDYivTiaZiXEWNQFRY1kD3q8+X
 0hUXTjxwiDt2/LQlflFX9Gr9VVyZzFM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDA4NyBTYWx0ZWRfX0IfwnKEzQtjE
 PQ27t4oRZM2hbImImMLP9GOqP942BkLfpxce4dI9qJ10oHJ3ZKyz7QDXUHrz/2VWfAOGWuBwGD2
 8z6krtKJOnvyVlto8FkArqR2Gkw79VVUg/50uehjL2ONkZInHmBcmPTRPaF0RNN6j1ZGVeJSdz7
 E1Faikkg873LmLeeTSH9GkE2eCQMODPrFNr/9FuENgVnmEtuTmVQPLEJXw3Hsd5lUq2RRrN7Pky
 CTslY8lYmpYkQ2L5celqdNPqeaYUqlGY1HqpO3dNFRR4nmxVthGAaSb047T51FAf3hpKEz6nuQS
 QTXHOXoMPo/B9I6YsYsHpGcIE/hxayi+K6dbI17ZULtRJHaPE0iBNRP5iIjDMu4h+gHITvzgdJP
 MQBBHgqdzUgwqdM6/y/0Ra0kbGD+1swDIdMdsirbY08WsugcBxr6/LHRj8HgQgDY4g01ppV/5c9
 XbjZpVE9Y+4wUU91Z/A==
X-Proofpoint-GUID: w_Cy-gxA-XpggIzCKL7IBEebDrFhW-f1
X-Proofpoint-ORIG-GUID: w_Cy-gxA-XpggIzCKL7IBEebDrFhW-f1
X-Authority-Analysis: v=2.4 cv=QsNuG1yd c=1 sm=1 tr=0 ts=6a96a0b2 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=20KFwNOVAAAA:8 a=IBuu09U9_flyDEDmYOIA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_02,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 phishscore=0 suspectscore=0 adultscore=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609010087
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
Reviewed-by: Bibo Mao <maobibo@loongson.cn>
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
index 5e9a6c7bd65..a831507f439 100644
--- a/target/loongarch/internals.h
+++ b/target/loongarch/internals.h
@@ -39,7 +39,7 @@ uint64_t cpu_loongarch_get_constant_timer_counter(LoongArchCPU *cpu);
 uint64_t cpu_loongarch_get_constant_timer_ticks(LoongArchCPU *cpu);
 void cpu_loongarch_store_constant_timer_config(LoongArchCPU *cpu,
                                                uint64_t value);
-bool cpu_loongarch_hw_interrupts_pending(CPULoongArchState *env);
+bool cpu_loongarch_hw_interrupts_pending(const CPULoongArchState *env);
 #endif /* !CONFIG_USER_ONLY */
 
 uint64_t read_fcc(CPULoongArchState *env);
diff --git a/target/loongarch/cpu.c b/target/loongarch/cpu.c
index 7b601bd3728..3b3cbde882f 100644
--- a/target/loongarch/cpu.c
+++ b/target/loongarch/cpu.c
@@ -96,7 +96,7 @@ void loongarch_cpu_set_irq(void *opaque, int irq, int level)
 }
 
 /* Check if there is pending and not masked out interrupt */
-bool cpu_loongarch_hw_interrupts_pending(CPULoongArchState *env)
+bool cpu_loongarch_hw_interrupts_pending(const CPULoongArchState *env)
 {
     uint32_t pending;
     uint32_t status;
-- 
2.53.0


