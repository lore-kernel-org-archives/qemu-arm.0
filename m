Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FFBDC43458
	for <qemu-arm@archiver.kernel.org>; Wed,  1 Jul 2026 06:08:08 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1weo73-0003Wu-AB; Wed, 01 Jul 2026 02:07:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1weo71-0003WX-3h
 for qemu-arm@nongnu.org; Wed, 01 Jul 2026 02:07:55 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1weo6z-0003Nv-Ny
 for qemu-arm@nongnu.org; Wed, 01 Jul 2026 02:07:54 -0400
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6615lY1h137169
 for <qemu-arm@nongnu.org>; Wed, 1 Jul 2026 06:07:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 03lbUfOFapRoQ+YjVsqrc99sXymsQRv34vNlqajj9Qc=; b=AbNepSImJA41tR2q
 xJ9mH0EGKnP6uW+ft1EevosFQiKFcAiLuOROdRZ5YEtyem71I03J5V6NWdyTZcVG
 O6ZU6cUnmNbbFv+eg7gHo+NshNR7y9orUP357X05I0lgFJSKaTM+U1dJEUVkoN/8
 Lekgl77xokRZ4ITcoI+pTj2DqzsFRQFj8UhgqUJFrNa4FoSj83A8W5pLtt3oMNPC
 6YA+7J1v1x+N3IwO16tQsZ/uo3dOelwlEhhoe53RIID5zx2uAg/dhsN20K1y/rcB
 ze371mJdZvsO/0e0VvbDUM7OjgNoS9aKTHMRVBrsGMIUtYq5mB7socNUUI6Cb2A4
 JZ+AXw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4h0au24h-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Wed, 01 Jul 2026 06:07:51 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-92e5e38fbc5so33307985a.2
 for <qemu-arm@nongnu.org>; Tue, 30 Jun 2026 23:07:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1782886071; x=1783490871; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=03lbUfOFapRoQ+YjVsqrc99sXymsQRv34vNlqajj9Qc=;
 b=MRr+KQsXUQDP0KZWmaKsm6uSyLjhO+gUYXb4lgpQDkN2XSFAY+WBHMwdkSv3hG99vl
 taytvwKlQfsxSIa+34jU0iRozY6COqLuIjhteoq3IVv79MQ5csn6d+iieo4KdKCtzPOK
 S8pgPnzCTSMxB6coy3Y/eRljD0/EK7FgbsiT3hWgqoi7p5NhPK7SyZnCYpyCv2bQViLF
 mWDOHwIOi+1NmjhICG4viN0p39suq2SrsWTLfmpUv8uZ5wFmvt/A7ip67F0P7dJmyH7q
 +3aGr8D9K1o8RAF4TWvPqONfkKFqUURdFg4JUqBk/Xah8RdP4fnd8r7lpsga2dORQESH
 nLhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782886071; x=1783490871;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=03lbUfOFapRoQ+YjVsqrc99sXymsQRv34vNlqajj9Qc=;
 b=mLp0uBG/rg094vOVBxf30EoXHsDAV+cnN0Gu0o/ivj08GafeXUcxL6QJGfoMPJ84DG
 jg5EiZQITlnCyhKHkxWC2bt/k5WxkmSmlny0M7RxTm9wQNY57rAtbhdZz9v43nUD/aFQ
 VlHu9brPO3G1wpvXt89zscUKFTbfRrrUj3QZ0zE/J0dOUonnE8X0dxHseegHiV4dEGXK
 PKc5RO5wtxWsUvnLHsDUYgG4mHR2RSxBFmUS8/3Q/ofsxK2E+MHyTNz4sU8t1x/yQ3k8
 KyCRAZW27bgsWQ5uXEVHsq4aVp0HJhqzRXaqQ7EfBxMWY9mzI80IQP6zIZnzWFFktOtr
 jkJA==
X-Forwarded-Encrypted: i=1;
 AFNElJ8sr0R6MG5qEObbefKdREvyRDas8lcdbqVrE3nN0DhoSBvg+xV0ioiCGUlP6lBnx3KiXtIB2UfXiQ==@nongnu.org
X-Gm-Message-State: AOJu0Yz9fp9O6w+75Dn0MTAc2NHcc/9RuNbJjyTDBClcMf00WOlt6ASK
 ZN4O9amen1foognqQzZKkz5YqoCc41/0zF5MNtJuk+ex9mvHZL25dR2dyYLE8t+WTu671dRKEdY
 VCkhPCNze7bcw72TdzWAOqbdc4xNJtmgbYUoArfPJndaf5LPi2OVBJ3s=
