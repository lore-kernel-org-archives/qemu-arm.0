Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FDCEC5DF6D
	for <qemu-arm@archiver.kernel.org>; Sat, 15 Aug 2026 13:52:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wvEo4-0003oQ-2g; Sat, 15 Aug 2026 09:52:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wvEnz-0003gH-W1
 for qemu-arm@nongnu.org; Sat, 15 Aug 2026 09:52:12 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wvEnx-0002SV-Hh
 for qemu-arm@nongnu.org; Sat, 15 Aug 2026 09:52:11 -0400
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67FDMWXe4013098
 for <qemu-arm@nongnu.org>; Sat, 15 Aug 2026 13:52:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 1JWImf+Dhv9RqeqR9XP+j0RUd7qOflO4VcouI/KZrK4=; b=cbInQVMMAUgMhWKz
 iTsnU43F1ROKkPfCcswmSZYpB1+J3W54Kn1UEDs7x6iFWBUSgHhZNHWX5N2tEbsD
 LSIZ41ear+HOvA1U2i9ujNUqd7MDZkB8JruzkMvDeQjuC6CrKjvOmduLlPTz/9sv
 f54M4X/PPoPrylI6HV9Xe93BgnVCmUIr3JOdCJSvY/RbmApqJKHOxk++glzY7vzA
 6eCpHNb82yUKna6K5kwpPECctIfuK2krWe0D/sjXkBRCx9gnmT4ZxBHLDfg6Cuat
 lvKmLYNJx3l+Sm19LYr4gxF/I4nNZMlnPxe1EJrujpwKWQwmmXUeq0ih1j0gbLxJ
 G6QvSA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g2h9ggyay-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Sat, 15 Aug 2026 13:52:05 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-930a098ea19so270251985a.1
 for <qemu-arm@nongnu.org>; Sat, 15 Aug 2026 06:52:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1786801925; x=1787406725; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:references:cc:to
 :from:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=1JWImf+Dhv9RqeqR9XP+j0RUd7qOflO4VcouI/KZrK4=;
 b=bVuOWzYYxzLqi4sTISEzhZVdMA4g9rVLcKdzEwg7y0VWU6MY8yCiatnmcMRSs/Ymid
 74yPwOnXUwcrsvKCk+MvLePZXUFi55MbdznyvhZm2yKQzvMeNBspiorhYqfpBlbUfEuB
 RkWzbnaOmQc91ba4bjNq7024OsHAWOQR/gFu+q0D1N5PHLtciwcJ+mQwMltp4Hiit3CX
 0pzoMEAkYwaMdGw6juLmBUZ1wGPmUITB9trvzO9utYMYk3otRbD/IDzChJaRureY1Rs3
 M9k2ajIK5HvBhtoASsIPSUy4ecFP6FkQkaD1pdhP/GRFVevFGyavC+O0pQ4mqP14kp8i
 4p1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786801925; x=1787406725;
 h=content-transfer-encoding:content-type:in-reply-to:references:cc:to
 :from:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=1JWImf+Dhv9RqeqR9XP+j0RUd7qOflO4VcouI/KZrK4=;
 b=o+TQk2fXb7deKAn5mbob/W42FUq02RKoqxDy1KVFqaYXpA8DB9nAhr1ut+yGNeS8wW
 OvDY/MmSS5p4WOz8fWjlNw3O+goYU5t0nhKYspaOxGx29rRfw7GO2KBoOSOvzb1CQYLs
 XSFhufgMz24IGFaw3ONpNHtWPTc6zbH/9cf0b30TaeS46xIluw+LObnlsPiwWtGPWyoL
 a/EXL1ejuCoTsQ2UrshGbLY+rW8pogZlKuN07xe3msl46vAhcBk22wMXiFf9PVQdccyQ
 uqIpmTj5r2WUGug0be7iV0TcJdKaSmDTN+Xji0ztWfj0drD9RLGakYYH6+ihgVXNXO5Y
 janA==
X-Forwarded-Encrypted: i=1;
 AHgh+RrtEzNVuDR519ExNicU1LhifEJQXlyey+15wjeO/oFuzEnqVD8H+S/QSfffOr9Yd4pVGRH3x75h2Q==@nongnu.org
X-Gm-Message-State: AOJu0YxbWQCRQ+q5PW3PsbyQ94/QJDJvsT++QGdWL+8crUEhSn4ZoWue
 P8YNBpl7UIkqZHtsVTyeQeMGKtlrVzDQARcRA78VT7kCurIpGpOhCxm+SRc6lddlDbY3MIb5XbM
 tDk98oUTENwOpmUL+0EkVMf3D5fEiusIivRA+SEyBbBVKjlE5BtVA/ls=
