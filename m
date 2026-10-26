Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB609606A31A
	for <qemu-arm@archiver.kernel.org>; Mon, 26 Oct 2026 15:37:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VsKUx0eB;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fWx+8hhA
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xLMl4-0003I9-3Q; Mon, 26 Oct 2026 11:37:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xLMkq-0003EM-Tn
 for qemu-arm@nongnu.org; Mon, 26 Oct 2026 11:36:57 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xLMkb-0004G8-CB
 for qemu-arm@nongnu.org; Mon, 26 Oct 2026 11:36:55 -0400
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 69QEvauc3618555
 for <qemu-arm@nongnu.org>; Mon, 26 Oct 2026 15:36:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 2qazO0lZgXIp/1jXXtlc0Bcf3/t+w0zLymkEPSalhtA=; b=VsKUx0eBKchUX1bf
 2GH0G/GT4TjyQbozfG4pHEmfu2LmIqf6pWhUkNZ+bMqR4dvasiVSR+rGpqWsIG87
 9MNgvKM//PRIRidFo9BuORNFXmxXR0J8Q8NR6/xyGbm9um3AbQkUiNXPUi9V586I
 Mum+qRWMAM8LQnuIYZ+TuZlNADkNCSJ3ueI2B1Jo/lhL4Zn0GarjlW7wwrvBIPMd
 HcpzxX+pqVvohzgU+sX3FUDyPXCE0EH9Kz0cGusj1KAYKDZjtdqMaZGbejoa+fxr
 mM+soByxmR7J/8mSVVqKuzRwAQwH7w1xTZMCQLo9hNQxCiFDeDu8QYfj7CpLKrSu
 IEvjqQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hj79xrn4q-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Mon, 26 Oct 2026 15:36:38 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-93cbf2fd504so605204185a.2
 for <qemu-arm@nongnu.org>; Mon, 26 Oct 2026 08:36:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1793028998; x=1793633798; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=2qazO0lZgXIp/1jXXtlc0Bcf3/t+w0zLymkEPSalhtA=;
 b=fWx+8hhAGghYRqgmS07LpUHIdWDHIEP9GMQ63kFgWzToN+YiPlaE91aHhz5OL2HYHD
 zOZsTIuxKqjUMJe4TOveOfDCLu4bUfkzZ5y4TRr/aDZnSuC+j+PAgT9ebFNFkcjJU4B2
 rvlC6yV33L2iQxEVD5LMqZCwYSM7eRlY4av8RFPrPeZogWbB8yPFGo+vmKnst2OlQTJv
 SIdKlext44o1yXHj4f2GDrlCdUOpMjdGcDno8eViQGstBKZLdp+VXxHtp8171j27VR/2
 Gq/ViizStcxGDfEHBWedu0Crj/5GhqqRAHmmuEYhycXpaTrzu7jnauaUbuoKa9T2FHbd
 O4og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793028998; x=1793633798;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=2qazO0lZgXIp/1jXXtlc0Bcf3/t+w0zLymkEPSalhtA=;
 b=VKtEnjRWRo4/vLQI/3vU2pRLMCb+tl/2WJjeu1nJuhd64jjaltud29pBITjvynX/7J
 sEph0dr4/pw6Ax0X9Og6I+EAvm4GVaHy/ufRHgjsGkfv8dELQxELGjNMRE87ZuYQvqxs
 ZE5dgIC++6d6DSIWdi4NFIaNqV1p/1XbiPJyXql2z95SqlhWUGTpFYMn0r+nG5lJ4IIJ
 lKxxNW4xMq/tlfKmZw9fnV5DAATmBVg8E8T93CTscFBWJOHGX04cxmEp42NEWtBMkoVR
 y0rRNjXjoGmzCBrYp7YzJ1rXEy8TXyV8Lxqz26jFGHmFtEL9qd+k8hL06qScpAY6vpoC
 3ohg==
X-Forwarded-Encrypted: i=1;
 AKwUvByLmN+5Dgv1LB59hIkrac9qKwqX5RqiYMm6wLCidG7WnR2bDHm4XAomJSg0+7Xm3FXmK0rF0TkAzw==@nongnu.org
X-Gm-Message-State: AFq9FYKXwXX+xLn6ydQ+++7mETbEpCZMgD+nxhPrNS0cgLYKj7Qj3I6W
 xIzd3GXf18VBFDMds2ev5BvMNNN0fMZS1O4TnFn17WW3qBImTnm8CQNvHYavh1b1GGn/IBSmLK9
 +4aj6eyYOgSz83uwOviw+sfd+XczzjTmVz5cYmMa8DvHCrBOOvB5auXw=
