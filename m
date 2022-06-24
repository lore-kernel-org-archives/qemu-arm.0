Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp446812lft;
        Fri, 24 Jun 2022 09:29:17 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1skZx2+MBxjxQmT+PO/l49Z0WR68SbEiegPmiLjWgiaPfAriSwgQ1Gs2ETwtCUIuZrQ1cWf
X-Received: by 2002:a37:c50:0:b0:6af:46d:c373 with SMTP id 77-20020a370c50000000b006af046dc373mr3052724qkm.659.1656088157368;
        Fri, 24 Jun 2022 09:29:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656088157; cv=none;
        d=google.com; s=arc-20160816;
        b=MbvVXu7cl6UL5iVdS058amlUxe487XRGwTFhODvs5HaCkV1u7tFoP3G1qgUH5DNkop
         Nk+CY4TCtqHd38T3Pb/7pNwOW5jGTBZ0wBZVDMO2l+58et6BVbdexg7ZHePf5N0K7xpZ
         nw7pIeKXDhvJeHGE8zj8XR6888PZyZale9TIndtPmSKwEEMuQ94QtHsFBn//J5PCTlHb
         YBtYXQHIvOUxfVyDCUqGNP6WlmekfKQpDFlf4Cb/L7bfWUkbt2ysPoMLPgcgR9SBtFGZ
         rM65dESIEZ9pdguuyT2Xq1h2Uw1JK050OTDxjR9iuCpUUlk+eUam1haaM85+mutilw78
         0iuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=zYVeqkD6mJqyQyPSeYecDofAjz7huJNMxRjD307Um3Q=;
        b=NdmISTSU48ja9lzABQjgGjaBrqoBOTz4Vv9z7Dl+eYFNgM21AW1+JWbp8FpRuucKCL
         Rqb+D2mZAUTPc1aoQm980TodITQ/9qAPlohrNrnSf6UStz5vq91jgih0mTqLD8emmdKp
         KgbQaX71xEEVAKDVDODpfh6IEc008rQ5kyQpWCvdCPVqqBSzNRHj5ZsfK+u713OYoJHI
         fYEjtJYUddHDax8YHZ8ZLwrfXi20S24rrD8IvMOWrfO3xlKNL47lwcGilD7+XkECpnRa
         Y1KM4F6TW9IUEhZtWfir3FEFxxLfRccnWT/C6zihniQ4rU2JHEslM0figWRfknHfwVhE
         fQXw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=e9fpjgUs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d7-20020ac85ac7000000b00317ccfa2fadsi917734qtd.283.2022.06.24.09.29.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 24 Jun 2022 09:29:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=e9fpjgUs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o4mBI-0002Ij-T2
	for alex.bennee@linaro.org; Fri, 24 Jun 2022 12:29:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o4mAI-0000xu-3Z
 for qemu-arm@nongnu.org; Fri, 24 Jun 2022 12:28:14 -0400
Received: from mail-yw1-x112b.google.com ([2607:f8b0:4864:20::112b]:43824)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o4mAF-0008AI-Gl
 for qemu-arm@nongnu.org; Fri, 24 Jun 2022 12:28:12 -0400
