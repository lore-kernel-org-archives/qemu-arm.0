Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A406D606A885
	for <qemu-arm@archiver.kernel.org>; Tue, 10 Nov 2026 20:31:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dxg/dS2G;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Px7A4e6l
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xQsUe-0002tL-C3; Tue, 10 Nov 2026 15:31:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xQsUX-0002l0-54
 for qemu-arm@nongnu.org; Tue, 10 Nov 2026 15:30:53 -0500
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xQsUV-0002SX-52
 for qemu-arm@nongnu.org; Tue, 10 Nov 2026 15:30:52 -0500
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6AAIoWa8048852
 for <qemu-arm@nongnu.org>; Tue, 10 Nov 2026 20:30:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 +0AWrBiFI7IPLdPtStOEOSEvyUVB4tKifecmh5PRwSM=; b=dxg/dS2Gkzrus7JG
 mVW0Xi1IxB6AH9DKx0gUIH3h80vJMkAWKrfXxy4aQis1MGqkGO+jZrs/iywl47gd
 lB0EF6x5/k2xcrzfnqPKjvyxM+yemh9wu1ZlaXEbb5bo2NbajyiAYsxZSDJMr31Z
 aIfvBHtHnZ+TcCVHM/TLvfA0Y0g4nZpGELOqMs2gqW837QpwMjQhPbkYqh4g0Mlo
 af8qkehVqflZ35igeZZafoKAhvJRcYf8TTgc4vGnCtbSc6WUrLvrESYEObGHBa3R
 s7JiokTHejNoZpqa0AFUWL3CI/P9A/dtuTAyuU26Wtwgs3bQZdRpZ3a48ELD6S8i
 d/AWNQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4huy5dayds-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Tue, 10 Nov 2026 20:30:48 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-93f5844cb60so505115385a.0
 for <qemu-arm@nongnu.org>; Tue, 10 Nov 2026 12:30:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1794342647; x=1794947447; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=+0AWrBiFI7IPLdPtStOEOSEvyUVB4tKifecmh5PRwSM=;
 b=Px7A4e6lxWbaXhD6V1j/nQl32btL3E0NptNhqlpcx7RzfuChNCvbXSKEf0XLhNWXjR
 gTwbSIfqCDuC8eabvOyW5i3KzTqfxPIYbBxRw9/izl/iSSOs4tH2RCjEpNGz6xm+ySnn
 ZkcXzwO+/7bPQ5skxhmVS1QCRfh1ElQPk2XTorktmwfd8lNo8IfoH5TGGGoMKCjmeG63
 DUKsOnBCs0VQxhvSlaezvjS3U7KdygFYPNg4g0rTrws04xKJkBsCPaWE9HHm1OVmkEYv
 arFfYhUHRYqNanUqLbeh7+cSn6zBxfeUwnVPt+ZWS0v2si3ea8qTNHVlAFI4J4Lb1pG4
 iImg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794342647; x=1794947447;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=+0AWrBiFI7IPLdPtStOEOSEvyUVB4tKifecmh5PRwSM=;
 b=OCp8zqwbrRlCVjFaUYWfJ8+gtymT1V5Pj+tpZfaTVbe0cEfN8uKm02t/ZFVX06rjMI
 se89DRR5o9bD9fQaA0C2yls7OuuA4MrKhb3T+A0VJlmfH54ph5vRfsVwuy+kE3TMZp4G
 hJIxBH30eHDrXPEg8aK2zCQVAShYjKlyeAIfAOBqS7PksWwwaOnwH5PLtTtJzqKjSoYO
 gh+cFd4Tof4q1Ts+JjR4AH000zFd+G25DiPJr15PdhJsTRx+9IF7r5LB8YQDapH07Jef
 vqlf4gjLuEU+BHXDERnaM2QzaiF50ej3kMYksJkMueR6aUlrzFzJbh1o6ktlqWDIAx0g
 s9+g==
X-Forwarded-Encrypted: i=1;
 AL+hErEvwIcCJLNYeBFCnb0IZAdtDH6AqoSq2Jpi1QHDIDmiaolV2K8TGZNnMrCR4W5B2wvi+dTGWKaQLw==@nongnu.org
X-Gm-Message-State: APuU4Z/CYPrgYAIA45t2VY6j/i9c5/ISXYcu+vESLwLzs8P6rG8Akm8I
 y+Dji9wXM/9X/E3mcX6dPJ11us6UbDzvKAHKfzE7MWi/keBVyBKb5pnfoO9I1Yjwix8LuCzaD0d
 xslO2CbHdRXUKfLO/4Ot51LPU0f4l6XHcBp1dWTRhBXAlSnoOgFR2g1w+9ew70iw=
