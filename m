Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D035BC5DF88
	for <qemu-arm@archiver.kernel.org>; Thu, 20 Aug 2026 10:49:11 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wx0KD-0001e6-Tl; Thu, 20 Aug 2026 06:48:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wx0KD-0001bT-1B
 for qemu-arm@nongnu.org; Thu, 20 Aug 2026 06:48:45 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wx0KB-0005rs-FB
 for qemu-arm@nongnu.org; Thu, 20 Aug 2026 06:48:44 -0400
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67K8tFiG3515433
 for <qemu-arm@nongnu.org>; Thu, 20 Aug 2026 10:48:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 87hQGCR8CABVkCadhUOVGkl0BzAcqLZqB1Y9MhLxV24=; b=XBmwqhv0Tfnj8F59
 k7/4PW5b/9Vel9y60Cvulr/AMN+FFqS7cxQN8hRarMkwSFCCcZ/hVc9XjZ4WH1o/
 PellS3YxUW0kMDSews1eXWhzQny6BvnDhF82XCrqXagvJqmqigv8i9mJchmhE4mC
 eDg6Ef6/HG/xHniAjZy/9Qw0am13y1R6mXV3jwH+uuUhR6xwvX46PWDJILq6YG7d
 4HhEm0EVXmU2G7rh2aUqX+qWNEAlesJ7NU2u/G9sLOw+4U6Mi3yEquq/FBmkGodp
 pKET7OrQXRmVFTGd6LnZ0WGAd42fuQkLgRXMJ0P9YuLATBvhW827CqtdBtmdzEye
 TzX2lg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5xgc8f5a-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Thu, 20 Aug 2026 10:48:32 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-92e8004d60eso383713585a.1
 for <qemu-arm@nongnu.org>; Thu, 20 Aug 2026 03:48:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1787222911; x=1787827711; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=87hQGCR8CABVkCadhUOVGkl0BzAcqLZqB1Y9MhLxV24=;
 b=AEr1X3yXaTv3EGEOOP4SuK/LA/RPELBfIF34D+Of60d/EZd+GKvUq00/a5g/b48CQt
 +KbaYD8KPzLqJ+MfCIzETx/XkoRLZO0/NfNG2/O5tCf/lEZEzLuk1v/O9Ju5XMg+exqQ
 8vwYwsEHA1jA5Na+0TzZ78VrBrHVWULO7yIKWMgZsfbYfxgC0LcTBkpdewH2uHgn4x5T
 KpIy6IU4lsUV0XbjZU0Ss3zuJb0wR6b13Kdywv8IKr+3p7QWB1uRla+0iRgFmWyX4MAU
 +/lfZ3QyZmlHUNj2Cp9ctmu7xUg2qrlOOVQ/VUeT0M2nrmT/R8mpDSoH//GOPHPQG0L7
 yfJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787222911; x=1787827711;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=87hQGCR8CABVkCadhUOVGkl0BzAcqLZqB1Y9MhLxV24=;
 b=AKEBsCT4i6BSQfuYjpc0nx+guJehqlELch/LZp9pczV2o/rbW3xE2uItS1WPStXXNv
 H3qWVEA0jyBrQO9StD6H1IWANwS4nm7pe+Beo/hj/hG12KtIwBi5ho5rdTcvf1dcTq1W
 08NS58G7Lka4lNwdEccqfSWkqVXJHySAHGAc+3fHH3U7H08nLcpvQhcffMKs+QGnkIVT
 v+DlVXXeUcWv/2ZExWSjCP13r2TtxZxd8kpwhCq3umwXM0eTkuJqdgaX3DCDdjZSRCgB
 dl8yGEfUYzPonNVQpKcah5MbDaF3GZGAfAteCdOEcvu6BDFjHNtNot7pM754hRYFOjem
 gzQw==
X-Forwarded-Encrypted: i=1;
 AHgh+Rp7djCvjfORYit3XlZfxvnpCqk92g5wY/Db0WQoJN3x/QNJtsiReZu1adOCVv9MYqvKIwuARknNVw==@nongnu.org
X-Gm-Message-State: AOJu0YwwH7xUKZoCGc7Wfrw/ocxOYfglGEFSSDrYqRxGso7T8kgtVHfl
 PWDlxYNt+2zRqAmyLz78OumMKtIGqSm5SCgJ2v7AeqTG/uSKFmdTwLxUsTIRNIxJ6MxRB0R7hLC
 esGfLydo6eU82lsvIxTovH189uPGy6NRAFa87Yj0DPoTP8Zk3IVpS4V8=
X-Gm-Gg: AR+sD10iDkpulgLTNGofZBZOzzfTwv8nmWdRof3vCEgsT+NF0RkGGCjqkoCvoDbtPAs
 8DUN5GjfCQ1W+0TMy4MaIjaCd84syCi7xYs6jYUlj7+ZMxxW4qb4nA3UXIrsMMBNd9YShpUXgu+
 aVMiufAJ+3G5K+qojQGcjR3dqDoe4/lEoOQe0dHL609Sju80X/56oN47g/DbXTos3qPyrzPo2XV
 GZatiPrBGxtZnTkOYnpiJbs83wfMtKUNVjHA9ynSUggbKYOwBplqRcdxZ5T9U2xJ0mEcecYepno
 dxJFwjx0opQbOGWXFoAEoHgu8rzdI47NDEnaV00JCW+U6Y8AcJ81r6X0UdEVC2UFQywucMNbzYi
 b+bAq0ZY98okjW+ilw3vFDAX2sf40m6U6OTtApCXEsA==
