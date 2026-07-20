Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28131C44515
	for <qemu-arm@archiver.kernel.org>; Mon, 20 Jul 2026 08:49:04 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wljg9-0001yj-8i; Mon, 20 Jul 2026 04:48:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wljg6-0001xm-T4
 for qemu-arm@nongnu.org; Mon, 20 Jul 2026 04:48:46 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wljg5-000444-By
 for qemu-arm@nongnu.org; Mon, 20 Jul 2026 04:48:46 -0400
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66K6RYF11420324
 for <qemu-arm@nongnu.org>; Mon, 20 Jul 2026 08:48:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 fy0zaaHn7qOX5ti7HaOZA2WH2sNZyCmraBAoJRBIi8I=; b=H3KQMv0zdtyki6Kq
 bCkJ0F8mBGhrCy4QOMJVCI+ClFFQNUlOqBnI0QIeFth0dNhEzjb/1DAUqZidr5Ih
 PfSIt9gRR0HN6tIIp9TpjT96KN38DNG4NnlZ442f5khseb82csmhu75gffL74jMa
 Aizv2uKYfXrapMG5O0QVXQxsixLKPyAQTiejoc6jYNUUbja8j2raBhrC4hmta6jl
 Gq24+gaow+sNZe5bfHfHSI2nfm8ufH1BkqU/hSd3jcG2Z7BEYIHO9UBXqRchngrg
 B9TlYIYm9LsBvBbSIv2oOmePrDXbYxmg88V1MCgySg0UaqUoJEsIaC9X+Revr87+
 j/knyQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fg2s7w737-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Mon, 20 Jul 2026 08:48:43 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-51c26012cd0so175554541cf.0
 for <qemu-arm@nongnu.org>; Mon, 20 Jul 2026 01:48:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1784537322; x=1785142122; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=fy0zaaHn7qOX5ti7HaOZA2WH2sNZyCmraBAoJRBIi8I=;
 b=UOswF78N/DD9zAcM9DqT5ZfShTn1uIaaq5zePElUMnpMt+PW8YuqPpDtmJoODgTswg
 g87jOIgtqI3qGGbxxxfPC8yy7cYXL8cmtxrPZA0gB3LAwSwWcBGEGJrUZJOdEPInOBra
 uJBaaEJEKgqVlopMTM1b+jsLr+xncpppVLL/RG/TgUnf6NFwZB5d8xOJJKlkYHJIPJ+2
 CxnRUgH3Xx9uWRTfZzJuGF0iAtiWQXN1sT8B8TvnM90dRNjrgqxnA+CGz0v+NcYOjKh5
 +9t33Wc9dyduhUdOdXS979xRBwh7p7iR0iCEHlH3xPW76N9FtQNiPHjR9XF1utLrexBv
 L1IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784537322; x=1785142122;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=fy0zaaHn7qOX5ti7HaOZA2WH2sNZyCmraBAoJRBIi8I=;
 b=nqj/PsiNzR9TBtiYN7G2FZ+tI2iwI2tXIyvoFV1YtRv6Del85llTMrhf56r8z8vDNY
 M2D++/x6qPIYykyRH6q7wzk+hzRFvWbdKAxl2FDmInX/dVxktDAG3pVBZ3khtznP5Rjn
 VwiFqVS34xZUsaggeKu8OSEklBHEPMeKYLAJDQf6TJkgO/C3i5+UNNREUQwX3lmJIvvk
 R2BUDTb43ZPbq/W5h4qMQ/rwkKOGgebCDZaoBldMhv/i3His6RPXnPc4ApkYf83nko+a
 KsBnoQOCEftGk982es4rD6wFkpmKU+x+bRm0ixte5WgU2WOYh/Ra0EdStKTILLb3m5K7
 OK3w==
X-Gm-Message-State: AOJu0YwsAY2tCyHZVll/QVf7vlKQO3ukfuFe5RVE0SiseNtlH+bEg3Q5
 ErWNIynWnWZgNnWCgfRQ+7n6Nea07WEXCbt5q1iQ3BNavji5HMu00wYJqUV8QlFmpjm1gkoUtDA
 uOKBlidr0Not/y0Y4Wvwt/Ue8cMGax1xGVjeBE5BNSNouYLr5qP8tLc7vTIU/aq4=
