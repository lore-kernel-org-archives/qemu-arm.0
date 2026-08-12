Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3B51C5AD5A
	for <qemu-arm@archiver.kernel.org>; Wed, 12 Aug 2026 21:23:37 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wuGPr-0006nS-RX; Wed, 12 Aug 2026 17:23:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wuGPq-0006Sk-6Y
 for qemu-arm@nongnu.org; Wed, 12 Aug 2026 17:23:14 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wuGPo-0008Nz-BY
 for qemu-arm@nongnu.org; Wed, 12 Aug 2026 17:23:13 -0400
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67CK2xi4630151
 for <qemu-arm@nongnu.org>; Wed, 12 Aug 2026 21:23:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 ICf2YN7mJuZH8p0BVFPS8EgSyQwRCd3+WWtVkO84Axc=; b=k1vm7V+Fgcjh/h/W
 kfaAPvtob0Jx7UbMcWO86fymg+Vc7cVbNpwuPHI5PFY7uiT9u1WLf4uSZwLYlvoS
 iukUkDYQ76asbqbJasGTW3zBeS47gsclMxMUhgnJoU+F/u8Y0iY7Y/NgeJsokLGr
 qG+go7PsJrdGJd5Oh/v77wDkCElHKSM5jW555M9OKrRgcOdS7546EDbB0mQqw2Nz
 5IhQtG1vwBOIrtyurphFkbYsM2Ekd2Gl5dciOva7B/6QE1ikuDbd/3+hm24hBkV5
 htB5zetylv7QcXSW3TbU6wIg2XUOQAcKmp+joGw2lQDQRk5ODifyOGdb5RWGTIwt
 PnwXeA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g0jgrm2qb-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Wed, 12 Aug 2026 21:23:10 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-51a8db414c7so309321cf.0
 for <qemu-arm@nongnu.org>; Wed, 12 Aug 2026 14:23:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1786569790; x=1787174590; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=ICf2YN7mJuZH8p0BVFPS8EgSyQwRCd3+WWtVkO84Axc=;
 b=OTP95QYjOOTiX9kvzbG1C+Z/8Lw/8/+O4X9SN49x+tu4/5U1vRUKEBEuKC3itwHF/7
 UqA1Hdlcc1Yh2jwHM/sqTBvcpL3WL9nRY/JGl2DH+GpEJdtBCt3UQgTuiUpJ1sUmiKW9
 qKI6W2uFVRt4+6hx/3UTlsCViwIhEi0HCrgkPuynYxW5Cu/VtBAzrZkE/BuCuqOuwHwj
 ZQrb3y8Ds5PuZaHokSvaEpLzq/KaWiAugUD71aI38ilHVkNa//I4VZOUkhLwDboHMpts
 EP1wdsEEH8HET9P6Cv5E/H84eEZxnToSeAwL9xHis6Agq/oWLL+fYAz0c/qVPGvr/NVw
 krig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786569790; x=1787174590;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=ICf2YN7mJuZH8p0BVFPS8EgSyQwRCd3+WWtVkO84Axc=;
 b=HL8BUbS6KDbA1KyDYmaHK/0WerxRUvuxa7DUppm4nHkwZJ3oUaC1YTA+RiyJ8TDBmI
 S2Xb0i3xNv/FbBNHeAIcyLV/JKOnQX5WXDD5bSubLGsE/8F9FAeVsRYEikDopsoPaAjw
 kR/ZLVBlnpxMx9s1OK6kZinqr5GWVSkCdWypiy0AGCUE9Ttf0qj/pjTR2q5DeE+nOt8k
 iCh3RZGwK0IRB9fvVM4GlIOpsMbvKh23AoaB80CPobC8o8J6X/+6G+3CPrM4Be6PGgWW
 3YShsHgbQRs/40sgjvKNeVvQJrZztuHsgzNnajDZkDhlwYcKcbczqLh5E+dxPYg4aAWh
 QPFg==
X-Gm-Message-State: AOJu0YzB7eYXynKMU5/OUH0H3XRr2LtASvbYsc/XLm+JWl34ANyQ8qm7
 cxbThjMf+xYRJc8eNdV5wfNQd4qkrekQygRnsFJBq7Tda4eko1iMVmgdHIyS62zU3rznmFz8rP7
 epGQlcBwh4eKLYWq0p0sUErvD38y8a2YNmjH2DoiZa2l56dFF4pY4sr8=
