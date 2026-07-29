Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90F74C53200
	for <qemu-arm@archiver.kernel.org>; Wed, 29 Jul 2026 19:42:52 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wpAAf-00020d-Fy; Wed, 29 Jul 2026 15:42:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wpAAe-00020A-Kg
 for qemu-arm@nongnu.org; Wed, 29 Jul 2026 15:42:28 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wpAAc-0000OM-PE
 for qemu-arm@nongnu.org; Wed, 29 Jul 2026 15:42:28 -0400
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66TIrRcu2720542
 for <qemu-arm@nongnu.org>; Wed, 29 Jul 2026 19:42:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 lBgIEj0kclPJpD1FhKtp72cnKCz4zIHtoQ+OEfzDjwQ=; b=Bp8kFo06YtsbzOQj
 PRHfG0WzY7A4gTv7UoiSjFQtMigJViWycfb5NRP1T6WLqZnOzGyXSy9j/jJRAtPm
 EuGtnXltG2o10UzNSM/rOznxpaCFB7pctT41yvePTKnOTVnCnJDxuKDLc8uGI6pW
 3gQiSbsIVj1YUi74YpkBIu7RzsggO1aK9U5D/hkeuqB+ojTXrgtEn+sGmq/6dikH
 9PWVLc8FjRMfA2iPDVT/EpwumfkvAU3+Tr+pw1X2jg3BttBnNMywEucA+2X5J76/
 iUIFrDj7lNNUG6qP0PodvylI7D35Owb7W194p26rMFqK7ATzPN14Ie/LDqAM37Kr
 Lb496A==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fqq6d06yq-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Wed, 29 Jul 2026 19:42:23 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id
 98e67ed59e1d1-38edd45cbc4so1459547a91.3
 for <qemu-arm@nongnu.org>; Wed, 29 Jul 2026 12:42:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1785354142; x=1785958942; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=lBgIEj0kclPJpD1FhKtp72cnKCz4zIHtoQ+OEfzDjwQ=;
 b=NfdljmUuQPd3u4NmAGBAik3t2RLMRBZsOPKe3KuGNf2cxDF7lO9pT4cj8hwvQKxBF9
 fIXzv6G7xqi37xwB648O7ivARK7NKI3FRu48ZsRLHmJueFKJZXsMC71iNgVo3ysZfA1c
 SyyKvA3vsTeroyd/SWGVaKuuIl+ABt3EZMniiawGyq8tOapgRscBaP7CeEryxGulu+eP
 YhheJurskaVCzoriX5St4VezevoRkCTfsy3xr0UlxAjdPOWHBFHzbok5kiaHnz6MCZsI
 gPrwYG+1yBZDwGapq83gxMHfoQBMbArpjft54XfdST5miz0QLDLGaueLycoSM3uKuipw
 4YlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785354142; x=1785958942;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=lBgIEj0kclPJpD1FhKtp72cnKCz4zIHtoQ+OEfzDjwQ=;
 b=lCFgueVBS7omBQU4g9P1dUx1gfXM2d3y/f4di6Y+vhwHnBpfSRoQRAKBZRhWRGF5CT
 J7wgtaXhOQaMsObqO6cSWvSpKaB+Hyxu/FuDM+GMB5cEV972hV7ldQhyBFuAtIKBCItW
 mqk80322DoCuGfTxmSHeOq9DLFwFUNY9qg7P4AAUPc7GoT0CqXBDCn/jcnKxavgUTgiP
 8CUc3XEiEON7xk2vdK+A3ZQSPawWmMHkWy/agQwESO6+2zAdK4CDTiwxXSasfJWKt/D3
 4B2BelufW+/wDxOQ4dhKQ5BEa1mnd7JcQrrVbX59fEE8IIOyjvczNKnToEg/bEP5oJ65
 Bubg==
X-Gm-Message-State: AOJu0Yxeg6pQgxZvY3A3U/P+WOPmmJbtv6Wp2JSGNqwKYVQURkcuIUyX
 SjkUKzan3YHtQSKXiOs3ET9P8bWrrzpTdgymGrr5hE+I3UIWjQabShxPblhlFoVtiAU5DIV5mbf
 0nlyD6r2klFmyv1Vk8RVZbbwvR6S3UAueonqozlv0Jvq3BxKlvsotKHI=
