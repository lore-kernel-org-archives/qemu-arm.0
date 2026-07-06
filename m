Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AF20C43458
	for <qemu-arm@archiver.kernel.org>; Mon,  6 Jul 2026 09:55:07 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wgg2X-0005WD-C8; Mon, 06 Jul 2026 05:55:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wgg2I-0005UY-9u
 for qemu-arm@nongnu.org; Mon, 06 Jul 2026 05:54:47 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wgg2E-00072s-Ng
 for qemu-arm@nongnu.org; Mon, 06 Jul 2026 05:54:46 -0400
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 666944Fb4151700
 for <qemu-arm@nongnu.org>; Mon, 6 Jul 2026 09:54:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 FItJHwZ8IcH0nmshCcvaLDrdFzmOxSnTwNdZjMgYL+o=; b=WlVYoBcnstWFi8+z
 nc4QYub/roAFS8Kbumotp4MG6YsL15FPDTu3SkPwBaCJ9rRB7kaej+hoUIxkhLX/
 9J5lP0MckfB91nk2JzW1XL5BmoLPhP9DYBjRl782W+U4q5Eq41LfbI6XC5AOXLYn
 k++tznNsBIXpfEX3hhAE+nIK2SMdp1pNJmpF17D8x+brjI1PiB4BA57X6MwBKI9T
 8YCWpKpwf9CQMWkjbt/yKtiFGyDCeIWyqEbo8hw+vhqos4qW75o5BSE+Ljj5i5YR
 jueM7ri4Z/nq6nYfz26SkX8TptwWlVEXlCgxFXg8h7vmNLpAn6syAfGM8G92d08H
 Kthifw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f88hs8eya-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Mon, 06 Jul 2026 09:54:35 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-92e63df032bso314873185a.0
 for <qemu-arm@nongnu.org>; Mon, 06 Jul 2026 02:54:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1783331675; x=1783936475; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=FItJHwZ8IcH0nmshCcvaLDrdFzmOxSnTwNdZjMgYL+o=;
 b=XYx2wLyyT6Kpl4U1NgT3aOLUZiM2RT2OkhtaHy8E+fi3j3HK+iQ10CkZqmXVHryNPm
 FWnqqSKTAYlWNXxZMk70r4LOlXat2WnqqI/OxdMQ9ARhthwSpc7N4SaQDZRGZTXMbJ1S
 nke244vP8rDX4feVhfcwvgakfPgvt34+ISa4BrxL8JVQTR7pOPLNOB6XCE8O2nGliofo
 7l+6qITqIoqNJ7qr18eVFoWbupvQ8Yzf+Z8UAfnFcbW0x82y2NrsVUXFMke5E8u/ZJYP
 2qDQwfjQG4DVz26Fb1SCgDcT6VzWKBEo9eVP3SJBMOFeWWlq5QNgw9tAJg2SvjSzv++p
 ocVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783331675; x=1783936475;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FItJHwZ8IcH0nmshCcvaLDrdFzmOxSnTwNdZjMgYL+o=;
 b=YZNQPb7GJwmevsSndDR7+R2IKqpfrqdGmC3YZfA0m9P0KvMH1iXmkxAjERd6vQ2TFw
 0/tO6SbGuzjoriWo6G5S++mxQvm3/J9ySDCmlPkNi8WifWWg2F/sFu4gipEW1YJswXK8
 CwASD9xOhIDiW8jFQZIyJN0C2h5meq78XlgP6TNoUovEM8DZScKIgZo6VAPNI2MeEu3/
 1qXR6XRziAU13Y5pdXNJ4Wnb4oCiP6WZDMUnTwx+3LDmtvVz5ods7MZXBVVeQxw2fkgA
 ghChrzdB+aEGHilMNieKls+/qIGaj0C6TOmeBaMgBZde84oD32QLn5thqdhLovLW29Tf
 32JQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RrD1qCAQ+iQPlN9pWVYNisDzDEaRptPmbW3RccuoRfvTDwkJqFCHBRCgibk0uxpdUEWcvWuzTF8zw==@nongnu.org
X-Gm-Message-State: AOJu0Ywzad9EQMZYJUSZPv+3XcO7tDP3+N6cJqlNr8ON4IPTD/8s+vHF
 nz5jfbN/t5l72/9hLypn8BwzAxfJY1OTdnGQTzO6di71L355ECScyA5RWQvnDjOMgPCH0JPMKOt
 LgZ1xKbJSOho1RQE0hyN91vMbBOKKooZC0lT/yj+IiqNleRdQefv/wNY=
