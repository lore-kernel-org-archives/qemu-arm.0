Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9DB5C44501
	for <qemu-arm@archiver.kernel.org>; Fri, 10 Jul 2026 13:38:03 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wiBQ9-0003tY-8R; Fri, 10 Jul 2026 09:37:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wiBQ2-0003t6-Bs
 for qemu-arm@nongnu.org; Fri, 10 Jul 2026 09:37:30 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wiBQ0-0005Qb-P6
 for qemu-arm@nongnu.org; Fri, 10 Jul 2026 09:37:30 -0400
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66AD6QDQ874086
 for <qemu-arm@nongnu.org>; Fri, 10 Jul 2026 13:37:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 gTsW+0DajqGNV0WMB20q1y1f6fLmLWtEIcN+wk9ygf8=; b=cwfqRNkFwPiuWsYx
 ej6mL+R0Aheycuka0R9ZifMEbpRAKt5r8D0oVfCvCWKrOx3bPfBiB369pqI8Rgs3
 DFbMzxRNeNaZ0R8v4rYrPm8qcDOiuJvR5NceFHKhqO3X4QjXx6OQ/MFYx2VlxSdb
 hQsmE5EZXtzAXZcUV3G5sQbHPfLo3QdCBXw81GS5cmqULVoz/aZ8zfU73vbYphTF
 KRlVmpHn6+Z+deraiQpQnz4wk4vDlDpMsJOrnWWHwc/92h63LZnRTB6FCI+zA2gO
 98qDOfoNuufnZ6FDOglF0M1pOxKRVhY7W7PlLJw6H4SA4JDImqg8s7t3niFs3X0F
 ViupaQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fax5f8uv7-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Fri, 10 Jul 2026 13:37:27 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-51c110a3b6aso12760871cf.1
 for <qemu-arm@nongnu.org>; Fri, 10 Jul 2026 06:37:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1783690647; x=1784295447; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=gTsW+0DajqGNV0WMB20q1y1f6fLmLWtEIcN+wk9ygf8=;
 b=WlzK2jAft8YGwyXYK/Td5L1RAHK9sE41q2rJhZadPF9v7T6YDlfKOG48TJL+4xYyz9
 A7UjZYYhL+i8SVh3ubrDdGi6rQrARfVl+DQUT4ERey7k7M3H6UFdkQ+/k3k3hw8glZP6
 9sZBpXLlaZmlSIUrtaTW83qrmezdGMOJF/GRbEw1xynii+pI9Y8o6dQjoJx9B6OadMoY
 dg7q+/fmMAC8mkbZiSS+3a82ggZ7ct43FbetrZx1Wq0WkYE6HiE4Gguffl3KNQ2WleZJ
 I+5um7VN3HIoffz8E3yi4VzCd9eYA7QXSscN4f+1zGEDEqrzKcLPuCrR3PkdLZ0m8Ekd
 iK0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783690647; x=1784295447;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=gTsW+0DajqGNV0WMB20q1y1f6fLmLWtEIcN+wk9ygf8=;
 b=MLfwG8OAHrolBeI+ZMz3POcEPuk3iXrUt5LQgrR2uRpYaDPLgDnNXxzEYaXV2aZoeU
 xjg1EmmcvpJ/L11oo7x1Ww8LyFYmdv76LPuu/4b6AXDklq3rSG4XTNSV6VwOtSzEQTwH
 BNkpj8ytEj6Eto16DvmQRdRO/HHFnBr31Tic8zHCXeeW3Hc+o0ePozTKjxp/fWu1N+RZ
 yZ5m5yW/oniUCFMj2AOv9R9dCFntq5/rqq/yif7d6NhYT+uml/mzNAMndT9Z88W/YMZX
 K10ah++4+pMSVDUL/jgt0mnby+A77P3je/E7iZRZX34aQW7A92aWYdR6dmUeLpKxhvCG
 sFIg==
X-Forwarded-Encrypted: i=1;
 AHgh+RpHZSAqFiQ51NIFO+AGaUphN9gZtSs8ClImWKKph4t+ifG3ih9VPEs8NdCuzxC5h1kzXzwg2JxBzQ==@nongnu.org
X-Gm-Message-State: AOJu0Yz1ER1XDmDRc6ul5madcNt0MODuoov3I9bOB2+rr0SHkkKiKyij
 CcGPJ865xc4PwDRexC+IaSU4/c+jlYH3kVP/dYGxA5GDgzVHG2ZyI/ECEaJEUx6odCxmKjHCNuL
 hOOLhE0e/e0OU9+8hME4aMFbO65KanyySKdK2wWxYFpTjzFTZ36xdbtk=
