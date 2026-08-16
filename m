Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C0C8C5DF6D
	for <qemu-arm@archiver.kernel.org>; Sun, 16 Aug 2026 14:58:20 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wvcJE-0006nG-MU; Sun, 16 Aug 2026 10:58:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wvcJD-0006mw-E6
 for qemu-arm@nongnu.org; Sun, 16 Aug 2026 10:57:59 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wvcJB-0002xC-UO
 for qemu-arm@nongnu.org; Sun, 16 Aug 2026 10:57:59 -0400
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67GDloqk3162507
 for <qemu-arm@nongnu.org>; Sun, 16 Aug 2026 14:57:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 yqfawEQJDSrOn4C4BgkXiKIN547hhB4JTZpFrYanSYA=; b=AKiCV5rX0V7CN8fL
 LbVoIhHuc3NRFRNQBcOldGjhvOFDBjDcCbe3vo9wk6kYfm/mMS+vXF/FxsvKMirI
 9UGZldHdldSNvM8nUKTnEKSLyGYPkBwZLTsADEAS97DhmuT+5i7hRoNfTeFsovBU
 N6ac2YOILdjNOBX/sPur+kCq6pT01MlD3vV0yI0AXm/Ebq8VICbF0cDxh6cgYmvB
 jyEhCud/g7MpSwLkAv3fsQUMGcl3FYbd7HpRjXPYOmXK+xwzqjFzeAsSP118XoQP
 A5IMo2A3nUWukpnuDrn4eXoKWop698nwYqmWlrYSVhQvA73rIjK9edZ+TX8qpg1d
 +kWO0A==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g2hd7ugk5-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Sun, 16 Aug 2026 14:57:56 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-930b571432fso246810285a.0
 for <qemu-arm@nongnu.org>; Sun, 16 Aug 2026 07:57:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1786892275; x=1787497075; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=yqfawEQJDSrOn4C4BgkXiKIN547hhB4JTZpFrYanSYA=;
 b=aBnbUCFF2jWClRjnV9AW0HLGDrcF9HtVTmGGGqlZxYmyeATS5FOCoQJ8aGbqPlXWY6
 eK+cwY80KeI/maJTI1DsI9JktGa+hgaQ4RkCvpolMr4KItHKO4rScm5JJtriw/XgNUiL
 NbD7k8G454dgP8nwNU9KkrkKcjK7xO+m0ZlmprU2SnLcJRHZ2cF1pIAmIjudn0YVi/jY
 hg8gSfjiA4/aEFCPgHUWBAGlFJQ9fZbHmbfjcbftnmUhZbu7Rj/jnVDw5PjTN8tVnape
 txldwPuys3dcga7aS1c5jWFzASSIDuA5npXCGN6oAerYm8YaT5LuDBLeUbDgAezIIhIu
 Dz8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786892275; x=1787497075;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=yqfawEQJDSrOn4C4BgkXiKIN547hhB4JTZpFrYanSYA=;
 b=sVl7GnYRi6wegSSXqSEoNhmh/20gbXTz1CTqSnS3BXYr3HNMvHjM3PchK1ue/8J220
 ANHStz+XNKjSLidJ04ytNSAM8/JySyGpEVI3vBKzsDP4zgk7fy2+8qN9cxDf6vLfdctW
 CwNDGiULLLkUx5os8Cd06rwe91qSZvsBTscB3a9aYlFLZwmrtcIBBFPAmuXa0PUNGCcj
 SMD3JaUqGD5DJqSo3hKIIn7VaP8XIHU4XIul51Viz0M9Il3IvPKhFU/KrXLulP9Ybi3c
 +gBrcey9He87Q9cwOTL58NpDsnEhflZNJMMVvomJmBtdh9HARBtiUODFjjXEtdXbHgkh
 XeTQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RqWYlV1+C/3n7wMtHYhKcx4ScFVQs/X7DHemuCwUjUQtdNuLWvFsx1Dy+MFcDeRuQw7XaFSF7KHqw==@nongnu.org
X-Gm-Message-State: AOJu0Yy0MYzmUcBlDq2UsXpjF7Jr4IbacOApPePestSZCBCKADej0lDJ
 pAMzlJhqdlLt1GmFjlgb9Aqv4fvP8ZHMsvsr3HkuUkslyYGeAT3pOtNVcIsc8b3lQG1VuHxqptW
 GAkKrV7x9XMKy5pr40a8LUpdA6sHOqu4b1Ze95hUhXegGpBQg6momwxk=
