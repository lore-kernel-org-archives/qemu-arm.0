Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 158E3CA5FB1
	for <qemu-arm@archiver.kernel.org>; Wed, 30 Sep 2026 07:38:11 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xBosy-0008KM-St; Wed, 30 Sep 2026 03:37:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xBosw-0008Jv-PJ
 for qemu-arm@nongnu.org; Wed, 30 Sep 2026 03:37:50 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xBosv-0003d7-4A
 for qemu-arm@nongnu.org; Wed, 30 Sep 2026 03:37:50 -0400
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 68U6pSwq2981907
 for <qemu-arm@nongnu.org>; Wed, 30 Sep 2026 07:37:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 b8Wp4F29UGE9kcK4r8ue/dE/6S78FxBqq6ked9e65tU=; b=SbXm2OppXq3G0nzV
 GXkJMlrfkmK0IC9qwqbT9jSuHQv4S1hGo6qXr8wjFoov1/tX7rBM+oWczHw3TZAU
 Q4j3VJRfQqNGshKQl1BhxvYDJfeL7CLSIXPeyPlRG0KSP9qntm7EFpoKWywJpxpj
 wg6UoKr94iW90VUKC3Ui3/oapsktQoGB9NtAVyvYcceho+qOIL8/gbuKZJbK5s7g
 8ln+9vSqv4pOjY7X37xHy8TBF2ZHIwzKqkUobJ7u6hQO7ijk2DxRoDltyVISobUy
 phCHZYIs/OrZ/G3KW0MT+GC8qziUQwPiaBkzRI6wCmSdDDquyYnrToEmKT5iMLdB
 90Q4dQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0j0ek46a-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Wed, 30 Sep 2026 07:37:46 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-934956beec8so1050950685a.0
 for <qemu-arm@nongnu.org>; Wed, 30 Sep 2026 00:37:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1790753866; x=1791358666; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=b8Wp4F29UGE9kcK4r8ue/dE/6S78FxBqq6ked9e65tU=;
 b=ACshB9mS0kEjsYT+V0CpJGPrlZ9eim6HGPtOYOx3Z47T9r+k18hKAT0dMaI/jAFCoZ
 qY1bfQYM3cDOdUT/9JUdL3GW1wtK99Y6G2FxrfUk8vdj/U+ed4glysbDCy1MdRj3ml+Q
 kwdzY8Q0WS+KU2HCIaZ7sYhLfFfbtQP/fjuQuAd280ZmaxSjLfkE6PR1KscbQ+aFETje
 kNihOVH9n/QAaZ9FmEF5kNhLc08DeYNFGJqaK1PRTHq/uTairkzE/jiYxc2SoppVrUbd
 sodW6xYfRyOBk6FyN3/aEghF8dGZHJEjJJ3oY0PYy7A/pyF+VJmxdBFbTDOjHPmYfIpe
 xAUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790753866; x=1791358666;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=b8Wp4F29UGE9kcK4r8ue/dE/6S78FxBqq6ked9e65tU=;
 b=BTLF36A04LXGNR0hvv5bFFR0iWLFOugIFGbEvFi7bQLZE4Laktcla2V7CPvF98DQbF
 Qi2rHNtBwgIQdFg98RbKZ/lIWVOvvKDMxDeB4hkJhM/tqcDHIWV8ZmIHk5IEX7eU/dfM
 Uggm2Vk40OiKvJsoTFpuFujw6ZAj/3h3DHOWy6Idx121MIfTdwf83ITgt4jyv2qTx/eo
 Aw/YCj+h1RyadkMY1uiBdr754qp/mfmvQNnrqaOJCNBI+C8ZlxA6Lxsn92RU/g/mmiyp
 rhbjLNZWRUxlMfM/lCGt6mySaYiQhxCbvePQIZL3W51kRJENwn05zsyJ9oHsKEAj0wK7
 eSbw==
X-Forwarded-Encrypted: i=1;
 AKwUvBykMY6xHPFp7JgCMEA5NXw97BPPKIRV8W4pc+AG8o/NqFWq4PM8WOOQmNbQfQYN20Ser4U3M0CzuQ==@nongnu.org
X-Gm-Message-State: AFuF++mzXrpxymm8/H2je6i/B3q9EXrw9AlXRRuL9wCOgwmbSCgfoRTS
 rBC1JOiCOtq9ZPGWX4cJFXgGjyWWdM2kz3mlD+e/4DnTp0sBc7AafQ8bJPsYiwWHmj/5ufZf0+L
 R7o1w2qtrKwXXLBCraFcgN5HmAd/IFWcpAISR1LN4AnsTk1nSPoynEL4=
X-Gm-Gg: AYBFou1AwbH0TbAugq99rhybO5IEfZpdSEsAhgFNTIltQxpoM2o33KhaIyLanzPumj+
 FJdQ1uhP8ipMxvI5uXnfn9N0FcNBiXZCwStK58J0+1s7xZ7DBS0t0BiBQebX6v3uO8O5xJWh1sQ
 4tqvnARZJ0xDWDPKZyBLfgR6+vZgowQ+n3PXNtA/z+0gffKy9VVSkOnlu6y8BwNp1N10LRl+qr+
 UNsDviavcWQA3lLjjmVGkUivuavz5aj8VFaw5VVYiTi2yzQ2M0f6KQEjQyp5ozI6pzOUSO6RJE4
 ScrjyL4cloeFIh4KverlJ7RqCYBbNTFO6fafcq7oll/zenACuPOqF2W6wBULg2ynkQc5RDkgbGO
 ezQe2umNKYlLO6B/WbF4=
