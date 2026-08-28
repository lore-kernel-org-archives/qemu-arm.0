Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1155BC61DBD
	for <qemu-arm@archiver.kernel.org>; Fri, 28 Aug 2026 07:31:00 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wzr37-00043F-V8; Fri, 28 Aug 2026 03:30:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wzr36-00042s-AA
 for qemu-arm@nongnu.org; Fri, 28 Aug 2026 03:30:52 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wzr34-00057N-Oo
 for qemu-arm@nongnu.org; Fri, 28 Aug 2026 03:30:52 -0400
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67S675S01630590
 for <qemu-arm@nongnu.org>; Fri, 28 Aug 2026 07:30:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 PluVpFDua57aNL97O1v9dEqAafYRkfrTz9xh+Fkm2aY=; b=QIdyeIqrVFV9C9CJ
 a6FDO5awBzoPxLc7O3+IULfRV0D1/95m/BUWeZ676EvThpVP2bdPtbkpiXuEqzed
 dlNDSlilhv/hMA0gsbIYsBNL2Qf8LtdO96M5RUQqWQB+e6cy6dqyjoVDqH5LjTWD
 ffqRsHMT5tn0ShMx3LAuY2iGOw9oCcVov0j3Wqk30ErC0YFGrKR451YmlHLW00Gt
 VZT9n5ZWA1bjImEyZQLNmYEic/L43SeDrGc63RpgOemjETinnLHEi+YOd8QDNE/x
 NS5w7CRe0WBOHZ/rnJ24MoBGCAKBK/F101Bn3rg8W+0m+6QoY9d4BtNBTGVQGsmM
 EiI11Q==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gatkjjs48-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Fri, 28 Aug 2026 07:30:49 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-52d28f8737eso12765071cf.2
 for <qemu-arm@nongnu.org>; Fri, 28 Aug 2026 00:30:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1787902248; x=1788507048; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=PluVpFDua57aNL97O1v9dEqAafYRkfrTz9xh+Fkm2aY=;
 b=KyV8K4FR/dYQA5TqEx0timVyv15yKCGSgXN7k0GeYn+Dxk/S/tFHU6tDO1oP19OOpg
 NAYc/oCDxZ/VnQhRfs8X4/Fi78gh0APZU/WFU4YGoNnAkJ6L11S4olFDlkj4Qtt6oYxl
 G6PBuDGeWms/l1oV3kvDzSlLiGvel5Hp9LKEI1E359byuhghMG3kXfhAzdmnuzetNBzq
 t0IAAJrPxnEZ2ONttu2ZsYogwJdVs3ksQcpi7nrv3BSECN79TFZeu7a0zyiX+OZ4HhC0
 hpJnmLXJP0hkgIu0+gBDN0ILt/S66Djk2fyVhOIBvbc+TQhC9SkPy9baRc0EN1vb58yR
 w64Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787902248; x=1788507048;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=PluVpFDua57aNL97O1v9dEqAafYRkfrTz9xh+Fkm2aY=;
 b=NPk+qrDypo0WkI2SCLQJNvaDJfmQzdMRUcifJ3YR83SwbWAIVOyorFngbyNdtMlRyL
 ffbhfoRyLE+Mg0nsKgwxv7vcB49QDECKMLF6qF2t9m3uZy6X0aR3yG3rogdTCgTS8eXA
 xOFPQjA4CaAUE/TixkK+MRcqN1eSy+A7m5IridBu5FSxbcF59EN96dSI9vTd21UfKO7f
 7WcFvl9LuR/aBmPM4eAhHSWOkTkl3UzcGlyjO2Lw2RrL7e3TTq2lrhCpSy+3fcDVqvHy
 KPxgBsLDBq7lZaN4r6lB1ZaubN606TeTcYH/DeXqSxsuSQdV0kDz8bs8SjbISbaHULB1
 65gA==
X-Gm-Message-State: AFuF++l3irFnsUJ+k8FgLht7qXYQiefZEPFr4uGGgKDjie4MXBnnJXx3
 aC8QZcWK5PG8JdjRuRWGhf1lhHOqzRwGPJCK9KaTTI+N27nsDLcyqu3zKUfrSGh2k5uMeSTtjsa
 ZVR/kvtUbTzPFEHeeH5oBzvKZjU1B83hSq11k6Bto9xMhlje+TZck32o=
