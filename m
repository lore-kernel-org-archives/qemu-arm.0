Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59936C43458
	for <qemu-arm@archiver.kernel.org>; Fri,  3 Jul 2026 09:21:02 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wfa4i-0000gj-HC; Fri, 03 Jul 2026 05:20:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wfa4h-0000gO-Ad
 for qemu-arm@nongnu.org; Fri, 03 Jul 2026 05:20:43 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wfa4e-0004nM-LX
 for qemu-arm@nongnu.org; Fri, 03 Jul 2026 05:20:43 -0400
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6639BoVG3694367
 for <qemu-arm@nongnu.org>; Fri, 3 Jul 2026 09:20:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 lTRce2leYMpaLM7LPXBL6Q6414ZzO7xEoxmkUcr0Zr8=; b=JkPKv7Zq+TA/1ud1
 fhrR3Lt0ZEapPRS8zTnmYyWtL6GoZHDWDsj2CiaPYdUk2PR8/m2bckUCoMQRSrRi
 uVw/njIIAkF9XN/4U1LwcNHcoW6iwm/7g6qhbkjeMMq3cRoQrHXhiZmVodWOcKMN
 /S/BDJcgp6D0qr095et4FBYaIC4cXA9qfnCH6UtpE2VOypNyXzcJpEs0aBqXJV0H
 fjlanHfOTKL0Fr1f6WV56L7C9vFBfdxFnUTFq9qUgvPPm7VbjBvj/jFsX4LA5SLL
 qS34feFx1cJKZ9smXipUqIPWiEbDA9FpDt37V26rrLhcD4AGTeca8nVxp7/Ccccj
 GsfRIg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6a848123-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Fri, 03 Jul 2026 09:20:38 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-92e82060977so38835585a.1
 for <qemu-arm@nongnu.org>; Fri, 03 Jul 2026 02:20:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1783070437; x=1783675237; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=lTRce2leYMpaLM7LPXBL6Q6414ZzO7xEoxmkUcr0Zr8=;
 b=OOnGRY94nbCrbDLiySP2zxfiSylVEWEEnNimY/rVzaLPgz2avIzZ1vcqh6U2vydHCm
 gCiFbfkB/pRZAMlExuiv6rbnFySkzV59wXqN9AYpj7lbjGfMKxM9vwdCyyufOOBwAwZO
 3HESgulo3/nLuFMNFPoMepKZnvfsnl6lx8m3P/nflvwvS6jRWCBDAzJ/NuueXTQIKh/u
 w6yZSDLJHjoMVk2tKf3K5T4EgS/myw3uTz3chIY+9JvU+qmbceVgwRhPZHLJb8GOrd19
 +9DASQLZ1Kcs+XHPTnlp8wZGVcFbMWk1CFgEq1lTcUvYN4l/+OzSepk+9Hw7HPi3Yc8+
 ghNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783070437; x=1783675237;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lTRce2leYMpaLM7LPXBL6Q6414ZzO7xEoxmkUcr0Zr8=;
 b=XtZA5po/w6rRfKXNK6Ofv4GC9tUXuDzEwAT8HzTO3UCe+78vez1Akgeqn600CDyUgk
 elIsWkbxXkDSSmlqMKqptKPST4dnJ1rut1Elj8HAnaO5cOwUDO/qxkzF5hbpf0A+Ipq4
 bcdr6X7iUqHPa3uL6TQydLr3NAoVEO/iKxrFM8//YE0ZIOB6mJ2emlRqaMIFuDjzSLdY
 kSalVi/eTRBmh05BwZSAGqLBBXHfqGskXbvPRdANHq2/jthjpoK7RUA8mH4irpTx/swq
 hAEKQGkC1yhDN9qTRPVxzGpiQoCaAoSFy0tGLuNo9yweOG/qzuIeoOI4F12JodTqM0OW
 zGTQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ8tea48U7c3xj7uD2Mqgq/fj77MX3bYYhV7z35hkRmo3l+nQlcHY/OS+lUDzRKTMKYK2CTxK+Iu9g==@nongnu.org
