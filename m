Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCB5CC61DC2
	for <qemu-arm@archiver.kernel.org>; Wed, 26 Aug 2026 08:18:58 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wz8py-00043s-Az; Wed, 26 Aug 2026 04:18:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wz8pn-00040k-TI
 for qemu-arm@nongnu.org; Wed, 26 Aug 2026 04:18:11 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wz8pl-0003Bc-W7
 for qemu-arm@nongnu.org; Wed, 26 Aug 2026 04:18:11 -0400
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67Q6Rli63783819
 for <qemu-arm@nongnu.org>; Wed, 26 Aug 2026 08:18:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 3+WSFZVsd+XMXhssURlYCVCvseeX7+c7BkQqZ4kj+og=; b=Ht7SjjV5aYDbww1M
 y6AF9vpg1lu0R1XmEldrDTIL6Pfu8iTi7T/mkTIJ5OA8p27mjRKYntcO+ZDfCPLa
 ZVDWdeCebKtHDooWr8DVZkBaxJDP+LjyzsBEgtVNRDT30DJfkUutaAsC+r5f34Ey
 xE2rbYFF3jM1OjJZBPqCaeqFNakLstq//bQyVlzydvVidtFiFVqvnosCYO0pghSe
 5j7zW+Sr8ThJyP8Wi90xZ+dUtJQo2at+Kxa5jbzaw5rZGS9lHX6VP0mm4xehtL1H
 /oBV6tSxSSK3eG5r1ZX/7AtidmcNSzfnhiISBjB16td9pf/ASvcyVJuuCB3AVSK3
 i6lWnw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9s9g8us9-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Wed, 26 Aug 2026 08:18:07 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-526da7e3c9dso6478901cf.1
 for <qemu-arm@nongnu.org>; Wed, 26 Aug 2026 01:18:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1787732287; x=1788337087; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=3+WSFZVsd+XMXhssURlYCVCvseeX7+c7BkQqZ4kj+og=;
 b=UUy0HtrbxvRGA1HNTEgfVP/W9ehMXiko1NIIcbGTga+rFhbP/7r2RMO10+5Hx7zvD9
 qc344kyG1oHqonzo27LDk7jdet/88nOwWVCSWJu20/9Xq+Y6xU4/yxu2/OY3TmuJSLQQ
 IkxXBfxMGykjTCdSorj20pqS4+1zY5mUw0s4ok/45l7NlqD8NZlWoH8pfK15xaVewA0u
 S+wbRL1WImDBdECogjHaVME7bYxGuX0dvPud5QC76R9Bh0P4EVpDOhuYKO3gHcOIK/VH
 sqlwwprqYsET6OmMGNywRNcL3E8WlAjlb7m86dSeH1pnPLfd59i52rAYSv+03nmxYkz7
 TAow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787732287; x=1788337087;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=3+WSFZVsd+XMXhssURlYCVCvseeX7+c7BkQqZ4kj+og=;
 b=GiXv+Vhq7bpmmG9YG97pl8iHlO9hpTqSqG71PP99H2145hq+BdNpnlNRukpfaWTL9O
 0HpM32JHh5K+mSXfoSzKDqKcFbUlhcnOKxoe9u5tuoULgy2w56t1TC25i/QhfBJRgk5e
 7vvoKPh5ApqipYLMumX6akixJ4iIKALV89t/ZYlYWgU+2YgngIGfXTw+nVZ+NUGTWYHk
 wXJX6mG0kdbusma96WalTns8wJ1PzkGGT60U7kUWaApetawcMRV5iZrhY9Cc3hPqieiK
 JcRaikDIBxRaDC4Y26dSxInxi6mk0ZjszoAoKxJCC7gDcsHRFghjjnAcTRxhFx6RJ71F
 xjFA==
X-Forwarded-Encrypted: i=1;
 AHgh+Rpbj+b34C8xcbQVaKAI1TW4oxSwGluxDO5fHojN+v1sGDpFfIrdqO8owW7m1Fp1SQKYAkeSJ9eBDQ==@nongnu.org
X-Gm-Message-State: AFuF++nrMD9oKqOLy992LmwOzZkm0rpeSxcWpRpty7qZaEuUY1YsC6aK
 FOdUh6jnQT+NCUCTBQCZ03hYvAa8dI7vQsfs9xjJj+CMCQ/UXsOwOxC54RSIRLXKCqiiM+q3mp2
 DDRactEl1oTn3da5GqawEUaynRn1LEbMCIulu7RUGNnXbsQ5vj/Km5nQ=
X-Gm-Gg: AR+sD11bz3DyMQnbfwJUnjrp19x6c1YJFtlSD+utllcf0chZyEwg8mG+gULwx9/K6Zs
 RhxFXOroAJEmxep2F7+eG0NInKEBnTYjqfllUsRjavmvV0xzJ3xb6YBI/lh5gCS5JqCdXg+pO/+
 Lm16c6nzr8YflI2lcLdGTvazHmk4P+kK+edHMzk1vRXRvJ7S/GyD59TIS9mBuvvEDOIppn8VXBE
 tVE6nHt7zwBVpwk3IjzUFJuuFaKeYeC03QRmLw5wu4vHckr+6k2ROgPxPfWeD2BHTTW8MtjO6qY
 Yo+O2Ez3ICA0XCmmWOq/OWxErNdaF8d7BcpmTIXO1WGgp27aP7DzRk1qxJQvl7Qk48icviIY5ne
 MYksp3WoiFJwft/6pfIBWo6uS937U/gRHMNXLyg==
X-Received: by 2002:a05:622a:514b:b0:52e:3ecd:add6 with SMTP id
 d75a77b69052e-52e422f2c93mr51269181cf.18.1787732287321; 
 Wed, 26 Aug 2026 01:18:07 -0700 (PDT)
