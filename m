Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C16BCA5FB1
	for <qemu-arm@archiver.kernel.org>; Wed, 30 Sep 2026 12:16:34 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xBtEU-0001Sq-Mm; Wed, 30 Sep 2026 08:16:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xBtET-0001Sb-5t
 for qemu-arm@nongnu.org; Wed, 30 Sep 2026 08:16:21 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xBtEQ-0001Jy-VX
 for qemu-arm@nongnu.org; Wed, 30 Sep 2026 08:16:20 -0400
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 68UB8UHq3286527
 for <qemu-arm@nongnu.org>; Wed, 30 Sep 2026 12:16:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 goEbtEfeRtJMDPsvnvy+NTFIkM9CHsUM+9pQjtFe+LI=; b=XDw3/6WWIQzjY+9H
 hDn7khGop09DpVeo4gOke/FbEj6toQduTAJbz57I/+FQAbNjVuQ8FNGdE6uXD3ua
 UkrBDun3ttpGDylcl5dQQf2anD5uHNfhg024j1N8AJEwGR3Efnx2zHTBFl7qgQ8/
 JEGC6KujBvJAjBOo2VcUo+Ow4gwckDmvzGCRsu+DEqtUMpms5JswJrym6bdhoTFV
 sjp9xXC+ZAlNNWHA33BIP2CgO4MjWSz8LeZIAtp8uZ3ZY1wKQrdZf7MfsIsvtqLN
 uKhIXOnc2WzRb+z+fp11AJbz+Ln8/aami9WdVyyL7rRyNv5RAqGpHGKoV0D9YP87
 i6OeNg==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com
 [209.85.221.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0rj2tqga-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Wed, 30 Sep 2026 12:16:16 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id
 71dfb90a1353d-5c82cf2652dso1103757e0c.1
 for <qemu-arm@nongnu.org>; Wed, 30 Sep 2026 05:16:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1790770576; x=1791375376; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=goEbtEfeRtJMDPsvnvy+NTFIkM9CHsUM+9pQjtFe+LI=;
 b=ERXwTnwxq4NIWTwEQovkToKLXwDGfN/ycwLJ0XTse6t3KgwRTaO9el15OEIBsYTHvg
 fgXJFInVnsO3j/RUrsNbk7V3rwzTmCzp0FYc+z5OtaCOud/XzoQUCPGK+oJsVpUFkIQg
 bhhcmCJR2feqV+e/52agH2eLLOJd/yhTZhVPA/7sQWdD0FEnOHqJuQK0kxGvw8jc+PDK
 Nu3Jru/ygOCyJR79Gr32WZINva7KF+D1x9GFaMEYGUQ5SKHP1Jn7D3Wn43fX4EFlY3Rv
 jbPxApexnJZNIJkrqir4QuG/yTOTXKWVwacNgVxvWOX3L1YUPbLJdyzUr6oBNc2x0fPy
 NgyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790770576; x=1791375376;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=goEbtEfeRtJMDPsvnvy+NTFIkM9CHsUM+9pQjtFe+LI=;
 b=uRwmlIqSUMi5anuSl9UvhQQSfLZQfohGm6+frO8hfhYmETdWRVqWz1UTDyUgb1AmVO
 yMrQsxiyb1mxvndliaXVUlYyjAp1e+rU1aBUhumJg27IoTkwzlaB3hr+Z8taBm8teaRW
 KMH2ATq3gt5aHKl6t6z3eI/5GJW9hvn51Ybb47h9PcEFohsg6y1CVCZE1yXGHn6d+5a5
 9eeMQpx8RGibJxy/rPZuizBlgv7eNlb3TpHM9Buph/s2edu2MG2WDOyRu2OWQvQsLvQp
 c7C8YxOLXkz4GqMTPobqw7p9JRU/zDEH+rF7KL4PgEA6DvtKs4SCUpBMrAFAezag3j6a
 dUHA==
X-Forwarded-Encrypted: i=1;
 AKwUvBy+ypmUtBYdc9Bg5zGrEIxkF1VSPzqvMx+jGSF2OEWYJzDKQJZ+1529q0WnRu9e3Su8ANwhraa6XQ==@nongnu.org
X-Gm-Message-State: AFq9FYI8KLqWTU1Wp/2mZvZTyvd5IG/y+UHLlxHW1CzmuKwADcW4CcGP
 m3LHGd2f9OLQiqx7saWvyW1kWoP03VvFZoewkCnz+AXqilsvx7ZYHD6Zc5pBInNSax8LlPYeH/6
 sYvUljHXneBM7Uj1UL6TXn+F93t0NohoZWZ8TehuWR36cgqfrsSifpeU=
X-Gm-Gg: AYBFou3tVI4b4U38mwdTrxj4iR2C6P+gX3IT80W39FjLgNOBY9fpqdVKo532kJpIDpz
 B9JRH1jN2HoUlI8EBywUz2AiZjgPXWkNKzc+MwPwk0IKDh9kwzSC6/aiJGi1m2AQgiolklde2zM
 /5TiDVgLwXmCnvzPQWNjQOdLtLUnJ8L+6IpB6AR+05yUX4c5bW3nSpPQDUaizG+a7ZSIJynSyya
 XO4fNDqe1Y5l9Cinon8m3PssxfGy0occAWr6/qrN8bO4rKNdr+tXWBPITmTohYbEmPcit23hGD0
 IxGRmIPn4HrqZAaMohXdLqjATyomxBOaIEVi6FeFer11N7UNl30ERIebIckiikLAZlXDsjLXO4S
 t7FEdRelur77YAwVX6BxpvPez9RFexWG7Gg==
X-Received: by 2002:a05:6102:5691:b0:7a7:19aa:f0cf with SMTP id
 ada2fe7eead31-7be73e9a332mr174425137.28.1790770575688; 
 Wed, 30 Sep 2026 05:16:15 -0700 (PDT)
X-Received: by 2002:a05:6102:5691:b0:7a7:19aa:f0cf with SMTP id
 ada2fe7eead31-7be73e9a332mr174412137.28.1790770575053; 
 Wed, 30 Sep 2026 05:16:15 -0700 (PDT)
Received: from [192.168.69.225] (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48b029f5bcdsm3097737f8f.27.2026.09.30.05.16.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Sep 2026 05:16:14 -0700 (PDT)
Message-ID: <1197c1ca-14d5-48c1-b497-0c03a781c258@oss.qualcomm.com>
Date: Wed, 30 Sep 2026 14:16:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 01/11] hw/arm/aspeed_ast2400: Use unimp array and table
 for unimplemented devices
Content-Language: en-US
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Jamin Lin <jamin_lin@aspeedtech.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
 Kane Chen <kane_chen@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Joel Stanley <joel@jms.id.au>,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
Cc: Troy Lee <troy_lee@aspeedtech.com>
References: <20260930072501.2612119-1-jamin_lin@aspeedtech.com>
 <20260930072501.2612119-2-jamin_lin@aspeedtech.com>
 <941d7bb6-3205-44cf-8d76-ffbb322a6f4e@oss.qualcomm.com>
 <0cd87753-da91-44ed-a629-43099bfb820d@kaod.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <0cd87753-da91-44ed-a629-43099bfb820d@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: cmF6BKMOAwvThuWQXGpkYCD61gGhLAP9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA0OCBTYWx0ZWRfXxiPBFN9GmGAv
 qnv0Yb/2ykmBGpJ0Vs1LnsXOaKz4Poy+l0hlkZPLAQjV2EKYpjXS0j7c4AsjrSGisq1ELG7/Ba4
 QdzqZHK9ISGciWhBMJGSPKS0I6SCCCst+JVy2MlxtgRr/uXN3VBYfzAvwX+uRfzd6WoDTYkQuSJ
 A8ymKm6xD0l746P0Mtp0f3EgQcnL0NDM/PgCIe0OjeDlJE8jaQBhn1/4MQBDrBBNqEc8+ZDl+YE
 I4MRLjenjgqW9X7yUwAZELxU/aVanJC7WqF5DHEcUCgDhWzK3WWyoIcDgkdBytvzFub3CRVfOxi
 snds6mn7frLZ9qT7Y8qcxgMVb1Dvamla5yve27uUW7Fczb8NSfYTuTwj9Iwkq3og8WAdJ2U6Hkf
 RcpaQTqTqFEdH3xPm48lpdJN3YjGttPaH8gcD5eQnP4KGFiheq7VU3ZgYi+W1v1KIPKHeaFvf6M
 CZgZeij9SI/Egbk8YJQ==
X-Proofpoint-GUID: cmF6BKMOAwvThuWQXGpkYCD61gGhLAP9
X-Authority-Analysis: v=2.4 cv=Ypya1IYX c=1 sm=1 tr=0 ts=6abcfd90 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=bypl4A9ATimtlkDC95sA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA0OCBTYWx0ZWRfX/xgpUVWxpMua
 sarVUngtJETopHeB6vV11iEZEz/0H1iGcof6cf9M3FP3+5ZWoCb+EIL2HjGxVzjeEHPzRkvYQSt
 FkWndDX+Nbar9o3Cu6lMin2cEA3OdT8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 adultscore=0 impostorscore=0 spamscore=0 bulkscore=0 phishscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609300048
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

On 30/9/26 13:50, CÃ©dric Le Goater wrote:
>> Note to Peter: I really think keeping duplicating the
>> UnimplementedDeviceConfig structure is a basic software
>> development antipattern. Could you reconsider your objection?
> What's the background ?

I think that was discussed on IRC, the only ref on the list is:
https://lore.kernel.org/qemu-devel/CAFEAcA_ob6mHqfAAM9iAMae5vfxaYhmcqkk-gJH+s1mHuvFp8g@mail.gmail.com/

create_unimplemented_device() calls qdev_create() and allocate on the
heap, my motivation was to have another helper for in-place init (when
the UnimplementedDeviceState state is embedded in the parent). Now we
ended with such helpers like aspeed_mmio_map_unimplemented() which
realize in place, make_unimp_dev() and create_unimp() init and realize
in place and Jamin adds yet another pattern. While all are valids,
I'd rather unify. Maybe this is now back to the "qdev alloc vs qdev
struct embedded" discussion we never figured out.

hw/arm/aspeed_ast1040.c:127:    object_initialize_child(obj, "pwm", 
&s->pwm, TYPE_UNIMPLEMENTED_DEVICE);
hw/arm/aspeed_ast1040.c:128:    object_initialize_child(obj, "espi", 
&s->espi, TYPE_UNIMPLEMENTED_DEVICE);
hw/arm/aspeed_ast1040.c:129:    object_initialize_child(obj, "udc", 
&s->udc, TYPE_UNIMPLEMENTED_DEVICE);
hw/arm/aspeed_ast10x0.c:165:    object_initialize_child(obj, "iomem", 
&s->iomem, TYPE_UNIMPLEMENTED_DEVICE);
hw/arm/aspeed_ast10x0.c:166:    object_initialize_child(obj, "pwm", 
&s->pwm, TYPE_UNIMPLEMENTED_DEVICE);
hw/arm/aspeed_ast10x0.c:167:    object_initialize_child(obj, "espi", 
&s->espi, TYPE_UNIMPLEMENTED_DEVICE);
hw/arm/aspeed_ast10x0.c:168:    object_initialize_child(obj, "udc", 
&s->udc, TYPE_UNIMPLEMENTED_DEVICE);
hw/arm/aspeed_ast2400.c:243:    object_initialize_child(obj, "iomem", 
&s->iomem, TYPE_UNIMPLEMENTED_DEVICE);
hw/arm/aspeed_ast2400.c:244:    object_initialize_child(obj, "video", 
&s->video, TYPE_UNIMPLEMENTED_DEVICE);
hw/arm/aspeed_ast2600.c:285:    object_initialize_child(obj, "iomem", 
&s->iomem, TYPE_UNIMPLEMENTED_DEVICE);
hw/arm/aspeed_ast2600.c:286:    object_initialize_child(obj, "video", 
&s->video, TYPE_UNIMPLEMENTED_DEVICE);
hw/arm/aspeed_ast2600.c:287:    object_initialize_child(obj, "dpmcu", 
&s->dpmcu, TYPE_UNIMPLEMENTED_DEVICE);
hw/arm/bcm2835_peripherals.c:40:    object_initialize_child(OBJECT(ps), 
name, uds, TYPE_UNIMPLEMENTED_DEVICE);
hw/arm/mps2-tz.c:440:    object_initialize_child(OBJECT(mms), name, uds, 
TYPE_UNIMPLEMENTED_DEVICE);
hw/arm/musca.c:146:    object_initialize_child(OBJECT(mms), name, uds, 
TYPE_UNIMPLEMENTED_DEVICE);
hw/arm/bcm2835_peripherals.c:36:void 
create_unimp(BCMSocPeripheralBaseState *ps,
hw/arm/bcm2835_peripherals.c:521:    create_unimp(s, &s->txp, 
"bcm2835-txp", TXP_OFFSET, 0x1000);
hw/arm/bcm2835_peripherals.c:522:    create_unimp(s, &s->armtmr, 
"bcm2835-sp804", ARMCTRL_TIMER0_1_OFFSET, 0x40);
hw/arm/bcm2835_peripherals.c:523:    create_unimp(s, &s->i2s, 
"bcm2835-i2s", I2S_OFFSET, 0x100);
hw/arm/bcm2835_peripherals.c:524:    create_unimp(s, &s->smi, 
"bcm2835-smi", SMI_OFFSET, 0x100);
hw/arm/bcm2835_peripherals.c:525:    create_unimp(s, &s->bscsl, 
"bcm2835-spis", BSC_SL_OFFSET, 0x100);
hw/arm/bcm2835_peripherals.c:526:    create_unimp(s, &s->dbus, 
"bcm2835-dbus", DBUS_OFFSET, 0x8000);
hw/arm/bcm2835_peripherals.c:527:    create_unimp(s, &s->ave0, 
"bcm2835-ave0", AVE0_OFFSET, 0x8000);
hw/arm/bcm2835_peripherals.c:528:    create_unimp(s, &s->v3d, 
"bcm2835-v3d", V3D_OFFSET, 0x1000);
hw/arm/bcm2835_peripherals.c:529:    create_unimp(s, &s->sdramc, 
"bcm2835-sdramc", SDRAMC_OFFSET, 0x100);
hw/arm/bcm2838_peripherals.c:182:    create_unimp(s_base, &s->clkisp, 
"bcm2835-clkisp", CLOCK_ISP_OFFSET,
hw/arm/bcm2838_peripherals.c:196:    create_unimp(s_base, &s->asb, 
"bcm2838-asb", BRDG_OFFSET, 0x24);
hw/arm/mps2-tz.c:429:static MemoryRegion 
*make_unimp_dev(MPS2TZMachineState *mms,
hw/arm/mps2-tz.c:981:                { "i2s-audio", make_unimp_dev, 
&mms->i2s_audio,
hw/arm/mps2-tz.c:988:                { "gfx", make_unimp_dev, &mms->gfx, 
0x41000000, 0x140000 },
hw/arm/mps2-tz.c:989:                { "gpio0", make_unimp_dev, 
&mms->gpio[0], 0x40100000, 0x1000 },
hw/arm/mps2-tz.c:990:                { "gpio1", make_unimp_dev, 
&mms->gpio[1], 0x40101000, 0x1000 },
hw/arm/mps2-tz.c:991:                { "gpio2", make_unimp_dev, 
&mms->gpio[2], 0x40102000, 0x1000 },
hw/arm/mps2-tz.c:992:                { "gpio3", make_unimp_dev, 
&mms->gpio[3], 0x40103000, 0x1000 },
hw/arm/mps2-tz.c:1035:                { "i2s-audio", make_unimp_dev, 
&mms->i2s_audio,
hw/arm/mps2-tz.c:1045:                { "clcd", make_unimp_dev, 
&mms->cldc, 0x4130a000, 0x1000 },
hw/arm/mps2-tz.c:1051:                { "gpio0", make_unimp_dev, 
&mms->gpio[0], 0x41100000, 0x1000 },
hw/arm/mps2-tz.c:1052:                { "gpio1", make_unimp_dev, 
&mms->gpio[1], 0x41101000, 0x1000 },
hw/arm/mps2-tz.c:1053:                { "gpio2", make_unimp_dev, 
&mms->gpio[2], 0x41102000, 0x1000 },
hw/arm/mps2-tz.c:1054:                { "gpio3", make_unimp_dev, 
&mms->gpio[3], 0x41103000, 0x1000 },
hw/arm/mps2-tz.c:1102:                { "i2s-audio", make_unimp_dev, 
&mms->i2s_audio, 0x49301000, 0x1000 },
hw/arm/mps2-tz.c:1111:                { "clcd", make_unimp_dev, 
&mms->cldc, 0x4930a000, 0x1000 },
hw/arm/mps2-tz.c:1117:                { "gpio0", make_unimp_dev, 
&mms->gpio[0], 0x41100000, 0x1000 },
hw/arm/mps2-tz.c:1118:                { "gpio1", make_unimp_dev, 
&mms->gpio[1], 0x41101000, 0x1000 },
hw/arm/mps2-tz.c:1119:                { "gpio2", make_unimp_dev, 
&mms->gpio[2], 0x41102000, 0x1000 },
hw/arm/mps2-tz.c:1120:                { "gpio3", make_unimp_dev, 
&mms->gpio[3], 0x41103000, 0x1000 },
hw/arm/mps2-tz.c:1141:                { "sram-timing-adapter", 
make_unimp_dev, &mms->ta[0], 0x41700000, 0x1000 },
hw/arm/mps2-tz.c:1142:                { "qspi-timing-adapter", 
make_unimp_dev, &mms->ta[1], 0x41701000, 0x1000 },
hw/arm/mps2-tz.c:1143:                { "ddr4-timing-adapter", 
make_unimp_dev, &mms->ta[2], 0x41702000, 0x1000 },
hw/arm/mps2-tz.c:1167:                { "i2s-audio", make_unimp_dev, 
&mms->i2s_audio, 0x49301000, 0x1000 },
hw/arm/mps2-tz.c:1176:                { "clcd", make_unimp_dev, 
&mms->cldc, 0x4930a000, 0x1000 },
hw/arm/mps2-tz.c:1182:                { "gpio0", make_unimp_dev, 
&mms->gpio[0], 0x41100000, 0x1000 },
hw/arm/mps2-tz.c:1183:                { "gpio1", make_unimp_dev, 
&mms->gpio[1], 0x41101000, 0x1000 },
hw/arm/mps2-tz.c:1184:                { "gpio2", make_unimp_dev, 
&mms->gpio[2], 0x41102000, 0x1000 },
hw/arm/mps2-tz.c:1185:                { "gpio3", make_unimp_dev, 
&mms->gpio[3], 0x41103000, 0x1000 },
hw/arm/mps2-tz.c:1195:                { "qspi-controller0", 
make_unimp_dev, &mms->qspi_controller[0],
hw/arm/mps2-tz.c:1197:                { "qspi-controller1", 
make_unimp_dev, &mms->qspi_controller[1],
hw/arm/mps2-tz.c:1199:                { "qspi-controller2", 
make_unimp_dev, &mms->qspi_controller[2],
hw/arm/musca.c:137:static MemoryRegion *make_unimp_dev(MuscaMachineState 
*mms,
hw/arm/musca.c:325:        { "spi", make_unimp_dev, &mms->spi, 0x3000, 
0x1000 },
hw/arm/musca.c:326:        { "i2c0", make_unimp_dev, &mms->i2c[0], 
0x4000, 0x1000 },
hw/arm/musca.c:327:        { "i2c1", make_unimp_dev, &mms->i2c[1], 
0x5000, 0x1000 },
hw/arm/musca.c:328:        { "i2s", make_unimp_dev, &mms->i2s, 0x6000, 
0x1000 },
hw/arm/musca.c:329:        { "pwm0", make_unimp_dev, &mms->pwm[0], 
0x7000, 0x1000 },
hw/arm/musca.c:331:        { "qspi", make_unimp_dev, &mms->qspi, 0xa000, 
0x1000 },
hw/arm/musca.c:332:        { "timer", make_unimp_dev, &mms->timer, 
0xb000, 0x1000 },
hw/arm/musca.c:333:        { "scc", make_unimp_dev, &mms->scc, 0xc000, 
0x1000 },
hw/arm/musca.c:334:        { "pwm1", make_unimp_dev, &mms->pwm[1], 
0xe000, 0x1000 },
hw/arm/musca.c:335:        { "pwm2", make_unimp_dev, &mms->pwm[2], 
0xf000, 0x1000 },
hw/arm/musca.c:336:        { "gpio", make_unimp_dev, &mms->gpio, 
0x10000, 0x1000 },
hw/arm/musca.c:463:                { "eflash0", make_unimp_dev, 
&mms->eflash[0],
hw/arm/musca.c:465:                { "eflash1", make_unimp_dev, 
&mms->eflash[1],
hw/arm/musca.c:467:                { "qspi", make_unimp_dev, &mms->qspi, 
0x42800000, 0x100000 },
hw/arm/musca.c:472:                { "mhu0", make_unimp_dev, 
&mms->mhu[0], 0x42600000, 0x100000 },
hw/arm/musca.c:473:                { "mhu1", make_unimp_dev, 
&mms->mhu[1], 0x42700000, 0x100000 },
hw/arm/musca.c:484:                { "pwm0", make_unimp_dev, 
&mms->pwm[0], 0x40101000, 0x1000 },
hw/arm/musca.c:485:                { "pwm1", make_unimp_dev, 
&mms->pwm[1], 0x40102000, 0x1000 },
hw/arm/musca.c:486:                { "pwm2", make_unimp_dev, 
&mms->pwm[2], 0x40103000, 0x1000 },
hw/arm/musca.c:487:                { "i2s", make_unimp_dev, &mms->i2s, 
0x40104000, 0x1000 },
hw/arm/musca.c:490:                { "i2c0", make_unimp_dev, 
&mms->i2c[0], 0x40108000, 0x1000 },
hw/arm/musca.c:491:                { "i2c1", make_unimp_dev, 
&mms->i2c[1], 0x40109000, 0x1000 },
hw/arm/musca.c:492:                { "spi", make_unimp_dev, &mms->spi, 
0x4010a000, 0x1000 },
hw/arm/musca.c:493:                { "scc", make_unimp_dev, &mms->scc, 
0x5010b000, 0x1000 },
hw/arm/musca.c:494:                { "timer", make_unimp_dev, 
&mms->timer, 0x4010c000, 0x1000 },
hw/arm/musca.c:496:                { "pvt", make_unimp_dev, &mms->pvt, 
0x4010e000, 0x1000 },
hw/arm/musca.c:497:                { "sdio", make_unimp_dev, &mms->sdio, 
0x4010f000, 0x1000 },
hw/arm/musca.c:503:                { "gpio", make_unimp_dev, &mms->gpio, 
0x41000000, 0x1000 },


