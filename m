Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88884C55184
	for <qemu-arm@archiver.kernel.org>; Tue,  4 Aug 2026 02:52:04 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wr5Fj-0003g6-8d; Mon, 03 Aug 2026 22:51:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wr5Fh-0003fJ-Ci
 for qemu-arm@nongnu.org; Mon, 03 Aug 2026 22:51:37 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wr5Ff-0006Ho-QC
 for qemu-arm@nongnu.org; Mon, 03 Aug 2026 22:51:37 -0400
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 674175vM2818174
 for <qemu-arm@nongnu.org>; Tue, 4 Aug 2026 02:51:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 LNF9enBXs165gq7lT0dBrle7K5dJESVbQ9HbQDcB/4I=; b=f/AU8kJzcIQYitip
 nVKNZmnGhwqIfvWQc0bo4mh4XR+KtTlQuE9SYqjXy9QQS+seq0fT72tdIpWQriJP
 o64lb9KrVa+hiMMx06Tvy6hA+YSvL7spcmbuz5vXr0a0pzMLC7EyMi0Z4O6Gx/zY
 hJ1l01A8ChonX9i4fvGB6pwovJXvcMy+TWvpNcdOPrCEo0yziPOx9VzVyYN5TOlr
 t99l4k6pBzaRwGUuZgLSZVV0v8TTwrLCIP8gEkRXNt1sSq+fu7iC+QHhx4OKH4r4
 5Q4mB/l0EshZi6lj9Q7Gs6/k+fJYi86UBgkVaRqyVmWIHaIXOpxwyeY04GDPrGsN
 axbSWg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fu1p4sb4c-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Tue, 04 Aug 2026 02:51:32 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-51c12e43b98so44168851cf.1
 for <qemu-arm@nongnu.org>; Mon, 03 Aug 2026 19:51:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1785811889; x=1786416689; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=LNF9enBXs165gq7lT0dBrle7K5dJESVbQ9HbQDcB/4I=;
 b=iWoFoWOP0zf1MPMJAhbrazzHduUe5oSp6PFJOUwaxfm4uirH74ivxJfiR2FJqmxGtT
 REj+4+OOPnYqCiq2962o+EoNqwFsbIgP1m5/RoISUho/S/WjdOVAr42OHnWQWYYhoOSm
 T1sbNc62wOUhlXiSd86J9JgT4EwJQYNcqAzUPwe2iBqrolnU0O9SAt8NTaP3fDYSyHUz
 RR525CySayc+FcCwpIH+1oq+zgjZ4vpMIWHdqjAXFJfmChgyCjvDim6jXCI65ToKV/ra
 dgZaHMZA+qgOsqtRFlDiSXtfAG991xHAdFsyyUh5Jr6qMTcT6cF/qZ7ncPvp1//1aZQt
 Wcyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785811889; x=1786416689;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=LNF9enBXs165gq7lT0dBrle7K5dJESVbQ9HbQDcB/4I=;
 b=gpSDvO7asl0qVr1MQBYvySyPkaxvmgSX7cXIN8Dk6LCSf7YIzSLgdzyzmhPqEOBNon
 ijJNSx+lKg28Ck2htCiUzzBTWetHlF3CNvlJiViDnq6aU8aSKWn7P0hnRN3V2FMZlCA6
 1UO9zMvVqkvV09c3PvZZgomyTPFxnjFjIET3z+nslVXdLelZmiXuXfbpaermt973JkYd
 mg6aJYvr+vYSxom1hPSEekLjhJxdgOey4AJZjahxz342jo6d6015BzUC2h5ZeFo6EuRU
 CUMxrJob4fxVroOSraOeaNDSneVR9PFj+baMwbI2XvoLi17ijc3fZ7l34uIzo9MKwFaQ
 zGFw==
X-Forwarded-Encrypted: i=1;
 AHgh+RpiZ1a8jYF8K4XoIkWSVM7N97ZzjZ6Pm+vBqasaH3SD4ebu2t8Z5CbZyUAwEDkGlrgKvd3kVMVsWg==@nongnu.org
X-Gm-Message-State: AOJu0YxElM8XTefxegXSEA8xfl6718mXENZlxKUR6QX1bJdX46UKHLME
 uIQuTmj3y4e4EavvQeZUFbzou2d8BJ+iO0UeLtfwl55ed1TYl/LEgKzNnGPS9UfzOOCPBh5hmmc
 VZakgFGno0OLGzxsotx/u1ybDSyeHKrarP3CAqHE/3GveblWx5NmGADY=
X-Gm-Gg: AR+sD121haIX84H22QO9DzSrJSGEHpw+LEGBt1VKedeBSrdtXe+KcoK48dPFSZovP4C
 fzWPHsrK7oIRU/KFsKUYJIaepgTBaDN82lMKWtkCgwFCCrXTNpeXtopTfcF7lM0E6nJlmxNdMNz
 QzHYCTCQhiE9NaE8eufQHQ8pgYh+Q9kajkBlPjd2z4VuaPtqOvJYm1KBAg03MoZdf+hGNJ8ypvF
 +YXTve8Ud85YUEtzRCzZkHgQvFBskNb1Awob8/msFhKlBH+dxrorqOKxvRX5SXyc5etSijucrc9
 yGMmxTUd0gDbczopmXdz+/+Ywj7+JR9SFtkRenITCyGtSION8hyAGhT4E8+q7pOOvQRq3l3qctI
 x3gUAq7m0XDve+tTifkf3Gl4tboiQFxgdDUU=
