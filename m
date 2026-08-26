Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05B07C61DBD
	for <qemu-arm@archiver.kernel.org>; Wed, 26 Aug 2026 08:06:49 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wz8e1-0003o9-Lm; Wed, 26 Aug 2026 04:06:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wz8e0-0003nr-UQ
 for qemu-arm@nongnu.org; Wed, 26 Aug 2026 04:06:00 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wz8dz-0004f3-Cs
 for qemu-arm@nongnu.org; Wed, 26 Aug 2026 04:06:00 -0400
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67Q6Rgpp3794629
 for <qemu-arm@nongnu.org>; Wed, 26 Aug 2026 08:05:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 gvcuRSlFQrnSwS6kBMUwE9Ye6d2J3ech9VHVS19Ro3s=; b=BWUYTpq9VVngo7GQ
 nDEX3HRhDmGLuQpt2ffaixrkgHJ3TgGh8xuC0KMBKjE/+/QhoASr2LGkEZbvg/Mp
 xuBP+oaCRIUCPNan+04/urabLwml8kRmoVSaprSBkf/yEjuoHr2sLpuH3aW6YMzF
 j8vsQpe5OZPN8RSVwH95/4Kf5x2Z+I1eCgcwKOB0F73xJRLL3DxrJxf/3uVI3ygv
 SJl1YECjcMNl/ESMJjzJhAWb5au6Nd2Jfk3pAzXQoTSUyqD+fVDGcT4heRbfdnwZ
 oxuuEw14VXQyOTz/kgXBtvW19yld0EGXsljpiq/vNrG7QtM59JpehxXmY2KnFpW7
 1OettQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9smx8qu8-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Wed, 26 Aug 2026 08:05:57 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-90c8cb9f37eso6368776d6.0
 for <qemu-arm@nongnu.org>; Wed, 26 Aug 2026 01:05:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1787731556; x=1788336356; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=gvcuRSlFQrnSwS6kBMUwE9Ye6d2J3ech9VHVS19Ro3s=;
 b=TOdLjhdG8qzTYS2/wb7/YFgryQRNxf+z3wWpPenPtV4Vznvcp+sMUJYrC5jUvTJP6b
 3Oi1wUkcqoyiDoX3qtV3KvcE3iXd0I5PtUk72IOeqjgrBSmwZ17LuCYKtLyyCPSw1tW7
 hrWutqVQ6ZTxgW1hHyMnAA55QyktGKhv/5t3+nGg1MHgRPy6HkIlYsDUmhshUMFDJeGY
 BTaNzSOy97O64tnBGSPfVEf99lZzsA8g2lNP2XzkZcYR8syaen9X4uAmc3q/mfg2hCa7
 oLfSeg4XJc5RwgMSIDXFqP6Re/bBAh//yFMc8/MT28MwkpJAkBOqu/ul1x0o43Aa6e6k
 THHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787731556; x=1788336356;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=gvcuRSlFQrnSwS6kBMUwE9Ye6d2J3ech9VHVS19Ro3s=;
 b=jU2EDCTFoDpFmo0pnGBftuhpR5shZilz232Y6h0En9D/COs8n32/Nx4K5xzgYtx6sm
 ZdSqIKBAjY3hTAvWAw070D5be/zR/r5K5a744/zl3JXaYZjX25yScDaONHQ1fRO2iAi1
 rz+iVDdNSfHULE84jbbpIVBsg7QfYb6M7qdQl687D8XEyR1PKYtmnb2DkByhB8GeX44v
 QsF0Sk6wGdC6KVwphQUcZe1mU9/yuWGStuTuISqGGab36XyDSKBsedxxsG3tf5SQGti9
 0CH6VYbDfIhCSvyqVH/BHAfWbrl7jUodXRFAbepz2V+OkWOBhnCa3bH7cMhrreOfxayE
 tTlg==
X-Forwarded-Encrypted: i=1;
 AHgh+RpVjAXfcCA0Ic0Sa4O5ySnrBGGTDwZ8wDEUsQVSkx2eYjeM9mHxJw6QrxHobP8WN0mpawS6wk9ZAw==@nongnu.org
X-Gm-Message-State: AFuF++m0lBYtv9u04mIb0KrNuGbdralCIZdZ+zV71iWawv0/TtuVs+5X
 6SyMYZFsWdGYWmODPvjsPx4ljodxaf37Th8CcIlbHLLWPUlY/GbKJGPvnn5rucG6be6rku3zd4J
 ThMg5nw+lFCc84rOhEQV6nrL1rhkZwRzbFU7rSzL+t0Zju34IcBHeGPA=
