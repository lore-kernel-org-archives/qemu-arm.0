Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BCD3C9832F
	for <qemu-arm@archiver.kernel.org>; Mon, 28 Sep 2026 09:31:36 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xB7ho-0006la-OF; Mon, 28 Sep 2026 05:31:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xB7hk-0006kW-Lf
 for qemu-arm@nongnu.org; Mon, 28 Sep 2026 05:31:25 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xB7hi-0006EN-CN
 for qemu-arm@nongnu.org; Mon, 28 Sep 2026 05:31:23 -0400
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 68S9MD8a1212570
 for <qemu-arm@nongnu.org>; Mon, 28 Sep 2026 09:31:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 mlLYMWclEEypZifzZbJQKvH45ehRxZZK/lt4vhjXZhg=; b=TCtrFgBH8vm8rsdt
 kfOFMfXyns9RiF5jMzYfJcDJfVc83xirpepe0rKbOgEFK7PJ3b9Ff7xN3YUHKebp
 7VYCPx40n7ZhFYTnCATTMGcpX+6gnbWz1VEyH0L6rXRJHw+Z0WhSGUnVSGGUMKLa
 TCUkjN5xSk1ZR1+YFEG+EP0VYbgZ4UKyfCOuz/XEMo2gh2ekWz9DUoyeF9Kzgajr
 ezLjpJ0pJ8S4H87IRGb+LLBmmOlYuokQW0C4orGr+08/St3qP4G5wkuGnx1952nC
 irMBTsHpy0jaBZ+Vfo5t8A9bnyzUtbzRs1+R0Ygr98Xv/9ogiJUIJLT9+vffqtfo
 kjD7GA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyjkxgrf0-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Mon, 28 Sep 2026 09:31:19 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-93c57e0436aso187259485a.2
 for <qemu-arm@nongnu.org>; Mon, 28 Sep 2026 02:31:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1790587878; x=1791192678; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=mlLYMWclEEypZifzZbJQKvH45ehRxZZK/lt4vhjXZhg=;
 b=gd4uOM+Qco+5zj4HkypVCZfggjX7zYSf8U0/52B6DC7A/VVzQDQ3KFeIdjeDNeCKUA
 eoQ2dKC7qawTJtmnJgO29RwEBpNWA5CGL90hZAc049Ci1o6zSRoxGyarKoS0ONI7ITAR
 dUk1YCcuSGxYyvwqIAbFspCRyEEtB48iaSYBi47qBYAnRUBFVbqjeg6ox5102CJ4wOXk
 WePVljbjdWnEg2xU+YYWYHmcqPF6R+cj32Vg0lOd6ppP8lhDBOBOPu6Z21KFlu5jFLbT
 IO7ZXs2J8/ZL3w/+DiI/8Cl5teyuQzUbtbM8EpRwIi744bn8w6B57QNQ5WDKlm/O2tFZ
 MpKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790587878; x=1791192678;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=mlLYMWclEEypZifzZbJQKvH45ehRxZZK/lt4vhjXZhg=;
 b=D9RvDnqiU2543aNMHMp9wEza3QEZJyU8HmvS9TfUVB6fCV7EqyP0nys2H81HnXV3a7
 qIY7kpNnPp1fsLgNFC/yaYGhyWHEmF6EBDSJkeyLVkUbp2JekVp+YWRAVLxfi9vlV8h4
 ZrTG/xm7aVBXZRjfQLACWWTNLeFjeBCP5+5Usl6d6M5BeXW0hVvKX7xdNNUb4IBNBoun
 UimKBfhxE/yqHJQFZIEEpkaG3UN4ZeI9cFPPTsjhZ+fdCskiJCA5hJ0KSybfphQKGZVj
 ErX4Ny80QmW/k4Jzg59IlnDKokUKI3nbM3ZcBDwp1ZWPn8mPO37LQJW2Bf1lhSF3lUdj
 JGzw==
X-Forwarded-Encrypted: i=1;
 AKwUvBwkdvLxJQFJCxSRyx/6nqAfNluMw8PHmRWG6Rueg7qpkIDU0qNPfBoM99u5EoQudOZO6BxFp8tdng==@nongnu.org
X-Gm-Message-State: AFuF++mFWKgA8puDhtUR+YZmj2OzexzjB9pYojDEdMku4CeZPFOZsXv6
 9UyATlY7vAG4pLVWS1GwZibOFMssOM/yaQYdq0qSuhdKcOd3qVKPgaWDm93u/qVnwghLrQ5mo7O
 xV+znK3MM2X0RA52kyV/2jlEV9zXQqLhxTy09JTBSR0lSrglkI7E8orQ=