X-Gm-Gg: AfdE7cnRaLscm+JQszMvv6gyL9KvLLXbMTB/InmwGdJ31DzMu9dFlaSvuWfTsmWhhYO
 SQLiMgALGQcKzPULCJEQGZMcLJzMtU9AIoS9pcSqTB/IDNGlZCy4dFCG/GrcV6HRIHfIUPQ99W6
 0rF9Px3Sig137kc0v1JPwkizmdJosfIwOVjjiNIcubXTHftsM2pQjJobX3tcEgoYp/BqFFQ4wZZ
 UAQ9krpqh46wm0yy03mS9oOA6HQD5/h+6frX4h//HNg68SAMAKcK6JxZ6vltUgeNwl9e29sgdyP
 3K2TBz8Z9bCZmScNtvVQtC4VST5nNRNthckjXCoThLqCtU+3QnZROLQMasbefpehFBGIGBeur7M
 Z1JCVsP1YkeJ4s7qiJD7o7z1V4vo7InWYvLTa8UckVnjV7bqGoJHWZMX7gSpFVQ==
X-Received: by 2002:a05:620a:8804:b0:918:7e9e:de74 with SMTP id
 af79cd13be357-92e8b4ba8ddmr1035943885a.17.1783331674785; 
 Mon, 06 Jul 2026 02:54:34 -0700 (PDT)
X-Received: by 2002:a05:620a:8804:b0:918:7e9e:de74 with SMTP id
 af79cd13be357-92e8b4ba8ddmr1035941485a.17.1783331674333; 
 Mon, 06 Jul 2026 02:54:34 -0700 (PDT)
Received: from [192.168.69.219] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-69a19d79906sm3904779a12.14.2026.07.06.02.54.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Jul 2026 02:54:33 -0700 (PDT)
Message-ID: <2412f8a1-84d7-4d23-bede-4cac49f6a412@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 11:54:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/4] hw/arm/aspeed_ast27x0: Move SCU link into AST27x0
 coprocessors
Content-Language: en-US
To: Jamin Lin <jamin_lin@aspeedtech.com>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?=
 <clg@kaod.org>, Peter Maydell <peter.maydell@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
 Kane Chen <kane_chen@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Joel Stanley <joel@jms.id.au>,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
Cc: Troy Lee <troy_lee@aspeedtech.com>
References: <20260706084540.1988785-1-jamin_lin@aspeedtech.com>
 <20260706084540.1988785-4-jamin_lin@aspeedtech.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260706084540.1988785-4-jamin_lin@aspeedtech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 5dKDksRU5k4Tr28u8kktX3Imj3oPQisF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDEwMCBTYWx0ZWRfX+5yl1MXk51Q6
 IReQOXIIEN9mjtHYm6+FdZRjGbquOtJICqlhYr5TsIYVytj+Nyck+dGG0T8XrTtAdBwJF8mzQLo
 qoRnC8HFclZ7DH8/QZh1/bVcIT8Ub1nUIDHauP3gV2F7tbtKXus9e79jzxR+4isS+Dt3pdm8gA9
 oRDWiXiSTMA4m6k9iX7sUJwxIXaEj98Sfpvbrh5VpAF8z4ZcltjxZjEZDuQKFCoMPcqd16elKxt
 rSBdkNGC/KB1v8snyYwhqGecbv0yaxKFbOcWvjm09J5ZA1ZWAN7lmx8maeRb/oi50AHkN6kAPJP
 mApv0kSZxvK2RqhdhP0NldI01H6utMqqDUl4qoYet480vmK0INCY40NY6PlBEjRa/wya8nKMyOL
 pb7W3sRQ6EatUufT7BEC1iWK7X7BVlPg3/NK065Du0O7KhrR1xTwIv3qnzVFL8A2C9pqZ8c1FuQ
 rABRCgOoyGIZcjNbR0g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDEwMCBTYWx0ZWRfX2BMXBYDmLwpw
 PpcGrvHX2Fhr9b3Sn/dE4XlXSvn+xubwNOcVMpWUzojPZbrPVghVxRSkOAjbSSJxEjs8ULNl4iB
 vgCNjbKSjT6jMEPdN7I1agtqaQ/3M7A=
X-Authority-Analysis: v=2.4 cv=XIwAjwhE c=1 sm=1 tr=0 ts=6a4b7b5b cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=V2NxCb60AAAA:8 a=EUspDBNiAAAA:8 a=lYaixF1Ub9yBDHAr5aoA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=3L6qF29SlnrayQqPM2jZ:22
X-Proofpoint-GUID: 5dKDksRU5k4Tr28u8kktX3Imj3oPQisF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 bulkscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060100
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

On 6/7/26 10:45, Jamin Lin wrote:
> The SCU link is only needed by the AST27x0 SSP/TSP coprocessors for their
> AST2700-specific SCU alias window.
> 
> Move the link property from the common AspeedCoprocessorState into
> Aspeed27x0CoprocessorState, so the generic coprocessor model no longer
> contains an AST2700-specific dependency.
> 
> Also validate that the SCU link has been provided during device realize
> before accessing it.
> 
> No functional change.
> 
> Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
> ---
>   include/hw/arm/aspeed_coprocessor.h |  5 +++--
>   hw/arm/aspeed_ast27x0-ssp.c         | 19 +++++++++++++++----
>   hw/arm/aspeed_ast27x0-tsp.c         | 19 +++++++++++++++----
>   hw/arm/aspeed_coprocessor_common.c  |  2 --
>   4 files changed, 33 insertions(+), 12 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

