Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B828CD98DA
	for <qemu-arm@archiver.kernel.org>; Mon, 15 Jun 2026 11:54:42 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wZ5th-0007tc-3R; Mon, 15 Jun 2026 07:54:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wZ5tf-0007oU-Jx
 for qemu-arm@nongnu.org; Mon, 15 Jun 2026 07:54:31 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wZ5td-0007K3-VO
 for qemu-arm@nongnu.org; Mon, 15 Jun 2026 07:54:31 -0400
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 65FAoKck3972218
 for <qemu-arm@nongnu.org>; Mon, 15 Jun 2026 11:54:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 VQvB5kFtqmEaOkyki9927Tea8lRdNOqyDVILnkA59XY=; b=B133J0VOf2R4Dr09
 GmZBsXjAjHPv/HMUz6S62yGR9L+2JgQD0C8ghwsqHljb48nrWpQnp8D6/+R/+jcq
 DHRH7XxB/6mTlHQ6wfsf1UsvasJysPvURqmqQd1iL7pe3QMTXCLr0ZgFg12yExzt
 b92uoH+ydHUZPTp1Xk3BIFoZWmqGcrKvwWVCxjmoH8PvSMw96Ip1phc1+j+40G4P
 NANpOHl0gBiYHe874nu5uxRCyIlSBIuTa+R4cuUvTFlU7Rhm5eBmfDcANpoOIl8d
 Lj0HwXTgynrnK3Jio3m0gXT2KgPPa09W1ZAd6sWEmUvxJmtrBN7seMe1vfWbOlwl
 bH3Ajg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eteyd8fwp-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Mon, 15 Jun 2026 11:54:27 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-9157d38ab37so320694185a.1
 for <qemu-arm@nongnu.org>; Mon, 15 Jun 2026 04:54:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1781524467; x=1782129267; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=VQvB5kFtqmEaOkyki9927Tea8lRdNOqyDVILnkA59XY=;
 b=W26WVLnp6W4N7iHsD4kkmZf6cAKG/K+YKs++Jgj4joWvt6hCbBsA42o7u6zdY3v6Cd
 dPJrFB0iV+9R2a2B7hPT4HJ0CvJtzW5zktB7cjIHIInembgt5Vk7gSwgnIfudC6HzkXc
 U2NGreQ52cuzDsBc7BFWhz/LKLxrDcW4r1jd3nK225V3JTGEQmYQfyJSBV48MfQoX90/
 ujOM3+Jg9Qsj3E6Zk6ocX2pGdIwbH4dNnde/jOq0xDIAkjj4Ct0bMOGLdeG5Il6lLosn
 wifckP0ce68iGX43vkEpnj30FIkL1e2w2FJEKTkPp5tJYV11UQrMU+rNaZE7HVBmtwWM
 3eTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781524467; x=1782129267;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=VQvB5kFtqmEaOkyki9927Tea8lRdNOqyDVILnkA59XY=;
 b=Ib6l75QpVFUKWIkk9toTZy0olm+OFpTXoFEPquW3WGN4aV2O/ZKB9c0Twe8vKbDvOy
 SIF4juJTt3vkY5pA56QctRVe+yCD76yhIwTMLL6E4I6eD229HaqUn4Qe0MZ7hTe/9NzK
 axuM89rtW4XV8NyShwJjZ1bhwFrmIZV63OYxT/8sd7SwJWhMa0ctxfOb/4Lx3p4RSpv0
 d2mXL8J1wCFBOytZYkxle1+Enxlb+Q2K1U4BKwaXw6ZrHwfdIi7qrk1JvkaSs3zQDogU
 1HSrYxh7+uIlQliwz73QmTV0BY19DeyZk1vWp2Hgbjroq5O3ZmiUNP06DFOqNgdhgpnj
 fx5A==
X-Forwarded-Encrypted: i=1;
 AFNElJ+D0JVVm60jqnl59qMao3VvDLMxPur+ChqFagqtOtclkFDJSYlTaKPqYvHj074CPcYJtslTxwpAYA==@nongnu.org
X-Gm-Message-State: AOJu0Yw/5UktO5tt0t0M5eCNViV3NCfgryikJ+T24dTwiYCBQuxIBZiy
 V1QoOtsHs36uDGG49QJ3XWMPWss0f/Xl0HSyr1RCydfoFeSx/cfsTkiBWr4XuJVJ4lYvMxqiLPR
 Yo/Jq4G/BifMJLHNEgKZoZ5+XPf4mwKa6ge8mkGNiHsg0lh4/bq5g0so=