X-Gm-Gg: AfdE7cklo3hVfJ4zQmV2haqkQ9GIu5FoLU34oCZIE+9ISB+DJMSeVISBesaS+Gsbf8L
 jQa0XQcy/xWFMISJcabNy1893Q1ni0HLt2gqbEJSu/ugW8Zc0h/PXIWkBk1nJxwejIbMUR+hQoD
 Padzo4LOpB/GoPPtDBGQbarQZ4+62Ll4c1SKJeeHulrTNiV0kDdnsP88CF7dV19rPwfFkpc0Qhm
 B8Giwz78MQ8XdGHuQ5JzxK6zeyvsxXBqXAdYvcSQP+eowwMeNRShZJcpWp4M91u++4LWFBdwcVJ
 81RPdFSXoIQOA0ynrCvCicD0hQRzj1GsRtPVOAF3pPhvvYl9+EAsMxoon0L8vMOedpFOpBGWlUg
 cJrUtpiDgsHZmc5mP34GDt0DI1daZ9BNHYhghLRynsxBcnaINjzKfQSLf8vAHSQ==
X-Received: by 2002:a05:622a:1811:b0:51c:15f2:4bd3 with SMTP id
 d75a77b69052e-51c8b3d432emr123998101cf.22.1783690646755; 
 Fri, 10 Jul 2026 06:37:26 -0700 (PDT)
X-Received: by 2002:a05:622a:1811:b0:51c:15f2:4bd3 with SMTP id
 d75a77b69052e-51c8b3d432emr123997781cf.22.1783690646332; 
 Fri, 10 Jul 2026 06:37:26 -0700 (PDT)
Received: from [192.168.69.219] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47aa039af67sm67998785f8f.17.2026.07.10.06.37.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Jul 2026 06:37:25 -0700 (PDT)
Message-ID: <4162f17d-c91a-4e59-82e4-d4c1f590396c@oss.qualcomm.com>
Date: Fri, 10 Jul 2026 15:37:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 8/9] include/hw/arm/omap_dma.h: Move to include/hw/dma
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Jim MacArthur <jim.macarthur@linaro.org>
References: <20260710105907.2570621-1-peter.maydell@linaro.org>
 <20260710105907.2570621-9-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260710105907.2570621-9-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Ab2B2XXG c=1 sm=1 tr=0 ts=6a50f597 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=Aj_Y6IE_OcN_L7gj-gkA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: PKlJrywoUh3SBPpHZcKyMEVaZSlGBVmB
X-Proofpoint-GUID: PKlJrywoUh3SBPpHZcKyMEVaZSlGBVmB
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDEzNSBTYWx0ZWRfXx3AQUHsyCuRd
 8SZuMvbAiVun87FCSgtYeNYMcGyXOG4jd+UK1hIF6sUHOwQ6fFNsteJWGaB2migZVCOqC57VaQC
 mW1VgEumW6M17ZJxmwzfe/FlcsrNP10=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDEzNSBTYWx0ZWRfXy5vY0QhQ3V4r
 vSirridj8J0n1v/gOthc5tLcE7xfw3yKTUlBabH5OwBGUzwyjEcb63gpVSq7oPIXmdIN9+PNf8o
 x+iWyzzACsCvsksn9pexbcdB0jhD6ZoPPnh2OC5rm1b6F4uUh48JOEzDmpjnTJVogkFyBIZx5a3
 BzzA2+o8ZTUlXafwy3F73md4zfNf1bFtQ4NQb2o3JUVBIZGg0kNPMKmNKtbmiZyXwRBGortKNvJ
 aYjDWyHY14Y11RM9UntNPD///3Gs+/tUDDYJCe2ccymUwAJw6l4y7zvt5TJUjeZbzbykX5bmUKD
 3Cs9v/sOzt6eEDc5ktkShbJrFF4u5hSZUJBs+DSX8Xi19v1Dq08Y27Sga3s7I02q8+Abl4iB0Yx
 Gu8HuLcq1A+08h1k7nUENMotIaJIznitIrENncKNlMZceVGjyszbZ0s9MMuFl22jnjDINpo16Gw
 Bbd0t4RLi6vU+oDtCXA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 malwarescore=0 phishscore=0 bulkscore=0
 suspectscore=0 impostorscore=0 lowpriorityscore=0 priorityscore=1501
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607100135
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

On 10/7/26 12:59, Peter Maydell wrote:
> omap_dma.h is the header file for hw/dma/omap_dma.c; it fits better
> to put it in include/hw/dma/ to match where we have the .c file.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   hw/arm/omap1.c                    | 2 +-
>   hw/dma/omap_dma.c                 | 2 +-
>   hw/dma/soc_dma.c                  | 2 +-
>   include/hw/{arm => dma}/soc_dma.h | 0
>   4 files changed, 3 insertions(+), 3 deletions(-)
>   rename include/hw/{arm => dma}/soc_dma.h (100%)

Per the cover letter, "The omap_dma device is the only user of
the soc_dma code", then maybe take the rename opportunity to
name as omap_dma.h? Anyhow:

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>


