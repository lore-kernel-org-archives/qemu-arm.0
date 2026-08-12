Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73306C5AD5A
	for <qemu-arm@archiver.kernel.org>; Wed, 12 Aug 2026 20:28:50 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wuFYs-00065L-0N; Wed, 12 Aug 2026 16:28:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wuFYq-00064L-5r
 for qemu-arm@nongnu.org; Wed, 12 Aug 2026 16:28:28 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wuFYn-000874-WE
 for qemu-arm@nongnu.org; Wed, 12 Aug 2026 16:28:27 -0400
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67CK2brv4038373
 for <qemu-arm@nongnu.org>; Wed, 12 Aug 2026 20:28:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 L4twhbuOYE+OQiSG5nk2uhYLdr39f2xERddcL38MXLs=; b=MR5OPwS8nDht2VPO
 rXPivY832Dz29NrYFuci/5rjTz7+Ij7C1O4eNpn/zw57MwVMAiFTWrHIzWfTPwFq
 gXUQ+HZv0vQl1rxMYGsf9hc0mCkCi6AegyMC8ivtcSBsUJzF/UWbxWvo163zd9e0
 JCcH3UPseeWNR9VfRhDuR/6mmsiNx+UaxUPN/zgGK8Ko0+hg1gKAdSBUuA152GYi
 Im6ZTUYMNVGIhITectR+ksNmZQwolKabCDJ2/jm4EUa44l/UmubPtwFVGy+LPUzm
 YO4yFijZC98ZwHV9GGvUWdpLuFk7oMLpfTZ10tyZgHdVq0HXNPuzuGqc8hX4bZAd
 nNYLNA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g0mndba15-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Wed, 12 Aug 2026 20:28:23 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-51c1b4d961dso2662971cf.1
 for <qemu-arm@nongnu.org>; Wed, 12 Aug 2026 13:28:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1786566503; x=1787171303; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=L4twhbuOYE+OQiSG5nk2uhYLdr39f2xERddcL38MXLs=;
 b=AsEDfvst7rxnsf9LsKsOtq2zFvsOdDpWuO4JmaOtIA+n1uoTzBCEMzHG82WGVojYTN
 Cwe4lh0eTrpJvELIvX85xd8qsAIge1uvYg8k2UcOEY0Ix8+Q4C0GPYnlReO97HbSuDyi
 he7swu3g6bsI54MSg5yb8z33J8ZWl41f0zLJ4/vsESWUu8HtxrKPJ+F77+C05Zlk1xpV
 6igH06Tj5GbrxP2yybasbUF7gE3UToxA96mrkhMKeRA0jXBfM/SRtvnIAFoQin+uiE3R
 KpG7lr/+wtWrmjGvkDndlCDXqVM8qct0T1ODSywzhFKJUmzdf8ozHom1Wv7cGq6GIDZV
 hPug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786566503; x=1787171303;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=L4twhbuOYE+OQiSG5nk2uhYLdr39f2xERddcL38MXLs=;
 b=Or/83F1PCnOlS/1SkB4SMygrux+pKN/0BOAZZkqv32rW3u/Eqst72Fups4QcAfQtYe
 l2NRAaMYv4r6oyfs93VgV+2mxdOEgtuVMxx5sx9ss2gXAphKBEFroLFlqHHGoay0Ov0T
 nHRcdp07+dkyHCnibh1UnqspeeuOarkHjU8qbSC2WG4KjDZXj8mlM5cduBvjk3OszOtK
 2v0hjYgke9bjR25v0KU97CcZFjuIPyfQtklj7RnhOwD6HVMVXCOp7m3cNbo9v+gtXWZA
 vrlkFvRX75cFgo3dAvhx+3fICiZZxIOHRfx80GEE0mtggvMpbPkN3miKn4mVu5peqD/O
 crdg==
X-Gm-Message-State: AOJu0Yzlb+wpweW0O3+Ggzr2sRjuq5NYUo/qWoSJe0x1fvtrT6ssiLXk
 YCItQx1Rj4sHdLORFHuTjLsML3paJL2AbIsGa7YHJ9Pez/L9C+ihAWreOiuiscU8zidjpeYCQ/D
 0Pr2+fgxMVmDKuh1VW67M8oRdtmXqG9TltwySok/2ZQRlXX8vwDhwYI0=
X-Gm-Gg: AR+sD133oFM9LGieDZUnRFkYH53rOGjIQ+ieKWlbcweDgdYXKKgbaoJMgEc6ocFefJ/
 MQSfQl1sqenaNStoeL0gD/o12hzd5Wy2gN27O1JsjAvYa9hHw6dTjrfgvWWq0MkbN98Z00RBhPE
 ujbJSuYA3g98ZFlPrkStpPqVZg1RsjRwbFdJW0alGl8eUV4h5v9fZeHIjPgxKhMJKIGsPf3zpde
 4BDagFR3RAcJUuv+KwupgioZrRpPCkCT/BH/Qg+oVgMXkhupmvRaEO/fq2SsT0iVQHbjSB4EbJ+
 Kkk04cp/3796d0QBEOPgrCm5RgBeq/GF7Ftuy15qCl9nDnt3dtTECwJza87bDBFHvnZydzv1T1A
 +oH6M+Wl9KYtNaAfCE1TcsgQ5YKO91CdH07I=
X-Received: by 2002:a05:622a:2cd:b0:517:63df:91a5 with SMTP id
 d75a77b69052e-52d74b9a259mr2816211cf.19.1786566502745; 
 Wed, 12 Aug 2026 13:28:22 -0700 (PDT)
