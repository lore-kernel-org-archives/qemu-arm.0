Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA520C5B572
	for <qemu-arm@archiver.kernel.org>; Thu, 13 Aug 2026 18:20:11 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wua0x-0003Ck-C5; Thu, 13 Aug 2026 14:18:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wua05-0002Pc-2K
 for qemu-arm@nongnu.org; Thu, 13 Aug 2026 14:17:57 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wua03-0002AQ-C7
 for qemu-arm@nongnu.org; Thu, 13 Aug 2026 14:17:56 -0400
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67DH8ENU3052430
 for <qemu-arm@nongnu.org>; Thu, 13 Aug 2026 18:17:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 TNlVfOVc1/StZ0tejxF/DIFWBXRWATBfirtcnn7at9k=; b=dlySNfuvX1efQkMC
 9+3mRkMFFfE6WwzPlKTE6Zno7r/oRsmgukyCB24fkQ7PChBL0iHJTFY26OhOfJf6
 ZwHMipMX9OV044H3+Ocb6Zc8GPSOwREE1hNiME+RIPWCFOXsoi2yBhkdffJ+KVur
 cBbTkOH4KNQcoZ7hTLlDRywUi22ZG3a6fsUKpM3y0kWkZYr5TWR7d2iYkzq01s/y
 89lMfoBnw1WXxCpdd/NYZFx+hugi8NgRTsSdMISy5uaAYC3PVqv+6lsILh4N7ZH1
 G7K/ZcNnNSxLndzFfJcI2Yqyi467pf/3Q1WYYlaDrDZ8rbRIOTwFOEeoNg0O5cFL
 /vsbzQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g1j2f09wr-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Thu, 13 Aug 2026 18:17:43 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-51c1b4d961dso845531cf.1
 for <qemu-arm@nongnu.org>; Thu, 13 Aug 2026 11:17:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1786645063; x=1787249863; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=TNlVfOVc1/StZ0tejxF/DIFWBXRWATBfirtcnn7at9k=;
 b=PLjW1+jU8Qd3MW/zxCVbd5E5bdmXORMPpkGVIkrXH4OauczZBmuQJ+3AdO3Eo6Z1rD
 7wZGpIymsQzAmt22QO7dgFwPF4LpbVwSqbf/MkMWrQT8SeQMpYLz8TFNwrgzhEjV8IMt
 4gZ8bnpj7iS+Wg3eF4F6S21A1NVTdd64wgpYNVh3/NOM9rtXPMahibuq3+3BSNK+zoyo
 joPQN4X9kD/GacsgaIWKXnLTfhFTj4IMwwxeGmGiW71QRfrjNm5Q+XDRmbaKcFPG6Up3
 clmmuBAz4jMdXtD+Ag7mg0Uq8j2Hi3TKxRqHXT3lx56bbKIupVISumU+n3PSc+glGZ1H
 k40Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786645063; x=1787249863;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=TNlVfOVc1/StZ0tejxF/DIFWBXRWATBfirtcnn7at9k=;
 b=q6G/C6FiOFGH1VoT6KPrhXgz0gxxXmVO8rwS30YcTKh5nLJPxZiHgacKdIKhWTICQg
 K6kyEhP+h2RsYrM8xZycJFbuldo8D7X5bGnkr+jhDTnqilfx0EjWEXojErFyfae2IjWN
 6/t0iy4zDq3O6qk+QiU43CCaV/oawLCmQ/oqWYSQJr1VSP5cmlrF6xpPj+/95YfAux2k
 G6vL2eFLg4b5WfiGlvGEDuxAkH6jdfirC/Rfw0w6pi/uK46076WfF3TJRAJ67lMVtIJk
 x4HPhmK78J4/qpiawUCyavAehAJd7L1ZS/DTuszstol/TWdy31dbAxHLZo5mMrrgPGWw
 u6Sg==
