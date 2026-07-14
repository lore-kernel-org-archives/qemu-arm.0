Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DEA1C43458
	for <qemu-arm@archiver.kernel.org>; Tue, 14 Jul 2026 09:51:27 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wjZmn-00023b-Rw; Tue, 14 Jul 2026 05:50:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wjZmm-000235-L1
 for qemu-arm@nongnu.org; Tue, 14 Jul 2026 05:50:44 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wjZmi-00035a-9i
 for qemu-arm@nongnu.org; Tue, 14 Jul 2026 05:50:44 -0400
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66E7YH1t4101743
 for <qemu-arm@nongnu.org>; Tue, 14 Jul 2026 09:50:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 /9jRxHddWr5/69MwxIKP3gBixQB7Iwg53DvuHHUn6gk=; b=f6B07DamNdb9Opm1
 xvMCLDTokXjakwYkRCa2KHDla6l8YQ35dFO9He1jpQyIT86sx4hAGkvzNr91DSwl
 aBIIhCeTnNPjsKKsfBjYnKNcrvAPpGQH+EEUwprcbSC8aQi+r3xoQLJklxHXADDM
 G3hp5RTu84/9ZnsdORUn7jCt+u1/xwKc4rVBqndicoaCoPJQacAc7Gndohw9HyLe
 wlhFoSxk0SFbd6f99Tc1XSJblN0kJT0OQ3NAxErouthNu9Il4CWibUcSCW6+TJul
 Hs/q1Z3A70rvW5YTctpq+ZZbMSiSb+r1lTrMD7YySeaFleaEq4jUnNMVhXq2bMwV
 S5slqA==
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com
 [209.85.128.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fdgudggpc-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Tue, 14 Jul 2026 09:50:28 +0000 (GMT)
Received: by mail-yw1-f197.google.com with SMTP id
 00721157ae682-81e7b95cd84so16930137b3.0
 for <qemu-arm@nongnu.org>; Tue, 14 Jul 2026 02:50:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1784022628; x=1784627428; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=/9jRxHddWr5/69MwxIKP3gBixQB7Iwg53DvuHHUn6gk=;
 b=a6zCOmleA+Vq2jt6Z/Ktl8FHkUrIpNDfbF001M2TyTNvk8qTdrETaZZqGGBClKfNcB
 HNWztRUvV0IF0ESqNzB9Y5Z8YPoYpYAwWReif2u8SRqCr4Shj293cWV4WtEmQop1FUtl
 vIPZ9rtxryZI1We4DeeiXEIYuRCSySITHZA1+Q0sRJCeZeE9FV6ieboJhySk3rnw9fBr
 E3LruQLVF9Z4Tj9gwtWUOfrOm9U0e/rduSnhO24TLqsnHe3RCRzvR8Je840DL/rXT0ym
 GjRIv+rx672zuR7LLS8RMWMzVKpTMUIC0G7GFJK4ofbDWHsIubzBG5+foM1iqdLUt6Qd
 0PNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784022628; x=1784627428;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=/9jRxHddWr5/69MwxIKP3gBixQB7Iwg53DvuHHUn6gk=;
 b=jnxc+eOKhKpIGGerC3eYzbqc6GskW2n2/fbpEZZBmB1qHlK+iV2W4veDvCaRPhgaw6
 t9YvdwmMZiB7GbYpqtxcCdWcZtN8dduadgUJlu/SA7Tgb7dl/Ebdd78wRu5x4L0p4P1a
 rY6ynII4kgacGEO7G8PU/hycptZgURS/1mDnuIQ6+WoKnn953WzuXDDiHDVS99CwixFJ
 dVdu/tXKQNpfkZ/l/7bvqa1KEVyj2ST1eg70cv3Pdttac6wAMUQKr8am4V7cAHTzE3mI
 4D1A9hKLGwfpAVzmYSN+w78XtO0Ub6ws53x3odnfPe5tGefjG5SVikTOUM8NQdSZyCnu
 YUMQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RqRB/f6JVlCrVjkhfWhQ1gbAE+cA08WHQNoL/eIKqEMeSX5A73CjJOznCwyne7i29f+UIkemwYJ3A==@nongnu.org
X-Gm-Message-State: AOJu0Yxx/Jy5yIW6ipbsg6rz3xfczBgk8ztD9PYh32t/ecweuCZl7Q3G
 T4yZgGfJ4nwGBkRDfb8lkdD/d6H6ksFDKQC55oCf6LeoLPUx5sqpx4PkV9M1yms2eN7F2iPIRk/
 nSBucy65VS/TrNgHxJcrABYEHqf4RxH9VZ+XbdJ9wbVIUdxBc74Um5Ps=
X-Gm-Gg: AfdE7cntomp7mLRMRd951xUDmrYptsOJeCA7oEMvQe9F95vlqg7vuJoEyYzSfprC1ZB
 mgJTsqa5LvgsgkZzP/zHoRkGlr04milAPVihF6d3l5oGaGsoNlZHnKnbWIwfQMV9gFFY8LbpZUG
 fwPEocIjSlqgpRaTo8jxtJ3aLnDvS7Qx1l4x1/fEgnjRv5TPq+ms2sLZl6ms9l/QiJgMLQxUPxj
 uaAXuiF36Fjmt2Sh3BE1qUwJzdCsx9rlMvAwkfn6hwwTRog/zriTiYJQoy14EOHEhb8aEYtqDN5
 cp9OxhrThD1LtPzaRb1gfpEti75YUnqXO7/bocwGKTwDR02GUN63g4Ev4y9d2wuUdcvOEIJnEc6
 6aiznokvAUCpfHm9/d6twWdyyWvorNhKP/eBbKDseLt1a
X-Received: by 2002:a05:690c:9a8d:b0:80d:f9bb:3d3c with SMTP id
 00721157ae682-81e90139c81mr89895037b3.36.1784022627943; 
 Tue, 14 Jul 2026 02:50:27 -0700 (PDT)
X-Received: by 2002:a05:690c:9a8d:b0:80d:f9bb:3d3c with SMTP id
 00721157ae682-81e90139c81mr89894917b3.36.1784022627451; 
 Tue, 14 Jul 2026 02:50:27 -0700 (PDT)
Received: from [192.168.68.105] ([189.79.21.40])
 by smtp.gmail.com with ESMTPSA id
 00721157ae682-81e6bc4285asm137628877b3.0.2026.07.14.02.50.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Jul 2026 02:50:26 -0700 (PDT)
Message-ID: <fa72c68a-141e-4b8a-9445-4131dd83f353@oss.qualcomm.com>
Date: Tue, 14 Jul 2026 06:50:19 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/14] semihosting: add callback to set error
To: Matheus Tavares Bernardino <matheus.bernardino@oss.qualcomm.com>,
 qemu-devel@nongnu.org
