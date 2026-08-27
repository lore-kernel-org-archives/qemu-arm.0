Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82724C61DC4
	for <qemu-arm@archiver.kernel.org>; Thu, 27 Aug 2026 16:37:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wzd6i-0006je-Gk; Thu, 27 Aug 2026 12:37:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wzd6g-0006jD-0v
 for qemu-arm@nongnu.org; Thu, 27 Aug 2026 12:37:38 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wzd6d-00057Y-QA
 for qemu-arm@nongnu.org; Thu, 27 Aug 2026 12:37:37 -0400
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67RGIM94707901
 for <qemu-arm@nongnu.org>; Thu, 27 Aug 2026 16:37:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 +3OAPDqJKcK4sQxpiEEmJ4+PxF5F2yinSrddqu8/lLI=; b=ia6YGBZxJDrdfTM5
 q7llNd0L4o84wajWFPYgV7/VW7/t1LFNLqEHrSSIJ791taYHLSkuodd9FQkrfGU0
 UuGeviWs4Kd+jImAG1uyCYmkX0J8wtnUeZAwHe9lmM7ilIFe8x+qJLPsnP39OLm6
 VcluKVXjVr8WVh+9hpLjHeiNJg3PjHYRgim8CuAPjG+imvt6ZH1XTV0yRj8Qt69D
 H94UwB5mcYfi4d+UU341yEMo5xoWHIRXq2YC8jsrR+ci2YBbwqY3KwCwj1+rAweg
 D4N+d+RU4S9mH/Z+USzHoTeX/fUunggBay+oKUAF5s/8I14IpXqErXKqtYRi72Fa
 C0Ti3w==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4garn0g2ee-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Thu, 27 Aug 2026 16:37:33 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-2d6f710f066so13889115ad.1
 for <qemu-arm@nongnu.org>; Thu, 27 Aug 2026 09:37:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1787848652; x=1788453452; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=+3OAPDqJKcK4sQxpiEEmJ4+PxF5F2yinSrddqu8/lLI=;
 b=awSgAWNZBnZsIfC8y3mKDcsbNMdxIVxSaY83OWlbv+4CP20arF5dClY0fsXRQfbIbc
 NqRT26PAsXjnhq51kKQutrmdX/Vyl3koV44KShrmg3KFGmjFwtamwW1HVL1J5TsGPOmS
 lNthVztKRcStIp4UTUZcC83+sCgS4GL8wqKGOsWPLTzLH4HjdVfufTbd5WwIDogzv3Hd
 pNZMeySF+UATGeynL7oyeJ9Z5UhhCmwTfWZGcAVIkaEsoQB6CwMU4TtJ0ekc3imXJJDI
 HBkAg334Uns+0hUed1xysy1u7evejmlZ7iUFFHgyGjmjD3nnObbN1lsmzmumGyJAs80K
 chCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787848652; x=1788453452;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=+3OAPDqJKcK4sQxpiEEmJ4+PxF5F2yinSrddqu8/lLI=;
 b=K0UBzYQqSICI4Fs6b6fOqFgKN+kPHpTks7f+rXvq3ZR/coHYb5nZpO5NuYkFT0JZ9v
 8CnyuzY0iUxKeBV8/RJ6oTlfNV4GMMO1S41dvfGTRFcI26TKDBDcbbJ4WQLf34EqGz4j
 EdBm02srApNPazxgFTT9Wi2lYMjRZkgqY4J0sS4WOywI2O0cDbIJw1CS5lnaCWwi2XC8
 FeMN5fPBmKhQPzALC7VxwWK9StO/2tW6B9TEBP2RFk+Gjw/IssUdKdxWOA9vMaUJ4bZ0
 LRY8LVlSTB4ivCZe7uM3o8yQLWOwdLCoAaep8Pc8HPQ54ZIxVofHFF1ywjsbRvZRET4A
 rgEA==
X-Gm-Message-State: AFuF++niakPRCYxQzfaDdMeXxh7tCw66G38kKQcx+N3LhevcO+L0AQSN
 67dPev32hEksE3vfcrlcoPtBkMXhvfjATBFwE9v85Z/qo4qTBi9i7Z0ULtiTntGwjrNUClsh9rt
 ZB202Y0twghj2UrkKYIYLetVP/uHrjyNfRajVZXkmU+1BpxxzdBhElY0wNvIgse8=
