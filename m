Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F9A5CA5FFF
	for <qemu-arm@archiver.kernel.org>; Wed,  7 Oct 2026 04:59:20 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xEJjl-00006i-IT; Wed, 07 Oct 2026 00:58:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xEGIK-0002EK-SG
 for qemu-arm@nongnu.org; Tue, 06 Oct 2026 21:18:30 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xEGI9-00050B-Cc
 for qemu-arm@nongnu.org; Tue, 06 Oct 2026 21:18:00 -0400
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6966eI4r548479
 for <qemu-arm@nongnu.org>; Tue, 6 Oct 2026 09:26:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 PCSoggDW5ypxELwD6gbbnXT4bzHWg/ZJBOFyS45Kb7U=; b=ckO0j88ZR2x0+WSy
 Plwc3Lh4pcLe7uFvbjzq1P2jENnzN8r3hR9O1m0plmQOZCmtpdkhQwgX44tx4j76
 s9FK82m6rPuS9oAl1r1jBplo22j2cFjN0iiJUdUAewdaiKx6Qajht/Fl1bpT0Q2t
 z63A43cnCg5sbO34JlMmELeeQoIUj6olUbimH13ad1G/qLquZvcPVg+qyEyCmf/N
 f3OlpD9fSy9KxyLFX+9EoDq8r2W2sV+PAy7kZbjZPkRvNF8woJkg+2PQUn2UZKHs
 uGoPQL5CiA8Tpg1wObLe+Sy0k6UeQm1CK1LSlhMr7M2rCaxZK4c17K8W5hKKKeA5
 cTmaMg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h49tvvkpt-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Tue, 06 Oct 2026 09:26:56 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-93cc7a6e4e1so701036485a.1
 for <qemu-arm@nongnu.org>; Tue, 06 Oct 2026 02:26:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1791278816; x=1791883616; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=PCSoggDW5ypxELwD6gbbnXT4bzHWg/ZJBOFyS45Kb7U=;
 b=AaoWCgGp/KVi6tNhuAJZFISO7pI000K+CQa8pYln319bDo0CVpB2JC3DLUTPbHPrm/
 78VpcwgKBE4HgqiQ0vFYPlqdkYAirVdb4L3aPIz7JqpT0cu8AdawOV2TjMFVsOexVJJD
 ryDdQGYWrd4zZyZK/WvNadXt8MMIVVZ2xbME4xyzPTHq/gvvwkEjLql4mNgvPL74JjWz
 z2yh/cvgXsX6xrZseATSJP8c2pbtQzb1Ic8eZ3ILI0wO3ef7vtjSWvQk0wCXfld1N9xr
 H+FBM6fHleK4q3TVaJM3UbaaI3sGGmcWIX3o0vPDPUo7Pu+6wWlwIOF6O+Wk52cKV3f9
 WTsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791278816; x=1791883616;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=PCSoggDW5ypxELwD6gbbnXT4bzHWg/ZJBOFyS45Kb7U=;
 b=bjH9dOAyy85Vh2pFkzXIW9YUr18bszdo7E0EhS2wmduYcN/h2fM0g913Tji3q7jkxs
 57kjG2u1vl04Xn/ilbbB31zaq7coXsqkAnG41V9hnabkUPnjR1dbiiBzi64okFvLUHDY
 Xr2V1OzMHRwGQCR3oN+I/IW+5b+3Mt6JVN9F9QRbO6F9+WWZB/eF1aY70lRplDvKUdyo
 ged0Ga+KmCu1/kRlvUifsMBNxg1sRiQyY8Txk3hb094Bfb/9o7zszJV7MB8Z8j8SaTdN
 Ai4no87GyswkhZNNTjyLiBeEJJQ9C3hOXdlFLooMhp4gK4sTrkHEbALlDcQC0OlLK9HT
 hiew==
X-Forwarded-Encrypted: i=1;
 AKwUvBwYlZDe5digAPVz1imn46GEiwYn0KTI2GpSxU98l4Hv2pDt1uA+sYLevqI7ymLuxRxu9QJTIlkkiA==@nongnu.org
