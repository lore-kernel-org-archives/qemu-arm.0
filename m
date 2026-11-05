Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC6C9606A6DD
	for <qemu-arm@archiver.kernel.org>; Thu,  5 Nov 2026 20:00:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FXGAhswM;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BMxSA2AY
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xP3cp-0003IL-6a; Thu, 05 Nov 2026 15:00:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xP3cZ-0003H2-GN
 for qemu-arm@nongnu.org; Thu, 05 Nov 2026 14:59:42 -0500
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xP3cV-0003xA-47
 for qemu-arm@nongnu.org; Thu, 05 Nov 2026 14:59:37 -0500
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6A5HeDIu2513468
 for <qemu-arm@nongnu.org>; Thu, 5 Nov 2026 19:59:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 RlWfBrynmvfqWSZ4v1xRk+fxYaPoGpMlDK+ZE5l1eRg=; b=FXGAhswMQ1srA+iS
 AO5ZETWsuGW+N6hgyd4WPzXDWn7vdz2kVnCOc1bZ4sHh3bVdVIpxhRsB794N3F+q
 kCmiXRwlcDcmLmyvSPvIEMVF0vKOO+9c0lbp21bicfO9uEdOrZCBi72WBYWmCzZ2
 a4TZoPVkAZrTP5o9CkctunSTn8HGTHaAeqkbnKM0mfkw9JCl1cR9irPJuNMSgRfm
 Tiex9hIXngCrlUlWvM61j97Cqr/dl44qWCWD3vVckt6rqB6vgeMDB0joSfoHEGLA
 krv9aPqcjv6XH7N6MwAm0FcQXlnTv9IqBoj66VjiAYL+r3GQuYF7M84w0ecj5Tew
 OIuKIw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrraatect-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Thu, 05 Nov 2026 19:59:31 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-93f5844cb60so197884985a.0
 for <qemu-arm@nongnu.org>; Thu, 05 Nov 2026 11:59:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1793908771; x=1794513571; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=RlWfBrynmvfqWSZ4v1xRk+fxYaPoGpMlDK+ZE5l1eRg=;
 b=BMxSA2AYPeTJyxL5qvTpF7b0p3hjTDiLWJq56jImLPG7V8dvY4es6gNYzcZFDgqnbg
 17CZw/3hZAIm2ZkmTB9PvPvsZavpLiO3snt71ISsUvg0xsk5+vfaIwxkifG7gilrwjEm
 SsdlBmVMHIEsUdZ8UpIE+NNPxf6rULpvgC20Nj0qOuoHNlmCktVFT9IcHT7A/cdFXDbb
 FSdRTNA60WxtOqCitF+C+euEsInWnguVOLdHyHhX1reCKrXsNYyNRDBgzbFClvaOVW+4
 4mNMoEnjX68FYQs6bOpQIg+pVezRjRiLxFI32IZ3Ti19SdyGwzNCLwHtJdUzlPWkXZdI
 MBlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793908771; x=1794513571;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=RlWfBrynmvfqWSZ4v1xRk+fxYaPoGpMlDK+ZE5l1eRg=;
 b=pUPejrPLp/sOa9rUZqWUWMQ6RG9N5Fnc2KpRkZHIIwjvbTB1I54J0Qxc3kC7vXN/+n
 4Okbq7t0n7OuCI4dZCA+XwNNf9zZHuig3GplQV0dpzaBxjc5Y6IHZSZZp607MZE/o0FJ
 bQ+MZ8XnNIQu1f0GpW1A5+Azjzi+0Cmxn6nIr43RncU88J/u6Khvopi/hx5Nm705tyFv
 PSHjU/XffZH3gVUMZHOckgInsDIlmV/huoC/6NisJRpkafCgMJSjMUQcX7CGvYpKaRxe
 eAqsj8V9t/ME6wWdrP2D3YSufdWRQke47rOKlUkB+djYEKWW0dBBu9zZ3rCiN23WqJJx
 1hyQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBySozj9uh1LM+JJu3aFmteolUQbCZwUesYwmms9E+IOOOupz3B9wg3qcYs1cWSxpgKdCaJ+vDpCyQ==@nongnu.org
X-Gm-Message-State: APuU4Z9+1cPinTuWr6sS+yLD4HxBJuieFo8RKixKkgd/x4e9vU7gcQ8J
 X3Whhj1WaxGldSC3o1sLgXS3IYuuLgtrYDhwpuJYQcm1DMbEuFqLg0aSSyEROPZMPCaHOCe+8Zp
 xwo5w4+vjK75A5uxTSDer5TYqNo3DKOkfqKqURq9l0+Fw1FozOiyT7Us=
X-Gm-Gg: AYBFou10x77JgfzwEhwt+29Ci9rt5l3o8ErSNZI0CgMUWvqVceQEUvWp78e70gt2NgN
 Hsbme6lmuDB8FLZFK4FBA2bXjGxq5RtC1tJfCaWMe34xDS/T+MgHamGaubmGDZK5f5DfYGvdzy9
 f1jL68sI97rQ14FSWTv+gtECmMo+E6+CH+TC1LY2mjtq0glJLTFyFxzCCb6eqVNOcI5o+LOL5lL
 TqTNQnoZfkWEL7ZKC8arXlyBVdWntybpSzVF84opmRO/9HDGWleY+AEO9A0Ilvzh9/bcLp6xhRA
 3J8DYxogLUleQmiQE4SjIDQ19ZDok6e0YrIVWshnw1CjpvY9JCl+zaXQ+ot5i0Yw9oKZRpzoRt/
 XBXc5Ag5LPfM/5dMna7rsN+dWpq1Cw+GlhQsbLODF3Ow+01VTvdULnRk5k3rYB6ioJxxOSiBR+D
 ch9hb0PuWi0TaRNMsETOw=
