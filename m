Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10388C43458
	for <qemu-arm@archiver.kernel.org>; Fri, 10 Jul 2026 22:16:50 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wiJWN-0002JH-RK; Fri, 10 Jul 2026 18:16:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wiJWA-00026f-31
 for qemu-arm@nongnu.org; Fri, 10 Jul 2026 18:16:23 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wiJW8-00042i-5T
 for qemu-arm@nongnu.org; Fri, 10 Jul 2026 18:16:21 -0400
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66AK3VAo1833088
 for <qemu-arm@nongnu.org>; Fri, 10 Jul 2026 22:16:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 C+VaTBawsyiLdlLuK9EXJtp5+875b1nSFubFDNiAN+o=; b=LUD4WvIBhBlzXR85
 X377vomCaJTRlcj8vm3vnPQZBLq5EEFDYuymYbNY51PvDDcvjunMmWQJn0YT5tS7
 P0DVnNWM/keWM5ShfKgDSGENk4J5d22S5NwwYCz3eTbP3dtZmoxzMrkznFccrjal
 idNpo+A8Dwwco6x/+gMgbXuxvuvFnHhAQbIyBTqwzdlvl/t1dgFpojeuXeLcsX/U
 ZDnxRhFTit+so0dqm25qMx9owwZmLRWXF4U6BCSdO/ysa6GqUEZbDM+hA1oKiVaY
 hJD18t6SraLvl8fc9jlvfg70HCrPQKVk7SnVAHjX1s6zP4WCSUsnvJALXxMe/uWw
 QS5JAA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fanwecgcm-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Fri, 10 Jul 2026 22:16:18 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-51bfe3fa93bso19192391cf.2
 for <qemu-arm@nongnu.org>; Fri, 10 Jul 2026 15:16:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1783721777; x=1784326577; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=C+VaTBawsyiLdlLuK9EXJtp5+875b1nSFubFDNiAN+o=;
 b=WSYABWYTiC2rVtUAmUBZmYLhYVfO/WOH1cvv1gMttUxFq1Pe6CCg78CA9tA5dK7xUP
 moN/vyNuVrXscS8MiARebYeK9Q5AEPTnVAHGUQHF8KItKQiSfuArgJccj3A2o6UTyKkN
 yPVZGkfmfIe+oF8miUfNtyWisN3iHT8BBiZT3ANDSvIVYUCrsXZBM3ILddwxh8OfO6nV
 +NhM2Ld3Qwyz/waRlM8xSiqQoimTybF3D0h2/Tp+qSLqXpYHdR2ea4CMeBMNYZdrsVXo
 NQCBumFJd0wWFYOc81kSi6sJl13bZ+H28I0GO9kpiSOd39BMpfhkAZqfJKzn+V9pKAlQ
 3VQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783721777; x=1784326577;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=C+VaTBawsyiLdlLuK9EXJtp5+875b1nSFubFDNiAN+o=;
 b=KZbaA/AfJaEnWhfYU6buXOcLpoaIgU7FVv5kJF37I/HTRuM1PC6yEddJB/XxyAs2XG
 UZ2wTSntxPE3GaZjL8CtpbJ3yj5JOKCmsf5EGQFnUqlwE9CkY8+2NzMlpi3In/+BerSd
 cO66ZlpPPyUokz9X+27kFx+97HblL0CTt540mKV9EDiqyzWPVfoN4Gs86b/6bO9Hy1vW
 L9Dtt0IZWKFVAA3m3t1PJK6anjUBBCcnK/9JE6J91RQ6sEtka1c03Iw5uEnFaNSXAjLh
 w7w6azf++0YDDl8OOIrV6cUDDuXWCpxD4Of73Sub+cG1cMrTDjuFGYSqo3pbkcJtzV5t
 XZXA==
X-Gm-Message-State: AOJu0Yxc9svLpoCgGM8v5sTYScoUSICULrPgrdlhs3ukssKPjPEuFAR2
 utqHUsYZjFE68WYKrevq75xMF+F3Z2qUs/1fK6mOAaDlUAm2+zqXMx/+JYuGTY/lDXrLipHvX1/
 af1KlD7upotthoxqjiPGH0aVNkHQvoaidU8NQW9NM7CEQKIXJ4cT1N4Q=
