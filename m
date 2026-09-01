Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF113C624CF
	for <qemu-arm@archiver.kernel.org>; Tue,  1 Sep 2026 09:53:59 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x1LB3-0007XM-H0; Tue, 01 Sep 2026 05:53:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1x1LB2-0007Wv-Fs
 for qemu-arm@nongnu.org; Tue, 01 Sep 2026 05:53:12 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1x1LB0-0007Xr-Rz
 for qemu-arm@nongnu.org; Tue, 01 Sep 2026 05:53:12 -0400
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6817936V705489
 for <qemu-arm@nongnu.org>; Tue, 1 Sep 2026 09:53:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 5vYRARi2QtmKNQI0is/5y9raLqQC71JC+pNDAX0+lq4=; b=NXjE7oW4BEH9NEZg
 UmdKkUn5L6S6tX69qWPmU9k3dYzSkGadtlO62lPpRRkqnuOlzay+QxUkK3T4yoZd
 4NwCpfZyKki6VUvAXZNs9ESXZMfWm1v0Ac415apjtVts7UJ72x3pv0/p9PK+UqW0
 YLVzjaVzFMaX02zGiZDcIBeKour9Qy3dchbxgecbA9kmkdGqiEpV7VgfS/Vx1pOv
 raqVuAxyJgoHx5+hCxNun4PT1DEXC12gZCoj/sB+jN+d6U1H3alQvoe9HgqJcGQq
 G15/MKjCDA2dG8zezz69UmJL9EQmTD51dvTdpC3V+v2wwnshsTuyFB8aVs2rB35O
 rFQvNw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdrcsh636-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Tue, 01 Sep 2026 09:53:09 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-92e4f946461so777954585a.2
 for <qemu-arm@nongnu.org>; Tue, 01 Sep 2026 02:53:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1788256388; x=1788861188; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=5vYRARi2QtmKNQI0is/5y9raLqQC71JC+pNDAX0+lq4=;
 b=HNkbpm0rEJiVVAL17Y6/sQ13LriIYkFp2nszOtRGyE0RLRu/jMqvqQl4IkI1032dUM
 Ydfx6uLGCI9+V4xUe1svKUgJkohf7YgC8e9SCSqp96rNBSbvcDKJZbQJZ6KWaeeXjQ1W
 ZYc3vwiIH2laUgsMjiTzweu1e+k2ApSAXRlgpB95twkFBsSWnVeC8v/lYPp8Gza6fLGm
 POP61X1po3Lfom16Nsn3kLplT+25no11RJpLzmcOtKt5BbDsX+2sk0zgOqtGk+4T1901
 KNNfUdD38eqLultXm6D1yyz4DeMvBkoPmGi9XyHUj4/ZOp2gcs5KxuasfhQikNlkYcFM
 sVRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788256388; x=1788861188;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=5vYRARi2QtmKNQI0is/5y9raLqQC71JC+pNDAX0+lq4=;
 b=PU4Kd6lUOFXa6+OkV8xBJhPlbr/anS0JkdeMUU1sG8nzkO4xa7KBaSc8SM5Rj11kPQ
 ZakujRxYN60BEqZ84rI5sRiou1kWi2BgAWWEzKunminT2fHU744gGBV3OEcFTqFwg/Y1
 bfUBBoAFiuzXHlmErVxKKNMqeLUJuyoLh+xRKJ7GPg6ueJ3JB+GHqP7A1GSXqF780U3H
 zJCIw3X2/Vt/ZqvHZ88r+EO3tUe7rBntp/1HiAxi32B/Qtu6wOFNjSoRvpcnXfterTK1
 ECGsBUWB/V7LrUL5n7cCVaZdIQqX2jQdlRX2G8VRQfbgn8q4xsRBFdnNHuCUqi+ahx36
 KO+g==
X-Forwarded-Encrypted: i=1;
 AHgh+RoqxmZhOSdAYx9zQHDPfOjp+6nbR6DRkAJyjHPCkKL8x1qv0afZWb9bOQDz4sS/8C6gAs/0JyfokA==@nongnu.org
X-Gm-Message-State: AFuF++kjkpkb6UZzc1sG+fLeLInVhZJZ19xvmNWoEbAWN+am0+ZM+kpt
 WsPCmnDVlvjlOW4uqpsDi53Xz8VPU9OmT/OEfdjZL/Xs/2GFFbAaP4lcADbkxGkqFpiqrFnmLKj
 MLut/WVq8d+0RfYNS08ziBWYq19JI7SpH/owZCFHWnsaBMRZGCvXXylo=
