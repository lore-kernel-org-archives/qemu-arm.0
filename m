Received: by 10.25.208.137 with SMTP id h131csp281177lfg;
        Wed, 4 May 2016 10:06:54 -0700 (PDT)
X-Received: by 10.37.112.69 with SMTP id l66mr5226935ybc.56.1462381614622;
        Wed, 04 May 2016 10:06:54 -0700 (PDT)
Return-Path: <peter.maydell@linaro.org>
Received: from mail-yw0-x22a.google.com (mail-yw0-x22a.google.com. [2607:f8b0:4002:c05::22a])
        by mx.google.com with ESMTPS id 206si1723749ywi.161.2016.05.04.10.06.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 04 May 2016 10:06:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 2607:f8b0:4002:c05::22a as permitted sender) client-ip=2607:f8b0:4002:c05::22a;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 2607:f8b0:4002:c05::22a as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE dis=NONE) header.from=linaro.org
Received: by mail-yw0-x22a.google.com with SMTP id g133so93618308ywb.2
        for <alex.bennee@linaro.org>; Wed, 04 May 2016 10:06:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=1kgaP3ij5pv27y68hBfUzuXPO9abU5CK/6EHTyWlb2E=;
        b=PY9cDNRsfVnXMItmR57E4hxrdgXzqzZB8uJmwGxnUz8IBi982VmLPP7nEoHhH5T873
         I5mBPxdFJTa6Y/RI/1Kk0PymRTfDE6MgZRN3j5Kr/Jy9aAh0CESAr/lFnzgUQbeKJsVQ
         zXLEgvceI2n+HKE40rC0zuE9VrQJPx4QurYqE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=1kgaP3ij5pv27y68hBfUzuXPO9abU5CK/6EHTyWlb2E=;
        b=URq22/f0NN1TBNyHy7gikmS4zhOFm6jcqhQimuHPsDeoEq5q5/YhAdLIQI6n8bbmVj
         DjrjBvo89idQb2UhRp2Y2pwjhU57aNT5TNz3YCCkrugqPRJRklR6enwvyT+dJEnHwBrz
         OVNb7YvoY0RhErrAYDL9XsSaMqWicNYFm2o5E0sFy6/uLGNx2h//7rRtGTCqbIQIjpME
         DZXDoeeRwal56+QdenqoCaUpJeYW8DG6GnsDta9kPiUQRQur1g+PhRAn5U1Z2o6mcARA
         s8aFIUAm4J/Kpu0YYCl0TknIw6yDe1tWErdbdRKXdO4nicOn+CtpUdPTUxILYYCAcjIT
         wmhw==
X-Gm-Message-State: AOPr4FUMOyhCVajbXTFXkBmO7LdjINkeNA2XOKtstfnIvnGzKnAVWRQzTzYkYnVaEE9+5t6j7lq08nihLB/cSdU/0c0=
X-Received: by 10.176.68.162 with SMTP id n31mr6686707uan.26.1462381614191;
 Wed, 04 May 2016 10:06:54 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.216.1 with HTTP; Wed, 4 May 2016 10:06:34 -0700 (PDT)
In-Reply-To: <1461931684-1867-4-git-send-email-edgar.iglesias@gmail.com>
References: <1461931684-1867-1-git-send-email-edgar.iglesias@gmail.com> <1461931684-1867-4-git-send-email-edgar.iglesias@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 4 May 2016 18:06:34 +0100
Message-ID: <CAFEAcA_qcsb-QF_QZmO=xx39D_JoNLpPN__LXcHYuwbFkvThug@mail.gmail.com>
Subject: Re: [PATCH v3 3/7] target-arm: Add the IL flag to syn_data_abort
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Sergey Fedorov <serge.fdrv@gmail.com>, Richard Henderson <rth@twiddle.net>, qemu-arm <qemu-arm@nongnu.org>, 
	Edgar Iglesias <edgar.iglesias@xilinx.com>
Content-Type: text/plain; charset=UTF-8
X-TUID: /grBsnqa0jMB

On 29 April 2016 at 13:08, Edgar E. Iglesias <edgar.iglesias@gmail.com> wrote:
> From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
>
> Add the IL flag to syn_data_abort(). Since we at the moment
> never set ISV, the IL flag is always set to one.
>
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
> ---
>  target-arm/internals.h | 4 +++-
>  target-arm/op_helper.c | 6 ++++--
>  2 files changed, 7 insertions(+), 3 deletions(-)
>
> diff --git a/target-arm/internals.h b/target-arm/internals.h
> index 2e70272..34e2688 100644
> --- a/target-arm/internals.h
> +++ b/target-arm/internals.h
> @@ -384,9 +384,11 @@ static inline uint32_t syn_insn_abort(int same_el, int ea, int s1ptw, int fsc)
>  }
>
>  static inline uint32_t syn_data_abort(int same_el, int ea, int cm, int s1ptw,
> -                                      int wnr, int fsc)
> +                                      int wnr, int fsc,
> +                                      bool is_16bit)
>  {
>      return (EC_DATAABORT << ARM_EL_EC_SHIFT) | (same_el << ARM_EL_EC_SHIFT)
> +        | (is_16bit ? 0 : ARM_EL_IL)
>          | (ea << 9) | (cm << 8) | (s1ptw << 7) | (wnr << 6) | fsc;
>  }
>
> diff --git a/target-arm/op_helper.c b/target-arm/op_helper.c
> index d626ff1..e69c1de 100644
> --- a/target-arm/op_helper.c
> +++ b/target-arm/op_helper.c
> @@ -115,7 +115,8 @@ void tlb_fill(CPUState *cs, target_ulong addr, int is_write, int mmu_idx,
>              syn = syn_insn_abort(same_el, 0, fi.s1ptw, syn);
>              exc = EXCP_PREFETCH_ABORT;
>          } else {
> -            syn = syn_data_abort(same_el, 0, 0, fi.s1ptw, is_write == 1, syn);
> +            syn = syn_data_abort(same_el, 0, 0, fi.s1ptw, is_write == 1, syn,
> +                                 1);
>              if (is_write == 1 && arm_feature(env, ARM_FEATURE_V6)) {
>                  fsr |= (1 << 11);
>              }
> @@ -161,7 +162,8 @@ void arm_cpu_do_unaligned_access(CPUState *cs, vaddr vaddr, int is_write,
>      }
>
>      raise_exception(env, EXCP_DATA_ABORT,
> -                    syn_data_abort(same_el, 0, 0, 0, is_write == 1, 0x21),
> +                    syn_data_abort(same_el, 0, 0, 0, is_write == 1, 0x21,
> +                                   1),
>                      target_el);
>  }

Shouldn't this patch be squashed into patch 4? Pretty much everything it
does is undone by the next patch...

thanks
-- PMM
