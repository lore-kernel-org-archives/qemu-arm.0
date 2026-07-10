Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77AB0C44501
	for <qemu-arm@archiver.kernel.org>; Fri, 10 Jul 2026 21:48:23 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wiJ2x-00024b-Au; Fri, 10 Jul 2026 17:46:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wiJ2w-0001wv-13
 for qemu-arm@nongnu.org; Fri, 10 Jul 2026 17:46:10 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wiJ2t-00044K-7Y
 for qemu-arm@nongnu.org; Fri, 10 Jul 2026 17:46:09 -0400
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66AK3OxB1894407
 for <qemu-arm@nongnu.org>; Fri, 10 Jul 2026 21:46:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 LU4qIQo/+FzXiuZJATdP9f/stxNyxbOIRRZc/MFDJZI=; b=okcKR4ceyee41Zg0
 RYWbvHawjrSo14+MWBXtAfYCLX2O/vW16w6nwzeXVBPpkKH1Bv8M82bCbuTZ3B6r
 5imomVDhIIcPtvWSe2s7FumjrOt6SRjLRsEoe2dA/yd34TGaRGgnJmNT+E4COcSL
 PCC0Rz5Nz8eIy4rtwK+DfOPKznS8i19w1G2Ojh3bK14zyihmbNAIuUlU7l8ZRY+J
 drIRoSa9H7LCZHmpnHxWkKfRZ2bTGfKCTcWEgoez99WwWWqB2sHKi+Nj65AIG2Mf
 +jR99L41zwJb1BDc7DxZkWRs4gVrqJ7Ttd00f9VmbXPID6ueuGWwbfqL6rlnlJ4W
 gEQVCQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fb3xvs2ur-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Fri, 10 Jul 2026 21:46:05 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-5174a236220so14605561cf.3
 for <qemu-arm@nongnu.org>; Fri, 10 Jul 2026 14:46:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1783719964; x=1784324764; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=LU4qIQo/+FzXiuZJATdP9f/stxNyxbOIRRZc/MFDJZI=;
 b=injb/+ZDwTyu+qGp4YaqnnPMMTea2A+g/Wsw3LDqc+he+l082pb5mgLooqvzYP0JT1
 zboaydHN15GzoZezSmA/9UjmHgaI4GSX6YMXhnCpMcW2gedb2K3Slf8I4fpfiV4moTQT
 u5K/AyN3XAlVJ4YNq9KKVOHxMBE85Awe5MR/0SDYL9mSHwcP0hjlkqgJy8ZdMXiu9z7i
 Isu1fmy4wrT3P0eEsiAA5/YOhvL8hsaxNFT1dGzDyiVYRqZ9v6QNjD61IZHHomgoVSRN
 7SThL7ycIZ7ibgHyoxu4poL/UfwRDPcZD27EGav1WN9e1eBT4CNxjBh1e6DGsfM56qZE
 oS+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783719964; x=1784324764;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=LU4qIQo/+FzXiuZJATdP9f/stxNyxbOIRRZc/MFDJZI=;
 b=K1zVJlFDHpFSVn1qtuOvOJaJbb7HDLTE5VhCyaIzoc8JEbfCkcKlXRXtefZDwp5CTR
 fDlLCgG6r3A/+A79wfdRB5UQ4BivS6uYH/r2hJQX+j1jdTq6Vx8ZjT/fViQO+58E80bu
 pXUb2pmDgjgkox18WbJPIQqbrqmrO2tMNqbs5nWUOiV0hHH/69b17PLsqqAKno1C+LGW
 UDV0EaPa8MN1HADm45y+HY8G8CVnF1DEsSFB+WzE5NK3J2aAVJPcPujulKt045Kj5bI0
 9Jej8keBFxgzuI/wxW87P0madsAvkvtXwecDuqx/XNsqWXjWgUCkqpMBbXjCR4RHSG5U
 cecA==
X-Gm-Message-State: AOJu0YwdB9D82dnKLGzz+dnh3SUlAr8vq85SMRKN9RcCP+2iphq48Jc/
 1fhPPLKDzfoOhJisKnzEwk5eCaDEYCR+v9l3b08Q3DsteSZliYQqdZ2dXHkxfRsehNQE1tayb1O
 037FnOdpsAFuuBZEJ7BxSgpPDQdv7FPIytpvnUTJ2qQADWaZ+9uweJ1o=
