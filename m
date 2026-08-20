Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27D9BC5DF86
	for <qemu-arm@archiver.kernel.org>; Thu, 20 Aug 2026 20:16:06 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wx9Ah-0006hH-No; Thu, 20 Aug 2026 16:15:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wx9Ad-0006JR-Gs
 for qemu-arm@nongnu.org; Thu, 20 Aug 2026 16:15:28 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wx9AZ-0002dA-HX
 for qemu-arm@nongnu.org; Thu, 20 Aug 2026 16:15:27 -0400
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67KK7vIh3941460
 for <qemu-arm@nongnu.org>; Thu, 20 Aug 2026 20:15:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 J2rUL5dnRfopAxRp6y8OcNqck/aSQMf0xVr1iUn+iFc=; b=TEYDVI7f33wtkr13
 tqpyv6vR7GvTspu96LWcmHILMOXsMBsmNybvHUQYfwNTKNgMX5IDrcCLCIYWc/qj
 DKgqURiqgLKAEQjsUUJhIUKC34UEyik109nYIsRISvXV16HZLyU2joo6GeMJaXJK
 hJ382WDZHoR/oDIlS3INJg3tuStBGXJ9LOfNJC1tXDiyjE/TbajcHEIWkj2+3DFc
 Fh6+hNKFm05ydl8BFIsK5GY22dcnCnS2LNmmeTVkXlkzNhN9pNA3tPISX3tNNa2p
 4CBAjhuCryh5deKB/3v+wR5RX0ConRefIAj3289Mm6CffDJbAnjBi9PhSRkefLZC
 AGVBGQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5vh7ujm4-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Thu, 20 Aug 2026 20:15:12 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-52de40127adso2413831cf.3
 for <qemu-arm@nongnu.org>; Thu, 20 Aug 2026 13:15:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1787256911; x=1787861711; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=J2rUL5dnRfopAxRp6y8OcNqck/aSQMf0xVr1iUn+iFc=;
 b=aUlr6jzEoJW+qeLNryC6U6n/A56FAlysR+ZloNwIPYDuZlVGUygVRcdKL51itJGAyy
 MaaSoA+gfDDJh/WcS59FNqYuuvkxJOT+A+HVXvwsMvbwybyw6qrMfYtc0RufaCNCBH/z
 xMP09fY34BdOLjD5GLh1ogRZN3FCJh4BhiqgweeTY3xaa5R9Fft8WaihNLrKtA/MQ6xh
 gfdG1hG/gI7DxetdJZa4dBatOLaJIJnB53U7pmzb33dBKk1TKbBw3C0bfxtx8Y+R88J4
 CvFGhS6Q5l9KB66sKg9j5xmopJaxIWeI8YslkCth6yHMftjUq3LY9bXoxIbT4zmsXZOL
 vaOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787256911; x=1787861711;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=J2rUL5dnRfopAxRp6y8OcNqck/aSQMf0xVr1iUn+iFc=;
 b=OZii/z///KmuLxHOY3KRirz1EMU6zA/jcFEl03Nf3bMntD1nLkySJZFYw1aTQilRxk
 ZUa5l9xr8y7+VhVbctpW6d+0c7jKudXYGIi2dIAkeMpyr1KjfheTpQ2qqW3F5lrD5ur+
 7NoQA393rB2QoDZCpDzmzWsWrowBNGGyNYcRk9/dwrLRhLxTw+P0sktv+WtlM00/ILRx
 fzlM1z597Gvyhepb2PTTG/TNPSlr4O0/uuhkRP+aBOB6X9uW00x97hA136z16Is0v4/x
 m0N1Mtl9aSBReDvsB12RDIOQaOswpT26dyGtquhj8mhyTtFLGWqalvvte9ng4RrpNleB
 zcsQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RpoCDYJL6bPAOCnbhNF9iaqPrSmFicOgQlaMU/nNOHLeMoi/f8vjli4wLUYw9t8ZfX4CCp2Dwd1sw==@nongnu.org
X-Gm-Message-State: AOJu0YxHQajNYt6XfGL/+1io2aWzb0MIgomVNItr5H3Wjs5kzWriWVDC
 FZ1/a41mboO/FFpynPNy/LGfIqwVoCFmt6a+p3am4g6aSM6lN0mIIzVTRoNt66F1sZEjAfnX4lt
 o/776hboAWCADGCWT+9tURjqgl+ND6ZpNk6Nyp/GD70fG7SfS4gLEm8yhE07eQATnRA==
