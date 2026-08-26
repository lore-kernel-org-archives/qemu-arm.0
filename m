Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CADF0C5DF97
	for <qemu-arm@archiver.kernel.org>; Wed, 26 Aug 2026 18:09:23 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wzI3X-00012G-1B; Wed, 26 Aug 2026 14:08:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wzI3V-00011K-9K
 for qemu-arm@nongnu.org; Wed, 26 Aug 2026 14:08:57 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wzI3T-0003zQ-RG
 for qemu-arm@nongnu.org; Wed, 26 Aug 2026 14:08:57 -0400
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67QHM5VH1044330
 for <qemu-arm@nongnu.org>; Wed, 26 Aug 2026 18:08:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 gfta1wVShaiF7i+tkcCGqAk8FK9EsbJ8xRldVZZ6TEQ=; b=M8F2WEf3u9ErDkyS
 h9FsNQQGITGlOBwIFcVa3BEcgm6EMTQmVSSXGGpLeYBLIkDOVuICkzRTLtDaIKYp
 wrvDRjeG9waqeaPT8ecmHqD0BQBMZzFAkEL5vOJik2VysnqZxWBmqVo+LBBKH3ov
 85tyXF33R5LkNQ8Zx7h9Tz7RmoOsRCh2LgpsLruTicwRzjIUJZdtc8wulsNuGUoa
 /9fgo0qZVU5Lj47T79Dnrdb7quUvXokoWrfU9HYoJv5K4korsYZWQOXyU+2iVPhB
 F44s4noOCV5TTjBjD0ldfWKS7HEoX427IwuE2p4V3y7RrIPTvFXFAP57CCqicxl/
 U9uU1Q==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ga4fwg6df-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Wed, 26 Aug 2026 18:08:54 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-51c26012cd0so13947881cf.0
 for <qemu-arm@nongnu.org>; Wed, 26 Aug 2026 11:08:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1787767734; x=1788372534; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=gfta1wVShaiF7i+tkcCGqAk8FK9EsbJ8xRldVZZ6TEQ=;
 b=EwdG3pi7QMNkNuxg2QPSTfo4USY3k2jOldc3vUcFY3xW5KANK8BbDz1JvNIstAp8nu
 qn37IpKuYopjxFcZ/uVPLQP+AR84ldQDr3CuHSTMNEY82JTBOA5lUnbOIqTsPOS4Nzgx
 nkS0I8JEzr/52WXmTZl7gAB9C7c06sQUlJ/3h/B7N1qK8twsQHzQzyoyOY0HSrbCyWCU
 lhqq14W0anhki96/9rnYuHob94jmD1xQdXtv7lBtz9/IwH3P6EK4Dije34WQMR+PWwXL
 GROOwFafcyvzg0MaaJM1HrvOzQdOXInbbIz8nP5X0GpnmTBWoLAGcUdej5Wm5vtWi3Or
 8Xdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787767734; x=1788372534;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=gfta1wVShaiF7i+tkcCGqAk8FK9EsbJ8xRldVZZ6TEQ=;
 b=oaARowWoxHflx3TTqBH92MX7sDrlyIpI+5LYZkfF+T4eqX4adoBUuEmGByZpr2IQLC
 m+BJJQMp1sPIgX555MX6Z2kFTXXncdzK1xH/5bRX6rMlQJOBnlA0NJ8f5EvjwS7SV8/t
 dZOTiV9UiaSIm1oEjw6IEaARPRfvWBNwPX9qP5o838YmPHIoxpaYfSn18rk08sA7CGdO
 JUR0XHtPoiC4zpf0gg7ePogZfFu5NK7CJbcfpmIaY9jJKMYcUa0hnmTe72fkKKP1qh4Z
 L3ewDJJ9jHedznlBSelaawxBVsPT4iU9XroZEE+EhNksHge+U5lVa+NvraDydIkfl4cX
 v5Aw==
X-Forwarded-Encrypted: i=1;
 AHgh+RpAp5ZkbMAsVFJ5xIsW5Azsl5TAHFlQLaDu8YGsgl+HJOHSqXsiOPIQiJdsG4SkPi9aMQIQvPFloA==@nongnu.org
X-Gm-Message-State: AFuF++kWjbvdu6r/M/CJCvFtuiAGJchaK7CesrvK1jWV+qW9NHw8wBvw
 D5gGbgi/mK852KTDyDLmFelgOSN2/ycfz+T2bRN/XFfxXzHub1Yqp0Qxfnx1cTaKwSwiqG54Ywg
 ZGIGmqT/f/ybp1gEMhZyf7hKHeA/CY6aUD22BgTV3ETlUEvkoVOo0gB4=