X-Received: by 2002:a05:620a:4727:b0:93c:2110:14e1 with SMTP id
 af79cd13be357-93ca97fec3amr87651085a.42.1790753865956; 
 Wed, 30 Sep 2026 00:37:45 -0700 (PDT)
X-Received: by 2002:a05:620a:4727:b0:93c:2110:14e1 with SMTP id
 af79cd13be357-93ca97fec3amr87647485a.42.1790753865414; 
 Wed, 30 Sep 2026 00:37:45 -0700 (PDT)
Received: from [192.168.0.4] ([79.127.134.49])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a0174f03c2sm29657845e9.7.2026.09.30.00.37.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Sep 2026 00:37:44 -0700 (PDT)
Message-ID: <941d7bb6-3205-44cf-8d76-ffbb322a6f4e@oss.qualcomm.com>
Date: Wed, 30 Sep 2026 09:37:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 01/11] hw/arm/aspeed_ast2400: Use unimp array and table
 for unimplemented devices
To: Jamin Lin <jamin_lin@aspeedtech.com>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?=
 <clg@kaod.org>, Peter Maydell <peter.maydell@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
 Kane Chen <kane_chen@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Joel Stanley <joel@jms.id.au>,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
Cc: Troy Lee <troy_lee@aspeedtech.com>
References: <20260930072501.2612119-1-jamin_lin@aspeedtech.com>
 <20260930072501.2612119-2-jamin_lin@aspeedtech.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260930072501.2612119-2-jamin_lin@aspeedtech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=cqgOAF4i c=1 sm=1 tr=0 ts=6abcbc4b cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=7g8aA7A78AY7OC82r+w+4g==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=V2NxCb60AAAA:8 a=EUspDBNiAAAA:8 a=KE-JQe2ySrNsirWxb6UA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=3L6qF29SlnrayQqPM2jZ:22
X-Proofpoint-GUID: ZHGVyXZIysPinPDgiH7rafbEhfhD-OXG
X-Proofpoint-ORIG-GUID: ZHGVyXZIysPinPDgiH7rafbEhfhD-OXG
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDAzMCBTYWx0ZWRfXwk34w6O5NbO4
 G6aHMDyUtuJMMQeQLgOkL/SewIBPoiCh1C+aBBtq5NC5ekpASfXPrFqx51fe+15PbHrhyT7KUk5
 O1p+grScxFmgJPhfTOy+EKakyCTjzsg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDAzMCBTYWx0ZWRfXyuN8U1NXqdwM
 jgZ3AbPSB0x6MzvDcEDaZuKf5ZPQOYDOCYEMUUTFbwfXh6AALcV8Y9GVRmR/xrIUCW7p+Q77yTD
 HrUqiJ3op8scC7oqTTcPn2Xzwp6DUV2U9qxxOV6fGhnH5ni0YGbKVqONGV10kqWWFGXUNpFzdF3
 d0YOq/TliLrQulGozpfccn5lWBoW95oNCeQsHeW38mA8J2rpeGT0oCaWVy6585WQTuSYpCpEndb
 +cKelWSHpBlXnEIwFwxB0sojLKquEEvPki+UPAKPS9csgdqqeRLg70TDpzVqNdboFGWFHJSnaZP
 wIqfqmhd3qfFO3AZavXTzdRhxiG5A6CQ4iXgFYLaBULzPRqUl1XQfNElFWfv7971sEgemFOIqXH
 mBb9wZRG40oG1mFWDdhWJk1PqMxoZPNp2hdksx9tYK1IBzE/aO2TWn03+Yc+3Rv0Mxy3ZQsMpW1
 ba199nvVe7XdBiRGCbQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 clxscore=1015 adultscore=0 bulkscore=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300030
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

On 2026-09-30 9:25, Jamin Lin wrote:
> Before this change, each unimplemented device needed its own field in
> AspeedSoCState. This made the variable names confusing. For example,
> AspeedSoCState has "udc" as an unimplemented device, but
> Aspeed2600SoCState also has "udc" as the real UDC model.
> 
> Add an "unimp" array in AspeedSoCState for all unimplemented devices,
> and add an AspeedUnimpDevice table to describe them. This makes the
> code easier to maintain and read. Convert AST2400/AST2500 to use them.
> 
> No functional change.
> 
> Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
> ---
>   include/hw/arm/aspeed_soc.h |  9 +++++++++
>   hw/arm/aspeed_ast2400.c     | 33 +++++++++++++++++++--------------
>   2 files changed, 28 insertions(+), 14 deletions(-)
> 
> diff --git a/include/hw/arm/aspeed_soc.h b/include/hw/arm/aspeed_soc.h
> index 38226d9b80..a9ef4b3550 100644
> --- a/include/hw/arm/aspeed_soc.h
> +++ b/include/hw/arm/aspeed_soc.h
> @@ -64,6 +64,14 @@
>   #define ASPEED_INTC_NUM  2
>   #define ASPEED_IOEXP_NUM 2
>   #define ASPEED_SRAM_NUM 2
> +#define ASPEED_UNIMP_NUM 10
> +
> +typedef struct AspeedUnimpDevice {
> +    const char *qom_name;
> +    const char *region_name;
> +    int memmap_idx;
> +    uint64_t size;
> +} AspeedUnimpDevice;

Note to Peter: I really think keeping duplicating the
UnimplementedDeviceConfig structure is a basic software
development antipattern. Could you reconsider your objection?

Otherwise,
Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>