X-Gm-Gg: AR+sD11Wmp/8OGmi7u9jr+a5KC/wx70vsYOu8O/UqCworDcbfWOZdXmTXROfZTbMdJ+
 D3mKO+Xw9K6lJvnwEWgHcRrzuVhsZTyBXdl7dmyw/yu8ZjCFyk/xqERCHFO101ZGJ+RkIBSTarl
 5gpgVqT9bV3mVq60QVgcVv9MPoZVMvbMBHMVxOBOxzpyuctzUDBTepNGeX4nY/G+TnDiGOzfMjd
 WRbqJqcPrr8VLPp0dGa/kCbQKzf63dUka5z/qkesmNnPi1W6byDlpapvW+JTvNPQoGL7nq2rmjr
 efsOaNKIoHXMDMvaVCIMxx15RzDjqN4DBqd5540vigO2+tvk67+qw+gw9WQUc4rHIa0EAR0G2q4
 hG8Fsl163Rkoe6pOlg23KW5trFZeNvRlcpP2DvVmy8Q==
X-Received: by 2002:a05:622a:8a:b0:528:17d9:2d99 with SMTP id
 d75a77b69052e-52df5a748c7mr9238041cf.43.1787256910772; 
 Thu, 20 Aug 2026 13:15:10 -0700 (PDT)
X-Received: by 2002:a05:622a:8a:b0:528:17d9:2d99 with SMTP id
 d75a77b69052e-52df5a748c7mr9237201cf.43.1787256910274; 
 Thu, 20 Aug 2026 13:15:10 -0700 (PDT)
Received: from localhost.localdomain (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-482b10fcebdsm15613895f8f.0.2026.08.20.13.15.08
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 20 Aug 2026 13:15:09 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-s390x@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-ppc@nongnu.org,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>
Subject: [PATCH v2 09/15] target/riscv: Constify @iprio argument in
 riscv_cpu_pending_to_irq()
Date: Thu, 20 Aug 2026 22:13:49 +0200
Message-ID: <20260820201356.29775-10-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260820201356.29775-1-philmd@oss.qualcomm.com>
References: <20260820201356.29775-1-philmd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDE1MiBTYWx0ZWRfX1wa7+m5hYtzm
 PRym/O+uXvpTqyaFebbaHQ0XFVEIUYOaqzHoGCcfWmoth+idetSBZx6B78MXcIk1MDQGTVBY8KC
 rl5bS5g55hFY5MzGmkK99aHiBZ/dDjXQgmOH2A86NotjufoRZIeVCxw5zRx/ZE0OsIFNVOO7eJA
 1bTbkImkootQDLEFxSotmSDPKiL/tVK97IGhg26sonBxm2VzeoSobupA6FfPhOCAV7GTdO5FSLP
 M0W1APPQoEaM3NBrj1nlWRQVXGf4E2eaLEoCpr7aEv4nFAXSatJn05c5AskzoSo91nFXwHxZYRX
 WG+AzE/Ny6+WVX0ZvSioijDJ/Gdvg4OvQEBzdBKAVK8y5x9LNJUcB7SS1uOo6ThbTHAigg8N/MH
 rFChoQ38+VOWprrpoVcp2Yy3VgA7YYDdd8bUvjl1JSjgyE1Yg7jWYFhWB2qlkokoVHTMC3ZwT/u
 w9L2eGobkXPFPvY5WUw==
X-Proofpoint-ORIG-GUID: -HtRXDfw15enXUVOv9UdiNBMR-Ni6o5y
X-Authority-Analysis: v=2.4 cv=Y7fIdBeN c=1 sm=1 tr=0 ts=6a876050 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=20KFwNOVAAAA:8 a=tlxghdvPRZsVr19qFskA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDE1MiBTYWx0ZWRfX66qYtIw4hQCv
 mt+KA6HQ1nBaZKbX/uaHct6eE5o4u7XVcSpvzwG8maDPlRsGU0//7G7wYeBspILSd6VmgzgQMYL
 cyx3jJ8jRyJjcmXOqZ96h2zenl4QiZM=
X-Proofpoint-GUID: -HtRXDfw15enXUVOv9UdiNBMR-Ni6o5y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-20_02,2026-08-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 adultscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608200152
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

@iprio[] is an array only accessed read-only.

Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 target/riscv/cpu.h | 2 +-
 target/riscv/cpu.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 376cff656fa..bb4c8563554 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -642,7 +642,7 @@ int riscv_cpu_sirq_pending(CPURISCVState *env);
 int riscv_cpu_vsirq_pending(CPURISCVState *env);
 int riscv_cpu_pending_to_irq(CPURISCVState *env,
                              int extirq, unsigned int extirq_def_prio,
-                             uint64_t pending, uint8_t *iprio);
+                             uint64_t pending, const uint8_t *iprio);
 
 
 bool riscv_cpu_fp_enabled(CPURISCVState *env);
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 7bf098319f8..858fbf865fd 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -866,7 +866,7 @@ uint8_t riscv_cpu_default_priority(int irq)
 
 int riscv_cpu_pending_to_irq(CPURISCVState *env,
                              int extirq, unsigned int extirq_def_prio,
-                             uint64_t pending, uint8_t *iprio)
+                             uint64_t pending, const uint8_t *iprio)
 {
     int irq, best_irq = RISCV_EXCP_NONE;
     unsigned int prio, best_prio = UINT_MAX;
-- 
2.53.0


