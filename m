Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90B6BC61DC2
	for <qemu-arm@archiver.kernel.org>; Wed, 26 Aug 2026 08:06:44 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wz8eB-0003rg-Oc; Wed, 26 Aug 2026 04:06:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wz8eA-0003rF-SG
 for qemu-arm@nongnu.org; Wed, 26 Aug 2026 04:06:10 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wz8e9-0004fX-Ek
 for qemu-arm@nongnu.org; Wed, 26 Aug 2026 04:06:10 -0400
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67Q6S7wj4189928
 for <qemu-arm@nongnu.org>; Wed, 26 Aug 2026 08:06:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 GNIgWYJEBgzV5VenT9qffCzQiVrTpag1cKB1YFTWaQA=; b=Dj5FvgSIc2sQF8XH
 OjnehoEFQJH9gt40ynK7FGNzb/ncJkhduoc3C9xjxzJt6XugIk7GIUKspsIusLq3
 qVOqC5Zlff/eS+KT+UaPSSCjqUxh3u9A2twe3HTOQXQEeaX7PiP191tx2uON/zlw
 qZLmvloMbm+Hfvp4ICM2FbPcOKsBrmOkT8sjMej/rgNxmJPa85Yi9c8Ks4He8Ooa
 ux4q//4xHNUv4nBjtIhmK3fQV2/WPabWhyNOxn2qX5IbUW20IWi5X6QP00brkwip
 G1/J0Z/I85+80+k7XU9LDiVS73hnzztd/Ia+VP9CRUSM3BYlNyxtN59fdzuL4E1b
 Wamp/Q==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9cgpupun-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Wed, 26 Aug 2026 08:06:08 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-52769fc3f2eso9634881cf.0
 for <qemu-arm@nongnu.org>; Wed, 26 Aug 2026 01:06:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1787731568; x=1788336368; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=GNIgWYJEBgzV5VenT9qffCzQiVrTpag1cKB1YFTWaQA=;
 b=CDr90XV0Frwn5xmSr9zk+4SiePkNrBaIk3BvhfZPN3xpvh5dxkdTLA3bLT0VzR3g9q
 9mfD4W1DqKuZhdPaT1+zX6vgASbwgvdDkv31myZnj0HPLMNfGe9USjH6UDrwDYLt3V8i
 7d53cGNgbGRVbQd0k24K9bJqWRvEK1ZOl9PAFYLRs5RtHYNrrDtklR+waZpzG6IDNU+H
 iq6Ob2KNVJ3NsAdFsQCJs/jm2w8istOgeKhlwSmH5l+wO52mAGHnUDr+v0fmST3WHxNY
 hWZZ2GOdLeL86ykhCJLsRTi4rukIp3y+a9D5a8UtTCCXxiNamt5fDicjmakkazuoTMVF
 m2CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787731568; x=1788336368;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=GNIgWYJEBgzV5VenT9qffCzQiVrTpag1cKB1YFTWaQA=;
 b=X/N3XtsSv+efUzfnZl/Ab/2aSQKvPD3bF3hJTUhIo6AC8WvizrloGJe2W/JvlVDzkS
 FaadPDcyoiVCvR9nGoUEHh/CEmACfW/Dt6MMyUgxSY/cTogGqmP1fnMkDcHeO4dSuvR5
 x8kKRwUch/N1nDX/On033gerwHejWccJKGwqrpwS7ydxZTxhs5vpUDVhtZnd2P7hNqAj
 CUv934wcXUdrwrCckjqljZyG3Q6TBiX1omijnnml/8fDaz5m81H2CwlnGhlfmukSQk3f
 QPr5JkwXQPFKMOmuzVOuKx3y/GHtSQyqU5vcJncDq0+1OF4+TnvccZk5B55trX48krVx
 O1iA==
X-Forwarded-Encrypted: i=1;
 AHgh+RrwsJqp7H/v9LreZ/YKpS8lRyKM8ScWjr5OtxPhRHgcLvyYaI1HtdecrKPuaPqXuV+KShJqBy2mGA==@nongnu.org
X-Gm-Message-State: AFuF++lszlbC0fLDU7O7giWKynQZ0v/ctJwcG1QhDYG6bORbTZNt3pjW
 1D0UgtxYPK9Nq3KVMKlCeFuVfCn1z8PnoR1QcBq2+qfATTlD926MrEJAqzhzatzZL4hxbGOFfeg
 K64UsBsgZF+W+6KcUEHKEKobxazw1Nkp/5TqxtEl3rXzzwxqchBvlpiO7TSeXB/E=
