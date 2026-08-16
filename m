Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25E3AC5DF66
	for <qemu-arm@archiver.kernel.org>; Sun, 16 Aug 2026 09:20:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wvX2n-0008Qk-9a; Sun, 16 Aug 2026 05:20:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wvX2c-0008Jf-Fm
 for qemu-arm@nongnu.org; Sun, 16 Aug 2026 05:20:31 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wvX2b-0002oi-2K
 for qemu-arm@nongnu.org; Sun, 16 Aug 2026 05:20:30 -0400
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67G72HD32811100
 for <qemu-arm@nongnu.org>; Sun, 16 Aug 2026 09:20:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 l3QyAF09ZXfHYyKDxPZWl4pmBZgtnF4lqdnSxlFCmtc=; b=BdWoMFeuwmAp+Chf
 nYURZAWIX5WXoqH903KKj3Z4pncBre5m2yq7joskybN3FC3TdpwmmjguoXNkDjV7
 cXSQ5kSSORCxrMNofM3IeGSbe2VpmMaaPl3oewgvOwt0jhWyNjsAiHRx77fy0NNv
 fo/3N/32KYdtKcHzcpwquuCywj+Rn2ZpdEf3GgzkdC8Wo3UjP/oD9XEtQwV7ixKJ
 iCn4HdGhqX6ulMvE7krJFdKg+nMKB6c3DdpNktiYyTOCYosTHSomFmZTmqA97F6x
 1Is6Q/1/y+KzCEswfixs8Dz26thKWRrQ1NzFWM3uugXTA2HHwSZ+jWuO2rsl1maA
 +UiwTQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g2ghek7af-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Sun, 16 Aug 2026 09:20:27 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-51c19493ac2so25873331cf.1
 for <qemu-arm@nongnu.org>; Sun, 16 Aug 2026 02:20:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1786872027; x=1787476827; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=l3QyAF09ZXfHYyKDxPZWl4pmBZgtnF4lqdnSxlFCmtc=;
 b=A56F2Tc++ta8YJquoxgGVdUDwzq5/FJfvoutNEKscYW61qtImenLcTSL3A20sZG6oR
 q2fkWoiCsZ/zByrd7KXPOXD8comGXD58pHYZqsT44fPQmC/eERvOBMHKYnxp83RxrW0H
 KkAvyaxdC1kEOAw5zC7s5IedBqDzYLDVN3g0g0ypAx5k9FnPi/MGQHfvLNHb1g9D2lV/
 lJVg8rVncHX5RI2lyDQV9PyAcjrZqk/shER9hhKNEXHQACpP3B241nGxXAmgJKPEzQfp
 xZ9QDwotLQf5hCRt9HXp3j5cTdmxPhPUHkM/4TRjOjFXHf9IGkCDjqTz9gALFqu2EYGv
 z3KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786872027; x=1787476827;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=l3QyAF09ZXfHYyKDxPZWl4pmBZgtnF4lqdnSxlFCmtc=;
 b=E1sCh75m/1hdfGwCflmSwXTQbXih5bRKgCi8W29DhK3jvkFvQF2+BPYFSqTx/YAxDo
 fdgufYKciS0czwAOwW7lLNaO5tcaE0rOy0S4XljCfoGcQjqGSCYmpBdXfbjO/Bw20yKI
 xv09gR0gyT6NssXzG1JBMCALoi7jKpTrptYg7v6G7hoCZkYbwR4VR3uiGkpYTuFJx4XP
 BROMmBoPwB4AsMnYh0hbgUfLoun2CGMnb9ex832U6VgYHBYg42zcrXSpUEy7aTlUWUwH
 mkQW0qfKQbeZ3N0CnlLFXRYzu7FTQ7T8R/0m+xN4huc+fGxOfJabOn9epNYGL28FoGEx
 +zMQ==
X-Gm-Message-State: AOJu0Yyzbm883q3Nn1nuFT5mYaMw7NibS2TAb4cEDXGEK+CAAqciXumT
 Kg9Yj8lB3WtzgyLDuZDW8hR0kEi4VOr5r535UVbJEv2SCTwI8L/Yt+Gq7/shHMF0+qq5b1/f5ks
 8g+oZg+138yeVnQCE5j/HBWL8U092HZfl6slZ3Dpbt3I3L5iOMgnlhtw=
