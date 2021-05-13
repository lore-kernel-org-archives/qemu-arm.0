Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp541247lfg;
        Thu, 13 May 2021 07:19:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyDqh3t+MUT5uPsmK0ibCOxfj4QA6sihjR9AhSepH2QlET3bc7jSwCLQTN8+K6K0Es13KvC
X-Received: by 2002:a05:6602:2289:: with SMTP id d9mr27306347iod.198.1620915566928;
        Thu, 13 May 2021 07:19:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1620915566; cv=none;
        d=google.com; s=arc-20160816;
        b=jc27E3kPbwLzU111N6OE58zF3lwT8Jg/LhtSuKc+fgcT5u4+kVJLWm6228A5/KJZAL
         1wJtdZFCwuQ8dsceZbwiETT0iExBQq0tFhE0+/kse/op8BHEEglrVvYhyN06p0OIEh5Q
         Q7EDUsIE93BL8XM3hdewdrDibeiAgI9QnkP3T/5RG8Rqrxhyf9ixi9Bo2MpP8Sr02OZj
         +R6fdKTp5yuVq68ubdgrnorLYwlj/T3Ls1DArTwPCaf0qd3Y1Tc3PZiIda7IA9FbUZsy
         asHG0hK3JQ7WNunlmCMEaQ2CLy3vCq0X/ZHn1y9MbiEorbJqPOUG0u+Od8pheAmJFYWX
         9v+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OOc4gL5uPk2ACAGFRhazVHQWnGubWnzLQye6pT02Va8=;
        b=o01Uf3BvOVpMu7VH2RixZHpOfUzcCgupawalFu0S/vaGJPn59mssCY4JClve3qKnF5
         wuONGF1Hl5BtDki6jPUUcG7W9epfc+QqbTFDtVa6wQBYE8EkB9Sd9uWJDq4nJOrz+cDM
         FVCFaoDtOW6YBd0Ht+fvxjsm6Cxz7lxZMWP9BBvT3m06cvsgXmE+nUNhL2ngpbZdBQsp
         1VSdaNu4Ozpz+ArbgeD4pSlyPCx1OjWCeCwbZbX0+8LRu8gK8xd3hzJx6l2mq4XzEyoS
         IJSu12K1FfvjIdv7olaOUe2QtmjzOsOWwJSscC3xlVcWkKkOft0dCgqRnGR7gtrxQ6AW
         WVwA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=mG+XAW5l;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d18si3752846ios.101.2021.05.13.07.19.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 13 May 2021 07:19:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=mG+XAW5l;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lhCBS-0000Vp-7i
	for alex.bennee@linaro.org; Thu, 13 May 2021 10:19:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lhCAU-0007Cu-2s
 for qemu-arm@nongnu.org; Thu, 13 May 2021 10:18:26 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c]:35507)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lhCAS-0003bx-Ar
 for qemu-arm@nongnu.org; Thu, 13 May 2021 10:18:25 -0400
Received: by mail-ed1-x52c.google.com with SMTP id di13so31174311edb.2
 for <qemu-arm@nongnu.org>; Thu, 13 May 2021 07:18:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OOc4gL5uPk2ACAGFRhazVHQWnGubWnzLQye6pT02Va8=;
 b=mG+XAW5luxYONw2lp91tJweKPN4uoNLYnfLQoZKQcuMrNF8Dvk5GdnnNNAWUU9vaoc
 scQ9sYexNiHvb9JLbjjGgDZpbk/dBYJQqOcu9+kAgEBhe20iP16f6QpA23OrBJuMrIfN
 D2q2HQ++V/r/kdYs+345ko35HuooZ/+O+qfSdYNtp55s1dPJJogGjB220SS0V0WJ2HaE
 LqrBG+6bLHNghFYQILma7ag1hyMEkYwymIE6Ry8SrmTjNmqO1J8HxoCxBNPgb/qyVINi
 AVfyjEpFNE3Rt+HDWKv+WlJKhsmaugpxpyxzoz027zVRD6tCKSg1JRwiTdcSqwga6fjB
 XijQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OOc4gL5uPk2ACAGFRhazVHQWnGubWnzLQye6pT02Va8=;
 b=li8S/tTmoTFbJFOKW+EA9sgqbh3sgPqv1uE7CRtnNeiHN1uFzmOJisdrL1M0Au1swB
 EKFrn/rVW4Tnm//OirxR9y29eyJ6OghowhAdL8SF6ch+XmsePBJc3PBXCrhLjykiFTkR
 K8CER38WCoduf4HRIw5mKm2tyTVr8oAtSQmI+crpVVRBHSxm/hjPxtoGeu30SYpdNMk5
 aXxRGkt7+wW9xRTRHbWBwNNuq+FQ3cJJil69GBj24PpJ/zauvlYlVtmPQXDZAjon5H6H
 /ehto6IN9m4ToBsAkE218wzsM4GmzA8aNG/ux3sUN7o36j6t5abdG9SSK2KX3THag4im
 MH9Q==
X-Gm-Message-State: AOAM530P5Ty4tWSWPB3DN/35ux+TKBmjbiJPO4VoaC5jvtbLVKG1I6/q
 QV68owWiqFQSGpB5osBuQyrboqIOd8S3FmW8UaOrFQ==
X-Received: by 2002:a50:ab06:: with SMTP id s6mr41834238edc.100.1620915502772; 
 Thu, 13 May 2021 07:18:22 -0700 (PDT)
MIME-Version: 1.0
References: <20210430202610.1136687-1-richard.henderson@linaro.org>
 <20210430202610.1136687-69-richard.henderson@linaro.org>
In-Reply-To: <20210430202610.1136687-69-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 13 May 2021 15:18:11 +0100
Message-ID: <CAFEAcA-T_LwSMZJbPszdS3CobzNAjJWY1gptsgZQT6bhxLKkaA@mail.gmail.com>
Subject: Re: [PATCH v6 68/82] target/arm: Implement SVE2 FLOGB
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Stephen Long <steplong@quicinc.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: FvqHbBkl+JR3

On Fri, 30 Apr 2021 at 22:24, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> From: Stephen Long <steplong@quicinc.com>
>
> Signed-off-by: Stephen Long <steplong@quicinc.com>
> Message-Id: <20200430191405.21641-1-steplong@quicinc.com>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> v2: Fixed esz index and c++ comments
> v3: Fixed denormal arithmetic and raise invalid.

> +static int64_t do_float64_logb_as_int(float64 a, float_status *s)
> +{
> +    if (float64_is_normal(a)) {
> +        return extract64(a, 52, 11) - 1023;
> +    } else if (float64_is_infinity(a)) {
> +        return INT64_MAX;
> +    } else if (float64_is_any_nan(a) || float64_is_zero(a)) {
> +        float_raise(float_flag_invalid, s);
> +        return INT64_MIN;
> +    } else {
> +        /* denormal (see above) */
> +        return -1023 + 12 - clz64(extract64(a, 0, 52));
> +    }
> +}

These don't look like they're handling denormal inputs quite right:
 * should raise the input-denormal exception
 * should flush-to-zero if that is enabled

thanks
-- PMM
