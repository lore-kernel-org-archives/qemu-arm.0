Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25A06C55167
	for <qemu-arm@archiver.kernel.org>; Fri, 31 Jul 2026 06:49:49 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wph3s-0007Sc-QV; Fri, 31 Jul 2026 02:49:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wph3r-0007SP-WC
 for qemu-arm@nongnu.org; Fri, 31 Jul 2026 02:49:40 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wph3q-0002nU-IL
 for qemu-arm@nongnu.org; Fri, 31 Jul 2026 02:49:39 -0400
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66V69Lh93161926
 for <qemu-arm@nongnu.org>; Fri, 31 Jul 2026 06:49:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 aV9499miaokKje4uxfGrh+AyuYg2OfLjuDuINFSujCs=; b=ObhDy82iDmKL1PmV
 xckjZ3SAUJgdEBPNuXv/1CrDVYt79qIQCFtUrYJIpSaEVYoCbUjDPVnx/iQpBT+4
 f/MhQhWSL+VLtE5GXYuhRQ0AXT7rBN+mWP3Nnu0Q1QDDx7g53XPaknyfptHg1vmJ
 u6WTbXucd/zfDfVrKjcAR+7pOqGNsK5FN5CKrqOKGEigqc76Kp3T3xaLyNuC09J9
 OxWdme4ZZ0md24xX3CIbvxoNKA45toDr2QUwW60J91cPsCgHV1jQbC5BJQykuGsq
 GPfJxI7gI/jClJLqUkvKiCuP5xA3T2ElnsWWIABeDiGGFXhoAXUtvTpxdJH+fAli
 fCsy3Q==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4frp6k85b3-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Fri, 31 Jul 2026 06:49:36 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-51bf321d786so6115111cf.1
 for <qemu-arm@nongnu.org>; Thu, 30 Jul 2026 23:49:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1785480576; x=1786085376; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=aV9499miaokKje4uxfGrh+AyuYg2OfLjuDuINFSujCs=;
 b=NqQGmKXhHl1TFABF0h7NLdMSeRY+oosNuRgRh2DRfyD4nRC282vwsjxEBZoNjk4kGZ
 LW7rtUG36GrpsoIqNz70FM3dYQuZtBgUrty6Xd0WWhM95wc5YTgpyb9aZEO5PHysjFoX
 T7gJg0GCdvcu/FPDfk4agVJeRYRShTJQHSUOZ3cgP8uKsGg6TUuYAPpTnBIF7yWiQF3f
 15iVVEJxLUnLRUjlkyTvMWb1xF/5vIyzeX+8FSMy+Atq+QpyxUbTbwoKIrNMQCNmkSeI
 4XzXxAMfhC1pqj10mwe0a52LBDb/akBCv3faiMiFD10Km4Fwy7kNRt3FJilmFh8Jr8e/
 ijiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785480576; x=1786085376;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=aV9499miaokKje4uxfGrh+AyuYg2OfLjuDuINFSujCs=;
 b=OeukAF6IQSAovqD62KAfNkBclfFyjxAL2Z8v7M4UcGgN/gySCQqLf2Qna7ZYOI+Ow9
 TkrFOfG5lDdV2HaoqcAboVyHHii6uRf150SGbDN3GtGH/J3QjKfGI+pUCSjQRF/nRfVR
 7B+4Jt6qCRZaJKREACf51KZIUB3e+UZtQk0KVPYqklYgDGaachSE3r4/+uTbAkc/kLQ5
 qvGTNUuncpmOvvwqtdw0I/lyXbe/mUi6VYZ7+MaR1ZffRq8aIhMwHDSCaaC3hcnqhbp+
 pFxN6tRRGDcvZUN4fIHU5I/Z6Wtf7Teawc9+HdIt2AK7SbJHTtgrcf/PfjZpgFF+DswY
 0qFg==
X-Forwarded-Encrypted: i=1;
 AHgh+RqRviWZqtE/3ul8izu6LEMy9w0tiWAngQD3NHzVnWzQtcwy+MJw3B5M4JiIilXmweicQ2pRaM2JNQ==@nongnu.org
X-Gm-Message-State: AOJu0YzG/1zlW33nHsEmWTySXT6eksS9EJ6S6ZKPDgdY7RvWdUqUvhpi
 bTpo16dK3PWxOsXnt8dAzf1Qv7Rv9QERrCaNkzndIwFG028/loCaMQFe76EXfCPSmq/7A9zhOMw
 wTExKyuPfsVAevro6F5yS7yKDW9xqqLddWHZMf58XShvAb46wGTKikgQ=
X-Gm-Gg: AR+sD12nVHUZyXe9Z4YvGNQxmVY1BB4JDsxNvSkR170yWAiMIPZdneDos/pjBy6Pt9k
 2rJEtCnGiTtGD1tW+jGxDW71uk6vz3RaqjRi1UIIHFgmts14BlOpdsLTUdDaGUh0qJbTTlD4pmE
 /hiKgz05jpmHaxDVFnH2BC27JRmugmhm78vb/675VVKCd0b/EA3pLnYxmkipRuhb8Wx+bBZeHGK
 hkxgz9Y/uoo++5MsZAQfJt5Z9CC1pbTBLxrWOr6WfmI0oNTr7C14kUBAma9Bi7x2a8I3T3TjSAC
 L1K6w860rMZHUwnVwxYsMRtiYg7mxylRXEiQsdulGXIRsgn+h3sp8PUSQJQxw0Mxoc4y6CayqB8
 cDlVkSPVXZ/Mk6gs7F4080fhoJpmraL0j+XLufOvXKJTUJ087W7Q=