Cc: brian.cain@oss.qualcomm.com, pierrick.bouvier@oss.qualcomm.com,
 marco.liebel@oss.qualcomm.com, philmd@oss.qualcomm.com, ale@rev.ng,
 anjo@rev.ng, =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, Palmer Dabbelt
 <palmer@dabbelt.com>, Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>, qemu-arm@nongnu.org,
 qemu-riscv@nongnu.org
References: <cover.1783973054.git.matheus.bernardino@oss.qualcomm.com>
 <df1607f5ee373a1ecaa6f88bb56fc64101d818f8.1783973054.git.matheus.bernardino@oss.qualcomm.com>
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <df1607f5ee373a1ecaa6f88bb56fc64101d818f8.1783973054.git.matheus.bernardino@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 40CLRP4-1azAZpUP6VFcka6fanh8MYRp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDEwMiBTYWx0ZWRfX2w+CQa4EyZVR
 qX73yqROy6jIWofYE+2hY0oXDmK2uomgHA276UYGBT/sJSoTVEzjj6rD5JSPcudtnOyZmqwmFld
 9wGfwwnY/5pus9b98SA0dWVWFld8n2xFYfG21S4OWn0R7pa0zIxbItYm/vpwJKeU7zBsSZaQzz4
 FZDFQyNgS2Ee7BbCcne7hDndar12Y0ffQJ0TT9Vy/rcNscG66XKR4HMtdbQ2hernbORPL/UpHgw
 HxEMgZMjTvgbsR3Dlm2+emzOgH4itnya+l6zgsE3xmkPgbqXy9EsHvMfERpO3I78rL1bGqBWJmZ
 HLJ2NYfcFU+hHW0x/hklCs2+G5hRDQnrMxlouPZBeLqhQnuAhDGYXjCygZZuz7aIJVXuYLpHycW
 OSVqN5euOTa4U+ng9es7nz71Sz8SwdxTwAn36CjZUCgdZrMJFfMa63Cdr7xNBa+cFUckp8SQW3y
 NAHDgpz+634Ubnr+BYg==
