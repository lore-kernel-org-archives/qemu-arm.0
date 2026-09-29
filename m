Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1325BCA5FA1
	for <qemu-arm@archiver.kernel.org>; Tue, 29 Sep 2026 12:15:03 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xBWix-0006XP-8p; Tue, 29 Sep 2026 08:14:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xBWis-0006U3-T1
 for qemu-arm@nongnu.org; Tue, 29 Sep 2026 08:14:16 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xBWir-0002cb-9c
 for qemu-arm@nongnu.org; Tue, 29 Sep 2026 08:14:14 -0400
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 68TCDtYI3850839
 for <qemu-arm@nongnu.org>; Tue, 29 Sep 2026 12:14:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 8PcgVB/OhOxxkqbKK8zX/9g6pcduO6zIG1E3/X0yW9U=; b=GmRuCgw+m6rONkTB
 h+MVhIXOKitZ6tEFnvrrPwVbYLh7bJwy8hKbIVmrVOelgcLlX52yR1o+ZjYees1Z
 OlC+HbfWQqbKwL8Ez2S6ModNRqfUtb8JFKshKqVwIOf6imPBPCK9XBd3ojaA7fz5
 a4h2ZY6koXS7bLdnVwD2pjFRp3BUs4LdOOKIo9h6u1FHU7RaLhXHZjlq56HkGo54
 kyGxFuUCAc6Y+lUAzv/UenQ3ycV4X2yPOZCLdehAGr9pktKWuJlnwbsjrEAr80SF
 hhCp/Zd0To4wyfPmHPlQju+mCmk3BVKN67eWoqnanyfbJqxLi7osPTrjDPuv0nZS
 +eH4UQ==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com
 [209.85.222.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0bn1gcqm-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Tue, 29 Sep 2026 12:14:11 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id
 a1e0cc1a2514c-98537d1242aso3675604241.0
 for <qemu-arm@nongnu.org>; Tue, 29 Sep 2026 05:14:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1790684051; x=1791288851; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=8PcgVB/OhOxxkqbKK8zX/9g6pcduO6zIG1E3/X0yW9U=;
 b=AIyx7pWePn3jOcMXr1KS5lcm2svSLN2bZinmpaIksm3+sv1q6VKgES14fZPAJoADl3
 IdtSJxtmTjshI9f0ElffpiUj3dtjIQ6UDTPJ7+z93yZS2wDwBj5pkcjQXT9ZDfL4UzvD
 W+MjIOS+pS5RUz2xFMU9VgSaohUDsxVlNQ3u/Yb3wg7aLp83KZBDBvzQ5gSfibA4bCeh
 VyXzoJsVHeoEDyca6mcdF24qe5Zkg8WmpRMru+TwlbzoqfKnYhZDIk+elFM/ekwt2AjY
 3lk0DK8it6gk5g9OzzM7MaspW9+axum3P2i0xiSipIpbQbw5DyZwKAp/n4XB+5YNDgW0
 FVOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790684051; x=1791288851;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=8PcgVB/OhOxxkqbKK8zX/9g6pcduO6zIG1E3/X0yW9U=;
 b=kKNec8JNLZWUBWl/mxaTkku9Ugb5f4uA29VHL0yFfuPrA5Rb4H1kJoDplId4EhodSs
 XY5H7eQPYVD8Qh3Sfr21n5Zel3ufGrxs2/iJ7G/G8JfjjwX15OLjcI9RHagQ9k41rgw+
 GMyOuKw4nxxqU3wCz7o+joSR5KWqBeYx8CgUHBXg43QL1Bc6/iZUaDQH8rx9rcP0Oqh4
 OkNhi2AYF8Oy2LvEmtWSe9K6tV1OVAiwXSrc7DkgU4exUK/mWjqO8D7PV41aO77XoIoE
 Aq1QCI+P2F7PWja7uDB+n1Q3qVLh64l86G216bOt/iD9ftLqY9wAFxD555BUj0AXlYdQ
 wm5Q==
X-Forwarded-Encrypted: i=1;
 AKwUvBypek7IaLSsHgwf06sSFsUnr1HhfuqnL8TFDypOlZcFXgBckldXa9FDt5stqQGhI674I3h2aIfRaQ==@nongnu.org
X-Gm-Message-State: AFq9FYKDGVyF+JBZaJsJ9Kf5jRmO7SyKIJpu1GkDPBYxL49aeDwptSgb
 FsxVVbnr743AnX0inpVX4SAzMmjswFZl2CqO87Xf8muLUe5i8oQfyzNQDrguiSneeGM28rmWHDD
 eiIR75xcZpU9a+V3FpVCHtI3OdjjqhlcF3K8wmE3v7B+ESRCkO+jxNxA=
X-Gm-Gg: AYBFou3F9X5dg+xxL0dQIeoDZPsIBOEJAFmKLbgDfQPDu0qJF0PQVzbBz8ckL0zs9PO
 6gDhC8D9hcPPvPqSKQihGPh6lF70SWj6K6gfJ5xT1TEGY362YS7KWlpTky5trk8l5oqBMQ67ykv
 TMxFibvRc4DE7Oz/rF2fCrEUnnY1lW6MPF3nl96O4TKhPIMNdA6EMpdwsQXvg7S8D92CQ+bPVPX
 aJbZ6kNLvCcKl61qhNPu2b2xKuKXXCYyRzmKCMPBYkAzz7NE+uEu9q4mvVRnxkoI2gT1aZhf41A
 9hegro6ikTMHSN4HrN9YbnDp/So2huoriytBK05QxgfOATKNETgCef61lRrooGd8F57mg8J5xkp
 KyMy66114UYVNyuZTuWpEroUIXgv/gw8z8Q==
X-Received: by 2002:a67:e703:0:b0:7a7:36ac:b17a with SMTP id
 ada2fe7eead31-7af1e4f6353mr5257312137.20.1790684050900; 
 Tue, 29 Sep 2026 05:14:10 -0700 (PDT)
X-Received: by 2002:a67:e703:0:b0:7a7:36ac:b17a with SMTP id
 ada2fe7eead31-7af1e4f6353mr5257303137.20.1790684050454; 
 Tue, 29 Sep 2026 05:14:10 -0700 (PDT)
Received: from [192.168.69.225] (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a00c11a9d2sm85583755e9.3.2026.09.29.05.14.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Sep 2026 05:14:09 -0700 (PDT)
Message-ID: <03a8bb81-5526-4bf4-994f-68dde5af87a7@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 14:14:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/42] tests/functional/arm: Add console test for
 `sabrelite` machine
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
 <20260921214710.29422-8-shentey@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260921214710.29422-8-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA0OCBTYWx0ZWRfX2dTsYSdLaSyb
 pGKCh2JUZlY6Qc9ire58n8VV077N6D+XRYcgIMvl/yD+70DxZ8saUopfcWTvkb3708k6xYMdfGm
 cuUbnjZ24ln7PMC8woRbrzZUbhbKsxw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA0OCBTYWx0ZWRfX+I1D2lmtw7OS
 eHqORDDQ4pPzc2bUZqdrSBEiwChLHEeGvlyFVC2T+zoRfUKwNmAzlYfIvymB3svX1hRKd2CCB1G
 3gcC1nLfHHWx1f/Lb6MVSMvDLwnHn1MrHR0wYEnefjT1JStrJZTreiCp0FFM7fjTACGvbFYr2th
 /UaWuEyVGo+Eyb2IyuFPGPxJB4IVyB90TiMHfBcntmr865l7njWImroBg1pyyHnFwx7jVN5T3U8
 kUD3rDjiK5A38JoCz+GUaeFIdgvoMW2cYh1o7UvAex084Tv4rHIvNqHNwHJg/DChk0J4wFytBGp
 xSfktXEPS80An7WM3YMdbO31RgIB8DQ4ITa/EWPURdD9ShPZH0G2TVvaHjqwa3rmHVyLsxiPd1Z
 7tkwXcOdAPyY157fXoCqRgiKSKn7YZ4EbVZDthwcDJUOagfL0aRYIOiftuLjT7VcMfLDxSYFRtH
 GjVBl3boP2GtSGo/cOA==
X-Authority-Analysis: v=2.4 cv=JMiuIMKb c=1 sm=1 tr=0 ts=6abbab93 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=1tSEMpTH9XP_W59IOagA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-ORIG-GUID: xikKKo9pW0O-94pfmkZG5zF8jmvcqc3-
X-Proofpoint-GUID: xikKKo9pW0O-94pfmkZG5zF8jmvcqc3-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 spamscore=0 malwarescore=0 adultscore=0 clxscore=1015 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609290048
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

On 21/9/26 23:46, Bernhard Beschow wrote:
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>   MAINTAINERS                            |  1 +
>   tests/functional/arm/meson.build       |  1 +
>   tests/functional/arm/test_sabrelite.py | 46 ++++++++++++++++++++++++++
>   3 files changed, 48 insertions(+)
>   create mode 100755 tests/functional/arm/test_sabrelite.py

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