X-Gm-Gg: Acq92OEeKDYUlh8sgBAXf6tvVWbTrDm2dhB9Y8+a6DMUm320CfEhCT191ZZnOtQSOTJ
 qy1cbGChaQJKHbNmC0rkn3A9OS70VkgCfSa+O0bPlyl0Gowio3cZzUUkuWk36V7ndELrL3oUIYH
 7TydQmVklqxzTgCCnJLHySckfBOMLoUcVeNHTDTLadN/426KEbFRjWwMeG4EaOArYukHsS1NwEv
 rn3uMvQU2IONC8rDdBojby8dtGXfHHJN6xpT2VzUojRmP+FtqTT914RRLzPIio5SvtSpsNO34Bt
 cXW1C/XohjxLxH9GaM6cbAV1eTcINXSg3fipMfXQ5ywCzEuW+fB923y8DlA9poHrhPUpGKxnfWj
 Wuftuoc7+X5auR6emdGT7o75h2l2Jh54TxZJk9EHxS7gFjvIONDp02F6RShki+1EG2v+75+8T
X-Received: by 2002:a05:620a:3198:b0:90e:2f56:2f0b with SMTP id
 af79cd13be357-9161bac7a1bmr2262417985a.7.1781524466780; 
 Mon, 15 Jun 2026 04:54:26 -0700 (PDT)
X-Received: by 2002:a05:620a:3198:b0:90e:2f56:2f0b with SMTP id
 af79cd13be357-9161bac7a1bmr2262413685a.7.1781524466299; 
 Mon, 15 Jun 2026 04:54:26 -0700 (PDT)
Received: from [192.168.69.214] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-bfdb44209f0sm459053666b.6.2026.06.15.04.54.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Jun 2026 04:54:25 -0700 (PDT)
Message-ID: <53d0e9d2-71ab-461e-9936-86a3f6202dde@oss.qualcomm.com>
Date: Mon, 15 Jun 2026 13:54:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] hw/intc/gicv5: Define and use GICV5_PENDING_IRQ_NONE
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20260615105029.2898872-1-peter.maydell@linaro.org>
 <20260615105029.2898872-6-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260615105029.2898872-6-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 1Z01vnJy-FcCpN2sLOIv1PIWqGX_9CMW
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDEyNiBTYWx0ZWRfX/O3HN5P5C6yT
 ZqLThIIGHCXoQvQWl3sOH15pINX3rOQy46XZnqRy6dsQ+VCxyDK0iLlHvCZgibQHOSQrUkVSict
 oqFiNxl3aG3sGg45hAdylhoLMv5ZYEk=
X-Authority-Analysis: v=2.4 cv=QrJuG1yd c=1 sm=1 tr=0 ts=6a2fe7f3 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=1tSEMpTH9XP_W59IOagA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 1Z01vnJy-FcCpN2sLOIv1PIWqGX_9CMW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDEyNiBTYWx0ZWRfX7j6QhW8Olg//
 +zUW0jU/AU2hvkFbbu1wQp+Ppyh1mUIVwommwKTUBPz1jZ87bw+ZR/d7QlS4yS2gU45kWjUmajW
 o7lxFsE3h9TrSSgfGrWADlHam7MXV32vm3/l6xtBn+gLXPU5uHfzrEDOD0+43vSSRdqmcuPvAKl
 exf1URaR+9fLcbBPthIzOcV1QDE/Gbx+Q+xr0GcyQpf6FukK+UEpZRLgcDplPTgtzcd+x41r+FY
 9SxXRjuMDRHsSc7MCO/BxMLFPVny7hCiqeTMwvhr8vTE90FvOa6mEDb2RJEbL320OE8cK6JzPMV
 bEE+fvd5Ih9g2CK4xgSHhImPwXmcD0iyTOXAddMShzSo1EsWT9JDcJaUt0nPF2wKj1K/pvla41A
 UNZZilmj3j2KmxPsP13efH8BtfRHKs5uKrq+pzJdjuVdnPWQjYyFiyZcqbmdevfewvMDmRw4Gkt
 dfHtOuylXs42pcDI1pQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_03,2026-06-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 phishscore=0 spamscore=0 impostorscore=0 malwarescore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606150126
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

On 15/6/26 12:50, Peter Maydell wrote:
> The GICv5PendingIrq struct representation of "there is no pending
> interrupt" sets the prio field to PRIO_IDLE, and generally to avoid
> confusion we also set the intid to 0.  We want to return this value
> or initialize some variable to it in several places in the GICv5
> implementation, and the support for the virtual interrupt domain
> introduces more.
> 
> Define a convenience macro for this special-case struct value, and
> use it instead of opencoding either the structure initializer or
> explicit assignment to the two fields.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   hw/intc/arm_gicv5.c               | 6 ++----
>   include/hw/intc/arm_gicv5_types.h | 4 ++++
>   target/arm/tcg/gicv5-cpuif.c      | 7 +++----
>   3 files changed, 9 insertions(+), 8 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