X-Gm-Gg: AYBFou33snkK7KUjmV5gBRbbI0aauNf50PLws43l0Yr8bB6qmLWKu0HuGAK+ZobhxlH
 IDeACcM25RrgzB9Zw965nhQ6A8Y47/5EBv7PoNAfak5SpEcBiWH9CTi+WyL7MP06+guXR8MhDB9
 nU7xqfFuoVq2p7CxEPxbqRupP0sMfTsbfHn41tCOBFhLiXsfCOQUrwSABPwzMD+HDfeUPSDlF5T
 rt2O+UQMDNA0AyoYOGlEcVbntStioIcLrr1UC9XQY3fyC6zdH2vwV3zDQP1ckua19Sg7joNcckh
 OC31NrWCkiz1ynyt8znmN4CaBNp4LBc4ZFAEECDn/xYxI93HivnXYB9ZivM8nbLcUzZ81oaFG1f
 PkWO1iJBtCb/anf+UgvE89+iZvlGwY89ijI9ZtaOmnTUJcvk+CG6mphXLoHKaGDkBBUSdG9fQFv
 8+cH2+Mt18Rw==
X-Received: by 2002:a05:620a:24f:b0:939:b053:ce44 with SMTP id
 af79cd13be357-947ae85b82cmr87786285a.22.1794342647300; 
 Tue, 10 Nov 2026 12:30:47 -0800 (PST)
X-Received: by 2002:a05:620a:24f:b0:939:b053:ce44 with SMTP id
 af79cd13be357-947ae85b82cmr87777085a.22.1794342646163; 
 Tue, 10 Nov 2026 12:30:46 -0800 (PST)
Received: from [192.168.68.105] ([152.234.124.231])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-9479e770d7csm310805285a.17.2026.11.10.12.30.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Nov 2026 12:30:45 -0800 (PST)
Message-ID: <1ae9998f-8942-4cf3-a5b9-3f7de3f1bcf3@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 17:30:43 -0300
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 11/26] hw/sd: cadence: Add 64-bit system bus property
To: Bin Meng <bin.meng@processmission.com>, QEMU <qemu-devel@nongnu.org>
Cc: Conor Dooley <conor.dooley@microchip.com>,
 Alistair Francis <alistair@alistair23.me>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
References: <20261104154207.641511-1-bin.meng@processmission.com>
 <20261104154207.641511-12-bin.meng@processmission.com>
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261104154207.641511-12-bin.meng@processmission.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: x3Sh5E9EB2qUVPioLa3uRmvYkF8dg-O_
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDA4MSBTYWx0ZWRfX4UuHBtRAO+/6
 bFX4eG3VSD6Y9/a2RVVuPCX+Zllblb52jqlP24KZEkTI3AeUa7WqmS+5hIg8SobT5tvAmC37FI+
 LQxjYjdCUr2y8ifh9mi9sd6g56SQ9oU=
X-Authority-Analysis: v=2.4 cv=d+9gWhjE c=1 sm=1 tr=0 ts=6af37ef8 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=8elE1k/PHQNyZ14TNTodlQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=FRSEYCzRAAAA:8 a=XYAwZIGsAAAA:8 a=EUspDBNiAAAA:8 a=SMSKd18gIyFAcNbaNdoA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=H4N_Y-AU75W7NKDNhZlT:22
 a=E8ToXWR_bxluHZ7gmE-Z:22
