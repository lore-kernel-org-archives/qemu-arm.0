Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC8D0C5CFDB
	for <qemu-arm@archiver.kernel.org>; Thu, 13 Aug 2026 18:21:24 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wua11-0003hf-OX; Thu, 13 Aug 2026 14:18:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wua0V-0002ux-MG
 for qemu-arm@nongnu.org; Thu, 13 Aug 2026 14:18:27 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wua0O-0002E6-C1
 for qemu-arm@nongnu.org; Thu, 13 Aug 2026 14:18:18 -0400
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67DGDvpB2916956
 for <qemu-arm@nongnu.org>; Thu, 13 Aug 2026 18:18:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 MsVnRq6tTlLn6rJyDkFaPR9BDkcmhfUBFcym5esfn2o=; b=c97tR2ddpDb5+1FW
 RxPrsNF3AsjCNIfxMfYWE2Pwq/0+hiX/05ArbaOF1Ahk8675cJspq3vwy04hO+Tp
 sHYj6jnHEzSGfZLJWwk52EImY6corNunFtH5s33gbvkXovncmGLdHbTzozMLWWKE
 EJAUGzWAEBOI158QPMv9xejpkJPxVWN8ny/4w5jm4FQ726rVkWwGV8p1A9NVmqi/
 Lo8RyntVD8836HcC0Sc7teFsit88wsju9TR+3Iz/sMfJgwBTsr7/7pi6+TydxoXk
 2GB5DXcRgVPXvzB7ch18uRhGcNn/0Qg/eVMCRHr0N/fRTQSVlwYiXIxL2U/kRky7
 QdN9gg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g1h90rj9g-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Thu, 13 Aug 2026 18:18:05 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-92e63df032bso119015185a.0
 for <qemu-arm@nongnu.org>; Thu, 13 Aug 2026 11:18:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1786645085; x=1787249885; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=MsVnRq6tTlLn6rJyDkFaPR9BDkcmhfUBFcym5esfn2o=;
 b=JWwPqZSsuXla+WzyJXDs9hTV0mt524NwUbtxD3WRfVmcbIo5n7vy6+tQR+MCSOoQAY
 S9EWLV64/jA1vyjCR6/fiFBeavhiVly2blkhTSlPRKipfdYrmOMvFme/4uxoLeiaZkJo
 lFbRxZvrF1IO1hLsqqrboOKLntZwGutGQIUeZpiK58CzDIAvbzRBu76PgawD+x6nnZsT
 AsvuQ2jt0F4iU4wRtXlRNBsnK5lsHwzN9Yfz51rNlRFKTkFkwAbjlmq8r7Na/8y5Ws4t
 nQRgEgcEIpzV2QEK6jnvEmFF9QNB1o1gpMKM+FGeXKpE/LgbqtJIh5pZmb920QWAvH+a
 wQCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786645085; x=1787249885;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=MsVnRq6tTlLn6rJyDkFaPR9BDkcmhfUBFcym5esfn2o=;
 b=Gyq1VvQTQSjkNOJvEh5++5pmmyLrRi9RZuTRJEm7brmtOs2oax2R76RncDjFIkEIzB
 dAaX1xXQm5Q6sk7lEzf49H0JjtmFx+6CIk/CVeTji83H+VivvL2cbWmmOMJIDoENpe6L
 sVrLAHwWF/2CoirIzrXVLwM4MiN2+u/wNBOVoID7gz/f7B3OCNqXqaVCDRv0AlIV2b0R
 TdcrqjzpcM4DWgyq+QV9xoWuAxQXjkJukK4x9VA773k8jg8lhBMDxpJS4f1DtupfRfoS
 0g5HNxevFslTeVIthu21GT6a1c6JTFWWHMl2Z45MkZ7UJpqhWTkBDPmytLK8UOcqEsKo
 4akA==
X-Forwarded-Encrypted: i=1;
 AHgh+Rpsa85h2IAnSf3ro8Jc82GayXY+QJpbtgnWXknlR/AUegCoLU7miDQlTkBWMD9QOL7EoIufC1JHCA==@nongnu.org
X-Gm-Message-State: AOJu0YxN1jrtdRw1Vytt1nWHj/WmqFcPXD97v8Kvqyg7koOerXl9oDlX
 JiBG6i4GXJlgXNe+4/l7UESVzhrC3YbW6gatfuIyJ5fyDzP/jhY4YIC1QuBEfNYndcpkkIDpuAW
 zxUQ4WrSZIUOn1iihyWeF2BpHcw6fo2HDxZLTR+dpu6rjliFMj+PG2d0=
X-Gm-Gg: AR+sD12tu4w7jkoyKXa/wq8+ZWCw19A80lYykoaCGLD2s1oU4qkREmAMs6HKpWiIzEo
 btO1pbWumE6DN/ycVlVN/btkhmoIBtN+mjdf1lVk1OZT6Up8NZv7EngPW7x9f6PIFloKpUO04xx
 zX7IWSj3XpE7h5ojLWDUOwPkt7HRnFvzedegGwg3SUlANXRej4jCM1zX1HxwR5EFkFEHdtCiR17
 lLNtuKM1/Vwavjy79AfJRitc9+xwivzmgb6BgHLSU9uzfD0kQRn4PlbksHT1ZT6esqQFrrxKZU0
 5JWMoRwrR4qXdlPkPClkUT+pUccD0EBCu2GHHAPysQPkbMYfESQRmHC6zYYujK4M6PoicB8Tj2V
 IOgnkYBQ8hjfXyME8WuXT60sdjsGg4GRMQ3glNS+Y7A==