X-Gm-Gg: AR+sD13wLrveEq34/Gl+RgIWwZ3VFBr6L6kDQQXZlhKPmYQCm+oh9ySPfQ9ieaKHpGr
 Eb86ZNYpWKhVXMnpITFAYAripGOIoeMpJWkk8AFsWxh96jSnBY35A4nYetwGnmyc8lNc+5Mq0pk
 K+to1VvguFD/yE1hW2rGQGVEgZ2dOlI1vgi+OI3Et0JUgllHegGmE/W3kSUXocbMJ0ujWkOoiFa
 WAhZpHtEwNj5O5HaoaQYf4gwhylpjA3KcRhzu7cIithzplCGyHfSp9jmDph+bb1gsvD76vfNDth
 dmXEp5vUj/6wKMtbGFWNnN0PWyEzPhRyiWuwYQBwx8Q2eAgUxtpeZC36RHoh2JvipQX3w3T5wiY
 qalldalKtQ9NETQaPGI/nWdDu9vgCESB4C+g=
X-Received: by 2002:a05:620a:261b:b0:933:ade:2daf with SMTP id
 af79cd13be357-936c079402dmr2729308885a.18.1786892275204; 
 Sun, 16 Aug 2026 07:57:55 -0700 (PDT)
X-Received: by 2002:a05:620a:261b:b0:933:ade:2daf with SMTP id
 af79cd13be357-936c079402dmr2729307185a.18.1786892274809; 
 Sun, 16 Aug 2026 07:57:54 -0700 (PDT)
Received: from [192.168.69.229] (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4999610ddaesm71965875e9.7.2026.08.16.07.57.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 16 Aug 2026 07:57:54 -0700 (PDT)
Message-ID: <e11967f3-313f-43d7-af96-598b438fbbd8@oss.qualcomm.com>
Date: Sun, 16 Aug 2026 16:57:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 15/20] hw/arm: omap_sx1: Store boot info in the machine
 state
Content-Language: en-US
To: Bin Meng <bin.meng@processmission.com>, QEMU <qemu-devel@nongnu.org>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
References: <20260816131300.51799-1-bin.meng@processmission.com>
 <20260816131300.51799-16-bin.meng@processmission.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260816131300.51799-16-bin.meng@processmission.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE2MDExOSBTYWx0ZWRfX9IrUPrIAJqXJ
 /9atb8jStltRdHcOhNEebQmGAq5rE+oAhGlm0cMSeG0hf5+eAR5GCX2+BvKF/SoH90A8tTZ9afV
 GPkisGdcfiZcPP9PoFN4jLDB689MSDn66vqrIH/qlEg8TSQBIVvciVYki3nkoirlu4vDm0ZHzCf
 RY9UYsyGT3Fqo4R+MY2vMevO3bXdqYXn79ADm3M5/n+gm07kuAXJmVaN6Ag1Bv68StfiPdULbtT
 3gZ6H0ohYng8hlY0DKRMBxZfMyNI5HPEi+I/vfhHb6p6cc4QyMU/Ya3+N83u6z4gDCMz6POP8gV
 ruDm5Q93THrAya0OVrWwCrYlzj7rYGA2saRXwM5gZYib/XmHvKojoH1vPDHRvE288jTF+VKP8AG
 1yRxXOTcaV+RzNRwWKTluiUCZ4fp1w6Dwh4zRdDxOKaRW2PnEa9ZRty4a2JCsMGrmX4rHqZAtzQ
 IhoPdJWBtqRWjg3LeKw==
X-Proofpoint-GUID: RJio8A5X6HJW338yt1Bs5bWHXtT67EQk
X-Authority-Analysis: v=2.4 cv=Ja2Ma0KV c=1 sm=1 tr=0 ts=6a81cff4 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=FRSEYCzRAAAA:8 a=EUspDBNiAAAA:8 a=P5mgNStSnDlmL_58Bq4A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=H4N_Y-AU75W7NKDNhZlT:22
X-Proofpoint-ORIG-GUID: RJio8A5X6HJW338yt1Bs5bWHXtT67EQk
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE2MDExOSBTYWx0ZWRfX0RyYwQbzI2Th
 WepZAwyaAzeQtsse8HG8LDicF+82kiXURINH+gam8tG5sG9Xl8qYiHpIK3qrjiDbUAw++QEH+H5
 fIILSgTo2NB5WT46G/1Nd53OE9w+gxI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-16_04,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 suspectscore=0 adultscore=0
 bulkscore=0 impostorscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608160119
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

On 16/8/26 15:12, Bin Meng wrote:
> arm_load_kernel() keeps a pointer to the boot info struct for the
> lifetime of the VM, so the struct logically belongs to the machine
> rather than to a file scoped static object.
> 
> Give both the sx1 and sx1-v1 machine types the same Sx1MachineState
> instance struct and store the boot info there.
> 
> As in the xlnx-zcu102 and raspi machines, the boot info belongs to
> the machine rather than to a static object:
> 
> 4d1ac883a7 ("hw/arm: xlnx-zcu102: Move arm_boot_info into XlnxZCU102")
> 0f15c6e338 ("hw/arm/raspi: Move arm_boot_info structure to RaspiMachineState")
> 
> Signed-off-by: Bin Meng <bin.meng@processmission.com>
> ---
> 
>   hw/arm/omap_sx1.c | 19 +++++++++++++------
>   1 file changed, 13 insertions(+), 6 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

