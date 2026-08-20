Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8362AC5DF87
	for <qemu-arm@archiver.kernel.org>; Thu, 20 Aug 2026 10:51:12 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wx0Kj-0002s3-Eh; Thu, 20 Aug 2026 06:49:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wx0Kh-0002ZY-48
 for qemu-arm@nongnu.org; Thu, 20 Aug 2026 06:49:15 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wx0Kf-00064U-Bw
 for qemu-arm@nongnu.org; Thu, 20 Aug 2026 06:49:14 -0400
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67K6nGUA3732561
 for <qemu-arm@nongnu.org>; Thu, 20 Aug 2026 10:49:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 1lPeDKWhyf6BBMuDNMEYdwwD11UjrKI3mpFnJczn7hk=; b=QsrPST3Z0OBcdsu0
 WTJXX+fYwCkzXhsEIWuSxIfppN6sS+cd87fqKcY+4vK7XU4RAcxY98Nf3TeC7LQr
 +1UZHzl4FeB3D7yVvjtAZFJWR6iNxq9Ts3pNtXrc53pwDeX4JL3+AFP3lf8MCNg0
 7s/Ztb8I9TyBPFNY7bfxIsQURmuyroecgUMuYekr7f1xn0TD0PwINyp9wXp9Fsqp
 xOINRWDdJHIoklFHrb1WpVhjU50tVt31RgT1YOo8t3GykPpXiRkZQzh+zl/keQSv
 9gLzJPYgQJDfDcxJYV33u5bbV4oGRVDhn9sSsQXlp9ixC95XoMqUb4epe5Y/3LcS
 tTs63A==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5vn88wtc-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Thu, 20 Aug 2026 10:49:01 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-936aa34873bso186391985a.3
 for <qemu-arm@nongnu.org>; Thu, 20 Aug 2026 03:49:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1787222941; x=1787827741; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=1lPeDKWhyf6BBMuDNMEYdwwD11UjrKI3mpFnJczn7hk=;
 b=U8OHbOoT/M7r4ANofqgZ4co5mUoQTulfNweyxfJRCojZWCijrQ2B+vAxWDSF/ddBUJ
 tEkUPjQyDs99EVMmtuTvAxsiIje5hBYEh4k3D/TX85DbdDb9TnUVNiYFHk9gDbmYSlTj
 ePcIU08NZSs0N1wk4FHWqTitMHWppHIiCXYF0iZXeDq3cI1X3E7yZqexxb6YGZeYTRs5
 JqwXdTvyuYmtle/AqwmHJGpZRI0uopxUym56fBhg+w0l2/dO2zKkVa9o5JEfUT0BA1N7
 faUbCHhENrvtto6+RvtOoEb7FEUwc1UnDf1D1KIM9zD7yrXzxsy56F3laE/fd2mRsBsH
 4SUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787222941; x=1787827741;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=1lPeDKWhyf6BBMuDNMEYdwwD11UjrKI3mpFnJczn7hk=;
 b=VosVneWAuRo/5naWoBmzBiP+gJiS+LFuNnLBejlvlMx5norW58CB7vrm4pUY04xrvA
 AnO8B6pyzBPPcK32UDxegDG44knJlgRxrjTEsyskeuRspX4Np4DCI1zjOcRwGLA2rIQn
 cN9kTSVFQGzn946fQV3cfeR2ityyBi4IBWuhEz4TGmpGXWA/8RqFtRV2tQIFJYACZWS/
 wn8Y7UbHps8FfoTTYWj/q+6Xyr7ck2ayEUF8v2iYNm+5ofGH6YX1vWc1V1jq0XJ+ZYpS
 593+RsIYGV4rckLqywBkylw/e1ktioyEEYKI2ObOlzgZMy+vl7v3LkMEMp36QfafVlXM
 XpAw==
X-Forwarded-Encrypted: i=1;
 AHgh+RpUhWbbqCMlZf7DcThDfhsKk+bXlcxjjnjSmZ+PJzsTMXqU/qKWrt6YmQv94+CvZr8QACxz4ugL3Q==@nongnu.org
X-Gm-Message-State: AOJu0YzNe4LUeXvxK0H3iBWtr62aH9xfyi/Ghf7GdvwXZNAyFEASJbjR
 hLnaEYLdD6yj+/o05X+MjfEkLV2kikw6zlfE8zZGP/LXk1J4GT4pzl99g95UU8RkRdC2/YXe6jA
 H7nebCCWyPwCygP2Svbk+GLj5/uxiIiKoJz1Ll9p+eItTOILXiusKb8c=
