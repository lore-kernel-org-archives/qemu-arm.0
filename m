Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F125DC61DB6
	for <qemu-arm@archiver.kernel.org>; Mon, 24 Aug 2026 11:19:20 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wyShA-0002V1-BA; Mon, 24 Aug 2026 07:18:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wySh7-0002Br-Ll
 for qemu-arm@nongnu.org; Mon, 24 Aug 2026 07:18:25 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wySh2-0005Ea-5s
 for qemu-arm@nongnu.org; Mon, 24 Aug 2026 07:18:25 -0400
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67O99Gjf3575222
 for <qemu-arm@nongnu.org>; Mon, 24 Aug 2026 11:18:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 5vYRARi2QtmKNQI0is/5y9raLqQC71JC+pNDAX0+lq4=; b=DrdJCH6w9Ru9RuVz
 rPz9tcf9fcQdADBvJRzsei75mMaro0isSkI5+2J3DU3VgPFlg71MA7MTGaRq6J29
 qDIPPLMT22Eo/cyR2TmBzXe9ZWaayj0B6rbrFT3TrJUjWJDYiLkw9iUHbDeapfSl
 hk4SRojVL0L1IaAOhG+BUFmHyE+7iBAMQNvaI/tgohHIRFhXm97XmKqOAr/X3eO6
 CMYDWU8yPPqRFCIEDIZCqMJnmNc0vl8wP1NS2EPeJ6M4I5365dB/R8w8WyLB5gqu
 Axf0VMrASYhy9Q0D6D0lnz7GVn/Dx2/qLIAFveKpgD6TnGhLxVVcPMxhAK9PJxPJ
 SgYQuw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g88jpjd0h-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Mon, 24 Aug 2026 11:18:08 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-51a8b0a08d2so27947301cf.0
 for <qemu-arm@nongnu.org>; Mon, 24 Aug 2026 04:18:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1787570288; x=1788175088; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=5vYRARi2QtmKNQI0is/5y9raLqQC71JC+pNDAX0+lq4=;
 b=hGmDvCAH0ZDLl6dEEyIjPlGAxQJbNJR71xXvZl4xoTnLfZp2fmiwupGN/PuNrExtgR
 bzI0y6By0U/8InF8ZA5stDnAxJag3xYyFlxgAFQv6Xlpt7u9oEx7KCVZ2MTOgiCpkU4t
 VR7N9A6jV8XynDk9qFSZFDitv+n5giAkaZH4m5IuaFwXhd7ykrCfqGFtYsmuZAHTr/wX
 UoOrpVrnrxt2ok1PFujJcaZTCH9pi7tr8TQo17bne06as1S1FheBsZOL9wiC8EBJzKV+
 Jd+DPynyXx+H8yWnWJpRS+Rg5Ox0Xj6EIJjlZjplRbQ1hIXPyiqt0mcb9pM6XZHmCd2d
 AspA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787570288; x=1788175088;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=5vYRARi2QtmKNQI0is/5y9raLqQC71JC+pNDAX0+lq4=;
 b=r3jaOvAd2fKlQnKSo/jme6rrzWswf3NoNDwHsR9wcOFYWsjUTjrsZHnpcxq3OhzycT
 WAUEkWD/hQctH4AHoFDEvwzgcWhBgR4To7CH7l9cB7C67K/x1bDYEtNaFPlFkHR6pzio
 uu+kf+UBtte/WzuaZ8yuQnm39xQJCkqjXZnMbmKmXDjzAEwIKB9XjJQceypj3DueWEqY
 /B90LMlzZin8nmiwM4fPkKNejkPScQ8DI9C1gPGnavPjtk+O4WxSgtcWkGwds4q4I2pa
 3sGLcfsHOFdV7/XgyIUJ7JDSgrOpybEKedar5E9qXslBQ3QyqJhpHcsVcfU8f8gxsvPS
 DORw==
