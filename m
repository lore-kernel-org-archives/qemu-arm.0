Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0747C61DC2
	for <qemu-arm@archiver.kernel.org>; Thu, 27 Aug 2026 09:03:52 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wzW1E-0004M4-Ju; Thu, 27 Aug 2026 05:03:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wzW1D-0004LR-5a
 for qemu-arm@nongnu.org; Thu, 27 Aug 2026 05:03:31 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wzW1B-0003He-7g
 for qemu-arm@nongnu.org; Thu, 27 Aug 2026 05:03:30 -0400
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67R6RGG33039605
 for <qemu-arm@nongnu.org>; Thu, 27 Aug 2026 09:03:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 1+huZKkadA7OlJ05G69cEjDgZrqgP/nv5E3TAAxbORo=; b=SIGfo+3OaKMy5Qh2
 TeDgAB4bdyurrXWNoZHp0FjAVQUm7CBcNSIhoxxy8GUy8Bi/pLwOKLf8v/Npghmo
 5FvFbPTpbbzrkiE8lwnYi5eZIJSSXqqzZYLRt3v7Zy439QsX1ptcIQJ6btXteBLN
 VyQyLa7keDLpsQvsiLY2qDjChbmppiXzl8Uoh55XSxQ+LAvh/orbilAfMTXAhy/h
 MLFShQu8AoTEpN2INAZODdxzU17uagHKiCyfKaxTzPO2ys5SUTSpAAe1lnuIrrHx
 2YKMLwrU3HA/F9jhxoJ1Im4FTM0oNFIdaemRy+bfCwBTGqGKY0tohLa6B51GwFh+
 rv3KbQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ga03ac5dk-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Thu, 27 Aug 2026 09:03:27 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-52827090cc5so8764111cf.0
 for <qemu-arm@nongnu.org>; Thu, 27 Aug 2026 02:03:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1787821407; x=1788426207; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=1+huZKkadA7OlJ05G69cEjDgZrqgP/nv5E3TAAxbORo=;
 b=SoSHwJg1C75SFP96QpCCBMzDsFEZMiMAjFa6XGzL7F7lxLhY9c96+T/u2tf6g5LzWj
 zVAmSf2e5HiEJHXieXiV2jrVOomknOGSon6KJRG9Noy8wGQld/LBE9c4XDN9vMC0S8lw
 xYeDnvUojddGs49iMtllNiAi2AKi6hmfMwX5OBaHeNS7+RYkCxDRwWzSTFf5hhq4KhQK
 84CJAB3MLFAYHowgDeULywho8MO9WyE8Gl0VCYr96O2SuCHWjVEPUKDlSglF7byXi7ni
 0zBAcZRww4JGLYrC2Bxm+9mstBvmfDMXotkrZ879JbwU+Q03Dv/7udVncdBaKuPNmDQF
 H8Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787821407; x=1788426207;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=1+huZKkadA7OlJ05G69cEjDgZrqgP/nv5E3TAAxbORo=;
 b=jssB2EGwen0+xaBiGrdADy+5AV9XMzW3840ejLEvetfhyfwBBpux+/X8F9PeNfv+NM
 aabQ2TZBfGaXQnmj4xpxhCKfNMQTXKoFOEJwTIisT0n2bbruOW6JGDgEsHU0Y5eZiSuH
 6I4YpJjkJfvm9ZUnvjNH7kohYqFlSyBP/nR8K2851dLs8D7xtA9YV9uoOs9wiMGikAmw
 Y9phbDcBj6dOxj+QUcThvtJiPu7zAllh2a6IxVYN1z6Z+MgtF/R5g2zGtzs1dEBmAqw9
 rijc0LCqc49e498B2AxjH2vpCZozrSxJDSNVWqNrruSuGxpq1MbRpIrA/bGyi8FD9hwa
 qKKA==
X-Forwarded-Encrypted: i=1;
 AHgh+RozDLDlxrJjNPbTepIBewsEGsrJsWwrIicobKRb4cDoPylJ+8CPZmA2B+9oDbohBeBjAm3mnTyVvw==@nongnu.org
X-Gm-Message-State: AFuF++m7X1LH/78aYeIAf0qflelxRvGe3Dn3hG4lJLpHHhUkGuTZ2+TC
 7+H456NrZ+1RwgDU6H6eMU/b5lGCSBNdxpdPQhyteoRgL5FV4hvAhlF0eei6DuTqs29F9KSNVuJ
 1UgyFykDgMePozKwEKMG3r4Sp+Ne5e6P6iFGqgyyLLIF8cM2mocy0+s0=