X-Gm-Gg: AR+sD12yWb2TUfQ+ddtFpVzPGb+YVeH0Rh2KO9RD+rjruBiXP36GJV2DhtGbz2fwdpV
 9B7phWbXKbeq0bn8yPjdHIbJlQhfJNwpfmJLjIfGXgme/hxwmZF84Oa8iB8e4MkEq/yNgtZcg0q
 pCvjdP//swSNgjNb02sQpXJq4SGkm3WUV4S2MQvmofUahLuDhVUTsDFHw1j+p2/HhJFen8ow/Fa
 JC8Lm6pjVGbYRdcMsYikzehe23gVBCmGO9IUr9vx/T4+PRPFVXOvkXeZDjN/5k7YZUPGRYYd9fT
 5LQyaYrUG9ZjiAHTv6x3csavI3OPTdja31NbherhrZx5HvYuCMspZeM+YOB7pNYXcrtM3P7DeR9
 oz7DXqscv9ElHOpL3LDOdmnAbuwPNx0p10nckSlEqVIU=
X-Received: by 2002:a05:622a:86:b0:517:6d82:9aec with SMTP id
 d75a77b69052e-52e42052300mr47903081cf.0.1787731556498; 
 Wed, 26 Aug 2026 01:05:56 -0700 (PDT)
X-Received: by 2002:a05:622a:86:b0:517:6d82:9aec with SMTP id
 d75a77b69052e-52e42052300mr47902751cf.0.1787731556030; 
 Wed, 26 Aug 2026 01:05:56 -0700 (PDT)
Received: from [10.254.188.74] (14.89.66.37.rev.sfr.net. [37.66.89.14])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-482e28f25d4sm1918497f8f.30.2026.08.26.01.05.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Aug 2026 01:05:55 -0700 (PDT)
Message-ID: <db747c26-1fc6-491e-a0b4-0252b5f36847@oss.qualcomm.com>
Date: Wed, 26 Aug 2026 10:05:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/8] hw/arm/ax3000: Specify SoC name in header and
 variable
Content-Language: en-US
To: Kuan-Jui Chiu <kchiu@axiado.com>, 163wangjack@gmail.com,
 qemu-devel@nongnu.org, peter.maydell@linaro.org, qemu-arm@nongnu.org
References: <20260826074635.2850931-1-kchiu@axiado.com>
 <20260826074635.2850931-4-kchiu@axiado.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260826074635.2850931-4-kchiu@axiado.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=O/oJeh9W c=1 sm=1 tr=0 ts=6a8e9e65 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=JQZmDyB7+sUo+n2VpL1TLQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=440cDlBIAAAA:8 a=EUspDBNiAAAA:8 a=1tSEMpTH9XP_W59IOagA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22 a=d9D1X1bx8dWolqnE4HNT:22
X-Proofpoint-GUID: vvf0h_TsDf-KLnjzUxOeGa7_IgF1mOVk
X-Proofpoint-ORIG-GUID: vvf0h_TsDf-KLnjzUxOeGa7_IgF1mOVk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDA2NSBTYWx0ZWRfX+zlZpcznmq1H
 AuDnu3RL+R9MW4KNO9nwPQvFygLtEdG9qsxL8d8xUALTmtq03K3PrhNQtRcGdQu6LAyEkUk/9M0
 bS55RsQ3iuYGh3TO4CLMe2FcHt29lZ0tyxCBSMU52VJQAhl69Zru12s755TEYAKYbaJ5Z3X8RAo
 +WrRUSZ73BBriTPz/6G+yyKWmP2Nd0HawGeE6DeknCg4z8WaPkv0CtaENrBW+DAnTwxwp2EwKu5
 i/CtuqURiUUrJdBr6NTRF3hLPeXlEoUghtRALiT5c6eHqvhMoY3Bz120woS5tpi3HHTIzFMG0kD
 6Rrf27vurdhq5ElQ0WYba1zTU2/uIXAxhS/c6HOFuxa1KcWgqF1A7TI07ZQwI6HOphgH5o/vCK6
 i778rn0qoiNB3FBartfiZNbvfz7M1NBfv+Ia1ISO2ggQzcPFcgjIzsCvv0xFybTV+dYBuhm4yBR
 A3IA+jAW6X/V1LjSSfA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDA2NSBTYWx0ZWRfX6Po+wRHTQc+n
 XWojp5ePvONqf74/eVWWs0MNBojuV15NpM8kw7wRqg9JOy0b3tOrrbsKkDAsIPOyuyUnOOgKa40
 aIXkL9L3ZSuwdYW6Dkix6rp9EGdBQv0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_02,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260065
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

On 26/8/26 09:46, Kuan-Jui Chiu wrote:
> Signed-off-by: Kuan-Jui Chiu <kchiu@axiado.com>
> ---
>   hw/arm/ax3000-boards.c | 2 +-
>   hw/arm/ax3000-evk.c    | 2 +-
>   hw/arm/ax3000-soc.c    | 4 ++--
>   3 files changed, 4 insertions(+), 4 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