X-Received: by 2002:a05:622a:2cd:b0:517:63df:91a5 with SMTP id
 d75a77b69052e-52d74b9a259mr2815681cf.19.1786566502254; 
 Wed, 12 Aug 2026 13:28:22 -0700 (PDT)
Received: from [192.168.69.229] (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4815a569c2bsm328204f8f.12.2026.08.12.13.28.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Aug 2026 13:28:21 -0700 (PDT)
Message-ID: <c776950f-0c86-47fb-a584-ac82e82d87d1@oss.qualcomm.com>
Date: Wed, 12 Aug 2026 22:28:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hw/intc: Fix arm kvm gicv3 selection
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20260812200308.289238-1-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260812200308.289238-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEyMDE2NCBTYWx0ZWRfXy4U7ghePJyDo
 OZP0ROpJhl53h72UHm4cohQkz/fg9gKvQ42nas0dCHlZAXLQ018ABLAqil3v3delQJRczdUe6Cv
 AKVF2DC7EHlb2N0Uhwec2o3624Fd0iE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEyMDE2NCBTYWx0ZWRfX3MPamCkskoQT
 VZy2Kb4cnA9+Pv3wj6kQSmzTXMTrZwZ63L/yLQjXsHvMIFGtVPCiPbc0XtXWUM1FQi9oWH42HdL
 cvdTFSH8ItPxbm/k26yrrZqEEYSkmdYE8juY2bNdfpmNGEHBBk2AJa0Lh35DQXabKzqMAYd5zf2
 b+Me6vmduVAgZoUvcH+7Yu3Dt6XbGb+KLhn9wfdr1aLPQD7COIgiackt+03UtSKS6twMW9nqAJP
 ePJj+Zihc4MXH/3n22A9nlaxOZ30wqkwjKGF38GHisIxvetmVSENoD/WVDGhbC9rXdPieQh9hO9
 /ECWxl/y4vuOb4HEYYjhNE4umjzLTF3csPE+B4mv/L6ZTr3/ywp44Rzek6ilqJpNUYI7UCzO9QB
 wRbsqnpRFQroAxWo2wQq0pXrYKGuUWYIH5nhTpLJCEcX94sn4gRNK0PxpnT+5Xy84n2ZpJWzBSs
 CHN8IBooJxsHmVUnEpA==
X-Proofpoint-GUID: G7Exyk4s33lI20peOknBV8HWvM9iSBgt
X-Authority-Analysis: v=2.4 cv=C87ZDwP+ c=1 sm=1 tr=0 ts=6a7cd767 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=KKAkSRfTAAAA:8 a=GLgtxZkTpiWVOBUrDW0A:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: G7Exyk4s33lI20peOknBV8HWvM9iSBgt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-12_06,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0 spamscore=0
 clxscore=1015 priorityscore=1501 bulkscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608120164
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

On 12/8/26 22:03, Richard Henderson wrote:
> While 39a8c3941e may have fixed WHPX, it certainly didn't help KVM:
> 
>    $ QTEST_QEMU_BINARY=./qemu-system-aarch64 ./tests/qtest/arm-cpu-features
>    ...
>    qemu-system-aarch64: unknown type 'kvm-arm-gicv3'
> 
> That patch did remove a test for TARGET_AARCH64, which is fine because
> it has been a long time since we supported KVM for AArch32.
> 
> Fixes: 39a8c3941e ("hw/intc/arm_gicv3: Fix ARM_GICV3 dependency for KVM / WHPX")
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   hw/intc/meson.build | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/intc/meson.build b/hw/intc/meson.build
> index a1401cb521..faf63a0145 100644
> --- a/hw/intc/meson.build
> +++ b/hw/intc/meson.build
> @@ -48,7 +48,7 @@ specific_ss.add(when: 'CONFIG_ARM_GIC_KVM', if_true: files('arm_gic_kvm.c'))
>   specific_ss.add(when: ['CONFIG_WHPX', 'CONFIG_ARM_GICV3'], if_true: files('arm_gicv3_whpx.c'))
>   specific_ss.add(when: ['CONFIG_HVF', 'CONFIG_ARM_GICV3'], if_true: files('arm_gicv3_hvf.c'))
>   stub_ss.add(files('arm_gicv3_hvf_stub.c'))
> -specific_ss.add(when: ['CONFIG_ARM_GIC_KVM', 'CONFIG_ARM_GICV3'], if_true: files('arm_gicv3_kvm.c', 'arm_gicv3_its_kvm.c'))
> +specific_ss.add(when: 'CONFIG_ARM_GIC_KVM', if_true: files('arm_gicv3_kvm.c', 'arm_gicv3_its_kvm.c'))
>   arm_common_ss.add(when: 'CONFIG_ARM_V7M', if_true: files('armv7m_nvic.c'))
>   specific_ss.add(when: 'CONFIG_GRLIB', if_true: files('grlib_irqmp.c'))
>   specific_ss.add(when: 'CONFIG_IOAPIC', if_true: files('ioapic.c'))

Yeah sorry.

The other fix I mentioned but never posted is:

-- >8 --
diff --git a/hw/intc/Kconfig b/hw/intc/Kconfig
index 636d00b7e88..1fec78f3bf1 100644
--- a/hw/intc/Kconfig
+++ b/hw/intc/Kconfig
@@ -23,7 +23,7 @@ config APIC

  config ARM_GIC
      bool
-    select ARM_GICV3 if TCG
+    select ARM_GICV3 if TCG || HVF || WHPX
      select ARM_GIC_KVM if KVM
      select MSI_NONBROKEN

---

