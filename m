Received: by 2002:a17:504:1f11:b0:1be9:327d:8ee3 with SMTP id z17csp1409389njl;
        Thu, 10 Oct 2024 03:31:54 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUES2mV5HEB7ulqq5KEl/P9LP3sN6pivreYOZzbzHzJygSQmeQlArTP4t+KvaQ7tfwapH+sVl+G8D9BRQ==@linaro.org
X-Received: by 2002:a05:6402:5209:b0:5c5:c4b9:e68f with SMTP id 4fb4d7f45d1cf-5c93241df0fmr2333932a12.5.1728556314197;
        Thu, 10 Oct 2024 03:31:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728556314; cv=none;
        d=google.com; s=arc-20240605;
        b=Uplri8obXnaYysM2MNdeQgjFOVP4HErTT/Ru0qegZAXRcWVt6YnWlz/2xHhVmVV60H
         AyFYf9U1yJzQuxLwk7mqMOKXCWF2NpmTIKDiIZrBsYOzRBHSak5itZYJ7TjhXCPdFRJc
         T3Qq+LSK6/YiFWpbjdtrGqanSARzsco8kvivT0mMwXKGyGpqpxt4Cl1HHka2oITUG4c4
         JsHLqbsx8kXx3tCUoeHmw2zGsqdh/NNiCVkAn1DGonfJDzPf1oVX3PRjTs6QVvvthiFC
         FmmMzZ6VNXtiOGXATvJl/h5uhjobD+/WqRAklRiaQh0XPdX81PkJPSBQerfwS+EWa/tP
         ZBBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=H1G+pjpLn2GOdI+rwjFTLXfPNvFegxvIu0XfXLq6fzA=;
        fh=+or8tbHfxDtHB4TA6YKfushKc3juVNBrHADcpig1MV0=;
        b=W2CuSP7kWC3Z/9WRRKzPU6g3k1CA3qY0mcvms6abHWoKwRCyTLtbKXeZbr33c1In23
         dkCLYLo5tDEYxenlLwz3KXLGsIUifu3QlJ5GrfpufRs1FfpGOTwy0tsHmKACL4DoVUbs
         Mr0RXv51svdiSs5Av2O/U0sBrs13DyZSAZhsa/X9MH05M3PuROidmjLTl+uAr7WM1Cb6
         aQBQF+lP/3BKMblI+1v9UijqjEE6H4O+BOomZA6o5dus+zDG0u5dOg/rz8DMLRGkL4Ue
         L/sgXfwsEdytWFvIx1kKN+K/5321pLZubBdyAMIjiQyHIDJiB+au6v8zL63yYzy08cZG
         r4YA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JcGlqdtR;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 4fb4d7f45d1cf-5c9370e9253sor230071a12.4.2024.10.10.03.31.54
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 10 Oct 2024 03:31:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JcGlqdtR;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728556314; x=1729161114; darn=linaro.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=H1G+pjpLn2GOdI+rwjFTLXfPNvFegxvIu0XfXLq6fzA=;
        b=JcGlqdtRxLbt0lgIWrEME7Sv5YeT2RsSL27ZwaxbooxGZkD23E5qaqToZ/feuENkUS
         d6hoZCO6lVlgi05ZqrLDBoONoeT8tt4QWAN42ZZ/PEzgboPNVqo+GQPX9kw1ylKrXgUd
         pc+8TqpEhkdRXpkzxESQ2TJBED7MfToj+mf2AcyfzSs2R2mUZnw+euE88/WCMPnbM+LY
         DrD9c9Aqvhd7fM+BOxNb8BkvU/zCtQWrBWR52kC9eavz73J/681FVYYLq2LxogRA7zip
         Kb8WC1ISoNHJ5WSHKwLFhF7H/EVtPrehwmkkycLpD3aCG/Hjx1IcFblnuh0aXurANLRo
         JhFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728556314; x=1729161114;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H1G+pjpLn2GOdI+rwjFTLXfPNvFegxvIu0XfXLq6fzA=;
        b=IcQsQoHU6MVwoIpVTozP8ENqXU1qkjPZCO/ZG3+vnbsxQ7Doc02JuB72bQDkLLJK5w
         nzE6XAdrcFIgEdwyI3bVZ3L0v4ISEFaq9ngods9KmLuOYY+sAPa2s1U0gy2ijcBzgu9T
         GxtPt5Ztt6vUiGMwlkVtdf9cpz8Hhy/pu0PdbOtYmw7meMXROPiB8RIxdIxX0BKgSYLH
         VC7XR8bjLSCctqPIe01v5uBhwnGgHBsHQs0EnEcvSftIcliWLdwOsY92vUX6c3WQFnSb
         23A3yPSIb33AJrqIuSBcY6Cj0ZE14A3FeB73abcGKYD3De3SpUSuhsdvnKhfW2R1C5w1
         WeVg==
X-Forwarded-Encrypted: i=1; AJvYcCUjfT7acVdw57P7bgk5o7Qi0jqje0Deub0k4sEY6iIfHwf4GMtxttdhp3qQioqDumlzf88B8MWQdQ2QHw==@linaro.org
X-Gm-Message-State: AOJu0Yw1vCEMm1w6LwDt5h6/Aocp5lN30+caU3U2qfStPkzCxRTGxvz1
	7fNG9s26VPFFmVEKO9v4NHxdMc88dMteJdCEQUxDhPS7hUL37s5FZ3V6kCSMktQAvu4jcxdmxCU
	HQGVZcramev3xzesHAyFzlco9/GZMFH7G/74kvO5n
X-Google-Smtp-Source: AGHT+IHXWCaOuM26uI4vYxRXMejs44Sq/vl9y9MIMUEOp9FtK2w6fzGYcpXyhYXcgFA771r/xnv8Frul05iB2+FclDE=
X-Received: by 2002:a05:6402:2712:b0:5c5:c447:e4c0 with SMTP id
 4fb4d7f45d1cf-5c93241dddcmr1744450a12.4.1728556313592; Thu, 10 Oct 2024
 03:31:53 -0700 (PDT)
MIME-Version: 1.0
References: <20241009000453.315652-1-richard.henderson@linaro.org> <20241009000453.315652-6-richard.henderson@linaro.org>
In-Reply-To: <20241009000453.315652-6-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 10 Oct 2024 11:31:42 +0100
Message-ID: <CAFEAcA862FYbm-Mojww38m2n8SqWwKSHDr8irLbj9--TA-PJyQ@mail.gmail.com>
Subject: Re: [PATCH v3 05/20] accel/tcg: Add TCGCPUOps.tlb_fill_align
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, deller@kernel.org, alex.bennee@linaro.org, 
	linux-parisc@vger.kernel.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
X-TUID: sRp8u6JZaFZN

On Wed, 9 Oct 2024 at 01:05, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Add a new callback to handle softmmu paging.  Return the page
> details directly, instead of passing them indirectly to
> tlb_set_page.  Handle alignment simultaneously with paging so
> that faults are handled with target-specific priority.
>
> Route all calls the two hooks through a tlb_fill_align
> function local to cputlb.c.
>
> As yet no targets implement the new hook.
> As yet cputlb.c does not use the new alignment check.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Other than the typos Helge spotted

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
