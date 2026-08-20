Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1203BC5DF87
	for <qemu-arm@archiver.kernel.org>; Thu, 20 Aug 2026 10:56:16 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wx0RE-0005mV-N0; Thu, 20 Aug 2026 06:56:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wx0RC-0005lj-O8
 for qemu-arm@nongnu.org; Thu, 20 Aug 2026 06:55:58 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wx0RA-0007Qf-68
 for qemu-arm@nongnu.org; Thu, 20 Aug 2026 06:55:57 -0400
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67K8PEAJ2465472
 for <qemu-arm@nongnu.org>; Thu, 20 Aug 2026 10:55:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 XJzehq9H+HHmqSUS4SZMP0gXgDCb7fqVfe8DvcbZk2c=; b=Mg0xyIvkPn/AfjZo
 /SuwJVMHFMTwXBM4IAZ8/vUSNu+FWlpnwc5bgCZ9SGEM1viAiY4Y1nI7dl/Hoavk
 Qg9Kgsy5LJZs7QiPfiTfXCnNgMH2b1CFDTCmRVpB3vBrM65+pN56B7EZH5nXoTCq
 lKX+ZmFqkCnZXp/omJcQweC0f8GI/v6aRiXRf/yaIFTMwodtT1kSLjybxP/44rMl
 VDxI36HsOx991Lo2DZ3hmV4IhP4+7aUpFIyTN8O6MVBkf/L5nBA7aBcmnj3Lp/71
 Q7fAVfbaX7JTw0ROisFgZJwo5eS08GGjdIIsOK/0CtzQXbezvlwulST66AkeYVQ5
 v5tVzQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5x29gk9m-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Thu, 20 Aug 2026 10:55:54 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-936d067836eso250085085a.0
 for <qemu-arm@nongnu.org>; Thu, 20 Aug 2026 03:55:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1787223353; x=1787828153; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=XJzehq9H+HHmqSUS4SZMP0gXgDCb7fqVfe8DvcbZk2c=;
 b=JMSsjqTryxTG9L74PNuUTgLCFVfaZWXNYRILgQSzkFeXdNixYmCu21LQpv1Z8Q51SD
 x3nFi4W3Z+QwhYPrJ0pGR7z5wWC+HXV8VKo+fR5UUfAFt74YLH4mIdJFLmwR0lZ7Qm0c
 XbC+06oW1OjQ8gFaEhQEz2OAYjnFUGDfopJxQpA1QGOo6268pMIyqlVnpaxGuAVVBGcN
 si/zk4r8gqQJarWyhHIbehVIo0/2MBEG0yVBKY2RdeTZaz+K7glL+87KdLQKOOU6n4dK
 JPLv0xLKCu3y8mCFenypUHftpmjaoaQyqbvvsx88fhaXC+aaVVhEUa41feDJJb7bqMkS
 5y8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787223353; x=1787828153;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=XJzehq9H+HHmqSUS4SZMP0gXgDCb7fqVfe8DvcbZk2c=;
 b=qMDhvI/HWZDWrWUTk+35PboGG1et8vRQ7Rx+HJ5Q6LNz1topLc9QUJyc19q3da814s
 9H1lIcSIHzeXuffbWmGn/52+CMLz4nMrO9Come5XEkIPI+RGO1Nsi4I99JB0RHAFWY4Z
 vCFHLQed32R8jAkp0wJqylKNRmBvNQbZc2BMf8V97cB51lF3p+P9S1uguu2NxoJKa88k
 D0aAbECCkYNPUjILF122PhcIDm6snjArmSW8Z83oKg+3qBsOJs/BBuY4wMdWnnmNyQeX
 kSMLqJ74Ph7viry6GcFDtsZOVus/u+qFv5Rc0kFXJQl/RLnP5Onxuy9hdwS4fWlDY9jT
 SiNQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RpsRKfr4lInRbklp7qBSoExKDwGuh+MuXB4yN0DveeoDW6b30zqlNn/gecgLz9V7T6thFCGLqqVWQ==@nongnu.org
X-Gm-Message-State: AOJu0YxO+Fw1nRTr96MEj9CDH7axNE8tfX3T3R2FR98YZwnLpyB9+Mfy
 WdiJTDzDn57LMHiycYTEljm2oambTtEx8mo/DmqM8BmxCd2xmzQETptNUl4336k/0QQ/IyyaGbu
 IiHWMyoqhRQSi8eD15VFML2YpqiwZu0XkhcpnLtS5rNFn3easOtbUYMRW0puUHD1i1g==
X-Gm-Gg: AR+sD117svB1yDzqUNKcl75bTlY6cbz6kTTR05tYo8MSZF2azAusQjX5TyNpxMPHC2z
 apUBGYkD3EkHDImmBM3GU/EQMIvIDDbiLDMPnj6SjpaTpX4c4cgk5O3oBPRQyVS5Yor+uPG31Jr
 J7qHauihGYcWsNjeUfqZ4ZtTySKiahMrH15fmwL0VgZBBQJrntOKUoebRyh3IO2Q0e5ID6x9xc5
 YdSJNbo35CHISa3PQGBmiA8v0VSTk6+V8mOjjX080714X6ijrBdSCbZrirOi4LOOvBd/ecFCWr+
 p3jYJCuNdNqM1Ny3A9rvMsdx+CoJJuQIOzb20WtEJUiW6DQBDq4k/MlGv9C5MJE7xD3h4zHGJlV
 MukiiMochmUSCVhnOORCp1GSPbS2CJ0BK5ag=
