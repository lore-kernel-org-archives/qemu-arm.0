Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7593C43458
	for <qemu-arm@archiver.kernel.org>; Thu,  2 Jul 2026 12:42:14 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wfGjj-0007Tb-Jy; Thu, 02 Jul 2026 08:41:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wfGji-0007TK-7f
 for qemu-arm@nongnu.org; Thu, 02 Jul 2026 08:41:46 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wfGjf-0001UI-Q7
 for qemu-arm@nongnu.org; Thu, 02 Jul 2026 08:41:46 -0400
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 662BoUt3360676
 for <qemu-arm@nongnu.org>; Thu, 2 Jul 2026 12:41:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 HmeWTMY5baCvBxoj9fBfK3yr4ylXRxPCjo0b9RdInrU=; b=kXZ51t0jrbEBGVvr
 qhsBH80zRlbZkfTe3PQh9pGuYhbv+OK+vucOZ8efVQyZZuMC612wBFcXwkeTvnJm
 jTrhFrGIRhVbupg4vUvDds7IyfvfbCR1zR1KybLs+qNV0XU6Gsof1FerqLECIJ3w
 tdH6JKf5+T3AoTzDFM8jsiYyOuGb4UoaGY0bOb8RI4Vv82KOsYV+7sfBWd+thz0R
 OVPKr1RClsLHP7g2Ojcu6khgeF7WdemL5YWX3cSdsD2n2Jq3g7Xa3ZqSLf2NpEB8
 /a+STRe8CjMFTInDKaB+5zUMuT3oFQsEh5VG4ZbS+pMZvQ9MvrhDQ90jp8uYeXEg
 diZQlA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5qfc06gs-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Thu, 02 Jul 2026 12:41:41 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-92e56b2b350so327025685a.3
 for <qemu-arm@nongnu.org>; Thu, 02 Jul 2026 05:41:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1782996101; x=1783600901; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=HmeWTMY5baCvBxoj9fBfK3yr4ylXRxPCjo0b9RdInrU=;
 b=jIMqbYbZKy1VojCqmatlXNSNwHqgboRo9u6mwR+G17/u/rcVcr3lRZGjXOyuCl3TRS
 dknvY4bqN5mE40133WD7ztI6y+Qp0QO2KtP+o4Ybl8EW8OgF9qC8+z70DKzoJGmFvGpW
 D7JzHdWNpuDbigrB3ZJuCqdvow/jZoJsmRNvZYZCQ0L7FaYM+tcGsX6ndvlo2Xe93JYU
 1ZTVeaeJKImoXhmLtV///4mVxxRPIkEul52IYgPPZhF7+qhXX1XwetY5iDn50A6uPWZa
 cdZiQImlGMePSkqnm8bHxPqz0dzF1uMyL+Wsc4S79xmTPVtX4LQehGWm+LsQvFGJxCF7
 D1LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782996101; x=1783600901;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HmeWTMY5baCvBxoj9fBfK3yr4ylXRxPCjo0b9RdInrU=;
 b=RQnYecs1uoJ1R7AHCJ/kp3uaF3pMSuBxvnQgtcYn6T360p3i1SdPfj1bn1odgDSqdE
 hV/EmvgZDfpkQb9it6M/VHbtOktKjwuhI/GFybcGSzKMsv04oTB/LdZkSX8jXH0A1rPr
 nBGUut3nwuaBg+GLChG/Ov8j3Zej3kdAuL6sZtWtUHZQkLv6XCTIPB5OgDOvNqfyHTto
 uZ/s/0vxCcdFrEwNujd5QOs6g/s+ECxisYFRykisx+plLuw2DniCzsd9iLVOVw4+nRsr
 WSijptu7nGsD6q7Vue1u2UkR9yOLcEeI2MkMAo4c5T+rXIv7cSE5OJWiT1Yemi2LNmYQ
 baPg==
X-Forwarded-Encrypted: i=1;
 AFNElJ8LQR4m/7QatgxB5sf01RkYsqD+c8W+ljvEziMpSn3FKp/E2PxYrhXkUVJKVD1ldMCW/rySW8PAog==@nongnu.org
X-Gm-Message-State: AOJu0YwIY3jOBjSZGQDMpeXM1iEVNIKwRr3L44W4lP1r0cOAP/X/5rH+
 E/BF8KENtZTg7FYRP4l5cbfaeiRteqMRWc6lII93mBAvrLYphqogAE7UH0EZHI4e4CVPbXOVNbH
 MNIXbyyUd1royT+EV/YFeVKxRZZH5ttOJyXzfZffOxZyqJUrn8GGbfWE=
X-Gm-Gg: AfdE7cnGb2wdDQFBxw17qSR7TEGydDdaaEaynUNpMivyuE8YOeiOWhkcrd2Qq7YRojS
 gHT4wrQXO5FEEm7mlos2AoDEdVmVU3q/YN2vhw4KeFT1YqrV/6tGDoPjyCrqtKAdBX7PLDvkXz7
 o0OQOqBbbc+NRSjGm3XARKf8wtPuMMpioGlayw5c6qO5wPo8nkZ608TIGmoJbk1KBKOuSWnO3uH
 5CIZJPB9O5h8+9C5iMiMRp6BJLVZnRTmVHMAagQb3zzksXZadDH26yGfHz57qz+eNJk/2EqBXgy
 +hVDRmyR65u1iyMJWaU6ebf3j79E7rhpnqv1eVAS5QO9E7+98vZVcbriLl15lJyDnlIMtO8Fd+w
 rTPKkSoFXZAacMnyCblJxFtXF72GCLHYmRKR/1utULECk26NYgz7dEbIhLhKkMA==