X-Gm-Message-State: AFuF++mRCQIC806OiJTGEah7/PqGTsK/BNUtPAOU2r68vQndfzkrwonj
 Qntt5iGhIGFmOnfhJuQTGLv8QS1SQ4h+UsSiuoXIFnnaQaXMfnZ+1KpKOSk/hvmvpnF/MsDUYMf
 6tcRVuOh/aIbuXWS7VAey5UbWD1EQbS6xXRiH2wIO8YeXXcqU9vSA7Uw=
X-Gm-Gg: AYBFou0DzWQKhjGwHb5Hwn09YWje9/eSF99nJDjeGS1cuSufieRBa2b2XGUp71gpKTj
 lHhyU0egMTCTGh/0kx/6DImWOFnW+sizscRoqxr2dnXWVPXQSbd6cR/NmopRZDiiniDtjS4ttQU
 zIHhaNSibgOenEcyU7zAnd9FctEofeIl/WKLTg1X0nJxaNhq/bEMOZpqSjoGXF96OYlsVZnUJtt
 swub78AVUfen189hQIGmjj/N2Vk1IuOVTiDr6N0gpBCLKEuMtyeDjcVTN5hVCVpN5R9YqMufztp
 lJnRgItCjq6l0XGyLW3E3upiK+C+iEDfx4xlkBYJa5eu/VlLkOBW4cqyoFVTlXw+CFE02T4pETt
 yAEPr1SRCuKLG7Xmb2LYzH8dg4RYuPaKQ8w==
X-Received: by 2002:a05:620a:8088:b0:93e:6d87:4f6b with SMTP id
 af79cd13be357-93e8f4eca38mr139308885a.48.1791278815374; 
 Tue, 06 Oct 2026 02:26:55 -0700 (PDT)
X-Received: by 2002:a05:620a:8088:b0:93e:6d87:4f6b with SMTP id
 af79cd13be357-93e8f4eca38mr139306185a.48.1791278814896; 
 Tue, 06 Oct 2026 02:26:54 -0700 (PDT)
Received: from [192.168.69.210] (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48c62eda863sm8238859f8f.43.2026.10.06.02.26.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Oct 2026 02:26:53 -0700 (PDT)
Message-ID: <d63caf07-24f1-4911-b0f9-f375c48b6159@oss.qualcomm.com>
Date: Tue, 6 Oct 2026 11:26:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 12/31] hw/arm/fsl-imx25: Derive from TYPE_SYS_BUS_DEVICE
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Bin Meng <bin.meng@processmission.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Gaurav Sharma <gaurav.sharma_7@nxp.com>, qemu-arm@nongnu.org,
 Jason Wang <jasowangio@gmail.com>,
 Alistair Francis <alistair@alistair23.me>
References: <20261006083445.30362-1-shentey@gmail.com>
 <20261006083445.30362-13-shentey@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20261006083445.30362-13-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=aN9lOr9m c=1 sm=1 tr=0 ts=6ac4bee0 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=FRSEYCzRAAAA:8 a=pGLkceISAAAA:8 a=AXrosiIxGgywjbGlx0kA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=H4N_Y-AU75W7NKDNhZlT:22
X-Proofpoint-GUID: nDFsZArjseH3zHgZNIVm6MI3ShUFOSus
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA2MDAzNyBTYWx0ZWRfX4qcB+/qXFaPK
 XyHFIywkS0t0RLIjntxEDJIOpYHsOtLwu1vSxZs3ZbL5+leMcFyrYndw8xuJWEU1eKcZ119f0cX
 L2MKhJmJ/+kzB23MPf4LExK5+ihC0HbLRWn4/ZuwFg2Gu0McCg3JMU66YK+O61jzQfIVkiqtjCq
 Y1vO6kVSEsrfqpoRovMhuOPVvzGZWdcDVmYO5ul1W2/7G2jCAfKsqnd2HLNEhOiCLXyKDx4oy3/
 dDuUsxhT/SNWlzPY0nfwEO5CmQGy8REu69LwnDQNoYnXxP4AuTxKWahtxk2iDRTJAVvuHABaDP6
 CLMBLsPQuwwXkH5QeOK0A67JziAGu9QY6MShXHMdrhMzrhp3ImZHOlFWxugQZ8D2MgzbqwwZ3SC
 A5Nmb0DJRPUhthnIjXpMUoWJDHuxSGrZ1MX/06SX7IbzZs2iPytzOnVrtemnb6GH4P85kqvdb+Q
 hF5hWg0gcsqHy6rJDNg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA2MDAzNyBTYWx0ZWRfXx0OL7UKS2MhA
 uID+gkO6+IQAtBnRjfaZiJ/1Ug50hvCu+W8d+7D8XfMvIZAJDzn8yBJkkPiYZMgQkxHzhCkCErj
 6zPcJUEo9bDPcNbc1SnYs6xpDtfowQQ=