X-Gm-Gg: AR+sD10WB6O9sfutdrVA40BMSVNRhkgiWR/0Xwhgu1JSGWA/cC4MJDBi+HMKG0kHjl9
 YpUs/DmPJka791qEScOc5+qcTA0hf0UU40EeIWysTPcVrm2a2kRlR/h+iVOCTFiaajxjgESS3qj
 Kd+SDqdfpdB9w5Sp9WBApkPwu0cNKwIOiaKlPa76awSKj+SqraXzEpgq2+L3qaPPOuBVuTzdy7U
 5oiRxzCLZ/0VAqFsjPdljDGVNoOmW5r6WTHN8J9CJ0VQlzsFOV3jdCloTkHnf0634HCH6MdApzb
 X/ixXrVURJULE5FmaoKg2AIuepqz5pS0jExO124nxcRjyDrEA+qghQVH0J6tWbwoEhXSjrquYxN
 1ULWjHvsMiFRqkZ+7vyllANGmUnBptM3VyVl8wggSoEM=
X-Received: by 2002:ac8:610b:0:b0:52d:f63b:94d9 with SMTP id
 d75a77b69052e-52e4236fdb5mr46691891cf.30.1787731567456; 
 Wed, 26 Aug 2026 01:06:07 -0700 (PDT)
X-Received: by 2002:ac8:610b:0:b0:52d:f63b:94d9 with SMTP id
 d75a77b69052e-52e4236fdb5mr46691491cf.30.1787731567080; 
 Wed, 26 Aug 2026 01:06:07 -0700 (PDT)
Received: from [10.254.188.74] (14.89.66.37.rev.sfr.net. [37.66.89.14])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-482e28e8499sm1936107f8f.26.2026.08.26.01.06.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Aug 2026 01:06:06 -0700 (PDT)
Message-ID: <ba77f671-2ec1-4b73-b2b4-e857599a5822@oss.qualcomm.com>
Date: Wed, 26 Aug 2026 10:06:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/8] hw/arm: Rename ax3000-boards as axiado-boards
Content-Language: en-US
To: Kuan-Jui Chiu <kchiu@axiado.com>, 163wangjack@gmail.com,
 qemu-devel@nongnu.org, peter.maydell@linaro.org, qemu-arm@nongnu.org
References: <20260826074635.2850931-1-kchiu@axiado.com>
 <20260826074635.2850931-3-kchiu@axiado.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260826074635.2850931-3-kchiu@axiado.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: GiIuJILlopxSIjnQhwOx7q1knJhXP1Fc
X-Proofpoint-ORIG-GUID: GiIuJILlopxSIjnQhwOx7q1knJhXP1Fc
X-Authority-Analysis: v=2.4 cv=I+NVgtgg c=1 sm=1 tr=0 ts=6a8e9e70 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=JQZmDyB7+sUo+n2VpL1TLQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=440cDlBIAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=1tSEMpTH9XP_W59IOagA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
 a=d9D1X1bx8dWolqnE4HNT:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDA2NSBTYWx0ZWRfXw6a60nxDZ5na
 e1BCDXj1RyM1K8hRcKgxI5w+VE14AmPX45gmjui4h8SRusBLj40+ZW0sPQ1+EFGF5e6qdfXfO4t
 O0Sqfnjyslqxa8+DCrd+Sr04AUsbnZNksHM0z2W4Kfhs2AZaIb0qUg0fp02yBdWT2uCYBTBIigX
 jZ2wnZ6yHdtKY3ud817xX3M0nXo/zqH6R/wNe2u92J2/a6d/EtCrgeMEveBFS00gIWmD+JI/2iZ
 V5pODV5OHEsZwb/0NgEyOfAEQ/c88mjvb3OoYQaNEzli4X8zWMOKGwld7RpqI0QKLNn8Mn/z7GX
 iMualCHBemvr8j3ZLpi3nVivUw8vEQNhU1ME/lrWFvZskIaJ1oa6T7s/EC6pSfuiYVjoUdJqymb
 As9ddmHngtkvreXjLTekwokXW60oafj3S+7pcyi/e6BZKZKOT8g/ugHqaPjw+RTbqlq7jKPQPoB
 9aFgago6Qs8A2GRi98Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDA2NSBTYWx0ZWRfX3xc/GlIOW36F
 4FMqvF7q2EQ3OvAjEFfAFjj9oyuZ6cxrtVt9x42olhbeS+aneOpCbx9F4obSXjnM2N1NXul9oOx
 8qgrBva12pOv8RLhRKuoaK4TkB+rwKE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_02,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260065
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

On 26/8/26 09:46, Kuan-Jui Chiu wrote:
> Rename header file ax3000-boards.h as axiado-boards.h for sharing across
> different Axiado SoC series
> 
> Signed-off-by: Kuan-Jui Chiu <kchiu@axiado.com>
> Reviewed-by: Jack Wang <163wangjack@gmail.com>
> ---
>   hw/arm/ax3000-boards.c                              | 2 +-
>   hw/arm/ax3000-evk.c                                 | 2 +-
>   include/hw/arm/{ax3000-boards.h => axiado-boards.h} | 0
>   3 files changed, 2 insertions(+), 2 deletions(-)
>   rename include/hw/arm/{ax3000-boards.h => axiado-boards.h} (100%)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

