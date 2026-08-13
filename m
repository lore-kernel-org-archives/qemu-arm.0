Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57263C5DF69
	for <qemu-arm@archiver.kernel.org>; Thu, 13 Aug 2026 18:18:34 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wuZzd-0002Bz-T6; Thu, 13 Aug 2026 14:17:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wuZzZ-00029E-Pm
 for qemu-arm@nongnu.org; Thu, 13 Aug 2026 14:17:27 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wuZzX-00027p-En
 for qemu-arm@nongnu.org; Thu, 13 Aug 2026 14:17:25 -0400
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67DFTSDP3177706
 for <qemu-arm@nongnu.org>; Thu, 13 Aug 2026 18:17:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 pBblWYEu3w/qqK9BTavVOzUlUmt3HTlRxSdIPsShG/4=; b=WI1UgVggeB3fo8UY
 OksCgZXZKBBXCdAFPg+/lf2DY/8samU/TVsE26g52tngSb5+7ZscGo+eHrwLLxtJ
 zkefDwJCn4cQjALIW1QYwMS0/5sMoGpuOaJkuKl4QR2cqYUI3KAvaDHS3Ch5h6e4
 GSQzrVoYcxzSH+xnokvAjjwDqK6HDTTm+hnhCQt0Z8fyv44xRd8/3MnebzUW/4cx
 4bAqk87QQWbJUUjZLea1NhxpFzVRKRkrx2rEU5H73gQKC/khXqBWgOiCO05EmlqM
 l/kF+E9QgdlWmYvfOrd0FOGZ3bB6QxvrI3uno8criy6uKS3eCmrAySarwHx+juxB
 h4jy5Q==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g1f94h9mg-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Thu, 13 Aug 2026 18:17:22 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-936aa3d9dfbso23410185a.0
 for <qemu-arm@nongnu.org>; Thu, 13 Aug 2026 11:17:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1786645041; x=1787249841; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=pBblWYEu3w/qqK9BTavVOzUlUmt3HTlRxSdIPsShG/4=;
 b=icXct97X2VM8KM6h844rdVNPoGnmOXdk7Q/UtHhjQguijxJq2tAy7xSLnxD/7qTCdg
 gqAnL7+EvbfH/WAxxV6ZOt3p/gCgjbHltrO0xv4PzyxHWR2gm+ESkhr39BndRqSSWYxn
 A1KfoNXuq/hsf+b05FafVK8VCOGFrf90qtla5K1TdAlygVlU7Kh4KOG8M90VvP+g4+5i
 kwxL6RJP/0if+4MiITNHfQkl4Ca1o9duSeDPjukbGNqVklolqw2t1CWr1ZSA35c9yD/H
 8506Lc/dkHa97nUPs0J89p+Pc4lPSOhZOQjCsiCJ4lh8Dk1tOuI+6OdJyH1q3Od7iLaz
 veLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786645041; x=1787249841;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=pBblWYEu3w/qqK9BTavVOzUlUmt3HTlRxSdIPsShG/4=;
 b=Qe6+utfXL6vSCxncXHaHCphbPaoCqxd1B7O4qa3SlP5m97vWloUyO50TxDLvwz1mtd
 UlBlgm9YPdMpAYnLikFteAqNje3CtijZUSA8tect8MbMMEmlQK6DUmvwaNaPIl/LGTUX
 LE9WE4FLS1/2uw+vQxndYnMwXqDNuUrgd5d3Eg7laXK11R5cXLdSXxDvlsQLbkc0PYfV
 u2LmT2zW+UJFxP6ByL3bEnjb1uSuadTwkSGH38KEy1UscL1/1sAVBQXFzfHftHJjNxsU
 UwDIpY8+MN7ruZGI8Q1bxOeyWtL0fimWMtGKu/qTwyVanHpEHzHjTk8gHbsEEy+FQUyz
 Tj0Q==
X-Forwarded-Encrypted: i=1;
 AHgh+RrKNbetTOXuzdLNoZC3c50EbMZ7STZdZ4wgD9iSMymO4IHGSBhfHNFlnmR+az1T5B6CbP3gALQJPg==@nongnu.org
X-Gm-Message-State: AOJu0YxVWHdErKvs47j/fUQPNFlYIL1/jKm1MraydJ0Hm646N66CoY78
 rELm2q0uAid5k120TDunmWXKq69vZCDaFvG6LWQxatGRJSLrC8GGM1oqZLqEGOwGjA4WjZ/sU/e
 IARc4lR0FrWJ7e8FOQCbZQTZaPnaNUY4GP6/3hioAWnh+6dPa2PSAFAE=