X-Received: by 2002:a05:620a:6c0d:b0:92e:57ae:3a53 with SMTP id
 af79cd13be357-9371e256628mr1040154685a.9.1787223353585; 
 Thu, 20 Aug 2026 03:55:53 -0700 (PDT)
X-Received: by 2002:a05:620a:6c0d:b0:92e:57ae:3a53 with SMTP id
 af79cd13be357-9371e256628mr1040152185a.9.1787223353166; 
 Thu, 20 Aug 2026 03:55:53 -0700 (PDT)
Received: from [192.168.69.231] (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-499aa1111a7sm137182745e9.6.2026.08.20.03.55.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Aug 2026 03:55:52 -0700 (PDT)
Message-ID: <2cceefa5-e087-4c91-a57d-391963cfdb7b@oss.qualcomm.com>
Date: Thu, 20 Aug 2026 12:55:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] hw/arm: Remove the 'musicpal' machine
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
 Jan Kiszka <jan.kiszka@web.de>
References: <20260819185430.3467629-1-peter.maydell@linaro.org>
 <20260819185430.3467629-4-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260819185430.3467629-4-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: fV04w2BG-pja9rEPh2qnrYYJ4oLcSLyG
X-Authority-Analysis: v=2.4 cv=V8BNF+ni c=1 sm=1 tr=0 ts=6a86dd3a cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=gpnIO3m2qDfVEuVCFyUA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDA4MCBTYWx0ZWRfX6OXPMgdXBZfy
 RZwFYzcrgYFQtesLQYRXK1yAe/kpkfKN2S5rvS8c6xVUqn3mKxEpAiwG1eZn5tYwEQvuPFYduvq
 WMvhghZXEjBr2bA06Ya2CHtKDkrxeDW9P5JHK7QWo0Sa3TewcJW2V/9YPoaSIw53afTkIRdeUtq
 1gK5P44L04crIdcYGne3j6TVkeKxjh7tw4DvYZS+fmM5Xk+ruWYqAOni9zsLs8cErlSCLXxwsY3
 BNGPyiZ481bLI8TtNgononiLeshFMERADC6MF12ipJMz5mala6Tce50UoEexIGCU/QDESmJYZVa
 jtojLmsmrTsJCaLhmrtfkNaE8U99//CIU/fKWWLqTbgqw7aHnr3CfyE4AMnZ0t2r0wDAfrJ/HrZ
 LL0Ttc5EyJIQYXRlSMZ3OeDE8ylscxlFPAwcdvg3zRxHMyAFLhA4aSeCtAJmg+m+Nk2bb4ed943
 hofNu464lyc/gvJPGlg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDA4MCBTYWx0ZWRfX/JS80GifX0AE
 7lpELDyDH5zh24BFoljH93j4cLl/9xrjoYQlxs8Jg6+w1x0m3vfbewek2cpeBLCwnAO5fs7bKG0
 S2Me7U3VtAkoxerFWZXqIgRBzqN87yA=
X-Proofpoint-GUID: fV04w2BG-pja9rEPh2qnrYYJ4oLcSLyG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_06,2026-08-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 clxscore=1015 bulkscore=0 adultscore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608200080
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
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

On 19/8/26 20:54, Peter Maydell wrote:
> The 'musicpal' machine emulates the Freecom MusicPal, which was an
> "internet radio" released in the mid-2000s.  The stock system used a
> 2.6.16 Linux kernel, but as far as I'm aware, support for the
> hardware was never upstreamed to the mainline kernel.
> 
> There are a number of reasons for deprecating this board:
>   * The hardware is now solidly obsolete
>   * It was never supported in mainline Linux
>   * The SoC is a Marvell one with no public datasheet
>   * The only QEMU changes to it have been the usual tree wide
>     updates and refactoring work
>   * The only bug report we've ever had about it has been one of
>     the usual "bug found by static analysis" kind
> 
> But in fact we can just drop it immediately, because in commit
> 59754f85ed35 ("target/arm: Do memory type alignment check when
> translation disabled") in 2024 we broke the boot of the standard
> firmware image for this board.  (The image's u-boot does a LDRH to an
> unaligned address, which is UNPREDICTABLE; we used to let it through,
> but that commit makes it take a Data Abort, so the image crashes
> before it boots the kernel.) Since nobody complained, we can deduce
> that nobody's actually using this machine.
> 
> Remove the machine proper, and note this in the docs.  Devices used
> only by this board will be removed in subsequent commits.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   MAINTAINERS                             |   10 -
>   configs/devices/arm-softmmu/default.mak |    1 -
>   docs/about/removed-features.rst         |   10 +
>   docs/system/arm/musicpal.rst            |   19 -
>   docs/system/target-arm.rst              |    1 -
>   hw/arm/Kconfig                          |   12 -
>   hw/arm/meson.build                      |    1 -
>   hw/arm/musicpal.c                       | 1388 -----------------------
>   8 files changed, 10 insertions(+), 1432 deletions(-)
>   delete mode 100644 docs/system/arm/musicpal.rst
>   delete mode 100644 hw/arm/musicpal.c

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

