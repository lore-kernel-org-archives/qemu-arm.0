Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D6BDC43458
	for <qemu-arm@archiver.kernel.org>; Mon, 13 Jul 2026 11:02:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wjEQS-0007Yo-LF; Mon, 13 Jul 2026 07:02:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wjEQR-0007YG-IF
 for qemu-arm@nongnu.org; Mon, 13 Jul 2026 07:02:15 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wjEQQ-0005J4-2r
 for qemu-arm@nongnu.org; Mon, 13 Jul 2026 07:02:15 -0400
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66D9e20W956127
 for <qemu-arm@nongnu.org>; Mon, 13 Jul 2026 11:02:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 drB+GG8NgNwugYA6Uxxh4gQQaa9y7YYwX/UZWEPF3tY=; b=o8r4aIoJmUbc+a1/
 f4OQMQFKWKaLDFtoaihHQcF7HqCisW1RMVuOe9FoCO2aFzHtIyh8eyfyxTVdmRQP
 ECjJIuBhEQCJEi+i1NLedYjqejf/UeTdR89lqd6indoTNDtaap7zmwzu8h7niFWf
 GY4WfELtibIINGsgTxpK1zxaoGqvvdxciKwF5aPCrtJ2bsQ2pQR58zRJjcidmFuZ
 pbmmux8JALzfCINgsndfRnhz+ec3hOFa84NggJCu49J3Ucu8vy1sdTH54/oCXmSW
 fhdf+8bwk3Co8cZXMS2Q8XKQl1ZzHETQbQngpD3LgqIqbkXz3NVSrj3ANP0oLhq3
 flUgqQ==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com
 [209.85.221.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcwk9r98v-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Mon, 13 Jul 2026 11:02:12 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id
 71dfb90a1353d-5bfc75c9fbfso2000108e0c.2
 for <qemu-arm@nongnu.org>; Mon, 13 Jul 2026 04:02:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1783940532; x=1784545332; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=drB+GG8NgNwugYA6Uxxh4gQQaa9y7YYwX/UZWEPF3tY=;
 b=Upn/THC9ndmkZX6Qw3M2QSwbVFCfl9k7uXVdgwWBCozrN1ye9RUAlM1vRNhRtTy/P9
 zt1Pwg7y/6g61R9mrOsxNzvou4Medupi/NlP6uz0qjFABxRFtgBzHSpkrEyRgfFEJICe
 FLJDLHvcOjhsLO8HuZWz+wn++o15gseYOf82TKIGQigFeU8bKOcdPykkif9DfDUgU0Y7
 M8fFvBIbmE4VLudZrj5ztF472DC5+O8Hyhp7ESaj7cdDl62PXJ47NOkwe3JOQm/v70W+
 d3cjzHYpUgTFEg3sI1Aj0nl5ku7tf7M3NZQ23ICGYIMKSVb5j6XABeEq3l6oT0FMVCLA
 4QdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783940532; x=1784545332;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=drB+GG8NgNwugYA6Uxxh4gQQaa9y7YYwX/UZWEPF3tY=;
 b=H6dhSkpKUau8XOtcE0DM+2x4TwrGJPrtO4PRRroqDXIAuZ4CPrbs+6sHiVStiow67r
 RiXOPT7OhVj4+AYNQEuynBoVneyu5NrodBb/2cLnnWySkuKpRCuLfARvjrqjQBrM3m+K
 aeAjTgY4/s77m5lGz+LhTSdyg1ghV+CebLFwHiiGaw4WTsyFJ+SSpwQuxNi4Y/FdvnHZ
 WT9PykiX9r5cbKoRAvS81pbssQGmtPZtRaKDme5AI9joAA49BclVc2V1RzRJI+MYjSVp
 gCQkM18N625OvEBlfremJWyacSYKyIkJ/imIbOtuw02AQr5roA1B3yCS+E2Dxu9YFPVe
 hODQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RoSMx3AU+xNHMyK+39NGWW224ETM8rnA7zGlIClRBPkrKYOR5AolSGfg6jyWH0RtGcazSCujd9DAA==@nongnu.org
X-Gm-Message-State: AOJu0YwPl89TbfQanTx99YXEhPV08WDjfNuN+ffvO7jmkbGdcSTe5JLb
 KX2VYGDI8SlHVq60sMxb6iqcp9P4RCBrJj5MkQm1Gj/najxjTuK3SBtUr2oBTpdKs9zzxmp5Lr+
 l9IPYTI0DQpjdTWWCAoudEBoydyHoQ/ows1muRygQtDD6gKOr0mMtz6+t28hlWnM=
X-Gm-Gg: AfdE7clEu61yrRbmH7w3tgq0qBgpiAJwteOUXLkDnLARTI49n+bj0hc8dCBCv15KnFF
 u2Rdb8AOiwHhqcGlpHNnldZOkfpDGw1YtrfvaW3PtrgdBAlJhITcdnRXEO8of21Za/MYxpNcmht
 JtbsqvKXf7IvcofJI1AQ7rA08wXMw1SbEgJQfAs7b/U8/EgrGyBdJ+ZZTndkmr7JFLi+VEFJhyP
 VOivTEK75C/DxRFXvX07TuZBJZ5RO+eCTbTBT7D9DiywSST3NssLJQz/EsXcYKbPk6fmsNEf/yZ
 uSLgPJi6GsxzJajUAiZz2YBxcqYGkbgmCpr7BaoZ2eFhANKCCUr192aAzPGNT/UdgeiBSAvCcbq
 zVYdbzZtkD52yIh6vs+zVE2ZpruYjKnyARTlCclvR/pFoiK7Vj6UJugICvcKblA==
X-Received: by 2002:a05:6122:20a5:b0:5bf:5edc:9aa0 with SMTP id
 71dfb90a1353d-5bfbf185dfcmr5206764e0c.7.1783940531949; 
 Mon, 13 Jul 2026 04:02:11 -0700 (PDT)
X-Received: by 2002:a05:6122:20a5:b0:5bf:5edc:9aa0 with SMTP id
 71dfb90a1353d-5bfbf185dfcmr5206727e0c.7.1783940531333; 
 Mon, 13 Jul 2026 04:02:11 -0700 (PDT)
Received: from [192.168.69.219] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47aa039b0cesm87000517f8f.22.2026.07.13.04.02.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Jul 2026 04:02:10 -0700 (PDT)
Message-ID: <f2f9ab6d-7ab5-4bbc-bc35-a577af4e953a@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 13:02:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/9] hw/dma/soc_dma: Remove unused mem.base, paddr fields
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Jim MacArthur <jim.macarthur@linaro.org>
References: <20260710105907.2570621-1-peter.maydell@linaro.org>
 <20260710105907.2570621-8-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260710105907.2570621-8-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDExNCBTYWx0ZWRfX7QmqEYVLlI8W
 BQ75pYmhVzJncsMygXLosB095ikSc6h5f6VzpS876Vn6iyd2Lb83Tne0Y4tudk4OTVKoEBgdXsp
 1EbHlGs50Ct0L+pRc9YjzhIXoLEHTQseQX1HvO3jOaIghyolAxiaaScXoDYJVn2EP4icaTnvLgD
 vGj9KyzHoSabO9pA/apgJA/qfw5neDtwPrEC+7Pc+GzCb5SAdbEt+VwYxvc4r/WDOuofyf/8rLA
 MQd790ofPFsxPo3cenFrNG+6jO5lcG9IJTJXOKH8y5nKQLo8JdNuE8SBl8s4iBIm6uPq904i18L
 Pfj4a/+0Gj6CI3ItLFK4b85SDHhlaYDp7L1WC6mq1uvJZvtUCvpT2WzR/tqLLccAuq2x3XkJ9kO
 obnNTBYtFDxLTGu29yE6g3VcxavTpcKwtLpUs3rNb3wBqVoTGePpCncaVomzuEso8YteJzFNTxa
 hgpsL3an8Bb+V0PikSw==