Received: by mail-yw1-x112b.google.com with SMTP id
 00721157ae682-3137316bb69so29636937b3.10
 for <qemu-arm@nongnu.org>; Fri, 24 Jun 2022 09:28:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zYVeqkD6mJqyQyPSeYecDofAjz7huJNMxRjD307Um3Q=;
 b=e9fpjgUsx3l4pKBANut5svbQ2v5CSzKmQnMH/o01LSz38pS+//5M11dn0BvAknJgN1
 WRPCCDTnyKCh0MDNSwu2j0LcsCvx8qRGMdRShr8GW/xGVuCslU9/2iv+z6kXgIpzXWjm
 xIAoG+jzmNps2tADZCtIesgbRG8WZjs5XJC+cP2m7YjHUsLoUbsvAXw5rhm0VQFdAD0K
 L0wsjlYPvSiXaqcNySA6PXSJC527uR27joAGpj0DAPHHzmaZEDUEiJx9Bn+qQ4G5OTAx
 llhEyMr+hSl4HOyK5oMwdGqCfvDvbe+dwHQj9n8FaJAZOdj1yk+6RmAlVYSz4lvkcdYM
 m2nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zYVeqkD6mJqyQyPSeYecDofAjz7huJNMxRjD307Um3Q=;
 b=deZYQ3yTK9Y2fvSUMTdlf12Y/YQ0y25H2CGWJ+wn2ecXvHuHaGCNS0v7XdgE577hW3
 sYzHw/7xnYik43hzTlROsNnIjMJNE/8R2taCzf9aqrmpQbkfUknhttP/zVuKgcQYH3eN
 O0FP9okU5ax32Vly4EsCYDwnHW5i5E6dYMtuh0hnDaahkettyCjAWjekKtRywtkFIHHK
 +Qy+a3xaukXaaGpp0W8I8QUqRNXEkMUtfVBHHn9KBpYVz+IanUqOp3PCqNpSMIN4SvkY
 BP2LGFdQ7spKgos3usmzIygESobKP1uzuOOCS3rH9D3MfQr3AkZ953CeSSABcjgyDqHP
 0WgA==
X-Gm-Message-State: AJIora866IbVH+8IIipwnJ21V35dfA9BXdvUCE4Eg59EtE222Vk/zdDP
 TVEO4PH1t1zh3RHDa8BkdUwhSFbRqVy0rRSuoh+oIJuoCMM=
X-Received: by 2002:a81:a047:0:b0:317:8761:14f8 with SMTP id
 x68-20020a81a047000000b00317876114f8mr18535869ywg.469.1656088090373; Fri, 24
 Jun 2022 09:28:10 -0700 (PDT)
MIME-Version: 1.0
References: <20220619001541.131672-1-richard.henderson@linaro.org>
 <20220619001541.131672-3-richard.henderson@linaro.org>
In-Reply-To: <20220619001541.131672-3-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 24 Jun 2022 17:27:33 +0100
Message-ID: <CAFEAcA-zUJV2FdFWM2UdS1BDrh_3Tw1p+vHkMoEn7g1G5kArMg@mail.gmail.com>
Subject: Re: [PATCH 2/2] target/arm: Check V7VE as well as LPAE in arm_pamax
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 8qgP1vNNWYTS

On Sun, 19 Jun 2022 at 01:18, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> In machvirt_init we create a cpu but do not fully initialize it.
> Thus the propagation of V7VE to LPAE has not been done, and we
> compute the wrong value for some v7 cpus, e.g. cortex-a15.
>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1078
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/ptw.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/target/arm/ptw.c b/target/arm/ptw.c
> index 07f7a21861..da478104f0 100644
> --- a/target/arm/ptw.c
> +++ b/target/arm/ptw.c
> @@ -47,7 +47,13 @@ unsigned int arm_pamax(ARMCPU *cpu)
>          assert(parange < ARRAY_SIZE(pamax_map));
>          return pamax_map[parange];
>      }
> -    if (arm_feature(&cpu->env, ARM_FEATURE_LPAE)) {
> +
> +    /*
> +     * In machvirt_init, we call arm_pamax on a cpu that is not fully
> +     * initialized, so we can't rely on the propagation done in realize.
> +     */
> +    if (arm_feature(&cpu->env, ARM_FEATURE_LPAE) ||
> +        arm_feature(&cpu->env, ARM_FEATURE_V7VE)) {
>          /* v7 with LPAE */
>          return 40;

I guess this is expedient, so on that basis
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

but as I mentioned in the gitlab issue it's kind of bogus
that the virt board is doing stuff to a non-realized CPU object.

thanks
-- PMM
