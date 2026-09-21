Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 154A9C982EE
	for <qemu-arm@archiver.kernel.org>; Mon, 21 Sep 2026 12:30:44 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x8dAG-0005XF-6z; Mon, 21 Sep 2026 08:30:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1x8dA2-0005QW-Kh
 for qemu-arm@nongnu.org; Mon, 21 Sep 2026 08:30:20 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1x8dA0-0001wp-IN
 for qemu-arm@nongnu.org; Mon, 21 Sep 2026 08:30:18 -0400
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 68LAe2C2934391
 for <qemu-arm@nongnu.org>; Mon, 21 Sep 2026 12:30:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 exb7MIh4/C1kWQwYHE6RQk5kEFT2UArXS7rsJ7wYm2g=; b=UxzEB5pU6QCZqDNC
 knOF28hJWGj2ydcFSDOv0T1kLcyw+fQHQWgMrlOBx0hZ4XN467Ya/neSro0ClZu+
 8/506bAgO4D7NI0TFW0JVzKjD5y/FcdvWwqPRIMF8JjzxWL52CVxpAbiMmjs6qGh
 9qxrq/QGkUmx4RO0eNAfNIc1/LEPSWLMJq8je0H9zCRZmI8xLEe0kRfX5OTSYjqA
 JtdP8lwi34I43ILNULI+G2ZGGXv/k1vz2JMFkpvmxT36dyTRSYcW4Jn82e2H3DOa
 V9WHC1YADoykCOBKFpEZ+FdYF0lMlQqZU4KLdZmsZTXHLW0EZsc3ZF0xDs0s1NKQ
 6lGKRQ==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com
 [209.85.217.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gtq8bakmq-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Mon, 21 Sep 2026 12:30:14 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id
 ada2fe7eead31-78fb21aaad9so2821901137.0
 for <qemu-arm@nongnu.org>; Mon, 21 Sep 2026 05:30:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1789993814; x=1790598614; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=exb7MIh4/C1kWQwYHE6RQk5kEFT2UArXS7rsJ7wYm2g=;
 b=gqCLhB7uaKw56fTEfbx0N/UD4aEaa8DKb+aHIX4zcpSXjZ2qiqkjYaFD3RSEEFT9RX
 nMGboG6YMyzd3mciKtdkZVu+QNiK1epfJxw4WMGm8j8GPu3g5O/5D/SI9+aTIlGMt9/v
 f/P51HWk2XYoYc0KI3dSN6B6Z31jkEDxl2cl3/CSNTUaE+EPCJTkm/5AdvFmfGYbPfuN
 WXs4CgLdoKCqdvTswEKgSlm0TYMSGJO8N0BTv6XH2maaztjaU6BtfMLgdiVjSe1gePQz
 m6Aw0i2ZEORwSXcTl6aI8PS2Jn4Vmjev2NlyGfjDP8/PMet5J3Qy5v3SxSUefZCvs4FQ
 ZB5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789993814; x=1790598614;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=exb7MIh4/C1kWQwYHE6RQk5kEFT2UArXS7rsJ7wYm2g=;
 b=Dn/1LCtaGiu9SyYNGPzeOfzhUO5BKSMA7LFTSQ37jFqJ+dg9ZLrmJ/rpcCZLVUlXC5
 7G9xgNgaRjWoh0Byv7r1p5k8ETGvVOK7eRvVsOPGNwFkUn1SO0vZkC1X0nizK0DmAoJU
 DFvorWi6vqWiCdnS6tjIKNKAOBBB3Pp6qPJOxGvnWq58VqDG7HWqnL3BFCiG1Ww26HMu
 mUY1z68uKXFZsqJiUBKzg+zd3VIuhwtoQWS440ioeZg5CCxg/MXYegYDACtX8hp3tqX0
 A6HsH1Ms1qTWHkqlCqS/x/2LraRfdzWTlGnxBzrO0L/yetB9BuJUQvUJC7i3eucseuEn
 7+sw==
X-Forwarded-Encrypted: i=1;
 AKwUvByhKalKSVfQkS2JaZ8kU12J1eJ+tc52R2affnbnX2bNtkVgj1a/eqrcVzUG+qM9qWdsr9a48S5wjA==@nongnu.org
X-Gm-Message-State: AFuF++kekRgrfcm0wfUf2gHWM935IyDuiWq8qtW9SPO/NhdUvUyjaOS/
 1T1ikk2x7VuJrMokAqXs7BkNtB+K54AxA2JkJl/5jtrZygzEBQdudNOVO1nyldokmIdWgFxqsjV
 c7XlgKh+Om40yPXkXA2k7mqA6FLE5ydFmYFHhvaUGGwYhtlc6VE318O4=
X-Gm-Gg: AYBFou3El5vb7BHNd1ZeZcmQz1+DY9hxoVuEvJ2sfWukAIh0Jzt5NYGs+sU41hKgfl/
 0O32haWxmlo8zEfLPt4Vv3R2VLwYRw/poChtNMb7t+TMzuSWwPi3lyD/0N4+D1Z+d2xT9R6o26+
 sAxJYTyvicbFkOR0BtgcomZqEGkits3mg7AmTBGMCajpxOQfTsTWtSypyN9XqvdlJYBfBmAWXzP
 u77jc8xULcttECeUCYAvaW+YEa2xAVFJ8fmf97pgcnY8vsbcrEkrdsXCDTAv7JU4lBqN+SAQ6ha
 Wu5J0SW+eTYhoexjzTwFv6Mhjs2lctnWLxrkZGM6uFOFVCMwOWukZGQeit1IXJ8qgN+nFukADgj
 eL0cwVkbmXNy7SS6Q5muJTxi8wuP4Fuad5Q==
X-Received: by 2002:a05:6102:2582:20b0:7a1:f2b5:645c with SMTP id
 ada2fe7eead31-7a1f2b564femr3461069137.25.1789993814065; 
 Mon, 21 Sep 2026 05:30:14 -0700 (PDT)
X-Received: by 2002:a05:6102:2582:20b0:7a1:f2b5:645c with SMTP id
 ada2fe7eead31-7a1f2b564femr3461046137.25.1789993813676; 
 Mon, 21 Sep 2026 05:30:13 -0700 (PDT)
Received: from [192.168.69.225] (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49fcda2140bsm249586455e9.1.2026.09.21.05.30.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Sep 2026 05:30:12 -0700 (PDT)
Message-ID: <39414f23-09fd-401d-839b-c3fe08aa6354@oss.qualcomm.com>
Date: Mon, 21 Sep 2026 14:30:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] hw/char/stm32l4x5_usart.c: Support 16-bit writes
Content-Language: en-US
To: Jacob Whitaker Abrams <jwhitakera@gmail.com>, qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, Jacob Whitaker Abrams <satur9nine@gmail.com>,
 Samuel Tardieu <sam@rfc1149.net>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Fabiano Rosas <farosas@suse.de>,
 Laurent Vivier <lvivier@redhat.com>,
 "open list:STM32L4x5 SoC Family" <qemu-arm@nongnu.org>
References: <20260921050959.1876719-1-satur9nine@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260921050959.1876719-1-satur9nine@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDE4MSBTYWx0ZWRfX7JrWAjiOHPEy
 XWOppRxvM5QPbnqycr8oTT/85Cqtk5Sknj0Sh6xqJ1Hyi43q+aaelmSfRv52C6oZccy1i/LeR+t
 yUAFRa9MMA9p5exxgNT2S4xpxLx5HbrnhMH/ngim7iSy1aABtt6RNJywl6Hv4LEtnyBlOG6zV02
 /Ms/bEG6VU5fb7gZjmE8TNVcZdWqr2+BvN/KV+2o8756Rxd9z9sx42Dg+8wYXLsVQtIhq3tltjC
 L40dcPi8ceH1afz6K9VH0dg/rTCgyUZxSbkG4LF/usFCX1rsIVtZ+v1U6I/GdzKOPWKADaZmhXp
 jg7ngexDABX4YcWa7sffMUv1xD5aH3WfrpOwrvVMkURSM8lQg3Pgf9f2QsLAnEIc1Nuf0lTAzar
 V+DwSK9mRHLSda/sSwrXSJkzYfZp6I2127hBrKkARdlIO43mBSvYPmSSmnZ6vvwhyhPpKq+agqv
 BK5w2E4HeK04cXFHCEg==
X-Proofpoint-GUID: 2B0_oN-hn-CLr6tPYyIb_oQiSYPQEv5D
X-Authority-Analysis: v=2.4 cv=T/8Z3PKQ c=1 sm=1 tr=0 ts=6ab12356 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=pGLkceISAAAA:8 a=wwpT0siQYdPtGs8qREwA:9 a=QEXdDO2ut3YA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-ORIG-GUID: 2B0_oN-hn-CLr6tPYyIb_oQiSYPQEv5D
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDE4MSBTYWx0ZWRfX7zFvvOy4+GdO
 YZfaGeuPxL5xRvNwEcIinzuekRD4Vs06JN7p7XkQiwb3K4cjnd5dIaa8nyfoxBVRs4R4c3tPHpR
 LcY7b8QyPgG3186h8X5jw3K+WXeSCaM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 phishscore=0 spamscore=0 adultscore=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609210181
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

Hi Jacob,

On 21/9/26 07:09, Jacob Whitaker Abrams wrote:
> Official STM32CubeL4 drivers use and require support for 16-bit writes to
> UART registers for proper function despite datasheet claims.

[*]

> 
> Signed-off-by: Jacob Whitaker Abrams <satur9nine@gmail.com>
> ---
> v2:
>   - Remove all changes other than supporting 16-bit writes UART regs
> 
>   hw/char/stm32l4x5_usart.c          |  4 ++--
>   tests/qtest/stm32l4x5_usart-test.c | 22 +++++++++++++++++++++-
>   2 files changed, 23 insertions(+), 3 deletions(-)
> 
> diff --git a/hw/char/stm32l4x5_usart.c b/hw/char/stm32l4x5_usart.c
> index dd1b099195..3b9883bb23 100644
> --- a/hw/char/stm32l4x5_usart.c
> +++ b/hw/char/stm32l4x5_usart.c
> @@ -521,12 +521,12 @@ static const MemoryRegionOps stm32l4x5_usart_base_ops = {
>       .endianness = DEVICE_NATIVE_ENDIAN,
>       .valid = {
>           .max_access_size = 4,
> -        .min_access_size = 4,
> +        .min_access_size = 2,

Can we replicate the description comment here?

>           .unaligned = false
>       },
>       .impl = {
>           .max_access_size = 4,
> -        .min_access_size = 4,
> +        .min_access_size = 2,

This files defines addresses using the REG32() macro, and
the read/write handlers switch over these 32-bit addresses.

Why change the implementation minimum access size to 16-bit?

>           .unaligned = false
>       },
>   };

