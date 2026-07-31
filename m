Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B685C55167
	for <qemu-arm@archiver.kernel.org>; Fri, 31 Jul 2026 06:09:17 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wpgQa-00043J-WF; Fri, 31 Jul 2026 02:09:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wpgQZ-00042x-Pf
 for qemu-arm@nongnu.org; Fri, 31 Jul 2026 02:09:03 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wpgQY-0004KV-6I
 for qemu-arm@nongnu.org; Fri, 31 Jul 2026 02:09:03 -0400
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66V65wng2636520
 for <qemu-arm@nongnu.org>; Fri, 31 Jul 2026 06:09:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 r0dUGjRtAxmpudpXkEqKeU9YpkxTV6UPxGp7B/KYixs=; b=gCTFs3oHNCuDu6E/
 yB0dzhQkeSE+RQEdeESniiE88oWu73P0ZQw1XI7ZXoJGWy0bxCHfJqVxdnwfIi5X
 RkNEvZKZDbSeYhqKEDIFGu8j1f89DXMzwWT5LHZQXtJY8UngwzwsXJdT4lPMAhZj
 rduaQGs5hMoy4qkI3fpMSULFYvCSSPjC3iGLfJlRDJatpWQujnB/O4U5pKEYNGD0
 1Gqfb/pCt3VWLzW5ABwLAYrtcqJYdeEeERX1HAopGHkoS7Pn2Q9wWCI5LhkDkJTo
 +6M8z+ydIB3RiGxErh+voA2pL7REiwwRscRHHJta2jGiU4YxEUivAoOSzK/3Jnaf
 SWjn+A==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4frp4y00b0-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Fri, 31 Jul 2026 06:09:00 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-51c0408254aso21068901cf.0
 for <qemu-arm@nongnu.org>; Thu, 30 Jul 2026 23:09:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1785478140; x=1786082940; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=r0dUGjRtAxmpudpXkEqKeU9YpkxTV6UPxGp7B/KYixs=;
 b=ivhZ0OVrK0Ox9IvjGTyprW3vAN4G2lto/yUPS64Wzy7DKZthtAGo3ZJMb4A2WNEra1
 hcvRyvKaKzapLDnqVavLI2yzYsgOau5O/1Hbi+wGtWS58ouT1L9uHp+ElEkk0a5MTswr
 0b3TJnHeeYNSHY9iApJ1wDHUP4tBxjG/cUMSncYuy7pVYtB15eb/CUG0s0XWoWbH76EO
 Mzcya9nFpJq/ru9v06IAi1qvoTDfd1hct1PmCaTtwcezBq4qW1zMAavTaFYK5PfOrxIC
 WcFLQHH0orVRcDfzG7yudPelLKbmS6OL7ObwzrVrclNQBRawn/NPx0PnGuCcfvNkazzG
 bbNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785478140; x=1786082940;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=r0dUGjRtAxmpudpXkEqKeU9YpkxTV6UPxGp7B/KYixs=;
 b=cdu2uDerKzHsSPkuW0MTfq3rAaBFnuCy2t87NhexYIFHZ/dU5BX6JVpWzCHaj1CGGN
 Op28Fvygc223qCe1kcLR5Z73XEjVqshl3qHakRYZ+SgPiiRN5SmlIRfYJfdRNL3kqmCj
 +VZHVaIMmFTEEb3eZpMoxDa9/ocFmVxAjJt65OJTE6/VTw9vlvAi3mTFQjmz6fkjqZcP
 HDfoeBD4R+BDF5qV72/ZCyW95TbVOde/C+RxyoIWex8lCQINAMZk0mToRrTFu+a/nilh
 9Tn8GY0cmeuUJJsdkNTKWyXa9kvFXNQX/dojvIasMRxUwCTLHw4Ix8xUJ2zYrWT6D+ic
 hyMg==
X-Forwarded-Encrypted: i=1;
 AHgh+RonFJuh+J47K2Q7SOWAOF2ZLDHxp/aic1ZGL5d9KZi2hIRq/ScP6uE4b2lfR2fkYI3PC3PP01V9tw==@nongnu.org
X-Gm-Message-State: AOJu0YyV/+miqA7k/iILvGdLiOuz7Kkh1OY1VWnR+7OBEqbu2T7pXTfR
 GI0QgU3NwJpomsaQ0xJ7GomF1Q5qrpqvRymXjL0adkWG6ngaCQ5j1FDMw+/VqhTUOgLNAiURj2n
 1gxtZZrXJKNr3/mOxQ4/2wcyWtX6uQM45LGmVS4dUsW8cZZvrJuzGN8E=