X-Gm-Gg: AR+sD13vOc4ZyZ/QB4L8KP3aK1TK1jtvvyOcNBRVNyKd34bDonTRiPhFkS6IpanwgWM
 yG3i8r7Ny9u6vY5jSZPlO1MIz+c1yVvi6aPM8ycgShshv4QbhQ9vXmi8mty1urIuk0h1XOg9lxk
 Mc1zy8gC7+TXnRP7Qjl9C8ZkeoFnvP8TMcAMl1XxxikO9Y1Bv7efobyXXrGTL2caBU2RHYUOx8v
 +dugi7cMNgPmKM4Tl4hU4L/V7nOrg8zHk7g61K7aGjzcrhifCD3IqtBqn0bRXoBLbgzI/z+4A5t
 Sx281o/0klzwTuYq8eN825F8nF2cXgu4ftprMuOvVN9ra0v9kwqgVpE6xy7TGsl1ng90QQwr3As
 7/8/s/67fC1UqWQ4m3HM8o2sXUsPzf/ZOhdU=
X-Received: by 2002:a05:620a:2889:b0:92e:7cc9:a888 with SMTP id
 af79cd13be357-936d1fd98c4mr1390222785a.2.1786801924834; 
 Sat, 15 Aug 2026 06:52:04 -0700 (PDT)
X-Received: by 2002:a05:620a:2889:b0:92e:7cc9:a888 with SMTP id
 af79cd13be357-936d1fd98c4mr1390217385a.2.1786801924391; 
 Sat, 15 Aug 2026 06:52:04 -0700 (PDT)
Received: from [192.168.69.229] (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4815f219f7bsm16844631f8f.13.2026.08.15.06.52.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 15 Aug 2026 06:52:03 -0700 (PDT)
Message-ID: <f5beef33-4e39-4458-8d2d-33663de77849@oss.qualcomm.com>
Date: Sat, 15 Aug 2026 15:52:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/8] hw/cpu: Slightly sanitize CPU API
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-ppc@nongnu.org,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 qemu-arm@nongnu.org, qemu-s390x@nongnu.org, kvm@vger.kernel.org,
 qemu-riscv@nongnu.org
References: <20260811183410.22428-1-philmd@oss.qualcomm.com>
In-Reply-To: <20260811183410.22428-1-philmd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: aIwvHVfWvlqnRooq8lhGlhaGBz9p9F84
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE1MDEwMCBTYWx0ZWRfXzqGCecFkN3HN
 SrvO6+DJYXQYeHjrMOCNaK1cJ36Hyzg++qqpcYjLhLrOXZ1aQ3i0eVJs7k5a5cgzR0dkhGLh2YF
 LERfe6MSHdjTzW7AFs6WixXq0nW0mn8=
X-Proofpoint-GUID: aIwvHVfWvlqnRooq8lhGlhaGBz9p9F84
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE1MDEwMCBTYWx0ZWRfXzYromBFj78gx
 TaZ5o/F7AxDJtjBWZvFlIdimoWzOjh2VlnL9Ifg049Gpq1Rolbq1xhG7ta64VbUyXXvhEyrpqfF
 zaIx+QgKTTQtN2moVoKmfCxlbx5Kb4Y6qWhX7XzAQYDMiynOWaPdVsglgXz2207FKQ3xIDXBWIe
 NnvcK0APdb1uvcZ3YjnLaJKuBrA66wW5Pw9nfV6mW9jzWHfj8ACX/LCW+LyhbgCu3I/T0y29Yjx
 o1DPy1uDtrN2rB8+4BgVrCsJFKWid5ennxftUL8Ku4BfNHC5dx5BxtQllfDvwBR8rD9NSebhe0K
 HRuQavjJ0rXjNkgvniICkLZpuvokzPIM4zWx4h0EhbN9KYz9rzEhc4Ni2aRwY1smCKiV2KITfQB
 QhuC/QVWevNuJjCz5PhFOR/fztCHSTb3UpeWOimK1329cdkTgkhKyHRnT2USb1b30907nekEKoX
 2UfDz2h3QMdMJHUwSgQ==
X-Authority-Analysis: v=2.4 cv=XM4AjwhE c=1 sm=1 tr=0 ts=6a806f05 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=Ql7IHVpF8h-uniIvIrkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-15_04,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0 phishscore=0
 priorityscore=1501 clxscore=1015 malwarescore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608150100
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

On 11/8/26 20:34, Philippe Mathieu-DaudÃ© wrote:
> API cleanups, mostly removing system-specific code out of
> cpu-common.c. Code churn renaming functions, in the hope
> to make things a bit simpler to understand.
> 
> Small patch set extracted from a series clarifying CPU /
> accel synchronization, itself a preliminary work to introduce
> split acceleration, eventually.
> 
> Philippe Mathieu-Daudé (8):
>    hw/cpu: Correct CPU_GET_CLASS() comment
>    hw/cpu: Include missing 'qemu/accel.h' header
>    hw/cpu: Move internal declarations to new 'cpu-internal.h' header
>    hw/cpu: Rename cpu_common_realizefn() -> cpu_exec_realize()
>    hw/cpu: Rename cpu_exec_realizefn() -> cpu_common_realize()
>    hw/cpu: Rename cpu_exec_unrealizefn() -> cpu_common_unrealize()
>    hw/cpu: Extract cpu_exec_realize() out of cpu_common_realizefn()
>    hw/cpu: Move system-specific cpu_exec_realize() to cpu-system.c

Series queued.

