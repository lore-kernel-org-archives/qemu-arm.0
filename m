Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CBC8C43458
	for <qemu-arm@archiver.kernel.org>; Thu,  2 Jul 2026 23:36:54 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wfQxW-0002MH-BK; Thu, 02 Jul 2026 19:36:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wfQxT-0002KO-Ko
 for qemu-arm@nongnu.org; Thu, 02 Jul 2026 19:36:40 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wfQxR-0007QT-TE
 for qemu-arm@nongnu.org; Thu, 02 Jul 2026 19:36:39 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 98e67ed59e1d1-37e1607f7faso2088151a91.1
 for <qemu-arm@nongnu.org>; Thu, 02 Jul 2026 16:36:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1783035396; x=1783640196; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=x1eRmHA4Bu/QahHupuBcSI+qLTmSuzVSzvfGrYLu/Mw=;
 b=QrcniwSLPSP3cBReUhhFKJg7eMA4lJJxAafZrOlLheaIGi5b2J0VmjizMgC1a+57e1
 RoFJ0hdzV9vsHcAmtL1I3gGuWSOaTwR2o2HwtwzpInt4ObdFjUZL2CfffOpI7mLiQzLU
 cYv8BP5kbtaKPWA0/+XEHKelYtnSxeJrtc/wj11de5XIu69+Tv9iygtTgmTx73XCtd/7
 eRN0CYoWWjxWv+xVdAPYxWTjB9yJrVXqJmVfkf5AmwhR96nRwP6SGUzjzSSkUMbIJon6
 cxMwk8bIE39pAal4/ZdcMeeo1evMpXdYJbc9fqXxUn17I4wW5sUdztbwsfSibSkdBBDr
 1Aiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783035396; x=1783640196;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=x1eRmHA4Bu/QahHupuBcSI+qLTmSuzVSzvfGrYLu/Mw=;
 b=KJoVhaYrORbtMI6cdu02tRn7ZSqNekD9CPvffmoIMUK5SxneSvCVSzzPN+VLHtWieo
 b1dqqo1/QWp/usMGHVyQKuXb0Gn3j7enw2b+/plWbcFo+Tj/eGqipVHVc/zTu2SQMuEt
 ohBojH2mKVvAbCap+EnXgGmoKWB3xMfJcvkO38A4gaRQFvbYB9zTOT6MKCviTe/Q5TO9
 K9OiSX1XfMM1/QNaxBvYxvHPN/y7PDAbItRS8vkZlJM9akZzmh/jdnjK38qNJeKoVp9U
 V8yUiPL3+x9CT20YLKPGJTkcd0TCX9luEvhVvxvzWdCKo92uEFL5cqrUXzYe+0e6R/Yo
 DKfA==
X-Forwarded-Encrypted: i=1;
 AHgh+RoSyXQxvmPPXJvgX45dcKx/udiSCcfT1nvEzHxy0kQt996fOUO5G6ggt5xH0U4kDeGUBGgG/N6g+g==@nongnu.org
X-Gm-Message-State: AOJu0Yyqd+6mCyJ9vDO2ZUI6aAXoiVDXt9j4JgEpY7RpIKnPPzizO0xM
 SC/irqwDajzIGxaV56Rkbw3GT+3bjaF59N9FR6M8Lwl8dOlyB1PlzxXTRWmU3qUDiNw=