X-Gm-Message-State: AOJu0Yw9BfxtpKZr0N8nucinIu+Nbg7z3Q5lya2DUqBaWtj4Uqefnlm3
 9MFlnBjyZhvkAuekKHmR0FLbzApz8PZM27wugwkC+HBtDHMYqAAhE/14iKaJnQcAPx87Xz7hlRx
 08zOeRWsojFliHunn2WngtbAGSBYbC3T48mQV8csrbLEJ3iefw8JcmLA=
X-Gm-Gg: AfdE7clHawBIgmV0+F9uleSWLiaddTD1nw/FJ2oC6FGeEFHWlkcwFW2BkBtPNjZlAX4
 RKEKfavuAKBEQXFuNfYDOBrNraSD6g6GPvx/Rr6GkP4CfB1X90/Y3DLVeLu4t0ltgZKP6CMTLkI
 vSgKOspzNzd+m2imi1gVriMd4xozfWP+Lv+7ut6knjxwm9M5iCZglfI7Pa0O6XH9vp8UuELF8iW
 F4BgzfzAnoHy085wQmjwJCp6HynweEuno+3oDQ3tbFUDYl16JZ87bXCWNQGtY/PbYgaQuu3dWaH
 enyz0lvAcB3tLq+3FtNe6qjg4bftlvuVpWi3iBQ0XwCAu2/G1OFbUlOMR3fiJ2QcNc+1Z71D3kb
 U88UWh6Pq/OwLXc340M7ZcmJo+HAQ795ZAE+v55JSyzbq7+774BicEQFDmPCDTQ==
X-Received: by 2002:a05:620a:2b94:b0:92e:65d0:1cc4 with SMTP id
 af79cd13be357-92e8b543ba1mr401425785a.30.1783070437353; 
 Fri, 03 Jul 2026 02:20:37 -0700 (PDT)
X-Received: by 2002:a05:620a:2b94:b0:92e:65d0:1cc4 with SMTP id
 af79cd13be357-92e8b543ba1mr401422685a.30.1783070436850; 
 Fri, 03 Jul 2026 02:20:36 -0700 (PDT)
Received: from [192.168.69.212] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-698acf25f4dsm2091281a12.8.2026.07.03.02.20.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Jul 2026 02:20:36 -0700 (PDT)
Message-ID: <dc90bd46-3740-48c0-b484-0ec2bf322923@oss.qualcomm.com>
Date: Fri, 3 Jul 2026 11:20:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] hw/arm/smmuv3: Fix off-by-one bug in alignment
 strtab mask
Content-Language: en-US
To: Eric Auger <eric.auger@redhat.com>, eric.auger.pro@gmail.com,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, peter.maydell@linaro.org,
 berrange@redhat.com, skolothumtho@nvidia.com, nicolinc@nvidia.com,
 nathanc@nvidia.com
References: <20260701091209.2860306-1-eric.auger@redhat.com>
 <20260701091209.2860306-2-eric.auger@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260701091209.2860306-2-eric.auger@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: KSICxX67o6NcecQCsfi2E5C5ET4ggDv5
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDA4OCBTYWx0ZWRfX+A/C7wivWaBA
 8EmS0Dc3uV5U51gzTBhDHWeU7baUGNMIFYMBd00FXPpVuoqr17Pp2W4X6iIgSibq2ItfMwo9ZdC
 Ce/ysHBsruoB0rZmcBKK4CiIYa79jzo=