X-Received: by 2002:ac8:594d:0:b0:51c:1f35:4638 with SMTP id
 d75a77b69052e-52d74ba523bmr65865091cf.21.1786645084281; 
 Thu, 13 Aug 2026 11:18:04 -0700 (PDT)
X-Received: by 2002:ac8:594d:0:b0:51c:1f35:4638 with SMTP id
 d75a77b69052e-52d74ba523bmr65864691cf.21.1786645083884; 
 Thu, 13 Aug 2026 11:18:03 -0700 (PDT)
Received: from localhost.localdomain (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4815f2b1d9bsm1099831f8f.24.2026.08.13.11.18.02
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 13 Aug 2026 11:18:03 -0700 (PDT)
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
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>
Subject: [PATCH 11/16] accel/kvm: Consistently return CPU halt state from
 process_async_events
Date: Thu, 13 Aug 2026 20:16:34 +0200
Message-ID: <20260813181640.6537-12-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260813181640.6537-1-philmd@oss.qualcomm.com>
References: <20260813181640.6537-1-philmd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Ovh/DS/t c=1 sm=1 tr=0 ts=6a7e0a5d cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=GGjvRDhnLmMstqdV9EAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=O8hF6Hzn-FEA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEzMDEzMiBTYWx0ZWRfX8ioPFEEFtTXV
 WWMmZUA5OrPEFn4g3M3WDjUOALMAyo9ZQxtS8qMcK+vDS7FOP8UIHbIMwHmm98D0CQiVBPvB7tn
 kSkGJ8ezbvG9QYbJxmbw8cf1Xrs//FU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEzMDEzMiBTYWx0ZWRfX55PuOr4ltKV1
 WN1t4tokUDC3ic+8fwWRwUgMMImSWFloKiY88pYNvC+03ef7R1KQXovxwJtBHWpbn5fCyPYc2Nx
 TywV2ZSHZlbXYsPRYQrCCQV6mneK3b21kQiIuaNHfPLZh43QNlHiwTcZxXDKz47u4Dx+Lxqy8HX
 4MIBw+FTUs14X28X9R2woMmQTWn02quVnsvJ2tR/+cH4iGpwTmqGlUTzd8WKmS4PLrxaJU3sqzG
 kqsULiwOhHakWRcspAWSJVnNwtagiqHOmZCRCpzK/Ihbhl7O2TvFA2tJw3zqaZXo8qW3PN66itF
 TU71y8K0isIIH25RmWtr/4HFSmRewCWX7RaRyarHpE2F6nN2dUFrQAglKUXpG91yQfedI0daNWE
 eIf3Xk8E3ZXZTMYKLfaIc4xNCvsfiY835vJuxxAlhWijsu9s5rP5Z3cAhaxaEIWBM1/BfDibVtF
 K5/D4Q514+qYQuBRG9A==
X-Proofpoint-ORIG-GUID: dF5MNgRwVUT7DBExm42EJTa9dA7KVd5g
X-Proofpoint-GUID: dF5MNgRwVUT7DBExm42EJTa9dA7KVd5g
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-13_05,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 suspectscore=0 malwarescore=0 priorityscore=1501 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608130132
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
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

When comparing the KVM implementations, RISCV and ARM differ
from S390x / PPC and LoongArch. The caller expects a non-zero
value to return pausing execution with the EXCP_HLT exception:

  3427 int kvm_cpu_exec(CPUState *cpu)
  3428 {
  ...
  3434     if (kvm_arch_process_async_events(cpu)) {
  3435         return EXCP_HLT;
  3436     }
  3437
  3438     bql_unlock();
  3439     cpu_exec_start(cpu);
  3440
  3441     /* Inner vCPU loop */
  3442     do {
  ...

Change ARM and RISC-V to return cs->halted for consistent behavior.

Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
---
 target/arm/kvm.c           | 2 +-
 target/riscv/kvm/kvm-cpu.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index d40a6a98591..5caabfab63f 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -1575,7 +1575,7 @@ bool kvm_arch_stop_on_emulation_error(CPUState *cs)
 
 int kvm_arch_process_async_events(CPUState *cs)
 {
-    return 0;
+    return cs->halted;
 }
 
 /**
diff --git a/target/riscv/kvm/kvm-cpu.c b/target/riscv/kvm/kvm-cpu.c
index 97069bf597a..1a61cd5ef37 100644
--- a/target/riscv/kvm/kvm-cpu.c
+++ b/target/riscv/kvm/kvm-cpu.c
@@ -1568,7 +1568,7 @@ int kvm_arch_irqchip_create(KVMState *s)
 
 int kvm_arch_process_async_events(CPUState *cs)
 {
-    return 0;
+    return cs->halted;
 }
 
 void kvm_arch_pre_run(CPUState *cs, struct kvm_run *run)
-- 
2.53.0