X-Received: by 2002:a05:622a:4897:b0:51c:44c:6ad with SMTP id
 d75a77b69052e-52b4af24401mr8224841cf.21.1785480575699; 
 Thu, 30 Jul 2026 23:49:35 -0700 (PDT)
X-Received: by 2002:a05:622a:4897:b0:51c:44c:6ad with SMTP id
 d75a77b69052e-52b4af24401mr8224631cf.21.1785480575305; 
 Thu, 30 Jul 2026 23:49:35 -0700 (PDT)
Received: from [192.168.69.212] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47fd41e2961sm1393239f8f.13.2026.07.30.23.49.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Jul 2026 23:49:34 -0700 (PDT)
Message-ID: <348faafd-2346-43dd-85d0-4ed7fe965ebb@oss.qualcomm.com>
Date: Fri, 31 Jul 2026 08:49:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/11] tcg: Add tcg_gen_revbit{32,64}
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: anjo@rev.ng, qemu-arm@nongnu.org, git@xen0n.name, 17746591750@163.com,
 maobibo@loongson.cn, lixianglai@loongson.cn, philmd@mailo.com,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
References: <20260731000503.170446-1-richard.henderson@linaro.org>
 <20260731000503.170446-3-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260731000503.170446-3-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=H/nrBeYi c=1 sm=1 tr=0 ts=6a6c4580 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=KKAkSRfTAAAA:8 a=CkTU4zPvt2Zb_C_0CqoA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: OC8DpSU0TST0RJGOdYaZkQJVARLmAR1m
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDA0NiBTYWx0ZWRfX5S5gelFypZcA
 +kE2tQv5IjfeW1113Y+gvFlEs8+IojF2xpJ52ApriXZERbZPqzr4imDqZI+AU+zDB2IAQrggid7
 iOIV5kcEtlwF8GKfzPjX261URoSAUNQzLFBWjXQejaA4tlQJmty/UOpj+b3a7CzYceSzYbZMZdE
 NeKmVj59McdweRjRyWni/orC0dDV30tYUNwXumdp51edp4mbiKtAYfCP2E+rASPrfkU82SHo5P5
 34JbCpg6YUnWVIdFppwx4dx9D/TAF9klDmcHalNHw+LtugcGMpFe6L8ojv/UobbYLrp12Z90//h
 CmA4xTjUphqbKjRX7pzYiLF6pRFsNItON6KcHKZHzDZ49jijxsttdCM+ZBR92AXUhYIPzuZhgHR
 xzItVokOdCfFPPhgaeyYkXl8vPL9X4jmhpRwzOPi6IBGxP3OVsIVsD2rXUfatPhVvAqXPHWjfJ4
 9rT5pZ1LUg9tFo7sYbg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDA0NiBTYWx0ZWRfX4gHY3rgrgrnb
 79Oasw+sarxH7HWdg4i+OIftw5QZzQ6uyj04L10tNcMG7ABoGqWoTBIt9s31ef73QavO0CZso2Q
 /uzceBrFDjbwH6kU04hVENDbxuAx05A=
X-Proofpoint-ORIG-GUID: OC8DpSU0TST0RJGOdYaZkQJVARLmAR1m
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_02,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 malwarescore=0 impostorscore=0 clxscore=1015
 phishscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607310046
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

Hi Richard,

On 31/7/26 02:04, Richard Henderson wrote:
> Add generic expanders for reversing bits within a word.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   include/tcg/tcg-op-common.h |  3 ++
>   include/tcg/tcg-op.h        |  5 ++++
>   tcg/tcg-op.c                | 59 +++++++++++++++++++++++++++++++++++++
>   3 files changed, 67 insertions(+)
> 
> diff --git a/include/tcg/tcg-op-common.h b/include/tcg/tcg-op-common.h
> index 1fe342db0d..91f59dc11e 100644
> --- a/include/tcg/tcg-op-common.h
> +++ b/include/tcg/tcg-op-common.h

> @@ -275,6 +276,8 @@ void tcg_gen_smax_i64(TCGv_i64, TCGv_i64 arg1, TCGv_i64 arg2);
>   void tcg_gen_umin_i64(TCGv_i64, TCGv_i64 arg1, TCGv_i64 arg2);
>   void tcg_gen_umax_i64(TCGv_i64, TCGv_i64 arg1, TCGv_i64 arg2);
>   void tcg_gen_abs_i64(TCGv_i64, TCGv_i64);
> +void tcg_gen_revbit32_i64(TCGv_i64 ret, TCGv_i64 arg, int flags);
> +void tcg_gen_revbit64_i64(TCGv_i64 ret, TCGv_i64 arg);

Could the bswap flag be defined once per target?

- output sign-extended (TCG_BSWAP_OS):

   alpha, hppa, loongarch, m68k, mips, riscv, rx, sh4, tricore

- output zero-extended (TCG_BSWAP_OZ):

   arm, avr, hexagon, microblaze, openrisc, ppc, sparc, x86, xtensa

- input/output zero-extended (TCG_BSWAP_IZ | TCG_BSWAP_OZ):

   s390x

Having to manually encode it on each frontend doesn't sound optimal.

Note, we have some target-specific TCG information in TCGCPUOps
(useful at runtime for heterogeneous emulation).