X-Gm-Gg: AR+sD13KoFFgtcti0kqlBnCQWjHgRwemNpgBLclntVJYNfxJn2vPQYBnaW1sIHASnTJ
 9Vsopw28ps8lhXto4GTdjB4AAN4C8Byh+5yCBQuA8mEBOlrGVIOxX9xgb6EW4OmxrdNZhkIqto4
 IInhctTHn16v8qTOCyIoZhBbTym2R6NAiynyKGKnh1UyxTW2lFBWaEwuR7gPN0RQmwTeNkRsNJZ
 BRc4qOtPhkHH2aLusYfnoOviBYxPq/EB8sHiI6oec7GaQIB7mxh7lF1ypbcSoxVKB4oeK6U5ele
 vHv64cFoYtHUTtpYZTscz8H7Mjeu/pAFSEEoCOopAXETu8XZwrYxlbK0auUJbbMIhI6Vgov6wOt
 af0NgrovSojQFEV9VF4iSx4oDjuRWP0UXZ01qhv5x4X7UW0n3
X-Received: by 2002:a05:622a:4291:b0:52d:9cfa:663c with SMTP id
 d75a77b69052e-52fa185dc9amr55824931cf.0.1787821407254; 
 Thu, 27 Aug 2026 02:03:27 -0700 (PDT)
X-Received: by 2002:a05:622a:4291:b0:52d:9cfa:663c with SMTP id
 d75a77b69052e-52fa185dc9amr55824381cf.0.1787821406770; 
 Thu, 27 Aug 2026 02:03:26 -0700 (PDT)
Received: from [10.254.188.74] (164.170.88.92.rev.sfr.net. [92.88.170.164])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-482e28f5d01sm7795028f8f.32.2026.08.27.02.03.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Aug 2026 02:03:26 -0700 (PDT)
Message-ID: <a1efce6b-fa40-451a-af55-53ccfbe630f6@oss.qualcomm.com>
Date: Thu, 27 Aug 2026 11:03:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 09/12] tests/acpi: skip FPDT oem field test
Content-Language: en-US
To: Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Ani Sinha <anisinha@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
References: <20260824164751.1700783-1-kraxel@redhat.com>
 <20260824164751.1700783-10-kraxel@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260824164751.1700783-10-kraxel@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: l-8_w_t5CUC-Z3SGdJ4R1_fzzVMdbkxg
X-Authority-Analysis: v=2.4 cv=VdLH+lp9 c=1 sm=1 tr=0 ts=6a8ffd5f cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=T/Q9W4kDmp1FI4VDxy1skw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8 a=1tSEMpTH9XP_W59IOagA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: l-8_w_t5CUC-Z3SGdJ4R1_fzzVMdbkxg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI3MDA3NCBTYWx0ZWRfXwBhJXmRfOx/y
 f+KPdWBkYvGKfl/CqUsSXryvfdzivc0qoWSFciIsRW9fHrN0KCCxc0TydiumFHlL64xmYVhY4I4
 gA+2kJ3JE0ZWrxiKUXjF9SKED9obCfj2ud5qKlWI9l6RaIwyS1f321i4QC7UtnHsDQNv7aHs9EQ
 9p0+gG6h0bATE0/XOtlP/oN/8GolRZcOEmrjfXfnLS6j/D0+Ku4UzO9V+G6dM+bFwQ9Xf5vvqnN
 q+xzO573OCf8nkUO13mSGqbsGOvZH5m9bto6zU0TKYK02AfUrFLoY8gC+ocooz47zbjY9pOkLbN
 OneN5bpzPMA768hItjcX2DDywoUpPKYG4z6H5r6eH5G+fQiUkHibpXtHk8dDzy3T2xU6NGy4nEn
 YQWl7BQ+d3Vu6Nfrhj04cptV0g3iTG5FCw13Gmilg9JY9StnUdsPHYlZ+CD3nYa6MoUq34rlQgK
 3F9ezHnuuJj8bhchycg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI3MDA3NCBTYWx0ZWRfX7ACvi2EX0j8+
 WNse4YbuIjQpCX574pvEeBUlAnPX64ym7xZDGS+yxm8LolugI3zhfxYFcEYeXEoE0K8QVI+tlkt
 Bey0+gq6/Ke36tzqkTEerqq44N9riK4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-27_03,2026-08-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 suspectscore=0 malwarescore=0 spamscore=0 phishscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608270074
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

On 24/8/26 18:47, Gerd Hoffmann wrote:
> The table comes from edk2 not qemu, so qemu
> has no control over these fields.
> 
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>   tests/qtest/bios-tables-test.c | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
> index a85ca8e98253..ce3f770abbba 100644
> --- a/tests/qtest/bios-tables-test.c
> +++ b/tests/qtest/bios-tables-test.c
> @@ -2616,6 +2616,11 @@ static void test_oem_fields(test_data *data)
>               continue;
>           }
>   
> +        /* created by edk2 not qemu */

   /* Firmware Performance Data created by EDK2 not QEMU */

> +        if (compare_signature(sdt, "FPDT")) {
> +            continue;
> +        }
> +
>           if (verbosity_level >= 2) {
>               fprintf(stderr, "Checking '%.4s'\n", sdt->aml);
>           }

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>