X-Received: by 2002:a05:620a:2314:10b0:937:356d:eec with SMTP id
 af79cd13be357-937356d104amr14283885a.16.1787222911231; 
 Thu, 20 Aug 2026 03:48:31 -0700 (PDT)
X-Received: by 2002:a05:620a:2314:10b0:937:356d:eec with SMTP id
 af79cd13be357-937356d104amr14282285a.16.1787222910845; 
 Thu, 20 Aug 2026 03:48:30 -0700 (PDT)
Received: from localhost.localdomain (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-499aa0e473dsm127398905e9.15.2026.08.20.03.48.29
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 20 Aug 2026 03:48:30 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-ppc@nongnu.org,
 qemu-riscv@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>
Subject: [PATCH 08/13] target/sparc: Constify CPUSPARCState for various
 cpu_*() getters
Date: Thu, 20 Aug 2026 12:47:24 +0200
Message-ID: <20260820104730.25462-9-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260820104730.25462-1-philmd@oss.qualcomm.com>
References: <20260820104730.25462-1-philmd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=GPM41ONK c=1 sm=1 tr=0 ts=6a86db80 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=9ls2pznGE9BkJEkUX-kA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: wbgltT_eKS9aU-k5D98MsOsBBiGslp0P
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDA3OSBTYWx0ZWRfXyO8wUpX5m/Ib
 rWUMBEeNAYey+hmnf5vKl8kC8WwAUGHoe5X1ZnqLIUliFMfHwAvXoC3PxdyMinr8C87TDWS45yz
 jUUQfrd6K/RswYXh7ORCNPurSXJcx1aBJqcQPjgFSvjA3nKS6WijBD34iDy+CnVyI0gANseVzQv
 wP9iq8U/zTJ3OR07t6f0F21hjYKlSoy61kOqfPlanS6eOzRcJm8N/tVug5wqLusOMii1Lf9LreA
 /7QAgLMEtjT1fCp+8lOxvSPuT6PQAnzyVzvYaz/Nr3zD8fSmLB5o7+9SHyPzrCoATpkHPJ9FkWa
 ejlPd2SutPCEKUi1ttXbnzYuhwvwQobyzfdzqrV7I80zU2eDGCntqH03ZylgEufTqJbC+eHJ8d4
 wgcLEJdL5aMwSz6LaF65TpXUbvZq1vzmdq8KNMw+O+IuxCFtRNgv+TjFkIX7e5w0vIn7cABdoun
 hlIgEp3/3hS1mvpFGyg==
X-Proofpoint-GUID: wbgltT_eKS9aU-k5D98MsOsBBiGslp0P
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDA3OSBTYWx0ZWRfX1L0YYufY+OmJ
 xRMlfeKT8FJw82zwM/Dwcqcmc6tfZiDBQbv0dufDpP9u/usYCYQQWUx3othNYwtl9HcsfmZaTJS
 LmqHWC8ASoFrMV+aVR9alTvjvxghfkk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_06,2026-08-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 spamscore=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608200079
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

Add the const qualifier to CPUSPARCState when
the argument is accessed without modification.

Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
---
 target/sparc/cpu.h | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/target/sparc/cpu.h b/target/sparc/cpu.h
index 5f583ed9de2..31a16c2af03 100644
--- a/target/sparc/cpu.h
+++ b/target/sparc/cpu.h
@@ -680,28 +680,28 @@ hwaddr cpu_get_phys_page_nofault(CPUSPARCState *env, target_ulong addr,
 #endif
 
 #if defined (TARGET_SPARC64)
-static inline int cpu_has_hypervisor(CPUSPARCState *env1)
+static inline int cpu_has_hypervisor(const CPUSPARCState *env1)
 {
     return env1->def.features & CPU_FEATURE_HYPV;
 }
 
-static inline int cpu_hypervisor_mode(CPUSPARCState *env1)
+static inline int cpu_hypervisor_mode(const CPUSPARCState *env1)
 {
     return cpu_has_hypervisor(env1) && (env1->hpstate & HS_PRIV);
 }
 
-static inline int cpu_supervisor_mode(CPUSPARCState *env1)
+static inline int cpu_supervisor_mode(const CPUSPARCState *env1)
 {
     return env1->pstate & PS_PRIV;
 }
 #else
-static inline int cpu_supervisor_mode(CPUSPARCState *env1)
+static inline int cpu_supervisor_mode(const CPUSPARCState *env1)
 {
     return env1->psrs;
 }
 #endif
 
-static inline int cpu_interrupts_enabled(CPUSPARCState *env1)
+static inline int cpu_interrupts_enabled(const CPUSPARCState *env1)
 {
 #if !defined (TARGET_SPARC64)
     if (env1->psret != 0)
@@ -715,7 +715,7 @@ static inline int cpu_interrupts_enabled(CPUSPARCState *env1)
     return 0;
 }
 
-static inline int cpu_pil_allowed(CPUSPARCState *env1, int pil)
+static inline int cpu_pil_allowed(const CPUSPARCState *env1, int pil)
 {
 #if !defined(TARGET_SPARC64)
     /* level 15 is non-maskable on sparc v8 */
-- 
2.53.0


