Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39518C61DC2
	for <qemu-arm@archiver.kernel.org>; Thu, 27 Aug 2026 08:46:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wzVkY-0005US-0o; Thu, 27 Aug 2026 04:46:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wzVkS-0005Tc-Lq
 for qemu-arm@nongnu.org; Thu, 27 Aug 2026 04:46:13 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wzVkQ-0007YK-GE
 for qemu-arm@nongnu.org; Thu, 27 Aug 2026 04:46:11 -0400
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67R6RLVg2709002
 for <qemu-arm@nongnu.org>; Thu, 27 Aug 2026 08:46:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 o8gAehL94WGGN1MYx9UOXC1P0U6rV2eAzOiDC442g08=; b=T3HddhlTbANOJj00
 HThYhJfCvbWklEh1yY2jKb33k9RqISF1w0Oeu7QJ9eKCLoYdT1GpE/WaX0wX5j78
 lu2O+O2CbchLjUbaD8huzphnpkeAkvxnuUxFUx/13wQJR0Mi8LRFp6Ml/86vw9/U
 0+f8CWGUPqzpKqz8nUYUfmQQsk9gYqnd6Cs7t+celcjrwvwQxVyFfL/Zx11GLpud
 U09WX9lEQueinKm1HPaBlqNUqZBQr/Aws9w9l0/Lk6izsd2RXMkAT0CEZr6b/l67
 8smF6OaEH7QDSFFmR5MlPCOn+sNvrr06SYJjqUVgsFuGwLNhZGj+wnxozg0yCKeV
 ZibtrQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ga4fwjy2n-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Thu, 27 Aug 2026 08:46:09 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-51c1a9764f0so19048961cf.1
 for <qemu-arm@nongnu.org>; Thu, 27 Aug 2026 01:46:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1787820369; x=1788425169; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=o8gAehL94WGGN1MYx9UOXC1P0U6rV2eAzOiDC442g08=;
 b=blchUnDVY8aCdogN7XboJoQ69aeM4A5/wgjKAXCvo9wri/63h1vvVL0dkLmeylppbh
 a/dX8ukkWP283OqR88EKuiuh6WWSjR/0HS4CwCGkYppPlIdHga7VwmXl+vmtPjyM6LFf
 1z+x0ANRbG42v890yPBEo1xk4vTsYRGGkW32OywP7V+XIpre7IcSObVkffBou48NAgC2
 w3mteCplOJURgk/qMcKk8hf5m+axsQ6DG3TJUjCNAKnYzqIe8ftayxRlHWi61TAJhdTg
 /SslRKuiK7PpL5QhIDuj/wPrdoKbtXhEqVhN+0zjcNQ0JpT+K+XJfGxCfJMqeOCVgWyQ
 XYKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787820369; x=1788425169;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=o8gAehL94WGGN1MYx9UOXC1P0U6rV2eAzOiDC442g08=;
 b=csoC9/p+Yk//tMZ0pk/1U681SfEFEYlGUvBXgw8QuktM9UrVFLmHBxNpeY4/ez6AC6
 Od1qmJUyBfdEHlA8U+eJbCYaEsK1HaMGjzFh3QAHQXyl0JrdwTMQrEzrmkQXFVk8JbiT
 pK+ammnEalWMnF6raW7+m0GpOUBQPztlYHHgwmy0bR/BYV+sGnH4UBq3vtlqFMZEX95U
 kcyYTEqwqKf5MowWZtDXjGwm0oIf0DyKmDMTDFJPbH8WPvtAkfWtLnJdGPP8y448kn3n
 eszrszhkVCgNQsSfY4QjZUDfTAv74avlq55L7HIMkogoOlb7kpNRWG3sDKOJ8Mnhummx
 b0tQ==
X-Forwarded-Encrypted: i=1;
 AHgh+Rp2LBmVwG6JaqvLBYSSXGvn70zUw8ExZ6KYfC8h7JYjfFKp+9PZ/tew967E3a0/CAZ/ZeZH8Kf3lg==@nongnu.org
X-Gm-Message-State: AFuF++lGks8ukz/LJEhD80ne35icq7W8Sjuqnpmmb1vZamGRdR1Fv0WI
 EFoQwtSM3xQjCw2PfeGqhLPUPVW0LSjoCReQ1No3sxvwYSpE+DTTp8YmHZsdU/9GQ/Y2SLrEgp9
 G87iXI0UfxDSXi51aG46nxD/EA/YRz5/eQE/B+idMlOoADdhrja6admg=