X-Gm-Gg: AfdE7ck24pIyKTMj7aKJpUWO5SwAbMXuIseIu/6bv4b0EzHEK1dEtLZ4qfaf4315YJ+
 7jT0Uwe3DRpOBvAg2fOlk40O/aKALtRWbv6IJZUWx99YvUgkSRow+t8tANA9/J9UVG/bU897vEp
 ZDrJQJk8LyqwT+Ba1qtA8llS4fEShbdSNqQpmfX+6x3z42EyLF3aewUhUbF9+AVBq1jvC4d0GE7
 fefZSon7lFe6c7m7oClfIIBvMWfsiZjkNOXvAWLiw4NeuKvHCa8umjucGWG2sdljmF5bMWLoK/D
 L+lLmY3BtjHek4fPEcppkLI2XpyEhaXkUy8HpkLasV+DJOEYCFqVSJ58qGIFpuOLN17CSdgHYkF
 jh2PkKTST6FIJKYmi0KdBx55XHCC/Ag5KSmXFYwlwE+zKVPPm/hA=
X-Received: by 2002:ac8:59c5:0:b0:51a:8c97:9389 with SMTP id
 d75a77b69052e-5213e186b71mr118121211cf.64.1784537322254; 
 Mon, 20 Jul 2026 01:48:42 -0700 (PDT)
X-Received: by 2002:ac8:59c5:0:b0:51a:8c97:9389 with SMTP id
 d75a77b69052e-5213e186b71mr118121121cf.64.1784537321867; 
 Mon, 20 Jul 2026 01:48:41 -0700 (PDT)
Received: from [192.168.69.219] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49563969482sm9380095e9.3.2026.07.20.01.48.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Jul 2026 01:48:40 -0700 (PDT)
Message-ID: <12d9c6de-3a71-4934-afd0-aa0220505682@oss.qualcomm.com>
Date: Mon, 20 Jul 2026 10:48:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-11.1] target/arm: Fix testing of raw mtx value
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20260717232306.378988-1-richard.henderson@linaro.org>
 <20260717232306.378988-3-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260717232306.378988-3-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDA5NyBTYWx0ZWRfX9cR+hzOPbpJL
 johcEUfgSDL9aAJx6aOUYLRBR5yCTserMabS6DA/tMlunh3A+C0YxpwVNULQ9uSpM8DLJUIRC8z
 yuVEidb1jL4CEiOAzc6CZSUQ0Ws93JzopmyRA1e+z89xSgouq0V0iWPS2hIsptMcetyOVgcMlfC
 88fJBgnfO9wLJ2WoEPy+aPUk49zzWlN0hkCnGpC4wUC/uAwd7xblDlltYsvWvxe5VP5rPvVJ3A2
 D6iyZdRpj+ZtaIaWsV4tsB2VXB0yJ2L86pSFdA6m+ls6e+o+UJdVBJAsDSWGuaLAhv2WJ8kUFc4
 txXNZc2sIvn4VWQEZiu0ombbDa2pBTuiISVbqoeGfr9aV7NI8xBBKtnk9YkFrtoiFwp6X7/7Adg
 7i+tLUnjSo2YVrbxcQn5ILvM1YKl3JgFBi4G0qBla6EsG0KN/q7zi63rK0m9veEsfvphXNjRoBp
 CpHqmiOZ26ck69zVXvQ==
X-Authority-Analysis: v=2.4 cv=eKsjSnp1 c=1 sm=1 tr=0 ts=6a5de0eb cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=e9jz-ppJI2IhR-jSekgA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: cyucje6Jw3VjAL7BMWFL43WSHxgVlKFN
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDA5NyBTYWx0ZWRfX86tuSlWgOZOl
 72TPKlmArQx40YMBIvGZinS7HnfXuqajwG8vfeAGa4crgzB7sFOazPhth7K/IMFTvuOS7mbFFJJ
 wnCwHkVS3+dl5wbBWitWcK56cWIwaeY=
X-Proofpoint-GUID: cyucje6Jw3VjAL7BMWFL43WSHxgVlKFN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_01,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 impostorscore=0 malwarescore=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607200097
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

On 18/7/26 01:22, Richard Henderson wrote:
> MTX is always a pair of bits, one for each half of the address space.
> Testing it like a boolean is incorrect.
> 
> Introduce raw_mte_check, a mirror of the similar mte_check function
> that applies when MTX is passed in MTEDESC.
> 
> Fixes: 8912ceced815 ("target/arm: load on canonical tag loads ext bits")
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/tcg/mte_helper.c | 25 +++++++++++++++++--------
>   1 file changed, 17 insertions(+), 8 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