X-Gm-Gg: AR+sD13Zmyy5KO9XDIiJKVTGKb0i2V2OQXm7cKDMoU+7O6f6+BafV2RCCfD0PvB2b3S
 KfG/X8TnwqshLmg8mdqqyuwX4mqKk0JPzzBgk14BWodq78qUajn0btFO+GKATTOqaMeGMJbokOs
 Qu4l4UL+7/i6r673PA0N4IOTbBiJhGvoNgd6BebVvte3aLWqH1aV5konPmU/QCTOim5OTojdcX9
 vEMWmWEpFJXJjY6PV7VKPzPulWcigbqBRi/zV7/01gR2y8muMo7uR8KDF7PG+qxkZ5moD9lCYKG
 rKLVdmn5Bc8ezpAoBO2Io7icFAflJ2e7Y9C4NcP1Xqrfi1G6rrPQfg4h34bpb4n/g1BNWvJ7EZd
 jEbLH58aaofOR1kLUCzZrFi8U5vLve1gdGuY=
X-Received: by 2002:a05:622a:8cd:b0:527:631:8d6 with SMTP id
 d75a77b69052e-52d854c66ffmr216300361cf.25.1786872026808; 
 Sun, 16 Aug 2026 02:20:26 -0700 (PDT)
X-Received: by 2002:a05:622a:8cd:b0:527:631:8d6 with SMTP id
 d75a77b69052e-52d854c66ffmr216300051cf.25.1786872026422; 
 Sun, 16 Aug 2026 02:20:26 -0700 (PDT)
Received: from [192.168.69.229] (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-499960fef95sm38486475e9.1.2026.08.16.02.20.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 16 Aug 2026 02:20:25 -0700 (PDT)
Message-ID: <296d23a0-3157-468b-8c4f-e04bd2bec201@oss.qualcomm.com>
Date: Sun, 16 Aug 2026 11:20:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 11/18] accel/tcg: Replace size with first/last in
 tlb_fill_align
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-riscv@nongnu.org
References: <20260815203730.1468365-1-richard.henderson@linaro.org>
 <20260815203730.1468365-12-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260815203730.1468365-12-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=EKc2FVZC c=1 sm=1 tr=0 ts=6a8180db cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=1tSEMpTH9XP_W59IOagA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE2MDA2OSBTYWx0ZWRfX6Yrxko+oOJ7K
 KIkM3LY78Zw+eSeEeKGuEUTJuihyEqT7UKCR5IVtn/flxJup1a5/HqwKbbdRuGH/sNEgWsLPe4K
 MYVt6pqCMytyzL0fFEwDkTBwxuCC3+U=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE2MDA2OSBTYWx0ZWRfX8CjKQNJsjo0h
 nx1EYIh9ek8MNlgRbLWzpiqFVMhSzpV3/i6ij80CcUGu88EsvUyC53Pzz5yiGVGQn5B2tjHKG5p
 CabL71f/BhJshhxz9FEQvab94zNj2ct1FFsLr8rdIEiQYOW1CNfOiwUCV/R+oZIlTzxoG5eXKov
 g8doyAyLz+9mQ5m7dYsvNaUNzZCq9Zds+t8eYEtjArNusCs1LvVyyLmx819JeVhWl4+EvwseHmh
 JK6k4zGMg4HVVfV1NwejJWuRsZ+vJOLY3x1u0tJK6RkLujWP+uOqiifJwzJ/HcDd+Dx+wvq72gg
 SJe65BfkU9iHJJZNtIdERcbIsO5IhM4vCBnVC2zeuOL60Oro9TOoKRMlW/JjwYC3jG2WX85Ga2e
 260QFvY6tSGBGo1SWhXC2t9wYi9hHZBsNhG6+SLoMeK1K8uhxhx84BWjqkZ82AUrjg9+xJA6E4k
 PRdwVLww+yMoWtMRr0A==
X-Proofpoint-GUID: da4m0gJNGIva7ySKTGpXErHLMB26gTg6
X-Proofpoint-ORIG-GUID: da4m0gJNGIva7ySKTGpXErHLMB26gTg6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-16_02,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 malwarescore=0 adultscore=0 bulkscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608160069
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

On 15/8/26 22:37, Richard Henderson wrote:
> Propagate the API change down one step further within cputlb.c.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   accel/tcg/cputlb.c | 21 +++++++++++----------
>   1 file changed, 11 insertions(+), 10 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