X-Gm-Gg: AR+sD11JWCVofUMwemKskx/q6Of2Isu3ok1iig3FvEeK+hLRC3r32nbIXREPV07l3og
 tIeiN3PHTWzuyPyL7zXgGo1PKrQjRFOg6SfHo2n0MnFY62oA8AridHNeJfUQnZQskzaUiuWg5LH
 32FKEQ6z6QwwMHzCRbq1lMkja8WUk7un7qXZFTATnZfnq/7sxpK1okZDSt9BSeLlgUEEEUMBvbM
 gUI+YuHyfebk0IFgquc5qekKVjH7JmLSimbQcdBJvoK9WwjjToI9lgnctDlzq5lz8yQZhxxPhlw
 9zf9il3KcEPO3HZ1sna/O1UwjmWhC/7tnbGCJEmbtsvTxeJc5rbLcu4S0jqZdRWl6KuzSrFertw
 gdsWIzIukgYQFoR53LIDOMkWDp3ST9HwOnqCOUUiQkw==
X-Received: by 2002:a05:622a:1a82:b0:51a:bec0:1040 with SMTP id
 d75a77b69052e-52d73c107c8mr83566181cf.12.1786645040765; 
 Thu, 13 Aug 2026 11:17:20 -0700 (PDT)
X-Received: by 2002:a05:622a:1a82:b0:51a:bec0:1040 with SMTP id
 d75a77b69052e-52d73c107c8mr83565161cf.12.1786645039982; 
 Thu, 13 Aug 2026 11:17:19 -0700 (PDT)
Received: from localhost.localdomain (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49982165351sm77726135e9.10.2026.08.13.11.17.18
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 13 Aug 2026 11:17:19 -0700 (PDT)
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
Subject: [PATCH 05/16] cpus: Improve cpu_pause() docstring
Date: Thu, 13 Aug 2026 20:16:28 +0200
Message-ID: <20260813181640.6537-6-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260813181640.6537-1-philmd@oss.qualcomm.com>
References: <20260813181640.6537-1-philmd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEzMDEzMiBTYWx0ZWRfX9gGiy6VKxr/Z
 yNAa8AakapSRx55eqXkwvVq5n28W36/hjVh/gSunotB6FJqUHAazGpnrzmffRWWOThmvT3hZsNX
 ttw68L6PSt8gRLiOfw5LkTIfPCJQWs8=
X-Authority-Analysis: v=2.4 cv=VYDH+lp9 c=1 sm=1 tr=0 ts=6a7e0a32 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=TUGipdnbivDJOOLMS8gA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=ZXulRonScM0A:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: KZJnXRhMH3cPdp274ZLqHtHbM5xQDmIt
X-Proofpoint-ORIG-GUID: KZJnXRhMH3cPdp274ZLqHtHbM5xQDmIt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEzMDEzMiBTYWx0ZWRfX/vpdAYHFq4NW
 QGoFc9/wE4yAvjmIiNaU9LLSmTHvFs4YFqHeatVLRXZJT8CnJ57RHg2HQV0nynGiCCP3B6rBySN
 qKFklcQG1ArwCt/VPqdgaG1DXOqIHVSB+XNbE8Z3H5q0ooubS8JUsqSCGlJ2/gquYIcJBQuJ8XA
 k0s3wThuaS+0SoCrGen8zsrX84pnEGOGT9nbIuCUBYstmW+dEKwmdZDcLT3r15TcnRNnB3R0hMy
 vKfOLj5OS86ROJZw08fSn3RW4Mvl0Aim3JF5figLgBJT+WWy0LLlqy6n3tzmqfIEDDEekG3bRep
 UYo3TwMZz7L83VdDlhTTuu70pbpCdLXq0lhirHaB3ccCK0CVgjcUwO3qxvCLa+8fZvv8IWgrlLR
 4GN08wBaAqiBCQPsCDlhRf1V35jQWPHIluRTfNS/ihkFQErpHAjxx2868zM7JUq5o+xT5APfcqx
 GY41bKG22V9rUal+b3w==
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

Mention cpu_pause() might not be immediately fullfilled: when the
requested vCPU is not the current one, the request is asynchroneous.

Mention the method goes in pair with cpu_resume().

Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
---
 include/hw/core/cpu.h | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index 81af7b9ee1a..f1ac492714e 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -1045,10 +1045,13 @@ void cpu_reset_interrupt(CPUState *cpu, int mask);
 void cpu_exit(CPUState *cpu);
 
 /**
- * cpu_pause:
+ * cpu_pause - Request the CPU to pause execution
  * @cpu: The CPU to pause.
  *
- * Pauses CPU, i.e. puts CPU into stopped state.
+ * If @cpu is the current thread, immediately pause its execution;
+ * otherwise asynchronously request it to pause.
+ *
+ * Note: Use cpu_resume() to restart execution.
  */
 void cpu_pause(CPUState *cpu);
 
-- 
2.53.0


