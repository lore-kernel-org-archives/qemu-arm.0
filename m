Received: by 2002:a17:906:32d0:b0:a63:3083:985b with SMTP id k16csp577517ejk;
        Wed, 29 May 2024 06:11:52 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV+tGe1VoXhV/SMMWCO7TbvLRN9fHq5rws3qidD5CTebe8VHj+mfHwOCYhHHyE28axwicbib54x8u/SjWiamwPDHTDUBav2
X-Google-Smtp-Source: AGHT+IHl88GcjkMdi2VkHZGymaeCoWlwGCRSbkT2lX1yXwgbxZUfKHy2UXPvFijmfK+YlWKO+WHq
X-Received: by 2002:a05:600c:1c8f:b0:41c:503:9ae4 with SMTP id 5b1f17b1804b1-42108a99c46mr159752215e9.25.1716988311987;
        Wed, 29 May 2024 06:11:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1716988311; cv=none;
        d=google.com; s=arc-20160816;
        b=jfMag3kWUZDle6SLO8v9VvpZKz2/852uUaatki/KClSnwTO3ORKYKfvhfGm/gEnqRH
         xyV1i3pFVuMHzIL48Vrt82xDJxEw3J5fT2cu+24u7SuNSoDYNzUjDbEKfwZ7PmgnjjUF
         O7RUwGOhf3D2lS2eFurhmrjx6gROeZRHH897qo3dMeLfLRaA9lAmPPWRm17LOZT5RYQ2
         kK6di+iQw/6qxkoDuNZAquJyP7P5cn1Pp+0YICoAQIRdtsrFVNVEdejQ56Uq3RliXWuE
         YmRus4muqQoOO4TPwNrBz+gYbIuDhG4mOAPCrPvCsKSrnJhKl6TDJXTXlzkctej44kc0
         +DWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=tVvy+wvXznPZBbhasBYzCLoBByeqATo5zBWCfKNNZDE=;
        fh=+g3MmMOB9C8Qud+eVhIpzoazYE+JzT5b8axOMo+uQZU=;
        b=rOKYUaZjCdYqEGPQEehzSZ+yd4T0W1tXwmJPMNDJAf/rzv0MZH8TuSxbVByEBNXSaK
         Jnu0N2/rCgia954m9hFbEGCuZNOGwsbrJY7vnr+Vxfy1xxwOsdxOi+3dMF/O1bTQcNma
         UKiP8UuQE2Bb2mMgeAO/3epBB0TZSnBKQ/wJaokU5wDbahBGAIOd07n/c3XZjFxU62OE
         +VcSTDWdNE+tIHp0vAUZ2hjKniR85nV7Us6Xr/lNLprKoycgTjzoOkv/HOEW4HEdIW/7
         bO022v5TEjwBbHJYiZhXupXkitLi203l6e4oj9H+VzePK5DKjJtkZ7qDakaOgCQkMfZ1
         lpCw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@quicinc.com header.s=qcppdkim1 header.b=RofHXOl3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=quicinc.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ffacd0b85a97d-3557a1c5b15si6715480f8f.398.2024.05.29.06.11.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 29 May 2024 06:11:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@quicinc.com header.s=qcppdkim1 header.b=RofHXOl3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=quicinc.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sCJ5c-0007Nj-Ld; Wed, 29 May 2024 09:11:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quic_llindhol@quicinc.com>)
 id 1sCJ5Z-0007MV-PM; Wed, 29 May 2024 09:11:33 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quic_llindhol@quicinc.com>)
 id 1sCJ5X-0003by-Rd; Wed, 29 May 2024 09:11:33 -0400
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44TD8aCX020826;
 Wed, 29 May 2024 13:11:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 tVvy+wvXznPZBbhasBYzCLoBByeqATo5zBWCfKNNZDE=; b=RofHXOl3iS6xWDBb
 lN7BP8NpJs6Ab/EQck54ICVTsVt1K8Ffjwxu3epu6A6rhhLrqBawlLyuJxHH/k/N
 lrD8KhvXuzit32BvDNM+eIaU2iTD0U4zfvhcwOgkL50xEuGbDf3WW0d4RvLTmCyu
 HgeviHaAKBlLyNWTK0HkiVUOZI3GZzIXstdQChE/sQ1snHTDkJHk6yvdz4cDwMT1
 cdWPD/BCUj4Xo9SS8x4CXpnB5CsO1X1qhedH61kCscM7I9/1Xz3gv0OA9UvFmzXx
 LZrxDt39kRyVSG4KfTLNMH834vFeNOqxYhpz+ARnGIQ5S9FZNk09P68omuLWJ66m
 ih3ZUA==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yba2h8xx0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 29 May 2024 13:11:26 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com
 [10.45.79.139])
 by NASANPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44TDBQr5009635
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 29 May 2024 13:11:26 GMT
Received: from [10.111.132.194] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 29 May
 2024 06:11:24 -0700
Message-ID: <ce59d92a-cae2-42b1-b9b7-d482f6d2ef66@quicinc.com>
Date: Wed, 29 May 2024 14:11:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] arm/sbsa-ref: move to Neoverse-N2 as default
To: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>, <qemu-devel@nongnu.org>
CC: Peter Maydell <peter.maydell@linaro.org>, Radoslaw Biernacki
 <rad@semihalf.com>, <qemu-arm@nongnu.org>
References: <20240523165353.6547-1-marcin.juszkiewicz@linaro.org>
Content-Language: en-GB
From: Leif Lindholm <quic_llindhol@quicinc.com>
In-Reply-To: <20240523165353.6547-1-marcin.juszkiewicz@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: TSDSiOcnQZMP2h2aEjS21tUF2IYh8LI6
X-Proofpoint-ORIG-GUID: TSDSiOcnQZMP2h2aEjS21tUF2IYh8LI6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-29_10,2024-05-28_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 adultscore=0
 malwarescore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 phishscore=0 bulkscore=0 mlxscore=0 lowpriorityscore=0 spamscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2405290090
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=quic_llindhol@quicinc.com; helo=mx0a-0031df01.pphosted.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: LQSdOSk43VXw

On 2024-05-23 17:53, Marcin Juszkiewicz wrote:
> Moving to Neoverse-N2 gives us several cpu features to use for expanding
> our platform:
> 
> - branch target identification
> - pointer authentication
> - RME for confidential computing
> - RNG for EFI_PROTOCOL_RNG
> - SVE being enabled by default
> 
> We do not go for "max" as default to have stable set of features enabled
> by default. It is still supported and can be selected with "--cpu"
> argument.

I still want to move to max at some point :)
But this is a good improvement for now.

Reviewed-by: Leif Lindholm <quic_llindhol@quicinc.com>

> Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
> ---
>   hw/arm/sbsa-ref.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/arm/sbsa-ref.c b/hw/arm/sbsa-ref.c
> index 57c337fd92..e884692f07 100644
> --- a/hw/arm/sbsa-ref.c
> +++ b/hw/arm/sbsa-ref.c
> @@ -891,7 +891,7 @@ static void sbsa_ref_class_init(ObjectClass *oc, void *data)
>   
>       mc->init = sbsa_ref_init;
>       mc->desc = "QEMU 'SBSA Reference' ARM Virtual Machine";
> -    mc->default_cpu_type = ARM_CPU_TYPE_NAME("neoverse-n1");
> +    mc->default_cpu_type = ARM_CPU_TYPE_NAME("neoverse-n2");
>       mc->valid_cpu_types = valid_cpu_types;
>       mc->max_cpus = 512;
>       mc->pci_allow_0_address = true;

