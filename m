Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5ECAC5CFDB
	for <qemu-arm@archiver.kernel.org>; Thu, 13 Aug 2026 18:19:21 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wua0C-0002cb-II; Thu, 13 Aug 2026 14:18:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wua01-0002O9-Q5
 for qemu-arm@nongnu.org; Thu, 13 Aug 2026 14:17:55 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wuZzw-00029s-9h
 for qemu-arm@nongnu.org; Thu, 13 Aug 2026 14:17:51 -0400
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67DFTSDR3177706
 for <qemu-arm@nongnu.org>; Thu, 13 Aug 2026 18:17:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 sfQPhzstlT3wFstnUDQR+/OGDWmf4BOlIE5Yj0Rzf9I=; b=LO5+V9GJKwL/u3SB
 hiqHpTZea6BHhcnTuECZnXdPEBPwkMxXVqE66wlDc63j40rvFePmhDw9iKJPRbOn
 Z+eo324Sinad8WjGYvFfxTsM50BDrXkiW+hBndrbJVl/IAuVMzivZlWMbeSOAiEP
 53Cljg/2GsoWxzwBX/HDmJ0+ZSb5+Vb7HtNQUNSIdpN0sb2nj93KI7Lbq8C4wE8M
 s3uGYqWqx/g2v4i89w5JZmfWzwHW355aTfA7yGu/SM4ePQ42xf7I93MtUrLzuh4y
 GhJzU9JKIi/7e/HJSW47KAzi21N6pJLR6TKh0hG5MDWjccNAN++IJhEltP/U+st8
 HVm5+A==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g1f94h9nn-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Thu, 13 Aug 2026 18:17:36 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-529ae8e96e8so2582461cf.3
 for <qemu-arm@nongnu.org>; Thu, 13 Aug 2026 11:17:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1786645056; x=1787249856; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=sfQPhzstlT3wFstnUDQR+/OGDWmf4BOlIE5Yj0Rzf9I=;
 b=F3q2a05ESVdKWGydb/Cl/0x1QwoC3lCLW7FlCIlKXjBCgD7o92sr2Hse/AIco5UdVA
 cVjThgr0zaJpXrTSbXzNabj2iW76gUwNVqNWBVzFjZhzgfbZlj4wRNNYcL+YV3rE8Mi5
 ZNCLxIG3J1DTwoXehKivXgSIyuKoeYF24579kvdLdi0hVDTTWucajdOyFuJR2z/7Sy4h
 FrkWba5Rm0IRASxDc17DwY8gBjkU6GuptEX0HELCTQP5Po345lwI0fGlERabZJb5ZAnl
 f/zQpTRrhpClUZIvIbfU5458uymBUEj8H389emlv09jC8LmBt/l0j91nlNHSlEhErqmT
 o7pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786645056; x=1787249856;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=sfQPhzstlT3wFstnUDQR+/OGDWmf4BOlIE5Yj0Rzf9I=;
 b=UVppoqZj/GnfVvO+e0cVfQnV0qecivvmsa/WlKW1S/0pZr8+wsoApklFyd8HmzkiYc
 DyH8dBE7hIBUkYYiJML/edQjj3C8jvqHXdVkz/JfliqEOe0o7jzB22jmJA4+petcxk5+
 1kTvsarm2v3C5KCEtSp5yVNWcYk4fjbv3244MNyOYeq6RmynR/K6rKCDr2bq06E62AZ9
 hFBZqjt+oM1WoQ1RsKYBLnJUd5EpmK4EJbiqVqzABc2T094m64ixSMKHaMh6fjCj6zX6
 yDn9K1Cjwe1vqcLX1+1tHVFB2eKT2EYCTYA5QrZ+Q7rZWoE56xrN5O8JvSwNCjd5dOoV
 QoKA==
X-Forwarded-Encrypted: i=1;
 AHgh+Rq882b8etcxGi2kqALQ0U4hKG61dtsfCPeBCTo97V3gLo7Baxj9Ja9AiaLccmfiezhHup6bCShyCg==@nongnu.org
X-Gm-Message-State: AOJu0YyJ1fEHBBVnvclmMjkUHbTRyUnfnqVXDlQ2OHxpMr9VPVnu2iO2
 R+AWAHe6uDbpJM8+8zt+U1iZhITKVN6uDPW9f1M2pqE2RnnUQCySoDbtXfBeCELvz9NzWMnnN/K
 SKN0aumR/sTVuGJ5I0snT8NUBoWfJOtqQd41avK72DrnQT5GAlT2OOGA=
X-Gm-Gg: AR+sD10msBO54FQ+yvpKc5EV7jQ+K+E4M0TdfN+bQLTPfMGSJozvAJuc3afScm22X3w
 Mu2m7c2xAlDKtUVEKvaO+eNH8Dc1TsdGWLFfV3smlI7HinNG92R1K4On7aGOzd0Y+teIrC7rxnA
 Pmmez0kg1nLp74pQneg1IccJHEAAkJwZhP84M6sdbSK7YtiwxPtlccG7DcobrzcZw9NjM12VcOe
 OHuuZxD4jauALFz+FOTRsLjzBZXE3oURowiCq+c8H1BtOeGRVbTYqcFEWtAIMXyydAe5jIg4vDU
 kKC+UaU+RlJBvU/MbBQo57JedIZ8Y9q4CqRYo9+XHo+wlkQSoIyXrvbNy62sKgvqbE2LAcYbsb7
 mqKXmbSfujTtHMOwU9MmY3BW5hlCh5//KR9d4CN2D9g==
