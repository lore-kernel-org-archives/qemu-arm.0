Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7AC4C5DF87
	for <qemu-arm@archiver.kernel.org>; Fri, 21 Aug 2026 10:50:50 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wxMpb-0004NN-Q6; Fri, 21 Aug 2026 06:50:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wxMpX-0004KZ-IW
 for qemu-arm@nongnu.org; Fri, 21 Aug 2026 06:50:35 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wxMpV-0003C3-Q7
 for qemu-arm@nongnu.org; Fri, 21 Aug 2026 06:50:35 -0400
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67L9Mhgj1801312
 for <qemu-arm@nongnu.org>; Fri, 21 Aug 2026 10:50:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 lEnvXfEMJ3q8d6QNi/AAV3stk1lN6HSf4sh7CE8qq2U=; b=mSWEu4LA7ZN9SmWw
 58WgL9LY0p6TjvKcuBPBAQvPevKPV9/5Uoc0PrmetnINO5ChXvYmPPH1hyo0ApwX
 UXfxMw+7igB4nSPFFFldoEA4p/wlSIFfdN4VS0FCoD2eBoX/Zt9aEYzVBQJBYFD3
 iCP2mbL8uLCAiqW+mpP6K0o4wDKBjEB9jMlY7qojurkzN9Dk1p9QhWZOxrPRZ910
 zqetki7SDK6SHejBT5By0Sd4jxU7LVwxecKN4i+eYS8uXBtfDdTkMQu73isbst7l
 hwrVff3W8tkd1nBA1o/Qei9u1ZaxEHcZO5xkNXW6e7aOJa47AtjQ/YmhPsW/qCzF
 OaymiQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g6ecb9jgh-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Fri, 21 Aug 2026 10:50:22 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-51bfe3fa93bso8733521cf.2
 for <qemu-arm@nongnu.org>; Fri, 21 Aug 2026 03:50:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1787309422; x=1787914222; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=lEnvXfEMJ3q8d6QNi/AAV3stk1lN6HSf4sh7CE8qq2U=;
 b=HEBJjEh8Qif9cgQr6EJPPQKnn6d2Kx9UZoLBmI3CB3bfozo7ZnhN7JAEzACdNLf3lJ
 laKLNmzyi5fdNguLXtmN5mV/7Smn/stsRM1wDt27k3UTXn+GqdAm3CI6FDqcLmEiu4KC
 H5Td2G8V/yts7I5Joa0m9QM/ztugfDJHQDbgNf6kkrv4LslUbAyEovvspq3t8Mx2LRyc
 /jXSwQpp/9bflGsaIbDS+YTvi0zGvYG1zapS1CJS1/iOfqOw+EtFiiZQ4FRV+nBOHYYB
 5VO8TwJIAvk5r/uFdijcHg3eWdIRRdLwoIvtnNwOrapry+VEh1b4BfYaZ8jrq5MOdFE2
 axRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787309422; x=1787914222;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=lEnvXfEMJ3q8d6QNi/AAV3stk1lN6HSf4sh7CE8qq2U=;
 b=KiAdORiNHkNKe7HYbDU7HFCIOv5DyhGLdlfUsKN2+Ofh7HqEqoNrR0gR6JPGXAmkI1
 BazxefvE1jUM1cCQMzYZt9WTA3fOxSa1kubx1jRJs6RyxbDnZG2sTcBGIcGZPlB1w67v
 1PvnzpZ9iKv3Dy1jjpUCf7jvmP3drT+kHWXTKx9BHm9OC00ETR+J8DgSgjU/wq5QAbLB
 OXjxGC3WIggdAtJxV+OYSDUx2pfnJC2bdDYb4N6NT9PxRgV0iA4uYpAFprrcrNdpQPVZ
 BzX1b3aqC34bfqUVyQ58PGAZGx3MUsT1hm4Kg1CNp+t2ap9xGg/hSOq2EviSn0ll/o0F
 0ynQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RqDRjJSldOCw5hhW1DMPkXkRn0iVbWwWWT0ScyF3x8rs5VkADlDGkF2OkmbWTuiAi2ytum4+/rDlA==@nongnu.org
X-Gm-Message-State: AOJu0YzT4lReYKQGVM68VluWOE9jhfHkFEFbTE9DZ26U5SbbqyQhhl2J
 WDtz7kxeNpaKsO/MUaIl5BklaQ/FPfiowWdtKoTLrL9ngOLvrn/5EEgqpz0DrwtBxA3vFJyq8/y
 YTwgy9zrRcz/vL9wl47xKzvwHyA8Pr+Y8vtkVkwJzo5ptkc3sG7ffEm4=