X-Proofpoint-ORIG-GUID: x3Sh5E9EB2qUVPioLa3uRmvYkF8dg-O_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDA4MSBTYWx0ZWRfX2lBF/WLhi7kQ
 TOipWfgvndURGlu+APaJHIEWGCeKrDHzaFZM3+zO1nv2GM238B67/S3J3wFsm4zHTbvVaP9/dp7
 yLT0IpdkwhkEy8uzEdYbpXMkbtlPUsrUW0ilfKfoU78tgE/0es9jc9qY/JH1xQtdAfb6s11oUVm
 VZQbhyMrArrQ15zafVav705IQtDpt6cCmwIgfOrz/PBUQVHPnMi5Om5YCWCzkLbnxSB6r2l3fdl
 FoogojZpRIrCdftl6xwyWRljmhD755mIUVQ5rWhoAtsm7jgHNwvJmHDEtqbf1fa1ZIZ+HslRzZA
 e1j9rwg2GFERqGdKbJ7BO3P4dmk8pPjP0gK0Dg2siQfqdL1LXG1uFr/jJsLE3IOo5nvarskNi2L
 FX/qzWAXCnV07mPF7W64DixEM1Zai9Aou/ekXvyQPo7vfxLBkQp27gP1m1V9SEJSRS0D6DeD9Ou
 kcbK/UXkiVEML0Xp+KQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_06,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100081
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=daniel.barboza@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
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
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 11/4/2026 12:41 PM, Bin Meng wrote:
> Cadence SDHCI integrations can differ in whether they provide a 64-bit
> system bus. Advertising the capability unconditionally could make a
> guest select unsupported ADMA descriptors.
> 
> Add a bus64bit property to the Cadence model and keep it disabled by
> default. When enabled, expose the corresponding capability through the
> generic SDHCI child.
> 
> Signed-off-by: Bin Meng <bin.meng@processmission.com>
> Tested-by: Conor Dooley <conor.dooley@microchip.com>
> 
> ---

hw/sd is not my turf but these changes are simple enough for me to ack.


Reviewed-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>

> 
> (no changes since v2)
> 
> Changes in v2:
> - Make 64-bit system bus support a device property
> 
>   include/hw/sd/cadence_sdhci.h |  1 +
>   hw/sd/cadence_sdhci.c         | 11 +++++++++++
>   2 files changed, 12 insertions(+)
> 
> diff --git a/include/hw/sd/cadence_sdhci.h b/include/hw/sd/cadence_sdhci.h
> index cd8288b7d8..553fa73842 100644
> --- a/include/hw/sd/cadence_sdhci.h
> +++ b/include/hw/sd/cadence_sdhci.h
> @@ -34,6 +34,7 @@ typedef struct CadenceSDHCIState {
>       MemoryRegion container;
>       MemoryRegion iomem;
>       BusState *bus;
> +    bool bus64bit;
>   
>       uint32_t regs[CADENCE_SDHCI_NUM_REGS];
>   
> diff --git a/hw/sd/cadence_sdhci.c b/hw/sd/cadence_sdhci.c
> index 8476baf67f..875823a50d 100644
> --- a/hw/sd/cadence_sdhci.c
> +++ b/hw/sd/cadence_sdhci.c
> @@ -25,6 +25,7 @@
>   #include "qemu/error-report.h"
>   #include "qapi/error.h"
>   #include "migration/vmstate.h"
> +#include "hw/core/qdev-properties.h"
>   #include "hw/sd/cadence_sdhci.h"
>   #include "sdhci-internal.h"
>   
> @@ -147,6 +148,11 @@ static void cadence_sdhci_realize(DeviceState *dev, Error **errp)
>                             s, TYPE_CADENCE_SDHCI, CADENCE_SDHCI_REG_SIZE);
>       memory_region_add_subregion(&s->container, 0, &s->iomem);
>   
> +    if (s->bus64bit) {
> +        object_property_set_uint(OBJECT(&s->sdhci), "capareg",
> +                                 SDHC_CAPAB_REG_DEFAULT |
> +                                 R_SDHC_CAPAB_BUS64BIT_MASK, &error_abort);
> +    }
>       sysbus_realize(sbd_sdhci, errp);
>       memory_region_add_subregion(&s->container, CADENCE_SDHCI_SRS_BASE,
>                                   sysbus_mmio_get_region(sbd_sdhci, 0));
> @@ -165,6 +171,10 @@ static const VMStateDescription vmstate_cadence_sdhci = {
>       },
>   };
>   
> +static const Property cadence_sdhci_properties[] = {
> +    DEFINE_PROP_BOOL("bus64bit", CadenceSDHCIState, bus64bit, false),
> +};
> +
>   static void cadence_sdhci_class_init(ObjectClass *classp, const void *data)
>   {
>       DeviceClass *dc = DEVICE_CLASS(classp);
> @@ -172,6 +182,7 @@ static void cadence_sdhci_class_init(ObjectClass *classp, const void *data)
>       dc->desc = "Cadence SD/SDIO/eMMC Host Controller (SD4HC)";
>       dc->realize = cadence_sdhci_realize;
>       device_class_set_legacy_reset(dc, cadence_sdhci_reset);
> +    device_class_set_props(dc, cadence_sdhci_properties);
>       dc->vmsd = &vmstate_cadence_sdhci;
>   }
>   