X-Gm-Gg: AR+sD11dS1wvblwhoZ6NJcVkNsqNBSx8zcypaIH/ucXgOiie/K/q28M3nP0Oo9vf/Wp
 4mpylfJ/pSpK5QlmtX2+kT05k83gPm+iR/W+T+AFYi2S02c+cJa73ap9OB8SqPCK+Q6l0cdDxlP
 /29wEP8XylaUbASWBJ6Tz35S13AsEthcGU1TbVJq4ecp0v1h5t4VDlQoNUbrVWrpy1O8Pfig4Vy
 tYpgffJOIt2psO6oEaMV/UF+22nrMVX0YA3GytwRxRDB8TeSdIHtswOpD7Cq8Y84IN9/+/NsuQ5
 S1Cf3yb7TMH6G5hiIHJAQtuKCT9iQct9sGc2BoA6t/trX8ZGxjaCGIRKtgeh7lJrjB0tKtqwTDl
 1XlR2SASgP6pTXyvGb/pZ9OyGb14jv94XOA==
X-Received: by 2002:a05:622a:89:b0:52f:a2b2:2dcb with SMTP id
 d75a77b69052e-52fb9445df4mr49840201cf.18.1787902248107; 
 Fri, 28 Aug 2026 00:30:48 -0700 (PDT)
X-Received: by 2002:a05:622a:89:b0:52f:a2b2:2dcb with SMTP id
 d75a77b69052e-52fb9445df4mr49839581cf.18.1787902247492; 
 Fri, 28 Aug 2026 00:30:47 -0700 (PDT)
Received: from [192.168.69.226] (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49b49cc61cfsm116723435e9.6.2026.08.28.00.30.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Aug 2026 00:30:46 -0700 (PDT)
Message-ID: <829bce83-b28c-4d3a-8bbe-001652a85b83@oss.qualcomm.com>
Date: Fri, 28 Aug 2026 09:30:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/6] target/arm: Introduce cpu types max-v8 and max-v9
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, pierrick.bouvier@oss.qualcomm.com
References: <20260827041557.775080-1-richard.henderson@linaro.org>
 <20260827041557.775080-5-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260827041557.775080-5-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: GKHBo8vHpfSzY6bjOsByoEMnqQjliS54
X-Proofpoint-ORIG-GUID: GKHBo8vHpfSzY6bjOsByoEMnqQjliS54
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI4MDA2MyBTYWx0ZWRfXwmUdRqfBn/cQ
 twXd4pEpyxKr3G8PyaMOIUYEybLlMhHx9uQfQ4YoG/Ctj6bMm3581RLWF3eqIMBvlHVnszZkhOn
 p4/EOaX4+h9s+33pKpkALXyXbwl9kPz6XAsHpb95pZat2IZ+IpxMFPzkVfr7D6bLrI0bxzYGCjD
 nNByJ9Oe2HLpCucp+fm9KA2NuoDHKoi0zTL6DnxCW2wzSUXq6CPiEHT+zx+rGjFjDh1/GBfjXtL
 9cTla7jhJ+qzxYFI8FoXNuB5H3sKzAaU48SpTWcd9P3azjwD1F9Y2xVUTJJjB6/8ozqQFVMS5WZ
 loNf7XhQbD310DzKpaD6kasz57J5iWmUFbTObCFz2UFN0hot4dmVMINGweeSAqGuej5Q4OIhLGc
 zPuva3QrFRlkI+V1/A2GlgHBVSEIrDveremaqVTLvgczHB8Mocsuv/hmLnG7IW3+6nTtOO6dYMK
 i+6VKzbXDm+x5Htcidw==
X-Authority-Analysis: v=2.4 cv=Rsn16imK c=1 sm=1 tr=0 ts=6a913929 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=1tSEMpTH9XP_W59IOagA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI4MDA2MyBTYWx0ZWRfX6KN3W3qYqQey
 4pglw2cAtucH7TPCTqSu82SdGlss1psMJgeOhxyhiCNysCbhmdNAkKQMqW1cjOTW4hMFb5Xcd+T
 qJrjq+hrNbLuWtGg4SgMTvTvgeOcIwQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-28_02,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 malwarescore=0 suspectscore=0 spamscore=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608280063
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

On 27/8/26 06:15, Richard Henderson wrote:
> Introduce the names and allow them with the virt and sbsa-ref
> machine types.  So far, the cpu types both exactly match "max".
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   hw/arm/sbsa-ref.c           |  2 ++
>   hw/arm/virt.c               |  2 ++
>   target/arm/tcg/cpu-max-v8.c | 11 +++++++++++
>   target/arm/tcg/cpu64.c      |  1 +
>   4 files changed, 16 insertions(+)


> +static void cpu_max_v8_register_type(void)
> +{
> +    static const ARMCPUInfo max_v8[2] = {
> +        { .name = "max-v8", .initfn = aarch32_max_v8_tcg_initfn },
> +        { .name = "max-v8", .initfn = aarch64_max_tcg_initfn }
> +    };
> +    arm_cpu_register(&max_v8[target_aarch64()]);
> +}

:)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>