X-Gm-Gg: AR+sD12Q5HskX1YDaasnLNTcdIWRFl4E0xNBvuDvKlzo2qLT2L+YhWI2sE1GfkHgivZ
 Py3H8Fbn8yeDn+Y82qEiIF7QpDbrqrjT1yz8ga2lndKnieFkzI4gt+wX77+g2yVHsbEEgg7dEpE
 47US7i8fJLSv7Hi9l+8DJuF235MfotBVXlnuxKSisgS60rIftxmzitCosK0zhlRQnqKBT0zTcdm
 Pqr6nLVNo3hdz9M7HlSzbwV+qSoVCVMIh+CqFJGq864OlKr2Ni3Tkw4gBZZCM64DlixG5bDyTIS
 VUHcF5R1BY5c/465/p00v8MyRAIj1ZJYHAVCTUMljbFiU50zSq948SyBeI0O1QAc4TuzCNA+Rmn
 sDVBiW29KHEqSL3Hs+aRlrGca4yEOL6Lt7sqxgooduA==
X-Received: by 2002:a05:622a:5816:b0:51f:20e1:137f with SMTP id
 d75a77b69052e-52df5766f0cmr48308771cf.19.1787309422006; 
 Fri, 21 Aug 2026 03:50:22 -0700 (PDT)
X-Received: by 2002:a05:622a:5816:b0:51f:20e1:137f with SMTP id
 d75a77b69052e-52df5766f0cmr48308371cf.19.1787309421594; 
 Fri, 21 Aug 2026 03:50:21 -0700 (PDT)
Received: from localhost.localdomain (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-499b90d3046sm23917705e9.1.2026.08.21.03.50.20
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 21 Aug 2026 03:50:20 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 qemu-s390x@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 qemu-riscv@nongnu.org, qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
 Zhao Liu <zhao1.liu@intel.com>
Subject: [PATCH v3 04/15] system/cpus: Constify various CPUState arguments
Date: Fri, 21 Aug 2026 12:49:38 +0200
Message-ID: <20260821104950.32108-5-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260821104950.32108-1-philmd@oss.qualcomm.com>
References: <20260821104950.32108-1-philmd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIxMDA4MSBTYWx0ZWRfX3r4pNUoIoO/P
 46KsCV4sQF2GyFqozY6Yb+vL7nPAC9+4Tk+TYO9mZst0jN1pwbDpXUwrf3bgkAZrvu5yyZ8QL3U
 kWQBaizqvpx1O89SQ1QrQ88HD+A4ughJnG9eOCAdkaRT+bXacxH0CsOeM526Mh0mF2WuLJxJly3
 tyMR4dCKsIJBqfcFf3fSHFp6KPyp3W2wvytWjJcD/zhBHTUMFfOz1AQDRGrq9ofrx0fYOzldO4o
 VgjVl7NAeLAz70SflTvuZme4Ihc0591ujj1coDfEOTnbZV6rmWZXWy0O/9PurQc6PoNxqGD8mEI
 Ph8EVAJiBhxplDqiDeCTm1UTig5Zwsh02yORisnSHckbz4v3EZi6bi+Gw4zEpHQmFMFXL6CwZqG
 vid/snJ9ZWBfR7lUAe+CqdBDROmjkNhzJ8JrADrdDdcGGHaj6BOuyEQtC95w7JNWSJrNfOMVSh/
 q28E2gvu+UfOFqU83Dg==
X-Authority-Analysis: v=2.4 cv=e/s2j6p/ c=1 sm=1 tr=0 ts=6a882d6e cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=xPOHbBPGvMiCLs31fh8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: Dwn1rNc99YR3F2n4L8L6s9LZwTrlGHTN
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIxMDA4MSBTYWx0ZWRfXzAU4Ki9M+rVN
 +OdPiY6NT3nYwXwTg5O2D6Zw+dMPDR+6Ya9lHW33xuf05JppgEeM8Dh6E0tn52tzAnrn3uc5Sh/
 6t6OYCtxSslUGNmEdmWKHKpd/B9D+qg=
X-Proofpoint-ORIG-GUID: Dwn1rNc99YR3F2n4L8L6s9LZwTrlGHTN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-21_03,2026-08-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 suspectscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 priorityscore=1501
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608210081
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

Mark the CPUState structure const when it is only accessed read-only.

Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
---
 include/hw/core/cpu.h | 4 ++--
 include/system/cpus.h | 4 ++--
 system/cpus.c         | 6 +++---
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index 0b5bb81b35d..372485a2e54 100644
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