X-Gm-Gg: AfdE7cmACUmEak4Lu2W6mJsP68OiGDkJUCzkz0KxJL+My6Jt9yN8MFU35qRan79gIQe
 UMpQ8F6cjprzaNvycpzA5Vj9tHFo7RnW/ZmBzvqfZSAPGB1vcgU2iJ5jd6s9dHnA6RhtG6QztCO
 L/F92j0TEwXjp8RLR5gbBkd1BkMnFKN4C+4XLg2cbKzIvQOqSBImTGx9465e5Jn5KdBgvW/k2Rb
 dub0m/B1svnsdylT3RL5UUJLVzxS5oQ+Io/jceWJyHl+vbzg2Qql389mhX1PgIJsTKqqGEZD+2i
 byhpFd1xX3jMRjrWiAUGFlRQ9TXD84xR8Mo3HNnv1iZYH+nTwh5+EyqYHY+qfzHjMuyHgCsH8TX
 uFNzFpGt2vLd1Q9nUmFrlbtXa0C5ZBAU4kdrGYAbIeD/SRgph7cMlkAaMeq0gXw==
X-Received: by 2002:a05:620a:19a2:b0:92e:64af:3e59 with SMTP id
 af79cd13be357-92e78530f8amr39809885a.67.1782886070829; 
 Tue, 30 Jun 2026 23:07:50 -0700 (PDT)
X-Received: by 2002:a05:620a:19a2:b0:92e:64af:3e59 with SMTP id
 af79cd13be357-92e78530f8amr39807985a.67.1782886070320; 
 Tue, 30 Jun 2026 23:07:50 -0700 (PDT)
Received: from [192.168.69.212] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4756636d2cfsm15673942f8f.17.2026.06.30.23.07.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Jun 2026 23:07:49 -0700 (PDT)
Message-ID: <fe48530f-244f-4f12-b04d-f6c3c5022e3b@oss.qualcomm.com>
Date: Wed, 1 Jul 2026 08:07:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/17] cpu: Move cpu_breakpoint_test out of line
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: shivangu@linux.ibm.com, qemu-arm@nongnu.org, qemu-riscv@nongnu.org
References: <20260701030443.1382447-1-richard.henderson@linaro.org>
 <20260701030443.1382447-4-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260701030443.1382447-4-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=OuF/DS/t c=1 sm=1 tr=0 ts=6a44aeb7 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=1tSEMpTH9XP_W59IOagA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: fmkg1TBRkMenl5Pydk9JXcX_uXr37RkX
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDA1OSBTYWx0ZWRfX3px2mx2Otf02
 zwMxJSNGckosBkW8KIUBSSv1C9uR2bmdWjeLH2mVzF2mW3WfKmOQJnOYGPvwUo2d1Qc1PTw6POH
 6H1Iyrrhc4M41l1JY5jn5k5wphuTMpk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDA1OSBTYWx0ZWRfXxxNtaEFo+W5E
 ahvw1dlj2JEgMXREecrNPRGtm5tvb1DihAHi/NhpUojWtuZ9cJkiD8YqV/DhUGF1qlY+hAk2rIa
 +/+LWum5mo88YFmYo7iWyTLQzZXE0lm/mSJVAUw4n+tJe64ADn4rTMLv7OBOZ6W4UZTiUWM9c05
 4d4zYXN35v2VHP+cSFCqZ776IAwXU9eIPj8bevm1/LpMGuP6JecKnB9CwUp7Ohad6yMj6OsdjNK
 MNXhE/SUCgMtbLghQGxaZqSrSBnfmUhoV/3gUJgx46kAbCiaBXqnAVeubgTYg2JOVMJEgzN2RrI
 j38AKH5SOerYQkXrt5rCKe9SZY25XeBh34s6JGxfBiJSv69RAxW14xewcEiNWzPOdy3modzXZ2b
 FbdURW5INS6s9NoJWwqkyrg/paEnuqmiiVYdqcs7DWpJNJUHU2pyU2MyxbRJF79/HLm7yDQvwdF
 i90+aTWLD9yh7aW2neg==
X-Proofpoint-GUID: fmkg1TBRkMenl5Pydk9JXcX_uXr37RkX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 impostorscore=0 clxscore=1015 adultscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010059
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

On 1/7/26 05:04, Richard Henderson wrote:
> Move the function to cpu-common.c, with the other
> breakpoint functions.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   include/hw/core/cpu.h | 16 +---------------
>   cpu-common.c          | 15 +++++++++++++++
>   2 files changed, 16 insertions(+), 15 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