X-Gm-Gg: AR+sD110nbXhUbGZHrYyLLAUTYPU8sy/P5em3ih6oKA49lbUiaXQdZPaXArcRdeYs4z
 EBAhqqVyrsas8H/+A+kgHKcODKqcYBbkB5s4Zd/UKwzoKayn4RhKe59GSbPqxeFGDpm/TzSietr
 4U6KDYuwr47kuS15OFDkdRRngLFIV4sgAoQND3mMCMlH3tBgY9Qhusd+6q+6/VJPPWDwA95yvXM
 j4ptMnbGDNjCDFKRyRqRiex21WqJ4rxQgELumDuxJAzUqpzJWzX5zIFU/UyTgiGwb1+fnHgCDI5
 k8O/1g8S/LzqMkqQy6NTbvIbovxuMtEgoc0997dOgCzVpPylH1R0/1/LJE41Se6/W3pgn+oz0Ib
 2HCu1OIn3qz5g4gBVxA3tdgkXiXtqPoX+mWY=
X-Received: by 2002:ac8:5748:0:b0:517:6d82:ceff with SMTP id
 d75a77b69052e-52d73c6f14bmr10187321cf.13.1786569790200; 
 Wed, 12 Aug 2026 14:23:10 -0700 (PDT)
X-Received: by 2002:ac8:5748:0:b0:517:6d82:ceff with SMTP id
 d75a77b69052e-52d73c6f14bmr10186901cf.13.1786569789798; 
 Wed, 12 Aug 2026 14:23:09 -0700 (PDT)
Received: from [192.168.69.229] (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49981e54b31sm5387345e9.4.2026.08.12.14.23.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Aug 2026 14:23:09 -0700 (PDT)
Message-ID: <c5dad01e-253a-444a-9e0b-8bc3f43b188f@oss.qualcomm.com>
Date: Wed, 12 Aug 2026 23:23:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/10] target/arm: Tidy cpu_max_initfn
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20260812204435.295067-1-richard.henderson@linaro.org>
 <20260812204435.295067-2-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260812204435.295067-2-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEyMDE3MiBTYWx0ZWRfX51e6QhalIQnO
 QKcwcWs4Z9ODQzTpuv+mREnHd32vZ6qMmV1VLjisgN+IJ8QeRx3+hr1xohKc7g8ug8HodDmIlcM
 TjcXYnZpfQmT9cTNLpgtRyy/R0PBs3rcNCELXDhoKk6Dry/FW8ooWPHVr6vpHjWZia35+k8u64q
 Lo1MUPUy74MZ6zf33cwoXQwDKQMY6zdQGvEuIG7CwbRYg57VsQPYG3NutZ4G6BrYNYsaQzMag2v
 ZvzyV2Viqd6oWx/Szd+gxhvEL7O8XBej73gY5QC1rmUnIzHZ6WTU518uIHXUbZJ7nEfBl7vdIrN
 7tDJBbLiB+Ngn+WTCv9fUsvog95PaQuZtKqz76K0Yzi+U7LGW9mvgCU8ufvTVPDXXk36PietC6X
 NJfcOYS+T8aorHTJmp+fISv7tFcWE2jLpDI6lPbTwvuCwgmHGqzvITCiaYUjJXOCUGHAYS+YTrs
 4fh8hLCtQ5L9hihNQiw==
X-Proofpoint-ORIG-GUID: B_TY30W1ZvzlH-rlfRJJBORGZwXd1Rah
X-Authority-Analysis: v=2.4 cv=TNJ1jVla c=1 sm=1 tr=0 ts=6a7ce43e cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=CSguRQI8Ln2yzAMP_ywA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: B_TY30W1ZvzlH-rlfRJJBORGZwXd1Rah
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEyMDE3MiBTYWx0ZWRfX1+KdM2VPzCXv
 4iNFgaTMbC4hlvA5qN6e9UJ+tdMs6Ycuow3tAkQ4HnlJO9gfd72CA3jI0vz3vf1RJYbrcadK5ix
 /pfPIpI/ubPoQRb3s3sjzl/3Sl7Sjeo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-12_06,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 phishscore=0 impostorscore=0 adultscore=0
 suspectscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608120172
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

On 12/8/26 22:44, Richard Henderson wrote:
> Once we have eliminated hwaccel_enabled, only tcg and qtest remain.
> Separate tcg from qtest initialization.  Remove an assert on
> aarch64_enabled that is directly protected by a preceding if.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/cpu-max.c | 39 +++++++++++++++++++++------------------
>   1 file changed, 21 insertions(+), 18 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

> +    /* Ultimate fallback: -cpu max as cortex-a57. */
> +    assert(qtest_enabled());
> +    aarch64_aa32_a57_init(obj, !aarch64_enabled);

IIRC there is not CPU in QTest. I suppose we are just testing the
CLI, so "-cpu max" doesn't barf.

>   }
>   
>   static const ARMCPUInfo arm_max_cpu = {