X-Received: by 2002:a05:620a:31a9:b0:944:4e6:85d8 with SMTP id
 af79cd13be357-945e1595a55mr624422285a.5.1793908770695; 
 Thu, 05 Nov 2026 11:59:30 -0800 (PST)
X-Received: by 2002:a05:620a:31a9:b0:944:4e6:85d8 with SMTP id
 af79cd13be357-945e1595a55mr624418085a.5.1793908770129; 
 Thu, 05 Nov 2026 11:59:30 -0800 (PST)
Received: from [192.168.1.20] (88-178-97-237.subs.proxad.net. [88.178.97.237])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4b6df5eab6esm4017225e9.1.2026.11.05.11.59.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Nov 2026 11:59:29 -0800 (PST)
Message-ID: <9754a1ce-71f1-4ab1-a95c-98a16ddfa8db@oss.qualcomm.com>
Date: Thu, 5 Nov 2026 20:59:28 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 17/17] qga/vss-win32: Replace deprecated sprintf() by
 StrCatBuffA()
To: Kostiantyn Kostiuk <kkostiuk@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, Michael Roth <michael.roth@amd.com>
References: <20261105125203.40320-1-philmd@oss.qualcomm.com>
 <20261105125203.40320-18-philmd@oss.qualcomm.com>
 <CAPMcbCrrqrBf_7ofh1S=c=2DFTpZf1SjaqEYnVM=miKbSCk-FA@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <CAPMcbCrrqrBf_7ofh1S=c=2DFTpZf1SjaqEYnVM=miKbSCk-FA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA3OSBTYWx0ZWRfX/FbhWZMKaWnp
 OpvAQeM42J08m+gz2ztoweuwE/3sPi+zGtJYzAAPVySa3OLDp7qWOm2dvF03ES7qh1gGCAYdEr3
 MTBikJBMkzRKSJr5sm8dzXpWz5VLBIo=
X-Proofpoint-ORIG-GUID: sZq9x3pNScLstBzjSxUYVTNMLcXecsv3
X-Authority-Analysis: v=2.4 cv=U54Hnuru c=1 sm=1 tr=0 ts=6aece023 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=tK/gbQidGls/GiIE0Lv0/A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=cjEYgBYo8tDwYd4kLZQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA3OSBTYWx0ZWRfX+OyrlDztXOGD
 aZ6DffX0JLoNgig4CtkJuHUhyldwraulqU5Rjtq5zYPFkvvXxNeZ7kT19tGET0VAE5xDRRlYgbJ
 xfKXZSb13ni73oF2xwl/6zQv3qqgbRBPA6+kfsZYWKqC6xN+//VejGJG8Ms4MTmuOxXSpz81qZB
 dtHw7kX4Gta2IzWv+bDOeE3IbqT6Y8vwgK4pHBKt0kPVHFybw5aFytHmDB7yrX15JqvZrSmnm/o
 gCM2dynjQ3IKkHfyvACjFt0C+R6XymFKVsQyOs+a0k6/idHVKhd8qqix36JQnHnbKw+vcKuK7wf
 wnQtlFzdUZZmnyScA69ZQWqP2JiIzXz19MHSg+9WaDz0Kue7U58LSRQdJMyuUUyQJSBhWDGM9Xj
 2DtTZhOwyrUm1RvXKne4zc/5r1Jg4kJuKhX/0xLb6hbJdKvhs6cY32phLq2lK3Ftqfrk+ZpMF0b
 3w8sA2SqiE3cpbimsPg==
X-Proofpoint-GUID: sZq9x3pNScLstBzjSxUYVTNMLcXecsv3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_05,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 adultscore=0 spamscore=0 clxscore=1015 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050079
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

On 5/11/26 16:29, Kostiantyn Kostiuk wrote:
> On Thu, Nov 5, 2026 at 2:54 PM Philippe Mathieu-Daudé <
> philmd@oss.qualcomm.com> wrote:
> 
>> Formatting is not necessary, replace the deprecated
>> sprintf() by StrCpyNA() and StrCatBuffA() calls.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
>> ---
>>   qga/vss-win32/install.cpp | 17 ++++++++++++-----
>>   1 file changed, 12 insertions(+), 5 deletions(-)
>>
>> diff --git a/qga/vss-win32/install.cpp b/qga/vss-win32/install.cpp
>> index df00588c923a..1a3d5cbf75d5 100644
>> --- a/qga/vss-win32/install.cpp
>> +++ b/qga/vss-win32/install.cpp
>> @@ -562,7 +562,8 @@ STDAPI DllRegisterServer(void)
>>
>>       /* Add this module to registry */
>>
>> -    sprintf(key, "CLSID\\%s", g_szClsid);
>> +    StrCpyNA(key, "CLSID\\", sizeof(key));
>> +    StrCatBuffA(key, g_szClsid, sizeof(key));
>>
> 
> MSFT does not recommend to use StrCatBuffA due to security warning.
> What about using StringCchCatA instead of snprintf, even in this case?

Good point. I went back with StringCchPrintfA() for less code churn.


