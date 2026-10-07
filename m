Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21ED3CA5FFC
	for <qemu-arm@archiver.kernel.org>; Wed,  7 Oct 2026 15:07:52 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xETFF-0001MJ-0x; Wed, 07 Oct 2026 11:07:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xETEz-0001FM-U8
 for qemu-arm@nongnu.org; Wed, 07 Oct 2026 11:07:37 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xETEx-0005jq-2y
 for qemu-arm@nongnu.org; Wed, 07 Oct 2026 11:07:33 -0400
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 697EtTVR3250246
 for <qemu-arm@nongnu.org>; Wed, 7 Oct 2026 15:07:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 B+W7KHYZuPVF3EVK5S9nseD3ajgEDjtOWo14PodSc7w=; b=ZH1yf6lP8xyU8lRT
 +UGhNH00t7ZR6Luz5Mm9vtzO4oi/3neEGIaWCuBSwlROS/LVINqmNU0c6BiesuRv
 M1Jot6UBbH1TPXh55UHCznDCQXJD6FyHx72EBveHs4HxxeWB0yGJPLFKPeyTOrX0
 DFpmxRd9nhV2EFYoz27T9O992fxxFyQLjhnMwdJBNp0l7HOID7flGTBwiNfnPSY+
 M5lunhFdon2F2oVKNvG3Xj1eIG8aC53H7E0TCzPne3iarcEU002gm+l/ATRDzrKP
 tVKZClm5aTjeblrl4tUCB5KKsqAgXrDop8Dpak40I8tnieTIatHmLS3MVAp2egHd
 Q17YPw==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com
 [209.85.217.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5mge10gm-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Wed, 07 Oct 2026 15:07:28 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id
 ada2fe7eead31-7bdb408a368so1025820137.2
 for <qemu-arm@nongnu.org>; Wed, 07 Oct 2026 08:07:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1791385648; x=1791990448; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=B+W7KHYZuPVF3EVK5S9nseD3ajgEDjtOWo14PodSc7w=;
 b=ZsSmZZNYNh+ntR8cpy1Fz8sw5RNIrtTYz6WPhQ7NZ8q88HruFOdgDiRKav7Trqm9+n
 F5eMwEEQsGWrRvBD5OqiNANejQJriK2+KF7JoudDfgO6lmXqJ1BUUZwiGf8ePaYDF//A
 HKtHfkjnqjfX2CtpXHKIF8fxCyy8Bxc/MkG5BLnXB0+PL+MAIWW9+bTB2bgkG5uqrLV6
 yJ4059aTUK6WXxvcgXBrPAO0ToqBzTGkAYRUXoGY/78EVJYd6fVT1uEAyDz9m+4d68iT
 XhRdqIAPF60TSKmWJWCajrkCI+KPhULVPSxX0OD4AfY98YMvMPlXZ8sf8QE9L/8ShybW
 IcGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791385648; x=1791990448;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=B+W7KHYZuPVF3EVK5S9nseD3ajgEDjtOWo14PodSc7w=;
 b=eH9ep7vMHNJBV2A3cw7wTFWT9WFm9xPFFqTjePWhRL5T676zxxqsbAwUPnoV9bsw0t
 DG+V9ooLVw02HIkZ5KF9WC/4VHTUNEBizIIccpyVc2g7H7W3r1Bbi88Z2QaLvV9+IoRf
 j2mazbSkOoooJMmV4WQ6hZne0F4ETiHPJIu0bHdqgdU/3pdOgq8udAgHSwVv6jgSSil3
 wXuaZa+uMsRzemc0wIju+oCMG85HqgB6OTC8wge1XXeail6jG9+ustnggUabm4SGIW4v
 H5zc67y5lbHwMGb+/VlO+IHEZePEJHrodXLvxUgq/km+RdVnEwzBlhN75+jqyU6IvJSO
 7HMg==
X-Forwarded-Encrypted: i=1;
 AKwUvBylVfUOTFxN0k6YcCLN14oO635zoxEmXO84MhfUt8Q7pa4Nm/TSK81jVms+bt4KiYoi0wkSLduI+Q==@nongnu.org
X-Gm-Message-State: AFq9FYKmV+5hPI9ENMlSe6Ads3bm0t0WIK0af+71gwMj8ndvWtXdGhMI
 0020NuxQP9gE+h4pDwElYxPMflWuwaFfra3nvML5hxwjz8PmheCzTHSTTSuddAgEyUuosKrOnF5
 VwlBmn5UPMbQA2QhYkc1AtzGYxzIYqKRkZT4yrwIuZRknr4sp0VKhff0=
X-Gm-Gg: AYBFou1OB2k6aqUGUv6jRxDCGiVOEis8HEq2AA+8SVIkBkgxbQWUGq90L81dX/p0Uzv
 4gDuME9R+TH3KhfRJxMWP3+7omluE80aFCPABRqDDM2wRVLzCAzUq6Pa7OwGPpd5J93BmrZ/NDO
 rpffvgCn8vVR+GnyCtHMbBJd+mkA8PpLCU/AO7yllysGL+gFUKB2UWI6StHhi7pMW8vzC7ze4Ds
 PPpKm3tRo1SLDRfWbE69U/u0Ymjf6mxTMuJuaQXxJt6JIEuusFqOhZ2gxmm8hUhVRD2n/r7yJry
 +a2CD7FOxuTR9Ld/99Usdm75XPzynaS+1ndK4PYA+8ZSJh/yuV9qdHu3LInVJWU3H0h+jsF5Jzm
 fO6J5+J72aNPw85DZXzyLPcFFBfk2Sv8IeQ==
X-Received: by 2002:a05:6102:f87:b0:7a7:198a:c2bf with SMTP id
 ada2fe7eead31-7ca38f260bbmr592367137.29.1791385647715; 
 Wed, 07 Oct 2026 08:07:27 -0700 (PDT)
X-Received: by 2002:a05:6102:f87:b0:7a7:198a:c2bf with SMTP id
 ada2fe7eead31-7ca38f260bbmr592353137.29.1791385647133; 
 Wed, 07 Oct 2026 08:07:27 -0700 (PDT)
Received: from [192.168.69.210] (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a17f4480a4sm56331355e9.0.2026.10.07.08.07.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Oct 2026 08:07:26 -0700 (PDT)
Message-ID: <eb5da885-4ad5-4a3c-886e-a70f769f6622@oss.qualcomm.com>
Date: Wed, 7 Oct 2026 17:07:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 01/11] hw/arm/aspeed_ast2400: Use unimp array and table
 for unimplemented devices
To: Jamin Lin <jamin_lin@aspeedtech.com>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?=
 <clg@kaod.org>
Cc: Maydell Peter <peter.maydell@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
 Kane Chen <kane_chen@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Joel Stanley <joel@jms.id.au>,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Troy Lee <troy_lee@aspeedtech.com>
References: <20260930072501.2612119-1-jamin_lin@aspeedtech.com>
 <20260930072501.2612119-2-jamin_lin@aspeedtech.com>
 <941d7bb6-3205-44cf-8d76-ffbb322a6f4e@oss.qualcomm.com>
 <0cd87753-da91-44ed-a629-43099bfb820d@kaod.org>
 <1197c1ca-14d5-48c1-b497-0c03a781c258@oss.qualcomm.com>
 <330f9a96-4508-4db1-a8a0-fa36c57ed093@kaod.org>
 <672CD4C9-8FCA-4E5A-B610-3F9C51B986B6@aspeedtech.com>
 <0c9ae93c-cd18-4552-9969-0f01568800f3@kaod.org>
 <SEZPR06MB7362FB6E932EC8EEA123F2C4FC892@SEZPR06MB7362.apcprd06.prod.outlook.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <SEZPR06MB7362FB6E932EC8EEA123F2C4FC892@SEZPR06MB7362.apcprd06.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDA2MCBTYWx0ZWRfX7DzhLkTqb0ib
 O9EwqGp/zPPAImzv9ZDF601YV1cAybQbVTy+m29Roq3ngR3uKAc14QBO29nJVwpXESyy86TnaBJ
 YJflSUqbKoxw1C6uVYLSlNgVHCcNFZo=
X-Proofpoint-GUID: UlBiC8yFg5F4iEIsMIHx6a127lkKlf_n
X-Authority-Analysis: v=2.4 cv=PdJqFShd c=1 sm=1 tr=0 ts=6ac66030 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=aow-egSQAAAA:8 a=pGLkceISAAAA:8 a=PMEa7mulmaP2oMXib6QA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=ODZdjJIeia2B_SHc_B0f:22
 a=gFNbaldVC-z-bsjSTzMo:22
X-Proofpoint-ORIG-GUID: UlBiC8yFg5F4iEIsMIHx6a127lkKlf_n
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDA2MCBTYWx0ZWRfX0pex15hpPZkd
 KLHMLQx/NoxEAWGXfY0gp0gCzInzPr4cjp8SnvLDZSyk/qr1I3pYZ3yiulsex/UrizyIE7i+CGS
 9lpF9CT+LAZh8j9koMa1hgowS5bMWGBdRkOfLVb4j/7xA2DqIY2hWW0guCk4nIBcUZSQGWMSUZo
 NT/tI9Q9NXBVUcj1LultG+qv0f78PqXd6sCiAAesLxf827GAKK4913k8rlkgEpODW+UPIFUCxoO
 QsskB6YhxraUoqyVbleg1CtwXwjIJvL1LYFnhO8YoZA6tuRGRktcBAr/UYhYf8LchHHGcZDqb9N
 K1e0/cEwzh8qlOuBZZA8fjQDHaeNdC+EnkZ9/8o9FZEUaQ2UQlhPRGil2dz6vkPx6tfMmoVr7s4
 nHW1o6NBSyYCCg0zfg2yNuKTPBRCugOlZYjEKsleJGeyildkYGGqam0bS9+z+44dXti8kphhRNW
 01kEwFOZBwt9zfJ+mQQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_05,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 phishscore=0 suspectscore=0 spamscore=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610070060
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

On 2/10/26 11:02, Jamin Lin wrote:
> Hi Cédric
> 
>> Subject: Re: [PATCH v1 01/11] hw/arm/aspeed_ast2400: Use unimp array and
>> table for unimplemented devices
>>
>> On 10/1/26 13:51, Jamin Lin wrote:
>>>
>>>
>>>> Cédric Le Goater <clg@kaod.org> 於 2026年10月1日 下午3:41 寫道：
>>>>
>>>> ﻿On 9/30/26 14:16, Philippe Mathieu-Daudé wrote:
>>>>> On 30/9/26 13:50, CÃ©dric Le Goater wrote:
>>>>>>> Note to Peter: I really think keeping duplicating the
>>>>>>> UnimplementedDeviceConfig structure is a basic software
>>>>>>> development antipattern. Could you reconsider your objection?
>>>>>> What's the background ?
>>>>> I think that was discussed on IRC, the only ref on the list is:
>>>>>
>> https://lore.kernel.org/qemu-devel/CAFEAcA_ob6mHqfAAM9iAMae5vfxaYhmc
>>>>> qkk-gJH+s1mHuvFp8g@mail.gmail.com/
>>>>> create_unimplemented_device() calls qdev_create() and allocate on
>>>>> the heap, my motivation was to have another helper for in-place init
>>>>> (when the UnimplementedDeviceState state is embedded in the parent).
>>>>> Now we ended with such helpers like
>> aspeed_mmio_map_unimplemented()
>>>>> which realize in place, make_unimp_dev() and create_unimp() init and
>>>>> realize in place and Jamin adds yet another pattern. While all are
>>>>> valids, I'd rather unify.
>>>>
>>>> Could an array such as  :
>>>>
>>>> static const AspeedUnimpDevice aspeed_soc_ast2700_unimp_devs[] = {
>>>>     { "dpmcu",  "aspeed.dpmcu",  ASPEED_DEV_DPMCU,  0x0004000
>> 0 },
>>>>     { "iomem",  "aspeed.io",     ASPEED_DEV_IOMEM,  0x00FE0000
>>   },
>>>>     { "iomem0", "aspeed.iomem0", ASPEED_DEV_IOMEM0, 0x01000000 },
>>>>     { "iomem1", "aspeed.iomem1", ASPEED_DEV_IOMEM1,
>> 0x01000000 }, };
>>>>
>>>> be defined at the class level of the SoC and handled automatically ?
>>>>
>>>> I guess would need some kind on common SoC model in that case.
>>>>
>>>> C.
>>>>
>>> Hi Cédric,
>>>
>>> I will resend v2 and rework the design along these lines.
>>
>> Please wait a bit for Phil's feedback.
>>
>>> Defining the unimplemented devices as a class-level array and I will
>>> look into introducing a common SoC helper/model for this.
>>
>> This could be a start for a more generalized solution.

I was thinking something like (untested but you get the idea):

-- >8 --
diff --git a/include/hw/misc/unimp.h b/include/hw/misc/unimp.h
index 77a5077511f..d12774d6cc3 100644
--- a/include/hw/misc/unimp.h
+++ b/include/hw/misc/unimp.h
@@ -25,6 +25,27 @@ struct UnimplementedDeviceState {
      uint64_t size;
  };

+typedef struct UnimplementedDeviceConfig {
+    const char *qom_name;
+    const char *region_name;
+    uint64_t offset;
+    uint64_t size;
+    int priority;
+} UnimplementedDeviceConfig;
+
+/**
+ * create_unimplemented_devices:
+ * @parentobj: the parent object
+ * @container: a #MemoryRegion within which @addr is a relative address
+ * @devconfigs: NULL terminated array of #UnimplementedDeviceConfig
+ *
+ * For each entries in @devconfigs, create a TYPE_UNIMPLEMENTED_DEVICE
+ * and mmap it in @container at UnimplementedDeviceConfig::offset.
+ * @container is expected to be a QOM child of @parentobj.
+ */
+void create_unimplemented_devices(Object *parentobj, MemoryRegion 
*container,
+                                  const UnimplementedDeviceConfig 
*const devconfigs[]);
+
  /**
   * create_unimplemented_device: create and map a dummy device
   * @name: name of the device for debug logging
---