X-Gm-Gg: AR+sD13CnInKFihvEbI+Zrv8oq8tXyg3MoTebAMEbnZO7ODyVYlHjdqgd4b+XWvCB+u
 YfBQSx0y2D1tESBLoMFfQN/GR5Jmx5/xB3TajvWBUOXTOMWM2HTzlMjIW6qJtcv3ROFG/ozOFe/
 Ly5iMTleQwHDP9+gfB+ngOebCSCUXOGB2cbzMBPxX19i4vA4ckicJ18pgRKqFdcP5KR5uZDty4k
 zA63vvAYTCT24vl5RQlPjMiHC6smPSGr3ut9mCquoXhnz4FP8E7liVUo0mGpU4WyAq/cf3nf9A1
 h2FDuVQmq3Z4WSRAho9VN/ePcyyfAVbrxKsOfyk7EFlfKB+owYruns3HOfDXwHgnhpK9da+Ix3R
 3BDc4smj0wn9xNXX/NUXz77sQwEWzzjdTpG6a6JX32wlQnF1poFN45VuGzoNAwGY7ZltT
X-Received: by 2002:a17:903:2308:b0:2cc:ac15:ff4c with SMTP id
 d9443c01a7336-2d72659fedbmr86022775ad.8.1787848652540; 
 Thu, 27 Aug 2026 09:37:32 -0700 (PDT)
X-Received: by 2002:a17:903:2308:b0:2cc:ac15:ff4c with SMTP id
 d9443c01a7336-2d72659fedbmr86022415ad.8.1787848652119; 
 Thu, 27 Aug 2026 09:37:32 -0700 (PDT)
Received: from [192.168.1.199] (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-3283d63bb23sm21576480eec.7.2026.08.27.09.37.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Aug 2026 09:37:31 -0700 (PDT)
Message-ID: <786975da-2021-4a0f-be96-78aa315be2cf@oss.qualcomm.com>
Date: Thu, 27 Aug 2026 09:37:30 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/6] target/arm: Build cpu32.c once in system mode
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, philmd@oss.qualcomm.com
References: <20260827041557.775080-1-richard.henderson@linaro.org>
 <20260827041557.775080-3-richard.henderson@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260827041557.775080-3-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI3MDE0MCBTYWx0ZWRfX1UWd+1fjGrai
 tvLr5R2HOD+WRN4EsRelqmr09tmStAQUwAmjILtQEXhYxuukOE1NOxuyOx8MqNxhCWg5GE61Qs3
 37Ni9X815POt5lCU4ReuZymmRmbiiTVr4jZ4/+79pW8ONtOyDO4nIRAabBom0E/7W7pjSmgKG1r
 +JIlaLby5ZnycR4r3AA+j4iVwDhfRT7WGWtGDaamSqxs4g93O7cz4ZSqy6Q6R61cx1T5y5GrBly
 RyUPdZJDbf9kLokFEWmCtjsNooMzzr7Ac/w92KGqaLGQXyMe6+dxZOKOSWmv7R/E+DVPr4aMLPn
 VjHjbRiZ1ZfCgQNLfmp0J7Jar1wJdem49snp1tmIdaihZx+tJ3/z0+5vpngiRKc8m/P+B2MFVrI
 bZplO08Z0P8SQRZeX88j+EZqFT3kdE4hpxGJ7Jz4AclZvD70VjfBm0k3TIufD7LVxVZJjX8x3TV
 Lw4y07Ln2uY//bSb+OQ==
X-Proofpoint-GUID: bjecWPc5yCASkYIEd1lUrix985O8A-K0
X-Authority-Analysis: v=2.4 cv=C+3ZDwP+ c=1 sm=1 tr=0 ts=6a9067cd cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=iLqgmErQAxjCjdq5jj1Aqg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=ENnqmNvwfkBjyS8sMAsA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: bjecWPc5yCASkYIEd1lUrix985O8A-K0
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI3MDE0MCBTYWx0ZWRfX5JaNcJ773CVy
 0IyyrBgIkxve2fO/wrOYXHIkmGaT2M4Hi7CQwdGTmAuoAVVOUI/5LlEIw/ARlknzw6aFxdAYFEZ
 fH00o7k+nlYgmAe7hrFPIPEWijdfUVg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-27_07,2026-08-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 suspectscore=0 adultscore=0 phishscore=0
 priorityscore=1501 spamscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608270140
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=pierrick.bouvier@oss.qualcomm.com;
 helo=mx0b-0031df01.pphosted.com
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

On 8/26/2026 9:15 PM, Richard Henderson wrote:
> "Move" the ifdef to meson.build rules.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/tcg/cpu32.c     |  5 -----
>  target/arm/tcg/meson.build | 10 +++++-----
>  2 files changed, 5 insertions(+), 10 deletions(-)
> 

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>

