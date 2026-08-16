Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8274CC5B572
	for <qemu-arm@archiver.kernel.org>; Sun, 16 Aug 2026 14:56:45 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wvcHz-0006Iv-If; Sun, 16 Aug 2026 10:56:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wvcHy-0006Ig-9Y
 for qemu-arm@nongnu.org; Sun, 16 Aug 2026 10:56:42 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wvcHw-0002vZ-Oa
 for qemu-arm@nongnu.org; Sun, 16 Aug 2026 10:56:42 -0400
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67GDl7DK481900
 for <qemu-arm@nongnu.org>; Sun, 16 Aug 2026 14:56:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 X5fUg7aVZd0xLpp8t3QKIhEJmceASxl2vAKj9rm2Rx8=; b=P9QJE+hXeXxz0sSn
 Uyj74vs47vl5OJzvhdG5sC+d8OLQ0K9Z/81QJwgJ7r6F2JFlo6bxSC2BBE6x2NT2
 SMi8jDDeTcEbw3RFSC+6gn3wGYqdwCvtrlAyt3pRSDvpe1JpqcljBwuUebtTXLBy
 CRAW1Q/MkZJD4zGUyU95qwokbBJ7OJHaPg/wro8tgaRGUy9F/Glfi3Kk9L3f8K8P
 5cxC6RSmzQ5h8O3BIDCr6g+3EZimiSc3pScW0NP5dxLOm/xG4U72aILLdBDYrh7T
 gD/v1JJrQF5GC5Pj7L8+mEq7lvi9wfsKJDnbU5Kfp7gWh61rH+EmylX5rRApxAVk
 RReFzA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g2ghfbke8-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Sun, 16 Aug 2026 14:56:38 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-52d91cc174aso35896541cf.2
 for <qemu-arm@nongnu.org>; Sun, 16 Aug 2026 07:56:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1786892197; x=1787496997; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=X5fUg7aVZd0xLpp8t3QKIhEJmceASxl2vAKj9rm2Rx8=;
 b=B6ITAWFl9ssJL738TzOy5DP29JUAVt7UB9JFvzUjX/bZQUVEjUyoP+ycpzQLptya/B
 HJR4xb9dg3H0ULrINiRgaL0+lu8HzGK7rLmx/yY+pvtTIvV45PwyTTC9/ni3eqe7Xm6w
 PEP95izWWdfiO8eWrms/FqW5ke0XTQo2HGKY9rJO//d2sF3esPPtd1pj84lEyA7Mzcy7
 d+sXfKPyIV1ZHj/OfxJIiSPb+rpfdmJ0/O4BGPIvFhrZMXyG5FfderacVnVhH2CUILH5
 U3DmnhQ5gVds8C3WspXP0CTEIRJrB944Shbu12/jx0vwI+QRbTVWJz5dgNqcDgJKuMmF
 bhHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786892197; x=1787496997;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=X5fUg7aVZd0xLpp8t3QKIhEJmceASxl2vAKj9rm2Rx8=;
 b=ApFDjpXGhkRaK7sQ8LZaADAxH2xMNkCzJbxPHRQW+7m0PyP+mkWCm5d49P9zl85iRL
 Jzey1clzVN/KEzX1tJfy+R2CMn8P/nRvx2ntOnEXlnpK7q85zfOJBPrbkBTVrFEirLkF
 Ozoqbh2waNJ42A54EhFtfiJZl6IDuDkMjS/dSD11KR9bYQHXWTkKzOa0yTiqNpBYaLWj
 6rlv6WMKEoWiZb1QbBz7cUXf8Jip99eYoeDUuNuHloNtlkd1Hd5TCeQbQxMoYrQ1dcMj
 s8jjsRNxMN/ICmSYKercK3OaSPYEOi+CHLo7SlkiLjDGxHzH3ekbfmHp7DyjWzVCv9YR
 aA6A==
X-Forwarded-Encrypted: i=1;
 AHgh+Rp4djcmughJod9ZsH4eHh3BVwInETDdWVeDRmJ3+uHFRTdkyu3KdLsBV9i/7+CumJiGbjKAQf5vKg==@nongnu.org
X-Gm-Message-State: AOJu0YzM8/pUfSo5IFgZv1COdewBsKmTiTUfazqmsRO6A0sEpaM6AsA6
 KAeZwtLNU5QG8WoRTqrPyB5vOkK97fpbUXOO+ixwJWXFmWwRJZD4b/7GbfpHOSAYke1TxVEaghx
 MUB9B5n8Q+SqOJUu2y0sZ7SwwRLaBFq6o7P/M+/hYiZY4dKiTzetW7uY=