X-Received: by 2002:a05:622a:514b:b0:52e:3ecd:add6 with SMTP id
 d75a77b69052e-52e422f2c93mr51268951cf.18.1787732286906; 
 Wed, 26 Aug 2026 01:18:06 -0700 (PDT)
Received: from [10.254.188.74] (14.89.66.37.rev.sfr.net. [37.66.89.14])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-499dca8b84esm17805935e9.1.2026.08.26.01.18.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Aug 2026 01:18:06 -0700 (PDT)
Message-ID: <a665849f-3b20-4ad3-a35b-02259e882628@oss.qualcomm.com>
Date: Wed, 26 Aug 2026 10:18:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/8] Add Axiado SoC AX3005 and EVB
Content-Language: en-US
To: Kuan-Jui Chiu <kchiu@axiado.com>, 163wangjack@gmail.com,
 qemu-devel@nongnu.org, peter.maydell@linaro.org, qemu-arm@nongnu.org
References: <20260826074635.2850931-1-kchiu@axiado.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260826074635.2850931-1-kchiu@axiado.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: lL0uCk5SBY72FQbI3A8IuxOJgvaCOZ-d
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDA2OCBTYWx0ZWRfX4mjObUn96Kwb
 WKQxMFB/NUuLhGL+8KQpIT/RfsUlNU2PkObU5EWv2HrFqeRj8TQosd0ayAfD946m4xue5B7L5+v
 6zmCDqFThVOtM0muP6ZxFsYfWZmYR5M8m9mP5SLeYpIJKOw10Jab0fqsqbzeKLoU2z6xKigTW4m
 rI+B5j5XjcFJ+MOzScloJEd8NYG0y9biRMryLz20CdyFzlf3vLgxGoE58b+b8wVtus4VmnY9AKN
 cnnMzzmxzvjnST+s96iFTs/dlcCSyAD0YwsnTh8pzEXVu8FP6f96wafFRdddCRdErH6QB5z2mT1
 HRoqy3QUuEDfdntQXq+pdLLT8Gf2Dst/gHbkiPwCgw6W9O08N7uBAhEue/s5DwivMTcAPXC05by
 zmW0t6pl4a+fHksZeA+n/1veMwqfvyUNoKjEIEjLC3IEwRpVyNBgqWWG+62lEz2OmY5Yl4jl027
 2p9CSx8NqjVJZN3X/+A==
X-Authority-Analysis: v=2.4 cv=Xfq5Co55 c=1 sm=1 tr=0 ts=6a8ea140 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=JQZmDyB7+sUo+n2VpL1TLQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=440cDlBIAAAA:8 a=Phlv0Cn5_5x1N3eyB9wA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=d9D1X1bx8dWolqnE4HNT:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDA2OCBTYWx0ZWRfX46nM/qq6asHk
 cz83D44MS7xVqicuJdRp0GkjA5lil0EOgjmqquWUJQBT/XITAB+5KZeBFwsi01bCf4zZKMWkP/y
 jDhOybuYHSOA83R+Ra/7c9IiFQcbn/M=
X-Proofpoint-ORIG-GUID: lL0uCk5SBY72FQbI3A8IuxOJgvaCOZ-d
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_02,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 priorityscore=1501
 bulkscore=0 clxscore=1015 malwarescore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260068
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

On 26/8/26 09:46, Kuan-Jui Chiu wrote:
> This patchset introduces Axiado SoC AX3005 and evaluation board for emulation
> The model for Axiado SoC AX3005 supports
>    4 Cortex-A53 CPUs
>    Arm Generic Interrupt Controller v3
>    9 Cadence UARTs
>    1 SDHCI controller with PHY
>    8 Cadence GPIOs
> 
> Refer Axiado website for more product information
> https://axiado.com/products/
> 
> and minor changes for the compatibility with existing AX3000 SoC model
> 
> Test plan:
> 1. Verified the machine "ax3005-evb" with following command
> 
> qemu-system-aarch64 \
>      -m 2G \
>      -machine ax3005-evb \
>      -device loader,file=bl31.bin,addr=0x88300000 \
>      -device loader,file=tee-raw.bin,addr=0x88400000 \
>      -device loader,file=u-boot.bin,addr=0x80000000 \
>      -device loader,file=fitImage,addr=0x80100000 \
>      -device loader,file=obmc-phosphor-image-evk-ax3005-qemu.squashfs-xz,addr=0x80B00000 \
>      -device loader,cpu-num=0,addr=0x88300000 \
>      -device loader,cpu-num=1,addr=0x88300000 \
>      -device loader,cpu-num=2,addr=0x88300000 \
>      -device loader,cpu-num=3,addr=0x88300000 \
>      -nographic \
>      -serial null \
>      -serial null \
>      -serial null \
>      -serial mon:stdio \
>      -drive if=sd,file=obmc-phosphor-image-evk-ax3005-qemu.wic,format=raw

Could you add a functional test? See:

$ git grep -l obmc tests
tests/functional/arm/test_aspeed_anacapa.py
tests/functional/arm/test_aspeed_ast2500_sdk.py
tests/functional/arm/test_aspeed_ast2500_sdk_515.py
tests/functional/arm/test_aspeed_bletchley.py
tests/functional/arm/test_aspeed_catalina.py
tests/functional/arm/test_aspeed_gb200nvl_bmc.py
tests/functional/arm/test_aspeed_palmetto.py
tests/functional/arm/test_aspeed_romulus.py
tests/functional/arm/test_aspeed_witherspoon.py
tests/functional/arm/test_quanta_gsj.py


