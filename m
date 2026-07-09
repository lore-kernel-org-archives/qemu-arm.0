Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85395C43458
	for <qemu-arm@archiver.kernel.org>; Thu,  9 Jul 2026 16:41:36 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1whroU-0003AD-Vc; Thu, 09 Jul 2026 12:41:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1whroS-00039d-U5
 for qemu-arm@nongnu.org; Thu, 09 Jul 2026 12:41:25 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1whroQ-0003c8-UQ
 for qemu-arm@nongnu.org; Thu, 09 Jul 2026 12:41:24 -0400
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 669FbHDe2248636
 for <qemu-arm@nongnu.org>; Thu, 9 Jul 2026 16:41:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 9QebU+MNsT2OdSqbSlYYVFrJtMb+QkrQbrdiQLBQFZ0=; b=J0lcEYuJtPMqJtQz
 SP92/1GflV7Cm2SR02hcZz5QOSt3uFbG/W0cvTg3GvTiNAO6tlqIrhfbD93bd1Tj
 C4QGrpLHpXzY/ItUJCWIVkKL2a/F28eB1GwqKKIx2vrua9dawcxE3WNBSg/Qdaip
 jHO2T12wC0x4omrIXz69oX/QM33dLEuVmon3cBHkgo0kc3kj/MjJ5qx3G09CXxPj
 i6saW9fG8tHXYtJk8QvxPE5XKRamC6IppHF/DOZ9R8ipjtcJel6nEwVsyn++plyk
 3WuaQlMxCaighINvOyGjjC1E44cqo5gsckRP6e/eLnl8ZXPAWjrkucNJKkxKkCMH
 5hHQPQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4faeesrbtj-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Thu, 09 Jul 2026 16:41:21 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-51c2af04aeeso686861cf.0
 for <qemu-arm@nongnu.org>; Thu, 09 Jul 2026 09:41:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1783615281; x=1784220081; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=9QebU+MNsT2OdSqbSlYYVFrJtMb+QkrQbrdiQLBQFZ0=;
 b=fUQNMGtZZrsO/DN98WQeUMRULyy09cRmygWn7S+quZaICS1o/+P8cWWJxXtVASh1xi
 LX2MZvWZNFfQCoxAVzYQnuBAP25oijzh+zNZYfVb7FeVDAJGxF5vzOmSnTDzIkYIkfD6
 xYqIRtlO+hNjn6ENT7CBPiuQ79EzrdGAx4pl7ST7Y0rTK2+CtBhRg4gP5Kld1MDvEk1D
 K441s6d4n4Mq1HI9x72npZnylXkU5+WTB9csoVkIOZ8CAp0qQ/eMEAZk/RNTAxCBT4jU
 3AR2deejE3g8OleLKUhWx4dq6PFa1FSdokqUamXr67oRogCbuzPeH2nJiWI0Plozpfve
 9fOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783615281; x=1784220081;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=9QebU+MNsT2OdSqbSlYYVFrJtMb+QkrQbrdiQLBQFZ0=;
 b=mby2o0yiU0M50iB7haK4vb7MlNU6MStvvFNkJBUTJo/f+NiLlUOuuFNZOQ1RD9OG1v
 /K+Ew59GXZ7BpGSSvKVBC1prbDUR+IAtCf/+5g8Ss/UgRj31wvUj96nW8Moz5e3W/mcm
 Tp207qZP+2kJyIXoCS7ryunfegDQbPQ90ULP4uDFdmiiUjzWzyamduV2Qwnbya90ADyF
 2/uUnE6fkwWZhh9+HHytTCEAuO+uTmk4G+hgKf0rdnEEmc+kjzRXvrfFgmUGCNhQlUd2
 dgEXq6Q5CntiE+6cAC8MtgC9xdkwgEhwR8nnKkhP2Fjd8TsVJCl5g6aF1ZyfwGIOcTKl
 CgEw==
X-Forwarded-Encrypted: i=1;
 AHgh+Rrs9F550X7pyzeP8yGLd+kMAlvSVnQ7eY2Rt+LUCBIF06vJzqwzbicDohFZai/EWKa15CZhnftTFQ==@nongnu.org
X-Gm-Message-State: AOJu0YwotWx9QEQvoX0w1rhtsCxPgSq8Pq/ZOe8MyQwz4cjbnrx64mPE
 X0l5uE4ck50UBt33DzC4oODqhGH3f2tTlWxWVFibTcJRrTQsLNl26h9lMcgWj94Qxny64nNXZd8
 OaRjnKphPgZsmokae53NYAARtVitZXf6y3rEFqycJsHL7FZtVQctm2Yo=
X-Gm-Gg: AfdE7cnlQFRp/JA4orEZF7K0Yme1DUBG96ZCiB9UNSCZaBg3BPChQjvOCQiDrtbr54Q
 +jU1VqmkRxc7C0+yT/haPV0Xcvpk7ReybIk+7ep9sNrDp4UKpTXn5asXDsLD6xehqxY/M2zn5xM
 U7Ux3RyAsGR88LD10H95RrFAhLehhUexGVM1jTN7JmHLw2q222EYwRpFD+GHW2kgSj1+f44eSU2
 kZVoCKeCTftGENmc1W12HG0wEDvwa+81XRq23+p6Fk8pUYAq8Ii4Q8AbMtcOjMChmzRjjcy/fYD
 oUFTemXP1fREjzOdpLMsBIfiXMXrQMGGHYa90uxTvHaNKm3+MBztJ9eVmVzTCU0dhdEyH1IHJtm
 BocNLL49Rl2xXJvpSU1BnKuQXNfCJNHcIeKjQgybrfYYuKErxDTDYKDSKgiMe5qLQe/zM