X-Gm-Gg: AR+sD13qDtE7yDNNsE/978vcpk6UnPA4z3Td86UmUvOz17k414h2p1Hm4XfYDa3w0IP
 cGh4DWL+O8jcPPFmMt0A9w4RPggzHmzBFo+2NEE1+e0wePXOZCYMaXRWnHHdgvaEDGMMZE0fcQK
 LCk47h8IPfPk7agfAxERDu1DaRru/dr1pBjj01bGSwhEY+IwUo5ftq19eu2U4S38UKmc/BzY+6q
 11VCz8eACh7jAFzM5rzKOlP+wMB+rFoJhJ0JuPn8DZXSN/8qb/0gOEtz+CDitnd6zGCMfVggp53
 AkPmNXJOCoGpyN51CrD9+9HELD5jCgznR4tO4QyYqwiOXTGiP6tA1UC7xgKdPJMGpKmNkM8bCjH
 nZulfY+vnIGWfRlqKVMSsd+IFzXcOHUMZiBWgDf8bukVkQ5qGFGw=
X-Received: by 2002:ac8:5892:0:b0:51b:fb5f:b263 with SMTP id
 d75a77b69052e-52b4c433f3dmr4077361cf.4.1785478139720; 
 Thu, 30 Jul 2026 23:08:59 -0700 (PDT)
X-Received: by 2002:ac8:5892:0:b0:51b:fb5f:b263 with SMTP id
 d75a77b69052e-52b4c433f3dmr4077071cf.4.1785478139264; 
 Thu, 30 Jul 2026 23:08:59 -0700 (PDT)
Received: from [192.168.69.212] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47fd456220esm809889f8f.18.2026.07.30.23.08.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Jul 2026 23:08:58 -0700 (PDT)
Message-ID: <a7330e7e-be2e-4c65-9e6d-a665bfa71373@oss.qualcomm.com>
Date: Fri, 31 Jul 2026 08:08:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/11] target/arm: Use generic tcg_gen_revbit*
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: anjo@rev.ng, qemu-arm@nongnu.org, git@xen0n.name, 17746591750@163.com,
 maobibo@loongson.cn, lixianglai@loongson.cn, philmd@mailo.com
References: <20260731000503.170446-1-richard.henderson@linaro.org>
 <20260731000503.170446-4-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260731000503.170446-4-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=K44S2SWI c=1 sm=1 tr=0 ts=6a6c3bfc cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=1tSEMpTH9XP_W59IOagA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: AMBp0bUEcosiVPN_aBm4TN5sMsWD3ieW
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDAzOSBTYWx0ZWRfXwLM2Ad3HJX6q
 ecDa7ua0PR9t2RebLHtG9IFH20HswEKTnOFAfHI+PNBjg2RkJN/70bZOBV094D+N+nxlUpBSifL
 leOdd9/gxKq3qW54CmUUEMv99DakX8Y=
X-Proofpoint-GUID: AMBp0bUEcosiVPN_aBm4TN5sMsWD3ieW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDAzOSBTYWx0ZWRfX3ccPbwQRK/UY
 uUSF5++2e3jdLHbmXUVFevqmIzHhZhXxbg/oAxNBw/noCof/NbHEX/3ApEtFYj40bPJixcrUtWz
 FowKWIzlxImBQ4q6QU6lMA/Te0IA6vdb9jS1h56F203WEireBoaM6S+6oNRo9XYGiYMTXwf0ayG
 ES1hKBD4sJeWCu/o+4iTKcIQdFPL9kac+4ghvBtEW2/xuuikaTpS3y0/00iBTvlrGLSalUGX9o7
 Ba9+HIBJRpukW3FITZwDJJLDzpU9bCA9c/d5GmYMqXIrIyE9NLx3kflg6XcAri509bnQnST/J0I
 ZcIz8/lQYpQw7X2EDzpvR6M7nsJZ7DV2PRwClvGJbl+8cePB++MjwZ4CwbMieUCojR9lSb5AsPj
 kasl8mBSZl0QafSEGg4EZ/dVamcSKdaUyXSejHVa2VATs7WsqhtBIyh88N3QyE8a9GaitkerCYs
 3VdWQInOlAlIHrcFn3Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_02,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 adultscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607310039
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

On 31/7/26 02:04, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/tcg/helper-a64-defs.h | 1 -
>   target/arm/tcg/helper-defs.h     | 1 -
>   target/arm/tcg/helper-a64.c      | 5 -----
>   target/arm/tcg/op_helper.c       | 5 -----
>   target/arm/tcg/translate-a64.c   | 4 ++--
>   target/arm/tcg/translate.c       | 2 +-
>   6 files changed, 3 insertions(+), 15 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

