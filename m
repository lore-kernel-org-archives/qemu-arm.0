Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8290606A31C
	for <qemu-arm@archiver.kernel.org>; Wed, 28 Oct 2026 20:48:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mbN8zYhz;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=djAG08Op
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xMAZW-00030P-Nu; Wed, 28 Oct 2026 16:48:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1xMAZH-0002iH-Qi
 for qemu-arm@nongnu.org; Wed, 28 Oct 2026 16:48:21 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1xMAZF-0005O0-7x
 for qemu-arm@nongnu.org; Wed, 28 Oct 2026 16:48:18 -0400
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 69SIPEJv2994956
 for <qemu-arm@nongnu.org>; Wed, 28 Oct 2026 20:48:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 LAkwRzYca/WKna8XVjdkSzZgLeMIOiNmQHSxXeVbc/s=; b=mbN8zYhzqecEXOUD
 +oH2G07T4WXahgohdwObpeOCVmf5IjYXlq4AJBurHpqI25j8Df5/Tfa93gO/dKlo
 lL4izVPO/W7Qrdxs61x2xUPWJkJh/PANoKsCKD7Ei7pMohgLMHrm0zRO95EVAoKP
 gH/GKCUU5+7t0mTlTXzAEGIJQCRPn4q2pK1iRcqIoS623UO8e2hMjrpRwFteT9UH
 +xqrpG4v64iPZFigCCaH0DH2Jr7dK1x5O94oX6i9nHgEC81vLdFPYLU0jAM5cWBg
 QILAARC/31+QVv5Jl6SDMCY8F8fe82JB0lvtHaVm113SFGwwGRl+19ebIsKmT2aN
 qWMMvA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com
 [74.125.82.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkneurrvf-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Wed, 28 Oct 2026 20:48:15 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id
 5a478bee46e88-30bcb065bfdso2231363eec.0
 for <qemu-arm@nongnu.org>; Wed, 28 Oct 2026 13:48:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1793220495; x=1793825295; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=LAkwRzYca/WKna8XVjdkSzZgLeMIOiNmQHSxXeVbc/s=;
 b=djAG08OpE3Ro0na7Q80OPDiciHv9uwiOHgzVAGeYiWzXAc1ew81bdKbzHX7IFhk8E+
 MCR4AxhAKGpQb4pYRZwgM/t0SYQIm4RNX1GsB/XnI83Tjx9beNXhxejeGNn4g6GkYy+N
 N0+Ag5TUbf7m01jhGW+WmjizykkO9c8vUm5/d16xEseQqm4eKcpl58eoc85J0P8jF4jr
 PUzZ1RP5djosAXzDwb6YnyDlAm9aHBs1oGca2k73n+9vUg3BJXDrXOulraKFIDZ+CWqk
 vPWirp4jAOWfHyyQqwMxi8LBQqoafDjQqIyn6yB9sTFX4HGy5roabd0OPANfSctxDVb+
 o7LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793220495; x=1793825295;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=LAkwRzYca/WKna8XVjdkSzZgLeMIOiNmQHSxXeVbc/s=;
 b=pafS2kyh2KvJfjCsNsxuJoHTdaIOxL4RWxDXLrkIBqvFSO+CJN+Uh7OZjy0BuAaIJ/
 QXz+iLfmBgYlIAgShLhevF3/WsvaAjMuGtQCoa6NuMhNMcx2ZDL/gdxu5JdGysq4uAjJ
 JDLVJTcyMkMZ/XO4DnXcnp+C/XPDHNvC/sc9T+8x8AKHoXW2rf9wRQft9UPs+iLH3qPz
 9BomWhdOBGrmid/eOaX6brhJXHgbjLFcajr7mk79c5jsfi3AfjJNDF9inQxL9AYdhFNn
 4YwQ5Pc+x6kV7VnYNK8IQuzQ49oZ1tA/8tWOwBI7WdM/vggQvUrPDrKzZMUU42pzZD14
 mpPQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBxiSgTct1RoV1bx+lB7E1qHLMpwvoWIjAkqUhPwiIMYY7M1IzJ01ho5Ybi1VxYRXPJ7I5UQSPebKQ==@nongnu.org
X-Gm-Message-State: AFq9FYJ2pyndvdoCaV5VlClRaO1AlJO4IJxQwgjW4a5+NBQ3R/tjh9dQ
 kd1JU6jZ/lvDGcvfhfdNCu2CB1tvfxMJqmwo1RRVKKvJcNDQb+akFWDpJwqgp4RUerJDwn6R+V7
 h6JIcExmiXpOnWUekU0vwoWgZCNxF+Z4qq8NAYgJEksjg9b2GNcNdJrI=
X-Gm-Gg: AYBFou1NruD/JrJOYLwbJDeR+NPmpbG4+05s4OKKME0iysDC7szkzHT51jQRqLqBx+5
 NLvxwSqZv+pz1vEdsxmqrZJSWkVfJ2a8+AVBoU4VHLLolk5Lezo3lBC8XQCf7frYvSNQn2pLqjn
 SDmnVnHIiYcNlFr5YT2tvgRHa0k1+d71mvqqSwOgvU/AWMd4dgTxFY0VOHgmBZ1MrOK4gBz+NMg
 225WK0PvdRmE8z0fw948sZBj8QP6Bo+xhF1w4cHf7feyxXFCyMyMijtqJINz29B3/cKK8337nWe
 a2OvAMYT9ZA6BgOflMNsxhEWr5D4XojeSVkdgXA2wMXSHbmoHGPjZEOB1U1P0SVWNgJQF3fWAID
 iHNaJ9mzXXn2S6D2yR5MWe0AMMoaYEth5W6S/wu2tB0HGjLd7//WBOLN8p0NX8cUjExi6O8E6Yx
 s21j7X71oRNBx9oJzKKOCjCOWHIFReKyFBHgjiVRwThoc=
X-Received: by 2002:a05:7301:fc14:b0:36a:180f:3154 with SMTP id
 5a478bee46e88-36a2015a1a1mr4249110eec.18.1793220495148; 
 Wed, 28 Oct 2026 13:48:15 -0700 (PDT)
X-Received: by 2002:a05:7301:fc14:b0:36a:180f:3154 with SMTP id
 5a478bee46e88-36a2015a1a1mr4249087eec.18.1793220494648; 
 Wed, 28 Oct 2026 13:48:14 -0700 (PDT)
Received: from [192.168.1.199] (192-80-163-190.dyn.novuscom.net.
 [192.80.163.190]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-36a2390c6dbsm8214851eec.13.2026.10.28.13.48.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Oct 2026 13:48:14 -0700 (PDT)
Message-ID: <7f759b24-a115-46f5-919d-0fbc773fc6f1@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 12:48:13 -0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/12] hw/xtensa/virt: select virt machine types with
 is_available
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
 <20261028201557.2688-5-luoyonggang@gmail.com>
From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261028201557.2688-5-luoyonggang@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA4MiBTYWx0ZWRfXxnhzyXusGO57
 CfC/0o5to4rgeqAc7WHm3YI09vIFghZ+J+Bpmk0joKU5iTDfgPqFc4Ehw7V5SrKAJJKhlj3cuH3
 RTafgHtgYAbBb10zhoMpyQ19KTDq/mNiIsrmhIKL+aEZ/kObiC5s6gg+AMmNmpzGPHGLqE46iF+
 5fWzVuSxdLv4HqEaDDW9wtUtK+uOxBlF0MsSJvHcnITfCv/QXyTH6YZ4u8/fNsSjkH0hBo0YR44
 sZLip643YESI2WbuO7d/WLVzgAQqYZWY8OOfRHaRF/5dQFWrzlGplHO7C5lI9qcGCCIVAf3YpiH
 xItOjgGzq+IcuVLCeOwdkT2I7ehKGltLANVnNO3YCeDcGbZwR4QNMMonY2WqsbDEOBu6FJpbQfs
 S26cejtQzTpb7ceeY8w+vkhoDrqql72mLHCbjJ3Zd9KpgFjx7NbVa5C5wMWh7iWWAC0Zf/e3MNj
 FRmMqJNdl3H/5TWpuRg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA4MiBTYWx0ZWRfX7D/CExAQBvtc
 eY2E06GDx53M9v9iMLXoZZp3OK4P9lAh6IEwW7oUywQThLHs8ulabqGYpWFBlgtJCu90kpi9FV9
 HZzQ5Kzx1mG7Jx/KFuymfVCkxvzBB8Y=
X-Authority-Analysis: v=2.4 cv=LoAHWXdc c=1 sm=1 tr=0 ts=6ae25f8f cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=9852oil1ID9t5xBSyQ/BEA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=O3Vq37iqdNFKepAcUuQA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: Bs3YdQLNlqNW27u5PohF56uwRpVUKvaw
X-Proofpoint-ORIG-GUID: Bs3YdQLNlqNW27u5PohF56uwRpVUKvaw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 phishscore=0 suspectscore=0
 bulkscore=0 priorityscore=1501 spamscore=0 impostorscore=0 malwarescore=0
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

On 10/28/2026 12:15 PM, Yonggang Luo wrote:
> The Xtensa virt machine uses the QOM name virt-machine, which other
> targets register as well. Register it only when the selected target
> is Xtensa, via target_xtensa().
> 
> Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
> ---
>  hw/xtensa/virt.c | 21 ++++++++++++++++++++-
>  1 file changed, 20 insertions(+), 1 deletion(-)
> 

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>

