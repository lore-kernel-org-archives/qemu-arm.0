Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83998606A31C
	for <qemu-arm@archiver.kernel.org>; Wed, 28 Oct 2026 20:49:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cd6JS4Jt;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AhfW9UWU
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xMAaM-0003NS-4f; Wed, 28 Oct 2026 16:49:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1xMAZf-000380-5p
 for qemu-arm@nongnu.org; Wed, 28 Oct 2026 16:48:48 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1xMAZb-0005Ps-On
 for qemu-arm@nongnu.org; Wed, 28 Oct 2026 16:48:42 -0400
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 69SInp3L1090705
 for <qemu-arm@nongnu.org>; Wed, 28 Oct 2026 20:48:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 LWRfAe3dXpBte8JkomSS09E6MiBS35BZwxIEqJdRHhc=; b=cd6JS4Jt9Qqvt7Ve
 pf9JYimow/xPJzGC5RImf1MwHesIEDpDa1i5RA3rZyvVHIDo/n8dhY80fe1QuruU
 1yC+vOtCmmK0PqblP1Kigx3JCHDFRmaerEoWtUnsDf5LcgHFqnCoLp8z82Dj6axv
 KKqnGGIegaTVwqBBHGn4UKTQLjF2FqnFKmAhvorNZ+WznXnKCddW7zdQyL+bB1MQ
 Ac3nV4hw/qQbRVZ9gtt4TuxZ0/NYvgmSXqLKJW7H+5CBX5+BZJEwxwMT1I2FaX+3
 l5Wc/E4/uvvC/5WkpSy/uY78Az0ivdX8GVtYmL/ioqsiapdaMzSer+pyavxWpHvn
 hgGOIA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com
 [74.125.82.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hknb28sqq-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Wed, 28 Oct 2026 20:48:38 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id
 5a478bee46e88-33713e5e6daso1637701eec.0
 for <qemu-arm@nongnu.org>; Wed, 28 Oct 2026 13:48:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1793220518; x=1793825318; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=LWRfAe3dXpBte8JkomSS09E6MiBS35BZwxIEqJdRHhc=;
 b=AhfW9UWUfdcfOB4VnxhHQGSBxhKDFxAHIdvgJ6PhzTpApmruFS1qib8eIxCVAw1gXh
 IDML671mIh6mtNUZ5maDLQJq7fpIbddfJFoGkchgosUIuH5AALzJfziStVbY1XLGyqdb
 jL3HNm+QLPbOsNbQj88xyrMg/Iu0g3h4sfFD43pQNzIHmRD91E+4cPc8T8mjMaVpoI5n
 U0y14j9QWIjF2kogmA8tvLT3exrfNszv7uv/bGjrvqmdQk9WLK2Df01khN3zhfqxVVny
 QVWskqM/UUrU3IRcgAEarknSUkfkeOR/+CoTJL92w1+9e/HCoZpGmb0oa0t6ALbf5ITc
 ZQCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793220518; x=1793825318;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=LWRfAe3dXpBte8JkomSS09E6MiBS35BZwxIEqJdRHhc=;
 b=KCVzetmdNVm+eBPJvophqTCpUneeg1z8NdwIP3KRX6jBBRYnpDAxobGkGCc3fQyGIQ
 cr94tByioddNReicDak2NxudVwD5ks+YOfZ22jggJFronylKbKEQtFhyy7hGEcSysvyT
 UFVfJhb7BCesEqDSCu7cHr53U6c+gdg/q7XGu9CmKO20UU94zUV3tdinlQa8Px62VuGt
 YFBwAsKtyBi6eFnXuumDEcJq2LtdMYLMrNwMytn6CIOLZ8v7b0Q+QWN+znkz7NFwjXOV
 0cWqZgK6+kGwkq70d8X2yLtY2b1xooR9YkQlOzv0mfRfzQ2WFWMAZkSGdXzf0eAH/7nC
 Z6PA==
X-Forwarded-Encrypted: i=1;
 AKwUvBwC3vNUTN7yvaqSYQJD3+NsBQgtnsDwEBcpCuHGNjACL3er+yhSD3FGfPSf6O45FiFsP0G8wCIKyg==@nongnu.org
X-Gm-Message-State: AFq9FYJKqfcBXbnW3P1FxiepVqrEjJMIt+30s9m8lxj9CME2yp09RyNx
 LtquxJR+9AtmlV2ULdh3+4yCt1kYu5lWmakbtN5TZE2HqiASmWWGGo5Wm8xHasvDC3QVQ2aQJl3
 4pDKmE+ECylhRX0DQI8k1QXLeyBLpoaKucHtAuhYPgU3Aj4V66Pp7olA=
X-Gm-Gg: AYBFou3N6sv5B9B2wZfxQH/ond/ll/jYKez6NWVs2vag1L9LK7DCKO1dYrV7MDLFbUZ
 TgA0LkdRLQG1AYRnIuRbARGYECfbffoSllH0TGlGLdocJYHK+C7O/MvClrqhKoMHo+YvjtPkTBY
 WRzULi8tOKijT6L9/yvwtBbFURsUPs6DhPRDU9+RDnEmETPxoILUpnnyG4R/4qskqOeDNrbicNb
 CDgspomLCHr8F2FV9LCfZWhquJdMdjh7BCq/CZW64PzMpzNJXjgvxhhfv9c1UAriyUVXeJuOQYy
 l+knEIG+xYqmCAuvCkLFlIr+1p9/bU4GrtxKe62my5BJT5KJgxQaNUgYwTF9qoYuYpBjh68ZIXs
 ZpfcIg+oNzYki7lFVI22CVPh9WmrZlNqYBkT31wVYywYRh+puMiYpzdSdo6dsHDHqCJm2NeBDnJ
 RYe69tZwXC5+sIephe2ns9a62SNsGWDp+XHIwQh6P/ybU=
X-Received: by 2002:a05:7301:7e0a:b0:353:7e33:664c with SMTP id
 5a478bee46e88-36a20401baemr4623960eec.37.1793220517608; 
 Wed, 28 Oct 2026 13:48:37 -0700 (PDT)
X-Received: by 2002:a05:7301:7e0a:b0:353:7e33:664c with SMTP id
 5a478bee46e88-36a20401baemr4623920eec.37.1793220516948; 
 Wed, 28 Oct 2026 13:48:36 -0700 (PDT)
Received: from [192.168.1.199] (192-80-163-190.dyn.novuscom.net.
 [192.80.163.190]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-36a237be80csm20603430eec.2.2026.10.28.13.48.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Oct 2026 13:48:36 -0700 (PDT)
Message-ID: <5d65bcf5-d570-4d71-b25a-6a51b51611b7@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 12:48:35 -0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/12] target/arm: register separate max-v8 CPU types for
 arm and aarch64
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
 <20261028201557.2688-6-luoyonggang@gmail.com>
From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261028201557.2688-6-luoyonggang@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Yu2a1IYX c=1 sm=1 tr=0 ts=6ae25fa6 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=9852oil1ID9t5xBSyQ/BEA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=bMHMXu_Xq4L6OBgkEIQA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: eraCM70fb5HiTJ8s_hOI98RGqrpGFDz6
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA4MiBTYWx0ZWRfX/UfZQ65KFHB8
 jDblqV1el3e+pC0dwtAL2fBiYWmyOpNVIIqjLY2Z67WnkGqQ3hRv7gwBaSjuHPO0d+aogstN8ow
 vWkS8Scu40rglA43JkvZIVuADMX91DE=
X-Proofpoint-GUID: eraCM70fb5HiTJ8s_hOI98RGqrpGFDz6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA4MiBTYWx0ZWRfXws7s0hL8GWKE
 uuXjnrWiUanFPFz1zPm4Iud3mjOWZPHthWXsjBnttj3AqZ7+MeLwCJtaR2rJ6G86fOSNMO9TTFH
 zu313MTkWlovA/PsFXbbR6m8wwkuLdp/vcE0aPr8QoPPbiC/X1AWB7txNm1brP/KnoBb6L3wWSP
 CXa9ezR/z/JsZhtZ1kFkxOzH1tSE1tTO5xgZWOCoLx9FV+qVAoNMgXw/VRDoMcX3Q1NLUpcDqyk
 nYhos4hIjVkqHOgpB093LARKXU1QP+v91puCyAaMwxn+ssvav+b9VO13QqhdUEuvOe9PvWR3zqz
 MBCm957BHAePTJXSiT2wU2uQYkVxPtFUyj2fMSWS+CmtWMtGP3G23EZ5Ahc6LgsHekvYaqsMASY
 09+Lkc6+1e+kisbTFfa3X6bXdlP56LSwYdrYIeWGX4BsX5ZmMRKropiSm7CujY05n/c9vENW0rK
 Y+bszD29hk4wZNe/LGQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 malwarescore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 phishscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610280082
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=pierrick.bouvier@oss.qualcomm.com;
 helo=mx0a-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, KHOP_DYNAMIC=0.001,
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
	SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 10/28/2026 12:15 PM, Yonggang Luo wrote:
> max-v8 was one TypeInfo whose instance initializer was chosen from the
> selected target at registration. Register both initializers, and let
> target_arm() and target_aarch64() select which type is available.
> 
> Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
> ---
>  target/arm/cpu.c            |  1 +
>  target/arm/cpu.h            |  1 +
>  target/arm/tcg/cpu-max-v8.c | 16 ++++++++++++----
>  3 files changed, 14 insertions(+), 4 deletions(-)
> 

Looks good to me, thanks for the update.

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>


