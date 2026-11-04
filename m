Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6699D606A31B
	for <qemu-arm@archiver.kernel.org>; Wed,  4 Nov 2026 11:13:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MRBDtEo0;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FaWuuxrx
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xOYvO-00064S-7W; Wed, 04 Nov 2026 06:13:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xOYvJ-00062N-Of
 for qemu-arm@nongnu.org; Wed, 04 Nov 2026 06:12:58 -0500
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xOYvI-0002e3-8t
 for qemu-arm@nongnu.org; Wed, 04 Nov 2026 06:12:57 -0500
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6A4B5bqp1641448
 for <qemu-arm@nongnu.org>; Wed, 4 Nov 2026 11:12:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 knOQRZNkOlRsXWXziLkcMOLtbl74KQrinK9bEeSYISE=; b=MRBDtEo0c/D/yf3B
 0Xn5sIqHdTFcasoQ9oYj6XKaXmehcqZrSoOMYMGAVlePX2WRFE80f1Df73Gu28Bv
 3urZ/uf5ui65cFkLGHbB0QC2rRxt/3ZMR/qx/Odf7SheWRQpWRV2z0Bs4kpkWV9E
 JE7kCGmid8PULzhAnVxHfrI9EDJbDuNBv4TPGelCfvJZivSs9veifYU6f+Qc2im9
 sXb+ARFEHWA3vrzaDlptPhstUkp8P+yw7u0BWtqidOI0vEMLcrQihigznhtN0a7q
 8sZw068Cxa3rjaf9ia3dTiS/13cmZMA5w55yIG+zT64b54y8cjBklGDGMASpN2EO
 HFyD1g==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com
 [209.85.217.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqhypmnqw-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Wed, 04 Nov 2026 11:12:54 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id
 ada2fe7eead31-7c0f07b4e97so489894137.0
 for <qemu-arm@nongnu.org>; Wed, 04 Nov 2026 03:12:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1793790774; x=1794395574; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=knOQRZNkOlRsXWXziLkcMOLtbl74KQrinK9bEeSYISE=;
 b=FaWuuxrxhGUI/4ImWZol3+CaSASHSZ38+//aPO5VBD+u5P75JF+NAXb++0fBuj5iOw
 AZFxL7dyxf6Um0p+rfx0iaZPUNHgGSWd/TCLyq6dDKp1W4i2rsUPWW5D7I2r3ZUB9ld7
 yTNkiK/TgJ6dWGT5L3b0STC0eEGe9Kc/J/8wC310uN5m25J58MPoBvCokfZeo/IaUE9P
 pQQXe1alc0WLJiJ0hui1yuhpbQ1j/IT3rO+ewDVzsu+e34aFixjkll/RdvkftsJA5gXg
 MOBZarcQwev5TSvin9pq8BU1VroXMzGV/GgRTtEeG313boGuExPn1PuMTySwqRuoI1bO
 txNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793790774; x=1794395574;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=knOQRZNkOlRsXWXziLkcMOLtbl74KQrinK9bEeSYISE=;
 b=2w6WGwLZ6Mh8lQkT+6Yc7/QOLJR5922bDR3O5ymJb8K5k+FfPP48Fw3mz8NBMdRHIf
 eNPoiFje9a62ravCEPeRjtjaJSMyi2KgEXWEN9aqDNzE8qAz3TnPo+3W2Y7hzpL+9tPa
 jMxFuVOrEbNGg9NBXkW4Lngh7LGCycEJbMUHaPoqQ8q5sZVgDivHPt6RIJhmzIAfhFnH
 2Y7/w2nfZB3Z7dw+ywP0oU1DCmHwDJJgCWAvc0kQieiutXQtQwWpSRvgyoyHa0YPj7L/
 pm06Fp9N8KAzRGcgXCiRdbfYJVNqCwti08C7qb34704Bf1xW1KbBWiq+9NIKAhURyjD1
 xEaw==
X-Forwarded-Encrypted: i=1;
 AKwUvBwRXjqjeVCXCcsyvn183nH1GoQpY4YIIKPDfJVuR7nm7Po7dRLNtJ7rcT4DIWosxLR6XAFjO9hung==@nongnu.org
X-Gm-Message-State: APuU4Z9SqNSKJZoRGRNunK6atVVqu1jztfMDrYIfKKKAHHsJcsXL6/68
 j69BLd7pOpjI9DLpZw7b7+1/80PUEBYApflEUeDqbI/azD6d0PfsDkDppKnaqPe51W6S1iSYbWw
 6W2qLtY+5AXA9x9bOWBjZfBniO+vgVG+3fwtD/1QJEnjDnMgAz9hKCbk=
X-Gm-Gg: AYBFou2xcAlCaIHWJOJTghWkJiC8o0xptCLmrN5gsNLcvQDbSU2cDIaYaBZ/9RxjaUt
 ZXK9TxsZGWRy07vHnIfzEkUw2Vy2BFmQHtlcWEJroGGWj0Qj0wLykeo9WRbDPI/VeqNCRcyN75Y
 1t3IkeGE/y+coZY4QvJZedK1Zhr3SL0QPuCnjLeo8F47zEtO615dWDxohAFU4vPGZNSFc0o5OQk
 b5wm7QDJXE9bLcCo5pG/eDpTijwPlHjnlN08W8XPtvmZgcsGh6Oc93OWfkFzjd48d62FTIIOLjZ
 MjQhmvYDRM4fCSLmUL6qbQAxbTnKEj0vgQT3I8VQSrKynSuUkp8bpdwatpBRzUazctEF2LJN+5q
 s7rEK6bhFT3gBMpyHkoT/NQf6aQ6cY11DMRa+q1Y8+JzLg1Fxh4di1ap+lWBLKlU3eYyqtBfWOa
 YMbOdwlg==
X-Received: by 2002:a05:6102:2906:b0:7d0:57e3:d480 with SMTP id
 ada2fe7eead31-7d072bc7545mr6830918137.11.1793790773818; 
 Wed, 04 Nov 2026 03:12:53 -0800 (PST)
X-Received: by 2002:a05:6102:2906:b0:7d0:57e3:d480 with SMTP id
 ada2fe7eead31-7d072bc7545mr6830913137.11.1793790773418; 
 Wed, 04 Nov 2026 03:12:53 -0800 (PST)
Received: from [192.168.69.229] (pmd666.hd.free.fr. [82.67.153.177])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48fea181079sm3582702f8f.8.2026.11.04.03.12.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Nov 2026 03:12:51 -0800 (PST)
Message-ID: <2fe49ce7-e264-4fea-b7ef-03a438e0d9bb@oss.qualcomm.com>
Date: Wed, 4 Nov 2026 12:12:50 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] hw/gpio/pca9552: Fix @type of pca9552 property led<N>
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
Cc: marcandre.lureau@redhat.com, pbonzini@redhat.com, berrange@redhat.com,
 milesg@linux.ibm.com, qemu-ppc@nongnu.org, qemu-arm@nongnu.org