X-Authority-Analysis: v=2.4 cv=T/O8ifKQ c=1 sm=1 tr=0 ts=6a560664 cx=c_pps
 a=0mLRTIufkjop4KoA/9S1MA==:117 a=sHJf4AwOIoU3qjeHFPlg6Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=kPOZBpqBqiv7Ng3vFtoA:9 a=QEXdDO2ut3YA:10
 a=WgItmB6HBUc_1uVUp3mg:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDEwMiBTYWx0ZWRfX9uZ5Y5Z0Im7f
 +bX6A9P1L0CxRQEwpUX2VVsGZmgD3aKWKA6kkDde4AokaqlvATEcPVhZRdtQSVMLc+jAQLOzD4T
 8I+M8Kkia8EXqB6cVRy4sn/SMbgZuEE=
X-Proofpoint-ORIG-GUID: 40CLRP4-1azAZpUP6VFcka6fanh8MYRp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 spamscore=0 phishscore=0
 clxscore=1011 bulkscore=0 suspectscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607140102
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=daniel.barboza@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
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



On 7/13/2026 5:07 PM, Matheus Tavares Bernardino wrote:
> This is currently unused by existing semihosting targets, but it will be
> used by hexagon.
> 
> Signed-off-by: Matheus Tavares Bernardino <matheus.bernardino@oss.qualcomm.com>
> Signed-off-by: Brian Cain <brian.cain@oss.qualcomm.com>
> ---

I suggest making it patch 06 in the series, right before you use in patch 7.  You
can even mention "next patch will use it" in the commit msg for extra clarity.

As for the code:

Reviewed-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>

>   include/semihosting/common-semi.h | 1 +
>   semihosting/arm-compat-semi.c     | 1 +
>   target/arm/common-semi-target.c   | 4 ++++
>   target/riscv/common-semi-target.c | 4 ++++
>   4 files changed, 10 insertions(+)
> 
> diff --git a/include/semihosting/common-semi.h b/include/semihosting/common-semi.h
> index aa511a46f42..a11905ef4ef 100644
> --- a/include/semihosting/common-semi.h
> +++ b/include/semihosting/common-semi.h
> @@ -37,6 +37,7 @@
>   void do_common_semihosting(CPUState *cs);
>   uint64_t common_semi_arg(CPUState *cs, int argno);
>   void common_semi_set_ret(CPUState *cs, uint64_t ret);
> +void common_semi_set_err(CPUState *cs, int err);
>   bool is_64bit_semihosting(CPUArchState *env);
>   bool common_semi_sys_exit_is_extended(CPUState *cs);
>   uint64_t common_semi_stack_bottom(CPUState *cs);
> diff --git a/semihosting/arm-compat-semi.c b/semihosting/arm-compat-semi.c
> index 5e5f181b908..c54753f696f 100644
> --- a/semihosting/arm-compat-semi.c
> +++ b/semihosting/arm-compat-semi.c
> @@ -237,6 +237,7 @@ static void common_semi_cb(CPUState *cs, uint64_t ret, int err)
>           ts->swi_errno = err;
>   #else
>           syscall_err = err;
> +        common_semi_set_err(cs, err);
>   #endif
>       }
>       common_semi_set_ret(cs, ret);
> diff --git a/target/arm/common-semi-target.c b/target/arm/common-semi-target.c
> index 2b77ce9c17b..38d52deb3d6 100644
> --- a/target/arm/common-semi-target.c
> +++ b/target/arm/common-semi-target.c
> @@ -34,6 +34,10 @@ void common_semi_set_ret(CPUState *cs, uint64_t ret)
>       }
>   }
>   
> +void common_semi_set_err(CPUState *cs, int err)
> +{
> +}
> +
>   bool common_semi_sys_exit_is_extended(CPUState *cs)
>   {
>       return is_a64(cpu_env(cs));
> diff --git a/target/riscv/common-semi-target.c b/target/riscv/common-semi-target.c
> index aeaeb88d536..38a00e160c3 100644
> --- a/target/riscv/common-semi-target.c
> +++ b/target/riscv/common-semi-target.c
> @@ -26,6 +26,10 @@ void common_semi_set_ret(CPUState *cs, uint64_t ret)
>       env->gpr[xA0] = ret;
>   }
>   
> +void common_semi_set_err(CPUState *cs, int err)
> +{
> +}
> +
>   bool is_64bit_semihosting(CPUArchState *env)
>   {
>       return riscv_cpu_mxl(env) != MXL_RV32;


