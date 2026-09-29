Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06522CA5FA1
	for <qemu-arm@archiver.kernel.org>; Tue, 29 Sep 2026 12:39:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xBX7Q-00034W-S4; Tue, 29 Sep 2026 08:39:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xBX7P-00034C-Oc
 for qemu-arm@nongnu.org; Tue, 29 Sep 2026 08:39:35 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xBX7O-00069h-1F
 for qemu-arm@nongnu.org; Tue, 29 Sep 2026 08:39:35 -0400
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 68TCE9Ce3757540
 for <qemu-arm@nongnu.org>; Tue, 29 Sep 2026 12:39:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 WrIbVyUSzfLa5rUz+mKoro+6Qo0vhVKtI9RsIRZl714=; b=n5uMV2Qk5LO5LWiJ
 AIB67VamCjlKJxNyDamq2kN8/xXT5g1QxIg40gw3mBRHfvr4Htr1DSPRaXDMoUQZ
 pqzjgtZ9MWzkSdSbhgTqP/7ZTqOxip4kJUWV1dUIx4jh02HuMqeexuUas5t17par
 M3NYzcjhXQU2R801eOhWTO5FGEpbcJ6M0LN5NdxyNKTDoCMDBJnmuBxgWapomsnE
 x6K4p6lAgp01wztd3W74MkhfOR03tHpvrSdSOiM+olx5hATPmgXRYOZXcSkyENVF
 w+LU9OAhQwVhQ1sNx0pkt1XZ0oYeF00O1gEX3jqTzRynrUeqm5TAT8ULPJ65mHjo
 xzAmSA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0b0v8p8h-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Tue, 29 Sep 2026 12:39:32 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-93a183a0e93so902673485a.1
 for <qemu-arm@nongnu.org>; Tue, 29 Sep 2026 05:39:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1790685572; x=1791290372; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=WrIbVyUSzfLa5rUz+mKoro+6Qo0vhVKtI9RsIRZl714=;
 b=UOzkR1s6myUGGKeHu2T/4UwZYP9txNZa3yxS329IRgwU9GzeqFsOA5YPtYMAm3N+we
 esIB7CDWRHsvBklsYMUrNQNmQ1u8j0mENFl/7Z78ST3EaNaXbbXtdZWYyi1qK6YhzdlV
 TMyuvzbBV3hOQhj6QlXZ53KbdQxAa2DEqkX0Kw+rEcjQVbHgCftdCiIuPos8VfhS2ku3
 Lh/zLf2CbTBz44K8ZZ2aFqPkhEOF8kyMcynAWdktB/oU9Dl4TxnDOlAGK+Julfc62nJE
 5zno5x77AmJzKEzZuUn6PNvlh4bEmLBaQXQclGYu1a4JZVKcGmANSlralA3kOFbdEwek
 3P1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790685572; x=1791290372;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=WrIbVyUSzfLa5rUz+mKoro+6Qo0vhVKtI9RsIRZl714=;
 b=xEbEFy+JfIhYN84lid3iDL0HmXU/H92hRAHJf1SBmEd2yCpovz5qH50TJY9b47ymbB
 dogsplvPzzI+sm7OCvwrdB96hsmnIEAGxd8AxPIR2piENQZgpn5oG8Jsr59TAZndagno
 eWlOQPgXeiCt29+xiAkt9CMR0sdZviWJKu1fRUljBKHRhKZqLDwkTYOqQVqVZJPd5E8W
 8qkldaamqdivE9TlVdc1lkuG2p8GvQrunoy/99llV51Yl7wfe6Cs0XWJfI/icvcBkjrG
 Phl9X57uf7/SGQUClLy6A+VDPg7V9tgYoQzVb9MasxOfLBtdQsb2w+dHWvK3VurONx70
 AURQ==
X-Forwarded-Encrypted: i=1;
 AKwUvByNIacqjpXHa/PwuurT2G2+1cMWbbC4V7RCiH+pGO3ceXYeIuuq5SV7mAa33ug+3jDOTswDnV9EQw==@nongnu.org