X-Gm-Gg: AR+sD13kgcGr+TVCsgj8Uah7pwZlNIcax+Ih4apJyBTMVDl+A2PFU0Ps5FOHuUFHW4O
 lAnz97gia/Ri3okavSvGDc4MkXw3b9tS37KeEItpcXJ9g38HO9fMoriSmz62PsllEAhdoc+KHrS
 xX9mdEncbCORb7D1EEQrtpkFdiuNYVgGY1NZJScVtq/YAfVzWtk4MdTgftt4df2mJBrOXAqIgJy
 5ua0MED+BvDt2UPfgxP8q3hhjRvpwpOHR9cSc/vKTGVWa9nvhOxATnuR9qLqN3MpDhKuAGS3/gq
 u4GmM4C3QcLVLm1k967MMXACkXCATKeZR4A/gmQjPE/LmyyyhWkr4M9/BSCWcUH7t3VbZq9j9Kq
 /+O9yylnitb+GfyPx74xWETU8OPHz2wyz9LSksXtAETZjWaHk
X-Received: by 2002:a05:622a:6106:b0:52d:c357:86b5 with SMTP id
 d75a77b69052e-52e4234d4ddmr88700001cf.20.1787767733999; 
 Wed, 26 Aug 2026 11:08:53 -0700 (PDT)
X-Received: by 2002:a05:622a:6106:b0:52d:c357:86b5 with SMTP id
 d75a77b69052e-52e4234d4ddmr88699251cf.20.1787767733549; 
 Wed, 26 Aug 2026 11:08:53 -0700 (PDT)
Received: from [10.254.188.74] (134.171.88.92.rev.sfr.net. [92.88.171.134])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c250a5d62easm624493666b.6.2026.08.26.11.08.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Aug 2026 11:08:52 -0700 (PDT)
Message-ID: <4af5836f-c2d9-4ed5-8e6a-fdfe7ca62df7@oss.qualcomm.com>
Date: Wed, 26 Aug 2026 20:08:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 06/16] hw/isa/lpc_ich9.c: convert ich9_lpc_initfn()
 object props to class props
Content-Language: en-US
To: Mark Cave-Ayland <mark.caveayland@nutanix.com>, mst@redhat.com,
 imammedo@redhat.com, anisinha@redhat.com, philmd@mailo.com,
 aurelien@aurel32.net, peter.maydell@linaro.org,
 richard.henderson@linaro.org, berrange@redhat.com,
 marcandre.lureau@redhat.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20260825134320.1039012-1-mark.caveayland@nutanix.com>
 <20260825134320.1039012-7-mark.caveayland@nutanix.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260825134320.1039012-7-mark.caveayland@nutanix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: uf-cOdIyPoOezsbB-EqgrkDSKcx2ISXD
X-Authority-Analysis: v=2.4 cv=OtZ/DS/t c=1 sm=1 tr=0 ts=6a8f2bb6 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=o1isufRNksZXpKP+aqnsag==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=64Cc0HZtAAAA:8 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8 a=1tSEMpTH9XP_W59IOagA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: uf-cOdIyPoOezsbB-EqgrkDSKcx2ISXD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDE1MSBTYWx0ZWRfX0oWDuCTnDmyL
 /+7Oe9WpxG4FO4TWv8uxNuhqJlSIq9iaCtjNoJXSf1VjZFjR2t8qDfJvR95bm3D+g2l2WtYXXx6
 EoIwfRPVTR9SJZfLZEii26a0kqC74d9x1ucNlfGvvnGjg58HPqgyJ0D2h5Dv9ckp3XtWYzkyN3R
 bJJtuSQ0Wo8P8DKqkaK/nl+bsjb6orguHrTsNYMlkgsL8+e+GL1uy64XhzsamHZzcnoooEOcNcR
 fJ/paIY2G+pAXl337dBsNQEr0351Zo91RUNeKebIXszmzgaJcu/GlSnGrXa28G1kgLyDketfmU9
 TJIq3FKDtaI3mIgrOMo1MIvha7NPJHSYwz2RIAdzkqSs90YjGIPfSQH7kwcRAN2o7iUYoiSlsYF
 rsmT1f+O4Jw0byAg451ICJIS3bbGbQQYiHFZaYywprgxWcfASOedkzUY/20fixdDuTLupKwCYfA
 /7PdRuE3bKF56URvrtw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDE1MSBTYWx0ZWRfX3aiFyqoJlgX1
 4HPzG6Isuf4Nu3VDGoAoTt5KQ5IVOPXSSBTO8+pc+iqHx0+4/8H7nDMVXvOcgkh27K4OfCsmA0Q
 M4H/VNe1TZKO+91+EUZ0gb9Mq8pWwkw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_05,2026-08-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 malwarescore=0 bulkscore=0 phishscore=0 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608260151
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

On 25/8/26 15:41, Mark Cave-Ayland wrote:
> ACPI_PM_PROP_SCI_INT can be updated to use object_class_property_add_uint8_ptr()
> with OBJ_PROP_FLAG_READ, whilst ICH9_LPC_SMI_NEGOTIATED_FEAT_PROP can be updated
> to use object_class_property_add_uint64_ptr().
> 
> Signed-off-by: Mark Cave-Ayland <mark.caveayland@nutanix.com>
> Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>   hw/isa/lpc_ich9.c | 33 ++++++++++++++++++++-------------
>   1 file changed, 20 insertions(+), 13 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