X-Forwarded-Encrypted: i=1;
 AHgh+Rp0RDnWfSh2fcbk0AAzd5CiMsWgEPkg/7jqoWkqIK+AVpgp+Ia8XV2K7XHcBXGH73j3TjMH2D5qSA==@nongnu.org
X-Gm-Message-State: AOJu0YzEGdG2HeJuh8pn+DXUHFGBym+wGPcYl0sHTClzZKE+EKxuQ41q
 vURZFoeVRm829wsaIVnQNlpenKZEDYg4/Rk3Md1RblPSmphhHwNTrcqLPQH5oCL2PwEqUwLw9T0
 FK9M/iYU1C6GwiMCCpcPSgxBTtBu6/UyJs05eCImS05NLRrFexUyTa/4=
X-Gm-Gg: AR+sD10HI6Qt1IpnVbwsZdgP5Kld0HGSqmjXNC0AEuLfTblhDHQjJkL/m5qoZW2TrAt
 c53zEmsZOHRU9AZPUS1nWfCoJFIPFnJhJw8fQrk2+tqPiBtmpDmrxcJ+VBCqmzVj/QRZdxKytLH
 U16uEcs9jdfizKLAv+lLQb8dWOSAB6q1/fQkDDGFL9w2Kc0yJ9MBN6pQ2avFSd+bx6i1TABkhZT
 SxvhCCn0SZLfUHzuL1/mgdjEbZKv568UpLUZ2pEqUUkSA6MwakDimp48q0hD+fJaTPma6gS97PV
 ewOh5P8qxFe1LIpW/RPjRv4tlNLLjFdlnAgnNq6nlXKcJza4Fj2cgJQ3M6QJoCCs59fGd2R5E2N
 z0Vky/teI4Ieco7+GbOQ9SAjUa3tazl/3T6ccMwnnXw==
X-Received: by 2002:ac8:5d53:0:b0:517:c582:9161 with SMTP id
 d75a77b69052e-52d74a6f672mr72351901cf.7.1786645062781; 
 Thu, 13 Aug 2026 11:17:42 -0700 (PDT)
X-Received: by 2002:ac8:5d53:0:b0:517:c582:9161 with SMTP id
 d75a77b69052e-52d74a6f672mr72351051cf.7.1786645062216; 
 Thu, 13 Aug 2026 11:17:42 -0700 (PDT)
