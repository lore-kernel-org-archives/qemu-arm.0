Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp1273863ejc;
        Fri, 3 Mar 2023 08:30:29 -0800 (PST)
X-Google-Smtp-Source: AK7set+50kzSS+GjEosswrjb9eGCO22Oti3g1bGVojVObJjm9O3StlfgNx1+sDrq3cBsNCo//ZMM
X-Received: by 2002:a05:6214:262e:b0:56e:f417:2ad7 with SMTP id gv14-20020a056214262e00b0056ef4172ad7mr4417609qvb.14.1677861029677;
        Fri, 03 Mar 2023 08:30:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677861029; cv=none;
        d=google.com; s=arc-20160816;
        b=CFdnX2PFkKe+jINu8qhfdn9gkaJtKgRUVhCaXPEe3gpPe8Lnns41y2McFdpbqNXEs9
         dpUn8Z1oO22fcEUQOzLZ8kZUn1Wy7tKpWPxVZ8l0PxCyKbxQypudyNE9qTW9ma+NDZed
         JfN2daqv5DSUoD57vv3eHy9LqVZBwGcN3iDeOybZSNPAcl88xJ8ydzRshE9F327aNeQA
         TjG3TUJUAlZ+zLC48MHTuBbYn70CZ0yOA2pubZ7wgD0k1yA95kZdGLr+JAQWqpUY5cwk
         VQtktj8ETGGDEvwx5/4UVX7xzJNeVqQEYzIsYYJdxtIepaCbmxrb9WczZqiBeXoFSlsH
         ZLng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=BxM+qoAI6jHeQYROApWZ4nV5KeC70ZEEPJRigCG9ddc=;
        b=NcA9YkXJJLL7w5ahpqC7IBE1SUdwNIxuX3ZSd52ImyMyVb5xOBQ21CG6ipVRvskPRP
         jYmlz3li6mDEvQq2bBHs9vWtbb+MiImZ2UJpseYgVZTYpVCXUiHq0ULR6m7AHJHVlikR
         MEDV8UoXlihE6SBcbuAzmXjHd6jlfEsLysQpF14POVcBpB47ETLVnqi1FEdq1uuaM5XR
         xEId4yJN1xvLVShdEAWJUSV4KCZwaa0kyXi9UWxPUAqTFTi5nExE81qIlgph9CYowd0C
         EbGgEQaEENXRqlnnbutLwyaHXfHlOBbUziXcyeEhKenSP5XOhK9bS9I54JUqwMSEdm7H
         VztA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="N/zcck4T";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r125-20020a374483000000b00743089f7429si1931544qka.152.2023.03.03.08.30.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 03 Mar 2023 08:30:29 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="N/zcck4T";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pY8Hx-0005Nl-1A; Fri, 03 Mar 2023 11:29:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pY8Hv-0005NI-MP
 for qemu-arm@nongnu.org; Fri, 03 Mar 2023 11:29:43 -0500
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pY8Ht-0004CX-Vy
 for qemu-arm@nongnu.org; Fri, 03 Mar 2023 11:29:43 -0500
Received: by mail-pl1-x62f.google.com with SMTP id u5so3209483plq.7
 for <qemu-arm@nongnu.org>; Fri, 03 Mar 2023 08:29:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677860980;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=BxM+qoAI6jHeQYROApWZ4nV5KeC70ZEEPJRigCG9ddc=;
 b=N/zcck4TADyZfzkpqPlzT9biV9DRPW7NKftB/bW64b0uoXMlMTXzcfzntW6BxWBFXs
 2zwDleM+NHsRuRD5yzhEJqMuAzw+k4g9fMr5Re/HCwtaVd5IPV7ofqC5dWc/6hGDMbwD
 Pi2kvfaB8KVCgcyahLEvG/njytgOOKqgO1vLahpW5TmAhJWToXNY7ouNq8NbmNu1v2dR
 C/+lda5/6DAMHf4JjVvgouh7n9iYj5dI7uXLflbCOzxA91SCdq5VMRuzjp9XR2Wg/Id+
 hZS14DpQ4/UjbVUuG0TFIeRI7q8wyekJl69HbDRSVsqjYl9dh/oF9SnQ9uin31/t/WaX
 cMsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677860980;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BxM+qoAI6jHeQYROApWZ4nV5KeC70ZEEPJRigCG9ddc=;
 b=O6FT3ClyqcqEoOydfpVsJt0MsnKAXBR0dpwdpMmMTzyT2YIdw1xffwuf0i0/Wwepl9
 cUQKvQhJEtldUUSaBQT75jHmipf4J5SAml1ZqSKmtkdf+u5yAz7tH1bQEQi+DiUbcvZz
 hUBToYVzIZEJhoaYLSb+SG+UHDbADuskXO5RwQRAoyV1PSJA6vmDTbxtRsaIqWDMxdfe
 YsscilgZG0jP/6UH5y25PZrAbc5aZd76NdBKNRmcgQEWGsxxvkOTlAvFnCGGhHEQgKbN
 JfpLPROtdrmGRebc8DCE/GtV59duagz1xdTFIfOTWtQYRdfkg04sMRmV9TjPaJJBNubw
 u5ZA==
X-Gm-Message-State: AO0yUKUHXJ58mN7c791/V6cuvjsQAYFBi7VZYyhBjAsTept4UJrIP9NI
 0YiTvxq4ElYAyIVYImn5WjYar32wuE5Yyvyeu1Auow==
X-Received: by 2002:a17:903:2788:b0:19a:9580:7130 with SMTP id
 jw8-20020a170903278800b0019a95807130mr919669plb.13.1677860980342; Fri, 03 Mar
 2023 08:29:40 -0800 (PST)
MIME-Version: 1.0
References: <20230223204342.1093632-1-richard.henderson@linaro.org>
 <20230223204342.1093632-3-richard.henderson@linaro.org>
In-Reply-To: <20230223204342.1093632-3-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 3 Mar 2023 16:29:29 +0000
Message-ID: <CAFEAcA-fdqzfq2Ud2i5Tk5wO8FhPQnOpepYC0zeGzHPBFnWhWQ@mail.gmail.com>
Subject: Re: [PATCH 02/13] accel/tcg: Retain prot flags from tlb_fill
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x62f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: bI4xKFrebvmq

On Thu, 23 Feb 2023 at 20:47, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> While changes are made to prot within tlb_set_page_full, they are
> an implementation detail of softmmu.  Retain the original for any
> target use of probe_access_full.
>
> Fixes: 4047368938f6 ("accel/tcg: Introduce tlb_set_page_full")
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  accel/tcg/cputlb.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
> index d7ca90e3b4..169adc0262 100644
> --- a/accel/tcg/cputlb.c
> +++ b/accel/tcg/cputlb.c
> @@ -1251,7 +1251,6 @@ void tlb_set_page_full(CPUState *cpu, int mmu_idx,
>      desc->fulltlb[index] = *full;
>      desc->fulltlb[index].xlat_section = iotlb - vaddr_page;
>      desc->fulltlb[index].phys_addr = paddr_page;
> -    desc->fulltlb[index].prot = prot;
>
>      /* Now calculate the new entry */
>      tn.addend = addend - vaddr_page;
> --

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