X-Gm-Gg: AR+sD129VBx1EKVfR9O/3+rne+ziT0YIKNkFlI51aLam/a9RAQGc4ULuuPSpJF0B9r1
 h+tzcwoQ8Z0FT6/8qPI47w6lJLpUjaYN577gnOTyYXX8kWvJvSdedFZB6cwCn/BjwzKFHQrdU91
 c7xpuq69KkMvR1p9U62DS7alyMtlwdBRwVJTfbbw0XugjIEAVpoLjID59AEKwS76yZtuHuKwLPG
 a1VP7C3fBaHBXxmPDVMC3UI3lEa5B/S5zOkbT2n0AknhaZ1VMxRVcwjDoUItVKbb9vvRCWASIbN
 j3sYzKPfO+7C7qWSOoxBMaTvMI/Od8Fyr8AhmQhIneMGGpx9zXiMmd8o0Y7599GIbYnQcyZE0Ud
 9Gq5LsAQ437/h0FpqKVhTSx8Lxq6Zr6qIfATaIKhRvG7Ibk2q
X-Received: by 2002:a05:622a:5a19:b0:51c:2022:cef5 with SMTP id
 d75a77b69052e-52e42344bd3mr159220921cf.26.1787820368658; 
 Thu, 27 Aug 2026 01:46:08 -0700 (PDT)
X-Received: by 2002:a05:622a:5a19:b0:51c:2022:cef5 with SMTP id
 d75a77b69052e-52e42344bd3mr159220721cf.26.1787820368316; 
 Thu, 27 Aug 2026 01:46:08 -0700 (PDT)
Received: from [10.254.188.74] (164.170.88.92.rev.sfr.net. [92.88.170.164])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49b4d08d86dsm33940955e9.12.2026.08.27.01.46.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Aug 2026 01:46:07 -0700 (PDT)
Message-ID: <d12e77d8-e9a8-4a79-a952-06853b7162e7@oss.qualcomm.com>
Date: Thu, 27 Aug 2026 10:46:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 06/12] edk2: rename risc-v firmware builds
Content-Language: en-US
To: Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Ani Sinha <anisinha@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-riscv <qemu-riscv@nongnu.org>
References: <20260824164751.1700783-1-kraxel@redhat.com>
 <20260824164751.1700783-7-kraxel@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260824164751.1700783-7-kraxel@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: jRGCnJZfXaCjYf7lkm_BWAOq0RxbYc28
X-Authority-Analysis: v=2.4 cv=OtZ/DS/t c=1 sm=1 tr=0 ts=6a8ff951 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=T/Q9W4kDmp1FI4VDxy1skw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8 a=1tSEMpTH9XP_W59IOagA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: jRGCnJZfXaCjYf7lkm_BWAOq0RxbYc28
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI3MDA3MSBTYWx0ZWRfX6MoKb59fcuIo
 AfXe0p3TbUdDbDiWrfHidmRf59uxhlOco0E5lRnWkP9NkVbjesdTdGgudpw/relU820mz82Zdh3
 HYuu+vLjpgSJElGoJqrvyhSbQLkYxu34o0ii+Pyx609ww75O1ukFv8Dt0yvBd9Cjw1jS/PzjHNf
 ta4Xzo2O99bFmhxcCQDWGVejw42UY8jKvAi7eMjCtOrKdP7gvZy5gMJnoaveyWq4z15/EmqfONz
 7M2/rL3xgoJlyGe8L9auI55IHSqw6RKrMGP8Pjanuth0yZSL5zsER1ltsWMhwTX9t8ctse76I7+
 3JszpNHTsjaROX03Tl2xUokIOegUbEBBjwQ8kiSEWz2AGH+S//ytaHyLr+v1JHnlsqPAJIlctZA
 L3baq8yr66mbdlBgkxKzTJA6II+k1UUzR7w/RJPvrppQxayvUdhfM+6QeTU/s5gtuWHF4SZlKh7
 LjGpuTYu6hpYOR4V/HQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI3MDA3MSBTYWx0ZWRfXzf3VA3kgdDXk
 v/LOyf7SS5dOpsUI1jX8BwQvAOUFNhjBpf7bPZOv1yevKpUsjCUqG5t45ILIbCiWKKzsr4hEI/B
 UM+zcOwDvjrtS3xQqWu76rRGfbp7Uys=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-27_03,2026-08-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 malwarescore=0 bulkscore=0 phishscore=0 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608270071
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

On 24/8/26 18:47, Gerd Hoffmann wrote:
> 'riscv' => 'riscv64', for consistency with the other
> architectures which all have '64' in the name.
> 
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>   tests/qtest/bios-tables-test.c                      |  12 ++++++------
>   pc-bios/descriptors/60-edk2-riscv64.json            |   4 ++--
>   ...2-riscv-code.fd.bz2 => edk2-riscv64-code.fd.bz2} | Bin
>   ...2-riscv-vars.fd.bz2 => edk2-riscv64-vars.fd.bz2} | Bin
>   pc-bios/meson.build                                 |   4 ++--
>   roms/edk2-build.config                              |   8 ++++----
>   6 files changed, 14 insertions(+), 14 deletions(-)
>   rename pc-bios/{edk2-riscv-code.fd.bz2 => edk2-riscv64-code.fd.bz2} (100%)
>   rename pc-bios/{edk2-riscv-vars.fd.bz2 => edk2-riscv64-vars.fd.bz2} (100%)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