X-Gm-Gg: AYBFou31nWvTqbME525iFW8OQz+2UX7OcErZtnarb6OgUJOicMSk0yfIlQT2AjBMmOy
 ySRDSL64V2yR2D//+Y5UlAPaytBjJmtJCvTSFc0I7hZru9igux0PcVYCcvpOd5Z8Fg2J9koNFLT
 GM+DgcgCvXyTZqibXImSiY0U6Ip2zIghWKAKl+OpIQWhS5OtqchXiJitbtmDtT7guil66O6TUsp
 wbCDctjsvw2zwmyyF0GbkSp1X9l07eeLogjYuYehH3DzfzhPa33ifri8a3fmZU5adfnNHrouqmC
 rCYRTx+Uvf+0uVGxeGtX29/mtlUBrpwG7qM/SbqqDHULUvJdDKShGiw+8m/VA3YzPVRQlcBp9X3
 dSqL+yj5gJNi/JZ+N5OhpJM+Nwm9iAAfRCQ==
X-Received: by 2002:a05:620a:684a:b0:93f:2463:f78f with SMTP id
 af79cd13be357-940ef97fb8cmr1048242285a.62.1793028997463; 
 Mon, 26 Oct 2026 08:36:37 -0700 (PDT)
X-Received: by 2002:a05:620a:684a:b0:93f:2463:f78f with SMTP id
 af79cd13be357-940ef97fb8cmr1048237385a.62.1793028996982; 
 Mon, 26 Oct 2026 08:36:36 -0700 (PDT)
Received: from [192.168.69.230] (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e3ebd48e0sm17732035f8f.38.2026.10.26.08.36.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Oct 2026 08:36:36 -0700 (PDT)
Message-ID: <e139462d-bd88-4f6e-90fa-c4529f69ba73@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 16:36:34 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hw/display/xlnx_dp: Make assertions clearer
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Alistair Francis <alistair@alistair23.me>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
References: <20261026152409.2869104-1-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20261026152409.2869104-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: eCU_eXU-um3NNrARfdXULdgL2ITjOn2Z
X-Proofpoint-GUID: eCU_eXU-um3NNrARfdXULdgL2ITjOn2Z
X-Authority-Analysis: v=2.4 cv=FPyOVOos c=1 sm=1 tr=0 ts=6adf7386 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=p0WdMEafAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=LzL3Y7srNPVuGF4Lnh0A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA2MiBTYWx0ZWRfX83sQlMsVKxsk
 Jqg9hXQuDz0/3UDXYzlLUW23AbWIlYbwkFzsRP509HZKBEdzQnsrVtcNnzthChF1rrXP2BCUGyI
 5B+N/IUwM9bj1d7hJx0+KsCfqUMHhTdxfZ9gnMoCP1qALqBTNRBUya0vKtxtQQZSRVWyxw/lxcD
 mmrmuZAlPPIkuojK+Ibtw00rTS9tc77MmpuVZ1Lqtx3isLtLI8bYQ41Y+7Z+WTYVALfFxQoaZPJ
 ZCFmXcXSF8ww8qePiQgQWOduWJoU4XtDjlUNyIcexuJjTA993G50vERgX6FTDm75SJDFHhWli2J
 PRMNzp735GGdnhZgCJaWP4mmd5xf684aelsB/n5PdK27NwTwNmtwCFjzcPq/alOAZ2jJgpfg+s4
 QxuLOC8PcoIZMoq7D5MhcDvZEtvqeOfysl4UdvRxn5ZbxKXTCA5mlrcsD3rrs4EIbSiBOx4GPfs
 89nuZWNd7E9jgXnWW5A==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA2MiBTYWx0ZWRfX+2pc3OJZZ54s
 MuCLWEeyhMfK5v/k1JpgXVXqPu6m9AQYp4F7gtnPDMpBL/b+JsXiIZw0fJEqlt5oVSK/03UaVDl
 oQczNbppWcaW8Ge0I00SM3IK9lu46BY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 spamscore=0 priorityscore=1501 suspectscore=0
 phishscore=0 adultscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260062
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-Spam-Status: No, score=-22.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 26/10/26 16:24, Peter Maydell wrote:
> The xlnx_dp code has some assertions in its read and write functions
> guarding the fallback "read from core_registers[]" codepath.  The
> array can't be overrun because of the defined size of the memory
> region, but the read assert is confusingly written and the write
> assert seems to be completely garbled.
> 
> Replace both with a simple check against the size the array, which

Typo "the size [of] the array".

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

> makes it clear that we're asserting that we won't overflow it.
> 
> Resolves: https://gitlab.com/qemu-project/qemu/-/work_items/4586
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   hw/display/xlnx_dp.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)