X-Gm-Gg: AR+sD13O9N0eNswta/GANhiQ8Lng1SmC8zsZFSk3ncjKnXLYuybc/uT+OK3ygnqvwf5
 LzKxWquof9rpUyHZSFFm77CbtY01Lg+110uBfjlk/il/gkJQIsWGFNtezicpliaWaS9x6GEEXBS
 9XuxfjWq3cRsYV0TjzWZT5FSxBCUzJMPauS9/O+GMmZDesiGk+LNnkg99x0gWNmKwn/5D2YPdRX
 By2J8bw/PWAbw6PdSwCIqgh45kUfDQecA5Vq5OrwR6fJQ3wZOiAwpaWYr40kCp0pmP/+gMT3w5m
 F37sr2LGDbOli4n7z19LXHfY28DhWuLVedjUzFWa0dl0ERqFacjq8DIQNXpdB0F+lbvUg2cix+1
 B+MYOl7N7ntvovZBrGubH5c0RCI7fnNPkhLI=
X-Received: by 2002:a05:622a:40f:b0:521:8ef0:b4e0 with SMTP id
 d75a77b69052e-52d8534dafbmr208752411cf.17.1786892197551; 
 Sun, 16 Aug 2026 07:56:37 -0700 (PDT)
X-Received: by 2002:a05:622a:40f:b0:521:8ef0:b4e0 with SMTP id
 d75a77b69052e-52d8534dafbmr208752151cf.17.1786892197191; 
 Sun, 16 Aug 2026 07:56:37 -0700 (PDT)
Received: from [192.168.69.229] (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-499906aaf1dsm104452945e9.4.2026.08.16.07.56.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 16 Aug 2026 07:56:36 -0700 (PDT)
Message-ID: <2617cdda-c353-4f00-9a6c-9bc2c37440e3@oss.qualcomm.com>
Date: Sun, 16 Aug 2026 16:56:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 06/20] hw/arm: exynos4_boards: Store boot info in the
 board state
Content-Language: en-US
To: Bin Meng <bin.meng@processmission.com>, QEMU <qemu-devel@nongnu.org>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
References: <20260816131300.51799-1-bin.meng@processmission.com>
 <20260816131300.51799-7-bin.meng@processmission.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260816131300.51799-7-bin.meng@processmission.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=OZ6oyBTY c=1 sm=1 tr=0 ts=6a81cfa6 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=FRSEYCzRAAAA:8 a=EUspDBNiAAAA:8 a=P5mgNStSnDlmL_58Bq4A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22 a=H4N_Y-AU75W7NKDNhZlT:22
X-Proofpoint-GUID: vu3CMMh8kBJlW1eE5t4iSaOujp5k9x18
X-Proofpoint-ORIG-GUID: vu3CMMh8kBJlW1eE5t4iSaOujp5k9x18
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE2MDExOSBTYWx0ZWRfX0SMp7w+z8/p1
 DLdLR+COz6XmhGanfIaFe2yNFhflti5l8nDKykoQoscm0OWzUMZ7dlrndDtYl9s1xRbQ5bz05T7
 nYNh9ZKes8SLwNC0kT/hg9Ufa7xeZQQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE2MDExOSBTYWx0ZWRfX3NFmdUBbPFz3
 0XmeCBwxEsDYOleKDEcPn7x5QpUq6ukfoQZ12faNtCBDlhmz7GJ2itgTBL2Vnijtzq7IkGEyD3u
 ql1NWkqH95MqwGwV3DidkBXBLnjuGnBtQ+YX91HcXOdjXHD1DCbUa7CrPS1gE3ABuLaXsLsZ5Ra
 BgAyxyR5xBAq+fqodPw76TQq2uUvPiBLW/LZ+cBaQv1IggBmJVwBGvp8GJlMMnr8RHwe31n25OF
 3SGNdTQcQILilnWtMyEYg19zShc+36DBy7JKpfbf29g+N+9fCkQXLYR81dOjkRFDyXP5a3YfhT/
 NSn19HcCLxTegazlX0hKi0oRgmACWA+I4Q7CbRhBuHSO5X4rK0cyOzJ4ILn1TRsMJ7FtRdAMahd
 Wnquo47Ou0dpBPE8KxFpBfu6pSVFw3VUVx9DjVtgsOJcDT8bN8/zodWO118kgL9bZAE7lS+txZI
 Ych4g/YwyK2sOoYdXpQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-16_04,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 malwarescore=0 suspectscore=0 spamscore=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 priorityscore=1501
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608160119
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

On 16/8/26 15:12, Bin Meng wrote:
> arm_load_kernel() keeps a pointer to the boot info struct for the
> lifetime of the VM, so the struct logically belongs to the machine
> rather than to a file scoped static object.
> 
> The Exynos4BoardState struct is already allocated per machine
> instance, so move the boot info there.
> 
> As in the xlnx-zcu102 and raspi machines, the boot info belongs to
> the machine rather than to a static object:
> 
> 4d1ac883a7 ("hw/arm: xlnx-zcu102: Move arm_boot_info into XlnxZCU102")
> 0f15c6e338 ("hw/arm/raspi: Move arm_boot_info structure to RaspiMachineState")
> 
> Signed-off-by: Bin Meng <bin.meng@processmission.com>
> ---
> 
>   hw/arm/exynos4_boards.c | 26 +++++++++++---------------
>   1 file changed, 11 insertions(+), 15 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

