Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60769C61DC2
	for <qemu-arm@archiver.kernel.org>; Wed, 26 Aug 2026 08:04:33 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wz8c9-0003Ef-SP; Wed, 26 Aug 2026 04:04:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wz8c8-0003EP-EY
 for qemu-arm@nongnu.org; Wed, 26 Aug 2026 04:04:04 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wz8c7-0004BD-0l
 for qemu-arm@nongnu.org; Wed, 26 Aug 2026 04:04:04 -0400
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67Q6RiPO3783742
 for <qemu-arm@nongnu.org>; Wed, 26 Aug 2026 08:04:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 8stbU7coVPFWK5rV5vmHK2x7DwLHot1PC+Kd9m6+rNI=; b=h/JwNaBJ9FcRgU7o
 Upyxufp5H5EhvQPFDnic/vee0iXChuG7uBBMezNbP/3syu4xRzdQkVLvMhJprJvg
 piZaLT0p1IBSWerY+hol1+CZPbHnfOje1m85SanWrckClEK0RSO2uIOXaqcnE8Ub
 LFTOEZM+NT21vnhxWXoZD13v/Ik9A6PmD6o2QkhH1Ps3PJRF9KB6UG8R0znOUuqk
 jrT/JGDou44nl14oJ23YSJGZtGWWA+4ke+Tk4MuPKmEkA18jk+zieJNIuzZxs8F+
 aZSCMfO2wcy24p0iLItXcmrEvTGB6NnVsLP2OI9pPGNgGFK+nkqo+eVGy+5RjgE5
 +egezQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9s9g8t1x-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Wed, 26 Aug 2026 08:04:01 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-52769fc3f2eso9614951cf.0
 for <qemu-arm@nongnu.org>; Wed, 26 Aug 2026 01:04:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1787731441; x=1788336241; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=8stbU7coVPFWK5rV5vmHK2x7DwLHot1PC+Kd9m6+rNI=;
 b=jxF4kjvFttSZfs1MRYIMISnCTMyqwt0qSWKR9D5LwsfFySsf/El6ASIuU1TGuPg3gD
 rtPaVGuA06bBchXOFdLa3cBFzyadud3eX5Wq5/o7pB7o0cUNA5RG9VcS/RnScsTJk09Z
 //stEhOHgwrvb1joVZI/Gm4U/Aff6B/VMs2iY0hxDUb5RZYkWnZtW0EnHih0p2rrL6oD
 /8Lpm+2LomDX2ZZCYaB21CMTo4/9Nota/xJ3zAfYyjrLJUN9JlkUxgGU84NxDo16DRXj
 Fny46DZjIcUw0TQSby+HWNU22t28mfidGYQUgFsLeH1TThmEqP842BoIfBF9Vb2P/yc1
 rgmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787731441; x=1788336241;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=8stbU7coVPFWK5rV5vmHK2x7DwLHot1PC+Kd9m6+rNI=;
 b=ljIkk2x/S3h0NfAL1LwuLBlAN+TPMBHIzIuuEqAkZoJ5bVk5t2vPp9tpUfR7VC2HHR
 qXyfVumdESpgBa20frtf19GyLLdAmQCHorSRbROmKo2/jmSrWadqrO7Vgq81MDaZ504n
 CHkEGatwh6KUduXwfaGedBED+rWWqU0gxUCyVnPSuWu8KjV4hCSvzcDewcWzYhN7OX++
 Gs2NPl/oBCCGIKeJDbcnwcIocDOuHOuTIqB9a+lk1n2GEq/ZJli0BrqjDJsGqWfjDoij
 X6EXApw99FX0CYo682SBo2uPGr6e6bdqg2qhbPoakICbxqLOX/HGrURs/GQMpkpJys2w
 ROog==
X-Forwarded-Encrypted: i=1;
 AHgh+RolKpY8g+XvHIzlNfiBwmXPUQrNNdAs8+kidP/nHUuz8lsFdktxpaFy7klYgdIu9Etn6Ks/irpNww==@nongnu.org
X-Gm-Message-State: AFuF++n4vR1qH9dvDTDRqIR3bkkTTUKAVQNX/RTxFxAMd9GK3zLWWkcA
 4fVlqw/Rk++H3xBhk5H0pqm+4EIRQr6okLUMB1dyXIoEeQpW64b+gkj5JOwKyS/GeWqxRT96Zej
 KwRwmV49kWs4LQipU74MKy6179FGKeuX1G0VVJIfEJnGobYrhB8c0+rQ=