X-Gm-Gg: AfdE7cmkL+vgcVfjjvVpDO55ibnO3+k8nlZgaT6qu3Y6Btq2hyE1h/SRagAdZl6tn5I
 MPYCBIdBbVWmWC54SHtk/bXZdGU5UVO2B9KMTLYkcPZ0+twjsvu5isEUlWoDPcIPWozvYY5IU6w
 +SmUneZbDLSfpso4GKYDbLRMNchxL7AiDQbQfdK9+ga5/daCbp+yqjFIvFxPN6ttOlOTSsResIZ
 OdHVYGw/80wHz0NL3Bp1lMn5FtK67Gp0kxgpCn713c5qx9fpzT+H1SO3AQG63Fg95lkcJNI93wf
 /uL92bKC2wKsKRZQjFpIS80Uh9z2QaBTUVRuo/XK7mER+Stg5ZFDv+vqPWIZsrofVrsYS9pmuDr
 LHqiPHsUwu4Z7xbKAMJGSpb5F5Yanda0=
X-Received: by 2002:a05:622a:1f19:b0:517:71d2:37d2 with SMTP id
 d75a77b69052e-51cbed6d58bmr8436821cf.0.1783719964444; 
 Fri, 10 Jul 2026 14:46:04 -0700 (PDT)
X-Received: by 2002:a05:622a:1f19:b0:517:71d2:37d2 with SMTP id
 d75a77b69052e-51cbed6d58bmr8436601cf.0.1783719963955; 
 Fri, 10 Jul 2026 14:46:03 -0700 (PDT)
Received: from [192.168.69.219] ([88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493eb6ccdbbsm172404615e9.3.2026.07.10.14.46.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Jul 2026 14:46:03 -0700 (PDT)
Message-ID: <111e1ab9-dd7b-459e-836a-ecefc7ff0b74@oss.qualcomm.com>
Date: Fri, 10 Jul 2026 23:45:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 04/51] qemu/typedefs: Declare CPUBreakpoint and
 CPUWatchpoint globally
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com
References: <20260710205401.836304-1-richard.henderson@linaro.org>
 <20260710205401.836304-5-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260710205401.836304-5-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: HmNi8UDt4cUVvv6IyJHuKuDBvhhAPbDR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDIxOCBTYWx0ZWRfX0fLkcoAVk7v4
 Ad9nUYLUoG6eRkyD6ryic67Cp57AwZxT9vYrH5qU/YU7xrJunLZ7qMbWjVUpgF88kaGz1GShFGT
 deie7PEvDlgJ33cz6FgoiF5GtniFO6n754fknK5CEa+2ifkQDZxkjMyjSwjTEW2TD/iRHVGmDDw
 A2GIt/vDF4SdLWFtF8emwVduItHa4gR3732M9A/iDuW4n9Vlj11qmsnEs6Um23J5KBhdop3mh3i
 dqWhbo2hTseF4aybiQmz3FBj2ATk5lu1RhhTFaiYwySDIh7L2nNIiub2IviakQCP5BJj/O4NBmE
 kP4TCEQ9gckNUIa5VCVXM2ss4t3wt0ORWNKQzI6Nlj1K5VpZYAdimdOCzBwxLJ+QS2UtgGYbyHw
 feOiA6/k3iKFJu6CYwwa/+1Di9VE/Q5U75S7X2z8d6JSSl87ay9EkA9A1LPNb0jp2O4exsnxKGm
 4nGlHgnlreIrDjZraMQ==
X-Proofpoint-GUID: HmNi8UDt4cUVvv6IyJHuKuDBvhhAPbDR
X-Authority-Analysis: v=2.4 cv=HInz0Itv c=1 sm=1 tr=0 ts=6a51681d cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=1tSEMpTH9XP_W59IOagA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDIxOCBTYWx0ZWRfXy1k/BPrKIdjn
 1/QyglcAMdYsoofBt4T18oXChysabRI3fZFgjCNatFSffhOjzr728fgxI2Vsh8k87ZhfjSZWvEt
 sQsKboYMyXVqHcD5ztywOb21loDCtqM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_06,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0
 bulkscore=0 phishscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607100218
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
> Adjust all uses of 'struct' in the uses of this type.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   include/exec/breakpoint.h | 8 ++++----
>   include/hw/core/cpu.h     | 2 --
>   include/qemu/typedefs.h   | 2 ++
>   target/arm/cpu.h          | 4 ++--
>   target/i386/cpu.h         | 4 ++--
>   target/ppc/cpu.h          | 4 ++--
>   target/riscv/cpu.h        | 4 ++--
>   target/xtensa/cpu.h       | 4 ++--
>   target/riscv/debug.c      | 4 ++--
>   9 files changed, 18 insertions(+), 18 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