X-Gm-Message-State: AFuF++lYEaIg2SrJ9OrPFER6kRuc5P9mJTRkZN8eJNNpnXgXQn2TIyve
 7Ov1qk7947ZUl5BrFoZMz8E5Qj0o2hJzdjRnXzPcPqyZW1iiFws6BsXzGcKNIuc0grpE/xH8NTR
 KGF7wEqTYb+IZXQBqDIW/rlX+osjCYdYf5HArAvszzVZSm0CzSdAQ2lM=
X-Gm-Gg: AYBFou39uhr8zAZF7yDgD40FvePfgrNKgh9DardKy/6ElCg0L/h4IxisROo5iIb1Cja
 j7d0dxmLy0FhYpWZWo4UMT7tCasRiuxxf2SZGJQjOsYULtTxnpVjHX6wLeLPFRzqlz89FPe+KLV
 3K9LLbFeVHmGhoUn9Go88SaqQAaIUGxZZu//+b9Jw/Mf3okf8Wr4aLu/Xaz2M/nC2OffOeHCOZi
 yKaon64GEIBlSYV12/76FNtN2/JO05LNMZ5rJGCvX3xZqb+i38r24jKn6JylfH8eQB/IQdPH20C
 gZuwfqyfPESIN4S87abde/U4AQmfjju44qe2I5ZEJpeeh9q5fixO3ug56mbN0ghBT4CEW2n8OMr
 VI3O9poWvdO6qiKvg89M6GsaaRpMUlRAYXg==
X-Received: by 2002:a05:620a:4621:b0:93c:65f2:7d63 with SMTP id
 af79cd13be357-93c65f27f7dmr1839548185a.31.1790685571823; 
 Tue, 29 Sep 2026 05:39:31 -0700 (PDT)
X-Received: by 2002:a05:620a:4621:b0:93c:65f2:7d63 with SMTP id
 af79cd13be357-93c65f27f7dmr1839541785a.31.1790685571276; 
 Tue, 29 Sep 2026 05:39:31 -0700 (PDT)
Received: from [192.168.69.225] (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48af5030037sm4402644f8f.8.2026.09.29.05.39.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Sep 2026 05:39:30 -0700 (PDT)
Message-ID: <d50928dc-f932-403e-ba86-b0708555f9d4@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 14:39:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/42] i.MX fixes and cleanup
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
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260921214710.29422-1-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: HN3iqcas1m9EgBQMu_cde_sxpsrC0Pub
X-Proofpoint-GUID: HN3iqcas1m9EgBQMu_cde_sxpsrC0Pub
X-Authority-Analysis: v=2.4 cv=Z+55j3RA c=1 sm=1 tr=0 ts=6abbb184 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=lRzVi2rJxygfGRSwakgA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA1MCBTYWx0ZWRfXy4grmoa/sZL/
 Gi1IrZaE/SCf7lxW1n84RqdV45+DxaI8HX3VKiZWTfDytsXoTtwZvYCehSE2+R/pC+J1+S2mWxq
 WfhcA5K0dpYHRKdFcYZ2CAu2Ioq8uNbRvs6jPvDVwrqPTOd+NVbytC9LzhUuRpt7mzHu0X1hXOP
 sloNkmXiheRl8sxgddX45xDZqR93NWMHHVgPYJp1oSVDjKDGOhRXnGUXzEH4+lwd/82G82rXIfL
 OtzP2G9YTkcNBWu/BVoz/OxqdP0yD9CblGhtLjHdUlJ/bNAGxtei27xHqriU098Qz6bHZammxu8
 MvBEF7E/0wy+1r6u/RrS4sgchKomM2I7Kz2ZKauLMXlWv386fZJOUNiGgXN2a5szH6eGbwvEd6F
 HDyFh3NvU2BbpyiYniUa17kEMulcTP55UZFnOM7wB1iK0nOw0ltGH5gGLEkAtbCu9Qe8g/LEbNA
 3/wKkGIxF5ALMMKde6w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA1MCBTYWx0ZWRfX53ta7bGM6WWo
 8gYg4jYLwN3Ulj4OehTdtHpHut1MSnRVWWKIL+KtmrOugxlAM1Nya5DSFc9A0UFZA/jbEMm++eB
 5065OvEP+bxA8/5y/6dMFu3FYgO15mk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 phishscore=0 bulkscore=0 malwarescore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609290050
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

