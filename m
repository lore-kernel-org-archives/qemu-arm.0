Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 574CEC55ABA
	for <qemu-arm@archiver.kernel.org>; Tue,  4 Aug 2026 21:28:36 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wrMgY-0003LD-32; Tue, 04 Aug 2026 17:28:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wrMgW-0003Kd-6f
 for qemu-arm@nongnu.org; Tue, 04 Aug 2026 17:28:28 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wrMgU-0006HF-J0
 for qemu-arm@nongnu.org; Tue, 04 Aug 2026 17:28:27 -0400
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 674JlLVk1192682
 for <qemu-arm@nongnu.org>; Tue, 4 Aug 2026 21:28:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 sfJu6m6zv4ZbcOV2nuQefd5KWgd+E5EC9owSk4liGBw=; b=EW/pNUPM5cNtUNhv
 nr2OQ40VWCwSfRPZmfUIpSqrOiCLf1ViAza2JDt1Uo6aIaP9ENbe3YBfQfNvQZn0
 PTtbc1mlrWld57iSOkYJcuqNdnJ23l7UJRJY+4pHCsdqTKAUBe04Kp+PVjrQB5zK
 LE29H8RcUGaSFD3n8RdBE0r5UxR7eBteoB4xXkC13L+nLh70dwcvSpPIf13AFeWn
 xRbsYC89JwRnPMd1fNBNbvIc60FojfkLG13+pzRjyeJzEOpWfWqM7+yjLC+XyPbJ
 PJTzSsyvalsIPnO33+tRMDBjmQ0gL3uDzrQ0qZ0bb+NJm8Ir4kgNc+hzvMXW9x6p
 mEhulQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fuku317y4-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Tue, 04 Aug 2026 21:28:23 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-51c1c7f135bso4096971cf.0
 for <qemu-arm@nongnu.org>; Tue, 04 Aug 2026 14:28:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1785878902; x=1786483702; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=sfJu6m6zv4ZbcOV2nuQefd5KWgd+E5EC9owSk4liGBw=;
 b=DJiEfck049JR40zKbju2pUtsvcOw0HGIuoHY5KI3gVUcFEScvPXs3QDiuubr1r9sGZ
 LZ4M4ZwiJm9R9IL7JueOoLBrO3GWOu9cjoe18f6FBuT4PmtO0vatxnzf0xyTWF2y9Tdc
 1jprODpqY8Tbq2AaMoqnZOLjJc0wL0zjkDUmM65xNPvrdXWvjQ0NzXn88KKBavUYDAOf
 LhqEwMkhq2mrz10yBmrTdd98B8RJnd+xNdxOlbL/EIACbqwRMNjUH9ojx7xBJI/RpHU1
 MqtE9Nijv2ptCL0GEF8bN9a4qq6P3HtfzWMUnUN6FL7SpK0iU0kyhmpEiyoICTvVs2dB
 y4Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785878902; x=1786483702;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=sfJu6m6zv4ZbcOV2nuQefd5KWgd+E5EC9owSk4liGBw=;
 b=Tlc1uQCDScnBPtbnL9nnNdVA7o/2LHxh2tPmZiXQElNyGfJ98AgFuMRJPBH7bViQsy
 BdKdi/ZrhrT7vUam9QnIaUllsjf1o/aqgkLKfNgCyxAuANVrfHqmwx0FMBdcnBJt950s
 9YQM8ZfDKGzsZ/xv5164Jb/ZDXArMOtdXSArX+8ux5BspBUmw9cJ6guVIDx54/PxrbCR
 rkQT7SIwrcv3CX4pVgFuBx7C17qf0XSZ2BAtLP93UI4SeExPZB+OBkO9tNxrWd/aa1r+
 HwJYmW1OVXJX2rVEBnOKdpycAtyMV+y8h+iq12nw9qVf+lR8myuaytJVB11hSIBKyudP
 kWFA==
X-Forwarded-Encrypted: i=1;
 AHgh+Rr3to8+f5UCsUE0D5rWTCWMbdXxvyYm8YWRk1aEM1Z0+Hs4x4LWm87ZY2wAbmkb2s4sI4TJ0YasPw==@nongnu.org
X-Gm-Message-State: AOJu0Yxn0N1ueXGxIrF9C322GArAg1CLzEGK0zhledLDzzni0cK2+Ioo
 UczMk45tbqkwMy1M8Pgkw2V9uHZrD+9qHEjP8+Lmyj8HRSJ+wZWPbgvwlbAo6lPzTNCtip2AdRJ
 OdCs0nRlCRXQ9D7pqcYcJgoYIhzcBUzYC+m+22SnenZ3ThOVpluNL0yM=
X-Gm-Gg: AR+sD11JfU3W50MzNTq+4iQUzRCl0NKnOkIO2autu4GYjUQTmSELUHQn7H+E4wQC8TN
 OmH1aSHoxqdf/xV56ONP9PXGEDSHiV/9V4K2UANxW+XQkFUM5wbkh1yP8/kn7cBrYcftnuuq6hG
 mmcXrYWDOf8q6qVnyV2C/XB9rLuALRhqa2CWr+DDzm9UVxUa8s7kQPJ4AJxj+D/3VK28v+rJqvR
 EDkSHPpoymXE5eok31pZJA3bN/aAoolg6hqkn5KY3XmXScLnBXBH1GMbOVR5T5JVMumsV1xlq0x
 mINaRhxgpA46dYNoVD8wPQycnT7dHptYCAKs5qmY8zvWXjhKCff4rFmnTbIYIPSIgThlYsSC+ih
 05Ox/OK2iH1b+gBpkR0het3kwwbx3nvdxjIQ=