X-Forwarded-Encrypted: i=1;
 AHgh+RoL2HOSMEvNAtGptmPWRRJPfMqRkzrDvHIqO0P2LTZkJrsFVtyHsmyZHouwV+xfME6vMcKWRPdHuQ==@nongnu.org
X-Gm-Message-State: AFuF++mflktkTYQnSEKhYBvR0LilyDjVPlbFEaAqWxZnoHHErsRLlCs5
 KmVFWOSTyj7kPkqxdMYyfJ7THh8ejnzz9id8ef6rn3S0wX7gjuypge6dkLy5s1sN7CmrQoJ3HT7
 A9qA89hpZwWMz463Ktxv/oWvuz1/SeAMuSmmX2RXFrKZOfO7lO+x6fso=
X-Gm-Gg: AR+sD13f2b7FlAw0QcJj+1ec8clywSJUTVE+xmhLm1DVHlP3yXw+71IQaRx7Vn3v+DB
 g/zNLUfs8iiIf+eVvAuaNAHYm5IdKz3DijXgRPM2VojSasCU6G/bAPLYVmZWfHwqKQA2jLIq89g
 8kEU5KwTmqTEu/1wEBuwpUsZiLNIbRD3OUcSMedcgE2x2K3mdNi7z7h3azpZNWhUjqveZWH47J8
 Vsm2Cjes/yVqpt3p1tZ7EQMvpSbDVlJWSp1t7ajBg5Avm3ObIwmWLZMXC2Et0jnu3IaTSIm3L/1
 IeaN+XgVgBlAOAfyuhrkUpVpcNMT4ivZoZwExlr7QNAe6HcyreCh7Zx5GxJeKO42ZAheHzGYNcU
 yTbILVgDhigW+vZGEW7T+OgE4fCcrlsV1rfh2cQF+WKcN+9V/Xw==
X-Received: by 2002:a05:622a:4c07:b0:51c:14f5:8f9c with SMTP id
 d75a77b69052e-52df59ec938mr262121071cf.27.1787570287336; 
 Mon, 24 Aug 2026 04:18:07 -0700 (PDT)
X-Received: by 2002:a05:622a:4c07:b0:51c:14f5:8f9c with SMTP id
 d75a77b69052e-52df59ec938mr262120581cf.27.1787570286937; 
 Mon, 24 Aug 2026 04:18:06 -0700 (PDT)
Received: from localhost.localdomain (44.170.88.92.rev.sfr.net. [92.88.170.44])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c24966f99basm1161639766b.37.2026.08.24.04.18.04
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 24 Aug 2026 04:18:05 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-arm@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-ppc@nongnu.org,
 qemu-s390x@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
 Zhao Liu <zhao1.liu@intel.com>, Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v4 05/20] system/cpus: Constify various CPUState arguments
Date: Mon, 24 Aug 2026 13:16:54 +0200
Message-ID: <20260824111711.26297-6-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260824111711.26297-1-philmd@oss.qualcomm.com>
References: <20260824111711.26297-1-philmd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA5NCBTYWx0ZWRfXzHuva3Vq69n1
 sT1c7dqwsbUs5bHzGh6UAYw/6IAjLGSrk7+2ZYz6OWcWic3xXIDbsq6Ylilh2iJtt78GcJoKJjh
 7KfRBNytMa9HXRr25kgfYU8wxkp5SplMny9THdu+qbM05zo7pJBQvpcHGw1TayiKMX4tKW5bOu4
 mqQvyCs4+/xVWFay2ZwO0wunaZca5+bP/gGzLdTmtWagV4d9LoEyTa5SGgU58Cw9IvkkqO7aJbs
 74LObPZbiULI1Y9/7PzvEbAX8toYfYW93dxZy6y33iV7eWulmkoWbRvEWkkEHLo15dIm3cus+Xm
 Oq4Ff9ItkojPwsWQba1uR5rr4vNOkkw0M2gSNmLwM9EjnYZ4hTpBhkFQHlQmJ7kOqq88WhfREy8
 rzx5oSd76wrfUF5iWKjpWdWbLd0tI/Ps16V66PjuOoRzvUyxWGPaX6biB04FvIdvqa5qBnO4zLY
 6U3quAzru3QkQxKHjhQ==