X-Gm-Gg: AYBFou3MTun0J8VbEc0RRD3HTzL2zUNZymFDsE7/7ybiDThYuzSYcJfeLzR6LL49QKa
 a9cpRG2YJ3znWSxwL/SGw+KOu/lBt5xS5wVH2fxUwtuW5TWugeFA1A6JhdByRxUXMIJpxrrtmPk
 Zv7dSu/3KInwNXgoD8ySMUmRkB1KKUJTA/UfA4BQarErmstY0DyBnOqiOsSAGRDq07/JIBogOKM
 RwO3az8OFjsfduA+ww/vyUcBVOG6gHz97N/79yG3itsbeftrWzmgLG1IabNYhw2usl888OHkTry
 20xa2XFTzn6rZ0dI74cMa7tT8Qz5NJcrLtqO8XNhFUDdXlkspE8if0wd935iQ2/v+STh0bX2ANj
 TP0ev5tHhBGAGM2juTOiYSSS1mK9wRGyrSQ==
X-Received: by 2002:a05:620a:260e:b0:93b:bce3:5499 with SMTP id
 af79cd13be357-93c43b92b56mr1844167185a.6.1790587878402; 
 Mon, 28 Sep 2026 02:31:18 -0700 (PDT)
X-Received: by 2002:a05:620a:260e:b0:93b:bce3:5499 with SMTP id
 af79cd13be357-93c43b92b56mr1844165185a.6.1790587877962; 
 Mon, 28 Sep 2026 02:31:17 -0700 (PDT)
Received: from [192.168.69.225] (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49ff13b3c59sm68250415e9.0.2026.09.28.02.31.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Sep 2026 02:31:16 -0700 (PDT)
Message-ID: <cdac79f2-13c3-4964-96a9-9def889c8eb6@oss.qualcomm.com>
Date: Mon, 28 Sep 2026 11:31:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] hw/char/stm32l4x5_usart.c: Support 16-bit writes
To: Jacob Whitaker Abrams <jwhitakera@gmail.com>, qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, Jacob Whitaker Abrams <satur9nine@gmail.com>,
 Samuel Tardieu <sam@rfc1149.net>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Fabiano Rosas <farosas@suse.de>,
 Laurent Vivier <lvivier@redhat.com>,
 "open list:STM32L4x5 SoC Family" <qemu-arm@nongnu.org>
References: <20260926175634.2034094-1-satur9nine@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260926175634.2034094-1-satur9nine@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: bQx4BuSxx3uvd-s3Zl9SKwNLUmJIh_tH
X-Proofpoint-ORIG-GUID: bQx4BuSxx3uvd-s3Zl9SKwNLUmJIh_tH
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDAzNyBTYWx0ZWRfX4sy2krGbsvd5
 /bxm2xUiLYmZV44CkfxCMCwAZXXCigFZvjymgtgd0qConXHDafdrbcTSUYK1d0b8O3xAjjLdUQ5
 X3stg4UvVqolBAVoJDDdLuGOSuRChZs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDAzNyBTYWx0ZWRfX/svAlA6oAojW
 SD8OvNpJBV/8Otm3upmU5FG3idIQcwlzGpYBvPuyYi6ZpeLUjTGy/MtRG2IzmGKrBCV0trtiIjz
 xlAYo4TmMFW626UZMARs7TZbWbizefFolxv46Aar/33fodZus8ZlBZuyTWoOGcUdupaV53a98Hl
 Q6TTUxYIsNNX6slnx/hjnjb63vS1/8tmU7UOEWgQd4Dcb7t2ptEMoX6/AfPXX7Zj4nMp/ts7c1e
 LaLF8TjADkvHFGEr2zCX5Jxt4iY+vSbA16zVB5sze1GIzrz5Mxmj98ETjop3wKcOxutcB9sbtv4
 Zq3I+XdeBnryTllrO8GldG2rc4D/xR3uu19y3JYTL13J2J9+BNsKc8YKlAAxKgqYiSAVfSqhOvs
 1K/IYy9X3zdYlYqhk5C1QtlQCukQfDCXufr7x4lBLUsiBEvSi+7wTDvsrSbqSqzXZRt03QiQpiM
 Rzt/qFcGL8ohcrQMkLA==
X-Authority-Analysis: v=2.4 cv=QZfzLcbv c=1 sm=1 tr=0 ts=6aba33e7 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=_UJ9raXPv66zcN9uApYA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 suspectscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609280037
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

On 26/9/26 19:56, Jacob Whitaker Abrams wrote:
> Official STM32CubeL4 drivers use and require support for 16-bit writes to
> UART registers for proper function despite datasheet claims.
> 
> Signed-off-by: Jacob Whitaker Abrams <satur9nine@gmail.com>
> ---
> v3:
>   - Add suggested comment and set only valid.min_access_size to 4
> v2:
>   - Remove all changes other than supporting 16-bit writes UART regs
> 
>   hw/char/stm32l4x5_usart.c          |  7 ++++++-
>   tests/qtest/stm32l4x5_usart-test.c | 22 +++++++++++++++++++++-
>   2 files changed, 27 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