X-Received: by 2002:a05:622a:1a8a:b0:528:3471:937f with SMTP id
 d75a77b69052e-52d73d3724dmr92390051cf.29.1786645055402; 
 Thu, 13 Aug 2026 11:17:35 -0700 (PDT)
X-Received: by 2002:a05:622a:1a8a:b0:528:3471:937f with SMTP id
 d75a77b69052e-52d73d3724dmr92388851cf.29.1786645054663; 
 Thu, 13 Aug 2026 11:17:34 -0700 (PDT)
Received: from localhost.localdomain (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49981b0f4afsm97444205e9.5.2026.08.13.11.17.33
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 13 Aug 2026 11:17:33 -0700 (PDT)
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
Subject: [PATCH 07/16] cpus: Document process_queued_cpu_work*() runs on
 current vCPU
Date: Thu, 13 Aug 2026 20:16:30 +0200
Message-ID: <20260813181640.6537-8-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260813181640.6537-1-philmd@oss.qualcomm.com>
References: <20260813181640.6537-1-philmd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEzMDEzMiBTYWx0ZWRfX6ed/ylGQ3u5O
 jArHToMI0DRT3Vpzv6Rn6x1FBmTbHB+Uj73ZoPfOE6qwiQ9+ww2Jxw0pVs+EFb+YEMMmu4/jvSI
 J2QFJ5aEKVvXIlCixQDa1tyYT6A2W8E=
X-Authority-Analysis: v=2.4 cv=VYDH+lp9 c=1 sm=1 tr=0 ts=6a7e0a40 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=--_MrfCweEvJdlqdJWAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: 7ipeBgzWNcU9EwSQ-7hoHOErxi1KyDco
X-Proofpoint-ORIG-GUID: 7ipeBgzWNcU9EwSQ-7hoHOErxi1KyDco
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEzMDEzMiBTYWx0ZWRfX7jraEdvefi1r
 +Ix+AkTiXmx12WT4KLXaHI+UeId4cyaOqm++AhsggM4ZT7GOyKZ7GazeeIVBYtPN2XaLcfofws5
 THCD9LcSDxgGh/SkIwmIEjRS2l7hQTlTVk6aDHkc82bOcYONqwvg1399Y7YSCsVT79KKyP9GIlV
 sE7Cy6klasKS/hoyryMExX/TPcTyRvna8e+DXiYQrX8CE31KWk4fyYT8vOW1l7RNojP61ROWV04
 qBpuHFC8zgyWjq8MCuy4WMe3QQc0uMZqCAXhsDIKKq3F6uJl8380pvhf7tcMH6/SOySUiOe+nJ1
 /u+naLvCm4j9KfbNqPF79ztkCcWDxpxkCEqjlRf6mRSGwuvPQ+8wx10v22x05mFPPcbvoKaZbJq
 sV9vwA4jZvett3xLV6yoOO6mKT5CWOZocFc33ryvJFpiPN0Mhs1X9q/C03T58RkiWv8LhG+JeM2
 CbfwtJ4iSdwCWsSgiHA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-13_05,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 phishscore=0 clxscore=1015 suspectscore=0
 spamscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
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

Mention process_queued_cpu_work*() functions must run on
a vCPU thread.

Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
---
 include/hw/core/cpu.h | 4 ++++
 include/system/cpus.h | 1 +
 2 files changed, 5 insertions(+)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index 7da81f3ee85..183ef9f4ef2 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -1081,6 +1081,8 @@ void free_queued_cpu_work(CPUState *cpu);
 /**
  * process_queued_cpu_work() - process all items on CPU work queue
  * @cpu: The CPU which work queue to process.
+ *
+ * Must be called from within the vCPU thread itself.
  */
 void process_queued_cpu_work(CPUState *cpu);
 
@@ -1179,6 +1181,8 @@ G_NORETURN void cpu_abort(CPUState *cpu, const char *fmt, ...)
  *
  * Perform accelerator-independent work after the CPU has left
  * the inner execution loop.
+ *
+ * Must be called from within the vCPU thread itself.
  */
 void qemu_process_cpu_events(CPUState *cpu);
 
diff --git a/include/system/cpus.h b/include/system/cpus.h
index 2365c7c4597..0bdb231b996 100644
--- a/include/system/cpus.h
+++ b/include/system/cpus.h
@@ -17,6 +17,7 @@ bool cpu_work_list_empty(CPUState *cpu);
 bool cpu_thread_is_idle(CPUState *cpu);
 bool all_cpu_threads_idle(void);
 bool cpu_can_run(CPUState *cpu);
+/* Must be called from within the vCPU thread itself */
 void qemu_process_cpu_events_common(CPUState *cpu);
 void cpu_thread_signal_created(CPUState *cpu);
 void cpu_thread_signal_destroyed(CPUState *cpu);
-- 
2.53.0