X-Proofpoint-GUID: A_GuY1OFMY39fO36-PIAR3aAuLTt76vZ
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA5NCBTYWx0ZWRfX0jBDENLgIUi3
 Em6tM8ncxGu9iuyWzeW3cTbhiKAZj9e9D2iDYZbj/NMeydDD7q8rwfq5JPce2sxTsTnJVKJ/H+i
 8WS1IrZ9vQ0E5mQFLJCLw9KkgTPFyiM=
X-Authority-Analysis: v=2.4 cv=Xey5Co55 c=1 sm=1 tr=0 ts=6a8c2870 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=s1NLoHz9uzatdv2VNqxUSg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=xPOHbBPGvMiCLs31fh8A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: A_GuY1OFMY39fO36-PIAR3aAuLTt76vZ
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

Mark the CPUState structure const when it is only accessed read-only.

Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/hw/core/cpu.h | 4 ++--
 include/system/cpus.h | 4 ++--
 system/cpus.c         | 6 +++---
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index 18970ea39f5..328e30045ce 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -900,7 +900,7 @@ void qemu_cpu_kick(CPUState *cpu);
  * Returns: %true if run state is not running or if artificially stopped;
  * %false otherwise.
  */
-bool cpu_is_stopped(CPUState *cpu);
+bool cpu_is_stopped(const CPUState *cpu);
 
 /**
  * do_run_on_cpu:
@@ -1007,7 +1007,7 @@ void cpu_interrupt(CPUState *cpu, int mask);
  *
  * Checks if any of interrupts in @mask are pending on @cpu.
  */
-static inline bool cpu_test_interrupt(CPUState *cpu, int mask)
+static inline bool cpu_test_interrupt(const CPUState *cpu, int mask)
 {
     return qatomic_load_acquire(&cpu->interrupt_request) & mask;
 }
diff --git a/include/system/cpus.h b/include/system/cpus.h
index 508444ccf1c..bf36b823769 100644
--- a/include/system/cpus.h
+++ b/include/system/cpus.h
@@ -13,10 +13,10 @@ const AccelOpsClass *cpus_get_accel(void);
 #define VCPU_THREAD_NAME_SIZE 16
 
 void cpus_kick_thread(CPUState *cpu);
-bool cpu_work_list_empty(CPUState *cpu);
+bool cpu_work_list_empty(const CPUState *cpu);
 bool cpu_thread_is_idle(CPUState *cpu);
 bool all_cpu_threads_idle(void);
-bool cpu_can_run(CPUState *cpu);
+bool cpu_can_run(const CPUState *cpu);
 void qemu_process_cpu_events_common(CPUState *cpu);
 void cpu_thread_signal_created(CPUState *cpu);
 void cpu_thread_signal_destroyed(CPUState *cpu);
diff --git a/system/cpus.c b/system/cpus.c
index f37e215c586..e11a5aab6a6 100644
--- a/system/cpus.c
+++ b/system/cpus.c
@@ -69,12 +69,12 @@ static QemuMutex bql;
  */
 static const AccelOpsClass *cpus_accel;
 
-bool cpu_is_stopped(CPUState *cpu)
+bool cpu_is_stopped(const CPUState *cpu)
 {
     return cpu->stopped || !runstate_is_running();
 }
 
-bool cpu_work_list_empty(CPUState *cpu)
+bool cpu_work_list_empty(const CPUState *cpu)
 {
     return QSIMPLEQ_EMPTY_ATOMIC(&cpu->work_list);
 }
@@ -271,7 +271,7 @@ void cpu_interrupt(CPUState *cpu, int mask)
     cpus_accel->handle_interrupt(cpu, mask);
 }
 
-bool cpu_can_run(CPUState *cpu)
+bool cpu_can_run(const CPUState *cpu)
 {
     if (cpu->stop) {
         return false;
-- 
2.53.0


