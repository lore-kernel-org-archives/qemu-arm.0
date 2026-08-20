Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22A4FC5DF87
	for <qemu-arm@archiver.kernel.org>; Thu, 20 Aug 2026 10:50:43 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wx0Ka-0002AN-FS; Thu, 20 Aug 2026 06:49:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wx0KS-00020X-8a
 for qemu-arm@nongnu.org; Thu, 20 Aug 2026 06:49:02 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wx0KP-0005xT-EY
 for qemu-arm@nongnu.org; Thu, 20 Aug 2026 06:48:59 -0400
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67K9JGaO2927192
 for <qemu-arm@nongnu.org>; Thu, 20 Aug 2026 10:48:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 DQfkNJ6kh6LohDBdsbWuKwhfmfdLvPKv9l7+7bK3h7k=; b=MpP5Gar3xvZODOtO
 fGHDZd4LpnabksRB83ad7R8ZgiceTQveUe5eIY3JkPu3bQwy+tQLBWbUGmse7sUm
 uoN+NfpTGb0BjjkyZZHlSh6xRYS/oknVtkvJjDui0S2HhAk24+PN3HtJANwyZH4Z
 LdNfgrCpBdKfKJFqZStOen7CATTrpywktiBw5jgQHZU81IRo2fOLqJh0peZtmDlS
 iHUuYdYA8KkpW9VZI6wksdDJPNHV8PDT4O6xa0VbDwveo/mQcL2K+1f104upw7oe
 siV1MQ76nDWXYWGqNcLmJq6NzjoHW3/PsPMf/TQkbj35kty7TiKE6/rCHw/2yg+0
 DaGh8A==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5xuk0bcn-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Thu, 20 Aug 2026 10:48:46 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-936708f129aso183727485a.0
 for <qemu-arm@nongnu.org>; Thu, 20 Aug 2026 03:48:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1787222926; x=1787827726; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=DQfkNJ6kh6LohDBdsbWuKwhfmfdLvPKv9l7+7bK3h7k=;
 b=BZ6O8aRdld5ljhQ7ap0N8ftXJj04o7YFLs9NwAqWGS7xEiIJyIUSnD8PC9NGsnIs/r
 6bVbljFbea55Snr4fHOzTRxwg3HrZ09ULh+Z7YA8RpM+FfmDwETTqSy6kJEvRFV5128c
 2bHp1T7aRBGDdKXL9VXhF2zqTM28DrjDoTwKieLizNnLfKRFKxKFL7LmMWPH1ru9/moa
 9nTOBpp92tqzTr6ja9Dd/EwETYSKeuGW3AeR0f0rC/ZLNe8gHCI5GhsyKC8p4HyDGse9
 ON6LYuTt78yBueCXZDNbPYeCiJ557mZQQ/JWBKpzEKdyqXAcIVRpQEVyS9Km+kqMoETX
 Xxbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787222926; x=1787827726;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=DQfkNJ6kh6LohDBdsbWuKwhfmfdLvPKv9l7+7bK3h7k=;
 b=jsClFp1hJkpIk5aCsLWBtggbwwdNwap+DlmYakgqBn7OC5sP8bc4aiQTDjNXfkD5xy
 QaRffiBvPKcTlqfHQKcrzWGUv7udgDBG8RDkdjy7y1J9tSkQX6wLoYx0DHwMYfBqGjoO
 g8UEpY5pmUDwIH6Ouc24xa3vfCigNQIEHz97O7DfTFXiCisKXD0d2mzdLFAbEqYAaiVW
 1ZdnvwbW/shDfDyi93sP9Hofe8fDpKNaxMFNUDgDuIiAO4R0GYgK3w6yp3c8acYbjdZ2
 /ptvXIN+4iNm0ud89v5iRBfiGAeU6wPn3zJgAf9XA/pifsXPhIXy7LkXwqoljd6iStIJ
 qgCQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RoB6qRumPGe9VH7FZ5xkexjARnpNwoYFJpKBmVfvR30xlDXi6zN4RvWMiL7qFoCQUt7iJzrpzHj/w==@nongnu.org
X-Gm-Message-State: AOJu0Yz0BeUiufiT+wlXoTn2zvUvhUFS/979TQrOQM6b3BpaUz/qbutX
 9f/gleapL6VNoJ5bOU6jxYqv9bVIs5l3L2lCfuiKfLjpzU7QGfCiLDh/CbyUwO//zIh0/9Q2C2h
 T97hYKBBFD8AOjDnA2latG4zyOViw+jRM2Nj56kSatDJYRAsFzoFjM78=
X-Gm-Gg: AR+sD137fe6My5m0qg4o5F5HdGTFOZIJu/snBUvZd/YYC+Y5Pmwg/QWhEmnCjcaaQ8h
 /p5qvfZZBbDPPQ1bCfbYq4yNs21L7RU8g35eXzAqWEO3tmqzH7qKcxLPp6k01hDeSC1seF20euX
 Ha1tezC8pdeIj5f1j7B4WnjcH8wqE5GnZtLKa0kXKEsNsVdXXCf3RFZ8EBbOAC5SmqTvChI7Vme
 UxB69ysHj2nwTkifSQU4bh9i//JfQ3kOGgdbdj561pEVamlnlXQ50H6rE3ZnTgZGOehVD4J3qkT
 Nln0/v7pvA/L1QWTY1LV3n48i9YDy+GvO8HoXwMm1fyQ1GaxVJrrK1TeM12svzwo/5cCF/Ya93g
 SGXhJQyzf/cuM/NE8pdHN5jXkcfvbCOrKrOanhINUyQ==