X-Gm-Gg: AR+sD11nDalFyeovtnQ1dEXPlYwXNiZ3Cy8jxiDK8vuO7ySEl8fLZ36r+UKY+yn/mSj
 RuTaBCa2ssiUboRIoeOK7lnTKi7rYHnTOrzu8M1kq5w7TrtscmXE7JsN/+i2XkxmqZXZotNqZRG
 AZEJn4jROIUIChT76q3Rp0hw4YkOHRvFfyyluC7Gd5WhlaKx9e0Y3cHJQJC/l1BFDFQgi0FhLts
 aWVzmQeA5gV1jncVjmg+67ztCevdKz3wj+J9rrx0KvtBpmX4R/uaFiEmzvQqDC7hmjHKqPb1HCr
 KPsiGXxudCpDM024qImGrvsdl+zCMRyK97HCAkCzhh2O4n2ApaygXtuepknocfF80dLlq669W3B
 U3mUcUAI116zDt7K7ObL+gwTYw0XZvXJMcPxeDJ7mVmU=
X-Received: by 2002:ac8:5cce:0:b0:52e:1e8:220c with SMTP id
 d75a77b69052e-52e423233damr50070151cf.24.1787731440495; 
 Wed, 26 Aug 2026 01:04:00 -0700 (PDT)
X-Received: by 2002:ac8:5cce:0:b0:52e:1e8:220c with SMTP id
 d75a77b69052e-52e423233damr50069741cf.24.1787731440032; 
 Wed, 26 Aug 2026 01:04:00 -0700 (PDT)
Received: from [10.254.188.74] (14.89.66.37.rev.sfr.net. [37.66.89.14])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-499dca960d3sm18159035e9.4.2026.08.26.01.03.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Aug 2026 01:03:59 -0700 (PDT)
Message-ID: <237baa03-8f31-4be1-946e-b2c9a83dd0e2@oss.qualcomm.com>
Date: Wed, 26 Aug 2026 10:03:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/8] hw/sd/axiado_sdhci: Add header guard
To: Kuan-Jui Chiu <kchiu@axiado.com>, 163wangjack@gmail.com,
 qemu-devel@nongnu.org, peter.maydell@linaro.org, qemu-arm@nongnu.org
References: <20260826074635.2850931-1-kchiu@axiado.com>
 <20260826074635.2850931-2-kchiu@axiado.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260826074635.2850931-2-kchiu@axiado.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: UWyveabX2RTjxHx-1jJthmjiL_d9H5Z4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDA2NSBTYWx0ZWRfX3vMp+rLbF590
 00OuoYVj/oVLXOyRAfQnQUvrdz02S57No5Gc5TH0prbJha/nSlNDATBGMO6/kXqwaAC0LiOoV2V
 7iAejHIa0dcVBJjP+CxVtO5do9M/L0qfz1/YgxAsyAopc0nZHJbq+ieGhywtKjYrHmtQW1kV9Rd
 57EorV/H+V8o077L00f3+YJEjDz1YpUXsfwqeY8IUNuRVWe2hG/HyZMxt7UdKEq+aVEhfIv3IyR
 h/Ee+nh8s0S5NBRXT69WKOHlA3eFLHXOeK5Lj6svWIq+4G72UAn1K3nJtwmx9nwU+tqxS3Lqk2P
 SwV+gAdbTmj4BmvD46kTSpe09oMHNT/Xt3dq2Zo7Y6Ifl1pSt34dGh6a7VWfNlqHjHyG7aAUYpS
 V1PgAcuW53ZNoNkK9og6VM4JyOAAXSQHfVmR2z2JoS7A2GlfMNJzNSpDVCG9RqiF3gDs4TqgWSU
 5by3Lf3nBGZfFIhF3TQ==
X-Authority-Analysis: v=2.4 cv=Xfq5Co55 c=1 sm=1 tr=0 ts=6a8e9df1 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=JQZmDyB7+sUo+n2VpL1TLQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=440cDlBIAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=1tSEMpTH9XP_W59IOagA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=_YfxY8EcIqgA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=d9D1X1bx8dWolqnE4HNT:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDA2NSBTYWx0ZWRfX9zmOVOUgI6fc
 ohsp/F9L3YHKvDhl16UPAkO+43NuLbF+NkWQci64zasFBpgAussnQjo0QzyD+e9w6krEFoQiRDY
 NOT/WMVBJ2MV5wU9QxRnSbYIu8B0Yx0=
X-Proofpoint-ORIG-GUID: UWyveabX2RTjxHx-1jJthmjiL_d9H5Z4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_02,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 priorityscore=1501
 bulkscore=0 clxscore=1015 malwarescore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260065
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

On 26/8/26 09:46, Kuan-Jui Chiu wrote:
> Signed-off-by: Kuan-Jui Chiu <kchiu@axiado.com>
> Reviewed-by: Jack Wang <163wangjack@gmail.com>
> ---
>   include/hw/sd/axiado_sdhci.h | 5 +++++
>   1 file changed, 5 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