X-Gm-Gg: AfdE7cm2s4gV5UEmS37toq7fZAZSS2W6DEU2Rbyz9oGGUT7tN2elanoIzSola+1vbZ/
 gjslnfmJamg+8y4yy/KPCRkwwMGkHegHj04NGyfsLDg6DzSf0pJzUTzQhZ6NZ5yukMSmttJSbbc
 msbLeoaaqGjn89VFCmDgmFTfwg6sq18J3i7jAg6CPe8118DjSx3ICMm5RJqahbTvuilGyIkSCa0
 DnbD7AUDkIn9W0zLoUuzkmrsxaHEetdRoVLv1pE+LXxR7IyCjzt59Te5xhfkbT8oRWMyUW7rDjt
 eKr7/pJQQ2TkCm7MME/TBjwW+QOY5CdzIGr8dRv+mRUJLhhoW/AVIBbavKJHgEno/tOYXMfaXRu
 xhretcOINoVuOAOrybuSUuwSyFaFPqMs5FP35qCK7qyHEgqG3ZZp/z1ZQv3aO5Q==
X-Received: by 2002:a05:622a:1101:b0:516:e152:7a59 with SMTP id
 d75a77b69052e-51cbf280ccbmr8188561cf.42.1783721776981; 
 Fri, 10 Jul 2026 15:16:16 -0700 (PDT)
X-Received: by 2002:a05:622a:1101:b0:516:e152:7a59 with SMTP id
 d75a77b69052e-51cbf280ccbmr8188301cf.42.1783721776605; 
 Fri, 10 Jul 2026 15:16:16 -0700 (PDT)
Received: from [192.168.69.219] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493eb73b161sm150741955e9.9.2026.07.10.15.16.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Jul 2026 15:16:15 -0700 (PDT)
Message-ID: <242a93c6-8af6-4c3f-936e-2e8e5b34eef6@oss.qualcomm.com>
Date: Sat, 11 Jul 2026 00:16:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 45/51] accel/tcg: Move ALL_MMUIDX_BITS to hw/core/cpu.h
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com
References: <20260710205401.836304-1-richard.henderson@linaro.org>
 <20260710205401.836304-46-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260710205401.836304-46-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=LbIMLDfi c=1 sm=1 tr=0 ts=6a516f32 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=1tSEMpTH9XP_W59IOagA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=F4whdlzREtsA:10 a=kacYvNCVWA4VmyqE58fU:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDIyMiBTYWx0ZWRfX0nTu67hyzBDn
 WKGcnwQ4zDu8suO1RVG0FMfVUMabdtYuKf2pQ1Cp9ZHzeJXqXNDQ1+mOOGKc3UAu7ZhLb11lJTl
 lba5iPUQqyB1yqsE2mnoACEZnUW6lUg+5I9XCRlkyXx5UryHNA9JGApjxMgJf97SlICr7Bng4EP
 kD8uC44UburtCroKa/FT4YjWgJ5lGLa+qPFh4YHYKyTuotQOLI1T7sWzFT8+JoPyUuL1zuFWCRY
 S318UZo2H0062CRdytyPU1icLAK0aLKMl/odah0cq9bRMvhCa4dNQNlV8YfbR9QZBotlD12m3oB
 zT6xukjf6Eske+Nj328/Q4B+mFgfam0XV5c0352eBrxLMsy8/tDkUZjUUZ4zxl5vwJb+IQLvyAA
 cDEUTlV2nPqHO4VrfERB503DQI0sXjdBdaxTIqE+ywq4HRkU0GDSQesYYnjZQGfphnWvksWTYjD
 YnqJcN+nY96ozdXqcCg==
X-Proofpoint-ORIG-GUID: 2PWskTcWyVyPzVMf4dN5cGrpdYCwiZ27
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDIyMiBTYWx0ZWRfX5KlovOwvCts4
 7O3MUUruVwLHUNWo946EONpfqOfiPhBI5sMXayRP+4zMOFH/uCf1yVH4LlQ56ahnllVemlvYLRB
 PeBhARfcyLjd3xQ7ReFLQl/Y50qtgFs=
X-Proofpoint-GUID: 2PWskTcWyVyPzVMf4dN5cGrpdYCwiZ27
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_06,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 clxscore=1015 impostorscore=0 priorityscore=1501 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607100222
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
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On 10/7/26 22:53, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   include/hw/core/cpu.h | 1 +
>   accel/tcg/cputlb.c    | 2 --
>   2 files changed, 1 insertion(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