X-Received: by 2002:a05:620a:d87:b0:92e:fc42:2c19 with SMTP id
 af79cd13be357-9371e24b0c5mr1024162885a.11.1787222925911; 
 Thu, 20 Aug 2026 03:48:45 -0700 (PDT)
X-Received: by 2002:a05:620a:d87:b0:92e:fc42:2c19 with SMTP id
 af79cd13be357-9371e24b0c5mr1024158785a.11.1787222925370; 
 Thu, 20 Aug 2026 03:48:45 -0700 (PDT)
Received: from localhost.localdomain (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-499b3c556a3sm23707225e9.3.2026.08.20.03.48.44
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 20 Aug 2026 03:48:44 -0700 (PDT)
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
Subject: [RFC PATCH 10/13] target/riscv: Constify CPURISCVState for various
 cpu_*() getters
Date: Thu, 20 Aug 2026 12:47:26 +0200
Message-ID: <20260820104730.25462-11-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260820104730.25462-1-philmd@oss.qualcomm.com>
References: <20260820104730.25462-1-philmd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: WuFi_u_ZQv2SuAcn65tK9c6BZG6Mgu2F
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDA3OSBTYWx0ZWRfX8vlPWsoHMaoY
 xqaYHthAaBrtX/SB3T2HBm+ZdELlc6CdKmlYT2v/w8LKMFI9mNsRJJLOVtJTv/Qn40WPQ++ZkXg
 dTiH75aoLrTgVZjalqs8g1SWmF3E3VU=
X-Authority-Analysis: v=2.4 cv=T/O8ifKQ c=1 sm=1 tr=0 ts=6a86db8e cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=W-temX7IfkLqO7pPVx4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDA3OSBTYWx0ZWRfX9ziZEy0i049J
 OTzJhD/f4IipZcnSjpYi8oKNuSz9nw2DcmLkytNNn64H9ro67D00YAghf8SERODB0XgL4pVJLGt
 l3oREtVOnbhJ8A2LtGe1FCVt1ucHQStsFHSLo+2NYvQH92EsGxauSE4AztsppdOBYFNR5M/rJjv
 q4FXpcQk+PheFgGVajCNoXqv3mxFTBrTQVOPRuPAe5axcjVKkrLWD+f1Z4/EdxN6/s38+f0Zdn+
 /BdNlmZsaE+j/lB8lJXrxkHm225/K5bV7rREnuJZGdW79jFRh+CyooqzdJGTG1FU0q7jTOlozjl
 Sbl0/4qtucZty2ezfAfDgJJbSMKr+HtDjX/9QiskuIdzm2puWt0Zp24vCKfeAmqrMPR+veFCBzC
 iaAVTg5J663lZKhLwQW9IWhaFVJxhuoaDK7vLWxIIAmugoewGWrrGle6eG+FbAHntILmseD1PvV
 /ogWu45HpikC71Htqgw==
X-Proofpoint-ORIG-GUID: WuFi_u_ZQv2SuAcn65tK9c6BZG6Mgu2F
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

Add the const qualifier to CPURISCVState when the
argument is accessed without modification.

Note we have to use the recently introduced
env_archcpu_const() helper in riscv_cpu_cfg().

Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
---
 target/riscv/cpu.h | 12 ++++++------
 target/riscv/cpu.c |  8 ++++----
 2 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 2333dcecd8a..9fd9ba54147 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -637,10 +637,10 @@ int riscv_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
 int riscv_cpu_hviprio_index2irq(int index, int *out_irq, int *out_rdzero);
 uint8_t riscv_cpu_default_priority(int irq);
 uint64_t riscv_cpu_all_pending(const CPURISCVState *env);
-int riscv_cpu_mirq_pending(CPURISCVState *env);
-int riscv_cpu_sirq_pending(CPURISCVState *env);
-int riscv_cpu_vsirq_pending(CPURISCVState *env);
-int riscv_cpu_pending_to_irq(CPURISCVState *env,
+int riscv_cpu_mirq_pending(const CPURISCVState *env);
+int riscv_cpu_sirq_pending(const CPURISCVState *env);
+int riscv_cpu_vsirq_pending(const CPURISCVState *env);
+int riscv_cpu_pending_to_irq(const CPURISCVState *env,
                              int extirq, unsigned int extirq_def_prio,
                              uint64_t pending, const uint8_t *iprio);
 
@@ -753,9 +753,9 @@ static inline RISCVMXL riscv_cpu_mxl(const CPURISCVState *env)
 #endif
 #define riscv_cpu_mxl_bits(env) (1UL << (4 + riscv_cpu_mxl(env)))
 
-static inline const RISCVCPUConfig *riscv_cpu_cfg(CPURISCVState *env)
+static inline const RISCVCPUConfig *riscv_cpu_cfg(const CPURISCVState *env)
 {
-    return &env_archcpu(env)->cfg;
+    return &env_archcpu_const(env)->cfg;
 }
 
 #if !defined(CONFIG_USER_ONLY)
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index a344daf62f8..ab2868dc1e2 100644
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
@@ -917,7 +917,7 @@ uint64_t riscv_cpu_all_pending(const CPURISCVState *env)
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
-- 
2.53.0