X-Gm-Gg: AR+sD13KkRPUSRkizF9qdN10d6PUV0SHhajEIZzD2mIKJEBpmQhSPs5ojBdWadRe52A
 /5R8fvQbynVWJoTeZcY2n/t2PDrrwxbfQYWjTEq73rlxfjQ6zuLi4R0vczmeOp80lhBBs/ekfG5
 /jHvngfJpPw4twu4YgoG6SLd9fRTDfUqa7peKDmZm6YJhBbQA1oOBMOA4U2+EIyIrU8XDQL3z2r
 bHH+cW3zEtNLJay7YjXvhBGeG2cpXNkmpAkngwnBJfQaEuQwdYOXXvcb3vKMe1u471wEH0BwxlM
 Gpuf/Y19dbuW1N5qS3qX7VKQxglFR/yarf1/VgZa44l28T5seXEgIpOuy4oAnXb/c6ZN4BKVU0G
 LWRdEcaOCPGv6N0duUbqZUvDIzy5eHSN/q63WRkMU
X-Received: by 2002:a05:620a:27c7:b0:937:6d2e:d023 with SMTP id
 af79cd13be357-93948156bf7mr1057571485a.30.1788256388346; 
 Tue, 01 Sep 2026 02:53:08 -0700 (PDT)
X-Received: by 2002:a05:620a:27c7:b0:937:6d2e:d023 with SMTP id
 af79cd13be357-93948156bf7mr1057566685a.30.1788256387771; 
 Tue, 01 Sep 2026 02:53:07 -0700 (PDT)
Received: from localhost.localdomain (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48442d3b4f1sm3403934f8f.9.2026.09.01.02.53.06
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 01 Sep 2026 02:53:06 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Zhao Liu <zhao1.liu@intel.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@mailo.com>
Subject: [PATCH v5 05/21] system/cpus: Constify various CPUState arguments
Date: Tue,  1 Sep 2026 11:52:11 +0200
Message-ID: <20260901095229.72018-6-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260901095229.72018-1-philmd@oss.qualcomm.com>
References: <20260901095229.72018-1-philmd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDA4NyBTYWx0ZWRfX0+/iQ7WAsGIj
 jIJZPZSuMBWUXa4dfkVBcsn2baQct9ZA9TzsWuCqWt4HADrx25RXDIvJuDpgLLN5PzFgpPSVDHn
 q01GkrDHyvqV980zvsOLQYK+ddf4CvA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDA4NyBTYWx0ZWRfX2cP/v/FdxbUv
 pFBVEKRZAaQ0pwNtMWvg5yrheRCrGl/BnVeVLzRJbO7WNodbtp6/qC/zk7rNKqPpp3j7TFeFlvW
 D8DpMl/eWaq1BYetFHLlEeWw3NxoaJzX4Lvwx08G4nZHCmygZQovbnVk6ruH9cPbqBYpK2KAl++
 fLAwFs98H5wa2NVJ8+pweRW0IaSN+XHY4ommnviIcMtSWKzdJ2Bm8hWI1hREkYvz7A5kiiGSfXi
 u4nQWKsTQN9E+MdB+3Kew6wUspODitFKl8rK7A6IWrgMWvTjkraDG+oOQ0vJ48sWNNEmUfdHZeg
 Z0RvZ6BPn56VQWuIlpKCuTGR30tkFASV9Su+nk5d/5GglG+jfrTR537mX4P3UKFNGVJ7zt9qMs8
 3FYLIAvcfcAMF6u7Fq29cdB31hzA0TSVr2l3n00QUphrZYk4083VLw2ZwxN1fmBfOfzM7LfstOR
 dS6dvBS3F34euZZfhsw==
X-Proofpoint-GUID: hGNj5A48ctZL8xdrs3Iu0Mzes0v9qrVo
X-Proofpoint-ORIG-GUID: hGNj5A48ctZL8xdrs3Iu0Mzes0v9qrVo
X-Authority-Analysis: v=2.4 cv=QsNuG1yd c=1 sm=1 tr=0 ts=6a96a085 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=xPOHbBPGvMiCLs31fh8A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
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