X-Received: by 2002:a05:622a:1dcd:b0:51c:98f:f288 with SMTP id
 d75a77b69052e-51caa12810amr214761cf.25.1783615281426; 
 Thu, 09 Jul 2026 09:41:21 -0700 (PDT)
X-Received: by 2002:a05:622a:1dcd:b0:51c:98f:f288 with SMTP id
 d75a77b69052e-51caa12810amr214411cf.25.1783615281065; 
 Thu, 09 Jul 2026 09:41:21 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493eb66beddsm80776075e9.0.2026.07.09.09.41.19
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 09 Jul 2026 09:41:20 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Jamin Lin <jamin_lin@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
 qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Joel Stanley <joel@jms.id.au>, Steven Lee <steven_lee@aspeedtech.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Kane Chen <kane_chen@aspeedtech.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 qemu-stable@nongnu.org
Subject: [PATCH 2/3] hw/arm/aspeed: Add missing Kconfig dependencies on
 required components
Date: Thu,  9 Jul 2026 18:41:01 +0200
Message-ID: <20260709164103.37614-3-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260709164103.37614-1-philmd@oss.qualcomm.com>
References: <20260709164103.37614-1-philmd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: HYrcke53b9Ug0RbEuegrosWLR_22binU
X-Authority-Analysis: v=2.4 cv=bbpbluPB c=1 sm=1 tr=0 ts=6a4fcf32 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=69wJf7TsAAAA:8 a=EUspDBNiAAAA:8 a=mjaNlZT-9ziipFgz8p4A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22 a=Fg1AiH1G6rFz08G2ETeA:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDE2MyBTYWx0ZWRfX6o3/+E4gbcMv
 guPzXerto/Rv3rlXIdahjQ1AysvKhiAXERLAU6YxFnKZlx52Tv2SE495JUUcwa4TXgNtqLP2/W+
 W+Ffb41607Xyi0B+ECulk4feZrdirKo=
X-Proofpoint-ORIG-GUID: HYrcke53b9Ug0RbEuegrosWLR_22binU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDE2MyBTYWx0ZWRfX/jjzow61SaJu
 08GKhUGpT1sYeKGu0AnfvRtq8VJjJAcl3TRkUxC9cxXBU1CusC5jM4o+TZSHsqECqjm1OftsNUU
 eFML4KPF3+mRQJyYyw6ifZhL26CFt8LMQGwk1Z9QNyV7LYpSik8jEXlMtL5VrKX74mSVNNVXaXW
 XLnIr1QhEVAAdfaPWgUDWsbwyl33OUy9dOLWIdTqm5bnfnTygwps9Wsi6XLM/pSSrgnZg+u7raY
 u92wIge7sA6V/lKuu9ZyR8uSMiHXnFwaTV06IYVgveKUSQRZiHIvm6/HWOd2f3ZKyIpNKu2a8Gd
 uvAcuyYz/viPXQhkEbmvZ17edBlop1dsvl+2T7HGNFN5dkK5h+BL3vaBFGsNnVKLZd5W+/+FvIu
 q5AfPgBKh1ltTy4pjqw87b3k8A8I3smgzFfI2bmQ1ZN4sTqQgNjvpSra+y//lUz7RNv87W7aXOu
 tgiW8Xl9S3ybAZf+52Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_03,2026-07-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 malwarescore=0 bulkscore=0 suspectscore=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090163
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
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

Add various missing Kconfig dependencies of the Aspeed SoCs:

- USB EHCI (commit bfdd34f1caa "hw/arm: ast2400/ast2500: Wire up
  EHCI controllers")
- OR-IRQ (commit d831c5fd868 "aspeed/intc: Add AST2700 support")
- SDHCI (commit 2bea128c3d0 "hw/sd/aspeed_sdhci: New device"
  and f25c0ae1079 "aspeed/soc: Add AST2600 support")

This fixes the following runtime issues:

  qemu-system-aarch64: unknown type 'platform-ehci-usb'
  qemu-system-aarch64: unknown type 'or-irq'
  qemu-system-aarch64: unknown type 'generic-sdhci'

Cc: qemu-stable@nongnu.org
Fixes: 2bea128c3d0 ("hw/sd/aspeed_sdhci: New device")
Fixes: f25c0ae1079 ("aspeed/soc: Add AST2600 support")
Fixes: d831c5fd868 ("aspeed/intc: Add AST2700 support")
Fixes: bfdd34f1caa ("hw/arm: ast2400/ast2500: Wire up EHCI controllers")
Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
---
 hw/arm/Kconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 00e2d938033..6f5b2add66e 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -551,6 +551,7 @@ config ASPEED_SOC
     select TMP105
     select TMP421
     select EMC141X
+    select OR_IRQ
     select UNIMP
     select LED
     select PMBUS
@@ -558,6 +559,8 @@ config ASPEED_SOC
     select FSI_APB2OPB_ASPEED
     select AT24C
     select PCI_EXPRESS_ASPEED
+    select USB_EHCI_SYSBUS
+    select SDHCI
 
 config MPS2
     bool
-- 
2.53.0


