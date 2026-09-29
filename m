Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E02E9CA5FA1
	for <qemu-arm@archiver.kernel.org>; Tue, 29 Sep 2026 12:24:17 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xBWsI-0004iz-LB; Tue, 29 Sep 2026 08:23:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xBWsG-0004bh-Pq
 for qemu-arm@nongnu.org; Tue, 29 Sep 2026 08:23:57 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xBWsE-0003po-Vh
 for qemu-arm@nongnu.org; Tue, 29 Sep 2026 08:23:56 -0400
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 68TCEMNf525145
 for <qemu-arm@nongnu.org>; Tue, 29 Sep 2026 12:23:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 pbLyNyRKfAJ2mCFtGp6eeRnUKBZnlSrxJUR/CZHXjzc=; b=Upt5zZt1MbXuUOif
 cxwDos18fbptVwhTTp4FENUSl00s3bl1b+CRIWY2pSykgaH42xyhbDHBiTIhSq0r
 u2ucCDM0xDiAAB41WntArdWVDFbnipk3oayw9OVR1GL4TnH9EjgZtg/5dUkEJdF6
 CI2hTgegGsGdYGL58+xtubgGItKwVknlkZSJfnpGprhslewM85d+CJNIpW5clmss
 8UWWZDuMzKriey9cARjTdSyqeMZzbSRwbDW88yDITkBap527L6/xWcRSFVezZ0mi
 xzAgHcUnY2futgz1XLwhJqtsbCJA/RaAusuMoDg0Ca+u9wDUvu/LqCbCZTx8vKrM
 MG0EDA==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com
 [209.85.217.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h00s4typv-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Tue, 29 Sep 2026 12:23:53 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id
 ada2fe7eead31-7b4085d29d6so393925137.0
 for <qemu-arm@nongnu.org>; Tue, 29 Sep 2026 05:23:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1790684632; x=1791289432; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=pbLyNyRKfAJ2mCFtGp6eeRnUKBZnlSrxJUR/CZHXjzc=;
 b=kHIaXDa3D9kJGUTtDtDotSEffVNYS6DDLrzHxtlxGNMro2FMvc5N45M0peoqxRNu79
 dkhHAz6GJKeH/72c7W9OjovRyNhq15sOwQij5ZnKIGmkgbR2TXVmMAi+OgNKSl9BRCGm
 2qgGP9oYSlOdkUA2r3fvnYqGGTPqHJAn6mPSkLW0qj4653Fx4T2xB28N7NaEBK4eEHT8
 htvQMVsJvAGGH3n1MHXvLK90Keg9hkGyqtzL8hH0fOSWBW8AoHaZIo0x2oEKbjGyRi/l
 Q/hUGw6LM5NcCTx0mZJ2ytviNZkWDJq2nQ3A6ZTQHNJLegAD6Gyq8nuwl+DRJx7kevzI
 qbeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790684632; x=1791289432;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=pbLyNyRKfAJ2mCFtGp6eeRnUKBZnlSrxJUR/CZHXjzc=;
 b=a41E+sASOdy0WlH2E5BAGAwEzBQLhGKheJ97PmOTU6mT2dhaDxzXPxm/uNzw5nuEos
 061q/p38QJe9vGwtlnUZ0RhIet94OrcPYnFIaiOTvt1Ku38GzZ7KElSYo/evvqNjg0t6
 11Lt8EimCq6lNH33dbNqAJqVvHkeiCOE29E+9gfqQJCvWlEXqARt1iqIcSJe2XoVo8HM
 GqLgTlacEWcJV2gpEsl9I/PCzsC6t3ldydwNFG0xS07TsP452D6OOl6r+bD3L/jbXmGP
 aYOKyoPuJnNcUJkIcimWBJLzn4DxoeFHr7Xu2smue0mRn+PnWHcATugJ1MDU2913LJku
 JUiQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBxrJcbbBXyG6OAThQG/ZM5ngZGYFl9IW+k2nT9RRHp8E1vkz72cshWECRjhgHOn60MtLJ/8tlU9hw==@nongnu.org
X-Gm-Message-State: AFq9FYKUyiSjeUpEx3AIgbiGxugdQTXbfnOgHsCc4rBRxVC0F8HbXbF6
 X8Py6GVn/DAdoQEKWDsUQVn0QQx7UhYvIMAo4bqv2Pht9Evz3i3rdWw0jQyAvwZYKk0JKXipOdl
 3rsY1vGdCJ+IJbyp3Qi9yvc8UhWBn2rHpxOMMF1gLj36y4LpEzmldwgU=
X-Gm-Gg: AYBFou31WYQdzIwCYiWQ4XqGMESNPZKSu7o1AjTOc11OI7/zlyG/qY14RQ0bIejPFpZ
 xzcMfgi7oEYxt2yF6CfnYi7/Xe0/7kAqUnJIWJ5dJOrkyejWW1qBgV6TTtQJOQ7K7Q8B1+R81jk
 Lea9GjXn7sfvJma7dkgv++4Sl1YmGhkdmhK3oOK2XJ/ShGJ88MCLbWBEed9AdHUepg4juDUFzfv
 7dMq6yPy46ve0ltXd421eTXW75jdSgX6gMMd15HK2fQguLKjentKykOD7z2RNUHZqW+47YQbtEN
 56US9aNkQdagRw64ITxDsAz89MEU3Crzd2LfWXp4Z3okFmq7GUG5IlPtcV8QJXdSyaBXyeLPjgn
 qr02RlZCkV/3WQZ81gzNaSh99hyQnGaTxNg==
X-Received: by 2002:a05:6102:3f0d:b0:7b3:4199:2dd9 with SMTP id
 ada2fe7eead31-7b341994426mr2752644137.9.1790684632497; 
 Tue, 29 Sep 2026 05:23:52 -0700 (PDT)
X-Received: by 2002:a05:6102:3f0d:b0:7b3:4199:2dd9 with SMTP id
 ada2fe7eead31-7b341994426mr2752631137.9.1790684632024; 
 Tue, 29 Sep 2026 05:23:52 -0700 (PDT)
Received: from [192.168.69.225] (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48af50513c7sm3702386f8f.16.2026.09.29.05.23.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Sep 2026 05:23:51 -0700 (PDT)
Message-ID: <625426a3-f2f3-4c72-a465-46c6ec57a63e@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 14:23:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 23/42] Kconfig: Extract config FSL_IMX7_GPR from config IMX
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: Phil Dennis-Jordan <phil@philjordan.eu>,
 Alistair Francis <alistair@alistair23.me>,
 Peter Maydell <peter.maydell@linaro.org>,
 Alexander Graf <agraf@csgraf.de>, Jason Wang <jasowangio@gmail.com>,
 qemu-arm@nongnu.org, Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Gaurav Sharma <gaurav.sharma_7@nxp.com>
References: <20260921214710.29422-1-shentey@gmail.com>
 <20260921214710.29422-24-shentey@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260921214710.29422-24-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA0OSBTYWx0ZWRfXy/auPSY1wQsR
 ocyAwhcuPbw1/N+qs2PaubH/eEkZTqCK7EkzWtdY5wmOOd/FkgmnWvlm9yW+SFKy8n+qDnCUk16
 aOzDY8V6YL64KAkczVxvzy9VeFmp2oE=
X-Authority-Analysis: v=2.4 cv=ALbfqNVA c=1 sm=1 tr=0 ts=6abbadd9 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=pGLkceISAAAA:8 a=Ot67DT_QmXfz63iHxRIA:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA0OSBTYWx0ZWRfXzHOflLqNZ3Rn
 IiUzlSCFSR/sgpYtL1I+Ijrvz7iJEGQP1FPUgBSLx6IbpYGXut5H5eSKkiofapxek3oYGj2MvrW
 FsEI+aDEYtlZatydsp2135chfnhxDm9vieyeizrSGy+GwNeAl8c2t57Vg/QwmJB1kmQrGWiumAE
 XY4z8Uqqo68i09+LZ7vq2QqvuCoyISo+Xj/11U0Ap2xA8ZpNoOZqLUAlJaX01yNwvzAx5Xg8SCd
 1PpcIq2aGy4jJcVPD+szUEjdZVMfRNlszPWVrt7h8jBy4xyBnVs//9LouXNDA56Nx9P8SpZjgMU
 DbEwIFMsI0uMur8Dr5GhhzSX0yhqAHvb6+ukimcig4OTaEQMej7UCyo2YipIz5GfdNZ83EKNNQI
 L9ZiKWC0U/Uj+pJsycJADzLuwvnMc1aBsIIp+GhEgTLssYbSO9vO2Z3AbkWd5vMHA0D7fw+w2j2
 +m65bkIT8RStQEzs5aQ==
X-Proofpoint-GUID: oySy4KYdLV1HmOS-ltQ-ykrpJhf9d1OO
X-Proofpoint-ORIG-GUID: oySy4KYdLV1HmOS-ltQ-ykrpJhf9d1OO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 spamscore=0 clxscore=1015 suspectscore=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290049
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

On 21/9/26 23:46, Bernhard Beschow wrote:
> Over time, QEMU has grown a number of i.MX boards and the monolithic
> config IMX drags in unneeded dependencies into each SoC model. Extract
> config FSL_IMX7_GPR to eventually eliminate config IMX.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>   hw/arm/Kconfig      | 1 +
>   hw/misc/Kconfig     | 3 +++
>   hw/misc/meson.build | 2 +-
>   3 files changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
> index 1436c05c98..d3dda015c4 100644
> --- a/hw/arm/Kconfig
> +++ b/hw/arm/Kconfig
> @@ -578,6 +578,7 @@ config FSL_IMX7
>       imply TEST_DEVICES
>       imply I2C_DEVICES
>       select A15MPCORE
> +    select FSL_IMX7_GPR

         select IMX7_SOC

>       select PCI

     config IMX7_SOC

>       select IMX
>       select IMX_FEC

         select FSL_IMX7_GPR


Machine -> SoC -> CPU & peripherals