X-Proofpoint-ORIG-GUID: nDFsZArjseH3zHgZNIVm6MI3ShUFOSus
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-06_02,2026-10-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 spamscore=0 phishscore=0
 malwarescore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610060037
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

On 6/10/26 10:34, Bernhard Beschow wrote:
> Deriving from TYPE_SYS_BUS_DEVICE fixes the SoC object to be reset upon
> machine reset.
> 
> Reviewed-by: Bin Meng <bin.meng@processmission.com>
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>   include/hw/arm/fsl-imx25.h | 5 ++---
>   hw/arm/fsl-imx25.c         | 7 +------
>   hw/arm/imx25_pdk.c         | 2 +-
>   3 files changed, 4 insertions(+), 10 deletions(-)
> 
> diff --git a/include/hw/arm/fsl-imx25.h b/include/hw/arm/fsl-imx25.h
> index b68d4334a0..4bb4d5b3e5 100644
> --- a/include/hw/arm/fsl-imx25.h
> +++ b/include/hw/arm/fsl-imx25.h
> @@ -29,6 +29,7 @@
>   #include "hw/sd/sdhci.h"
>   #include "hw/usb/chipidea.h"
>   #include "hw/watchdog/wdt_imx2.h"
> +#include "hw/core/sysbus.h"
>   #include "system/memory.h"
>   #include "target/arm/cpu.h"
>   #include "qom/object.h"
> @@ -45,10 +46,8 @@ OBJECT_DECLARE_SIMPLE_TYPE(FslIMX25State, FSL_IMX25)
>   #define FSL_IMX25_NUM_USBS 2
>   
>   struct FslIMX25State {
> -    /*< private >*/
> -    DeviceState parent_obj;
> +    SysBusDevice parent_obj;
>   
> -    /*< public >*/
>       ARMCPU         cpu;
>       IMXAVICState   avic;
>       IMX25CCMState  ccm;
> diff --git a/hw/arm/fsl-imx25.c b/hw/arm/fsl-imx25.c
> index 7f65f4ca4b..efb22359c5 100644
> --- a/hw/arm/fsl-imx25.c
> +++ b/hw/arm/fsl-imx25.c
> @@ -317,16 +317,11 @@ static void fsl_imx25_class_init(ObjectClass *oc, const void *data)
>       device_class_set_props(dc, fsl_imx25_properties);
>       dc->realize = fsl_imx25_realize;
>       dc->desc = "i.MX25 SOC";
> -    /*
> -     * Reason: uses serial_hds in realize and the imx25 board does not
> -     * support multiple CPUs
> -     */
> -    dc->user_creatable = false;

Can we explain this change?

>   }
>   
>   static const TypeInfo fsl_imx25_type_info = {
>       .name = TYPE_FSL_IMX25,
> -    .parent = TYPE_DEVICE,
> +    .parent = TYPE_SYS_BUS_DEVICE,
>       .instance_size = sizeof(FslIMX25State),
>       .instance_init = fsl_imx25_init,
>       .class_init = fsl_imx25_class_init,
> diff --git a/hw/arm/imx25_pdk.c b/hw/arm/imx25_pdk.c
> index 243c30a67e..a33050788c 100644
> --- a/hw/arm/imx25_pdk.c
> +++ b/hw/arm/imx25_pdk.c
> @@ -72,7 +72,7 @@ static void imx25_pdk_init(MachineState *machine)
>   
>       object_initialize_child(OBJECT(machine), "soc", &s->soc, TYPE_FSL_IMX25);
>   
> -    qdev_realize(DEVICE(&s->soc), NULL, &error_fatal);
> +    sysbus_realize(SYS_BUS_DEVICE(&s->soc), &error_fatal);
>   
>       /* We need to initialize our memory */
>       if (machine->ram_size > (FSL_IMX25_SDRAM0_SIZE + FSL_IMX25_SDRAM1_SIZE)) {


