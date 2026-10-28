Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC0F6606A31A
	for <qemu-arm@archiver.kernel.org>; Wed, 28 Oct 2026 20:48:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UVbrQyL4;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jpoQglwS
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xMAZD-0002gm-QJ; Wed, 28 Oct 2026 16:48:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1xMAZA-0002YQ-GF
 for qemu-arm@nongnu.org; Wed, 28 Oct 2026 16:48:12 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1xMAZ8-0005N7-3K
 for qemu-arm@nongnu.org; Wed, 28 Oct 2026 16:48:12 -0400
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 69SIPCx42969602
 for <qemu-arm@nongnu.org>; Wed, 28 Oct 2026 20:48:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 mvNUJAfBZ8wf2qO4HBcI7dv9DOay6RaEENSRKrzd0nI=; b=UVbrQyL4rc5kZc8x
 uO/13hJAOgf9Nj8LCL++XczOqHxYinr12OIqDEwbqZwdIL2T7au7bxhin1sQwQMT
 xH3jZZ0vGnt+BqXQLjRi+RL8ME+kdMjeTSzOvP91anwEVTiLJjT8Avt52p1dMTwc
 KXtIYMDIGfmMCf/Slo0lkSEIvB8QD4Shz6e8bsZq+hzEN3q9EenxKTW2WfHUB3lY
 AxSGFrUl2vdpDPsBsaaChPCnAzXGgZVN7uL+iow/IAoBGZ92P2XSQQBNZV3GUqlK
 63siydXgPImIVm5uMBTFAW4BY92z1WrerFTBG6um9I14KLzp6jwRU6NLM7cSuKO3
 4hKIiQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com
 [74.125.82.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkkehsejh-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Wed, 28 Oct 2026 20:48:05 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id
 5a478bee46e88-36a223755e4so4468078eec.0
 for <qemu-arm@nongnu.org>; Wed, 28 Oct 2026 13:48:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1793220485; x=1793825285; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=mvNUJAfBZ8wf2qO4HBcI7dv9DOay6RaEENSRKrzd0nI=;
 b=jpoQglwS4FHCJVH7ZRBIsX7FGA5RxT49QYWwBBe/V+Db83g/ilIWOCLgenqnt4Yg0Z
 U1O2b/Q5BuvJCbIYmhOlPZL+Veq5Z05Twa5HhP+17tiUAruBfjZ+S+BqvK6jWBA1FWzc
 x5tqN5KoVk5zPSECzGft52cTlZXSJR9NBfMYTzuC1qPprgib5XrcowtGgmgDjMrtJZFX
 JllFrU+vthGE6b5UNSWDlnVFndVhW6qrYjZka5Sf0s+rJPUe8KtNpQAT8gmTnkYhUb3F
 OlBPeTkq8GXkTIbp9xh4n4u1BzTW/p9s+W3+YV7CQSx6Tys+MXN6jHG4CiH6rEZpPogz
 LoPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793220485; x=1793825285;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=mvNUJAfBZ8wf2qO4HBcI7dv9DOay6RaEENSRKrzd0nI=;
 b=qUFGFInkoyhIGwEvRczJI+vix67GKEsE6qX9CPyQkVsmll/o6KDE536DeM2+0Mw781
 h8CUx9k3BAXK2ehoG9tR1UDbhC4PXM0u4oGcm9jEMbI6eXsM+FKN3mFXvQYRrCsvpipi
 Z1qyGIQ+L2jNygz2x1NHUIzB3uX/VNhdUVAhhBHny4btLDCBkWOeVwYGRhUXVHPhgEmJ
 vjUCMwyBgI1pb7V+Qr2H2xnrZJiZgmTk/rJ8lM2H/04ObNL0OQsJCDL7XnE7v1CxWsQO
 9SVGgRC5lnNYyFM826NfjxSOosmULXJ7JDR7RaUHeaytwWMJq5ajHCV3w8mtCj52eAZW
 EFtg==
X-Forwarded-Encrypted: i=1;
 AKwUvBwHV+YTHAnBAkTbL46VY1k9jS7ZUhDTklcOVvP2S2+Y0rM/cofyTNaGMg1ERMfU6Z9zte5Pxh+uqw==@nongnu.org
X-Gm-Message-State: AFq9FYJylt4udPIIPe4rMIYa4iuixpuwTtyA9md7t8cQxf4nb3R2FIaD
 E75EwQlqZnewxKxPPIv/GJNtBfWGnSphcQGI9bAaESLgp40/SERuNqLazdwRtqoc6PC7J2RitnF
 OeTkjLsymyjaIpdTxUW19aD+tPl+ZVaILW5MY+ciGrJGTD8q5GCcR5V0=
X-Gm-Gg: AYBFou0tzNEYTWwqZ010xleScLdees528VAc5XiWuzLIZTv3QGDg3+5UvtvQA8UIV59
 uvmjCxdCTiIQ3czsln/0Ojoamei99TdRBaJ7pgckpVXR3cpWsJ0h+xlJ0lP0T1v79tuu0C71Aia
 3OaRLB7gz8K+8lLYe9sNk046ic4zBF6DUqhsXxqOZraRQ1x12TelXe93Dm8TY5kRLyFf0jXjnWO
 BBd6BDks1eFERDCvR4TbBwgVkWiYJ7GV55xN6kuO6Ysm5z+9KNx6kP/E5m3Dx5a1lrkywLYPvoo
 8nQG0Ld/FH/59Kbv6nMWA5apt22miZ+xbfgS58wo/q3azKCP4sIphrSVd1LZy6Rqn2A6gqj6Obl
 u66iqfIl1Zg9bmWcZiO6UsCeqLQA+yIzXrOkqmEqspHY/C2HTFIg3Sp3rL3yD9s2KMgc7N+LtXW
 maGI6IXqwzJNRr/yOcNH1SqRpCuC3HolZzcg5B9ghzFF0=
X-Received: by 2002:a05:693c:8811:10b0:36a:8a6:6916 with SMTP id
 5a478bee46e88-36a203cd278mr4864604eec.18.1793220485094; 
 Wed, 28 Oct 2026 13:48:05 -0700 (PDT)
X-Received: by 2002:a05:693c:8811:10b0:36a:8a6:6916 with SMTP id
 5a478bee46e88-36a203cd278mr4864554eec.18.1793220484439; 
 Wed, 28 Oct 2026 13:48:04 -0700 (PDT)
Received: from [192.168.1.199] (192-80-163-190.dyn.novuscom.net.
 [192.80.163.190]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-36a2390c6dbsm8213753eec.13.2026.10.28.13.48.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Oct 2026 13:48:04 -0700 (PDT)
Message-ID: <f793875b-5409-4085-bf0d-9f0dfbf0b6a5@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 12:48:03 -0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/12] target-info: add target_xtensa()
To: Yonggang Luo <luoyonggang@gmail.com>, qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 David Hildenbrand <david@kernel.org>, qemu-s390x@nongnu.org,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Eric Farman
 <farman@linux.ibm.com>, Song Gao <17746591750@163.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Cornelia Huck <cohuck@redhat.com>,
 Fam Zheng <fam@euphon.net>, =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?=
 <philmd@oss.qualcomm.com>, Matthew Rosato <mjrosato@linux.ibm.com>,
 Philippe Mathieu-Daude <philmd@mailo.com>, qemu-arm@nongnu.org,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20261028201557.2688-1-luoyonggang@gmail.com>
 <20261028201557.2688-4-luoyonggang@gmail.com>
From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261028201557.2688-4-luoyonggang@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: LsyTL4Cy0r2E2y9RNKxUbM24PAt7ZHN-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA4MiBTYWx0ZWRfX1mKiUlirV/af
 lY7Jg9ScVK1fae3BexzU6NMoVLhUoUH5drEeaCliugdxp6ey7ukw5cSoSi3PzzTc2nD7qb+gl1K
 XmV9EeJjpfGps8EDBuHy5L0Q6Gtuw08TSTz8MGaf/jX77p55o59Veg54Clx98i2yA7uhBoVH7ne
 kqjBgvXx3tCd8vAX1NSQHWTXZP5a9ffoycRdAucIlxROWUt9Fc6++zcWnD1ncgsqWLG1WbmYMi9
 GARhu5r35hpBpoOu5klYEN5ORLaauUApdjQZMkoTgdWf6IFbodG4ea7CKKezCo9MLA3TF6a59h/
 vXO4qoARmAlX4QKWhmZC/bpOHKlpypz0voXvpoMKCwhUcQCZh9IZSarSHQ7JsqfhyHFWIFLOndI
 7F1xwAtbHgVTn2qRoRmTff8GDWU9RuEvoMCmlaISfa/9R+6tGVCQ9NVNO8Xr0MwXPWnN7AcUE1X
 OiXXAH9O1WMQ3J3/pYw==
X-Proofpoint-GUID: LsyTL4Cy0r2E2y9RNKxUbM24PAt7ZHN-
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA4MiBTYWx0ZWRfX4OVA67FnBUfa
 N20TztkeqQ8Y6fijSKaYtmAqoseNM1AApOHNLXqtS4bkVVVNXqVK0mrxhrlvq/e/87/YJTHNKog
 o57C96HFXQcryIP4Qz7QYdSkj++j/I0=
X-Authority-Analysis: v=2.4 cv=bYv+w+PB c=1 sm=1 tr=0 ts=6ae25f85 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=9852oil1ID9t5xBSyQ/BEA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=VWzCiBprkgjhyyqcr74A:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 malwarescore=0 bulkscore=0 spamscore=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280082
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=pierrick.bouvier@oss.qualcomm.com;
 helo=mx0a-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, KHOP_DYNAMIC=0.001,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
	SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 10/28/2026 12:15 PM, Yonggang Luo wrote:
> Report whether the selected target architecture is Xtensa.
> 
> Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
> ---
>  include/qemu/target-info.h |  7 +++++++
>  target-info.c              | 11 +++++++++++
>  2 files changed, 18 insertions(+)
> 

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>