X-Received: by 2002:a05:622a:a08:b0:51c:1d0c:605f with SMTP id
 d75a77b69052e-52ce6218254mr24864961cf.20.1785878902353; 
 Tue, 04 Aug 2026 14:28:22 -0700 (PDT)
X-Received: by 2002:a05:622a:a08:b0:51c:1d0c:605f with SMTP id
 d75a77b69052e-52ce6218254mr24864561cf.20.1785878901900; 
 Tue, 04 Aug 2026 14:28:21 -0700 (PDT)
Received: from [192.168.69.212] (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49949fcb345sm121394595e9.6.2026.08.04.14.28.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Aug 2026 14:28:21 -0700 (PDT)
Message-ID: <c41b7873-f6f7-45dc-b0e0-25ffa0d6613b@oss.qualcomm.com>
Date: Tue, 4 Aug 2026 23:28:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hw/i2c/bcm2835_i2c: Correct iomem size
Content-Language: en-US
To: botszhuang <huang.botsz@gmail.com>, qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, philmd@mailo.com, qemu-arm@nongnu.org,
 sef1548@gmail.com
References: <20260804144611.31735-1-huang.botsz@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260804144611.31735-1-huang.botsz@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: ZJVchOvfM5K2t_FGPgTPV6cpy4ErluOx
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA0MDE3MyBTYWx0ZWRfX37T0HR0qBV0I
 eilGsEOYTap3xnM9KUNY9DhZU5kZan0Y8EV57iZHeq9LaUS4PDdGZyBsK+dGZsSuvvCo+RvZFRS
 2s1+uBSW6Ff36tqUSxyfUC3XyLUAit4=
X-Proofpoint-ORIG-GUID: ZJVchOvfM5K2t_FGPgTPV6cpy4ErluOx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA0MDE3MyBTYWx0ZWRfX/Fe4RKWbhii7
 E8nJWrqlYyAsKN6TE0/ntGsZwqwkYWGcsjn5t9Q7LesS8fRvFpY7Td3JS4B2+sTWJrcbsMQyDUa
 e/rWOzzXLdbtPyFC44pMJuLnO5H+d7CXSHpFASC6sohk7WUovRNJOOO3U+x5fh+RKfjl5BTsDI6
 oypHufm6dafTlievoP/QvgRG1KoJqYshdzvVjVLO1YYBe+OHutXl8fr/ImrUWt4bRC48PY0TOQO
 op0K7Htvak+jA3hG7Hl4lWmZFq7i4tbfKSpM8wmPIg4VZnjxZczWw/Usd+AzRTrLueoAMvl8FCd
 VZldkBITxqLrJrJFrLK7OHbFAHEJFlNFaoOdWYlnnVNGonSNOyZLg1736sPppg9CbSuswYseltX
 hVVjGC6xp0TZGgUvWG4MwJkSRVYQ7h5YQ5Ko/J7GGVSy7d71hFxJDlB6V8FBpDYWObylGLoHi6e
 mwcPERM8KpUMf2572yQ==
X-Authority-Analysis: v=2.4 cv=X/hi7mTe c=1 sm=1 tr=0 ts=6a725977 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=X8ZPm0S_kNcVzREjRFEA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-04_05,2026-08-04_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 impostorscore=0 phishscore=0 adultscore=0
 malwarescore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608040173
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
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

On 4/8/26 16:46, botszhuang wrote:
> The last valid register is the Clock Stretch Timeout (CLKT) at
> offset 0x1c. Since it is a 32-bit register, the total memory
> region size should be 0x1c + 4 = 0x20.
> 
> Update the size parameter in memory_region_init_io() from 0x24
> to 0x20 to accurately reflect the hardware specification.
> 

Suggested-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

> Signed-off-by: botszhuang <huang.botsz@gmail.com>

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

> ---
>   hw/i2c/bcm2835_i2c.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/i2c/bcm2835_i2c.c b/hw/i2c/bcm2835_i2c.c
> index 34de1f36e5..5f6093087d 100644
> --- a/hw/i2c/bcm2835_i2c.c
> +++ b/hw/i2c/bcm2835_i2c.c
> @@ -222,7 +222,7 @@ static void bcm2835_i2c_realize(DeviceState *dev, Error **errp)
>       s->bus = i2c_init_bus(dev, NULL);
>   
>       memory_region_init_io(&s->iomem, OBJECT(dev), &bcm2835_i2c_ops, s,
> -                          TYPE_BCM2835_I2C, 0x24);
> +                          TYPE_BCM2835_I2C, 0x20);
>       sysbus_init_mmio(SYS_BUS_DEVICE(dev), &s->iomem);
>       sysbus_init_irq(SYS_BUS_DEVICE(dev), &s->irq);
>   }