X-Received: by 2002:a05:620a:1d0b:b0:915:ba3c:8c2b with SMTP id
 af79cd13be357-92e782055b9mr786420285a.19.1782996100970; 
 Thu, 02 Jul 2026 05:41:40 -0700 (PDT)
X-Received: by 2002:a05:620a:1d0b:b0:915:ba3c:8c2b with SMTP id
 af79cd13be357-92e782055b9mr786414885a.19.1782996100311; 
 Thu, 02 Jul 2026 05:41:40 -0700 (PDT)
Received: from [192.168.69.212] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-477de3dd53fsm8524669f8f.37.2026.07.02.05.41.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Jul 2026 05:41:39 -0700 (PDT)
Message-ID: <01f8f321-bf1d-4cd2-989a-17ff8e2bb998@oss.qualcomm.com>
Date: Thu, 2 Jul 2026 14:41:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] hw/arm: Add basic FlexCAN3 support to TYPE_FSL_IMX8MP
 and imx8mp-evk
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: Gaurav Sharma <gaurav.sharma_7@nxp.com>,
 Pavel Pisa <pisa@cmp.felk.cvut.cz>, Jason Wang <jasowang@redhat.com>,
 Francisco Iglesias <francisco.iglesias@amd.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Matyas Bobek <matyas.bobek@gmail.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Vikram Garhwal <vikram.garhwal@bytedance.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
References: <20260701224612.48342-1-shentey@gmail.com>
 <20260701224612.48342-5-shentey@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260701224612.48342-5-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: BgJ4gV9CBs1jKoiN2zqYHakSEuBc9YbG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDEzMyBTYWx0ZWRfX0xAx0AtFKSlQ
 kjIhHD6HijNWUC4d/xWorOp6t38UKm2z1jCUyPWuHMnBaCjVM6pdGK3hM9Fcvm0CiKIjNgnkMmr
 TLRD4KHq+Wedpq936hP7bsYGaCNrRRBR5/s9oapmqIY5OnX3kzrNHvwtimTq3vOIlbdDcz5mqW+
 R8P4qRbgADwSlhVODvLDYcftADf7APikvl0ogiB5PCvymLuh/OKHagFx9AFrKNcGCGw5flccIsA
 XOOdPQ1akIKbOh55EcwdyJhzc56YYtRZE6I0RASWfnSKYNYDA4dWgJj89mSZFsZoO5ShU/B7XyG
 QT0Ofx7R9tx0SZnWKy4bn8mPw4bN5NCpLVk6m6dGI4z2O/zSJAdgmV5f49Op5AC8uoE8TmYd7on
 ulwd2Qs12R2jJe4qvnbVTPnVlwZs25700OEH+vw2/af64iSl33h0qy1kd72OVg24XdxX6sh/51e
 0wUmW/vHDnBr92gzQgA==
X-Authority-Analysis: v=2.4 cv=dvXrzVg4 c=1 sm=1 tr=0 ts=6a465c86 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=_2WZOeEKI9IBzgM_DNAA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: BgJ4gV9CBs1jKoiN2zqYHakSEuBc9YbG
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDEzMyBTYWx0ZWRfX8sOYVtRffpef
 L+mttmMDzXorM35Z+I1wk0YMCkpmeuHKFZxHe8IXbk6sH9k4uM3pXmvsuATUYSf9LsjhDNeBzIn
 VJ8PHsgu0kObG/A9Y82a+337kUB1LJM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 bulkscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020133
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

On 2/7/26 00:46, Bernhard Beschow wrote:
> Real hardware supports CAN FD which is missing in the emulation and is
> considered future work. Still, CAN communication already works under Linux.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>   docs/system/arm/imx8m.rst   |  1 +
>   include/hw/arm/fsl-imx8mp.h |  8 ++++++++
>   hw/arm/fsl-imx8mp.c         | 37 +++++++++++++++++++++++++++++++++++++
>   hw/arm/imx8mp-evk.c         | 21 +++++++++++++++++++++
>   hw/misc/imx8mp_ccm.c        |  3 +++
>   hw/arm/Kconfig              |  1 +
>   6 files changed, 71 insertions(+)


> +    /* FLEXCANs */
> +    for (i = 0; i < FSL_IMX8MP_NUM_CANS; i++) {
> +        static const struct {
> +            hwaddr addr;
> +            unsigned int irq;
> +        } flexcan_table[FSL_IMX8MP_NUM_CANS] = {
> +            {
> +                fsl_imx8mp_memmap[FSL_IMX8MP_FLEXCAN1].addr,
> +                FSL_IMX8MP_FLEXCAN1_IRQ
> +            }, {
> +                fsl_imx8mp_memmap[FSL_IMX8MP_FLEXCAN2].addr,
> +                FSL_IMX8MP_FLEXCAN2_IRQ
> +            },
> +        };
> +
> +        s->flexcan[i].ccm = IMX_CCM(&s->ccm);

Conditional to setting this using object_property_set_link(), see
https://lore.kernel.org/qemu-devel/77d5891c-de12-467e-8746-02fe43121e3e@oss.qualcomm.com/, 
then:

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

> +        object_property_set_link(OBJECT(&s->flexcan[i]), "canbus",
> +                                 OBJECT(s->canbus[i]), &error_abort);
> +
> +        sysbus_realize(SYS_BUS_DEVICE(&s->flexcan[i]), &error_abort);
> +
> +        sysbus_mmio_map(SYS_BUS_DEVICE(&s->flexcan[i]), 0,
> +                        flexcan_table[i].addr);
> +        sysbus_connect_irq(SYS_BUS_DEVICE(&s->flexcan[i]), 0,
> +                           qdev_get_gpio_in(gicdev, flexcan_table[i].irq));
> +    }