X-Gm-Gg: AR+sD13cUqbXAUKiFnIUw8lwfLBKRZcAYHcLSpuJ72A9Tb5Me7hkkadGDK7P2H3u8ol
 ZSvj9+tyfi8f0kqfvmlNKAPn8ch+KeHZPtjpUSiGISfmLjSt/tQoUolulwZpwsnAGEdCmE+4or+
 jvwXv8wl7ALY3ZIFfKdBT/lFzpOCdi3iLhwyR2Z0MOi2XaRbIvwtpoHIu2gSQ8xJgmm/ZIOsTmH
 mbacc1SZZd0R/51KuPvef/5OEGZWtiQISgT/0hefgUQy/7H6tIPQkX09YVVwSr8l48Pu2y/E3b/
 XHAzk7xRhbMpif9wnjB4uSZRxz0aLlTp7WwUyFNXxRCWnovYJg91XEbG+8vgP2eWk8TqUoxXVhj
 pYtJXwNSQbKABWbUTs6CLrx79eEYr7hkkRiB7Inx9PQ==
X-Received: by 2002:a05:620a:284a:b0:937:11c9:37f1 with SMTP id
 af79cd13be357-9371e29f5bcmr1056238085a.16.1787222940808; 
 Thu, 20 Aug 2026 03:49:00 -0700 (PDT)
X-Received: by 2002:a05:620a:284a:b0:937:11c9:37f1 with SMTP id
 af79cd13be357-9371e29f5bcmr1056235785a.16.1787222940440; 
 Thu, 20 Aug 2026 03:49:00 -0700 (PDT)
Received: from localhost.localdomain (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-499aa17f202sm128147945e9.13.2026.08.20.03.48.58
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 20 Aug 2026 03:48:59 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-ppc@nongnu.org,
 qemu-riscv@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Rikalo <arikalo@gmail.com>
Subject: [RFC PATCH 12/13] target/mips: Constify CPUMIPSState in
 mips_vpe_active()
Date: Thu, 20 Aug 2026 12:47:28 +0200
Message-ID: <20260820104730.25462-13-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260820104730.25462-1-philmd@oss.qualcomm.com>
References: <20260820104730.25462-1-philmd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDA3OSBTYWx0ZWRfX8dD3iLWfGwRX
 k8OhAimqjyY3w+P0tZDWlujIVU4tRGF+oZMj05AadcMjtfzI8b0oFSSjbWSARxSUylgjDAulGHh
 rxntdtkte41eTv2yEIf741oEv3RVTfsQGpKmYVtAdS/lbkfPdifCxP2aXq9cgyDTJ+c55Aq8/AA
 erXJDKCruc0c81zjxfXrBaGepo/h9klFWVLIK0FbnSXjKqzB/Ej4izLLHgCbWs/znqQbP43eqSz
 eLkSdvgyFzrSDZ+VivrmGI9FK5yuU2hXrSDsrjn81Gf1E4IO6VDa3rU6aGlUmuknhvg4hsODLLF
 WZ50no7VqwlYEVa2DvlE9w97UbCXrNK9ax93UeaFD6CMKPRD2mmtlvBFdMr7aQYxELBAKZDyD/a
 UUBjNc9MmHblQO6fm46MtzLs1KR5cBaMvQKBLpIZ8gklEExO5tGugjJWbPdz3odfV/zf9RuXOTl
 tJCUgnW9E+5EbNgXzNA==
X-Authority-Analysis: v=2.4 cv=KpJ9H2WN c=1 sm=1 tr=0 ts=6a86db9d cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=fHZv-jQ_ZcGm2iaiupAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDA3OSBTYWx0ZWRfXzIdX9fra7eKF
 LbZaagmENlIbNse0RACOn9e3TTfLZa5HQdDirEsjdudEPGgTfw5HSe8XRAfZcINRlpjsziebvRl
 In7NDhMU7mSclYogJMhhDnL+y2bocTI=
X-Proofpoint-ORIG-GUID: AW-q412Lj9Ufbq_co4WCf9ghYnbKF7DF
X-Proofpoint-GUID: AW-q412Lj9Ufbq_co4WCf9ghYnbKF7DF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_06,2026-08-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608200079
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

Use the recently introduced env_archcpu_const() helper
and qualify @env as being const in mips_vpe_active().

Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
---
 target/mips/internal.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/mips/internal.h b/target/mips/internal.h
index 66e8c599b43..88459539866 100644
--- a/target/mips/internal.h
+++ b/target/mips/internal.h
@@ -247,9 +247,9 @@ static inline void restore_pamask(CPUMIPSState *env)
     }
 }
 
-static inline int mips_vpe_active(CPUMIPSState *env)
+static inline int mips_vpe_active(const CPUMIPSState *env)
 {
-    MIPSCPU *cpu = env_archcpu(env);
+    const MIPSCPU *cpu = env_archcpu_const(env);
     int active = 1;
 
     /* Check that the VPE is enabled.  */
-- 
2.53.0