References: <20261104064552.959862-1-armbru@redhat.com>
 <20261104064552.959862-3-armbru@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261104064552.959862-3-armbru@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDA0NCBTYWx0ZWRfX0PddPDucBTVq
 aMbwB0N//7qEVXSmAQH29Jcpt0Vg4UYYLSUwgPlm3H2nXdDg2Z62fX1ArGQt/dO022fHXszb8P1
 sjsRt1sDHta5cEukZdWYhPMJErslvF4=
X-Proofpoint-ORIG-GUID: qm7VtOjvt59JQ_W0omwl8xWiZS9vBgeL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDA0NCBTYWx0ZWRfX0ItDzFR83oDI
 nxRBHQh+mjCKuhHOAVl6dOIJdoUvH37vVsXkeHwWI8BtuL/XaPv2beGZM+SH5r6zbqhaypbvhPB
 74alkfqAU5PrXkxAT8W5lyuKEKnHbgbbKa6AV8csEoBmIaz4CDmVKmLCMGZoacs0vYV1ekrF+Sk
 rGFcn5nDQQhkCTblMypspjbhy6FGQr6CkNdJo5x0hnNCB5NTjBPIMFwnBiW0/QDDXj9MnYVQo5f
 9mgX1CFH/2d8RM0vpKwcN1DTTsdKy8enx9UuX5cdY/uOMGYXVsBT9CqR+dDrJvVYkk5/zAr2eck
 h0UqovIQYS8KY7QGOiUTulGd6/v6nI/pPFogE1TBkSj8BoiemAnaD6PXps4XzZgxW2LFQzCzwTb
 WycE+2f61R8zcrOBK6Z7HVik9GX1rLuEEBH5UTfRoDHm99Opt0WhJOpC4o24dlW5zCgFH8xaJQS
 xz1xmaGbpHq57wbAeHg==
X-Proofpoint-GUID: qm7VtOjvt59JQ_W0omwl8xWiZS9vBgeL
X-Authority-Analysis: v=2.4 cv=T94Z3PKQ c=1 sm=1 tr=0 ts=6aeb1336 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=nz36NW0qrpeEijYxj/H2Ew==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8 a=C2CdMa-K5c7WqT7anM4A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_03,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0 clxscore=1015
 adultscore=0 suspectscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611040044
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

On 4/11/26 07:45, Markus Armbruster wrote:
> pca955x_initfn() passes @type "bool" to object_property_add().  The
> properties are actually string-typed: pca955x_get_led() and
> pca955x_set_led() use visit_type_str().  Pass "str" instead.
> 
> Fixes: a90d8f84674d ("misc/pca9552: Add qom set and get")
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>   hw/gpio/pca9552.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