X-Proofpoint-ORIG-GUID: _BkXII2tqOeTvar_uEkxycNPEwGixcW0
X-Authority-Analysis: v=2.4 cv=UMHt2ify c=1 sm=1 tr=0 ts=6a54c5b4 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=1tSEMpTH9XP_W59IOagA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=XD7yVLdPMpWraOa8Un9W:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: _BkXII2tqOeTvar_uEkxycNPEwGixcW0
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDExNCBTYWx0ZWRfX6Nv9qbCKnXuQ
 zDUv2cQRlEo9RJ+PfbTnQpKFZV6UPUCf/bY8hlhrsBQRE2osDaGnkeTmeQ4CUF4cPZwPGn+Eou+
 Vw873rDH4N7Mu+8aqJ6e32hnpzmRgpk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 spamscore=0 clxscore=1015 adultscore=0
 malwarescore=0 lowpriorityscore=0 phishscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607130114
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

On 10/7/26 12:59, Peter Maydell wrote:
> Now that transfer_mem2mem() uses physical_memory_map(), the
> soc_dma_ch_s::paddr field is unused; remove it, and the code that set
> it, and the memmap_entry_s::mem.base and the soc_dma_port_add_mem()
> phys_base argument that were passing around host pointers to use for
> setting paddr.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   hw/arm/omap1.c           | 6 ++----
>   hw/dma/soc_dma.c         | 9 +--------
>   include/hw/arm/soc_dma.h | 7 ++-----
>   3 files changed, 5 insertions(+), 17 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