Received: from localhost.localdomain (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4998777ce49sm4934935e9.2.2026.08.13.11.17.40
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 13 Aug 2026 11:17:41 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Mohamed Mediouni <mohamed@unpredictable.fr>,
 Alexander Graf <agraf@csgraf.de>, qemu-ppc@nongnu.org,
 qemu-riscv@nongnu.org, kvm@vger.kernel.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 Magnus Kulke <magnuskulke@linux.microsoft.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
 Zhao Liu <zhao1.liu@intel.com>
Subject: [PATCH 08/16] cpus: Slightly improve *run_on_cpu() docstrings
Date: Thu, 13 Aug 2026 20:16:31 +0200
Message-ID: <20260813181640.6537-9-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260813181640.6537-1-philmd@oss.qualcomm.com>
References: <20260813181640.6537-1-philmd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=FeMHAp+6 c=1 sm=1 tr=0 ts=6a7e0a47 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=dWi2WT42hRTxaHT5buIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: dgLirHywO56lbhkoWqEpvsPZZluprgho
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEzMDEzMiBTYWx0ZWRfX3LJ3Eorq2CqE
 Nv6qvekX+i4rQizFQb4VnU5/P8n7SoN7te9j3UZPUeubbIRiFT1FxDlIkkAC2XBDYzumAf2oYc5
 N2wwpu/vwk1vpLB69B5smZC+UIyTUfQ0ahetQCeYwRucgCLdqBvZSt975P2szwlHqwdoEvOOtFQ
 DRVacddHAD2KmQEgkD53GEkMGglLMQ7APicpK8Hk6y+My9f+12buWTkcdA1YANGpMAnwVnaldpm
 UiRzkIqX2pJ0tOlV1Arz+b4W9SDvVt7itfA31//pBEv/jkRxEdY8RqQZiyUmN2mxqQds1Q4wBL7
 gqQ4gLJek2heedZyEJwrrI6DMGwByVI6pn3swhq28iuPzsbXSuCSzIrSN63a4an/NBrx49Q8NXn
 qYz9xZ1ErqDA8kBQIWSDJqaG3U7SX5fVC1n29vbr+V/BVYFWRcRV+kSbxAy4cggeDZdcE3a+i1Z
 JS3bmUJyB3+1VPlnh1w==
X-Proofpoint-ORIG-GUID: dgLirHywO56lbhkoWqEpvsPZZluprgho
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEzMDEzMiBTYWx0ZWRfXxiqTBrYykAWO
 MgYOtLkz+kbkdbWvtLy2DqtIZDthSc0/c+meAnqklSZZ163TFRdDdXVHp1nLSiEvosZ26gmOPEz
 ygQLcHo0/sf1hdL6cgJ/cGdrG2gBWAA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-13_05,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0 impostorscore=0
 suspectscore=0 clxscore=1015 priorityscore=1501 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608130132
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

Be a bit more precise mentioning BQL use and blocking calls.

Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
---
 include/hw/core/cpu.h | 36 ++++++++++++++++++++----------------
 1 file changed, 20 insertions(+), 16 deletions(-)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index 183ef9f4ef2..d610f87abd3 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -908,36 +908,40 @@ void do_run_on_cpu(CPUState *cpu, run_on_cpu_func func, run_on_cpu_data data,
                    QemuMutex *mutex);
 
 /**
- * run_on_cpu:
+ * run_on_cpu - Execute a function on a vCPU and wait for completion
  * @cpu: The vCPU to run on.
  * @func: The function to be executed.
  * @data: Data to pass to the function.
  *
- * Schedules the function @func for execution on the vCPU @cpu.
+ * Schedules the function @func for execution on the vCPU @cpu and
+ * block until it completes.
+ *
+ * Note: The caller must hold the BQL.
  */
 void run_on_cpu(CPUState *cpu, run_on_cpu_func func, run_on_cpu_data data);
 
 /**
- * async_run_on_cpu:
- * @cpu: The vCPU to run on.
- * @func: The function to be executed.
- * @data: Data to pass to the function.
- *
- * Schedules the function @func for execution on the vCPU @cpu asynchronously.
- */
-void async_run_on_cpu(CPUState *cpu, run_on_cpu_func func, run_on_cpu_data data);
-
-/**
- * async_safe_run_on_cpu:
+ * async_run_on_cpu - Queue a function for execution on a vCPU
  * @cpu: The vCPU to run on.
  * @func: The function to be executed.
  * @data: Data to pass to the function.
  *
  * Schedules the function @func for execution on the vCPU @cpu asynchronously,
- * while all other vCPUs are sleeping.
+ * then return immediately without waiting.
  *
- * Unlike run_on_cpu and async_run_on_cpu, the function is run outside the
- * BQL.
+ * Note: The vCPU will hold the BQL when executing @func.
+ */
+void async_run_on_cpu(CPUState *cpu, run_on_cpu_func func, run_on_cpu_data data);
+
+/**
+ * async_safe_run_on_cpu - Queue a function to run with other vCPUs paused
+ * @cpu: The vCPU to run on.
+ * @func: The function to be executed.
+ * @data: Data to pass to the function.
+ *
+ * Schedules the function @func for execution on the vCPU @cpu asynchronously.
+ * Unlike async_run_on_cpu(), all other vCPUs are paused while @func executes,
+ * ensuring @cpu has exclusive access to shared state.
  */
 void async_safe_run_on_cpu(CPUState *cpu, run_on_cpu_func func, run_on_cpu_data data);
 
-- 
2.53.0