X-Gm-Gg: AfdE7cnQgQ450U1+19vFviBvR/iDmeHUuaDZRvsJCuifmP7k4fsea2YXc9FJLsbfbQb
 XduwVPCj0oWNcEoxSDhvc2l8Ooa5AmnK+whQt1+rnxGeJxpTuAfo2rBUCAlMjNKhroBsuF1Cyfn
 LfXtwscx5tRfTyaCjVJpcyeDP4RexqZ/7JcX/l6ldb8TQZKARXJqdKoW7VnTFAcMMmt/wvhauaz
 PlMKIv36E7LksCM8HhKBbEkJBSwP7bkdyZ6gBN+orHM7RA97luoM6Bl6rM2o5HxzjRYJ0TTIrTu
 D2L2dd0jDIHmg+w5QcPH46r2zQouwJxtBEILNAO+tNrF91ONbb1Lin3Pnam2X4vctJhpi71QzAN
 CPvB0Q4/piHmNfK1zmIOyedlcOSCiM6XvuW8udF+sFfIHObKYpvJwTBXGibwo/RaXF+PfU5FvKr
 SzjmwKPh9+R4ZyklIQeIMULCJVrUJyhcyzWNzNZFpZF1l39MC3XFPr6TXW2g==
X-Received: by 2002:a17:90b:3a45:b0:37f:9cdf:f0ac with SMTP id
 98e67ed59e1d1-380aa234f58mr7986894a91.27.1783035396103; 
 Thu, 02 Jul 2026 16:36:36 -0700 (PDT)
Received: from [192.168.0.4] (174-21-129-215.tukw.qwest.net. [174.21.129.215])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-38127ae5b06sm65616a91.3.2026.07.02.16.36.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Jul 2026 16:36:35 -0700 (PDT)
Message-ID: <d0222d0f-ee90-4d4a-bc60-71740a858543@linaro.org>
Date: Thu, 2 Jul 2026 16:36:34 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/11] target/arm: Implement CPACR.D32DIS
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20260702184019.3431139-1-peter.maydell@linaro.org>
 <20260702184019.3431139-12-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20260702184019.3431139-12-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On 7/2/26 11:40, Peter Maydell wrote:
> On some v7A CPUs, CPACR.D32DIS is a bit allowing the guest to make
> VFP instructions that touch registers D16..D31 UNDEF.  Whether the
> CPU implements this or not is IMPDEF, and the only two CPUs we
> implement which have this are the Cortex-A7 and Cortex-A9.  In v8A
> the bit is no longer defined at all.
> 
> Since the only kind of trapping that needs to be done is a simple
> UNDEF, this is straightforward enough to implement.
> 
> Resolves: https://gitlab.com/qemu-project/qemu/-/work_items/1499
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   target/arm/cpu.h               |  4 ++++
>   target/arm/helper.c            | 19 ++++++++++++++++---
>   target/arm/tcg/cpu32-system.c  |  2 ++
>   target/arm/tcg/hflags.c        | 20 ++++++++++++++++++++
>   target/arm/tcg/translate-vfp.c |  4 ++--
>   target/arm/tcg/translate.c     |  1 +
>   target/arm/tcg/translate.h     |  1 +
>   7 files changed, 46 insertions(+), 5 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

> @@ -210,12 +210,12 @@ static void gen_update_fp_context(DisasContext *s)
>   /*
>    * Return true if a VFP insn is OK to access D16..D31, false if
>    * it should UNDEF. This checks whether the D16-D31 regs are
> - * implemented by the CPU. Eventually we will also check CPACR.D32DIS.
> + * implemented by the CPU, and whether CPACR.D32DIS permits access.
>    * Note that Neon insns accessing D16..D31 do not need to check D32DIS.
>    */
>   static bool vfp_d16_d31_ok(DisasContext *s)
>   {
> -    return dc_isar_feature(aa32_simd_r32, s);
> +    return dc_isar_feature(aa32_simd_r32, s) && !s->d32dis;
>   }

Not that it matters much, but if we stored

   s->invalid_dreg_mask = (d16_d31_ok ? 0 : 0x10);

and pass in the mask of regs like so:

static bool vfp_dregs_ok(DisasContext *s, int mask)
{
     return !(mask & s->invalid_dreg_mask);
}

-    if (!dc_isar_feature(aa32_simd_r32, s) && ((vd | vm) & 0x10)) {
+    if (!vfp_dregs_ok(s, vd | vm)) {

then we eliminate a couple of branches and some boilerplate.


r~