X-Received: by 2002:a05:622a:c84:b0:51c:92a0:b2cb with SMTP id
 d75a77b69052e-52b5682e980mr238774161cf.26.1785811889409; 
 Mon, 03 Aug 2026 19:51:29 -0700 (PDT)
X-Received: by 2002:a05:622a:c84:b0:51c:92a0:b2cb with SMTP id
 d75a77b69052e-52b5682e980mr238773931cf.26.1785811889013; 
 Mon, 03 Aug 2026 19:51:29 -0700 (PDT)
Received: from [192.168.69.212] (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49949fc2b98sm45809315e9.2.2026.08.03.19.51.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Aug 2026 19:51:27 -0700 (PDT)
Message-ID: <9fba5d26-486e-4415-a086-d15473bbbc56@oss.qualcomm.com>
Date: Tue, 4 Aug 2026 04:51:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/11] tcg/loongarch64: Import REVBIT insns
To: Richard Henderson <richard.henderson@linaro.org>, git@xen0n.name,
 qemu-devel@nongnu.org
Cc: anjo@rev.ng, qemu-arm@nongnu.org, 17746591750@163.com, maobibo@loongson.cn,
 lixianglai@loongson.cn, philmd@mailo.com,
 Jiaxun Yang <jiaxun.yang@flygoat.com>
References: <20260731000503.170446-1-richard.henderson@linaro.org>
 <20260731000503.170446-11-richard.henderson@linaro.org>
 <4b5db4f0-bad1-48e0-bde6-f72ae4681f39@oss.qualcomm.com>
 <a2b68ee9-861f-4511-a2e8-13889d08c151@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <a2b68ee9-861f-4511-a2e8-13889d08c151@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=auOCzyZV c=1 sm=1 tr=0 ts=6a7153b4 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=NEAV23lmAAAA:8 a=2hlkDxslWKAfz-EcSkAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: -eRwILTyFhvSSmx6K5SGm79CpDZjpQH7
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA0MDAyMSBTYWx0ZWRfX97Yuf2LiIZyF
 PiDKepgQfV1MxrzLh3nuNZ9yz7UuutYw6/RcWZo8iHXg9xm+qxsvWRActKp6hmV15XXdjGTOSZV
 iJQwcCKFNvS+JJRmyoZPMF75gfHohrE=
X-Proofpoint-GUID: -eRwILTyFhvSSmx6K5SGm79CpDZjpQH7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA0MDAyMSBTYWx0ZWRfXwJJW7z5D8bNK
 lOnxoPA+cQT1ad7c3PkkbKXIEA5fBw+yz59sseSMETgGsBPp6f3rB0yRAXASqfEKsjvi5KxHplj
 LDcokX0HFFyyt4yZboUZ7fFeY2P/759NPMd3w1inKNUzlfPvyNemtlJaQ9X17BbHvvy9Ri6tNmP
 uxHMRJolrV7CsXOcK73YfXkut1VTIqXfgv2WVP8HgxT9TNxFgRJXPts+rSx+pKq02ila0hxPy/Q
 i0jZybnkisiDcgoWDqDEXWvCSLJeeTcnFjIlBkWm9PuEVkgVG8/LlhNFCElPgk0lDRd1mhl6kHI
 eGBkIvHsFBg/y7mpAkO/Ny7OmlsPickDKRSILQ1U3b90NMRPawa9L7HNFnX3KatEb1Afrkmkof2
 y+ohevdqWLL45BjghCtAVJldkEXVXW9NxoFoB6hv9LNMEduKfDX/dNhIMRq6ofEgjSwV7CkIUL/
 U8VxESxz4K3PXzxC4cQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-04_01,2026-08-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608040021
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

On 3/8/26 19:26, Richard Henderson wrote:
> On 8/3/26 08:06, Philippe Mathieu-Daudé wrote:
>>>    * This file is auto-generated by genqemutcgdefs from
>>>    * https://github.com/loongson-community/loongarch-opcodes,
>>> - * from commit 7f353fb69bd99ce6edfad7ad63948c4bb526f0bf.
>>> + * from commit 40ea52087699392ad911387b666541891d33da31.
>>
>> I couldn't find it then noticed your
>> https://github.com/loongson-community/loongarch-opcodes/pull/10,
>> so pending it to be merged?
> 
> Yes.
> 
>>> -static int32_t __attribute__((unused))
>>> -encode_d_slot(LoongArchInsn opc, uint32_t d)
>>> +static int32_t __attribute__((unused)) encode_d_slot(LoongArchInsn opc,
>>> +                                                     uint32_t d)
>>
>> What triggered this code churn? Could we commit before generating for
>> REVBIT opcodes?
> 
> It looks like the program passes off to clang-format.  Perhaps a version 
> change in the year since last regenerated?

Then maybe call genqemutcgdefs to regenerate clang-formatted in a
preliminary patch? Would also help reverts.

> 
> 
> r~
> 