X-Authority-Analysis: v=2.4 cv=a6QAM0SF c=1 sm=1 tr=0 ts=6a477ee6 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=20KFwNOVAAAA:8 a=Kcw0qKp_e-QNtmgwFuYA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDA4OCBTYWx0ZWRfX5Gwt/I3T3eyH
 cPIZUR6eblKkZg4+5LzSjzXrFMaIqKbqXaKH1aldGiz9MIpj4sTiiFfnrL4soT8ekquZ2jC5+0h
 KqpOgDgExwxO4uH0WBhRohoSOX4Kp1QP6joE3BnqWa5G3tYCiwDAeAxAwAWkTRzNSwL90toHZ0T
 uCU0FZ+PKYUt6WwjRievLuPXvQr9my1MTvmu78zzcramFLkwasm39YZ4lgQVNIIf8egLJ9YnA4V
 7uXHj+QVoIFQF/T4fudjBsb6Wv18bnxlp3EHtw5jVbbjnGj2T71CLYKOnIqsPDXzGsKE6WXdxM/
 zT7JXeOD0uMTNFhEyHeNwc5PF0WN7Pg6uNuozP5VDQZoID63lne73GOW0KPKSUs5D80tSIkkTCK
 k1CyX5n5LgSe+HuTzRJNhrQb7QKh2du14/XYeE0m7T2CvrLIuz0MFKvT92U06u71V6SqqNCRA/w
 fb1/nncUfV7CWePEOTQ==
X-Proofpoint-ORIG-GUID: KSICxX67o6NcecQCsfi2E5C5ET4ggDv5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 bulkscore=0 impostorscore=0 phishscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030088
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

Hi Eric,

On 1/7/26 11:11, Eric Auger wrote:
> The stream table base address needs to be aligned to its size.
> 
> With FMT == 0, the spec says the linear stream table base address
> musst have ADDR[LOG2SIZE + 5:0] = 0. STE are 64B
> 
> With FMT == 1, ADDR[MAX(5, (LOG2SIZE - SPLIT - 1 + 3)):0] = 0.
> L1 descriptors are 8B.
> 
> MAKE_64BIT_MASK() second argument is a size and not a shift, so
> there is an off-by-one computation.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> ---
>   hw/arm/smmuv3.c | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
> index 5e5a6a960c9..38aba9c0af9 100644
> --- a/hw/arm/smmuv3.c
> +++ b/hw/arm/smmuv3.c
> @@ -664,7 +664,7 @@ int smmu_find_ste(SMMUv3State *s, uint32_t sid, STE *ste, SMMUEventInfo *event)
>   {
>       dma_addr_t addr, strtab_base;
>       uint32_t log2size;
> -    int strtab_size_shift;
> +    int strtab_size;
>       int ret;
>   
>       trace_smmuv3_find_ste(sid, s->features, s->sid_split);
> @@ -685,9 +685,9 @@ int smmu_find_ste(SMMUv3State *s, uint32_t sid, STE *ste, SMMUEventInfo *event)
>            * Align strtab base address to table size. For this purpose, assume it
>            * is not bounded by SMMU_IDR1_SIDSIZE.
>            */
> -        strtab_size_shift = MAX(5, (int)log2size - s->sid_split - 1 + 3);
> +        strtab_size = MAX(6, (int)log2size - s->sid_split + 3);
>           strtab_base = s->strtab_base & SMMU_BASE_ADDR_MASK &
> -                      ~MAKE_64BIT_MASK(0, strtab_size_shift);
> +                      ~MAKE_64BIT_MASK(0, strtab_size);
>           l1_ste_offset = sid >> s->sid_split;
>           l2_ste_offset = sid & ((1 << s->sid_split) - 1);
>           l1ptr = (dma_addr_t)(strtab_base + l1_ste_offset * sizeof(l1std));
> @@ -729,9 +729,9 @@ int smmu_find_ste(SMMUv3State *s, uint32_t sid, STE *ste, SMMUEventInfo *event)
>           }
>           addr = l2ptr + l2_ste_offset * sizeof(*ste);
>       } else {
> -        strtab_size_shift = log2size + 5;
> +        strtab_size = log2size + 6;
>           strtab_base = s->strtab_base & SMMU_BASE_ADDR_MASK &
> -                      ~MAKE_64BIT_MASK(0, strtab_size_shift);
> +                      ~MAKE_64BIT_MASK(0, strtab_size);
>           addr = strtab_base + sid * sizeof(*ste);
>       }
>   

Maybe in a preliminary patch extract this magic '5' value to a
self-describing #definition?