On 21/9/26 23:46, Bernhard Beschow wrote:

> Bernhard Beschow (42):
>    hw/watchdog/wdt_imx2: Fix handling of write-once WCR bits
>    hw/watchdog/wdt_imx2: Remove unused attributes
>    hw/arm/imx8mm-evk: Fix reference count of SoC object
>    hw/arm/mcimx7d-sabre: Ignore memory transaction failures
>    docs, tests/functional: Drop redundant CLI arguments in imx8m*-evk
>      invocations
>    hw/arm/sabrelite: Have 4 CPUs and 1 GiB of RAM by default
>    tests/functional/arm: Add console test for `sabrelite` machine
>    hw/arm/mcimx6ul-evk: Have 512 MiB of RAM by default
>    hw/arm/mcimx7d-sabre: Have 2 CPUs and 2 GiB of RAM by default
>    tests/functional/arm: Add console test for `mcimx7d-sabre` machine
>    hw/arm/fsl-imx25: Derive from TYPE_SYS_BUS_DEVICE
>    hw/arm/fsl-imx31: Derive from TYPE_SYS_BUS_DEVICE
>    hw/arm/fsl-imx6: Derive from TYPE_SYS_BUS_DEVICE
>    hw/arm/fsl-imx6ul: Derive from TYPE_SYS_BUS_DEVICE
>    hw/arm/fsl-imx7: Derive from TYPE_SYS_BUS_DEVICE
>    hw/timer/imx_gpt: Wire clock control module via link property
>    hw/timer/imx_epit: Wire clock control module via link property
>    hw/arm/Kconfig: Select missing UNIMP in config FSL_IMX8MM
>    hw/misc/Kconfig: Remove redundant USB_EHCI_SYSBUS from config IMX
>    Kconfig: Extract config IMX_AVIC from config IMX
>    Kconfig: Extract config IMX_GPCV2 from config IMX
>    Kconfig: Extract config IMX_RNG from config IMX
>    Kconfig: Extract config FSL_IMX7_GPR from config IMX
>    Kconfig: Extract config FSL_IMX{6,7}_SRC from config IMX
>    Kconfig: Extract config FSL_IMX7_SNVS from config IMX
>    Kconfig: Extract dedicated config FSL_IMXx_CCM from config IMX
>    Kconfig: Extract config IMX_GPT from config IMX
>    Kconfig: Extract config IMX_EPIT from config IMX
>    Kconfig: Extract config GPIO_IMX from config IMX
>    Kconfig: Extract config IMX_SPI from config IMX
>    Kconfig: Extract config IMX_SERIAL from config IMX
>    Kconfig: Remove config IMX
>    hw/vmapple/Kconfig: Remove unused GPIO_PWR dependency
>    hw/arm/fsl-imx8m: Fix typo
>    hw/misc/imx6_src: Avoid casting from void *
>    hw/char/imx_serial: Avoid casting from void *
>    hw/intc/imx_avic: Avoid casting from void *
>    hw/misc/imx*_ccm: Avoid casting from void *
>    hw/usb/imx-usb-phy: Avoid casting from void *
>    hw/net/imx_fec: Trace with QOM path where easily possible
>    hw/net/lan9118_phy: Trace with QOM path
>    hw/watchdog/wdt_imx2: Trace with QOM path

If no objection I'm queuing the following trivial reviewed fixes
in my hw-misc tree to reduce the size of respin:

hw/watchdog/wdt_imx2: Trace with QOM path
hw/net/lan9118_phy: Trace with QOM path
hw/net/imx_fec: Trace with QOM path where easily possible
hw/usb/imx-usb-phy: Avoid casting from void *
hw/misc/imx*_ccm: Avoid casting from void *
hw/intc/imx_avic: Avoid casting from void *
hw/char/imx_serial: Avoid casting from void *
hw/misc/imx6_src: Avoid casting from void *
hw/vmapple/Kconfig: Remove unused GPIO_PWR dependency
hw/misc/Kconfig: Remove redundant USB_EHCI_SYSBUS from config IMX
hw/arm/Kconfig: Select missing UNIMP in config FSL_IMX8MM
hw/timer/imx_epit: Wire clock control module via link property
hw/timer/imx_gpt: Wire clock control module via link property