X-Gm-Gg: AR+sD10S/qnpwgKh/8yqz/3Hz/vTo7AlpdGGFv/mbmzLyuEQZ0n+W6xSCijPsO+Qluv
 r94DG6U5DkCqTDYIHmDM+aAgD25uTQ6J0snuVbVCTSj3p6sdF/898L4fQCIlw4U/Sjl1Lba5Wr3
 N9Cj4kVdrXMQ7ELC5Df50jAKJqszLS+fd8YDG3I0aDqdEonNlghLUvBrfLG3la6RzEohcR/SCbc
 URus/T2dK6WeOzDSUi+Vf2ZGhZo+BVjyDSru9wtME93eLSfLuxzQHjLpZY0GCk3dXa+jOdJDEkq
 krbc8tnqhh1nTcDK7aFztt9AUAm9W5Hipc8Wc/27ce71DLY2yZvuORfqL1jEs6ol5lWMsfF7Out
 ZZ4Oo3VWUramWdzJfAWGfl988/O1hHTfTV2EIBfk47Qgve1Lm8vjrow1CBk0Y3B4hoMJP
X-Received: by 2002:a17:90b:4d88:b0:38e:5dc:af03 with SMTP id
 98e67ed59e1d1-38f994ae434mr149103a91.40.1785354142484; 
 Wed, 29 Jul 2026 12:42:22 -0700 (PDT)
X-Received: by 2002:a17:90b:4d88:b0:38e:5dc:af03 with SMTP id
 98e67ed59e1d1-38f994ae434mr149077a91.40.1785354142048; 
 Wed, 29 Jul 2026 12:42:22 -0700 (PDT)
Received: from [192.168.1.170] (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-13e72735084sm11904332c88.12.2026.07.29.12.42.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Jul 2026 12:42:21 -0700 (PDT)
Message-ID: <50616d09-9bac-4542-9b76-282538c381b1@oss.qualcomm.com>
Date: Wed, 29 Jul 2026 12:42:20 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-11.1] linux-user/aarch64: Fix SHADOW_STACK_SET_TOKEN
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, deller@gmx.de, qemu-stable@nongnu.org
References: <20260729191711.71217-1-richard.henderson@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260729191711.71217-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 1PZOO1ReCYMEjs1s-4YaFm6NaMvrLc9b
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDE1MSBTYWx0ZWRfX4fEgV7uYAK6x
 XrOOd9m+i+dK8NeomEN0P9t4Jn6At0f5y3/R1T13DoR2njVYOJ4ppukMCEwzYnzQfCxo5QgVpHJ
 GzbtdEx02BXxGfsJNCB8KWLN6zMDixM=
X-Authority-Analysis: v=2.4 cv=CuyPtH4D c=1 sm=1 tr=0 ts=6a6a579f cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=iLqgmErQAxjCjdq5jj1Aqg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=p0WdMEafAAAA:8 a=69wJf7TsAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=3BbPAglyjGhWIxXnjVwA:9 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
 a=Fg1AiH1G6rFz08G2ETeA:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 1PZOO1ReCYMEjs1s-4YaFm6NaMvrLc9b
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDE1MSBTYWx0ZWRfX5JYH0JCeeA7E
 u7GDWKyM+CM5aQpPtuznaN0gjnjbfEKiHlFu1GThVQIMerQjSn0y79dxLZp2jLCWtYPvIdti3FG
 W5FXoaOV4xYoq/6g/DY1eA65xU/BQZPOZPncLG/SerUo82QnRrKfR8H8MuAvCqL5wYmyosQQWwM
 EYTTcHa91w08yv7HvjDmF1XLQx9msvxrTuVMRyqa7O86x6CjirrUW88JXIRHp/uBPmn2XX4PQLt
 Iu0/W7s8uBo57iATWHFE0aP3NhFCJwadJXnNHj0w65Y/KK1G/RZQL+IGNJ7QXpIh5HNWt3b10gm
 ABIEjUtCJh9glXnih8HB/64LWCkCHXou4LxPSMJYZtVusDhm32u8zGgpOAv302zVoHwRTUpla+j
 ulNigbA0PfOyG02sFo6frWKMeD9crsSzjgfhgWIeKCtceLTnzmXFVbFA+1NoMc70gciY1+v1rMb
 QRhiub8VqrEMRH4hp6A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_07,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015
 spamscore=0 suspectscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607290151
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=pierrick.bouvier@oss.qualcomm.com;
 helo=mx0b-0031df01.pphosted.com
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
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On 7/29/2026 12:17 PM, Richard Henderson wrote:
> The token is not computed via TARGET_PAGE_SIZE, but via a fixed 12-bit field.
> 
> Cc: qemu-stable@nongnu.org
> Fixes: ad1afe433fa ("linux-user/aarch64: Implement map_shadow_stack syscall")
> Resolves: https://gitlab.com/qemu-project/qemu/-/work_items/4106
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  linux-user/syscall.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>

